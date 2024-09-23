@implementation FPConfigurationSettingQueue

void ___FPConfigurationSettingQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.FramePacing.ConfigurationSettingQueue", 0);
  v1 = (void *)qword_25430AE30;
  qword_25430AE30 = (uint64_t)v0;

}

@end
