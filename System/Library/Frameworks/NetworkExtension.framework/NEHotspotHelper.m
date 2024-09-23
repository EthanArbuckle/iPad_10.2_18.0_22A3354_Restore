@implementation NEHotspotHelper

+ (BOOL)registerWithOptions:(NSDictionary *)options queue:(dispatch_queue_t)queue handler:(NEHotspotHelperHandler)handler
{
  NSDictionary *v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;

  v7 = options;
  v8 = queue;
  if (registerWithOptions_queue_handler__S_handler)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(handler, "copy");
    v11 = (void *)registerWithOptions_queue_handler__S_handler;
    registerWithOptions_queue_handler__S_handler = v10;

    if (!MEMORY[0x1E0D0D248] || (v12 = CNPluginRegister()) == 0)
    {
      v13 = (void *)registerWithOptions_queue_handler__S_handler;
      registerWithOptions_queue_handler__S_handler = 0;

      v12 = 0;
    }
    v9 = v12 != 0;
  }

  return v9;
}

+ (BOOL)logoff:(NEHotspotNetwork *)network
{
  NEHotspotNetwork *v3;
  BOOL v4;

  v3 = network;
  if (MEMORY[0x1E0D0D240])
    v4 = CNPluginLogoffNetwork() != 0;
  else
    v4 = 0;

  return v4;
}

+ (NSArray)supportedNetworkInterfaces
{
  const __CFArray *v2;
  const __CFArray *v3;
  void *v4;

  if (MEMORY[0x1E0D0D238] && (v2 = (const __CFArray *)CNPluginCopySupportedInterfaces()) != 0)
  {
    v3 = v2;
    createHotspotNetworkArray(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

void __53__NEHotspotHelper_registerWithOptions_queue_handler___block_invoke(uint64_t a1, const void *a2)
{
  NEHotspotHelperCommand *v3;
  _QWORD *v4;
  _QWORD *v5;
  const void *v6;
  _QWORD *v7;
  id v8;
  objc_super v9;

  v3 = [NEHotspotHelperCommand alloc];
  if (v3)
  {
    v9.receiver = v3;
    v9.super_class = (Class)NEHotspotHelperCommand;
    v4 = objc_msgSendSuper2(&v9, sel_init);
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      if (a2)
      {
        CFRetain(a2);
        v5 = v7;
      }
      v6 = (const void *)v5[1];
      if (v6)
      {
        CFRelease(v6);
        v5 = v7;
      }
      v5[1] = a2;
    }
  }
  else
  {
    v5 = 0;
  }
  v8 = v5;
  (*(void (**)(void))(registerWithOptions_queue_handler__S_handler + 16))();

}

@end
