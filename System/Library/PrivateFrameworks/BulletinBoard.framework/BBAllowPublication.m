@implementation BBAllowPublication

void __BBAllowPublication_block_invoke()
{
  dispatch_async((dispatch_queue_t)__BBServerQueue, &__block_literal_global_719);
}

void __BBAllowPublication_block_invoke_2()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[12];
  int out_token;

  v0 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_loadDataProvidersAndSettings");
  out_token = -1;
  notify_register_check(BBServerListeningForConnectionsKey, &out_token);
  if (out_token != -1)
  {
    v1 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_20CCB9000, v1, OS_LOG_TYPE_DEFAULT, "notifying BBServerListeningForConnectionsKey", v2, 2u);
    }
    notify_set_state(out_token, 1uLL);
    notify_post(BBServerListeningForConnectionsKey);
  }
  objc_autoreleasePoolPop(v0);
}

@end
