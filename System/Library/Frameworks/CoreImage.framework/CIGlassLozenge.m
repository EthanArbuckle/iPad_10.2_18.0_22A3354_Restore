@implementation CIGlassLozenge

- (id)_CILozengeRefraction
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_lozengeRefraction);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  CIVector *inputPoint0;
  float v7;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  CIVector *v30;
  CIVector *v31;
  id v32;
  double x;
  double y;
  double width;
  double height;
  CIVector *v37;
  NSNumber *inputRadius;
  float r2;
  CGFloat r2a;
  float v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  float v45;
  double v46;
  _QWORD v47[6];
  float v48;
  _QWORD v49[9];
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v49[8] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputRefraction, "floatValue");
  if (fabsf(v4) < 0.001)
    return self->inputImage;
  inputPoint0 = self->inputPoint0;
  if (!inputPoint0)
    return self->inputImage;
  if (!self->inputPoint1)
    return self->inputImage;
  v7 = fmaxf(v5, 0.0001);
  if (fabsf(v7 + -1.0) < 0.001)
    return self->inputImage;
  -[CIVector X](inputPoint0, "X");
  *(float *)&v9 = v9;
  v45 = *(float *)&v9;
  -[CIVector Y](self->inputPoint0, "Y");
  *(float *)&v11 = v10;
  r2 = *(float *)&v11;
  v44 = __PAIR64__(v11, LODWORD(v45));
  -[CIVector X](self->inputPoint1, "X");
  *(float *)&v12 = v12;
  v41 = *(float *)&v12;
  -[CIVector Y](self->inputPoint1, "Y");
  v14 = v13;
  v43 = __PAIR64__(LODWORD(v14), LODWORD(v41));
  v15 = v4;
  v16 = v45 - v41;
  if (v45 >= v41)
  {
    v17 = v41;
  }
  else
  {
    v16 = v41 - v45;
    v17 = v45;
  }
  v46 = v16 + v15 * 2.0;
  v42 = (float)(v17 - v4);
  v18 = r2 - v14;
  if (r2 < v14)
  {
    v18 = v14 - r2;
    v14 = r2;
  }
  v19 = (float)(v14 - v4);
  -[CIVector X](self->inputPoint0, "X", v18 + v15 * 2.0);
  v21 = v20;
  -[CIVector X](self->inputPoint1, "X");
  v23 = v21 - v22;
  -[CIVector Y](self->inputPoint0, "Y");
  v25 = v24;
  -[CIVector Y](self->inputPoint1, "Y");
  v27 = v25 - v26;
  v28 = sqrtf((float)(v27 * v27) + (float)(v23 * v23));
  if (v28 == 0.0)
    v29 = v28;
  else
    v29 = 1.0 / v28;
  v30 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)(v29 * v23), (float)(v29 * v27));
  v31 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (float)-(float)(v29 * v27), (float)(v29 * v23));
  v32 = -[CIGlassLozenge _CILozengeRefraction](self, "_CILozengeRefraction");
  -[CIImage extent](self->inputImage, "extent");
  v52.origin.x = v42;
  v52.origin.y = v19;
  v52.size.width = v46;
  v52.size.height = r2a;
  v51 = CGRectUnion(v50, v52);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __29__CIGlassLozenge_outputImage__block_invoke;
  v47[3] = &__block_descriptor_52_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v47[4] = v44;
  v47[5] = v43;
  v48 = v4;
  v37 = self->inputPoint0;
  v49[0] = self->inputImage;
  v49[1] = v37;
  inputRadius = self->inputRadius;
  v49[2] = self->inputPoint1;
  v49[3] = inputRadius;
  v49[4] = v30;
  v49[5] = v31;
  v49[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v43), LODWORD(v7))));
  v49[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 + v15);
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:arguments:", v47, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8), x, y, width, height);
}

CGFloat __29__CIGlassLozenge_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  int32x2_t v9;
  int32x2_t v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float64x2_t v15;
  float64_t v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat r1;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v9 = *(int32x2_t *)(a1 + 32);
  v10 = *(int32x2_t *)(a1 + 40);
  if ((vcgt_f32((float32x2_t)v10, (float32x2_t)v9).u8[0] & 1) != 0)
    LODWORD(v11) = *(_QWORD *)(a1 + 32);
  else
    LODWORD(v11) = *(_QWORD *)(a1 + 40);
  v12 = v11;
  if ((vcgt_f32((float32x2_t)v9, (float32x2_t)v10).u8[0] & 1) != 0)
    LODWORD(v13) = *(_QWORD *)(a1 + 32);
  else
    LODWORD(v13) = *(_QWORD *)(a1 + 40);
  v14 = v13 - v12;
  v15 = vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vzip2_s32(v9, v10), (float32x2_t)vzip2_s32(v10, v9)), (int8x8_t)vdup_lane_s32(v9, 1), (int8x8_t)vdup_lane_s32(v10, 1)));
  v16 = v15.f64[1];
  v15.f64[0] = v15.f64[0] - v15.f64[1];
  v17 = (float)-*(float *)(a1 + 48);
  v28 = CGRectInset(*(CGRect *)&v12, v17, v17);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  r1 = a5;
  v24.size.height = a5;
  v25 = CGRectIntersection(v24, v28);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v29 = CGRectInset(v26, v17 + v17, v17 + v17);
    v27.origin.x = a2;
    v27.origin.y = a3;
    v27.size.width = a4;
    v27.size.height = r1;
    *(_QWORD *)&a2 = (unint64_t)CGRectUnion(v27, v29);
  }
  return a2;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryDistortionEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("9");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputPoint0");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeDefault");
  v10[0] = CFSTR("CIAttributeTypePosition");
  v10[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputPoint1");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v7[0] = CFSTR("CIAttributeType");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 350.0, 150.0);
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputRefraction");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F1BAB8;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F19FE0;
  v6[3] = &unk_1E2F19FF0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeDefault");
  v6[4] = &unk_1E2F1A000;
  v6[5] = &unk_1E2F1A010;
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[6] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F19FE0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19FE0;
  v4[3] = &unk_1E2F1A020;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1A030;
  v4[5] = &unk_1E2F1A030;
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
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
