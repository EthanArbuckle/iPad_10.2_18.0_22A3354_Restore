uint64_t mailboxHasExtraAttribute(void *a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "extraAttributes"), "containsObject:", a2);
}

void sub_1C883C7A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,__int128 buf)
{
  id v33;
  NSObject *v34;

  if (a2 == 1)
  {
    v33 = objc_begin_catch(a1);
    v34 = MFLogGeneral();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v33;
      _os_log_impl(&dword_1C8839000, v34, OS_LOG_TYPE_INFO, "Exception while getting all email addresses: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x1C883C748);
  }
  _Unwind_Resume(a1);
}

void sub_1C883C838()
{
  objc_end_catch();
  JUMPOUT(0x1C883C7A8);
}

id _stringByAppendingPathComponentsUsingSpecialDisplayNames(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, int a7)
{
  uint64_t v11;
  CFIndex v14;
  void *v15;
  id v16;
  void *v18;
  __CFArray *Mutable;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CFIndex Count;
  CFIndex v25;

  v11 = a3;
  if (!a3)
    v11 = objc_msgSend(a1, "topMailbox");
  if ((void *)v11 == a1 || !a1)
    return a4;
  v14 = 0;
  v15 = a1;
  do
  {
    ++v14;
    v15 = (void *)objc_msgSend(v15, "parent");
  }
  while ((void *)v11 != v15 && v15);
  if (a4)
    v16 = (id)objc_msgSend(a4, "mutableCopyWithZone:", 0);
  else
    v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = v16;
  Mutable = CFArrayCreateMutable(0, v14, MEMORY[0x1E0C9B378]);
  if (a2)
  {
    v20 = objc_msgSend(a1, "type");
    if (a5)
    {
      if (v20 != 7 && objc_msgSend(a5, "length") && (objc_msgSend(a1, "isShared") & 1) == 0)
      {
        if (a4 && objc_msgSend(a4, "length"))
          objc_msgSend(v18, "appendString:", CFSTR("/"));
        objc_msgSend(v18, "appendString:", a5);
      }
    }
  }
  if ((void *)v11 != a1)
  {
    v21 = a1;
    while (1)
    {
      v22 = (void *)objc_msgSend(a2, "persistentNameForMailbox:", v21);
      if (!v22)
        break;
      if (a2)
        goto LABEL_25;
LABEL_26:
      if (v22)
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_")));
      v21 = (void *)objc_msgSend(v21, "parent");
      if (v21 == (void *)v11)
        goto LABEL_35;
    }
    if (a7)
      v23 = objc_msgSend(v21, "displayNameUsingSpecialNames", 0);
    else
      v23 = objc_msgSend(v21, "name", 0);
    v22 = (void *)v23;
    if (!a2)
      goto LABEL_26;
LABEL_25:
    v22 = (void *)objc_msgSend(a2, "_pathComponentForUidName:", v22);
    goto LABEL_26;
  }
LABEL_35:
  Count = CFArrayGetCount(Mutable);
  if (Count)
  {
    v25 = Count - 1;
    do
    {
      if (objc_msgSend(v18, "length"))
        objc_msgSend(v18, "appendString:", CFSTR("/"));
      objc_msgSend(v18, "appendString:", CFArrayGetValueAtIndex(Mutable, v25--));
    }
    while (v25 != -1);
  }

  if (a6)
  {
    if (objc_msgSend(a1, "isStore"))
    {
      objc_msgSend(v18, "appendString:", CFSTR("."));
      objc_msgSend(v18, "appendString:", a6);
    }
  }
  return v18;
}

uint64_t _MFDescendantWithPredicate(void *a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "mf_lock");
  v6 = (void *)objc_msgSend(a1, "depthFirstEnumerator");
  do
  {
    v7 = objc_msgSend(v6, "nextObject");
    v8 = v7;
  }
  while (v7 && !a2(v7, a3));
  objc_msgSend(a1, "mf_unlock");
  return v8;
}

uint64_t _configureMailboxCache(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  const __CFData *v5;
  const __CFData *v6;
  const __CFDictionary *v7;
  const void *Value;
  void *v10;
  uint64_t v11;
  CFErrorRef error[5];

  error[4] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)a1, "_shouldConfigureMailboxCache"))
    return _invalidateMailboxCache(a1);
  objc_msgSend((id)a1, "mf_lock");
  if (!*(_QWORD *)(a1 + 56))
  {
    v2 = (void *)objc_msgSend((id)a1, "_copyMailboxWithParent:name:attributes:dictionary:", 0, 0, 18, 0);
    *(_QWORD *)(a1 + 56) = v2;
    if (objc_msgSend(v2, "type") != 8)
      objc_msgSend(*(id *)(a1 + 56), "setType:", 8);
  }
  v3 = *(_DWORD *)(a1 + 64);
  if ((v3 & 0x20000) == 0)
  {
    *(_DWORD *)(a1 + 64) = v3 | 0x20000;
    v4 = objc_msgSend((id)a1, "mailboxCachePath");
    v5 = (const __CFData *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 1, 0);
    if (!*(_QWORD *)(a1 + 56))
      _configureMailboxCache_cold_1();
    v6 = v5;
    if (v5)
    {
      error[0] = 0;
      v7 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v5, 1uLL, 0, error);
      if (error[0])
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _readMailboxCache(MailAccount *)");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MailAccount.m"), 3461, CFSTR("%@"), -[__CFError localizedDescription](error[0], "localizedDescription"));
      }
      Value = CFDictionaryGetValue(v7, CFSTR("mboxes"));
      objc_msgSend((id)a1, "_readCustomInfoFromMailboxCache:", v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend((id)a1, "_loadMailboxListingIntoCache:attributes:children:parent:", 0, 0, Value, *(_QWORD *)(a1 + 56));
      if (error[0])

      if (v7)
    }

  }
  return objc_msgSend((id)a1, "mf_unlock");
}

void sub_1C8842538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MFSocketNetworkThread(void *a1)
{
  __CFRunLoopTimer *v2;
  __CFRunLoop *Current;

  objc_msgSend(a1, "lockWhenCondition:", 0);
  v2 = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1.79769313e308, 60.0, 0, 0, (CFRunLoopTimerCallBack)_DoNothingTimerCallBack, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  NetworkThread = objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  objc_msgSend(a1, "unlockWithCondition:", 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop"), "run");
  CFRelease(v2);
}

void sub_1C8844658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C88458A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  *(_WORD *)(a3 + 32) = 2048;
  return result;
}

uint64_t OUTLINED_FUNCTION_7@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return objc_msgSend(a1, "domain");
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void *_openConnectionForAccount(void *a1, int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  int v17;
  void *v18;
  id v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v25;
  void *v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
    v4 = objc_msgSend(a1, "secureConnectionSettings");
  else
    v4 = objc_msgSend(a1, "insecureConnectionSettings");
  obj = (id)v4;
  v5 = objc_msgSend(a1, "defaultPortNumber", a3);
  v6 = objc_msgSend(a1, "defaultSecurePortNumber");
  v7 = objc_msgSend(a1, "usesSSL");
  v8 = objc_msgSend(a1, "portNumber");
  if (v7)
    v9 = v6;
  else
    v9 = v5;
  if (v8)
  {
    v10 = v8;
    if (v9 != v8)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v11)
      {
        v12 = 0;
        v13 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v16 = objc_msgSend(v15, "usesSSL");
            if (v16)
              v17 = v6;
            else
              v17 = v5;
            if (v10 != v17)
            {
              objc_msgSend(v15, "setPortNumber:", objc_msgSend(a1, "portNumber"));
              if (v16)
              {
                v18 = (void *)objc_msgSend(v15, "copy");
                objc_msgSend(v18, "setTryDirectSSL:", objc_msgSend(v15, "tryDirectSSL") ^ 1);
                if (!v12)
                  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v12, "addObject:", v18);
              }
            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v11);
        if (v12)
        {
          obj = (id)objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v12);

        }
      }
    }
  }
  v19 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v20 = objc_msgSend(obj, "count");
  v21 = 0;
  v22 = 0;
LABEL_33:
  if (v22 >= v20)
  {
LABEL_40:

    return 0;
  }
  while (1)
  {
    v25 = objc_msgSend(obj, "objectAtIndex:", v22);
    objc_msgSend(a1, "applySettingsAsDefault:", v25);
    v26 = (void *)objc_msgSend(a1, "_newConnection");
    objc_msgSend(v26, "setAllowsFallbacks:", 0);
    v27 = objc_msgSend(v26, "connectUsingAccount:", a1);
    v28 = v27 ^ 1;
    if (!v32)
      v28 = 1;
    if ((v28 & 1) == 0)
      break;
    v29 = objc_msgSend(v19, "error");
    if ((v27 & 1) != 0)
      return v26;
    ++v22;
    v21 = v26;
    if (!v29)
      goto LABEL_33;
    v23 = +[MFConnection shouldTryFallbacksAfterError:](MFConnection, "shouldTryFallbacksAfterError:");
    if (v22 >= v20 || !v23)
      goto LABEL_40;
  }
  *v32 = v25;
  objc_msgSend(v19, "error");
  return v26;
}

uint64_t _closeConnection(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "quit");
  else
    return objc_msgSend(a1, "disconnect");
}

void _logEvent(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *context;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = MEMORY[0x1CAA35F10]();
  objc_msgSend((id)_LogLock, "lock");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v14 = v13;
  context = (void *)v12;
  if (!a3 || !a4 || a5 == 0x7FFFFFFFFFFFFFFFLL || a5 >= a4 || !a6)
  {
    v15 = a3;
    v16 = a4;
LABEL_5:
    objc_msgSend(v13, "appendBytes:length:", v15, v16);
    goto LABEL_6;
  }
  objc_msgSend(v13, "appendBytes:length:", a3, a5);
  objc_msgSend(v14, "appendBytes:length:", "[Omitted]", 9);
  v16 = a4 - (a6 + a5);
  if (a4 != a6 + a5)
  {
    v15 = a3 + a6 + a5;
    v13 = v14;
    goto LABEL_5;
  }
LABEL_6:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = (void *)_LogClasses;
  v18 = objc_msgSend((id)_LogClasses, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (class_getClassMethod((Class)v22, sel_logConnection_type_data_))
          objc_msgSend(v22, "logConnection:type:data:", a1, a2, v14);
        else
          objc_msgSend(v22, "logBytes:length:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
        objc_msgSend(v22, "flushLog");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }
  objc_msgSend((id)_LogLock, "unlock");
  objc_autoreleasePoolPop(context);
}

void sub_1C884DDA8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithException:](MFError, "errorWithException:", objc_begin_catch(exception_object)));
    objc_end_catch();
    JUMPOUT(0x1C884DD30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _fillBuffer(uint64_t a1)
{
  void *v2;
  __int16 v3;
  size_t v4;
  void *v5;
  void *v6;
  size_t v7;
  void *v8;
  uint64_t BytesFromSocket;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  id v15;
  z_stream *v16;
  Bytef *v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v24;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    objc_msgSend(v2, "encryptionBufferSize");
    v24 = 0;
    if (_readBytesFromSocket(a1, (uint64_t)&v24, 4, 1) != 4)
    {
LABEL_20:
      v11 = 0;
      *(_QWORD *)(a1 + 56) = 0;
      return v11;
    }
    v3 = v24;
    v4 = bswap32(v24) >> 16;
    if (*(_QWORD *)(a1 + 64) != v4)
    {
      v5 = *(void **)(a1 + 40);
      if (v5)
        v6 = malloc_type_realloc(v5, v4, 0x23852C21uLL);
      else
        v6 = malloc_type_malloc(v4, 0x23938AF0uLL);
      *(_QWORD *)(a1 + 40) = v6;
      *(_QWORD *)(a1 + 64) = v4;
    }
    if (v3 && _readBytesFromSocket(a1, *(_QWORD *)(a1 + 40), v4, 1) >= 1)
    {
      v10 = (void *)objc_msgSend(*(id *)(a1 + 8), "createDecryptedDataForBytes:length:", *(_QWORD *)(a1 + 40), v4);
      if (!v10)
        goto LABEL_20;
    }
    else
    {
      v10 = 0;
    }
    v12 = objc_msgSend(v10, "length");
    v13 = *(_QWORD *)(a1 + 64);
    v14 = *(void **)(a1 + 40);
    if (v12 != v13)
    {
      v14 = malloc_type_realloc(*(void **)(a1 + 40), v13, 0xE224AC59uLL);
      *(_QWORD *)(a1 + 40) = v14;
      v12 = *(_QWORD *)(a1 + 64);
    }
    objc_msgSend(v10, "getBytes:length:", v14, v12);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 56) = 0;

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 72);
    if (!v7)
    {
      v7 = 0x8000;
      *(_QWORD *)(a1 + 72) = 0x8000;
    }
    v8 = *(void **)(a1 + 40);
    if (v7 != *(_QWORD *)(a1 + 64))
    {
      if (v8)
        v8 = malloc_type_realloc(*(void **)(a1 + 40), v7, 0x91FF8455uLL);
      else
        v8 = malloc_type_malloc(v7, 0x920AFFFBuLL);
      *(_QWORD *)(a1 + 40) = v8;
      *(_QWORD *)(a1 + 64) = v7;
    }
    BytesFromSocket = _readBytesFromSocket(a1, (uint64_t)v8, v7, 0);
    *(_QWORD *)(a1 + 48) = BytesFromSocket & ~(BytesFromSocket >> 63);
    if (BytesFromSocket < 1)
      goto LABEL_20;
  }
  if ((*(_BYTE *)(a1 + 108) & 4) != 0)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D46100]);
    v16 = *(z_stream **)(a1 + 88);
    v17 = *(Bytef **)(a1 + 40);
    v16->avail_in = *(_QWORD *)(a1 + 48);
    v16->next_in = v17;
    do
    {
      v16->avail_out = NSPageSize();
      v16->next_out = *(Bytef **)(a1 + 96);
      if (inflate(v16, 0) == -2)
        __assert_rtn("_fillBuffer", "Connection.m", 903, "Z_STREAM_ERROR != err");
      objc_msgSend(v15, "appendBytes:length:", *(_QWORD *)(a1 + 96), NSPageSize() - v16->avail_out);
    }
    while (!v16->avail_out);
    v18 = objc_msgSend(v15, "length");
    if (v18)
    {
      *(_QWORD *)(a1 + 64) = v18;
      *(_QWORD *)(a1 + 48) = v18;
      v19 = malloc_type_realloc(*(void **)(a1 + 40), v18, 0x876A723AuLL);
      *(_QWORD *)(a1 + 40) = v19;
      memcpy(v19, (const void *)objc_msgSend(v15, "bytes"), *(_QWORD *)(a1 + 64));
      v20 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v20 = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }

    *(_QWORD *)(a1 + 56) = 0;
    if (v20 < 1)
      return 0;
  }
  else
  {
    *(_QWORD *)(a1 + 56) = 0;
  }
  if (*(uint64_t *)(a1 + 48) < 1
    || ((v11 = 1, !objc_msgSend(*(id *)(a1 + 8), "encryptionBufferSize")) ? (v21 = 1) : (v21 = 2),
        _logEvent(a1, v21, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0x7FFFFFFFFFFFFFFFuLL, 0),
        *(uint64_t *)(a1 + 48) < 1))
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _fillBuffer(MFConnection *)"), CFSTR("Connection.m"), 938, CFSTR("Result conflicts with bufferRemainingBytes"));
    return 1;
  }
  return v11;
}

void sub_1C884E338(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  id v3;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    *(_QWORD *)(v2 + 48) = 0;
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithException:](MFError, "errorWithException:", v3));
    objc_msgSend(v3, "raise");
    objc_end_catch();
    JUMPOUT(0x1C884E134);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _setupSSLDomainError(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_msgSend(a1, "code");
  switch(v6)
  {
    case -9814:
      v7 = CFSTR("SSL_CERT_EXPIRED_FORMAT");
      v8 = CFSTR("The certificate for this server has expired.");
      goto LABEL_11;
    case -9813:
      v7 = CFSTR("SSL_NO_ROOT_CERT_FORMAT");
      v8 = CFSTR("There is no root certificate for this server.");
      goto LABEL_11;
    case -9812:
      v7 = CFSTR("SSL_UNKNOWN_ROOT_CERT_FORMAT");
      v8 = CFSTR("The root certificate for this server could not be verified.");
      goto LABEL_11;
    case -9811:
    case -9810:
    case -9809:
      goto LABEL_5;
    case -9808:
      v7 = CFSTR("SSL_BAD_CERT_FORMAT");
      v8 = CFSTR("The format of the certificate for the server is bad.");
      goto LABEL_11;
    case -9807:
      v7 = CFSTR("SSL_CERT_CHAIN_INVALID_FORMAT");
      v8 = CFSTR("The certificate for the server is invalid.");
LABEL_11:
      v12 = MFLookupLocalizedString((uint64_t)v7, (uint64_t)v8, CFSTR("Delayed"));
      break;
    default:
      if (v6 == -9843)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = CFSTR("SSL_HOST_MISMATCH_MESSAGE");
        v11 = CFSTR("The certificate hostname does not match “%@”.");
      }
      else
      {
LABEL_5:
        v9 = (void *)MEMORY[0x1E0CB3940];
        v10 = CFSTR("SSL_GENERIC_READ_ERROR");
        v11 = CFSTR("An SSL error occurred while trying to read data from the server “%@”. Verify that this server supports SSL and that your account settings are correct.");
      }
      v12 = objc_msgSend(v9, "stringWithFormat:", MFLookupLocalizedString((uint64_t)v10, (uint64_t)v11, CFSTR("Delayed")), a2);
      break;
  }
  v13 = v12;
  if (objc_msgSend(a3, "count"))
    objc_msgSend(a1, "setUserInfoObject:forKey:", a3, CFSTR("MFSSLErrorCertificateKey"));
  objc_msgSend(a1, "setLocalizedDescription:", v13);
  return objc_msgSend(a1, "setShortDescription:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SSL_ALERT_TITLE_FORMAT"), (uint64_t)CFSTR("Unable to verify SSL server %@"), CFSTR("Delayed")), a2));
}

uint64_t _readBytesFromSocket(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  MFError *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  if (a3)
  {
    v5 = a3;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(*(id *)(a1 + 24), "readBytes:length:", a2, v5);
      if (v9 < 0 || (v10 = v9, *(CFAbsoluteTime *)(a1 + 32) = CFAbsoluteTimeGetCurrent(), !v10))
      {
        v8 = -1;
        goto LABEL_10;
      }
      v8 += v10;
      objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "recordBytesRead:", v10);
      v5 -= v10;
      if (!v5)
        break;
      a2 += v10;
    }
    while ((a4 & 1) != 0);
    if ((v8 & 0x8000000000000000) == 0)
      return v8;
LABEL_10:
    v11 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v12 = *(void **)(a1 + 24);
    v13 = (MFError *)objc_msgSend(v11, "error");
    v14 = objc_msgSend(v12, "remoteHostname");
    if (!v13)
    {
      v13 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1045, 0);
      objc_msgSend(v11, "setError:", v13);
      if (!v13 || -[NSError mf_isUserCancelledError](v13, "mf_isUserCancelledError"))
        goto LABEL_28;
      goto LABEL_26;
    }
    if (objc_msgSend((id)*MEMORY[0x1E0CB2FE0], "isEqualToString:", -[MFError domain](v13, "domain")))
    {
      if (-[MFError code](v13, "code") == 60)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_TIMED_OUT"), (uint64_t)CFSTR("The connection to the server “%@” on port %d timed out."), CFSTR("Delayed")), v14, objc_msgSend(v12, "remotePortNumber"));
LABEL_22:
        v17 = v15;
        goto LABEL_24;
      }
    }
    else if (objc_msgSend((id)*MEMORY[0x1E0CB31B0], "isEqualToString:", -[MFError domain](v13, "domain")))
    {
      _setupSSLDomainError(v13, v14, (void *)objc_msgSend(v12, "serverCertificates"));
      v16 = -[MFError localizedDescription](v13, "localizedDescription");
      if (!v16 || (v17 = v16, objc_msgSend(&stru_1E81CBE50, "isEqualToString:", v16)))
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SSL_GENERIC_READ_ERROR"), (uint64_t)CFSTR("An SSL error occurred while trying to read data from the server “%@”. Verify that this server supports SSL and that your account settings are correct."), CFSTR("Delayed")), v14, v19);
        goto LABEL_22;
      }
