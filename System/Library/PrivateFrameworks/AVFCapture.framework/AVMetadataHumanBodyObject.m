@implementation AVMetadataHumanBodyObject

+ (AVMetadataHumanBodyObject)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (AVMetadataHumanBodyObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:", a3, a4, a5);
}

- (AVMetadataHumanBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  AVMetadataHumanBodyObject *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMetadataHumanBodyObject;
  v6 = -[AVMetadataBodyObject initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:type:](&v9, sel_initWithFigEmbeddedCaptureDeviceObjectDictionary_input_timeStamp_type_, a3, a4, a5, CFSTR("humanBody"));
  if (v6)
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05020]);
    if (v7)
    {
      v6->_hasConfidence = 1;
      v6->_confidence = (float)((float)(int)objc_msgSend(v7, "intValue") / 1000.0);
    }
  }
  return v6;
}

- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a4;
  v7 = *a5;
  return -[AVMetadataHumanBodyObject initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, &v8, &v7, 0, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVMetadataHumanBodyObject;
  v11 = *a4;
  v10 = *a5;
  return -[AVMetadataBodyObject initWithType:bodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v12, sel_initWithType_bodyID_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("humanBody"), a3, &v11, &v10, a7, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9);
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
  uint64_t v15;
  uint64_t v17;

  -[AVMetadataObject bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0CB37A0];
  v12 = (objc_class *)objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, bodyID=%d, bounds={%.1f,%.1f %.1fx%.1f}"), NSStringFromClass(v12), self, -[AVMetadataBodyObject bodyID](self, "bodyID"), v4, v6, v8, v10);
  if (-[AVMetadataHumanBodyObject hasConfidence](self, "hasConfidence"))
  {
    -[AVMetadataHumanBodyObject confidence](self, "confidence");
    objc_msgSend(v13, "appendFormat:", CFSTR(", confidence=(%f)"), v14);
  }
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v15 = v17;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v13, "appendFormat:", CFSTR(", time=%lld"), v15);
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  return v13;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  _BOOL8 v7;
  uint64_t v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v14;
  _OWORD v16[3];
  objc_super v17;

  v7 = a5;
  v11 = objc_msgSend(a3, "bodyID");
  v17.receiver = self;
  v17.super_class = (Class)AVMetadataHumanBodyObject;
  v12 = *(_OWORD *)&a4->c;
  v16[0] = *(_OWORD *)&a4->a;
  v16[1] = v12;
  v16[2] = *(_OWORD *)&a4->tx;
  v13 = -[AVMetadataBodyObject initDerivedMetadataObjectFromMetadataObject:withTransform:isVideoMirrored:rollAdjustment:type:bodyID:](&v17, sel_initDerivedMetadataObjectFromMetadataObject_withTransform_isVideoMirrored_rollAdjustment_type_bodyID_, a3, v16, v7, CFSTR("humanBody"), v11, a6);
  if (v13)
  {
    v13[24] = objc_msgSend(a3, "hasConfidence");
    objc_msgSend(a3, "confidence");
    *((_QWORD *)v13 + 4) = v14;
  }
  return v13;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

@end
