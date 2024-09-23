@implementation CILightTunnel

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[2];
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
  v11[1] = CFSTR("6");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.10");
  v10[3] = CFSTR("inputCenter");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypePosition");
  v8[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputRotation");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F1A120;
  v6[1] = &unk_1E2F1A130;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeIdentity");
  v6[2] = &unk_1E2F1A120;
  v6[3] = &unk_1E2F1A120;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeAngle");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[5] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1A140;
  v4[1] = &unk_1E2F1A150;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1A160;
  v4[3] = &unk_1E2F1A120;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_lighttunnel);
}

- (id)outputImage
{
  id v3;
  float v4;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIVector *v11;
  double v12;
  float64x2_t v13;
  float64_t v14;
  double v15;
  float64x2_t v16;
  float64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CIImage *inputImage;
  float64_t v29;
  float64_t v30;
  int32x2_t v31;
  float32x4_t v32;
  _QWORD v33[4];
  float32x4_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CILightTunnel _kernel](self, "_kernel");
  -[NSNumber floatValue](self->inputRotation, "floatValue");
  v5 = v4 / 6.28318531;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v7 = v6;
  -[CIVector X](self->inputCenter, "X");
  v9 = v8;
  -[CIVector Y](self->inputCenter, "Y");
  v11 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v9, v10, v7, v5);
  -[CIVector X](v11, "X");
  v30 = v12;
  -[CIVector Y](v11, "Y");
  v13.f64[0] = v30;
  v13.f64[1] = v14;
  v31 = (int32x2_t)vcvt_f32_f64(v13);
  -[CIVector Z](v11, "Z");
  v29 = v15;
  -[CIVector W](v11, "W");
  v16.f64[0] = v29;
  v16.f64[1] = v17;
  v32 = vcvt_hight_f32_f64(v31, v16);
  -[CIVector X](self->inputCenter, "X");
  v19 = v18 - v7;
  -[CIVector Y](self->inputCenter, "Y");
  v21 = v20 - v7;
  v22 = v7 + v7;
  v23 = *MEMORY[0x1E0C9D5E0];
  v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __28__CILightTunnel_outputImage__block_invoke;
  v33[3] = &__block_descriptor_80_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v35 = v19;
  v36 = v21;
  v37 = v22;
  v38 = v22;
  v34 = v32;
  inputImage = self->inputImage;
  v39[0] = v11;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:inputImage:arguments:", v33, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1), v23, v24, v25, v26);
}

