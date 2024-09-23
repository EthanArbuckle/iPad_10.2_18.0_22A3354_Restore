@implementation CIPerspectiveTransformWithExtent

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryGeometryAdjustment");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("6");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputExtent");
  v11[0] = CFSTR("CIAttributeType");
  v11[1] = CFSTR("CIAttributeDefault");
  v12[0] = CFSTR("CIAttributeTypeRectangle");
  v12[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputBottomLeft");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 155.0, 153.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v14[5] = CFSTR("inputBottomRight");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 548.0, 140.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v14[6] = CFSTR("inputTopRight");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 646.0, 507.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputTopLeft");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 118.0, 484.0);
  v4[1] = CFSTR("CIAttributeTypePosition");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_perspectiveTransform);
}

- (id)outputImage
{
  id result;
  double v4;
  double v5;
  double v6;
  double v7;
  CIVector *v8;
  double v9;
  double v10;
  double v11;
  float64x2_t v12;
  float64_t v13;
  double v14;
  float64x2_t v15;
  float64_t v16;
  double v17;
  float64x2_t v18;
  float64_t v19;
  double v20;
  float64x2_t v21;
  float64_t v22;
  CIVector *v23;
  CIVector *v24;
  CIVector *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double var0;
  double var1;
  double var2;
  double var3;
  id v42;
  float64x2_t v43;
  float64x2_t v44;
  float v45;
  float64x2_t v46;
  float v47;
  float64x2_t v48;
  float v49;
  CIImage *inputImage;
  float64_t v51;
  float64_t v52;
  float64_t v53;
  float64_t v54;
  float64_t v55;
  float64_t v56;
  float64_t v57;
  float64_t v58;
  float64_t v59;
  float64_t v60;
  float64_t v61;
  float64_t v62;
  _QWORD v63[5];
  int v64;
  float64_t v65;
  int v66;
  float32x2_t v67;
  float v68;
  float32x2_t v69;
  Rectangle v70;
  Rectangle v71;
  float32x2_t v72;
  float32x2_t v73;
  float32x2_t v74;
  double v75;
  _QWORD v76[4];
  double v77[9];
  double v78[10];
  CGRect v79;

  v78[9] = *(double *)MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  result = self->inputExtent;
  if (result)
  {
    objc_msgSend(result, "CGRectValue");
    v5 = v4;
    v7 = v6;
    v8 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
    -[CIVector X](v8, "X");
    v57 = v9;
    -[CIVector Y](v8, "Y");
    v56 = v10;
    -[CIVector X](self->inputBottomLeft, "X");
    v58 = v11;
    -[CIVector Y](self->inputBottomLeft, "Y");
    v12.f64[0] = v58;
    v12.f64[1] = v13;
    v75 = COERCE_DOUBLE(vcvt_f32_f64(v12));
    -[CIVector X](self->inputBottomRight, "X");
    v59 = v14;
    -[CIVector Y](self->inputBottomRight, "Y");
    v15.f64[0] = v59;
    v15.f64[1] = v16;
    v74 = vcvt_f32_f64(v15);
    -[CIVector X](self->inputTopLeft, "X");
    v60 = v17;
    -[CIVector Y](self->inputTopLeft, "Y");
    v18.f64[0] = v60;
    v18.f64[1] = v19;
    v73 = vcvt_f32_f64(v18);
    -[CIVector X](self->inputTopRight, "X");
    v61 = v20;
    -[CIVector Y](self->inputTopRight, "Y");
    v21.f64[0] = v61;
    v21.f64[1] = v22;
    v72 = vcvt_f32_f64(v21);
    computeHomogeneousPerspectiveTransformAndInverse(v77, (uint64_t)v78, v75, v74, v72, v73);
    v23 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v5 * v77[0], v5 * v77[3], v5 * v77[6]);
    v24 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v7 * v77[1], v7 * v77[4], v7 * v77[7]);
    v25 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v77[2], v77[5], v77[8]);
    -[CIVector X](v23, "X");
    v62 = v26;
    -[CIVector Y](v23, "Y");
    v54 = v27;
    -[CIVector Z](v23, "Z");
    v29 = v28;
    -[CIVector X](v24, "X");
    v55 = v30;
    -[CIVector Y](v24, "Y");
    v52 = v31;
    -[CIVector Z](v24, "Z");
    v33 = v32;
    -[CIVector X](v25, "X");
    v53 = v34;
    -[CIVector Y](v25, "Y");
    v51 = v35;
    -[CIVector Z](v25, "Z");
    v37 = v36;
    -[CIImage extent](self->inputImage, "extent");
    if (CGRectIsInfinite(v79))
      goto LABEL_8;
    *(int64x2_t *)&v71.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v71.var2 = 0.0;
    v71.var3 = 0.0;
    Rectangle::Union(&v71, (const vec2 *)&v75, (uint64_t)&v70);
    v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v74, (uint64_t)&v70);
    v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v72, (uint64_t)&v70);
    v71 = v70;
    Rectangle::Union(&v71, (const vec2 *)&v73, (uint64_t)&v70);
    v71 = v70;
    Rectangle::integralize(&v71, 0.0001, (uint64_t)&v70);
    var1 = v70.var1;
    var0 = v70.var0;
    var3 = v70.var3;
    var2 = v70.var2;
    if (v70.var0 == -8.98846567e307
      && v70.var1 == -8.98846567e307
      && v70.var2 == 1.79769313e308
      && v70.var3 == 1.79769313e308)
    {
LABEL_8:
      var0 = *MEMORY[0x1E0C9D5E0];
      var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v42 = -[CIPerspectiveTransformWithExtent _kernel](self, "_kernel");
    v43.f64[0] = v57;
    v43.f64[1] = v56;
    v44.f64[0] = v62;
    v44.f64[1] = v54;
    *(float32x2_t *)&v44.f64[0] = vcvt_f32_f64(v44);
    v45 = v29;
    *(float *)&v44.f64[1] = v45;
    v46.f64[0] = v55;
    v46.f64[1] = v52;
    *(float32x2_t *)&v46.f64[0] = vcvt_f32_f64(v46);
    v47 = v33;
    *(float *)&v46.f64[1] = v47;
    v48.f64[0] = v53;
    v48.f64[1] = v51;
    v49 = v37;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __47__CIPerspectiveTransformWithExtent_outputImage__block_invoke;
    v63[3] = &__block_descriptor_88_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v64 = LODWORD(v44.f64[1]);
    v66 = LODWORD(v46.f64[1]);
    v63[4] = *(_QWORD *)&v44.f64[0];
    v65 = v46.f64[0];
    v68 = v49;
    v67 = vcvt_f32_f64(v48);
    v69 = vcvt_f32_f64(v43);
    inputImage = self->inputImage;
    v76[0] = v23;
    v76[1] = v24;
    v76[2] = v25;
    v76[3] = v8;
    return (id)objc_msgSend(v42, "applyWithExtent:roiCallback:inputImage:arguments:", v63, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4), var0, var1, var2, var3);
  }
  return result;
}

