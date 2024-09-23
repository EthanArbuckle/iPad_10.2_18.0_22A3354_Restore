@implementation NTKSubmitAnalyticsForExitAddSharedFaceFlow

void __NTKSubmitAnalyticsForExitAddSharedFaceFlow_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  _NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents(*(void **)(a1 + 32), CFSTR("com.apple.NanoTimeKit.FaceSharing.EarlyExit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addFaceFlowExitScreenName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("exitScreen"));

    AnalyticsSendEvent();
  }
  else
  {
    _NTKLoggingObjectForDomain(29, (uint64_t)"NTKLoggingDomainMetrics");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Early exit add shared face failed.", v5, 2u);
    }

  }
}

@end
