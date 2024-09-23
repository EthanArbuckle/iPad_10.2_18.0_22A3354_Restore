@implementation AVAssetReader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    fig_note_initialize_logging();
}

+ (AVAssetReader)assetReaderWithAsset:(AVAsset *)asset error:(NSError *)outError
{
  return (AVAssetReader *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:error:", asset, outError);
}

- (AVAssetReader)init
{
  return -[AVAssetReader initWithAsset:error:](self, "initWithAsset:error:", 0, 0);
}

- (AVAssetReader)initWithAsset:(AVAsset *)asset error:(NSError *)outError
{
  AVAssetReader *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetReader;
  result = -[AVAssetReader init](&v7, sel_init);
  if (result)
    return (AVAssetReader *)-[AVAssetReader _commonInitWithAsset:options:error:](result, "_commonInitWithAsset:options:error:", asset, 0, outError);
  return result;
}

- (AVAssetReader)initWithAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  AVAssetReader *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetReader;
  result = -[AVAssetReader init](&v9, sel_init);
  if (result)
    return (AVAssetReader *)-[AVAssetReader _commonInitWithAsset:options:error:](result, "_commonInitWithAsset:options:error:", a3, a4, a5);
  return result;
}

- (id)_commonInitWithAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  AVAssetReader *v5;
  AVAssetReaderInternal *v9;
  AVAssetReaderInternal *priv;
  __int128 v11;
  __int128 v12;
  const char *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  objc_class *v23;
  AVAssetReaderInternal *v25;
  id v26;
  AVAssetReader *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  objc_super v35;
  CMTime duration;
  CMTime start;
  CMTimeRange v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v5 = self;
  v41[1] = *MEMORY[0x1E0C80C00];
  v39 = 0;
  if (!a3)
  {
    v28 = self;
    v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v29, v30, v31, v32, v33, (uint64_t)"asset != nil"), 0);
    objc_exception_throw(v34);
  }
  if (!self)
  {
LABEL_20:
    v19 = 0;
    if (!a5)
      goto LABEL_28;
LABEL_27:
    *a5 = v39;
    goto LABEL_28;
  }
  v9 = objc_alloc_init(AVAssetReaderInternal);
  v5->_priv = v9;
  if (!v9)
  {
LABEL_19:

    v5 = 0;
    goto LABEL_20;
  }
  CFRetain(v9);
  v5->_priv->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v5);
  v5->_priv->outputFinishedCallbackInvokers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5->_priv->asset = (AVAsset *)a3;
  v5->_priv->outputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  priv = v5->_priv;
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v38, &start, &duration);
  v12 = *(_OWORD *)&v38.start.epoch;
  v11 = *(_OWORD *)&v38.duration.timescale;
  *(_OWORD *)&priv->timeRange.start.value = *(_OWORD *)&v38.start.value;
  *(_OWORD *)&priv->timeRange.start.epoch = v12;
  *(_OWORD *)&priv->timeRange.duration.timescale = v11;
  v5->_priv->status = 0;
  v35.receiver = v5;
  v35.super_class = (Class)AVAssetReader;
  v13 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ status read/write queue"), -[AVAssetReader description](&v35, sel_description)), "UTF8String");
  v5->_priv->statusReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v13);
  v5->_priv->realTime = 0;
  v14 = objc_msgSend(a3, "_absoluteURL");
  v15 = -[AVAsset _requiresInProcessOperation](v5->_priv->asset, "_requiresInProcessOperation");
  v16 = *MEMORY[0x1E0C9AE50];
  if (v15)
    v17 = *MEMORY[0x1E0C9AE50];
  else
    v17 = *MEMORY[0x1E0C9AE40];
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v17, *MEMORY[0x1E0CC3AD8]);
  if ((objc_msgSend(a3, "_hasResourceLoaderDelegate") & 1) != 0
    || objc_msgSend((id)objc_msgSend(a4, "valueForKey:", CFSTR("AssetReaderOption_PermitNonLocalURL")), "BOOLValue"))
  {
    objc_msgSend(v18, "setObject:forKey:", v16, *MEMORY[0x1E0CC3AC8]);
    goto LABEL_10;
  }
  if (v14 && !FigCFURLIsLocalResource())
  {
    v40 = *MEMORY[0x1E0C9AFA8];
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_opt_class();
    v41[0] = objc_msgSend(v22, "stringWithFormat:", CFSTR("Cannot initialize an instance of %@ with an asset at non-local URL '%@'"), NSStringFromClass(v23), v14);
    v39 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1));
    goto LABEL_19;
  }