LABEL_24:
      if (-[NSError mf_isUserCancelledError](v13, "mf_isUserCancelledError"))
      {
LABEL_28:
        objc_msgSend(*(id *)(a1 + 24), "abort");
        return v8;
      }
      if (v17)
      {
LABEL_27:
        -[MFError setLocalizedDescription:](v13, "setLocalizedDescription:", v17);
        goto LABEL_28;
      }
LABEL_26:
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("CONNECTION_FAILED"), (uint64_t)CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed")), v14);
      goto LABEL_27;
    }
    v17 = 0;
    goto LABEL_24;
  }
  return 0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t getDeliveryAccounts()
{
  id v0;
  void *v1;
  id v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!_deliveryAccounts)
  {
    v0 = +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
    v4[0] = *MEMORY[0x1E0C8F138];
    v1 = (void *)objc_msgSend((id)objc_msgSend(v0, "accountsWithTypeIdentifiers:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1), 0), "mutableCopy");
    _deliveryAccounts = (uint64_t)v1;
    if (!v1 || !objc_msgSend(v1, "count"))
    {
      v2 = +[SMTPAccount newDefaultInstance](SMTPAccount, "newDefaultInstance");

      _deliveryAccounts = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v2, 0);
    }
  }
  return _deliveryAccounts;
}

uint64_t _appendQuotedString(void *a1, uint64_t a2, void *a3)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  int v10;
  int v11;
  char v12;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  if (objc_msgSend(a1, "length"))
    objc_msgSend(a1, "appendBytes:length:", ",", 1);
  objc_msgSend(a1, "mf_appendCString:", a2);
  v14 = 61;
  objc_msgSend(a1, "appendBytes:length:", &v14, 1);
  v15 = 34;
  objc_msgSend(a1, "appendBytes:length:", &v15, 1);
  v6 = objc_msgSend(a3, "bytes");
  v7 = objc_msgSend(a3, "length");
  if (v7 >= 1)
  {
    v8 = v6 + v7;
    v9 = (char *)v6;
    while (1)
    {
      v10 = *v9;
      if (v10 == 34 || v10 == 92)
        break;
      if ((unint64_t)++v9 >= v8)
      {
        v11 = 0;
LABEL_10:
        if ((unint64_t)v9 > v6)
          objc_msgSend(a1, "appendBytes:length:", v6, &v9[-v6]);
        if (v11)
        {
          v16 = 92;
          objc_msgSend(a1, "appendBytes:length:", &v16, 1);
          v12 = *v9++;
          v17 = v12;
          objc_msgSend(a1, "appendBytes:length:", &v17, 1);
        }
        v6 = (unint64_t)v9;
        if ((unint64_t)v9 >= v8)
          goto LABEL_15;
      }
    }
    v11 = 1;
    goto LABEL_10;
  }
LABEL_15:
  v18 = 34;
  return objc_msgSend(a1, "appendBytes:length:", &v18, 1);
}

uint64_t _appendValue(void *a1, uint64_t a2, uint64_t a3)
{
  char v7;

  if (objc_msgSend(a1, "length"))
    objc_msgSend(a1, "appendBytes:length:", ",", 1);
  objc_msgSend(a1, "mf_appendCString:", a2);
  v7 = 61;
  objc_msgSend(a1, "appendBytes:length:", &v7, 1);
  return objc_msgSend(a1, "appendData:", a3);
}

CFStringRef copyToken(const UInt8 **a1)
{
  const UInt8 *v1;
  const UInt8 *v2;
  UInt8 v3;
  int64_t v4;
  UInt8 v5;
  const UInt8 *v6;
  int v7;
  BOOL v8;

  v1 = *a1;
  v2 = a1[1];
  if (*a1 >= v2)
    v3 = 0;
  else
LABEL_2:
    v3 = *v1;
  v4 = v2 - v1;
  do
  {
    while (1)
    {
      do
      {
        v5 = v3;
        v3 = 0;
      }
      while (v5 > 0x20u);
      if (((1 << v5) & 0x100002600) == 0)
        break;
      v3 = 0;
      *a1 = ++v1;
      --v4;
      if (v1 < v2)
        goto LABEL_2;
    }
  }
  while (v5);
  v6 = v1;
  if (v1 < v2)
  {
    v6 = v1;
    while (1)
    {
      v7 = *v6;
      if ((v7 - 33) > 0x5D)
        break;
      v8 = (v7 - 34) > 0x3B || ((1 << (v7 - 34)) & 0xE0000007F0024C1) == 0;
      if (!v8 || v7 == 123 || v7 == 125)
        break;
      *a1 = ++v6;
      if (!--v4)
      {
        v6 = v2;
        break;
      }
    }
  }
  if (v1 >= v6)
    return 0;
  else
    return CFStringCreateWithBytesNoCopy(0, v1, v6 - v1, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

CFDataRef quoted_string(const UInt8 **a1)
{
  const UInt8 *v2;
  unint64_t v3;
  UInt8 v4;
  UInt8 v5;
  const UInt8 *v6;
  CFAllocatorRef *v7;
  CFDataRef v8;
  const __CFAllocator *v9;
  const UInt8 *v10;
  int v11;
  unint64_t v12;

  v2 = *a1;
  v3 = (unint64_t)a1[1];
  if ((unint64_t)*a1 < v3)
  {
LABEL_2:
    v4 = *v2;
    goto LABEL_4;
  }
  v4 = 0;
  do
  {
    while (1)
    {
      do
      {
LABEL_4:
        v5 = v4;
        v4 = 0;
      }
      while (v5 > 0x20u);
      if (((1 << v5) & 0x100002600) == 0)
        break;
      v4 = 0;
      *a1 = ++v2;
      if ((unint64_t)v2 < v3)
        goto LABEL_2;
    }
  }
  while (v5);
  if ((unint64_t)v2 >= v3 || *v2 != 34)
    return 0;
  v6 = v2 + 1;
  *a1 = v6;
  v7 = (CFAllocatorRef *)MEMORY[0x1E0C9AE20];
  if ((unint64_t)v6 >= v3)
  {
    v10 = v6;
    return CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, *v7);
  }
  v8 = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  v10 = v6;
  while (1)
  {
    v11 = *v6;
    if (v11 == 92)
    {
      if (!v8)
      {
        v8 = (CFDataRef)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "init");
        v6 = *a1;
      }
      v12 = (unint64_t)a1[1];
      if (v10 < v6)
      {
        -[__CFData appendBytes:length:](v8, "appendBytes:length:", v10, v12 - (_QWORD)v10);
        v6 = *a1;
        v12 = (unint64_t)a1[1];
      }
      if ((unint64_t)(v6 + 1) < v12)
      {
        *a1 = v6 + 1;
        -[__CFData appendBytes:length:](v8, "appendBytes:length:");
        v6 = *a1;
      }
      v10 = v6;
      goto LABEL_24;
    }
    if (v11 == 34)
      break;
LABEL_24:
    *a1 = ++v6;
    if (v6 >= a1[1])
    {
      if (!v8)
        return CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, *v7);
      if (v10 < v6)
        goto LABEL_34;
      return v8;
    }
  }
  if (v8)
  {
    -[__CFData appendBytes:length:](v8, "appendBytes:length:", v10, v6 - v10);
    v10 = *a1;
    v6 = *a1 + 1;
    *a1 = v6;
LABEL_34:
    -[__CFData appendBytes:length:](v8, "appendBytes:length:", v10, v6 - v10);
    return v8;
  }
  v8 = CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, v9);
  v10 = *a1;
  v6 = *a1 + 1;
  *a1 = v6;
  if (v8)
    return v8;
  return CFDataCreateWithBytesNoCopy(0, v10, v6 - v10, *v7);
}

void *copyQuotedTokenList(const UInt8 **a1)
{
  void *v2;
  unsigned __int8 *v3;
  unint64_t v4;
  CFStringRef v5;
  __CFString *v6;
  int v7;
  const UInt8 *v8;
  int v9;
  NSObject *v10;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*a1 >= a1[1] || **a1 != 34)
    return 0;
  v2 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  v3 = (unsigned __int8 *)a1[1];
  v4 = (unint64_t)(*a1 + 1);
  *a1 = (const UInt8 *)v4;
  if (v4 < (unint64_t)v3)
  {
    while (1)
    {
      v5 = copyToken(a1);
      if (!v5)
        break;
      v6 = (__CFString *)v5;
      objc_msgSend(v2, "addObject:", v5);

      v7 = 0;
      v8 = *a1;
LABEL_15:
      if (v8 >= a1[1] || v7 != 0)
        return v2;
    }
    if (*a1 >= a1[1])
    {
      v9 = 0;
    }
    else
    {
      v9 = **a1;
      if (v9 == 44)
      {
LABEL_13:
        v7 = 0;
        goto LABEL_14;
      }
      if (v9 == 34)
      {
        v7 = 1;
LABEL_14:
        v8 = *a1 + 1;
        *a1 = v8;
        goto LABEL_15;
      }
    }
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v9;
      _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "*** Parse failure(unexpected character '%c'). Ignoring", buf, 8u);
    }
    goto LABEL_13;
  }
  return v2;
}

void *_createResponseData(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  CC_MD5_CTX c;
  char data;
  char v30[3];
  char __str[16];
  char md[16];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  data = 58;
  memset(&c, 0, sizeof(c));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 32);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 32);
  CC_MD5_Init(&c);
  if (a4)
    CC_MD5_Update(&c, "AUTHENTICATE", 0xCu);
  CC_MD5_Update(&c, &data, 1u);
  v10 = *(void **)(a3 + 40);
  if (v10)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a3 + 40), "bytes"), objc_msgSend(v10, "length"));
  if ((*(_BYTE *)(a1 + 38) & 2) != 0)
    CC_MD5_Update(&c, ":00000000000000000000000000000000", 0x21u);
  CC_MD5_Final((unsigned __int8 *)md, &c);
  v11 = 0;
  do
  {
    v12 = v11 + 1;
    snprintf(__str, 3uLL, "%02x", md[v11]);
    objc_msgSend(v9, "appendBytes:length:", __str, 2);
    v11 = v12;
  }
  while (v12 != 16);
  CC_MD5_Init(&c);
  v13 = *(void **)(a3 + 24);
  if (v13)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a3 + 24), "bytes"), objc_msgSend(v13, "length"));
  CC_MD5_Update(&c, &data, 1u);
  v14 = *(void **)(a3 + 48);
  if (v14)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a3 + 48), "bytes"), objc_msgSend(v14, "length"));
  CC_MD5_Update(&c, &data, 1u);
  v15 = *(void **)(a3 + 32);
  if (v15)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a3 + 32), "bytes"), objc_msgSend(v15, "length"));
  CC_MD5_Final((unsigned __int8 *)__str, &c);
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, __str, 0x10u);
  CC_MD5_Update(&c, &data, 1u);
  v16 = *(void **)(a2 + 8);
  if (v16)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a2 + 8), "bytes"), objc_msgSend(v16, "length"));
  CC_MD5_Update(&c, &data, 1u);
  if (*(_QWORD *)a3)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)a3, "bytes"), objc_msgSend(*(id *)a3, "length"));
  if ((*(_BYTE *)(a1 + 38) & 2) != 0)
  {
    CC_MD5_Final((unsigned __int8 *)(a3 + 64), &c);
    v19 = 0;
    do
    {
      v20 = v19 + 1;
      snprintf(md, 3uLL, "%02x", *(unsigned __int8 *)(a3 + 64 + v19));
      objc_msgSend(v8, "appendBytes:length:", md, 2);
      v19 = v20;
    }
    while (v20 != 16);
  }
  else
  {
    CC_MD5_Final((unsigned __int8 *)md, &c);
    v17 = 0;
    do
    {
      v18 = v17 + 1;
      snprintf(v30, 3uLL, "%02x", md[v17]);
      objc_msgSend(v8, "appendBytes:length:", v30, 2);
      v17 = v18;
    }
    while (v18 != 16);
  }
  CC_MD5_Init(&c);
  if (v8)
    CC_MD5_Update(&c, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  CC_MD5_Update(&c, &data, 1u);
  v21 = *(void **)(a2 + 8);
  if (v21)
    CC_MD5_Update(&c, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
  CC_MD5_Update(&c, &data, 1u);
  v22 = *(void **)(a3 + 8);
  if (v22)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)(a3 + 8), "bytes"), objc_msgSend(v22, "length"));
  CC_MD5_Update(&c, &data, 1u);
  if (*(_QWORD *)a3)
    CC_MD5_Update(&c, (const void *)objc_msgSend(*(id *)a3, "bytes"), objc_msgSend(*(id *)a3, "length"));
  CC_MD5_Update(&c, &data, 1u);
  v23 = *(void **)(a3 + 16);
  if (v23)
    CC_MD5_Update(&c, (const void *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
  CC_MD5_Update(&c, &data, 1u);
  if (v9)
    CC_MD5_Update(&c, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  v24 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 32);
  CC_MD5_Final((unsigned __int8 *)md, &c);
  v25 = 0;
  do
  {
    v26 = v25 + 1;
    snprintf(v30, 3uLL, "%02x", md[v25]);
    objc_msgSend(v24, "appendBytes:length:", v30, 2);
    v25 = v26;
  }
  while (v26 != 16);

  return v24;
}

void _appendParagraphToOutput(__CFString *a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v7;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _WORD *v14;
  _WORD *v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  UniChar chars;

  if (a2)
  {
    v7 = a3;
    if (a3 > 0)
      v10 = a5;
    else
      v10 = 0;
    if (v10 == 1)
    {
      v11 = a3;
      do
      {
        -[__CFString appendString:](a1, "appendString:", CFSTR("<BLOCKQUOTE type=\"cite\">"));
        --v11;
      }
      while (v11);
    }
    if (a5)
    {
      -[__CFString appendString:](a1, "appendString:", CFSTR("<SPAN>"));
      v12 = objc_msgSend(a2, "length");
      if (v12)
      {
        v13 = v12;
        v14 = malloc_type_malloc(2 * v12 + 2, 0x1000040BDFB0063uLL);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(a2, "getCharacters:", v14);
          v16 = 0;
          v17 = 1;
          do
          {
            v18 = (unsigned __int16)v15[v16];
            chars = v18;
            if (v18 == 9)
              v19 = CFSTR(" &nbsp; &nbsp;");
            else
              v19 = 0;
            if (v17 != 1 && v18 == 32 && v15[v17 - 2] == 32)
              v19 = CFSTR("&nbsp;");
            if (v18 == 60)
              v19 = CFSTR("&lt;");
            if (v18 == 62)
              v19 = CFSTR("&gt;");
            if (v18 == 38)
              v20 = CFSTR("&amp;");
            else
              v20 = v19;
            if (v20)
              -[__CFString appendString:](a1, "appendString:");
            else
              CFStringAppendCharacters(a1, &chars, 1);
            v16 = v17;
          }
          while (v13 > v17++);
          free(v15);
        }
      }
      if (a4)
        -[__CFString appendString:](a1, "appendString:", CFSTR("</SPAN><BR>"));
      if (v10)
      {
        do
        {
          -[__CFString appendString:](a1, "appendString:", CFSTR("</BLOCKQUOTE>"));
          --v7;
        }
        while (v7);
      }
    }
    else
    {
      -[__CFString appendString:](a1, "appendString:", a2);
      if (a4)
        -[__CFString appendString:](a1, "appendString:", a4);
    }
  }
}

uint64_t _GetTextBreakLocale()
{
  id v0;
  void *v1;

  v0 = (id)_GetTextBreakLocale___TextBreakLocale;
  if (!_GetTextBreakLocale___TextBreakLocale)
  {
    v1 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("AppleTextBreakLocale")), "objectAtIndex:", 0);
    if (!v1)
      v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), "localeIdentifier");
    v0 = v1;
    _GetTextBreakLocale___TextBreakLocale = (uint64_t)v0;
  }
  return objc_msgSend(v0, "UTF8String");
}

void ___weakDDURLifierClass_block_invoke()
{
  const char *v0;
  NSObject *v1;
  const char *v2;
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  int v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = (const char *)objc_msgSend((id)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore")), "fileSystemRepresentation");
  if (!dlopen(v0, 1))
  {
    v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      return;
    v6 = 136315138;
    v7 = dlerror();
    v2 = "#Warning Failed to load DataDetectorsCore.framework (%s)";
    v3 = v5;
    v4 = 12;
    goto LABEL_7;
  }
  _weakDDURLifierClass_sDDURLifierClass = (uint64_t)NSClassFromString(CFSTR("DDURLifier"));
  if (!_weakDDURLifierClass_sDDURLifierClass)
  {
    v1 = MFLogGeneral();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      v2 = "#Warning NSClassFromString(@\"DDURLifier\") returned Nil";
      v3 = v1;
      v4 = 2;
LABEL_7:
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, v2, (uint8_t *)&v6, v4);
    }
  }
}

void _dispatch_sync(void *a1)
{
  NSObject *v2;

  if (_dispatch_sync_token != -1)
    dispatch_once(&_dispatch_sync_token, &__block_literal_global_166);
  v2 = dispatch_group_create();
  dispatch_group_async(v2, (dispatch_queue_t)_dispatch_sync__queue, a1);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v2);
}

dispatch_queue_t ___dispatch_sync_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.message.InvocationQueueState", 0);
  _dispatch_sync__queue = (uint64_t)result;
  return result;
}

