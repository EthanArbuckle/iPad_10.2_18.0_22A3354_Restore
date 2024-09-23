@implementation NTKSubmitAnalyticsForAddSharedFace

void __NTKSubmitAnalyticsForAddSharedFace_block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  _NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents(*(void **)(a1 + 32), CFSTR("com.apple.apple.NanoTimeKit.FaceSharing.AddFace"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    AnalyticsSendEvent();
  }
  else
  {
    _NTKLoggingObjectForDomain(29, (uint64_t)"NTKLoggingDomainMetrics");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Add share face failed.", v3, 2u);
    }

  }
}

@end
