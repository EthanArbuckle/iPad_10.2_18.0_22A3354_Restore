@implementation AVCaptureAudioDataOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureAudioDataOutput)init
{
  AVCaptureAudioDataOutput *v2;
  AVCaptureAudioDataOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureAudioDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureAudioDataOutputInternal);
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

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue
{
  dispatch_queue_t v4;
  void *v7;
  uint64_t v8;

  v4 = sampleBufferCallbackQueue;
  if (((sampleBufferCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v4 = 0;
  -[AVCaptureAudioDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sampleBufferDelegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", sampleBufferDelegate, v4, &v8))
  {
    -[AVCaptureAudioDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sampleBufferDelegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (id)sampleBufferDelegate
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (dispatch_queue_t)sampleBufferCallbackQueue
{
  return (dispatch_queue_t)-[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- (NSDictionary)audioSettings
{
  -[AVCaptureAudioDataOutput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (void)setAudioSettings:(NSDictionary *)audioSettings
{
  -[AVCaptureAudioDataOutput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)supportedAssetWriterOutputFileTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF2B00];
  v8[0] = *MEMORY[0x1E0CF2B08];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0CF2AD0];
  v8[2] = *MEMORY[0x1E0CF2AA0];
  v8[3] = v3;
  v4 = *MEMORY[0x1E0CF2AD8];
  v8[4] = *MEMORY[0x1E0CF2AC8];
  v8[5] = v4;
  v5 = *MEMORY[0x1E0CF2AB0];
  v8[6] = *MEMORY[0x1E0CF2B18];
  v8[7] = v5;
  v6 = *MEMORY[0x1E0CF2AB8];
  v8[8] = *MEMORY[0x1E0CF2AA8];
  v8[9] = v6;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
}

- (NSDictionary)recommendedAudioSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5;
  AVCaptureConnection *v6;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = -[AVCaptureAudioDataOutput supportedAssetWriterOutputFileTypes](self, "supportedAssetWriterOutputFileTypes");
  if ((objc_msgSend(v5, "containsObject:", outputFileType) & 1) != 0)
  {
    v6 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E0CF2B68]);
    if (-[AVCaptureConnection isLive](v6, "isLive"))
      return (NSDictionary *)-[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v6, 0, 0, outputFileType, 0, 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid file type UTI - available file types are: %@"), v5);
    v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  }
  return 0;
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CF2B68];
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL result;

  v7 = (void *)objc_msgSend(a3, "mediaType");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CF2B68]))
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

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ado_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, ado_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureAudioDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, ado_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, ado_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureAudioDataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureAudioDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureAudioDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
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

void __47__AVCaptureAudioDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
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
  {
    -[AVCaptureAudioDataOutput _handleSampleBufferEventForSampleBuffer:](self, "_handleSampleBufferEventForSampleBuffer:", a3->var4.var4.var0);
  }
  else if (a3->var0 == 5)
  {
    -[AVCaptureAudioDataOutput _handleConfigurationLiveEventForID:updatedFormatDescription:](self, "_handleConfigurationLiveEventForID:updatedFormatDescription:", a3->var4.var4.var0, a3->var4.var2.var1);
  }
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureAudioDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __46__AVCaptureAudioDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
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
  {
    -[AVCaptureAudioDataOutput _handleSampleBufferEventForSampleBuffer:](self, "_handleSampleBufferEventForSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
  }
  else if (a3->var0 == 5)
  {
    -[AVCaptureAudioDataOutput _handleConfigurationLiveEventForID:updatedFormatDescription:](self, "_handleConfigurationLiveEventForID:updatedFormatDescription:", *(_QWORD *)(&a3->var0 + 1), *(int64_t *)((char *)&a3->var1.var1.var0 + 4));
  }
}

- (void)_handleSampleBufferEventForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;

  v5 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_internal->delegateCallbackHelper, "activeDelegate");
  v6 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  if (objc_msgSend(v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "captureOutput:didOutputSampleBuffer:fromConnection:", self, a3, v6);
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
