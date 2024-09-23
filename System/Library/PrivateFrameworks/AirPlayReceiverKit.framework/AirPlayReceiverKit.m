void sub_22E2486DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22E248BC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E248E8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22E248F2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22E24CB04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_22E24E5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E253D80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_22E253EB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_22E2541E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void _HandleClearScreen(uint64_t a1, void *a2, const void *a3)
{
  NSObject *v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;

  v5 = a2;
  if (v5 && CFEqual(a3, (CFTypeRef)*MEMORY[0x24BE02FE8]))
  {
    if (gLogCategory_AirPlayReceiverKit <= 40
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = v5[17];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___HandleClearScreen_block_invoke;
    block[3] = &unk_24FA1BC70;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void sub_22E2566AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22E256944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_22E2578A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E257B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t FigVideoQueueSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    return v6(CMBaseObject, a2, a3);
  else
    return 4294954514;
}

void ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", kReachabilityChangedNotification, v4);

}

void sub_22E25A77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_22E25DAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E25E6C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_22E25F348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBufConsumerCreate(uint64_t a1)
{
  uint64_t DerivedStorage;

  if (a1)
  {
    FigValeriaGetClassID();
    if (!CMDerivedObjectCreate())
    {
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(_QWORD *)DerivedStorage = dispatch_queue_create("com.apple.AirPlayReceiver.sbufconsumer", 0);
      *(_WORD *)(DerivedStorage + 8) = 0;
      *(_BYTE *)(DerivedStorage + 10) = 0;
      if (gLogCategory_AirPlayReceiverKit > 30
        || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
      {
        return 0;
      }
LABEL_5:
      LogPrintF();
      return 0;
    }
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_5;
  }
  return 0;
}

void *SBufConsumerRegisterVideoSampleBufferCallbackForRendering(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  const void *v4;
  void *result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(const void **)(DerivedStorage + 24);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(DerivedStorage + 24) = result;
  return result;
}

void *SBufConsumerRegisterAudioSampleBufferCallbackForRendering(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  const void *v4;
  void *result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(const void **)(DerivedStorage + 16);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(DerivedStorage + 16) = result;
  return result;
}

void *SBufConsumerRegisterCallbackForDisconnect(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  const void *v4;
  void *result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(const void **)(DerivedStorage + 32);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(DerivedStorage + 32) = result;
  return result;
}

void *SBufConsumerRegisterCallbackForCopyProperty(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  const void *v4;
  void *result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(const void **)(DerivedStorage + 40);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(a2);
  *(_QWORD *)(DerivedStorage + 40) = result;
  return result;
}

void sbufConsumer_finalize()
{
  uint64_t DerivedStorage;
  const void *v1;
  const void *v2;
  const void *v3;
  const void *v4;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)DerivedStorage)
  {
    dispatch_release(*(dispatch_object_t *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  v1 = *(const void **)(DerivedStorage + 24);
  if (v1)
    _Block_release(v1);
  v2 = *(const void **)(DerivedStorage + 16);
  if (v2)
    _Block_release(v2);
  v3 = *(const void **)(DerivedStorage + 32);
  if (v3)
    _Block_release(v3);
  v4 = *(const void **)(DerivedStorage + 40);
  if (v4)
    _Block_release(v4);
}

CFStringRef sbufConsumer_copyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("<SBufConsumer %p>"), a1);
}

uint64_t sbufConsumer_copyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject **DerivedStorage;
  NSObject *v7;
  uint64_t v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -12787;
  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  v7 = *DerivedStorage;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __sbufConsumer_copyProperty_block_invoke;
  v10[3] = &unk_24FA1C588;
  v10[4] = &v11;
  v10[5] = DerivedStorage;
  v10[6] = a2;
  v10[7] = a4;
  dispatch_sync(v7, v10);
  v8 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_22E26077C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __sbufConsumer_copyProperty_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1[5] + 40);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[7]);
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

uint64_t sbufConsumer_getDispatchQueue()
{
  return 0;
}

uint64_t sbufConsumer_connect()
{
  NSObject **DerivedStorage;
  NSObject *v1;
  uint64_t v2;
  _QWORD block[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v1 = *DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_connect_block_invoke;
  block[3] = &unk_24FA1C5B0;
  block[4] = &v5;
  block[5] = DerivedStorage;
  dispatch_sync(v1, block);
  if (*((_DWORD *)v6 + 6))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_22E26098C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sbufConsumer_disconnect()
{
  NSObject **DerivedStorage;
  NSObject *v1;
  _QWORD block[5];

  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v1 = *DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_disconnect_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t sbufConsumer_enqueueVideoFrame(uint64_t a1, uint64_t a2)
{
  NSObject **DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  v4 = *DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_enqueueVideoFrame_block_invoke;
  block[3] = &unk_24FA1C5D8;
  block[4] = &v8;
  block[5] = DerivedStorage;
  block[6] = a2;
  dispatch_sync(v4, block);
  v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_22E260B54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sbufConsumer_enqueueAudioSample(uint64_t a1, uint64_t a2)
{
  NSObject **DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  DerivedStorage = (NSObject **)CMBaseObjectGetDerivedStorage();
  v4 = *DerivedStorage;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __sbufConsumer_enqueueAudioSample_block_invoke;
  block[3] = &unk_24FA1C5D8;
  block[4] = &v8;
  block[5] = DerivedStorage;
  block[6] = a2;
  dispatch_sync(v4, block);
  v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_22E260C08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __sbufConsumer_connect_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = -6709;
    return APSLogErrorAt();
  }
  else
  {
    *(_WORD *)(v1 + 8) = 257;
  }
  return result;
}

uint64_t __sbufConsumer_disconnect_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_WORD *)(v1 + 8) = 0;
    *(_BYTE *)(v1 + 10) = 0;
    result = *(_QWORD *)(v1 + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

_QWORD *__sbufConsumer_enqueueVideoFrame_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[5];
  if (*(_BYTE *)(v1 + 8))
  {
    if (!*(_BYTE *)(v1 + 10))
      *(_WORD *)(v1 + 9) = 256;
    v2 = *(_QWORD *)(v1 + 24);
    if (v2)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, result[6]);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = -6709;
    return (_QWORD *)APSLogErrorAt();
  }
  return result;
}

_QWORD *__sbufConsumer_enqueueAudioSample_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[5];
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (v2)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, result[6]);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = -6709;
    return (_QWORD *)APSLogErrorAt();
  }
  return result;
}

uint64_t UIControllerCreate()
{
  uint64_t DerivedStorage;

  APReceiverUIControllerGetClassID();
  if (!CMDerivedObjectCreate())
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    *(_QWORD *)(DerivedStorage + 8) = 0;
    *(_WORD *)(DerivedStorage + 16) = 0;
    if (gLogCategory_AirPlayReceiverKit > 50
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_4:
    LogPrintF();
    return 0;
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_4;
  }
  return 0;
}

