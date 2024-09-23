@implementation CICircleGenerator

- (id)_CICircle
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_circle);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CIVector *v15;
  id v16;
  CIColor *inputColor;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputEdgeBlur, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v6 = v5;
  -[CIVector X](self->inputCenter, "X");
  v8 = (float)(v4 * 0.5);
  v9 = v7 - v6 - v8;
  -[CIVector Y](self->inputCenter, "Y");
  v11 = v10 - v6 - v8;
  -[CIVector X](self->inputCenter, "X");
  v13 = v12;
  -[CIVector Y](self->inputCenter, "Y");
  v15 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v13, v14, v6, 1.0 / v4);
  v16 = -[CICircleGenerator _CICircle](self, "_CICircle");
  inputColor = self->inputColor;
  v19[0] = v15;
  v19[1] = inputColor;
  return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2), v9, v11, (float)(v4 + (float)(v6 * 2.0)), (float)(v4 + (float)(v6 * 2.0)));
}

+ (id)customAttributes
{
  const __CFString *v3;
  CIColor *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryGenerator");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryHighDynamicRange");
  v9[4] = CFSTR("CICategoryBuiltIn");
  v9[5] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v10[1] = CFSTR("inputEdgeBlur");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18F00;
  v8[1] = &unk_1E2F18F00;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F18F10;
  v8[3] = &unk_1E2F18F20;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[2] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18F00;
  v6[1] = &unk_1E2F18F00;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18F30;
  v6[3] = &unk_1E2F18F40;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[3] = CFSTR("inputColor");
  v3 = CFSTR("CIAttributeDefault");
  v4 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
}

@end
