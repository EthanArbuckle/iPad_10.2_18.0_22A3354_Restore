@implementation FigCameraViewfinder

- (FigCameraViewfinder)init
{
  FigCameraViewfinder *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCameraViewfinder;
  v2 = -[FigCameraViewfinder init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return (FigCameraViewfinder *)objc_alloc_init(FigCameraViewfinderRemote);
    }
    else
    {
      v2->_delegateStorage = objc_alloc_init(FigDelegateStorage);
    }
  }
  return v2;
}

- (void)setDelegateActiveViewfinderSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (FigCameraViewfinderDelegate)delegate
{
  return (FigCameraViewfinderDelegate *)-[FigDelegateStorage delegate](self->_delegateStorage, "delegate");
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  -[FigDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:", a3, a4);
}

+ (id)cameraViewfinder
{
  return +[FigCameraViewfinderRemote cameraViewfinder](FigCameraViewfinderRemote, "cameraViewfinder");
}

+ (BOOL)clientIsAllowedToUseCameraViewfinder:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return FigCaptureClientHasEntitlement(v5, CFSTR("com.apple.coremedia.cameraviewfinder"));
}

- (void)startWithOptions:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)stop
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
}

- (OS_dispatch_queue)queue
{
  return -[FigDelegateStorage delegateQueue](self->_delegateStorage, "delegateQueue");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinder;
  -[FigCameraViewfinder dealloc](&v3, sel_dealloc);
}

- (FigCameraViewfinderSession)delegateActiveViewfinderSession
{
  return self->_delegateActiveViewfinderSession;
}

@end
