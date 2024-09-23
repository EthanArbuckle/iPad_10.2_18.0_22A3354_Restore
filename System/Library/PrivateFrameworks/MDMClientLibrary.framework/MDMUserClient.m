@implementation MDMUserClient

+ (id)sharedClient
{
  if (sharedClient_once_0 != -1)
    dispatch_once(&sharedClient_once_0, &__block_literal_global_6);
  return (id)sharedClient_client_0;
}

void __29__MDMUserClient_sharedClient__block_invoke()
{
  MDMUserClient *v0;
  void *v1;

  v0 = objc_alloc_init(MDMUserClient);
  v1 = (void *)sharedClient_client_0;
  sharedClient_client_0 = (uint64_t)v0;

}

- (MDMUserClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MDMUserClient;
  return -[MDMClientCore initWithChannelType:](&v3, sel_initWithChannelType_, 1);
}

@end
