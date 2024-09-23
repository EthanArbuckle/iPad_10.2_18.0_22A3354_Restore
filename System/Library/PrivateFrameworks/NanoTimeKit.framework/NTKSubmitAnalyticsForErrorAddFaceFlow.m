@implementation NTKSubmitAnalyticsForErrorAddFaceFlow

void __NTKSubmitAnalyticsForErrorAddFaceFlow_block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  const __CFString *v4;
  id v5;

  _NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents(*(void **)(a1 + 32), CFSTR("com.apple.NanoTimeKit.FaceSharing.Error"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "errorMessage");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v2, "length"))
  {
    v3 = v5;
    v4 = v2;
  }
  else
  {
    v4 = CFSTR("ntk_unknown");
    v3 = v5;
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("errorMessage"));
  AnalyticsSendEvent();

}

@end