uint64_t partDataFromFullBodyData(void *a1, uint64_t a2, void *a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v13 = 0;
  v8 = (void *)objc_msgSend(a1, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:usePartDatas:didDownload:", a2, 0, &v13, a5, 0, a6);
  result = 0;
  if (v8 && v13)
  {
    v10 = objc_msgSend(a3, "range");
    v12 = v11;
    if (v10 + v11 <= (unint64_t)objc_msgSend(v8, "length"))
    {
      result = objc_msgSend(v8, "mf_subdataWithRange:", v10, v12);
      if (a4)
        *a4 = 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

MFLibraryStore *initializeSharedInstance()
{
  MFLibraryStore *result;

  result = objc_alloc_init(MFLibraryStore);
  _sharedInstance = (uint64_t)result;
  return result;
}

uint64_t initCSAccountTypeLocal()
{
  uint64_t result;

  if (LoadCoreSpotlight_loadPredicate != -1)
    dispatch_once(&LoadCoreSpotlight_loadPredicate, &__block_literal_global_5);
  result = *(_QWORD *)dlsym((void *)LoadCoreSpotlight_frameworkLibrary, "CSAccountTypeLocal");
  constantCSAccountTypeLocal = result;
  getCSAccountTypeLocal = CSAccountTypeLocalFunction;
  return result;
}

uint64_t CSAccountTypeLocalFunction()
{
  return constantCSAccountTypeLocal;
}

__CFString *MailAccountCachePolicyStringForEnumValue(int a1)
{
  return _cachePolicyNames[a1];
}

void *_allEmailAddressesIncludingFullName(int a1, int a2)
{
  char ***v2;
  BOOL v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t *v11;
  char **v12;
  CFAllocatorRef v13;
  unint64_t v14;
  CFIndex v15;
  CFIndex v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __CFArray *MutableCopy;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  char ***v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  char ***v37;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  void *v46;
  CFAllocatorRef allocator;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  +[MailAccount mf_lock](MailAccount, "mf_lock");
  v2 = &off_1EF8FC000;
  if (_allEmailAddresses)
    v3 = _allEmailAddressesWithFullUserName == 0;
  else
    v3 = 1;
  if (v3 || _allReceiveEmailAliasAddresses == 0 || _allReceiveEmailAliasAddressesWithFullUserName == 0)
  {
    +[MailAccount mf_unlock](MailAccount, "mf_unlock");
    obj = +[MailAccount mailAccounts](MailAccount, "mailAccounts");
    +[MailAccount mf_lock](MailAccount, "mf_lock");
    if (!_allEmailAddresses
      || !_allEmailAddressesWithFullUserName
      || !_allReceiveEmailAliasAddresses
      || !_allReceiveEmailAliasAddressesWithFullUserName)
    {

      _allEmailAddresses = 0;
      _allEmailAddressesWithFullUserName = 0;

      _allReceiveEmailAliasAddresses = 0;
      _allReceiveEmailAliasAddressesWithFullUserName = 0;
      _allEmailAddresses = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      _allEmailAddressesWithFullUserName = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      _allReceiveEmailAliasAddresses = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      _allReceiveEmailAliasAddressesWithFullUserName = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v6)
      {
        v43 = *(_QWORD *)v55;
        do
        {
          v7 = 0;
          v42 = v6;
          do
          {
            if (*(_QWORD *)v55 != v43)
              objc_enumerationMutation(obj);
            v46 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v7);
            v44 = v7;
            if (objc_msgSend(v46, "isActive"))
            {
              v8 = 1;
              do
              {
                v45 = v8;
                v9 = (v8 & 1) == 0;
                v10 = &_allEmailAddressesWithFullUserName;
                if (v9)
                  v10 = &_allReceiveEmailAliasAddressesWithFullUserName;
                v48 = (void *)*v10;
                v11 = &_allEmailAddresses;
                if (v9)
                  v11 = &_allReceiveEmailAliasAddresses;
                v49 = (void *)*v11;
                v12 = &selRef_emailAddresses;
                if (v9)
                  v12 = &selRef_receiveEmailAliasAddressesList;
                v13 = (CFAllocatorRef)objc_msgSend(v46, "performSelector:", *v12);
                v14 = -[__CFAllocator count](v13, "count");
                if (v14)
                {
                  allocator = 0;
                  v15 = 0;
                  do
                  {
                    v16 = v15;
                    v17 = -[__CFAllocator objectAtIndex:](v13, "objectAtIndex:", v15++);
                    if (v16 + 1 < v14)
                    {
                      v18 = v17;
                      v19 = v16 + 1;
                      while (1)
                      {
                        v20 = (void *)-[__CFAllocator objectAtIndex:](v13, "objectAtIndex:", v19);
                        v22 = objc_msgSend(v20, "rangeOfString:options:", v18, 8);
                        if (v22 != 0x7FFFFFFFFFFFFFFFLL
                          && objc_msgSend(v20, "length") > (unint64_t)(v22 + v21)
                          && objc_msgSend(v20, "characterAtIndex:") == 64)
                        {
                          break;
                        }
                        if (v14 == ++v19)
                          goto LABEL_44;
                      }
                      MutableCopy = allocator;
                      if (!allocator)
                        MutableCopy = CFArrayCreateMutableCopy(0, v14, v13);
                      allocator = MutableCopy;
                      CFArrayExchangeValuesAtIndices(MutableCopy, v16, v19);
                    }
LABEL_44:
                    ;
                  }
                  while (v15 != v14);
                  if (allocator)
                    v13 = allocator;
                }
                v24 = (void *)objc_msgSend(v46, "fullUserName");
                v25 = v24;
                if (v24
                  && objc_msgSend(v24, "rangeOfString:", CFSTR(",")) != 0x7FFFFFFFFFFFFFFFLL
                  && objc_msgSend(v25, "rangeOfString:", CFSTR("\"")) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v25 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\""), v25);
                }
                v52 = 0u;
                v53 = 0u;
                v50 = 0u;
                v51 = 0u;
                v26 = -[__CFAllocator countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                if (v26)
                {
                  v27 = *(_QWORD *)v51;
                  do
                  {
                    for (i = 0; i != v26; ++i)
                    {
                      if (*(_QWORD *)v51 != v27)
                        objc_enumerationMutation(v13);
                      v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                      if (v29
                        && (objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
                      {
                        if (v25 && (objc_msgSend(v25, "isEqualToString:", &stru_1E81CBE50) & 1) == 0)
                          v30 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "mf_formattedAddressWithName:email:useQuotes:", v25, v29, 1);
                        else
                          v30 = v29;
                        v31 = v30;
                        if (v30 && objc_msgSend(v48, "indexOfObject:", v30) == 0x7FFFFFFFFFFFFFFFLL)
                          objc_msgSend(v48, "addObject:", v31);
                        if (objc_msgSend(v49, "indexOfObject:", v29) == 0x7FFFFFFFFFFFFFFFLL)
                          objc_msgSend(v49, "addObject:", v29);

                      }
                    }
                    v26 = -[__CFAllocator countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                  }
                  while (v26);
                }
                v8 = 0;
              }
              while ((v45 & 1) != 0);
            }
            ++v7;
          }
          while (v44 + 1 != v42);
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          v2 = &off_1EF8FC000;
        }
        while (v6);
      }
    }
  }
  v32 = v2;
  v33 = (void *)_allEmailAddressesWithFullUserName;
  v34 = (void *)_allEmailAddresses;
  if (a2)
  {
    if (a1)
    {
      if (!objc_msgSend((id)_allReceiveEmailAliasAddressesWithFullUserName, "count"))
      {
        v34 = v33;
        goto LABEL_84;
      }
      v35 = objc_msgSend(v33, "arrayByAddingObjectsFromArray:", _allReceiveEmailAliasAddressesWithFullUserName);
      goto LABEL_82;
    }
    v37 = v32;
    if (objc_msgSend(v32[182], "count"))
    {
      v35 = objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v37[182]);
LABEL_82:
      v34 = (void *)v35;
    }
  }
  else
  {
    if (a1)
      v34 = (void *)_allEmailAddressesWithFullUserName;
    v36 = v34;
  }
LABEL_84:
  +[MailAccount mf_unlock](MailAccount, "mf_unlock");
  return v34;
}

void sub_1C885ACA0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _resetAllEmailAddresses()
{
  +[MailAccount mf_lock](MailAccount, "mf_lock");

  _allEmailAddresses = 0;
  _allEmailAddressesWithFullUserName = 0;

  _allReceiveEmailAliasAddresses = 0;
  _allReceiveEmailAliasAddressesWithFullUserName = 0;
  return +[MailAccount mf_unlock](MailAccount, "mf_unlock");
}

uint64_t _invalidateMailboxCache(uint64_t a1)
{
  id v2;

  *(_DWORD *)(a1 + 64) &= ~0x20000u;
  objc_msgSend(*(id *)(a1 + 56), "invalidate");
  objc_msgSend((id)a1, "mf_lock");
  v2 = *(id *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;
  return objc_msgSend((id)a1, "mf_unlock");
}

uint64_t _recurseIntoFileSystem(void *a1, id *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(a1, "objectForKey:", CFSTR("MailboxName"));
  result = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("MailboxAttributes")), "unsignedIntValue");
  if ((result & 1) == 0)
  {
    v6 = result;
    v7 = objc_msgSend(a2[1], "length");
    v8 = (void *)objc_msgSend(a2[2], "childWithName:", v4);
    if (v8)
    {
      v9 = v8;
      v10 = v8;
    }
    else
    {
      v9 = (void *)objc_msgSend(*a2, "_copyMailboxWithParent:name:attributes:dictionary:", a2[2], v4, v6, 0);
    }
    objc_msgSend(a2[1], "appendString:", CFSTR("/"));
    objc_msgSend(a2[1], "appendString:", v4);
    objc_msgSend(*a2, "_loadEntriesFromFileSystemPath:parent:", a2[1], v9);

    return objc_msgSend(a2[1], "deleteCharactersInRange:", v7, objc_msgSend(a2[1], "length") - v7);
  }
  return result;
}

void sub_1C8860030(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1C885FFD8);
  }
  _Unwind_Resume(a1);
}

void *encodedURLComponent(void *result)
{
  void *v1;

  v1 = result;
  if (result)
    result = (void *)objc_msgSend(result, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet"));
  if (!result)
    return v1;
  return result;
}

CFComparisonResult _MFCompareMailboxDictionariesByName(void *a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  if (a1
    && a2
    && (v3 = objc_msgSend(a1, "objectForKey:", CFSTR("MailboxName"))) != 0
    && (v4 = (const __CFString *)v3,
        (v5 = (const __CFString *)objc_msgSend(a2, "objectForKey:", CFSTR("MailboxName"))) != 0))
  {
    return CFStringCompare(v4, v5, 0);
  }
  else
  {
    return 0;
  }
}

CFComparisonResult _compareNameWithMailboxDictionary(__CFString *a1, __CFString *a2, __CFString *a3)
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = a2;
  v4 = a1;
  if (a1 == a3)
  {
    v3 = (const __CFString *)-[__CFString objectForKey:](a2, "objectForKey:", CFSTR("MailboxName"));
    if (!v4)
      return 0;
  }
  else
  {
    v4 = (const __CFString *)-[__CFString objectForKey:](a1, "objectForKey:", CFSTR("MailboxName"));
    if (!v4)
      return 0;
  }
  if (v3)
    return CFStringCompare(v4, v3, 0);
  return 0;
}

uint64_t initCSAccountTypeUnknown()
{
  uint64_t result;

  if (LoadCoreSpotlight_loadPredicate_0 != -1)
    dispatch_once(&LoadCoreSpotlight_loadPredicate_0, &__block_literal_global_667);
  result = *(_QWORD *)dlsym((void *)LoadCoreSpotlight_frameworkLibrary_0, "CSAccountTypeUnknown");
  constantCSAccountTypeUnknown = result;
  getCSAccountTypeUnknown = CSAccountTypeUnknownFunction;
  return result;
}

uint64_t CSAccountTypeUnknownFunction()
{
  return constantCSAccountTypeUnknown;
}

const __CFString *NSStringFromMailboxUidType(int a1)
{
  const __CFString *result;
  const __CFString *v2;

  if (a1 > 99)
  {
    switch(a1)
    {
      case 'd':
        result = CFSTR("INBOXSpecialMailboxUid");
        break;
      case 'e':
        result = CFSTR("JunkSpecialMailboxUid");
        break;
      case 'f':
        result = CFSTR("ArchiveSpecialMailboxUid");
        break;
      case 'g':
        result = CFSTR("TrashSpecialMailboxUid");
        break;
      case 'h':
        result = CFSTR("SentMessagesSpecialMailboxUid");
        break;
      case 'i':
        result = CFSTR("DraftsSpecialMailboxUid");
        break;
      case 'j':
        result = CFSTR("OutboxSpecialMailboxUid");
        break;
      default:
        result = 0;
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("GenericMailboxUid");
        break;
      case 1:
        result = CFSTR("JunkMailboxUid");
        break;
      case 2:
        result = CFSTR("ArchiveMailboxUid");
        break;
      case 3:
        result = CFSTR("TrashMailboxUid");
        break;
      case 4:
        result = CFSTR("SentMessagesUid");
        break;
      case 5:
        result = CFSTR("DraftsMailboxUid");
        break;
      case 6:
        result = CFSTR("OutboxUid");
        break;
      case 7:
        result = CFSTR("InboxUid");
        break;
      case 8:
        result = CFSTR("RootMailboxUid");
        break;
      default:
        v2 = CFSTR("RootlessMailboxUid");
        if (a1 != -100)
          v2 = 0;
        if (a1 == -500)
          result = CFSTR("InvalidMailboxUidType");
        else
          result = v2;
        break;
    }
  }
  return result;
}

uint64_t _MFChildWithPredicate(_QWORD *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mf_lock");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)a1[7];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if ((a2(v11, a3) & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }
  objc_msgSend(a1, "mf_unlock");
  return v11;
}

BOOL mailboxHasName(id *a1, uint64_t a2)
{
  _BOOL8 v4;

  objc_msgSend(a1, "mf_lock");
  v4 = objc_msgSend(a1[4], "compare:", a2) == 0;
  objc_msgSend(a1, "mf_unlock");
  return v4;
}

CFComparisonResult _MFCompareMailboxUidsWithResultCodes(uint64_t a1, uint64_t a2, void *a3, CFComparisonResult a4, uint64_t a5, CFComparisonResult a6)
{
  int v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;

  if (a1 == a2)
    return a5;
  if (!a1)
    return a6;
  if (!a2)
    return a4;
  v12 = *(_DWORD *)(a1 + 112);
  v13 = *(_DWORD *)(a2 + 112);
  if (v12 && !v13)
    return a6;
  if (!v12 && v13)
    return a4;
  if (v12 < v13)
    return a6;
  if (v12 > v13)
    return a4;
  if (a3 && (*(_BYTE *)(a1 + 40) & 0x10) == 0 && (*(_BYTE *)(a2 + 40) & 0x10) == 0)
  {
    v14 = (const __CFString *)objc_msgSend(a3, "_pathComponentForUidName:", *(_QWORD *)(a1 + 32));
    v15 = objc_msgSend(a3, "_pathComponentForUidName:", *(_QWORD *)(a2 + 32));
LABEL_20:
    v16 = (const __CFString *)v15;
    goto LABEL_22;
  }
  if (objc_msgSend((id)a1, "account"))
    v14 = (const __CFString *)objc_msgSend((id)a1, "displayName");
  else
    v14 = *(const __CFString **)(a1 + 32);
  if (objc_msgSend((id)a2, "account"))
  {
    v15 = objc_msgSend((id)a2, "displayName");
    goto LABEL_20;
  }
  v16 = *(const __CFString **)(a2 + 32);
LABEL_22:
  if (v14 == v16)
    return a5;
  if (v14)
  {
    a6 = a4;
    if (v16)
    {
      a6 = CFStringCompare(v14, v16, 0x61uLL);
      if ((_DWORD)a6 == (_DWORD)a5)
        return CFStringCompare(v14, v16, 0x60uLL);
    }
  }
  return a6;
}

