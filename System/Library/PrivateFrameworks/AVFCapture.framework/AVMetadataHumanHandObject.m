@implementation AVMetadataHumanHandObject

- (AVMetadataHumanHandObject)initWithHandID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  AVMetadataHumanHandObject *v12;
  AVMetadataHumanHandObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVMetadataHumanHandObject;
  v20 = *a4;
  v19 = *a5;
  v12 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v21, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("humanHand"), &v20, &v19, a7, a8, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v13 = v12;
  if (v12)
  {
    v12->_handID = a3;
    if (a7)
    {
      v14 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05020]);
      if (v14)
      {
        v13->_hasConfidence = 1;
        v13->_confidence = (float)((float)(int)objc_msgSend(v14, "intValue") / 1000.0);
      }
      v15 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F48]);
      if (v15)
      {
        v13->_hasChirality = 1;
        v16 = (int)objc_msgSend(v15, "intValue");
LABEL_10:
        v13->_chirality = v16;
      }
    }
    else if (a8 && objc_msgSend(a8, "isMemberOfClass:", objc_opt_class()))
    {
      v13->_hasConfidence = objc_msgSend(a8, "hasConfidence");
      objc_msgSend(a8, "confidence");
      v13->_confidence = v17;
      v13->_hasChirality = objc_msgSend(a8, "hasChirality");
      v16 = objc_msgSend(a8, "chirality");
      goto LABEL_10;
    }
  }
  return v13;
}

+ (id)humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:type:", a3, a4, a5, CFSTR("humanHand"));
}

- (AVMetadataHumanHandObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  CMTimeEpoch v9;
  double *v10;
  int64_t v11;
  double x;
  double y;
  double width;
  double height;
  const __CFDictionary *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTimeEpoch v23;
  CGRect rect;
  CMTime v25;

  v20 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v25.value = *MEMORY[0x1E0CA2E18];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v25.epoch = v9;
  v10 = (double *)MEMORY[0x1E0C9D648];
  if (a5)
  {
    objc_msgSend(a5, "longLongValue");
    v11 = FigHostTimeToNanoseconds();
    CMTimeMake(&v25, v11, 1000000000);
  }
  x = *v10;
  y = v10[1];
  width = v10[2];
  height = v10[3];
  v16 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05088], v20);
  if (v16)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v16, &rect))
    {
      x = rect.origin.x;
      y = rect.origin.y;
      width = rect.size.width;
      height = rect.size.height;
    }
  }
  v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F58]);
  if (v17)
    v18 = objc_msgSend(v17, "integerValue");
  else
    v18 = 0;
  rect.origin = *(CGPoint *)&v25.value;
  *(_QWORD *)&rect.size.width = v25.epoch;
  v22 = v21;
  v23 = v9;
  return -[AVMetadataHumanHandObject initWithHandID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithHandID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v18, &rect, &v22, a3, 0, a4, x, y, width, height);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVMetadataHumanHandObject;
  -[AVMetadataObject dealloc](&v2, sel_dealloc);
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
  v13 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, handID=%d, bounds={%.1f,%.1f %.1fx%.1f}"), NSStringFromClass(v12), self, -[AVMetadataHumanHandObject handID](self, "handID"), v4, v6, v8, v10);
  if (-[AVMetadataObject groupID](self, "groupID") != -1)
    objc_msgSend(v13, "appendFormat:", CFSTR(", groupID:(%d)"), -[AVMetadataObject groupID](self, "groupID"));
  if (-[AVMetadataHumanHandObject hasConfidence](self, "hasConfidence"))
  {
    -[AVMetadataHumanHandObject confidence](self, "confidence");
    objc_msgSend(v13, "appendFormat:", CFSTR(", confidence=(%f)"), v14);
  }
  if (-[AVMetadataHumanHandObject hasChirality](self, "hasChirality"))
    objc_msgSend(v13, "appendFormat:", CFSTR(", chirality=(%d)"), -[AVMetadataHumanHandObject chirality](self, "chirality"));
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
    v15 = objc_msgSend(a3, "handID");
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
    return -[AVMetadataHumanHandObject initWithHandID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithHandID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v15, &v21, &v18, 0, a3, v17, *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
  }
  else
  {

    return 0;
  }
}

- (int64_t)handID
{
  return self->_handID;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasChirality
{
  return self->_hasChirality;
}

- (unint64_t)chirality
{
  return self->_chirality;
}

@end
