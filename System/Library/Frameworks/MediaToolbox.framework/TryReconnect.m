@implementation TryReconnect

void __fbf_TryReconnect_block_invoke(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t DerivedStorage;
  uint64_t v6;
  CFErrorRef v7;
  nw_error_domain_t error_domain;
  int error_code;
  __CFString **v10;
  const void *CFError;

  if (a2 == 5)
  {
    if (*(_QWORD *)(a1 + 32))
      CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else
  {
    FigRetainProxyLockMutex();
    if (!FigRetainProxyIsInvalidated())
    {
      FigRetainProxyGetOwner();
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      if (*(_QWORD *)(DerivedStorage + 488))
      {
        v6 = DerivedStorage;
        if (a2 == 4)
        {
          if (a3)
          {
            v7 = nw_error_copy_cf_error(a3);
            error_domain = nw_error_get_error_domain(a3);
            error_code = nw_error_get_error_code(a3);
            if (error_domain - 1 > 2)
              v10 = kCoreMediaErrorDomain;
            else
              v10 = (__CFString **)qword_1E2F89E78[error_domain - 1];
            CFError = (const void *)FigCreateCFError(*v10, error_code, CFSTR("Reconnect failure"), 0, 0, *(_QWORD *)(v6 + 168), v7);
            if (v7)
              CFRelease(v7);
          }
          else
          {
            CFError = (const void *)FigCreateCFError(CFSTR("CoreMediaErrorDomain"), -12935, CFSTR("Reconnect failure"), 0, 0, *(_QWORD *)(DerivedStorage + 168), 0);
          }
          fbf_CancelReconnect(v6);
          ++*(_DWORD *)(v6 + 496);
          if (CFError)
            fbf_ReleaseAndRetainLastErrorFromCFError(v6, CFError);
          if (*(_QWORD *)(v6 + 520) <= FigGetUpTimeNanoseconds())
          {
            *(_QWORD *)(v6 + 512) = 0;
            fbf_postConnectionToHostLostNotification(v6);
          }
          else
          {
            *(_QWORD *)(v6 + 512) = FigGetUpTimeNanoseconds() + 30000000000;
            FigHTTPRescheduleTimer(30.0, *(_QWORD *)(v6 + 48), *(NSObject **)(v6 + 456));
          }
        }
        else if (a2 == 3)
        {
          *(_BYTE *)(DerivedStorage + 17) = 0;
          fbf_CancelReconnect(DerivedStorage);
          if (FigByteFlumePostHostAvailableNotification(v6))
            fbf_ReportingAgentResetErrorStats(v6);
        }
      }
      else
      {
        FigSignalErrorAt();
      }
    }
    FigRetainProxyUnlockMutex();
  }
}

@end