uint64_t UIControllerPostVideoV1Event(uint64_t a1, const char *a2, const __CFDictionary *a3)
{
  _BOOL4 v6;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *v8;
  uint64_t DerivedStorage;
  uint64_t v10;
  __CFDictionary *Mutable;
  uint64_t v12;

  CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    if (strcmp_prefix())
      v6 = 0;
    else
      v6 = strcmp(a2, "userStop") != 0;
    if (!strcmp(a2, "stopAudio") || v6)
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (a3)
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
      else
        MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v8 = MutableCopy;
      if (!MutableCopy)
      {
        APSLogErrorAt();
        return 4294960568;
      }
      CFDictionarySetNumber();
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (!strcmp(a2, "ended")
        || !strcmp(a2, "loading")
        || !strcmp(a2, "paused")
        || !strcmp(a2, "playing")
        || !strcmp(a2, "stopped"))
      {
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        if (*(_QWORD *)(DerivedStorage + 56))
        {
          v10 = DerivedStorage;
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          CFDictionarySetValue(Mutable, CFSTR("category"), CFSTR("video"));
          if (!strcmp(a2, "ended"))
          {
            CFDictionarySetValue(Mutable, CFSTR("state"), CFSTR("stopped"));
            CFDictionarySetValue(Mutable, CFSTR("reason"), CFSTR("ended"));
          }
          else
          {
            CFDictionarySetCString();
          }
          uiController_relayCommonParams(v8, Mutable);
          CFDictionaryRemoveValue(v8, CFSTR("sessionID"));
          if (CFDictionaryGetCount(v8) >= 1)
            CFDictionarySetValue(Mutable, CFSTR("params"), v8);
          (*(void (**)(_QWORD, __CFDictionary *))(v10 + 56))(*(_QWORD *)(v10 + 64), Mutable);
          if (Mutable)
            CFRelease(Mutable);
        }
        else
        {
          APSLogErrorAt();
        }
      }
      else if (!strcmp(a2, "error"))
      {
        uiController_handleErrorEventV1(a1, v8);
      }
      else if (!strcmp(a2, "failedURLRequest"))
      {
        uiController_handleFailedURLRequestV1(a1, v8);
      }
      else if (!strcmp(a2, "metaDataChanged"))
      {
        uiController_handleMetaDataEventV1(a1, v8);
      }
      else if (!strcmp(a2, "currentItemChanged") || !strcmp(a2, "itemPlayedToEnd") || !strcmp(a2, "itemRemoved"))
      {
        uiController_handlePlaylistEventV1(a1, (uint64_t)a2, v8);
      }
      else if (!strcmp(a2, "dateRange"))
      {
        uiController_handleDateRangeEventV1(a1, v8);
      }
      else if (!strcmp(a2, "fpsSecureStopGenerated") || !strcmp(a2, "userStop"))
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
      }
      else
      {
        uiController_handleOtherEventV1(a1, (uint64_t)a2, v8);
      }
      CFRelease(v8);
    }
    return 0;
  }
  else
  {
    v12 = 4294960591;
    APSLogErrorAt();
  }
  return v12;
}

