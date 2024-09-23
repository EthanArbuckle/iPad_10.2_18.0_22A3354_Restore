@implementation BWInferencePrimaryCaptureRectDescriptor

- (char)identifier
{
  return 2;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return 1;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  double var0;
  double var1;
  float v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t v17;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  var0 = (double)a3.var0;
  var1 = (double)a3.var1;
  if (a3.var0 <= a3.var1)
    v5 = 0.5625;
  else
    v5 = 1.7778;
  v6 = FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions((double)a3.var0, (double)a3.var1, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v22.origin.x = FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions(var0, var1, 1.0);
  v22.origin.y = v13;
  v22.size.width = v14;
  v22.size.height = v15;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v21 = CGRectUnion(v20, v22);
  LODWORD(v16) = vcvtpd_s64_f64(v21.size.width);
  LODWORD(v17) = vcvtpd_s64_f64(v21.size.height);
  return ($2825F4736939C4A6D3AD43837233062D)(v16 | (v17 << 32));
}

+ (void)initialize
{
  objc_opt_class();
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CGSize v3;
  const __CFDictionary *v4;
  double x;
  double y;
  double width;
  double height;
  CGRect v9;
  CGRect result;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v9.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v9.size = v3;
  v4 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
  if (v4)
    CGRectMakeWithDictionaryRepresentation(v4, &v9);
  y = v9.origin.y;
  x = v9.origin.x;
  height = v9.size.height;
  width = v9.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