uint64_t _MFCompareMailboxUids(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)_MFCompareMailboxUidsWithResultCodes(a1, a2, a3, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

uint64_t _MFCompareMailboxUidsNS(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)_MFCompareMailboxUidsWithResultCodes(a1, a2, a3, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

uint64_t bindParentAndChild(_QWORD *a1, id *a2)
{
  uint64_t result;
  void *v5;
  id v6;

  result = objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", a1);
  if ((id)result != a2[6])
  {
    v5 = (void *)result;
    objc_msgSend(a2, "mf_lock");

    a2[6] = v5;
    result = objc_msgSend(a2, "mf_unlock");
  }
  if (a1)
  {
    objc_msgSend(a1, "mf_lock");
    v6 = (id)a1[7];
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      a1[7] = v6;
    }
    objc_msgSend(v6, "addObject:", a2);
    return objc_msgSend(a1, "mf_unlock");
  }
  return result;
}

unint64_t _MFFlagsBySettingValueForKey(unint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;

  if (objc_msgSend(a2, "isEqual:", CFSTR("MessageIsRead")))
  {
    if ((a1 & 1) != a3)
      return a1 & 0xFFFFFFFFFFFFFFFELL | a3;
    return a1;
  }
  if (objc_msgSend(a2, "isEqual:", CFSTR("MessageIsDeleted")))
  {
    v6 = (a1 >> 1) & 1;
    v7 = a1 & 0xFFFFFFFFFFFFFFFDLL;
    v8 = a3 == 0;
    v9 = 2;
LABEL_13:
    if (v8)
      v9 = 0;
    v10 = v9 | v7;
    if ((_DWORD)v6 != a3)
      return v10;
    return a1;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageWasRepliedTo")))
  {
    v6 = (a1 >> 2) & 1;
    v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    v8 = a3 == 0;
    v9 = 4;
    goto LABEL_13;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageWasForwarded")))
  {
    v6 = (a1 >> 8) & 1;
    v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    v8 = a3 == 0;
    v9 = 256;
    goto LABEL_13;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageWasRedirected")))
  {
    v6 = (a1 >> 9) & 1;
    v7 = a1 & 0xFFFFFFFFFFFFFCFBLL;
    v8 = a3 == 0;
    v9 = 512;
    goto LABEL_13;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageIsJunk")))
  {
    if (((a1 >> 21) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFF7FDFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x200000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageIsNotJunk")))
  {
    if (((a1 & 0x80000000) != 0) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFF7FDFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x80000000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageIsFlagged")))
  {
    if (((a1 >> 4) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFFFFFFFFEFLL;
    v13 = a3 == 0;
    v14 = 16;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageIsServerSearchResult")))
  {
    if (((a1 >> 7) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFFFFFFFF7FLL;
    v13 = a3 == 0;
    v14 = 128;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageIsThreadSearchResult")))
  {
    if (((a1 >> 20) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFFFFEFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x100000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageSenderIsVIP")))
  {
    if (((a1 >> 24) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFFFEFFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x1000000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageDeliveryInProgress")))
  {
    if (((a1 >> 37) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFDFFFFFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x2000000000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageQueuedForDelivery")))
  {
    if (((a1 >> 38) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFBFFFFFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x4000000000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageNeedsSyncConfirmation")))
  {
    if (((a1 >> 22) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFFFFFFBFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x400000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageToContainsAccountAddress")))
  {
    if (((a1 >> 39) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFF7FFFFFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x8000000000;
    goto LABEL_52;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageCcContainsAccountAddress")))
  {
    if (((a1 >> 40) & 1) == a3)
      return a1;
    v12 = a1 & 0xFFFFFEFFFFFFFFFFLL;
    v13 = a3 == 0;
    v14 = 0x10000000000;
LABEL_52:
    if (v13)
      v14 = 0;
    return v14 | v12;
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("MessageToOrCcContainsAccountAddress")))
  {
    v15 = 0x8000000000;
    if (!a3)
      v15 = 0;
    v16 = v15 | a1 & 0xFFFFFE7FFFFFFFFFLL;
    v17 = 0x10000000000;
    if (!a3)
      v17 = 0;
    return v16 | v17;
  }
  else if ((objc_msgSend(a2, "isEqualToString:", CFSTR("_Encoding")) & 1) == 0)
  {
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      _MFFlagsBySettingValueForKey_cold_1((uint64_t)a2, v18);
  }
  return a1;
}

unint64_t MFMessageFlagsByApplyingDictionary(unint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(a2, "allKeys", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        a1 = _MFFlagsBySettingValueForKey(a1, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8), objc_msgSend(a2, "mf_BOOLForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return a1;
}

unint64_t _MFFlagsBySettingNumberOfAttachments(uint64_t a1, unsigned int a2, int a3, int a4)
{
  char v4;
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v4 = a2;
  else
    v4 = 63;
  if (a2 > 0x3E)
    v4 = 62;
  v5 = 8;
  if (!a4)
    v5 = 0;
  v6 = 0x800000;
  if (!a3)
    v6 = 0;
  return v6 & 0xFFFFFFFFFFFF03FFLL | a1 & 0xFFFFFFFFFF7F03F7 | v5 & 0xFFFFFFFFFFFF03FFLL | ((unint64_t)(v4 & 0x3F) << 10);
}

void sub_1C88668B0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C88668D0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C8866850);
}

uint64_t _formatFlowedOptions(void *a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend((id)objc_msgSend(a1, "bodyParameterForKey:", CFSTR("format")), "isEqualToString:", CFSTR("flowed"));
  if ((_DWORD)result)
  {
    v3 = (void *)objc_msgSend(a1, "bodyParameterForKey:", CFSTR("delsp"));
    if (!v3)
      return 1;
    v4 = v3;
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("yes"))
      && objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("y")))
    {
      return 1;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

void *MFDescriptionForMessageFlags(uint64_t a1)
{
  const char *v2;
  void *v3;
  void *v4;

  v2 = "read";
  if ((a1 & 1) == 0)
    v2 = "unread";
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("0x%llx (%s"), a1, v2);
  v4 = v3;
  if ((a1 & 0x200000) != 0)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(", junk"));
    if ((a1 & 0x80000000) == 0)
    {
LABEL_5:
      if ((a1 & 2) == 0)
        goto LABEL_6;
      goto LABEL_28;
    }
  }
  else if ((a1 & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", not-junk"));
  if ((a1 & 2) == 0)
  {
LABEL_6:
    if ((a1 & 4) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v4, "appendFormat:", CFSTR(", deleted"));
  if ((a1 & 4) == 0)
  {
LABEL_7:
    if ((a1 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v4, "appendFormat:", CFSTR(", answered"));
  if ((a1 & 0x100) == 0)
  {
LABEL_8:
    if ((a1 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v4, "appendFormat:", CFSTR(", forwarded"));
  if ((a1 & 0x200) == 0)
  {
LABEL_9:
    if ((a1 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v4, "appendFormat:", CFSTR(", redirected"));
  if ((a1 & 0x10) == 0)
  {
LABEL_10:
    if ((a1 & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v4, "appendFormat:", CFSTR(", flagged"));
  if ((a1 & 0x1000000) == 0)
  {
LABEL_11:
    if ((a1 & 8) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v4, "appendFormat:", CFSTR(", VIP"));
  if ((a1 & 8) == 0)
  {
LABEL_12:
    if ((a1 & 0x800000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v4, "appendFormat:", CFSTR(", encrypted"));
  if ((a1 & 0x800000) == 0)
  {
LABEL_13:
    if ((a1 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v4, "appendFormat:", CFSTR(", signed"));
  if ((a1 & 0x20) == 0)
  {
LABEL_14:
    if ((a1 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v4, "appendFormat:", CFSTR(", recent"));
  if ((a1 & 0x40) == 0)
  {
LABEL_15:
    if ((a1 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v4, "appendFormat:", CFSTR(", draft"));
  if ((a1 & 0x80) == 0)
  {
LABEL_16:
    if ((a1 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v4, "appendFormat:", CFSTR(", server search result"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_17:
    if ((a1 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  objc_msgSend(v4, "appendFormat:", CFSTR(", thread search result"));
  if ((a1 & 0x400000) != 0)
LABEL_18:
    objc_msgSend(v4, "appendFormat:", CFSTR(", needs sync"));
LABEL_19:
  if ((WORD1(a1) & 7) == 3)
  {
    if ((a1 & 0x400000000) == 0)
      goto LABEL_21;
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(", priority=%x"), WORD1(a1) & 7);
    if ((a1 & 0x400000000) == 0)
    {
LABEL_21:
      if ((a1 & 0x2000000000) == 0)
        goto LABEL_22;
      goto LABEL_43;
    }
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", partial"));
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_22:
    if ((a1 & 0x100000000) == 0)
      goto LABEL_23;
LABEL_44:
    objc_msgSend(v4, "appendFormat:", CFSTR(", temp UID"));
    if ((a1 & 0x200000000) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_43:
  objc_msgSend(v4, "appendFormat:", CFSTR(", delivery"));
  if ((a1 & 0x100000000) != 0)
    goto LABEL_44;
LABEL_23:
  if ((a1 & 0x200000000) != 0)
LABEL_24:
    objc_msgSend(v4, "appendString:", CFSTR(", indexed message body"));
LABEL_25:
  objc_msgSend(v4, "appendFormat:", CFSTR(")"));
  return v4;
}

uint64_t MFMailDirectory()
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!MFMailDirectory___MailDir)
  {
    MFMailDirectory___MailDir = (uint64_t)(id)objc_msgSend((id)objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library")), "stringByAppendingPathComponent:", CFSTR("Mail"));
    v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if ((objc_msgSend(v0, "fileExistsAtPath:", MFMailDirectory___MailDir) & 1) == 0)
    {
      if (objc_msgSend(v0, "mf_makeCompletePath:mode:", MFMailDirectory___MailDir, 448))
      {
        v1 = open((const char *)objc_msgSend((id)MFMailDirectory___MailDir, "fileSystemRepresentation"), 0);
        if (v1 < 0)
        {
          v4 = MFLogGeneral();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v7 = MFMailDirectory___MailDir;
            _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Could not open fd for %@", buf, 0xCu);
          }
        }
        else
        {
          v2 = v1;
          if (fcntl(v1, 64, 4))
          {
            v3 = MFLogGeneral();
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v7 = MFMailDirectory___MailDir;
              _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, "#Warning Could not set protection class on %@", buf, 0xCu);
            }
          }
          close(v2);
        }
      }
    }
  }
  return MFMailDirectory___MailDir;
}

uint64_t MFMailDirectoryURL()
{
  if (MFMailDirectoryURL_onceToken != -1)
    dispatch_once(&MFMailDirectoryURL_onceToken, &__block_literal_global_8);
  return MFMailDirectoryURL___MailDirURL;
}

id MFSetUserAgent(id result)
{
  void *v1;

  if ((id)_userAgent != result)
  {
    v1 = result;

    result = v1;
    _userAgent = (uint64_t)result;
  }
  return result;
}

uint64_t MFUserAgent()
{
  return _userAgent;
}

uint64_t MFReadLoggingDefaults()
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "synchronize");
  return +[MFConnection readLoggingDefaults](MFConnection, "readLoggingDefaults");
}

id MFMessageFrameworkBundle()
{
  id result;

  result = (id)messageFrameworkBundle;
  if (!messageFrameworkBundle)
  {
    result = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MessageLegacy"));
    messageFrameworkBundle = (uint64_t)result;
  }
  return result;
}

uint64_t MFLookupLocalizedString(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  const __CFString *v3;

  if (a3)
    v3 = a3;
  else
    v3 = CFSTR("Message");
  return objc_msgSend(MFMessageFrameworkBundle(), "localizedStringForKey:value:table:", a1, &stru_1E81CBE50, v3);
}

uint64_t (*MFComparatorFunctionForSortOrder(uint64_t a1))()
{
  uint64_t (*v2)(void *, void *, unsigned __int8 *);
  uint64_t v3;
  uint64_t v4;
  int v5;

  if ((objc_msgSend(CFSTR("readstatus"), "isEqualToString:", a1) & 1) != 0)
  {
    v2 = _compareMsgsByReadStatus;
  }
  else
  {
    v3 = 0;
    while (1)
    {
      v4 = v3 + 16;
      if (v3 == 64)
        break;
      v5 = objc_msgSend(*(id *)((char *)&comparators + v3 + 16), "isEqualToString:", a1);
      v3 = v4;
      if (v5)
      {
        v2 = *(uint64_t (**)(void *, void *, unsigned __int8 *))((char *)&comparators + v4 + 8);
        goto LABEL_8;
      }
    }
    v2 = 0;
  }
LABEL_8:
  if (v2)
    return (uint64_t (*)())v2;
  else
    return _compareMsgsByDateReceived;
}

uint64_t _compareMsgsByReadStatus(void *a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  char v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  v6 = objc_msgSend(a1, "messageFlags");
  v7 = objc_msgSend(a2, "messageFlags");
  if (v6 == v7)
    return _compareMsgsByDate(a1, a2, a3);
  v9 = *a3;
  if ((v6 & 1) != 0 && (v7 & 1) == 0)
    goto LABEL_5;
  if ((v7 & 1) != 0 && (v6 & 1) == 0
    || (v12 = objc_msgSend(a1, "messageFlags"), v13 = objc_msgSend(a2, "messageFlags"), (v12 & 4) != 0)
    && (v13 & 4) == 0)
  {
LABEL_10:
    v10 = v9 == 0;
    v11 = -1;
LABEL_11:
    if (v10)
      return v11;
    else
      return -v11;
  }
  if ((v13 & 4) != 0 && (v12 & 4) == 0)
    goto LABEL_5;
  if ((v12 & 4) != 0)
    return _compareMsgsByDate(a1, a2, a3);
  v14 = objc_msgSend(a1, "messageFlags");
  v15 = objc_msgSend(a2, "messageFlags");
  if ((v14 & 0x100) != 0 && (v15 & 0x100) == 0)
    goto LABEL_10;
  if ((v15 & 0x100) != 0 && (v14 & 0x100) == 0)
  {
LABEL_5:
    v10 = v9 == 0;
    v11 = 1;
    goto LABEL_11;
  }
  if ((v14 & 0x100) != 0)
    return _compareMsgsByDate(a1, a2, a3);
  v16 = objc_msgSend(a1, "messageFlags");
  v17 = objc_msgSend(a2, "messageFlags");
  if ((v16 & 0x200) != 0 && (v17 & 0x200) == 0)
    goto LABEL_10;
  if ((v17 & 0x200) == 0)
    return _compareMsgsByDate(a1, a2, a3);
  result = v9 ? -1 : 1;
  if ((v16 & 0x200) != 0)
    return _compareMsgsByDate(a1, a2, a3);
  return result;
}

uint64_t _compareMsgsBySender(void *a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  uint64_t result;

  v6 = objc_msgSend(a1, "senderAddressComment");
  v7 = (void *)objc_msgSend(a2, "senderAddressComment");
  if ((void *)v6 == v7)
    return _compareMsgsByDate(a1, a2, a3);
  v8 = v7;
  if (v6 && v7)
  {
    if (*a3)
      v7 = (void *)v6;
    else
      v8 = (void *)v6;
    result = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v8);
    if (result)
      return result;
    return _compareMsgsByDate(a1, a2, a3);
  }
  v9 = 1;
  if (*a3)
    v9 = -1;
  v10 = -1;
  if (*a3)
    v10 = 1;
  if (v7)
    v11 = 1;
  else
    v11 = v6 == 0;
  if (v11)
    v10 = 0;
  if (v6)
    v12 = 1;
  else
    v12 = v7 == 0;
  if (v12)
    result = v10;
  else
    result = v9;
  if (!result)
    return _compareMsgsByDate(a1, a2, a3);
  return result;
}

uint64_t _compareMsgsByFlags(void *a1, void *a2, unsigned __int8 *a3)
{
  char v6;
  char v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_msgSend(a1, "messageFlags");
  v7 = objc_msgSend(a2, "messageFlags");
  v8 = *a3;
  if ((v6 & 0x10) == 0 && (v7 & 0x10) != 0)
  {
    if (*a3)
      return -1;
    else
      return 1;
  }
  if (*a3)
    v9 = 1;
  else
    v9 = -1;
  if ((v7 & 0x10) == 0 && (v6 & 0x10) != 0)
    return v9;
  v10 = objc_msgSend(a1, "priority");
  v11 = objc_msgSend(a2, "priority");
  v12 = 1;
  if (v8)
    v12 = -1;
  v13 = v11 <= v10 ? 0 : v9;
  v9 = v11 >= v10 ? v13 : v12;
  if (v9)
    return v9;
  return _compareMsgsByDate(a1, a2, a3);
}

uint64_t _compareMsgsByDate(void *a1, void *a2, unsigned __int8 *a3)
{
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *a3;
  if (a3[1])
  {
    objc_msgSend(a1, "dateReceivedAsTimeIntervalSince1970");
    v7 = v6;
    objc_msgSend(a2, "dateReceivedAsTimeIntervalSince1970");
  }
  else
  {
    objc_msgSend(a1, "dateSentAsTimeIntervalSince1970");
    v7 = v9;
    objc_msgSend(a2, "dateSentAsTimeIntervalSince1970");
  }
  if (v7 < v8)
  {
    v10 = v5 == 0;
    v11 = 1;
    goto LABEL_8;
  }
  if (v7 > v8)
  {
    v10 = v5 == 0;
    v11 = -1;
LABEL_8:
    if (v10)
      return v11;
    else
      return -v11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v13 = objc_msgSend(a1, "libraryID");
  v14 = objc_msgSend(a2, "libraryID");
  v15 = -1;
  if (v5)
    v15 = 1;
  if (v13 <= v14)
    v15 = 0;
  v16 = 1;
  if (v5)
    v16 = -1;
  if (v13 < v14)
    return v16;
  else
    return v15;
}

void _appendPartHeadersToConsumer(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  void *Value;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;

  v10 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D46110]), "init");
  Value = (void *)CFDictionaryGetValue(a3, a2);
  if ((objc_msgSend(CFSTR("multipart"), "isEqualToString:", objc_msgSend(a2, "type")) & 1) == 0
    && !objc_msgSend(Value, "length"))
  {
    objc_msgSend(a2, "range");
    if (v7)
    {
      objc_msgSend(a2, "range");
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = CFSTR("unknown");
      }
      else
      {
        objc_msgSend(a2, "range");
        v9 = (const __CFString *)EFStringWithUnsignedInteger();
      }
      objc_msgSend(v10, "setHeader:forKey:", v9, CFSTR("x-apple-content-length"));
    }
  }
  _appendHeadersToMessageHeaders(a1, a2, v10);
  if (objc_msgSend((id)objc_msgSend(v10, "encodedHeaders"), "length"))
    MFDataConsumerConsumeCompleteData();

}

void _appendPartDataToConsumer(uint64_t a1, const void *a2, uint64_t a3, const __CFDictionary *a4, uint64_t a5)
{
  void *Value;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  size_t v26;
  int v27;
  id v28;

  Value = (void *)CFDictionaryGetValue(a4, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)CFDictionaryGetValue(a4, Value);
    if (!v11)
      goto LABEL_9;
  }
  else
  {
    v11 = Value;
    Value = (void *)a2;
    if (!v11)
      goto LABEL_9;
  }
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend((id)objc_msgSend(Value, "contentTransferEncoding"), "isEqualToString:", CFSTR("base64")))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46050]), "initWithConsumer:", a3);
      objc_msgSend(v12, "setStandardLineBreak");
      objc_msgSend(v12, "setAllowSlash:", 1);
      objc_msgSend(v12, "setPadChar:", 61);
      MFDataConsumerConsumeCompleteData();
      objc_msgSend(v12, "done");

    }
    else
    {
      MFDataConsumerConsumeCompleteData();
    }
  }
LABEL_9:
  v13 = objc_msgSend(CFSTR("multipart"), "isEqualToString:", objc_msgSend(Value, "type"));
  v14 = objc_msgSend(Value, "firstChildPart");
  v15 = (void *)v14;
  v27 = v13;
  if ((v13 & 1) != 0 || v14)
  {
    if (v13
      && (v16 = (const char *)objc_msgSend((id)objc_msgSend(Value, "bodyParameterForKey:", CFSTR("boundary")), "ef_lossyDefaultCStringBytes")) != 0)
    {
      v17 = v16;
      v26 = strlen(v16);
      if (!v15)
      {
LABEL_34:
        v28 = objc_alloc_init(MEMORY[0x1E0D46100]);
        objc_msgSend(v28, "mf_appendCString:", "\n--");
        objc_msgSend(v28, "appendBytes:length:", v17, v26);
        objc_msgSend(v28, "mf_appendCString:", "--\n");
        MFDataConsumerConsumeCompleteData();

        return;
      }
      v24 = Value;
      v25 = v17;
      v18 = 0;
    }
    else
    {
      if (!v15)
        return;
      v24 = Value;
      v25 = 0;
      v26 = 0;
      v18 = 1;
    }
    v23 = *MEMORY[0x1E0D45F28];
    while (1)
    {
      v19 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v20 = (void *)CFDictionaryGetValue(a4, v15);
      if (!v20 || (v21 = v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        v21 = v15;
      if ((a5 & 1) != 0
        || v27 && (objc_msgSend(CFSTR("signed"), "isEqualToString:", objc_msgSend(v24, "subtype")) & 1) != 0
        || (objc_msgSend((id)objc_msgSend(v21, "type"), "isEqual:", CFSTR("multipart")) & 1) != 0
        || objc_msgSend((id)CFDictionaryGetValue(a4, v21), "length")
        || objc_msgSend(v21, "bodyParameterForKey:", v23))
      {
        if ((v18 & 1) == 0)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0D46100]);
          objc_msgSend(v22, "mf_appendCString:", "\n--");
          objc_msgSend(v22, "appendBytes:length:", v25, v26);
          objc_msgSend(v22, "appendBytes:length:", "\n", 1);
          MFDataConsumerConsumeCompleteData();

          _appendPartHeadersToConsumer(a1, v21, a4);
        }
        _appendPartDataToConsumer(a1, v21, a3, a4, a5);
      }
      if (v18)
        break;
      v15 = (void *)objc_msgSend(v15, "nextSiblingPart");
      objc_msgSend(v19, "drain");
      if (!v15)
      {
        v17 = v25;
        goto LABEL_34;
      }
    }
    objc_msgSend(v19, "drain");
  }
}

void sub_1C886CF54(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id _createPartAndDataForString(void *a1, void *a2, void *a3, __CFDictionary *a4)
{
  id v4;
  int v8;
  void *v9;
  char v10;
  uint64_t v11;

  v4 = a1;
  if (a1)
  {
    v8 = objc_msgSend(a3, "isEqualToString:", CFSTR("html"));
    if (v8 && objc_msgSend(v4, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
      v4 = (id)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("&nbsp;"));
    if (a2)
    {
      objc_msgSend(a2, "cfStringEncoding");
      v9 = (void *)MFCreateDataWithString();
    }
    else
    {
      v9 = 0;
    }
    if (v9)
      v10 = 1;
    else
      v10 = v8;
    if ((v10 & 1) == 0)
    {
      a2 = (void *)objc_msgSend(MEMORY[0x1E0D460E8], "charsetForEncoding:", 1536);
      objc_msgSend(a2, "cfStringEncoding");
      v9 = (void *)MFCreateDataWithString();
    }
    if (!v9)
    {
      if ((v8 & 1) == 0 && v4 && objc_msgSend(v4, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
        v4 = (id)objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
      a2 = (void *)objc_msgSend(v4, "mf_bestMimeCharsetForMessageDeliveryUsingSubtype:", a3);
      objc_msgSend(a2, "cfStringEncoding");
      v11 = MFCreateDataWithString();
      if (!v11)
        return 0;
      v9 = (void *)v11;
    }
    v4 = objc_alloc_init(MEMORY[0x1E0D460F0]);
    objc_msgSend(v4, "setType:", CFSTR("text"));
    objc_msgSend(v4, "setSubtype:", a3);
    objc_msgSend(v4, "setBodyParameter:forKey:", objc_msgSend(a2, "charsetName"), CFSTR("charset"));
    CFDictionarySetValue(a4, v4, v9);

  }
  return v4;
}

id _createOutgoingMessageFromTopLevelMimePart(uint64_t a1, id a2, void *a3, const __CFDictionary *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  id MimePartData;
  void *v14;
  const void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v34;
  id v35;
  id v36;
  _MFOutgoingMessageBody *OutgoingMessageBody;
  void *value;

  v8 = a3;
  if (!a3)
    v8 = objc_alloc_init(MEMORY[0x1E0D46110]);
  OutgoingMessageBody = _makeOutgoingMessageBody(a1);
  v9 = -[MFMessageBody message](OutgoingMessageBody, "message");
  v10 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_msgSend(v9, "setMessageFlags:", 1);
  objc_msgSend(v9, "setMutableHeaders:", v8);
  v11 = (void *)objc_msgSend(a3, "copyAddressListForResentFrom");
  if (!objc_msgSend(v11, "count"))
  {

    v11 = (void *)objc_msgSend(a3, "copyAddressListForSender");
  }
  if (objc_msgSend(v11, "count"))
  {
    v12 = (const __CFString *)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "mf_uncommentedAddress");
    if (!a3)
      goto LABEL_20;
  }
  else
  {
    v12 = &stru_1E81CBE50;
    if (!a3)
      goto LABEL_20;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ShouldSign")), "intValue"))
  {
    MimePartData = _createMimePartData(a1, a2, a4);
    if (MimePartData && (objc_msgSend(v10, "shouldCancel") & 1) == 0)
    {
      v34 = v10;
      value = 0;
      v14 = (void *)objc_msgSend(a2, "newSignedPartWithData:sender:compositionSpecification:signatureData:", MimePartData, v12, *(_QWORD *)(a1 + 32), &value);
      v15 = (const void *)objc_msgSend((id)objc_msgSend(v14, "firstChildPart"), "nextSiblingPart");
      if (value && v15)
        CFDictionarySetValue(a4, v15, value);
      a2 = v14;
      if (!a2)
      {

        v9 = 0;
      }
      v10 = v34;
    }
    else
    {

      v9 = 0;
    }

  }
LABEL_20:
  if (!v9)
  {

    return v9;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ShouldEncrypt")), "intValue"))
  {
    v16 = _createMimePartData(a1, a2, a4);
    if (v16 && (objc_msgSend(v10, "shouldCancel") & 1) == 0)
    {
      v35 = v10;
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      value = 0;
      objc_msgSend(v8, "appendHeaderData:andRecipients:", 0, v17);
      v18 = (void *)objc_msgSend(v17, "arrayByApplyingSelector:", sel_mf_uncommentedAddress);
      if (v11 && objc_msgSend(v18, "indexOfObject:", v12) == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v17, "addObjectsFromArray:", v11);
      v19 = (void *)objc_msgSend(a2, "newEncryptedPartWithData:compositionSpecification:encryptedData:", v16, *(_QWORD *)(a1 + 32), &value);
      a2 = v19;
      if (value && v19)
      {
        CFDictionarySetValue(a4, v19, value);
      }
      else
      {

        v9 = 0;
      }
      v10 = v35;
    }
    else
    {

      v9 = 0;
    }

  }
  if (!a3 || !v9)
  {
    if (!v9)
      return v9;
    goto LABEL_57;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v21 = (void *)objc_msgSend(a3, "copyAddressListForResentFrom");
  v22 = objc_msgSend(v21, "count");
  if (!v22)
  {

    v21 = (void *)objc_msgSend(a3, "copyAddressListForSender");
  }
  v36 = v10;
  if (objc_msgSend(v21, "count"))
  {
    v23 = (__CFString *)objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", 0), "mf_uncommentedAddress");

    if (!v23)
      goto LABEL_46;
  }
  else
  {

    v23 = &stru_1E81CBE50;
  }
  v24 = -[__CFString rangeOfString:options:](v23, "rangeOfString:options:", CFSTR("@"), 4);
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_46:
    v26 = 0;
    goto LABEL_48;
  }
  v26 = -[__CFString substringFromIndex:](v23, "substringFromIndex:", v24 + v25);
LABEL_48:
  v27 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "mf_messageIDStringWithDomainHint:", v26);
  if (v27)
  {
    v28 = v27;
    if (objc_msgSend(v27, "length"))
    {
      v29 = *MEMORY[0x1E0D1E5B0];
      if (v22 && objc_msgSend((id)objc_msgSend(v8, "firstHeaderForKey:", *MEMORY[0x1E0D1E5B0]), "length"))
        v29 = *MEMORY[0x1E0D1E5E8];
      objc_msgSend(v8, "setHeader:forKey:", v28, v29);
    }
  }
  v30 = *MEMORY[0x1E0D1E5A8];
  if (!objc_msgSend(a3, "firstHeaderForKey:", *MEMORY[0x1E0D1E5A8]))
    objc_msgSend(a3, "setHeader:forKey:", objc_msgSend(MEMORY[0x1E0D460E0], "versionString"), v30);
  objc_msgSend(v20, "drain");
  v10 = v36;
LABEL_57:
  v31 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (_makeMimeHeadersConsistent(a1, a2, a4) && (objc_msgSend(v10, "shouldCancel") & 1) == 0)
  {
    _appendHeadersToMessageHeaders(a1, a2, v8);
    _appendPartDataToConsumer(a1, a2, (uint64_t)OutgoingMessageBody, a4, 0);
    if ((!-[_MFOutgoingMessageBody count](OutgoingMessageBody, "count")
       || !-[_MFOutgoingMessageBody isLastCharacterNewLine](OutgoingMessageBody, "isLastCharacterNewLine"))
      && (*(_BYTE *)(a1 + 16) & 2) == 0)
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "\n", 1, 0);
      MFDataConsumerConsumeCompleteData();

    }
    -[_MFOutgoingMessageBody done](OutgoingMessageBody, "done");
  }
  else
  {

    v9 = 0;
  }
  objc_msgSend(v31, "drain");
  return v9;
}

void sub_1C886D9DC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id _createPlainTextPart(void *a1, __CFDictionary *a2)
{
  id PartAndDataForString;
  MFError *v6;
  char v7;
  void *v8;

  PartAndDataForString = (id)objc_msgSend((id)objc_msgSend(a1, "string"), "mf_bestMimeCharsetUsingHint:", 0xFFFFFFFFLL);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("UseFormatFlowedForWrapping")))return _createPartAndDataForString((void *)objc_msgSend(a1, "quotedString:", objc_msgSend(PartAndDataForString, "cfStringEncoding")), PartAndDataForString, CFSTR("plain"), a2);
  v8 = 0;
  v7 = 0;
  objc_msgSend(a1, "getFormatFlowedString:insertedTrailingSpaces:encoding:", &v8, &v7, objc_msgSend(PartAndDataForString, "cfStringEncoding"));
  if (v8)
  {
    PartAndDataForString = _createPartAndDataForString(v8, PartAndDataForString, CFSTR("plain"), a2);
    objc_msgSend(PartAndDataForString, "setBodyParameter:forKey:", CFSTR("flowed"), CFSTR("format"));
    if (v7)
      objc_msgSend(PartAndDataForString, "setBodyParameter:forKey:", CFSTR("yes"), CFSTR("delsp"));
  }
  else if (PartAndDataForString)
  {
    v6 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1038, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("BAD_CHARSET_FORMAT"), (uint64_t)CFSTR("Some characters in your message could not be converted to the “%@” text encoding. Please choose a different entry from the “Text Encoding” menu."), CFSTR("Delayed")), objc_msgSend(PartAndDataForString, "displayName")));
    -[MFError setShortDescription:](v6, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("BAD_CHARSET_TITLE"), (uint64_t)CFSTR("Invalid Text Encoding"), CFSTR("Delayed")));
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v6);
    return 0;
  }
  return PartAndDataForString;
}

void *_createPartForMFAttachment(_BYTE *a1, void *a2, int a3, __CFDictionary *a4)
{
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("inline");
  if ((objc_msgSend(a2, "isImageFile") & 1) == 0
    && !objc_msgSend((id)objc_msgSend(a2, "metadataValueForKey:", CFSTR("MFAttachmentIsSinglePagePDFKey")), "BOOLValue"))
  {
    v8 = CFSTR("attachment");
  }
  v9 = objc_msgSend(a2, "fileName");
  if (v9)
  {
    if ((MFStringCanBeConvertedLosslessly() & 1) == 0)
    {
      v10 = MFCreateDataWithString();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 1);
        v9 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), CFSTR("_"));

      }
    }
  }
  v13 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D460F0]), "init");
  objc_msgSend(v13, "setDispositionParameter:forKey:", objc_msgSend(a2, "fileName"), CFSTR("filename"));
  objc_msgSend(v13, "setDisposition:", v8);
  if (objc_msgSend(a1, "shouldWriteAttachmentPlaceholders")
    && objc_msgSend(a2, "isPlaceholder"))
  {
    v14 = (void *)objc_msgSend(a2, "fetchPlaceholderData");
  }
  else
  {
    v14 = (void *)objc_msgSend(a2, "fetchDataSynchronously:stripPrivateMetadata:", 0, 1);
  }
  v15 = v14;
  if (objc_msgSend(v14, "length"))
  {
    if ((a1[16] & 4) != 0)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), objc_msgSend(v15, "length"));
      objc_msgSend(v13, "setDispositionParameter:forKey:", v16, CFSTR("size"));

    }
    v17 = (void *)objc_msgSend(a2, "fileAttributes");
    v18 = (void *)objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CB2AA8]);
    CFDictionarySetValue(a4, v13, v15);
    v19 = (void *)objc_msgSend(a2, "fileName");
    v20 = objc_alloc_init(MEMORY[0x1E0D46148]);
    objc_msgSend(v20, "setMimeType:", objc_msgSend(a2, "mimeType"));
    objc_msgSend(v20, "setPathExtension:", objc_msgSend(v19, "pathExtension"));
    objc_msgSend(v20, "setFilename:", v19);
    if (objc_msgSend(v20, "osType") == 1061109567)
      objc_msgSend(v20, "setOsType:", 0);
    v21 = objc_msgSend(v20, "mimeType");
    if (objc_msgSend(&stru_1E81CBE50, "isEqualToString:", objc_msgSend(v20, "pathExtension")))
      objc_msgSend(v20, "setPathExtension:", 0);
    v22 = objc_msgSend(v20, "pathExtension");
    if (v22)
      v23 = v21 == 0;
    else
      v23 = (v21 == 0) | 2;
    if (v23)
    {
      v24 = v22;
      MFGetTypeInfo();
      if (!v24 || v21)
      {
        if (objc_msgSend(v20, "pathExtension"))
          objc_msgSend(a2, "setFileName:", objc_msgSend(v19, "stringByAppendingPathExtension:", objc_msgSend(v20, "pathExtension")));
      }
    }
    v25 = (__CFString *)objc_msgSend(v20, "mimeType");
    if (v25
      && (v25 = (__CFString *)objc_msgSend((id)objc_msgSend(v20, "mimeType"), "componentsSeparatedByString:", CFSTR("/"))) != 0)
    {
      v26 = v25;
      if (-[__CFString count](v25, "count") == 2)
      {
        v27 = -[__CFString objectAtIndex:](v26, "objectAtIndex:", 0);
        v25 = (__CFString *)-[__CFString objectAtIndex:](v26, "objectAtIndex:", 1);
      }
      else
      {
        v27 = 0;
        v25 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    if (v27)
      v29 = (const __CFString *)v27;
    else
      v29 = CFSTR("application");
    if (v27)
      v30 = v25;
    else
      v30 = CFSTR("octet-stream");
    objc_msgSend(v13, "setType:", v29);
    objc_msgSend(v13, "setSubtype:", v30);

    if (v18)
      objc_msgSend(v13, "setBodyParameter:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#o"), objc_msgSend(v18, "intValue")), CFSTR("x-unix-mode"));
    v31 = objc_msgSend(a2, "contentID");
    if (v31)
      objc_msgSend(v13, "setBodyParameter:forKey:", v31, *MEMORY[0x1E0D45F28]);
    objc_msgSend(v13, "setBodyParameter:forKey:", v9, CFSTR("name"));
    if (v13)
    {
LABEL_48:
      if (a3 && (objc_msgSend((id)objc_msgSend(v13, "type"), "isEqualToString:", CFSTR("multipart")) & 1) == 0)
        objc_msgSend(v13, "setContentID:", objc_msgSend(a2, "contentID"));
    }
  }
  else
  {
    v28 = MFLogGeneral();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = objc_msgSend(a2, "fileName");
      _os_log_impl(&dword_1C8839000, v28, OS_LOG_TYPE_INFO, "Unable to encode %@ as a MIME attachment", buf, 0xCu);
    }
    CFDictionarySetValue(a4, v13, (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "data"));
    if (v13)
      goto LABEL_48;
  }
  return v13;
}

void sub_1C886E950(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 buf)
{
  id v17;
  NSObject *v18;
  uint64_t v19;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v17, "reason");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1C8839000, v18, OS_LOG_TYPE_INFO, "Exception raised during message encoding: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1C886E910);
  }
  _Unwind_Resume(a1);
}

void *_createPartForFileWrapper(uint64_t a1, void *a2, __CFDictionary *a3)
{
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a2, "preferredFilename");
  v25 = v6;
  if (!v6)
    return 0;
  v7 = v6;
  if (objc_msgSend(a2, "isImageFile"))
    v8 = CFSTR("inline");
  else
    v8 = CFSTR("attachment");
  v9 = (uint64_t)v7;
  if ((MFStringCanBeConvertedLosslessly() & 1) == 0)
  {
    v10 = MFCreateDataWithString();
    v9 = (uint64_t)v7;
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 1);
      v9 = objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), CFSTR("_"));

    }
  }
  v13 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D460F0]), "init");
  objc_msgSend(v13, "setDispositionParameter:forKey:", v7, CFSTR("filename"));
  objc_msgSend(v13, "setDisposition:", v8);
  if (objc_msgSend(a2, "isSymbolicLink"))
  {
    v14 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D460F0]), "init");
    v15 = (void *)objc_opt_new();
    _setMimeTypeFromWrapper(v14, &v25, a2);
    _appendHeadersToMessageHeaders(a1, v14, v15);
    CFDictionarySetValue(a3, v13, (const void *)objc_msgSend(v15, "encodedHeaders"));

    objc_msgSend(v13, "setType:", CFSTR("message"));
    objc_msgSend(v13, "setSubtype:", CFSTR("external-body"));
    objc_msgSend(v13, "setBodyParameter:forKey:", CFSTR("local-file"), CFSTR("access-type"));
    v16 = objc_msgSend(a2, "symbolicLinkDestination");
    v17 = v13;
LABEL_21:
    objc_msgSend(v17, "setBodyParameter:forKey:", v16, CFSTR("name"));
    return v13;
  }
  if (objc_msgSend(a2, "isRegularFile"))
  {
    v18 = (void *)objc_msgSend(a2, "regularFileContents");
    if (!v18)
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    if ((*(_BYTE *)(a1 + 16) & 4) != 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), objc_msgSend(v18, "length"), v25);
      objc_msgSend(v13, "setDispositionParameter:forKey:", v19, CFSTR("size"));

    }
    v20 = (void *)objc_msgSend(a2, "fileAttributes");
    v21 = (void *)objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CB2AA8]);
    CFDictionarySetValue(a3, v13, v18);
    _setMimeTypeFromWrapper(v13, &v25, a2);
    if (v21)
      objc_msgSend(v13, "setBodyParameter:forKey:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%#o"), objc_msgSend(v21, "intValue")), CFSTR("x-unix-mode"));
    v22 = objc_msgSend(a2, "URL");
    if (v22)
      objc_msgSend(v13, "setBodyParameter:forKey:", v22, *MEMORY[0x1E0D45F28]);
    v17 = v13;
    v16 = v9;
    goto LABEL_21;
  }
  v23 = MFLogGeneral();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1C8839000, v23, OS_LOG_TYPE_INFO, "Unable to encode %@ as a MIME attachment", buf, 0xCu);
  }
  CFDictionarySetValue(a3, v13, (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "data"));
  return v13;
}

