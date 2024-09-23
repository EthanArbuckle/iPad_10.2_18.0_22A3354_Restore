@implementation CCSetChangeRemoteXPCNotifier

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CCSetChangeRemoteXPCNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  return (id)sharedInstance__pasExprOnceResult;
}

void __46__CCSetChangeRemoteXPCNotifier_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x23B82079C]();
  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

- (CCSetChangeRemoteXPCNotifier)init
{
  CCSetChangeRemoteXPCNotifier *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCSetChangeRemoteXPCNotifier;
  v2 = -[CCSetChangeRemoteXPCNotifier init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.cascade.CCSetChangeRelayClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)client
{
  void *v2;
  void *v3;
  CCXPCClient *v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25687B388);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_notifyChangeToSet_completion_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1988], "bm_connectionWithMachServiceName:queue:options:", CFSTR("com.apple.cascade.SetChangeRelayService"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CCXPCClient initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:]([CCXPCClient alloc], "initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:", v2, 0, v3, CFSTR("CCSetChangeRelayClient"), 5, 4, 0);

  return v4;
}

- (void)notifyChangeToSet:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke;
  block[3] = &unk_250990570;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2;
  v3[3] = &unk_250990548;
  v4 = v1;
  objc_msgSend(v2, "notifyChangeToSet:completion:", v4, v3);

}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2(uint64_t a1, unsigned __int16 a2)
{
  NSObject *v4;

  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2_cold_1(a1, a2, v4);

}

- (void)notifyChangeToSet:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[CCSetChangeRemoteXPCNotifier client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__CCSetChangeRemoteXPCNotifier_notifyChangeToSet_completion___block_invoke;
  v10[3] = &unk_250990598;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "serviceRequest:completion:usingBlock:", 1, v7, v10);

}

uint64_t __61__CCSetChangeRemoteXPCNotifier_notifyChangeToSet_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "notifyChangeToSet:completion:", *(_QWORD *)(a1 + 32), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2_cold_1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_debug_impl(&dword_237B25000, log, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayClient notifying change to Set: %@ with result: %hu", (uint8_t *)&v4, 0x12u);
}

@end
