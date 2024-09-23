@implementation CMHealthTrackerInternal

- (CMHealthTrackerInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMHealthTrackerInternal;
  v2 = -[CMHealthTrackerInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMHealthTracker.InternalQueue", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    *((_QWORD *)v2 + 3) = dispatch_queue_create("com.apple.CoreMotion.CMHealthTracker.AppQueue", 0);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMHealthTrackerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  dispatch_release((dispatch_object_t)self->fAppQueue);
  self->fAppQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHealthTrackerInternal;
  -[CMHealthTrackerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  NSObject *fInternalQueue;
  _QWORD v6[8];

  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F40C538;
  v6[3] = &unk_1E2957328;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F40CC4C;
  block[3] = &unk_1E2955C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

@end
