@implementation IPProgressStubBehavior

- (IPProgressStubBehavior)initWithEventStreamName:(id)a3
{
  id v4;
  IPProgressStubBehavior *v5;
  IPXPCEventSubscriptionBlackhole *v6;
  IPXPCEventSubscriptionBlackhole *streamBlackhole;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPProgressStubBehavior;
  v5 = -[IPProgressStubBehavior init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IPXPCEventSubscriptionBlackhole initWithStreamName:]([IPXPCEventSubscriptionBlackhole alloc], "initWithStreamName:", v4);
    streamBlackhole = v5->_streamBlackhole;
    v5->_streamBlackhole = v6;

  }
  return v5;
}

- (OS_dispatch_queue)queue
{
  if (queue_onceToken != -1)
    dispatch_once(&queue_onceToken, &__block_literal_global_5);
  return (OS_dispatch_queue *)(id)queue_queue;
}

void __31__IPProgressStubBehavior_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.InstallProgress.IPProgressStubBehavior", v2);
  v1 = (void *)queue_queue;
  queue_queue = (uint64_t)v0;

}

- (void)resume
{
  NSObject *v3;
  uint8_t v4[16];

  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "Resuming stub behavior. The sand exerts a comforting influence on the buried head.", v4, 2u);
  }

  -[IPXPCEventSubscriptionBlackhole resume](self->_streamBlackhole, "resume");
}

- (IPProgressServerBehaviorDelegate)delegate
{
  return (IPProgressServerBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamBlackhole, 0);
}

@end
