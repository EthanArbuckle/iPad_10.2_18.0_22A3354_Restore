@implementation AVCaptureFileOutputDelegateWrapper

+ (id)wrapperWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:delegate:settingsID:connections:", a3, a4, a5, a6);
}

- (AVCaptureFileOutputDelegateWrapper)initWithURL:(id)a3 delegate:(id)a4 settingsID:(int64_t)a5 connections:(id)a6
{
  AVCaptureFileOutputDelegateWrapper *v10;
  AVCaptureFileOutputDelegateWrapper *v11;
  AVWeakReferencingDelegateStorage *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVCaptureFileOutputDelegateWrapper;
  v10 = -[AVCaptureFileOutputDelegateWrapper init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_settingsID = a5;
    v10->_outputFileURL = (NSURL *)objc_msgSend(a3, "copy");
    v11->_connections = (NSArray *)a6;
    v12 = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
    v11->_delegateStorage = v12;
    if (a4)
      -[AVWeakReferencingDelegateStorage setDelegate:queue:](v12, "setDelegate:queue:", a4, MEMORY[0x1E0C80D38]);
  }
  return v11;
}

- (void)dealloc
{
  OpaqueFigCaptureSession *pendingDidStopRecordingUnregistrationCaptureSession;
  objc_super v4;

  pendingDidStopRecordingUnregistrationCaptureSession = self->_pendingDidStopRecordingUnregistrationCaptureSession;
  if (pendingDidStopRecordingUnregistrationCaptureSession)
    CFRelease(pendingDidStopRecordingUnregistrationCaptureSession);
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFileOutputDelegateWrapper;
  -[AVCaptureFileOutputDelegateWrapper dealloc](&v4, sel_dealloc);
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (NSURL)outputFileURL
{
  return self->_outputFileURL;
}

- (NSString)outputFileType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutputFileType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)metadata
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (AVWeakReferencingDelegateStorage)delegateStorage
{
  return self->_delegateStorage;
}

- (NSArray)connections
{
  return self->_connections;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (OpaqueFigCaptureSession)pendingDidStopRecordingUnregistrationCaptureSession
{
  return self->_pendingDidStopRecordingUnregistrationCaptureSession;
}

- (void)setPendingDidStopRecordingUnregistrationCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isTrueVideoCaptureEnabled
{
  return self->_trueVideoCaptureEnabled;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  self->_trueVideoCaptureEnabled = a3;
}

@end
