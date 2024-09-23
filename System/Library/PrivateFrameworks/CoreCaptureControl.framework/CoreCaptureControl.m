uint64_t CoreCaptureControlGetTypeID()
{
  uint64_t result;

  result = __kCoreCaptureControlTypeID;
  if (!__kCoreCaptureControlTypeID)
  {
    pthread_once(&__gCoreCaptureControlTypeInit, (void (*)(void))__CoreCaptureControlRegister);
    return __kCoreCaptureControlTypeID;
  }
  return result;
}

uint64_t __CoreCaptureControlRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kCoreCaptureControlTypeID = result;
  return result;
}

_QWORD *__CoreCaptureControlRelease(_QWORD *result)
{
  result[2] = 0;
  result[3] = 0;
  result[4] = 0;
  return result;
}

_QWORD *CoreCaptureControlCreate()
{
  _QWORD *result;

  if (!__kCoreCaptureControlTypeID)
    pthread_once(&__gCoreCaptureControlTypeInit, (void (*)(void))__CoreCaptureControlRegister);
  result = (_QWORD *)_CFRuntimeCreateInstance();
  if (result)
  {
    result[2] = 0;
    result[3] = 0;
    result[4] = 0;
  }
  return result;
}

uint64_t CoreCaptureControlStart(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result;
  const __CFAllocator *v5;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  __CFDictionary *v10;
  const __CFData *Data;

  result = connect(a1, a2, a3);
  if ((_DWORD)result)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v9, CFSTR("CCIdleTime"), CFSTR("100"));
    CFDictionaryAddValue(Mutable, CFSTR("CCStart"), v9);
    v10 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v10, CFSTR("CCConfig"), Mutable);
    Data = CFPropertyListCreateData(0, v10, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (Mutable)
      CFRelease(Mutable);
    if (v10)
      CFRelease(v10);
    if (v9)
      CFRelease(v9);
    if (Data)
      CFRelease(Data);
    sleep(2u);
    return replyResult;
  }
  return result;
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t v3;
  dispatch_queue_t v4;
  FILE **v5;
  FILE *v6;
  _xpc_connection_s *mach_service;
  const char *v9;
  size_t v10;

  v3 = *(_QWORD *)&a1;
  v4 = dispatch_queue_create("com.apple.corecaptured", 0);
  *(_QWORD *)(v3 + 24) = v4;
  v5 = (FILE **)MEMORY[0x1E0C80C20];
  v6 = (FILE *)*MEMORY[0x1E0C80C20];
  if (!v4)
  {
    v9 = "Failed to create dispatch queue\n";
    v10 = 32;
LABEL_7:
    fwrite(v9, v10, 1uLL, v6);
    return 0;
  }
  fprintf(v6, "XPC Service is %s\n", "com.apple.corecaptured");
  mach_service = xpc_connection_create_mach_service("com.apple.corecaptured", *(dispatch_queue_t *)(v3 + 24), 2uLL);
  *(_QWORD *)(v3 + 16) = mach_service;
  if (!mach_service)
  {
    v6 = *v5;
    v9 = "Failed to create MACH service\n";
    v10 = 30;
    goto LABEL_7;
  }
  *(_BYTE *)(v3 + 32) = 1;
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  if (*(_BYTE *)(v3 + 32))
  {
    xpc_connection_resume(*(xpc_connection_t *)(v3 + 16));
    return 1;
  }
  fprintf(*v5, "Failed to connect %s service\n", "com.apple.corecaptured");
  return 0;
}

void sendXPCRequest(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  CFStringRef v6;
  const __CFString *v7;
  xpc_object_t v8;
  void *v9;
  const char *CStringPtr;

  if (a1)
  {
    if (theData)
    {
      if (CFDataGetBytePtr(theData))
      {
        if (CFDataGetLength(theData))
        {
          BytePtr = CFDataGetBytePtr(theData);
          Length = CFDataGetLength(theData);
          v6 = CFStringCreateWithBytes(0, BytePtr, Length, 0, 0);
          if (v6)
          {
            v7 = v6;
            v8 = xpc_dictionary_create(0, 0, 0);
            if (v8)
            {
              v9 = v8;
              CStringPtr = CFStringGetCStringPtr(v7, 0);
              xpc_dictionary_set_string(v9, "CCConfig", CStringPtr);
              replyResult = 0;
              xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 16), v9, *(dispatch_queue_t *)(a1 + 24), &__block_literal_global_39);
              xpc_release(v9);
            }
            else
            {
              fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Unable to create XPC dictionary\n", "sendXPCRequest", 218);
            }
            CFRelease(v7);
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Unable to allocate string\n");
          }
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Invalid XPC request length\n");
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Invalid XPC request ptr\n");
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Invalid XPC request\n");
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "%s:%06u: ERROR: Invalid client argument\n");
  }
}

