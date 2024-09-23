@implementation CIHueSaturationValueGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_hsvwheel);
}

- (id)_kernelD
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_hsvwheeldithered);
}

+ (id)customAttributes
{
  CGColorSpace *v2;
  void *v3;
  const __CFString *v5;
  CGColorSpace *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  _QWORD v16[8];
  _QWORD v17[10];

  v17[8] = *MEMORY[0x1E0C80C00];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryGradient");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("10");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.12");
  v16[3] = CFSTR("inputRadius");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F19D00;
  v14[1] = &unk_1E2F19D00;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F19D10;
  v14[3] = &unk_1E2F19D40;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeDistance");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v16[4] = CFSTR("inputValue");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F19D00;
  v12[1] = &unk_1E2F19D00;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F19D50;
  v12[3] = &unk_1E2F19D50;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeScalar");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v16[5] = CFSTR("inputSoftness");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19D00;
  v10[1] = &unk_1E2F19D00;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F19D50;
  v10[3] = &unk_1E2F19D50;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeScalar");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v16[6] = CFSTR("inputDither");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19D00;
  v8[1] = &unk_1E2F19D00;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19D60;
  v8[3] = &unk_1E2F19D50;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v16[7] = CFSTR("inputColorSpace");
  v5 = CFSTR("CIAttributeDefault");
  v6 = v2;
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  CGColorSpaceRelease(v2);
  return v3;
}

- (id)outputImage
{
  double v3;
  id result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIVector *v11;
  double v12;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  if (v3 < 0.01)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v5 = v3;
  -[NSNumber doubleValue](self->inputValue, "doubleValue");
  v7 = fmin(fmax(v6, 0.0), 1.0);
  -[NSNumber doubleValue](self->inputDither, "doubleValue");
  v9 = v8;
  -[NSNumber doubleValue](self->inputSoftness, "doubleValue");
  v11 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v7, v5, 1.0 / v5, v10);
  v12 = ceil(v5 + v5);
  if (v9 >= 0.01)
  {
    v13 = -[CIHueSaturationValueGradient _kernelD](self, "_kernelD");
    v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 * 0.00390625, v11);
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = v17;
    v16 = 2;
  }
  else
  {
    v13 = -[CIHueSaturationValueGradient _kernel](self, "_kernel");
    v18[0] = v11;
    v14 = (void *)MEMORY[0x1E0C99D20];
    v15 = v18;
    v16 = 1;
  }
  result = (id)objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(v14, "arrayWithObjects:count:", v15, v16), 0.0, 0.0, v12, v12);
  if (self->inputColorSpace)
    return (id)objc_msgSend(result, "imageByColorMatchingColorSpaceToWorkingSpace:");
  return result;
}

- (NSNumber)inputValue
{
  return self->inputValue;
}

- (void)setInputValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSoftness
{
  return self->inputSoftness;
}

- (void)setInputSoftness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputDither
{
  return self->inputDither;
}

- (void)setInputDither:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
