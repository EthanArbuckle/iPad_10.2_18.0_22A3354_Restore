@implementation AVAssetWriter

+ (void)initialize
{
  objc_opt_class();
}

+ (AVAssetWriter)assetWriterWithURL:(NSURL *)outputURL fileType:(AVFileType)outputFileType error:(NSError *)outError
{
  return (AVAssetWriter *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:fileType:error:", outputURL, outputFileType, outError);
}

- (AVAssetWriter)init
{
  return -[AVAssetWriter initWithURL:fileType:error:](self, "initWithURL:fileType:error:", 0, 0, 0);
}

- (AVAssetWriter)initWithURL:(NSURL *)outputURL fileType:(AVFileType)outputFileType error:(NSError *)outError
{
  AVAssetWriter *v9;
  AVAssetWriter *v10;
  id v11;
  AVAssetWriterInternal *internal;
  AVAssetWriterHelper *helper;
  AVAssetWriter *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  AVAssetWriter *v24;
  AVAssetWriter *v25;
  const __CFString *v26;
  void *v27;
  AVAssetWriter *v28;
  uint64_t v29;
  const __CFString *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)AVAssetWriter;
  v9 = -[AVAssetWriter init](&v31, sel_init);
  v10 = v9;
  if (!outputURL)
  {
    v15 = v9;
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "outputURL != nil";
LABEL_16:
    v29 = (uint64_t)v23;
    v26 = CFSTR("invalid parameter not satisfying: %s");
    goto LABEL_17;
  }
  if (!-[NSURL isFileURL](outputURL, "isFileURL"))
  {
    v24 = v10;
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "[outputURL isFileURL]";
    goto LABEL_16;
  }
  if (!outputFileType)
  {
    v25 = v10;
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "outputFileType != nil";
    goto LABEL_16;
  }
  if (!v10)
    goto LABEL_10;
  if (!-[AVAssetWriter _initInternalObject](v10, "_initInternalObject"))
    goto LABEL_9;
  v30 = 0;
  v11 = +[AVMediaFileType _mediaFileTypeWithFileTypeIdentifier:exceptionReason:](AVMediaFileType, "_mediaFileTypeWithFileTypeIdentifier:exceptionReason:", outputFileType, &v30);
  if (!v11)
  {
    v28 = v10;
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v26 = v30;
LABEL_17:
    v27 = (void *)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, (uint64_t)v26, v16, v17, v18, v19, v20, v29), 0);
    objc_exception_throw(v27);
  }
  v10->_internal->helper = (AVAssetWriterHelper *)-[AVAssetWriterUnknownHelper initWithURL:fileType:]([AVAssetWriterUnknownHelper alloc], "initWithURL:fileType:", outputURL, v11);
  internal = v10->_internal;
  helper = internal->helper;
  if (helper)
  {
    -[AVAssetWriterHelper setWeakReferenceToAssetWriter:](helper, "setWeakReferenceToAssetWriter:", internal->weakReference);
    goto LABEL_10;
  }
LABEL_9:

  v10 = 0;
LABEL_10:
  if (outError)
    *outError = 0;
  return v10;
}

- (AVAssetWriter)initWithContentType:(UTType *)outputContentType
{
  AVAssetWriter *v5;
  AVAssetWriter *v6;
  id v7;
  AVAssetWriterInternal *internal;
  AVAssetWriterHelper *helper;
  AVAssetWriter *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  AVAssetWriter *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriter;
  v5 = -[AVAssetWriter init](&v28, sel_init);
  v6 = v5;
  if (!outputContentType)
  {
    v11 = v5;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"outputContentType != nil");
    goto LABEL_11;
  }
  if (v5)
  {
    if (!-[AVAssetWriter _initInternalObject](v5, "_initInternalObject"))
      goto LABEL_7;
    v27 = 0;
    v7 = +[AVMediaFileType _mediaFileTypeWithFileTypeIdentifier:exceptionReason:](AVMediaFileType, "_mediaFileTypeWithFileTypeIdentifier:exceptionReason:", -[UTType identifier](outputContentType, "identifier"), &v27);
    if (v7)
    {
      v6->_internal->helper = (AVAssetWriterHelper *)-[AVAssetWriterUnknownHelper initWithURL:fileType:]([AVAssetWriterUnknownHelper alloc], "initWithURL:fileType:", 0, v7);
      internal = v6->_internal;
      helper = internal->helper;
      if (helper)
      {
        -[AVAssetWriterHelper setWeakReferenceToAssetWriter:](helper, "setWeakReferenceToAssetWriter:", internal->weakReference);
        return v6;
      }
LABEL_7:

      return 0;
    }
    v20 = v6;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v27, v21, v22, v23, v24, v25, v26);
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v19, 0));
  }
  return v6;
}

