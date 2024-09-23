uint64_t sub_21A7093A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (dword_2550F4508 <= 800 && (dword_2550F4508 != -1 || sub_21A69876C((uint64_t)&dword_2550F4508, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4508, (uint64_t)"OSStatus BSAutoGuess_Cancel(AutoGuessContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  if (a1)
    return sub_21A709CC4(*(_QWORD *)(a1 + 48), a2, a3, a4, a5, a6, a7, a8);
  else
    return 4294960591;
}

void sub_21A709424(const __CFArray *a1, _BYTE *a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1
    && a2
    && a3
    && *a2
    && *a3
    && !sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, (uint64_t)"{%ks=%s%ks=%s%ks=%b}", a4, a5, a6, a7, a8, (uint64_t)"KEY_TITLE"))
  {
    if (dword_2550F4508 <= 800 && (dword_2550F4508 != -1 || sub_21A69876C((uint64_t)&dword_2550F4508, 0x320u)))
    {
      Count = CFArrayGetCount(a1);
      sub_21A698FDC((uint64_t)&dword_2550F4508, (uint64_t)"void LogUnconfigGuessCriterionTrue(CFMutableArrayRef, const char *, const char *)", 800, (uint64_t)"\nAuto Guess step: %d\n\t%s\t\t:\t%s\n\t%s\t:\t%s\n", v10, v11, v12, v13, Count + 1);
    }
    dispatch_sync_f(MEMORY[0x24BDAC9B8], a1, (dispatch_function_t)sub_21A709554);
  }
}

void sub_21A709554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  const __CFDictionary *v9;
  BOOL v10;
  __CFNotificationCenter *LocalCenter;
  const __CFDictionary *v12;

  v12 = 0;
  if (a1)
  {
    v8 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], (CFTypeRef *)&v12, (uint64_t)"{%ks=%O}", a4, a5, a6, a7, a8, (uint64_t)"BSAutoGuess_StateTrace");
    v9 = v12;
    if (v8)
      v10 = 1;
    else
      v10 = v12 == 0;
    if (!v10)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter)
        CFNotificationCenterPostNotificationWithOptions(LocalCenter, CFSTR("com.apple.airport.autoguess.debug.progress"), 0, v12, 1uLL);
      v9 = v12;
    }
    if (v9)
      CFRelease(v9);
  }
}

void sub_21A7095E0(const __CFArray *a1, _BYTE *a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex Count;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1
    && a2
    && a3
    && *a2
    && *a3
    && !sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], a1, (uint64_t)"{%ks=%s%ks=%s%ks=%i%ks=%b}", a4, a5, a6, a7, a8, (uint64_t)"KEY_TITLE"))
  {
    if (dword_2550F4508 <= 800 && (dword_2550F4508 != -1 || sub_21A69876C((uint64_t)&dword_2550F4508, 0x320u)))
    {
      Count = CFArrayGetCount(a1);
      sub_21A698FDC((uint64_t)&dword_2550F4508, (uint64_t)"void LogUnconfigGuessCriterionTrueWithInt32Value(CFMutableArrayRef, const char *, const char *, int32_t)", 800, (uint64_t)"\nAuto Guess step: %d\n\t%s\t\t:\t%s\n\t%s\t:\t%s\n\t%s\t\t:\t%d\n", v10, v11, v12, v13, Count + 1);
    }
    dispatch_sync_f(MEMORY[0x24BDAC9B8], a1, (dispatch_function_t)sub_21A709554);
  }
}

BOOL sub_21A709730(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID TypeID;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"Boolean BSAssistant_RefObjGood(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", a5, a6, a7, a8, (uint64_t)a1);
  if (a1 && (TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(a1)))
    return CFStringCompare(a1, CFSTR("bad!"), 0) != kCFCompareEqualTo;
  else
    return 0;
}

uint64_t sub_21A7097E4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  const __CFAllocator *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFMutableStringRef Mutable;
  __CFString *v27;
  CFTypeID TypeID;
  uint64_t v29;
  uint64_t v31;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ContextCreate(AssistantContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v31);
  if (!a1)
    return 4294960591;
  v9 = malloc_type_calloc(1uLL, 0x68uLL, 0x10A0040E715EC04uLL);
  if (!v9)
    return 4294960568;
  v16 = v9;
  v9[9] = 0;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_WORD *)v9 + 16) = 257;
  *((_QWORD *)v9 + 6) = 0;
  *((_QWORD *)v9 + 8) = 0;
  *((_QWORD *)v9 + 9) = 0;
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v18 = sub_21A689820(*MEMORY[0x24BDBD240], (uint64_t)CFSTR("BSAssistant"), v10, v11, v12, v13, v14, v15);
  *((_QWORD *)v16 + 12) = v18;
  if (!v18 || (Mutable = CFStringCreateMutable(v17, 10), (*((_QWORD *)v16 + 10) = Mutable) == 0))
  {
    v29 = 4294960568;
LABEL_19:
    sub_21A709990(v16, v19, v20, v21, v22, v23, v24, v25);
    return v29;
  }
  v27 = Mutable;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _RefObjSetGood(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", v22, v23, v24, v25, (uint64_t)v27);
  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(v27))
  {
    v29 = 4294960591;
    goto LABEL_19;
  }
  CFStringReplaceAll(v27, CFSTR("GOOD"));
  v29 = 0;
  v16[22] = 1634561902;
  *a1 = v16;
  return v29;
}

uint64_t sub_21A709990(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  const void *v10;
  __CFString *v11;
  CFTypeID TypeID;
  const void *v13;
  uint64_t v15;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ContextRelease(AssistantContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v15);
  if (!a1 || a1[22] != 1634561902)
    return 4294960578;
  v9 = (const void *)*((_QWORD *)a1 + 6);
  if (v9)
  {
    CFRelease(v9);
    *((_QWORD *)a1 + 6) = 0;
  }
  v10 = (const void *)*((_QWORD *)a1 + 12);
  if (v10)
  {
    CFRelease(v10);
    *((_QWORD *)a1 + 12) = 0;
  }
  a1[22] = 1095585614;
  *((_QWORD *)a1 + 2) = 0;
  *((_QWORD *)a1 + 8) = 0;
  *((_QWORD *)a1 + 9) = 0;
  v11 = (__CFString *)*((_QWORD *)a1 + 10);
  if (!v11)
    goto LABEL_19;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _RefObjSetDone(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", a5, a6, a7, a8, (uint64_t)v11);
  TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(v11))
  {
    CFStringReplaceAll(v11, CFSTR("bad!"));
    v13 = (const void *)*((_QWORD *)a1 + 10);
    if (v13)
      CFRelease(v13);
LABEL_19:
    free(a1);
    return 0;
  }
  return 4294960591;
}

uint64_t sub_21A709AF8(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  char *v6;
  char *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  CFMutableDictionaryRef Mutable;

  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 72))
    return 4294960587;
  v6 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x10A0040185FE424uLL);
  if (!v6)
    return 4294960568;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64) == 0;
  *((_QWORD *)v6 + 1) = a1;
  v9 = 64;
  if (!v8)
    v9 = 72;
  *(_QWORD *)(a1 + v9) = v6;
  v10 = !v8;
  *((_DWORD *)v6 + 4) = 0;
  *((_DWORD *)v6 + 8) = 0;
  *((_QWORD *)v6 + 15) = 0;
  *((_QWORD *)v6 + 16) = v10;
  *((_QWORD *)v6 + 6) = 0;
  v4 = pthread_mutex_init((pthread_mutex_t *)(v6 + 56), 0);
  if (!(_DWORD)v4)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *((_QWORD *)v7 + 3) = Mutable;
    if (Mutable)
    {
      v4 = 0;
      *((_QWORD *)v7 + 5) = dispatch_semaphore_create(0);
      *(_DWORD *)v7 = 1634561902;
      *a2 = v7;
      return v4;
    }
    v4 = 4294960568;
  }
  sub_21A709C24(v7);
  return v4;
}

uint64_t sub_21A709C24(char *a1)
{
  const void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 4294960578;
  if (*(_DWORD *)a1 != 1634561902)
    return 4294960578;
  v2 = (const void *)*((_QWORD *)a1 + 3);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)a1 + 3) = 0;
  }
  *(_DWORD *)a1 = 1095585614;
  v3 = *((_QWORD *)a1 + 5);
  if (v3)
    dispatch_release(v3);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 56));
  v4 = *((_QWORD *)a1 + 1);
  if (v4)
  {
    v5 = 72;
    if (!*((_QWORD *)a1 + 16))
      v5 = 64;
    *(_QWORD *)(v4 + v5) = 0;
  }
  free(a1);
  return 0;
}

uint64_t sub_21A709CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_Cancel(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v9 = *(_DWORD *)(a1 + 36);
  if (v9 != 2)
  {
    if (!v9)
      return 4294960576;
    *(_DWORD *)(a1 + 36) = 2;
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      v12 = *(NSObject **)(v11 + 40);
      if (v12)
        dispatch_semaphore_signal(v12);
    }
    v13 = *(_QWORD *)(a1 + 72);
    if (v13)
    {
      v14 = *(NSObject **)(v13 + 40);
      if (v14)
        dispatch_semaphore_signal(v14);
    }
  }
  return 4294960525;
}

uint64_t sub_21A709D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetToRunningState(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if ((*(_DWORD *)(a1 + 36) | 2) != 2)
    return 4294960587;
  result = 0;
  *(_DWORD *)(a1 + 36) = 1;
  return result;
}

uint64_t sub_21A709E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetToIdleState(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  result = *(unsigned int *)(a1 + 36);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1)
    {
      result = 0;
      *(_DWORD *)(a1 + 36) = 0;
    }
    else
    {
      return 4294960587;
    }
  }
  return result;
}

BOOL sub_21A709EEC(uint64_t a1)
{
  return !a1 || *(_DWORD *)(a1 + 88) != 1634561902 || *(_DWORD *)(a1 + 36) == 2;
}

uint64_t sub_21A709F1C(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_GetSaveBasePasswordToKeychain(AssistantContextRef, Boolean *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (!a2)
    return 4294960591;
  result = 0;
  *a2 = *(_BYTE *)(a1 + 32);
  return result;
}

uint64_t sub_21A709FC0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetSaveBasePasswordToKeychain(AssistantContextRef, Boolean)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  result = 0;
  *(_BYTE *)(a1 + 32) = a2;
  return result;
}

uint64_t sub_21A70A054(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_GetSaveWiFiPasswordToKeychain(AssistantContextRef, Boolean *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (!a2)
    return 4294960591;
  result = 0;
  *a2 = *(_BYTE *)(a1 + 33);
  return result;
}

uint64_t sub_21A70A0F8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetSaveWiFiPasswordToKeychain(AssistantContextRef, Boolean)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  result = 0;
  *(_BYTE *)(a1 + 33) = a2;
  return result;
}

uint64_t sub_21A70A18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetAssistantCallback(AssistantContextRef, assistant_callback_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v12);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (*(_QWORD *)a1)
    return 4294960577;
  result = 0;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  return result;
}

uint64_t sub_21A70A23C(_QWORD *context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  if (!context)
    return 4294960578;
  if (*(_DWORD *)context != 1634561902)
    return 4294960578;
  if (!context[3])
    return 4294960591;
  v9 = context[1];
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(_QWORD *)v9)
    return 4294960591;
  if (*(_DWORD *)(v9 + 36) == 2)
    return 4294960573;
  if (!(_DWORD)a2)
    return 4294960591;
  *((_DWORD *)context + 4) = a2;
  *((_DWORD *)context + 8) = 0;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CallbackPerform(AssistantCallbackContextRef, eAssistantCallback)", 800, (uint64_t)" %d...\n", a5, a6, a7, a8, a2);
  dispatch_async_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A70A344);
  return 0;
}

uint64_t sub_21A70A344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_PerformCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v12);
  if (a1 && *(_DWORD *)a1 == 1634561902)
  {
    v9 = *(_QWORD *)(a1 + 8);
    if (v9 && *(_QWORD *)v9 && *(_QWORD *)(a1 + 24) && *(_DWORD *)(a1 + 16))
    {
      if (*(_DWORD *)(v9 + 36) == 2)
      {
        v10 = 4294960573;
      }
      else
      {
        result = (*(uint64_t (**)(uint64_t))v9)(a1);
        v10 = result;
        if (!(_DWORD)result)
          return result;
      }
    }
    else
    {
      v10 = 4294960591;
    }
  }
  else
  {
    v10 = 4294960578;
  }
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_PerformCallbackOnMain(void *)", 800, (uint64_t)"failing err: %#m\n", a5, a6, a7, a8, v10);
  return sub_21A70B2E0((_QWORD *)a1, v10, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_21A70A490(_QWORD *context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  if (!context)
    return 4294960578;
  if (*(_DWORD *)context != 1634561902)
    return 4294960578;
  if (!context[3])
    return 4294960591;
  v9 = context[1];
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(_QWORD *)v9)
    return 4294960591;
  if (*(_DWORD *)(v9 + 36) == 2)
    return 4294960573;
  if (!(_DWORD)a2)
    return 4294960591;
  *((_DWORD *)context + 4) = a2;
  *((_DWORD *)context + 8) = 0;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CallbackPerformSync(AssistantCallbackContextRef, eAssistantCallback)", 800, (uint64_t)" %d...\n", a5, a6, a7, a8, a2);
  dispatch_sync_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A70A344);
  return 0;
}

uint64_t sub_21A70A598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!a1)
    return 4294960578;
  if (*(_DWORD *)a1 != 1634561902)
    return 4294960578;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(_QWORD *)(a1 + 40))
    return 4294960591;
  if (*(_DWORD *)(v9 + 36) == 2)
    return 4294960573;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_Wait(AssistantCallbackContextRef)", 800, (uint64_t)" SLEEP... inContext->callbackResult: %#m\n", a5, a6, a7, a8, *(unsigned int *)(a1 + 32));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_Wait(AssistantCallbackContextRef)", 800, (uint64_t)" AWAKE...\n", v11, v12, v13, v14, v15);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 36) == 2)
    return 4294960573;
  else
    return 0;
}

uint64_t sub_21A70A6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetProgressCallback(AssistantContextRef, assistant_progress_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v12);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  result = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  return result;
}

void sub_21A70A778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFAllocator *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  CFTypeRef v20;
  void *v21;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void BSAssistant_ProgressStatus_Dict(AssistantContextRef, int, OSStatus, CFDictionaryRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  if (a1 && *(_DWORD *)(a1 + 88) == 1634561902 && *(_QWORD *)(a1 + 16))
  {
    v20 = 0;
    v21 = 0;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = a4
        ? sub_21A692FEC(v11, &v20, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"): sub_21A692FEC(v11, &v20, (uint64_t)"{%ks=%i%ks=%i}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
    if (!v12 && v20 != 0)
    {
      v19 = sub_21A70A8EC(a1, v20, &v21, v13, v14, v15, v16, v17);
      if (v20)
      {
        CFRelease(v20);
        v20 = 0;
      }
      if (!v19)
      {
        if (v21)
          dispatch_async_f(MEMORY[0x24BDAC9B8], v21, (dispatch_function_t)sub_21A70AA14);
      }
    }
  }
}

uint64_t sub_21A70A8EC(uint64_t a1, const void *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v23;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus __ProgressContext_Create(AssistantContextRef, CFDictionaryRef, __ProgressContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v23);
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (!a3)
    return 4294960591;
  v11 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E9A6435BuLL);
  if (!v11)
    return 4294960568;
  v19 = v11;
  *v11 = a1;
  v11[1] = a2;
  if (a2)
    CFRetain(a2);
  if (*(_DWORD *)(a1 + 88) != 1634561902)
  {
    v21 = 4294960578;
LABEL_18:
    sub_21A70F1F0(v19, v12, v13, v14, v15, v16, v17, v18);
    return v21;
  }
  v20 = *(const void **)(a1 + 80);
  if (!v20)
  {
    v21 = 4294960591;
    goto LABEL_18;
  }
  v19[3] = v20;
  CFRetain(v20);
  v21 = 0;
  *((_DWORD *)v19 + 4) = 1634561902;
  *a3 = v19;
  return v21;
}

void sub_21A70AA14(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const __CFString *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;

  if (a1)
  {
    v21 = 0;
    v20 = 0;
    v19 = 0;
    if (*((_DWORD *)a1 + 4) == 1634561902 && sub_21A709730((const __CFString *)a1[3], a2, a3, a4, a5, a6, a7, a8))
    {
      v9 = *a1;
      if (*a1)
      {
        if (*(_DWORD *)(v9 + 88) == 1634561902)
        {
          if (*(_QWORD *)(v9 + 16))
          {
            v10 = (const __CFString *)a1[1];
            if (v10)
            {
              sub_21A693B94(v10, (uint64_t)&v21, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
              if (!v11)
              {
                sub_21A693B94((const __CFString *)a1[1], (uint64_t)&v20, (UInt8 *)"%ks:err", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_OSStatus");
                if (!v12)
                {
                  sub_21A693B94((const __CFString *)a1[1], (uint64_t)&v19, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_DictionaryParam");
                  if (!v13)
                    goto LABEL_13;
                  if (v13 == -6727)
                  {
                    v19 = 0;
LABEL_13:
                    if (dword_2550F4548 <= 800
                      && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                    {
                      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __Progress_CallbackOnMain(void *)", 800, (uint64_t)"selector: %d status %#m\n", a5, a6, a7, a8, v21);
                    }
                    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*a1 + 16))(v21, v20, v19, *(_QWORD *)(*a1 + 24));
                    sub_21A70F2A4(v21, v20, v19, v14, v15, v16, v17, v18);
                  }
                }
              }
            }
          }
        }
      }
    }
    sub_21A70F1F0(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void sub_21A70AB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  CFTypeRef v16;
  void *v17;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void BSAssistant_ProgressStatusWithSubSelector_Dict(AssistantContextRef, int, int, OSStatus, CFDictionaryRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  if (a1)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      if (*(_QWORD *)(a1 + 16))
      {
        v16 = 0;
        v17 = 0;
        if (!sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], &v16, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O%ks=%i}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"))
        {
          if (v16)
          {
            v15 = sub_21A70A8EC(a1, v16, &v17, v10, v11, v12, v13, v14);
            if (v16)
            {
              CFRelease(v16);
              v16 = 0;
            }
            if (!v15)
            {
              if (v17)
                dispatch_async_f(MEMORY[0x24BDAC9B8], v17, (dispatch_function_t)sub_21A70AA14);
            }
          }
        }
      }
    }
  }
}

void sub_21A70ACEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFAllocator *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  CFTypeRef v20;
  void *v21;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void BSAssistant_ProgressStatus_String(AssistantContextRef, int, OSStatus, CFStringRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  if (a1 && *(_DWORD *)(a1 + 88) == 1634561902 && *(_QWORD *)(a1 + 16))
  {
    v20 = 0;
    v21 = 0;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = a4
        ? sub_21A692FEC(v11, &v20, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"): sub_21A692FEC(v11, &v20, (uint64_t)"{%ks=%i%ks=%i}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
    if (!v12 && v20 != 0)
    {
      v19 = sub_21A70A8EC(a1, v20, &v21, v13, v14, v15, v16, v17);
      if (v20)
      {
        CFRelease(v20);
        v20 = 0;
      }
      if (!v19)
      {
        if (v21)
          dispatch_async_f(MEMORY[0x24BDAC9B8], v21, (dispatch_function_t)sub_21A70AA14);
      }
    }
  }
}

void sub_21A70AE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  CFTypeRef v16;
  void *v17;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void BSAssistant_ProgressStatus_Number(AssistantContextRef, int, OSStatus, CFIndex)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  if (a1)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      if (*(_QWORD *)(a1 + 16))
      {
        v16 = 0;
        v17 = 0;
        if (!sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], &v16, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%i}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"))
        {
          if (v16)
          {
            v15 = sub_21A70A8EC(a1, v16, &v17, v10, v11, v12, v13, v14);
            if (v16)
            {
              CFRelease(v16);
              v16 = 0;
            }
            if (!v15)
            {
              if (v17)
                dispatch_async_f(MEMORY[0x24BDAC9B8], v17, (dispatch_function_t)sub_21A70AA14);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21A70AFA8(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 4294960591;
  result = 4294960591;
  if (a2)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 40);
    }
  }
  return result;
}

uint64_t sub_21A70AFE4(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
    return 4294960591;
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960591;
  if (a2 > 2)
    return 4294960586;
  *(_DWORD *)(a1 + 40) = a2;
  sub_21A70AE60(a1, 13, 0, a2, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_21A70B044(uint64_t a1, CFDictionaryRef *a2)
{
  const __CFDictionary *v3;
  CFDictionaryRef Copy;

  if (!a1)
    return 4294960578;
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v3 = *(const __CFDictionary **)(a1 + 48);
  if (!v3)
    return 4294960578;
  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
  *a2 = Copy;
  if (Copy)
    return 0;
  else
    return 4294960568;
}

void sub_21A70B0B0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  int v10;
  uint64_t v11;

  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      if (a3)
      {
        if (a2)
        {
          v9 = *(const __CFString **)(a1 + 24);
          if (v9)
          {
            v11 = 0;
            sub_21A693B94(v9, (uint64_t)&v11, (UInt8 *)"%kO", a4, a5, a6, a7, a8, a2);
            if (!v10)
            {
              if (v11)
                *a3 = v11;
            }
          }
        }
      }
    }
  }
}

void sub_21A70B148(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  int v10;
  int v11;

  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      if (a3)
      {
        if (a2)
        {
          v9 = *(const __CFString **)(a1 + 24);
          if (v9)
          {
            v11 = 0;
            sub_21A693B94(v9, (uint64_t)&v11, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, a2);
            if (!v10)
              *a3 = v11;
          }
        }
      }
    }
  }
}

uint64_t sub_21A70B1D4(uint64_t a1, const void *a2)
{
  const __CFDictionary *v2;

  if (a1 && *(_DWORD *)a1 == 1634561902 && a2 && (v2 = *(const __CFDictionary **)(a1 + 24)) != 0)
    return CFDictionaryContainsKey(v2, a2);
  else
    return 0;
}

uint64_t sub_21A70B204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  __CFArray *v10;

  if (!a1 || *(_DWORD *)a1 != 1634561902)
    return 4294960578;
  result = 4294960591;
  if (a3 && a2)
  {
    v10 = *(__CFArray **)(a1 + 24);
    if (v10)
      return sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v10, (uint64_t)"%kO=%O", a4, a5, a6, a7, a8, a2);
  }
  return result;
}

uint64_t sub_21A70B274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  __CFArray *v10;

  if (!a1 || *(_DWORD *)a1 != 1634561902)
    return 4294960578;
  result = 4294960591;
  if (a2)
  {
    v10 = *(__CFArray **)(a1 + 24);
    if (v10)
      return sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v10, (uint64_t)"%kO=%i", a4, a5, a6, a7, a8, a2);
  }
  return result;
}

uint64_t sub_21A70B2E0(_QWORD *context, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!context)
    return 4294960578;
  if (*(_DWORD *)context != 1634561902)
    return 4294960578;
  if (!context[5])
    return 4294960591;
  *((_DWORD *)context + 8) = a2;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CallbackWithFinalResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)" %d result: %#m ...\n", a5, a6, a7, a8, *((unsigned int *)context + 4));
  dispatch_async_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A70B3B4);
  return 0;
}

intptr_t sub_21A70B3B4(intptr_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  intptr_t v8;

  v8 = result;
  if (dword_2550F4548 > 800
    || dword_2550F4548 == -1 && (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), !(_DWORD)result))
  {
    if (!v8)
      return result;
  }
  else
  {
    result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_CallbackWithFinalResultOnMain(void *)", 800, (uint64_t)" %d result: %#m...\n", a5, a6, a7, a8, *(unsigned int *)(v8 + 16));
  }
  if (*(_DWORD *)v8 == 1634561902)
  {
    result = *(_QWORD *)(v8 + 40);
    if (result)
      return dispatch_semaphore_signal((dispatch_semaphore_t)result);
  }
  return result;
}

uint64_t sub_21A70B464(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __CFArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFTypeRef v37;
  uint64_t v38;
  CFTypeRef cf;
  void *context;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyConfigurationChangeLogs(AssistantContextRef, CFStringRef, CFArrayRef, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v38);
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (!a4)
    return 4294960591;
  cf = 0;
  v12 = sub_21A709AF8(a1, &context);
  v19 = (char *)context;
  if (!(_DWORD)v12)
  {
    if (!context)
      return 4294960568;
    if (!a2)
      goto LABEL_35;
    if (*(_DWORD *)context != 1634561902)
    {
      v20 = 4294960578;
      goto LABEL_10;
    }
    v22 = (__CFArray *)*((_QWORD *)context + 3);
    if (!v22)
    {
      v20 = 4294960591;
      goto LABEL_10;
    }
    v20 = sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v22, (uint64_t)"%kO=%O", v14, v15, v16, v17, v18, (uint64_t)CFSTR("BSAssistantCallback_String"));
    if (!(_DWORD)v20)
    {
LABEL_35:
      if (!a3
        || (v20 = sub_21A70B204((uint64_t)v19, (uint64_t)CFSTR("BSAssistantCallback_StringList"), a3, v14, v15, v16, v17, v18), !(_DWORD)v20))
      {
        v20 = sub_21A70A23C(v19, 11, v13, v14, v15, v16, v17, v18);
        if (!(_DWORD)v20)
        {
          v30 = sub_21A70A598((uint64_t)v19, v23, v24, v25, v26, v27, v28, v29);
          v20 = *((unsigned int *)v19 + 8);
          if ((_DWORD)v20)
          {
            if ((_DWORD)v20 == -6727)
              v20 = 4294960569;
          }
          else
          {
            v20 = v30;
            if (!(_DWORD)v30)
            {
              sub_21A70B0B0((uint64_t)v19, (uint64_t)CFSTR("BSAssistantCallback_ConfigChangeLogs"), &cf, v31, v32, v33, v34, v35);
              v20 = v36;
              if (!(_DWORD)v36)
              {
                v37 = cf;
                if (cf)
                {
                  *a4 = cf;
                  CFRetain(v37);
                  v20 = 0;
                }
                else
                {
                  v20 = 4294960568;
                }
              }
            }
          }
        }
      }
    }
LABEL_10:
    sub_21A709C24(v19);
    return v20;
  }
  v20 = v12;
  if (context)
    goto LABEL_10;
  return v20;
}

uint64_t sub_21A70B648(uint64_t a1, CFTypeRef *a2, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFTypeRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef v49;
  uint64_t v50;
  CFTypeRef v51;
  CFTypeRef cf;
  const __CFString *v53;
  void *context;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyCurrentNetworkAssociationInfo(AssistantContextRef, CFStringRef *, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v50);
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    cf = 0;
    v53 = 0;
    v51 = 0;
    v11 = sub_21A709AF8(a1, &context);
    v18 = (char *)context;
    if ((_DWORD)v11)
    {
      v19 = v11;
      if (!context)
        return v19;
      goto LABEL_16;
    }
    if (!context)
      return 4294960568;
    v19 = sub_21A70A23C(context, 8, v12, v13, v14, v15, v16, v17);
    if ((_DWORD)v19)
      goto LABEL_16;
    v28 = sub_21A70A598((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);
    v19 = *((unsigned int *)v18 + 8);
    if ((_DWORD)v19)
    {
      if ((_DWORD)v19 == -6727)
        v19 = 4294960569;
      goto LABEL_16;
    }
    v19 = v28;
    if (!(_DWORD)v28)
    {
      sub_21A70B0B0((uint64_t)v18, (uint64_t)CFSTR("BSAssistantCallback_AssociationInfo"), &v53, v29, v30, v31, v32, v33);
      v19 = v39;
      if (!(_DWORD)v39)
      {
        if (!v53)
          goto LABEL_35;
        if (!a2)
        {
LABEL_28:
          if (!a3)
          {
LABEL_34:
            v19 = 0;
            goto LABEL_16;
          }
          sub_21A693B94(v53, (uint64_t)&v51, (UInt8 *)"%kO", v34, v35, v36, v37, v38, (uint64_t)CFSTR("BSSID"));
          v19 = v47;
          if ((_DWORD)v47 == -6727)
          {
            sub_21A693B94(v53, (uint64_t)&v51, (UInt8 *)"%kO", v42, v43, v44, v45, v46, (uint64_t)CFSTR("BSSID"));
            v19 = v48;
          }
          if ((_DWORD)v19)
            goto LABEL_16;
          v49 = v51;
          if (v51)
          {
            *a3 = v51;
            CFRetain(v49);
            goto LABEL_34;
          }
LABEL_35:
          v19 = 4294960568;
          goto LABEL_16;
        }
        sub_21A693B94(v53, (uint64_t)&cf, (UInt8 *)"%kO", v34, v35, v36, v37, v38, (uint64_t)CFSTR("SSID_STR"));
        v19 = v40;
        if (!(_DWORD)v40)
        {
          v41 = cf;
          if (!cf)
            goto LABEL_35;
          *a2 = cf;
          CFRetain(v41);
          goto LABEL_28;
        }
      }
    }
LABEL_16:
    sub_21A709C24(v18);
    return v19;
  }
  return 4294960591;
}

BOOL sub_21A70B84C(uint64_t a1, const __CFString *a2, CFStringRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL8 v11;
  uint64_t v13;
  CFStringRef theString2;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"Boolean BSAssistant_IsAssociatedToNetworkNamedAndCopyCurrentNetworkName(AssistantContextRef, CFStringRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v13);
  v11 = 0;
  if (a1)
  {
    if (a2)
    {
      if (*(_DWORD *)(a1 + 88) == 1634561902)
      {
        theString2 = 0;
        v11 = 0;
        if (!sub_21A70B648(a1, (CFTypeRef *)&theString2, 0, a4, a5, a6, a7, a8))
        {
          v11 = CFStringCompare(a2, theString2, 0) == kCFCompareEqualTo;
          if (a3)
          {
            *a3 = theString2;
          }
          else if (theString2)
          {
            CFRelease(theString2);
          }
        }
      }
    }
  }
  return v11;
}

