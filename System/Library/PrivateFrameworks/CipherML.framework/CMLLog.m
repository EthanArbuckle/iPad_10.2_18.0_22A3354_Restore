@implementation CMLLog

+ (id)client
{
  if (client_onceToken != -1)
    dispatch_once(&client_onceToken, &__block_literal_global);
  return (id)client__client;
}

void __16__CMLLog_client__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(kCMLLogSubsystem, "client");
  v1 = (void *)client__client;
  client__client = (uint64_t)v0;

}

@end
