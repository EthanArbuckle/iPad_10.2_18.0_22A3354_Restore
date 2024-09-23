@implementation CIBarsSwipeTransition

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryTransition");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.5");
  v12[3] = CFSTR("inputAngle");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F18BD0;
  v10[1] = &unk_1E2F18BE0;
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = &unk_1E2F18BF0;
  v10[3] = CFSTR("CIAttributeTypeAngle");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v12[4] = CFSTR("inputWidth");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18C00;
  v8[1] = &unk_1E2F18C00;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F18C10;
  v8[3] = &unk_1E2F18C20;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputBarOffset");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18C30;
  v6[1] = &unk_1E2F18C30;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18C40;
  v6[3] = &unk_1E2F18C50;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v12[6] = CFSTR("inputTime");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18BD0;
  v4[1] = &unk_1E2F18BD0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F18C30;
  v4[3] = &unk_1E2F18C30;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18BD0;
  v4[5] = CFSTR("CIAttributeTypeTime");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_barsSwipe);
}

- (id)outputImage
{
  CIImage *inputImage;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  float v17;
  float v18;
  float v19;
  __float2 v20;
  float v21;
  unsigned int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  CIVector *v28;
  double v29;
  float64x2_t v30;
  float64_t v31;
  float32x2_t v32;
  float v33;
  CIVector *v34;
  float v35;
  CIVector *v36;
  double v37;
  float cosval;
  double v39;
  double v40;
  float v42;
  double v43;
  float64x2_t v44;
  float64_t v45;
  double v46;
  float v47;
  unsigned int v48;
  id v49;
  double v50;
  double v51;
  double v52;
  CIImage *v53;
  double v54;
  double v55;
  float v56;
  CGFloat r2;
  float32x2_t r2a;
  CGFloat v59;
  float64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  float v66;
  float64_t v67;
  double v68;
  double v69;
  _QWORD v70[5];
  float v71;
  double v72;
  float32x2_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  float v79;
  unsigned int v80;
  unsigned int v81;
  _QWORD v82[4];
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v82[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return self->inputTargetImage;
  -[CIImage extent](inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIImage extent](self->inputTargetImage, "extent");
  v65 = v12;
  v59 = v13;
  r2 = v14;
  v16 = v15;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v56 = fminf(fmaxf(v19, 0.0), 1.0);
  v20 = __sincosf_stret(v18);
  v54 = fabs(v20.__cosval);
  v55 = fabs(v20.__sinval);
  v21 = v18 / 1.57079633;
  v22 = vcvtms_s32_f32(v21);
  v83.origin.x = v5;
  v63 = v9;
  v64 = v7;
  v83.origin.y = v7;
  v83.size.width = v9;
  v62 = v11;
  v83.size.height = v11;
  v85.origin.x = v65;
  v85.origin.y = v59;
  v85.size.width = r2;
  v85.size.height = v16;
  v84 = CGRectUnion(v83, v85);
  *(float *)&v84.origin.y = fmin(v84.size.width, 16384.0);
  v66 = *(float *)&v84.origin.y;
  v23 = fmin(v84.size.height, 16384.0);
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v25 = fmax(v24, 2.0);
  -[NSNumber floatValue](self->inputBarOffset, "floatValue");
  v27 = v26;
  v28 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -(v20.__sinval * v26), v20.__cosval * v26);
  -[CIVector X](v28, "X");
  v60 = v29;
  -[CIVector Y](v28, "Y");
  v30.f64[0] = v60;
  v30.f64[1] = v31;
  v32 = vcvt_f32_f64(v30);
  if (v22 == 3)
  {
    v36 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v54 / v25, -v55 / v25, v55 * v23 / v25);
    *(float *)&v37 = v54;
    cosval = v55;
    *(float *)&v39 = v23;
    v40 = v5;
    v33 = v56;
    v35 = v66;
  }
  else if (v22 == 2)
  {
    v36 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", -v54 / v25, -v55 / v25, v54 * v66 / v25 + v55 * v23 / v25);
    *(float *)&v37 = v55;
    cosval = v54;
    *(float *)&v39 = v66;
    v35 = v23;
    v40 = v5;
    v33 = v56;
  }
  else
  {
    v33 = v56;
    if (v22 == 1)
    {
      v34 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", -v54 / v25, v55 / v25, v54 * v66 / v25);
      v35 = v66;
      v36 = v34;
      *(float *)&v37 = v54;
      cosval = v55;
      *(float *)&v39 = v23;
      v40 = v5;
    }
    else
    {
      v36 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v54 / v25, v55 / v25, 0.0);
      *(float *)&v39 = v66;
      *(float *)&v37 = v20.__sinval;
      v35 = v23;
      v40 = v5;
      cosval = v20.__cosval;
    }
  }
  *((float *)&v37 + 1) = cosval;
  *((float *)&v39 + 1) = v35;
  v61 = v39;
  v69 = v37;
  v42 = maximum_time(v39, v37, v25, v27);
  -[CIVector X](v36, "X");
  v67 = v43;
  -[CIVector Y](v36, "Y");
  v44.f64[0] = v67;
  v44.f64[1] = v45;
  r2a = vcvt_f32_f64(v44);
  -[CIVector Z](v36, "Z");
  v47 = v46;
  *(float *)&v48 = v33 * v42;
  v49 = -[CIBarsSwipeTransition _kernel](self, "_kernel");
  v50 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v68 = *MEMORY[0x1E0C9D5E0];
  v52 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v51 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __36__CIBarsSwipeTransition_outputImage__block_invoke;
  v70[3] = &__block_descriptor_116_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v71 = v47;
  v70[4] = r2a;
  v72 = v69;
  v73 = v32;
  v79 = v25;
  v80 = v48;
  v74 = v61;
  v75 = v40;
  v76 = v64;
  v77 = v63;
  v78 = v62;
  v81 = v22;
  v53 = self->inputImage;
  v82[0] = v36;
  v82[1] = v28;
  v82[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v61), v48)));
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "applyWithExtent:roiCallback:inputImage:arguments:", v70, v53, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3), v68, v50, v52, v51), "imageByCompositingOverImage:", self->inputTargetImage), "imageByCroppingToRect:", v40, v64, v63, v62);
}

