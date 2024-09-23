@implementation SCLog

+ (id)client
{
  if (client_onceToken != -1)
    dispatch_once(&client_onceToken, &__block_literal_global_0);
  return (id)client__client;
}

void __15__SCLog_client__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(kSCLogSubsystem, "client");
  v1 = (void *)client__client;
  client__client = (uint64_t)v0;

}

+ (id)clientUI
{
  if (clientUI_onceToken != -1)
    dispatch_once(&clientUI_onceToken, &__block_literal_global_2);
  return (id)clientUI__client;
}

void __17__SCLog_clientUI__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(kSCLogSubsystem, "clientUI");
  v1 = (void *)clientUI__client;
  clientUI__client = (uint64_t)v0;

}

@end
