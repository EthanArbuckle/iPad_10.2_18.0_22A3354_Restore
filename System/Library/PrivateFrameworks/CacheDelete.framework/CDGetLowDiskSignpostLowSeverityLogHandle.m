@implementation CDGetLowDiskSignpostLowSeverityLogHandle

void __CDGetLowDiskSignpostLowSeverityLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ConditionInducer.LowSeverity", "LowDiskCondition");
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = (uint64_t)v0;

}

@end
