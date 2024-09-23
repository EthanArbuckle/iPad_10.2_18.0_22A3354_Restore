@implementation APBrokerAuthenticate

void __APBrokerAuthenticate_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v9;
  uint64_t v10;
  CFMutableDictionaryRef Mutable;
  int v12;
  int v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef cf;

  v9 = gLogCategory_APBroker;
  if (gLogCategory_APBroker <= 50)
  {
    if (gLogCategory_APBroker == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_9;
      v9 = gLogCategory_APBroker;
    }
    if (v9 == -1)
      _LogCategory_Initialize();
    LogPrintF();
  }
LABEL_9:
  if (a6)
  {
    APSLogErrorAt();
    Mutable = 0;
    goto LABEL_30;
  }
  v10 = *(_QWORD *)(a1 + 48);
  v16 = 0;
  cf = 0;
  v14 = 0;
  v15 = 0;
  FigSimpleMutexCheckIsNotLockedOnThisThread();
  Mutable = 0;
  a6 = -6705;
  if (a2 && v10)
  {
    if (gLogCategory_APBroker <= 30 && (gLogCategory_APBroker != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v12 = APBrokerCopyAuthInfoFromBrokerResponse(a2, &cf, &v16, &v14, &v15);
    if (v12)
    {
      a6 = v12;
      APSLogErrorAt();
    }
    else
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v10 + 40));
      v13 = APBrokerKeychainUtilsStoreAuthToken(*(__CFString **)(v10 + 24), (__CFString *)v14, (uint64_t)cf, (uint64_t)v16);
      if (!v13)
      {
        pthread_mutex_unlock(*(pthread_mutex_t **)(v10 + 40));
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (Mutable)
        {
          FigCFDictionarySetValue();
          a6 = 0;
        }
        else
        {
          APSLogErrorAt();
          a6 = -6728;
        }
        goto LABEL_20;
      }
      a6 = v13;
      APSLogErrorAt();
      pthread_mutex_unlock(*(pthread_mutex_t **)(v10 + 40));
    }
    Mutable = 0;
  }
LABEL_20:
  if (cf)
    CFRelease(cf);
  if (v16)
    CFRelease(v16);
  if (v15)
    CFRelease(v15);
  if (v14)
    CFRelease(v14);
  if (a6)
    APSLogErrorAt();
LABEL_30:
  _CallRequestCallbackBlock(a6, *(NSObject **)(a1 + 56), Mutable, *(void **)(a1 + 32));
  if (Mutable)
    CFRelease(Mutable);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  _Block_release(*(const void **)(a1 + 32));
}

@end
