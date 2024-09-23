@implementation APTNANDataSessionRetainActivation

uint64_t __APTNANDataSessionRetainActivation_block_invoke()
{
  uint64_t result;

  if (gLogCategory_APTNANDataSession <= 90)
  {
    if (gLogCategory_APTNANDataSession != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

void __APTNANDataSessionRetainActivation_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[8];
  _QWORD v8[4];

  if (gLogCategory_APTNANDataSession <= 50
    && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -6723;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  if (v3)
  {
    v5 = DerivedStorage;
    CFRetain(v3);
    v6 = *(NSObject **)(v5 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___APTNANDataSessionInvalidate_block_invoke;
    block[3] = &unk_1E8256C80;
    block[4] = v8;
    block[5] = v5;
    block[6] = v2;
    block[7] = v3;
    dispatch_async(v6, block);
    CFRelease(v3);
  }
  _Block_object_dispose(v8, 8);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 64));

}

void __APTNANDataSessionRetainActivation_block_invoke_3(uint64_t a1)
{
  const void *v2;
  uint64_t DerivedStorage;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[6];
  int v10;

  v2 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (gLogCategory_APTNANDataSession <= 50
    && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = NSErrorToOSStatus();
    if (v5 != 312374)
      goto LABEL_25;
    v6 = (void *)objc_msgSend(v4, "wfaDataSessionClient");
    if (!v6)
    {
      if (gLogCategory_APTNANDataSession <= 90
        && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = 312374;
      goto LABEL_25;
    }
    v5 = -72401;
    v7 = objc_msgSend(v6, "internetSharingPolicy");
    if ((unint64_t)(v7 - 2) < 2)
      goto LABEL_21;
    if (v7 == 1)
    {
      v5 = -72400;
    }
    else
    {
      if (!v7)
      {
        if (gLogCategory_APTNANDataSession <= 90)
        {
          if (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize())
            LogPrintF();
          v5 = -6762;
          goto LABEL_21;
        }
        v5 = -6762;
LABEL_25:
        CFRetain(v2);
        v8 = *(NSObject **)(DerivedStorage + 24);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __APTNANDataSessionRetainActivation_block_invoke_4;
        block[3] = &__block_descriptor_52_e5_v8__0l;
        v10 = v5;
        block[4] = DerivedStorage;
        block[5] = v2;
        dispatch_async(v8, block);
        CFRelease(v2);
        return;
      }
      if (APSIsPersistentGroupSDBCapable())
        v5 = -72401;
      else
        v5 = -72400;
    }
LABEL_21:
    if (gLogCategory_APTNANDataSession <= 90
      && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_25;
  }
}

void __APTNANDataSessionRetainActivation_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
    *(_DWORD *)(v2 + 64) = *(_DWORD *)(a1 + 48);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 40));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

void __APTNANDataSessionRetainActivation_block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    if (gLogCategory_APTNANDataSession <= 90
      && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
    {
LABEL_15:
      LogPrintF();
    }
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v3, "peerAddress");
    SockAddrToString();
    if (gLogCategory_APTNANDataSession <= 50)
    {
      if (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize())
        LogPrintF();
      if (gLogCategory_APTNANDataSession <= 50
        && (gLogCategory_APTNANDataSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_15;
      }
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = NSErrorToOSStatus();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));

  CFRelease(*(CFTypeRef *)(a1 + 64));
}

@end
