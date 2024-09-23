@implementation CIStretch

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  const __CFString *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5 = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v6[1] = CFSTR("inputPoint");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypePosition");
  v7[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
}

- (void)setDefaults
{
  -[CIStretch setInputPoint:](self, "setInputPoint:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0));
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_stretch);
}

- (double)computeDOD:(uint64_t)a1
{
  double result;
  float v3;
  CGRect v4;

  objc_msgSend(*(id *)(a1 + 80), "extent", *(_QWORD *)&a2);
  *(_QWORD *)&result = (unint64_t)CGRectInset(v4, (float)-v3, (float)-v3);
  return result;
}

- (id)outputImage
{
  id result;
  double v4;
  long double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  CIVector *v18;
  CIVector *v19;
  double v20;
  float64x2_t v21;
  float64_t v22;
  float32x2_t v23;
  double v24;
  float64x2_t v25;
  float64_t v26;
  double v27;
  float64x2_t v28;
  float64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  CIImage *inputImage;
  float64_t v40;
  float64_t v41;
  float64_t v42;
  int32x2_t v43;
  float32x4_t v44;
  _QWORD v45[4];
  float32x4_t v46;
  float32x2_t v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    if (self->inputSize)
    {
      -[CIVector X](self->inputSize, "X");
      v5 = v4;
      -[CIVector Y](self->inputSize, "Y");
      v7 = v6;
    }
    else
    {
      objc_msgSend(result, "extent");
      v5 = v8;
      v7 = v9;
    }
    v10 = hypot(v5, v7);
    v11 = v10;
    v12 = v11 * 0.84 * 0.5;
    v13 = v11 * 0.18 * 0.5;
    v14 = v11 * 0.234 * 0.5;
    -[CIVector X](self->inputPoint, "X");
    v16 = v15;
    -[CIVector Y](self->inputPoint, "Y");
    v18 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v16, v17);
    v19 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 1.0 / v12, v13, 1.0 / v14);
    -[CIVector X](v18, "X");
    v41 = v20;
    -[CIVector Y](v18, "Y");
    v21.f64[0] = v41;
    v21.f64[1] = v22;
    v23 = vcvt_f32_f64(v21);
    -[CIVector X](v19, "X");
    v42 = v24;
    -[CIVector Y](v19, "Y");
    v25.f64[0] = v42;
    v25.f64[1] = v26;
    v43 = (int32x2_t)vcvt_f32_f64(v25);
    -[CIVector Z](v19, "Z");
    v40 = v27;
    -[CIVector W](v19, "W");
    v28.f64[0] = v40;
    v28.f64[1] = v29;
    v44 = vcvt_hight_f32_f64(v43, v28);
    -[CIStretch computeDOD:](self, "computeDOD:");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = -[CIStretch _kernel](self, "_kernel");
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __24__CIStretch_outputImage__block_invoke;
    v45[3] = &__block_descriptor_56_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v47 = v23;
    v46 = v44;
    inputImage = self->inputImage;
    v48[0] = v18;
    v48[1] = v19;
    return (id)objc_msgSend(v38, "applyWithExtent:roiCallback:inputImage:arguments:", v45, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2), v31, v33, v35, v37);
  }
  return result;
}

