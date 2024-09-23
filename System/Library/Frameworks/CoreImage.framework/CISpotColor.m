@implementation CISpotColor

- (id)_CISpotColor
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_spotColor);
}

+ (id)customAttributes
{
  const __CFString *v3;
  CIColor *v4;
  const __CFString *v5;
  CIColor *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  const __CFString *v11;
  CIColor *v12;
  const __CFString *v13;
  CIColor *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  const __CFString *v19;
  CIColor *v20;
  const __CFString *v21;
  CIColor *v22;
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[5];
  _QWORD v28[15];
  _QWORD v29[17];

  v29[15] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("CIAttributeFilterCategories");
  v27[0] = CFSTR("CICategoryBuiltIn");
  v27[1] = CFSTR("CICategoryStillImage");
  v27[2] = CFSTR("CICategoryVideo");
  v27[3] = CFSTR("CICategoryHighDynamicRange");
  v27[4] = CFSTR("CICategoryStylize");
  v29[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
  v29[1] = CFSTR("9");
  v28[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v28[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v29[2] = CFSTR("10.5");
  v28[3] = CFSTR("inputCloseness1");
  v25[0] = CFSTR("CIAttributeMin");
  v25[1] = CFSTR("CIAttributeSliderMin");
  v26[0] = &unk_1E2F19150;
  v26[1] = &unk_1E2F19150;
  v25[2] = CFSTR("CIAttributeSliderMax");
  v25[3] = CFSTR("CIAttributeDefault");
  v26[2] = &unk_1E2F191E0;
  v26[3] = &unk_1E2F191F0;
  v25[4] = CFSTR("CIAttributeClass");
  v25[5] = CFSTR("CIAttributeType");
  v26[4] = CFSTR("NSNumber");
  v26[5] = CFSTR("CIAttributeTypeScalar");
  v29[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
  v28[4] = CFSTR("inputContrast1");
  v23[0] = CFSTR("CIAttributeMin");
  v23[1] = CFSTR("CIAttributeSliderMin");
  v24[0] = &unk_1E2F19150;
  v24[1] = &unk_1E2F19150;
  v23[2] = CFSTR("CIAttributeSliderMax");
  v23[3] = CFSTR("CIAttributeDefault");
  v24[2] = &unk_1E2F191B0;
  v24[3] = &unk_1E2F19200;
  v23[4] = CFSTR("CIAttributeClass");
  v23[5] = CFSTR("CIAttributeType");
  v24[4] = CFSTR("NSNumber");
  v24[5] = CFSTR("CIAttributeTypeScalar");
  v29[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v28[5] = CFSTR("inputCenterColor1");
  v21 = CFSTR("CIAttributeDefault");
  v22 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.0784, 0.0627, 0.0706);
  v29[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v28[6] = CFSTR("inputReplacementColor1");
  v19 = CFSTR("CIAttributeDefault");
  v20 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.4392, 0.1922, 0.1961);
  v29[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v28[7] = CFSTR("inputCloseness2");
  v17[0] = CFSTR("CIAttributeMin");
  v17[1] = CFSTR("CIAttributeSliderMin");
  v18[0] = &unk_1E2F19150;
  v18[1] = &unk_1E2F19150;
  v17[2] = CFSTR("CIAttributeSliderMax");
  v17[3] = CFSTR("CIAttributeDefault");
  v18[2] = &unk_1E2F191E0;
  v18[3] = &unk_1E2F19210;
  v17[4] = CFSTR("CIAttributeType");
  v18[4] = CFSTR("CIAttributeTypeScalar");
  v29[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v28[8] = CFSTR("inputContrast2");
  v15[0] = CFSTR("CIAttributeMin");
  v15[1] = CFSTR("CIAttributeSliderMin");
  v16[0] = &unk_1E2F19150;
  v16[1] = &unk_1E2F19150;
  v15[2] = CFSTR("CIAttributeSliderMax");
  v15[3] = CFSTR("CIAttributeDefault");
  v16[2] = &unk_1E2F191B0;
  v16[3] = &unk_1E2F19200;
  v15[4] = CFSTR("CIAttributeType");
  v16[4] = CFSTR("CIAttributeTypeScalar");
  v29[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v28[9] = CFSTR("inputCenterColor2");
  v13 = CFSTR("CIAttributeDefault");
  v14 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.5255, 0.3059, 0.3451);
  v29[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v28[10] = CFSTR("inputReplacementColor2");
  v11 = CFSTR("CIAttributeDefault");
  v12 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.9137, 0.5608, 0.5059);
  v29[10] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v28[11] = CFSTR("inputCloseness3");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19150;
  v10[1] = &unk_1E2F19150;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F191E0;
  v10[3] = &unk_1E2F191E0;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeScalar");
  v29[11] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v28[12] = CFSTR("inputContrast3");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19150;
  v8[1] = &unk_1E2F19150;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F191B0;
  v8[3] = &unk_1E2F19220;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v29[12] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v28[13] = CFSTR("inputCenterColor3");
  v5 = CFSTR("CIAttributeDefault");
  v6 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.9216, 0.4549, 0.3333);
  v29[13] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v28[14] = CFSTR("inputReplacementColor3");
  v3 = CFSTR("CIAttributeDefault");
  v4 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.9098, 0.7529, 0.6078);
  v29[14] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 15);
}

- (id)outputImage
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  CIVector *v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  CIVector *v14;
  id v15;
  CIColor *inputCenterColor1;
  CIColor *inputReplacementColor1;
  CIColor *inputCenterColor2;
  CIColor *inputReplacementColor2;
  CIColor *inputCenterColor3;
  CIColor *inputReplacementColor3;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v27[10];

  v27[9] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputCloseness1, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputCloseness2, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputCloseness3, "floatValue");
  v8 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v4, v6, v7, 0.0);
  -[NSNumber floatValue](self->inputContrast1, "floatValue");
  v10 = (float)(1.0 / (float)(1.0 - v9));
  -[NSNumber floatValue](self->inputContrast2, "floatValue");
  v12 = (float)(1.0 / (float)(1.0 - v11));
  -[NSNumber floatValue](self->inputContrast3, "floatValue");
  v14 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v10, v12, (float)(1.0 / (float)(1.0 - v13)), 0.0);
  v15 = -[CISpotColor _CISpotColor](self, "_CISpotColor");
  -[CIImage extent](self->inputImage, "extent");
  inputCenterColor1 = self->inputCenterColor1;
  inputReplacementColor1 = self->inputReplacementColor1;
  inputCenterColor2 = self->inputCenterColor2;
  inputReplacementColor2 = self->inputReplacementColor2;
  v27[0] = self->inputImage;
  v27[1] = inputCenterColor1;
  inputCenterColor3 = self->inputCenterColor3;
  v27[2] = inputReplacementColor1;
  v27[3] = inputCenterColor2;
  inputReplacementColor3 = self->inputReplacementColor3;
  v27[4] = inputReplacementColor2;
  v27[5] = inputCenterColor3;
  v27[6] = inputReplacementColor3;
  v27[7] = v8;
  v27[8] = v14;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 9), v22, v23, v24, v25);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
