@implementation CICircleSplashDistortion

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryDistortionEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputCenter");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v8[4] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18F50;
  v4[1] = &unk_1E2F18F50;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18F60;
  v4[3] = &unk_1E2F18F70;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_circleSplash);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  double v8;
  uint64_t v10;
  float v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIImage *inputImage;
  CIVector *v18;
  NSNumber *inputRadius;
  uint64_t v20;
  float v21;
  float v22;
  _QWORD v23[6];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[CIVector X](self->inputCenter, "X");
  v4 = v3;
  -[CIVector Y](self->inputCenter, "Y");
  v6 = v5;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v8 = fmax(v7, 0.0);
  if (v8 < 0.001)
    return self->inputImage;
  *(float *)&v10 = v4;
  v11 = v6;
  v21 = *(float *)&v10;
  v22 = v11;
  *((float *)&v10 + 1) = v11;
  v20 = v10;
  v12 = -[CICircleSplashDistortion _kernel](self, "_kernel");
  v13 = *MEMORY[0x1E0C9D5E0];
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __39__CICircleSplashDistortion_outputImage__block_invoke;
  v23[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v23[4] = v20;
  *(double *)&v23[5] = v8;
  inputImage = self->inputImage;
  v18 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v21, v22);
  inputRadius = self->inputRadius;
  v24[0] = v18;
  v24[1] = inputRadius;
  return (id)objc_msgSend(v12, "applyWithExtent:roiCallback:inputImage:arguments:", v23, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2), v13, v14, v15, v16);
}

double __39__CICircleSplashDistortion_outputImage__block_invoke(uint64_t a1)
{
  double v1;
  double result;
  CGRect v3;

  v1 = *(double *)(a1 + 40);
  v3.origin.x = COERCE_FLOAT(*(_QWORD *)(a1 + 32)) - v1;
  v3.origin.y = COERCE_FLOAT(HIDWORD(*(_QWORD *)(a1 + 32))) - v1;
  v3.size.width = v1 + v1;
  v3.size.height = v3.size.width;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v3, -1.0, -1.0);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