double __24__CIStretch_outputImage__block_invoke(float32x4_t *a1, simd_float4 a2, double a3, __n128 a4, double a5)
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  float32x2_t v9;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v23;
  float32x2_t v24;
  float32x2_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  unint64_t v30;
  float32x2_t v31;
  float32x2_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  unint64_t v37;
  float32x2_t v38;
  float32x2_t v39;
  double result;
  CGFloat r1;
  unsigned __int32 r1_24;
  double v44;
  double v45;
  __int32 v46;
  float32x2_t v47;
  __n128 v48;
  float32x4_t v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v44 = *(double *)a2.i64;
  v45 = a4.n128_f64[0];
  a4.n128_u64[0] = a1[3].u64[0];
  v48 = a4;
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  r1 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v9.f32[0] = *(double *)a2.i64;
  v46 = v9.i32[0];
  a2.f32[0] = a3;
  r1_24 = a2.i32[0];
  v9.i32[1] = a2.i32[0];
  v49 = a1[2];
  __asm { FMOV            V12.2S, #1.0 }
  *(float32x2_t *)a2.f32 = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32(v9, (float32x2_t)a4.n128_u64[0]), v49.f32[0]), 0), _D12));
  __asm { FMOV            V13.2S, #3.0 }
  v16 = vmul_f32(*(float32x2_t *)a2.f32, vmul_f32(*(float32x2_t *)a2.f32, vsub_f32(_D13, vadd_f32(*(float32x2_t *)a2.f32, *(float32x2_t *)a2.f32))));
  v17 = (float32x2_t)vdup_lane_s32((int32x2_t)a4.n128_u64[0], 1);
  *(float32x2_t *)a2.f32 = vmul_laneq_f32(vsub_f32(v9, v17), v49, 2);
  v18 = vsub_f32(v9, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4(a2), *(float32x2_t *)v49.f32, 1), v16));
  v57.origin.x = v18.f32[0];
  v57.origin.y = v18.f32[1];
  v57.size.width = 0.0;
  v57.size.height = 0.0;
  v50.origin.x = r1;
  v50.origin.y = v6;
  v50.size.width = v7;
  v50.size.height = v8;
  v51 = CGRectUnion(v50, v57);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  *(float *)&v51.origin.x = a3 + a5;
  LODWORD(a5) = LODWORD(v51.origin.x);
  v23 = v48.n128_u64[1];
  v47 = (float32x2_t)__PAIR64__(LODWORD(v51.origin.x), v46);
  *(float32x2_t *)&v51.origin.x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32(v47, (float32x2_t)v48.n128_u64[0]), v49.f32[0]), 0), _D12));
  v24 = vmul_f32(*(float32x2_t *)&v51.origin.x, vmul_f32(*(float32x2_t *)&v51.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v51.origin.x, *(float32x2_t *)&v51.origin.x))));
  *(float32x2_t *)&v51.origin.x = vmul_laneq_f32(vsub_f32(v47, v17), v49, 2);
  v25 = vsub_f32(v47, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v51.origin), *(float32x2_t *)v49.f32, 1), v24));
  v58.origin.x = v25.f32[0];
  v58.origin.y = v25.f32[1];
  v58.size.width = 0.0;
  v58.size.height = 0.0;
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v53 = CGRectUnion(v52, v58);
  v26 = v53.origin.x;
  v27 = v53.origin.y;
  v28 = v53.size.width;
  v29 = v53.size.height;
  *(float *)&v53.origin.x = v44 + v45;
  v47.i32[0] = LODWORD(v53.origin.x);
  *(_QWORD *)&v53.origin.y = __PAIR64__(r1_24, LODWORD(v53.origin.x));
  v30 = v48.n128_u64[1];
  *(float32x2_t *)&v53.origin.x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32((float32x2_t)__PAIR64__(r1_24, LODWORD(v53.origin.x)), (float32x2_t)v48.n128_u64[0]), v49.f32[0]), 0), _D12));
  v31 = vmul_f32(*(float32x2_t *)&v53.origin.x, vmul_f32(*(float32x2_t *)&v53.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v53.origin.x, *(float32x2_t *)&v53.origin.x))));
  *(float32x2_t *)&v53.origin.x = vmul_laneq_f32(vsub_f32(*(float32x2_t *)&v53.origin.y, v17), v49, 2);
  v32 = vsub_f32(*(float32x2_t *)&v53.origin.y, vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v53.origin), *(float32x2_t *)v49.f32, 1), v31));
  v59.origin.x = v32.f32[0];
  v59.origin.y = v32.f32[1];
  v59.size.width = 0.0;
  v59.size.height = 0.0;
  v54.origin.x = v26;
  v54.origin.y = v27;
  v54.size.width = v28;
  v54.size.height = v29;
  v55 = CGRectUnion(v54, v59);
  v33 = v55.origin.x;
  v34 = v55.origin.y;
  v35 = v55.size.width;
  v36 = v55.size.height;
  v37 = v48.n128_u64[1];
  *(float32x2_t *)&v55.origin.x = vsub_f32(_D12, vminnm_f32(vmaxnm_f32(vmul_n_f32(vabd_f32((float32x2_t)__PAIR64__(LODWORD(a5), v47.u32[0]), (float32x2_t)v48.n128_u64[0]), v49.f32[0]), 0), _D12));
  v38 = vmul_f32(*(float32x2_t *)&v55.origin.x, vmul_f32(*(float32x2_t *)&v55.origin.x, vsub_f32(_D13, vadd_f32(*(float32x2_t *)&v55.origin.x, *(float32x2_t *)&v55.origin.x))));
  *(float32x2_t *)&v55.origin.x = vmul_laneq_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(a5), v47.u32[0]), v17), v49, 2);
  v39 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(a5), v47.u32[0]), vmul_f32(vmul_lane_f32((float32x2_t)*(_OWORD *)&_simd_sin_f4((simd_float4)v55.origin), *(float32x2_t *)v49.f32, 1), v38));
  v60.origin.x = v39.f32[0];
  v60.origin.y = v39.f32[1];
  v60.size.width = 0.0;
  v60.size.height = 0.0;
  v56.origin.x = v33;
  v56.origin.y = v34;
  v56.size.width = v35;
  v56.size.height = v36;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v56, v60);
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

- (CIVector)inputPoint
{
  return self->inputPoint;
}

- (void)setInputPoint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
