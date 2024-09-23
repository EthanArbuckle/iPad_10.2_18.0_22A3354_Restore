@implementation FCMultiNetworkBehaviorMonitor

- (void)addMonitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCMultiNetworkBehaviorMonitor multiDelegate](self, "multiDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addDelegate:", v4);

}

- (void)logNetworkEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCMultiNetworkBehaviorMonitor multiDelegate](self, "multiDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logNetworkEvent:", v4);

}

- (NFMultiDelegate)multiDelegate
{
  return self->_multiDelegate;
}

- (FCMultiNetworkBehaviorMonitor)init
{
  FCMultiNetworkBehaviorMonitor *v2;
  uint64_t v3;
  NFMultiDelegate *multiDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCMultiNetworkBehaviorMonitor;
  v2 = -[FCMultiNetworkBehaviorMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD8]), "initWithDelegate:delegateProtocol:options:", 0, &unk_1EE66EB90, 1);
    multiDelegate = v2->_multiDelegate;
    v2->_multiDelegate = (NFMultiDelegate *)v3;

  }
  return v2;
}

- (void)removeMonitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCMultiNetworkBehaviorMonitor multiDelegate](self, "multiDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeDelegate:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiDelegate, 0);
}

@end
