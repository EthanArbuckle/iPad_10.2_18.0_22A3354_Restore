@implementation AVCaptureDepthDataOutput

- (BOOL)isFilteringEnabled
{
  return self->_internal->filteringEnabled;
}

- (BOOL)alwaysDiscardsLateDepthData
{
  return self->_internal->alwaysDiscardsLateDepthData;
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B70]))
  {
    v8 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  objc_super v8;

  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("videoMirrored"), 3, AVCaptureOutputVideoMirroredChangedContext);
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("videoOrientation"), 3, AVCaptureOutputVideoOrientationChangedContext);
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 3, AVCaptureOutputActiveChangedContext);
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDepthDataOutput;
  return -[AVCaptureOutput addConnection:error:](&v8, sel_addConnection_error_, a3, a4);
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 1;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ddo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ddo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDepthDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  int v11;
  int v12;

  if ((void *)AVCaptureOutputVideoMirroredChangedContext == a6
    || AVCaptureOutputVideoOrientationChangedContext == (_QWORD)a6)
  {
    goto LABEL_6;
  }
  if ((void *)AVCaptureOutputActiveChangedContext == a6)
  {
    v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]), "BOOLValue");
    v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v11 != v12)
    {
      if (!v12)
      {
        v9 = 0;
        goto LABEL_7;
      }
LABEL_6:
      v9 = objc_msgSend((id)objc_msgSend(a4, "sourceDevice", a3, a4, a5), "activeDepthDataFormat");
LABEL_7:
      -[AVCaptureOutput updateMetadataTransformForSourceFormat:](self, "updateMetadataTransformForSourceFormat:", v9);
    }
  }
}

- (void)setFilteringEnabled:(BOOL)filteringEnabled
{
  AVCaptureDepthDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->filteringEnabled != filteringEnabled)
  {
    internal->filteringEnabled = filteringEnabled;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (void)setAlwaysDiscardsLateDepthData:(BOOL)alwaysDiscardsLateDepthData
{
  AVCaptureDepthDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->alwaysDiscardsLateDepthData != alwaysDiscardsLateDepthData)
  {
    internal->alwaysDiscardsLateDepthData = alwaysDiscardsLateDepthData;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

void __47__AVCaptureDepthDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  _QWORD *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1A1AF16C4]();
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v7)
  {
    v8 = v7;
    if (a2 == -16665)
    {
      objc_msgSend(*(id *)(v7[2] + 8), "releaseRemoteQueueReceiver");
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
    -[AVCaptureDepthDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (AVCaptureDepthDataOutput)init
{
  AVCaptureDepthDataOutput *v2;
  AVCaptureDepthDataOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDepthDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureDepthDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureDepthDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureDepthDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  AVWeakReference *v5;
  void *MessageReceiver;

  v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)objc_msgSend(MessageReceiver, "copy"));

}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDepthDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)delegate callbackQueue:(dispatch_queue_t)callbackQueue
{
  dispatch_queue_t v4;
  void *v7;
  uint64_t v8;

  v4 = callbackQueue;
  if (((callbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v4 = 0;
  -[AVCaptureDepthDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", delegate, v4, &v8))
  {
    -[AVCaptureDepthDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureDepthDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (id)delegate
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (dispatch_queue_t)delegateCallbackQueue
{
  return (dispatch_queue_t)-[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)removeConnection:(id)a3
{
  objc_super v5;

  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("videoMirrored"), AVCaptureOutputVideoMirroredChangedContext);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("videoOrientation"), AVCaptureOutputVideoOrientationChangedContext);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("active"), AVCaptureOutputActiveChangedContext);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDepthDataOutput;
  -[AVCaptureOutput removeConnection:](&v5, sel_removeConnection_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, ddo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, ddo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDepthDataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureDepthDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __46__AVCaptureDepthDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
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
    -[AVCaptureDepthDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;
  CVImageBufferRef ImageBuffer;
  CFTypeRef v8;
  AVDepthData *v9;
  int64_t v10;
  CMTime v11;
  CMTime v12;

  v5 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_internal->delegateCallbackHelper, "activeDelegate");
  v6 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  if (objc_msgSend(v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05458], 0);
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    v9 = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:]([AVDepthData alloc], "initWithPixelBuffer:depthMetadataDictionary:", ImageBuffer, v8);
    if (ImageBuffer)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = v12;
        objc_msgSend(v5, "depthDataOutput:didOutputDepthData:timestamp:connection:", self, v9, &v11, v6);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:](AVCaptureOutput, "dataDroppedReasonFromSampleBuffer:", a3);
      v11 = v12;
      objc_msgSend(v5, "depthDataOutput:didDropDepthData:timestamp:connection:reason:", self, v9, &v11, v6, v10);
    }

  }
}

- (id)delegateOverride
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_internal->delegateCallbackHelper, "delegateOverride");
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverrideCallbackQueue](self->_internal->delegateCallbackHelper, "delegateOverrideCallbackQueue");
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
  if (!-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, v7, &v9))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

@end