uint64_t sub_21A70B94C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFAllocator *v5;
  CFNumberRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFNumberRef v12;
  __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int valuePtr;
  uint64_t v43;
  void *context;

  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v43 = 0;
  v2 = sub_21A709AF8(a1, &v43);
  v3 = v43;
  if ((_DWORD)v2)
  {
    v4 = v2;
    if (!v43)
      return v4;
    goto LABEL_25;
  }
  if (v43)
  {
    valuePtr = 60;
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    if (!v6)
    {
      v4 = 4294960568;
      goto LABEL_25;
    }
    v12 = v6;
    if (*(_DWORD *)v3 == 1634561902)
    {
      v13 = *(__CFArray **)(v3 + 24);
      if (v13)
      {
        v4 = sub_21A693A8C(v5, v13, (uint64_t)"%kO=%O", v7, v8, v9, v10, v11, (uint64_t)CFSTR("BSAssistantCallback_Number"));
        CFRelease(v12);
        if ((_DWORD)v4)
          goto LABEL_25;
        sub_21A70F334(v3, v14, v15, v16, v17, v18, v19, v20);
        if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _DisassociateNetwork(AssistantContextRef)", 800, (uint64_t)"\n", v23, v24, v25, v26, v41);
        context = 0;
        if (*(_DWORD *)(a1 + 88) != 1634561902)
        {
          v4 = 4294960578;
LABEL_31:
          sub_21A70DCB4(v3, 4294960573, v21, v22, v23, v24, v25, v26);
          goto LABEL_25;
        }
        v27 = sub_21A709AF8(a1, &context);
        v28 = (char *)context;
        if ((_DWORD)v27)
        {
          v4 = v27;
          if (!context)
            goto LABEL_31;
          goto LABEL_30;
        }
        if (!context)
        {
          v4 = 4294960568;
          goto LABEL_31;
        }
        v4 = sub_21A70A23C(context, 9, v21, v22, v23, v24, v25, v26);
        if ((_DWORD)v4)
          goto LABEL_30;
        v37 = sub_21A70A598((uint64_t)v28, v30, v31, v32, v33, v34, v35, v36);
        v4 = *((unsigned int *)v28 + 8);
        if ((_DWORD)v4 == -6727)
        {
          v4 = 4294960569;
        }
        else if (!(_DWORD)v4)
        {
          v38 = v37;
          sub_21A709C24(v28);
          v4 = v38;
          if ((_DWORD)v38)
            goto LABEL_31;
          v40 = sub_21A70A598(v3, v39, v21, v22, v23, v24, v25, v26);
          if (!(_DWORD)v40)
          {
            v4 = *(unsigned int *)(v3 + 32);
            goto LABEL_25;
          }
          v4 = v40;
          if ((_DWORD)v40 == -6723)
          {
            v4 = 4294960573;
            goto LABEL_31;
          }
LABEL_25:
          sub_21A709C24((char *)v3);
          return v4;
        }
LABEL_30:
        sub_21A709C24(v28);
        goto LABEL_31;
      }
      v4 = 4294960591;
    }
    else
    {
      v4 = 4294960578;
    }
    CFRelease(v6);
    goto LABEL_25;
  }
  return 4294960568;
}

uint64_t sub_21A70BB98(uint64_t a1, const __CFString *a2, const __CFString *cf)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  CFTypeRef cfa;

  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v5 = 4294960591;
  if (a2 && cf)
  {
    CFRetain(cf);
    if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    {
      sub_21A68EE6C(cf, v7, v8, v9, v10, v11, v12, v13);
      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"inNetworkName: %@ inBaseStation: %@\n", v14, v15, v16, v17, (uint64_t)a2);
    }
    v18 = 0;
    cfa = 0;
    while (1)
    {
      v19 = dword_2550F4548;
      if (v18)
      {
        if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"waiting err: %#m pauseSecs: %d\n", v10, v11, v12, v13, 0);
        v20 = sub_21A70BD94(a1, 6);
        if ((_DWORD)v20)
        {
          v5 = v20;
LABEL_31:
          CFRelease(cf);
          return v5;
        }
        v19 = dword_2550F4548;
      }
      if (v19 <= 800 && (v19 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"retries: %d\n", v10, v11, v12, v13, v18);
      v5 = sub_21A70BE94(a1, a2, cf, 3, &cfa, v11, v12, v13);
      if (cfa)
      {
        CFRelease(cfa);
        cfa = 0;
      }
      if ((_DWORD)v5)
      {
        if ((_DWORD)v5 != -6727)
          goto LABEL_31;
LABEL_29:
        v5 = 0;
        goto LABEL_31;
      }
      if (++v18 == 21)
        goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_21A70BD94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!a1)
    return 4294960578;
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v4 = mach_absolute_time();
  v9 = v4 / sub_21A6A3B70();
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SleepSecs(AssistantContextRef, CFIndex)", 800, (uint64_t)"inTimeoutSecs: %d\n", v5, v6, v7, v8, a2);
  v10 = v9 + a2;
  while (1)
  {
    v11 = mach_absolute_time();
    if (v11 / sub_21A6A3B70() >= v10)
      break;
    sleep(1u);
    if (*(_DWORD *)(a1 + 88) != 1634561902 || *(_DWORD *)(a1 + 36) == 2)
      return 4294960573;
  }
  return 0;
}

uint64_t sub_21A70BE94(uint64_t a1, const __CFString *a2, const __CFString *cf, int a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  CFIndex v14;
  const void *ValueAtIndex;
  CFArrayRef theArray;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyScanForFirstNetworkNamedCreatedByBaseStation(AssistantContextRef, CFStringRef, CFDictionaryRef, WiFiType, CFDictionaryRef *)", 800, (uint64_t)"inNetworkName: %@\n", (uint64_t)a5, a6, a7, a8, (uint64_t)a2);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v13 = 4294960591;
  if (a2 && a4 && a5)
  {
    if (cf)
      CFRetain(cf);
    theArray = 0;
    v13 = sub_21A70C220(a1, (uint64_t)a2, a4, 1, (uint64_t)&theArray, a6, a7, a8);
    if (!(_DWORD)v13)
    {
      if (cf)
      {
        v14 = sub_21A68F994(cf, theArray);
        if (v14 == -1)
        {
          v13 = 4294960569;
LABEL_21:
          CFRelease(cf);
          return v13;
        }
      }
      else
      {
        v14 = sub_21A68F7D0(a2, a4, 0, theArray);
        if (v14 == -1)
          return 4294960569;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
      *a5 = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }
    if (cf)
      goto LABEL_21;
  }
  return v13;
}

uint64_t sub_21A70C004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  void *context;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_ClearScanCache(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v27);
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v9 = sub_21A709AF8(a1, &context);
  v16 = (char *)context;
  if ((_DWORD)v9)
  {
    v17 = v9;
    if (!context)
      return v17;
  }
  else
  {
    if (!context)
      return 4294960568;
    v17 = sub_21A70A23C(context, 10, v10, v11, v12, v13, v14, v15);
    if (!(_DWORD)v17)
    {
      v26 = sub_21A70A598((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);
      v17 = *((unsigned int *)v16 + 8);
      if ((_DWORD)v17)
      {
        if ((_DWORD)v17 == -6727)
          v17 = 4294960569;
      }
      else
      {
        v17 = v26;
      }
    }
  }
  sub_21A709C24(v16);
  return v17;
}

uint64_t sub_21A70C110(uint64_t a1, const __CFString *a2, int a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  CFTypeRef cf;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyScanForFirstNetworkNamed(AssistantContextRef, CFStringRef, WiFiType, CFDictionaryRef *)", 800, (uint64_t)"inNetworkName: %@\n", a5, a6, a7, a8, (uint64_t)a2);
  cf = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v12 = 4294960591;
  if (a2 && a3 && a4)
  {
    v12 = sub_21A70BE94(a1, a2, 0, a3, &cf, a6, a7, a8);
    if ((_DWORD)v12)
    {
      if (cf)
        CFRelease(cf);
    }
    else
    {
      v12 = 0;
      *a4 = cf;
    }
  }
  return v12;
}

uint64_t sub_21A70C220(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFArray *v30;
  uint64_t v31;
  CFNumberRef v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFNumberRef v38;
  __CFArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFNumberRef v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFNumberRef v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  CFArrayRef v77;
  const __CFAllocator *allocator;
  CFArrayRef theArray;
  uint64_t v80;
  int v81;
  int valuePtr;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v74);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
  {
    v18 = 4294960578;
    goto LABEL_66;
  }
  if (!a5)
  {
    v18 = 4294960591;
    goto LABEL_66;
  }
  if (a2)
    v13 = 9;
  else
    v13 = 1;
  sub_21A70ACEC(a1, v13, 0, a2, a5, a6, a7, a8);
  v14 = mach_absolute_time();
  v15 = v14 / sub_21A6A3B70() + 12;
  v16 = mach_absolute_time();
  if (v16 / sub_21A6A3B70() >= v15)
    goto LABEL_75;
  v76 = (_QWORD *)a5;
  v77 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a4)
    v20 = (uint64_t *)MEMORY[0x24BDBD270];
  else
    v20 = (uint64_t *)MEMORY[0x24BDBD268];
  v75 = *v20;
  do
  {
    if (v17)
    {
      if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, CFArrayRef *)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d (kDefault_ScanningBusy_RetrySecs)\n", a5, a6, a7, a8, v18);
      v21 = sub_21A70BD94(a1, 2);
      if ((_DWORD)v21)
      {
        v18 = v21;
        goto LABEL_66;
      }
      v19 = (v19 + 2);
    }
    v81 = v19;
    valuePtr = a3;
    if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, uint32_t, CFArrayRef *)", 800, (uint64_t)"inMaxAge: %d\n", a5, a6, a7, a8, v19);
    v80 = 0;
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      theArray = 0;
      v22 = sub_21A709AF8(a1, &v80);
      v28 = v80;
      if ((_DWORD)v22)
      {
        v18 = v22;
        if (!v80)
          goto LABEL_32;
        goto LABEL_30;
      }
      if (v80)
      {
        if (!a2)
          goto LABEL_41;
        if (*(_DWORD *)v80 != 1634561902)
        {
          v18 = 4294960578;
          goto LABEL_30;
        }
        v30 = *(__CFArray **)(v80 + 24);
        if (!v30)
        {
          v18 = 4294960591;
          goto LABEL_30;
        }
        v31 = sub_21A693A8C(allocator, v30, (uint64_t)"%kO=%O", v23, v24, v25, v26, v27, (uint64_t)CFSTR("BSAssistantCallback_String"));
        if ((_DWORD)v31)
          goto LABEL_39;
LABEL_41:
        v32 = CFNumberCreate(allocator, kCFNumberCFIndexType, &valuePtr);
        if (!v32)
          goto LABEL_63;
        v38 = v32;
        if (*(_DWORD *)v28 == 1634561902)
        {
          v39 = *(__CFArray **)(v28 + 24);
          if (v39)
          {
            v18 = sub_21A693A8C(allocator, v39, (uint64_t)"%kO=%O", v33, v34, v35, v36, v37, (uint64_t)CFSTR("BSAssistantCallback_WiFiType"));
            CFRelease(v38);
            if ((_DWORD)v18)
              goto LABEL_30;
            v31 = sub_21A70B204(v28, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), v75, v40, v41, v42, v43, v44);
            if ((_DWORD)v31)
              goto LABEL_39;
            v45 = CFNumberCreate(allocator, kCFNumberCFIndexType, &v81);
            if (v45)
            {
              v51 = v45;
              v18 = sub_21A70B204(v28, (uint64_t)CFSTR("BSAssistantCallback_Number"), (uint64_t)v45, v46, v47, v48, v49, v50);
              CFRelease(v51);
              if (!(_DWORD)v18)
              {
                v31 = sub_21A70A23C((_QWORD *)v28, 7, v52, v53, v54, v55, v56, v57);
                if (!(_DWORD)v31)
                {
                  v65 = sub_21A70A598(v28, v58, v59, v60, v61, v62, v63, v64);
                  v71 = *(_DWORD *)(v28 + 32);
                  if (v71 == -6723)
                  {
                    v18 = *(unsigned int *)(v28 + 32);
                    goto LABEL_30;
                  }
                  if (v71 == -6721)
                  {
                    v18 = 4294960575;
                    goto LABEL_30;
                  }
                  v18 = v65;
                  if ((_DWORD)v65)
                    goto LABEL_30;
                  sub_21A70B0B0(v28, (uint64_t)CFSTR("BSAssistantCallback_ScanInfoRecords"), &theArray, v66, v67, v68, v69, v70);
                  if (!(_DWORD)v31)
                  {
                    if (theArray)
                    {
                      if (CFArrayGetCount(theArray))
                      {
                        v77 = theArray;
                        CFRetain(theArray);
                        v18 = 0;
                      }
                      else
                      {
                        v18 = 4294960569;
                      }
                      goto LABEL_30;
                    }
                    goto LABEL_63;
                  }
                }
LABEL_39:
                v18 = v31;
              }
LABEL_30:
              sub_21A709C24((char *)v28);
              goto LABEL_32;
            }
LABEL_63:
            v18 = 4294960568;
            goto LABEL_30;
          }
          v18 = 4294960591;
        }
        else
        {
          v18 = 4294960578;
        }
        CFRelease(v32);
        goto LABEL_30;
      }
      v18 = 4294960568;
    }
    else
    {
      v18 = 4294960578;
    }
LABEL_32:
    v29 = mach_absolute_time();
    --v17;
  }
  while (v29 / sub_21A6A3B70() < v15);
  if ((_DWORD)v18)
    goto LABEL_66;
  if (v77)
  {
    if (CFArrayGetCount(v77))
    {
      *v76 = v77;
      CFRetain(v77);
      v18 = 0;
    }
    else
    {
      v18 = 4294960569;
    }
    goto LABEL_66;
  }
LABEL_75:
  v18 = 4294960568;
LABEL_66:
  if (a2)
    v72 = 10;
  else
    v72 = 2;
  sub_21A70ACEC(a1, v72, v18, 0, a5, a6, a7, a8);
  return v18;
}

uint64_t sub_21A70C6C4(uint64_t a1, const __CFString *a2, const __CFString *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFTypeRef v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CFTypeRef v54;
  CFTypeRef cf;
  uint64_t v56;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyGetKeychainPassword(AssistantContextRef, CFStringRef, CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v53);
  v56 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v12 = 4294960591;
  if (!a2 || !a3 || !a4)
    return v12;
  cf = 0;
  v13 = sub_21A709AF8(a1, &v56);
  v14 = v56;
  if (!(_DWORD)v13)
  {
    if (!v56)
      return 4294960568;
    if (CFStringCompare(a2, CFSTR("keychainBaseStationType"), 0))
    {
      v12 = sub_21A70B204(v14, (uint64_t)CFSTR("BSAssistantCallback_ScanInfo"), (uint64_t)a3, v17, v18, v19, v20, v21);
      if ((_DWORD)v12)
        goto LABEL_12;
    }
    else
    {
      v54 = 0;
      v47 = sub_21A68EB8C(a3, (__CFArray **)&v54, v16, v17, v18, v19, v20, v21);
      if ((_DWORD)v47)
      {
        v12 = v47;
        goto LABEL_12;
      }
      if (!v54)
        goto LABEL_33;
      v12 = sub_21A70B204(v14, (uint64_t)CFSTR("BSAssistantCallback_KeychainAccounts"), (uint64_t)v54, v48, v49, v50, v51, v52);
      if (v54)
        CFRelease(v54);
      if ((_DWORD)v12)
        goto LABEL_12;
    }
    v12 = sub_21A70B204(v14, (uint64_t)CFSTR("BSAssistantCallback_KeychainServiceType"), (uint64_t)a2, v22, v23, v24, v25, v26);
    if ((_DWORD)v12)
      goto LABEL_12;
    v12 = sub_21A70A23C((_QWORD *)v14, 13, v27, v28, v29, v30, v31, v32);
    if ((_DWORD)v12)
      goto LABEL_12;
    v12 = sub_21A70A598(v14, v33, v34, v35, v36, v37, v38, v39);
    if ((_DWORD)v12)
      goto LABEL_12;
    v12 = *(unsigned int *)(v14 + 32);
    if ((_DWORD)v12)
      goto LABEL_12;
    sub_21A70B0B0(v14, (uint64_t)CFSTR("BSAssistantCallback_String"), &cf, v40, v41, v42, v43, v44);
    v12 = v45;
    if ((_DWORD)v45)
      goto LABEL_12;
    v46 = cf;
    if (cf)
    {
      *a4 = cf;
      CFRetain(v46);
      v12 = 0;
      goto LABEL_12;
    }
LABEL_33:
    v12 = 4294960568;
    goto LABEL_12;
  }
  v12 = v13;
  if (v56)
LABEL_12:
    sub_21A709C24((char *)v14);
  return v12;
}

uint64_t sub_21A70C8C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_SetKeychainPassword(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v46);
  v47 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v13 = 4294960591;
  if (a2 && a3 && a5)
  {
    v14 = sub_21A709AF8(a1, &v47);
    v20 = v47;
    if ((_DWORD)v14)
    {
      v13 = v14;
      if (!v47)
        return v13;
      goto LABEL_28;
    }
    if (v47)
    {
      if (*(_DWORD *)v47 == 1634561902)
      {
        v22 = *(__CFArray **)(v47 + 24);
        if (v22)
        {
          v13 = sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v22, (uint64_t)"%kO=%O", v15, v16, v17, v18, v19, (uint64_t)CFSTR("BSAssistantCallback_KeychainAccount"));
          if (!(_DWORD)v13)
          {
            v13 = sub_21A70B204(v20, (uint64_t)CFSTR("BSAssistantCallback_KeychainServiceType"), a2, v23, v24, v25, v26, v27);
            if (!(_DWORD)v13)
            {
              if (!a4
                || (v13 = sub_21A70B204(v20, (uint64_t)CFSTR("BSAssistantCallback_KeychainDeviceName"), a4, v28, v29, v30, v31, v32), !(_DWORD)v13))
              {
                v13 = sub_21A70B204(v20, (uint64_t)CFSTR("BSAssistantCallback_String"), a5, v28, v29, v30, v31, v32);
                if (!(_DWORD)v13)
                {
                  v13 = sub_21A70A23C((_QWORD *)v20, 14, v33, v34, v35, v36, v37, v38);
                  if (!(_DWORD)v13)
                  {
                    v13 = sub_21A70A598(v20, v39, v40, v41, v42, v43, v44, v45);
                    if (!(_DWORD)v13)
                      v13 = *(unsigned int *)(v20 + 32);
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v13 = 4294960578;
      }
LABEL_28:
      sub_21A709C24((char *)v20);
      return v13;
    }
    return 4294960568;
  }
  return v13;
}

uint64_t sub_21A70CA8C(uint64_t a1, const __CFString *a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CFTypeRef v65;
  uint64_t v66;
  char v67;
  CFTypeRef cf;
  uint64_t v69;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyAskUserForPassword(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v66);
  v69 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v12 = 4294960591;
  if (a2 && a4)
  {
    cf = 0;
    v67 = 0;
    v13 = sub_21A709AF8(a1, &v69);
    v19 = v69;
    if ((_DWORD)v13)
    {
      v12 = v13;
      if (!v69)
        return v12;
      goto LABEL_31;
    }
    if (v69)
    {
      if (*(_DWORD *)v69 != 1634561902)
      {
        v12 = 4294960578;
        goto LABEL_31;
      }
      v21 = *(__CFArray **)(v69 + 24);
      if (!v21)
        goto LABEL_31;
      v12 = sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v21, (uint64_t)"%kO=%O", v14, v15, v16, v17, v18, (uint64_t)CFSTR("BSAssistantCallback_KeychainServiceType"));
      if ((_DWORD)v12)
        goto LABEL_31;
      v12 = sub_21A70B204(v19, (uint64_t)CFSTR("BSAssistantCallback_KeychainDeviceName"), a3, v22, v23, v24, v25, v26);
      if ((_DWORD)v12)
        goto LABEL_31;
      v12 = sub_21A70A23C((_QWORD *)v19, 12, v27, v28, v29, v30, v31, v32);
      if ((_DWORD)v12)
        goto LABEL_31;
      v12 = sub_21A70A598(v19, v33, v34, v35, v36, v37, v38, v39);
      if ((_DWORD)v12)
        goto LABEL_31;
      v12 = *(unsigned int *)(v19 + 32);
      if ((_DWORD)v12)
        goto LABEL_31;
      sub_21A70B0B0(v19, (uint64_t)CFSTR("BSAssistantCallback_String"), &cf, v40, v41, v42, v43, v44);
      v12 = v50;
      if ((_DWORD)v50)
        goto LABEL_31;
      if (!cf)
      {
        v12 = 4294960568;
        goto LABEL_31;
      }
      sub_21A693B94(*(const __CFString **)(v19 + 24), (uint64_t)&v67, (UInt8 *)"%ks:BOOL", v45, v46, v47, v48, v49, (uint64_t)"BSAssistantCallback_Boolean");
      if ((_DWORD)v51 != -6727)
      {
        v12 = v51;
        if ((_DWORD)v51)
          goto LABEL_31;
        if (CFStringCompare(a2, CFSTR("keychainBaseStationType"), 0) == kCFCompareEqualTo)
        {
          v64 = sub_21A709FC0(a1, v67, v52, v53, v54, v55, v56, v57);
LABEL_34:
          v12 = v64;
          if (!(_DWORD)v64)
            goto LABEL_35;
LABEL_31:
          sub_21A709C24((char *)v19);
          return v12;
        }
        if (CFStringCompare(a2, CFSTR("keychainNetworkType"), 0) == kCFCompareEqualTo)
        {
          v64 = sub_21A70A0F8(a1, v67, v58, v59, v60, v61, v62, v63);
          goto LABEL_34;
        }
      }
LABEL_35:
      v65 = cf;
      *a4 = cf;
      CFRetain(v65);
      v12 = 0;
      goto LABEL_31;
    }
    return 4294960568;
  }
  return v12;
}

uint64_t sub_21A70CCE4(uint64_t a1, const __CFString *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef cf;
  uint64_t v17;

  cf = 0;
  if (!a1)
    return 4294960578;
  v17 = 0;
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    v5 = 4294960591;
    if (a2 && a3 >= 1 && a4)
    {
      v7 = sub_21A70CE0C(a1, a2, 0, 0, a3, (CFNumberRef *)&cf);
      if ((_DWORD)v7)
      {
        v5 = v7;
        if ((_DWORD)v7 != -6722)
          goto LABEL_11;
      }
      else
      {
        if (!cf)
          return 4294960568;
        v9 = sub_21A68F3C8((const __CFArray *)cf, a2);
        if (v9 != -1)
        {
          sub_21A693B94((const __CFString *)cf, (uint64_t)&v17, (UInt8 *)"[*]:obj", v10, v11, v12, v13, v14, v9);
          v5 = v15;
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (!(_DWORD)v5)
          {
            if (v17)
            {
              v5 = 0;
              *a4 = v17;
              v17 = 0;
            }
            else
            {
              v5 = 4294960568;
            }
          }
          goto LABEL_11;
        }
      }
      v5 = 4294960569;
    }
  }
  else
  {
    v5 = 4294960578;
  }
LABEL_11:
  if (cf)
    CFRelease(cf);
  return v5;
}

uint64_t sub_21A70CE0C(uint64_t a1, const __CFString *a2, uint64_t a3, int a4, uint64_t a5, CFNumberRef *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFNumberRef *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  __CFArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __CFArray *v51;
  CFNumberRef v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFNumberRef v58;
  __CFArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CFMutableArrayRef Mutable;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BOOL4 v93;
  CFNumberRef *v95;
  uint64_t v96;
  uint64_t v97;
  const __CFAllocator *allocator;
  int valuePtr;
  uint64_t v100;

  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  if (a2)
    v12 = 3;
  else
    v12 = 1;
  v13 = mach_absolute_time();
  v18 = v13 / sub_21A6A3B70() + a5;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"retries into: %dx\n", v14, v15, v16, v17, v12);
  v19 = mach_absolute_time();
  if (v19 / sub_21A6A3B70() < v18)
  {
    v24 = 0;
    v25 = a6;
    v26 = 0;
    v27 = 0;
    v95 = v25;
    v97 = a5 / v12;
    if (v25)
      v28 = a5 / v12 == 0;
    else
      v28 = 1;
    v29 = v28;
    v30 = (uint64_t *)MEMORY[0x24BDBD270];
    if (!a4)
      v30 = (uint64_t *)MEMORY[0x24BDBD268];
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v96 = *v30;
    while (1)
    {
      if (v24)
      {
        if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d duplicateErrors: %d\n", v20, v21, v22, v23, v27);
        v31 = sub_21A70BD94(a1, 5);
        if ((_DWORD)v31)
          return v31;
      }
      if (v26 >= 5)
        v32 = 0;
      else
        v32 = a3;
      if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout_sub(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"inStopAtMACAddress: %@\n", v20, v21, v22, v23, (uint64_t)a2);
      v100 = 0;
      v33 = *(_DWORD *)(a1 + 88);
      v34 = v33 == 1634561902;
      if (v33 == 1634561902)
        v35 = v29;
      else
        v35 = 1;
      if (v34)
        v27 = 4294960591;
      else
        v27 = 4294960578;
      if ((v35 & 1) != 0)
        goto LABEL_44;
      v36 = sub_21A709AF8(a1, &v100);
      v42 = v100;
      if ((_DWORD)v36)
      {
        v27 = v36;
        if (!v100)
          goto LABEL_42;
        goto LABEL_41;
      }
      if (!v100)
      {
        v27 = 4294960568;
        if (!a2)
          return v27;
        goto LABEL_45;
      }
      if (!a2)
        goto LABEL_60;
      if (*(_DWORD *)v100 != 1634561902)
        goto LABEL_73;
      v45 = *(__CFArray **)(v100 + 24);
      if (!v45)
        goto LABEL_76;
      v27 = sub_21A693A8C(allocator, v45, (uint64_t)"%kO=%O", v37, v38, v39, v40, v41, (uint64_t)CFSTR("BSAssistantCallback_String"));
      if (!(_DWORD)v27)
      {
        if (!v32)
          goto LABEL_60;
        if (*(_DWORD *)v42 != 1634561902)
        {
LABEL_73:
          v27 = 4294960578;
          goto LABEL_41;
        }
        v51 = *(__CFArray **)(v42 + 24);
        if (!v51)
        {
LABEL_76:
          v27 = 4294960591;
          goto LABEL_41;
        }
        v27 = sub_21A693A8C(allocator, v51, (uint64_t)"%kO=%O", v46, v47, v48, v49, v50, (uint64_t)CFSTR("BSAssistantCallback_BonjourSeed"));
        if (!(_DWORD)v27)
        {
LABEL_60:
          valuePtr = v97;
          v52 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
          if (v52)
          {
            v58 = v52;
            if (*(_DWORD *)v42 != 1634561902)
            {
              v27 = 4294960578;
              goto LABEL_78;
            }
            v59 = *(__CFArray **)(v42 + 24);
            if (!v59)
            {
              v27 = 4294960591;
              goto LABEL_78;
            }
            v27 = sub_21A693A8C(allocator, v59, (uint64_t)"%kO=%O", v53, v54, v55, v56, v57, (uint64_t)CFSTR("BSAssistantCallback_Number"));
            CFRelease(v58);
            if ((_DWORD)v27)
              goto LABEL_41;
            v27 = sub_21A70B204(v42, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), v96, v60, v61, v62, v63, v64);
            if ((_DWORD)v27)
              goto LABEL_41;
            Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x24BDBD690]);
            if (Mutable)
            {
              v58 = Mutable;
              v27 = sub_21A70B204(v42, (uint64_t)CFSTR("BSAssistantCallback_BrowseRecords"), (uint64_t)Mutable, v66, v67, v68, v69, v70);
              if (!(_DWORD)v27)
              {
                v27 = sub_21A70F790((_DWORD *)v42, v71, v72, v73, v74, v75, v76, v77);
                if (!(_DWORD)v27)
                {
                  v85 = sub_21A70A598(v42, v78, v79, v80, v81, v82, v83, v84);
                  if ((_DWORD)v85)
                  {
                    v27 = v85;
                    if ((_DWORD)v85 == -6723)
                    {
                      v27 = 4294960573;
                      sub_21A70F994((NSObject **)v42, -6723, v86, v87, v88, v89, v90, v91);
                    }
                    goto LABEL_78;
                  }
                  v27 = *(unsigned int *)(v42 + 32);
                  v93 = (_DWORD)v27 != -6722 && (_DWORD)v27 != -6745;
                  if (!a2 && !v93)
                  {
                    *(_DWORD *)(v42 + 32) = 0;
                    goto LABEL_88;
                  }
                  if (a2 && (_DWORD)v27 == -6745)
                  {
                    v27 = 4294960569;
                    *(_DWORD *)(v42 + 32) = -6727;
                  }
                  else if (!(_DWORD)v27)
                  {
LABEL_88:
                    if (CFArrayGetCount(v58) && (!a2 || sub_21A68F3C8(v58, a2) != -1))
                    {
                      v27 = 0;
                      *v95 = v58;
                      goto LABEL_41;
                    }
                    v27 = 4294960569;
                  }
                }
              }
LABEL_78:
              CFRelease(v58);
              goto LABEL_41;
            }
          }
          v27 = 4294960568;
        }
      }
LABEL_41:
      sub_21A709C24((char *)v42);
LABEL_42:
      if ((_DWORD)v27 == -6730)
        ++v26;
LABEL_44:
      if (!a2)
        return v27;
LABEL_45:
      if ((v27 + 6730) <= 8 && ((1 << (v27 + 74)) & 0x109) != 0)
      {
        v44 = mach_absolute_time();
        --v24;
        if (v44 / sub_21A6A3B70() < v18)
          continue;
      }
      return v27;
    }
  }
  return 0;
}

