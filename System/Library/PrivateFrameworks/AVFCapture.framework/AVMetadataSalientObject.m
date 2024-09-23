@implementation AVMetadataSalientObject

+ (AVMetadataSalientObject)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (AVMetadataSalientObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:type:", a3, a4, a5, CFSTR("salientObject"));
}

- (AVMetadataSalientObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  CMTimeEpoch v10;
  double *v11;
  int64_t v12;
  double x;
  double y;
  double height;
  double width;
  const __CFDictionary *v17;
  AVMetadataSalientObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTimeEpoch v23;
  objc_super v24;
  CGRect rect;
  CMTime v26;

  v20 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v26.value = *MEMORY[0x1E0CA2E18];
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v26.epoch = v10;
  v11 = (double *)MEMORY[0x1E0C9D648];
  if (a5)
  {
    objc_msgSend(a5, "longLongValue");
    v12 = FigHostTimeToNanoseconds();
    CMTimeMake(&v26, v12, 1000000000);
  }
  x = *v11;
  y = v11[1];
  width = v11[2];
  height = v11[3];
  v17 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05088], v20);
  if (v17)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v17, &rect))
    {
      x = rect.origin.x;
      y = rect.origin.y;
      width = rect.size.width;
      height = rect.size.height;
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)AVMetadataSalientObject;
  rect.origin = *(CGPoint *)&v26.value;
  *(_QWORD *)&rect.size.width = v26.epoch;
  v22 = v21;
  v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, a3, 0, a4, x, y, width, height);
  if (v18)
    v18->_objectID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F58]), "integerValue");
  return v18;
}

- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a4;
  v7 = *a5;
  return -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, &v8, &v7, 0, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  AVMetadataSalientObject *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVMetadataSalientObject;
  v12 = *a4;
  v11 = *a5;
  result = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v13, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("salientObject"), &v12, &v11, a7, a8, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  if (result)
    result->_objectID = a3;
  return result;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  -[AVMetadataObject bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0CB37A0];
  v12 = (objc_class *)objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, objectID=%d, bounds={%.1f,%.1f %.1fx%.1f}"), NSStringFromClass(v12), self, -[AVMetadataSalientObject objectID](self, "objectID"), v4, v6, v8, v10);
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v14 = v16;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "appendFormat:", CFSTR(", time=%lld"), v14);
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  return v13;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];
  CGRect v25;

  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v25.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v25.size = v9;
  objc_msgSend(a3, "bounds");
  v10 = *(_OWORD *)&a4->c;
  v24[0] = *(_OWORD *)&a4->a;
  v24[1] = v10;
  v24[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v24, &v25, v11, v12, v13, v14))
  {
    v15 = objc_msgSend(a3, "objectID");
    if (a3)
    {
      objc_msgSend(a3, "time");
      objc_msgSend(a3, "duration");
    }
    else
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v19 = 0;
      v20 = 0;
      v18 = 0;
    }
    v17 = objc_msgSend(a3, "input", v18, v19, v20, v21, v22, v23);
    return -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v15, &v21, &v18, 0, a3, v17, *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
  }
  else
  {

    return 0;
  }
}

- (NSInteger)objectID
{
  return self->_objectID;
}

@end
