@implementation CMPedestrianFenceManagerInternal

- (CMPedestrianFenceManagerInternal)init
{
  CMPedestrianFenceManagerInternal *v2;
  CMPedestrianFenceManagerInternal *v3;
  uint64_t v4;
  void *__p[2];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMPedestrianFenceManagerInternal;
  v2 = -[CMPedestrianFenceManagerInternal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->fFenceHandler = 0;
    v2->fStatusHandler = 0;
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPedestrianFenceManagerPrivateQueue", 0);
    v4 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, __p, v3->fPrivateQueue);
    v3->fLocationdConnection = (void *)v4;
    if (v7 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start((CLConnectionClient *)v3->fLocationdConnection);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  self->fFenceHandler = 0;
  self->fStatusHandler = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)CMPedestrianFenceManagerInternal;
  -[CMPedestrianFenceManagerInternal dealloc](&v4, sel_dealloc);
}

- (void)_setInSession:(BOOL)a3 withStatusHandler:(id)a4
{
  NSObject *fPrivateQueue;
  _QWORD block[6];
  BOOL v6;

  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F482CB8;
  block[3] = &unk_1E2958AE8;
  v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(fPrivateQueue, block);
}

- (void)_setFence:(id)a3 withRadius:(id)a4 wake:(BOOL)a5 delay:(id)a6 withCompletion:(id)a7
{
  NSObject *fPrivateQueue;
  _QWORD v8[9];
  BOOL v9;

  fPrivateQueue = self->fPrivateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F483040;
  v8[3] = &unk_1E2958B10;
  v8[7] = a6;
  v8[8] = a7;
  v8[4] = self;
  v8[5] = a3;
  v9 = a5;
  v8[6] = a4;
  dispatch_async(fPrivateQueue, v8);
}

- (void)_clearFence:(id)a3 force:(BOOL)a4
{
  NSObject *fPrivateQueue;
  _QWORD block[6];
  BOOL v6;

  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F483684;
  block[3] = &unk_1E29580D8;
  v6 = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_async(fPrivateQueue, block);
}

@end
