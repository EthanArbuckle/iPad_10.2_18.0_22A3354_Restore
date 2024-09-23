@implementation BBServerRun

void __BBServerRun_block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  int v4;
  int v5;
  BBServer *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  int out_token;
  uint8_t v13[16];
  uint8_t buf[16];

  v0 = (void *)MEMORY[0x212B94804]();
  BBInitializeUserDefaultsIfNecessary();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.bulletinboard.bbserverqueue", v1);
  v3 = (void *)__BBServerQueue;
  __BBServerQueue = (uint64_t)v2;

  v4 = BBServerSetIsNotListeningForConnections_token;
  if (BBServerSetIsNotListeningForConnections_token != -1
    || (notify_register_check(BBServerListeningForConnectionsKey, &BBServerSetIsNotListeningForConnections_token),
        v4 = BBServerSetIsNotListeningForConnections_token,
        BBServerSetIsNotListeningForConnections_token != -1))
  {
    notify_set_state(v4, 0);
    notify_post(BBServerListeningForConnectionsKey);
  }
  v5 = BBServerSetDoesntAllowPublication_token;
  if (BBServerSetDoesntAllowPublication_token != -1
    || (notify_register_check("com.apple.bulletinboard.allowPublication", &BBServerSetDoesntAllowPublication_token),
        v5 = BBServerSetDoesntAllowPublication_token,
        BBServerSetDoesntAllowPublication_token != -1))
  {
    notify_set_state(v5, 0);
    notify_post("com.apple.bulletinboard.allowPublication");
  }
  v6 = [BBServer alloc];
  v7 = -[BBServer initWithQueue:](v6, "initWithQueue:", __BBServerQueue);
  v8 = (void *)__server;
  __server = v7;

  v9 = BBServerAllowsPublication();
  v10 = BBLogGeneral;
  v11 = os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "publication allowed", buf, 2u);
    }
    dispatch_async((dispatch_queue_t)__BBServerQueue, &__block_literal_global_712);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "publication NOT allowed", v13, 2u);
    }
    out_token = -1;
    notify_register_dispatch("com.apple.bulletinboard.allowPublication", &out_token, (dispatch_queue_t)__BBServerQueue, &__block_literal_global_715);
  }
  objc_autoreleasePoolPop(v0);
}

void __BBServerRun_block_invoke_711()
{
  if (BBAllowPublication_onceToken != -1)
    dispatch_once(&BBAllowPublication_onceToken, &__block_literal_global_718);
}

uint64_t __BBServerRun_block_invoke_713(int a1, int token)
{
  NSObject *v3;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = state64;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBAllowPublicationNotifyKey state changed! %lld", buf, 0xCu);
  }
  if (state64 == 1 && BBAllowPublication_onceToken != -1)
    dispatch_once(&BBAllowPublication_onceToken, &__block_literal_global_718);
  return notify_cancel(token);
}

@end