- (AVAssetWriter)initWithFileType:(id)a3 error:(id *)a4
{
  AVAssetWriter *v7;
  AVAssetWriter *v8;
  id v9;
  AVAssetWriterInternal *internal;
  AVAssetWriterHelper *helper;
  AVAssetWriter *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  AVAssetWriter *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)AVAssetWriter;
  v7 = -[AVAssetWriter init](&v30, sel_init);
  v8 = v7;
  if (!a3)
  {
    v13 = v7;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v16, v17, v18, v19, v20, (uint64_t)"outputFileType != nil");
    goto LABEL_13;
  }
  if (!v7)
    goto LABEL_8;
  if (!-[AVAssetWriter _initInternalObject](v7, "_initInternalObject"))
    goto LABEL_7;
  v29 = 0;
  v9 = +[AVMediaFileType _mediaFileTypeWithFileTypeIdentifier:exceptionReason:](AVMediaFileType, "_mediaFileTypeWithFileTypeIdentifier:exceptionReason:", a3, &v29);
  if (!v9)
  {
    v22 = v8;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, v29, v23, v24, v25, v26, v27, v28);
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v21, 0));
  }
  v8->_internal->helper = (AVAssetWriterHelper *)-[AVAssetWriterUnknownHelper initWithURL:fileType:]([AVAssetWriterUnknownHelper alloc], "initWithURL:fileType:", 0, v9);
  internal = v8->_internal;
  helper = internal->helper;
  if (helper)
  {
    -[AVAssetWriterHelper setWeakReferenceToAssetWriter:](helper, "setWeakReferenceToAssetWriter:", internal->weakReference);
    goto LABEL_8;
  }
LABEL_7:

  v8 = 0;
LABEL_8:
  if (a4)
    *a4 = 0;
  return v8;
}

- (BOOL)_initInternalObject
{
  AVAssetWriterInternal *v3;
  const char *v4;
  objc_super v6;

  v3 = objc_alloc_init(AVAssetWriterInternal);
  self->_internal = v3;
  if (v3)
  {
    self->_internal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
    v6.receiver = self;
    v6.super_class = (Class)AVAssetWriter;
    v4 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ helper read/write queue"), -[AVAssetWriter description](&v6, sel_description)), "UTF8String");
    self->_internal->helperReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v4);
    self->_internal->keyPathDependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", self);
    -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](self->_internal->keyPathDependencyManager, "dependencyHostIsFullyInitialized");
  }
  return v3 != 0;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_internal->keyPathDependencyManager, "addCallbackToCancel:", a3);
}

