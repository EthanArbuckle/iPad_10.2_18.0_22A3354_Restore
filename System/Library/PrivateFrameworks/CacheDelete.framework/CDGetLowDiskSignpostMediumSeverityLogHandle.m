@implementation CDGetLowDiskSignpostMediumSeverityLogHandle

void __CDGetLowDiskSignpostMediumSeverityLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ConditionInducer.MediumSeverity", "LowDiskCondition");
  v1 = (void *)qword_1ECE24248;
  qword_1ECE24248 = (uint64_t)v0;

}

@end
