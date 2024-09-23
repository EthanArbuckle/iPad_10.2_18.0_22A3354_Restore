@implementation CCUIConnectivitySatelliteMonitor

- (CCUIConnectivitySatelliteMonitor)initWithQueue:(id)a3
{
  id v5;
  CCUIConnectivitySatelliteMonitor *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CoreTelephonyClient *client;
  id v11;
  const char *v12;
  uint64_t v13;
  CTStewieStateMonitor *stewieStateMonitor;
  id v15;
  const char *v16;
  uint64_t v17;
  IDSOffGridStateManager *offGridStateManager;
  const char *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CCUIConnectivitySatelliteMonitor;
  v6 = -[CCUIConnectivitySatelliteMonitor init](&v21, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDC2810]);
    v9 = objc_msgSend_initWithQueue_(v7, v8, (uint64_t)v5);
    client = v6->_client;
    v6->_client = (CoreTelephonyClient *)v9;

    objc_storeStrong((id *)&v6->_queue, a3);
    v11 = objc_alloc(MEMORY[0x24BDC27D0]);
    v13 = objc_msgSend_initWithDelegate_queue_(v11, v12, (uint64_t)v6, v5);
    stewieStateMonitor = v6->_stewieStateMonitor;
    v6->_stewieStateMonitor = (CTStewieStateMonitor *)v13;

    v15 = objc_alloc(MEMORY[0x24BE4FC60]);
    v17 = objc_msgSend_initWithQueue_error_(v15, v16, (uint64_t)v5, 0);
    offGridStateManager = v6->_offGridStateManager;
    v6->_offGridStateManager = (IDSOffGridStateManager *)v17;

    objc_msgSend_setDelegate_(v6->_offGridStateManager, v19, (uint64_t)v6);
    *(_OWORD *)&v6->_offGridMode = xmmword_230FB5200;
  }

  return v6;
}

- (BOOL)canShowDemo
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getState(self->_stewieStateMonitor, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__satelliteServices(self, v5, v6);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        v14 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i), v9, v10, (_QWORD)v17);
        if ((objc_msgSend_isDemoAllowedForService_(v4, v15, v14) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v17, v21, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)start
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_start(self->_stewieStateMonitor, a2, v2);
  objc_msgSend__reevaluateState(self, v4, v5);
}

- (void)turnOff
{
  id v3;
  const char *v4;
  const char *v5;
  IDSOffGridStateManager *offGridStateManager;
  const char *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x24BE4FC58]);
  objc_msgSend_setEntryPointSource_(v3, v4, (uint64_t)CFSTR("ControlCenter"));
  objc_msgSend_setWaitingForOffGridModeToDisableBeforeDisconnecting_(self, v5, 1);
  offGridStateManager = self->_offGridStateManager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_230FB27C0;
  v8[3] = &unk_24FFCAD90;
  objc_copyWeak(&v9, &location);
  objc_msgSend_setOffGridMode_options_completion_(offGridStateManager, v7, 1, v3, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

- (void)disconnectFromSatellite
{
  const char *v3;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230FB2944;
  v4[3] = &unk_24FFCADE0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend__disconnectFromSatelliteWithCompletion_(self, v3, (uint64_t)v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_disconnectFromSatelliteWithCompletion:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDC27C0]);
  objc_msgSend_setReason_(v5, v6, 1);
  objc_msgSend_client(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_230FB2AE0;
  v12[3] = &unk_24FFCAE08;
  v13 = v4;
  v10 = v4;
  objc_msgSend_exitStewieWithContext_completion_(v9, v11, (uint64_t)v5, v12);

}

- (id)_satelliteServices
{
  return &unk_24FFD1560;
}

- (BOOL)isSupported
{
  CoreTelephonyClient *client;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v9;

  client = self->_client;
  v9 = 0;
  objc_msgSend_getStewieSupport_(client, a2, (uint64_t)&v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v9)
    v7 = 0;
  else
    v7 = objc_msgSend_hwSupport(v3, v4, v5);

  return v7;
}

- (BOOL)isAnyServiceSupported
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getState(self->_stewieStateMonitor, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__satelliteServices(self, v5, v6);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v24, v28, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v16 = objc_msgSend_integerValue(v15, v10, v11, (_QWORD)v24);
        if ((objc_msgSend_isAllowedService_(v4, v17, v16) & 1) == 0)
        {
          v20 = objc_msgSend_integerValue(v15, v18, v19);
          if ((objc_msgSend_isDemoAllowedForService_(v4, v21, v20) & 1) == 0)
            continue;
        }
        v22 = 1;
        goto LABEL_13;
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v24, v28, 16);
      v22 = 0;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_13:

  return v22;
}

