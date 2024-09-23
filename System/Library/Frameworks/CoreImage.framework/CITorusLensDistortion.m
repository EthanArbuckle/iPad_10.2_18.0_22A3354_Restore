@implementation CITorusLensDistortion

- (id)_CITorusRefraction
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_torusRefraction);
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
  double v12;
  float v13;
  unsigned int v14;
  float v15;
  double v16;
  float64x2_t v17;
  float64_t v18;
  float32x2_t v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id v24;
  double x;
  double y;
  double width;
  double height;
  CIVector *inputCenter;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  NSNumber *inputWidth;
  float64_t v35;
  float v36;
  _QWORD v37[6];
  _QWORD v38[8];
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38[7] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputRefraction, "floatValue");
  v8 = v7;
  if (fabsf(v4) < 0.001)
    return self->inputImage;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  if (fabsf(v9) < 0.001)
    return self->inputImage;
  v10 = fmaxf(v8, 0.0001);
  if (fabsf(v10 + -1.0) < 0.001)
    return self->inputImage;
  v12 = v4;
  v13 = (1.0 - (float)(v6 / v4)) * v4;
  *(float *)&v14 = 2.0 / (float)(v4 - v13);
  v15 = (float)-(float)(v4 + v13) / (float)(v4 - v13);
  v36 = (float)(v4 - v13) * 0.5;
  -[CIVector X](self->inputCenter, "X");
  v35 = v16;
  -[CIVector Y](self->inputCenter, "Y");
  v17.f64[0] = v35;
  v17.f64[1] = v18;
  v19 = vcvt_f32_f64(v17);
  -[CIVector X](self->inputCenter, "X");
  v21 = v20 - v12;
  -[CIVector Y](self->inputCenter, "Y");
  v23 = v22 - v12;
  v24 = -[CITorusLensDistortion _CITorusRefraction](self, "_CITorusRefraction");
  -[CIImage extent](self->inputImage, "extent");
  v41.origin.x = v21;
  v41.origin.y = v23;
  v41.size.width = v12 + v12;
  v41.size.height = v12 + v12;
  v40 = CGRectUnion(v39, v41);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __36__CITorusLensDistortion_outputImage__block_invoke;
  v37[3] = &unk_1E2EC2C28;
  v37[5] = v19;
  v37[4] = self;
  inputCenter = self->inputCenter;
  v38[0] = self->inputImage;
  v38[1] = inputCenter;
  v38[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE((unint64_t)v14));
  *(float *)&v30 = v15;
  v38[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  *(float *)&v31 = v36;
  v38[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  *(float *)&v32 = v10;
  v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  inputWidth = self->inputWidth;
  v38[5] = v33;
  v38[6] = inputWidth;
  return (id)objc_msgSend(v24, "applyWithExtent:roiCallback:arguments:", v37, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 7), x, y, width, height);
}

CGFloat __36__CITorusLensDistortion_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float v10;
  float v11;
  float v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v18;
  uint64_t v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v19 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "floatValue");
  v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "floatValue");
  v18 = v12;
  v24.origin.x = (float)(*(float *)&v19 - v11);
  v24.origin.y = (float)(*((float *)&v19 + 1) - v11);
  v24.size.width = v11 + v11;
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  v24.size.height = v24.size.width;
  v21 = CGRectIntersection(v20, v24);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  if (!CGRectIsEmpty(v21))
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v25 = CGRectInset(v22, v18 * -5.0, v18 * -5.0);
    v23.origin.x = a2;
    v23.origin.y = a3;
    v23.size.width = a4;
    v23.size.height = a5;
    *(_QWORD *)&a2 = (unint64_t)CGRectUnion(v23, v25);
  }
  return a2;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryDistortionEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("9");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputRefraction");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeMin");
  v8[0] = CFSTR("CIAttributeTypeScalar");
  v8[1] = &unk_1E2F19FE0;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F19FE0;
  v8[3] = &unk_1E2F19FF0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeIdentity");
  v8[4] = &unk_1E2F1A010;
  v8[5] = &unk_1E2F1A000;
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[4] = CFSTR("inputWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19FE0;
  v6[1] = &unk_1E2F19FE0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A040;
  v6[3] = &unk_1E2F1A050;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F19FE0;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19FE0;
  v4[1] = &unk_1E2F19FE0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A060;
  v4[3] = &unk_1E2F1A070;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19FE0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
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