void uiController_handleErrorEventV1(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  __CFDictionary *Mutable;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (v4 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("category"), CFSTR("video"));
    CFDictionarySetValue(Mutable, CFSTR("error"), a2);
    uiController_relayCommonParams((const __CFDictionary *)a2, Mutable);
    (*(void (**)(_QWORD, __CFDictionary *))(v4 + 56))(*(_QWORD *)(v4 + 64), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleFailedURLRequestV1(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  __CFDictionary *Mutable;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (v4 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("unhandledURLRequest"));
    CFDictionarySetValue(Mutable, CFSTR("request"), a2);
    uiController_relayCommonParams((const __CFDictionary *)a2, Mutable);
    (*(void (**)(_QWORD, __CFDictionary *))(v4 + 56))(*(_QWORD *)(v4 + 64), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleMetaDataEventV1(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  __CFDictionary *Mutable;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (v4 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("category"), CFSTR("video"));
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("timedMetadata"));
    uiController_relayCommonParams(a2, Mutable);
    (*(void (**)(_QWORD, __CFDictionary *))(v4 + 56))(*(_QWORD *)(v4 + 64), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handlePlaylistEventV1(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t DerivedStorage;
  uint64_t v5;
  __CFDictionary *Mutable;
  const void *Value;
  const void *v8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3 && (v5 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("category"), CFSTR("video"));
    CFDictionarySetCString();
    Value = CFDictionaryGetValue(a3, CFSTR("item"));
    if (Value)
      CFDictionarySetValue(Mutable, CFSTR("item"), Value);
    uiController_relayCommonParams(a3, Mutable);
    v8 = CFDictionaryGetValue(a3, CFSTR("uuid"));
    if (v8)
      CFDictionarySetValue(Mutable, CFSTR("uuid"), v8);
    (*(void (**)(_QWORD, __CFDictionary *))(v5 + 56))(*(_QWORD *)(v5 + 64), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleDateRangeEventV1(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  const __CFArray *Value;
  const __CFArray *v8;
  CFMutableArrayRef v9;
  const void *v10;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && (v4 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, CFSTR("category"), CFSTR("video"));
    CFDictionarySetValue(Mutable, CFSTR("type"), CFSTR("dateRange"));
    Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("dateRangeArray"));
    if (Value)
    {
      v8 = Value;
      v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
      CFArrayGetCount(v8);
      CFArrayApplyBlock();
      if (v9)
        CFDictionarySetValue(Mutable, CFSTR("dateRangeArray"), v9);
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v9 = 0;
    }
    v10 = CFDictionaryGetValue(a2, CFSTR("uuid"));
    if (v10)
      CFDictionarySetValue(Mutable, CFSTR("uuid"), v10);
    uiController_relayCommonParams(a2, Mutable);
    (*(void (**)(_QWORD, __CFDictionary *))(v4 + 56))(*(_QWORD *)(v4 + 64), Mutable);
    if (v9)
      CFRelease(v9);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void uiController_handleOtherEventV1(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t DerivedStorage;
  uint64_t v5;
  __CFDictionary *Mutable;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a3 && (v5 = DerivedStorage, *(_QWORD *)(DerivedStorage + 56)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetCString();
    uiController_relayCommonParams(a3, Mutable);
    CFDictionaryRemoveValue(a3, CFSTR("sessionID"));
    if (CFDictionaryGetCount(a3) >= 1)
      CFDictionarySetValue(Mutable, CFSTR("params"), a3);
    (*(void (**)(_QWORD, __CFDictionary *))(v5 + 56))(*(_QWORD *)(v5 + 64), Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    APSLogErrorAt();
  }
}

void UIControllerSetVideoV1Delegate(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t DerivedStorage;
  void *v7;
  void *v8;
  id v9;

  v4 = a2;
  v5 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = *(void **)(DerivedStorage + 104);
  *(_QWORD *)(DerivedStorage + 104) = v4;
  v9 = v4;

  v8 = *(void **)(DerivedStorage + 112);
  *(_QWORD *)(DerivedStorage + 112) = v5;

}

uint64_t UIControllerPostNotificationForRendererStoppedEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForStartRecordingEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForStopRecordingEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForKeyFrameRequest()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForFPSSecureStopGeneratedEvent()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

uint64_t UIControllerPostNotificationForUpdateDisplayInfo()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

void UIControllerSendUpstreamMessage(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  void *v5;
  id v6;
  void (*v7)(const void *, const void *, id);
  uint64_t v8;
  const void *v9;
  id v10;
  void *v11;
  id v12;
  const void *Int64;
  id v14;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage || (v4 = DerivedStorage, (v5 = *(void **)(DerivedStorage + 48)) == 0))
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_23:
    LogPrintF();
    return;
  }
  v6 = v5;
  objc_sync_enter(v6);
  v7 = *(void (**)(const void *, const void *, id))(v4 + 24);
  objc_sync_exit(v6);

  if (!v7)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_23;
  }
  if (!a2)
  {
    if (gLogCategory_AirPlayReceiverKit > 30
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_23;
  }
  if (!*(_QWORD *)v4 || (v8 = FigCFWeakReferenceHolderCopyReferencedObject()) == 0)
  {
    if (gLogCategory_AirPlayReceiverKit > 60
      || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_23;
  }
  v9 = (const void *)v8;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a2, 200, 0, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  if (v11)
    objc_msgSend(v10, "setObject:forKey:", v11, *MEMORY[0x24BE03028]);
  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_msgSend(*(id *)(v4 + 48), "currentVideoSessionID");
    Int64 = (const void *)CFNumberCreateInt64();
    v7(v9, Int64, v10);
    if (Int64)
      CFRelease(Int64);
  }
  CFRelease(v9);

}

uint64_t UIControllerCopyTLSInfo()
{
  _QWORD *DerivedStorage;
  const void *v1;
  void (*v2)(const void *, _QWORD, uint64_t *);
  uint64_t v4;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  v4 = 0;
  if (*DerivedStorage)
  {
    v1 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (!v1)
    {
      if (gLogCategory_AirPlayReceiverKit <= 60
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return 0;
    }
  }
  else
  {
    v1 = 0;
  }
  v2 = (void (*)(const void *, _QWORD, uint64_t *))DerivedStorage[4];
  if (v2)
    v2(v1, 0, &v4);
  if (v1)
    CFRelease(v1);
  return v4;
}

void uiController_finalize()
{
  uint64_t DerivedStorage;
  id v1;
  void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(id *)(DerivedStorage + 48);
  objc_sync_enter(v1);
  *(_QWORD *)(DerivedStorage + 24) = 0;
  *(_QWORD *)(DerivedStorage + 32) = 0;
  objc_sync_exit(v1);

  v2 = *(void **)(DerivedStorage + 48);
  if (v2)
  {
    *(_QWORD *)(DerivedStorage + 48) = 0;

  }
  if (*(_QWORD *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  v3 = *(const void **)(DerivedStorage + 40);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(DerivedStorage + 40) = 0;
  }
  v4 = *(const void **)(DerivedStorage + 88);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(DerivedStorage + 88) = 0;
  }
  v5 = *(const void **)(DerivedStorage + 8);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(DerivedStorage + 8) = 0;
  }
}

CFStringRef uiController_copyDebugDescription(const void *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<UIController %p>"), a1);
}

uint64_t uiController_copyProperty(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  uint64_t DerivedStorage;
  CFMutableDictionaryRef Mutable;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const void **v13;
  int v14;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03098]))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v8 = SBufConsumerCreate((uint64_t)Mutable);
    if (!v8)
    {
      v11 = 4294960534;
      APSLogErrorAt();
      return v11;
    }
    v9 = (const void *)v8;
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __uiController_copyProperty_block_invoke;
    v19[3] = &__block_descriptor_40_e31_v16__0__opaqueCMSampleBuffer__8l;
    v19[4] = DerivedStorage;
    SBufConsumerRegisterVideoSampleBufferCallbackForRendering(v8, v19);
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __uiController_copyProperty_block_invoke_2;
    v18[3] = &__block_descriptor_40_e31_v16__0__opaqueCMSampleBuffer__8l;
    v18[4] = DerivedStorage;
    SBufConsumerRegisterAudioSampleBufferCallbackForRendering((uint64_t)v9, v18);
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __uiController_copyProperty_block_invoke_3;
    v17[3] = &__block_descriptor_40_e5_v8__0l;
    v17[4] = DerivedStorage;
    SBufConsumerRegisterCallbackForDisconnect((uint64_t)v9, v17);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __uiController_copyProperty_block_invoke_4;
    v16[3] = &__block_descriptor_40_e25_i24__0____CFString__8_v16l;
    v16[4] = DerivedStorage;
    SBufConsumerRegisterCallbackForCopyProperty((uint64_t)v9, v16);
    *a4 = CFRetain(v9);
    CFRelease(v9);
    if (Mutable)
      CFRelease(Mutable);
    return 0;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03060]))
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03070]))
    {
      v13 = (const void **)MEMORY[0x24BDBD270];
      if (!*(_BYTE *)(DerivedStorage + 16))
        v13 = (const void **)MEMORY[0x24BDBD268];
    }
    else
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03080]))
        return 4294954509;
      v14 = objc_msgSend(*(id *)(DerivedStorage + 48), "isActive");
      v13 = (const void **)MEMORY[0x24BDBD270];
      if (!v14)
        v13 = (const void **)MEMORY[0x24BDBD268];
    }
    v12 = *v13;
    goto LABEL_17;
  }
  v12 = *(const void **)(DerivedStorage + 8);
  if (v12)
  {
LABEL_17:
    v11 = 0;
    *a4 = CFRetain(v12);
    return v11;
  }
  return 0;
}