- (void)dealloc
{
  AVAssetWriterInternal *internal;
  NSObject *helperReadWriteQueue;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    -[AVKeyPathDependencyManager cancelAllCallbacks](internal->keyPathDependencyManager, "cancelAllCallbacks");

    internal = self->_internal;
    helperReadWriteQueue = internal->helperReadWriteQueue;
    if (helperReadWriteQueue)
    {
      dispatch_release(helperReadWriteQueue);
      internal = self->_internal;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriter;
  -[AVAssetWriter dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, outputURL = %@, outputFileType = %@>"), NSStringFromClass(v4), self, -[AVAssetWriter outputURL](self, "outputURL"), -[AVAssetWriter outputFileType](self, "outputFileType"));
}

- (AVAssetWriterHelper)_helper
{
  NSObject *helperReadWriteQueue;
  AVAssetWriterHelper *v3;
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  helperReadWriteQueue = self->_internal->helperReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__AVAssetWriter__helper__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(helperReadWriteQueue, v5);
  v3 = (AVAssetWriterHelper *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __24__AVAssetWriter__helper__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_setHelper:(id)a3 ifCurrentHelper:(id)a4
{
  return -[AVAssetWriter _setHelper:ifCurrentHelper:withBlock:](self, "_setHelper:ifCurrentHelper:withBlock:", a3, a4, 0);
}

- (BOOL)_setHelper:(id)a3 ifCurrentHelper:(id)a4 withBlock:(id)a5
{
  AVAssetWriter *v8;
  NSObject *helperReadWriteQueue;
  _QWORD block[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v8 = self;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[AVAssetWriter willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("helper"));
  helperReadWriteQueue = v8->_internal->helperReadWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVAssetWriter__setHelper_ifCurrentHelper_withBlock___block_invoke;
  block[3] = &unk_1E3032470;
  block[4] = a4;
  block[5] = v8;
  block[6] = a3;
  block[7] = a5;
  block[8] = &v12;
  av_readwrite_dispatch_queue_write(helperReadWriteQueue, block);
  -[AVAssetWriter didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("helper"));
  LOBYTE(v8) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v8;
}

void *__54__AVAssetWriter__setHelper_ifCurrentHelper_withBlock___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;

  result = *(void **)(a1 + 32);
  if (result == *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16) && *(void **)(a1 + 48) != result)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 56));
      result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16);
    }
    objc_msgSend(result, "setWeakReferenceToAssetWriter:", 0);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16) = *(id *)(a1 + 48);
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16), "setWeakReferenceToAssetWriter:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  return result;
}

- (NSURL)outputURL
{
  return -[AVAssetWriterHelper outputURL](-[AVAssetWriter _helper](self, "_helper"), "outputURL");
}

- (AVFileType)outputFileType
{
  return -[AVMediaFileType UTI](-[AVAssetWriterHelper mediaFileType](-[AVAssetWriter _helper](self, "_helper"), "mediaFileType"), "UTI");
}

- (NSArray)availableMediaTypes
{
  return -[AVAssetWriterHelper availableMediaTypes](-[AVAssetWriter _helper](self, "_helper"), "availableMediaTypes");
}

- (BOOL)_supportsSampleReferencesReturningError:(id *)a3
{
  AVMediaFileType *v4;
  BOOL v5;
  BOOL v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = -[AVAssetWriterHelper mediaFileType](-[AVAssetWriter _helper](self, "_helper"), "mediaFileType");
  v5 = -[AVMediaFileType supportsSampleReferences](v4, "supportsSampleReferences");
  v6 = v5;
  if (a3 && !v5)
  {
    v8 = CFSTR("AVErrorFileTypeKey");
    v9[0] = -[AVMediaFileType UTI](v4, "UTI");
    *a3 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11854, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }
  return v6;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("helper")) & 1) != 0)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVAssetWriter;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("status"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("status")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("error"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("error")));
}

- (AVAssetWriterStatus)status
{
  return -[AVAssetWriterHelper status](-[AVAssetWriter _helper](self, "_helper"), "status");
}

- (NSError)error
{
  return -[AVAssetWriterHelper error](-[AVAssetWriter _helper](self, "_helper"), "error");
}

- (id)delegate
{
  return -[AVAssetWriterHelper delegate](-[AVAssetWriter _helper](self, "_helper"), "delegate");
}

- (void)setDelegate:(id)delegate
{
  __int128 v4;
  uint64_t v5;

  -[AVAssetWriterHelper setDelegate:](-[AVAssetWriter _helper](self, "_helper"), "setDelegate:", delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *MEMORY[0x1E0CA2E10];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
    -[AVAssetWriter setMovieFragmentInterval:](self, "setMovieFragmentInterval:", &v4);
  }
}

- (CMTime)movieFragmentInterval
{
  CMTime *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime movieFragmentInterval](result, "movieFragmentInterval");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setMovieFragmentInterval:(CMTime *)movieFragmentInterval
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetWriterHelper *v11;
  void *v12;
  CMTime time2;
  CMTime time1;

  time1 = *movieFragmentInterval;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"CMTIME_COMPARE_INLINE(interval, >=, kCMTimeZero)"), 0);
    objc_exception_throw(v12);
  }
  v11 = -[AVAssetWriter _helper](self, "_helper");
  time1 = *movieFragmentInterval;
  -[AVAssetWriterHelper setMovieFragmentInterval:](v11, "setMovieFragmentInterval:", &time1);
}

