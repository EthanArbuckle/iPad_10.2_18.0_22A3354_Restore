@implementation ARControlListener

- (ARControlListener)initWithDelegate:(id)a3 daemonConfiguration:(id)a4
{
  id v6;
  id v7;
  ARControlListener *v8;
  ARControlListener *v9;
  uint64_t v10;
  OS_dispatch_queue *concurrentConnectionTargetQueue;
  void *v12;
  uint64_t v13;
  NSXPCListener *listener;
  uint64_t v15;
  OS_dispatch_queue *listenerQueue;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ARControlListener;
  v8 = -[ARControlListener init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v9->_controlClass = (Class)objc_msgSend(v7, "controlClass");
    ARCreateNonFixedPriorityConcurrentDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    concurrentConnectionTargetQueue = v9->_concurrentConnectionTargetQueue;
    v9->_concurrentConnectionTargetQueue = (OS_dispatch_queue *)v10;

    -[objc_class performSelector:](v9->_controlClass, "performSelector:", sel_serviceName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isInProcess") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v12);
    }
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v13;

    ARCreateNonFixedPriorityDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    listenerQueue = v9->_listenerQueue;
    v9->_listenerQueue = (OS_dispatch_queue *)v15;

    -[NSXPCListener _setQueue:](v9->_listener, "_setQueue:", v9->_listenerQueue);
    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    -[NSXPCListener resume](v9->_listener, "resume");

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ARControlListener;
  -[ARControlListener dealloc](&v3, sel_dealloc);
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  id WeakRetained;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  ARControlListener *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ARLogDaemon_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v8;
    v27 = 2048;
    v28 = self;
    _os_log_impl(&dword_235C46000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Listener received request for control", buf, 0x16u);

  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.arkit.daemonControlConnectionQueue.%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create_with_target_V2(v13, v14, (dispatch_queue_t)self->_concurrentConnectionTargetQueue);

  objc_msgSend(v5, "_setQueue:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(self->_controlClass), "initWithConnection:", v5);
  _ARLogDaemon_3();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_235C46000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Accepted connection for control.", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didDiscoverControl:", v16);

    objc_msgSend(v5, "resume");
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v23;
      v27 = 2048;
      v28 = self;
      _os_log_impl(&dword_235C46000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create control.", buf, 0x16u);

    }
  }

  return v16 != 0;
}

- (ARControlListenerDelegate)delegate
{
  return (ARControlListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_concurrentConnectionTargetQueue, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