uint64_t uiController_setProperty(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  const void *v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeID v14;
  CFTypeID v15;
  double v16;
  void *v17;
  CFTypeID v18;
  CFTypeID v19;
  uint64_t *v20;
  int v21;
  int valuePtr;
  _QWORD block[8];
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03098]))
    goto LABEL_2;
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03060]))
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03070]))
    {
      *(_BYTE *)(DerivedStorage + 16) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03090]))
    {
      *(_BYTE *)(DerivedStorage + 17) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03088]))
    {
      *(_BYTE *)(DerivedStorage + 18) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03050]))
    {
      if (!*(_DWORD *)(DerivedStorage + 80) || !*(_QWORD *)(DerivedStorage + 72))
        goto LABEL_2;
      if (!*(_QWORD *)(DerivedStorage + 104))
      {
        *((_DWORD *)v26 + 6) = -6762;
        APSLogErrorAt();
        goto LABEL_2;
      }
      v9 = *(NSObject **)(DerivedStorage + 112);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __uiController_setProperty_block_invoke;
      v24[3] = &unk_24FA1C5D8;
      v24[4] = &v25;
      v24[5] = DerivedStorage;
      v24[6] = a3;
      v10 = v24;
LABEL_22:
      dispatch_sync(v9, v10);
      goto LABEL_2;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03058]))
    {
      CFDictionaryGetDouble();
      v12 = v11;
      CFDictionaryGetDouble();
      if (!*(_QWORD *)(DerivedStorage + 104))
        goto LABEL_2;
      v9 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __uiController_setProperty_block_invoke_2;
      block[3] = &unk_24FA1C588;
      block[4] = &v25;
      block[5] = DerivedStorage;
      block[6] = v12;
      block[7] = v13;
      v10 = block;
      goto LABEL_22;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE030A8]))
    {
      if (!a3)
      {
        v8 = *(const void **)(DerivedStorage + 40);
        *(_QWORD *)(DerivedStorage + 40) = 0;
LABEL_33:
        if (!v8)
          goto LABEL_2;
        goto LABEL_7;
      }
      v14 = CFGetTypeID(a3);
      if (v14 == APReceiverStatsCollectorGetTypeID())
      {
        v8 = *(const void **)(DerivedStorage + 40);
        *(_QWORD *)(DerivedStorage + 40) = a3;
        CFRetain(a3);
        goto LABEL_33;
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE030B0]))
    {
      if (a3)
      {
        v15 = CFGetTypeID(a3);
        if (v15 == CFNumberGetTypeID())
        {
          if (*(_QWORD *)(DerivedStorage + 48))
          {
            valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a3, kCFNumberFloat32Type, &valuePtr);
            LODWORD(v16) = valuePtr;
            objc_msgSend(*(id *)(DerivedStorage + 48), "setMirroringVolume:", v16);
          }
          goto LABEL_2;
        }
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE030A0]))
    {
      if (a3)
      {
        v17 = *(void **)(DerivedStorage + 48);
        if (v17)
          objc_msgSend(v17, "setSessionReceiverAddress:", a3);
        goto LABEL_2;
      }
    }
    else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03078]))
    {
      if (a3)
      {
        v18 = CFGetTypeID(a3);
        if (v18 == CFDataGetTypeID())
        {
          objc_msgSend(*(id *)(DerivedStorage + 48), "setEnsembleInfo:", a3);
          goto LABEL_2;
        }
      }
    }
    else
    {
      if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BE03068]))
      {
        v20 = v26;
        v21 = -12787;
LABEL_48:
        *((_DWORD *)v20 + 6) = v21;
        goto LABEL_2;
      }
      if (a3)
      {
        v19 = CFGetTypeID(a3);
        if (v19 == CFDictionaryGetTypeID())
        {
          objc_msgSend(*(id *)(DerivedStorage + 48), "setDemoDeviceInfo:", a3);
          goto LABEL_2;
        }
      }
    }
    APSLogErrorAt();
    v20 = v26;
    v21 = -12780;
    goto LABEL_48;
  }
  v8 = *(const void **)(DerivedStorage + 8);
  *(_QWORD *)(DerivedStorage + 8) = a3;
  if (a3)
    CFRetain(a3);
  if (v8)
LABEL_7:
    CFRelease(v8);
LABEL_2:
  v6 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v25, 8);
  return v6;
}

void sub_22E2628E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __uiController_copyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "processVideoSampleBuffer:", a2);
}

uint64_t __uiController_copyProperty_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "processAudioSampleBuffer:", a2);
}

void *__uiController_copyProperty_block_invoke_3(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (void *)objc_msgSend(result, "stop");
  return result;
}

uint64_t __uiController_copyProperty_block_invoke_4(uint64_t a1, CFTypeRef cf1, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  void *v8;
  int v9;
  CFTypeRef *v10;

  if (CFEqual(cf1, CFSTR("FigVideoQueueStats")))
  {
    result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (result)
    {
      objc_msgSend((id)result, "videoQueuePerformanceDictionary");
      v7 = objc_claimAutoreleasedReturnValue();
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      result = 0;
      *a3 = v7;
    }
  }
  else if (CFEqual(cf1, CFSTR("DoNotUseForAudioRendering")))
  {
    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "optimizeAudioRenderingLatency");
    v10 = (CFTypeRef *)MEMORY[0x24BDBD270];
    if (!v9)
      v10 = (CFTypeRef *)MEMORY[0x24BDBD268];
    *a3 = CFRetain(*v10);

    return 0;
  }
  else
  {
    return 4294954509;
  }
  return result;
}

uint64_t __uiController_setProperty_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[5] + 104), "airplayUIUpdateAudioMetaData:", a1[6]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __uiController_setProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "airplayUIUpdateAudioProgress:duration:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t uiController_showPIN(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v11 = a1;
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processShowGlobalPasscodePromptRequest:withClientName:", v7, v8);

  return 0;
}

uint64_t uiController_hidePIN(uint64_t a1)
{
  void *v2;
  uint64_t v4;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v4 = a1;
    LogPrintF();
  }
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processHideGlobalPasscodePromptRequest");

  return 0;
}

uint64_t uiController_showMessage()
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

uint64_t uiController_startScreenPresentation(uint64_t a1, uint64_t a2, __CFDictionary **a3)
{
  _BOOL8 v5;
  void *v6;
  uint64_t DerivedStorage;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  void *v10;
  void *v11;
  void *v12;
  __CFDictionary *v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = CFDictionaryGetInt64() != 0;
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldForwardLayers:", v5);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldForwardLayers") & 1) == 0)
    goto LABEL_12;
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "useCALayerForMirroring") & 1) == 0)
  {

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(DerivedStorage + 48), "mirroringLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(DerivedStorage + 48), "mirroringLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(DerivedStorage + 48);
      v18 = a1;
      LogPrintF();

    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BE03048], (const void *)objc_msgSend(*(id *)(DerivedStorage + 48), "mirroringLayer", v18, v19, v20));
  }
LABEL_13:
  v13 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v14 = (const void *)*MEMORY[0x24BE02FE0];
  objc_msgSend(*(id *)(DerivedStorage + 48), "HUDLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(v13, v14, v15);

  APReceiverStatsCollectorSetHUDOptions();
  CFRelease(v13);
  v16 = ++uiController_startScreenPresentation_uniqueScreenSessionID;
  CFDictionarySetInt64();
  if (a3)
    *a3 = Mutable;
  else
    CFRelease(Mutable);
  objc_msgSend(*(id *)(DerivedStorage + 48), "processStartScreenPresentationWithSessionID:", v16);
  return 0;
}

uint64_t uiController_stopScreenPresentation()
{
  uint64_t DerivedStorage;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  APReceiverStatsCollectorSetHUDOptions();
  objc_msgSend(*(id *)(DerivedStorage + 48), "processStopScreenPresentationWithSessionID:", CFDictionaryGetInt64());
  return 0;
}

uint64_t uiController_startVideoPlayback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  uint64_t DerivedStorage;
  uint64_t v10;
  id v11;
  uint64_t Int64;
  const void *Value;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)DerivedStorage)
  {
    CFRelease(*(CFTypeRef *)DerivedStorage);
    *(_QWORD *)DerivedStorage = 0;
  }
  if (a4 && (v10 = FigCFWeakReferenceHolderCreateWithReferencedObject(), (*(_QWORD *)DerivedStorage = v10) == 0))
  {
    APSLogErrorAt();
    return 4294960568;
  }
  else
  {
    v11 = *(id *)(DerivedStorage + 48);
    objc_sync_enter(v11);
    *(_QWORD *)(DerivedStorage + 24) = a2;
    *(_QWORD *)(DerivedStorage + 32) = a3;
    objc_sync_exit(v11);

    Int64 = CFDictionaryGetInt64();
    Value = CFDictionaryGetValue(a5, (const void *)*MEMORY[0x24BE03038]);
    if (Value)
      objc_msgSend(*(id *)(DerivedStorage + 48), "setReceiverNetworkClock:", Value);
    objc_msgSend(*(id *)(DerivedStorage + 48), "processStartVideoPlaybackRequestWithWithSessionID:version:", Int64, 2);
    return 0;
  }
}

