@implementation CIHistogramDisplayFilter

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryReduction");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("8");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.?");
  v10[3] = CFSTR("inputHeight");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F19EC0;
  v8[1] = &unk_1E2F19ED0;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F19EC0;
  v8[3] = &unk_1E2F19EE0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeClass");
  v8[4] = &unk_1E2F19EE0;
  v8[5] = CFSTR("NSNumber");
  v7[6] = CFSTR("CIAttributeType");
  v8[6] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v10[4] = CFSTR("inputLowLimit");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F19EF0;
  v6[1] = &unk_1E2F19EC0;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F19EF0;
  v6[3] = &unk_1E2F19EC0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeClass");
  v6[4] = &unk_1E2F19EF0;
  v6[5] = CFSTR("NSNumber");
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[5] = CFSTR("inputHighLimit");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F19EF0;
  v4[1] = &unk_1E2F19EC0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19EF0;
  v4[3] = &unk_1E2F19EC0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeClass");
  v4[4] = &unk_1E2F19EC0;
  v4[5] = CFSTR("NSNumber");
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_histogram_display);
}

- (id)outputImage
{
  id result;
  float Width;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  _QWORD v14[4];
  CGRect v15;

  v14[3] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    objc_msgSend(result, "extent");
    Width = CGRectGetWidth(v15);
    -[NSNumber floatValue](self->inputHeight, "floatValue");
    v6 = fmin(fmax(v5, 1.0), 200.0);
    -[NSNumber doubleValue](self->inputLowLimit, "doubleValue");
    v8 = Width;
    v9 = fmin(fmax(v7, 0.0), 1.0) * v8;
    -[NSNumber doubleValue](self->inputHighLimit, "doubleValue");
    v11 = fmin(fmax(v10, 0.0), 1.0) * v8;
    v12 = -[CIHistogramDisplayFilter _kernel](self, "_kernel");
    *(float *)&v13 = v6;
    v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13, self->inputImage);
    v14[2] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v9, v11);
    return (id)objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_38, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3), 0.0, 0.0, v8, v6);
  }
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

- (NSNumber)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputHighLimit
{
  return self->inputHighLimit;
}

- (void)setInputHighLimit:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputLowLimit
{
  return self->inputLowLimit;
}

- (void)setInputLowLimit:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
