@implementation AVAssetReaderOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVAssetReaderOutput)init
{
  AVAssetReaderOutput *v3;
  uint64_t v4;
  AVAssetReaderOutputInternal *v5;
  void *v6;
  CMTime v8;
  CMTime start;
  CMTimeRange v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVAssetReaderOutput;
  v3 = -[AVAssetReaderOutput init](&v11, sel_init);
  v4 = objc_opt_class();
  AVRequireConcreteObject(v3, a2, v4);
  if (v3)
  {
    v5 = objc_alloc_init(AVAssetReaderOutputInternal);
    v3->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v3->_internal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v3);
      v6 = (void *)MEMORY[0x1E0CB3B18];
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      v8 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
      CMTimeRangeMake(&v10, &start, &v8);
      v12[0] = objc_msgSend(v6, "valueWithCMTimeRange:", &v10);
      v3->_internal->currentTimeRanges = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v3->_internal->sampleBufferAvailabilityCondition = objc_alloc_init(AVRunLoopCondition);
      v3->_internal->alwaysCopiesSampleData = 1;
      v3->_internal->maximizePowerEfficiency = 0;
      v3->_internal->disablesMultithreadedAndAsyncVideoDecompression = 0;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  AVAssetReaderOutputInternal *internal;
  id v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    if (internal->figAssetReader)
    {
      v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderSampleBufferDidBecomeAvailable, *MEMORY[0x1E0CC3B40], self->_internal->figAssetReader);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderDecodeError, *MEMORY[0x1E0CC3B30], self->_internal->figAssetReader);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderFailed, *MEMORY[0x1E0CC3B38], self->_internal->figAssetReader);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *MEMORY[0x1E0CC3B48], self->_internal->figAssetReader);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *MEMORY[0x1E0CA4B88], self->_internal->figAssetReader);
      CFRelease(self->_internal->weakReference);
      CFRelease(self->_internal->figAssetReader);
      internal = self->_internal;
    }

    CFRelease(self->_internal);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetReaderOutput;
  -[AVAssetReaderOutput dealloc](&v5, sel_dealloc);
}

- (AVMediaType)mediaType
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)alwaysCopiesSampleData
{
  return self->_internal->alwaysCopiesSampleData;
}

- (void)setAlwaysCopiesSampleData:(BOOL)alwaysCopiesSampleData
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  self->_internal->alwaysCopiesSampleData = alwaysCopiesSampleData;
}

- (BOOL)maximizePowerEfficiency
{
  return self->_internal->maximizePowerEfficiency;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  self->_internal->maximizePowerEfficiency = a3;
}

- (BOOL)disablesMultithreadedAndAsyncVideoDecompression
{
  return self->_internal->disablesMultithreadedAndAsyncVideoDecompression;
}

- (void)setDisablesMultithreadedAndAsyncVideoDecompression:(BOOL)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (!-[NSString isEqualToString:](-[AVAssetReaderOutput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("vide")))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("cannot use disablesMultithreadedAndAsyncVideoDecompression for non video media type");
    goto LABEL_6;
  }
  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = CFSTR("cannot be called after reading has started");
LABEL_6:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  self->_internal->disablesMultithreadedAndAsyncVideoDecompression = a3;
}

- (BOOL)supportsRandomAccess
{
  return self->_internal->supportsRandomAccess;
}

- (void)setSupportsRandomAccess:(BOOL)supportsRandomAccess
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetReaderOutput _status](self, "_status") >= 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot be called after reading has started"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  self->_internal->supportsRandomAccess = supportsRandomAccess;
}

- (id)_asset
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (OpaqueFigAssetReader)_figAssetReader
{
  return self->_internal->figAssetReader;
}

