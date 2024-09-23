@implementation IMNetworkConnectionMonitor

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  objc_super v20;

  if (_IMWillLog(CFSTR("IMConnectionMonitor")))
    _IMAlwaysLog(0, CFSTR("IMConnectionMonitor"), CFSTR("-[%@ dealloc]"), v5, v6, v7, v8, v9, (char)self);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, 0, 0);

  objc_msgSend_sharedInstance(IMSystemMonitor, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__removeEarlyListener_(v15, v16, (uint64_t)self, v17);

  objc_msgSend__clearReachability_flags_(self, v18, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
  objc_msgSend__clearReachability_flags_(self, v19, (uint64_t)&self->_hostReachability, (uint64_t)&self->_hostFlags);
  v20.receiver = self;
  v20.super_class = (Class)IMNetworkConnectionMonitor;
  -[IMNetworkConnectionMonitor dealloc](&v20, sel_dealloc);
}

- (void)_clearReachability:(id *)a3 flags:(unint64_t *)a4
{
  id v6;

  objc_msgSend_setDelegate_(*a3, a2, 0, (uint64_t)a4);
  v6 = *a3;
  *a3 = 0;

  *a4 = 0;
}

- (void)_doCallbackNow
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  IMNetworkConnectionMonitor *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ _doCallbackNow]", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend_cancelPendingExecutions(self->_performCallbackTask, v4, v5, v6);
  objc_msgSend_delegate(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectionMonitorDidUpdate_(v10, v11, (uint64_t)self, v12);

}

- (void)_doCallbackLater
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  IMNetworkConnectionMonitor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ _doCallbackLater]", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_cancelPendingExecutions(self->_performCallbackTask, v4, v5, v6);
  objc_msgSend_enqueueExecutionWithTarget_afterDelay_(self->_performCallbackTask, v7, (uint64_t)self, v8, 0.001);
}

- (void)_setupReachability
{
  IMReachability **p_hostReachability;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IMReachability *v11;
  const char *v12;
  uint64_t v13;
  IMReachability *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  p_hostReachability = &self->_hostReachability;
  objc_msgSend__clearReachability_flags_(self, a2, (uint64_t)&self->_hostReachability, (uint64_t)&self->_hostFlags);
  objc_msgSend_remoteHost(self, v4, v5, v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v18, v7, v8, v9);
  v11 = [IMReachability alloc];
  if (v10)
    v13 = objc_msgSend_initWithRemoteHost_delegate_(v11, v12, (uint64_t)v18, (uint64_t)self);
  else
    v13 = objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v11, v12, 0, 0, self);
  v14 = *p_hostReachability;
  *p_hostReachability = (IMReachability *)v13;

  self->_isConnected = 1;
  objc_msgSend_goDisconnected(self, v15, v16, v17);

}

- (void)reachabilityDidChange:(id)a3
{
  IMReachability *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *p_hostFlags;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  IMNetworkConnectionMonitor *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (IMReachability *)a3;
  v8 = objc_msgSend_flags(v4, v5, v6, v7);
  v9 = v8;
  if (self->_hostReachability == v4)
  {
    p_hostFlags = &self->_hostFlags;
    if (self->_hostFlags != v8)
    {
      OSLogHandleForIDSCategory("IMConnectionMonitor");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *p_hostFlags;
        v17 = 138412802;
        v18 = self;
        v19 = 1024;
        v20 = v13;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "-[%@ reachabilityDidChange:].  _hostFlags: 0x%06x -> 0x%06x", (uint8_t *)&v17, 0x18u);
      }
      goto LABEL_10;
    }
  }
  if (self->_ipReachability == v4)
  {
    p_hostFlags = &self->_ipFlags;
    if (self->_ipFlags != v8)
    {
      OSLogHandleForIDSCategory("IMConnectionMonitor");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_hostFlags;
        v17 = 138412802;
        v18 = self;
        v19 = 1024;
        v20 = v12;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "-[%@ reachabilityDidChange:].  _ipFlags: 0x%06x -> 0x%06x", (uint8_t *)&v17, 0x18u);
      }
LABEL_10:

      *p_hostFlags = v9;
      objc_msgSend__doCallbackLater(self, v14, v15, v16);
    }
  }

}

- (void)systemWillSleep
{
  NSObject *v3;
  _BOOL4 isSleeping;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  IMNetworkConnectionMonitor *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isSleeping = self->_isSleeping;
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    v11 = isSleeping;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ systemWillSleep].  _isSleeping: %d -> 1", (uint8_t *)&v8, 0x12u);
  }

  if (!self->_isSleeping)
  {
    self->_isSleeping = 1;
    objc_msgSend__doCallbackNow(self, v5, v6, v7);
  }
}