- (CMTime)initialMovieFragmentInterval
{
  CMTime *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime initialMovieFragmentInterval](result, "initialMovieFragmentInterval");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setInitialMovieFragmentInterval:(CMTime *)initialMovieFragmentInterval
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetWriterHelper *v11;
  void *v12;
  CMTime time2;
  CMTime time1;

  time1 = *initialMovieFragmentInterval;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"CMTIME_COMPARE_INLINE(interval, >=, kCMTimeZero)"), 0);
    objc_exception_throw(v12);
  }
  v11 = -[AVAssetWriter _helper](self, "_helper");
  time1 = *initialMovieFragmentInterval;
  -[AVAssetWriterHelper setInitialMovieFragmentInterval:](v11, "setInitialMovieFragmentInterval:", &time1);
}

- (CMTime)overallDurationHint
{
  CMTime *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime overallDurationHint](result, "overallDurationHint");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setOverallDurationHint:(CMTime *)overallDurationHint
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMTimeFlags flags;
  AVAssetWriterHelper *v12;
  void *v13;
  CMTime time2;
  CMTime time1;

  flags = overallDurationHint->flags;
  if ((flags & 0x1D) == 1)
  {
    time1 = *overallDurationHint;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
      goto LABEL_5;
    flags = overallDurationHint->flags;
  }
  if ((flags & 1) != 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"(CMTIME_IS_NUMERIC(hint) && CMTIME_COMPARE_INLINE(hint, >=, kCMTimeZero)) || CMTIME_IS_INVALID(hint)"), 0);
    objc_exception_throw(v13);
  }
LABEL_5:
  v12 = -[AVAssetWriter _helper](self, "_helper");
  time1 = *overallDurationHint;
  -[AVAssetWriterHelper setOverallDurationHint:](v12, "setOverallDurationHint:", &time1);
}

- (BOOL)shouldOptimizeForNetworkUse
{
  return -[AVAssetWriterHelper shouldOptimizeForNetworkUse](-[AVAssetWriter _helper](self, "_helper"), "shouldOptimizeForNetworkUse");
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)shouldOptimizeForNetworkUse
{
  -[AVAssetWriterHelper setShouldOptimizeForNetworkUse:](-[AVAssetWriter _helper](self, "_helper"), "setShouldOptimizeForNetworkUse:", shouldOptimizeForNetworkUse);
}

- (NSURL)directoryForTemporaryFiles
{
  return -[AVAssetWriterHelper directoryForTemporaryFiles](-[AVAssetWriter _helper](self, "_helper"), "directoryForTemporaryFiles");
}

- (void)setDirectoryForTemporaryFiles:(NSURL *)directoryForTemporaryFiles
{
  -[AVAssetWriterHelper setDirectoryForTemporaryFiles:](-[AVAssetWriter _helper](self, "_helper"), "setDirectoryForTemporaryFiles:", directoryForTemporaryFiles);
}

- (CMTimeScale)movieTimeScale
{
  return -[AVAssetWriterHelper movieTimeScale](-[AVAssetWriter _helper](self, "_helper"), "movieTimeScale");
}

- (void)setMovieTimeScale:(CMTimeScale)movieTimeScale
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (movieTimeScale < 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"movieTimeScale >= 0"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterHelper setMovieTimeScale:](-[AVAssetWriter _helper](self, "_helper"), "setMovieTimeScale:", *(_QWORD *)&movieTimeScale);
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform preferredTransform](result, "preferredTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  AVAssetWriterHelper *v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[AVAssetWriter _helper](self, "_helper");
  v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  -[AVAssetWriterHelper setPreferredTransform:](v4, "setPreferredTransform:", v6);
}

- (float)preferredVolume
{
  float result;

  -[AVAssetWriterHelper preferredVolume](-[AVAssetWriter _helper](self, "_helper"), "preferredVolume");
  return result;
}

