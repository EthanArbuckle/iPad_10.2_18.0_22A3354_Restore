@implementation CITile2Filter

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTileEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.5");
  v12[3] = CFSTR("inputCenter");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputAngle");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1A970;
  v8[1] = &unk_1E2F1A980;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeIdentity");
  v8[2] = &unk_1E2F1A990;
  v8[3] = &unk_1E2F1A990;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeAngle");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputAcuteAngle");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -3.14159265);
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 3.14159265);
  v5[2] = CFSTR("CIAttributeDefault");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.57079633);
  v5[3] = CFSTR("CIAttributeIdentity");
  v5[4] = CFSTR("CIAttributeType");
  v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.57079633);
  v6[4] = CFSTR("CIAttributeTypeAngle");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v12[6] = CFSTR("inputWidth");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A990;
  v4[1] = &unk_1E2F1A9A0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A9B0;
  v4[3] = &unk_1E2F1A9C0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A9C0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (CGRect)_roiRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __double2 v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64_t v17;
  float32x2_t v18;
  float v19;
  float32x2_t v20;
  float32_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  double v28;
  float32x2_t v29;
  double v30;
  double v31;
  float64_t v32;

  -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->super.inputAngle, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputAcuteAngle, "doubleValue");
  v8 = v7;
  v9 = __sincos_stret(v6);
  v10 = v4 * v9.__cosval;
  v11 = v4 * v9.__sinval;
  v12 = __sincos_stret(v6 + v8);
  v13 = v4 * v12.__cosval;
  v14 = v4 * v12.__sinval;
  -[CIVector X](self->super.inputCenter, "X");
  v32 = v15;
  -[CIVector Y](self->super.inputCenter, "Y");
  v16.f64[0] = v32;
  v16.f64[1] = v17;
  v18 = vcvt_f32_f64(v16);
  *(float *)v16.f64 = v10;
  v19 = v11;
  *((float *)v16.f64 + 1) = v19;
  *(float32x2_t *)&v16.f64[0] = vadd_f32(*(float32x2_t *)&v16.f64[0], v18);
  v20.f32[0] = v13;
  v21 = v14;
  v20.f32[1] = v21;
  v22 = vadd_f32(v20, v18);
  v23.f32[0] = v10 + v13;
  v24 = v11 + v14;
  v23.f32[1] = v24;
  v25 = vadd_f32(v23, v18);
  v26 = vminnm_f32(vminnm_f32(vminnm_f32(v18, *(float32x2_t *)&v16.f64[0]), v22), v25);
  v27 = vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(v18, *(float32x2_t *)&v16.f64[0]), v22), v25);
  v28 = v26.f32[0];
  v16.f64[0] = v26.f32[1];
  v29 = vsub_f32(v27, v26);
  v30 = v29.f32[0];
  v31 = v29.f32[1];
  return CGRectIntegral(*(CGRect *)((char *)&v16 - 8));
}

- (double)_roiArea
{
  double v3;
  double v4;
  long double v5;

  -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputAcuteAngle, "doubleValue");
  return v4 * v4 * fabs(sin(v5));
}

- (float32x2_t)_roiCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __double2 v8;
  __double2 v9;
  double v10;
  float64x2_t v11;
  float64_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float64_t v16;

  objc_msgSend(a1[13], "doubleValue");
  v3 = v2;
  objc_msgSend(a1[12], "doubleValue");
  v5 = v4;
  objc_msgSend(a1[14], "doubleValue");
  v7 = v6;
  v8 = __sincos_stret(v5);
  v9 = __sincos_stret(v5 + v7);
  objc_msgSend(a1[11], "X");
  v16 = v10;
  objc_msgSend(a1[11], "Y");
  v11.f64[0] = v16;
  v11.f64[1] = v12;
  v13 = vcvt_f32_f64(v11);
  v14.f32[0] = v3 * v9.__cosval * 0.5 + v3 * v8.__cosval * 0.5;
  *(float *)v11.f64 = v3 * v9.__sinval * 0.5 + v3 * v8.__sinval * 0.5;
  v14.i32[1] = LODWORD(v11.f64[0]);
  return vadd_f32(v14, v13);
}

- (id)_singlePixelImage
{
  double v3;
  float32x2_t v4;
  float32x2_t v5;

  -[CITile2Filter _roiArea](self, "_roiArea");
  if (v3 >= 1.0)
    return 0;
  -[CITile2Filter _roiCenter](self, "_roiCenter");
  v5 = vrndm_f32(v4);
  return -[CIImage imageByClampingToExtent](-[CIImage imageByCroppingToRect:](self->super.inputImage, "imageByCroppingToRect:", v5.f32[0], v5.f32[1], 1.0, 1.0), "imageByClampingToExtent");
}

- (id)outputImage
{
  id v3;
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
  __double2 v14;
  __double2 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CIVector *v20;
  CIVector *v21;
  id v22;
  float v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CIImage *inputImage;
  _QWORD v31[5];
  double v32[4];
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[4];

  v40[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.inputImage || !self->super.inputCenter)
    return 0;
  v3 = -[CITile2Filter _singlePixelImage](self, "_singlePixelImage");
  if (!v3)
  {
    -[NSNumber doubleValue](self->super.inputWidth, "doubleValue");
    v5 = v4;
    -[NSNumber doubleValue](self->super.inputAngle, "doubleValue");
    v7 = v6;
    -[NSNumber doubleValue](self->inputAcuteAngle, "doubleValue");
    v9 = v8;
    -[CIVector X](self->super.inputCenter, "X");
    v11 = v10;
    -[CIVector Y](self->super.inputCenter, "Y");
    v13 = v12;
    v14 = __sincos_stret(v7);
    v15 = __sincos_stret(v7 + v9);
    v36 = v5 * v14.__cosval;
    v37 = v5 * v14.__sinval;
    v38 = v5 * v15.__cosval;
    v39 = v5 * v15.__sinval;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x5012000000;
    v33[3] = __Block_byref_object_copy__16;
    v33[4] = __Block_byref_object_dispose__16;
    v33[5] = "";
    v34 = 0u;
    v35 = 0u;
    -[CITile2Filter _roiRect](self, "_roiRect");
    *(_QWORD *)&v34 = v16;
    *((_QWORD *)&v34 + 1) = v17;
    *(_QWORD *)&v35 = v18;
    *((_QWORD *)&v35 + 1) = v19;
    affine::inverse((affine *)&v36, v32);
    v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v32[0] * 0.5, v32[2] * 0.5, v32[1] * 0.5, v32[3] * 0.5);
    v21 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v36, v38, v37, v39);
    v22 = -[CITileFilter _kernel](self, "_kernel");
    v23 = v11;
    v24 = v13;
    v25 = *MEMORY[0x1E0C9D5E0];
    v26 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v28 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __28__CITile2Filter_outputImage__block_invoke;
    v31[3] = &unk_1E2EC3638;
    v31[4] = v33;
    inputImage = self->super.inputImage;
    v40[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v23, v24);
    v40[1] = v20;
    v40[2] = v21;
    v3 = (id)objc_msgSend(v22, "applyWithExtent:roiCallback:inputImage:arguments:", v31, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3), v25, v26, v28, v27);
    _Block_object_dispose(v33, 8);
  }
  return v3;
}

double __28__CITile2Filter_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
}

- (NSNumber)inputAcuteAngle
{
  return self->inputAcuteAngle;
}

- (void)setInputAcuteAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