- (void)systemDidWake
{
  NSObject *v3;
  _BOOL4 isSleeping;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  IMNetworkConnectionMonitor *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isSleeping = self->_isSleeping;
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    v11 = isSleeping;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ systemDidWake].  _isSleeping: %d -> 0", (uint8_t *)&v8, 0x12u);
  }

  if (self->_isSleeping)
  {
    self->_isSleeping = 0;
    objc_msgSend__doCallbackLater(self, v5, v6, v7);
  }
}

- (void)_networkManagedUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  IMNetworkConnectionMonitor *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "-[%@ _networkManagedUpdated].", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend__doCallbackLater(self, v6, v7, v8);
}

- (void)_setup
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  id v17;
  void *v18;
  const char *v19;
  CUTDeferredTaskQueue *v20;
  CUTDeferredTaskQueue *performCallbackTask;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend_sharedInstance(IMSystemMonitor, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addEarlyListener_(v5, v6, (uint64_t)self, v7);

  v11 = (id)objc_msgSend_sharedInstance(IMMobileNetworkManager, v8, v9, v10);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, (uint64_t)sel__networkManagedUpdated_, CFSTR("__kIMMobileNetworkManagerDataStatusChangedNotification"), 0);

  v17 = objc_alloc(MEMORY[0x1E0D13200]);
  im_primary_queue();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (CUTDeferredTaskQueue *)objc_msgSend_initWithCapacity_queue_block_(v17, v19, 1, (uint64_t)v18, &unk_1E2C42D68);
  performCallbackTask = self->_performCallbackTask;
  self->_performCallbackTask = v20;

  MEMORY[0x1E0DE7D20](self, sel__setupReachability, v22, v23);
}

- (void)goConnectedWithLocalSocketAddress:(id)a3 remoteSocketAddress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 isConnected;
  const char *v10;
  IMReachability *v11;
  const char *v12;
  IMReachability *v13;
  IMReachability *ipReachability;
  int v15;
  IMNetworkConnectionMonitor *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    isConnected = self->_isConnected;
    v15 = 138413058;
    v16 = self;
    v17 = 1024;
    v18 = isConnected;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "-[%@ goConnectedWithLocalSocketAddress]._isConnected: %d -> 1\n    localSocketAddress: %@\n    remoteSocketAddress: %@", (uint8_t *)&v15, 0x26u);
  }

  if (!self->_isConnected)
  {
    self->_isConnected = 1;
    objc_msgSend__clearReachability_flags_(self, v10, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
    v11 = [IMReachability alloc];
    v13 = (IMReachability *)objc_msgSend_initWithLocalSocketAddress_remoteSocketAddress_delegate_(v11, v12, (uint64_t)v6, (uint64_t)v7, self);
    ipReachability = self->_ipReachability;
    self->_ipReachability = v13;

  }
}

- (void)goDisconnected
{
  NSObject *v3;
  _BOOL4 isConnected;
  const char *v5;
  int v6;
  IMNetworkConnectionMonitor *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("IMConnectionMonitor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    isConnected = self->_isConnected;
    v6 = 138412546;
    v7 = self;
    v8 = 1024;
    v9 = isConnected;
    _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ goDisconnected].  _isConnected: %d -> 0", (uint8_t *)&v6, 0x12u);
  }

  if (self->_isConnected)
  {
    self->_isConnected = 0;
    objc_msgSend__clearReachability_flags_(self, v5, (uint64_t)&self->_ipReachability, (uint64_t)&self->_ipFlags);
  }
}

- (void)clear
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  id v7;

  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E0DE7910], a2, (uint64_t)self, (uint64_t)sel__doCallbackNow, 0);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v7, v6, (uint64_t)self, 0, 0);

}