- (void)_setFigAssetReader:(OpaqueFigAssetReader *)a3
{
  id v5;
  void *v6;
  AVAssetReaderOutputInternal *internal;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  OpaqueFigAssetReader *figAssetReader;

  if (self->_internal->figAssetReader != a3)
  {
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = v5;
    internal = self->_internal;
    v8 = (_QWORD *)MEMORY[0x1E0CC3B40];
    v9 = (_QWORD *)MEMORY[0x1E0CC3B30];
    v10 = (_QWORD *)MEMORY[0x1E0CC3B38];
    v11 = (_QWORD *)MEMORY[0x1E0CC3B48];
    v12 = (_QWORD *)MEMORY[0x1E0CA4B88];
    if (internal->figAssetReader)
    {
      objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", internal->weakReference, figAssetReaderSampleBufferDidBecomeAvailable, *MEMORY[0x1E0CC3B40]);
      objc_msgSend(v6, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderDecodeError, *v9, self->_internal->figAssetReader);
      objc_msgSend(v6, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderFailed, *v10, self->_internal->figAssetReader);
      objc_msgSend(v6, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *v11, self->_internal->figAssetReader);
      objc_msgSend(v6, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *v12, self->_internal->figAssetReader);
      CFRelease(self->_internal->weakReference);
      CFRelease(self->_internal->figAssetReader);
      internal = self->_internal;
    }
    internal->figAssetReader = a3;
    figAssetReader = self->_internal->figAssetReader;
    if (figAssetReader)
    {
      CFRetain(figAssetReader);
      CFRetain(self->_internal->weakReference);
      objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, figAssetReaderSampleBufferDidBecomeAvailable, *v8, self->_internal->figAssetReader, 0);
      objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, figAssetReaderDecodeError, *v9, self->_internal->figAssetReader, 0);
      objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, figAssetReaderFailed, *v10, self->_internal->figAssetReader, 0);
      objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *v11, self->_internal->figAssetReader, 0);
      objc_msgSend(v6, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, figAssetReaderServerConnectionDied, *v12, self->_internal->figAssetReader, 0);
    }
  }
}

- (AVWeakReference)_weakReferenceToAssetReader
{
  return self->_internal->weakReferenceToAssetReader;
}

- (void)_attachToWeakReferenceToAssetReader:(id)a3
{
  if (self->_internal->weakReferenceToAssetReader)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetReaderOutput.m"), 948, CFSTR("The receiver cannot already be attached to an AVAssetReader."));
  self->_internal->weakReferenceToAssetReader = (AVWeakReference *)a3;
  -[AVAssetReaderOutput _setFigAssetReader:](self, "_setFigAssetReader:", objc_msgSend(-[AVWeakReference referencedObject](self->_internal->weakReferenceToAssetReader, "referencedObject"), "_figAssetReader"));
}

- (int64_t)_status
{
  int64_t result;

  result = -[AVWeakReference referencedObject](-[AVAssetReaderOutput _weakReferenceToAssetReader](self, "_weakReferenceToAssetReader"), "referencedObject");
  if (result)
    return objc_msgSend((id)result, "status");
  return result;
}

- (int)_extractionID
{
  return self->_internal->extractionID;
}

- (void)_setExtractionID:(int)a3
{
  self->_internal->extractionID = a3;
}

- (NSDictionary)_figAssetReaderExtractionOptions
{
  _BOOL8 v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;

  v3 = -[AVAssetReaderOutput _trimsSampleDurations](self, "_trimsSampleDurations");
  v4 = -[AVAssetReaderOutput supportsRandomAccess](self, "supportsRandomAccess");
  v15 = (void *)MEMORY[0x1E0C99D80];
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = *MEMORY[0x1E0CC3B10];
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAssetReaderOutput alwaysCopiesSampleData](self, "alwaysCopiesSampleData"));
  v8 = *MEMORY[0x1E0CC3AE0];
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = *MEMORY[0x1E0CC5C50];
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAssetReaderOutput maximizePowerEfficiency](self, "maximizePowerEfficiency"));
  v12 = *MEMORY[0x1E0CC3B08];
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAssetReaderOutput disablesMultithreadedAndAsyncVideoDecompression](self, "disablesMultithreadedAndAsyncVideoDecompression"));
  return (NSDictionary *)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, v10, v11, v12, v13, *MEMORY[0x1E0CC3AE8], 0);
}