uint64_t uiController_stopVideoPlayback()
{
  uint64_t DerivedStorage;
  id v1;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (objc_msgSend(*(id *)(DerivedStorage + 48), "processStopVideoPlaybackRequestWithSessionID:", CFDictionaryGetInt64()))
  {
    v1 = *(id *)(DerivedStorage + 48);
    objc_sync_enter(v1);
    *(_QWORD *)(DerivedStorage + 24) = 0;
    *(_QWORD *)(DerivedStorage + 32) = 0;
    objc_sync_exit(v1);

  }
  return 0;
}

uint64_t uiController_controlVideoPlayback(int a1, CFDictionaryRef theDict, _QWORD *a3)
{
  id Value;
  const void *v6;
  const void *v7;
  uint64_t DerivedStorage;
  uint64_t v9;
  void *v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;

  Value = (id)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE03028]);
  v6 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE03040]);
  if (Value)
  {
    v7 = v6;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (*(_QWORD *)(DerivedStorage + 48))
    {
      v9 = DerivedStorage;
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", Value, 0, 0, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      Value = v17;
      if (Value || !v10)
      {
        if (gLogCategory_AirPlayReceiverKit > 90
          || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_21;
        }
      }
      else
      {
        if (FigCFDictionaryGetInt32IfPresent())
        {
          v11 = (const void *)*MEMORY[0x24BDBD270];
          objc_msgSend(*(id *)(v9 + 48), "backingMediaPlayer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11 == v7)
          {
            objc_msgSend(v12, "processMessageWithIDAndDictionarySync:messageSessionID:", v10, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (a3)
              *a3 = v14;

          }
          else
          {
            objc_msgSend(v12, "processMessageWithIDAndDictionaryAsync:messageSessionID:", v10, 0);

          }
          goto LABEL_21;
        }
        if (gLogCategory_AirPlayReceiverKit > 90
          || gLogCategory_AirPlayReceiverKit == -1 && !_LogCategory_Initialize())
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      LogPrintF();
      goto LABEL_21;
    }
    Value = 0;
  }
LABEL_22:
  v15 = objc_msgSend(Value, "code");

  return v15;
}

uint64_t uiController_startSession(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)(DerivedStorage + 48))
    return 0;
  v3 = DerivedStorage;
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createStreamRendererWithUniqueID:clientName:UIController:", v5, *(_QWORD *)(v3 + 8), a1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v6;

  v8 = *(void **)(v3 + 48);
  if (v8)
  {
    objc_msgSend(v8, "setIsWiredLink:", *(unsigned __int8 *)(v3 + 17));
    objc_msgSend(*(id *)(v3 + 48), "setIsP2PWiFi:", *(unsigned __int8 *)(v3 + 18));
    return 0;
  }
  APSLogErrorAt();
  return 4294960534;
}

uint64_t uiController_stopSession()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  void *v2;
  void *v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)(DerivedStorage + 48))
  {
    v1 = DerivedStorage;
    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 48), "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeRendererWithUniqueID:", v3);

  }
  return 0;
}

uint64_t uiController_startVideoPlaybackV1(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, CFMutableDictionaryRef *a5)
{
  uint64_t DerivedStorage;
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  NSObject *v9;
  const __CFDictionary *MutableCopy;
  const __CFString *Value;
  const __CFString *v12;
  CFTypeID v13;
  const __CFArray *v14;
  const __CFArray *v15;
  CFTypeID v16;
  CFURLRef v17;
  const __CFArray *v18;
  CFIndex Count;
  CFIndex i;
  CFIndex v21;
  CFIndex v22;
  const void *ValueAtIndex;
  CFTypeID v24;
  const void *v25;
  uint64_t Int64;
  const __CFString *TypedValue;
  __CFString *v28;
  _BOOL4 v29;
  unsigned int v30;
  BOOL v31;
  const void *v32;
  int Formatted;
  NSObject *v34;
  const __CFDictionary *v35;
  CFMutableDictionaryRef v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  const __CFDictionary *v48;
  _QWORD v52[8];
  CFTypeRef cf;
  _QWORD block[7];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;

  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v59 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4)
  {
    APSLogErrorAt();
    Mutable = 0;
    v38 = -6705;
    goto LABEL_111;
  }
  v7 = DerivedStorage;
  if (*(_QWORD *)(DerivedStorage + 72) || *(_DWORD *)(DerivedStorage + 80))
  {
    if (!*(_QWORD *)(DerivedStorage + 104))
    {
      *((_DWORD *)v61 + 6) = -6762;
      APSLogErrorAt();
      Mutable = 0;
      goto LABEL_93;
    }
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetInt64();
    CFDictionarySetInt64();
    v9 = *(NSObject **)(v7 + 112);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __uiController_startVideoPlaybackV1_block_invoke;
    block[3] = &unk_24FA1C5D8;
    block[4] = &v60;
    block[5] = v7;
    block[6] = Mutable;
    dispatch_sync(v9, block);
    if (*((_DWORD *)v61 + 6))
      goto LABEL_112;
    if (Mutable)
      CFRelease(Mutable);
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v44 = *(unsigned int *)(v7 + 80);
      v46 = *(_QWORD *)(v7 + 72);
      LogPrintF();
    }
    objc_msgSend(*(id *)(v7 + 48), "processStopVideoPlaybackRequestWithSessionID:", *(unsigned int *)(v7 + 80), v44, v46);
    *(_QWORD *)(v7 + 72) = 0;
    *(_DWORD *)(v7 + 80) = 0;
    *(_BYTE *)(v7 + 84) = 0;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a4);
  Mutable = MutableCopy;
  if (!MutableCopy)
  {
    APSLogErrorAt();
    Mutable = 0;
    v38 = -6728;
    goto LABEL_111;
  }
  Value = (const __CFString *)CFDictionaryGetValue(MutableCopy, CFSTR("Content-Location"));
  v12 = Value;
  if (!Value || (v13 = CFGetTypeID(Value), v13 != CFStringGetTypeID()))
  {
    APSLogErrorAt();
    v38 = -6756;
    goto LABEL_111;
  }
  v14 = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("cookies"));
  v15 = v14;
  if (!v14)
    goto LABEL_35;
  v16 = CFGetTypeID(v14);
  if (v16 != CFArrayGetTypeID())
    goto LABEL_35;
  if (!_CFHTTPCookieStorageGetDefault())
  {
    v43 = -6700;
    goto LABEL_104;
  }
  v17 = CFURLCreateWithString(0, v12, 0);
  if (!v17)
  {
    v43 = -6700;
    goto LABEL_104;
  }
  v18 = (const __CFArray *)CFHTTPCookieStorageCopyCookiesForURL();
  CFRelease(v17);
  if (v18)
  {
    Count = CFArrayGetCount(v18);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        CFArrayGetValueAtIndex(v18, i);
        CFHTTPCookieStorageDeleteCookie();
      }
    }
    CFRelease(v18);
  }
  v21 = CFArrayGetCount(v15);
  if (v21 >= 1)
  {
    v22 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v15, v22);
      if (!ValueAtIndex || (v24 = CFGetTypeID(ValueAtIndex), v24 != CFDictionaryGetTypeID()))
      {
        v43 = -6756;
        goto LABEL_104;
      }
      v25 = (const void *)CFHTTPCookieCreateWithProperties();
      if (!v25)
        break;
      CFHTTPCookieStorageSetCookie();
      CFRelease(v25);
      if (v21 == ++v22)
        goto LABEL_31;
    }
    v43 = -6700;