double __28__CILightTunnel_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v7;
  int32x4_t v8;
  float v9;
  float v10;
  float v11;
  float32x2_t v12;
  int32x2_t v13;
  float v14;
  float32x2_t v15;
  int32x2_t v16;
  int8x8_t v17;
  char v18;
  float v19;
  float32x2_t v20;
  float32x2_t v21;
  float v22;
  CGFloat v23;
  float32x2_t v24;
  int32x2_t v25;
  CGFloat v26;
  CGFloat v27;
  float32x2_t v28;
  float v29;
  __float2 v30;
  float32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  float32x2_t v34;
  float v35;
  float32x2_t v36;
  CGFloat width;
  CGFloat height;
  float32x2_t v39;
  float v40;
  __float2 v41;
  float32x2_t v42;
  int32x2_t v43;
  int32x2_t v44;
  float32x2_t v45;
  float v46;
  float32x2_t v47;
  CGFloat v48;
  CGFloat v49;
  float32x2_t v50;
  float v51;
  __float2 v52;
  float32x2_t v53;
  int32x2_t v54;
  int32x2_t v55;
  float32x2_t v56;
  float v57;
  float32x2_t v58;
  CGFloat v59;
  CGFloat v60;
  float32x2_t v61;
  float v62;
  __float2 v63;
  float32x2_t v64;
  int32x2_t v65;
  int32x2_t v66;
  float32x2_t v67;
  float v68;
  float32x2_t v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  float32x2_t v73;
  int32x2_t v74;
  float32x2_t v75;
  float v76;
  __float2 v77;
  float32x2_t v78;
  int32x2_t v79;
  int32x2_t v80;
  float32x2_t v81;
  float v82;
  float32x2_t v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  float32x2_t v87;
  float v88;
  __float2 v89;
  float32x2_t v90;
  int32x2_t v91;
  int32x2_t v92;
  float32x2_t v93;
  float v94;
  float32x2_t v95;
  float32x2_t v96;
  int32x2_t v97;
  float32x2_t v98;
  float v99;
  __float2 v100;
  float32x2_t v101;
  int32x2_t v102;
  int32x2_t v103;
  float32x2_t v104;
  float v105;
  float32x2_t v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  float32x2_t v111;
  float v112;
  __float2 v113;
  float32x2_t v114;
  int32x2_t v115;
  int32x2_t v116;
  float32x2_t v117;
  float v118;
  float32x2_t v119;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float32x2_t v128;
  CGFloat y;
  float v130;
  CGFloat r1;
  CGFloat r1a;
  CGFloat r1b;
  float r1c;
  float r1d;
  float v138;
  float v139;
  CGFloat v140;
  float32x2_t v141;
  CGFloat x;
  CGFloat v143;
  float v144;
  CGFloat v145;
  float32x2_t v146;
  CGFloat v147;
  CGFloat v148;
  float v149;
  float32x2_t v150;
  CGFloat v151;
  CGFloat v152;
  float32x2_t v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;

  v7 = *(double *)(a1 + 48);
  v8 = *(int32x4_t *)(a1 + 32);
  v9 = COERCE_FLOAT(*(_QWORD *)(a1 + 40));
  v10 = a2;
  v11 = a3;
  v12 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10)), *(float32x2_t *)v8.i8);
  v13 = (int32x2_t)vmul_f32(v12, v12);
  v14 = a3 + a5;
  v15 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v10)), *(float32x2_t *)v8.i8);
  v16 = (int32x2_t)vmul_f32(v15, v15);
  v17 = vmvn_s8((int8x8_t)vcgt_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v16, v13), (float32x2_t)vzip2_s32(v16, v13))), (float32x2_t)vdup_laneq_s32(v8, 2)));
  v18 = v17.i8[0] & v17.i8[4];
  v19 = a2 + a4;
  v20 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v19)), *(float32x2_t *)v8.i8);
  if (sqrtf(vaddv_f32(vmul_f32(v20, v20))) > v9)
    v18 = 0;
  v21 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v19)), *(float32x2_t *)v8.i8);
  if (sqrtf(vaddv_f32(vmul_f32(v21, v21))) <= v9 && (v18 & 1) != 0)
    return a2;
  LODWORD(v22) = HIDWORD(*(_OWORD *)(a1 + 32));
  if (fabsf(*(float *)&v8.i32[3]) < 0.0001)
  {
    v121 = a3;
    v122 = a3 + a5;
    v123 = v10;
    v124 = a2 + a4;
    LODWORD(v138) = HIDWORD(*(_QWORD *)(a1 + 32));
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    r1 = *MEMORY[0x1E0C9D628];
    v24 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10)), *(float32x2_t *)v8.i8);
    v25 = (int32x2_t)vmul_f32(v24, v24);
    v25.i32[0] = vadd_f32((float32x2_t)v25, (float32x2_t)vdup_lane_s32(v25, 1)).u32[0];
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v28 = vrsqrte_f32((float32x2_t)v25.u32[0]);
    v126 = v9 * vmul_f32(v28, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v28, v28))).f32[0];
    v153 = *(float32x2_t *)(a1 + 32);
    v146 = (float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v19));
    v150 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v19));
    v141 = (float32x2_t)__PAIR64__(LODWORD(v14), LODWORD(v10));
    v128 = (float32x2_t)__PAIR64__(LODWORD(v11), LODWORD(v10));
    v29 = logf(v126);
    v30 = __sincosf_stret(v22 * v29);
    v31.f32[0] = -v30.__sinval;
    v31.i32[1] = LODWORD(v30.__cosval);
    v32 = (int32x2_t)vmul_f32(v24, (float32x2_t)__PAIR64__(LODWORD(v30.__sinval), LODWORD(v30.__cosval)));
    v33 = (int32x2_t)vmul_f32(v24, v31);
    v34 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v32, v33), (float32x2_t)vzip2_s32(v32, v33)), v126));
    v35 = 0.0;
    if (v126 <= 1.0)
      v35 = 1.0;
    v36 = vmla_n_f32(vmul_n_f32(v128, 1.0 - v35), v34, v35);
    v172.origin.x = v36.f32[0];
    v172.origin.y = v36.f32[1];
    v172.size.width = 0.0;
    v172.size.height = 0.0;
    v154.origin.x = r1;
    v154.origin.y = v23;
    v154.size.width = v27;
    v154.size.height = v26;
    v155 = CGRectUnion(v154, v172);
    r1a = v155.origin.x;
    y = v155.origin.y;
    width = v155.size.width;
    height = v155.size.height;
    v39 = vsub_f32(v141, v153);
    *(float32x2_t *)&v155.origin.x = vmul_f32(v39, v39);
    LODWORD(v155.origin.x) = vadd_f32(*(float32x2_t *)&v155.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v155.origin.x, 1)).u32[0];
    *(float32x2_t *)&v155.origin.y = vrsqrte_f32((float32x2_t)LODWORD(v155.origin.x));
    v127 = v9
         * vmul_f32(*(float32x2_t *)&v155.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v155.origin.x), vmul_f32(*(float32x2_t *)&v155.origin.y, *(float32x2_t *)&v155.origin.y))).f32[0];
    v40 = logf(v127);
    v41 = __sincosf_stret(v22 * v40);
    v42.f32[0] = -v41.__sinval;
    v42.i32[1] = LODWORD(v41.__cosval);
    v43 = (int32x2_t)vmul_f32(v39, (float32x2_t)__PAIR64__(LODWORD(v41.__sinval), LODWORD(v41.__cosval)));
    v44 = (int32x2_t)vmul_f32(v39, v42);
    v45 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v43, v44), (float32x2_t)vzip2_s32(v43, v44)), v127));
    v46 = 0.0;
    if (v127 <= 1.0)
      v46 = 1.0;
    v47 = vmla_n_f32(vmul_n_f32(v141, 1.0 - v46), v45, v46);
    v173.origin.x = v47.f32[0];
    v173.origin.y = v47.f32[1];
    v173.size.width = 0.0;
    v173.size.height = 0.0;
    v156.origin.x = r1a;
    v156.origin.y = y;
    v156.size.width = width;
    v156.size.height = height;
    v157 = CGRectUnion(v156, v173);
    x = v157.origin.x;
    r1b = v157.origin.y;
    v48 = v157.size.width;
    v49 = v157.size.height;
    v50 = vsub_f32(v146, v153);
    *(float32x2_t *)&v157.origin.x = vmul_f32(v50, v50);
    LODWORD(v157.origin.x) = vadd_f32(*(float32x2_t *)&v157.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v157.origin.x, 1)).u32[0];
    *(float32x2_t *)&v157.origin.y = vrsqrte_f32((float32x2_t)LODWORD(v157.origin.x));
    v130 = v9
         * vmul_f32(*(float32x2_t *)&v157.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v157.origin.x), vmul_f32(*(float32x2_t *)&v157.origin.y, *(float32x2_t *)&v157.origin.y))).f32[0];
    v51 = logf(v130);
    v52 = __sincosf_stret(v22 * v51);
    v53.f32[0] = -v52.__sinval;
    v53.i32[1] = LODWORD(v52.__cosval);
    v54 = (int32x2_t)vmul_f32(v50, (float32x2_t)__PAIR64__(LODWORD(v52.__sinval), LODWORD(v52.__cosval)));
    v55 = (int32x2_t)vmul_f32(v50, v53);
    v56 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v54, v55), (float32x2_t)vzip2_s32(v54, v55)), v130));
    v57 = 0.0;
    if (v130 <= 1.0)
      v57 = 1.0;
    v58 = vmla_n_f32(vmul_n_f32(v146, 1.0 - v57), v56, v57);
    v174.origin.x = v58.f32[0];
    v174.origin.y = v58.f32[1];
    v174.size.width = 0.0;
    v174.size.height = 0.0;
    v158.origin.x = x;
    v158.origin.y = r1b;
    v158.size.width = v48;
    v158.size.height = v49;
    v159 = CGRectUnion(v158, v174);
    v147 = v159.origin.x;
    v143 = v159.origin.y;
    v59 = v159.size.width;
    v60 = v159.size.height;
    v61 = vsub_f32(v150, v153);
    *(float32x2_t *)&v159.origin.x = vmul_f32(v61, v61);
    LODWORD(v159.origin.x) = vadd_f32(*(float32x2_t *)&v159.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v159.origin.x, 1)).u32[0];
    *(float32x2_t *)&v159.origin.y = vrsqrte_f32((float32x2_t)LODWORD(v159.origin.x));
    r1c = v9
        * vmul_f32(*(float32x2_t *)&v159.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v159.origin.x), vmul_f32(*(float32x2_t *)&v159.origin.y, *(float32x2_t *)&v159.origin.y))).f32[0];
    v62 = logf(r1c);
    v63 = __sincosf_stret(v22 * v62);
    v64.f32[0] = -v63.__sinval;
    v64.i32[1] = LODWORD(v63.__cosval);
    v65 = (int32x2_t)vmul_f32(v61, (float32x2_t)__PAIR64__(LODWORD(v63.__sinval), LODWORD(v63.__cosval)));
    v66 = (int32x2_t)vmul_f32(v61, v64);
    v67 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v65, v66), (float32x2_t)vzip2_s32(v65, v66)), r1c));
    v68 = 0.0;
    if (r1c <= 1.0)
      v68 = 1.0;
    v69 = vmla_n_f32(vmul_n_f32(v150, 1.0 - v68), v67, v68);
    v175.origin.x = v69.f32[0];
    v175.origin.y = v69.f32[1];
    v175.size.width = 0.0;
    v175.size.height = 0.0;
    v160.origin.x = v147;
    v160.origin.y = v143;
    v160.size.width = v59;
    v160.size.height = v60;
    v161 = CGRectUnion(v160, v175);
    v70 = v161.origin.x;
    v151 = v161.origin.y;
    v148 = v161.size.width;
    v71 = v161.size.height;
    v161.origin.x = a2;
    v161.origin.y = a3;
    v161.size.width = a4;
    v161.size.height = a5;
    v125 = v9;
    v140 = a2;
    if (CGRectGetMinX(v161) >= v153.f32[0])
    {
      v145 = v70;
      v72 = a3;
    }
    else
    {
      v162.origin.x = a2;
      v72 = a3;
      v162.origin.y = a3;
      v162.size.width = a4;
      v162.size.height = a5;
      if (CGRectGetMaxX(v162) <= v153.f32[0])
      {
        v145 = v70;
      }
      else
      {
        v73 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v121), v153.u32[0]), v153);
        v74 = (int32x2_t)vmul_f32(v73, v73);
        v74.i32[0] = vadd_f32((float32x2_t)v74, (float32x2_t)vdup_lane_s32(v74, 1)).u32[0];
        v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        r1d = v9 * vmul_f32(v75, vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v75, v75))).f32[0];
        v76 = logf(r1d);
        v77 = __sincosf_stret(v22 * v76);
        v78.f32[0] = -v77.__sinval;
        v78.i32[1] = LODWORD(v77.__cosval);
        v79 = (int32x2_t)vmul_f32(v73, (float32x2_t)__PAIR64__(LODWORD(v77.__sinval), LODWORD(v77.__cosval)));
        v80 = (int32x2_t)vmul_f32(v73, v78);
        v81 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v79, v80), (float32x2_t)vzip2_s32(v79, v80)), r1d));
        v82 = 0.0;
        if (r1d <= 1.0)
          v82 = 1.0;
        v83 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v121), v153.u32[0]), 1.0 - v82), v81, v82);
        v176.origin.x = v83.f32[0];
        v176.origin.y = v83.f32[1];
        v176.size.width = 0.0;
        v176.size.height = 0.0;
        v163.origin.x = v70;
        v163.origin.y = v151;
        v163.size.width = v148;
        v163.size.height = v71;
        v164 = CGRectUnion(v163, v176);
        v152 = v164.origin.x;
        v84 = v164.origin.y;
        v85 = v164.size.width;
        v86 = v164.size.height;
        v87 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v122), v153.u32[0]), v153);
        *(float32x2_t *)&v164.origin.x = vmul_f32(v87, v87);
        LODWORD(v164.origin.x) = vadd_f32(*(float32x2_t *)&v164.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v164.origin.x, 1)).u32[0];
        *(float32x2_t *)&v164.origin.y = vrsqrte_f32((float32x2_t)LODWORD(v164.origin.x));
        v144 = v125
             * vmul_f32(*(float32x2_t *)&v164.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v164.origin.x), vmul_f32(*(float32x2_t *)&v164.origin.y, *(float32x2_t *)&v164.origin.y))).f32[0];
        v88 = logf(v144);
        v89 = __sincosf_stret(v22 * v88);
        v90.f32[0] = -v89.__sinval;
        v90.i32[1] = LODWORD(v89.__cosval);
        v91 = (int32x2_t)vmul_f32(v87, (float32x2_t)__PAIR64__(LODWORD(v89.__sinval), LODWORD(v89.__cosval)));
        v92 = (int32x2_t)vmul_f32(v87, v90);
        v93 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v91, v92), (float32x2_t)vzip2_s32(v91, v92)), v144));
        v94 = 0.0;
        if (v144 <= 1.0)
          v94 = 1.0;
        v95 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v122), v153.u32[0]), 1.0 - v94), v93, v94);
        v177.origin.x = v95.f32[0];
        v177.origin.y = v95.f32[1];
        v177.size.width = 0.0;
        v177.size.height = 0.0;
        v165.origin.x = v152;
        v165.origin.y = v84;
        v165.size.width = v85;
        v165.size.height = v86;
        v166 = CGRectUnion(v165, v177);
        v145 = v166.origin.x;
        v151 = v166.origin.y;
        v148 = v166.size.width;
        v71 = v166.size.height;
      }
    }
    v167.origin.x = v140;
    v167.origin.y = v72;
    v167.size.width = a4;
    v167.size.height = a5;
    if (CGRectGetMinY(v167) >= v138)
    {
      return v145;
    }
    else
    {
      v168.origin.x = v140;
      v168.origin.y = v72;
      v168.size.width = a4;
      v168.size.height = a5;
      v7 = v145;
      if (CGRectGetMaxY(v168) > v138)
      {
        v96 = vsub_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v123)), v153);
        v97 = (int32x2_t)vmul_f32(v96, v96);
        v97.i32[0] = vadd_f32((float32x2_t)v97, (float32x2_t)vdup_lane_s32(v97, 1)).u32[0];
        v98 = vrsqrte_f32((float32x2_t)v97.u32[0]);
        v139 = v125 * vmul_f32(v98, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(v98, v98))).f32[0];
        v99 = logf(v139);
        v100 = __sincosf_stret(v22 * v99);
        v101.f32[0] = -v100.__sinval;
        v101.i32[1] = LODWORD(v100.__cosval);
        v102 = (int32x2_t)vmul_f32(v96, (float32x2_t)__PAIR64__(LODWORD(v100.__sinval), LODWORD(v100.__cosval)));
        v103 = (int32x2_t)vmul_f32(v96, v101);
        v104 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v102, v103), (float32x2_t)vzip2_s32(v102, v103)), v139));
        v105 = 0.0;
        if (v139 <= 1.0)
          v105 = 1.0;
        v106 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v123)), 1.0 - v105), v104, v105);
        v178.origin.x = v106.f32[0];
        v178.origin.y = v106.f32[1];
        v178.size.width = 0.0;
        v178.size.height = 0.0;
        v169.origin.x = v145;
        v169.origin.y = v151;
        v169.size.width = v148;
        v169.size.height = v71;
        v170 = CGRectUnion(v169, v178);
        v107 = v170.origin.x;
        v108 = v170.origin.y;
        v109 = v170.size.width;
        v110 = v170.size.height;
        v111 = vsub_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v124)), v153);
        *(float32x2_t *)&v170.origin.x = vmul_f32(v111, v111);
        LODWORD(v170.origin.x) = vadd_f32(*(float32x2_t *)&v170.origin.x, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v170.origin.x, 1)).u32[0];
        *(float32x2_t *)&v170.origin.y = vrsqrte_f32((float32x2_t)LODWORD(v170.origin.x));
        v149 = v125
             * vmul_f32(*(float32x2_t *)&v170.origin.y, vrsqrts_f32((float32x2_t)LODWORD(v170.origin.x), vmul_f32(*(float32x2_t *)&v170.origin.y, *(float32x2_t *)&v170.origin.y))).f32[0];
        v112 = logf(v149);
        v113 = __sincosf_stret(v22 * v112);
        v114.f32[0] = -v113.__sinval;
        v114.i32[1] = LODWORD(v113.__cosval);
        v115 = (int32x2_t)vmul_f32(v111, (float32x2_t)__PAIR64__(LODWORD(v113.__sinval), LODWORD(v113.__cosval)));
        v116 = (int32x2_t)vmul_f32(v111, v114);
        v117 = vadd_f32(v153, vmul_n_f32(vadd_f32((float32x2_t)vzip1_s32(v115, v116), (float32x2_t)vzip2_s32(v115, v116)), v149));
        v118 = 0.0;
        if (v149 <= 1.0)
          v118 = 1.0;
        v119 = vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(v153.u32[1], LODWORD(v124)), 1.0 - v118), v117, v118);
        v179.origin.x = v119.f32[0];
        v179.origin.y = v119.f32[1];
        v179.size.width = 0.0;
        v179.size.height = 0.0;
        v171.origin.x = v107;
        v171.origin.y = v108;
        v171.size.width = v109;
        v171.size.height = v110;
        *(_QWORD *)&v7 = (unint64_t)CGRectUnion(v171, v179);
      }
    }
  }
  return v7;
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

- (NSNumber)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