+ (id)_figAssetReaderVideoScalingPropertiesFromVideoSettings:(id)a3 withFormatDescription:(id)a4
{
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a3, "videoScalingProperties"));
  objc_msgSend(a3, "colorPropertiesConsideringFormatDescriptions:colorPrimaries:transferFunction:ycbcrMatrix:", a4, &v10, &v9, &v8);
  if (v10)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CED7C0]);
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CED7E0]);
  if (v9)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CED7D8]);
  return v6;
}

- (BOOL)_trimsSampleDurations
{
  return 1;
}

- (BOOL)_updateTimeRangesOnFigAssetReaderReturningError:(id *)a3
{
  id v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, void *, size_t);
  _QWORD v12[5];

  v5 = -[AVAssetReaderOutput currentTimeRanges](self, "currentTimeRanges");
  v6 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
  if (v6)
  {
    v7 = objc_msgSend(v5, "count");
    v8 = malloc_type_calloc(v7, 0x30uLL, 0x1000040EED21634uLL);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__AVAssetReaderOutput__updateTimeRangesOnFigAssetReaderReturningError___block_invoke;
    v12[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v12[4] = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
    self->_internal->extractionCompleteForCurrentConfiguration = 0;
    v9 = -[AVAssetReaderOutput _extractionID](self, "_extractionID");
    v10 = *(uint64_t (**)(uint64_t, uint64_t, void *, size_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
    if (v10)
    {
      v6 = v10(v6, v9, v8, v7);
      if (!a3)
        goto LABEL_9;
    }
    else
    {
      v6 = 4294954514;
      if (!a3)
        goto LABEL_9;
    }
    if ((_DWORD)v6)
    {
      *a3 = -[AVAssetReaderOutput _errorForOSStatus:](self, "_errorForOSStatus:", v6);
      LODWORD(v6) = 1;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_9:
  free(v8);
  return (_DWORD)v6 == 0;
}

__n128 __71__AVAssetReaderOutput__updateTimeRangesOnFigAssetReaderReturningError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  __n128 *v5;
  __n128 result;
  __n128 v7;
  __n128 v8;
  __n128 v9;

  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "CMTimeRangeValue");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  v5 = (__n128 *)(v4 + 48 * a3);
  result = v7;
  v5[1] = v8;
  v5[2] = v9;
  *v5 = v7;
  return result;
}

- (BOOL)_prepareForReadingReturningError:(id *)a3
{
  if (!-[AVAssetReaderOutput supportsRandomAccess](self, "supportsRandomAccess"))
    self->_internal->currentConfigurationIsFinal = 1;
  return -[AVAssetReaderOutput _enableTrackExtractionReturningError:](self, "_enableTrackExtractionReturningError:", a3);
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)currentTimeRanges
{
  return self->_internal->currentTimeRanges;
}

- (BOOL)_isFinished
{
  return self->_internal->finished > 0;
}

- (void)_markAsFinished
{
  -[AVAssetReaderOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
  FigAtomicIncrement32();
  -[AVAssetReaderOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
}

- (void)_cancelReading
{
  -[AVAssetReaderOutput _setFigAssetReader:](self, "_setFigAssetReader:", 0);
}

- (id)_errorForOSStatus:(int)a3
{
  return +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:", *(_QWORD *)&a3);
}

- (CMSampleBufferRef)copyNextSampleBuffer
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  OpaqueFigAssetReader *v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigAssetReader *, uint64_t, _QWORD, char *, opaqueCMSampleBuffer **);
  uint64_t v15;
  AVRunLoopCondition *sampleBufferAvailabilityCondition;
  void *v17;
  uint64_t v18;
  opaqueCMSampleBuffer *v19;

  v4 = -[AVAssetReaderOutput _status](self, "_status");
  if (v4 > 1)
    return 0;
  if (!v4)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot copy next sample buffer before adding this output to an instance of AVAssetReader (using -addOutput:) and calling -startReading on that asset reader"), v5, v6, v7, v8, v9, v18), 0);
    objc_exception_throw(v17);
  }
  v19 = 0;
  HIBYTE(v18) = 0;
  -[NSCondition lock](self->_internal->sampleBufferAvailabilityCondition, "lock");
  for (i = *MEMORY[0x1E0CA3680]; ; -[AVRunLoopCondition waitInMode:](sampleBufferAvailabilityCondition, "waitInMode:", i))
  {
    v12 = -[AVAssetReaderOutput _figAssetReader](self, "_figAssetReader");
    v13 = -[AVAssetReaderOutput _extractionID](self, "_extractionID");
    v14 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, _QWORD, char *, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
    v15 = v14 ? v14(v12, v13, 0, (char *)&v18 + 7, &v19) : 4294954514;
    sampleBufferAvailabilityCondition = self->_internal->sampleBufferAvailabilityCondition;
    if ((_DWORD)v15 || v19 || HIBYTE(v18))
      break;
  }
  -[NSCondition unlock](sampleBufferAvailabilityCondition, "unlock");
  if ((_DWORD)v15)
  {
    objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetReaderOutput _weakReferenceToAssetReader](self, "_weakReferenceToAssetReader"), "referencedObject"), "_transitionToStatus:failureError:", 3, -[AVAssetReaderOutput _errorForOSStatus:](self, "_errorForOSStatus:", v15));
  }
  else if (HIBYTE(v18))
  {
    self->_internal->extractionCompleteForCurrentConfiguration = 1;
    if (self->_internal->currentConfigurationIsFinal)
      -[AVAssetReaderOutput _markAsFinished](self, "_markAsFinished");
  }
  if (HIBYTE(v18))
    return 0;
  else
    return v19;
}