void _setMimeTypeFromWrapper(void *a1, id *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;

  v6 = *a2;
  v17 = objc_alloc_init(MEMORY[0x1E0D46148]);
  objc_msgSend(v17, "setMimeType:", objc_msgSend(a3, "mimeType"));
  objc_msgSend(v17, "setPathExtension:", objc_msgSend(v6, "pathExtension"));
  objc_msgSend(v17, "setFilename:", v6);
  if (objc_msgSend(v17, "osType") == 1061109567)
    objc_msgSend(v17, "setOsType:", 0);
  v7 = objc_msgSend(v17, "mimeType");
  if (objc_msgSend(&stru_1E81CBE50, "isEqualToString:", objc_msgSend(v17, "pathExtension")))
    objc_msgSend(v17, "setPathExtension:", 0);
  v8 = objc_msgSend(v17, "pathExtension");
  if (v8)
    v9 = v7 == 0;
  else
    v9 = (v7 == 0) | 2;
  if (v9)
  {
    v10 = v8;
    MFGetTypeInfo();
    if (!v10 || v7)
    {
      if (objc_msgSend(v17, "pathExtension"))
      {
        v11 = objc_msgSend(*a2, "stringByAppendingPathExtension:", objc_msgSend(v17, "pathExtension"));
        *a2 = (id)v11;
        objc_msgSend(a3, "setPreferredFilename:", v11);
        objc_msgSend(a3, "setFilename:", *a2);
      }
    }
  }
  v12 = (__CFString *)objc_msgSend(v17, "mimeType");
  if (v12)
  {
    v12 = (__CFString *)objc_msgSend((id)objc_msgSend(v17, "mimeType"), "componentsSeparatedByString:", CFSTR("/"));
    if (v12)
    {
      v13 = v12;
      if (-[__CFString count](v12, "count") == 2)
      {
        v14 = -[__CFString objectAtIndex:](v13, "objectAtIndex:", 0);
        v12 = (__CFString *)-[__CFString objectAtIndex:](v13, "objectAtIndex:", 1);
        goto LABEL_19;
      }
      v12 = 0;
    }
  }
  v14 = 0;
LABEL_19:
  if (v14)
    v15 = v12;
  else
    v15 = CFSTR("octet-stream");
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("application");
  objc_msgSend(a1, "setType:", v16);
  objc_msgSend(a1, "setSubtype:", v15);

}

uint64_t _appendHeadersToMessageHeaders(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  char v50[16];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 24), "messageWriter:willGenerateHeadersForMimePart:", a1, a2);
  if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", CFSTR("multipart"))
    && !objc_msgSend(a2, "bodyParameterForKey:", CFSTR("boundary")))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D460E0], "copyNewMimeBoundary");
    objc_msgSend(a2, "setBodyParameter:forKey:", v6, CFSTR("boundary"));

  }
  v7 = objc_msgSend(a2, "type");
  v8 = objc_msgSend(a2, "subtype");
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v10 = &stru_1E81CBE50;
  if (v7)
    v11 = (const __CFString *)v7;
  else
    v11 = &stru_1E81CBE50;
  if (v8)
    v10 = (const __CFString *)v8;
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@/%@"), v11, v10);
  v13 = (void *)objc_msgSend(a2, "dispositionParameterForKey:", CFSTR("filename"));
  if (v13)
  {
    if (objc_msgSend(a2, "bodyParameterForKey:", CFSTR("name")))
    {
LABEL_13:
      v13 = 0;
      goto LABEL_19;
    }
    v14 = (void *)objc_msgSend(v13, "mutableCopyWithZone:", 0);
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v14, "length"));
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\""), CFSTR("\\\""), 0, 0, objc_msgSend(v14, "length"));
    objc_msgSend(v14, "insertString:atIndex:", CFSTR("\""), 0);
    objc_msgSend(v14, "appendString:", CFSTR("\""));
    v15 = (void *)MFCreateDataWithString();
    if (v15
      || (v15 = (void *)MFCreateDataWithString()) != 0
      || (CFStringGetSystemEncoding(), (v15 = (void *)MFCreateDataWithString()) != 0))
    {

    }
    else
    {
      CFStringGetSystemEncoding();
      v15 = (void *)MFCreateDataWithString();

      if (!v15)
        goto LABEL_13;
    }
    strcpy(v50, ";\n\tname=");
    v13 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v15, "length") + 8);
    objc_msgSend(v13, "appendBytes:length:", v50, 8);
    objc_msgSend(v13, "appendData:", v15);

  }
LABEL_19:
  v16 = (void *)objc_msgSend(a2, "bodyParameterKeys");
  v17 = objc_msgSend(v16, "count");
  if (v13 || v17)
  {
    v18 = (void *)objc_msgSend((id)objc_msgSend(v12, "dataUsingEncoding:allowLossyConversion:", 1, 1), "mutableCopyWithZone:", 0);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(v16);
          objc_msgSend(v18, "mf_appendRFC2231CompliantValue:forKey:", objc_msgSend(a2, "bodyParameterForKey:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v20);
    }
    if (v13)
    {
      objc_msgSend(v18, "appendData:", v13);

    }
    objc_msgSend(a3, "setHeader:forKey:", v18, *MEMORY[0x1E0D1E558]);

  }
  else
  {
    objc_msgSend(a3, "setHeader:forKey:", v12, *MEMORY[0x1E0D1E558]);
  }

  v23 = (void *)objc_msgSend(a2, "disposition");
  v24 = (void *)objc_msgSend(a2, "dispositionParameterKeys");
  v25 = objc_msgSend(v24, "count");
  if (v23 || v25)
  {
    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D46100]), "init");
      if (objc_msgSend(v23, "length"))
        objc_msgSend(v26, "appendData:", objc_msgSend(v23, "dataUsingEncoding:allowLossyConversion:", 1, 1));
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v41 != v29)
              objc_enumerationMutation(v24);
            objc_msgSend(v26, "mf_appendRFC2231CompliantValue:forKey:", objc_msgSend(a2, "dispositionParameterForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
          }
          v28 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v28);
      }
      objc_msgSend(a3, "setHeader:forKey:", v26, *MEMORY[0x1E0D1E530]);

    }
    else
    {
      objc_msgSend(a3, "setHeader:forKey:", v23, *MEMORY[0x1E0D1E530]);
    }
  }
  v31 = objc_msgSend(a2, "contentTransferEncoding");
  if (v31)
    objc_msgSend(a3, "setHeader:forKey:", v31, *MEMORY[0x1E0D1E550]);
  v32 = objc_msgSend(a2, "contentDescription");
  if (v32)
    objc_msgSend(a3, "setHeader:forKey:", v32, *MEMORY[0x1E0D1E528]);
  v33 = (void *)objc_msgSend(a2, "contentID");
  if (v33)
  {
    v34 = (void *)objc_msgSend(v33, "mutableCopyWithZone:", 0);
    objc_msgSend(a3, "setHeader:forKey:", v34, *MEMORY[0x1E0D1E538]);

  }
  v35 = (void *)objc_msgSend(a2, "languages");
  if (v35)
  {
    v36 = v35;
    if (objc_msgSend(v35, "count"))
    {
      v37 = objc_msgSend(v36, "componentsJoinedByString:", CFSTR(" "));
      objc_msgSend(a3, "setHeader:forKey:", v37, *MEMORY[0x1E0D1E540]);
    }
  }
  v38 = objc_msgSend(a2, "contentLocation");
  if (v38)
    objc_msgSend(a3, "setHeader:forKey:", v38, *MEMORY[0x1E0D1E548]);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 24), "messageWriter:willEncodeHeaders:forMimePart:", a1, a3, a2);
  return result;
}