uint64_t sub_21A70D318(uint64_t a1, const __CFString *a2, const __CFString *cf, int a4, uint64_t a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  CFTypeRef cfa;
  const __CFString *v42;

  cfa = 0;
  if (a6)
    *a6 = 0;
  v42 = 0;
  v39 = 0;
  v40 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
  {
    v14 = 4294960578;
    goto LABEL_19;
  }
  v14 = 4294960591;
  if (!cf || a5 < 1 || !a6)
  {
LABEL_19:
    v22 = 0;
    v23 = 0;
    if (!a6)
      goto LABEL_22;
    goto LABEL_20;
  }
  CFRetain(cf);
  if (a2)
    CFRetain(a2);
  sub_21A693B94(cf, (uint64_t)&v40, (UInt8 *)"%ks.%ks", v15, v16, v17, v18, v19, (uint64_t)"txt");
  v14 = v21;
  v22 = cf;
  v23 = a2;
  if (!(_DWORD)v21)
  {
    if (!v40)
      goto LABEL_46;
    v39 = 0;
    if (a4)
    {
      sub_21A693B94(cf, (uint64_t)&v39, (UInt8 *)"%ks.%ks", v20, a5, (uint64_t)a6, a7, a8, (uint64_t)"txt");
      if ((_DWORD)v24 != -6727)
      {
        v14 = v24;
        v22 = cf;
        v23 = a2;
        if ((_DWORD)v24)
          goto LABEL_20;
        if (!v39)
          goto LABEL_46;
      }
    }
    if (a2)
      sub_21A70ACEC(a1, 7, 0, (uint64_t)a2, a5, (uint64_t)a6, a7, a8);
    else
      sub_21A70A778(a1, 7, 0, (uint64_t)cf, a5, (uint64_t)a6, a7, a8);
    v33 = v39;
    v32 = v40;
    sub_21A68E77C(cf);
    v35 = sub_21A70CE0C(a1, v32, v33, v34, a5, (CFNumberRef *)&cfa);
    if ((_DWORD)v35 == -6722)
      goto LABEL_47;
    v14 = v35;
    v22 = cf;
    v23 = a2;
    if ((_DWORD)v35)
      goto LABEL_20;
    if (!cfa)
      goto LABEL_46;
    v36 = sub_21A68F3C8((const __CFArray *)cfa, v40);
    if (v36 == -1)
    {
LABEL_47:
      v14 = 4294960569;
      goto LABEL_48;
    }
    sub_21A693B94((const __CFString *)cfa, (uint64_t)&v42, (UInt8 *)"[*]:obj", v37, a5, (uint64_t)a6, a7, a8, v36);
    v14 = v38;
    if (cfa)
    {
      CFRelease(cfa);
      cfa = 0;
    }
    v22 = cf;
    v23 = a2;
    if (!(_DWORD)v14)
    {
      v25 = v42;
      if (v42)
      {
        v14 = 0;
        *a6 = v42;
        v42 = 0;
        v23 = a2;
        v22 = cf;
        goto LABEL_21;
      }
LABEL_46:
      v14 = 4294960568;
LABEL_48:
      v22 = cf;
      v23 = a2;
    }
  }
LABEL_20:
  v25 = (const __CFString *)*a6;
  if (*a6)
  {
LABEL_21:
    v26 = a1;
    v27 = v14;
LABEL_24:
    sub_21A70A778(v26, 8, v27, (uint64_t)v25, a5, (uint64_t)a6, a7, a8);
    goto LABEL_29;
  }
LABEL_22:
  if (cf)
  {
    v26 = a1;
    v27 = v14;
    v25 = cf;
    goto LABEL_24;
  }
  if (a2)
  {
    v28 = a1;
    v29 = v14;
    v30 = a2;
  }
  else
  {
    v30 = &stru_24DD08368;
    v28 = a1;
    v29 = v14;
  }
  sub_21A70ACEC(v28, 8, v29, (uint64_t)v30, a5, (uint64_t)a6, a7, a8);
LABEL_29:
  if (cfa)
  {
    CFRelease(cfa);
    cfa = 0;
  }
  if (v22)
    CFRelease(v22);
  if (v23)
    CFRelease(v23);
  return v14;
}