- (void)setPreferredVolume:(float)a3
{
  AVAssetWriterHelper *v4;
  double v5;

  v4 = -[AVAssetWriter _helper](self, "_helper");
  *(float *)&v5 = a3;
  -[AVAssetWriterHelper setPreferredVolume:](v4, "setPreferredVolume:", v5);
}

- (float)preferredRate
{
  float result;

  -[AVAssetWriterHelper preferredRate](-[AVAssetWriter _helper](self, "_helper"), "preferredRate");
  return result;
}

- (void)setPreferredRate:(float)a3
{
  AVAssetWriterHelper *v4;
  double v5;

  v4 = -[AVAssetWriter _helper](self, "_helper");
  *(float *)&v5 = a3;
  -[AVAssetWriterHelper setPreferredRate:](v4, "setPreferredRate:", v5);
}

- (CMTime)preferredOutputSegmentInterval
{
  CMTime *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime preferredOutputSegmentInterval](result, "preferredOutputSegmentInterval");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setPreferredOutputSegmentInterval:(CMTime *)preferredOutputSegmentInterval
{
  AVAssetWriterHelper *v4;
  CMTime v5;

  v4 = -[AVAssetWriter _helper](self, "_helper");
  v5 = *preferredOutputSegmentInterval;
  -[AVAssetWriterHelper setPreferredOutputSegmentInterval:](v4, "setPreferredOutputSegmentInterval:", &v5);
}

- (CMTime)initialSegmentStartTime
{
  CMTime *result;

  result = -[AVAssetWriter _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime initialSegmentStartTime](result, "initialSegmentStartTime");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setInitialSegmentStartTime:(CMTime *)initialSegmentStartTime
{
  AVAssetWriterHelper *v4;
  CMTime v5;

  v4 = -[AVAssetWriter _helper](self, "_helper");
  v5 = *initialSegmentStartTime;
  -[AVAssetWriterHelper setInitialSegmentStartTime:](v4, "setInitialSegmentStartTime:", &v5);
}

- (AVFileTypeProfile)outputFileTypeProfile
{
  return -[AVAssetWriterHelper outputFileTypeProfile](-[AVAssetWriter _helper](self, "_helper"), "outputFileTypeProfile");
}

- (void)setOutputFileTypeProfile:(AVFileTypeProfile)outputFileTypeProfile
{
  -[AVAssetWriterHelper setOutputFileTypeProfile:](-[AVAssetWriter _helper](self, "_helper"), "setOutputFileTypeProfile:", outputFileTypeProfile);
}

- (NSInteger)initialMovieFragmentSequenceNumber
{
  return -[AVAssetWriterHelper initialMovieFragmentSequenceNumber](-[AVAssetWriter _helper](self, "_helper"), "initialMovieFragmentSequenceNumber");
}

- (void)setInitialMovieFragmentSequenceNumber:(NSInteger)initialMovieFragmentSequenceNumber
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (initialMovieFragmentSequenceNumber <= 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"0 < sequenceNumber"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterHelper setInitialMovieFragmentSequenceNumber:](-[AVAssetWriter _helper](self, "_helper"), "setInitialMovieFragmentSequenceNumber:", initialMovieFragmentSequenceNumber);
}

- (BOOL)producesCombinableFragments
{
  return -[AVAssetWriterHelper producesCombinableFragments](-[AVAssetWriter _helper](self, "_helper"), "producesCombinableFragments");
}

- (void)setProducesCombinableFragments:(BOOL)producesCombinableFragments
{
  -[AVAssetWriterHelper setProducesCombinableFragments:](-[AVAssetWriter _helper](self, "_helper"), "setProducesCombinableFragments:", producesCombinableFragments);
}

- (BOOL)isVirtualCaptureCardSupported
{
  return -[AVAssetWriterHelper isVirtualCaptureCardSupported](-[AVAssetWriter _helper](self, "_helper"), "isVirtualCaptureCardSupported");
}

- (BOOL)usesVirtualCaptureCard
{
  return -[AVAssetWriterHelper usesVirtualCaptureCard](-[AVAssetWriter _helper](self, "_helper"), "usesVirtualCaptureCard");
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  -[AVAssetWriterHelper setUsesVirtualCaptureCard:](-[AVAssetWriter _helper](self, "_helper"), "setUsesVirtualCaptureCard:", a3);
}