_MFOutgoingMessageBody *_makeOutgoingMessageBody(uint64_t a1)
{
  _MFOutgoingMessageBody *v2;
  id v3;

  v2 = objc_alloc_init(_MFOutgoingMessageBody);
  v3 = objc_alloc_init(*(Class *)(a1 + 8));
  -[MFMessageBody setMessage:](v2, "setMessage:", v3);
  objc_msgSend(v3, "setMessageBody:", v2);
  return v2;
}

id _createMimePartData(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  _MFOutgoingMessageBody *OutgoingMessageBody;
  id v7;
  id v8;
  id v9;
  id v10;

  OutgoingMessageBody = _makeOutgoingMessageBody(a1);
  v7 = -[MFMessageBody message](OutgoingMessageBody, "message");
  v8 = objc_alloc_init(MEMORY[0x1E0D46110]);
  v9 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_msgSend(v7, "setMutableHeaders:", v8);
  if (_makeMimeHeadersConsistent(a1, a2, a3) && (objc_msgSend(v9, "shouldCancel") & 1) == 0)
  {
    _appendHeadersToMessageHeaders(a1, a2, v8);
    _appendPartDataToConsumer(a1, a2, (uint64_t)OutgoingMessageBody, a3, 0);
    -[_MFOutgoingMessageBody done](OutgoingMessageBody, "done");
    v10 = (id)objc_msgSend(v7, "messageData");
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v7, "setMessageBody:", 0);
  return v10;
}

uint64_t _makeMimeHeadersConsistent(uint64_t a1, void *a2, const __CFDictionary *a3)
{
  void *Value;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint64_t result;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned __int8 *v30;
  unsigned int v31;
  const __CFString *v33;
  unsigned __int8 *v34;
  BOOL v35;
  BOOL v37;
  unsigned int v38;
  unsigned int v39;
  BOOL v40;
  char v41;
  int v42;
  uint64_t v43;
  const void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  void *v51;
  uint64_t v52;
  int v53;
  void *v54;
  unint64_t v55;
  char v56;
  void *v57;
  int v58;
  unsigned int v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  Value = (void *)CFDictionaryGetValue(a3, a2);
  v6 = (void *)objc_msgSend(a2, "type");
  if (objc_msgSend(CFSTR("multipart"), "isEqualToString:", v6))
  {
    v61 = a2;
    v7 = (void *)objc_msgSend(a2, "subparts");
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v65;
LABEL_4:
      v12 = 0;
      while (1)
      {
        v13 = (__CFString *)v10;
        if (*(_QWORD *)v65 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v12);
        result = _makeMimeHeadersConsistent(a1, v14, a3);
        if (!(_DWORD)result)
          return result;
        v16 = (void *)objc_msgSend(v14, "contentTransferEncoding");
        v10 = CFSTR("binary");
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("binary")) & 1) == 0)
        {
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("8bit")))
          {
            if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("binary")))
              v10 = v13;
            else
              v10 = CFSTR("8bit");
          }
          else
          {
            v10 = v13;
          }
        }
        if (v9 == ++v12)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_25;
        }
      }
    }
    v10 = 0;
LABEL_25:
    if (v10)
      v22 = v10;
    else
      v22 = CFSTR("7bit");
    v23 = v61;
LABEL_30:
    objc_msgSend(v23, "setContentTransferEncoding:", v22);
    return 1;
  }
  if (!Value)
  {
    v22 = CFSTR("7bit");
    v23 = a2;
    goto LABEL_30;
  }
  if (objc_msgSend(a2, "contentTransferEncoding"))
    return 1;
  v17 = objc_msgSend(a2, "isReadableText");
  v18 = objc_msgSend(Value, "length");
  v60 = v17;
  if (v17)
    v19 = 2;
  else
    v19 = 6;
  v58 = v19;
  v20 = objc_msgSend(Value, "bytes");
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("message")) & 1) != 0)
    LOBYTE(v21) = 1;
  else
    v21 = (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
  v24 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  if (objc_msgSend(v24, "canBeCancelled"))
    v25 = v24;
  else
    v25 = 0;
  v62 = v25;
  if (v18 < 1)
  {
    v43 = 0;
    goto LABEL_104;
  }
  v57 = v6;
  v54 = Value;
  v55 = v18;
  v59 = 0;
  v26 = 0;
  v56 = 0;
  v27 = v20 + v18;
  v28 = 1;
  v29 = 1;
  v30 = (unsigned __int8 *)v20;
  do
  {
    v31 = *v30;
    if (v31 <= 0xD && ((1 << v31) & 0x2401) != 0)
      v29 = 0;
    if (v31 == 10)
    {
      v33 = 0;
      v34 = &v30[~v20];
      if (v26 > (uint64_t)v34)
        v34 = (unsigned __int8 *)v26;
      if ((unint64_t)v30 > v20)
        v26 = (uint64_t)v34;
      v20 = (unint64_t)(v30 + 1);
    }
    else
    {
      v35 = v60;
      if (v31 != 27)
        v35 = 0;
      if (v31 == 9 || v31 > 0x1F)
        v37 = (v31 & 0x80u) == 0;
      else
        v37 = v35;
      if (v37)
      {
        v33 = 0;
        if (v30 == (unsigned __int8 *)v20 && (unint64_t)(v30 + 5) < v27)
        {
          if (!strncmp("From ", (const char *)v20, 5uLL))
          {
            LOBYTE(v21) = 0;
            v33 = 0;
            v56 = 1;
            v26 = 998;
          }
          else
          {
            v33 = 0;
          }
          v25 = v62;
        }
      }
      else
      {
        v38 = v59 + v58;
        v39 = *(unsigned __int8 *)(a1 + 16);
        v59 += v58;
        if ((v39 & 3) != 0)
        {
          v33 = 0;
        }
        else
        {
          if ((v21 & 1) != 0)
          {
            v33 = 0;
            ++v30;
            LOBYTE(v21) = 1;
            goto LABEL_81;
          }
          LOBYTE(v21) = 0;
          if (((v55 > v38) & (v39 >> 3)) != 0)
            v33 = 0;
          else
            v33 = CFSTR("base64");
        }
      }
    }
    v40 = (uint64_t)&(++v30)[-v20] < 999 && v26 < 999;
    if (!v40 && (v21 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 8) != 0
        && (v41 = objc_msgSend(v57, "isEqualToString:", CFSTR("text")), v25 = v62, (v41 & 1) != 0))
      {
        LOBYTE(v21) = 0;
      }
      else
      {
        LOBYTE(v21) = 0;
        v33 = CFSTR("base64");
      }
    }
LABEL_81:
    if (v25)
    {
      v42 = objc_msgSend(v25, "shouldCancel");
      v25 = v62;
      if (v42)
        v28 = 0;
    }
  }
  while (!v33 && (unint64_t)v30 < v27 && (v28 & 1) != 0);
  if ((v28 & 1) == 0)
    return 0;
  v43 = ~v20 + v27;
  if (v26 > v43)
    v43 = v26;
  if (v27 <= v20)
    v43 = v26;
  Value = v54;
  if (v33)
    goto LABEL_109;
  if (v56 & 1 | (v43 > 997))
    goto LABEL_99;
  if (!v59)
  {
LABEL_104:
    if (v43 >= 77
      && objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", CFSTR("text"))
      && objc_msgSend((id)objc_msgSend(a2, "subtype"), "isEqualToString:", CFSTR("plain"))
      && !objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("UseFormatFlowedForWrapping")))
    {
      goto LABEL_128;
    }
    v33 = CFSTR("7bit");
    goto LABEL_109;
  }
  if ((v29 & 1) != 0)
    v33 = CFSTR("8bit");
  else
    v33 = 0;
  if ((v29 & 1 & ((*(_BYTE *)(a1 + 16) & 3) != 0)) == 0)
  {
LABEL_99:
    if (v56 & 1 | ((v21 & 1) == 0))
    {
      if ((*(_BYTE *)(a1 + 16) & 8) == 0 || objc_msgSend(v54, "length") <= (unint64_t)v59)
      {
        v33 = CFSTR("base64");
        goto LABEL_109;
      }
LABEL_128:
      v33 = CFSTR("quoted-printable");
    }
    else
    {
      v33 = CFSTR("binary");
    }
  }
LABEL_109:
  objc_msgSend(a2, "setContentTransferEncoding:", v33, v54);
  if (objc_msgSend(CFSTR("base64"), "isEqualToString:", v33))
  {
    if (v60
      && (objc_msgSend((id)objc_msgSend(a2, "disposition"), "isEqual:", CFSTR("attachment")) & 1) == 0
      && objc_msgSend(Value, "length"))
    {
      v44 = (const void *)objc_msgSend(Value, "mf_dataByConvertingUnixNewlinesToNetwork");
      goto LABEL_122;
    }
LABEL_121:
    v44 = 0;
    goto LABEL_122;
  }
  if (!objc_msgSend(CFSTR("quoted-printable"), "isEqualToString:", v33))
    goto LABEL_121;
  v45 = objc_alloc_init(MEMORY[0x1E0D46068]);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46130]), "initWithConsumer:", v45);
  objc_msgSend(v46, "setForTextPart:", v60);
  v47 = objc_msgSend(Value, "length");
  v48 = objc_msgSend(Value, "bytes");
  v49 = 0;
  v50 = 0;
  do
  {
    if (v62 && (objc_msgSend(v62, "shouldCancel") & 1) != 0)
      break;
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v48 + v49, v47 - v49, 0);
    v52 = objc_msgSend(v46, "appendData:", v51);

    if (v52 < 0)
      break;
    v53 = v50 && v52 == 0;
    v49 += v52;
    v50 = v52 == 0;
  }
  while (v53 != 1);
  objc_msgSend(v46, "done");
  objc_msgSend(v45, "done");
  v44 = (const void *)objc_msgSend(v45, "data");

LABEL_122:
  if (v62 && (objc_msgSend(v62, "shouldCancel") & 1) != 0)
    return 0;
  if (v44)
    CFDictionarySetValue(a3, a2, v44);
  return 1;
}

void sub_1C8870684(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_publicDescription");
}

void sub_1C88713C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *_BKSApplicationStateGetDescription(int a1)
{
  const __CFString *result;
  const __CFString *v4;

  result = 0;
  switch(a1)
  {
    case 0:
      result = CFSTR("Unknown");
      break;
    case 1:
      result = CFSTR("Terminated");
      break;
    case 2:
      result = CFSTR("Background Task Suspended");
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      result = CFSTR("Background Running");
      break;
    case 8:
      result = CFSTR("Foreground Running");
      break;
    default:
      v4 = CFSTR("Foreground Running Obscured");
      if (a1 != 32)
        v4 = 0;
      if (a1 == 16)
        result = CFSTR("Process Server");
      else
        result = v4;
      break;
  }
  return result;
}

id EFPromiseAttachmentDataHandler(uint64_t a1, uint64_t a2)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __EFPromiseAttachmentDataHandler_block_invoke;
  v3[3] = &unk_1E81CAB98;
  v3[4] = a2;
  v3[5] = a1;
  return (id)objc_msgSend(v3, "copy");
}

const __CFData *_stripPrivateFileMetadata(const __CFData *a1)
{
  const __CFData *v1;
  CGImageSource *v2;
  CGImageSource *v3;
  const CGImageMetadata *v4;
  const CGImageMetadata *v5;
  CGMutableImageMetadataRef MutableCopy;
  CGMutableImageMetadataRef v7;
  __CFData *v8;
  const __CFString *Type;
  size_t Count;
  CGImageDestination *v11;
  const __CFDictionary *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  void *values;
  void *keys[2];

  v1 = a1;
  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = CGImageSourceCreateWithData(a1, 0);
  if (v2)
  {
    v3 = v2;
    v4 = CGImageSourceCopyMetadataAtIndex(v2, 0, 0);
    if (v4)
    {
      v5 = v4;
      MutableCopy = CGImageMetadataCreateMutableCopy(v4);
      if (MutableCopy)
      {
        v7 = MutableCopy;
        v15 = 0;
        v16 = &v15;
        v17 = 0x2020000000;
        v18 = 0;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = ___stripPrivateFileMetadata_block_invoke;
        v14[3] = &unk_1E81CABC0;
        v14[5] = &v15;
        v14[6] = MutableCopy;
        v14[4] = &unk_1E81EA220;
        CGImageMetadataEnumerateTagsUsingBlock(v5, 0, 0, v14);
        if (*((_BYTE *)v16 + 24))
        {
          v8 = (__CFData *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
          Type = CGImageSourceGetType(v3);
          Count = CGImageSourceGetCount(v3);
          v11 = CGImageDestinationCreateWithData(v8, Type, Count, 0);
          if (v11)
          {
            keys[0] = *(void **)MEMORY[0x1E0CBC798];
            values = v7;
            v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
            if (v12)
            {
              if (CGImageDestinationCopyImageSource(v11, v3, v12, 0))
                v1 = v8;
              CFRelease(v12);
            }
            CFRelease(v11);
          }
        }
        CFRelease(v7);
        _Block_object_dispose(&v15, 8);
      }
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  return v1;
}

void sub_1C8872224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___stripPrivateFileMetadata_block_invoke(uint64_t a1, const __CFString *a2, CGImageMetadataTagRef tag)
{
  CFStringRef v6;
  CFStringRef v7;
  uint64_t v8;
  void *v9;
  CFStringRef v10;
  CFStringRef v11;

  v6 = CGImageMetadataTagCopyPrefix(tag);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = CGImageMetadataTagCopyName(tag);
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v9, "containsObject:", v10))
        {
          CGImageMetadataRemoveTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 48), 0, a2);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        CFRelease(v11);
      }
    }
    CFRelease(v7);
  }
  return 1;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  id *v0;

  return objc_msgSend(*v0, "ef_publicDescription");
}

uint64_t OUTLINED_FUNCTION_7_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "fileURL");
}

void sub_1C88743E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_1C88749E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1C8877444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1C8878DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void MFRegisterContentProtectionObserver(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  if (!a1)
    MFRegisterContentProtectionObserver_cold_1();
  if (!a2)
    MFRegisterContentProtectionObserver_cold_2();
  if (_observationQueue == a2)
    MFRegisterContentProtectionObserver_cold_3();
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __MFRegisterContentProtectionObserver_block_invoke;
  v2[3] = &unk_1E81C9BC0;
  v2[4] = a1;
  v2[5] = a2;
  _InitAndPerformSync(v2);
}

void _InitAndPerformSync(dispatch_block_t block)
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  dispatch_sync((dispatch_queue_t)_observationQueue, block);
}

void MFUnregisterContentProtectionObserver(uint64_t a1)
{
  _QWORD block[5];

  if (!a1)
    MFUnregisterContentProtectionObserver_cold_1();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MFUnregisterContentProtectionObserver_block_invoke;
  block[3] = &unk_1E81C9B98;
  block[4] = a1;
  _InitAndPerformSync(block);
}

uint64_t MFContentProtectionGetObservedState()
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  return _contentProtectionState;
}

BOOL MFProtectedDataAvailable()
{
  if (_InitObservation_sOnceToken != -1)
    dispatch_once(&_InitObservation_sOnceToken, &__block_literal_global_12);
  return _contentProtectionState == 3 || _contentProtectionState == 0;
}

BOOL MFDeviceUnlockedSinceBoot()
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

void MFContentProtectionSimulateState(int a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MFContentProtectionSimulateState_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = a1;
  _InitAndPerformSync(block);
}

void _NotifyObserversWithContentProtectionState(unsigned int a1)
{
  unsigned int v2;
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  unsigned int v19;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)_observationQueue);
  if (a1 == -1)
    _NotifyObserversWithContentProtectionState_cold_1();
  v2 = _contentProtectionState;
  if (_contentProtectionState == -1)
    _NotifyObserversWithContentProtectionState_cold_2();
  v3 = MFLogGeneral();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 == a1)
  {
    if (v4)
    {
      v5 = CFSTR("disabled");
      switch(a1)
      {
        case 0u:
          v5 = CFSTR("unlocked");
          break;
        case 1u:
          v5 = CFSTR("locked");
          break;
        case 2u:
          v5 = CFSTR("locking");
          break;
        case 3u:
          break;
        default:
          v5 = CFSTR("unknown");
          break;
      }
      *(_DWORD *)buf = 138412546;
      v27 = v5;
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring lock state change from %@ to %@", buf, 0x16u);
    }
  }
  else
  {
    if (v4)
    {
      if (v2 > 3)
        v6 = CFSTR("unknown");
      else
        v6 = off_1E81CAFE0[v2];
      if (a1 > 3)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E81CAFE0[a1];
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, "Keybag transitioning from %@ to %@", buf, 0x16u);
    }
    if (a1 == 1 && !v2)
    {
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C8839000, v8, OS_LOG_TYPE_DEFAULT, "Brace for impact, keybag was locked without grace period!", buf, 2u);
      }
    }
    do
    {
      v9 = __ldaxr((unsigned int *)&_contentProtectionState);
      if (v9 != v2)
      {
        __clrex();
        return;
      }
    }
    while (__stlxr(a1, (unsigned int *)&_contentProtectionState));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (void *)objc_msgSend((id)_observers, "allValues");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      v14 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "queue");
          v18[0] = v14;
          v18[1] = 3221225472;
          v18[2] = ___NotifyObserversWithContentProtectionState_block_invoke;
          v18[3] = &unk_1E81CACB0;
          v18[4] = v16;
          v19 = a1;
          v20 = v2;
          dispatch_async(v17, v18);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }
  }
}

uint64_t MFContentProtectionDumpDiagnosticState()
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("\n==== MFContentProtectionObserver ====\n"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MFContentProtectionDumpDiagnosticState_block_invoke;
  block[3] = &unk_1E81C9B98;
  block[4] = v0;
  _InitAndPerformSync(block);
  return v0;
}

uint64_t _KeyBagLockState()
{
  uint64_t result;

  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4)
    return 0xFFFFFFFFLL;
  else
    return result;
}

const __CFString *MFMessageDeliveryStatusString(unint64_t a1)
{
  if (a1 > 8)
    return CFSTR("MessageDeliveryFatalError");
  else
    return off_1E81CB058[a1];
}

void *_setUserInfoObjectForKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = *(void **)(a1 + 40);
  if (a2)
  {
    if (!result)
    {
      result = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
      *(_QWORD *)(a1 + 40) = result;
    }
    return (void *)objc_msgSend(result, "setObject:forKey:", a2, a3);
  }
  else if (result)
  {
    return (void *)objc_msgSend(result, "removeObjectForKey:", a3);
  }
  return result;
}

uint64_t sanitizeStringForMarkup(void *a1)
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    2,
    0,
    objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    2,
    0,
    objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR("&nbsp; "),
    2,
    0,
    objc_msgSend(a1, "length"));
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<BR>"), 2, 0, objc_msgSend(a1, "length"));
}

void sub_1C887CDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C887D9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MessageInfoComparator(_DWORD *a1, _DWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  v2 = a1[8];
  v3 = a2[8];
  if (v2 < v3)
    return 1;
  if (v2 > v3)
    return -1;
  v4 = a1[7];
  v5 = a2[7];
  if (v4 < v5)
    return 1;
  if (v4 > v5)
    return -1;
  v7 = a1[5];
  v8 = a2[5];
  v9 = v7 >= v8;
  if (v7 <= v8)
    v10 = 0;
  else
    v10 = -1;
  if (v9)
    return v10;
  else
    return 1;
}

uint64_t MessageInfoSentDateComparator(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = *(_DWORD *)(a1 + 12);
  v3 = *(_DWORD *)(a2 + 12);
  v4 = *(_DWORD *)(a1 + 20);
  v5 = *(_DWORD *)(a2 + 20);
  v6 = v4 >= v5;
  if (v4 <= v5)
    v7 = 0;
  else
    v7 = -1;
  if (!v6)
    v7 = 1;
  v8 = v2 >= v3;
  if (v2 <= v3)
    v9 = v7;
  else
    v9 = -1;
  if (v8)
    return v9;
  else
    return 1;
}

uint64_t MFMessageInfoSentDateComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v6;
  uint64_t result;
  unsigned int v8;
  unsigned int v9;

  v5 = objc_msgSend(a2, "dateSentInterval");
  v6 = objc_msgSend(a3, "dateSentInterval");
  if (v5 < v6)
    result = -1;
  else
    result = v5 > v6;
  if (!result)
  {
    v8 = objc_msgSend(a2, "uid");
    v9 = objc_msgSend(a3, "uid");
    if (v8 < v9)
      return -1;
    else
      return v8 > v9;
  }
  return result;
}

