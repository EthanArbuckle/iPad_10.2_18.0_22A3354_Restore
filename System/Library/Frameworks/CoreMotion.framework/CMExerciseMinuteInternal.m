@implementation CMExerciseMinuteInternal

- (CMExerciseMinuteInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMExerciseMinuteInternal;
  v2 = -[CMExerciseMinuteInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMExerciseMinute.InternalQueue", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    *((_QWORD *)v2 + 3) = dispatch_queue_create("com.apple.CoreMotion.CMExerciseMinute.AppQueue", 0);
    *((_QWORD *)v2 + 6) = 0;
    *((_BYTE *)v2 + 32) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMExerciseMinuteInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  dispatch_release((dispatch_object_t)self->fAppQueue);
  self->fAppQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMExerciseMinuteInternal;
  -[CMExerciseMinuteInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;
  void *__p;
  char v5;

  self->fHandler = 0;
  self->fMostRecentRecord = 0;
  sub_18F270374(&__p, "kCLConnectionMessageExerciseMinuteUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p);
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend__queryExerciseMinutesFromRecord_handler_(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  objc_msgSend__startUpdatesWithHandler_(self, v8, (uint64_t)a4, v9, v10);

  self->fMostRecentRecord = 0;
  self->fMostRecentRecord = (CMExerciseMinuteData *)a3;
}

- (void)_stopUpdates
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3D91CC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_startUpdatesWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3D9560;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3D9C84;
  block[3] = &unk_1E2955C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

@end
