@implementation DPCDaemonClient

- (DPCDaemonClient)initWithDelegate:(id)a3
{
  id v4;
  DPCDaemonClient *v5;
  DPCDaemonClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCDaemonClient;
  v5 = -[DPCDaemonClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[DPCDaemonClient setCurrentWatchPresenceStatus:](v6, "setCurrentWatchPresenceStatus:", 1);
  }

  return v6;
}

- (void)informDelegateWithLatestEvent
{
  NSObject *v3;
  unint64_t v4;
  const char *v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[DPCDaemonClient currentWatchPresenceStatus](self, "currentWatchPresenceStatus");
    v5 = "Presence";
    if (v4 == 2)
      v5 = "Absence";
    v8 = 136315138;
    v9 = v5;
    _os_log_impl(&dword_21CCEF000, v3, OS_LOG_TYPE_INFO, "Notifying delegate with watch is %s", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "managerDidDetectEvent:", -[DPCDaemonClient currentWatchPresenceStatus](self, "currentWatchPresenceStatus"));

  }
}

- (void)informDelegateWithError:(unint64_t)a3
{
  DPCWatchPresenceDelegate **p_delegate;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (a3 >= 6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Undefined error (%ld)"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = *(&off_24E0C5340 + a3);
      }
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21CCEF000, v6, OS_LOG_TYPE_INFO, "Notifying delegate with the error is %@", buf, 0xCu);

    }
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "managerDidFindError:", a3);

  }
}

- (void)informDelegateWithWatchStatusEvent:(unint64_t)a3
{
  DPCWatchPresenceDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (a3 >= 6)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Undefined event (%ld)"), a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = *(&off_24E0C5370 + a3);
        }
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl(&dword_21CCEF000, v9, OS_LOG_TYPE_INFO, "Notifying delegate with the watch status event: %@", buf, 0xCu);

      }
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "managerDidDetectWatchStatusEvent:", a3);

    }
  }
}

- (void)newWatchPresenceEvent:(unint64_t)a3 probability:(float)a4
{
  double v6;

  -[DPCDaemonClient setCurrentWatchPresenceStatus:](self, "setCurrentWatchPresenceStatus:", a3);
  *(float *)&v6 = a4;
  -[DPCDaemonClient setCurrentProbablity:](self, "setCurrentProbablity:", v6);
  -[DPCDaemonClient informDelegateWithLatestEvent](self, "informDelegateWithLatestEvent");
}

- (void)newErrorDetected:(unint64_t)a3
{
  self->_currentError = a3;
  -[DPCDaemonClient informDelegateWithError:](self, "informDelegateWithError:");
}

- (DPCWatchPresenceDelegate)delegate
{
  return (DPCWatchPresenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)currentWatchPresenceStatus
{
  return self->_currentWatchPresenceStatus;
}

- (void)setCurrentWatchPresenceStatus:(unint64_t)a3
{
  self->_currentWatchPresenceStatus = a3;
}

- (float)currentProbablity
{
  return self->_currentProbablity;
}

- (void)setCurrentProbablity:(float)a3
{
  self->_currentProbablity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
