@implementation CMCaptureFrameSenderEndpointObserver

- (CMCaptureFrameSenderEndpointObserver)initWithEndpointsChangedHandler:(id)a3
{
  CMCaptureFrameSenderEndpointObserver *v4;
  NSObject *v5;
  NSDictionary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMCaptureFrameSenderEndpointObserver;
  v4 = -[CMCaptureFrameSenderEndpointObserver init](&v8, sel_init);
  if (v4)
  {
    v4->_endpointsChangedHandler = (id)objc_msgSend(a3, "copy");
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_frameSenderEndpointsChangedNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cmio.frame-sender-endpoint-observer", v5);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__handleFrameServerEndpointsChangedNotification_, CFSTR("FrameServerEndpointsChanged"), 0);
    v6 = FigCaptureSourceRemoteCopyFrameSenderEndpoints();
    (*((void (**)(void))v4->_endpointsChangedHandler + 2))();

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("FrameServerEndpointsChanged"), 0);

  v3.receiver = self;
  v3.super_class = (Class)CMCaptureFrameSenderEndpointObserver;
  -[CMCaptureFrameSenderEndpointObserver dealloc](&v3, sel_dealloc);
}

- (void)_handleFrameServerEndpointsChangedNotification:(id)a3
{
  NSObject *frameSenderEndpointsChangedNotificationQueue;
  _QWORD block[5];

  frameSenderEndpointsChangedNotificationQueue = self->_frameSenderEndpointsChangedNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__CMCaptureFrameSenderEndpointObserver__handleFrameServerEndpointsChangedNotification___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(frameSenderEndpointsChangedNotificationQueue, block);
}

void __87__CMCaptureFrameSenderEndpointObserver__handleFrameServerEndpointsChangedNotification___block_invoke(uint64_t a1)
{
  NSDictionary *v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = FigCaptureSourceRemoteCopyFrameSenderEndpoints();
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();

  }
}

@end