uint64_t sub_21A70D5E4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFNumberRef v17;

  if (!a1)
    return 4294960578;
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  result = 4294960591;
  if (a2 >= 1)
  {
    if (a3)
    {
      v17 = 0;
      sub_21A70A778(a1, 3, 0, 0, a5, a6, a7, a8);
      v12 = sub_21A70CE0C(a1, 0, 0, 0, a2, &v17);
      sub_21A70A778(a1, 4, 0, 0, v13, v14, v15, v16);
      result = 4294960569;
      if ((_DWORD)v12 != -6727 && (_DWORD)v12 != -6722)
      {
        result = v12;
        if (!(_DWORD)v12)
        {
          if (v17)
          {
            result = 0;
            *a3 = v17;
          }
          else
          {
            return 4294960568;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21A70D6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_WarnUser(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v45);
  v46 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v17 = 4294960591;
  if (a2 && a5)
  {
    v18 = sub_21A709AF8(a1, &v46);
    v24 = v46;
    if ((_DWORD)v18)
    {
      v17 = v18;
      if (!v46)
        return v17;
      goto LABEL_36;
    }
    if (v46)
    {
      if (*(_DWORD *)v46 == 1634561902)
      {
        v26 = *(__CFArray **)(v46 + 24);
        if (v26)
        {
          v17 = sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], v26, (uint64_t)"%kO=%O", v19, v20, v21, v22, v23, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptKey"));
          if (!(_DWORD)v17)
          {
            if (!a3
              || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptParam1"), a3, v27, v28, v29, v30, v31), !(_DWORD)v17))
            {
              if (!a4
                || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_PromptParam2"), a4, v27, v28, v29, v30, v31), !(_DWORD)v17))
              {
                v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageKey"), a5, v27, v28, v29, v30, v31);
                if (!(_DWORD)v17)
                {
                  if (!a6
                    || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageParam1"), a6, v32, v33, v34, v35, v36), !(_DWORD)v17))
                  {
                    if (!a7
                      || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_MessageParam2"), a7, v32, v33, v34, v35, v36), !(_DWORD)v17))
                    {
                      if (!a8
                        || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_OkKey"), a8, v32, v33, v34, v35, v36), !(_DWORD)v17))
                      {
                        v37 = a9;
                        if (!a9
                          || (v17 = sub_21A70B204(v24, (uint64_t)CFSTR("kBSAssistantCallback_Warn_CancelKey"), a9, v32, v33, v34, v35, v36), !(_DWORD)v17))
                        {
                          v17 = sub_21A70A23C((_QWORD *)v24, 3, v37, v32, v33, v34, v35, v36);
                          if (!(_DWORD)v17)
                          {
                            v17 = sub_21A70A598(v24, v38, v39, v40, v41, v42, v43, v44);
                            if (!(_DWORD)v17)
                              v17 = *(unsigned int *)(v24 + 32);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v17 = 4294960578;
      }
LABEL_36:
      sub_21A709C24((char *)v24);
      return v17;
    }
    return 4294960568;
  }
  return v17;
}

uint64_t sub_21A70D934(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v23;
  CFNumberRef v24;
  CFNumberRef v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int valuePtr;
  char *v46;

  v46 = 0;
  if (!a1)
    return 4294960578;
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    v3 = a2;
    v4 = 4294960591;
    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 96);
      if (v5)
      {
        v4 = sub_21A689FCC(v5);
        if ((_DWORD)v4 == -6709)
        {
          valuePtr = v3;
          if (*(_DWORD *)(a1 + 88) == 1634561902 && *(_DWORD *)(a1 + 36) != 1)
          {
            v44 = sub_21A709D98(a1, v6, v7, v8, v9, v10, v11, v12);
            if ((_DWORD)v44)
            {
              v4 = v44;
              v13 = 0;
LABEL_25:
              if (v13)
                sub_21A709E44(a1, v15, v16, v17, v18, v19, v20, v21);
              goto LABEL_13;
            }
            v13 = 1;
          }
          else
          {
            v13 = 0;
          }
          v14 = sub_21A709AF8(a1, &v46);
          if ((_DWORD)v14)
          {
            v4 = v14;
          }
          else
          {
            v23 = v46;
            if (v46
              && (v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr)) != 0)
            {
              v25 = v24;
              v4 = sub_21A70B204((uint64_t)v23, (uint64_t)CFSTR("BSAssistantCallback_Number"), (uint64_t)v24, v17, v18, v19, v20, v21);
              CFRelease(v25);
              if (!(_DWORD)v4)
              {
                sub_21A70ACEC(a1, 11, 0, 0, v18, v19, v20, v21);
                sub_21A70DB04((uint64_t)v23, v26, v27, v28, v29, v30, v31, v32);
                v4 = sub_21A70A598((uint64_t)v23, v33, v34, v35, v36, v37, v38, v39);
                sub_21A70ACEC(a1, 12, v4, 0, v40, v41, v42, v43);
                if ((_DWORD)v4)
                {
                  if ((_DWORD)v4 == -6723)
                  {
                    v4 = 4294960573;
                    sub_21A70DCB4((uint64_t)v23, 4294960573, v16, v17, v18, v19, v20, v21);
                  }
                }
                else
                {
                  v4 = *((unsigned int *)v23 + 8);
                  if ((_DWORD)v4 == -6722)
                    v4 = 4294960574;
                }
              }
            }
            else
            {
              v4 = 4294960568;
            }
          }
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    v4 = 4294960578;
  }
LABEL_13:
  if (v46)
    sub_21A709C24(v46);
  return v4;
}

uint64_t sub_21A70DB04(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *global_queue;
  NSObject *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t v17;
  int v18;

  v8 = (_DWORD *)result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_AssistantResourceAquiredCallbackStart(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v17);
  }
  if (v8)
  {
    v18 = 0;
    if (*v8 == 1634561902)
    {
      v9 = *((_QWORD *)v8 + 1);
      if (v9 && *(_QWORD *)(v9 + 96))
      {
        sub_21A693B94(*((const __CFString **)v8 + 3), (uint64_t)&v18, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
        v11 = v10;
        if (!v10)
        {
          if (v18 < 1)
          {
            v11 = -6710;
          }
          else
          {
            v12 = *((_QWORD *)v8 + 6);
            if (v12)
            {
              dispatch_source_cancel(v12);
              dispatch_release(*((dispatch_object_t *)v8 + 6));
              *((_QWORD *)v8 + 6) = 0;
            }
            global_queue = dispatch_get_global_queue(0, 0);
            v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, global_queue);
            *((_QWORD *)v8 + 6) = v14;
            if (v14)
            {
              dispatch_set_context(v14, v8);
              dispatch_source_set_event_handler_f(*((dispatch_source_t *)v8 + 6), (dispatch_function_t)sub_21A70FF74);
              v15 = *((_QWORD *)v8 + 6);
              v16 = dispatch_time(0, 1000000000 * v18);
              dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
              dispatch_resume(*((dispatch_object_t *)v8 + 6));
              result = sub_21A689A60(*(_QWORD *)(*((_QWORD *)v8 + 1) + 96), (uint64_t)sub_21A70FF8C, (uint64_t)v8);
              v11 = result;
              if (!(_DWORD)result)
                return result;
            }
            else
            {
              v11 = -6728;
            }
          }
        }
      }
      else
      {
        v11 = -6705;
      }
    }
    else
    {
      v11 = -6718;
    }
    return sub_21A70B2E0(v8, v11, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_21A70DCB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v9;
  NSObject *v10;
  int v11;

  v9 = (_DWORD *)result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void _BSAssistant_LinkChangeCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"result: %m\n", a5, a6, a7, a8, a2);
  }
  if (v9)
  {
    if (*v9 == 1634561902)
    {
      result = (uint64_t)CFNotificationCenterGetLocalCenter();
      if (result)
      {
        CFNotificationCenterRemoveObserver((CFNotificationCenterRef)result, v9, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"), 0);
        pthread_mutex_lock((pthread_mutex_t *)(v9 + 14));
        v10 = *((_QWORD *)v9 + 6);
        if (v10)
        {
          dispatch_source_cancel(v10);
          dispatch_release(*((dispatch_object_t *)v9 + 6));
          *((_QWORD *)v9 + 6) = 0;
        }
        result = pthread_mutex_unlock((pthread_mutex_t *)(v9 + 14));
        v11 = a2;
      }
      else
      {
        v11 = -6728;
      }
    }
    else
    {
      v11 = -6718;
    }
    if ((_DWORD)a2 != -6723)
      return sub_21A70B2E0(v9, v11, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_21A70DDCC(uint64_t a1)
{
  uint64_t v1;

  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v1 = *(_QWORD *)(a1 + 96);
  if (v1)
    return sub_21A68A1B4(v1);
  else
    return 4294960591;
}

uint64_t sub_21A70DE00(uint64_t a1, const __CFString *a2, const __CFString *a3, int a4, const void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef cf;

  cf = 0;
  if (!a1)
    return 4294960578;
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    if (a2)
    {
      v13 = 0;
      if (a4)
        v14 = 20;
      else
        v14 = 2;
      while (1)
      {
        if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_JoinNetworkNameWithPasswordPrompt(AssistantContextRef, CFStringRef, CFStringRef, Boolean, Boolean)", 800, (uint64_t)"retries: %d\n", (uint64_t)a5, a6, a7, a8, v13);
        v16 = sub_21A70C110(a1, a2, 3, &cf, (uint64_t)a5, a6, a7, a8);
        v17 = v16;
        if (a4 && (_DWORD)v16 == -6727)
        {
          v17 = 4294960569;
          if (v13 >= v14)
            goto LABEL_33;
        }
        else
        {
          if ((_DWORD)v16)
            goto LABEL_33;
          if (!cf)
            return 4294960568;
          v17 = sub_21A70E00C(a1, (const char *)cf, a3, a4, a5, 1, a7, a8);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          if (v13 >= v14 || (_DWORD)v17 != -3905 && (_DWORD)v17 != -6727)
            goto LABEL_33;
        }
        if (++v13)
        {
          if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_JoinNetworkNameWithPasswordPrompt(AssistantContextRef, CFStringRef, CFStringRef, Boolean, Boolean)", 800, (uint64_t)"waiting err: %#m pauseSecs: %d\n", (uint64_t)a5, a6, a7, a8, v17);
          v15 = sub_21A70BD94(a1, 6);
          if ((_DWORD)v15)
          {
            v17 = v15;
            goto LABEL_33;
          }
        }
      }
    }
    v17 = 4294960591;
  }
  else
  {
    v17 = 4294960578;
  }
LABEL_33:
  if (cf)
    CFRelease(cf);
  return v17;
}

uint64_t sub_21A70E004(uint64_t a1, const char *a2, const __CFString *a3, int a4, const void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_21A70E00C(a1, a2, a3, a4, a5, 1, a7, a8);
}

uint64_t sub_21A70E00C(uint64_t a1, const char *a2, const __CFString *a3, int a4, CFTypeRef a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  const __CFString *v13;
  int v14;
  CFTypeRef v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFArray *v29;
  CFNumberRef v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFNumberRef v36;
  __CFArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  CFIndex Count;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v81;
  unint64_t v82;
  CFIndex v83;
  const __CFAllocator *allocator;
  int v85;
  uint64_t v86;
  unsigned int v88;
  CFTypeRef v89;
  int valuePtr;
  uint64_t v91;
  int v92;
  const __CFString *v93;
  const __CFString *v94;

  v8 = a6;
  v9 = (int)a5;
  v89 = 0;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_JoinNetworkWithPasswordPromptAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, Boolean, Boolean)", 800, (uint64_t)" \n", (uint64_t)a5, a6, a7, a8, v81);
  if (!a1)
  {
    v28 = 4294960578;
    goto LABEL_113;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902)
  {
    v28 = 4294960578;
    goto LABEL_108;
  }
  if (!a2)
  {
    v28 = 4294960591;
    goto LABEL_113;
  }
  v86 = sub_21A72E204((uint64_t)a2, a2);
  if (!v86)
  {
    v28 = 4294960591;
    goto LABEL_112;
  }
  sub_21A70A778(a1, 5, 0, (uint64_t)a2, (uint64_t)a5, a6, a7, a8);
  v13 = a3;
  v89 = a3;
  if (a3)
  {
    CFRetain(a3);
    v13 = a3;
  }
  if (a4)
    v14 = 2;
  else
    v14 = 1;
  v88 = v14;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = v13;
  v85 = v9;
  while (1)
  {
    if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _JoinNetworkRetryAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex, Boolean)", 800, (uint64_t)"\n", (uint64_t)a5, a6, a7, a8, v81);
    if (*(_DWORD *)(a1 + 88) != 1634561902)
      break;
    v16 = mach_absolute_time();
    v17 = 0;
    v18 = 0;
    v19 = v16 / sub_21A6A3B70() + 12;
    while (1)
    {
      v20 = mach_absolute_time();
      if (v20 / sub_21A6A3B70() >= v19)
      {
        v28 = v17;
        goto LABEL_99;
      }
      if (v18)
      {
        if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _JoinNetworkRetryAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex, Boolean)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d (kDefault_JoiningBusy_RetrySecs)\n", (uint64_t)a5, a6, a7, a8, v17);
        v22 = sub_21A70BD94(a1, 2);
        if ((_DWORD)v22)
          break;
      }
      if (v8)
      {
        v91 = 0;
        if (*(_DWORD *)(a1 + 88) == 1634561902)
        {
          v23 = sub_21A72E204((uint64_t)a2, v21);
          if (v23)
          {
            v24 = v23;
            if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
              sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _JoinNetworkAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex)", 800, (uint64_t)"networkName: %@\n", (uint64_t)a5, a6, a7, a8, v24);
            v25 = sub_21A709AF8(a1, &v91);
            v27 = v91;
            if ((_DWORD)v25)
            {
              v28 = v25;
              if (!v91)
                goto LABEL_60;
              goto LABEL_59;
            }
            if (v91)
            {
              if (*(_DWORD *)v91 != 1634561902)
              {
                v28 = 4294960578;
                goto LABEL_59;
              }
              v29 = *(__CFArray **)(v91 + 24);
              if (!v29)
              {
                v28 = 4294960591;
                goto LABEL_59;
              }
              v28 = sub_21A693A8C(allocator, v29, (uint64_t)"%kO=%O", v26, (uint64_t)a5, a6, a7, a8, (uint64_t)CFSTR("BSAssistantCallback_String"));
              if (!(_DWORD)v28)
              {
                valuePtr = 60;
                v30 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
                if (!v30)
                {
                  v28 = 4294960568;
                  goto LABEL_59;
                }
                v36 = v30;
                if (*(_DWORD *)v27 == 1634561902)
                {
                  v37 = *(__CFArray **)(v27 + 24);
                  if (v37)
                  {
                    v28 = sub_21A693A8C(allocator, v37, (uint64_t)"%kO=%O", v31, v32, v33, v34, v35, (uint64_t)CFSTR("BSAssistantCallback_Number"));
                    CFRelease(v36);
                    if (!(_DWORD)v28)
                    {
                      sub_21A70F334(v27, v38, v39, v40, v41, v42, v43, v44);
                      v49 = sub_21A710244(a1, a2, (uint64_t)v15, v88, v45, v46, v47, v48);
                      if ((_DWORD)v49)
                      {
                        v28 = v49;
                        goto LABEL_51;
                      }
                      v57 = sub_21A70A598(v27, v50, v51, v52, v53, v54, v55, v56);
                      if ((_DWORD)v57)
                      {
                        v28 = v57;
                        if ((_DWORD)v57 == -6723)
                        {
                          v28 = 4294960573;
LABEL_51:
                          sub_21A70DCB4(v27, 4294960573, v51, v52, v53, v54, v55, v56);
                        }
                      }
                      else
                      {
                        v28 = *(unsigned int *)(v27 + 32);
                        if ((_DWORD)v28)
                        {
                          if ((_DWORD)v28 == -6722)
                            v28 = 4294960574;
                        }
                        else
                        {
                          if (dword_2550F4548 <= 800
                            && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                          {
                            sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _BSAssistant_WaitForIPv6Flags(AssistantContextRef, CFIndex, int32_t, Boolean)", 800, (uint64_t)"inFlags: 0x%x inAND: %d\n", v53, v54, v55, v56, 2);
                          }
                          v94 = 0;
                          if (*(_DWORD *)(a1 + 88) == 1634561902)
                          {
                            v58 = mach_absolute_time();
                            v59 = v58 / sub_21A6A3B70() + 10;
                            v93 = 0;
                            v60 = mach_absolute_time();
                            v82 = v59;
                            if (v60 / sub_21A6A3B70() < v59)
                            {
                              while (!sub_21A72E0D8(&v94, v61, v62))
                              {
                                if (!v94)
                                  break;
                                sub_21A693B94(v94, (uint64_t)&v93, (UInt8 *)"%kO.%kO", v63, v64, v65, v66, v67, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_IPv6Dict"));
                                if (v68)
                                  break;
                                if (!v93)
                                  break;
                                Count = CFArrayGetCount((CFArrayRef)v93);
                                if (!Count)
                                  break;
                                v83 = Count;
                                if (Count >= 1)
                                {
                                  v75 = 0;
                                  v76 = 1;
                                  while (1)
                                  {
                                    v92 = 0;
                                    sub_21A693B94(v93, (uint64_t)&v92, (UInt8 *)"[*]:int", v70, v71, v72, v73, v74, v75);
                                    if (v77)
                                      goto LABEL_94;
                                    if (dword_2550F4548 <= 800
                                      && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                                    {
                                      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _BSAssistant_WaitForIPv6Flags(AssistantContextRef, CFIndex, int32_t, Boolean)", 800, (uint64_t)"Checking IPv6 flags: 0x%x against: 0x%x\n", v71, v72, v73, v74, 2);
                                    }
                                    if ((v92 & 2) != 0)
                                    {
                                      v76 = ++v75 < v83;
                                      if (v83 != v75)
                                        continue;
                                    }
                                    goto LABEL_90;
                                  }
                                }
                                v76 = 0;
LABEL_90:
                                if (v94)
                                {
                                  CFRelease(v94);
                                  v94 = 0;
                                }
                                if (!v76)
                                {
                                  sub_21A70BD94(a1, 1);
                                  v93 = 0;
                                  v78 = mach_absolute_time();
                                  if (v78 / sub_21A6A3B70() < v82)
                                    continue;
                                }
                                break;
                              }
                            }
LABEL_94:
                            if (v94)
                              CFRelease(v94);
                          }
                          v28 = 0;
                        }
                      }
                    }
                    goto LABEL_59;
                  }
                  v28 = 4294960591;
                }
                else
                {
                  v28 = 4294960578;
                }
                CFRelease(v30);
              }
LABEL_59:
              sub_21A709C24((char *)v27);
              goto LABEL_60;
            }
            v28 = 4294960568;
          }
          else
          {
            v28 = 4294960569;
          }
        }
        else
        {
          v28 = 4294960578;
        }
      }
      else
      {
        v28 = sub_21A710244(a1, a2, (uint64_t)v15, v88, (uint64_t)a5, a6, a7, a8);
      }
LABEL_60:
      ++v18;
      v17 = 4294960575;
      if ((_DWORD)v28 != -6721)
        goto LABEL_99;
    }
    v28 = v22;
LABEL_99:
    if ((_DWORD)v28 != -16)
      goto LABEL_117;
    if (!v85)
    {
      v28 = 4294967280;
      goto LABEL_108;
    }
    if (v89)
    {
      CFRelease(v89);
      v89 = 0;
    }
    v79 = sub_21A70CA8C(a1, CFSTR("keychainNetworkType"), v86, &v89, (uint64_t)a5, a6, a7, a8);
    if ((_DWORD)v79)
    {
      v28 = v79;
      goto LABEL_108;
    }
    v15 = v89;
    if (!v89)
    {
      v28 = 4294960568;
      goto LABEL_108;
    }
  }
  v28 = 4294960578;
LABEL_117:
  if (!(_DWORD)v28)
  {
    if (*(_BYTE *)(a1 + 33))
    {
      a5 = v89;
      if (v89)
      {
        if (!a3)
          goto LABEL_123;
        if (CFStringCompare((CFStringRef)v89, a3, 0))
        {
          a5 = v89;
LABEL_123:
          sub_21A70C8C0(a1, (uint64_t)CFSTR("keychainNetworkType"), v86, 0, (uint64_t)a5, a6, a7, a8);
        }
        v28 = 0;
      }
    }
  }
LABEL_108:
  if (a2)
LABEL_112:
    sub_21A70A778(a1, 6, 0, (uint64_t)a2, (uint64_t)a5, a6, a7, a8);
LABEL_113:
  if (v89)
    CFRelease(v89);
  return v28;
}

uint64_t sub_21A70E760(uint64_t a1, const __CFString *cf, int a3, int a4, const void *a5, CFStringRef *a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFTypeRef v34;
  uint64_t v36;
  uint64_t v37;
  CFTypeRef cfa;

  cfa = 0;
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_CopyBrowseInfoForBaseAfterJoiningNetworkIfNeeded(AssistantContextRef, CFDictionaryRef, Boolean, Boolean, Boolean, CFStringRef *, CFDictionaryRef *)", 800, (uint64_t)" \n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v37);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v15 = 4294960591;
  if (cf && a7)
  {
    CFRetain(cf);
    v23 = sub_21A68E3E4((const __CFDictionary *)cf);
    if (!v23 && !sub_21A68E5C0(cf, v16, v17, v18, v19, v20, v21, v22))
      goto LABEL_14;
    v24 = sub_21A68EEAC(cf, v16, v17, v18, v19, v20, v21, v22);
    if (v24)
    {
      v30 = v24;
      if (sub_21A70B84C(a1, v24, a6, v25, v26, v27, v28, v29))
      {
        if (!v23)
        {
LABEL_14:
          v34 = 0;
LABEL_26:
          v15 = 0;
          *a7 = v34;
          goto LABEL_27;
        }
      }
      else
      {
        v15 = sub_21A70DE00(a1, v30, 0, a4, a5, v31, v32, v33);
        if ((_DWORD)v15)
          goto LABEL_28;
      }
      if (a4)
        v36 = 120;
      else
        v36 = 60;
      v15 = sub_21A70D318(a1, 0, cf, a3, v36, &cfa, v32, v33);
      v34 = cfa;
      if (!(_DWORD)v15)
      {
        if (!cfa)
        {
          v15 = 4294960568;
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      if (cfa)
      {
        CFRelease(cfa);
LABEL_27:
        cfa = 0;
      }
    }
    else
    {
      v15 = 4294960569;
    }
LABEL_28:
    CFRelease(cf);
  }
  return v15;
}

uint64_t sub_21A70E918(uint64_t a1, const char *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  CFTypeRef cf;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_JoinNetworkAndBrowseForTheBaseStation(AssistantContextRef, CFDictionaryRef, Boolean, CFDictionaryRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v24);
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  v11 = 4294960591;
  if (a2 && a4)
  {
    v12 = (const __CFString *)sub_21A72E204((uint64_t)a2, a2);
    if (!v12)
      return 4294960569;
    if (sub_21A70B84C(a1, v12, 0, v13, v14, v15, v16, v17)
      || (v11 = sub_21A70E00C(a1, a2, 0, 0, 0, 1, v21, v22), !(_DWORD)v11))
    {
      v24 = 0;
      cf = 0;
      v11 = sub_21A70B648(a1, 0, &cf, v18, v19, v20, v21, v22);
      if (!(_DWORD)v11)
      {
        if (!cf)
          return 4294960568;
        v11 = sub_21A70CCE4(a1, (const __CFString *)cf, 60, &v24);
        if (cf)
          CFRelease(cf);
        if (!(_DWORD)v11)
        {
          if (v24)
          {
            v11 = 0;
            *a4 = v24;
            return v11;
          }
          return 4294960568;
        }
      }
    }
  }
  return v11;
}

uint64_t sub_21A70EA78(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_AssistantMonitoringContext_Release(AssistantMonitoringContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v13);
  if (!a1 || *((_DWORD *)a1 + 26) != 1634561902)
    return 4294960578;
  v9 = *((_QWORD *)a1 + 12);
  if (!v9)
    return 4294960591;
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  *((_DWORD *)a1 + 26) = 1095585614;
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
  *((_DWORD *)a1 + 4) = 0;
  v10 = *((_QWORD *)a1 + 11);
  if (v10)
    dispatch_release(v10);
  v11 = *((_QWORD *)a1 + 12);
  if (v11)
    dispatch_release(v11);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  free(a1);
  return 0;
}

uint64_t sub_21A70EB58(_DWORD *a1, uint64_t a2, int a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  CFTypeRef cf;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus BSAssistant_MonitorBaseForACPSystemFlagTrue(AssistantCallbackContextRef, BSRef, ACPSystemFlags, AssistantMonitoringContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v32);
  cf = 0;
  if (!a1 || *a1 != 1634561902)
    return 4294960578;
  v12 = 4294960591;
  if (a2 && a3 && a4)
  {
    if (sub_21A6D4724(a2, 1095593838))
    {
      if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus __ACPMonitoringContext_Create(AssistantCallbackContextRef, AssistantMonitoringContextRef *)", 800, (uint64_t)" \n", v13, v14, v15, v16, v32);
      if (*a1 == 1634561902)
      {
        v17 = malloc_type_calloc(1uLL, 0x70uLL, 0x1020040071D634FuLL);
        if (v17)
        {
          v18 = (uint64_t)v17;
          *v17 = a1;
          v17[1] = 0;
          *((_DWORD *)v17 + 4) = 0;
          *((_BYTE *)v17 + 20) = 0;
          v17[11] = dispatch_queue_create("__ACPMonitoringContext.queue", 0);
          *(_QWORD *)(v18 + 96) = dispatch_group_create();
          v19 = pthread_mutex_init((pthread_mutex_t *)(v18 + 24), 0);
          if ((_DWORD)v19)
          {
            v12 = v19;
            sub_21A70EA78((char *)v18, v20, v21, v22, v23, v24, v25, v26);
          }
          else
          {
            *(_DWORD *)(v18 + 104) = 1634561902;
            *(_QWORD *)(v18 + 8) = a2;
            *(_DWORD *)(v18 + 16) = a3;
            v12 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], &cf, (uint64_t)"{%ks={%kC={}%kC={}%kC={}}}", v22, v23, v24, v25, v26, (uint64_t)"filters");
            if (!(_DWORD)v12)
            {
              v12 = sub_21A6D669C(a2, cf, (uint64_t)sub_21A70ED98, v18, v27, v28, v29, v30);
              if (!(_DWORD)v12)
                *a4 = v18;
            }
          }
        }
        else
        {
          v12 = 4294960568;
        }
      }
      else
      {
        v12 = 4294960578;
      }
    }
    else
    {
      v12 = 4294960561;
    }
  }
  if (cf)
    CFRelease(cf);
  return v12;
}

void sub_21A70ED98(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;

  if (a1)
  {
    v8 = 0;
  }
  else if (a3 && *(_DWORD *)(a3 + 104) == 1634561902 && *(_QWORD *)(a3 + 96) && *(_QWORD *)(a3 + 88))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a3 + 24));
    v8 = *(unsigned __int8 *)(a3 + 20);
    *(_BYTE *)(a3 + 20) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a3 + 24));
    if (!v8)
      dispatch_group_async_f(*(dispatch_group_t *)(a3 + 96), *(dispatch_queue_t *)(a3 + 88), (void *)a3, (dispatch_function_t)sub_21A71043C);
  }
  else
  {
    v8 = 0;
  }
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __ACPMonitoringForFlagCallback(OSStatus, CFDictionaryRef, void *)", 800, (uint64_t)" taskPending: %d err: %d \ninData: %@\n", a5, a6, a7, a8, v8);
}

void sub_21A70EEA0(const __CFString *a1, int *a2, CFTypeRef *a3, BOOL *a4, _BYTE *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  BOOL v38;
  int v39;
  CFIndex Count;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFIndex v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  char v51;
  int v52;
  CFArrayRef v53;
  uint64_t v54;
  CFArrayRef theArray;
  int v56;
  _BYTE v57[12];

  *(_QWORD *)&v57[4] = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a2 && !a3 && !a4 && !a5)
    return;
  v54 = 0;
  theArray = 0;
  v53 = 0;
  v52 = 0;
  v51 = 0;
  sub_21A693B94(a1, (uint64_t)&theArray, (UInt8 *)"%ks", (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (uint64_t)"radios");
  if (v17)
    return;
  if (!theArray)
    return;
  sub_21A693B94((const __CFString *)theArray, (uint64_t)&v56, (UInt8 *)"[*].%ks:int", v12, v13, v14, v15, v16, 0);
  if (v18)
    return;
  if (CFArrayGetCount(theArray) >= 2)
  {
    sub_21A693B94((const __CFString *)theArray, (uint64_t)v57, (UInt8 *)"[*].%ks:int", v19, v20, v21, v22, v23, 1);
    if (v24)
      return;
  }
  sub_21A693B94((const __CFString *)theArray, (uint64_t)&v54 + 4, (UInt8 *)"[*].%ks:int", v19, v20, v21, v22, v23, 0);
  if (v30)
    return;
  sub_21A693B94((const __CFString *)theArray, (uint64_t)&v54, (UInt8 *)"[*].%ks:int", v25, v26, v27, v28, v29, 0);
  if (v36)
    return;
  v37 = v56;
  if (v56)
  {
    if ((_DWORD)v54)
      v38 = v56 == 1;
    else
      v38 = 0;
    if (v38)
      v37 = 20;
  }
  else if ((BYTE4(v54) & 3u) - 1 >= 2)
  {
    v37 = 0;
  }
  else
  {
    v37 = 10;
  }
  if (a2)
    *a2 = v37;
  if (!a3)
  {
LABEL_30:
    if (!a4)
      goto LABEL_47;
    goto LABEL_31;
  }
  if (v37 == 3)
  {
    *a3 = &stru_24DD08368;
    goto LABEL_30;
  }
  sub_21A693B94((const __CFString *)theArray, (uint64_t)a3, (UInt8 *)"[*].%ks", v31, v32, v33, v34, v35, 0);
  if (v49 || !*a3)
    return;
  CFRetain(*a3);
  if (!a4)
  {
LABEL_47:
    if (a5)
      *a5 = v54;
    return;
  }
LABEL_31:
  *a4 = 0;
  sub_21A693B94((const __CFString *)theArray, (uint64_t)&v53, (UInt8 *)"[*].%ks", v31, v32, v33, v34, v35, 0);
  if (v39 == -6727)
    goto LABEL_47;
  if (v39 || !v53)
    return;
  Count = CFArrayGetCount(v53);
  if (Count < 1)
    goto LABEL_47;
  v46 = Count;
  v47 = 0;
  while (1)
  {
    sub_21A693B94((const __CFString *)v53, (uint64_t)&v52, (UInt8 *)"[*].%ks:int", v41, v42, v43, v44, v45, v47);
    if (v48)
      break;
    if (v52 == 6)
    {
      sub_21A693B94((const __CFString *)v53, (uint64_t)&v51, (UInt8 *)"[*].%ks:BOOL", v41, v42, v43, v44, v45, v47);
      if (v50)
        return;
      *a4 = v51 != 0;
      goto LABEL_47;
    }
    if (v46 == ++v47)
      goto LABEL_47;
  }
}

uint64_t sub_21A70F174(CFDataRef theData, int a2)
{
  uint64_t result;
  unsigned int *v5;
  unint64_t Length;
  unint64_t v7;
  unsigned int v8;

  result = 0;
  if (theData)
  {
    if (a2)
    {
      result = (uint64_t)CFDataGetBytePtr(theData);
      if (result)
      {
        v5 = (unsigned int *)result;
        Length = CFDataGetLength(theData);
        if (Length < 4)
        {
          return 0;
        }
        else
        {
          v7 = Length >> 2;
          while (1)
          {
            v8 = *v5++;
            if (bswap32(v8) == a2)
              break;
            if (!--v7)
              return 0;
          }
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_21A70F1F0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  const void *v10;
  uint64_t v11;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus __ProgressContext_Release(__ProgressContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  if (*((_DWORD *)a1 + 4) == 1634561902)
  {
    v9 = (const void *)a1[1];
    if (v9)
    {
      CFRelease(v9);
      a1[1] = 0;
    }
    *((_DWORD *)a1 + 4) = 1095585614;
    v10 = (const void *)a1[3];
    if (v10)
      CFRelease(v10);
    free(a1);
  }
}

void sub_21A70F2A4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  const __CFDictionary *v9;
  BOOL v10;
  __CFNotificationCenter *LocalCenter;
  const __CFDictionary *v12;

  v12 = 0;
  if (a1 == 13)
  {
    v8 = sub_21A692FEC((const __CFAllocator *)*MEMORY[0x24BDBD240], (CFTypeRef *)&v12, (uint64_t)"{%##O%kO=%i}", a4, a5, a6, a7, a8, a3);
    v9 = v12;
    if (v8)
      v10 = 1;
    else
      v10 = v12 == 0;
    if (!v10)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter)
        CFNotificationCenterPostNotificationWithOptions(LocalCenter, CFSTR("com.apple.airport.assistant.BusyStateChange"), 0, v12, 1uLL);
      v9 = v12;
    }
    if (v9)
      CFRelease(v9);
  }
}

uint64_t sub_21A70F334(uint64_t context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  const __CFString *v9;
  int v10;
  int v11;
  __CFNotificationCenter *LocalCenter;
  uint64_t v13;
  int v14;

  v8 = (_QWORD *)context;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (context = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)context))
      context = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_LinkChangeCallbackStart(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v13);
  }
  if (v8)
  {
    v14 = 0;
    if (*(_DWORD *)v8 != 1634561902)
    {
      v10 = -6718;
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    v9 = (const __CFString *)v8[3];
    if (!v9)
    {
      v10 = -6705;
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    if (v8[6] || v8[15])
    {
      v10 = -6721;
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    sub_21A693B94(v9, (uint64_t)&v14, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
    v10 = v11;
    if (v11)
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    if (v14 < 1)
    {
      v10 = -6710;
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    LocalCenter = CFNotificationCenterGetLocalCenter();
    if (!LocalCenter)
    {
      v10 = -6728;
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    CFNotificationCenterAddObserver(LocalCenter, v8, (CFNotificationCallback)sub_21A70F47C, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    context = sub_21A70F5F0((dispatch_source_t *)v8, 1000 * v14);
    v10 = context;
    if ((_DWORD)context)
      return sub_21A70B2E0(v8, v10, a3, a4, a5, a6, a7, a8);
  }
  return context;
}

void sub_21A70F47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFDictionary *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  CFStringRef theString1;
  CFStringRef v27;

  v27 = 0;
  theString1 = 0;
  if (a2)
  {
    if (a5)
    {
      if (*(_DWORD *)a2 == 1634561902)
      {
        v25 = 0;
        v10 = *(const __CFDictionary **)(a2 + 24);
        if (!v10
          || !CFDictionaryContainsKey(v10, CFSTR("BSAssistantCallback_String"))
          || (sub_21A70B0B0(a2, (uint64_t)CFSTR("BSAssistantCallback_String"), &theString1, a4, (uint64_t)a5, a6, a7, a8),
              !v11)
          && theString1)
        {
          sub_21A693B94(a5, (uint64_t)&v25, (UInt8 *)"%kO:int", a4, (uint64_t)a5, a6, a7, a8, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_LinkState"));
          if (!v17)
          {
            sub_21A693B94(a5, (uint64_t)&v27, (UInt8 *)"%kO", v12, v13, v14, v15, v16, (uint64_t)CFSTR("kNetworkLinkManager_LinkChangeKey_WiFiName"));
            if (v24 == -6727 || v27)
            {
              if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_LinkChangeCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"stopOnName: %@ inUserInfo: %@\n", v20, v21, v22, v23, (uint64_t)theString1);
              if (theString1)
              {
                if (!v27 || v25 != 1 || CFStringCompare(theString1, v27, 0))
                  return;
              }
              else if (v27)
              {
                return;
              }
              sub_21A70DCB4(a2, 0, v18, v19, v20, v21, v22, v23);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21A70F5F0(dispatch_source_t *a1, int a2)
{
  NSObject *v4;
  NSObject *global_queue;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;

  if (*(_DWORD *)a1 != 1634561902)
    return 4294960578;
  if (a2 < 1)
    return 4294960559;
  v4 = a1[6];
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(a1[6]);
    a1[6] = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, global_queue);
  a1[6] = v6;
  if (!v6)
    return 4294960568;
  dispatch_set_context(v6, a1);
  dispatch_source_set_event_handler_f(a1[6], (dispatch_function_t)sub_21A70F6E4);
  v7 = a1[6];
  v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a1[6]);
  return 0;
}

void sub_21A70F6E4(void *context)
{
  dispatch_async_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A70F6FC);
}

uint64_t sub_21A70F6FC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v8;
  uint64_t v9;

  v8 = (_DWORD *)result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_LinkChangeTimerFiredCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v9);
  }
  if (v8)
  {
    if (*v8 == 1634561902)
      return sub_21A70DCB4((uint64_t)v8, 4294960574, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_21A70F790(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v15;
  uint64_t v16;
  char v17;
  int v18;
  uint64_t v19;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _BSAssistant_BonjourBrowseCallbackStart(AssistantCallbackContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v16);
  v19 = 0;
  v18 = 0;
  v17 = 0;
  if (a1 && *a1 == 1634561902)
  {
    v9 = (const __CFString *)*((_QWORD *)a1 + 3);
    if (v9)
    {
      if (*((_QWORD *)a1 + 6) || *((_QWORD *)a1 + 15))
      {
        v10 = 4294960575;
      }
      else
      {
        sub_21A693B94(v9, (uint64_t)&v18, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
        v10 = v12;
        if (!(_DWORD)v12)
        {
          if (v18 < 1)
          {
            v10 = 4294960586;
            goto LABEL_12;
          }
          sub_21A693B94(*((const __CFString **)a1 + 3), (uint64_t)&v17, (UInt8 *)"%ks:BOOL", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Boolean");
          v10 = v13;
          if (!(_DWORD)v13)
          {
            LocalCenter = CFNotificationCenterGetLocalCenter();
            if (!LocalCenter)
              goto LABEL_25;
            v15 = LocalCenter;
            CFNotificationCenterAddObserver(LocalCenter, a1, (CFNotificationCallback)sub_21A70FAB8, CFSTR("com.apple.bonjour.txt.BaseAssistant.Updated"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver(v15, a1, (CFNotificationCallback)sub_21A70FAB8, CFSTR("com.apple.bonjour.txt.BaseAssistant.Removed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            v10 = sub_21A67945C("com.apple.bonjour.txt.BaseAssistant.Updated", "com.apple.bonjour.txt.BaseAssistant.Removed", "BSAssistant:BrowserSession", &v19);
            if ((_DWORD)v10)
              goto LABEL_12;
            if (!v19)
            {
LABEL_25:
              v10 = 4294960568;
              goto LABEL_12;
            }
            v10 = sub_21A6798AC(v19, 0, v17 != 0);
            if (!(_DWORD)v10)
            {
              v10 = sub_21A70FE44((dispatch_source_t *)a1, 1000 * v18);
              if (!(_DWORD)v10)
              {
                *((_QWORD *)a1 + 15) = v19;
                return v10;
              }
            }
          }
        }
      }
    }
    else
    {
      v10 = 4294960591;
    }
  }
  else
  {
    v10 = 4294960578;
  }
LABEL_12:
  sub_21A70F994((NSObject **)a1, -6723, a3, a4, a5, a6, a7, a8);
  return v10;
}

void sub_21A70F994(NSObject **a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void _BSAssistant_BonjourBrowseCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter)
      {
        v11 = LocalCenter;
        CFNotificationCenterRemoveObserver(LocalCenter, a1, CFSTR("com.apple.bonjour.txt.BaseAssistant.Updated"), 0);
        CFNotificationCenterRemoveObserver(v11, a1, CFSTR("com.apple.bonjour.txt.BaseAssistant.Removed"), 0);
        v12 = a1[15];
        if (v12)
        {
          sub_21A679BF8(v12);
          a1[15] = 0;
        }
        v13 = a1[6];
        v14 = a2;
        if (v13)
        {
          dispatch_source_cancel(v13);
          dispatch_release(a1[6]);
          a1[6] = 0;
          v14 = a2;
        }
      }
      else
      {
        v14 = -6728;
      }
    }
    else
    {
      v14 = -6718;
    }
    if (a2 != -6723)
      sub_21A70B2E0(a1, v14, a3, a4, a5, a6, a7, a8);
  }
}

void sub_21A70FAB8(int a1, uint64_t a2, CFStringRef theString1, uint64_t a4, const __CFString *a5)
{
  CFComparisonResult v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  CFIndex v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFDictionary *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  NSObject **v54;
  int v55;
  uint64_t v56;
  CFNumberRef number;
  CFNumberRef otherNumber;
  CFMutableArrayRef theArray;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;

  v60 = 0;
  v61 = 0;
  if (a2)
  {
    if (a5)
    {
      if (*(_DWORD *)a2 == 1634561902)
      {
        v62 = 0;
        theArray = 0;
        v7 = CFStringCompare(theString1, CFSTR("com.apple.bonjour.txt.BaseAssistant.Updated"), 0);
        sub_21A70B0B0(a2, (uint64_t)CFSTR("BSAssistantCallback_BrowseRecords"), &theArray, v8, v9, v10, v11, v12);
        if (!v13)
        {
          if (theArray)
          {
            if (*(_DWORD *)a2 == 1634561902
              && (v14 = *(const __CFDictionary **)(a2 + 24)) != 0
              && CFDictionaryContainsKey(v14, CFSTR("BSAssistantCallback_String")))
            {
              sub_21A70B0B0(a2, (uint64_t)CFSTR("BSAssistantCallback_String"), &v60, v15, v16, v17, v18, v19);
              if (v25 || !v60)
                return;
            }
            else if (sub_21A70FE44((dispatch_source_t *)a2, 5000))
            {
              return;
            }
            sub_21A693B94(a5, (uint64_t)&v62, (UInt8 *)"%ks.%ks", v20, v21, v22, v23, v24, (uint64_t)"txt");
            if (!v31 && v62)
            {
              if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"add: %d MAC: %@ stopOnMACAddress: %@\n", v27, v28, v29, v30, v7 == kCFCompareEqualTo);
              if (v7)
              {
                v32 = sub_21A68F3C8(theArray, v62);
                if (v32 != -1)
                  CFArrayRemoveValueAtIndex(theArray, v32);
                return;
              }
              if (!sub_21A693A8C((const __CFAllocator *)*MEMORY[0x24BDBD240], theArray, (uint64_t)"%O", v26, v27, v28, v29, v30, (uint64_t)a5))
              {
                if (v60)
                {
                  sub_21A693B94(a5, (uint64_t)&v61, (UInt8 *)"%ks.%ks", v33, v34, v35, v36, v37, (uint64_t)"txt");
                  if ((v38 == -6727 || !v38 && v61)
                    && ((sub_21A6D039C(v62, v60) & 1) != 0
                     || v61 && sub_21A6D039C(v61, v60)))
                  {
                    number = 0;
                    otherNumber = 0;
                    if (*(_DWORD *)a2 == 1634561902
                      && (v45 = *(const __CFDictionary **)(a2 + 24)) != 0
                      && CFDictionaryContainsKey(v45, CFSTR("BSAssistantCallback_BonjourSeed")))
                    {
                      sub_21A70B0B0(a2, (uint64_t)CFSTR("BSAssistantCallback_BonjourSeed"), &number, v40, v41, v42, v43, v44);
                      if (v51 || !number)
                        return;
                      sub_21A693B94(a5, (uint64_t)&otherNumber, (UInt8 *)"%ks.%ks", v46, v47, v48, v49, v50, (uint64_t)"txt");
                      v53 = v52;
                      if (dword_2550F4548 <= 800
                        && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                      {
                        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"checking bonjour seeds old: %@ cur: %@\n", v41, v42, v43, v44, (uint64_t)number);
                      }
                    }
                    else
                    {
                      v53 = 0;
                    }
                    if (!v53 && number && otherNumber && CFNumberCompare(number, otherNumber, 0) == kCFCompareEqualTo)
                    {
                      if (dword_2550F4548 <= 800
                        && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
                      {
                        sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"responding with duplicate error\n", v41, v42, v43, v44, v56);
                      }
                      sub_21A679AFC(*(dispatch_queue_t ***)(a2 + 120), a5);
                      v54 = (NSObject **)a2;
                      v55 = -6730;
                    }
                    else
                    {
                      v54 = (NSObject **)a2;
                      v55 = 0;
                    }
                    sub_21A70F994(v54, v55, v39, v40, v41, v42, v43, v44);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21A70FE44(dispatch_source_t *a1, int a2)
{
  NSObject *v4;
  NSObject *global_queue;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;

  if (*(_DWORD *)a1 != 1634561902)
    return 4294960578;
  if (a2 < 1)
    return 4294960559;
  v4 = a1[6];
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(a1[6]);
    a1[6] = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, global_queue);
  a1[6] = v6;
  if (!v6)
    return 4294960568;
  dispatch_set_context(v6, a1);
  dispatch_source_set_event_handler_f(a1[6], (dispatch_function_t)sub_21A70FF38);
  v7 = a1[6];
  v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a1[6]);
  return 0;
}

void sub_21A70FF38(void *context)
{
  dispatch_async_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A70FF50);
}

void sub_21A70FF50(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
      sub_21A70F994(a1, -6722, a3, a4, a5, a6, a7, a8);
  }
}

void sub_21A70FF74(void *context)
{
  dispatch_async_f(MEMORY[0x24BDAC9B8], context, (dispatch_function_t)sub_21A71008C);
}

void sub_21A70FF8C(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v13 = 0;
  if (!a2 || *(_DWORD *)a2 != 1634561902)
  {
    v11 = 4294960578;
    goto LABEL_13;
  }
  if (!a1)
  {
    v11 = 4294960591;
    goto LABEL_13;
  }
  sub_21A693B94(a1, (uint64_t)&v13, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, (uint64_t)CFSTR("kAssistantResourceManager_StateKey"));
  v11 = v10;
  if ((_DWORD)v10)
  {
LABEL_13:
    sub_21A710120(a2, v11, a3, a4, a5, a6, a7, a8);
    return;
  }
  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_AssistantResourceChangedCallBack(CFDictionaryRef, void *)", 800, (uint64_t)"inResourceStatus: %@\n", a5, a6, a7, a8, (uint64_t)a1);
  if (v13 == 1)
  {
    v12 = sub_21A689FCC(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 96));
    if ((_DWORD)v12 != -6709)
    {
      v11 = v12;
      goto LABEL_13;
    }
  }
}

uint64_t sub_21A71008C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v8;
  uint64_t v9;

  v8 = (_DWORD *)result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __BSAssistant_AssistantResourceTimerFiredCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v9);
  }
  if (v8)
  {
    if (*v8 == 1634561902)
      return sub_21A710120((uint64_t)v8, 4294960574, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_21A710120(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;

  v9 = result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void _BSAssistant_AssistantResourceCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"result: %m\n", a5, a6, a7, a8, a2);
  }
  if (v9)
  {
    if (*(_DWORD *)v9 == 1634561902)
    {
      v10 = *(_QWORD *)(v9 + 8);
      if (v10 && *(_QWORD *)(v10 + 96))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v9 + 56));
        v11 = *(NSObject **)(v9 + 48);
        if (v11)
        {
          dispatch_source_cancel(v11);
          dispatch_release(*(dispatch_object_t *)(v9 + 48));
          *(_QWORD *)(v9 + 48) = 0;
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v9 + 56));
        result = sub_21A689A60(*(_QWORD *)(*(_QWORD *)(v9 + 8) + 96), 0, 0);
        if ((_DWORD)result)
          v12 = result;
        else
          v12 = a2;
      }
      else
      {
        v12 = -6705;
      }
    }
    else
    {
      v12 = -6718;
    }
    if ((_DWORD)a2 != -6723)
      return sub_21A70B2E0((_QWORD *)v9, v12, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_21A710244(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;

  if (dword_2550F4548 <= 800 && (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _JoinNetwork(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice)", 800, (uint64_t)"\n", a5, a6, a7, a8, v53);
  v54 = 0;
  if (*(_DWORD *)(a1 + 88) != 1634561902)
    return 4294960578;
  sub_21A72E214((uint64_t)a2, a2);
  v13 = sub_21A72E204((uint64_t)a2, v12);
  if (dword_2550F4548 <= 800)
  {
    v18 = v13;
    if (dword_2550F4548 != -1 || sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"OSStatus _JoinNetwork(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice)", 800, (uint64_t)"networkName: %@ bssid: %@\n", v14, v15, v16, v17, v18);
  }
  v19 = sub_21A709AF8(a1, &v54);
  v25 = v54;
  if ((_DWORD)v19)
  {
    v26 = v19;
    if (!v54)
      return v26;
  }
  else
  {
    if (!v54)
      return 4294960568;
    v26 = sub_21A70B204(v54, (uint64_t)CFSTR("BSAssistantCallback_ScanInfo"), (uint64_t)a2, v20, v21, v22, v23, v24);
    if (!(_DWORD)v26)
    {
      if (!a3
        || (v26 = sub_21A70B204(v25, (uint64_t)CFSTR("BSAssistantCallback_ScanInfoPassword"), a3, v27, v28, v29, v30, v31), !(_DWORD)v26))
      {
        v26 = sub_21A70B204(v25, (uint64_t)CFSTR("BSAssistantCallback_Boolean"), *MEMORY[0x24BDBD268], v27, v28, v29, v30, v31);
        if (!(_DWORD)v26)
        {
          v26 = sub_21A70B274(v25, (uint64_t)CFSTR("BSAssistantCallback_JoinRememberChoice"), a4, v33, v34, v35, v36, v37);
          if (!(_DWORD)v26)
          {
            v26 = sub_21A70A23C((_QWORD *)v25, 2, v38, v39, v40, v41, v42, v43);
            if (!(_DWORD)v26)
            {
              v51 = sub_21A70A598(v25, v44, v45, v46, v47, v48, v49, v50);
              v52 = *(_DWORD *)(v25 + 32);
              if (v52)
                v26 = v52;
              else
                v26 = v51;
            }
          }
        }
      }
    }
  }
  sub_21A709C24((char *)v25);
  return v26;
}

uint64_t sub_21A71043C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v8 = result;
  if (dword_2550F4548 <= 800)
  {
    if (dword_2550F4548 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4548, 0x320u), (_DWORD)result))
      result = sub_21A698FDC((uint64_t)&dword_2550F4548, (uint64_t)"void __CheckSystemFlagsAsync(void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v16);
  }
  if (v8)
  {
    v17 = 0;
    if (*(_DWORD *)(v8 + 104) == 1634561902)
    {
      if (*(_QWORD *)v8)
      {
        if (**(_DWORD **)v8 == 1634561902)
        {
          v9 = *(_QWORD *)(v8 + 8);
          if (v9)
          {
            if (!sub_21A6D523C(v9, 1937327724)
              && !sub_21A6D4478(*(_QWORD *)(v8 + 8), 1937327724, &v17)
              && (*(_DWORD *)(v8 + 16) & v17) != 0)
            {
              sub_21A70B2E0(*(_QWORD **)v8, 0, v10, v11, v12, v13, v14, v15);
            }
          }
        }
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(v8 + 24));
    *(_BYTE *)(v8 + 20) = 0;
    return pthread_mutex_unlock((pthread_mutex_t *)(v8 + 24));
  }
  return result;
}

uint64_t sub_21A713050(uint64_t result, const char *a2)
{
  uint64_t v3;
  const char *v4;

  if (*(_QWORD *)(result + 48) > (unint64_t)a2)
  {
    v3 = result;
    objc_msgSend_deleteAllRowsInSectionCore_(*(void **)(result + 32), a2, (uint64_t)a2);
    return objc_msgSend_removeObjectAtIndex_(*(void **)(v3 + 40), v4, (uint64_t)a2);
  }
  return result;
}

CGColorRef sub_21A71CA30(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColorSpace *DeviceRGB;
  CGColorRef v9;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v9 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

CGColorRef sub_21A71CAC4()
{
  CGColorSpace *DeviceRGB;
  CGColorRef v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  memset(v3, 0, sizeof(v3));
  v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  CGColorSpaceRelease(DeviceRGB);
  return v1;
}

CGImageRef sub_21A71CB38(CGImage *a1, double a2)
{
  double Width;
  size_t Height;
  double v6;
  double v7;
  double v8;
  size_t BitsPerComponent;
  CGColorSpace *ColorSpace;
  CGContext *v11;
  CGImageRef Image;
  CGRect v14;

  Width = (double)CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  v6 = a2 / 100.0;
  v7 = a2 / 100.0 * Width;
  v8 = v6 * (double)Height;
  BitsPerComponent = CGImageGetBitsPerComponent(a1);
  ColorSpace = CGImageGetColorSpace(a1);
  v11 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, BitsPerComponent, 0, ColorSpace, 2u);
  v14.size.width = (double)(unint64_t)v7;
  v14.size.height = (double)(unint64_t)v8;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGContextDrawImage(v11, v14, a1);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

void sub_21A71CC08(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  CGPath *v8;

  v8 = sub_21A71CC3C(a2, a3, a4, a5, a6, a7);
  CGContextAddPath(a1, v8);
  CGPathRelease(v8);
}

CGPath *sub_21A71CC3C(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  CGPath *Mutable;
  double MidX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MidY;
  double MaxY;
  CGFloat MinX;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  Mutable = CGPathCreateMutable();
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  MaxX = CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  MidY = CGRectGetMidY(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  MaxY = CGRectGetMaxY(v25);
  CGPathMoveToPoint(Mutable, 0, MinX, MidY);
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, a5);
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a5);
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, a5);
  if (a6 != 0.0)
  {
    CGPathAddLineToPoint(Mutable, 0, MidX + a6, MaxY);
    CGPathAddLineToPoint(Mutable, 0, MidX, MaxY + a6);
    CGPathAddLineToPoint(Mutable, 0, MidX - a6, MaxY);
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, a5);
  return Mutable;
}

void sub_21A71CE0C(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGPath *v7;

  v7 = sub_21A71CC3C(a2, a3, a4, a5, a6, 0.0);
  CGContextAddPath(a1, v7);
  CGPathRelease(v7);
}

uint64_t sub_21A728964(const void *a1, CFTypeRef **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  CFTypeRef *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeRef *v19;
  uint64_t v20;
  uint64_t Count;
  const __CFAllocator *v22;
  CFMutableArrayRef Mutable;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  uint64_t v28;
  const void *v29;
  CFArrayRef theArray;

  if (dword_2550F4A80 <= 800 && (dword_2550F4A80 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A80, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A80, (uint64_t)"OSStatus _WiFiShimPrivateContext_Create(WiFiShimSubContextRef, WiFiShimContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v28);
  theArray = 0;
  v10 = 4294960591;
  if (!a1 || !a2)
    return v10;
  v11 = (CFTypeRef *)malloc_type_calloc(1uLL, 0x10uLL, 0x600405C6656D0uLL);
  v19 = v11;
  if (!v11)
    goto LABEL_20;
  v11[1] = a1;
  v20 = sub_21A72A91C((uint64_t)v11, (uint64_t *)&theArray, v13, v14, v15, v16, v17, v18);
  if ((_DWORD)v20)
  {
LABEL_9:
    v10 = v20;
    goto LABEL_21;
  }
  if (!theArray)
  {
    v10 = 4294960568;
LABEL_24:
    sub_21A728B4C(v19, v12, v13, v14, v15, v16, v17, v18);
    return v10;
  }
  Count = CFArrayGetCount(theArray);
  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
  *v19 = Mutable;
  if (Mutable)
  {
    if (Count >= 1)
    {
      v24 = 0;
      do
      {
        v29 = 0;
        sub_21A693B94((const __CFString *)theArray, (uint64_t)&v29, (UInt8 *)"[*]", v14, v15, v16, v17, v18, v24);
        if ((_DWORD)v20)
          goto LABEL_9;
        v25 = sub_21A6862B0((uint64_t)v22, v29, v13, v14, v15, v16, v17, v18);
        if (!v25)
          goto LABEL_20;
        v26 = (const void *)v25;
        v20 = sub_21A693A8C(v22, (__CFArray *)*v19, (uint64_t)"%O", v14, v15, v16, v17, v18, v25);
        if ((_DWORD)v20)
          goto LABEL_9;
        v20 = sub_21A686574((uint64_t)v26, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"));
        if ((_DWORD)v20)
          goto LABEL_9;
        CFRelease(v26);
      }
      while (Count != ++v24);
    }
    v10 = 0;
    *a2 = v19;
    v19 = 0;
  }
  else
  {
LABEL_20:
    v10 = 4294960568;
  }
LABEL_21:
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
  if (v19)
    goto LABEL_24;
  return v10;
}

uint64_t sub_21A728B4C(CFTypeRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (dword_2550F4A80 <= 800 && (dword_2550F4A80 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A80, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A80, (uint64_t)"OSStatus _WiFiShimPrivateContext_Release(WiFiShimContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v10);
  if (!a1)
    return 4294960591;
  if (*a1)
    CFRelease(*a1);
  free(a1);
  return 0;
}

void sub_21A728BD8(CFArrayRef *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CFArrayRef v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  if (a1)
  {
    if (a2)
    {
      if (CFArrayGetCount(*a1))
      {
        v9 = *a1;
        v12 = 0;
        sub_21A693B94((const __CFString *)v9, (uint64_t)&v12, (UInt8 *)"[*]", v4, v5, v6, v7, v8, 0);
        if (!v11)
        {
          if (v12)
            sub_21A6869A0(v12, a2, v10);
        }
      }
    }
  }
}

uint64_t sub_21A728C54(uint64_t a1, const char *a2, const __CFString *a3, int a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  CFIndex v15;
  void *ValueAtIndex;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  CFTypeRef cf;
  CFArrayRef theArray;

  cf = 0;
  theArray = 0;
  if (dword_2550F4A80 <= 800 && (dword_2550F4A80 != -1 || sub_21A69876C((uint64_t)&dword_2550F4A80, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4A80, (uint64_t)"OSStatus WiFiShim_JoinNetworkNamedAndCopyScanInfo(WiFiShimContextRef, CFStringRef, CFStringRef, WiFiType, JoinNetworkRememberChoice, CFDictionaryRef *)", 800, (uint64_t)"\n", a5, (uint64_t)a6, a7, a8, (uint64_t)cf);
  v14 = 4294960591;
  if (a1)
  {
    if (a2)
    {
      v14 = sub_21A72A39C(a1, a2, a4, 1, 0, (uint64_t)&theArray, a7, a8);
      if (!(_DWORD)v14)
      {
        if (!theArray)
          goto LABEL_15;
        if (!CFArrayGetCount(theArray) || (v15 = sub_21A68F7D0((const __CFString *)a2, a4, 0, theArray), v15 == -1))
        {
          v14 = 4294960569;
          goto LABEL_17;
        }
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v15);
        if (!ValueAtIndex)
        {
LABEL_15:
          v14 = 4294960568;
          goto LABEL_17;
        }
        v22 = ValueAtIndex;
        if (!a3)
        {
          if (sub_21A728DFC(ValueAtIndex, v17) == 1)
          {
            a3 = 0;
          }
          else
          {
            v26 = sub_21A72AB30((uint64_t)v22, (const __CFString **)&cf, v23, v24, v18, v19, v20, v21);
            if ((_DWORD)v26 == -6727)
            {
              v14 = 4294967280;
              goto LABEL_17;
            }
            v14 = v26;
            if ((_DWORD)v26)
              goto LABEL_17;
            a3 = (const __CFString *)cf;
          }
        }
        v14 = sub_21A729CC4(a1, (uint64_t)v22, a3, a5, v18, v19, v20, v21);
        if (!(_DWORD)v14)
        {
          if (a6)
          {
            *a6 = v22;
            CFRetain(v22);
          }
          v14 = 0;
        }
      }
    }
  }
LABEL_17:
  if (cf)
    CFRelease(cf);
  return v14;
}

uint64_t sub_21A728DFC(void *a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  __CFString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _BOOL4 v19;
  char v20;
  int v21;
  __CFString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  int v31;
  unsigned int v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *Object;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  int v50;
  int v51;

  v3 = (void *)objc_msgSend_objectForKey_(a1, a2, (uint64_t)CFSTR("CAPABILITIES"));
  if ((objc_msgSend_shortValue(v3, v4, v5) & 0x10) == 0)
    return 1;
  v51 = 0;
  v8 = (__CFString *)objc_msgSend_objectForKey_(a1, v6, (uint64_t)CFSTR("RSN_IE"));
  v17 = objc_msgSend_count(v8, v9, v10);
  if (!v17)
  {
    v19 = 0;
LABEL_8:
    v20 = 0;
    goto LABEL_9;
  }
  sub_21A693B94(v8, (uint64_t)&v51, (UInt8 *)"%kO:int", v12, v13, v14, v15, v16, (uint64_t)CFSTR("IE_KEY_RSN_MCIPHER"));
  if (v18 || v51 != 5)
  {
    v33 = (void *)objc_msgSend_objectForKey_(v8, v11, (uint64_t)CFSTR("IE_KEY_RSN_AUTHSELS"));
    v37 = (void *)objc_msgSend_objectEnumerator(v33, v34, v35);
    while (1)
    {
      Object = (void *)objc_msgSend_nextObject(v37, v11, v36);
      v19 = Object != 0;
      if (!Object)
        goto LABEL_8;
      v40 = objc_msgSend_integerValue(Object, v11, v39);
      if (v40 == 2)
        goto LABEL_8;
      if (v40 == 8)
      {
        v19 = 0;
        v20 = 0;
        v21 = 13;
        goto LABEL_10;
      }
    }
  }
  v19 = 0;
  v20 = 1;
LABEL_9:
  v21 = 12;
LABEL_10:
  v22 = (__CFString *)objc_msgSend_objectForKey_(a1, v11, (uint64_t)CFSTR("WPA_IE"));
  if (objc_msgSend_count(v22, v23, v24))
  {
    sub_21A693B94(v22, (uint64_t)&v51, (UInt8 *)"%kO:int", v25, v26, v27, v28, v29, (uint64_t)CFSTR("IE_KEY_WPA_MCIPHER"));
    if (!v31 && v51 == 5)
      return 8;
    v41 = (void *)objc_msgSend_objectForKey_(v22, v30, (uint64_t)CFSTR("IE_KEY_WPA_AUTHSELS"));
    v46 = (void *)objc_msgSend_objectEnumerator(v41, v42, v43);
    while (1)
    {
      v47 = (void *)objc_msgSend_nextObject(v46, v44, v45);
      if (!v47)
        break;
      if (objc_msgSend_integerValue(v47, v48, v49) == 2)
      {
        v19 = 1;
        break;
      }
    }
    if (v19)
      v32 = 4;
    else
      v32 = 9;
    if (v19)
      v50 = 5;
    else
      v50 = 10;
    if (v17)
      v32 = v50;
  }
  else
  {
    if (v19)
      v32 = 7;
    else
      v32 = v21;
    if (!v17)
      v32 = 3;
  }
  if ((v20 & 1) != 0)
    return 8;
  else
    return v32;
}

const __CFString *sub_21A728FE0(const __CFString *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;

  if (result)
  {
    v10 = 0;
    sub_21A693B94(result, (uint64_t)&v10, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, (uint64_t)CFSTR("AP_MODE"));
    v9 = v8;
    result = 0;
    if (!v9)
      return (const __CFString *)(v10 == 1);
  }
  return result;
}

uint64_t sub_21A729034(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus _InitMobileWiFi(WiFiShimSubContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v21);
  if (a1 && (v9 = WiFiManagerClientCreate()) != 0)
  {
    v10 = (const void *)v9;
    a1[2] = CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    WiFiManagerClientSetType();
    v11 = (void *)WiFiManagerClientCopyDevices();
    v14 = v11;
    if (!v11
      || !objc_msgSend_count(v11, v12, v13)
      || (v16 = objc_msgSend_objectAtIndex_(v14, v15, 0),
          objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, 27),
          v18 = WiFiDeviceClientCopyProperty(),
          (a1[6] = v18) == 0))
    {

      CFRelease(v10);
      return 4294960569;
    }
    v19 = 0;
    a1[1] = v10;
    a1[3] = v16;
  }
  else
  {
    v14 = 0;
    v19 = 4294960578;
  }

  return v19;
}

uint64_t sub_21A72917C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD *v10;
  const void *v11;
  const void *v12;
  uint64_t result;
  uint64_t v14;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus _CloseMobileWiFi(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v14);
  if (!a1)
    return 4294960578;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902 || !*(_QWORD *)(v9 + 8) || !*(_QWORD *)(v9 + 24))
    return 4294960578;
  WiFiManagerClientUnscheduleFromRunLoop();
  v10 = *(_QWORD **)(a1 + 8);
  v11 = (const void *)v10[1];
  if (v11)
  {
    CFRelease(v11);
    v10 = *(_QWORD **)(a1 + 8);
    v10[1] = 0;
  }
  v12 = (const void *)v10[6];
  if (v12)
  {
    CFRelease(v12);
    v10 = *(_QWORD **)(a1 + 8);
    v10[6] = 0;
  }
  result = 0;
  v10[2] = 0;
  v10[3] = 0;
  return result;
}

void *sub_21A729264(CFArrayRef theArray, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"CFArrayRef _ScanInfoRecordsFromWiFiNetworkRefs(CFArrayRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v24);
  if (theArray && CFArrayGetCount(theArray))
  {
    v9 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(theArray, v10, (uint64_t)&v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(theArray);
          v15 = WiFiNetworkCopyRecord();
          if (v15)
          {
            v17 = (void *)v15;
            objc_msgSend_addObject_(v9, v16, v15);

          }
        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(theArray, v16, (uint64_t)&v25, v29, 16);
      }
      while (v12);
    }
  }
  else
  {
    v9 = 0;
  }
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
  {
    v18 = objc_msgSend_count(v9, a2, a3);
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"CFArrayRef _ScanInfoRecordsFromWiFiNetworkRefs(CFArrayRef)", 800, (uint64_t)"results: %d\n", v19, v20, v21, v22, v18);
  }
  return v9;
}

uint64_t sub_21A729430(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  CFTypeRef *v34;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_Create(WiFiShimContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v33);
  v34 = 0;
  if (!a1)
    return 4294960591;
  v9 = malloc_type_calloc(1uLL, 0x78uLL, 0x10E0040543B7626uLL);
  if (!v9)
    return 4294960568;
  v10 = v9;
  *(_DWORD *)v9 = 1634561902;
  v9[1] = 0;
  v9[3] = 0;
  v9[4] = dispatch_semaphore_create(0);
  v10[5] = 0;
  v24 = sub_21A729034(v10, v11, v12, v13, v14, v15, v16, v17);
  if ((_DWORD)v24)
    return v24;
  v24 = sub_21A728964(v10, &v34, v18, v19, v20, v21, v22, v23);
  if (!(_DWORD)v24)
  {
    if (v34)
    {
      if (v34[1])
      {
        v24 = 0;
        *a1 = v34;
        return v24;
      }
      v24 = 4294960568;
      goto LABEL_10;
    }
    return 4294960568;
  }
  if (v34)
LABEL_10:
    sub_21A729558((uint64_t)v34, v25, v26, v27, v28, v29, v30, v31);
  return v24;
}

uint64_t sub_21A729558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  dispatch_object_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_Release(WiFiShimContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v19);
  if (!a1)
    return 4294960578;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902)
    return 4294960578;
  if (*(_QWORD *)(v9 + 40))
  {
    *(_QWORD *)(v9 + 40) = 0;
    if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_Release(WiFiShimContextRef)", 800, (uint64_t)"Release forcing AutoJoin ON\n", a5, a6, a7, a8, v19);
    WiFiManagerClientEnable();
  }
  sub_21A72917C(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = *(dispatch_object_t **)(a1 + 8);
  if (v10[4])
  {
    dispatch_release(v10[4]);
    v10 = *(dispatch_object_t **)(a1 + 8);
  }
  free(v10);
  return sub_21A728B4C((CFTypeRef *)a1, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_21A729678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"Boolean WiFiShim_WiFiIsOn(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  if (!a1)
    return 0;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902)
    return 0;
  result = *(_QWORD *)(v9 + 24);
  if (result)
    return WiFiDeviceClientGetPower() != 0;
  return result;
}

uint64_t sub_21A72971C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v11;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_ClearScanCache(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  if (!a1)
    return 4294960578;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902 || !*(_QWORD *)(v9 + 8))
    return 4294960578;
  sub_21A729678(a1, a2, a3, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_21A7297C0(_QWORD *a1, const char *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  const void *v28;
  unsigned int v29;
  uint64_t SSID;
  uint64_t v31;
  uint64_t AssociationDate;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v9 = (int)a2;
  v53 = *MEMORY[0x24BDAC8D0];
  v11 = &unk_2550F4000;
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_PreferredNetworksCopy(WiFiShimContextRef, Boolean, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v46);
  v16 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, (uint64_t)a3);
  if (!a1)
    goto LABEL_37;
  v17 = a1[1];
  if (!v17 || *(_DWORD *)v17 != 1634561902 || !*(_QWORD *)(v17 + 8))
  {
    a1 = 0;
LABEL_37:
    v43 = 4294960578;
    goto LABEL_38;
  }
  if (!a3)
  {
    a1 = 0;
    v43 = 4294960591;
    goto LABEL_38;
  }
  a1 = (_QWORD *)WiFiManagerClientCopyNetworks();
  if (!objc_msgSend_count(a1, v18, v19)
    || (v50 = 0u,
        v51 = 0u,
        v48 = 0u,
        v49 = 0u,
        (v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v20, (uint64_t)&v48, v52, 16)) == 0))
  {
    v43 = 0;
    goto LABEL_38;
  }
  v22 = v21;
  v47 = v9;
  v23 = *(_QWORD *)v49;
LABEL_13:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v49 != v23)
      objc_enumerationMutation(a1);
    if (WiFiNetworkRequiresPassword())
      break;
    if (!v47)
    {
      v29 = 1;
      goto LABEL_19;
    }
LABEL_31:
    if (v22 == ++v24)
    {
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v25, (uint64_t)&v48, v52, 16);
      v22 = v42;
      if (!v42)
      {
        v43 = 0;
        goto LABEL_50;
      }
      goto LABEL_13;
    }
  }
  v26 = (void *)WiFiNetworkCopyRecord();
  if (v26)
  {
    v28 = v26;
    v29 = sub_21A728DFC(v26, v27);
    CFRelease(v28);
LABEL_19:
    SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      v31 = SSID;
      AssociationDate = WiFiNetworkGetAssociationDate();
      v33 = WiFiNetworkGetAssociationDate();
      if (AssociationDate | v33)
      {
        if (AssociationDate)
          v34 = AssociationDate;
        else
          v34 = v33;
        if (AssociationDate)
          v35 = v33 == 0;
        else
          v35 = 1;
        if (!v35)
          v34 = objc_msgSend_laterDate_((void *)AssociationDate, v25, v33);
        v36 = (void *)objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCED8], v25, v31, CFSTR("WiFiShim_PreferredNetwork_SSID"));
        v38 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v37, v29);
        objc_msgSend_setObject_forKey_(v36, v39, v38, CFSTR("WiFiShim_PreferredNetwork_SecMode"));
        objc_msgSend_setObject_forKey_(v36, v40, v34, CFSTR("WiFiShim_PreferredNetwork_TimeAssociated"));
        objc_msgSend_addObject_(v16, v41, (uint64_t)v36);
      }
    }
    goto LABEL_31;
  }
  v43 = 4294960568;
LABEL_50:
  v11 = (_DWORD *)&unk_2550F4000;
LABEL_38:
  v44 = v11[688];
  if (v44 <= 800 && (v44 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_PreferredNetworksCopy(WiFiShimContextRef, Boolean, CFArrayRef *)", 800, (uint64_t)"Preferrred networks:\n%@\n", v12, v13, v14, v15, (uint64_t)v16);
  if (a3)
  {
    *a3 = v16;
    CFRetain(v16);
  }
  if (a1)
    CFRelease(a1);
  return v43;
}

uint64_t sub_21A729AE4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;

  if (a1 && (v8 = *(_QWORD *)(a1 + 8)) != 0 && *(_DWORD *)v8 == 1634561902 && *(_QWORD *)(v8 + 24))
  {
    if (a2)
    {
      v10 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
      if (v10)
      {
        v13 = (void *)WiFiNetworkCopyRecord();
        if (v13)
        {
          v14 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v11, v12);
          v16 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v15, 4);
          objc_msgSend_setObject_forKey_(v14, v17, v16, CFSTR("STATE"));
          v19 = objc_msgSend_objectForKey_(v13, v18, (uint64_t)CFSTR("BSSID"));
          if (v19)
            objc_msgSend_setObject_forKey_(v14, v20, v19, CFSTR("BSSID"));
          v21 = objc_msgSend_objectForKey_(v13, v20, (uint64_t)CFSTR("SSID_STR"));
          if (v21)
            objc_msgSend_setObject_forKey_(v14, v22, v21, CFSTR("SSID_STR"));
          v23 = objc_msgSend_objectForKey_(v13, v22, (uint64_t)CFSTR("AP_MODE"));
          if (v23)
            objc_msgSend_setObject_forKey_(v14, v24, v23, CFSTR("AP_MODE"));
          *a2 = v14;
          CFRetain(v14);
          v25 = 0;
        }
        else
        {
          v14 = 0;
          v25 = 4294960568;
        }
      }
      else
      {
        v14 = 0;
        v13 = 0;
        v25 = 4294960569;
      }
    }
    else
    {
      v14 = 0;
      v10 = 0;
      v13 = 0;
      v25 = 4294960591;
    }
  }
  else
  {
    v14 = 0;
    v10 = 0;
    v13 = 0;
    v25 = 4294960578;
  }
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_CurrentAssociationInfoCopy(WiFiShimContextRef, CFDictionaryRef *)", 800, (uint64_t)"assocInfo:\n%@\n", a5, a6, a7, a8, (uint64_t)v14);
  if (v10)
    CFRelease(v10);
  if (v13)
    CFRelease(v13);
  return v25;
}

uint64_t sub_21A729CC4(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;

  v8 = a4;
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"\n", a5, a6, a7, a8, v47);
  if (!a1)
    return 4294960578;
  v12 = *(_QWORD *)(a1 + 8);
  if (!v12 || *(_DWORD *)v12 != 1634561902 || !*(_QWORD *)(v12 + 8) || !*(_QWORD *)(v12 + 24))
    return 4294960578;
  if (!a2)
    return 4294960591;
  v13 = sub_21A72A05C(a1, 0, (uint64_t)a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)v13)
  {
    v14 = WiFiNetworkCreate();
    if (!v14)
    {
      sub_21A72A05C(a1, 1u, v15, v16, v17, v18, v19, v20);
      return 4294960568;
    }
    v21 = (const void *)v14;
    if (WiFiNetworkRequiresPassword())
    {
      if (!a3)
      {
        v30 = 0;
        v13 = 4294960591;
        goto LABEL_57;
      }
      v30 = (void *)WiFiNetworkCopyPassword();
      if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
      {
        v31 = objc_msgSend_length(v30, v28, v29);
        CFStringGetLength(a3);
        sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"curPW len: %d inPassword len: %d\n", v32, v33, v34, v35, v31);
      }
      if (!v30 || (objc_msgSend_isEqualToString_(v30, v28, (uint64_t)a3) & 1) == 0)
      {
        if (!WiFiNetworkSetPassword())
        {
          v13 = 4294960596;
          goto LABEL_57;
        }
        v36 = 1;
LABEL_29:
        v38 = *(_QWORD *)(a1 + 8);
        v39 = *(_QWORD *)(v38 + 32);
        *(_QWORD *)(v38 + 96) = 0;
        *(_QWORD *)(v38 + 104) = v39;
        *(_BYTE *)(v38 + 112) = 0;
        v40 = WiFiDeviceClientAssociateAsync();
        if ((_DWORD)v40)
        {
          v13 = v40;
          goto LABEL_57;
        }
        v41 = *(_QWORD *)(a1 + 8);
        if (*(_BYTE *)(v41 + 112) || (v42 = *(NSObject **)(v41 + 104)) == 0)
        {
          v13 = 4294960573;
          goto LABEL_57;
        }
        dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
        v44 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)(v44 + 104) = 0;
        v45 = *(unsigned int *)(v44 + 88);
        v46 = v36 ^ 1;
        if (!(_DWORD)v45)
          v46 = 1;
        if ((v46 & 1) == 0)
        {
          WiFiNetworkRemovePassword();
          if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"Join network err: %d\n", v24, v25, v26, v27, v45);
        }
        v13 = 4294967280;
        if ((int)v45 <= -3903)
        {
          if ((_DWORD)v45 == -3924)
            goto LABEL_57;
          if ((_DWORD)v45 != -3906 && (_DWORD)v45 != -3905)
          {
LABEL_51:
            if ((_DWORD)v45)
            {
              v13 = v45;
            }
            else
            {
              v13 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 96);
              if (v13)
              {
                if (v8 == 1
                  || (objc_msgSend_date(MEMORY[0x24BDBCE60], v43, v22),
                      WiFiNetworkSetAssociationDate(),
                      WiFiManagerClientAddNetwork(),
                      (v13 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 96)) != 0))
                {
                  CFRelease((CFTypeRef)v13);
                  v13 = 0;
                  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 96) = 0;
                }
              }
              else
              {
                v13 = 4294960569;
              }
            }
            goto LABEL_57;
          }
        }
        else if ((int)v45 > 4)
        {
          if ((_DWORD)v45 == 16)
          {
            v13 = 4294960575;
            goto LABEL_57;
          }
          if ((_DWORD)v45 != 5)
            goto LABEL_51;
        }
        else if ((_DWORD)v45 != -3902)
        {
          if ((_DWORD)v45 != -100)
            goto LABEL_51;
LABEL_57:
          sub_21A72A05C(a1, 1u, v22, v23, v24, v25, v26, v27);
          CFRelease(v21);
          if (v30)
            CFRelease(v30);
          return v13;
        }
        v13 = 4294963391;
        goto LABEL_57;
      }
    }
    else
    {
      v30 = 0;
    }
    v36 = 0;
    goto LABEL_29;
  }
  return v13;
}

uint64_t sub_21A72A05C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if (!a1)
    return 4294960578;
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8 || *(_DWORD *)v8 != 1634561902 || !*(_QWORD *)(v8 + 8))
    return 4294960578;
  v10 = *(_QWORD *)(v8 + 40);
  if (a2)
  {
    if (v10)
    {
      v11 = v10 - 1;
      *(_QWORD *)(v8 + 40) = v11;
      if (!v11)
      {
        if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)" Set AutoJoin ON\n", a5, a6, a7, a8, v13);
        WiFiManagerClientEnable();
      }
    }
  }
  else
  {
    *(_QWORD *)(v8 + 40) = v10 + 1;
    if (!v10)
    {
      if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)" Set AutoJoin Off\n", a5, a6, a7, a8, v13);
      WiFiManagerClientDisable();
    }
  }
  if (dword_2550F4AC0 > 800)
    return 0;
  if (dword_2550F4AC0 != -1 || (result = sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u), (_DWORD)result))
  {
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)"inState: %d autoJoinOffCount: %d\n", a5, a6, a7, a8, a2);
    return 0;
  }
  return result;
}

