@implementation AVCaptureCameraCalibrationDataOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureCameraCalibrationDataOutput)init
{
  AVCaptureCameraCalibrationDataOutput *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v4, sel_initSubclass);
  if (v2)
  {
    v2->_delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.cameracalibrationdataoutput.queue"), 0);
    v2->_weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    v2->_alwaysDiscardsLateCameraCalibrationData = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  int IsRunningInMediaserverd;
  void *v8;
  void *v9;
  uint64_t v10;

  IsRunningInMediaserverd = AVCaptureIsRunningInMediaserverd();
  if (a4 && IsRunningInMediaserverd)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
  else
  {
    -[AVCaptureCameraCalibrationDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
    v10 = 0;
    if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", a3, a4, &v10))
    {
      -[AVCaptureCameraCalibrationDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
      -[AVCaptureCameraCalibrationDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
      if (AVCaptureShouldThrowForAPIViolations())
        objc_exception_throw(v9);
      NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
    }
  }
}

- (AVCaptureCameraCalibrationDataOutputDelegate)delegate
{
  return (AVCaptureCameraCalibrationDataOutputDelegate *)-[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_delegateCallbackHelper, "clientDelegate");
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_delegateCallbackHelper, "clientCallbackQueue");
}

- (BOOL)alwaysDiscardsLateCameraCalibrationData
{
  return self->_alwaysDiscardsLateCameraCalibrationData;
}

- (void)setAlwaysDiscardsLateCameraCalibrationData:(BOOL)a3
{
  if (self->_alwaysDiscardsLateCameraCalibrationData != a3)
  {
    self->_alwaysDiscardsLateCameraCalibrationData = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("cacd");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v7;
  void *v8;
  BOOL result;

  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("cacd")))
  {
    v7 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v7 = 2;
LABEL_5:
    v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ccdo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ccdo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, ccdo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, ccdo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (id)delegateOverride
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_delegateCallbackHelper, "delegateOverride");
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverrideCallbackQueue](self->_delegateCallbackHelper, "delegateOverrideCallbackQueue");
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  int IsRunningInMediaserverd;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  IsRunningInMediaserverd = AVCaptureIsRunningInMediaserverd();
  if (a4 && IsRunningInMediaserverd)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v11 = 0;
    if (-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, a4, &v11))
    {
      return;
    }
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
  }
  v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v10);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureCameraCalibrationDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureCameraCalibrationDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  AVWeakReference *v5;
  void *MessageReceiver;

  v5 = self->_weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)objc_msgSend(MessageReceiver, "copy"));

}

void __59__AVCaptureCameraCalibrationDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  id *v7;
  id *v8;

  v6 = (void *)MEMORY[0x1A1AF16C4]();
  v7 = (id *)(id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v7)
  {
    v8 = v7;
    if (a2 == -16665)
    {
      objc_msgSend(v7[2], "releaseRemoteQueueReceiver");
    }
    else if (!a2)
    {
      objc_msgSend(v7, "_handleRemoteQueueOperation:", a3);
    }

  }
  objc_autoreleasePoolPop(v6);
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureCameraCalibrationDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVCaptureCameraCalibrationDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __58__AVCaptureCameraCalibrationDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  int v8;

  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v5)
  {
    v6 = v5;
    v7 = *a2;
    v8 = *((_DWORD *)a2 + 4);
    objc_msgSend(v5, "_handleLocalQueueMessage:", &v7);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureCameraCalibrationDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  AVCameraCalibrationData *v17;
  int64_t v18;
  CMTime v19;
  CMTime v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v5 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  v6 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_delegateCallbackHelper, "activeDelegate");
  if (objc_msgSend(v5, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05450], 0));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = *MEMORY[0x1E0D03EE0];
    objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EE0]), "getBytes:length:", &v21, 64);
    FigCaptureFirmwareToNVMExtrinsicMatrixTransform();
    FigCaptureTransformExtrinsicMatrix();
    DWORD2(v21) = v9;
    DWORD2(v22) = v10;
    *(_QWORD *)&v21 = v11;
    *(_QWORD *)&v22 = v12;
    DWORD2(v23) = v13;
    DWORD2(v24) = v14;
    *(_QWORD *)&v23 = v15;
    *(_QWORD *)&v24 = v16;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v21, 64), v8);
    v17 = -[AVCameraCalibrationData initWithDepthMetadataDictionary:]([AVCameraCalibrationData alloc], "initWithDepthMetadataDictionary:", v7);
    memset(&v20, 0, sizeof(v20));
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    if (v17)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = v20;
        objc_msgSend(v6, "cameraCalibrationDataOutput:didOutputCameraCalibrationData:timestamp:connection:", self, v17, &v19, v5);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:](AVCaptureOutput, "dataDroppedReasonFromSampleBuffer:", a3);
      v19 = v20;
      objc_msgSend(v6, "cameraCalibrationDataOutput:didDropCameraCalibrationDataAtTimestamp:connection:reason:", self, &v19, v5, v18);
    }

  }
}

@end