- (void)notifyDelegateOfStateChange:(unint64_t)a3
{
  const char *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend_satelliteMonitor_didChangeState_(WeakRetained, v5, (uint64_t)self, a3);

}

- (void)stateChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FB2D48;
  block[3] = &unk_24FFCA830;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_reevaluateState
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__calculateState(self, a2, v2);
  if (v4 != self->_state)
  {
    v5 = v4;
    v6 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v5;
      _os_log_impl(&dword_230FA3000, v6, OS_LOG_TYPE_DEFAULT, "[Satellite] State changed to %lu", buf, 0xCu);
    }
    self->_state = v5;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_230FB2E50;
    v7[3] = &unk_24FFCAE30;
    v7[4] = self;
    v7[5] = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
  }
}

- (unint64_t)_calculateState
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  unsigned __int8 isMessagingServiceAvailable;
  const char *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t offGridMode;
  unsigned __int8 v17;
  unsigned __int8 v18;

  if (objc_msgSend_isAnyServiceSupported(self, a2, v2))
  {
    objc_msgSend_getState(self->_stewieStateMonitor, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_displayStewieInStatusBar(v6, v7, v8))
    {
      isMessagingServiceAvailable = objc_msgSend_isMessagingServiceAvailable(self, v9, v10);
      if ((objc_msgSend_isStewieActiveOverBB(v6, v12, v13) & 1) == 0)
      {
        if (((self->_offGridMode == 2) & isMessagingServiceAvailable) != 0)
          v14 = 3;
        else
          v14 = 2;
        goto LABEL_11;
      }
      if (!self->_offGridModePublishStatus)
      {
        offGridMode = self->_offGridMode;
        if (offGridMode == 2)
          v17 = isMessagingServiceAvailable;
        else
          v17 = 0;
        if ((v17 & 1) != 0)
        {
          v14 = 4;
          goto LABEL_11;
        }
        if (offGridMode == 1)
          v18 = isMessagingServiceAvailable;
        else
          v18 = 0;
        if ((v18 & 1) != 0)
        {
          v14 = 6;
          goto LABEL_11;
        }
      }
      v14 = 5;
    }
    else
    {
      v14 = 1;
    }
LABEL_11:

    return v14;
  }
  return 0;
}

- (BOOL)_shouldShowDisableOffGridModeButton
{
  uint64_t v2;

  if (self->_offGridMode == 2)
    return objc_msgSend_isMessagingServiceAvailable(self, a2, v2);
  else
    return 0;
}

- (BOOL)isMessagingServiceAvailable
{
  uint64_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  char isActiveService;

  objc_msgSend_getState(self->_stewieStateMonitor, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isAllowedService_(v3, v4, 16) & 1) != 0
    || (objc_msgSend_isAllowedService_(v3, v5, 32) & 1) != 0
    || (objc_msgSend_isActiveService_(v3, v6, 16) & 1) != 0)
  {
    isActiveService = 1;
  }
  else
  {
    isActiveService = objc_msgSend_isActiveService_(v3, v7, 32);
  }

  return isActiveService;
}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  MEMORY[0x24BEDD108](self, sel__manager_offGridModeUpdated_publishStatus_context_, a3);
}

- (void)_manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FB303C;
  block[3] = &unk_24FFCAE58;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v10 = objc_msgSend_waitingForOffGridModeToDisableBeforeDisconnecting(self, v8, v9);
  if (a5 == 1)
  {
    if (v10)
      objc_msgSend_disconnectFromSatellite(self, v11, v12);
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CCUIConnectivitySatelliteMonitorDelegate)delegate
{
  return (CCUIConnectivitySatelliteMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void)setStewieStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_stewieStateMonitor, a3);
}

- (IDSOffGridStateManager)offGridStateManager
{
  return self->_offGridStateManager;
}

- (void)setOffGridStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_offGridStateManager, a3);
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (int64_t)offGridMode
{
  return self->_offGridMode;
}

- (void)setOffGridMode:(int64_t)a3
{
  self->_offGridMode = a3;
}

- (int64_t)offGridModePublishStatus
{
  return self->_offGridModePublishStatus;
}

- (void)setOffGridModePublishStatus:(int64_t)a3
{
  self->_offGridModePublishStatus = a3;
}

- (BOOL)waitingForOffGridModeToDisableBeforeDisconnecting
{
  return self->_waitingForOffGridModeToDisableBeforeDisconnecting;
}

- (void)setWaitingForOffGridModeToDisableBeforeDisconnecting:(BOOL)a3
{
  self->_waitingForOffGridModeToDisableBeforeDisconnecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridStateManager, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
