@implementation CDGetLowDiskSignpostHighSeverityLogHandle

void __CDGetLowDiskSignpostHighSeverityLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ConditionInducer.HighSeverity", "LowDiskCondition");
  v1 = (void *)qword_1ECE24258;
  qword_1ECE24258 = (uint64_t)v0;

}

@end