LABEL_10:
  v19 = (const void *)objc_msgSend(a3, "_copyFormatReader");
  if (objc_msgSend(a3, "statusOfValueForKey:error:", CFSTR("formatReader"), &v39) == 3 || !v19)
  {
    if (v39)
      goto LABEL_26;
    v21 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11838, 0);
LABEL_25:
    v39 = v21;
LABEL_26:

    v5 = 0;
    if (!a5)
      goto LABEL_28;
    goto LABEL_27;
  }
  CFRunLoopGetCurrent();
  if (v15)
    v20 = FigAssetReaderCreateWithURLAndFormatReader();
  else
    v20 = FigAssetReaderRemoteCreateWithURLAndFormatReader();
  if ((_DWORD)v20 || (v25 = v5->_priv, !v25->figAssetReader))
  {
    v21 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", v20);
    goto LABEL_25;
  }
  CFRetain(v25->weakReference);
  v26 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v26, "addListenerWithWeakReference:callback:name:object:flags:", v5->_priv->weakReference, AVAssetReaderHandleServerDiedNotification, *MEMORY[0x1E0CC3B48], v5->_priv->figAssetReader, 0);
  objc_msgSend(v26, "addListenerWithWeakReference:callback:name:object:flags:", v5->_priv->weakReference, AVAssetReaderHandleServerDiedNotification, *MEMORY[0x1E0CA4B88], v5->_priv->figAssetReader, 0);
  if (a5)
    goto LABEL_27;
LABEL_28:
  if (v19)
    CFRelease(v19);
  return v5;
}

- (void)dealloc
{
  AVAssetReaderInternal *priv;
  AVAssetReaderInternal *v4;
  NSObject *statusReadWriteQueue;
  objc_super v6;

  priv = self->_priv;
  if (priv)
  {

    -[AVAssetReader _tearDownFigAssetReader](self, "_tearDownFigAssetReader");
    v4 = self->_priv;
    statusReadWriteQueue = v4->statusReadWriteQueue;
    if (statusReadWriteQueue)
    {
      dispatch_release(statusReadWriteQueue);
      v4 = self->_priv;
    }

    CFRelease(self->_priv);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetReader;
  -[AVAssetReader dealloc](&v6, sel_dealloc);
}

- (void)_tearDownFigAssetReader
{
  id v3;
  uint64_t FigBaseObject;
  uint64_t v5;
  void (*v6)(uint64_t);

  if (self->_priv->figAssetReader)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, AVAssetReaderHandleServerDiedNotification, *MEMORY[0x1E0CC3B48], self->_priv->figAssetReader);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, AVAssetReaderHandleServerDiedNotification, *MEMORY[0x1E0CA4B88], self->_priv->figAssetReader);
    FigBaseObject = FigAssetReaderGetFigBaseObject();
    if (FigBaseObject)
    {
      v5 = FigBaseObject;
      v6 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v6)
        v6(v5);
    }
    CFRelease(self->_priv->weakReference);
    CFRelease(self->_priv->figAssetReader);
    self->_priv->figAssetReader = 0;
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, asset = %@, outputs = %@>"), NSStringFromClass(v4), self, -[AVAssetReader asset](self, "asset"), -[AVAssetReader outputs](self, "outputs"));
}

- (AVAsset)asset
{
  return self->_priv->asset;
}

- (AVAssetReaderStatus)status
{
  NSObject *statusReadWriteQueue;
  AVAssetReaderStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVAssetReader_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(statusReadWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __23__AVAssetReader_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 104);
  return result;
}

+ (id)_errorForOSStatus:(int)a3
{
  if (!a3)
    return 0;
  if (a3 == -12785)
    return (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11847, 0);
  return (id)AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
}

- (void)_transitionToStatus:(int64_t)a3 failureError:(id)a4
{
  NSObject *statusReadWriteQueue;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AVAssetReader willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
  -[AVAssetReader willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVAssetReader__transitionToStatus_failureError___block_invoke;
  block[3] = &unk_1E30322F8;
  block[4] = self;
  block[5] = a4;
  block[6] = &v13;
  block[7] = &v9;
  block[8] = a3;
  av_readwrite_dispatch_queue_write(statusReadWriteQueue, block);
  -[AVAssetReader didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  -[AVAssetReader didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
  if (v14[3] <= 1 && v10[3] >= 2)
    -[AVAssetReader _tearDownFigAssetReader](self, "_tearDownFigAssetReader");
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

uint64_t __50__AVAssetReader__transitionToStatus_failureError___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 104);
  v2 = *(_QWORD *)(result + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24);
  if (v2 != v3 && v3 <= 1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v6 = *(_QWORD *)(v5 + 120);
    if (v2 != 3 || v3)
    {
      if (v6)
      {
        *(_QWORD *)(v5 + 104) = 3;
        result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 120), "copy");
      }
      else
      {
        *(_QWORD *)(v5 + 104) = v2;
        result = *(_QWORD *)(result + 32);
        if (*(_QWORD *)(*(_QWORD *)(result + 8) + 112))
          goto LABEL_14;
        result = objc_msgSend(*(id *)(v1 + 40), "copyWithZone:", objc_msgSend((id)result, "zone"));
      }
      v7 = 112;
    }
    else
    {
      if (v6)
        goto LABEL_14;
      result = objc_msgSend(*(id *)(result + 40), "copy");
      v7 = 120;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + v7) = result;
  }
LABEL_14:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8)
                                                                          + 104);
  return result;
}

