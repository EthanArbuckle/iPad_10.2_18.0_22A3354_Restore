@implementation DKPredictor

void __28___DKPredictor_predictorLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.dkpredictor", ");
  v1 = (void *)predictorLog_predictorLog;
  predictorLog_predictorLog = (uint64_t)v0;

}

@end
