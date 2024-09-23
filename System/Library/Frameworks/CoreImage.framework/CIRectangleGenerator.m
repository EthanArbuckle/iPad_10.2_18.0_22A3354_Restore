@implementation CIRectangleGenerator

- (id)_CIRectangle
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_rectangle);
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
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  CIVector *v16;
  CIVector *v17;
  id v18;
  _QWORD v20[4];
  CGRect v21;
  CGRect v22;

  v20[3] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputRectangle, "CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NSNumber floatValue](self->inputEdgeBlur, "floatValue");
  v12 = v11;
  v13 = 1.0 / v11;
  v14 = 100000.0;
  if (v12 != 0.0)
    v14 = v13;
  v15 = v14;
  v16 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)-v14, v15, (float)-v14, v15);
  v17 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v4 * v15 + 0.5, 0.5 - (v4 + v8) * v15, v6 * v15 + 0.5, 0.5 - (v6 + v10) * v15);
  v18 = -[CIRectangleGenerator _CIRectangle](self, "_CIRectangle");
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v22 = CGRectInset(v21, (float)-v12 * 0.5, (float)-v12 * 0.5);
  v20[0] = v16;
  v20[1] = v17;
  v20[2] = self->inputColor;
  return (id)objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3), v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

+ (id)customAttributes
{
  const __CFString *v3;
  CIColor *v4;
  _QWORD v5[2];
  _QWORD v6[2];
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
  v8[0] = &unk_1E2F1A940;
  v8[1] = &unk_1E2F1A940;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1A950;
  v8[3] = &unk_1E2F1A960;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[2] = CFSTR("inputRectangle");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeRectangle");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[3] = CFSTR("inputColor");
  v3 = CFSTR("CIAttributeDefault");
  v4 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
}

@end
