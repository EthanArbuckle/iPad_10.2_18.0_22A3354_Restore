@implementation AVAssetWriterInputMetadataAdaptor

+ (void)initialize
{
  objc_opt_class();
}

+ (AVAssetWriterInputMetadataAdaptor)assetWriterInputMetadataAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input
{
  return (AVAssetWriterInputMetadataAdaptor *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetWriterInput:", input);
}

- (AVAssetWriterInputMetadataAdaptor)init
{
  return -[AVAssetWriterInputMetadataAdaptor initWithAssetWriterInput:](self, "initWithAssetWriterInput:", 0);
}

- (AVAssetWriterInputMetadataAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input
{
  AVAssetWriterInputMetadataAdaptor *v5;
  AVAssetWriterInputMetadataAdaptor *v6;
  AVAssetWriterInputMetadataAdaptorInternal *v7;
  AVAssetWriterInputMetadataAdaptor *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  AVAssetWriterInputMetadataAdaptor *v18;
  uint64_t v19;
  AVAssetWriterInputMetadataAdaptor *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  AVAssetWriterInputMetadataAdaptor *v27;
  AVAssetWriterInputMetadataAdaptor *v28;
  AVAssetWriterInputMetadataAdaptor *v29;
  objc_class *v30;
  NSString *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)AVAssetWriterInputMetadataAdaptor;
  v5 = -[AVAssetWriterInputMetadataAdaptor init](&v32, sel_init);
  v6 = v5;
  if (!input)
  {
    v9 = v5;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "input != nil";
LABEL_14:
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)v17);
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](-[AVAssetWriterInput mediaType](input, "mediaType"), "isEqual:", CFSTR("meta")) & 1) == 0)
  {
    v18 = v6;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "[[input mediaType] isEqual:AVMediaTypeMetadata]";
    goto LABEL_14;
  }
  if (-[AVAssetWriterInput _isAttachedToAdaptor](input, "_isAttachedToAdaptor"))
  {
    v20 = v6;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Cannot create a new metadata adaptor with an asset writer input that is already attached to a metadata adaptor");
LABEL_19:
    v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v26, v21, v22, v23, v24, v25, (uint64_t)v31);
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v19, 0));
  }
  if (-[AVAssetWriterInput _status](input, "_status"))
  {
    v27 = v6;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Cannot create a new metadata adaptor with an asset writer input that has already started writing");
    goto LABEL_19;
  }
  if (!-[AVAssetWriterInput sourceFormatHint](input, "sourceFormatHint"))
  {
    v28 = v6;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v26 = CFSTR("Cannot create a new metadata adaptor with an asset writer that does not carry a source format hint");
    goto LABEL_19;
  }
  if (CMFormatDescriptionGetMediaSubType(-[AVAssetWriterInput sourceFormatHint](input, "sourceFormatHint")) != 1835360888)
  {
    v29 = v6;
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    AVStringForOSType(0x6D656278u);
    v26 = CFSTR("%@ only knows how to produce data with media subtype '%@', so it must be initialized with an instance of AVAssetWriterInput that is expecting data in that format");
    goto LABEL_19;
  }
  if (v6)
  {
    v7 = objc_alloc_init(AVAssetWriterInputMetadataAdaptorInternal);
    v6->_internal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_internal->input = input;
      -[AVAssetWriterInput _setAttachedAdaptor:](v6->_internal->input, "_setAttachedAdaptor:", v6);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVAssetWriterInputMetadataAdaptorInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputMetadataAdaptor;
  -[AVAssetWriterInputMetadataAdaptor dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, assetWriterInput = %@>"), NSStringFromClass(v4), self, -[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput"));
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->input;
}

- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)timedMetadataGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v11;
  opaqueCMSampleBuffer *v12;
  int64_t v13;
  AVAssetWriterInput *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  id v35;

  v35 = 0;
  if (!timedMetadataGroup)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "group != nil";
LABEL_18:
    v31 = (uint64_t)v18;
    v19 = CFSTR("invalid parameter not satisfying: %s");
    goto LABEL_19;
  }
  -[AVTimedMetadataGroup timeRange](timedMetadataGroup, "timeRange");
  if ((v34 & 0x1D) != 1)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = "CMTIME_IS_NUMERIC([group timeRange].start)";
    goto LABEL_18;
  }
  -[AVTimedMetadataGroup timeRange](timedMetadataGroup, "timeRange");
  if ((v33 & 1) != 0)
  {
    -[AVTimedMetadataGroup timeRange](timedMetadataGroup, "timeRange");
    if ((v32 & 8) != 0)
    {
      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99778];
      v18 = "! CMTIME_IS_NEGATIVE_INFINITY([group timeRange].duration)";
      goto LABEL_18;
    }
  }
  v11 = -[AVAssetWriterInput _status](-[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput"), "_status");
  if ((unint64_t)(v11 - 1) >= 4)
  {
    if (v11)
    {
      v13 = 0;
      return v13 == 0;
    }
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99768];
    v19 = CFSTR("Cannot invoke method before the attached asset writer input has been added to an asset writer and -startWriting has been called on that asset writer");
LABEL_19:
    v20 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v3, v4, v5, v6, v7, v31), 0);
    objc_exception_throw(v20);
  }
  v12 = -[AVTimedMetadataGroup _createSerializedRepresentationWithFormatDescription:error:](timedMetadataGroup, "_createSerializedRepresentationWithFormatDescription:error:", -[AVAssetWriterInput sourceFormatHint](-[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput"), "sourceFormatHint"), &v35);
  if (v12)
  {
    v13 = -[AVAssetWriterInput _appendSampleBuffer:error:](-[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput"), "_appendSampleBuffer:error:", v12, &v35);
    if (v13 != 1)
      goto LABEL_8;
  }
  if (objc_msgSend(v35, "code") == -11999)
  {
    v21 = (void *)objc_msgSend((id)objc_msgSend(v35, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v22 = objc_msgSend(v21, "reason");
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v29 = objc_msgSend(v21, "name");
    if (v22)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v22);
    v30 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v29, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot write to file timed metadata group %p%@"), v24, v25, v26, v27, v28, (uint64_t)timedMetadataGroup), 0);
    if (v12)
      CFRelease(v12);
    objc_exception_throw(v30);
  }
  v15 = -[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput");
  -[AVAssetWriterInput _tellAssetWriterToTransitionToFailedStatusWithError:](v15, "_tellAssetWriterToTransitionToFailedStatusWithError:", v35);
  v13 = 1;
  if (v12)
LABEL_8:
    CFRelease(v12);
  return v13 == 0;
}

@end
