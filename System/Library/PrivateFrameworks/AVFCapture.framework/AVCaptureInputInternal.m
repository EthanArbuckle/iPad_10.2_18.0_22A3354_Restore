@implementation AVCaptureInputInternal

- (AVCaptureInputInternal)init
{
  AVCaptureInputInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureInputInternal;
  v2 = -[AVCaptureInputInternal init](&v4, sel_init);
  if (v2)
    v2->figCaptureSessionSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("capture.input.FigCaptureSessionSyncQueue", 0);
  return v2;
}

- (void)dealloc
{
  OpaqueFigCaptureSession *figCaptureSession;
  objc_super v4;

  figCaptureSession = self->figCaptureSession;
  if (figCaptureSession)
    CFRelease(figCaptureSession);

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureInputInternal;
  -[AVCaptureInputInternal dealloc](&v4, sel_dealloc);
}

@end
