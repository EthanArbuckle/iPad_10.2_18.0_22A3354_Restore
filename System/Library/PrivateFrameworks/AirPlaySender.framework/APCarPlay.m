@implementation APCarPlay

intptr_t __APCarPlay_AddSignPostTimeInfoToTimeStore_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    if (!IsAppleInternalBuild())
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = mach_absolute_time();
    if (gLogCategory_APCarPlayCarServicesInterface > 50
      || gLogCategory_APCarPlayCarServicesInterface == -1 && !_LogCategory_Initialize())
    {
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    UpTicksToMilliseconds();
LABEL_8:
    LogPrintF();
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (gLogCategory_APCarPlayCarServicesInterface <= 90
    && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __APCarPlay_CRFetchInstrumentClusterURLs_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v7;

  if (objc_msgSend(a3, "code"))
  {
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      v7 = objc_msgSend(a3, "localizedDescription");
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code", v7);
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    if (a2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CFRetain(a2);
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __APCarPlay_CRFetchScaledDisplays_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v7;

  if (objc_msgSend(a3, "code"))
  {
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      v7 = objc_msgSend(a3, "localizedDescription");
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code", v7);
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    if (a2)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CFRetain(a2);
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __APCarPlay_FetchUIContextMasterURLList_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  if (a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code");
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      LogPrintF();
    }
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CFRetain(a2);
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_14;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __APCarPlay_FetchSessionFeatureKeysWithIdentifier_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  if (a3)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a3, "code");
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
LABEL_14:
      LogPrintF();
    }
  }
  else
  {
    if (IsAppleInternalBuild())
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
      if (gLogCategory_APCarPlayCarServicesInterface <= 50
        && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
      {
        UpTicksToMilliseconds();
        LogPrintF();
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CFRetain(a2);
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_14;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __APCarPlay_AddAnalyticsValues_block_invoke(uint64_t a1, void *a2)
{
  const void *v3;

  if (a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "code");
    if (gLogCategory_APCarPlayCarServicesInterface <= 90
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_9;
    }
  }
  else if (IsAppleInternalBuild())
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = mach_absolute_time();
    if (gLogCategory_APCarPlayCarServicesInterface <= 50
      && (gLogCategory_APCarPlayCarServicesInterface != -1 || _LogCategory_Initialize()))
    {
      UpTicksToMilliseconds();
LABEL_9:
      LogPrintF();
    }
  }
  v3 = *(const void **)(a1 + 64);
  if (v3)
    CFRelease(v3);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