void sub_21A72A1F4(int a1, CFTypeRef cf, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v11;
  uint64_t v12;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"void __joinUsingDeviceCallback(WiFiDeviceClientRef, WiFiNetworkRef, CFDictionaryRef, WiFiError, void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v12);
  if (a5)
  {
    *(_DWORD *)a5 = a4;
    if (*(_BYTE *)(a5 + 24))
    {
      if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"void __joinUsingDeviceCallback(WiFiDeviceClientRef, WiFiNetworkRef, CFDictionaryRef, WiFiError, void *)", 800, (uint64_t)"Cancelling out of __joinUsingDeviceCallback?\n", a5, a6, a7, a8, v12);
    }
    else
    {
      *(_QWORD *)(a5 + 8) = cf;
      if (cf)
        CFRetain(cf);
    }
    v11 = *(NSObject **)(a5 + 16);
    if (v11)
      dispatch_semaphore_signal(v11);
  }
}

uint64_t sub_21A72A2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;

  if (!a1)
    return 4294960578;
  v8 = *(_QWORD *)(a1 + 8);
  if (!v8 || *(_DWORD *)v8 != 1634561902 || !*(_QWORD *)(v8 + 24))
    return 4294960578;
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_Disassociate(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  return WiFiDeviceClientDisassociate();
}

uint64_t sub_21A72A39C(uint64_t a1, const char *a2, char a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  unsigned int v9;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const __CFArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v8 = (_QWORD *)a6;
  v9 = a5;
  v68 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_ScanInfo(WiFiShimContextRef, CFStringRef, WiFiType, Boolean, uint32_t, CFArrayRef *)", 800, (uint64_t)"inName: %@\n", a5, a6, a7, a8, (uint64_t)a2);
  if (!a1)
    return 4294960578;
  v14 = *(_QWORD *)(a1 + 8);
  if (!v14 || *(_DWORD *)v14 != 1634561902 || !*(_QWORD *)(v14 + 24))
    return 4294960578;
  if (!v8)
    return 4294960591;
  *v8 = 0;
  v15 = (void *)MEMORY[0x24BDBCED8];
  v16 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, a4 != 0);
  v18 = (void *)objc_msgSend_dictionaryWithObject_forKey_(v15, v17, v16, CFSTR("SCAN_MERGE"));
  v20 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v19, v9);
  objc_msgSend_setObject_forKey_(v18, v21, v20, CFSTR("SCAN_MAXAGE"));
  if (a2)
    objc_msgSend_setObject_forKey_(v18, v22, (uint64_t)a2, CFSTR("SSID_STR"));
  if ((a3 & 2) == 0)
  {
    v61 = v18;
    v62 = v8;
    v24 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v22, v23);
    v26 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v25, 0);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v27 = *(void **)(*(_QWORD *)(a1 + 8) + 48);
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v63, v67, 16);
    if (v29)
    {
      v31 = v29;
      v32 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v27);
          v34 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v63 + 1) + 8 * i), v30, (uint64_t)CFSTR("SUP_CHANNEL"));
          v37 = objc_msgSend_integerValue(v34, v35, v36);
          if ((unint64_t)(v37 - 1) <= 0xD)
          {
            v38 = (void *)MEMORY[0x24BDBCE70];
            v39 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v30, v37);
            v41 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v40, v39, CFSTR("CHANNEL"), v26, CFSTR("CHANNEL_FLAGS"), 0);
            objc_msgSend_addObject_(v24, v42, v41);
          }
        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v63, v67, 16);
      }
      while (v31);
    }
    objc_msgSend_setObject_forKey_(v61, v30, (uint64_t)v24, CFSTR("SCAN_CHANNELS"));
    v8 = v62;
  }
  v43 = (const __CFArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = *(_QWORD *)(a1 + 8);
  *(_DWORD *)(v44 + 56) = 0;
  v44 += 56;
  v45 = *(_QWORD *)(v44 - 24);
  *(_QWORD *)(v44 + 8) = v43;
  *(_QWORD *)(v44 + 16) = v45;
  *(_BYTE *)(v44 + 24) = 0;
  v46 = WiFiDeviceClientScanAsync();
  if (!(_DWORD)v46)
  {
    v47 = *(_QWORD *)(a1 + 8);
    if (*(_BYTE *)(v47 + 80) || (v49 = *(NSObject **)(v47 + 72)) == 0)
    {
      v46 = 4294960573;
    }
    else
    {
      dispatch_semaphore_wait(v49, 0xFFFFFFFFFFFFFFFFLL);
      v52 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(v52 + 72) = 0;
      v53 = *(_DWORD *)(v52 + 56);
      if (v53)
      {
        if (v53 == 16)
          v46 = 4294960575;
        else
          v46 = v53;
      }
      else if (objc_msgSend_count(v43, v50, v51))
      {
        v46 = 0;
        *v8 = sub_21A729264(v43, v54, v55, v56, v57, v58, v59, v60);
      }
      else
      {
        v46 = 4294960569;
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 64) = 0;
  if (v43)

  return v46;
}

void sub_21A72A70C(int a1, CFArrayRef theArray, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v11;
  uint64_t v12;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
  {
    if (theArray)
      CFArrayGetCount(theArray);
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"void __scanUsingDeviceCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 800, (uint64_t)"err: %d scanResults: %d\n", a5, a6, a7, a8, a3);
  }
  if (a4)
  {
    *(_DWORD *)a4 = a3;
    if (*(_BYTE *)(a4 + 24))
    {
      if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"void __scanUsingDeviceCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 800, (uint64_t)"Cancelling out of __scanUsingDeviceCallback ?\n", a5, a6, a7, a8, v12);
    }
    else if (theArray)
    {
      objc_msgSend_addObjectsFromArray_(*(void **)(a4 + 8), (const char *)theArray, (uint64_t)theArray);
    }
    v11 = *(NSObject **)(a4 + 16);
    if (v11)
      dispatch_semaphore_signal(v11);
  }
}

uint64_t sub_21A72A82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  dispatch_semaphore_t *v12;
  uint64_t v14;
  uint64_t v15;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WIFIShim_Cancel(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  if (!a1)
    return 4294960578;
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9)
    return 4294960578;
  if (*(_DWORD *)v9 != 1634561902)
    return 4294960578;
  if (!*(_QWORD *)(v9 + 24))
    return 4294960578;
  v10 = *(_QWORD *)(v9 + 32);
  if (!v10)
    return 4294960578;
  if (*(_QWORD *)(v9 + 72) == v10)
  {
    WiFiDeviceClientScanCancel();
    v14 = *(_QWORD *)(a1 + 8);
    *(_BYTE *)(v14 + 80) = 1;
    v12 = (dispatch_semaphore_t *)(v14 + 72);
    goto LABEL_15;
  }
  if (*(_QWORD *)(v9 + 104) == v10)
  {
    WiFiDeviceClientAssociateCancel();
    v11 = *(_QWORD *)(a1 + 8);
    *(_BYTE *)(v11 + 112) = 1;
    v12 = (dispatch_semaphore_t *)(v11 + 104);
LABEL_15:
    dispatch_semaphore_signal(*v12);
  }
  return 0;
}

uint64_t sub_21A72A91C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t InterfaceName;
  const char *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a1 && (v9 = *(_QWORD *)(a1 + 8)) != 0 && *(_DWORD *)v9 == 1634561902 && *(_QWORD *)(v9 + 8))
  {
    v12 = (void *)WiFiManagerClientCopyDevices();
    if (!v12)
      goto LABEL_23;
    v13 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v10, v11);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v25, v29, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v12);
          InterfaceName = WiFiDeviceClientGetInterfaceName();
          if (InterfaceName)
            objc_msgSend_addObject_(v13, v22, InterfaceName);
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v25, v29, 16);
      }
      while (v18);
    }
    if (objc_msgSend_count(v13, v16, v17))
    {
      *a2 = (uint64_t)v13;
      CFRetain(v13);
      v23 = 0;
    }
    else
    {
LABEL_23:
      v23 = 4294960569;
    }
  }
  else
  {
    v12 = 0;
    v23 = 4294960578;
  }
  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_GetIfListCopy(WiFiShimContextRef, CFArrayRef *)", 800, (uint64_t)"outIfList: %@\n", a5, a6, a7, a8, *a2);

  return v23;
}

uint64_t sub_21A72AAE4(uint64_t a1, BOOL *a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 4294960578;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2 || *(_DWORD *)v2 != 1634561902)
    return 4294960578;
  if (!a2)
    return 4294960591;
  result = 0;
  *a2 = *(_QWORD *)(v2 + 40) == 0;
  return result;
}

uint64_t sub_21A72AB30(uint64_t a1, const __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  CFIndex Length;
  uint64_t v19;

  if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_KeychainPasswordCopy(CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v19);
  result = 4294960591;
  if (a1 && a2)
  {
    v11 = WiFiNetworkCreate();
    if (!v11)
      return 4294960568;
    v12 = (const void *)v11;
    if (WiFiNetworkRequiresPassword())
    {
      v17 = (const __CFString *)WiFiNetworkCopyPassword();
      if (dword_2550F4AC0 <= 800 && (dword_2550F4AC0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4AC0, 0x320u)))
      {
        if (v17)
          Length = CFStringGetLength(v17);
        else
          Length = -1;
        sub_21A698FDC((uint64_t)&dword_2550F4AC0, (uint64_t)"OSStatus WiFiShim_KeychainPasswordCopy(CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"curPW len: %d \n", v13, v14, v15, v16, Length);
      }
      CFRelease(v12);
      if (v17)
      {
        result = 0;
        *a2 = v17;
        return result;
      }
    }
    else
    {
      CFRelease(v12);
    }
    return 4294960569;
  }
  return result;
}

uint64_t sub_21A72AC78()
{
  return 4294960561;
}

BOOL sub_21A72AC80(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  if (!a1 && !a2 && !a3 || byte_2550F4D80 != 1)
    return 0;
  if (a1)
    *a1 = qword_2550F4D88;
  if (a2)
    *a2 = qword_2550F4D90;
  v3 = qword_2550F4D98;
  if (a3)
    *a3 = qword_2550F4D98;
  return (qword_2550F4D88 | qword_2550F4D90 | v3) != 0;
}

uint64_t sub_21A72ACF0()
{
  uint64_t result;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const char *v6;
  void *error;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  if ((byte_2550F4D80 & 1) != 0)
    return 0;
  if (pthread_main_np())
    return 4294960593;
  if ((byte_2550F4D80 & 1) != 0)
    return 4294960577;
  result = 4294960587;
  if (!qword_2550F4D88 && !qword_2550F4D90 && !qword_2550F4D98)
  {
    v2 = *MEMORY[0x24BDBA2C8];
    v16[0] = *MEMORY[0x24BDBA2E0];
    v16[1] = v2;
    v3 = *MEMORY[0x24BDBA328];
    v16[2] = *MEMORY[0x24BDBA2C0];
    v16[3] = v3;
    v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v1, (uint64_t)v16, 4);
    v15 = 0;
    v5 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    error = (void *)objc_msgSend__ios_meContactWithKeysToFetch_error_(v5, v6, v4, &v15);
    if (error)
    {
      v10 = error;
      qword_2550F4D88 = (uint64_t)(id)objc_msgSend_givenName(error, v8, v9, v15);
      qword_2550F4D90 = (uint64_t)(id)objc_msgSend_familyName(v10, v11, v12);
      qword_2550F4D98 = (uint64_t)(id)objc_msgSend_nickname(v10, v13, v14);
    }
    result = 0;
    byte_2550F4D80 = 1;
  }
  return result;
}

