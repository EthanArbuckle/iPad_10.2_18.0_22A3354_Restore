@implementation FPConfigurationCheckingQueue

void ___FPConfigurationCheckingQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.FramePacing.ConfigurationCheckingQueue", 0);
  v1 = (void *)qword_25430AE40;
  qword_25430AE40 = (uint64_t)v0;

}

@end
