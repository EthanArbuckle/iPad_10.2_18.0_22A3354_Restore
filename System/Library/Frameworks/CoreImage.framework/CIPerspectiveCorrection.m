@implementation CIPerspectiveCorrection

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
  v13[1] = CFSTR("CICategoryStillImage");
  v13[2] = CFSTR("CICategoryVideo");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("8");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.10");
  v14[3] = CFSTR("inputBottomLeft");
  v11[0] = CFSTR("CIAttributeDefault");
  v11[1] = CFSTR("CIAttributeType");
  v12[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 155.0, 153.0);
  v12[1] = CFSTR("CIAttributeTypePosition");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputBottomRight");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 548.0, 140.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v14[5] = CFSTR("inputTopRight");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 646.0, 507.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v14[6] = CFSTR("inputTopLeft");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 118.0, 484.0);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputCrop");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = MEMORY[0x1E0C9AAB0];
  v4[1] = CFSTR("CIAttributeTypeBoolean");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_perspectiveCorrection);
}

- (id)outputImage
{
  double v3;
  float64x2_t v4;
  float64_t v5;
  float32x2_t v6;
  double v7;
  float64x2_t v8;
  float64_t v9;
  float32x2_t v10;
  double v11;
  float64x2_t v12;
  float64_t v13;
  float32x2_t v14;
  double v15;
  float64_t v17;
  float32x2_t v18;
  float32x2_t v19;
  int32x2_t v20;
  float32x2_t v21;
  int32x2_t v22;
  float32x2_t v23;
  int32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v32;
  float v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  float64x2_t v38;
  double v39;
  float64x2_t v40;
  double v41;
  double v42;
  double v43;
  float32x4_t v44;
  float32_t v45;
  float32_t v46;
  float32_t v47;
  double x;
  double y;
  double width;
  double height;
  double v52;
  double v53;
  BOOL IsNull;
  float32_t v55;
  float v56;
  float32x4_t v58;
  int32x4_t v59;
  int32x4_t v60;
  float32x4_t v61;
  float32_t v62;
  float32x4_t v63;
  float32x4_t v64;
  int32x4_t v65;
  int32x4_t v66;
  float32x4_t v67;
  float v68;
  float32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  float32x4_t v72;
  double v73;
  float32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  float32x4_t v77;
  double v78;
  double var0;
  double var1;
  double var2;
  double var3;
  id v83;
  float v84;
  unsigned int v85;
  unsigned int v86;
  float v87;
  unsigned int v88;
  unsigned int v89;
  float v90;
  float v91;
  CIImage *inputImage;
  float32x4_t v94;
  float v95;
  float v96;
  double v97;
  double v98;
  double v99;
  double v100;
  float64x2_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float v104;
  float64x2_t v105;
  float32x4_t v106;
  float v107;
  float64x2_t v108;
  float32x4_t v109;
  float v110;
  float64x2_t v111;
  float32x4_t v112;
  float v113;
  float64_t v114;
  float64_t v115;
  float64_t v116;
  float64_t v117;
  float32x2_t v118;
  float64x2_t v119;
  _QWORD v120[5];
  float v121;
  unint64_t v122;
  float v123;
  float32x2_t v124;
  float v125;
  Rectangle v126;
  float32x2_t v127;
  Rectangle v128;
  _QWORD v129[3];
  double v130[10];
  double v131[10];
  CGRect v132;
  CGRect v133;
  CGRect v134;

  v131[9] = *(double *)MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[CIVector X](self->inputBottomLeft, "X");
  v114 = v3;
  -[CIVector Y](self->inputBottomLeft, "Y");
  v4.f64[0] = v114;
  v4.f64[1] = v5;
  v6 = vcvt_f32_f64(v4);
  -[CIVector X](self->inputBottomRight, "X");
  v115 = v7;
  -[CIVector Y](self->inputBottomRight, "Y");
  v8.f64[0] = v115;
  v8.f64[1] = v9;
  v10 = vcvt_f32_f64(v8);
  -[CIVector X](self->inputTopLeft, "X");
  v116 = v11;
  -[CIVector Y](self->inputTopLeft, "Y");
  v12.f64[0] = v116;
  v12.f64[1] = v13;
  v14 = vcvt_f32_f64(v12);
  -[CIVector X](self->inputTopRight, "X");
  v117 = v15;
  -[CIVector Y](self->inputTopRight, "Y");
  _Q1.f64[0] = v117;
  _Q1.f64[1] = v17;
  v18 = vcvt_f32_f64(_Q1);
  v19 = vsub_f32(v6, v10);
  v20 = (int32x2_t)vmul_f32(v19, v19);
  *(float32x2_t *)&_Q1.f64[0] = vsub_f32(v18, v14);
  *(float32x2_t *)&_Q1.f64[0] = vmul_f32(*(float32x2_t *)&_Q1.f64[0], *(float32x2_t *)&_Q1.f64[0]);
  v21 = vsub_f32(v6, v14);
  v22 = (int32x2_t)vmul_f32(v21, v21);
  v23 = vsub_f32(v18, v10);
  v24 = (int32x2_t)vmul_f32(v23, v23);
  v25 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v22, v20), (float32x2_t)vzip2_s32(v22, v20)));
  *(float32x2_t *)&_Q1.f64[0] = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v24, *(int32x2_t *)&_Q1.f64[0]), (float32x2_t)vzip2_s32(v24, *(int32x2_t *)&_Q1.f64[0])));
  v26 = (float32x2_t)vrev64_s32((int32x2_t)vmaxnm_f32(v25, *(float32x2_t *)&_Q1.f64[0]));
  v27 = vdiv_f32(v25, *(float32x2_t *)&_Q1.f64[0]);
  __asm { FMOV            V1.2S, #1.0 }
  v32 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v27, *(float32x2_t *)&_Q1.f64[0]), (int8x8_t)v27, (int8x8_t)vdiv_f32(*(float32x2_t *)&_Q1.f64[0], v27));
  v33 = v32.f32[1];
  if (v32.f32[0] > v32.f32[1])
    v33 = v32.f32[0];
  if (v33 <= 2.0)
    v118 = v32;
  else
    v118 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v32), 2.0 / v33));
  computeHomogeneousPerspectiveTransformAndInverse(v130, (uint64_t)v131, *(double *)&v6, v10, v18, v14);
  v35 = v131[1];
  v36 = v131[4];
  v97 = v131[3];
  v98 = v131[0];
  v37 = v131[6];
  v99 = v131[7];
  v38.f64[0] = v131[2];
  v38.f64[1] = v131[5];
  v101 = v38;
  v39 = v131[8];
  v40.f64[0] = v130[0];
  v40.f64[1] = v130[3];
  v111 = v40;
  v119 = vcvtq_f64_f32(vmul_f32(v26, v118));
  v40.f64[0] = v130[1];
  v40.f64[1] = v130[4];
  v105 = v40;
  v42 = v130[6];
  v41 = v130[7];
  v40.f64[0] = v130[2];
  v40.f64[1] = v130[5];
  v108 = v40;
  v43 = v130[8];
  -[CIImage extent](self->inputImage, "extent");
  v100 = v35;
  if (CGRectIsInfinite(v132))
    goto LABEL_21;
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(vmulq_n_f64(v111, v119.f64[0]));
  v45 = v42 * v119.f64[0];
  v44.f32[2] = v45;
  v112 = v44;
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(vmulq_laneq_f64(v105, v119, 1));
  v46 = vmuld_lane_f64(v41, v119, 1);
  v44.f32[2] = v46;
  v106 = v44;
  *(float32x2_t *)v44.f32 = vcvt_f32_f64(v108);
  v47 = v43;
  v44.f32[2] = v47;
  v109 = v44;
  -[CIImage extent](self->inputImage, "extent");
  x = v133.origin.x;
  y = v133.origin.y;
  width = v133.size.width;
  height = v133.size.height;
  if (CGRectIsInfinite(v133))
  {
    v52 = -8.98846567e307;
    width = 1.79769313e308;
    height = 1.79769313e308;
    v53 = -8.98846567e307;
  }
  else
  {
    v134.origin.x = x;
    v134.origin.y = y;
    v134.size.width = width;
    v134.size.height = height;
    IsNull = CGRectIsNull(v134);
    if (IsNull)
    {
      width = 0.0;
      height = 0.0;
      v52 = INFINITY;
    }
    else
    {
      v52 = y;
    }
    v53 = IsNull ? INFINITY : x;
  }
  *(int64x2_t *)&v128.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  v55 = v53;
  v56 = v52;
  __asm { FMOV            V1.4S, #1.0 }
  v102 = _Q1;
  _Q1.f32[0] = v55;
  v94 = _Q1;
  v95 = v56;
  v58 = _Q1;
  v58.f32[1] = v56;
  v59 = (int32x4_t)vmulq_f32(v112, v58);
  v60 = (int32x4_t)vmulq_f32(v106, v58);
  v128.var2 = 0.0;
  v128.var3 = 0.0;
  v61 = vmulq_f32(v109, v58);
  *(double *)v61.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0], 0.000001);
  v61.f32[0] = *(double *)v61.i64;
  v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v59, 2), vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v59.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v60, 2), vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v60.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v61.f32, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  v128 = v126;
  v62 = width + v53;
  v63 = v102;
  v63.f32[0] = v62;
  v103 = v63;
  v64 = v63;
  v64.f32[1] = v95;
  v65 = (int32x4_t)vmulq_f32(v112, v64);
  v66 = (int32x4_t)vmulq_f32(v106, v64);
  v67 = vmulq_f32(v109, v64);
  *(double *)v67.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1))).f32[0], 0.000001);
  v67.f32[0] = *(double *)v67.i64;
  v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v65, 2), vadd_f32(*(float32x2_t *)v65.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v65.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v66, 2), vadd_f32(*(float32x2_t *)v66.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v66.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v67.f32, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  v128 = v126;
  v68 = height + v52;
  v69 = v94;
  v96 = v68;
  v69.f32[1] = v68;
  v70 = (int32x4_t)vmulq_f32(v112, v69);
  v71 = (int32x4_t)vmulq_f32(v106, v69);
  v72 = vmulq_f32(v109, v69);
  v73 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v72, 2), vaddq_f32(v72, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v72.f32, 1))).f32[0], 0.000001);
  *(float *)&v73 = v73;
  v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v70, 2), vadd_f32(*(float32x2_t *)v70.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v70.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2), vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v71.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v73, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  v128 = v126;
  v74 = v103;
  v74.f32[1] = v96;
  v75 = (int32x4_t)vmulq_f32(v112, v74);
  v76 = (int32x4_t)vmulq_f32(v106, v74);
  v77 = vmulq_f32(v109, v74);
  v78 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).f32[0], 0.000001);
  *(float *)&v78 = v78;
  v127 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v75, 2), vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v75.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v76, 2), vadd_f32(*(float32x2_t *)v76.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v76.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v78, 0));
  Rectangle::Union(&v128, (const vec2 *)&v127, (uint64_t)&v126);
  var1 = v126.var1;
  var0 = v126.var0;
  var3 = v126.var3;
  var2 = v126.var2;
  if (v126.var0 == -8.98846567e307
    && v126.var1 == -8.98846567e307
    && v126.var2 == 1.79769313e308
    && v126.var3 == 1.79769313e308)
  {
LABEL_21:
    var0 = *MEMORY[0x1E0C9D5E0];
    var1 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    var2 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    var3 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  v83 = -[CIPerspectiveCorrection _kernel](self, "_kernel", *(_OWORD *)&v94);
  v84 = v37;
  *(float *)&v85 = v98 / v119.f64[0];
  *(float *)&v86 = v97 / v119.f64[1];
  v87 = v99;
  *(float *)&v88 = v100 / v119.f64[0];
  *(float *)&v89 = v36 / v119.f64[1];
  v107 = *(float *)&v89;
  v110 = *(float *)&v88;
  v113 = v87;
  v90 = v87;
  v91 = v39;
  v104 = v91;
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __38__CIPerspectiveCorrection_outputImage__block_invoke;
  v120[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v121 = v84;
  v123 = v90;
  v120[4] = __PAIR64__(v86, v85);
  v122 = __PAIR64__(v89, v88);
  v125 = v91;
  v124 = vcvt_f32_f64(vdivq_f64(v101, v119));
  inputImage = self->inputImage;
  v129[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)&v85, *(float *)&v86, v84);
  v129[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v110, v107, v113);
  v129[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v124.f32[0], v124.f32[1], v104);
  v34 = (void *)objc_msgSend(v83, "applyWithExtent:roiCallback:inputImage:arguments:", v120, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 3), var0, var1, var2, var3);
  if (-[NSNumber BOOLValue](self->inputCrop, "BOOLValue"))
    return (id)objc_msgSend(v34, "imageByCroppingToRect:", 0.0, 0.0, *(_OWORD *)&v119);
  return v34;
}

