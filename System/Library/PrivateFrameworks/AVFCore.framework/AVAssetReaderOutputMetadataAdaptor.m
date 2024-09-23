@implementation AVAssetReaderOutputMetadataAdaptor

+ (AVAssetReaderOutputMetadataAdaptor)assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  return (AVAssetReaderOutputMetadataAdaptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAssetReaderTrackOutput:", trackOutput);
}

- (AVAssetReaderOutputMetadataAdaptor)init
{
  return -[AVAssetReaderOutputMetadataAdaptor initWithAssetReaderTrackOutput:](self, "initWithAssetReaderTrackOutput:", 0);
}

- (AVAssetReaderOutputMetadataAdaptor)initWithAssetReaderTrackOutput:(AVAssetReaderTrackOutput *)trackOutput
{
  objc_class *v6;
  NSString *v7;
  uint64_t v8;
  AVAssetReaderOutputMetadataAdaptor *v9;
  AVAssetReaderOutputMetadataAdaptorInternal *v10;
  AVAssetReaderOutputMetadataAdaptor *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  AVAssetReaderOutputMetadataAdaptor *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  AVAssetReaderOutputMetadataAdaptor *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  AVAssetReaderOutputMetadataAdaptor *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!trackOutput)
  {
    v12 = self;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "trackOutput != nil";
LABEL_12:
    v22 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v13, v14, v15, v16, v17, (uint64_t)v20);
    v23 = v18;
    v24 = v19;
    goto LABEL_16;
  }
  v8 = (uint64_t)v7;
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](trackOutput, "mediaType"), "isEqualToString:", CFSTR("meta")) & 1) == 0)
  {
    v21 = self;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "[[trackOutput mediaType] isEqualToString:AVMediaTypeMetadata]";
    goto LABEL_12;
  }
  if (-[AVAssetReaderTrackOutput _isAttachedToAdaptor](trackOutput, "_isAttachedToAdaptor"))
  {
    v25 = self;
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@"), v28, v29, v30, v31, v32, v8);
LABEL_15:
    v22 = v33;
    v23 = v26;
    v24 = v27;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v22, 0));
  }
  if (-[AVAssetReaderOutput _status](trackOutput, "_status") >= 1)
  {
    v34 = self;
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v33 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown"), v35, v36, v37, v38, v39, v8);
    goto LABEL_15;
  }
  v40.receiver = self;
  v40.super_class = (Class)AVAssetReaderOutputMetadataAdaptor;
  v9 = -[AVAssetReaderOutputMetadataAdaptor init](&v40, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(AVAssetReaderOutputMetadataAdaptorInternal);
    v9->_internal = v10;
    if (v10)
    {
      CFRetain(v10);
      v9->_internal->trackOutput = trackOutput;
      -[AVAssetReaderTrackOutput _setAttachedAdaptor:](trackOutput, "_setAttachedAdaptor:", v9);
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  AVAssetReaderOutputMetadataAdaptorInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderOutputMetadataAdaptor;
  -[AVAssetReaderOutputMetadataAdaptor dealloc](&v4, sel_dealloc);
}

- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6
{
  uint64_t v9;
  uint64_t (*v10)(OpaqueFigAssetReader *, uint64_t, id, int *);

  v9 = objc_msgSend((id)objc_msgSend(a3, "track"), "trackID");
  v10 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 24);
  if (v10)
    return v10(a4, v9, a5, a6);
  else
    return -12782;
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_internal->trackOutput;
}

- (AVTimedMetadataGroup)nextTimedMetadataGroup
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVTimedMetadataGroup *v10;
  opaqueCMSampleBuffer *v11;
  AVTimedMetadataGroup *v12;
  BOOL v13;
  void *v15;
  uint64_t v16;

  v4 = -[AVAssetReaderOutput _status](self->_internal->trackOutput, "_status");
  if (v4 == 1)
  {
    v11 = 0;
    do
    {
      if (v11)
        CFRelease(v11);
      v11 = -[AVAssetReaderTrackOutput _copyNextSampleBufferForAdaptor](self->_internal->trackOutput, "_copyNextSampleBufferForAdaptor");
      v12 = -[AVTimedMetadataGroup initWithSampleBuffer:]([AVTimedMetadataGroup alloc], "initWithSampleBuffer:", v11);
      if (v12)
        v13 = 1;
      else
        v13 = v11 == 0;
    }
    while (!v13);
    v10 = v12;
    if (v11)
      CFRelease(v11);
  }
  else
  {
    if (!v4)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("cannot call method until the track output is attached to an asset reader and -startReading has been called on that asset reader"), v5, v6, v7, v8, v9, v16), 0);
      objc_exception_throw(v15);
    }
    return 0;
  }
  return v10;
}

@end