- (void)_figAssetReaderSampleBufferDidBecomeAvailableForExtractionID:(int)a3
{
  AVAssetReaderOutputInternal *internal;

  internal = self->_internal;
  if (internal->extractionID == a3)
  {
    -[NSCondition lock](internal->sampleBufferAvailabilityCondition, "lock");
    -[AVRunLoopCondition signal](self->_internal->sampleBufferAvailabilityCondition, "signal");
    -[NSCondition unlock](self->_internal->sampleBufferAvailabilityCondition, "unlock");
  }
}

- (void)resetForReadingTimeRanges:(NSArray *)timeRanges
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CMTime *v13;
  uint64_t i;
  void *v15;
  CMTimeFlags flags;
  AVAssetReaderOutputInternal *internal;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  int64_t v24;
  NSString *v25;
  CMTimeRange time1;
  CMTime time2;
  CMTimeRange v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CMTime v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!timeRanges)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v25 = (NSString *)"timeRanges != nil";
    v20 = CFSTR("invalid parameter not satisfying: %s");
    goto LABEL_26;
  }
  v9 = *MEMORY[0x1E0CA2E28];
  v35.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)&v35.value = v9;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v10)
    goto LABEL_17;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  v13 = (CMTime *)MEMORY[0x1E0CA2E68];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(timeRanges);
      v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v21 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v21);
        v20 = CFSTR("Each entry in timeRanges must be an instance of %@");
        goto LABEL_26;
      }
      memset(&v30, 0, sizeof(v30));
      if (!v15 || (objc_msgSend(v15, "CMTimeRangeValue"), (v30.start.flags & 0x1D) != 1))
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v20 = CFSTR("Start time of each time range must be numeric - see CMTIME_IS_NUMERIC");
        goto LABEL_26;
      }
      flags = v30.duration.flags;
      if ((v30.duration.flags & 0x1D) == 1)
      {
        time1.start = v30.duration;
        time2 = *v13;
        if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
          goto LABEL_14;
        flags = v30.duration.flags;
      }
      if ((~flags & 5) != 0)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v20 = CFSTR("Duration of each time range must be nonnegative & numeric or positive infinity - see CMTIME_IS_NUMERIC");
        goto LABEL_26;
      }
