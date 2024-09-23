@implementation MFMessageContentURLProtocolRegistry

void __54___MFMessageContentURLProtocolRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry__sharedInstance;
  sharedRegistry__sharedInstance = (uint64_t)v1;

}

@end