void __38__CIPerspectiveCorrection_outputImage__block_invoke(float32x4_t *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  double v10;
  double v11;
  BOOL IsNull;
  float32_t v13;
  float v14;
  float32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  float32x4_t v23;
  float32_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  float32x4_t v29;
  double v30;
  float v31;
  float32x4_t v32;
  int32x4_t v33;
  int32x4_t v34;
  int32x2_t v35;
  float32x4_t v36;
  float32x2_t v37;
  double v38;
  float32x4_t v39;
  int32x4_t v40;
  int32x4_t v41;
  int32x2_t v42;
  float32x4_t v43;
  float32x2_t v44;
  double v45;
  float v46;
  float v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  Rectangle v54;
  float32x2_t v55;
  Rectangle v56;
  CGRect v57;

  v8 = a2;
  if (CGRectIsInfinite(*(CGRect *)&a2))
  {
    a3 = -8.98846567e307;
    v10 = 1.79769313e308;
    v11 = 1.79769313e308;
    v8 = -8.98846567e307;
  }
  else
  {
    v57.origin.x = v8;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    IsNull = CGRectIsNull(v57);
    if (IsNull)
      v10 = 0.0;
    else
      v10 = a4;
    if (IsNull)
      v11 = 0.0;
    else
      v11 = a5;
    if (IsNull)
    {
      a3 = INFINITY;
      v8 = INFINITY;
    }
  }
  v51 = a1[2];
  v52 = a1[3];
  v53 = a1[4];
  *(int64x2_t *)&v56.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
  v13 = v8;
  v14 = a3;
  __asm { FMOV            V2.4S, #1.0 }
  v49 = _Q2;
  _Q2.f32[0] = v13;
  v46 = v14;
  v48 = _Q2;
  v20 = _Q2;
  v20.f32[1] = v14;
  v21 = (int32x4_t)vmulq_f32(v51, v20);
  v22 = (int32x4_t)vmulq_f32(v52, v20);
  v56.var2 = 0.0;
  v56.var3 = 0.0;
  v23 = vmulq_f32(v53, v20);
  *(double *)v23.i64 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).f32[0], 0.000001);
  v23.f32[0] = *(double *)v23.i64;
  v55 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.f32, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  v24 = v10 + v8;
  v25 = v49;
  v25.f32[0] = v24;
  v50 = v25;
  v26 = v25;
  v26.f32[1] = v46;
  v27 = (int32x4_t)vmulq_f32(v51, v26);
  v28 = (int32x4_t)vmulq_f32(v52, v26);
  v56 = v54;
  v29 = vmulq_f32(v53, v26);
  v30 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).f32[0], 0.000001);
  *(float *)&v30 = v30;
  v55 = vdiv_f32((float32x2_t)vzip1_s32((int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2), vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1))), (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1)))), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v30, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  v31 = v11 + a3;
  v47 = v31;
  v32 = v48;
  v32.f32[1] = v31;
  v33 = (int32x4_t)vmulq_f32(v51, v32);
  v34 = (int32x4_t)vmulq_f32(v52, v32);
  v56 = v54;
  v35 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v33, 2), vadd_f32(*(float32x2_t *)v33.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v33.i8, 1)));
  v36 = vmulq_f32(v53, v32);
  v37 = (float32x2_t)vzip1_s32(v35, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))));
  v38 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0], 0.000001);
  *(float *)&v38 = v38;
  v55 = vdiv_f32(v37, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
  v39 = v50;
  v39.f32[1] = v47;
  v40 = (int32x4_t)vmulq_f32(v51, v39);
  v41 = (int32x4_t)vmulq_f32(v52, v39);
  v56 = v54;
  v42 = (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v40, 2), vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v40.i8, 1)));
  v43 = vmulq_f32(v53, v39);
  v44 = (float32x2_t)vzip1_s32(v42, (int32x2_t)vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1))));
  v45 = fmax(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0], 0.000001);
  *(float *)&v45 = v45;
  v55 = vdiv_f32(v44, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v45, 0));
  Rectangle::Union(&v56, (const vec2 *)&v55, (uint64_t)&v54);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputCrop
{
  return self->inputCrop;
}

- (void)setInputCrop:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
