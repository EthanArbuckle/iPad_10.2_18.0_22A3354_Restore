@implementation CIRoundedRectangleGenerator

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryGenerator");
  v9[1] = CFSTR("CICategoryStillImage");
  v9[2] = CFSTR("CICategoryHighDynamicRange");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("13");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.15");
  v10[3] = CFSTR("inputExtent");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 100.0, 100.0);
  v8[1] = CFSTR("CIAttributeTypeRectangle");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A940;
  v6[1] = &unk_1E2F1A940;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A950;
  v6[3] = &unk_1E2F1BE18;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[5] = CFSTR("inputColor");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v4[1] = CFSTR("CIAttributeTypeColor");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
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
  float v11;
  float v12;
  double v13;
  CIColorKernel *v14;
  CIVector *v15;
  double v16;
  uint64_t v17;
  CIColor *inputColor;
  _QWORD v19[4];
  CGRect v20;
  CGRect v21;

  v19[3] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsEmpty(v20))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIColor alpha](self->inputColor, "alpha");
  if (v7 == 0.0)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectIsInfinite(v21))
    return +[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor);
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v10 = width * 0.5;
  v11 = height * 0.5;
  v12 = fminf(fminf(fmaxf(v9, 0.0), v10), v11);
  v13 = v12;
  if (v12 < 0.01)
    return -[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor, v13), "imageByCroppingToRect:", x, y, width, height);
  v14 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_roundedrect, v13);
  v15 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", x, y, x + width, y + height);
  LODWORD(v16) = fmaxf(v12, 0.5);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16, v15);
  inputColor = self->inputColor;
  v19[1] = v17;
  v19[2] = inputColor;
  return -[CIColorKernel applyWithExtent:arguments:](v14, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3), x, y, width, height);
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

@end