double __36__CIBarsSwipeTransition_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float32x2_t v9;
  float v10;
  float32x2_t v11;
  float32_t v12;
  float v13;
  float v14;
  float32x2_t v15;
  unsigned int v16;
  float32x2_t v17;
  float v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  float32x2_t v22;
  float v23;
  float32x2_t v24;
  float v25;
  CGFloat height;
  float v27;
  int v28;
  int v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  int v33;
  float v34;
  double v35;
  unsigned int v36;
  float32x2_t v37;
  float v38;
  float32x2_t v39;
  unsigned int v40;
  float32x2_t v41;
  float v42;
  float32x2_t v43;
  double v44;
  float32x2_t v45;
  float v46;
  float32x2_t v47;
  float32x2_t v48;
  float v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  float64_t v54;
  float64_t v55;
  double v56;
  float v57;
  double v58;
  float64x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float64_t v62;
  CGFloat v63;
  CGFloat v64;
  float64x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float64_t v68;
  CGFloat v69;
  CGFloat v70;
  float64x2_t v71;
  float v72;
  CGFloat v73;
  float64_t v74;
  CGFloat v75;
  float64x2_t v76;
  float v77;
  CGFloat v78;
  CGFloat v79;
  double result;
  float v81;
  double MaxY;
  double MinY;
  double MinX;
  double MaxX;
  float v86[6];
  float v87;
  float32x2_t v88;
  double v89;
  __int128 v90;
  float64_t r1;
  CGFloat r1a;
  CGFloat width;
  float64_t x;
  CGFloat y;
  __int32 v96;
  __int32 v97;
  unsigned int v98;
  double v99;
  __int32 v100;
  double v101;
  float v102;
  float32x2_t v103;
  float v104;
  __int32 v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;

  v9 = *(float32x2_t *)(a1 + 56);
  *(_QWORD *)v86 = *(_QWORD *)(a1 + 48);
  v10 = *(float *)(a1 + 108);
  v102 = *(float *)(a1 + 104);
  v103 = *(float32x2_t *)(a1 + 64);
  v11.f32[0] = a2;
  v96 = v11.i32[0];
  v12 = a3;
  v100 = LODWORD(v12);
  v11.f32[1] = v12;
  v90 = *(_OWORD *)(a1 + 32);
  v13 = COERCE_FLOAT(*(_QWORD *)(a1 + 40));
  v14 = fmax((float)(v10 - fabsf(floorf(*((float *)&v90 + 2) + vaddv_f32(vmul_f32(v11, *(float32x2_t *)&v90))))), 0.0);
  v15 = vadd_f32(v11, vmul_n_f32(v9, v14 * v14));
  v141.origin.x = v15.f32[0];
  v141.origin.y = v15.f32[1];
  v141.size.width = 0.0;
  v141.size.height = 0.0;
  v110 = CGRectUnion(*MEMORY[0x1E0C9D628], v141);
  *(float *)&v16 = a3 + a5;
  v98 = v16;
  v17 = (float32x2_t)__PAIR64__(v16, v96);
  v18 = fmax((float)(v10 - fabsf(floorf(v13 + vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v16, v96), *(float32x2_t *)&v90))))), 0.0);
  v19 = vadd_f32(v17, vmul_n_f32(v9, v18 * v18));
  v142.origin.x = v19.f32[0];
  v142.origin.y = v19.f32[1];
  v142.size.width = 0.0;
  v142.size.height = 0.0;
  v111 = CGRectUnion(v110, v142);
  v20.f32[0] = a2 + a4;
  v97 = v20.i32[0];
  v20.i32[1] = v100;
  v21 = fmax((float)(v10 - fabsf(floorf(v13 + vaddv_f32(vmul_f32(v20, *(float32x2_t *)&v90))))), 0.0);
  v22 = vadd_f32(v20, vmul_n_f32(v9, v21 * v21));
  v143.origin.x = v22.f32[0];
  v143.origin.y = v22.f32[1];
  v143.size.width = 0.0;
  v143.size.height = 0.0;
  v112 = CGRectUnion(v111, v143);
  v87 = v13;
  v23 = fmax((float)(v10 - fabsf(floorf(v13 + vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(v98, v97), *(float32x2_t *)&v90))))), 0.0);
  v24 = vadd_f32((float32x2_t)__PAIR64__(v98, v97), vmul_n_f32(v9, v23 * v23));
  v144.origin.x = v24.f32[0];
  v144.origin.y = v24.f32[1];
  v144.size.width = 0.0;
  v144.size.height = 0.0;
  v113 = CGRectUnion(v112, v144);
  v25 = v102;
  width = v113.size.width;
  x = v113.origin.x;
  r1 = v113.origin.y;
  height = v113.size.height;
  v27 = v86[1];
  v28 = vcvtps_s32_f32(vmlas_n_f32(vmuls_lane_f32(v86[0], v103, 1), v86[1], v103.f32[0]) / v102);
  if (v28 >= 1024)
    v28 = 1024;
  if ((v28 & 0x80000000) == 0)
  {
    v29 = 0;
    v30 = vmul_f32(v9, v9);
    v30.i32[0] = vadd_f32(v30, (float32x2_t)vdup_lane_s32((int32x2_t)v30, 1)).u32[0];
    v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
    v32 = vmul_n_f32(vneg_f32(v9), vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31))).f32[0]);
    v101 = fabsf(v32.f32[1]);
    v89 = fabsf(v32.f32[0]);
    v81 = v103.f32[1] / v86[1];
    v99 = (float)(v32.f32[1] / v32.f32[0]);
    v33 = v28 + 1;
    v88 = v9;
    do
    {
      v34 = v25 * (float)v29;
      if (v101 >= 0.00001)
      {
        if (v89 >= 0.00001)
        {
          v56 = (float)((float)-(float)(v34 * v27) / v86[0]);
          if ((float)-v86[1] * v56 >= (float)-v86[1] * (float)((float)((float)(v86[0] * v34) / v27) - v81))
            v56 = (float)((float)((float)(v86[0] * v34) / v27) - v81);
          v57 = (float)((float)(v86[0] * v102) * (float)v29) - v56 * v86[1];
          v124.origin.x = a2;
          v124.origin.y = a3;
          v124.size.width = a4;
          v124.size.height = a5;
          v58 = v57;
          MaxY = CGRectGetMaxY(v124);
          v106 = (MaxY - v58) / v99;
          v125.origin.x = a2;
          v125.origin.y = a3;
          v125.size.width = a4;
          v125.size.height = a5;
          if (v106 >= CGRectGetMinX(v125))
          {
            v126.origin.x = a2;
            v126.origin.y = a3;
            v126.size.width = a4;
            v126.size.height = a5;
            if (v106 <= CGRectGetMaxX(v126))
            {
              v59.f64[0] = (MaxY - v58) / v99;
              v59.f64[1] = MaxY;
              v60 = vcvt_f32_f64(v59);
              *(float *)v59.f64 = fmax((float)(v10 - fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, v60))))), 0.0);
              v61 = vadd_f32(vmul_n_f32(v88, *(float *)v59.f64 * *(float *)v59.f64), v60);
              v147.origin.x = v61.f32[0];
              v147.origin.y = v61.f32[1];
              v147.size.width = 0.0;
              v147.size.height = 0.0;
              v63 = width;
              v62 = x;
              v59.f64[0] = r1;
              v64 = height;
              v127 = CGRectUnion(*(CGRect *)((char *)&v59 - 8), v147);
              width = v127.size.width;
              x = v127.origin.x;
              r1 = v127.origin.y;
              height = v127.size.height;
            }
          }
          v128.origin.x = a2;
          v128.origin.y = a3;
          v128.size.width = a4;
          v128.size.height = a5;
          MinY = CGRectGetMinY(v128);
          v107 = (MinY - v58) / v99;
          v129.origin.x = a2;
          v129.origin.y = a3;
          v129.size.width = a4;
          v129.size.height = a5;
          if (v107 >= CGRectGetMinX(v129))
          {
            v130.origin.x = a2;
            v130.origin.y = a3;
            v130.size.width = a4;
            v130.size.height = a5;
            if (v107 <= CGRectGetMaxX(v130))
            {
              v65.f64[0] = (MinY - v58) / v99;
              v65.f64[1] = MinY;
              v66 = vcvt_f32_f64(v65);
              *(float *)v65.f64 = fmax((float)(v10 - fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, v66))))), 0.0);
              v67 = vadd_f32(vmul_n_f32(v88, *(float *)v65.f64 * *(float *)v65.f64), v66);
              v148.origin.x = v67.f32[0];
              v148.origin.y = v67.f32[1];
              v148.size.width = 0.0;
              v148.size.height = 0.0;
              v69 = width;
              v68 = x;
              v65.f64[0] = r1;
              v70 = height;
              v131 = CGRectUnion(*(CGRect *)((char *)&v65 - 8), v148);
              width = v131.size.width;
              x = v131.origin.x;
              r1 = v131.origin.y;
              height = v131.size.height;
            }
          }
          v132.origin.x = a2;
          v132.origin.y = a3;
          v132.size.width = a4;
          v132.size.height = a5;
          MinX = CGRectGetMinX(v132);
          v108 = v58 + v99 * MinX;
          v133.origin.x = a2;
          v133.origin.y = a3;
          v133.size.width = a4;
          v133.size.height = a5;
          if (v108 >= CGRectGetMinY(v133))
          {
            v134.origin.x = a2;
            v134.origin.y = a3;
            v134.size.width = a4;
            v134.size.height = a5;
            if (v108 <= CGRectGetMaxY(v134))
            {
              v71.f64[0] = MinX;
              v71.f64[1] = v58 + v99 * MinX;
              *(float32x2_t *)&v71.f64[0] = vcvt_f32_f64(v71);
              v72 = fmax((float)(v10- fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, *(float32x2_t *)&v71.f64[0]))))), 0.0);
              *(float32x2_t *)&v71.f64[0] = vadd_f32(vmul_n_f32(v88, v72 * v72), *(float32x2_t *)&v71.f64[0]);
              v149.origin.x = *(float *)v71.f64;
              v149.origin.y = *((float *)v71.f64 + 1);
              v149.size.width = 0.0;
              v149.size.height = 0.0;
              v73 = width;
              v71.f64[0] = x;
              v74 = r1;
              v75 = height;
              v135 = CGRectUnion(*(CGRect *)v71.f64, v149);
              width = v135.size.width;
              x = v135.origin.x;
              r1 = v135.origin.y;
              height = v135.size.height;
            }
          }
          v136.origin.x = a2;
          v136.origin.y = a3;
          v136.size.width = a4;
          v136.size.height = a5;
          MaxX = CGRectGetMaxX(v136);
          v109 = v58 + v99 * MaxX;
          v137.origin.x = a2;
          v137.origin.y = a3;
          v137.size.width = a4;
          v137.size.height = a5;
          if (v109 < CGRectGetMinY(v137))
            goto LABEL_29;
          v138.origin.x = a2;
          v138.origin.y = a3;
          v138.size.width = a4;
          v138.size.height = a5;
          if (v109 > CGRectGetMaxY(v138))
            goto LABEL_29;
          v76.f64[0] = MaxX;
          v76.f64[1] = v58 + v99 * MaxX;
          *(float32x2_t *)&v76.f64[0] = vcvt_f32_f64(v76);
          v77 = fmax((float)(v10- fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, *(float32x2_t *)&v76.f64[0]))))), 0.0);
          *(float32x2_t *)&v76.f64[0] = vadd_f32(vmul_n_f32(v88, v77 * v77), *(float32x2_t *)&v76.f64[0]);
          v50 = *(float *)v76.f64;
          v51 = *((float *)v76.f64 + 1);
          v52 = 0;
          v53 = 0;
          v54 = x;
          v55 = r1;
          goto LABEL_28;
        }
        *(float *)&v105 = v25 * (float)v29;
        v44 = v34;
        v119.origin.x = a2;
        v119.origin.y = a3;
        v119.size.width = a4;
        v119.size.height = a5;
        if (CGRectGetMinY(v119) > v44)
          goto LABEL_29;
        v120.origin.x = a2;
        v120.origin.y = a3;
        v120.size.width = a4;
        v120.size.height = a5;
        if (CGRectGetMaxY(v120) < v44)
          goto LABEL_29;
        v121.origin.x = a2;
        v121.origin.y = a3;
        v121.size.width = a4;
        v121.size.height = a5;
        v45.f32[0] = CGRectGetMinX(v121);
        v45.i32[1] = v105;
        v46 = fmax((float)(v10 - fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, v45))))), 0.0);
        v47 = vadd_f32(v45, vmul_n_f32(v88, v46 * v46));
        v146.origin.x = v47.f32[0];
        v146.origin.y = v47.f32[1];
        v146.size.width = 0.0;
        v146.size.height = 0.0;
        v122.size.width = width;
        v122.origin.x = x;
        v122.origin.y = r1;
        v122.size.height = height;
        v123 = CGRectUnion(v122, v146);
        r1a = v123.origin.x;
        width = v123.size.width;
        y = v123.origin.y;
        height = v123.size.height;
        v123.origin.x = a2;
        v123.origin.y = a3;
        v123.size.width = a4;
        v123.size.height = a5;
        v48.f32[0] = CGRectGetMaxX(v123);
        v48.i32[1] = v105;
        v27 = v86[1];
        v49 = fmax((float)(v10 - fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, v48))))), 0.0);
        v43 = vadd_f32(v48, vmul_n_f32(v88, v49 * v49));
      }
      else
      {
        v35 = v34;
        v114.origin.x = a2;
        v114.origin.y = a3;
        v114.size.width = a4;
        v104 = v25 * (float)v29;
        v114.size.height = a5;
        if (CGRectGetMinX(v114) > v35)
          goto LABEL_29;
        v115.origin.x = a2;
        v115.origin.y = a3;
        v115.size.width = a4;
        v115.size.height = a5;
        if (CGRectGetMaxX(v115) < v35)
          goto LABEL_29;
        v116.origin.x = a2;
        v116.origin.y = a3;
        v116.size.width = a4;
        v116.size.height = a5;
        *(float *)&v36 = CGRectGetMaxY(v116);
        v37 = (float32x2_t)__PAIR64__(v36, LODWORD(v104));
        v38 = fmax((float)(v10- fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, (float32x2_t)__PAIR64__(v36, LODWORD(v104))))))), 0.0);
        v39 = vadd_f32(v37, vmul_n_f32(v88, v38 * v38));
        v145.origin.x = v39.f32[0];
        v145.origin.y = v39.f32[1];
        v145.size.width = 0.0;
        v145.size.height = 0.0;
        v117.size.width = width;
        v117.origin.x = x;
        v117.origin.y = r1;
        v117.size.height = height;
        v118 = CGRectUnion(v117, v145);
        r1a = v118.origin.x;
        width = v118.size.width;
        y = v118.origin.y;
        height = v118.size.height;
        v118.origin.x = a2;
        v118.origin.y = a3;
        v118.size.width = a4;
        v118.size.height = a5;
        *(float *)&v40 = CGRectGetMinY(v118);
        v41 = (float32x2_t)__PAIR64__(v40, LODWORD(v104));
        v27 = v86[1];
        v42 = fmax((float)(v10- fabsf(floorf(v87 + vaddv_f32(vmul_f32(*(float32x2_t *)&v90, (float32x2_t)__PAIR64__(v40, LODWORD(v104))))))), 0.0);
        v43 = vadd_f32(v41, vmul_n_f32(v88, v42 * v42));
      }
      v50 = v43.f32[0];
      v51 = v43.f32[1];
      v52 = 0;
      v53 = 0;
      v54 = r1a;
      v55 = y;
LABEL_28:
      v78 = width;
      v79 = height;
      v139 = CGRectUnion(*(CGRect *)&v54, *(CGRect *)&v50);
      width = v139.size.width;
      x = v139.origin.x;
      r1 = v139.origin.y;
      height = v139.size.height;
LABEL_29:
      v25 = v102;
      ++v29;
    }
    while (v33 != v29);
  }
  v140.size.width = width;
  v140.origin.x = x;
  v140.origin.y = r1;
  v140.size.height = height;
  v150.origin.x = a2;
  v150.origin.y = a3;
  v150.size.width = a4;
  v150.size.height = a5;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v140, v150);
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

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputBarOffset
{
  return self->inputBarOffset;
}

- (void)setInputBarOffset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
