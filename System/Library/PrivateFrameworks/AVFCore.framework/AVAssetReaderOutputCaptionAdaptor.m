@implementation AVAssetReaderOutputCaptionAdaptor

+ (AVAssetReaderOutputCaptionAdaptor)assetReaderOutputCaptionAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  return (AVAssetReaderOutputCaptionAdaptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAssetReaderTrackOutput:", trackOutput);
}

- (AVAssetReaderOutputCaptionAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  AVAssetReaderOutputCaptionAdaptor *v9;
  AVAssetReaderOutputCaptionAdaptorInternal *v10;
  AVAssetReaderOutputCaptionAdaptor *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AVAssetReaderOutputCaptionAdaptor *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  AVAssetReaderOutputCaptionAdaptor *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  AVAssetReaderOutputCaptionAdaptor *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!trackOutput)
  {
    v12 = self;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v20 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v15, v16, v17, v18, v19, (uint64_t)"trackOutput != nil");
LABEL_12:
    v27 = v20;
    v28 = v13;
    v29 = v14;
    goto LABEL_16;
  }
  v8 = (uint64_t)v7;
  if ((objc_msgSend((id)AVMediaTypesForCaptionEditing(), "containsObject:", -[AVAssetReaderTrackOutput mediaType](trackOutput, "mediaType")) & 1) == 0)
  {
    v21 = self;
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v20 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot create a new caption adaptor with an unsupported media type"), v22, v23, v24, v25, v26, v45);
    goto LABEL_12;
  }
  if (-[AVAssetReaderTrackOutput _isAttachedToAdaptor](trackOutput, "_isAttachedToAdaptor"))
  {
    v30 = self;
    v31 = (void *)MEMORY[0x1E0C99DA0];
    v32 = *MEMORY[0x1E0C99778];
    v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@"), v33, v34, v35, v36, v37, v8);
LABEL_15:
    v27 = v38;
    v28 = v31;
    v29 = v32;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v27, 0));
  }
  if (-[AVAssetReaderOutput _status](trackOutput, "_status") >= 1)
  {
    v39 = self;
    v31 = (void *)MEMORY[0x1E0C99DA0];
    v32 = *MEMORY[0x1E0C99778];
    v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown"), v40, v41, v42, v43, v44, v8);
    goto LABEL_15;
  }
  v46.receiver = self;
  v46.super_class = (Class)AVAssetReaderOutputCaptionAdaptor;
  v9 = -[AVAssetReaderOutputCaptionAdaptor init](&v46, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(AVAssetReaderOutputCaptionAdaptorInternal);
    v9->_internal = v10;
    if (!v10
      || (CFRetain(v10),
          v9->_internal->trackOutput = trackOutput,
          -[AVAssetReaderTrackOutput _setAttachedAdaptor:](v9->_internal->trackOutput, "_setAttachedAdaptor:", v9),
          v9->_internal->avCaptionGroupOutputQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]),
          v9->_internal->figCaptionToAVCaptionMapping = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), v9->_internal->endOfStream = 0, FigCaptionTimelineGeneratorCreate()))
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  AVAssetReaderOutputCaptionAdaptorInternal *internal;
  AVAssetReaderOutputCaptionAdaptorInternal *v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    if (v4->figCaptionToAVCaptionMapping)
    {
      CFRelease(v4->figCaptionToAVCaptionMapping);
      v4 = self->_internal;
    }
    if (v4->sbufToCaptionGroupConverter)
    {
      CFRelease(v4->sbufToCaptionGroupConverter);
      v4 = self->_internal;
    }
    CFRelease(v4);
    internal = self->_internal;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVAssetReaderOutputCaptionAdaptor;
  -[AVAssetReaderOutputCaptionAdaptor dealloc](&v5, sel_dealloc);
}

- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6
{
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigAssetReader *, uint64_t, id, int *);

  v9 = objc_msgSend((id)objc_msgSend(a3, "track"), "trackID");
  v10 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 136);
  if (v10)
    return v10(a4, v9, a5, a6);
  else
    return -12782;
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_internal->trackOutput;
}