- (NSError)error
{
  NSObject *statusReadWriteQueue;
  NSError *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  statusReadWriteQueue = self->_priv->statusReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVAssetReader_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(statusReadWriteQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __22__AVAssetReader_error__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_failWithError:(id)a3
{
  -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 3, a3);
}

- (CMTimeRange)timeRange
{
  _OWORD *v3;
  __int128 v4;

  v3 = *(_OWORD **)&self->start.timescale;
  v4 = v3[3];
  *(_OWORD *)&retstr->start.value = v3[2];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[4];
  return self;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetReaderInternal *priv;
  __int128 v12;
  __int128 v13;
  void *v14;
  uint64_t v15;

  if (-[AVAssetReader status](self, "status") >= AVAssetReaderStatusReading)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  priv = self->_priv;
  v12 = *(_OWORD *)&timeRange->start.value;
  v13 = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&priv->timeRange.start.epoch = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&priv->timeRange.duration.timescale = v13;
  *(_OWORD *)&priv->timeRange.start.value = v12;
}

- (BOOL)_readSingleSample
{
  return self->_priv->readSingleSample;
}

- (void)_setReadSingleSample:(BOOL)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetReader status](self, "status") >= AVAssetReaderStatusReading)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  self->_priv->readSingleSample = a3;
}

- (NSArray)outputs
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_priv->outputs);
}

- (BOOL)_canAddOutput:(id)a3 exceptionReason:(id *)a4
{
  _BOOL4 v7;
  AVAssetReaderStatus v8;
  _BOOL4 v9;
  __CFString *v10;
  BOOL v11;

  v7 = -[NSArray containsObject:](-[AVAssetReader outputs](self, "outputs"), "containsObject:", a3);
  v8 = -[AVAssetReader status](self, "status");
  v9 = -[AVAsset isEqual:](-[AVAssetReader asset](self, "asset"), "isEqual:", objc_msgSend(a3, "_asset"));
  if (a4)
  {
    v10 = CFSTR("cannot add an output that has already been added to the receiver");
    if (!v7)
      v10 = 0;
    if (v8 >= AVAssetReaderStatusReading)
      v10 = CFSTR("cannot add an output after reading has started");
    if (!v9)
      v10 = CFSTR("cannot add an output that has already been added to another AVAssetReader");
    *a4 = v10;
  }
  v11 = v8 < AVAssetReaderStatusReading && v9;
  return v11 && !v7;
}

- (BOOL)canAddOutput:(AVAssetReaderOutput *)output
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  if (!output)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"output != nil"), 0);
    objc_exception_throw(v9);
  }
  return -[AVAssetReader _canAddOutput:exceptionReason:](self, "_canAddOutput:exceptionReason:", output, 0);
}

- (void)addOutput:(AVAssetReaderOutput *)output
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;

  if (!output)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"output != nil");
    goto LABEL_6;
  }
  v22 = 0;
  if (!-[AVAssetReader _canAddOutput:exceptionReason:](self, "_canAddOutput:exceptionReason:", output, &v22))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, v22, v11, v12, v13, v14, v15, v20);
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0));
  }
  -[AVAssetReaderOutput _attachToWeakReferenceToAssetReader:](output, "_attachToWeakReferenceToAssetReader:", self->_priv->weakReference);
  -[NSMutableArray addObject:](self->_priv->outputs, "addObject:", output);
  v16 = +[AVKVODispatcher sharedKVODispatcher](AVKVODispatcher, "sharedKVODispatcher");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __27__AVAssetReader_addOutput___block_invoke;
  v21[3] = &unk_1E3032320;
  v21[4] = output;
  -[NSMutableSet addObject:](self->_priv->outputFinishedCallbackInvokers, "addObject:", objc_msgSend(v16, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", CFSTR("finished"), output, 0, +[AVObservationBlockFactory observationBlockForWeakObserver:passedToBlock:](AVObservationBlockFactory, "observationBlockForWeakObserver:passedToBlock:", self, v21)));
}

uint64_t __27__AVAssetReader_addOutput___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_outputDidFinish:", *(_QWORD *)(a1 + 32));
}

