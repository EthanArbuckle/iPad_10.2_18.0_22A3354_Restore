@implementation HMEnrollmentService

- (HMEnrollmentService)initWithDeviceAddress:(id)a3
{
  id v5;
  HMEnrollmentService *v6;
  HMEnrollmentService *v7;
  HMEnrollmentService *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMEnrollmentService;
  v6 = -[HMEnrollmentService init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    objc_storeStrong((id *)&v7->_bluetoothDeviceAddress, a3);
    v8 = v7;
  }

  return v7;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__HMEnrollmentService_activate__block_invoke;
  block[3] = &unk_250EB83D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__HMEnrollmentService_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMEnrollmentService_invalidate__block_invoke;
  block[3] = &unk_250EB83D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HMEnrollmentService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceAddress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
