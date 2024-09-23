@implementation CILineOverlay

- (id)_CISobelEdges
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_sobelEdges);
}

- (id)_CIComicNoiseReduction
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_noiseComicReduction);
}

- (id)_CIColorControls
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorControls);
}

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[10];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryBuiltIn");
  v13[1] = CFSTR("CICategoryStillImage");
  v13[2] = CFSTR("CICategoryVideo");
  v13[3] = CFSTR("CICategoryStylize");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("9");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.5");
  v14[3] = CFSTR("inputNRSharpness");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F19150;
  v12[1] = &unk_1E2F19150;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F19160;
  v12[3] = &unk_1E2F19170;
  v11[4] = CFSTR("CIAttributeIdentity");
  v11[5] = CFSTR("CIAttributeClass");
  v12[4] = &unk_1E2F19150;
  v12[5] = CFSTR("NSNumber");
  v11[6] = CFSTR("CIAttributeType");
  v12[6] = CFSTR("CIAttributeTypeScalar");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v14[4] = CFSTR("inputNRNoiseLevel");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19150;
  v10[1] = &unk_1E2F19150;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F19180;
  v10[3] = &unk_1E2F19190;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeClass");
  v10[4] = &unk_1E2F19150;
  v10[5] = CFSTR("NSNumber");
  v9[6] = CFSTR("CIAttributeType");
  v10[6] = CFSTR("CIAttributeTypeScalar");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v14[5] = CFSTR("inputEdgeIntensity");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19150;
  v8[1] = &unk_1E2F19150;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F191A0;
  v8[3] = &unk_1E2F191B0;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeClass");
  v8[4] = &unk_1E2F19150;
  v8[5] = CFSTR("NSNumber");
  v7[6] = CFSTR("CIAttributeType");
  v8[6] = CFSTR("CIAttributeTypeScalar");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v14[6] = CFSTR("inputThreshold");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19150;
  v6[1] = &unk_1E2F19150;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F191B0;
  v6[3] = &unk_1E2F19180;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeClass");
  v6[4] = &unk_1E2F19150;
  v6[5] = CFSTR("NSNumber");
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v14[7] = CFSTR("inputContrast");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F191C0;
  v4[1] = &unk_1E2F191C0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F191A0;
  v4[3] = &unk_1E2F191D0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeClass");
  v4[4] = &unk_1E2F191B0;
  v4[5] = CFSTR("NSNumber");
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  CIVector *v9;
  CIVector *v10;
  CIVector *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  NSNumber *inputEdgeIntensity;
  void *v20;
  id v21;
  NSNumber *inputThreshold;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[5];
  CGRect v31;
  CGRect v32;

  v30[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputNRSharpness, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputNRNoiseLevel, "floatValue");
  if (v5 <= 0.0)
  {
    v7 = (float)-v4;
    v8 = 0.0;
  }
  else
  {
    v6 = (v4 + 1.0) / -0.0199999996;
    v7 = (float)-(float)(v4 + (float)(v6 * v5));
    v8 = v6 / 3.0;
  }
  v9 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v7, v8, (float)-v4);
  v10 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.2912, 1.2921);
  v11 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.109088909, 0.114934928, 0.103904704);
  v12 = -[CILineOverlay _CIComicNoiseReduction](self, "_CIComicNoiseReduction");
  -[CIImage extent](self->inputImage, "extent");
  v30[0] = self->inputImage;
  v30[1] = v10;
  v30[2] = v11;
  v30[3] = v9;
  v17 = (void *)objc_msgSend(v12, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4), v13, v14, v15, v16);
  v18 = -[CILineOverlay _CISobelEdges](self, "_CISobelEdges");
  objc_msgSend(v17, "extent");
  v32 = CGRectInset(v31, -1.0, -1.0);
  inputEdgeIntensity = self->inputEdgeIntensity;
  v29[0] = v17;
  v29[1] = inputEdgeIntensity;
  v20 = (void *)objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_42, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2), v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  v21 = -[CILineOverlay _CIColorControls](self, "_CIColorControls");
  objc_msgSend(v20, "extent");
  inputThreshold = self->inputThreshold;
  v28[0] = v20;
  v28[1] = inputThreshold;
  v28[2] = self->inputContrast;
  return (id)objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3), v23, v24, v25, v26);
}

double __28__CILineOverlay_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

double __28__CILineOverlay_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
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
