@implementation HMDPowerManager

- (HMDPowerManager)init
{
  HMDPowerManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDPowerManager;
  v2 = -[HMDPowerManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.HMDPowerManager", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HMDPowerManager;
  -[HMDPowerManager dealloc](&v2, sel_dealloc);
}

- (void)setNetworkAccessRequired:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__HMDPowerManager_setNetworkAccessRequired___block_invoke;
  v4[3] = &unk_1E89C2758;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HMDPowerManager_start__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)stop
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__HMDPowerManager_stop__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  _BOOL4 networkInterfaceActive;
  unsigned int *p_powerAssertion;
  IOPMAssertionID v5;

  if (self->_started && self->_networkAccessRequired && isAppleTV())
    -[HMDPowerManager _ensureNetworkInterfaceMonitorStarted](self, "_ensureNetworkInterfaceMonitorStarted");
  else
    -[HMDPowerManager _ensureNetworkInterfaceMonitorStopped](self, "_ensureNetworkInterfaceMonitorStopped");
  networkInterfaceActive = self->_networkInterfaceActive;
  p_powerAssertion = &self->_powerAssertion;
  v5 = *p_powerAssertion;
  if (networkInterfaceActive)
  {
    if (v5)
      return;
    if (IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("HomeKit remote access"), 0, 0, 0, 0.0, 0, p_powerAssertion))
    {
      if (gLogCategory_HMDPowerManager <= 60
        && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
      {
LABEL_11:
        LogPrintF();
      }
    }
    else if (gLogCategory_HMDPowerManager <= 30
           && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_11;
    }
  }
  else if (v5)
  {
    IOPMAssertionRelease(v5);
    *p_powerAssertion = 0;
    if (gLogCategory_HMDPowerManager <= 30
      && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_11;
    }
  }
}

- (int)_ensureNetworkInterfaceMonitorStarted
{
  HMDPowerManager *v3;
  SCDynamicStoreRef v4;
  CFMutableArrayRef Mutable;
  __CFArray *v6;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  SCDynamicStoreContext context;

  memset(&context, 0, sizeof(context));
  if (self->_scStore)
  {
    LODWORD(v9) = 0;
    return v9;
  }
  v3 = self;
  v3->_scContext = v3;
  context.info = v3;
  v4 = SCDynamicStoreCreate(0, CFSTR("HomeKit:NetworkInterfaceMonitor"), (SCDynamicStoreCallBack)_handleNetworkInterfaceChanged, &context);
  if (v4)
  {
LABEL_3:
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (!Mutable)
    {
      v9 = 4294960568;
      if (!v4)
      {
LABEL_25:
        if (!(_DWORD)v9)
          return v9;
        goto LABEL_26;
      }
LABEL_24:
      CFRelease(v4);
      goto LABEL_25;
    }
    v6 = Mutable;
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B90]);
    if (!NetworkInterfaceEntity)
    {
      v9 = 4294960568;
      goto LABEL_23;
    }
    v8 = NetworkInterfaceEntity;
    CFArrayAppendValue(v6, NetworkInterfaceEntity);
    CFRelease(v8);
    if (!SCDynamicStoreSetNotificationKeys(v4, 0, v6))
    {
      if (!SCError())
        goto LABEL_19;
      v10 = SCError();
      if ((_DWORD)v10)
        goto LABEL_18;
    }
    if (SCDynamicStoreSetDispatchQueue(v4, (dispatch_queue_t)v3->_dispatchQueue))
      goto LABEL_7;
    if (SCError())
    {
      v10 = SCError();
      if (!(_DWORD)v10)
      {
LABEL_7:
        self->_scStore = v4;
        v3->_networkInterfaceActive = _isNetworkIntefaceActive();
        if (gLogCategory_HMDPowerManager <= 30
          && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v4 = 0;
        v9 = 0;
LABEL_23:
        CFRelease(v6);
        if (!v4)
          goto LABEL_25;
        goto LABEL_24;
      }
LABEL_18:
      v9 = v10;
      goto LABEL_23;
    }
LABEL_19:
    v9 = 4294960596;
    goto LABEL_23;
  }
  if (SCError())
  {
    v9 = SCError();
    if (!(_DWORD)v9)
      goto LABEL_3;
  }
  else
  {
    v9 = 4294960596;
  }
LABEL_26:
  if (gLogCategory_HMDPowerManager <= 60
    && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[HMDPowerManager _ensureNetworkInterfaceMonitorStopped](v3, "_ensureNetworkInterfaceMonitorStopped", v9);
  }
  else
  {
    -[HMDPowerManager _ensureNetworkInterfaceMonitorStopped](v3, "_ensureNetworkInterfaceMonitorStopped", v12);
  }
  return v9;
}

- (void)_ensureNetworkInterfaceMonitorStopped
{
  __SCDynamicStore *scStore;
  void *scContext;

  scStore = self->_scStore;
  if (scStore)
  {
    SCDynamicStoreSetDispatchQueue(scStore, 0);
    CFRelease(self->_scStore);
    self->_scStore = 0;
    if (gLogCategory_HMDPowerManager <= 30
      && (gLogCategory_HMDPowerManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  scContext = self->_scContext;
  if (scContext)
  {

    self->_scContext = 0;
  }
  self->_networkInterfaceActive = 0;
}

- (BOOL)isNetworkAccessRequired
{
  return self->_networkAccessRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

uint64_t __23__HMDPowerManager_stop__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __24__HMDPowerManager_start__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __44__HMDPowerManager_setNetworkAccessRequired___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 17))
  {
    *(_BYTE *)(v2 + 17) = v1;
    return objc_msgSend(*(id *)(result + 32), "_update");
  }
  return result;
}

@end
