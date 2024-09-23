@implementation DNDSXPCEventInterface

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__DNDSXPCEventInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance;
}

void __39__DNDSXPCEventInterface_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (void)setEvent:(id)a3 forKey:(id)a4 onStream:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = objc_retainAutorelease(a5);
  v8 = a4;
  v10 = a3;
  objc_msgSend(v7, "UTF8String");
  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "UTF8String");

  xpc_set_event();
}

- (void)registerForStream:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  NSObject *targetq;

  v7 = objc_retainAutorelease(a3);
  v8 = a5;
  targetq = a4;
  xpc_set_event_stream_handler((const char *)objc_msgSend(v7, "UTF8String"), targetq, v8);

}

@end