uint64_t __sendXPCRequest_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  const char *v4;
  BOOL v5;
  const char *string;

  result = MEMORY[0x1BCCA9794](a2);
  if (result == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
    result = fprintf((FILE *)*MEMORY[0x1E0C80C20], "Got an XPC error (processReply): %s\n", string);
    v5 = 0;
  }
  else
  {
    if (result != MEMORY[0x1E0C812F8])
      return result;
    v4 = xpc_dictionary_get_string(a2, "rc");
    fprintf((FILE *)*MEMORY[0x1E0C80C20], "Result is %s\n", v4);
    result = strncmp(v4, "rc.ok", 5uLL);
    v5 = (_DWORD)result == 0;
  }
  replyResult = v5;
  return result;
}

uint64_t __connect_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const char *v3;

  result = MEMORY[0x1BCCA9794](a2);
  if (result != MEMORY[0x1E0C81310])
  {
    if (result == MEMORY[0x1E0C812E0])
    {
      v3 = "XPC_TYPE_CONNECTION";
    }
    else if (result == MEMORY[0x1E0C81350])
    {
      v3 = "XPC_TYPE_NULL";
    }
    else if (result == MEMORY[0x1E0C812D0])
    {
      v3 = "XPC_TYPE_BOOL";
    }
    else if (result == MEMORY[0x1E0C81328])
    {
      v3 = "XPC_TYPE_INT64";
    }
    else if (result == MEMORY[0x1E0C81398])
    {
      v3 = "XPC_TYPE_UINT64";
    }
    else if (result == MEMORY[0x1E0C81300])
    {
      v3 = "XPC_TYPE_DOUBLE";
    }
    else if (result == MEMORY[0x1E0C812F0])
    {
      v3 = "XPC_TYPE_DATE";
    }
    else if (result == MEMORY[0x1E0C812E8])
    {
      v3 = "XPC_TYPE_DATA";
    }
    else if (result == MEMORY[0x1E0C81390])
    {
      v3 = "XPC_TYPE_STRING";
    }
    else if (result == MEMORY[0x1E0C813A0])
    {
      v3 = "XPC_TYPE_UUID";
    }
    else if (result == MEMORY[0x1E0C81318])
    {
      v3 = "XPC_TYPE_FD";
    }
    else if (result == MEMORY[0x1E0C81388])
    {
      v3 = "XPC_TYPE_SHMEM";
    }
    else if (result == MEMORY[0x1E0C812C8])
    {
      v3 = "XPC_TYPE_ARRAY";
    }
    else if (result == MEMORY[0x1E0C812F8])
    {
      v3 = "XPC_TYPE_DICTIONARY";
    }
    else
    {
      v3 = "Unknown type";
    }
    return fprintf((FILE *)*MEMORY[0x1E0C80C20], "Unexpected event type %s\n", v3);
  }
  return result;
}