LABEL_104:
    APSLogErrorAt();
    *((_DWORD *)v61 + 6) = v43;
    if (gLogCategory_AirPlayReceiverKit <= 60
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_33;
    }
    goto LABEL_35;
  }
LABEL_31:
  *((_DWORD *)v61 + 6) = 0;
  if (gLogCategory_AirPlayReceiverKit <= 20
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
LABEL_33:
    LogPrintF();
  }
LABEL_35:
  Int64 = CFDictionaryGetInt64();
  CFStringGetTypeID();
  TypedValue = (const __CFString *)CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  v28 = (__CFString *)CFDictionaryGetTypedValue();
  if (CFDictionaryGetInt64() || v28 == CFSTR("music"))
  {
    v29 = 1;
  }
  else if (v28)
  {
    v29 = CFEqual(v28, CFSTR("music")) != 0;
  }
  else
  {
    v29 = 0;
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!TypedValue || !CFEqual(CFSTR("default"), TypedValue) && !CFEqual(CFSTR("moviePlayback"), TypedValue))
  {
    if (!v29
      && (!v28
       || v28 == CFSTR("movie")
       || CFEqual(v28, CFSTR("movie"))
       || v28 == CFSTR("tvshow")
       || CFEqual(v28, CFSTR("tvshow"))))
    {
      TypedValue = CFSTR("moviePlayback");
    }
    else
    {
      TypedValue = CFSTR("default");
    }
  }
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v48 = a4;
    LogPrintF();
  }
  *(_QWORD *)(v7 + 56) = a2;
  *(_QWORD *)(v7 + 64) = a3;
  *(_QWORD *)(v7 + 72) = Int64;
  do
  {
    v30 = __ldaxr(&uiController_newVideoV1SessionID_sessionID);
    if (__stlxr(v30 + 1, &uiController_newVideoV1SessionID_sessionID))
      v31 = 1;
    else
      v31 = v30 == 0;
  }
  while (v31);
  v59 = v30;
  *(_DWORD *)(v7 + 80) = v30;
  *(_BYTE *)(v7 + 84) = v29;
  v32 = *(const void **)(v7 + 88);
  CFRetain(TypedValue);
  *(_QWORD *)(v7 + 88) = TypedValue;
  if (v32)
    CFRelease(v32);
  CFDictionarySetNumber();
  cf = 0;
  v45 = CFSTR("audioMode");
  v47 = *(_QWORD *)(v7 + 88);
  Formatted = CFPropertyListCreateFormatted();
  *((_DWORD *)v61 + 6) = Formatted;
  if (Formatted)
  {
LABEL_112:
    APSLogErrorAt();
    goto LABEL_93;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  if (cf)
    CFRelease(cf);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v45 = (const __CFString *)Mutable;
    LogPrintF();
  }
  if (!*(_QWORD *)(v7 + 104))
  {
    *((_DWORD *)v61 + 6) = -6762;
    APSLogErrorAt();
    goto LABEL_93;
  }
  v34 = *(NSObject **)(v7 + 112);
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __uiController_startVideoPlaybackV1_block_invoke_2;
  v52[3] = &unk_24FA1C758;
  v52[6] = v7;
  v52[7] = Mutable;
  v52[4] = &v60;
  v52[5] = &v55;
  dispatch_sync(v34, v52);
  if (!*((_DWORD *)v61 + 6))
  {
    v35 = (const __CFDictionary *)v56[3];
    if (v35)
    {
      v36 = CFDictionaryCreateMutableCopy(0, 0, v35);
      CFRelease((CFTypeRef)v56[3]);
      if (v36)
        goto LABEL_77;
    }
    else
    {
      v36 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v36)
      {
LABEL_77:
        CFDictionarySetNumber();
        if (a5)
        {
          *a5 = v36;
          v37 = gLogCategory_AirPlayReceiverKit;
          if (gLogCategory_AirPlayReceiverKit > 30)
            goto LABEL_86;
          if (gLogCategory_AirPlayReceiverKit == -1)
          {
            if (!_LogCategory_Initialize())
              goto LABEL_85;
            v36 = *a5;
          }
          v45 = (const __CFString *)v36;
          LogPrintF();
        }
        else
        {
          CFRelease(v36);
        }
LABEL_85:
        v37 = gLogCategory_AirPlayReceiverKit;
LABEL_86:
        if (v37 <= 50 && (v37 != -1 || _LogCategory_Initialize()))
        {
          v45 = (const __CFString *)v59;
          v47 = Int64;
          LogPrintF();
        }
        v39 = CFDictionaryGetInt64();
        v40 = v39 != 0;
        if (*(unsigned __int8 *)(v7 + 96) != v40)
        {
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterPostNotification();
          *(_BYTE *)(v7 + 96) = v40;
        }
        objc_msgSend(*(id *)(v7 + 48), "processStartVideoPlaybackRequestWithWithSessionID:version:", *(unsigned int *)(v7 + 80), 1, v45, v47, v48);
        goto LABEL_93;
      }
    }
    APSLogErrorAt();
    v38 = -6700;
LABEL_111:
    *((_DWORD *)v61 + 6) = v38;
  }
LABEL_93:
  if (*((_DWORD *)v61 + 6)
    && gLogCategory_AirPlayReceiverKit <= 60
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Mutable)
    CFRelease(Mutable);
  v41 = *((unsigned int *)v61 + 6);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  return v41;
}

