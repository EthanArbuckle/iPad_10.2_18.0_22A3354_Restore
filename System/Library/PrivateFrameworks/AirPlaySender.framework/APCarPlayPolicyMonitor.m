@implementation APCarPlayPolicyMonitor

- (APCarPlayPolicyMonitor)initWithEndpoint:(OpaqueFigEndpoint *)a3
{
  APCarPlayPolicyMonitor *v4;
  NSObject *queue;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APCarPlayPolicyMonitor;
  v4 = -[APCarPlayPolicyMonitor init](&v8, sel_init);
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.APCarPlayPolicyMonitor", 0);
    v4->_weakEndpoint = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v4->_observedEndpoint = a3;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    queue = v4->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__APCarPlayPolicyMonitor_initWithEndpoint___block_invoke;
    block[3] = &unk_1E826FC18;
    block[4] = v4;
    dispatch_sync(queue, block);
  }
  return v4;
}

uint64_t __43__APCarPlayPolicyMonitor_initWithEndpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endpointAuthenticationSucceeded");
}

- (void)dealloc
{
  CRVehiclePolicyMonitor *monitor;
  OpaqueFigCFWeakReferenceHolder *weakEndpoint;
  NSObject *queue;
  objc_super v6;

  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListener();
  monitor = self->_monitor;
  if (monitor)
  {
    -[CRVehiclePolicyMonitor stopMonitoring](monitor, "stopMonitoring");
    -[CRVehiclePolicyMonitor setDelegate:](self->_monitor, "setDelegate:", 0);

    self->_monitor = 0;
  }
  weakEndpoint = self->_weakEndpoint;
  if (weakEndpoint)
  {
    CFRelease(weakEndpoint);
    self->_weakEndpoint = 0;
  }
  self->_observedEndpoint = 0;
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)APCarPlayPolicyMonitor;
  -[APCarPlayPolicyMonitor dealloc](&v6, sel_dealloc);
}

- (void)endpointAuthenticationSucceeded
{
  uint64_t v3;
  const void *v4;
  uint64_t CMBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, uint64_t *);
  id v7;
  CRVehiclePolicyMonitor *v8;
  uint64_t v9;

  v9 = 0;
  if (!self->_monitor)
  {
    v3 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v3)
    {
      v4 = (const void *)v3;
      CMBaseObject = FigEndpointGetCMBaseObject();
      v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
      if (v6)
      {
        if (!v6(CMBaseObject, *MEMORY[0x1E0CA4118], *MEMORY[0x1E0C9AE00], &v9))
        {
          v7 = objc_alloc(getCRVehiclePolicyMonitorClass());
          v8 = (CRVehiclePolicyMonitor *)objc_msgSend(v7, "initWithVehicleCertificateSerial:", v9);
          self->_monitor = v8;
          if (v8)
          {
            -[CRVehiclePolicyMonitor setDelegate:](v8, "setDelegate:", self);
            -[CRVehiclePolicyMonitor startMonitoring](self->_monitor, "startMonitoring");
            if (gLogCategory_APCarPlayPolicyMonitor <= 40
              && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
          }
        }
      }
      CFRelease(v4);
    }
  }
}

- (void)willDisableVehicleTrackedByMonitor:(id)a3
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  unsigned int (*v7)(const void *, _QWORD, void (*)(int, int, int, int, dispatch_semaphore_t), NSObject *);
  dispatch_time_t v8;

  if (gLogCategory_APCarPlayPolicyMonitor <= 40
    && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    if (gLogCategory_APCarPlayPolicyMonitor <= 50
      && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = dispatch_semaphore_create(0);
    dispatch_retain(v6);
    -[APCarPlayPolicyMonitorDelegate setEndpoint:isAllowed:](self->_delegate, "setEndpoint:isAllowed:", v5, 0);
    v7 = *(unsigned int (**)(const void *, _QWORD, void (*)(int, int, int, int, dispatch_semaphore_t), NSObject *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (!v7 || v7(v5, 0, policyMonitorEndpointDeactivated, v6))
    {
      dispatch_release(v6);
    }
    else
    {
      v8 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v8);
      if (gLogCategory_APCarPlayPolicyMonitor <= 50
        && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    CFRelease(v5);
    if (v6)
      dispatch_release(v6);
  }
}

- (void)willEnableVehicleTrackedByMonitor:(id)a3
{
  uint64_t v4;
  const void *v5;

  if (gLogCategory_APCarPlayPolicyMonitor <= 40
    && (gLogCategory_APCarPlayPolicyMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = (const void *)v4;
    -[APCarPlayPolicyMonitorDelegate setEndpoint:isAllowed:](self->_delegate, "setEndpoint:isAllowed:", v4, 1);
    CFRelease(v5);
  }
}

- (APCarPlayPolicyMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (APCarPlayPolicyMonitorDelegate *)a3;
}

@end