uint64_t CoreCaptureControlStop(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result;
  const __CFAllocator *v5;
  const CFDictionaryKeyCallBacks *v6;
  const CFDictionaryValueCallBacks *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  __CFDictionary *v10;
  const __CFData *Data;

  result = connect(a1, a2, a3);
  if ((_DWORD)result)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v9, CFSTR("CCIdleTime"), CFSTR("100"));
    CFDictionaryAddValue(Mutable, CFSTR("CCStop"), v9);
    v10 = CFDictionaryCreateMutable(v5, 1, v6, v7);
    CFDictionaryAddValue(v10, CFSTR("CCConfig"), Mutable);
    Data = CFPropertyListCreateData(0, v10, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (Mutable)
      CFRelease(Mutable);
    if (v10)
      CFRelease(v10);
    if (v9)
      CFRelease(v9);
    if (Data)
      CFRelease(Data);
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlCapture(uint64_t a1, const sockaddr *a2, const char *a3, const char *a4)
{
  uint64_t result;
  const __CFAllocator *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  CFStringRef v14;
  CFStringRef v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  const __CFData *Data;
  CFStringRef cf;

  result = connect(a1, a2, (socklen_t)a3);
  if ((_DWORD)result)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v13 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    v14 = CFStringCreateWithCString(0, (const char *)a2, 0);
    v15 = CFStringCreateWithCString(0, a3, 0);
    cf = CFStringCreateWithCString(0, a4, 0);
    CFDictionaryAddValue(v13, CFSTR("CaptureReason"), cf);
    v16 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v16, v15, v13);
    v17 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v17, v14, v16);
    CFDictionaryAddValue(Mutable, CFSTR("CCConfigurePipe"), v17);
    v18 = CFDictionaryCreateMutable(v9, 1, v10, v11);
    CFDictionaryAddValue(v18, CFSTR("CCConfig"), Mutable);
    Data = CFPropertyListCreateData(0, v18, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (v13)
      CFRelease(v13);
    if (v16)
      CFRelease(v16);
    if (v17)
      CFRelease(v17);
    if (Mutable)
      CFRelease(Mutable);
    if (v18)
      CFRelease(v18);
    if (v14)
      CFRelease(v14);
    if (v15)
      CFRelease(v15);
    if (cf)
      CFRelease(cf);
    if (Data)
      CFRelease(Data);
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlCaptureWithComponentDirectory(uint64_t a1, const sockaddr *a2, const char *a3)
{
  uint64_t result;
  const __CFAllocator *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  __CFDictionary *Mutable;
  __CFDictionary *v11;
  CFStringRef v12;
  __CFDictionary *v13;
  CFStringRef v14;
  __CFDictionary *v15;
  const __CFData *Data;

  result = connect(a1, a2, (socklen_t)a3);
  if ((_DWORD)result)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v11 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    v12 = CFStringCreateWithCString(0, a3, 0);
    CFDictionaryAddValue(v11, CFSTR("CaptureReason"), v12);
    v13 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    v14 = CFStringCreateWithCString(0, (const char *)a2, 0);
    CFDictionaryAddValue(v13, v14, v11);
    CFDictionaryAddValue(Mutable, CFSTR("CCCaptureDirectory"), v13);
    v15 = CFDictionaryCreateMutable(v7, 1, v8, v9);
    CFDictionaryAddValue(v15, CFSTR("CCConfig"), Mutable);
    Data = CFPropertyListCreateData(0, v15, kCFPropertyListXMLFormat_v1_0, 0, 0);
    sendXPCRequest(a1, Data);
    if (v11)
      CFRelease(v11);
    if (Mutable)
      CFRelease(Mutable);
    if (v15)
      CFRelease(v15);
    if (v13)
      CFRelease(v13);
    if (v14)
      CFRelease(v14);
    if (v12)
      CFRelease(v12);
    if (Data)
      CFRelease(Data);
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlConfigureProfile(uint64_t a1, const sockaddr *a2, socklen_t a3)
{
  uint64_t result;
  size_t v6;
  const __CFData *v7;

  result = connect(a1, a2, a3);
  if ((_DWORD)result)
  {
    v6 = strlen((const char *)a2);
    v7 = CFDataCreateWithBytesNoCopy(0, &a2->sa_len, v6, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    sendXPCRequest(a1, v7);
    if (v7)
      CFRelease(v7);
    sleep(2u);
    return replyResult;
  }
  return result;
}

uint64_t CoreCaptureControlConfigureStream(uint64_t a1, const sockaddr *a2, const char *a3, const char *a4, uint64_t *a5)
{
  uint64_t result;
  const __CFAllocator *v11;
  const CFDictionaryKeyCallBacks *v12;
  const CFDictionaryValueCallBacks *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  CFStringRef v16;
  __CFDictionary *v17;
  uint64_t v18;
  const __CFString *v19;
  __CFDictionary *v20;
  CFNumberRef v21;
  __CFDictionary *v22;
  const __CFString *v23;
  const CFDictionaryKeyCallBacks *v24;
  const CFDictionaryValueCallBacks *v25;
  __CFDictionary *v26;
  CFStringRef v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  const __CFData *Data;
  CFArrayRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  CFNumberRef v35;
  CFArrayRef ArrayBySeparatingStrings;
  CFNumberRef v37;
  uint64_t v38;
  CFStringRef cf;
  CFStringRef key;
  unint64_t valuePtr[2];

  valuePtr[1] = *MEMORY[0x1E0C80C00];
  result = connect(a1, a2, (socklen_t)a3);
  if (!(_DWORD)result)
    return result;
  v38 = a1;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v15 = CFDictionaryCreateMutable(v11, 0, v12, v13);
  cf = CFStringCreateWithCString(0, (const char *)a2, 0);
  key = CFStringCreateWithCString(0, a3, 0);
  v16 = CFStringCreateWithCString(0, a4, 0);
  if ((*(_BYTE *)a5 & 7) == 0)
  {
    v35 = 0;
    ArrayBySeparatingStrings = 0;
    v37 = 0;
    v34 = 0;
    goto LABEL_16;
  }
  v17 = CFDictionaryCreateMutable(v11, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v18 = *a5;
  if ((*a5 & 1) != 0)
  {
    v37 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 1);
    CFDictionaryAddValue(v17, CFSTR("LogLevel"), v37);
    v18 = *a5;
    if ((*a5 & 2) != 0)
    {
LABEL_5:
      valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
      if (isValidNumber((const char *)a5[2], valuePtr))
      {
        v35 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        CFDictionaryAddValue(v17, CFSTR("LogFlags"), v35);
        ArrayBySeparatingStrings = 0;
      }
      else
      {
        v19 = CFStringCreateWithCString(0, (const char *)a5[2], 0);
        ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v19, CFSTR(","));
        CFDictionaryAddValue(v17, CFSTR("LogFlags"), ArrayBySeparatingStrings);
        CFRelease(v19);
        v35 = 0;
      }
      if ((*a5 & 4) == 0)
        goto LABEL_13;
LABEL_10:
      v34 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 3);
      CFDictionaryAddValue(v17, CFSTR("LogOptions"), v34);
      goto LABEL_14;
    }
  }
  else
  {
    v37 = 0;
    if ((v18 & 2) != 0)
      goto LABEL_5;
  }
  v35 = 0;
  ArrayBySeparatingStrings = 0;
  if ((v18 & 4) != 0)
    goto LABEL_10;
LABEL_13:
  v34 = 0;
LABEL_14:
  CFDictionaryAddValue(v15, CFSTR("CoreCapture"), v17);
  if (v17)
    CFRelease(v17);
LABEL_16:
  if ((*(_BYTE *)a5 & 0x18) != 0)
  {
    v20 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if ((*a5 & 8) != 0)
    {
      v33 = CFNumberCreate(0, kCFNumberSInt64Type, a5 + 4);
      CFDictionaryAddValue(v20, CFSTR("LogLevel"), v33);
      if ((*a5 & 0x10) != 0)
        goto LABEL_19;
    }
    else
    {
      v33 = 0;
      if ((*a5 & 0x10) != 0)
      {
LABEL_19:
        valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
        if (!isValidNumber((const char *)a5[5], valuePtr))
        {
          v23 = CFStringCreateWithCString(0, (const char *)a5[2], 0);
          v32 = CFStringCreateArrayBySeparatingStrings(0, v23, CFSTR(","));
          CFDictionaryAddValue(v20, CFSTR("LogFlags"), v32);
          CFRelease(v23);
          v21 = 0;
LABEL_26:
          v22 = v15;
          CFDictionaryAddValue(v15, CFSTR("Console"), v20);
          if (v20)
            CFRelease(v20);
          goto LABEL_28;
        }
        v21 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        CFDictionaryAddValue(v20, CFSTR("LogFlags"), v21);
LABEL_24:
        v32 = 0;
        goto LABEL_26;
      }
    }
    v21 = 0;
    goto LABEL_24;
  }
  v22 = v15;
  v21 = 0;
  v32 = 0;
  v33 = 0;
LABEL_28:
  v24 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v25 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v26 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v27 = v16;
  CFDictionaryAddValue(v26, v16, v22);
  v28 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v28, key, v26);
  v29 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v29, cf, v28);
  CFDictionaryAddValue(Mutable, CFSTR("CCConfigureStream"), v29);
  v30 = CFDictionaryCreateMutable(v11, 0, v24, v25);
  CFDictionaryAddValue(v30, CFSTR("CCConfig"), Mutable);
  Data = CFPropertyListCreateData(0, v30, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (v22)
    CFRelease(v22);
  if (v26)
    CFRelease(v26);
  if (Mutable)
    CFRelease(Mutable);
  if (v28)
    CFRelease(v28);
  if (v29)
    CFRelease(v29);
  if (v30)
    CFRelease(v30);
  if (cf)
    CFRelease(cf);
  if (key)
    CFRelease(key);
  if (v27)
    CFRelease(v27);
  if (v35)
    CFRelease(v35);
  if (v37)
    CFRelease(v37);
  if (ArrayBySeparatingStrings)
    CFRelease(ArrayBySeparatingStrings);
  if (v34)
    CFRelease(v34);
  if (v21)
    CFRelease(v21);
  if (v32)
    CFRelease(v32);
  if (v33)
    CFRelease(v33);
  sendXPCRequest(v38, Data);
  if (Data)
    CFRelease(Data);
  sleep(2u);
  return replyResult;
}

