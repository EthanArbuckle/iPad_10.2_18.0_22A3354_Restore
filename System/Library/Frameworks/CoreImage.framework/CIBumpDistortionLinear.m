@implementation CIBumpDistortionLinear

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
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
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.5");
  v12[3] = CFSTR("inputCenter");
  v10[0] = CFSTR("CIAttributeTypePosition");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeDefault");
  v10[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18D60;
  v8[1] = &unk_1E2F18D60;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F18D70;
  v8[3] = &unk_1E2F18D80;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F18D60;
  v8[5] = CFSTR("CIAttributeTypeDistance");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputScale");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18D90;
  v6[1] = &unk_1E2F18D60;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18DA0;
  v6[3] = &unk_1E2F18DB0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18DA0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[6] = CFSTR("inputAngle");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F18D60;
  v4[1] = &unk_1E2F18DC0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F18D60;
  v4[3] = CFSTR("CIAttributeTypeAngle");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_bumpDistortionLinear);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  double v15;
  __float2 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  CIVector *v23;
  CIVector *v24;
  double v25;
  float64x2_t v26;
  float64_t v27;
  float32x2_t v28;
  id v29;
  CIImage *inputImage;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned int v35;
  float64_t v36;
  unsigned int v37;
  unint64_t v38;
  _QWORD v39[5];
  float v40;
  float32x2_t v41;
  float v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v6 = fmaxf(v5, 0.0);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v8 = v7;
  if (fabsf(v6) < 0.001 || fabsf(v7 + -1.0) < 0.001)
    return self->inputImage;
  -[CIVector X](self->inputCenter, "X");
  v11 = v10;
  -[CIVector Y](self->inputCenter, "Y");
  v13 = v12;
  -[CIVector X](self->inputCenter, "X");
  v15 = v14;
  v16 = __sincosf_stret(v4);
  *(float *)&v15 = v15 + v16.__cosval * 10.0;
  -[CIVector Y](self->inputCenter, "Y");
  *(float *)&v17 = v17 + v16.__sinval * 10.0;
  v18 = (float)(*(float *)&v15 - v11);
  v19 = (float)(*(float *)&v17 - v13);
  v20 = 1.0 / sqrt(v19 * v19 + v18 * v18);
  v21 = 1.0 / v6;
  *(float *)&v19 = v21 * -(v19 * v20);
  *(float *)&v18 = v21 * (v20 * v18);
  v35 = LODWORD(v18);
  v37 = LODWORD(v19);
  v22 = v21 * (v20 * (float)((float)(v11 * *(float *)&v17) - (float)(v13 * *(float *)&v15)));
  v23 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *(float *)&v19, *(float *)&v18, v22, 0.0);
  v24 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)-(float)(v16.__sinval * v6), (float)(v16.__cosval * v6), v8 + -1.0, 0.0);
  v38 = __PAIR64__(v35, v37);
  -[CIVector X](v24, "X");
  v36 = v25;
  -[CIVector Y](v24, "Y");
  v26.f64[0] = v36;
  v26.f64[1] = v27;
  v28 = vcvt_f32_f64(v26);
  v29 = -[CIBumpDistortionLinear _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __37__CIBumpDistortionLinear_outputImage__block_invoke;
  v39[3] = &__block_descriptor_60_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v40 = v22;
  v39[4] = v38;
  v41 = v28;
  v42 = v8;
  inputImage = self->inputImage;
  v43[0] = v23;
  v43[1] = v24;
  return (id)objc_msgSend(v29, "applyWithExtent:roiCallback:inputImage:arguments:", v39, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2), v31, v32, v33, v34);
}

