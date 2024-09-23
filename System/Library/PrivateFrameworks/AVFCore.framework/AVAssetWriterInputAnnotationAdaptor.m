@implementation AVAssetWriterInputAnnotationAdaptor

+ (void)initialize
{
  objc_opt_class();
}

+ (id)assetWriterInputAnnotationAdaptorWithAssetWriterInput:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAssetWriterInput:", a3);
}

+ (opaqueCMFormatDescription)annotationFormatDescription
{
  void *v2;
  AVMutableMetadataItem *v3;
  CMTimeEpoch epoch;
  AVMutableMetadataItem *v5;
  AVMutableTimedMetadataGroup *v6;
  __int128 v8;
  CMTime duration;
  CMTimeRange v10;
  CMTime start;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_alloc_init(AVMutableMetadataItem);
  -[AVMutableMetadataItem setIdentifier:](v3, "setIdentifier:", CFSTR("mdta/com.apple.quicktime.annotation.body"));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v8 = *(_OWORD *)&start.value;
  epoch = start.epoch;
  -[AVMutableMetadataItem setTime:](v3, "setTime:", &start);
  -[AVMutableMetadataItem setDataType:](v3, "setDataType:", *MEMORY[0x1E0CA2410]);
  objc_msgSend(v2, "addObject:", v3);
  v5 = objc_alloc_init(AVMutableMetadataItem);
  -[AVMutableMetadataItem setIdentifier:](v5, "setIdentifier:", CFSTR("mdta/com.apple.quicktime.annotation.representation"));
  *(_OWORD *)&start.value = v8;
  start.epoch = epoch;
  -[AVMutableMetadataItem setTime:](v5, "setTime:", &start);
  -[AVMutableMetadataItem setDataType:](v5, "setDataType:", *MEMORY[0x1E0CA2440]);
  objc_msgSend(v2, "addObject:", v5);
  v6 = [AVMutableTimedMetadataGroup alloc];
  CMTimeMake(&duration, 1, 1000);
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v10, &start, &duration);
  return -[AVTimedMetadataGroup copyFormatDescription](-[AVMutableTimedMetadataGroup initWithItems:timeRange:](v6, "initWithItems:timeRange:", v2, &v10), "copyFormatDescription");
}

- (AVAssetWriterInputAnnotationAdaptor)init
{
  AVAssetWriterInputAnnotationAdaptor *v4;
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

- (AVAssetWriterInputAnnotationAdaptor)initWithAssetWriterInput:(id)a3
{
  AVAssetWriterInputAnnotationAdaptor *v5;
  AVAssetWriterInputAnnotationAdaptor *v6;
  AVAssetWriterInputAnnotationAdaptor *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  AVAssetWriterInputAnnotationAdaptor *v17;
  uint64_t v18;
  AVAssetWriterInputAnnotationAdaptor *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  AVAssetWriterInputAnnotationAdaptor *v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputAnnotationAdaptor;
  v5 = -[AVAssetWriterInputAnnotationAdaptor init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqual:", CFSTR("meta")) & 1) != 0)
      {
        if (objc_msgSend(a3, "_isAttachedToAdaptor"))
        {
          v19 = v6;
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = *MEMORY[0x1E0C99778];
          v25 = CFSTR("Cannot create a new annotation adaptor with an asset writer input that is already attached to an annotation adaptor");
        }
        else
        {
          if (!objc_msgSend(a3, "_status"))
          {
            v6->_assetWriterInputMetadataAdaptor = +[AVAssetWriterInputMetadataAdaptor assetWriterInputMetadataAdaptorWithAssetWriterInput:](AVAssetWriterInputMetadataAdaptor, "assetWriterInputMetadataAdaptorWithAssetWriterInput:", a3);
            v6->_assetWriterInput = (AVAssetWriterInput *)a3;
            objc_msgSend(a3, "_setAttachedAdaptor:", v6);
            return v6;
          }
          v26 = v6;
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = *MEMORY[0x1E0C99778];
          v25 = CFSTR("Cannot create a new annotation adaptor with an asset writer input that has already started writing");
        }
        v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v25, v20, v21, v22, v23, v24, v27);
LABEL_14:
        objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v18, 0));
      }
      v17 = v6;
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = "[[input mediaType] isEqual:AVMediaTypeMetadata]";
    }
    else
    {
      v8 = v5;
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = "input != nil";
    }
    v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)v16);
    goto LABEL_14;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputAnnotationAdaptor;
  -[AVAssetWriterInputAnnotationAdaptor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, assetWriterInput = %@>"), NSStringFromClass(v4), self, -[AVAssetWriterInputAnnotationAdaptor assetWriterInput](self, "assetWriterInput"));
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_assetWriterInput;
}

- (BOOL)appendAnnotation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v11;
  void *v12;
  AVMutableMetadataItem *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  id v24;
  AVMutableMetadataItem *v25;
  AVTimedMetadataGroup *v26;
  AVAssetWriterInputAnnotationAdaptor *v27;
  AVAssetWriterInput *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;
  objc_class *v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  SEL v41;
  AVAssetWriterInputAnnotationAdaptor *v42;
  id obj;
  _OWORD v44[3];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint64_t v53;
  char v54;
  char v55;
  int v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  if (!a3)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = *MEMORY[0x1E0C99778];
    v32 = "annotation != nil";
