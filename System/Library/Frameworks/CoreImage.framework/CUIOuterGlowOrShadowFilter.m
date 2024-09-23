@implementation CUIOuterGlowOrShadowFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_outerGorS);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[6];
  _QWORD v16[8];

  v16[6] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("inputOffset");
  v13[0] = CFSTR("CIAttributeDefault");
  v13[1] = CFSTR("CIAttributeType");
  v14[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v14[1] = CFSTR("CIAttributeTypeOffset");
  v16[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v15[1] = CFSTR("inputRange");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1B2D0;
  v12[1] = &unk_1E2F1B2D0;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F1B300;
  v12[3] = &unk_1E2F1B300;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1B300;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v16[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v15[2] = CFSTR("inputRadius");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1B2D0;
  v10[1] = &unk_1E2F1B2D0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1B2E0;
  v10[3] = &unk_1E2F1B310;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1B320;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v16[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v15[3] = CFSTR("inputSize");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1B2D0;
  v8[1] = &unk_1E2F1B2D0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1B2E0;
  v8[3] = &unk_1E2F1B310;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1B320;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v16[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v15[4] = CFSTR("inputSpread");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B2D0;
  v6[1] = &unk_1E2F1B2D0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1B2F0;
  v6[3] = &unk_1E2F1B2F0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B2D0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v16[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v15[5] = CFSTR("inputColor");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v16[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  double v11;
  double v12;
  NSNumber *inputSize;
  unsigned int v14;
  double v15;
  unsigned int v16;
  unsigned int v17;
  CIImage *v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double x;
  double y;
  double width;
  double height;
  CIColor *inputColor;
  CGAffineTransform v43;
  _QWORD v44[4];
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v44[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputRange, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v6 = v5;
  if (-[NSNumber unsignedIntValue](self->inputSize, "unsignedIntValue") > 0x31)
    v7 = 50;
  else
    v7 = -[NSNumber unsignedIntValue](self->inputSize, "unsignedIntValue");
  if (-[NSNumber unsignedIntValue](self->inputSpread, "unsignedIntValue") > 0x63)
    v8 = 100;
  else
    v8 = -[NSNumber unsignedIntValue](self->inputSpread, "unsignedIntValue");
  if (!self->inputImage)
    return 0;
  v9 = fmin(fmax(v6, 0.0), 50.0);
  if (v9 <= 0.0 || v7 == 0)
  {
    -[CIVector Y](self->inputOffset, "Y");
    if (fabs(v11) < 0.5)
      return 0;
  }
  -[CIColor alpha](self->inputColor, "alpha");
  if (v12 <= 0.0)
    return 0;
  inputSize = self->inputSize;
  v14 = vcvtmd_u64_f64(v9 * 2.85299993);
  v15 = fmin(fmax(v4, 0.01), 1.0);
  if (inputSize)
    v16 = v8;
  else
    v16 = 0;
  if (inputSize)
    v17 = v7;
  else
    v17 = v14;
  v18 = _CUIMappedBlurImageWithSize(self->inputImage, v17, v16);
  -[CIVector X](self->inputOffset, "X");
  if (v19 != 0.0 || (-[CIVector Y](self->inputOffset, "Y"), v20 != 0.0))
  {
    -[CIVector X](self->inputOffset, "X");
    v22 = v21;
    -[CIVector Y](self->inputOffset, "Y");
    CGAffineTransformMakeTranslation(&v43, v22, v23);
    v18 = -[CIImage imageByApplyingTransform:](v18, "imageByApplyingTransform:", &v43);
  }
  v24 = -[CUIOuterGlowOrShadowFilter _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[CIImage extent](v18, "extent");
  v47.origin.x = v33;
  v47.origin.y = v34;
  v47.size.width = v35;
  v47.size.height = v36;
  v45.origin.x = v26;
  v45.origin.y = v28;
  v45.size.width = v30;
  v45.size.height = v32;
  v46 = CGRectUnion(v45, v47);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  inputColor = self->inputColor;
  v44[0] = v18;
  v44[1] = inputColor;
  v44[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  return (id)objc_msgSend(v24, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3), x, y, width, height);
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

- (NSNumber)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputSpread
{
  return self->inputSpread;
}

- (void)setInputSpread:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
