@implementation AVMetadataSaliencyHeatMap

+ (id)saliencyHeatMapWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceObjectDictionary:input:timeStamp:type:", a3, a4, a5, CFSTR("saliencyHeatMap"));
}

- (AVMetadataSaliencyHeatMap)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  CMTimeEpoch v10;
  double *v11;
  int64_t v12;
  double x;
  double y;
  double height;
  double width;
  const __CFDictionary *v17;
  AVMetadataSaliencyHeatMap *v18;
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
  v24.super_class = (Class)AVMetadataSaliencyHeatMap;
  rect.origin = *(CGPoint *)&v26.value;
  *(_QWORD *)&rect.size.width = v26.epoch;
  v22 = v21;
  v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, 0, 0, a4, x, y, width, height);
  if (v18)
  {
    v18->_bytesPerRow = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D050F0]), "integerValue");
    v18->_width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05108]), "integerValue");
    v18->_height = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D050F8]), "integerValue");
    v18->_heatMap = (NSData *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05100]);
  }
  return v18;
}

- (AVMetadataSaliencyHeatMap)initWithHeatMap:(id)a3 width:(int64_t)a4 height:(int64_t)a5 bytesPerRow:(int64_t)a6 time:(id *)a7 duration:(id *)a8 bounds:(CGRect)a9 optionalInfoDict:(id)a10 originalMetadataObject:(id)a11 sourceCaptureInput:(id)a12
{
  AVMetadataSaliencyHeatMap *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVMetadataSaliencyHeatMap;
  v19 = *a7;
  v18 = *a8;
  v16 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v20, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("saliencyHeatMap"), &v19, &v18, a10, a11, a12, a9.origin.x, a9.origin.y, a9.size.width, a9.size.height);
  if (v16)
  {
    v16->_heatMap = (NSData *)a3;
    v16->_width = a4;
    v16->_height = a5;
    v16->_bytesPerRow = a6;
  }
  return v16;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _OWORD v23[3];
  CGRect v24;

  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v24.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v24.size = v9;
  objc_msgSend(a3, "bounds");
  v10 = *(_OWORD *)&a4->c;
  v23[0] = *(_OWORD *)&a4->a;
  v23[1] = v10;
  v23[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v23, &v24, v11, v12, v13, v14))
  {
    v15 = objc_msgSend(a3, "heatMap");
    v16 = objc_msgSend(a3, "width");
    v17 = objc_msgSend(a3, "height");
    v18 = objc_msgSend(a3, "bytesPerRow");
    if (a3)
    {
      objc_msgSend(a3, "time");
      objc_msgSend(a3, "duration");
    }
    else
    {
      memset(v22, 0, sizeof(v22));
      memset(v21, 0, sizeof(v21));
    }
    v20 = objc_msgSend(a3, "input");
    return -[AVMetadataSaliencyHeatMap initWithHeatMap:width:height:bytesPerRow:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithHeatMap:width:height:bytesPerRow:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v15, v16, v17, v18, v22, v21, *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size, 0, a3, v20);
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataSaliencyHeatMap;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (int64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)height
{
  return self->_height;
}

- (NSData)heatMap
{
  return self->_heatMap;
}

@end
