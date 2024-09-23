@implementation LPLogChannelSerialization

void __LPLogChannelSerialization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LinkPresentation", "Serialization");
  v1 = (void *)LPLogChannelSerialization_log;
  LPLogChannelSerialization_log = (uint64_t)v0;

}

@end