uint64_t MFBeginDisallowingNetworkActivity()
{
  return _IncrementThreadLocalCounterForKey((uint64_t)CFSTR("_MFDisallowNetworkActivityAssertionKey"));
}

uint64_t _IncrementThreadLocalCounterForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v3 = objc_msgSend(v2, "objectForKey:", a1);
  if (v3)
  {
    v4 = (void *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _IncrementThreadLocalCounterForKey_cold_2();
    v3 = objc_msgSend(v4, "unsignedIntegerValue");
    if (v3 == -1)
      _IncrementThreadLocalCounterForKey_cold_1();
  }
  return objc_msgSend(v2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 + 1), a1);
}

uint64_t MFEndDisallowingNetworkActivity()
{
  return _DecrementThreadLocalCounterForKey((uint64_t)CFSTR("_MFDisallowNetworkActivityAssertionKey"));
}

uint64_t _DecrementThreadLocalCounterForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v3 = objc_msgSend(v2, "objectForKey:", a1);
  if (!v3)
    goto LABEL_8;
  v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _DecrementThreadLocalCounterForKey_cold_2();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  if (v5 == 1)
    return objc_msgSend(v2, "removeObjectForKey:", a1);
  if (!v5)
LABEL_8:
    _DecrementThreadLocalCounterForKey_cold_1();
  return objc_msgSend(v2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 - 1), a1);
}

uint64_t MFAssertNetworkActivityAllowed()
{
  uint64_t result;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && (_ThreadLocalAssertionForKey((uint64_t)CFSTR("_MFMainThreadNetworkingAllowedAssertionKey")) & 1) == 0
    && ((EFIsSeedBuild() & 1) != 0
     || objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal")))
  {
    MFAssertNetworkActivityAllowed_cold_2();
  }
  result = _ThreadLocalAssertionForKey((uint64_t)CFSTR("_MFDisallowNetworkActivityAssertionKey"));
  if ((_DWORD)result)
  {
    if ((EFIsSeedBuild() & 1) != 0
      || (result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice"), "isInternal"), (_DWORD)result))
    {
      MFAssertNetworkActivityAllowed_cold_1();
    }
  }
  return result;
}

uint64_t _ThreadLocalAssertionForKey(uint64_t a1)
{
  uint64_t result;
  void *v2;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary"), "objectForKey:", a1);
  if (result)
  {
    v2 = (void *)result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      _ThreadLocalAssertionForKey_cold_1();
    return objc_msgSend(v2, "unsignedIntegerValue") != 0;
  }
  return result;
}

uint64_t _MFBeginAllowingMainThreadNetworking()
{
  return _IncrementThreadLocalCounterForKey((uint64_t)CFSTR("_MFMainThreadNetworkingAllowedAssertionKey"));
}

uint64_t _MFEndAllowingMainThreadNetworking()
{
  return _DecrementThreadLocalCounterForKey((uint64_t)CFSTR("_MFMainThreadNetworkingAllowedAssertionKey"));
}

uint64_t MFErrorCodeWithDataStatus(int a1)
{
  if ((a1 - 1) > 5)
    return 0xFFFFFFFFLL;
  else
    return dword_1C88A37AC[a1 - 1];
}

uint64_t _NetworkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_setFlags:forReachability:", a2, a1);
}

uint64_t _DynamicStoreCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_checkKeys:forStore:", a2, a1);
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_handleWiFiNotification:", a2);
}

BOOL _IsWiFiEnabled(const __SCPreferences *a1)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;
  _BOOL8 v4;

  Value = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("AllowEnable"));
  if (Value && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(Value)))
    v4 = CFBooleanGetValue(Value) != 0;
  else
    v4 = *MEMORY[0x1E0C9AE50] == (_QWORD)Value;
  SCPreferencesSynchronize(a1);
  return v4;
}

void sub_1C887F8B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _powerChanged(uint64_t a1, uint64_t a2, uint64_t a3, intptr_t a4)
{
  NSObject *v6;
  unsigned int v7;
  unint64_t v8;
  __CFString *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HIDWORD(v8) = a3;
    LODWORD(v8) = a3 + 536870288;
    v7 = v8 >> 4;
    if (v7 < 0xC && ((0xA07u >> v7) & 1) != 0)
    {
      v9 = off_1E81CB750[v7];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a3);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1C8839000, v6, OS_LOG_TYPE_INFO, "power changed: %@", buf, 0xCu);

  }
  switch((_DWORD)a3)
  {
    case 0xE0000300:
      objc_msgSend((id)_observers_0, "makeObjectsPerformSelector:", sel_systemDidWake);
      return;
    case 0xE0000280:
      objc_msgSend((id)_observers_0, "makeObjectsPerformSelector:", sel_systemWillSleep);
      goto LABEL_13;
    case 0xE0000270:
LABEL_13:
      IOAllowPowerChange(__RootDomainConnect, a4);
      break;
  }
}

void MFRegisterPowerObserver(void *a1)
{
  id v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __MFRegisterPowerObserver_block_invoke;
  v6[3] = &unk_1E81CB468;
  v7 = v1;
  v2 = v6;
  v3 = (void *)MEMORY[0x1E0D1F070];
  v4 = v1;
  objc_msgSend(v3, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v2);

}

void MFUnregisterPowerObserver(void *a1)
{
  id v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __MFUnregisterPowerObserver_block_invoke;
  v6[3] = &unk_1E81CB468;
  v7 = v1;
  v2 = v6;
  v3 = (void *)MEMORY[0x1E0D1F070];
  v4 = v1;
  objc_msgSend(v3, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v2);

}

uint64_t initPLShouldLogRegisteredEvent(uint64_t a1, uint64_t a2)
{
  if (LoadPowerLog_loadPredicate != -1)
    dispatch_once(&LoadPowerLog_loadPredicate, &__block_literal_global_181);
  softLinkPLShouldLogRegisteredEvent = (uint64_t (*)())dlsym((void *)LoadPowerLog_frameworkLibrary, "PLShouldLogRegisteredEvent");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkPLShouldLogRegisteredEvent)(a1, a2);
}

uint64_t initPLLogRegisteredEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (LoadPowerLog_loadPredicate != -1)
    dispatch_once(&LoadPowerLog_loadPredicate, &__block_literal_global_181);
  softLinkPLLogRegisteredEvent = (uint64_t (*)())dlsym((void *)LoadPowerLog_frameworkLibrary, "PLLogRegisteredEvent");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkPLLogRegisteredEvent)(a1, a2, a3, a4);
}

MFError *checkCertificateExpiration(uint64_t a1, uint64_t a2)
{
  double Current;
  double v5;
  double v6;
  double v7;
  MFError *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  SecCertificateNotValidBefore();
  v6 = v5;
  SecCertificateNotValidAfter();
  if (Current >= v6)
  {
    v9 = v7;
    if (Current <= v7)
      return 0;
    v8 = (MFError *)MFLookupLocalizedString((uint64_t)CFSTR("MF_SMIME_CERTIFICATE_EXPIRED_FORMAT"), (uint64_t)CFSTR("The certificate for the address “%@” expired on %@."), CFSTR("Delayed"));
    v6 = v9;
  }
  else
  {
    v8 = (MFError *)MFLookupLocalizedString((uint64_t)CFSTR("MF_SMIME_CERTIFICATE_NOT_YET_VALID_FORMAT"), (uint64_t)CFSTR("The certificate for the address “%@” is not valid until %@."), CFSTR("Delayed"));
  }
  v10 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
  if (v8)
  {
    v11 = v10;
    if (!v10)
      checkCertificateExpiration_cold_1();
    v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v12, "setDateStyle:", 3);
    objc_msgSend(v12, "setTimeStyle:", 3);
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, a2, objc_msgSend(v12, "stringFromDate:", v11));

    v8 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v13);
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v17 = a1;
      v18 = 2112;
      v19 = a2;
      v20 = 2114;
      v21 = -[MFError ef_publicDescription](v8, "ef_publicDescription");
      _os_log_impl(&dword_1C8839000, v14, OS_LOG_TYPE_INFO, "#SMIMEErrors Certificate %@ for address %@ is not currently valid: %{public}@", buf, 0x20u);
    }
  }
  return v8;
}

uint64_t MFHasAccountsEntitlement()
{
  if (MFHasAccountsEntitlement_once != -1)
    dispatch_once(&MFHasAccountsEntitlement_once, &__block_literal_global_18);
  return MFHasAccountsEntitlement___hasAccountsEntitlement;
}

void sub_1C8885D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _releaseTopStackEntry(uint64_t a1)
{
  id **v2;
  id **v3;
  const __CFArray *v4;
  CFIndex Count;
  id *v6;

  v2 = (id **)_peekCommandStackEntry(a1);
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(**v2, "isEqualToString:", CFSTR("nofill")))
      *(_DWORD *)(a1 + 208) = *(_DWORD *)(a1 + 208) & 0xC0000000 | (*(_DWORD *)(a1 + 208) - 1) & 0x3FFFFFFF;
    v4 = *(const __CFArray **)(a1 + 224);
    Count = CFArrayGetCount(v4);
    CFArrayRemoveValueAtIndex(v4, Count - 1);
    v6 = v3[1];
    if (v6)

    free(v3);
  }
  return v3 != 0;
}

CFIndex _currentAttributeOfType(uint64_t a1, int a2)
{
  CFIndex result;
  CFIndex v5;
  _QWORD *ValueAtIndex;
  BOOL v7;

  result = CFArrayGetCount(*(CFArrayRef *)(a1 + 224));
  if (result)
  {
    v5 = result - 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 224), v5);
      if (((*(unsigned __int8 *)(*ValueAtIndex + 8) >> 3) & 3) == a2)
        result = ValueAtIndex[1];
      else
        result = 0;
      v7 = v5-- != 0;
    }
    while (v7 && !result);
  }
  return result;
}

CFStringRef _copyNextToken(uint64_t a1, CFCharacterSetRef theSet)
{
  CFIndex v4;
  CFIndex v5;
  uint64_t v6;
  CFIndex v7;
  uint64_t v8;
  UniChar v9;
  CFIndex v10;
  uint64_t v11;
  UniChar v12;
  CFStringRef result;
  CFIndex v14;
  CFIndex v15;
  int64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFIndex v30;
  CFIndex v31;
  CFIndex v32;
  CFIndex v33;
  UniChar chars;
  CFRange v35;
  CFRange v36;
  CFRange v37;
  CFRange v38;

  v5 = *(_QWORD *)(a1 + 192);
  v4 = *(_QWORD *)(a1 + 200);
  if (v5 < v4)
  {
    v6 = a1 + 8;
    if (v5 < 0 || (v7 = *(_QWORD *)(a1 + 168), v7 <= v5))
    {
      v9 = 0;
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 144);
      if (v8)
      {
        v9 = *(_WORD *)(v8 + 2 * (*(_QWORD *)(a1 + 160) + v5));
      }
      else
      {
        v28 = *(_QWORD *)(a1 + 152);
        if (v28)
        {
          v9 = *(char *)(v28 + *(_QWORD *)(a1 + 160) + v5);
        }
        else
        {
          if (*(_QWORD *)(a1 + 184) <= v5 || (v30 = *(_QWORD *)(a1 + 176), v30 > v5))
          {
            v31 = v5 - 4;
            if ((unint64_t)v5 < 4)
              v31 = 0;
            if (v31 + 64 < v7)
              v7 = v31 + 64;
            *(_QWORD *)(a1 + 176) = v31;
            *(_QWORD *)(a1 + 184) = v7;
            v36.location = *(_QWORD *)(a1 + 160) + v31;
            v36.length = v7 - v31;
            CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v36, (UniChar *)(a1 + 8));
            v30 = *(_QWORD *)(a1 + 176);
          }
          v9 = *(_WORD *)(v6 + 2 * (v5 - v30));
        }
      }
    }
    if (CFCharacterSetIsCharacterMember(theSet, v9))
    {
      if (v5 < 0 || (v10 = *(_QWORD *)(a1 + 168), v10 <= v5))
      {
        v12 = 0;
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 144);
        if (v11)
        {
          v12 = *(_WORD *)(v11 + 2 * (*(_QWORD *)(a1 + 160) + v5));
        }
        else
        {
          v29 = *(_QWORD *)(a1 + 152);
          if (v29)
          {
            v12 = *(char *)(v29 + *(_QWORD *)(a1 + 160) + v5);
          }
          else
          {
            if (*(_QWORD *)(a1 + 184) <= v5 || (v32 = *(_QWORD *)(a1 + 176), v32 > v5))
            {
              v33 = v5 - 4;
              if ((unint64_t)v5 < 4)
                v33 = 0;
              if (v33 + 64 < v10)
                v10 = v33 + 64;
              *(_QWORD *)(a1 + 176) = v33;
              *(_QWORD *)(a1 + 184) = v10;
              v37.location = *(_QWORD *)(a1 + 160) + v33;
              v37.length = v10 - v33;
              CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v37, (UniChar *)(a1 + 8));
              v32 = *(_QWORD *)(a1 + 176);
            }
            v12 = *(_WORD *)(v6 + 2 * (v5 - v32));
          }
        }
      }
      chars = v12;
      result = CFStringCreateWithCharacters(0, &chars, 1);
      ++v5;
      goto LABEL_43;
    }
    v4 = *(_QWORD *)(a1 + 200);
  }
  if (v5 >= v4)
  {
    result = 0;
  }
  else
  {
    v14 = -v5;
    v15 = v5 + 64;
    v16 = v5;
    do
    {
      if ((unint64_t)v16 >= 4)
        v17 = 4;
      else
        v17 = v16;
      if (v16 < 0 || (v18 = *(_QWORD *)(a1 + 168), v18 <= v16))
      {
        v20 = 0;
      }
      else
      {
        v19 = *(_QWORD *)(a1 + 144);
        if (v19)
        {
          v20 = *(_WORD *)(v19 + 2 * (v16 + *(_QWORD *)(a1 + 160)));
        }
        else
        {
          v21 = *(_QWORD *)(a1 + 152);
          if (v21)
          {
            v20 = *(char *)(v21 + *(_QWORD *)(a1 + 160) + v16);
          }
          else
          {
            if (*(_QWORD *)(a1 + 184) <= v16 || (v22 = *(_QWORD *)(a1 + 176), v22 > v16))
            {
              v23 = -v17;
              v24 = v17 + v14;
              v25 = v15 - v17;
              v26 = v16 + v23;
              v27 = v26 + 64;
              if (v26 + 64 >= v18)
                v27 = *(_QWORD *)(a1 + 168);
              *(_QWORD *)(a1 + 176) = v26;
              *(_QWORD *)(a1 + 184) = v27;
              if (v18 >= v25)
                v18 = v25;
              v35.length = v18 + v24;
              v35.location = v26 + *(_QWORD *)(a1 + 160);
              CFStringGetCharacters(*(CFStringRef *)(a1 + 136), v35, (UniChar *)(a1 + 8));
              v22 = *(_QWORD *)(a1 + 176);
            }
            v20 = *(_WORD *)(a1 + 8 - 2 * v22 + 2 * v16);
          }
        }
      }
      if (CFCharacterSetIsCharacterMember(theSet, v20))
        break;
      ++v16;
      --v14;
      ++v15;
    }
    while (v16 < *(_QWORD *)(a1 + 200));
    if (v16 <= v5)
    {
      result = 0;
    }
    else
    {
      v38.location = v5;
      v38.length = v16 - v5;
      result = CFStringCreateWithSubstring(0, *(CFStringRef *)(a1 + 136), v38);
    }
    v5 = v16;
  }
LABEL_43:
  *(_QWORD *)(a1 + 192) = v5;
  return result;
}

const void *_peekCommandStackEntry(uint64_t a1)
{
  CFIndex Count;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 224));
  if (Count < 1)
    return 0;
  else
    return CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 224), Count - 1);
}

void _MFFlushCurrentInvocation()
{
  const __CFString *v0;
  __CFRunLoop *Current;
  double v2;
  __CFRunLoop *v3;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B280];
  if (CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x1E0C9B280], 0.0, 0) == kCFRunLoopRunTimedOut)
  {
    Current = CFRunLoopGetCurrent();
    if (CFRunLoopGetNextTimerFireDate(Current, v0) > 1.17549435e-38)
    {
      v2 = 0.001;
      do
      {
        if (CFRunLoopRunInMode(v0, v2, 0) != kCFRunLoopRunTimedOut)
          break;
        v2 = v2 + v2;
        v3 = CFRunLoopGetCurrent();
      }
      while (CFRunLoopGetNextTimerFireDate(v3, v0) > 1.17549435e-38 && v2 < 10.0);
    }
  }
}

void sub_1C8889D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C8889EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C888B2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

__CFString *MFCreateStringByCondensingWhitespace(__CFString *a1)
{
  const __CFAllocator *v2;
  __CFString *Mutable;
  uint64_t v4;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v7;
  BOOL v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UniChar v13;
  BOOL v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unsigned int v21;
  uint64_t v23;
  UniChar chars;
  UniChar buffer[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __CFString *v35;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  CFRange v42;

  if (!a1)
    return 0;
  v2 = (const __CFAllocator *)MFGetMappedAllocator();
  Mutable = CFStringCreateMutable(v2, 0);
  v4 = -[__CFString length](a1, "length");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)buffer = 0u;
  v28 = 0u;
  v35 = a1;
  v38 = 0;
  v39 = v4;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v36 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v37 = CStringPtr;
  v40 = 0;
  v41 = 0;
  if (v4)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 64;
    do
    {
      if ((unint64_t)v9 >= 4)
        v11 = 4;
      else
        v11 = v9;
      chars = 0;
      if (v9 < 0 || (v12 = v39, v39 <= v9))
      {
        v14 = 0;
      }
      else
      {
        if (v36)
        {
          v13 = v36[v9 + v38];
        }
        else if (v37)
        {
          v13 = v37[v38 + v9];
        }
        else
        {
          if (v41 <= v9 || (v15 = v40, v40 > v9))
          {
            v16 = -v11;
            v17 = v11 + v7;
            v18 = v10 - v11;
            v19 = v9 + v16;
            v20 = v19 + 64;
            if (v19 + 64 >= v39)
              v20 = v39;
            v40 = v19;
            v41 = v20;
            if (v39 >= v18)
              v12 = v18;
            v42.length = v12 + v17;
            v42.location = v19 + v38;
            CFStringGetCharacters(v35, v42, buffer);
            v15 = v40;
          }
          v13 = buffer[v9 - v15];
        }
        v21 = v13;
        v14 = v13 == 13 || (unsigned __int16)(v13 - 9) < 2u || v13 == 32;
        chars = v13;
        v23 = (1 << v13) & 0x100002600;
        if (v21 <= 0x20 && v23 != 0)
        {
          if (v9 != 0 && !v8)
            CFStringAppend(Mutable, CFSTR(" "));
          goto LABEL_15;
        }
      }
      CFStringAppendCharacters(Mutable, &chars, 1);
LABEL_15:
      ++v9;
      --v7;
      ++v10;
      v8 = v14;
    }
    while (v4 != v9);
  }
  return Mutable;
}

id MFCopyResponseDataForURLRequest(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  MFMessageURLConnectionDelegate *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_alloc_init(MFMessageURLConnectionDelegate);
  v7 = objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v7, v6, 0);
  v9 = (void *)objc_msgSend(v8, "dataTaskWithRequest:", a1);
  if (!v9)
    return 0;
  objc_msgSend(v9, "resume");
  v10 = (id)-[EFFuture resultWithTimeout:error:](-[MFMessageURLConnectionDelegate future](v6, "future"), "resultWithTimeout:error:", a3, 60.0);
  if (a2)
    *a2 = -[MFMessageURLConnectionDelegate response](v6, "response");
  objc_msgSend(v8, "invalidateAndCancel");
  return v10;
}