uint64_t __37__CIBumpDistortionLinear_outputImage__block_invoke(uint64_t result, double a2, double a3, double a4, double a5)
{
  float32x4_t v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  BOOL v17;
  float32x2_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float32x2_t v29;
  float v30;
  float32x4_t v35;
  float32x4_t v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  double v42;
  double v43;
  float32x2_t v44;
  int v45;
  float v46;
  float32x4_t v47;
  float32x2_t v48;
  double v49;
  float32_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float32x2_t v57;
  float v58;
  float v59;
  float32x2_t v60;
  float32x4_t v61;
  float32_t v62;
  float32x4_t v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  int v72;
  float v73;
  double v74;
  float32x2_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float32x2_t v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float32x2_t v94;
  float32x2_t v95;
  float32x2_t v96;
  int v97;
  float v98;
  float32x4_t v99;
  double v100;
  float32_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float32x2_t v108;
  float v109;
  float v110;
  float32x2_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float32x2_t v120;
  float32x2_t v121;
  float32x2_t v122;
  int v123;
  float v124;
  double v125;
  float32x2_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float32x2_t v135;

  v5 = *(float32x4_t *)(result + 32);
  v6 = COERCE_FLOAT(HIDWORD(*(_QWORD *)(result + 32)));
  v7 = COERCE_FLOAT(*(_QWORD *)(result + 40));
  v8 = a3 * v6 + v5.f32[0] * a2 + v7;
  v9 = a3 * v6 + v5.f32[0] * (a2 + a4) + v7;
  v10 = (a3 + a5) * v6;
  v11 = v10 + v5.f32[0] * a2 + v7;
  v12 = v10 + v5.f32[0] * (a2 + a4) + v7;
  if (v8 > -1.0 || v9 > -1.0 || v11 > -1.0 || v12 > -1.0)
  {
    _NF = v8 < 1.0 || v9 < 1.0;
    v17 = _NF || v11 < 1.0;
    if (v17 || v12 < 1.0)
    {
      v19 = *(float32x2_t *)(result + 48);
      v20 = *(float *)(result + 56) + -1.0;
      if (v8 <= 1.0)
        v21 = v8;
      else
        v21 = 1.0;
      if (v8 >= -1.0)
        v22 = v21;
      else
        v22 = -1.0;
      if (v9 <= 1.0)
        v23 = v9;
      else
        v23 = 1.0;
      if (v9 >= -1.0)
        v24 = v23;
      else
        v24 = -1.0;
      if (v11 <= 1.0)
        v25 = v11;
      else
        v25 = 1.0;
      if (v11 >= -1.0)
        v26 = v25;
      else
        v26 = -1.0;
      if (v12 <= 1.0)
        v27 = v12;
      else
        v27 = 1.0;
      if (v12 >= -1.0)
        v28 = v27;
      else
        v28 = -1.0;
      v29.f32[0] = a2;
      v30 = a3;
      __asm { FMOV            V7.4S, #1.0 }
      v35.i64[1] = _Q7.i64[1];
      v35.i64[0] = __PAIR64__(LODWORD(v30), v29.u32[0]);
      v36 = vmulq_f32(v35, v5);
      LODWORD(v37) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u32[0];
      v38 = 1.0 - fabsf(v37);
      if (v38 <= 1.0)
        v39 = v38;
      else
        v39 = 1.0;
      v40 = 0.0;
      if (v38 >= 0.0)
        v41 = v39;
      else
        v41 = 0.0;
      v42 = (v41 * -2.0 + 3.0) * v41 * v41;
      v43 = v20;
      *(float *)&v42 = v42 * v20 + 1.0;
      *(float *)&v42 = (*(float *)&v42 + -1.0) * v37;
      v44 = vadd_f32((float32x2_t)__PAIR64__(LODWORD(v30), v29.u32[0]), vmul_n_f32(v19, *(float *)&v42));
      if ((float)(v22 * v26) == 1.0)
      {
        v48 = v44;
      }
      else
      {
        v45 = 9;
        v46 = 0.1;
        v47 = _Q7;
        v48 = v44;
        do
        {
          v49 = v46;
          v50 = a3 + a5 * v49;
          v47.f32[0] = a2;
          v51 = v47;
          v51.f32[1] = v50;
          v52 = vmulq_f32(v5, v51);
          LODWORD(v53) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2), vaddq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v52.f32, 1))).u32[0];
          v54 = 1.0 - fabsf(v53);
          if (v54 <= 1.0)
            v55 = v54;
          else
            v55 = 1.0;
          if (v54 >= 0.0)
            v56 = v55;
          else
            v56 = 0.0;
          v57.f32[0] = a2;
          v58 = (v56 * -2.0 + 3.0) * v56 * v56 * v43 + 1.0;
          v57.f32[1] = a3 + a5 * v49;
          v59 = (v58 + -1.0) * v53;
          v60 = vadd_f32(v57, vmul_n_f32(v19, v59));
          v44 = vminnm_f32(v44, v60);
          v48 = vmaxnm_f32(v48, v60);
          v46 = v49 + 0.1;
          --v45;
        }
        while (v45);
      }
      v61.i64[1] = _Q7.i64[1];
      v61.f32[0] = a2;
      v62 = a3 + a5;
      v29.f32[1] = v62;
      v61.f32[1] = v62;
      v63 = vmulq_f32(v61, v5);
      LODWORD(v64) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2), vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).u32[0];
      v65 = 1.0 - fabsf(v64);
      if (v65 <= 1.0)
        v66 = v65;
      else
        v66 = 1.0;
      if (v65 >= 0.0)
        v40 = v66;
      v67 = (v40 * -2.0 + 3.0) * v40 * v40 * v43 + 1.0;
      v68 = (v67 + -1.0) * v64;
      v69 = vadd_f32(v29, vmul_n_f32(v19, v68));
      v70 = vminnm_f32(v44, v69);
      v71 = vmaxnm_f32(v48, v69);
      if ((float)(v26 * v28) != 1.0)
      {
        v72 = 9;
        v73 = 0.1;
        do
        {
          v74 = v73;
          v75.f32[0] = a2 + a4 * v74;
          v76.i64[1] = _Q7.i64[1];
          v76.i32[0] = v75.i32[0];
          v76.f32[1] = a3 + a5;
          v77 = vmulq_f32(v5, v76);
          LODWORD(v78) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).u32[0];
          v79 = 1.0 - fabsf(v78);
          if (v79 <= 1.0)
            v80 = v79;
          else
            v80 = 1.0;
          if (v79 >= 0.0)
            v81 = v80;
          else
            v81 = 0.0;
          v82 = (v81 * -2.0 + 3.0) * v81 * v81 * v43 + 1.0;
          v75.f32[1] = a3 + a5;
          v83 = (v82 + -1.0) * v78;
          v84 = vadd_f32(v75, vmul_n_f32(v19, v83));
          v70 = vminnm_f32(v70, v84);
          v71 = vmaxnm_f32(v71, v84);
          v73 = v74 + 0.1;
          --v72;
        }
        while (v72);
      }
      v85.f32[0] = a2 + a4;
      v86.i32[0] = v85.i32[0];
      v87.i64[1] = _Q7.i64[1];
      v87.i32[0] = v85.i32[0];
      v87.f32[1] = a3 + a5;
      v88 = vmulq_f32(v87, v5);
      LODWORD(v89) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2), vaddq_f32(v88, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v88.f32, 1))).u32[0];
      v90 = 1.0 - fabsf(v89);
      if (v90 <= 1.0)
        v91 = v90;
      else
        v91 = 1.0;
      if (v90 < 0.0)
        v91 = 0.0;
      v92 = (v91 * -2.0 + 3.0) * v91 * v91 * v43 + 1.0;
      v93 = (v92 + -1.0) * v89;
      v86.f32[1] = a3 + a5;
      v94 = vadd_f32(v86, vmul_n_f32(v19, v93));
      v95 = vminnm_f32(v70, v94);
      v96 = vmaxnm_f32(v71, v94);
      if ((float)(v28 * v24) != 1.0)
      {
        v97 = 9;
        v98 = 0.1;
        v99 = _Q7;
        do
        {
          v100 = v98;
          v101 = a3 + a5 * v100;
          v99.f32[0] = a2 + a4;
          v102 = v99;
          v102.f32[1] = v101;
          v103 = vmulq_f32(v5, v102);
          LODWORD(v104) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v103, 2), vaddq_f32(v103, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v103.f32, 1))).u32[0];
          v105 = 1.0 - fabsf(v104);
          if (v105 <= 1.0)
            v106 = v105;
          else
            v106 = 1.0;
          if (v105 >= 0.0)
            v107 = v106;
          else
            v107 = 0.0;
          v108.f32[0] = a2 + a4;
          v109 = (v107 * -2.0 + 3.0) * v107 * v107 * v43 + 1.0;
          v108.f32[1] = a3 + a5 * v100;
          v110 = (v109 + -1.0) * v104;
          v111 = vadd_f32(v108, vmul_n_f32(v19, v110));
          v95 = vminnm_f32(v95, v111);
          v96 = vmaxnm_f32(v96, v111);
          v98 = v100 + 0.1;
          --v97;
        }
        while (v97);
      }
      v112.i64[1] = _Q7.i64[1];
      v112.f32[0] = a2 + a4;
      v85.f32[1] = v30;
      v112.f32[1] = v30;
      v113 = vmulq_f32(v112, v5);
      LODWORD(v114) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v113, 2), vaddq_f32(v113, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v113.f32, 1))).u32[0];
      v115 = 1.0 - fabsf(v114);
      if (v115 <= 1.0)
        v116 = v115;
      else
        v116 = 1.0;
      if (v115 >= 0.0)
        v117 = v116;
      else
        v117 = 0.0;
      v118 = (v117 * -2.0 + 3.0) * v117 * v117 * v43 + 1.0;
      v119 = (v118 + -1.0) * v114;
      v120 = vadd_f32(v85, vmul_n_f32(v19, v119));
      v121 = vminnm_f32(v95, v120);
      v122 = vmaxnm_f32(v96, v120);
      if ((float)(v24 * v22) != 1.0)
      {
        v123 = 9;
        v124 = 0.1;
        do
        {
          v125 = v124;
          v126.f32[0] = a2 + a4 * v125;
          v127.i64[1] = _Q7.i64[1];
          v127.i64[0] = __PAIR64__(LODWORD(v30), v126.u32[0]);
          v128 = vmulq_f32(v5, v127);
          LODWORD(v129) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v128, 2), vaddq_f32(v128, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v128.f32, 1))).u32[0];
          v130 = 1.0 - fabsf(v129);
          if (v130 <= 1.0)
            v131 = v130;
          else
            v131 = 1.0;
          if (v130 >= 0.0)
            v132 = v131;
          else
            v132 = 0.0;
          v133 = (v132 * -2.0 + 3.0) * v132 * v132 * v43 + 1.0;
          v126.f32[1] = v30;
          v134 = (v133 + -1.0) * v129;
          v135 = vadd_f32(v126, vmul_n_f32(v19, v134));
          v121 = vminnm_f32(v121, v135);
          v122 = vmaxnm_f32(v122, v135);
          v124 = v125 + 0.1;
          --v123;
        }
        while (v123);
      }
    }
  }
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

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
