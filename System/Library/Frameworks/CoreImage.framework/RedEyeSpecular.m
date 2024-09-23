@implementation RedEyeSpecular

- (id)outputImage
{
  CIColorKernel *v3;
  CIColorKernel *v4;
  CIImage *inputSource;
  NSNumber *inputSpecIntensity;
  NSNumber *inputDebugFlag;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_spec);
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_spec_debug);
  if (-[NSNumber intValue](self->inputDebugFlag, "intValue") > 0)
    v3 = v4;
  -[CIImage extent](self->inputImage, "extent");
  inputSource = self->inputSource;
  v13[0] = self->inputImage;
  v13[1] = inputSource;
  inputSpecIntensity = self->inputSpecIntensity;
  v13[2] = self->inputSpecularMask;
  v13[3] = inputSpecIntensity;
  inputDebugFlag = self->inputDebugFlag;
  v13[4] = self->inputSpecularThreshold;
  v13[5] = inputDebugFlag;
  return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6), v8, v9, v10, v11);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputSource
{
  return self->inputSource;
}

- (void)setInputSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIImage)inputSpecularMask
{
  return self->inputSpecularMask;
}

- (void)setInputSpecularMask:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputSpecularThreshold
{
  return self->inputSpecularThreshold;
}

- (void)setInputSpecularThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputSpecIntensity
{
  return self->inputSpecIntensity;
}

- (void)setInputSpecIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputDebugFlag
{
  return self->inputDebugFlag;
}

- (void)setInputDebugFlag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