uint64_t sub_21A72BCB0()
{
  if (qword_2550F4DA8 != -1)
    dispatch_once(&qword_2550F4DA8, &unk_24DD07AF8);
  return byte_2550F4DA0;
}

uint64_t sub_21A72BCF0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t result;

  v3 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, a3);
  objc_msgSend_addSuiteNamed_(v3, v4, (uint64_t)CFSTR("com.apple.logging"));
  result = objc_msgSend_BOOLForKey_(v3, v5, (uint64_t)CFSTR("DebugWACLogging"));
  byte_2550F4DA0 = result;
  return result;
}

uint64_t sub_21A72BD3C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint32_t v8;
  uint64_t v9;
  uint32_t v10;
  uint32_t v11;

  v2 = a2;
  if (a2 < 4)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    v5 = a1 + 3;
    do
    {
      *(_DWORD *)(v5 - 3) = bswap32(arc4random());
      v5 += 4;
      v4 -= 4;
      v6 = v2 + v4;
    }
    while (v2 + v4 > 3);
    v7 = -v4;
    v2 = v6;
  }
  switch(v2)
  {
    case 1uLL:
      v10 = arc4random() >> 24;
      goto LABEL_12;
    case 2uLL:
      v11 = arc4random();
      *(_BYTE *)(a1 + v7) = HIBYTE(v11);
      v7 |= 1uLL;
      v10 = HIWORD(v11);
      goto LABEL_12;
    case 3uLL:
      v8 = arc4random();
      *(_BYTE *)(a1 + v7) = HIBYTE(v8);
      v9 = v7 | 1;
      v7 |= 2uLL;
      *(_BYTE *)(a1 + v9) = BYTE2(v8);
      v10 = v8 >> 8;
LABEL_12:
      *(_BYTE *)(a1 + v7) = v10;
      break;
  }
  return 0;
}

uint64_t sub_21A72BE08(NSObject ***a1, const char *a2)
{
  NSObject **v4;
  NSObject **v5;
  const char *v6;
  NSObject *v7;
  uint64_t result;

  v4 = (NSObject **)malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040C96B0B76uLL);
  if (v4)
  {
    v5 = v4;
    if (a2)
      v6 = a2;
    else
      v6 = "BonjourBrowser";
    v7 = dispatch_queue_create(v6, 0);
    *v5 = v7;
    if (v7)
    {
      dispatch_set_context(v7, v5);
      dispatch_set_finalizer_f(*v5, (dispatch_function_t)sub_21A72BEB0);
      sub_21A72BEDC((uint64_t)v5, 0);
      result = 0;
      *a1 = v5;
      return result;
    }
    sub_21A72BEB0(v5);
  }
  return 4294960568;
}

void sub_21A72BEB0(_QWORD *a1)
{
  NSObject *v2;

  v2 = a1[1];
  if (v2)
    dispatch_release(v2);
  free(a1);
}

void sub_21A72BEDC(uint64_t a1, NSObject *a2)
{
  NSObject *v3;
  NSObject *v4;

  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x24BDAC9B8];
  dispatch_retain(v3);
  v4 = *(NSObject **)(a1 + 8);
  if (v4)
    dispatch_release(v4);
  *(_QWORD *)(a1 + 8) = v3;
}

void sub_21A72BF20(dispatch_queue_t *context)
{
  dispatch_async_f(*context, context, (dispatch_function_t)sub_21A72BF34);
}

void sub_21A72BF34(dispatch_object_t *a1)
{
  sub_21A72C1C0((uint64_t)a1);
  dispatch_release(*a1);
}

uint64_t sub_21A72BF58(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  return result;
}

uint64_t sub_21A72BF60(dispatch_queue_t *a1, const char *a2, const char *a3, const char *a4, uint64_t a5)
{
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  char *v13;
  const char *v14;
  char *v15;
  char *v16;
  void *v18;
  void *v19;

  v10 = malloc_type_calloc(1uLL, 0x28uLL, 0x1030040D16A4755uLL);
  if (v10)
  {
    v11 = v10;
    *v10 = a1;
    v12 = strdup(a2);
    v11[1] = v12;
    if (v12)
    {
      v13 = v12;
      if (a3)
        v14 = a3;
      else
        v14 = "";
      v15 = strdup(v14);
      v11[2] = v15;
      if (v15)
      {
        if (!a4 || !*a4 || (v16 = strdup(a4), (v11[3] = v16) != 0))
        {
          v11[4] = a5;
          dispatch_async_f(*a1, v11, (dispatch_function_t)sub_21A72C05C);
          return 0;
        }
      }
      free(v13);
    }
    v18 = (void *)v11[2];
    if (v18)
      free(v18);
    v19 = (void *)v11[3];
    if (v19)
      free(v19);
    free(v11);
  }
  return 4294960568;
}

void sub_21A72C05C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  DNSServiceRef *v4;
  const char *v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  DNSServiceRef sdRef;

  v2 = *a1;
  v3 = a1[4];
  sdRef = 0;
  *(_QWORD *)(v2 + 64) = v3;
  *(_BYTE *)(v2 + 72) = 1;
  v4 = (DNSServiceRef *)(v2 + 32);
  if (!DNSServiceCreateConnection((DNSServiceRef *)(v2 + 32)))
  {
    DNSServiceSetDispatchQueue(*(DNSServiceRef *)(v2 + 32), *(dispatch_queue_t *)v2);
    v5 = (const char *)a1[3];
    if (v5)
      v6 = if_nametoindex(v5);
    else
      v6 = 0;
    sdRef = *(DNSServiceRef *)(v2 + 32);
    if (!DNSServiceBrowse(&sdRef, v3 | 0x4000, v6, (const char *)a1[1], (const char *)a1[2], (DNSServiceBrowseReply)sub_21A72C5F0, (void *)v2))
    {
      *(_QWORD *)(v2 + 40) = sdRef;
      goto LABEL_13;
    }
    if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
      sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_Start(void *)", 5000, (uint64_t)"### Bonjour browse for %s%s on interface %u failed: %#m\n", v7, v8, v9, v10, a1[1]);
  }
  if (*v4)
  {
    DNSServiceRefDeallocate(*v4);
    *v4 = 0;
  }
LABEL_13:
  free((void *)a1[1]);
  free((void *)a1[2]);
  v11 = (void *)a1[3];
  if (v11)
    free(v11);
  free(a1);
}

void sub_21A72C1AC(dispatch_queue_t *context)
{
  dispatch_async_f(*context, context, (dispatch_function_t)sub_21A72C1C0);
}

void sub_21A72C1C0(uint64_t a1)
{
  int v2;
  _DNSServiceRef_t *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(a1 + 72);
  *(_BYTE *)(a1 + 72) = 0;
  v3 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v3)
  {
    DNSServiceRefDeallocate(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_QWORD *)(a1 + 40) = 0;
  while (1)
  {
    v4 = *(_QWORD **)(a1 + 56);
    if (!v4)
      break;
    *(_QWORD *)(a1 + 56) = *v4;
    sub_21A72D9CC(v4);
  }
  while (1)
  {
    v5 = *(_QWORD **)(a1 + 48);
    if (!v5)
      break;
    *(_QWORD *)(a1 + 48) = *v5;
    v5[9] = 0;
    sub_21A72C9B8(v5);
  }
  if (v2)
    sub_21A72D0AC(a1, 3, 0);
}

void sub_21A72C244(dispatch_queue_t *a1, const void *a2, char a3)
{
  _QWORD *v6;
  void *v7;

  v6 = malloc_type_malloc(0x18uLL, 0x1060040520DAF6DuLL);
  if (v6)
  {
    v7 = v6;
    *v6 = a1;
    v6[1] = a2;
    *((_BYTE *)v6 + 16) = a3;
    CFRetain(a2);
    dispatch_async_f(*a1, v7, (dispatch_function_t)sub_21A72C2C0);
  }
}

void sub_21A72C2C0(const __CFDictionary **a1)
{
  const __CFDictionary *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  int v19;
  int v20;
  char *v21;
  uint64_t v22;
  char fullName[1009];
  _BYTE rdata[240];
  __int128 v25;
  char v26[64];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  memset(rdata, 0, sizeof(rdata));
  v26[0] = 0;
  v2 = *a1;
  sub_21A695490(a1[1], CFSTR("deviceID"), v26, 0x40uLL, 0);
  if (!v26[0])
    goto LABEL_49;
  v3 = (char *)v2 + 56;
  do
  {
    v3 = *(char **)v3;
    if (!v3)
      goto LABEL_49;
  }
  while (strcasecmp(v3 + 16, v26));
  v4 = *((_QWORD *)v3 + 11);
  if (!v4)
    goto LABEL_49;
  do
  {
    if (*((_BYTE *)a1 + 16) && !*(_DWORD *)(v4 + 48)
      || DNSServiceConstructFullName(fullName, *(const char *const *)(v4 + 24), *(const char *const *)(v4 + 32), *(const char *const *)(v4 + 40)))
    {
      goto LABEL_20;
    }
    v5 = 0;
    rdata[0] = 0;
    while (1)
    {
      v6 = rdata[v5];
      if (v6 > 0x3F)
      {
LABEL_13:
        v7 = fullName;
        v8 = (char *)&v25 + 15;
LABEL_14:
        *v8 = 0;
        v9 = (_WORD)v8 + 1;
        if (!*v7)
        {
          snprintf(fullName, 0x3F1uLL, "%s%s", *(const char **)(v4 + 32), *(const char **)(v4 + 40));
          if (dword_2550F4B10 <= 3000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0xBB8u)))
            sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_ReconfirmDevice(void *)", 3000, (uint64_t)"Reconfirming PTR for %s.%s%s on %s\n", v10, v11, v12, v13, *(_QWORD *)(v4 + 24));
          DNSServiceReconfirmRecord(0, *(_DWORD *)(v4 + 48), fullName, 0xCu, 1u, v9 - (unsigned __int16)rdata, rdata);
        }
        goto LABEL_20;
      }
      if (!rdata[v5])
        break;
      v5 += v6 + 1;
      if ((unint64_t)v5 >= 0xFF)
        goto LABEL_13;
    }
    v8 = &rdata[v5];
    v7 = fullName;
    if ((unint64_t)v5 > 0xFD)
      goto LABEL_14;
    LOBYTE(v14) = fullName[0];
    if (!fullName[0])
      goto LABEL_14;
    v7 = fullName;
    while (v14 != 46)
    {
      v15 = v5 <= 253 ? 253 : v5;
      v16 = v5;
      while ((_BYTE)v14 && v14 != 46)
      {
        if (v15 == v16)
          goto LABEL_43;
        if (v14 == 92)
        {
          v17 = v7 + 2;
          v14 = v7[1];
          if ((v14 - 48) <= 9)
          {
            v18 = *v17;
            if ((v18 - 48) <= 9)
            {
              v19 = v7[3];
              if ((v19 - 48) <= 9)
              {
                v20 = 100 * v7[1] + 10 * (char)v18 + (char)v19;
                v21 = v7 + 4;
                if (v20 < 5584)
                {
                  LOBYTE(v14) = v20 + 48;
                  v17 = v21;
                }
              }
            }
          }
        }
        else
        {
          v17 = v7 + 1;
        }
        rdata[v16 + 1] = v14;
        LOBYTE(v14) = *v17;
        ++v16;
        v7 = v17;
      }
      v15 = v16;
LABEL_43:
      v22 = rdata - v8 + v16;
      if (v22 > 63)
        break;
      if ((_BYTE)v14)
        ++v7;
      *v8 = v22;
      LOBYTE(v14) = *v7;
      if (*v7)
      {
        v5 = v16 + 1;
        v8 = &rdata[v16 + 1];
        if (v15 < 253)
          continue;
      }
      v8 = &rdata[v16 + 1];
      goto LABEL_14;
    }
LABEL_20:
    v4 = *(_QWORD *)(v4 + 8);
  }
  while (v4);
LABEL_49:
  CFRelease(a1[1]);
  free(a1);
}

void sub_21A72C5F0(int a1, unsigned __int8 a2, unsigned int a3, int a4, char *a5, const char *a6, const char *a7, uint64_t a8, uint64_t a9)
{
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  _QWORD *v24;

  if (a4)
    return;
  if (*(_BYTE *)(a8 + 72))
  {
    v14 = a2;
    if (dword_2550F4B10 <= 500 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1F4u)))
    {
      v15 = "Add";
      if (((v14 >> 1) & 1) == 0)
        v15 = "Rmv";
      sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 500, (uint64_t)"Bonjour PTR %s %s.%s%s on %u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)v15);
    }
    v17 = a8 + 48;
    v16 = *(_QWORD *)(a8 + 48);
    if (v16)
    {
      while (1)
      {
        v18 = (_QWORD *)v17;
        v17 = v16;
        if (*(_DWORD *)(v16 + 48) == a3
          && !strcasecmp(*(const char **)(v16 + 24), a5)
          && !strcasecmp(*(const char **)(v17 + 32), a6)
          && !strcasecmp(*(const char **)(v17 + 40), a7))
        {
          break;
        }
        v16 = *(_QWORD *)v17;
        if (!*(_QWORD *)v17)
          goto LABEL_16;
      }
      if ((v14 & 2) == 0)
      {
        *v18 = *(_QWORD *)v17;
        sub_21A72CA30(a8, v17);
        v24 = (_QWORD *)v17;
        goto LABEL_34;
      }
      if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### <radar:6451163> Duplicate add of %s.%s%s%%%u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)a5);
    }
    else
    {
LABEL_16:
      if ((v14 & 2) != 0)
      {
        v19 = malloc_type_calloc(1uLL, 0x60uLL, 0x10300400E9D42ADuLL);
        if (!v19)
          return;
        v20 = (uint64_t)v19;
        v19[2] = a8;
        v21 = strdup(a5);
        *(_QWORD *)(v20 + 24) = v21;
        if (v21)
        {
          v22 = strdup(a6);
          *(_QWORD *)(v20 + 32) = v22;
          if (v22)
          {
            v23 = strdup(a7);
            *(_QWORD *)(v20 + 40) = v23;
            if (v23)
            {
              *(_DWORD *)(v20 + 48) = a3;
              if_indextoname(a3, (char *)(v20 + 52));
              if (*(_BYTE *)(v20 + 52) && sub_21A6A115C((const char *)(v20 + 52)))
                *(_BYTE *)(v20 + 69) = 1;
              if (!sub_21A72C914(v20))
              {
                *(_QWORD *)v17 = v20;
                return;
              }
            }
          }
        }
        v24 = (_QWORD *)v20;
LABEL_34:
        sub_21A72C9B8(v24);
        return;
      }
      if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### <radar:6451163> Remove of non-existent %s.%s%s%%%u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)a5);
    }
  }
  else if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### Browse after stop\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a9);
  }
}

uint64_t sub_21A72C914(uint64_t a1)
{
  uint64_t result;
  DNSServiceRef sdRef;
  char fullName[1009];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = DNSServiceConstructFullName(fullName, *(const char *const *)(a1 + 24), *(const char *const *)(a1 + 32), *(const char *const *)(a1 + 40));
  if (!(_DWORD)result)
  {
    sdRef = *(DNSServiceRef *)(*(_QWORD *)(a1 + 16) + 32);
    result = DNSServiceQueryRecord(&sdRef, 0x4000u, *(_DWORD *)(a1 + 48), fullName, 0x10u, 1u, (DNSServiceQueryRecordReply)sub_21A72CAE8, (void *)a1);
    if (!(_DWORD)result)
      *(_QWORD *)(a1 + 72) = sdRef;
  }
  return result;
}

void sub_21A72C9B8(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _DNSServiceRef_t *v5;
  _QWORD *v6;

  v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    free(v4);
    a1[5] = 0;
  }
  v5 = (_DNSServiceRef_t *)a1[9];
  if (v5)
  {
    DNSServiceRefDeallocate(v5);
    a1[9] = 0;
  }
  while (1)
  {
    v6 = (_QWORD *)a1[10];
    if (!v6)
      break;
    a1[10] = *v6;
    free(v6);
  }
  free(a1);
}

void sub_21A72CA30(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a2 + 88);
  if (v2)
  {
    v3 = v2[11];
    if (v3)
    {
      v4 = v2 + 11;
      if (v3 != a2)
      {
        while (1)
        {
          v5 = v3;
          v3 = *(_QWORD *)(v3 + 8);
          if (!v3)
            goto LABEL_8;
          if (v3 == a2)
          {
            v4 = (_QWORD *)(v5 + 8);
            break;
          }
        }
      }
      *v4 = *(_QWORD *)(a2 + 8);
      if (v2[11])
      {
LABEL_8:
        sub_21A72D0AC(a1, 1, (uint64_t)v2);
        sub_21A72D044((uint64_t)v2);
        return;
      }
    }
    v6 = (_QWORD *)(a1 + 56);
    while (1)
    {
      v7 = v6;
      v6 = (_QWORD *)*v6;
      if (!v6)
        break;
      if (v6 == v2)
      {
        *v7 = *v2;
        break;
      }
    }
    sub_21A72D0AC(a1, 2, (uint64_t)v2);
    sub_21A72D9CC(v2);
  }
}

void sub_21A72CAE8(int a1, unsigned __int8 a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t __n, void *__s1, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  char *v27;
  char *v28;
  size_t v29;
  char *ValuePtr;
  const char *v31;
  uint8_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42[6];
  uint8_t valueLen;
  char v44[8];
  unsigned __int8 v45[8];
  char __s[256];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (a4)
    return;
  v11 = a11[2];
  if (*(_BYTE *)(v11 + 72))
  {
    v12 = __n;
    v13 = a2;
    if (dword_2550F4B10 <= 500 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1F4u)))
    {
      v14 = "Add";
      if (((v13 >> 1) & 1) == 0)
        v14 = "Rmv";
      sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 500, (uint64_t)"Bonjour TXT %s %s on %u\n", a5, a6, a7, __n, (uint64_t)v14);
    }
    v16 = a11 + 10;
    v15 = a11[10];
    if ((v13 & 2) != 0)
    {
      v20 = a11 + 10;
      if (v15)
      {
        v21 = (_QWORD *)a11[10];
        while (1)
        {
          v20 = v21;
          if (v21[1] == v12 && !memcmp(__s1, v21 + 2, v12))
            break;
          v21 = (_QWORD *)*v20;
          if (!*v20)
            goto LABEL_29;
        }
      }
      else
      {
LABEL_29:
        v22 = malloc_type_calloc(1uLL, v12 + 16, 0x4F1ED9D8uLL);
        if (v22)
        {
          v23 = v22;
          *v22 = 0;
          v22[1] = v12;
          memcpy(v22 + 2, __s1, v12);
          *v20 = v23;
        }
      }
    }
    else if (v15)
    {
      v17 = (_QWORD *)a11[10];
      v18 = a11 + 10;
      while (1)
      {
        v19 = v17;
        if (v17[1] == v12 && !memcmp(__s1, v17 + 2, v12))
          break;
        v17 = (_QWORD *)*v19;
        v18 = v19;
        if (!*v19)
          goto LABEL_16;
      }
      *v18 = *v19;
      free(v19);
    }
    else
    {
LABEL_16:
      if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourService_RemoveRData(BonjourServiceRef, const void *, size_t)", 5000, (uint64_t)"### Removed RData missing for %s.%s%s %%%u\n%1.1H\n", a5, a6, a7, __n, a11[3]);
    }
    v24 = *v16;
    if (*v16 && v24 != v15)
    {
      valueLen = 0;
      v25 = *(_QWORD *)(v24 + 8);
      v26 = (const char *)a11[4];
      if (!strcasecmp(v26, "_airplay._tcp."))
      {
        ValuePtr = (char *)TXTRecordGetValuePtr(v25, (const void *)(v24 + 16), "deviceid", &valueLen);
        if (!ValuePtr)
          return;
        v29 = valueLen;
LABEL_47:
        if (sub_21A6A1EB0(ValuePtr, v29, 6, v42))
          return;
        v31 = sub_21A6A1FDC(v42, 6, __s);
        v32 = strlen(v31);
        v33 = v32;
        valueLen = v32;
        if (v32 >= 0x40u)
          return;
        __memcpy_chk();
        v44[v33] = 0;
        v34 = a11[11];
        if (v34)
        {
          if (!strcasecmp((const char *)(v34 + 16), v44))
          {
LABEL_63:
            sub_21A72D044(v34);
            sub_21A72D0AC(v11, 1, v34);
            return;
          }
          if (dword_2550F4B10 <= 1000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x3E8u)))
            sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 1000, (uint64_t)"### <radar:10037073> Removing and re-adding %s.%s%s for stale TXT record update (%s -> %s)\n", v35, v36, v37, v38, a11[3]);
          sub_21A72CA30(v11, (uint64_t)a11);
          a11[11] = 0;
        }
        v34 = v11 + 56;
        while (1)
        {
          v34 = *(_QWORD *)v34;
          if (!v34)
            break;
          if (!strcasecmp((const char *)(v34 + 16), v44))
            goto LABEL_62;
        }
        v39 = malloc_type_calloc(1uLL, 0x60uLL, 0x106004022B847F8uLL);
        if (!v39)
          return;
        v34 = (uint64_t)v39;
        v39[1] = v11;
        __strlcpy_chk();
        *(_QWORD *)v34 = *(_QWORD *)(v11 + 56);
        *(_QWORD *)(v11 + 56) = v34;
LABEL_62:
        a11[11] = v34;
        a11[1] = *(_QWORD *)(v34 + 88);
        *(_QWORD *)(v34 + 88) = a11;
        goto LABEL_63;
      }
      if (!strcasecmp(v26, "_airport._tcp."))
      {
        v40 = 0;
        v41 = 0;
        if ((_WORD)v25)
        {
          *(_QWORD *)v44 = v24 + 17;
          while (!sub_21A6A2EA0(*(unsigned __int8 **)v44, v24 + 17 + (unsigned __int16)v25 - 1, v45, 8, &v41, 0, __s, 256, &v40, 0, v44))
          {
            if (!sub_21A6988A0(v45, v41, "waMA"))
            {
              v29 = v40;
              ValuePtr = __s;
              goto LABEL_47;
            }
          }
        }
      }
      else if (!strcasecmp(v26, "_awp._tcp.") || !strcasecmp(v26, "_raop._tcp."))
      {
        v27 = (char *)a11[3];
        v28 = strchr(v27, 64);
        if (v28)
        {
          v29 = ((_BYTE)v28 - (_BYTE)v27);
          ValuePtr = v27;
          goto LABEL_47;
        }
      }
    }
  }
  else if (dword_2550F4B10 <= 5000 && (dword_2550F4B10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B10, 0x1388u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550F4B10, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 5000, (uint64_t)"### TXT after stop\n", a5, a6, a7, __n, (uint64_t)__s1);
  }
}

void sub_21A72D044(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  _DNSServiceRef_t *v5;

  v2 = sub_21A72D198(a1);
  if (v2)
  {
    v3 = v2;
    for (i = *(_QWORD *)(a1 + 88); i; i = *(_QWORD *)(i + 8))
    {
      if (i != v3)
      {
        v5 = *(_DNSServiceRef_t **)(i + 72);
        if (v5)
        {
          DNSServiceRefDeallocate(v5);
          *(_QWORD *)(i + 72) = 0;
        }
      }
    }
    if (!*(_QWORD *)(v3 + 72))
      sub_21A72C914(v3);
  }
}

void sub_21A72D0AC(uint64_t a1, int a2, uint64_t a3)
{
  __CFDictionary *v6;
  __CFDictionary *v7;
  const void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;

  if (*(_QWORD *)(a1 + 16))
  {
    v12 = 0;
    if (!a3)
    {
      v11 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E15455BBuLL);
      if (!v11)
        return;
      v10 = v11;
      v7 = 0;
      goto LABEL_11;
    }
    v6 = sub_21A72D20C(a3, &v12);
    if (!v12)
    {
      v7 = v6;
      v8 = *(const void **)(a3 + 80);
      if (v8)
        CFRelease(v8);
      *(_QWORD *)(a3 + 80) = v7;
      v9 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E15455BBuLL);
      if (v9)
      {
        v10 = v9;
        if (v7)
          CFRetain(v7);
LABEL_11:
        *(_DWORD *)v10 = a2;
        v10[1] = v7;
        *((_OWORD *)v10 + 1) = *(_OWORD *)(a1 + 16);
        dispatch_async_f(*(dispatch_queue_t *)(a1 + 8), v10, (dispatch_function_t)sub_21A72D69C);
      }
    }
  }
}

uint64_t sub_21A72D198(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 88);
    do
    {
      if (!strcmp(*(const char **)(v3 + 40), "local."))
      {
        if (!*(_BYTE *)(v3 + 69))
          return v3;
        if (!v2)
          v2 = v3;
      }
      v3 = *(_QWORD *)(v3 + 8);
    }
    while (v3);
    if (v2)
      return v2;
  }
  return v1;
}

__CFDictionary *sub_21A72D20C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFIndex v7;
  __CFDictionary *Mutable;
  const char *v9;
  char *v10;
  int v11;
  char *v12;
  size_t v13;
  size_t v15;
  unint64_t v16;
  int i;
  UInt8 *BytesPtr;
  unsigned int Length;
  uint64_t v20;
  CFMutableArrayRef v21;
  char v22;
  const CFDictionaryValueCallBacks *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  int v26;
  int v27;
  size_t v28;
  uint8_t valueSize[8];
  uint64_t v30;
  unsigned __int8 *v31;
  char value[256];
  char key[8];
  _BYTE buffer[256];
  TXTRecordRef txtRecord;
  char __s[1073];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = sub_21A72D198(a1);
  if (!v4 || (v5 = v4, (v6 = *(_QWORD *)(v4 + 80)) == 0))
  {
    Mutable = *(__CFDictionary **)(a1 + 80);
    if (!Mutable)
    {
      v11 = -6745;
      if (!a2)
        return Mutable;
      goto LABEL_17;
    }
    CFRetain(*(CFTypeRef *)(a1 + 80));
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(v6 + 8);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v11 = -6728;
    if (!a2)
      return Mutable;
    goto LABEL_17;
  }
  v9 = *(const char **)(v5 + 32);
  if (!strcasecmp(v9, "_awp._tcp.") || !strcasecmp(v9, "_raop._tcp."))
  {
    v10 = *(char **)(v5 + 24);
    v12 = strchr(v10, 64);
    if (v12)
      v10 = v12 + 1;
  }
  else
  {
    v10 = *(char **)(v5 + 24);
  }
  v13 = strlen(v10);
  sub_21A6954F0(Mutable, CFSTR("name"), v10, v13);
  sub_21A6954F0(Mutable, CFSTR("deviceID"), (char *)(a1 + 16), -1);
  v11 = sub_21A72D6D8(__s, *(_QWORD *)(v5 + 24), *(char **)(v5 + 32), *(unsigned __int8 **)(v5 + 40));
  if (!v11)
  {
    v15 = strlen(__s);
    snprintf(&__s[v15], 1073 - v15, "%%%u", *(_DWORD *)(v5 + 48));
    sub_21A6954F0(Mutable, CFSTR("dnsName"), __s, -1);
    sub_21A6954F0(Mutable, CFSTR("serviceType"), *(char **)(v5 + 32), -1);
    if (!strcasecmp(*(const char **)(v5 + 32), "_airport._tcp."))
    {
      txtRecord = 0uLL;
      *(_QWORD *)valueSize = 0;
      v30 = 0;
      if (!v7)
      {
        v11 = -6743;
        goto LABEL_16;
      }
      TXTRecordCreate(&txtRecord, 0x100u, buffer);
      v31 = (unsigned __int8 *)(v6 + 17);
      v16 = v6 + v7 + 16;
      for (i = sub_21A6A2EA0((unsigned __int8 *)(v6 + 17), v16, key, 7, &v30, 0, value, 256, valueSize, 0, &v31); !i; i = sub_21A6A2EA0(v31, v16, key, 7, &v30, 0, value, 256, valueSize, 0, &v31))
      {
        key[v30] = 0;
        TXTRecordSetValue(&txtRecord, key, valueSize[0], value);
      }
      BytesPtr = (UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
      Length = TXTRecordGetLength(&txtRecord);
      sub_21A695580(Mutable, CFSTR("txt"), BytesPtr, Length);
      TXTRecordDeallocate(&txtRecord);
    }
    else
    {
      sub_21A695580(Mutable, CFSTR("txt"), (UInt8 *)(v6 + 16), v7);
    }
    v20 = *(_QWORD *)(a1 + 88);
    if (v20)
    {
      v21 = 0;
      v22 = 1;
      v23 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      do
      {
        if (!v21)
        {
          v21 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
          if (!v21)
            goto LABEL_40;
        }
        v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], v23);
        if (!v24)
        {
          CFRelease(v21);
LABEL_40:
          v11 = -6728;
          goto LABEL_16;
        }
        v25 = v24;
        v26 = *(unsigned __int8 *)(v20 + 69);
        sub_21A6955E4(v24, CFSTR("ifindex"), *(unsigned int *)(v20 + 48));
        sub_21A6954F0(v25, CFSTR("ifname"), (char *)(v20 + 52), -1);
        v27 = sub_21A72D6D8(__s, *(_QWORD *)(v20 + 24), *(char **)(v20 + 32), *(unsigned __int8 **)(v20 + 40));
        if (v27)
        {
          v11 = v27;
          CFRelease(v21);
          CFRelease(v25);
          goto LABEL_16;
        }
        if (!v26)
          v22 = 0;
        v28 = strlen(__s);
        snprintf(&__s[v28], 1073 - v28, "%%%u", *(_DWORD *)(v20 + 48));
        sub_21A6954F0(v25, CFSTR("dnsName"), __s, -1);
        sub_21A6954F0(v25, CFSTR("domain"), *(char **)(v20 + 40), -1);
        CFArrayAppendValue(v21, v25);
        CFRelease(v25);
        v20 = *(_QWORD *)(v20 + 8);
      }
      while (v20);
      CFDictionarySetValue(Mutable, CFSTR("services"), v21);
      CFRelease(v21);
      if (!v22)
        goto LABEL_9;
    }
    CFDictionarySetValue(Mutable, CFSTR("p2pOnly"), (const void *)*MEMORY[0x24BDBD270]);
LABEL_9:
    v11 = 0;
    if (!a2)
      return Mutable;
    goto LABEL_17;
  }
LABEL_16:
  CFRelease(Mutable);
  Mutable = 0;
  if (a2)
LABEL_17:
    *a2 = v11;
  return Mutable;
}

