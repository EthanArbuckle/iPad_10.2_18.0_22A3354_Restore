@implementation CISunbeamsGenerator

- (id)_CISunbeams
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_sunbeams);
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
  id v13;
  __float2 v14;
  CIVector *v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CIVector *v26;
  CIVector *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  _QWORD v33[5];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputSunRadius, "floatValue");
  v4 = fmaxf(v3, 0.0);
  -[NSNumber floatValue](self->inputMaxStriationRadius, "floatValue");
  v6 = fmaxf(v5, 0.0);
  -[NSNumber floatValue](self->inputStriationStrength, "floatValue");
  v8 = fmaxf(v7, 0.0);
  -[NSNumber floatValue](self->inputStriationContrast, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v12 = (v11 + v11) * 3.14159265;
  v13 = +[CIImage noiseImage](CIImage, "noiseImage");
  v14 = __sincosf_stret(v12);
  v15 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14.__cosval * 30.0 + 128.0, v14.__sinval * 30.0 + 128.0);
  v16 = v8 * v10;
  v17 = v8 * 0.5 * (1.0 - v10);
  v18 = v4 * v6;
  -[CIVector X](self->inputCenter, "X");
  v20 = v19;
  -[CIVector Y](self->inputCenter, "Y");
  v22 = v21;
  -[CIVector X](v15, "X");
  v24 = v23;
  -[CIVector Y](v15, "Y");
  v26 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v20, v22, v24, v25);
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v4 * v4), 1.0 / v18, v16, v17);
  v28 = -[CISunbeamsGenerator _CISunbeams](self, "_CISunbeams");
  -[CIVector X](self->inputCenter, "X");
  v30 = v29 - v18;
  -[CIVector Y](self->inputCenter, "Y");
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __34__CISunbeamsGenerator_outputImage__block_invoke;
  v33[3] = &unk_1E2EC3588;
  v33[4] = v15;
  v34[0] = v13;
  v34[1] = v26;
  v34[2] = v27;
  v34[3] = self->inputColor;
  return (id)objc_msgSend(v28, "applyWithExtent:roiCallback:arguments:", v33, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4, MEMORY[0x1E0C809B0], 3221225472, __34__CISunbeamsGenerator_outputImage__block_invoke, &unk_1E2EC3588, v15), v30, v31 - v18, v18 + v18, v18 + v18);
}

double __34__CISunbeamsGenerator_outputImage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  double result;
  CGRect v6;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "X");
  v3 = v2 + -50.0;
  objc_msgSend(v1, "Y");
  v6.origin.y = v4 + -50.0;
  v6.size.width = 100.0;
  v6.origin.x = v3;
  v6.size.height = 100.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v6, -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  const __CFString *v13;
  CIColor *v14;
  _QWORD v15[5];
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryGenerator");
  v15[1] = CFSTR("CICategoryVideo");
  v15[2] = CFSTR("CICategoryStillImage");
  v15[3] = CFSTR("CICategoryHighDynamicRange");
  v15[4] = CFSTR("CICategoryBuiltIn");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v17[1] = CFSTR("9");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.4");
  v16[3] = CFSTR("inputColor");
  v13 = CFSTR("CIAttributeDefault");
  v14 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 0.5, 0.0);
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v16[4] = CFSTR("inputSunRadius");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1AE80;
  v12[1] = &unk_1E2F1AE80;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1AE90;
  v12[3] = &unk_1E2F1AEA0;
  v11[4] = CFSTR("CIAttributeIdentity");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1AEA0;
  v12[5] = CFSTR("CIAttributeTypeDistance");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v16[5] = CFSTR("inputMaxStriationRadius");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1AE80;
  v10[1] = &unk_1E2F1AE80;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1AEB0;
  v10[3] = &unk_1E2F1AEC0;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1AEC0;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v16[6] = CFSTR("inputStriationStrength");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1AE80;
  v8[1] = &unk_1E2F1AE80;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1AED0;
  v8[3] = &unk_1E2F1AEE0;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1AEE0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v16[7] = CFSTR("inputStriationContrast");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1AE80;
  v6[1] = &unk_1E2F1AE80;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1AEF0;
  v6[3] = &unk_1E2F1AF00;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1AF00;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v16[8] = CFSTR("inputTime");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1AE80;
  v4[1] = &unk_1E2F1AE80;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1AF10;
  v4[3] = &unk_1E2F1AE80;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1AE80;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

@end
