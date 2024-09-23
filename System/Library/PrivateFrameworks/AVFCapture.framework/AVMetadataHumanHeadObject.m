@implementation AVMetadataHumanHeadObject

+ (id)humanHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:type:", a3, a4, a5, CFSTR("humanHead"));
}

- (AVMetadataHumanHeadObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  CMTimeEpoch v10;
  double *v11;
  int64_t v12;
  double x;
  double y;
  double height;
  double width;
  const __CFDictionary *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTimeEpoch v22;
  objc_super v23;
  CGRect rect;
  CMTime v25;

  v19 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v25.value = *MEMORY[0x1E0CA2E18];
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v25.epoch = v10;
  v11 = (double *)MEMORY[0x1E0C9D648];
  if (a5)
  {
    objc_msgSend(a5, "longLongValue");
    v12 = FigHostTimeToNanoseconds();
    CMTimeMake(&v25, v12, 1000000000);
  }
  x = *v11;
  y = v11[1];
  width = v11[2];
  height = v11[3];
  v17 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05088], v19);
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
  v23.receiver = self;
  v23.super_class = (Class)AVMetadataHumanHeadObject;
  rect.origin = *(CGPoint *)&v25.value;
  *(_QWORD *)&rect.size.width = v25.epoch;
  v21 = v20;
  v22 = v10;
  return -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v23, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v21, a3, 0, a4, x, y, width, height);
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
  v13 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, bounds={%.1f,%.1f %.1fx%.1f}"), NSStringFromClass(v12), self, v4, v6, v8, v10);
  objc_msgSend(v13, "appendFormat:", CFSTR(", groupID=%ld, syntheticFocusMode=%lu"), -[AVMetadataObject groupID](self, "groupID"), -[AVMetadataObject syntheticFocusMode](self, "syntheticFocusMode"));
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
  uint64_t v16;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _OWORD v20[3];
  CGRect v21;

  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v21.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v21.size = v9;
  objc_msgSend(a3, "bounds");
  v10 = *(_OWORD *)&a4->c;
  v20[0] = *(_OWORD *)&a4->a;
  v20[1] = v10;
  v20[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v20, &v21, v11, v12, v13, v14))
  {
    if (a3)
    {
      objc_msgSend(a3, "time");
      objc_msgSend(a3, "duration");
    }
    else
    {
      memset(v19, 0, sizeof(v19));
      memset(v18, 0, sizeof(v18));
    }
    v16 = objc_msgSend(a3, "input");
    v17.receiver = self;
    v17.super_class = (Class)AVMetadataHumanHeadObject;
    return -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v17, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("humanHead"), v19, v18, 0, a3, v16, *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size);
  }
  else
  {

    return 0;
  }
}

@end