void __47__CIPerspectiveTransformWithExtent_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL IsNull;
  float32x2_t v15;
  double v16;
  float32_t v17;
  double v18;
  float v19;
  float32x4_t v25;
  int32x4_t v26;
  int32x4_t v27;
  float32x4_t v28;
  float v29;
  float32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  int32x2_t v33;
  float32x4_t v34;
  float32x2_t v35;
  float32_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int32x4_t v39;
  int32x4_t v40;
  float32x4_t v41;
  float v42;
  float32x4_t v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x2_t v46;
  float32x4_t v47;
  float32x2_t v48;
  float32x4_t v49;
  float v50;
  float v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x2_t v57;
  Rectangle v58;
  Rectangle v59;
  CGRect v60;

  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    v10 = -8.98846567e307;
    v11 = 1.79769313e308;
    v12 = 1.79769313e308;
    v13 = -8.98846567e307;
  }
  else
  {
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    IsNull = CGRectIsNull(v60);
    v12 = 0.0;
    if (IsNull)
      v11 = 0.0;
    else
      v11 = a4;
    if (IsNull)
    {
      v10 = INFINITY;
    }
    else
    {
      v12 = a5;
      v10 = a3;
    }
    if (IsNull)
      v13 = INFINITY;
    else
      v13 = a2;
  }
  v54 = *(float32x4_t *)(a1 + 32);
  v55 = *(float32x4_t *)(a1 + 48);
  v56 = *(float32x4_t *)(a1 + 64);
  v15 = *(float32x2_t *)(a1 + 80);
  *(int64x2_t *)&v59.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  v16 = v11 + v13;
  v17 = fmin(v13, v11 + v13);
  v18 = v12 + v10;
  v19 = fmin(v10, v12 + v10);
  __asm { FMOV            V2.4S, #1.0 }
  v51 = v19;
  v52 = _Q2;
  _Q2.f32[0] = v17;
  v49 = _Q2;
  v25 = _Q2;
  v25.f32[1] = v19;
  v26 = (int32x4_t)vmulq_f32(v54, v25);
  v59.var2 = 0.0;
  v59.var3 = 0.0;
  v27 = (int32x4_t)vmulq_f32(v55, v25);
  v28 = vmulq_f32(v56, v25);
  v28.f32[0] = 1.0
             / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0], 0.000001);
  v57 = vadd_f32(v15, vmul_n_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)))), v28.f32[0]));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  v29 = fmax(v10, v18);
  v50 = v29;
  v30 = v49;
  v30.f32[1] = v29;
  v31 = (int32x4_t)vmulq_f32(v54, v30);
  v32 = (int32x4_t)vmulq_f32(v55, v30);
  v59 = v58;
  v33 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v31, 2), vadd_f32(*(float32x2_t *)v31.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.i8, 1)));
  v34 = vmulq_f32(v56, v30);
  v35 = (float32x2_t)vzip1_s32(v33, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), vadd_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1))));
  *(float *)v33.i32 = 1.0
                    / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0], 0.000001);
  v57 = vadd_f32(v15, vmul_n_f32(v35, *(float *)v33.i32));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  v36 = fmax(v13, v16);
  v37 = v52;
  v37.f32[0] = v36;
  v53 = v37;
  v38 = v37;
  v38.f32[1] = v51;
  v39 = (int32x4_t)vmulq_f32(v54, v38);
  v40 = (int32x4_t)vmulq_f32(v55, v38);
  v59 = v58;
  v41 = vmulq_f32(v56, v38);
  v42 = 1.0
      / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0], 0.000001);
  v57 = vadd_f32(v15, vmul_n_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1)))), v42));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
  v43 = v53;
  v43.f32[1] = v50;
  v44 = (int32x4_t)vmulq_f32(v54, v43);
  v45 = (int32x4_t)vmulq_f32(v55, v43);
  v59 = v58;
  v46 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1)));
  v47 = vmulq_f32(v56, v43);
  v48 = (float32x2_t)vzip1_s32(v46, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v45, 2), vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v45.i8, 1))));
  *(float *)v46.i32 = 1.0
                    / fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0], 0.000001);
  v57 = vadd_f32(v15, vmul_n_f32(v48, *(float *)v46.i32));
  Rectangle::Union(&v59, (const vec2 *)&v57, (uint64_t)&v58);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
