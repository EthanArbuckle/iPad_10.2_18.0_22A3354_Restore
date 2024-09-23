@implementation AVCaptureInput

- (void)setSession:(id)a3
{
  self->_inputInternal->session = (AVCaptureSession *)a3;
}

- (id)initSubclass
{
  AVCaptureInput *v2;
  AVCaptureInputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureInput;
  v2 = -[AVCaptureInput init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureInputInternal);
    v2->_inputInternal = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (id)session
{
  return self->_inputInternal->session;
}

uint64_t __44__AVCaptureInput_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v1 + 24))
    __44__AVCaptureInput_attachToFigCaptureSession___block_invoke_cold_1();
  v3 = *(const void **)(a1 + 40);
  *(_QWORD *)(v1 + 24) = v3;
  if (v3)
    CFRetain(v3);
  return objc_msgSend(*(id *)(a1 + 32), "attachSafelyToFigCaptureSession:", *(_QWORD *)(a1 + 40));
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AVCaptureInput_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureInput;
  -[AVCaptureInput dealloc](&v3, sel_dealloc);
}

- (NSArray)ports
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (OpaqueCMClock)clock
{
  return 0;
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(const void **)(v4 + 8);
  if (v3 != *(const void **)(v2[1] + 24))
    __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke_cold_1();
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v2 = *(_QWORD **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v2, "detachSafelyFromFigCaptureSession:", v5);
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  NSObject *figCaptureSessionSyncQueue;
  _QWORD v4[6];

  figCaptureSessionSyncQueue = self->_inputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVCaptureInput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E4216940;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __68__AVCaptureInput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)videoDevice
{
  return 0;
}

void __44__AVCaptureInput_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureInput attachToFigCaptureSession:]_block_invoke", "AVCaptureInput.m", 111, "_inputInternal->figCaptureSession == NULL");
}

void __46__AVCaptureInput_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureInput detachFromFigCaptureSession:]_block_invoke", "AVCaptureInput.m", 127, "figCaptureSession == _inputInternal->figCaptureSession");
}

@end
