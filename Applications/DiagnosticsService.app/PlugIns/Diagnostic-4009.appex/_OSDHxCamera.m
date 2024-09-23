@implementation _OSDHxCamera

- (_OSDHxCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  id v9;
  _OSDHxCamera *v10;
  _OSDHxCamera *v11;
  _OSDHxCamera *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_OSDHxCamera;
  v10 = -[_OSDHxCamera init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    if (!v9)
    {
      v13 = (objc_class *)objc_opt_class(v10);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a5, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> Cannot init with a nil OSDCaptureDevice (%@)!"), v15, 0);

      v12 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v10->_captureDevice, a3);
    v11->_source = a4;
  }
  v12 = v11;
LABEL_6:

  return v12;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
  v6 = objc_msgSend(v5, "getDeviceAndStreams:", a3);

  if (v6)
  {
    switch(-[_OSDHxCamera source](self, "source"))
    {
      case 1uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
        v8 = v7;
        v9 = &kFigCapturePortType_BackFacingCamera;
        goto LABEL_9;
      case 2uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
        v8 = v7;
        v9 = &kFigCapturePortType_FrontFacingCamera;
        goto LABEL_9;
      case 3uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
        v8 = v7;
        v9 = &kFigCapturePortType_BackFacingTelephotoCamera;
        goto LABEL_9;
      case 4uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
        v8 = v7;
        v9 = &kFigCapturePortType_BackFacingSuperWideCamera;
        goto LABEL_9;
      case 5uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
        v8 = v7;
        v9 = &kFigCapturePortType_FrontFacingSuperWideCamera;
LABEL_9:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "captureStreamForPortType:error:", *v9, a3));
        -[_OSDHxCamera setCaptureStream:](self, "setCaptureStream:", v10);

        break;
      default:
        +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", a3, CFSTR("com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter"), 1, CFSTR("%@ >> Cannot get capture stream for source %lu"), self, -[_OSDHxCamera source](self, "source"));
        -[_OSDHxCamera setCaptureStream:](self, "setCaptureStream:", 0);
        break;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));

  if (v11)
    -[_OSDHxCamera setIsActive:](self, "setIsActive:", 1);
  return v11 != 0;
}

- (void)doneWithDeviceAndStreams
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
  objc_msgSend(v3, "doneWithDeviceAndStreams");

  -[_OSDHxCamera setCaptureStream:](self, "setCaptureStream:", 0);
  -[_OSDHxCamera setIsActive:](self, "setIsActive:", 0);
}

- (id)ispVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureDevice](self, "captureDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ispVersion"));

  return v3;
}

- (id)name:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name:", a3));

  return v5;
}

- (id)frameCount
{
  return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[_OSDHxCamera _frameCounter](self, "_frameCounter"));
}

- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4
{
  _OSDHxCamera *v6;
  unsigned __int8 v7;

  v6 = self;
  objc_sync_enter(v6);
  -[_OSDHxCamera setStreamingOptions:](v6, "setStreamingOptions:", a3);
  if ((a3 & 1) != 0
    && !-[_OSDHxCamera _enableMotionDataMetadata:error:](v6, "_enableMotionDataMetadata:error:", 1, a4))
  {
    v7 = 0;
  }
  else
  {
    v7 = -[_OSDHxCamera _startStreaming:](v6, "_startStreaming:", a4);
  }
  objc_sync_exit(v6);

  return v7;
}

- (BOOL)stopStreaming:(id *)a3
{
  _OSDHxCamera *v4;
  void *v5;
  unsigned int v6;

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](v4, "captureStream"));
  v6 = objc_msgSend(v5, "stop:", a3);

  if (v6)
    -[_OSDHxCamera setIsStreaming:](v4, "setIsStreaming:", 0);
  objc_sync_exit(v4);

  return v6;
}

