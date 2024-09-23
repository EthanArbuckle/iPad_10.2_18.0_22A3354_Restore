@implementation CIRoundedRectangleStrokeGenerator

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGenerator");
  v11[1] = CFSTR("CICategoryStillImage");
  v11[2] = CFSTR("CICategoryHighDynamicRange");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("17");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("14.0");
  v12[3] = CFSTR("inputExtent");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 100.0, 100.0);
  v10[1] = CFSTR("CIAttributeTypeRectangle");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A940;
  v8[1] = &unk_1E2F1A940;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1A950;
  v8[3] = &unk_1E2F1BE18;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputColor");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputWidth");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A940;
  v4[1] = &unk_1E2F1A940;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A950;
  v4[3] = &unk_1E2F1BE18;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  float v9;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;
  float v15;
  CIColorKernel *v17;
  CIColorKernel *v18;
  CIVector *v19;
  double v20;
  double v21;
  uint64_t v22;
  CIColor *v23;
  uint64_t v24;
  CIColorKernel *v25;
  uint64_t v26;
  CIColor *inputColor;
  _QWORD v28[4];
  _QWORD v29[4];
  CGRect v30;
  CGRect v31;

  v29[3] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (CGRectIsEmpty(v30))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIColor alpha](self->inputColor, "alpha");
  if (v7 == 0.0)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  if (CGRectIsInfinite(v31))
    return +[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor);
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v10 = fmaxf(v9, 0.0);
  v11 = v10;
  if (v10 < 0.01)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v13 = width * 0.5;
  v14 = height * 0.5;
  v15 = fminf(fminf(fmaxf(v12, 0.0), v13), v14);
  if (v15 < 0.01 && (width * 0.5 <= v11 || height * 0.5 <= v11))
    return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor), "imageByCroppingToRect:", x, y, width, height);
  v17 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_roundedstroke);
  v18 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_rectstroke);
  v19 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", x, y, x + width, y + height);
  if (v15 <= 0.5)
  {
    v29[0] = v19;
    *(float *)&v20 = v10;
    v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    inputColor = self->inputColor;
    v29[1] = v26;
    v29[2] = inputColor;
    v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v25 = v18;
  }
  else
  {
    *(float *)&v20 = v15;
    v28[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20, v19);
    *(float *)&v21 = v10;
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
    v23 = self->inputColor;
    v28[2] = v22;
    v28[3] = v23;
    v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v25 = v17;
  }
  return -[CIColorKernel applyWithExtent:arguments:](v25, "applyWithExtent:arguments:", v24, x, y, width, height);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
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

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
