@implementation CISeedFill

- (id)outputImage
{
  CIImage *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *inputImage;
  float v13;
  CIImage *inputCenter;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  float v23;
  float v24;
  CIImage *v25;
  uint64_t v26;
  NSNumber *inputThreshold;
  uint64_t v29;
  const __CFString *v30;
  NSNumber *v31;
  _QWORD v32[3];
  CGRect v33;

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = -[CIImage imageByCroppingToRect:](self->inputCenter, "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0);
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v29 = 0;
  inputImage = self->inputImage;
  -[NSNumber floatValue](self->inputSplat, "floatValue", 0);
  if (v13 > 0.0)
  {
    inputCenter = self->inputCenter;
    -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[NSNumber floatValue](self->inputSplat, "floatValue");
    v24 = v23;
    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    v25 = RRradialCentroidMask(inputCenter, v33, v24, 1.0, 1);
    inputImage = (void *)RRmaximumRh(inputImage, v25);
  }
  v32[0] = inputImage;
  v32[1] = v3;
  v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  inputThreshold = self->inputThreshold;
  v30 = CFSTR("kThreshold");
  v31 = inputThreshold;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CISeedFillProcessor, "applyWithExtent:inputs:arguments:error:", v26, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1), &v29, v5, v7, v9, v11);
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputSplat
{
  return self->inputSplat;
}

- (void)setInputSplat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
