@implementation AVMetadataBodyObject

- (AVMetadataBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  CMTimeEpoch v10;
  double *v11;
  int64_t v12;
  double x;
  double y;
  double height;
  double width;
  const __CFDictionary *v17;
  AVMetadataBodyObject *v18;
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
  v24.super_class = (Class)AVMetadataBodyObject;
  rect.origin = *(CGPoint *)&v26.value;
  *(_QWORD *)&rect.size.width = v26.epoch;
  v22 = v21;
  v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, a3, 0, a4, x, y, width, height);
  if (v18)
    v18->_bodyID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04F58]), "integerValue");
  return v18;
}

- (AVMetadataBodyObject)initWithType:(id)a3 bodyID:(int64_t)a4 time:(id *)a5 duration:(id *)a6 bounds:(CGRect)a7 optionalInfoDict:(id)a8 originalMetadataObject:(id)a9 sourceCaptureInput:(id)a10
{
  AVMetadataBodyObject *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVMetadataBodyObject;
  v13 = *a5;
  v12 = *a6;
  result = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v14, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a3, &v13, &v12, a8, a9, a10, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result)
    result->_bodyID = a4;
  return result;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6 type:(id)a7 bodyID:(int64_t)a8
{
  CGSize v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGRect v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v29 = 0uLL;
  v30 = 0;
  if (a3)
  {
    objc_msgSend(a3, "time", a3, a4, a5, a6);
    v27 = 0uLL;
    v28 = 0;
    objc_msgSend(a3, "duration");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0;
  }
  v13 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v26.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v26.size = v13;
  objc_msgSend(a3, "bounds");
  v14 = *(_OWORD *)&a4->c;
  v23 = *(_OWORD *)&a4->a;
  v24 = v14;
  v25 = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v23, &v26, v15, v16, v17, v18))
  {
    v19 = objc_msgSend(a3, "input");
    v23 = v29;
    *(_QWORD *)&v24 = v30;
    v21 = v27;
    v22 = v28;
    return -[AVMetadataBodyObject initWithType:bodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithType:bodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a7, a8, &v23, &v21, 0, a3, *(_OWORD *)&v26.origin, *(_OWORD *)&v26.size, v19);
  }
  else
  {

    return 0;
  }
}

- (NSInteger)bodyID
{
  return self->_bodyID;
}

@end
