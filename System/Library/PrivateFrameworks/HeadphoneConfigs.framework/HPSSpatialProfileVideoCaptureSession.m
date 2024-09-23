@implementation HPSSpatialProfileVideoCaptureSession

- (HPSSpatialProfileVideoCaptureSession)init
{
  HPSSpatialProfileVideoCaptureSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *captureQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HPSSpatialProfileVideoCaptureSession;
  v2 = -[HPSSpatialProfileVideoCaptureSession init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.biometrickitui.AirPodPearlVideoCaptureSessionQueue", v3);
    captureQueue = v2->_captureQueue;
    v2->_captureQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (double)additionalPreviewScalingAllowedByCameraFormat
{
  return 1.0;
}

- (id)_frontCamera
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_captureQueue);
  v2 = (void *)MEMORY[0x1E0C8B0A8];
  v8[0] = *MEMORY[0x1E0C89FA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverySessionWithDeviceTypes:mediaType:position:", v3, *MEMORY[0x1E0C8A808], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BKUIVideoCaptureSesssionDelegate)delegate
{
  return (BKUIVideoCaptureSesssionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVCaptureVideoPreviewLayer)previewLayer
{
  return self->_previewLayer;
}

- (void)setPreviewLayer:(id)a3
{
  objc_storeStrong((id *)&self->_previewLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
  objc_storeStrong((id *)&self->_deviceInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
