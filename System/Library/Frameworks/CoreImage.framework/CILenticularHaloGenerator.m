@implementation CILenticularHaloGenerator

- (id)_CILenticularHalo
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lenticularHalo);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  id v15;
  __float2 v16;
  CIVector *v17;
  float v18;
  float v19;
  float v20;
  double v21;
  CIVector *v22;
  float v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v34[10];

  v34[9] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputHaloRadius, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputHaloWidth, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputHaloOverlap, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputStriationStrength, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->inputStriationContrast, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v14 = (v13 + v13) * 3.14159265;
  v15 = +[CIImage noiseImage](CIImage, "noiseImage");
  v16 = __sincosf_stret(v14);
  v17 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v16.__cosval * 30.0 + 128.0, v16.__sinval * 30.0 + 128.0);
  v18 = v10 * v12;
  v19 = v10 * 0.5 * (1.0 - v12);
  v20 = (1.0 - v8) * v6;
  v21 = v4 + v20 * 2.0;
  v22 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v21, (float)(v4 + v20));
  v23 = v21 + v6;
  v24 = -[CILenticularHaloGenerator _CILenticularHalo](self, "_CILenticularHalo");
  -[CIVector X](self->inputCenter, "X");
  v25 = v23;
  v27 = v26 - v23;
  -[CIVector Y](self->inputCenter, "Y");
  v29 = v28 - v25;
  LODWORD(v28) = 1112014848;
  v34[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28, v15, self->inputCenter, v17);
  *(float *)&v30 = 1.0 / v6;
  v34[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  *(float *)&v31 = v18;
  v34[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  *(float *)&v32 = v19;
  v34[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v34[7] = v22;
  v34[8] = self->inputColor;
  return (id)objc_msgSend(v24, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_45, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 9), v27, v29, v25 + v25, v25 + v25);
}

double __40__CILenticularHaloGenerator_outputImage__block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 < 1)
    return 0.0;
  NSLog(CFSTR("CILenticularHaloGenerator only has one input"), v2, v3);
  return *MEMORY[0x1E0C9D628];
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  const __CFString *v15;
  CIColor *v16;
  _QWORD v17[5];
  _QWORD v18[10];
  _QWORD v19[11];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryGenerator");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryStillImage");
  v17[3] = CFSTR("CICategoryHighDynamicRange");
  v17[4] = CFSTR("CICategoryBuiltIn");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v19[1] = CFSTR("9");
  v18[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v18[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v19[2] = CFSTR("10.4");
  v18[3] = CFSTR("inputColor");
  v15 = CFSTR("CIAttributeDefault");
  v16 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 0.9, 0.8);
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v18[4] = CFSTR("inputHaloRadius");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F1A080;
  v14[1] = &unk_1E2F1A080;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F1A090;
  v14[3] = &unk_1E2F1A0A0;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeDistance");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v18[5] = CFSTR("inputHaloWidth");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1A080;
  v12[1] = &unk_1E2F1A080;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1A0B0;
  v12[3] = &unk_1E2F1A0C0;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeDistance");
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v18[6] = CFSTR("inputHaloOverlap");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1A080;
  v10[1] = &unk_1E2F1A080;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1A0D0;
  v10[3] = &unk_1E2F1A0E0;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeScalar");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v18[7] = CFSTR("inputStriationStrength");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A080;
  v8[1] = &unk_1E2F1A080;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1A0F0;
  v8[3] = &unk_1E2F1A100;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v19[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v18[8] = CFSTR("inputStriationContrast");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A080;
  v6[1] = &unk_1E2F1A080;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A110;
  v6[3] = &unk_1E2F1A0D0;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v19[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v18[9] = CFSTR("inputTime");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A080;
  v4[1] = &unk_1E2F1A080;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A0D0;
  v4[3] = &unk_1E2F1A080;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A080;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v19[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
}

@end
