@implementation MRPowerLogger

- (MRPowerLogger)initWithQueue:(id)a3
{
  id v5;
  MRPowerLogger *v6;
  MRPowerLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPowerLogger;
  v6 = -[MRPowerLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

+ (MRPowerLogger)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_89);
  return (MRPowerLogger *)(id)sharedLogger___logger;
}

void __29__MRPowerLogger_sharedLogger__block_invoke()
{
  MRPowerLogger *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [MRPowerLogger alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.amp.MediaRemote.MRPowerLogger.shared", v4);
  v2 = -[MRPowerLogger initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)sharedLogger___logger;
  sharedLogger___logger = v2;

}

- (void)logEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MRPowerLogger queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__MRPowerLogger_logEvent_withInfo___block_invoke;
  v11[3] = &unk_1E30C5F40;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

uint64_t __35__MRPowerLogger_logEvent_withInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MRLogCategoryConnections();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEBUG, "[MRPowerLogger] logging event %@", (uint8_t *)&v5, 0xCu);
  }

  return softLinkPLLogRegisteredEvent(118, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