LABEL_14:
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v30.start.value;
      time1.start.epoch = v30.start.epoch;
      time2 = v35;
      if (CMTimeCompare(&time1.start, &time2) < 0)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99778];
        v20 = CFSTR("Start time of each time range must be greater than or equal to the end time of the previous time range");
LABEL_26:
        v22 = (objc_class *)self;
        goto LABEL_27;
      }
      time1 = v30;
      CMTimeRangeGetEnd(&v35, &time1);
    }
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v11);
LABEL_17:
  if (-[AVAssetReaderOutput _status](self, "_status") <= 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("cannot be called before reading has started");
LABEL_34:
    v22 = (objc_class *)self;
LABEL_27:
    v23 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector(v22, a2, (uint64_t)v20, v3, v4, v5, v6, v7, (uint64_t)v25), 0);
    objc_exception_throw(v23);
  }
  if (!self->_internal->extractionCompleteForCurrentConfiguration)
  {
    v24 = -[AVAssetReaderOutput _status](self, "_status");
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    if (v24 == 3)
    {
      v20 = CFSTR("cannot be called after the asset reader has entered a failure state");
    }
    else
    {
      v25 = NSStringFromSelector(sel_copyNextSampleBuffer);
      v20 = CFSTR("cannot be called until all samples have been read (i.e. %@ returns NULL)");
    }
    goto LABEL_26;
  }
  if (!-[AVAssetReaderOutput supportsRandomAccess](self, "supportsRandomAccess"))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v25 = NSStringFromSelector(sel_supportsRandomAccess);
    v20 = CFSTR("cannot be called without setting %@ to YES");
    goto LABEL_34;
  }
  internal = self->_internal;
  if (internal->currentConfigurationIsFinal)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v25 = NSStringFromSelector(sel_markConfigurationAsFinal);
    v20 = CFSTR("cannot be called after calling %@");
    goto LABEL_34;
  }

  self->_internal->currentTimeRanges = (NSArray *)-[NSArray copy](timeRanges, "copy");
  -[AVAssetReaderOutput _updateTimeRangesOnFigAssetReaderReturningError:](self, "_updateTimeRangesOnFigAssetReaderReturningError:", 0);
}

- (void)markConfigurationAsFinal
{
  self->_internal->currentConfigurationIsFinal = 1;
  if (self->_internal->extractionCompleteForCurrentConfiguration)
    -[AVAssetReaderOutput _markAsFinished](self, "_markAsFinished");
}

- (void)_figAssetReaderDecodeError
{
  -[NSCondition lock](self->_internal->sampleBufferAvailabilityCondition, "lock");
  -[AVRunLoopCondition signal](self->_internal->sampleBufferAvailabilityCondition, "signal");
  -[NSCondition unlock](self->_internal->sampleBufferAvailabilityCondition, "unlock");
}

- (void)_figAssetReaderFailed
{
  -[NSCondition lock](self->_internal->sampleBufferAvailabilityCondition, "lock");
  -[AVRunLoopCondition signal](self->_internal->sampleBufferAvailabilityCondition, "signal");
  -[NSCondition unlock](self->_internal->sampleBufferAvailabilityCondition, "unlock");
}

- (void)_figAssetReaderServerConnectionDied
{
  -[NSCondition lock](self->_internal->sampleBufferAvailabilityCondition, "lock");
  -[AVRunLoopCondition signal](self->_internal->sampleBufferAvailabilityCondition, "signal");
  -[NSCondition unlock](self->_internal->sampleBufferAvailabilityCondition, "unlock");
}

@end