- (BOOL)requiresInProcessOperation
{
  return -[AVAssetWriterHelper requiresInProcessOperation](-[AVAssetWriter _helper](self, "_helper"), "requiresInProcessOperation");
}

- (void)setRequiresInProcessOperation:(BOOL)a3
{
  -[AVAssetWriterHelper setRequiresInProcessOperation:](-[AVAssetWriter _helper](self, "_helper"), "setRequiresInProcessOperation:", a3);
}

- (void)setWritesSinglePassUsingPredeterminedFileSize:(int64_t)a3 mediaDataSize:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;

  if (a3 <= 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "fileSize > 0";
    goto LABEL_6;
  }
  if (a4 <= 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = "mediaDataSize > 0";
LABEL_6:
    v13 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), a4, v4, v5, v6, v7, (uint64_t)v12), 0);
    objc_exception_throw(v13);
  }
  -[AVAssetWriterHelper setSinglePassFileSize:](-[AVAssetWriter _helper](self, "_helper"), "setSinglePassFileSize:", a3);
  -[AVAssetWriterHelper setSinglePassMediaDataSize:](-[AVAssetWriter _helper](self, "_helper"), "setSinglePassMediaDataSize:", a4);
}

- (NSArray)inputs
{
  return -[AVAssetWriterHelper inputs](-[AVAssetWriter _helper](self, "_helper"), "inputs");
}

- (NSArray)inputGroups
{
  return -[AVAssetWriterHelper inputGroups](-[AVAssetWriter _helper](self, "_helper"), "inputGroups");
}

- (BOOL)canApplyOutputSettings:(NSDictionary *)outputSettings forMediaType:(AVMediaType)mediaType
{
  return -[AVAssetWriterHelper canApplyOutputSettings:forMediaType:](-[AVAssetWriter _helper](self, "_helper"), "canApplyOutputSettings:forMediaType:", outputSettings, mediaType);
}

- (BOOL)canAddInput:(AVAssetWriterInput *)input
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  if (!input)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"input != nil"), 0);
    objc_exception_throw(v9);
  }
  return -[AVAssetWriterHelper canAddInput:](-[AVAssetWriter _helper](self, "_helper"), "canAddInput:", input);
}

- (void)addInput:(AVAssetWriterInput *)input
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!input)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"input != nil"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterHelper addInput:](-[AVAssetWriter _helper](self, "_helper"), "addInput:", input);
}

- (BOOL)canAddInputGroup:(AVAssetWriterInputGroup *)inputGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  if (!inputGroup)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"inputGroup != nil"), 0);
    objc_exception_throw(v9);
  }
  return -[AVAssetWriterHelper canAddInputGroup:](-[AVAssetWriter _helper](self, "_helper"), "canAddInputGroup:", inputGroup);
}

- (void)addInputGroup:(AVAssetWriterInputGroup *)inputGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!inputGroup)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"inputGroup != nil"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterHelper addInputGroup:](-[AVAssetWriter _helper](self, "_helper"), "addInputGroup:", inputGroup);
}

- (NSArray)metadata
{
  return -[AVAssetWriterHelper metadata](-[AVAssetWriter _helper](self, "_helper"), "metadata");
}

- (void)setMetadata:(NSArray *)metadata
{
  id v4;
  id v5;

  if (metadata)
  {
    v5 = 0;
    v4 = +[AVMetadataItem _metadataArrayWithSmartDeferredLoadingForMetataArray:error:](AVMetadataItem, "_metadataArrayWithSmartDeferredLoadingForMetataArray:error:", metadata, &v5);
    if (v4)
    {
      -[AVAssetWriterHelper setMetadata:](-[AVAssetWriter _helper](self, "_helper"), "setMetadata:", v4);
    }
    else if (objc_msgSend(v5, "code") == -11999)
    {
      objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v5, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
    }
  }
}

- (BOOL)startWriting
{
  -[AVAssetWriterHelper startWriting](-[AVAssetWriter _helper](self, "_helper"), "startWriting");
  return -[AVAssetWriter status](self, "status") == AVAssetWriterStatusWriting;
}