LABEL_33:
    v40 = (uint64_t)v32;
    v36 = CFSTR("invalid parameter not satisfying: %s");
    goto LABEL_34;
  }
  objc_msgSend(a3, "timeRange");
  if ((v56 & 0x1D) != 1)
  {
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = *MEMORY[0x1E0C99778];
    v32 = "CMTIME_IS_NUMERIC([annotation timeRange].start)";
    goto LABEL_33;
  }
  objc_msgSend(a3, "timeRange");
  if ((v55 & 1) != 0)
  {
    objc_msgSend(a3, "timeRange");
    if ((v54 & 8) != 0)
    {
      v30 = (void *)MEMORY[0x1E0C99DA0];
      v31 = *MEMORY[0x1E0C99778];
      v32 = "! CMTIME_IS_NEGATIVE_INFINITY([annotation timeRange].duration)";
      goto LABEL_33;
    }
  }
  v11 = -[AVAssetWriterInput _status](-[AVAssetWriterInputAnnotationAdaptor assetWriterInput](self, "assetWriterInput"), "_status");
  if ((unint64_t)(v11 - 1) >= 4)
  {
    if (v11)
      return 1;
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = *MEMORY[0x1E0C99768];
    v36 = CFSTR("Cannot invoke method before the attached asset writer input has been added to an asset writer and -startWriting has been called on that asset writer");
LABEL_34:
    v37 = (objc_class *)self;
    v38 = a2;
    goto LABEL_37;
  }
  v41 = a2;
  v42 = self;
  -[AVAssetWriterInput sourceFormatHint](-[AVAssetWriterInputAnnotationAdaptor assetWriterInput](self, "assetWriterInput"), "sourceFormatHint");
  v52 = 0;
  v53 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  objc_msgSend(a3, "timeRange");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(a3, "getJSONData:representationBinaryDataBindings:", &v53, &v52);
  v13 = objc_alloc_init(AVMutableMetadataItem);
  -[AVMutableMetadataItem setIdentifier:](v13, "setIdentifier:", 0x1E303D338);
  -[AVMutableMetadataItem setDataType:](v13, "setDataType:", *MEMORY[0x1E0CA2410]);
  v14 = objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v53, 0, &v57);
  if (!v14)
  {
LABEL_24:
    v27 = v42;
    goto LABEL_25;
  }
  -[AVMutableMetadataItem setValue:](v13, "setValue:", v14);
  objc_msgSend(v12, "addObject:", v13);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v52;
  v15 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (!v15)
    goto LABEL_19;
  v16 = v15;
  v17 = *(_QWORD *)v46;
  v18 = *MEMORY[0x1E0CA2440];
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v46 != v17)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "objectForKey:", 0x1E3036B98);
      if (objc_msgSend(v20, "objectForKey:", 0x1E303D378))
        v22 = v21 == 0;
      else
        v22 = 1;
      if (v22)
      {
        v57 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11883, 0);
        goto LABEL_24;
      }
      v23 = +[AVAnnotationRepresentation _createMetadataItemPayloadForDataBinding:error:](AVAnnotationRepresentation, "_createMetadataItemPayloadForDataBinding:error:", v20, &v57);
      if (!v23)
        goto LABEL_24;
      v24 = v23;
      v25 = objc_alloc_init(AVMutableMetadataItem);
      -[AVMutableMetadataItem setIdentifier:](v25, "setIdentifier:", 0x1E303D358);
      -[AVMutableMetadataItem setDataType:](v25, "setDataType:", v18);
      -[AVMutableMetadataItem setValue:](v25, "setValue:", v24);
      objc_msgSend(v12, "addObject:", v25);
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  }
  while (v16);
LABEL_19:
  v26 = [AVTimedMetadataGroup alloc];
  v44[0] = v49;
  v44[1] = v50;
  v44[2] = v51;
  v27 = v42;
  if (-[AVAssetWriterInputMetadataAdaptor appendTimedMetadataGroup:](v42->_assetWriterInputMetadataAdaptor, "appendTimedMetadataGroup:", -[AVTimedMetadataGroup initWithItems:timeRange:](v26, "initWithItems:timeRange:", v12, v44)))
  {
    return 1;
  }
LABEL_25:
  if (objc_msgSend(v57, "code") == -11999)
  {
    v33 = (void *)objc_msgSend((id)objc_msgSend(v57, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v34 = objc_msgSend(v33, "reason");
    v30 = (void *)MEMORY[0x1E0C99DA0];
    v31 = objc_msgSend(v33, "name");
    if (v34)
      v35 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v34);
    else
      v35 = &stru_1E303A378;
    v40 = (uint64_t)v35;
    v36 = CFSTR("Cannot write annotation to file %@");
    v38 = v41;
    v37 = (objc_class *)v42;
LABEL_37:
    v39 = (void *)objc_msgSend(v30, "exceptionWithName:reason:userInfo:", v31, AVMethodExceptionReasonWithObjectAndSelector(v37, v38, (uint64_t)v36, v3, v4, v5, v6, v7, v40), 0);
    objc_exception_throw(v39);
  }
  v29 = -[AVAssetWriterInputAnnotationAdaptor assetWriterInput](v27, "assetWriterInput");
  -[AVAssetWriterInput _tellAssetWriterToTransitionToFailedStatusWithError:](v29, "_tellAssetWriterToTransitionToFailedStatusWithError:", v57);
  return 0;
}

@end