const char *isValidNumber(const char *result, unint64_t *a2)
{
  const char *v2;
  char *v4[2];

  v4[1] = *(char **)MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!*result)
      return 0;
    v4[0] = (char *)0xAAAAAAAAAAAAAAAALL;
    *__error() = 0;
    *a2 = strtouq(v2, v4, 0);
    if (*__error() == 34 && *a2 == -1)
    {
      return 0;
    }
    else
    {
      __error();
      return (const char *)(*v4[0] == 0);
    }
  }
  return result;
}

uint64_t CoreCaptureControlConfigurePipe(uint64_t a1, const sockaddr *a2, const char *a3, uint64_t *a4)
{
  uint64_t result;
  const __CFAllocator *v9;
  const CFDictionaryKeyCallBacks *v10;
  const CFDictionaryValueCallBacks *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  CFStringRef v14;
  uint64_t v15;
  CFStringRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  const CFDictionaryKeyCallBacks *v20;
  const CFDictionaryValueCallBacks *v21;
  __CFDictionary *v22;
  CFStringRef v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  const __CFData *Data;
  CFNumberRef v27;
  CFStringRef cf;
  uint64_t v29;
  CFStringRef key;

  result = connect(a1, a2, (socklen_t)a3);
  if (!(_DWORD)result)
    return result;
  v29 = a1;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v13 = CFDictionaryCreateMutable(v9, 4, v10, v11);
  key = CFStringCreateWithCString(0, (const char *)a2, 0);
  v14 = CFStringCreateWithCString(0, a3, 0);
  v15 = *a4;
  if ((*a4 & 1) != 0)
  {
    v16 = CFStringCreateWithCString(0, (const char *)a4[1], 0);
    CFDictionaryAddValue(v13, CFSTR("LogOptions"), v16);
    v15 = *a4;
    if ((*a4 & 2) != 0)
    {
LABEL_4:
      v17 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 2);
      CFDictionaryAddValue(v13, CFSTR("WatermarkLevel"), v17);
      v15 = *a4;
      if ((*a4 & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v18 = 0;
      if ((v15 & 8) != 0)
        goto LABEL_6;
LABEL_10:
      v19 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v16 = 0;
    if ((v15 & 2) != 0)
      goto LABEL_4;
  }
  v17 = 0;
  if ((v15 & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v18 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 3);
  CFDictionaryAddValue(v13, CFSTR("NotifyTimeout"), v18);
  if ((*a4 & 8) == 0)
    goto LABEL_10;
LABEL_6:
  v19 = CFNumberCreate(0, kCFNumberSInt64Type, a4 + 4);
  CFDictionaryAddValue(v13, CFSTR("Policy"), v19);
LABEL_11:
  v27 = v17;
  cf = v16;
  v20 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v21 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v22 = CFDictionaryCreateMutable(v9, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v23 = v14;
  CFDictionaryAddValue(v22, v14, v13);
  v24 = CFDictionaryCreateMutable(v9, 1, v20, v21);
  CFDictionaryAddValue(v24, key, v22);
  CFDictionaryAddValue(Mutable, CFSTR("CCConfigurePipe"), v24);
  v25 = CFDictionaryCreateMutable(v9, 1, v20, v21);
  CFDictionaryAddValue(v25, CFSTR("CCConfig"), Mutable);
  Data = CFPropertyListCreateData(0, v25, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (v13)
    CFRelease(v13);
  if (v22)
    CFRelease(v22);
  if (v24)
    CFRelease(v24);
  if (Mutable)
    CFRelease(Mutable);
  if (v25)
    CFRelease(v25);
  if (key)
    CFRelease(key);
  if (v23)
    CFRelease(v23);
  if (cf)
    CFRelease(cf);
  if (v27)
    CFRelease(v27);
  if (v18)
    CFRelease(v18);
  if (v19)
    CFRelease(v19);
  sendXPCRequest(v29, Data);
  if (Data)
    CFRelease(Data);
  sleep(2u);
  return replyResult;
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856C0](__str, __endptr, *(_QWORD *)&__base);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