- (void)startSessionAtSourceTime:(CMTime *)startTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAssetWriterHelper *v9;
  void *v10;
  CMTime v11;

  if ((startTime->flags & 0x1D) != 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"CMTIME_IS_NUMERIC(startTime)"), 0);
    objc_exception_throw(v10);
  }
  v9 = -[AVAssetWriter _helper](self, "_helper");
  v11 = *startTime;
  -[AVAssetWriterHelper startSessionAtSourceTime:](v9, "startSessionAtSourceTime:", &v11);
}

- (void)endSessionAtSourceTime:(CMTime *)endTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAssetWriterHelper *v9;
  void *v10;
  CMTime v11;

  if ((endTime->flags & 0x1D) != 1)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"CMTIME_IS_NUMERIC(endTime)"), 0);
    objc_exception_throw(v10);
  }
  v9 = -[AVAssetWriter _helper](self, "_helper");
  v11 = *endTime;
  -[AVAssetWriterHelper endSessionAtSourceTime:](v9, "endSessionAtSourceTime:", &v11);
}

- (void)cancelWriting
{
  -[AVAssetWriterHelper cancelWriting](-[AVAssetWriter _helper](self, "_helper"), "cancelWriting");
}

- (BOOL)finishWriting
{
  -[AVAssetWriterHelper finishWriting](-[AVAssetWriter _helper](self, "_helper"), "finishWriting");
  return -[AVAssetWriter status](self, "status") == AVAssetWriterStatusCompleted;
}

- (void)finishWritingWithCompletionHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!handler)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"handler != nil"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterHelper finishWritingWithCompletionHandler:](-[AVAssetWriter _helper](self, "_helper"), "finishWritingWithCompletionHandler:", handler);
}

- (id)finishWritingDelegate
{
  return objc_loadWeak((id *)&self->_internal->finishWritingDelegate);
}

- (void)setFinishWritingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_internal->finishWritingDelegate, a3);
}

+ (id)_errorForOSStatus:(int)a3
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a3 == -17698)
  {
    v4 = *MEMORY[0x1E0CB2938];
    v5[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot append tagged buffer group due to mismatch between video layer IDs in tagged buffer group and value of kVTCompressionPropertyKey_MVHEVCVideoLayerIDs in the AVVideoCompressionPropertiesKey sub-dictionary of the input's outputSettings"));
    return (id)AVLocalizedErrorWithUnderlyingOSStatus(-17698, (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1));
  }
  else if (a3)
  {
    if (a3 == -12785)
      return (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11847, 0);
    else
      return (id)AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
  }
  else
  {
    return 0;
  }
}

- (void)_transitionToFailedStatusWithError:(id)a3
{
  -[AVAssetWriterHelper transitionToFailedStatusWithError:](-[AVAssetWriter _helper](self, "_helper"), "transitionToFailedStatusWithError:", a3);
}

- (void)flush
{
  -[AVAssetWriterHelper flush](-[AVAssetWriter _helper](self, "_helper"), "flush");
}

- (void)flushSegment
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  CMTime v13;
  CMTime time1;
  CMTime v15;

  -[AVAssetWriter delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = CFSTR("-flushSegment can be called only if the delegate method to output segment data is implemented.");
LABEL_9:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v11, v4, v5, v6, v7, v8, v13.value), 0);
    objc_exception_throw(v12);
  }
  memset(&v15, 0, sizeof(v15));
  if (self)
    -[AVAssetWriter preferredOutputSegmentInterval](self, "preferredOutputSegmentInterval");
  time1 = v15;
  v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  if (CMTimeCompare(&time1, &v13))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = CFSTR("-flushSegment can be called only if the value of the preferredOutputSegmentInterval property is kCMTimeIndefinite.");
    goto LABEL_9;
  }
  -[AVAssetWriterHelper flushSegment](-[AVAssetWriter _helper](self, "_helper"), "flushSegment");
}

- (BOOL)isDefunct
{
  return -[AVAssetWriterHelper _isDefunct](-[AVAssetWriter _helper](self, "_helper"), "_isDefunct");
}

@end
