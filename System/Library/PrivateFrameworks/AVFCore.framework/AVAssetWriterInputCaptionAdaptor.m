@implementation AVAssetWriterInputCaptionAdaptor

+ (AVAssetWriterInputCaptionAdaptor)assetWriterInputCaptionAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input
{
  return (AVAssetWriterInputCaptionAdaptor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAssetWriterInput:", input);
}

- (AVAssetWriterInputCaptionAdaptor)init
{
  AVAssetWriterInputCaptionAdaptor *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = self;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = NSStringFromSelector(sel_initWithAssetWriterInput_);
  v13 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v8, v9, v10, v11, v12, (uint64_t)v7), 0);
  objc_exception_throw(v13);
}

- (AVAssetWriterInputCaptionAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input
{
  AVAssetWriterInputCaptionAdaptor *v5;
  AVAssetWriterInputCaptionAdaptor *v6;
  AVAssetWriterInputCaptionAdaptorInternal *v7;
  AVAssetWriterInputCaptionAdaptor *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AVAssetWriterInputCaptionAdaptor *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  AVAssetWriterInputCaptionAdaptor *v25;
  AVAssetWriterInputCaptionAdaptor *v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputCaptionAdaptor;
  v5 = -[AVAssetWriterInputCaptionAdaptor init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    if (input)
    {
      if ((objc_msgSend((id)AVMediaTypesForCaptionEditing(), "containsObject:", -[AVAssetWriterInput mediaType](input, "mediaType")) & 1) != 0)
      {
        if (-[AVAssetWriterInput _isAttachedToAdaptor](input, "_isAttachedToAdaptor"))
        {
          v25 = v6;
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          v24 = CFSTR("Cannot create a new caption adaptor with an asset writer input that is already attached to a caption adaptor");
        }
        else
        {
          if (!-[AVAssetWriterInput _status](input, "_status"))
          {
            v7 = objc_alloc_init(AVAssetWriterInputCaptionAdaptorInternal);
            v6->_internal = v7;
            if (v7)
            {
              v6->_internal->assetWriterInput = input;
              CFRetain(v6->_internal);
              -[AVAssetWriterInput _setAttachedAdaptor:](input, "_setAttachedAdaptor:", v6);
            }
            else
            {

              return 0;
            }
            return v6;
          }
          v26 = v6;
          v10 = (void *)MEMORY[0x1E0C99DA0];
          v11 = *MEMORY[0x1E0C99778];
          v24 = CFSTR("Cannot create a new caption adaptor with an asset writer input that has already started writing");
        }
      }
      else
      {
        v18 = v6;
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v24 = CFSTR("Cannot create a new caption adaptor with an unsupported media type");
      }
      v17 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v24, v19, v20, v21, v22, v23, v27);
    }
    else
    {
      v9 = v5;
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      v17 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)"input != nil");
    }
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v17, 0));
  }
  return v6;
}

- (void)dealloc
{
  AVAssetWriterInputCaptionAdaptorInternal *internal;
  AVAssetWriterInputCaptionAdaptorInternal *v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    if (v4)
      CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputCaptionAdaptor;
  -[AVAssetWriterInputCaptionAdaptor dealloc](&v5, sel_dealloc);
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->assetWriterInput;
}

- (BOOL)appendCaption:(AVCaption *)caption
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v11;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;

  if (!caption)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "caption != NULL";
    goto LABEL_15;
  }
  -[AVCaption timeRange](caption, "timeRange");
  if ((v34 & 1) == 0
    || (-[AVCaption timeRange](caption, "timeRange"), (v33 & 1) == 0)
    || (-[AVCaption timeRange](caption, "timeRange"), v32)
    || (-[AVCaption timeRange](caption, "timeRange"), v31 < 0))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIMERANGE_IS_VALID(caption.timeRange)";
LABEL_15:
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)v15);
    v17 = v13;
    v18 = v14;
    goto LABEL_16;
  }
  -[AVCaption timeRange](caption, "timeRange");
  if ((v30 & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_IS_NUMERIC(caption.timeRange.start)";
    goto LABEL_15;
  }
  -[AVCaption timeRange](caption, "timeRange");
  if ((v29 & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_IS_NUMERIC(caption.timeRange.duration)";
    goto LABEL_15;
  }
  v28 = 0;
  v11 = -[AVAssetWriterInput _appendCaption:error:](-[AVAssetWriterInputCaptionAdaptor assetWriterInput](self, "assetWriterInput"), "_appendCaption:error:", (id)-[AVCaption copy](caption, "copy"), &v28);
  if (v11 == 1 && objc_msgSend(v28, "code") == -11999)
  {
    v19 = (void *)objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = objc_msgSend(v19, "name");
    v22 = objc_msgSend(v19, "reason");
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot append caption: %@"), v23, v24, v25, v26, v27, v22);
    v17 = v20;
    v18 = v21;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, 0));
  }
  return v11 == 0;
}

- (BOOL)appendCaptionGroup:(AVCaptionGroup *)captionGroup
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v11;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;

  if (!captionGroup)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "captionGroup != NULL";
    goto LABEL_15;
  }
  -[AVCaptionGroup timeRange](captionGroup, "timeRange");
  if ((v34 & 1) == 0
    || (-[AVCaptionGroup timeRange](captionGroup, "timeRange"), (v33 & 1) == 0)
    || (-[AVCaptionGroup timeRange](captionGroup, "timeRange"), v32)
    || (-[AVCaptionGroup timeRange](captionGroup, "timeRange"), v31 < 0))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIMERANGE_IS_VALID(captionGroup.timeRange)";
LABEL_15:
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)v15);
    v17 = v13;
    v18 = v14;
    goto LABEL_16;
  }
  -[AVCaptionGroup timeRange](captionGroup, "timeRange");
  if ((v30 & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_IS_NUMERIC(captionGroup.timeRange.start)";
    goto LABEL_15;
  }
  -[AVCaptionGroup timeRange](captionGroup, "timeRange");
  if ((v29 & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_IS_NUMERIC(captionGroup.timeRange.duration)";
    goto LABEL_15;
  }
  v28 = 0;
  v11 = -[AVAssetWriterInput _appendCaptionGroup:error:](-[AVAssetWriterInputCaptionAdaptor assetWriterInput](self, "assetWriterInput"), "_appendCaptionGroup:error:", captionGroup, &v28);
  if (v11 == 1 && objc_msgSend(v28, "code") == -11999)
  {
    v19 = (void *)objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = objc_msgSend(v19, "name");
    v22 = objc_msgSend(v19, "reason");
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot append caption group: %@"), v23, v24, v25, v26, v27, v22);
    v17 = v20;
    v18 = v21;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v16, 0));
  }
  return v11 == 0;
}

@end
