@implementation AVCaptureOutputInternal

- (AVCaptureOutputInternal)init
{
  char *v2;
  uint64_t v3;
  __int128 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureOutputInternal;
  v2 = -[AVCaptureOutputInternal init](&v6, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = dispatch_queue_create("capture.output.FigCaptureSessionSyncQueue", 0);
    *((_QWORD *)v2 + 5) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    *((_DWORD *)v2 + 12) = 0;
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v2 + 56) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v2 + 72) = v4;
    *(_OWORD *)(v2 + 88) = *(_OWORD *)(v3 + 32);
  }
  return (AVCaptureOutputInternal *)v2;
}

- (void)dealloc
{
  OpaqueFigCaptureSession *figCaptureSession;
  objc_super v4;

  figCaptureSession = self->figCaptureSession;
  if (figCaptureSession)
    CFRelease(figCaptureSession);

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureOutputInternal;
  -[AVCaptureOutputInternal dealloc](&v4, sel_dealloc);
}

@end