void sub_22E2640F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_stopVideoPlaybackV1(uint64_t a1, const __CFString *a2)
{
  uint64_t DerivedStorage;
  const char *v4;
  const __CFString *v5;
  uint64_t Int64;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  const __CFString *v11;
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v4 = "\n";
    if (!a2)
      v4 = " ";
    v5 = CFSTR("<<no params>>");
    if (a2)
      v5 = a2;
    v10 = (uint64_t)v4;
    v11 = v5;
    LogPrintF();
  }
  if (a2)
  {
    CFDictionaryGetInt64();
    Int64 = CFDictionaryGetInt64();
  }
  else
  {
    Int64 = 0;
  }
  if ((_DWORD)Int64 == *(_DWORD *)(DerivedStorage + 80))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterPostNotification();
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v10 = (uint64_t)a2;
      LogPrintF();
    }
    if (*(_QWORD *)(DerivedStorage + 104))
    {
      v7 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __uiController_stopVideoPlaybackV1_block_invoke;
      block[3] = &unk_24FA1C5D8;
      block[4] = &v13;
      block[5] = DerivedStorage;
      block[6] = a2;
      dispatch_sync(v7, block);
      if (*((_DWORD *)v14 + 6))
      {
        APSLogErrorAt();
      }
      else
      {
        if (*(_BYTE *)(DerivedStorage + 96))
        {
          CMNotificationCenterGetDefaultLocalCenter();
          CMNotificationCenterPostNotification();
          *(_BYTE *)(DerivedStorage + 96) = 0;
        }
        if (gLogCategory_AirPlayReceiverKit <= 50
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          v10 = Int64;
          v11 = *(const __CFString **)(DerivedStorage + 72);
          LogPrintF();
        }
        objc_msgSend(*(id *)(DerivedStorage + 48), "processStopVideoPlaybackRequestWithSessionID:", *(unsigned int *)(DerivedStorage + 80), v10, v11);
        *(_QWORD *)(DerivedStorage + 72) = 0;
        *(_DWORD *)(DerivedStorage + 80) = 0;
        *(_BYTE *)(DerivedStorage + 84) = 0;
      }
    }
    else
    {
      *((_DWORD *)v14 + 6) = -6762;
      APSLogErrorAt();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *((_DWORD *)v14 + 6) = 0;
  }
  v8 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void sub_22E26448C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_controlVideoPlaybackV1(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(DerivedStorage + 104))
  {
    v8 = *(NSObject **)(DerivedStorage + 112);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __uiController_controlVideoPlaybackV1_block_invoke;
    block[3] = &unk_24FA1C780;
    block[6] = DerivedStorage;
    block[7] = a2;
    block[8] = a3;
    block[4] = &v16;
    block[5] = &v12;
    dispatch_sync(v8, block);
    if (!*((_DWORD *)v17 + 6))
    {
      *a4 = v13[3];
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  else
  {
    *((_DWORD *)v17 + 6) = -6762;
    APSLogErrorAt();
  }
  v9 = *((unsigned int *)v17 + 6);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_22E264688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_copyPropertyForQualifier(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t DerivedStorage;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_QWORD *)(DerivedStorage + 104))
  {
    v8 = *(NSObject **)(DerivedStorage + 112);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __uiController_copyPropertyForQualifier_block_invoke;
    block[3] = &unk_24FA1C780;
    block[6] = DerivedStorage;
    block[7] = a2;
    block[8] = a3;
    block[4] = &v16;
    block[5] = &v12;
    dispatch_sync(v8, block);
    v9 = *((unsigned int *)v17 + 6);
    if (!(_DWORD)v9)
      *a4 = v13[3];
  }
  else
  {
    *((_DWORD *)v17 + 6) = -6762;
    APSLogErrorAt();
    v9 = *((unsigned int *)v17 + 6);
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void sub_22E2647C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_setPropertyWithQualifier(uint64_t a1, const __CFString *a2, uint64_t a3, const void *a4)
{
  uint64_t DerivedStorage;
  const void *v8;
  double v9;
  int Formatted;
  NSObject *v11;
  uint64_t v12;
  int v14;
  _QWORD block[9];
  CFTypeRef cf;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CFStringCompare(a2, CFSTR("rate"), 0) == kCFCompareEqualTo)
  {
    CFGetDouble();
    *(float *)&v9 = v9;
    if (*(float *)&v9 == 1.0 && *(_QWORD *)(DerivedStorage + 88))
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      cf = 0;
      Formatted = CFPropertyListCreateFormatted();
      *((_DWORD *)v18 + 6) = Formatted;
      if (Formatted)
        goto LABEL_29;
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      if (cf)
        CFRelease(cf);
    }
LABEL_21:
    if (*(_QWORD *)(DerivedStorage + 104))
    {
      v11 = *(NSObject **)(DerivedStorage + 112);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __uiController_setPropertyWithQualifier_block_invoke;
      block[3] = &unk_24FA1C7A8;
      block[4] = &v17;
      block[5] = DerivedStorage;
      block[6] = a2;
      block[7] = a3;
      block[8] = a4;
      dispatch_sync(v11, block);
    }
    else
    {
      *((_DWORD *)v18 + 6) = -6762;
      APSLogErrorAt();
    }
    goto LABEL_23;
  }
  if (CFStringCompare(a2, CFSTR("audioMode"), 0))
    goto LABEL_21;
  if (*(_DWORD *)(DerivedStorage + 80))
  {
    v8 = *(const void **)(DerivedStorage + 88);
    if (a4)
      CFRetain(a4);
    *(_QWORD *)(DerivedStorage + 88) = a4;
    if (v8)
    {
      CFRelease(v8);
      a4 = *(const void **)(DerivedStorage + 88);
    }
    if (a4)
    {
      if (gLogCategory_AirPlayReceiverKit <= 50
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      cf = 0;
      v14 = CFPropertyListCreateFormatted();
      *((_DWORD *)v18 + 6) = v14;
      if (!v14)
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterPostNotification();
        if (cf)
          CFRelease(cf);
        goto LABEL_23;
      }
LABEL_29:
      APSLogErrorAt();
    }
  }
LABEL_23:
  v12 = *((unsigned int *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

void sub_22E264B18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t uiController_startAudioSession()
{
  uint64_t DerivedStorage;
  uint64_t Int64;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Int64 = CFDictionaryGetInt64();
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(DerivedStorage + 48), "processStartAudioSessionRequestWithSessionID:isScreenAudio:", CFDictionaryGetInt64(), Int64 != 0);
  return 0;
}

uint64_t uiController_stopAudioSession()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(DerivedStorage + 48), "processStopAudioSessionRequestWithSessionID:", CFDictionaryGetInt64());
  return 0;
}

uint64_t uiController_isAllowedToProceed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v10 = a1;
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllowedToProceedForClientWithName:clientID:", v6, a3);

  return v8;
}

uint64_t uiController_handleSenderUIEventsChannelIncomingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_AirPlayReceiverKit <= 10
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(DerivedStorage + 48), "processSenderUIEvent:", a2);
  return 0;
}

uint64_t __uiController_startVideoPlaybackV1_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[5] + 104), "airplayUIStopVideo:", a1[6]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __uiController_startVideoPlaybackV1_block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  const void *v6;
  id v7;

  v2 = a1[7];
  v3 = *(void **)(a1[6] + 104);
  v7 = 0;
  v4 = objc_msgSend(v3, "airplayUIStartVideo:outputParams:", v2, &v7);
  v5 = v7;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v4;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  v6 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v6)
    CFRetain(v6);

}

uint64_t __uiController_stopVideoPlaybackV1_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[5] + 104), "airplayUIStopVideo:", a1[6]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __uiController_controlVideoPlaybackV1_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  id v6;
  const void *v7;
  id v8;

  v2 = a1[7];
  v3 = *(void **)(a1[6] + 104);
  v4 = a1[8];
  v8 = 0;
  v5 = objc_msgSend(v3, "airplayUIPerform:inputParams:outputParams:", v2, v4, &v8);
  v6 = v8;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v5;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
  v7 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v7)
    CFRetain(v7);

}

void __uiController_copyPropertyForQualifier_block_invoke(_QWORD *a1)
{
  void *v2;
  const void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1[6] + 104), "airplayUIGetProperty:qualifier:error:", a1[7], a1[8], *(_QWORD *)(a1[4] + 8) + 24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v2;
  v3 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v3)
  {
    v4 = v2;
    CFRetain(v3);
    v2 = v4;
  }

}

