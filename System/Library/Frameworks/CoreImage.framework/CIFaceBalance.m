@implementation CIFaceBalance

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[8];
  _QWORD v12[5];
  _QWORD v13[7];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryHighDynamicRange");
  v11[4] = CFSTR("CICategoryInterlaced");
  v11[5] = CFSTR("CICategoryNonSquarePixels");
  v11[6] = CFSTR("CICategoryBuiltIn");
  v11[7] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 8);
  v12[1] = CFSTR("inputOrigI");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F19B00;
  v10[1] = &unk_1E2F19B10;
  v9[2] = CFSTR("CIAttributeMin");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F19B00;
  v10[3] = &unk_1E2F19B10;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.103905);
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v13[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[2] = CFSTR("inputOrigQ");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F19B00;
  v8[1] = &unk_1E2F19B10;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F19B00;
  v8[3] = &unk_1E2F19B10;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0176465);
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[3] = CFSTR("inputStrength");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F19B20;
  v6[1] = &unk_1E2F19B30;
  v5[2] = CFSTR("CIAttributeMin");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F19B20;
  v6[3] = &unk_1E2F19B30;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F19B10;
  v6[5] = &unk_1E2F19B20;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v12[4] = CFSTR("inputWarmth");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19B20;
  v4[1] = &unk_1E2F19B40;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F19B20;
  v4[3] = &unk_1E2F19B40;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19B10;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_facebalance);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  -[NSNumber doubleValue](self->inputWarmth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputStrength, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputOrigI, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->inputOrigQ, "doubleValue");
  v10 = fabs(v6 * ((1.0 - v4) * *(double *)&faceBalanceIndoorIQ + v4 * *(double *)&faceBalanceOutdoorIQ - v8)) < 0.001;
  return fabs(v6 * ((1.0 - v4) * unk_1EE27D020 + v4 * unk_1EE27D030 - v9)) < 0.001 && v10;
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
  double v11;
  double v12;
  CIImage *inputImage;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputWarmth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputStrength, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputOrigI, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->inputOrigQ, "doubleValue");
  v9 = (1.0 - v4) * unk_1EE27D020 + v4 * unk_1EE27D030;
  v10 = v6 * ((1.0 - v4) * *(double *)&faceBalanceIndoorIQ + v4 * *(double *)&faceBalanceOutdoorIQ - v8);
  v12 = v6 * (v9 - v11);
  inputImage = self->inputImage;
  if (fabs(v10) < 0.001 && fabs(v12) < 0.001)
    return inputImage;
  v15 = objc_msgSend(-[CIImage _imageByApplyingGamma:](inputImage, "_imageByApplyingGamma:", 0.25), "imageByUnpremultiplyingAlpha");
  v16 = -[CIFaceBalance _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25[0] = v15;
  v25[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v10, v12);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), v18, v20, v22, v24), "imageByPremultiplyingAlpha"), "_imageByApplyingGamma:", 4.0);
}

- (id)_outputProperties
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  const void *v18;
  void *v19;
  const void **v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputOrigI, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputOrigQ, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputStrength, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->inputWarmth, "doubleValue");
  v10 = v9;
  v11 = 1.0 - v9;
  v12 = v11 * unk_1EE27D020 + v10 * unk_1EE27D030;
  v13 = v8 * (v11 * *(double *)&faceBalanceIndoorIQ + v10 * *(double *)&faceBalanceOutdoorIQ - v4);
  v14 = v8 * (v12 - v6);
  if (fabs(v13) < 0.001 && fabs(v14) < 0.001)
    return 0;
  v16 = (v13 + v14 * -0.2) * 222.43;
  v17 = (v13 + v14 * 5.0) * 127.955;
  v18 = metadataPropertyWithDouble(v4);
  if (v16 <= 10.0)
  {
    v22 = v18;
    v23 = metadataPropertyWithDouble(v6);
    v24 = metadataPropertyWithDouble(v8);
    v25 = metadataPropertyWithDouble(v10);
    v26 = metadataPropertyWithDouble(v16);
    v27 = metadataPropertyWithDouble(v17);
    v28 = metadataPropertyWithBool();
    v29 = metadataPropertyWithBool();
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v22;
    v21 = 8;
  }
  else
  {
    v30 = v18;
    v31 = metadataPropertyWithDouble(v6);
    v32 = metadataPropertyWithDouble(v8);
    v33 = metadataPropertyWithDouble(v10);
    v34 = metadataPropertyWithDouble(v16);
    v35 = metadataPropertyWithDouble(v17);
    v36 = metadataPropertyWithBool();
    v37 = metadataPropertyWithBool();
    v38 = metadataPropertyWithDouble(fmax(v16 + -10.0, 0.0) / 1.5);
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = &v30;
    v21 = 9;
  }
  return (id)objc_msgSend(v19, "arrayWithObjects:count:", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
               v37,
               v38);
}

- (id)_initFromProperties:(id)a3
{
  double v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("FaceBalanceOrigI"), &v9)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("FaceBalanceOrigQ"), &v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("FaceBalanceStrength"), &v7)&& metadataPropertyArrayGetDouble((uint64_t)a3, (uint64_t)CFSTR("http://ns.apple.com/adjustment-settings/1.0/"), (uint64_t)CFSTR("FaceBalanceWarmth"), &v6))
  {
    -[CIFaceBalance setInputOrigI:](self, "setInputOrigI:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9));
    -[CIFaceBalance setInputOrigQ:](self, "setInputOrigQ:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8));
    -[CIFaceBalance setInputStrength:](self, "setInputStrength:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7));
    -[CIFaceBalance setInputWarmth:](self, "setInputWarmth:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6));
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputOrigI
{
  return self->inputOrigI;
}

- (void)setInputOrigI:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputOrigQ
{
  return self->inputOrigQ;
}

- (void)setInputOrigQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputWarmth
{
  return self->inputWarmth;
}

- (void)setInputWarmth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