void sub_21A72D69C(unsigned int *a1)
{
  const void *v2;

  (*((void (**)(_QWORD, _QWORD, _QWORD))a1 + 2))(*a1, *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 3));
  v2 = (const void *)*((_QWORD *)a1 + 1);
  if (v2)
    CFRelease(v2);
  free(a1);
}

uint64_t sub_21A72D6D8(_BYTE *a1, uint64_t a2, char *__s, unsigned __int8 *a4)
{
  uint64_t v4;
  size_t v9;
  _BOOL4 v10;
  unint64_t v11;
  const char *v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  unsigned __int8 v19;
  char v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  _BYTE *v25;
  unsigned __int8 v26;
  uint64_t v27;
  unsigned __int8 *v28;
  uint64_t v29;
  int v30;

  v4 = 4294901756;
  if (__s)
  {
    v9 = strlen(__s);
    v10 = sub_21A72D950((unsigned __int8 *)__s);
    if (a4)
    {
      v11 = v9 - v10;
      if (v11 >= 6)
      {
        if (*a4)
        {
          v12 = &__s[v11 - 4];
          if (!strncasecmp(v12, "_tcp", 4uLL) || !strncasecmp(v12, "_udp", 4uLL))
          {
            if (a2)
            {
              v13 = *(_BYTE *)a2;
              if (*(_BYTE *)a2)
              {
                v14 = 0;
                v15 = (unsigned __int8 *)(a2 + 1);
                v16 = a1;
                while (1)
                {
                  if (v13 < 0x21u)
                  {
LABEL_11:
                    if (v14 > 1000)
                      goto LABEL_45;
                    *v16 = 92;
                    v17 = &a1[v14];
                    v17[1] = 48;
                    v18 = v14 + 3;
                    v17[2] = (v13 / 0xAu) | 0x30;
                    v13 = (v13 % 0xAu) | 0x30;
                    goto LABEL_23;
                  }
                  if (v13 > 0x39u)
                  {
                    if (v13 != 92)
                    {
                      if (v13 == 58)
                        goto LABEL_11;
LABEL_19:
                      if (v14 >= 1004)
                        goto LABEL_45;
                      v18 = v14;
                      goto LABEL_23;
                    }
                  }
                  else
                  {
                    if (v13 == 37)
                      goto LABEL_11;
                    if (v13 != 46)
                      goto LABEL_19;
                  }
                  if (v14 > 1002)
                  {
LABEL_45:
                    v25 = &a1[v14];
                    goto LABEL_51;
                  }
                  v18 = v14 + 1;
                  *v16 = 92;
LABEL_23:
                  v14 = v18 + 1;
                  a1[v18] = v13;
                  v19 = *v15++;
                  v13 = v19;
                  v16 = &a1[v18 + 1];
                  if (!v19)
                  {
                    a2 = v18 + 2;
                    *v16 = 46;
                    goto LABEL_26;
                  }
                }
              }
              a2 = 0;
            }
LABEL_26:
            v20 = *__s;
            if (*__s)
            {
              v21 = 1004;
              if (a2 > 1004)
                v21 = a2;
              v22 = __s + 1;
              while (v21 != a2)
              {
                v23 = a2 + 1;
                a1[a2] = v20;
                v24 = *v22++;
                v20 = v24;
                ++a2;
                if (!v24)
                {
                  v25 = &a1[v23];
                  a2 = v23;
                  goto LABEL_34;
                }
              }
              goto LABEL_44;
            }
            v25 = &a1[a2];
LABEL_34:
            if (!sub_21A72D950((unsigned __int8 *)__s))
            {
              if (a2 > 1003)
                goto LABEL_51;
              ++a2;
              *v25 = 46;
            }
            v26 = *a4;
            if (*a4)
            {
              v27 = 1004;
              if (a2 > 1004)
                v27 = a2;
              v28 = a4 + 1;
              while (v27 != a2)
              {
                v29 = a2 + 1;
                a1[a2] = v26;
                v30 = *v28++;
                v26 = v30;
                ++a2;
                if (!v30)
                {
                  v25 = &a1[v29];
                  a2 = v29;
                  goto LABEL_47;
                }
              }
LABEL_44:
              v25 = &a1[a2];
              goto LABEL_51;
            }
            v25 = &a1[a2];
LABEL_47:
            if (sub_21A72D950(a4))
            {
              v4 = 0;
            }
            else if (a2 <= 1003)
            {
              v4 = 0;
              *v25++ = 46;
            }
LABEL_51:
            *v25 = 0;
          }
        }
      }
    }
  }
  return v4;
}

BOOL sub_21A72D950(unsigned __int8 *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  if (*a1)
  {
    while (1)
    {
      v2 = a1[1];
      if (!a1[1])
        break;
      if (v1 == 92)
      {
        if ((v2 - 48) > 9 || a1[2] - 48 > 9 || a1[3] - 48 >= 0xA)
          v3 = 2;
        else
          v3 = 4;
        a1 += v3;
        v1 = *a1;
        if (!*a1)
          return v1 == 46;
      }
      else
      {
        v1 = *++a1;
        if (!v2)
          return v1 == 46;
      }
    }
  }
  return v1 == 46;
}

void sub_21A72D9CC(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[10];
  if (v2)
    CFRelease(v2);
  free(a1);
}

uint64_t sub_21A72DD0C(void *a1, unsigned int a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;

  v4 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (!a1 || a2 < 0x10)
    goto LABEL_10;
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  v8 = (void *)objc_msgSend_bundleForClass_(v5, v7, v6);
  if (!v8
    || ((v10 = (void *)objc_msgSend_objectForInfoDictionaryKey_(v8, v9, (uint64_t)CFSTR("CFBundleVersion")),
         !objc_msgSend_length(v10, v11, v12))
      ? (v14 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Unknown Version-%@"), CFSTR("iOSFW"))): (v14 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%@-%@"), v10, CFSTR("iOSFW"))), (v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16)) == 0))
  {
    v21 = 4294960569;
    goto LABEL_12;
  }
  v18 = v17;
  v19 = strlen(v17);
  if (a2 > v19)
  {
    v20 = v19;
    memcpy(a1, v18, v19);
    v21 = 0;
    *((_BYTE *)a1 + v20) = 0;
  }
  else
  {
LABEL_10:
    v21 = 4294960591;
  }
LABEL_12:

  return v21;
}

BOOL sub_21A72DE24(uint64_t a1)
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  v2 = objc_alloc(MEMORY[0x24BDC1540]);
  v4 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v2, v3, (uint64_t)CFSTR("com.apple.airport.mobileairportutility"), 0, 0);

  if (v4)
  {
    v7 = (void *)objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v5, v6);
    v9 = (void *)objc_msgSend_operationToOpenResource_usingApplication_userInfo_(v7, v8, a1, CFSTR("com.apple.airport.mobileairportutility"), 0);
    objc_msgSend_start(v9, v10, v11);
  }
  return v4 != 0;
}

uint64_t sub_21A72DE98(_QWORD *a1)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t result;

  v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040D2215A62uLL);
  if (!v2)
    return 4294960568;
  v3 = v2;
  result = 0;
  *v3 = 1;
  *a1 = v3;
  return result;
}

uint64_t sub_21A72DEF0(void *a1)
{
  if (!a1)
    return 4294960556;
  free(a1);
  return 0;
}

unint64_t sub_21A72DF14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  float v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  double v14;
  uint64_t i;
  float v16;

  result = 0;
  if (a1 && a3)
  {
    v7 = mach_absolute_time();
    v8 = v7 / sub_21A6A3B70();
    v9 = (float)(unint64_t)(a2 - *(_QWORD *)(a1 + 48)) / (float)(v8 - *(_QWORD *)(a1 + 56));
    v10 = *(unsigned int *)(a1 + 44);
    *(float *)(a1 + 4 * v10 + 4) = v9;
    if (v10 < 0xA)
    {
      v11 = v10 + 1;
      v12 = *(_BYTE *)a1 == 0;
    }
    else
    {
      qsort((void *)(a1 + 4), 0xAuLL, 4uLL, (int (__cdecl *)(const void *, const void *))sub_21A72E040);
      v11 = 0;
      *(_BYTE *)a1 = 0;
      v12 = 1;
    }
    *(_DWORD *)(a1 + 44) = v11;
    if (a3 != a2 && v12 && (v9 != 0.0 ? (v13 = v11 == 0) : (v13 = 0), v13))
    {
      v14 = 0.0;
      for (i = 12; i != 32; i += 4)
        v14 = v14 + *(float *)(a1 + i);
      v16 = v14 / 6.0;
      *(float *)(a1 + 64) = v16;
    }
    else
    {
      v16 = *(float *)(a1 + 64);
    }
    *(_QWORD *)(a1 + 48) = a2;
    *(_QWORD *)(a1 + 56) = v8;
    if (v16 == 0.0)
      return 0;
    else
      return (unint64_t)(float)((float)(unint64_t)(a3 - a2) / v16);
  }
  return result;
}

uint64_t sub_21A72E040(float *a1, float *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

uint64_t sub_21A72E058(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  return objc_msgSend_airPortIsOn(v3, v4, v5);
}

uint64_t sub_21A72E078(_QWORD *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *IfList;
  id v8;
  uint64_t result;

  if (!a1)
    return 4294960591;
  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4)
    return 4294960578;
  IfList = (void *)objc_msgSend_getIfList(v4, v5, v6);
  if (!IfList)
    return 4294960569;
  v8 = IfList;
  result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_21A72E0D8(_QWORD *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *LinkStatus;
  id v8;
  uint64_t result;

  if (!a1)
    return 4294960591;
  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4)
    return 4294960578;
  LinkStatus = (void *)objc_msgSend_getLinkStatus(v4, v5, v6);
  if (!LinkStatus)
    return 4294960569;
  v8 = LinkStatus;
  result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_21A72E138(_QWORD *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *CurrentAssociationInfo;
  id v8;
  uint64_t result;

  if (!a1)
    return 4294960591;
  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4)
    return 4294960578;
  CurrentAssociationInfo = (void *)objc_msgSend_getCurrentAssociationInfo(v4, v5, v6);
  if (!CurrentAssociationInfo)
    return 4294960569;
  v8 = CurrentAssociationInfo;
  result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_21A72E198(uint64_t a1, const char *a2, _BYTE *a3)
{
  uint64_t result;
  char v5;

  v5 = 0;
  result = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, a1, a2, &v5);
  if (a3)
    *a3 = v5;
  return result;
}

uint64_t sub_21A72E1E4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsIBSS_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E204(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoNetworkName_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E214(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E224(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v5;
  const char *v6;

  v5 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  return objc_msgSend_scanInfoForName_wifiType_(v5, v6, a1, a2);
}

uint64_t sub_21A72E258(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  return objc_msgSend_scanInfoForMACAddress_(v4, v5, a1);
}

uint64_t sub_21A72E284(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E2A4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E2C4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsWPA3_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E2E4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E2F4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E304(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoCanJoin5GHzNetworks_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E324(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoCanJoinWPA3Networks_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E344(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIs5GHz_(WiFiUtils, a2, a1);
}

uint64_t sub_21A72E364(uint64_t a1)
{
  return MEMORY[0x24BEDD108](WiFiUtils, sel_copyFilteredNetworks_ignoreOptions_, a1);
}

uint64_t sub_21A72E378(uint64_t a1, const char *a2)
{
  return objc_msgSend_network_shouldBeIgnored_(WiFiUtils, a2, a1, a2);
}

uint64_t sub_21A72E39C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](WiFiUtils, sel_scanInfoAirPortUniqueIdentifier_, a1);
}

uint64_t sub_21A72F4C0(_QWORD *a1, char *__s, int a3, int a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, NSObject *a12)
{
  char *v18;
  char *v20;
  uint64_t result;
  size_t v22;
  _DWORD *v23;
  _DWORD *v24;
  _BYTE *v25;
  uint64_t v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  if (!*__s)
    return 4294960591;
  v18 = __s;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  v20 = strchr(__s, 58);
  if (v20 && v20[1] == 47 && v20[2] == 47)
  {
    result = sub_21A6A4230(v18, 0, (char **)v27, 0);
    if ((_DWORD)result)
      return result;
    v22 = *((_QWORD *)&v28 + 1);
    v18 = (char *)v28;
  }
  else
  {
    v22 = strlen(v18);
  }
  v23 = malloc_type_calloc(1uLL, 0x60uLL, 0x10B00408BA0FE54uLL);
  if (!v23)
    return 4294960568;
  v24 = v23;
  *v23 = 1;
  v25 = sub_21A6A2BFC(v18, v22);
  *((_QWORD *)v24 + 1) = v25;
  if (!v25)
  {
    sub_21A72F8F8(v24);
    return 4294960568;
  }
  v24[4] = a3;
  v24[5] = a4;
  if (a5)
    v26 = a5;
  else
    v26 = -1;
  *((_QWORD *)v24 + 3) = v26;
  v24[8] = a6;
  v24[9] = a7;
  *((_QWORD *)v24 + 7) = a8;
  *((_QWORD *)v24 + 8) = a9;
  dispatch_retain(a12);
  *((_QWORD *)v24 + 9) = a12;
  *((_QWORD *)v24 + 10) = a10;
  *((_QWORD *)v24 + 11) = a11;
  dispatch_async_f(a12, v24, (dispatch_function_t)sub_21A72F63C);
  result = 0;
  *a1 = v24;
  return result;
}

void sub_21A72F63C(uint64_t a1)
{
  _BYTE *v2;
  char *v3;
  int v4;
  DNSServiceRef *v5;
  DNSServiceRef *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t Record;
  int v12;
  BOOL v13;
  void (*v14)(uint64_t, char *, _QWORD);
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD v20[3];
  int v21;
  int v22;
  uint32_t interfaceIndex;
  char fullname[1009];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  if (!sub_21A6A0A98(*(char **)(a1 + 8), (uint64_t)v20, 0x1CuLL, 0))
  {
    v15 = *(_DWORD *)(a1 + 16);
    if ((*(_BYTE *)(a1 + 20) & 4) != 0)
    {
      if (!sub_21A72FC00(a1, (unsigned __int8 *)v20, 0, v15))
        goto LABEL_24;
      v15 = *(_DWORD *)(a1 + 16);
    }
    v16 = sub_21A72FE78(a1, (unsigned __int8 *)v20, 0, v15);
LABEL_23:
    Record = v16;
    if ((_DWORD)v16)
      goto LABEL_29;
    goto LABEL_24;
  }
  v2 = sub_21A6A2CF0(*(_BYTE **)(a1 + 8), "._tcp.");
  v3 = *(char **)(a1 + 8);
  v4 = *(_DWORD *)(a1 + 16);
  if (!v2)
  {
    v16 = sub_21A7301F0(a1, *(char **)(a1 + 8), *(_DWORD *)(a1 + 16));
    goto LABEL_23;
  }
  v5 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (!v5)
  {
    Record = 4294960568;
    goto LABEL_29;
  }
  v6 = v5;
  v22 = 0;
  interfaceIndex = 0;
  ++*(_DWORD *)a1;
  *(_DWORD *)v5 = 1;
  v5[2] = (DNSServiceRef)a1;
  *((_DWORD *)v5 + 15) = -1;
  Record = sub_21A73092C(v3, fullname, &interfaceIndex, &v22);
  if ((_DWORD)Record)
    goto LABEL_17;
  v12 = v22;
  if (v22)
    v13 = v4 < 0;
  else
    v13 = 1;
  if (v13)
    v12 = v4;
  *((_DWORD *)v6 + 14) = v12;
  if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_StartSRVQuery(AsyncConnectionRef, const char *, int)", 500, (uint64_t)"Querying SRV  %s\n", v7, v8, v9, v10, (uint64_t)v3);
  v14 = *(void (**)(uint64_t, char *, _QWORD))(a1 + 56);
  if (v14)
    v14(1, v3, *(_QWORD *)(a1 + 64));
  Record = DNSServiceQueryRecord(v6 + 8, 0x400000u, interfaceIndex, fullname, 0x21u, 1u, (DNSServiceQueryRecordReply)sub_21A730B04, v6);
  if ((_DWORD)Record)
  {
LABEL_17:
    sub_21A7304F8(v6);
    goto LABEL_29;
  }
  DNSServiceSetDispatchQueue(v6[8], *(dispatch_queue_t *)(a1 + 72));
  v6[1] = *(DNSServiceRef *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v6;
LABEL_24:
  if (*(_QWORD *)(a1 + 24) == -1)
    return;
  v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 72));
  *(_QWORD *)(a1 + 40) = v17;
  if (v17)
  {
    dispatch_set_context(v17, (void *)a1);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 40), (dispatch_function_t)sub_21A73039C);
    v18 = *(NSObject **)(a1 + 40);
    v19 = dispatch_time(0, *(_QWORD *)(a1 + 24));
    dispatch_source_set_timer(v18, v19, *(_QWORD *)(a1 + 24), 0x5F5E100uLL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
    return;
  }
  Record = 4294960596;
LABEL_29:
  sub_21A7303A8(a1, 0xFFFFFFFFLL, Record);
}

void sub_21A72F8F8(_QWORD *a1)
{
  NSObject *v3;
  void *v4;

  if ((*(_DWORD *)a1)-- == 1)
  {
    sub_21A7303A8((uint64_t)a1, 0xFFFFFFFFLL, 4294960573);
    v3 = a1[9];
    if (v3)
    {
      dispatch_release(v3);
      a1[9] = 0;
    }
    v4 = (void *)a1[1];
    if (v4)
      free(v4);
    free(a1);
  }
}

void sub_21A72F95C(_QWORD *a1)
{
  sub_21A7303A8((uint64_t)a1, 0xFFFFFFFFLL, 4294960573);
  sub_21A72F8F8(a1);
}

uint64_t sub_21A72F988(char *a1, int a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  return sub_21A72F9B0(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9);
}

uint64_t sub_21A72F9B0(char *a1, int a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, unsigned int (*a9)(uint64_t), uint64_t a10, _DWORD *a11)
{
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  dispatch_time_t v22;
  int v23;
  dispatch_queue_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  dispatch_time_t v30;
  void *context;
  dispatch_object_t object;
  dispatch_semaphore_t dsema;
  uint64_t v35;

  dsema = 0;
  if (!*a1)
    return 4294960591;
  v35 = 0;
  v19 = dispatch_queue_create(a1, 0);
  object = v19;
  if (!v19)
  {
    v21 = 4294960596;
    goto LABEL_27;
  }
  v20 = v19;
  dsema = dispatch_semaphore_create(0);
  if (!dsema)
  {
    v21 = 4294960596;
    goto LABEL_29;
  }
  v35 = -6700;
  context = 0;
  v21 = sub_21A72F4C0(&context, a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)sub_21A72FBEC, (uint64_t)&object, v20);
  if ((_DWORD)v21)
    goto LABEL_27;
  if (!a9)
  {
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_24;
  }
  v22 = dispatch_time(0, 250000000);
  if (!dispatch_semaphore_wait(dsema, v22))
    goto LABEL_24;
  v23 = 0;
  v24 = (dispatch_queue_t *)context;
  do
  {
    if (v23)
      goto LABEL_15;
    if (a9(a10))
    {
      if (dword_2550F4B50 <= 3000 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0xBB8u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus AsyncConnection_ConnectSyncEx(const char *, int, AsyncConnectionFlags, uint64_t, int, int, AsyncConnectionProgressFunc, void *, AsyncConnectionWaitFunc, void *, SocketRef *)", 3000, (uint64_t)"### Canceling connect to %s\n", v25, v26, v27, v28, (uint64_t)a1);
      dispatch_async_f(v24[9], v24, (dispatch_function_t)sub_21A72F95C);
LABEL_15:
      v29 = 0;
      v23 = 1;
      goto LABEL_16;
    }
    v23 = 0;
    v29 = 1;
LABEL_16:
    v30 = dispatch_time(0, 250000000);
  }
  while (dispatch_semaphore_wait(dsema, v30));
  if (v29)
LABEL_24:
    dispatch_async_f(*((dispatch_queue_t *)context + 9), context, (dispatch_function_t)sub_21A72F95C);
  v21 = v35;
  if (!(_DWORD)v35)
    *a11 = HIDWORD(v35);
LABEL_27:
  if (dsema)
    dispatch_release(dsema);
LABEL_29:
  if (object)
    dispatch_release(object);
  return v21;
}

intptr_t sub_21A72FBEC(int a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 16) = a2;
  if (!a2)
    *(_DWORD *)(a3 + 20) = a1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a3 + 8));
}

uint64_t sub_21A72FC00(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  _QWORD *v8;
  _DWORD *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  const __SCNetworkReachability *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SCNetworkReachabilityContext context;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v22;
  int v23;

  memset(&context, 0, sizeof(context));
  v8 = malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (v8)
  {
    v9 = v8;
    *(_QWORD *)&address.sa_len = 0;
    *(_QWORD *)&address.sa_data[6] = 0;
    v23 = 0;
    v22 = 0;
    flags = 0;
    ++*(_DWORD *)a1;
    *(_DWORD *)v8 = 1;
    v8[2] = a1;
    *((_DWORD *)v8 + 15) = -1;
    sub_21A6A0F1C(a2, v8 + 3);
    v9[13] = a3;
    v9[14] = a4;
    sub_21A6A0F1C(a2, &address);
    if ((a4 & 0x80000000) != 0)
    {
      v11 = -a4;
    }
    else
    {
      v10 = sub_21A6A0BD8((uint64_t)&address);
      v11 = a4;
      if (v10)
      {
LABEL_8:
        v13 = SCNetworkReachabilityCreateWithAddress(0, &address);
        *((_QWORD *)v9 + 11) = v13;
        if (v13
          && (context.info = v9,
              SCNetworkReachabilitySetCallback(v13, (SCNetworkReachabilityCallBack)sub_21A730414, &context))
          && SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)v9 + 11), *(dispatch_queue_t *)(a1 + 72)))
        {
          flags = 0;
          if (!SCNetworkReachabilityGetFlags(*((SCNetworkReachabilityRef *)v9 + 11), &flags) || (flags & 2) == 0)
            goto LABEL_22;
          if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
            sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Reachability of %##a default port %d OK, Flags 0x%X\n", v14, v15, v16, v17, (uint64_t)a2);
          if (sub_21A72FE78(a1, a2, a3, a4))
          {
            if (dword_2550F4B50 > 3000)
            {
LABEL_26:
              v12 = 0;
              *((_QWORD *)v9 + 1) = *(_QWORD *)(a1 + 48);
              *(_QWORD *)(a1 + 48) = v9;
              return v12;
            }
            if (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0xBB8u))
              sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 3000, (uint64_t)"### Connect %##a default port %d failed after reachability said OK\n", v14, v15, v16, v17, (uint64_t)a2);
LABEL_22:
            if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
              sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Monitoring reachability of %##a default port %d\n", v14, v15, v16, v17, (uint64_t)a2);
            goto LABEL_26;
          }
          v12 = 0;
        }
        else
        {
          v12 = 4294960596;
        }
        sub_21A7304F8(v9);
        return v12;
      }
    }
    sub_21A6A0C04((uint64_t)&address, v11);
    goto LABEL_8;
  }
  return 4294960568;
}

uint64_t sub_21A72FE78(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  char *v8;
  uint64_t v9;
  const sockaddr *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, const sockaddr *, _QWORD);
  int v20;
  socklen_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  int v29;

  v8 = (char *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (v8)
  {
    v9 = (uint64_t)v8;
    ++*(_DWORD *)a1;
    *(_DWORD *)v8 = 1;
    *((_QWORD *)v8 + 2) = a1;
    v10 = (const sockaddr *)(v8 + 24);
    sub_21A6A0F1C(a2, v8 + 24);
    if ((a4 & 0x80000000) != 0)
    {
      v12 = -a4;
    }
    else
    {
      v11 = sub_21A6A0BD8((uint64_t)v10);
      v12 = a4;
      if (v11)
        goto LABEL_8;
    }
    sub_21A6A0C04((uint64_t)v10, v12);
LABEL_8:
    v29 = 0;
    *(_DWORD *)(v9 + 56) = a4;
    v14 = socket(*(unsigned __int8 *)(v9 + 25), 1, 6);
    *(_DWORD *)(v9 + 60) = v14;
    if (v14 < 0)
    {
      if (!*__error())
        goto LABEL_35;
      v13 = *__error();
      if ((_DWORD)v13)
        goto LABEL_36;
      v14 = *(_DWORD *)(v9 + 60);
    }
    v13 = sub_21A6A0C28(v14, 1);
    if ((_DWORD)v13)
      goto LABEL_36;
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
      sub_21A6A0E24(*(_DWORD *)(v9 + 60), 1);
    v29 = 1;
    setsockopt(*(_DWORD *)(v9 + 60), 0xFFFF, 4130, &v29, 4u);
    v13 = sub_21A6A0E74(*(_DWORD *)(v9 + 60), *(unsigned __int8 *)(v9 + 25), a3);
    if ((_DWORD)v13)
      goto LABEL_36;
    v29 = 1;
    setsockopt(*(_DWORD *)(v9 + 60), 6, 1, &v29, 4u);
    sub_21A6A0CA0(*(_DWORD *)(v9 + 60), 4097, *(_DWORD *)(a1 + 32));
    sub_21A6A0CA0(*(_DWORD *)(v9 + 60), 4098, *(_DWORD *)(a1 + 36));
    if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
      sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_StartConnect(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Connecting to %##a If %d\n", v15, v16, v17, v18, (uint64_t)v10);
    v19 = *(void (**)(uint64_t, const sockaddr *, _QWORD))(a1 + 56);
    if (v19)
      v19(3, v10, *(_QWORD *)(a1 + 64));
    v20 = *(_DWORD *)(v9 + 60);
    v21 = sub_21A6A0EFC((uint64_t)v10);
    if (!connect(v20, v10, v21))
      goto LABEL_23;
    if (!*__error())
    {
      v13 = 4294960596;
      goto LABEL_28;
    }
    v13 = *__error();
    if ((_DWORD)v13 != 36)
    {
      if (!(_DWORD)v13)
      {
LABEL_23:
        sub_21A7305D0(v9);
        v13 = 0;
LABEL_36:
        sub_21A7304F8((_DWORD *)v9);
        return v13;
      }
LABEL_28:
      if (dword_2550F4B50 <= 3000 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0xBB8u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_StartConnect(AsyncConnectionRef, const void *, unsigned int, int)", 3000, (uint64_t)"### Connect 1 to %##a failed: %#m\n", v22, v23, v24, v25, (uint64_t)v10);
      goto LABEL_36;
    }
    v26 = dispatch_source_create(MEMORY[0x24BDACA00], *(int *)(v9 + 60), 0, *(dispatch_queue_t *)(a1 + 72));
    *(_QWORD *)(v9 + 72) = v26;
    if (v26)
    {
      dispatch_set_context(v26, (void *)v9);
      dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v9 + 72), (dispatch_function_t)sub_21A7306D4);
      dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v9 + 72), (dispatch_function_t)sub_21A73089C);
      dispatch_resume(*(dispatch_object_t *)(v9 + 72));
      ++*(_DWORD *)v9;
      v27 = dispatch_source_create(MEMORY[0x24BDACA30], *(int *)(v9 + 60), 0, *(dispatch_queue_t *)(a1 + 72));
      *(_QWORD *)(v9 + 80) = v27;
      if (v27)
      {
        dispatch_set_context(v27, (void *)v9);
        dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v9 + 80), (dispatch_function_t)sub_21A7306D4);
        dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v9 + 80), (dispatch_function_t)sub_21A73089C);
        dispatch_resume(*(dispatch_object_t *)(v9 + 80));
        v13 = 0;
        ++*(_DWORD *)v9;
        *(_QWORD *)(v9 + 8) = *(_QWORD *)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v9;
        return v13;
      }
    }
LABEL_35:
    v13 = 4294960596;
    goto LABEL_36;
  }
  return 4294960568;
}

uint64_t sub_21A7301F0(uint64_t a1, char *a2, int a3)
{
  DNSServiceRef *v6;
  DNSServiceRef *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AddrInfo;
  int v13;
  BOOL v14;
  void (*v15)(uint64_t, char *, _QWORD);
  int v17;
  uint32_t interfaceIndex;
  char hostname[1009];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (!v6)
    return 4294960568;
  v7 = v6;
  v17 = 0;
  interfaceIndex = 0;
  ++*(_DWORD *)a1;
  *(_DWORD *)v6 = 1;
  v6[2] = (DNSServiceRef)a1;
  *((_DWORD *)v6 + 15) = -1;
  AddrInfo = sub_21A73092C(a2, hostname, &interfaceIndex, &v17);
  if ((_DWORD)AddrInfo)
    goto LABEL_15;
  v13 = v17;
  if (v17)
    v14 = a3 < 0;
  else
    v14 = 1;
  if (v14)
    v13 = a3;
  *((_DWORD *)v7 + 14) = v13;
  if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"OSStatus _AsyncConnection_StartDNSResolve(AsyncConnectionRef, const char *, int)", 500, (uint64_t)"Resolving     %s\n", v8, v9, v10, v11, (uint64_t)a2);
  v15 = *(void (**)(uint64_t, char *, _QWORD))(a1 + 56);
  if (v15)
    v15(2, a2, *(_QWORD *)(a1 + 64));
  AddrInfo = DNSServiceGetAddrInfo(v7 + 8, (*(_DWORD *)(a1 + 20) << 14) & 0x8000, interfaceIndex, 0, hostname, (DNSServiceGetAddrInfoReply)sub_21A730D3C, v7);
  if ((_DWORD)AddrInfo)
  {
LABEL_15:
    sub_21A7304F8(v7);
  }
  else
  {
    DNSServiceSetDispatchQueue(v7[8], *(dispatch_queue_t *)(a1 + 72));
    v7[1] = *(DNSServiceRef *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v7;
  }
  return AddrInfo;
}

uint64_t sub_21A73039C(uint64_t a1)
{
  return sub_21A7303A8(a1, 0xFFFFFFFFLL, 4294960574);
}

uint64_t sub_21A7303A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(uint64_t, uint64_t, _QWORD);
  NSObject *v5;
  uint64_t result;

  v4 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 80);
  *(_QWORD *)(a1 + 80) = 0;
  if (v4)
    v4(a2, a3, *(_QWORD *)(a1 + 88));
  v5 = *(NSObject **)(a1 + 40);
  if (v5)
  {
    dispatch_source_cancel(v5);
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
    *(_QWORD *)(a1 + 40) = 0;
  }
  while (1)
  {
    result = *(_QWORD *)(a1 + 48);
    if (!result)
      break;
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(result + 8);
    sub_21A7304F8();
  }
  return result;
}