- (id)_readSampleBuffersAndReturnAVCaption
{
  opaqueCMSampleBuffer *v3;
  AVAssetReaderOutputCaptionAdaptorInternal *internal;
  id v6;

  v3 = 0;
  while (!-[NSMutableArray count](self->_internal->avCaptionGroupOutputQueue, "count"))
  {
    internal = self->_internal;
    if (internal->endOfStream)
      break;
    if (v3)
    {
      CFRelease(v3);
      internal = self->_internal;
    }
    v3 = -[AVAssetReaderTrackOutput _copyNextSampleBufferForAdaptor](internal->trackOutput, "_copyNextSampleBufferForAdaptor");
    if (v3)
    {
      if (FigCaptionTimelineGeneratorAddSampleBuffer())
      {
        v6 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      FigCaptionTimelineGeneratorFinish();
      self->_internal->endOfStream = 1;
    }
  }
  if (-[NSMutableArray count](self->_internal->avCaptionGroupOutputQueue, "count"))
  {
    v6 = (id)-[NSMutableArray objectAtIndex:](self->_internal->avCaptionGroupOutputQueue, "objectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_internal->avCaptionGroupOutputQueue, "removeObjectAtIndex:", 0);
    if (!v3)
      return v6;
    goto LABEL_14;
  }
  v6 = 0;
  if (v3)
LABEL_14:
    CFRelease(v3);
  return v6;
}

- (AVCaptionGroup)nextCaptionGroup
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;

  v4 = -[AVAssetReaderOutput _status](-[AVAssetReaderOutputCaptionAdaptor assetReaderTrackOutput](self, "assetReaderTrackOutput"), "_status");
  if (!v4)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot call method until the track output is attached to an asset reader and -startReading has been called on that asset reader"), v5, v6, v7, v8, v9, v12), 0);
    objc_exception_throw(v11);
  }
  if (v4 > 2)
    return 0;
  else
    return (AVCaptionGroup *)-[AVAssetReaderOutputCaptionAdaptor _readSampleBuffersAndReturnAVCaption](self, "_readSampleBuffersAndReturnAVCaption");
}

- (NSArray)captionsNotPresentInPreviousGroupsInCaptionGroup:(AVCaptionGroup *)captionGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v17;
  CMTime time2;
  CMTime time1;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!captionGroup)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"captionGroup != nil"), 0);
    objc_exception_throw(v17);
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[AVCaptionGroup timeRange](captionGroup, "timeRange");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = -[AVCaptionGroup captions](captionGroup, "captions");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v20 = 0u;
        if (v15)
          objc_msgSend(v15, "timeRange");
        *(_OWORD *)&time1.value = v20;
        time1.epoch = v21;
        *(_OWORD *)&time2.value = v27;
        time2.epoch = v28;
        if (!CMTimeCompare(&time1, &time2))
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v12);
  }
  return (NSArray *)v9;
}

- (void)setValidationDelegate:(id)validationDelegate
{
  AVAssetReaderOutputCaptionAdaptorInternal *internal;
  AVWeakReference *v6;

  internal = self->_internal;
  objc_sync_enter(internal);
  v6 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", validationDelegate);

  self->_internal->validationDelegate = v6;
  objc_sync_exit(internal);
}

- (id)validationDelegate
{
  AVAssetReaderOutputCaptionAdaptorInternal *internal;
  id v4;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = -[AVWeakReference referencedObject](self->_internal->validationDelegate, "referencedObject");
  objc_sync_exit(internal);
  return v4;
}

- (void)appendOutputCaptionGroup:(id)a3
{
  -[NSMutableArray addObject:](self->_internal->avCaptionGroupOutputQueue, "addObject:", a3);
}

- (id)pairedAVCaptionForFigCaption:(OpaqueFigCaption *)a3
{
  return (id)CFDictionaryGetValue(self->_internal->figCaptionToAVCaptionMapping, a3);
}

- (void)setFigCaptionToAVCaptionMapping:(__CFDictionary *)a3
{
  AVAssetReaderOutputCaptionAdaptorInternal *internal;
  __CFDictionary *figCaptionToAVCaptionMapping;

  internal = self->_internal;
  figCaptionToAVCaptionMapping = internal->figCaptionToAVCaptionMapping;
  internal->figCaptionToAVCaptionMapping = a3;
  if (a3)
    CFRetain(a3);
  if (figCaptionToAVCaptionMapping)
    CFRelease(figCaptionToAVCaptionMapping);
}

@end
