@implementation CMFitnessMachine

- (CMFitnessMachine)init
{
  CMFitnessMachine *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMFitnessMachine;
  v2 = -[CMFitnessMachine init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMFitnessMachineInternal);
  return v2;
}

- (void)dealloc
{
  CMFitnessMachineInternal *internal;
  NSObject *fInternalQueue;
  objc_super v5;
  _QWORD block[5];

  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F44DBC0;
  block[3] = &unk_1E2955938;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMFitnessMachine;
  -[CMFitnessMachine dealloc](&v5, sel_dealloc);
}

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (void)feedFitnessMachineData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_1ECEDFB48 != -1)
    dispatch_once(&qword_1ECEDFB48, &unk_1E2954F08);
  if (qword_1ECEDFB40 == 3)
  {
    v7 = objc_msgSend__internal(self, a2, (uint64_t)a3, v3, v4);
    MEMORY[0x1E0DE7D20](v7, sel__feedFitnessMachineData_, a3, v8, v9);
  }
}

- (CMFitnessMachineInternal)_internal
{
  return self->_internal;
}

@end