void sub_1C888E4E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  NSObject *v10;
  NSUncaughtExceptionHandler *v11;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_DEFAULT, "#Warning Exception raised while processing requests: %@", (uint8_t *)&a9, 0xCu);
    }
    v11 = NSGetUncaughtExceptionHandler();
    ((void (*)(id))v11)(v9);
    objc_end_catch();
    JUMPOUT(0x1C888E4BCLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ExtractContentWithTag(uint64_t a1, int a2)
{
  int v3;
  int v4;
  int v5;
  uint64_t result;

  v3 = SecCmsMessageContentLevelCount();
  if (v3 < 1)
    return 0;
  v4 = v3;
  v5 = 0;
  while (1)
  {
    SecCmsMessageContentLevel();
    if (SecCmsContentInfoGetContentTypeTag() == a2)
    {
      result = SecCmsContentInfoGetContent();
      if (result)
        break;
    }
    if (v4 == ++v5)
      return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_6_1(id *a1)
{
  return objc_msgSend(*a1, "ef_publicDescription");
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1C8892DA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C88930E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *_createParameterStringFromBytes(const UInt8 **a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const UInt8 *v7;
  unsigned int v8;
  const UInt8 *v9;
  BOOL v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  const __CFString *v14;
  __CFString *v15;
  CFIndex Length;
  __CFString *MutableCopy;
  const UInt8 *v18;

  v4 = (unint64_t)*a1;
  v5 = MEMORY[0x1E0C80978];
  if ((unint64_t)*a1 < a2)
  {
    v6 = a2 - v4;
    v7 = (const UInt8 *)(v4 + 1);
    while (1)
    {
      v8 = *((char *)v7 - 1);
      if ((v8 & 0x80000000) != 0)
      {
        if (!__maskrune(v8, 0x4000uLL))
        {
LABEL_9:
          v4 = (unint64_t)*a1;
          break;
        }
      }
      else if ((*(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000) == 0)
      {
        goto LABEL_9;
      }
      *a1 = v7++;
      if (!--v6)
      {
        v4 = a2;
        break;
      }
    }
  }
  v9 = (const UInt8 *)(v4 + 1);
  if (v4 + 1 >= a2)
  {
    v10 = 0;
    v9 = (const UInt8 *)a2;
  }
  else
  {
    v10 = 0;
    v11 = ~v4 + a2;
    do
    {
      v12 = *(char *)v9;
      if ((v12 & 0x80000000) != 0)
      {
        if (__maskrune(*(char *)v9, 0x4000uLL))
          goto LABEL_24;
      }
      else if ((*(_DWORD *)(v5 + 4 * v12 + 60) & 0x4000) != 0)
      {
        goto LABEL_24;
      }
      if (v10)
      {
        v10 = 1;
      }
      else
      {
        if ((v12 & 0x80000000) != 0)
          v13 = __maskrune(v12, 0x1000uLL);
        else
          v13 = *(_DWORD *)(v5 + 4 * v12 + 60) & 0x1000;
        v10 = v13 != 0;
      }
      ++v9;
      --v11;
    }
    while (v11);
    v9 = (const UInt8 *)a2;
LABEL_24:
    v4 = (unint64_t)*a1;
  }
  if (v4 >= (unint64_t)v9)
  {
    v15 = 0;
  }
  else
  {
    v14 = CFStringCreateWithBytes(0, (const UInt8 *)v4, (CFIndex)&v9[-v4], 0x600u, 0);
    v15 = (__CFString *)v14;
    if (v14 != 0 && v10)
    {
      Length = CFStringGetLength(v14);
      MutableCopy = CFStringCreateMutableCopy(0, Length, v15);
      CFStringUppercase(MutableCopy, 0);

      v15 = MutableCopy;
    }
  }
  if ((unint64_t)(v9 + 1) < a2)
    v18 = v9 + 1;
  else
    v18 = (const UInt8 *)a2;
  *a1 = v18;
  return v15;
}

const __CFString *MFSMTPFailureReasonString(unsigned int a1)
{
  if (a1 > 7)
    return CFSTR("SMTPFailureReasonUnknown");
  else
    return off_1E81CBCE8[a1];
}

uint64_t MFCreateURLForContentID(__CFString *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  CFRange v7;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v2 = -[__CFString rangeOfString:](a1, "rangeOfString:", CFSTR("<"));
  v4 = v3;
  v5 = -[__CFString rangeOfString:](a1, "rangeOfString:", CFSTR(">"));
  v6 = v2 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0x7FFFFFFFFFFFFFFFLL;
  v7.location = v2 + v4;
  if (!v6 && v5 > v7.location)
  {
    v7.length = v5 - v7.location;
    v9 = (__CFString *)CFStringCreateWithSubstring(0, a1, v7);
  }
  else
  {
    v9 = a1;
  }
  v11 = v9;
  v12 = -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v9, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet"));
  if (v12)
  {
    v13 = objc_msgSend(CFSTR("cid"), "stringByAppendingFormat:", CFSTR(":%@"), v12);
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E98]), "initWithString:", v13);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t _SortWebAttachmentSources()
{
  char isKindOfClass;
  char v1;
  uint64_t v2;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v1 = isKindOfClass ^ objc_opt_isKindOfClass();
  v2 = -1;
  if ((isKindOfClass & 1) == 0)
    v2 = 1;
  if ((v1 & 1) != 0)
    return v2;
  else
    return 0;
}

void _configureMailboxCache_cold_1()
{
  __assert_rtn("_readMailboxCache", "MailAccount.m", 3447, "self->_rootMailboxUid");
}

void _MFFlagsBySettingValueForKey_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C8839000, a2, OS_LOG_TYPE_DEBUG, "Unexpected flag key \"%@\"", (uint8_t *)&v2, 0xCu);
}

void MFRegisterContentProtectionObserver_cold_1()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 186, "nil != observer");
}

void MFRegisterContentProtectionObserver_cold_2()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 187, "NULL != queue");
}

void MFRegisterContentProtectionObserver_cold_3()
{
  __assert_rtn("MFRegisterContentProtectionObserver", "MFContentProtectionObserver.m", 188, "_observationQueue != queue");
}

void MFUnregisterContentProtectionObserver_cold_1()
{
  __assert_rtn("MFUnregisterContentProtectionObserver", "MFContentProtectionObserver.m", 208, "nil != observer");
}

void _NotifyObserversWithContentProtectionState_cold_1()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "MFContentProtectionObserver.m", 79, "kMFContentProtectionStateInvalid != state");
}

void _NotifyObserversWithContentProtectionState_cold_2()
{
  __assert_rtn("_NotifyObserversWithContentProtectionState", "MFContentProtectionObserver.m", 80, "kMFContentProtectionStateInvalid != _contentProtectionState");
}

void _IncrementThreadLocalCounterForKey_cold_1()
{
  __assert_rtn("_IncrementThreadLocalCounterForKey", "MFNetworkAssertions.m", 45, "count < NSUIntegerMax");
}

void _IncrementThreadLocalCounterForKey_cold_2()
{
  __assert_rtn("_IncrementThreadLocalCounterForKey", "MFNetworkAssertions.m", 41, "[countNumber isKindOfClass:[NSNumber class]]");
}

void _DecrementThreadLocalCounterForKey_cold_1()
{
  __assert_rtn("_DecrementThreadLocalCounterForKey", "MFNetworkAssertions.m", 62, "0 < count");
}

void _DecrementThreadLocalCounterForKey_cold_2()
{
  __assert_rtn("_DecrementThreadLocalCounterForKey", "MFNetworkAssertions.m", 58, "[countNumber isKindOfClass:[NSNumber class]]");
}

void MFAssertNetworkActivityAllowed_cold_1()
{
  __assert_rtn("MFAssertNetworkActivityAllowed", "MFNetworkAssertions.m", 110, "0 && \"networking is disallowed\"");
}

void MFAssertNetworkActivityAllowed_cold_2()
{
  __assert_rtn("MFAssertNetworkActivityAllowed", "MFNetworkAssertions.m", 104, "0 && \"networking is disallowed on the main thread\"");
}

void _ThreadLocalAssertionForKey_cold_1()
{
  __assert_rtn("_ThreadLocalAssertionForKey", "MFNetworkAssertions.m", 79, "[number isKindOfClass:[NSNumber class]]");
}

void checkCertificateExpiration_cold_1()
{
  __assert_rtn("checkCertificateExpiration", "MFSecureMIMECompositionManager.m", 891, "date");
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFAllocatorSetDefault(CFAllocatorRef allocator)
{
  MEMORY[0x1E0C97CE0](allocator);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

void CFArrayExchangeValuesAtIndices(CFMutableArrayRef theArray, CFIndex idx1, CFIndex idx2)
{
  MEMORY[0x1E0C97D58](theArray, idx1, idx2);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C98C50](rl, mode);
  return result;
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x1E0C98ED0](alloc, host, *(_QWORD *)&port, readStream, writeStream);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F28](*(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
  MEMORY[0x1E0C991B8](str, idx, insertedStr);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x1E0C991F8](theString, replacement);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C99260](theString, locale);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC320](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C8](metadata);
}

void CGImageMetadataEnumerateTagsUsingBlock(CGImageMetadataRef metadata, CFStringRef rootPath, CFDictionaryRef options, CGImageMetadataTagBlock block)
{
  MEMORY[0x1E0CBC3E0](metadata, rootPath, options, block);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x1E0CBC410](metadata, parent, path);
}

CFStringRef CGImageMetadataTagCopyName(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1E0CBC430](tag);
}

CFStringRef CGImageMetadataTagCopyPrefix(CGImageMetadataTagRef tag)
{
  return (CFStringRef)MEMORY[0x1E0CBC440](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1E0CBC510](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

uint64_t CPFSSizeStrings()
{
  return MEMORY[0x1E0CFA270]();
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1E0CFA3B0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CTCellularDataPlanGetIsEnabled()
{
  return MEMORY[0x1E0CA6BF0]();
}

uint64_t ECGetNextHeaderFromDataInRange()
{
  return MEMORY[0x1E0D1E4E0]();
}

uint64_t EFFrameworkVersion()
{
  return MEMORY[0x1E0D1ED70]();
}

uint64_t EFIsSeedBuild()
{
  return MEMORY[0x1E0D1EDA0]();
}

uint64_t EFProductName()
{
  return MEMORY[0x1E0D1EDE0]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1E0D1EE30]();
}

uint64_t EFStringWithUnsignedInteger()
{
  return MEMORY[0x1E0D1EE40]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x1E0D27C60]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

uint64_t MFCharsetForEncoding()
{
  return MEMORY[0x1E0D45F38]();
}

uint64_t MFCreateDataWithString()
{
  return MEMORY[0x1E0D45F40]();
}

uint64_t MFCreateStringWithData()
{
  return MEMORY[0x1E0D45F50]();
}

uint64_t MFDataConsumerConsumeCompleteData()
{
  return MEMORY[0x1E0D45F60]();
}

uint64_t MFGetMappedAllocator()
{
  return MEMORY[0x1E0D45FA0]();
}

uint64_t MFGetRandomBytes()
{
  return MEMORY[0x1E0D45FA8]();
}

uint64_t MFGetTypeInfo()
{
  return MEMORY[0x1E0D45FB0]();
}

uint64_t MFGuessEncodingForBytes()
{
  return MEMORY[0x1E0D45FB8]();
}

uint64_t MFIsMobileMail()
{
  return MEMORY[0x1E0D4D7F8]();
}

uint64_t MFLogGeneral()
{
  return MEMORY[0x1E0D4D800]();
}

uint64_t MFLogNetwork()
{
  return MEMORY[0x1E0D4D808]();
}

uint64_t MFMimePartParseContentDispositionHeader()
{
  return MEMORY[0x1E0D45FE0]();
}

uint64_t MFMimePartParseContentTypeHeader()
{
  return MEMORY[0x1E0D45FE8]();
}

uint64_t MFMimePartSetValueForPreservedHeader()
{
  return MEMORY[0x1E0D45FF0]();
}

uint64_t MFMobileMailContainerPath()
{
  return MEMORY[0x1E0D4D828]();
}

uint64_t MFMobileMailPreferenceDomain()
{
  return MEMORY[0x1E0D4D830]();
}

uint64_t MFRemoveItemAtPath()
{
  return MEMORY[0x1E0D45FF8]();
}

uint64_t MFStringCanBeConvertedLosslessly()
{
  return MEMORY[0x1E0D46008]();
}

uint64_t MFStringGetBytes()
{
  return MEMORY[0x1E0D46010]();
}

uint64_t MFStringHashForMessageIDHeader()
{
  return MEMORY[0x1E0D46020]();
}

uint64_t MF_MD5HMAC_Init()
{
  return MEMORY[0x1E0D46030]();
}

uint64_t MF_MD5HMAC_InputBytes()
{
  return MEMORY[0x1E0D46038]();
}

uint64_t MF_MD5HMAC_Output()
{
  return MEMORY[0x1E0D46040]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t NSBOOLFromString()
{
  return MEMORY[0x1E0CB2888]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return (NSUncaughtExceptionHandler *)MEMORY[0x1E0CB2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1E0CB3450](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

uint64_t NtlmCreateClientRequest()
{
  return MEMORY[0x1E0CD5BE8]();
}

uint64_t NtlmCreateClientResponse()
{
  return MEMORY[0x1E0CD5BF0]();
}

uint64_t NtlmGeneratorCreate()
{
  return MEMORY[0x1E0CD5C00]();
}

uint64_t NtlmGeneratorRelease()
{
  return MEMORY[0x1E0CD5C08]();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CE8778](allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE88E8](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8900](target, runLoop, runLoopMode);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE89F8](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8A40](prefs, runLoop, runLoopMode);
}

OSStatus SSLGetNegotiatedProtocolVersion(SSLContextRef context, SSLProtocol *protocol)
{
  return MEMORY[0x1E0CD5D88](context, protocol);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x1E0CD5F50]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1E0CD5FC0]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1E0CD5FC8]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1E0CD6028]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1E0CD6038]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1E0CD6078]();
}

uint64_t SecCmsContentInfoGetContent()
{
  return MEMORY[0x1E0CD6088]();
}

uint64_t SecCmsContentInfoGetContentTypeTag()
{
  return MEMORY[0x1E0CD6090]();
}

uint64_t SecCmsContentInfoGetInnerContent()
{
  return MEMORY[0x1E0CD6098]();
}

uint64_t SecCmsContentInfoSetContentData()
{
  return MEMORY[0x1E0CD60A0]();
}

uint64_t SecCmsContentInfoSetContentEnvelopedData()
{
  return MEMORY[0x1E0CD60A8]();
}

uint64_t SecCmsContentInfoSetContentSignedData()
{
  return MEMORY[0x1E0CD60B0]();
}

uint64_t SecCmsDecoderCreate()
{
  return MEMORY[0x1E0CD60B8]();
}

uint64_t SecCmsDecoderDestroy()
{
  return MEMORY[0x1E0CD60C0]();
}

uint64_t SecCmsDecoderFinish()
{
  return MEMORY[0x1E0CD60C8]();
}

uint64_t SecCmsDecoderUpdate()
{
  return MEMORY[0x1E0CD60D0]();
}

uint64_t SecCmsDigestContextDestroy()
{
  return MEMORY[0x1E0CD60D8]();
}

uint64_t SecCmsDigestContextStartMultiple()
{
  return MEMORY[0x1E0CD60E0]();
}

uint64_t SecCmsDigestContextUpdate()
{
  return MEMORY[0x1E0CD60E8]();
}

uint64_t SecCmsEncoderDestroy()
{
  return MEMORY[0x1E0CD60F0]();
}

uint64_t SecCmsEncoderFinish()
{
  return MEMORY[0x1E0CD60F8]();
}

uint64_t SecCmsEnvelopedDataCreate()
{
  return MEMORY[0x1E0CD6100]();
}

uint64_t SecCmsEnvelopedDataGetContentInfo()
{
  return MEMORY[0x1E0CD6108]();
}

uint64_t SecCmsMessageContentLevel()
{
  return MEMORY[0x1E0CD6110]();
}

uint64_t SecCmsMessageContentLevelCount()
{
  return MEMORY[0x1E0CD6118]();
}

uint64_t SecCmsMessageCreate()
{
  return MEMORY[0x1E0CD6120]();
}

uint64_t SecCmsMessageDestroy()
{
  return MEMORY[0x1E0CD6128]();
}

uint64_t SecCmsMessageEncode()
{
  return MEMORY[0x1E0CD6130]();
}

uint64_t SecCmsMessageGetContentInfo()
{
  return MEMORY[0x1E0CD6140]();
}

uint64_t SecCmsMessageIsEncrypted()
{
  return MEMORY[0x1E0CD6148]();
}

uint64_t SecCmsRecipientInfoCreate()
{
  return MEMORY[0x1E0CD6150]();
}

uint64_t SecCmsSignedDataAddCertChain()
{
  return MEMORY[0x1E0CD6158]();
}

uint64_t SecCmsSignedDataCreate()
{
  return MEMORY[0x1E0CD6160]();
}

uint64_t SecCmsSignedDataGetContentInfo()
{
  return MEMORY[0x1E0CD6170]();
}

uint64_t SecCmsSignedDataGetDigestAlgs()
{
  return MEMORY[0x1E0CD6178]();
}

uint64_t SecCmsSignedDataGetSignerInfo()
{
  return MEMORY[0x1E0CD6180]();
}

uint64_t SecCmsSignedDataHasDigests()
{
  return MEMORY[0x1E0CD6188]();
}

uint64_t SecCmsSignedDataSetDigestContext()
{
  return MEMORY[0x1E0CD6190]();
}

uint64_t SecCmsSignedDataSignerInfoCount()
{
  return MEMORY[0x1E0CD6198]();
}

uint64_t SecCmsSignedDataVerifySignerInfo()
{
  return MEMORY[0x1E0CD61A0]();
}

uint64_t SecCmsSignerInfoAddMSSMIMEEncKeyPrefs()
{
  return MEMORY[0x1E0CD61A8]();
}

uint64_t SecCmsSignerInfoAddSMIMEEncKeyPrefs()
{
  return MEMORY[0x1E0CD61B0]();
}

uint64_t SecCmsSignerInfoAddSigningTime()
{
  return MEMORY[0x1E0CD61B8]();
}

uint64_t SecCmsSignerInfoCopyCertFromEncryptionKeyPreference()
{
  return MEMORY[0x1E0CD61C0]();
}

uint64_t SecCmsSignerInfoCreate()
{
  return MEMORY[0x1E0CD61C8]();
}

uint64_t SecCmsSignerInfoGetSignerEmailAddress()
{
  return MEMORY[0x1E0CD61D0]();
}

uint64_t SecCmsSignerInfoGetVerificationStatus()
{
  return MEMORY[0x1E0CD61D8]();
}

uint64_t SecCmsSignerInfoIncludeCerts()
{
  return MEMORY[0x1E0CD61E0]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1E0CD6288]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6510](revocationFlags);
}

uint64_t SecPolicyCreateSMIME()
{
  return MEMORY[0x1E0CD6518]();
}

uint64_t SecSMIMEFindBulkAlgForRecipients()
{
  return MEMORY[0x1E0CD65B8]();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

OSStatus SecTrustCopyPolicies(SecTrustRef trust, CFArrayRef *policies)
{
  return MEMORY[0x1E0CD6678](trust, policies);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66A8](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1E0CD66D8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1E0CA5980](inTagClass, inTag, inConformingToUTI);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1E0CA5998](inUTI);
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1E0D4FC40]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x1E0D4FCA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A3A0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CTServerConnectionAddToRunLoop()
{
  return MEMORY[0x1E0CA6E50]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1E0CA6F40]();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return MEMORY[0x1E0CA7020]();
}

uint64_t _MFCopyDecodeText()
{
  return MEMORY[0x1E0D461E8]();
}

uint64_t _MFCreateStringFromHeaderBytes()
{
  return MEMORY[0x1E0D461F0]();
}

uint64_t _MFDecodeText()
{
  return MEMORY[0x1E0D461F8]();
}

uint64_t _MFLockGlobalLock()
{
  return MEMORY[0x1E0D46200]();
}

uint64_t _MFOffsetFromThreadDictionary()
{
  return MEMORY[0x1E0D46208]();
}

uint64_t _MFSetValueInDictionary()
{
  return MEMORY[0x1E0D46210]();
}

uint64_t _MFUnlockGlobalLock()
{
  return MEMORY[0x1E0D46218]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return (servent *)MEMORY[0x1E0C837F8](a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1E0C84D98](__pthread, __qos_class, __relative_priority);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  return MEMORY[0x1E0C84E70](__override);
}

pthread_override_t pthread_override_qos_class_start_np(pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  return (pthread_override_t)MEMORY[0x1E0C84E78](__pthread, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1E0C84EF0](*(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1E0DE59C0](*(_QWORD *)&c, *(_QWORD *)&which);
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1E0DE5CB8]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1E0DE5CF0]();
}

