@implementation CILocalLightFilter

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[8];
  _QWORD v10[8];
  _QWORD v11[3];
  _QWORD v12[5];
  _QWORD v13[7];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryStillImage");
  v11[2] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v12[1] = CFSTR("inputLocalLight");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1A1E0;
  v10[1] = &unk_1E2F1A1E0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1A1F0;
  v10[3] = &unk_1E2F1A200;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeIdentity");
  v10[4] = &unk_1E2F1A1D0;
  v10[5] = &unk_1E2F1A1D0;
  v9[6] = CFSTR("CIAttributeType");
  v9[7] = CFSTR("CIAttributeClass");
  v10[6] = CFSTR("CIAttributeTypeScalar");
  v10[7] = CFSTR("NSNumber");
  v13[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 8);
  v12[2] = CFSTR("inputSmartShadows");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A210;
  v8[1] = &unk_1E2F1A210;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1A200;
  v8[3] = &unk_1E2F1A200;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeIdentity");
  v8[4] = &unk_1E2F1A1D0;
  v8[5] = &unk_1E2F1A1D0;
  v7[6] = CFSTR("CIAttributeType");
  v8[6] = CFSTR("CIAttributeTypeScalar");
  v13[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v12[3] = CFSTR("inputLightMapWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = &unk_1E2F1A1D0;
  v6[1] = &unk_1E2F1A1D0;
  v5[2] = CFSTR("CIAttributeType");
  v5[3] = CFSTR("CIAttributeClass");
  v6[2] = CFSTR("CIAttributeTypeDistance");
  v6[3] = CFSTR("NSNumber");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v12[4] = CFSTR("inputLightMapHeight");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = &unk_1E2F1A1D0;
  v4[1] = &unk_1E2F1A1D0;
  v3[2] = CFSTR("CIAttributeType");
  v3[3] = CFSTR("CIAttributeClass");
  v4[2] = CFSTR("CIAttributeTypeDistance");
  v4[3] = CFSTR("NSNumber");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
}

- (id)_shadowKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_shadowKernel);
}

- (id)_polyKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_polyKernel);
}

- (id)outputImage
{
  double v3;
  double v4;
  NSData *inputLightMap;
  CIImage *inputGuideImage;
  CIImage *v7;
  CIImage *inputImage;
  CIImage *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputLocalLight, "doubleValue");
  if (fabs(v3) < 1.0e-10)
  {
    -[NSNumber doubleValue](self->inputSmartShadows, "doubleValue");
    if (fabs(v4) < 1.0e-10)
      return self->inputImage;
  }
  inputLightMap = self->inputLightMap;
  if (!inputLightMap && !self->inputLightMapImage)
    return self->inputImage;
  inputGuideImage = self->inputGuideImage;
  if (!inputGuideImage)
    inputGuideImage = self->inputImage;
  v7 = self->inputLightMapImage
     ? self->inputLightMapImage
     : _lightMapImageFromData(inputLightMap, self->inputLightMapWidth, self->inputLightMapHeight);
  v9 = _scaledLightMapImage(v7, inputGuideImage);
  if (!v9)
    return self->inputImage;
  v10 = -[CILocalLightFilter _polyKernel](self, "_polyKernel");
  inputImage = self->inputImage;
  -[NSNumber doubleValue](self->inputLocalLight, "doubleValue");
  if (fabs(v11) >= 1.0e-10)
  {
    -[CIImage extent](self->inputImage, "extent");
    v24[0] = inputImage;
    v24[1] = v9;
    v24[2] = self->inputLocalLight;
    inputImage = (CIImage *)objc_msgSend(v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3), v12, v13, v14, v15);
  }
  -[NSNumber doubleValue](self->inputSmartShadows, "doubleValue");
  if (fabs(v16) >= 1.0e-10)
  {
    v17 = -[CILocalLightFilter _shadowKernel](self, "_shadowKernel");
    -[CIImage extent](self->inputImage, "extent");
    v23[0] = inputImage;
    v23[1] = v9;
    v23[2] = self->inputSmartShadows;
    return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3), v18, v19, v20, v21);
  }
  return inputImage;
}

@end
