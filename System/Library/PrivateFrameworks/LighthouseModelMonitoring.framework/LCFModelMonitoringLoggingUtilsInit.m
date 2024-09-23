@implementation LCFModelMonitoringLoggingUtilsInit

void __LCFModelMonitoringLoggingUtilsInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)LCFModelMonitoringLoggingSubsystem, (const char *)LCFModelMonitoringLoggingCategoryShadowEvaluation);
  v1 = (void *)LCFMMLogShadowEvaluation;
  LCFMMLogShadowEvaluation = (uint64_t)v0;

  v2 = os_log_create((const char *)LCFModelMonitoringLoggingSubsystem, (const char *)LCFModelMonitoringLoggingCategoryProactivePredictionRanker);
  v3 = (void *)LCFMMLogProactivePredictionRanker;
  LCFMMLogProactivePredictionRanker = (uint64_t)v2;

}

@end
