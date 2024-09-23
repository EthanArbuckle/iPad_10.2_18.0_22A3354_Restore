@implementation CUIInnerGlowOrShadowFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_innerGorS);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("inputOffset");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v10[1] = CFSTR("CIAttributeTypeOffset");
  v12[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v11[1] = CFSTR("inputRange");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1B2D0;
  v8[1] = &unk_1E2F1B2D0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1B300;
  v8[3] = &unk_1E2F1B300;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1B300;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v12[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v11[2] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B2D0;
  v6[1] = &unk_1E2F1B2D0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1B2E0;
  v6[3] = &unk_1E2F1B310;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B320;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v12[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v11[3] = CFSTR("inputColor");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v4[1] = CFSTR("CIAttributeTypeColor");
  v12[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  CIImage *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CIColor *inputColor;
  CGAffineTransform v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputRange, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  if (!self->inputImage)
    return 0;
  v6 = fmin(fmax(v5, 0.0), 50.0);
  if (v6 <= 0.0)
  {
    -[CIVector Y](self->inputOffset, "Y");
    if (fabs(v7) < 0.5)
      return 0;
  }
  -[CIColor alpha](self->inputColor, "alpha");
  if (v8 <= 0.0)
    return 0;
  v9 = fmin(fmax(v4, 0.01), 1.0);
  v10 = v6;
  v11 = _CUIMappedBlurImageWithSize(self->inputImage, vcvtms_u32_f32(v10 / 2.853), 0);
  -[CIVector X](self->inputOffset, "X");
  if (v12 != 0.0 || (-[CIVector Y](self->inputOffset, "Y"), v13 != 0.0))
  {
    -[CIVector X](self->inputOffset, "X");
    v15 = v14;
    -[CIVector Y](self->inputOffset, "Y");
    CGAffineTransformMakeTranslation(&v28, v15, v16);
    v11 = -[CIImage imageByApplyingTransform:](v11, "imageByApplyingTransform:", &v28);
  }
  v17 = -[CUIInnerGlowOrShadowFilter _kernel](self, "_kernel");
  -[CIImage extent](v11, "extent");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  inputColor = self->inputColor;
  v29[0] = v11;
  v29[1] = inputColor;
  v29[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3), v19, v21, v23, v25);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputOffset
{
  return self->inputOffset;
}

- (void)setInputOffset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRange
{
  return self->inputRange;
}

- (void)setInputRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
