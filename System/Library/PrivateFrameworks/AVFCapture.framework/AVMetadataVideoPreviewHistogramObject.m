@implementation AVMetadataVideoPreviewHistogramObject

- (unint64_t)lumaHistogramBinCount
{
  return -[NSData length](self->_lumaHistogramData, "length") >> 2;
}

- (NSData)lumaHistogramData
{
  return self->_lumaHistogramData;
}

+ (id)videoPreviewHistogramObjectWithLumaHistogramData:(id)a3 input:(id)a4 time:(id *)a5
{
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v8 = objc_alloc((Class)objc_opt_class());
  v10 = *a5;
  return (id)objc_msgSend(v8, "initWithLumaHistogramData:time:sourceCaptureInput:", a3, &v10, a4);
}

- (AVMetadataVideoPreviewHistogramObject)initWithLumaHistogramData:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  AVMetadataVideoPreviewHistogramObject *v10;
  __int128 v12;
  uint64_t v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  objc_super v15;

  v12 = *MEMORY[0x1E0CA2E18];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15.receiver = self;
  v15.super_class = (Class)AVMetadataVideoPreviewHistogramObject;
  v14 = *a4;
  v10 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v15, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("videoPreviewHistogram"), &v14, &v12, 0, 0, a5, v6, v7, v8, v9);
  if (v10)
    v10->_lumaHistogramData = (NSData *)a3;
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataVideoPreviewHistogramObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8;
  _QWORD v10[3];

  v8 = objc_msgSend(a3, "lumaHistogramData", a6);
  if (a3)
    objc_msgSend(a3, "time");
  else
    memset(v10, 0, sizeof(v10));
  return -[AVMetadataVideoPreviewHistogramObject initWithLumaHistogramData:time:sourceCaptureInput:](self, "initWithLumaHistogramData:time:sourceCaptureInput:", v8, v10, objc_msgSend(a3, "input"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p lumaHistogramData: %@, lumaHistogramBinCount: %lu"), objc_opt_class(), self, self->_lumaHistogramData, -[AVMetadataVideoPreviewHistogramObject lumaHistogramBinCount](self, "lumaHistogramBinCount"));
}

@end
