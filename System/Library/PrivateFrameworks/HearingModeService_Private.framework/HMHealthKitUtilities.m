@implementation HMHealthKitUtilities

+ (id)sharedInstance
{
  if (sharedInstance_sOnce != -1)
    dispatch_once(&sharedInstance_sOnce, &__block_literal_global);
  return (id)sharedInstance_sSelf;
}

void __38__HMHealthKitUtilities_sharedInstance__block_invoke()
{
  HMHealthKitUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(HMHealthKitUtilities);
  v1 = (void *)sharedInstance_sSelf;
  sharedInstance_sSelf = (uint64_t)v0;

}

- (HMHealthKitUtilities)init
{
  HMHealthKitUtilities *v2;
  HMHealthKitUtilities *v3;
  HMHealthKitUtilities *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMHealthKitUtilities;
  v2 = -[HMHealthKitUtilities init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMHealthKitUtilities_activate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__HMHealthKitUtilities_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    if (gLogCategory_HMHealthKitUtilities <= 30
      && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMHealthKitUtilities_invalidate__block_invoke;
  block[3] = &unk_250EBAE60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__HMHealthKitUtilities_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  if (gLogCategory_HMHealthKitUtilities <= 30
    && (gLogCategory_HMHealthKitUtilities != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 0;
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
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