- (BOOL)isImmediatelyReachable
{
  IMNetworkConnectionMonitor *v2;
  unint64_t hostFlags;
  unint64_t ipFlags;
  int v5;
  IMReachability *ipReachability;
  _BOOL4 v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  _BOOL4 isSleeping;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  IMReachability *hostReachability;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  unint64_t v24;
  _BOOL4 v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  int v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v2 = self;
  v46 = *MEMORY[0x1E0C80C00];
  hostFlags = self->_hostFlags;
  ipFlags = self->_ipFlags;
  if ((hostFlags & 2) != 0)
  {
    ipReachability = self->_ipReachability;
    if (ipReachability)
      v5 = (ipFlags >> 1) & 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
    ipReachability = self->_ipReachability;
  }
  v8 = (self->_hostFlags & 0x24) == 4 || (self->_ipFlags & 0x24) == 4;
  if (ipReachability)
  {
    OSLogHandleForIDSCategory("IMConnectionMonitor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v2->_hostFlags;
      v11 = v2->_ipFlags;
      isSleeping = v2->_isSleeping;
      v32 = 138413826;
      v33 = v2;
      v34 = 1024;
      v35 = v5;
      v36 = 1024;
      v37 = v10;
      v38 = 1024;
      v39 = v11;
      v40 = 1024;
      v41 = isSleeping;
      v42 = 1024;
      v43 = v8;
      v44 = 1024;
      v45 = (ipFlags >> 5) & 1;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ isImmediatelyReachable] = %d.  Host:0x%06x IP:0x%06x Sleeping:%d ConnectionRequired:%d OnDemand:%d", (uint8_t *)&v32, 0x30u);
    }
  }
  else
  {
    OSLogHandleForIDSCategory("IMConnectionMonitor");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v2->_hostFlags;
      v25 = v2->_isSleeping;
      v32 = 138413570;
      v33 = v2;
      v34 = 1024;
      v35 = v5;
      v36 = 1024;
      v37 = v24;
      v38 = 1024;
      v39 = v25;
      v40 = 1024;
      v41 = v8;
      v42 = 1024;
      v43 = (hostFlags >> 5) & 1;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ isImmediatelyReachable] = %d.  Host:0x%06x IP:nil Sleeping:%d ConnectionRequired:%d OnDemand:%d", (uint8_t *)&v32, 0x2Au);
    }
  }

  if (!v5)
  {
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  v16 = v2->_hostFlags;
  if (v2->_ipReachability && (v2->_ipFlags & 0x40000) != 0)
  {
    objc_msgSend_sharedInstance(IMMobileNetworkManager, v13, v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend_isDataConnectionActive(v26, v27, v28, v29);

    OSLogHandleForIDSCategory("IMConnectionMonitor");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v30 = CFSTR("NO");
      if ((_DWORD)v2)
        v30 = CFSTR("YES");
      v32 = 138412290;
      v33 = (void *)v30;
      _os_log_impl(&dword_19066D000, v22, OS_LOG_TYPE_DEFAULT, "  => We're on WWAN for ip reachability, checking data active: %@", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_24;
  }
  hostReachability = v2->_hostReachability;
  LOBYTE(v2) = 1;
  if (hostReachability && (v16 & 0x40000) != 0)
  {
    objc_msgSend_sharedInstance(IMMobileNetworkManager, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v2) = objc_msgSend_isDataConnectionActive(v18, v19, v20, v21);

    OSLogHandleForIDSCategory("IMConnectionMonitor");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = CFSTR("NO");
      if ((_DWORD)v2)
        v23 = CFSTR("YES");
      v32 = 138412290;
      v33 = (void *)v23;
      _os_log_impl(&dword_19066D000, v22, OS_LOG_TYPE_DEFAULT, "  => We're on WWAN for host reachability, checking data active: %@", (uint8_t *)&v32, 0xCu);
    }
LABEL_24:

  }
  return (char)v2;
}

- (IMReachability)_hostReachability
{
  return self->_hostReachability;
}

- (void)set_hostReachability:(id)a3
{
  objc_storeStrong((id *)&self->_hostReachability, a3);
}

- (IMReachability)_ipReachability
{
  return self->_ipReachability;
}

- (void)set_ipReachability:(id)a3
{
  objc_storeStrong((id *)&self->_ipReachability, a3);
}

- (unint64_t)_hostFlags
{
  return self->_hostFlags;
}

- (void)set_hostFlags:(unint64_t)a3
{
  self->_hostFlags = a3;
}

- (unint64_t)_ipFlags
{
  return self->_ipFlags;
}

- (void)set_ipFlags:(unint64_t)a3
{
  self->_ipFlags = a3;
}

- (BOOL)_isConnected
{
  return self->_isConnected;
}

- (void)set_isConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)_isSleeping
{
  return self->_isSleeping;
}

- (void)set_isSleeping:(BOOL)a3
{
  self->_isSleeping = a3;
}

- (CUTDeferredTaskQueue)performCallbackTask
{
  return self->_performCallbackTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performCallbackTask, 0);
  objc_storeStrong((id *)&self->_ipReachability, 0);
  objc_storeStrong((id *)&self->_hostReachability, 0);
}

@end
