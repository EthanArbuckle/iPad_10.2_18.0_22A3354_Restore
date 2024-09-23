@implementation AVCapturePointCloudDataOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVCapturePointCloudDataOutput)init
{
  AVCapturePointCloudDataOutput *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCapturePointCloudDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v4, sel_initSubclass);
  if (v2)
  {
    v2->_delegateCallbackHelper = -[AVCaptureDataOutputDelegateCallbackHelper initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:]([AVCaptureDataOutputDelegateCallbackHelper alloc], "initWithQueueName:canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:", CFSTR("com.apple.avfoundation.pointclouddataoutput.queue"), 0);
    v2->_weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    v2->_alwaysDiscardsLatePointCloudData = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePointCloudDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
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
    -[AVCapturePointCloudDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
    v11 = 0;
    if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", a3, a4, &v11))
    {
      -[AVCapturePointCloudDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
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

- (AVCapturePointCloudDataOutputDelegate)delegate
{
  return (AVCapturePointCloudDataOutputDelegate *)-[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_delegateCallbackHelper, "clientDelegate");
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_delegateCallbackHelper, "clientCallbackQueue");
}

- (BOOL)alwaysDiscardsLatePointCloudData
{
  return self->_alwaysDiscardsLatePointCloudData;
}

- (void)setAlwaysDiscardsLatePointCloudData:(BOOL)a3
{
  if (self->_alwaysDiscardsLatePointCloudData != a3)
  {
    self->_alwaysDiscardsLatePointCloudData = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("pcld");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v7;
  void *v8;
  BOOL result;

  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("pcld")))
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

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, pdo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, pdo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePointCloudDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, pdo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, pdo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePointCloudDataOutput;
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
  id v7;
  void *v8;
  uint64_t v9;

  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v7 = 0;
  else
    v7 = a4;
  v9 = 0;
  if (!-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, v7, &v9))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCapturePointCloudDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCapturePointCloudDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
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

void __52__AVCapturePointCloudDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
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
    -[AVCapturePointCloudDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__AVCapturePointCloudDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __51__AVCapturePointCloudDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
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
    -[AVCapturePointCloudDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;
  CMBlockBufferRef DataBuffer;
  CFTypeRef v8;
  AVPointCloudData *v9;
  int64_t v10;
  CMTime v11;
  CMTime v12;

  v5 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_delegateCallbackHelper, "activeDelegate");
  v6 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  if (objc_msgSend(v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (DataBuffer)
      v8 = CMGetAttachment(DataBuffer, (CFStringRef)*MEMORY[0x1E0CA2058], 0);
    else
      v8 = 0;
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    v9 = -[AVPointCloudData initWithDataBuffer:]([AVPointCloudData alloc], "initWithDataBuffer:", v8);
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = v12;
        objc_msgSend(v5, "pointCloudDataOutput:didOutputPointCloudData:timestamp:connection:", self, v9, &v11, v6);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:](AVCaptureOutput, "dataDroppedReasonFromSampleBuffer:", a3);
      v11 = v12;
      objc_msgSend(v5, "pointCloudDataOutput:didDropPointCloudData:timestamp:connection:reason:", self, v9, &v11, v6, v10);
    }

  }
}

@end