void sub_21A730414(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_ReachabilityHandler(SCNetworkReachabilityRef, SCNetworkReachabilityFlags, void *)", 500, (uint64_t)"Reachability of %##a, port %d changed: 0x%X\n", a5, a6, a7, a8, a3 + 24);
  if ((a2 & 2) != 0
    && !sub_21A72FE78(*(_QWORD *)(a3 + 16), (unsigned __int8 *)(a3 + 24), *(_DWORD *)(a3 + 52), *(_DWORD *)(a3 + 56)))
  {
    v10 = *(_QWORD *)(a3 + 16);
    v13 = *(_QWORD *)(v10 + 48);
    v12 = (_QWORD *)(v10 + 48);
    v11 = v13;
    if (v13)
    {
      if (v11 == a3)
      {
LABEL_13:
        *v12 = *(_QWORD *)(a3 + 8);
      }
      else
      {
        while (1)
        {
          v14 = v11;
          v11 = *(_QWORD *)(v11 + 8);
          if (!v11)
            break;
          if (v11 == a3)
          {
            v12 = (_QWORD *)(v14 + 8);
            goto LABEL_13;
          }
        }
      }
    }
    sub_21A7304F8((_DWORD *)a3);
  }
}

void sub_21A7304F8(_DWORD *a1)
{
  const __SCNetworkReachability *v2;
  NSObject *v3;
  NSObject *v4;
  _DNSServiceRef_t *v5;
  int v7;

  v2 = (const __SCNetworkReachability *)*((_QWORD *)a1 + 11);
  if (v2)
  {
    SCNetworkReachabilitySetCallback(v2, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)a1 + 11), 0);
    CFRelease(*((CFTypeRef *)a1 + 11));
    *((_QWORD *)a1 + 11) = 0;
  }
  v3 = *((_QWORD *)a1 + 9);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*((dispatch_object_t *)a1 + 9));
    *((_QWORD *)a1 + 9) = 0;
  }
  v4 = *((_QWORD *)a1 + 10);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*((dispatch_object_t *)a1 + 10));
    *((_QWORD *)a1 + 10) = 0;
  }
  v5 = (_DNSServiceRef_t *)*((_QWORD *)a1 + 8);
  if (v5)
  {
    DNSServiceRefDeallocate(v5);
    *((_QWORD *)a1 + 8) = 0;
  }
  if ((*a1)-- == 1)
  {
    v7 = a1[15];
    if ((v7 & 0x80000000) == 0)
    {
      if (close(v7))
      {
        if (*__error())
          __error();
      }
      a1[15] = -1;
    }
    sub_21A72F8F8(*((_QWORD **)a1 + 2));
    free(a1);
  }
}

void sub_21A7305D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, _QWORD);
  socklen_t v10;
  unsigned int v11;

  v10 = 4;
  v11 = 0;
  v2 = *(unsigned int *)(a1 + 60);
  if (getsockopt(*(_DWORD *)(a1 + 60), 0xFFFF, 4103, &v11, &v10))
  {
    if (!*__error())
    {
      v7 = 4294960596;
      goto LABEL_13;
    }
    v7 = *__error();
    if ((_DWORD)v7)
      goto LABEL_13;
  }
  v7 = v11;
  if (v11)
  {
LABEL_13:
    sub_21A7308A0(a1, v7);
    return;
  }
  if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_ConnectHandler(AsyncConnectionOperationRef)", 500, (uint64_t)"Connected to  %##a\n", v3, v4, v5, v6, a1 + 24);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 56);
  if (v9)
  {
    v9(4, a1 + 24, *(_QWORD *)(v8 + 64));
    v8 = *(_QWORD *)(a1 + 16);
  }
  *(_DWORD *)(a1 + 60) = -1;
  sub_21A7303A8(v8, v2, 0);
}

void sub_21A7306D4(uint64_t a1)
{
  _DNSServiceRef_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  socklen_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  socklen_t v17[2];

  v2 = *(_DNSServiceRef_t **)(a1 + 64);
  if (v2)
  {
    v3 = DNSServiceProcessResult(v2);
    if ((_DWORD)v3)
    {
      v8 = v3;
      if (dword_2550F4B50 <= 6000 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1770u)))
        sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_EventHandler(void *)", 6000, (uint64_t)"DNSServiceProcessResult failed: %#m...mDNSResponder probably crashed\n", v4, v5, v6, v7, v8);
      sub_21A7308A0(a1, v8);
    }
    return;
  }
  v9 = *(_DWORD *)(a1 + 60);
  v10 = sub_21A6A0EFC(a1 + 24);
  if (!connect(v9, (const sockaddr *)(a1 + 24), v10))
    goto LABEL_13;
  *(_QWORD *)v17 = 0;
  if (!*__error())
    goto LABEL_21;
  v15 = *__error();
  switch((_DWORD)v15)
  {
    case 0x38:
LABEL_13:
      sub_21A7305D0(a1);
      return;
    case 0x16:
      v17[0] = 4;
      v17[1] = 0;
      if (!getsockopt(*(_DWORD *)(a1 + 60), 0xFFFF, 4103, &v17[1], v17))
      {
LABEL_17:
        v16 = v17[1];
LABEL_18:
        if (v16)
          v15 = v16;
        else
          v15 = 22;
        break;
      }
      if (*__error())
      {
        v16 = *__error();
        if (v16)
          goto LABEL_18;
        goto LABEL_17;
      }
LABEL_21:
      v15 = 4294960596;
      break;
    case 0:
      goto LABEL_13;
  }
  if (dword_2550F4B50 <= 1000 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x3E8u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_EventHandler(void *)", 1000, (uint64_t)"### Connect 2 to %##a failed: %#m\n", v11, v12, v13, v14, a1 + 24);
  sub_21A7308A0(a1, v15);
}

void sub_21A7308A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 + 48);
  if (v4)
  {
    v5 = (_QWORD *)(v3 + 48);
    if (v4 == a1)
    {
LABEL_6:
      *v5 = *(_QWORD *)(a1 + 8);
      if (!*(_QWORD *)(v3 + 48))
        sub_21A7303A8(v3, 0xFFFFFFFFLL, a2);
      sub_21A7304F8((_DWORD *)a1);
    }
    else
    {
      while (1)
      {
        v6 = v4;
        v4 = *(_QWORD *)(v4 + 8);
        if (!v4)
          break;
        if (v4 == a1)
        {
          v5 = (_QWORD *)(v6 + 8);
          goto LABEL_6;
        }
      }
    }
  }
  else
  {
    sub_21A7303A8(v3, 0xFFFFFFFFLL, a2);
  }
}

uint64_t sub_21A73092C(char *a1, void *a2, unsigned int *a3, _DWORD *a4)
{
  char *v8;
  const char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  char *v14;
  char *v15;
  size_t v16;
  unint64_t v17;
  uint64_t result;
  int v19;
  unsigned int v20;
  char v21[17];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v8 = strchr(a1, 37);
  if (v8)
  {
    v9 = v8;
    v10 = v8 + 1;
    v11 = strchr(v8 + 1, 58);
    if (v11)
    {
      v12 = v11;
      if (sscanf(v11 + 1, "%d", &v19) != 1)
        return 4294960554;
      v13 = 1;
    }
    else
    {
      v13 = 0;
      v12 = &v10[strlen(v9)];
    }
    v17 = v12 - v10;
    if (v17 <= 0x10)
    {
      __memcpy_chk();
      v21[v17] = 0;
      v20 = if_nametoindex(v21);
      if (v20 || sscanf(v21, "%u", &v20) == 1)
      {
        v16 = v9 - a1;
        goto LABEL_16;
      }
    }
    return 4294960554;
  }
  v14 = strchr(a1, 58);
  if (v14)
  {
    v15 = v14;
    if (sscanf(v14 + 1, "%d", &v19) != 1)
      return 4294960554;
    v16 = v15 - a1;
    v13 = 1;
  }
  else
  {
    v16 = strlen(a1);
    v13 = 0;
  }
  v20 = 0;
LABEL_16:
  if (v16 > 0x3F0)
    return 4294960553;
  memcpy(a2, a1, v16);
  *((_BYTE *)a2 + v16) = 0;
  *a3 = v20;
  result = 0;
  if (v13)
    *a4 = v19;
  return result;
}

void sub_21A730B04(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned int v22;
  char *v23;
  unsigned int v24;
  size_t v25;
  int v27;
  char __s[1073];
  _QWORD v29[135];

  v29[134] = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a4)
    goto LABEL_2;
  if ((a2 & 2) == 0)
    return;
  if (a8 < 7)
  {
    a4 = 4294960554;
LABEL_2:
    sub_21A7308A0(a11, a4);
    return;
  }
  v11 = a5;
  v14 = a9 + 6;
  v13 = *(unsigned __int8 *)(a9 + 6);
  v15 = *(unsigned __int16 *)(a9 + 4);
  if (!*(_BYTE *)(a9 + 6))
  {
    v17 = (char *)v29;
    __s[0] = 46;
    goto LABEL_22;
  }
  v16 = 0;
  v17 = __s;
  v18 = a9 + 6;
LABEL_8:
  if (v16 + 1 + (unint64_t)v13 <= 0xFE && v13 <= 0x3F)
  {
    v19 = v13 + v18 + 1;
    v20 = (unsigned __int8 *)(v18 + 1);
    while (1)
    {
      v22 = *v20++;
      v21 = v22;
      if (v22 == 92 || v21 == 46)
        break;
      if (v21 > 0x20)
        goto LABEL_16;
      *(_WORD *)v17 = 12380;
      a5 = (205 * v21) >> 11;
      a6 = a5 | 0x30;
      v23 = v17 + 3;
      v17[2] = a5 | 0x30;
      LOBYTE(v21) = (v21 - 10 * a5) | 0x30;
LABEL_17:
      *v23 = v21;
      v17 = v23 + 1;
      if ((unint64_t)v20 >= v19)
      {
        v23[1] = 0;
        v16 += 1 + *(unsigned __int8 *)(v14 + v16);
        v17 = v23 + 2;
        v23[1] = 46;
        v18 = v14 + v16;
        v13 = *(unsigned __int8 *)(v14 + v16);
        if (!*(_BYTE *)(v14 + v16))
        {
LABEL_22:
          *v17 = 0;
          goto LABEL_23;
        }
        goto LABEL_8;
      }
    }
    *v17++ = 92;
LABEL_16:
    v23 = v17;
    goto LABEL_17;
  }
LABEL_23:
  v24 = __rev16(v15);
  if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
    sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_SRVCallBack(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 500, (uint64_t)"SRV resolved  %s -> %s port %d, If %u, Flags 0x%X, TTL %u\n", a5, a6, a7, a8, v11);
  v25 = strlen(__s);
  snprintf(&__s[v25], 1073 - v25, "%%%u", a3);
  if (*(int *)(a11 + 56) < 0 || v24 == 0)
    v27 = *(_DWORD *)(a11 + 56);
  else
    v27 = v24;
  a4 = sub_21A7301F0(*(_QWORD *)(a11 + 16), __s, v27);
  if ((_DWORD)a4)
    goto LABEL_2;
}

void sub_21A730D3C(uint64_t a1, char a2, int a3, int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;

  if ((a2 & 2) != 0 && !a4)
  {
    v11 = *(_QWORD *)(a8 + 16);
    if (dword_2550F4B50 <= 500 && (dword_2550F4B50 != -1 || sub_21A69876C((uint64_t)&dword_2550F4B50, 0x1F4u)))
      sub_21A698FDC((uint64_t)&dword_2550F4B50, (uint64_t)"void _AsyncConnection_DNSCallBack(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const struct sockaddr *, uint32_t, void *)", 500, (uint64_t)"Resolved      %s -> %##a, Flags 0x%X, If %u, TTL %u\n", a5, (uint64_t)a6, a7, a8, a5);
    if ((*(_BYTE *)(v11 + 20) & 4) == 0 || sub_21A72FC00(v11, a6, a3, *(_DWORD *)(a8 + 56)))
      sub_21A72FE78(v11, a6, a3, *(_DWORD *)(a8 + 56));
  }
}

void sub_21A730E3C(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;

  if (a1)
  {
    v36 = 0;
    sub_21A693B94(a1, (uint64_t)&v36, (UInt8 *)"%kC", a4, a5, a6, a7, a8, 1918979393);
    if (!v16)
    {
      if (v36)
      {
        v17 = sub_21A68EE6C(a1, v9, v10, v11, v12, v13, v14, v15);
        if (v17)
        {
          v20 = (uint64_t)v17;
          v21 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v18, v19);
          v24 = objc_msgSend_dictionaryForKey_(v21, v22, (uint64_t)CFSTR("configuredAirPortIDs"));
          if (v24)
            v25 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v23, v24);
          else
            v25 = objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v23, 0);
          v27 = (void *)v25;
          v28 = (void *)MEMORY[0x24BDBCE70];
          v29 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v26, 1);
          v31 = objc_msgSend_dictionaryWithObjectsAndKeys_(v28, v30, v20, CFSTR("deviceName"), v29, CFSTR("monitorProblems"), 0);
          objc_msgSend_setObject_forKey_(v27, v32, v31, v36);
          objc_msgSend_setObject_forKey_(v21, v33, (uint64_t)v27, CFSTR("configuredAirPortIDs"));
          objc_msgSend_synchronize(v21, v34, v35);
        }
      }
    }
  }
}

uint64_t sub_21A731938(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (byte_2550F4DD8 == 1)
    return byte_2550F4DD9;
  v4 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, a3);
  v7 = (void *)objc_msgSend_systemVersion(v4, v5, v6);
  result = sub_21A731C2C(v7, CFSTR("7.0"), v8) != -1;
  byte_2550F4DD9 = result;
  byte_2550F4DD8 = 1;
  return result;
}

uint64_t sub_21A7319A0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (byte_2550F4DDA == 1)
    return byte_2550F4DDB;
  v4 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, a3);
  v7 = (void *)objc_msgSend_systemVersion(v4, v5, v6);
  result = sub_21A731C2C(v7, CFSTR("8.0"), v8) != -1;
  byte_2550F4DDB = result;
  byte_2550F4DDA = 1;
  return result;
}

uint64_t sub_21A731A08(void *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  uint64_t result;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  if (!sub_21A7319A0((uint64_t)a1, a2, a3))
    return 0;
  if (!a1 || (objc_opt_respondsToSelector() & 1) == 0 || (result = objc_msgSend_traitCollection(a1, v4, v5)) == 0)
  {
    objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v4, v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v7, v8);
      return objc_msgSend_traitCollection(v9, v10, v11);
    }
    return 0;
  }
  return result;
}

uint64_t sub_21A731A84(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;

  v4 = (void *)sub_21A731A08(a1, a2, a3);
  if (!v4)
    goto LABEL_7;
  result = objc_msgSend_horizontalSizeClass(v4, v5, v6);
  if (result == 2)
    return result;
  if (result == 1)
  {
    v8 = (void *)objc_msgSend_view(a1, v5, v6);
    objc_msgSend_bounds(v8, v9, v10);
    if (v11 < 400.0)
      return 1;
    else
      return 3;
  }
  else
  {
LABEL_7:
    v12 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], v5, v6);
    v15 = objc_msgSend_userInterfaceIdiom(v12, v13, v14);
    v18 = objc_msgSend_view(a1, v16, v17);
    if (v15)
    {
      if (v18)
      {
        v21 = (void *)objc_msgSend_view(a1, v19, v20);
        objc_msgSend_bounds(v21, v22, v23);
        if (v24 <= 480.0)
          return 1;
        else
          return 2;
      }
      else
      {
        return 2;
      }
    }
    else if (v18)
    {
      v25 = (void *)objc_msgSend_view(a1, v19, v20);
      objc_msgSend_bounds(v25, v26, v27);
      if (v28 >= 400.0)
        return 3;
      else
        return 1;
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_21A731B64(void *a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  double v14;
  double v15;

  v4 = (void *)sub_21A731A08(a1, a2, a3);
  if (!v4)
    goto LABEL_7;
  result = objc_msgSend_horizontalSizeClass(v4, v5, v6);
  if (result == 2)
    return result;
  if (result == 1)
  {
    objc_msgSend_bounds(a1, v5, v6);
    if (v8 < 400.0)
      return 1;
    else
      return 3;
  }
  else
  {
LABEL_7:
    v9 = (void *)objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], v5, v6);
    if (objc_msgSend_userInterfaceIdiom(v9, v10, v11))
    {
      if (a1)
      {
        objc_msgSend_bounds(a1, v12, v13);
        if (v14 <= 480.0)
          return 1;
        else
          return 2;
      }
      else
      {
        return 2;
      }
    }
    else if (a1)
    {
      objc_msgSend_bounds(a1, v12, v13);
      if (v15 >= 400.0)
        return 3;
      else
        return 1;
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_21A731C2C(void *a1, char *a2, uint64_t a3)
{
  uint64_t result;
  const char *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  result = objc_msgSend_UTF8String(a1, a2, a3);
  if (result)
  {
    v8 = 0;
    if (sub_21A6A2044((char *)result, -1, (int *)&v8 + 1))
      return 0;
    result = objc_msgSend_UTF8String(a2, v5, v6);
    if (result)
    {
      if (sub_21A6A2044((char *)result, -1, (int *)&v8))
        return 0;
      if ((HIDWORD(v8) & 0xFFFFFF00) < (v8 & 0xFFFFFF00))
        return -1;
      if ((HIDWORD(v8) & 0xFFFFFF00) > (v8 & 0xFFFFFF00))
        return 1;
      v7 = (BYTE4(v8) - 1);
      if (v7 < (v8 - 1))
        return -1;
      return v7 > (v8 - 1);
    }
  }
  return result;
}

uint64_t sub_21A731CD8(_BOOL8 a1)
{
  if (a1 && !sub_21A731D0C(a1) && (byte_2550F4DDC & 1) == 0)
    byte_2550F4DDC = 1;
  return 1;
}

BOOL sub_21A731D0C(_BOOL8 result)
{
  _BOOL4 v1;
  uint64_t v2;
  __CFString *v3;
  const char *v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = sub_21A690CA4(1937326416);
    v3 = (__CFString *)sub_21A690E94(v2, (const char *)v1);
    return objc_msgSend_length(v3, v4, v5) != 0;
  }
  return result;
}

uint64_t sub_21A731D4C()
{
  if ((byte_2550F4DDC & 1) == 0)
    byte_2550F4DDC = 1;
  return 0;
}

uint64_t sub_21A731D68(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  if (dword_2550F4BD0 <= 800 && (dword_2550F4BD0 != -1 || sub_21A69876C((uint64_t)&dword_2550F4BD0, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4BD0, (uint64_t)"ACPAppleProductID AUDataCache_GetProductIDFromImageName(CFStringRef)", 800, (uint64_t)"%@\n", a5, a6, a7, a8, (uint64_t)a1);
  if (!a1)
    return 0;
  v9 = (void *)objc_msgSend_componentsSeparatedByString_(a1, a2, (uint64_t)CFSTR("-"));
  v11 = (void *)objc_msgSend_objectAtIndex_(v9, v10, 0);
  if (objc_msgSend_integerValue(v11, v12, v13) < 1)
    return 0;
  v15 = (void *)objc_msgSend_objectAtIndex_(v9, v14, 0);
  return objc_msgSend_integerValue(v15, v16, v17);
}

void sub_21A732540(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  _QWORD block[5];

  v2 = sub_21A6DD5FC(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = sub_21A70D934(v2, 300);
  if ((_DWORD)v3)
  {
    objc_msgSend_endSetup_(*(void **)(a1 + 32), v4, v3);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21A7325E4;
    block[3] = &unk_24DD04D48;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t sub_21A7325E4(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t *v10;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3);
  objc_msgSend_addObserver_selector_name_object_(v4, v5, *(_QWORD *)(a1 + 32), sel_linkChangeNotification_, CFSTR("com.apple.AirPort.WiFiShim.Notification.LinkChange"), 0);
  v8 = objc_msgSend_joinTargetSWAP(*(void **)(a1 + 32), v6, v7);
  v10 = *(uint64_t **)(a1 + 32);
  if ((_DWORD)v8)
    return objc_msgSend_endSetup_(*(void **)(a1 + 32), v9, v8);
  v12 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCE70], v9, v10[26], CFSTR("BSAssistantProgressKey_StringParameter"));
  objc_msgSend_sendProgressToUI_withParamDict_(v10, v13, 5, v12);
  objc_msgSend_performSelectorInBackground_withObject_(*(void **)(a1 + 32), v14, (uint64_t)sel_startEasyConfigWhenReady, 0);
  return objc_msgSend_sendProgressToUI_withParamDict_(*(void **)(a1 + 32), v15, 26, 0);
}

uint64_t sub_21A733B00(uint64_t a1, int a2)
{
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_21A733B68;
  v3[3] = &unk_24DD07B20;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = BYTE2(a2) & 1;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  return 0;
}

uint64_t sub_21A733B68(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_askUserForSetupCodeWithRetryStatus_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_21A733E1C(uint64_t a1, const char *a2)
{
  return objc_msgSend_sendProgressToUI_withParamDict_(*(void **)(a1 + 32), a2, 26, 0);
}

uint64_t sub_21A733E2C(uint64_t a1, const char *a2)
{
  return objc_msgSend_endSetup_(*(void **)(a1 + 32), a2, 4294960574);
}

void sub_21A734980(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (MEMORY[0x220747B90](a2) == MEMORY[0x24BDACFB8])
  {
    if (dword_2550F4C10 <= 800 && (dword_2550F4C10 != -1 || sub_21A69876C((uint64_t)&dword_2550F4C10, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4C10, (uint64_t)"void _xpc_airportassistant_handle_message(xpc_object_t)", 800, (uint64_t)"ERROR XPC - message:%@\n", v3, v4, v5, v6, a2);
    xpc_connection_cancel((xpc_connection_t)qword_2550F4DE0);
    xpc_release((xpc_object_t)qword_2550F4DE0);
    qword_2550F4DE0 = 0;
  }
}

void sub_21A736BD0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE08050];
  v4 = objc_msgSend_bagSubProfile(MEMORY[0x24BE08238], a2, a3);
  v7 = objc_msgSend_bagSubProfileVersion(MEMORY[0x24BE08238], v5, v6);
  v9 = objc_msgSend_bagForProfile_profileVersion_(v3, v8, v4, v7);
  v10 = objc_alloc(MEMORY[0x24BE08238]);
  v12 = (void *)objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(v10, v11, 0, CFSTR("com.apple.preferences"), CFSTR("1"), v9);
  v20[0] = CFSTR("com.apple.airport.mobileairportutility");
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, (uint64_t)v20, 1);
  objc_msgSend_setBundleIdentifiers_(v12, v15, v14);
  v18 = (void *)objc_msgSend_perform(v12, v16, v17);
  objc_msgSend_addFinishBlock_(v18, v19, (uint64_t)&unk_24DD07BC8);

}

uint64_t sub_21A736CC4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t result;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;

  v4 = (void *)objc_msgSend_responseDataItems(a2, (const char *)a2, a3);
  if (a3 || (v15 = v4, !objc_msgSend_count(v4, v5, v6)))
  {
    v7 = (void *)objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v5, v6);
    v9 = (void *)objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x24BDBCAE8]);
    if (objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("JP")))
      result = objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v11, (uint64_t)CFSTR("itms-apps://iTunes.com/AirMacUtility-iOS"));
    else
      result = objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v11, (uint64_t)CFSTR("itms-apps://iTunes.com/AirPortUtility-iOS"));
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBCF48];
    v17 = (void *)objc_msgSend_objectAtIndexedSubscript_(v15, v5, 0);
    v19 = (void *)objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("attributes"));
    v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("url"));
    result = objc_msgSend_URLWithString_(v16, v22, v21);
  }
  v23 = result;
  if (result)
  {
    v24 = (void *)objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v13, v14);
    return objc_msgSend_openSensitiveURL_withOptions_(v24, v25, v23, 0);
  }
  return result;
}

BOOL sub_21A736DA8(const __CFDictionary *a1)
{
  void *Value;
  const char *v2;
  uint64_t v3;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    Value = (void *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BE2E310]);
    if (Value)
    {
      if (objc_msgSend_count(Value, v2, v3))
        return 1;
    }
  }
  return result;
}

const __CFDictionary *sub_21A736DE4(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  const void *v2;
  const char *v3;
  uint64_t v4;
  void *Value;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    v2 = (const void *)*MEMORY[0x24BE2E310];
    result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x24BE2E310]);
    if (result)
    {
      result = (const __CFDictionary *)objc_msgSend_count(result, v3, v4);
      if (result)
      {
        Value = (void *)CFDictionaryGetValue(v1, v2);
        v64 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E2F8]);
        v65 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E328]);
        v66 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E318]);
        v67 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E320]);
        v68 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E300]);
        v69 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E308]);
        v70 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x24BE2E350]);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(Value, v6, (uint64_t)&v71, v75, 16);
        if (v7)
        {
          v10 = v7;
          v11 = *(_QWORD *)v72;
          v12 = &stru_24DD08368;
          v13 = 1;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v72 != v11)
                objc_enumerationMutation(Value);
              v15 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("&id%d=%@"), v13 + i, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
              v18 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v16, v17);
              v20 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v15, v19, v18);
              v12 = (__CFString *)objc_msgSend_stringByAppendingString_(v12, v21, v20);
            }
            v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(Value, v8, (uint64_t)&v71, v75, 16);
            v13 = (v13 + i);
          }
          while (v10);
        }
        else
        {
          v12 = &stru_24DD08368;
        }
        v22 = (void *)MEMORY[0x24BDD17C8];
        v23 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v8, v9);
        v25 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v64, v24, v23);
        v28 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v26, v27);
        v30 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v65, v29, v28);
        v33 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v31, v32);
        v35 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v66, v34, v33);
        v38 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v36, v37);
        v40 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v67, v39, v38);
        v43 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v41, v42);
        v45 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v68, v44, v43);
        v48 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v46, v47);
        v50 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v69, v49, v48);
        v53 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x24BDD14A8], v51, v52);
        v55 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v70, v54, v53);
        v57 = objc_msgSend_stringWithFormat_(v22, v56, (uint64_t)CFSTR("itms-apps://?action=accessory-lookup%@&bid=%@&accessoryName=%@&manufacturer=%@&modelNumber=%@&firmwareVersion=%@&hardwareVersion=%@&serialNumber=%@"), v12, v25, v30, v35, v40, v45, v50, v55);
        v59 = objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v58, v57);
        v62 = (void *)objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v60, v61);
        return (const __CFDictionary *)objc_msgSend_openSensitiveURL_withOptions_(v62, v63, v59, 0);
      }
    }
  }
  return result;
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x24BDB6958](*(_QWORD *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x24BDB6960](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x24BDB6970](*(_QWORD *)&inSystemSoundID);
}

void AudioServicesPlayAlertSound(SystemSoundID inSystemSoundID)
{
  MEMORY[0x24BDB6978](*(_QWORD *)&inSystemSoundID);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x24BDAC280](*(_QWORD *)&algorithm, password, passwordLen, salt, saltLen, *(_QWORD *)&prf, *(_QWORD *)&rounds, derivedKey);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x24BDBB8B0](alloc, str, attributes);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x24BDBBB88](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x24BDBBD28](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x24BDBC078](center, name, object, userInfo, options);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x24BDBC200](plist, format);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E8](theString, replacement);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x24BDBDD10](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
  MEMORY[0x24BDBDF88](c, allowsFontSmoothing);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x24BDBE098](c, shouldSmoothFonts);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CFTypeID CGFontGetTypeID(void)
{
  return MEMORY[0x24BDBE348]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBEDB0](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x24BDC47C0](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x24BDC4930]();
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x24BDC4A28](line, *(_QWORD *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x24BDC4AC8](line, ascent, descent, leading);
  return result;
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x24BDAC3E8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x24BDAC3F0](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x24BDAC3F8](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x24BDAC408](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x24BDAC410](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x24BDAC418](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x24BDAC420](*(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x24BDAC428](sdRef);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x24BDAC450](service, queue);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

Boolean SCDynamicStoreAddTemporaryValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x24BDF5638](store, key, value);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5670](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDF5680](allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x24BDF5690](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF56C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x24BDF57D8](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x24BDF57E0](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x24BDF5808](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x24BDF5810](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5870](allocator, name, prefsID, authorization);
}

uint64_t SRP6a_client_method()
{
  return MEMORY[0x24BE08740]();
}

uint64_t SRP_compute_key()
{
  return MEMORY[0x24BE08750]();
}

uint64_t SRP_free()
{
  return MEMORY[0x24BE08758]();
}

uint64_t SRP_gen_pub()
{
  return MEMORY[0x24BE08760]();
}

uint64_t SRP_new()
{
  return MEMORY[0x24BE08768]();
}

uint64_t SRP_respond()
{
  return MEMORY[0x24BE08770]();
}

uint64_t SRP_set_auth_password()
{
  return MEMORY[0x24BE08778]();
}

uint64_t SRP_set_params()
{
  return MEMORY[0x24BE08780]();
}

uint64_t SRP_set_username()
{
  return MEMORY[0x24BE08788]();
}

uint64_t SRP_verify()
{
  return MEMORY[0x24BE08790]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x24BDAC558](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x24BDAC560](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x24BDAC568](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x24BDAC570](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x24BDAC578](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x24BDAC580](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x24BDAC588](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x24BDAC590](txtRecord, key, valueSize, value);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x24BE678D0]();
}

uint64_t WiFiDeviceClientAssociateCancel()
{
  return MEMORY[0x24BE678D8]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x24BE67900]();
}

uint64_t WiFiDeviceClientDisassociate()
{
  return MEMORY[0x24BE67908]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x24BE67918]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x24BE67928]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x24BE67968]();
}

uint64_t WiFiDeviceClientScanCancel()
{
  return MEMORY[0x24BE67970]();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return MEMORY[0x24BE67988]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x24BE679B8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x24BE679E8]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x24BE67A00]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x24BE67AE8]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x24BE67B68]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x24BE67B88]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x24BE67B98]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x24BE67BA0]();
}

uint64_t WiFiNetworkGetAssociationDate()
{
  return MEMORY[0x24BE67BD0]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x24BE67C48]();
}

uint64_t WiFiNetworkRemovePassword()
{
  return MEMORY[0x24BE67CF8]();
}

uint64_t WiFiNetworkRequiresPassword()
{
  return MEMORY[0x24BE67D10]();
}

uint64_t WiFiNetworkSetAssociationDate()
{
  return MEMORY[0x24BE67D20]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x24BE67D28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDACA0](this, __pos, __n1, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24DD04288(__p);
}

uint64_t operator delete()
{
  return off_24DD04290();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DD04298(__sz);
}

uint64_t operator new()
{
  return off_24DD042A0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_call_unexpected(void *a1)
{
  MEMORY[0x24BEDB918](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x24BDAC8F8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x24BEDF1B0](dest, destLen, source, sourceLen, *(_QWORD *)&level);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t cstr_free()
{
  return MEMORY[0x24BE08798]();
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADDC0](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x24BDADF48](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFA8](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDAE538](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAE7B0](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x24BDAFD90](a1, a2, *(_QWORD *)&a3, a4);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFF08](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x24BEDF298](dest, destLen, source, sourceLen);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x24BDB0560](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