uint64_t __uiController_setPropertyWithQualifier_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[5] + 104), "airplayUISetProperty:qualifier:value:", a1[6], a1[7], a1[8]);
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void uiController_relayCommonParams(const __CFDictionary *a1, __CFDictionary *a2)
{
  const void *Value;
  const void *v5;
  const void *v6;

  Value = CFDictionaryGetValue(a1, CFSTR("sessionID"));
  if (Value)
    CFDictionarySetValue(a2, CFSTR("sessionID"), Value);
  v5 = (const void *)*MEMORY[0x24BDC0F00];
  v6 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x24BDC0F00]);
  if (v6)
    CFDictionarySetValue(a2, v5, v6);
}

void __uiController_handleDateRangeEventV1_block_invoke(uint64_t a1, void *a2)
{
  const void *v3;
  id v4;

  v4 = a2;
  v3 = (const void *)objc_msgSend(v4, "propertyList");
  if (v3)
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 90
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t APReceiverFairPlayHelperCopyAuthorizeItemResponseIntoDictionary()
{
  return MEMORY[0x24BE02F80]();
}

uint64_t APReceiverFairPlayHelperCreate()
{
  return MEMORY[0x24BE02F88]();
}

uint64_t APReceiverFairPlayHelperProcessFPInfo()
{
  return MEMORY[0x24BE02F90]();
}

uint64_t APReceiverFairPlayHelperRemoveAllFPSessions()
{
  return MEMORY[0x24BE02F98]();
}

uint64_t APReceiverStatsCollectorGetTypeID()
{
  return MEMORY[0x24BE02FA0]();
}

uint64_t APReceiverStatsCollectorSetHUDOptions()
{
  return MEMORY[0x24BE02FA8]();
}

uint64_t APReceiverUIControllerGetClassID()
{
  return MEMORY[0x24BE02FB0]();
}

uint64_t APSFeaturesCreateMutable()
{
  return MEMORY[0x24BE03340]();
}

uint64_t APSFeaturesSetFeature()
{
  return MEMORY[0x24BE03368]();
}

uint64_t APSGetAccessControlConfig()
{
  return MEMORY[0x24BE03378]();
}

uint64_t APSGetMaxSizePreservingAspectRatio()
{
  return MEMORY[0x24BE033A8]();
}

uint64_t APSGetP2PAllow()
{
  return MEMORY[0x24BE033B0]();
}

uint64_t APSIsVirtualMachine()
{
  return MEMORY[0x24BE03460]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x24BE03468]();
}

uint64_t APSNetworkAddressGetSocketAddr()
{
  return MEMORY[0x24BE034A8]();
}

uint64_t APSNetworkTimeMakeFromDictionary()
{
  return MEMORY[0x24BE03508]();
}

uint64_t APSSettingsCopyValueEx()
{
  return MEMORY[0x24BE03628]();
}

uint64_t APSSettingsGetInt64()
{
  return MEMORY[0x24BE03640]();
}

uint64_t APSSettingsGetIntWithDefault()
{
  return MEMORY[0x24BE03650]();
}

uint64_t APSSettingsRemoveValue()
{
  return MEMORY[0x24BE03670]();
}

uint64_t APSSettingsSetInt64()
{
  return MEMORY[0x24BE03680]();
}

uint64_t APSSettingsSetValue()
{
  return MEMORY[0x24BE03688]();
}

uint64_t APSSettingsSynchronize()
{
  return MEMORY[0x24BE03690]();
}

uint64_t APSSystemSupportsWiFiUDM()
{
  return MEMORY[0x24BE036D8]();
}

uint64_t APSVersionUtilsGetShortVersionLength()
{
  return MEMORY[0x24BE036E0]();
}

uint64_t AirPlayReceiverServerControl()
{
  return MEMORY[0x24BE02FB8]();
}

uint64_t AirPlayReceiverServerCopyProperty()
{
  return MEMORY[0x24BE02FC0]();
}

uint64_t AirPlayReceiverServerCreate()
{
  return MEMORY[0x24BE02FC8]();
}

uint64_t AirPlayReceiverServerGetDispatchQueue()
{
  return MEMORY[0x24BE02FD0]();
}

uint64_t AirPlayReceiverServerSetProperty()
{
  return MEMORY[0x24BE02FD8]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x24BE28EC0]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x24BE28ED8]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x24BE28EE0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

uint64_t CFArrayApplyBlock()
{
  return MEMORY[0x24BE28F20]();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
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

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

uint64_t CFDictionarySetCString()
{
  return MEMORY[0x24BE28FA8]();
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x24BE28FC0]();
}

uint64_t CFDictionarySetNumber()
{
  return MEMORY[0x24BE28FC8]();
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

uint64_t CFGetDouble()
{
  return MEMORY[0x24BE28FD8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

uint64_t CFHTTPCookieCreateWithProperties()
{
  return MEMORY[0x24BDB7278]();
}

uint64_t CFHTTPCookieStorageCopyCookiesForURL()
{
  return MEMORY[0x24BDB7280]();
}

uint64_t CFHTTPCookieStorageDeleteCookie()
{
  return MEMORY[0x24BDB7288]();
}

uint64_t CFHTTPCookieStorageSetCookie()
{
  return MEMORY[0x24BDB7290]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

uint64_t CFNumberCreateInt64()
{
  return MEMORY[0x24BE28FF8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

uint64_t CFObjectControlSync()
{
  return MEMORY[0x24BE29018]();
}

uint64_t CFObjectGetPropertyInt64Sync()
{
  return MEMORY[0x24BE29050]();
}

uint64_t CFObjectSetProperty()
{
  return MEMORY[0x24BE29058]();
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x24BE290C0]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x24BDBF130]((__n128)size, *(__n128 *)&size.height);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x24BDC0248]();
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0310](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x24BDC0330](sbuf, createIfNecessary);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

uint64_t CMTimebaseCreateReadOnlyTimebase()
{
  return MEMORY[0x24BDC05B8]();
}

OSStatus CMTimebaseCreateWithSourceClock(CFAllocatorRef allocator, CMClockRef sourceClock, CMTimebaseRef *timebaseOut)
{
  return MEMORY[0x24BDC05C0](allocator, sourceClock, timebaseOut);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x24BDC0600](timebase, rate);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x24BDC0620](timebase, time);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x24BE29148]();
}

uint64_t FigAssetWriterCreateWithURL()
{
  return MEMORY[0x24BDDCD40]();
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x24BDC06C0]();
}

uint64_t FigCFDictionaryGetCMTimeIfPresent()
{
  return MEMORY[0x24BDC06D8]();
}

uint64_t FigCFDictionaryGetInt32IfPresent()
{
  return MEMORY[0x24BDC06F0]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x24BDC0798]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x24BDC07A0]();
}

uint64_t FigValeriaGetClassID()
{
  return MEMORY[0x24BDDCE30]();
}

uint64_t FigVideoQueueCreate()
{
  return MEMORY[0x24BDDCE40]();
}

uint64_t FigVideoQueueGetCMBaseObject()
{
  return MEMORY[0x24BDDCE48]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t LogControl()
{
  return MEMORY[0x24BE295D8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x24BE296A8]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5770](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5798](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF57B0](target, runLoop, runLoopMode);
}

uint64_t SockAddrToString()
{
  return MEMORY[0x24BE299C8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFHTTPCookieStorageGetDefault()
{
  return MEMORY[0x24BDB74D0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t strcmp_prefix()
{
  return MEMORY[0x24BE29BE8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

