@implementation CMFitnessMachineInternal

- (CMFitnessMachineInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMFitnessMachineInternal;
  v2 = -[CMFitnessMachineInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMFitnessMachine", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMFitnessMachineInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMFitnessMachineInternal;
  -[CMFitnessMachineInternal dealloc](&v3, sel_dealloc);
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

- (void)_feedFitnessMachineData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *fInternalQueue;
  void *v9;
  const char *v10;
  _QWORD block[6];

  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMFitnessMachine.mm"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fitnessMachineData"));
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F44D670;
  block[3] = &unk_1E29559D0;
  block[4] = a3;
  block[5] = self;
  dispatch_async(fInternalQueue, block);
}

@end
