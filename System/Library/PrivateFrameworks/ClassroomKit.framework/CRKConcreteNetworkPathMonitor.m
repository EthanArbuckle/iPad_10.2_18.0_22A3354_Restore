@implementation CRKConcreteNetworkPathMonitor

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteNetworkPathMonitor cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteNetworkPathMonitor;
  -[CRKConcreteNetworkPathMonitor dealloc](&v3, sel_dealloc);
}

- (CRKConcreteNetworkPathMonitor)initWithUnderlyingPathMonitor:(id)a3
{
  id v5;
  CRKConcreteNetworkPathMonitor *v6;
  CRKConcreteNetworkPathMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkPathMonitor;
  v6 = -[CRKConcreteNetworkPathMonitor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingPathMonitor, a3);

  return v7;
}

- (void)cancel
{
  NSObject *v2;

  -[CRKConcreteNetworkPathMonitor underlyingPathMonitor](self, "underlyingPathMonitor");
  v2 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_cancel(v2);

}

- (void)resume
{
  NSObject *underlyingPathMonitor;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  underlyingPathMonitor = self->_underlyingPathMonitor;
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  nw_path_monitor_set_queue(underlyingPathMonitor, v4);

  v6 = self->_underlyingPathMonitor;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __39__CRKConcreteNetworkPathMonitor_resume__block_invoke;
  v11 = &unk_24D9C89D8;
  objc_copyWeak(&v12, &location);
  nw_path_monitor_set_update_handler(v6, &v8);
  -[CRKConcreteNetworkPathMonitor underlyingPathMonitor](self, "underlyingPathMonitor", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__CRKConcreteNetworkPathMonitor_resume__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "updateWithPath:", v3);

}

- (void)updateWithPath:(id)a3
{
  id v4;
  CRKConcreteNetworkPath *v5;

  v4 = a3;
  v5 = -[CRKConcreteNetworkPath initWithUnderlyingPath:]([CRKConcreteNetworkPath alloc], "initWithUnderlyingPath:", v4);

  -[CRKConcreteNetworkPathMonitor setPath:](self, "setPath:", v5);
}

- (OS_nw_path_monitor)underlyingPathMonitor
{
  return self->_underlyingPathMonitor;
}

- (CRKConcreteNetworkPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_underlyingPathMonitor, 0);
}

@end
