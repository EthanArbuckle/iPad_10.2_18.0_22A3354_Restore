@implementation CIParallelogramTile

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  CIVector *inputCenter;
  double v9;
  float64x2_t v10;
  float64_t v11;
  float32x2_t v12;
  __float2 v13;
  __float2 v14;
  float32x2_t v15;
  float v16;
  float v17;
  float32x2_t v18;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  __int128 v28;
  CIWarpKernel *v29;
  double v30;
  double v31;
  CIImage *inputImage;
  CIVector *v33;
  __int128 v34;
  float v35;
  double v36;
  float64_t v37;
  float32x2_t v38;
  float v39;
  double v40;
  _QWORD v41[4];
  __int128 v42;
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputAcuteAngle, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v39 = v7;
  inputCenter = self->inputCenter;
  -[CIVector X](inputCenter, "X");
  v37 = v9;
  -[CIVector Y](inputCenter, "Y");
  v10.f64[0] = v37;
  v10.f64[1] = v11;
  v12 = vcvt_f32_f64(v10);
  v13 = __sincosf_stret(v4);
  v38 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v13.__sinval), LODWORD(v13.__cosval)), v39);
  v14 = __sincosf_stret(v4 + v6);
  v15 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v14.__sinval), LODWORD(v14.__cosval)), v39);
  v16 = v15.f32[1];
  v17 = vmlas_n_f32((float)-v38.f32[1] * v15.f32[0], v15.f32[1], v38.f32[0]);
  if (fabsf(v17) >= 0.01)
  {
    v20 = 0.5 / v17;
    v21 = v15.f32[1] * v20;
    v22 = v20 * (float)-v38.f32[1];
    v23 = -(float)(v15.f32[0] * v20);
    v24 = v38.f32[0] * v20;
    v25 = vadd_f32(v38, v12);
    v26 = vadd_f32(v15, v12);
    v27 = vadd_f32(v15, v25);
    *(float32x2_t *)&v28 = vminnm_f32(v12, vminnm_f32(v25, vminnm_f32(v26, v27)));
    *((float32x2_t *)&v28 + 1) = vsub_f32(vmaxnm_f32(v12, vmaxnm_f32(v25, vmaxnm_f32(v26, v27))), *(float32x2_t *)&v28);
    v34 = v28;
    v35 = v15.f32[0];
    v29 = +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_parallelogramTile);
    v40 = *MEMORY[0x1E0C9D5E0];
    v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v31 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __34__CIParallelogramTile_outputImage__block_invoke;
    v41[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    inputImage = self->inputImage;
    v33 = self->inputCenter;
    v42 = v34;
    v43[0] = v33;
    v43[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v21, v23, v22, v24);
    v43[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v38.f32[0], v35, v38.f32[1], v16);
    return -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](v29, "applyWithExtent:roiCallback:inputImage:arguments:", v41, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3), v40, v36, v30, v31);
  }
  else
  {
    v18 = vrndm_f32(v12);
    return -[CIImage imageByClampingToExtent](-[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", v18.f32[0], v18.f32[1], 1.0, 1.0, *(double *)&v38), "imageByClampingToExtent");
  }
}

double __34__CIParallelogramTile_outputImage__block_invoke(float *a1)
{
  double result;
  CGRect v2;

  v2.origin.x = a1[8];
  v2.origin.y = a1[9];
  v2.size.width = a1[10];
  v2.size.height = a1[11];
  *(_QWORD *)&result = (unint64_t)CGRectInset(v2, -0.5, -0.5);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTileEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("9");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputAcuteAngle");
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
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputWidth");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A5D0;
  v4[1] = &unk_1E2F1A5E0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A5F0;
  v4[3] = &unk_1E2F1A600;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A600;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
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
