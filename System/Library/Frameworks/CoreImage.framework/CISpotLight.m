@implementation CISpotLight

- (id)_CISpotLight
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_spotLight);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CIVector *inputLightPosition;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v36;
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputBrightness, "floatValue");
  v36 = v3;
  -[NSNumber floatValue](self->inputConcentration, "floatValue");
  v5 = v4;
  -[CIVector X](self->inputLightPosition, "X");
  v7 = v6;
  -[CIVector X](self->inputLightPointsAt, "X");
  v9 = v7 - v8;
  -[CIVector Y](self->inputLightPosition, "Y");
  v11 = v10;
  -[CIVector Y](self->inputLightPointsAt, "Y");
  v13 = v11 - v12;
  -[CIVector Z](self->inputLightPosition, "Z");
  v15 = v14;
  -[CIVector Z](self->inputLightPointsAt, "Z");
  v17 = v15 - v16;
  v18 = sqrtf((float)((float)(v13 * v13) + (float)(v9 * v9)) + (float)(v17 * v17));
  if (v18 != 0.0)
  {
    v9 = v9 / v18;
    v13 = v13 / v18;
    v17 = v17 / v18;
  }
  v19 = 1.0 / v5;
  v20 = -[CISpotLight _CISpotLight](self, "_CISpotLight");
  -[CIImage extent](self->inputImage, "extent");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  inputLightPosition = self->inputLightPosition;
  v37[0] = self->inputImage;
  v37[1] = inputLightPosition;
  v37[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, v13, v17);
  -[CIColor red](self->inputColor, "red");
  v31 = v30 * v36;
  -[CIColor green](self->inputColor, "green");
  v33 = v32 * v36;
  -[CIColor blue](self->inputColor, "blue");
  v37[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v31, v33, v34 * v36, 1.0);
  v37[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v19, 0.0);
  return (id)objc_msgSend(v20, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5), v22, v24, v26, v28);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryStylize");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryHighDynamicRange");
  v13[4] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v15[1] = CFSTR("9");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputBrightness");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1ACC0;
  v12[1] = &unk_1E2F1ACC0;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1ACD0;
  v12[3] = &unk_1E2F1ACE0;
  v11[4] = CFSTR("CIAttributeIdentity");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1ACF0;
  v12[5] = CFSTR("CIAttributeTypeDistance");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v14[4] = CFSTR("inputConcentration");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1AD00;
  v10[1] = &unk_1E2F1AD00;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1AD10;
  v10[3] = &unk_1E2F1AD20;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1AD30;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v14[5] = CFSTR("inputColor");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v8[1] = CFSTR("CIAttributeTypeOpaqueColor");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v14[6] = CFSTR("inputLightPosition");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 400.0, 600.0, 150.0);
  v6[1] = CFSTR("CIAttributeTypePosition3");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputLightPointsAt");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 200.0, 200.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypePosition3");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
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
