@implementation IDSServerBagNetworkLoader

- (IDSServerBagNetworkLoader)initWithConfig:(id)a3 queue:(id)a4 connectionMonitorBlock:(id)a5 URLSessionCreationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSServerBagNetworkLoader *v15;
  IDSServerBagNetworkLoader *v16;
  void *v17;
  id connectionMonitorBlock;
  void *v19;
  id URLSessionCreationBlock;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IDSServerBagNetworkLoader;
  v15 = -[IDSServerBagNetworkLoader init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_config, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_lock._os_unfair_lock_opaque = 0;
    v17 = _Block_copy(v13);
    connectionMonitorBlock = v16->_connectionMonitorBlock;
    v16->_connectionMonitorBlock = v17;

    v19 = _Block_copy(v14);
    URLSessionCreationBlock = v16->_URLSessionCreationBlock;
    v16->_URLSessionCreationBlock = v19;

  }
  return v16;
}

- (BOOL)isLoading
{
  IDSServerBagNetworkLoader *v2;
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  double v6;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend_loaderState(v2, v4, v5, v6) == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)loadBagIfPossibleWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_queue(self, v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19B9747EC;
    v9[3] = &unk_1E3C1C400;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v8, v9);

  }
}

- (BOOL)isServerAvailable
{
  IDSServerBagNetworkLoader *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = sub_19B974DA0((const os_unfair_lock *)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dealloc
{
  uint64_t v2;
  double v3;
  const char *v5;
  double v6;
  objc_super v7;

  objc_msgSend_clear(self->_connectionMonitor, a2, v2, v3);
  objc_msgSend_setDelegate_(self->_connectionMonitor, v5, 0, v6);
  v7.receiver = self;
  v7.super_class = (Class)IDSServerBagNetworkLoader;
  -[IDSServerBagNetworkLoader dealloc](&v7, sel_dealloc);
}

- (void)connectionMonitorDidUpdate:(id)a3
{
  double v3;
  int isImmediatelyReachable;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  int v22;
  const __CFString *v23;
  const char *v24;
  double v25;
  int v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  char v33;
  const char *v34;
  double v35;
  int v36;
  uint64_t v37;
  __int16 v38;
  IDSServerBagNetworkLoader *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  isImmediatelyReachable = objc_msgSend_isImmediatelyReachable(a3, a2, (uint64_t)a3, v3);
  os_unfair_lock_lock(&self->_lock);
  v9 = objc_msgSend_loaderState(self, v6, v7, v8);
  objc_msgSend_config(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logCategory(v13, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_opt_class();
    v22 = objc_msgSend_loaderState(self, v19, v20, v21);
    v23 = CFSTR("NO");
    v36 = 138413058;
    v37 = v18;
    v38 = 2048;
    if (isImmediatelyReachable)
      v23 = CFSTR("YES");
    v39 = self;
    v40 = 1024;
    v41 = v22;
    v42 = 2112;
    v43 = v23;
    _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_INFO, "<%@:%p> Received connectionMonitorDidUpdate {_loaderState: %d; isImmediatelyReachable: %@}",
      (uint8_t *)&v36,
      0x26u);
  }

  if (v9 == 2)
    v26 = isImmediatelyReachable;
  else
    v26 = 0;
  if (v26 == 1)
  {
    objc_msgSend_setLoaderState_(self, v24, 0, v25);
    objc_msgSend_storedCompletion(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend_loadBagIfPossibleWithCompletion_(self, v31, (uint64_t)v30, v32);

  }
  else
  {
    if (v9 == 1)
      v33 = isImmediatelyReachable;
    else
      v33 = 1;
    if ((v33 & 1) == 0)
    {
      objc_msgSend_setURLRequestSession_(self, v24, 0, v25);
      objc_msgSend_setLoaderState_(self, v34, 2, v35);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (id)connectionMonitorBlock
{
  return self->_connectionMonitorBlock;
}

- (void)setConnectionMonitorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)URLSessionCreationBlock
{
  return self->_URLSessionCreationBlock;
}

- (void)setURLSessionCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (IMConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_connectionMonitor, a3);
}

- (IMURLRequestSession)URLRequestSession
{
  return self->_URLRequestSession;
}

- (void)setURLRequestSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLRequestSession, a3);
}

- (unint64_t)loaderState
{
  return self->_loaderState;
}

- (void)setLoaderState:(unint64_t)a3
{
  self->_loaderState = a3;
}

- (id)storedCompletion
{
  return self->_storedCompletion;
}

- (void)setStoredCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storedCompletion, 0);
  objc_storeStrong((id *)&self->_URLRequestSession, 0);
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_URLSessionCreationBlock, 0);
  objc_storeStrong(&self->_connectionMonitorBlock, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