- (void)setPreviewLayer:(id)a3
{
  CALayer *v4;
  double v5;
  uint64_t v6;
  double v7;
  CALayer *v8;
  CALayer *previewLayer;
  CALayer *v10;

  v4 = (CALayer *)a3;
  if (!v4)
  {
    v10 = 0;
    CAImageQueueInvalidate(self->__imageQueue);
    CFRelease(self->__imageQueue);
    self->__imageQueue = 0;
    previewLayer = self->_previewLayer;
    self->_previewLayer = 0;
    goto LABEL_5;
  }
  if (self->_previewLayer != v4)
  {
    v10 = v4;
    -[CALayer frame](v4, "frame");
    v6 = v5;
    -[CALayer frame](v10, "frame");
    self->__imageQueue = (_CAImageQueue *)CAImageQueueCreate(v6, v7, 3);
    +[CATransaction begin](CATransaction, "begin");
    -[CALayer setContents:](v10, "setContents:", self->__imageQueue);
    +[CATransaction commit](CATransaction, "commit");
    v8 = v10;
    previewLayer = self->_previewLayer;
    self->_previewLayer = v8;
LABEL_5:

    v4 = v10;
  }

}

- (BOOL)setFrameRate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v8 = objc_msgSend(v7, "setProperty:number:error:", kFigCaptureStreamProperty_MinimumFrameRate, v6, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  LOBYTE(a4) = objc_msgSend(v9, "setProperty:number:error:", kFigCaptureStreamProperty_MaximumFrameRate, v6, a4);

  return v8 & a4;
}

- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  LOBYTE(a4) = objc_msgSend(v7, "setProperty:number:error:", kFigCaptureStreamProperty_MinimumFrameRate, v6, a4);

  return (char)a4;
}

- (BOOL)_startStreaming:(id *)a3
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v6 = objc_msgSend(v5, "start:", a3);

  if (v6)
  {
    -[_OSDHxCamera setIsStreaming:](self, "setIsStreaming:", 1);
    -[_OSDHxCamera set_frameCounter:](self, "set_frameCounter:", 0);
  }
  else
  {
    -[_OSDHxCamera setIsStreaming:](self, "setIsStreaming:", 0);
  }
  return v6;
}

- (void)_showFrameOnPreviewLayer:(__CVBuffer *)a3
{
  IOSurfaceRef IOSurface;
  uint64_t v5;
  _CAImageQueue *v6;
  double v7;

  IOSurface = CVPixelBufferGetIOSurface(a3);
  v5 = CAImageQueueRegisterIOSurfaceBuffer(-[_OSDHxCamera _imageQueue](self, "_imageQueue"), IOSurface, 0);
  CAImageQueueCollect(-[_OSDHxCamera _imageQueue](self, "_imageQueue"));
  v6 = -[_OSDHxCamera _imageQueue](self, "_imageQueue");
  v7 = CACurrentMediaTime();
  CAImageQueueInsertImage(v6, 3, v5, 1, 0, 0, v7);
}

- (id)_getStreamErrorFor:(__CFString *)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v7 = objc_msgSend(v6, "copyProperty:error:", kFigCaptureStreamProperty_ErrorCounters, a4);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue")));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_enableMotionDataMetadata:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  unsigned int v7;
  double v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSDHxCamera captureStream](self, "captureStream"));
  v7 = objc_msgSend(v6, "setProperty:BOOLean:error:", kFigCaptureStreamProperty_MotionDataFromISPEnabled, v5, a4);

  if (v7)
  {
    v8 = 1.0;
    if (!a4)
      v8 = 4.5;
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", v8);
  }
  return v7;
}

- (CALayer)previewLayer
{
  return self->_previewLayer;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (OSDCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_captureDevice, a3);
}

- (OSDCaptureStream)captureStream
{
  return self->_captureStream;
}

- (void)setCaptureStream:(id)a3
{
  objc_storeStrong((id *)&self->_captureStream, a3);
}

- (id)frameHandler
{
  return self->_frameHandler;
}

- (void)setFrameHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)streamingOptions
{
  return self->_streamingOptions;
}

- (void)setStreamingOptions:(unint64_t)a3
{
  self->_streamingOptions = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (int)_frameCounter
{
  return self->__frameCounter;
}

- (void)set_frameCounter:(int)a3
{
  self->__frameCounter = a3;
}

- (_CAImageQueue)_imageQueue
{
  return self->__imageQueue;
}

- (void)set_imageQueue:(_CAImageQueue *)a3
{
  self->__imageQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameHandler, 0);
  objc_storeStrong((id *)&self->_captureStream, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end
