@implementation LACOnenessSessionMonitor

- (LACOnenessSessionMonitor)initWithReplyQueue:(id)a3
{
  id v5;
  LACOnenessSessionMonitor *v6;
  LACOnenessSessionMonitor *v7;
  uint64_t v8;
  LACOnenessSessionMonitoring *model;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LACOnenessSessionMonitor;
  v6 = -[LACOnenessSessionMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    -[LACOnenessSessionMonitor makeModel](v7, "makeModel");
    v8 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (LACOnenessSessionMonitoring *)v8;

  }
  return v7;
}

- (id)model
{
  return self->_model;
}

- (id)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (BOOL)isMonitoring
{
  return @objc LACOnenessSessionMonitor.isMonitoring.getter(self, (uint64_t)a2, (SEL *)&selRef_isMonitoring);
}

- (BOOL)isSessionActive
{
  return @objc LACOnenessSessionMonitor.isMonitoring.getter(self, (uint64_t)a2, (SEL *)&selRef_isSessionActive);
}

- (void)startMonitoring
{
  @objc LACOnenessSessionMonitor.start()(self, (uint64_t)a2, (SEL *)&selRef_startMonitoring);
}

- (void)stopMonitoring
{
  @objc LACOnenessSessionMonitor.start()(self, (uint64_t)a2, (SEL *)&selRef_stopMonitoring);
}

- (void)addObserver:(id)a3
{
  @objc LACOnenessSessionMonitor.add(_:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_addObserver_);
}

- (void)removeObserver:(id)a3
{
  @objc LACOnenessSessionMonitor.add(_:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeObserver_);
}

- (id)makeModel
{
  LACOnenessSessionMonitor *v2;
  id v3;

  v2 = self;
  v3 = LACOnenessSessionMonitor.makeModel()();

  return v3;
}

@end
