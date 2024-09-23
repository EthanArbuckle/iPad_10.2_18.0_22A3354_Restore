@implementation GEOGetStringConditionEvaluatorLog

void __GEOGetStringConditionEvaluatorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "StringConditionEvaluator");
  v1 = (void *)_MergedGlobals_306;
  _MergedGlobals_306 = (uint64_t)v0;

}

@end
