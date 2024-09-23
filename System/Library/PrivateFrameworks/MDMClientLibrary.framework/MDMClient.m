@implementation MDMClient

+ (id)sharedClient
{
  if (sharedClient_once != -1)
    dispatch_once(&sharedClient_once, &__block_literal_global);
  return (id)sharedClient_client;
}

void __25__MDMClient_sharedClient__block_invoke()
{
  MDMClient *v0;
  void *v1;

  v0 = objc_alloc_init(MDMClient);
  v1 = (void *)sharedClient_client;
  sharedClient_client = (uint64_t)v0;

}

- (MDMClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MDMClient;
  return -[MDMClientCore initWithChannelType:](&v3, sel_initWithChannelType_, 0);
}

@end