- (void)_outputDidFinish:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[AVAssetReader outputs](self, "outputs", a3, 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  v7 = *(_QWORD *)v11;
  v8 = 1;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v4);
      v8 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_isFinished");
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v6);
  if (v8)
LABEL_9:
    -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 2, 0);
}

- (BOOL)startReading
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _BOOL4 v14;
  OpaqueFigAssetReader *figAssetReader;
  uint64_t (*v16)(OpaqueFigAssetReader *, CMTimeRange *);
  int v17;
  id v18;
  uint64_t (*v20)(OpaqueFigAssetReader *, CMTimeRange *, CMTime *);
  void *v21;
  __int128 v22;
  CMTimeEpoch epoch;
  CMTimeRange range;
  CMTime v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTimeRange v30;
  id v31;
  CMTime start;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  if (-[AVAssetReader status](self, "status") >= AVAssetReaderStatusReading)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called again after reading has already started"), v4, v5, v6, v7, v8, v22), 0);
    objc_exception_throw(v21);
  }
  memset(&v30, 0, sizeof(v30));
  if (self)
    -[AVAssetReader timeRange](self, "timeRange");
  v9 = -[AVAssetReader outputs](self, "outputs");
  if (!-[NSArray count](v9, "count"))
  {
    -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 2, 0);
    return 1;
  }
  -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 1, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "_prepareForReadingReturningError:", &v31))
        {
          v18 = v31;
          goto LABEL_22;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = -[AVAssetReader _readSingleSample](self, "_readSingleSample");
  figAssetReader = self->_priv->figAssetReader;
  if (v14)
  {
    start = v30.start;
    v16 = *(uint64_t (**)(OpaqueFigAssetReader *, CMTimeRange *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 144);
    if (!v16)
      goto LABEL_21;
    range.start = start;
    v17 = v16(figAssetReader, &range);
  }
  else
  {
    range = v30;
    CMTimeRangeGetEnd(&v25, &range);
    v22 = *(_OWORD *)&v30.start.value;
    epoch = v30.start.epoch;
    v20 = *(uint64_t (**)(OpaqueFigAssetReader *, CMTimeRange *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 96);
    if (!v20)
      goto LABEL_21;
    *(_OWORD *)&range.start.value = v22;
    range.start.epoch = epoch;
    start = v25;
    v17 = v20(figAssetReader, &range, &start);
  }
  if (v17)
  {
LABEL_21:
    v18 = +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", (_QWORD)v22);
    v31 = v18;
LABEL_22:
    -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 3, v18);
  }
  return -[AVAssetReader status](self, "status", (_QWORD)v22) != AVAssetReaderStatusFailed;
}

- (void)cancelReading
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[AVAssetReader outputs](self, "outputs", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_cancelReading");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 4, 0);
}

- (void)_handleServerDiedNotification
{
  -[AVAssetReader _transitionToStatus:failureError:](self, "_transitionToStatus:failureError:", 3, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0));
}

- (OpaqueFigAssetReader)_figAssetReader
{
  return self->_priv->figAssetReader;
}

- (void)setPreparesMediaDataForRealTimeConsumption:(BOOL)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 realTime;
  uint64_t FigBaseObject;
  void (*v13)(uint64_t, _QWORD, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;

  if (-[AVAssetReader status](self, "status") >= AVAssetReaderStatusReading)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v16), 0);
    objc_exception_throw(v15);
  }
  self->_priv->realTime = a3;
  realTime = self->_priv->realTime;
  FigBaseObject = FigAssetReaderGetFigBaseObject();
  v13 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v13)
  {
    if (realTime)
      v14 = *MEMORY[0x1E0C9AE50];
    else
      v14 = *MEMORY[0x1E0C9AE40];
    v13(FigBaseObject, *MEMORY[0x1E0CC3B50], v14);
  }
}

- (BOOL)preparesMediaDataForRealTimeConsumption
{
  return self->_priv->realTime;
}

- (BOOL)isDefunct
{
  OpaqueFigAssetReader *v2;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAssetReader *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  v2 = -[AVAssetReader _figAssetReader](self, "_figAssetReader");
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAssetReader *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(v2, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

@end
