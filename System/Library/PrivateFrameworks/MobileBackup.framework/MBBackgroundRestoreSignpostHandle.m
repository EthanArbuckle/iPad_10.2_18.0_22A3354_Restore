@implementation MBBackgroundRestoreSignpostHandle

os_log_t __MBBackgroundRestoreSignpostHandle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ConditionInducer.HighSeverity", "BackgroundRestoreCondition");
  MBBackgroundRestoreSignpostHandle_log = (uint64_t)result;
  return result;
}

@end
