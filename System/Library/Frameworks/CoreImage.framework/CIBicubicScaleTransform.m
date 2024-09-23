@implementation CIBicubicScaleTransform

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGeometryAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryNonSquarePixels");
  v11[4] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("11");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.13");
  v12[3] = CFSTR("inputScale");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1AC40;
  v10[1] = &unk_1E2F1AC50;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1AC60;
  v10[3] = &unk_1E2F1AC70;
  v9[4] = CFSTR("CIAttributeIdentity");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1AC70;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v9[6] = CFSTR("CIAttributeClass");
  v10[6] = CFSTR("NSNumber");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v12[4] = CFSTR("inputAspectRatio");
  v8[0] = &unk_1E2F1AC40;
  v8[1] = &unk_1E2F1AC80;
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1AC90;
  v8[3] = &unk_1E2F1AC70;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1AC70;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v7[6] = CFSTR("CIAttributeClass");
  v8[6] = CFSTR("NSNumber");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v12[5] = CFSTR("inputB");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1AC40;
  v6[1] = &unk_1E2F1AC40;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1AC70;
  v6[3] = &unk_1E2F1AC70;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1AC40;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v5[6] = CFSTR("CIAttributeClass");
  v6[6] = CFSTR("NSNumber");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v12[6] = CFSTR("inputC");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1AC40;
  v4[1] = &unk_1E2F1AC40;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1AC70;
  v4[3] = &unk_1E2F1AC70;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1ACA0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v3[6] = CFSTR("CIAttributeClass");
  v4[6] = CFSTR("NSNumber");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (float32x2_t)_scale
{
  double v2;
  double v3;
  float64x2_t v4;
  double v6;

  objc_msgSend(*(id *)(a1 + 88), "doubleValue");
  v6 = fmax(v2, 0.0);
  objc_msgSend(*(id *)(a1 + 96), "doubleValue");
  v4.f64[0] = v6 * fmax(v3, 0.0);
  v4.f64[1] = v6;
  return vcvt_f32_f64(v4);
}

- (BOOL)_isIdentity
{
  uint64_t v3;
  __int32 v4;
  __int32 v5;
  float32x2_t v6;
  float32x2_t v12;
  double v13;
  float32x4_t v14;
  int8x16_t v16;
  __int32 v18;
  uint64_t v19;

  -[CIBicubicScaleTransform _scale](self, "_scale");
  v19 = v3;
  -[NSNumber floatValue](self->inputB, "floatValue");
  v18 = v4;
  -[NSNumber floatValue](self->inputC, "floatValue");
  if (fabsf(*(float *)&v19 + -1.0) >= 0.00001)
    return 0;
  v6.i32[0] = v18;
  if (fabsf(*((float *)&v19 + 1) + -1.0) >= 0.00001)
    return 0;
  v6.i32[1] = v5;
  __asm { FMOV            V2.2S, #1.0 }
  v12 = vminnm_f32(vmaxnm_f32(v6, 0), _D2);
  _D2.i32[0] = v12.i32[1];
  v13 = v12.f32[0];
  *(float32x2_t *)v14.f32 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1924981B0, (float64x2_t)xmmword_1924981A0, v13), (float64x2_t)xmmword_1924981C0, _D2.f32[0]));
  v14.i32[2] = 0;
  *(float *)&v13 = v13 * -2.0 + 6.0;
  v14.i32[3] = LODWORD(v13);
  __asm { FMOV            V0.4S, #6.0 }
  v16 = (int8x16_t)vdivq_f32(v14, _Q0);
  return fabsf(vaddv_f32(vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL)))) < 0.00001;
}

- (id)outputImage
{
  CIImage *inputImage;
  unsigned int v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float32x2_t v14;
  float32x4_t v15;
  float32_t v16;
  float32x4_t v18;
  float32_t v19;
  float32x4_t v20;
  int8x16_t v21;
  int8x16_t v22;
  float64x2_t v23;
  float64x2_t v25;
  int8x16_t v26;
  int8x16_t v27;
  float64x2_t v28;
  double v29;
  double v30;
  double v31;
  float v32;
  float v33;
  double v34;
  float v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double *v40;
  double x;
  double y;
  double width;
  double height;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL IsNull;
  double v50;
  double v52;
  double var0;
  double var1;
  double var2;
  double var3;
  CIKernel *v57;
  __int128 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  BOOL v73;
  double v74;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CIKernel *v81;
  __int128 v82;
  __int128 v83;
  double *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  BOOL v93;
  double v94;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  CIKernel *v101;
  __int128 v102;
  __int128 v103;
  unint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CIKernel *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CIKernel *v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  double v127;
  CIKernel *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  CIKernel *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  float64x2_t v143;
  float64x2_t v144;
  CIKernel *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  float32x2_t v154;
  double v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  float32x4_t v161;
  float32x4_t v162;
  int64x2_t v163;
  double v164;
  int64x2_t v165;
  int64x2_t v166;
  unsigned int v167;
  __int128 v168;
  __int128 v169;
  double v170;
  unsigned int v171;
  double v172;
  __int128 v173;
  unint64_t v174;
  float32x2_t v175;
  double v176;
  _QWORD v177[5];
  _QWORD v178[5];
  _QWORD v179[5];
  float64x2_t v180;
  float64x2_t v181;
  _QWORD v182[5];
  _QWORD v183[5];
  Rectangle v184;
  Rectangle v185;
  Rectangle v186;
  _QWORD v187[4];
  _QWORD v188[4];
  _QWORD v189[2];
  _QWORD v190[4];
  _QWORD v191[4];
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[5];
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;

  v194[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIBicubicScaleTransform _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber floatValue](self->inputB, "floatValue");
  v171 = v5;
  -[NSNumber floatValue](self->inputC, "floatValue");
  v167 = v6;
  -[CIBicubicScaleTransform _scale](self, "_scale");
  v8 = v7;
  LODWORD(v9) = v7;
  if (fabsf(*(float *)&v7) >= 0.00001)
  {
    __asm { FMOV            V1.2S, #1.0 }
    v154 = _D1;
    v14 = vminnm_f32(vmaxnm_f32((float32x2_t)__PAIR64__(v167, v171), 0), _D1);
    v156 = v14.f32[1];
    *(float32x2_t *)v15.f32 = vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64((float64x2_t)xmmword_1924981B0, (float64x2_t)xmmword_1924981A0, v14.f32[0]), (float64x2_t)xmmword_1924981C0, v14.f32[1]));
    v16 = v14.f32[0] * -2.0 + 6.0;
    v15.i32[2] = 0;
    v15.f32[3] = v16;
    __asm { FMOV            V4.4S, #6.0 }
    v18 = vdivq_f32(v15, _Q4);
    v155 = *(double *)&v14;
    v15.f32[0] = (float)-v14.f32[0] + v14.f32[1] * -6.0;
    v19 = v14.f32[1] * 30.0 + v14.f32[0] * 6.0;
    v15.f32[1] = v19;
    inputImage = self->inputImage;
    v20 = vdivq_f32(vcvt_hight_f32_f64(*(int32x2_t *)v15.f32, vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1924981D0, v14.f32[1]), (float64x2_t)xmmword_1924981E0, v14.f32[0])), _Q4);
    v21 = (int8x16_t)vmulq_f32(v18, (float32x4_t)xmmword_1924981F0);
    *(float32x2_t *)v21.i8 = vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL));
    v162 = v18;
    v22 = (int8x16_t)vmulq_f32(v18, (float32x4_t)xmmword_192498200);
    *(float32x2_t *)v22.i8 = vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL));
    v23 = vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v21.i8, *(int32x2_t *)v22.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v21.i8, *(int32x2_t *)v22.i8)));
    __asm { FMOV            V1.2D, #0.5 }
    v25 = vmulq_f64(v23, _Q1);
    v26 = (int8x16_t)vmulq_f32(v20, (float32x4_t)xmmword_192498210);
    *(float32x2_t *)v26.i8 = vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL));
    v161 = v20;
    v27 = (int8x16_t)vmulq_f32(v20, (float32x4_t)xmmword_192498220);
    *(float32x2_t *)v27.i8 = vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
    v28 = vmulq_f64(vcvtq_f64_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v26.i8, *(int32x2_t *)v27.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v26.i8, *(int32x2_t *)v27.i8))), _Q1);
    v29 = v28.f64[1];
    v30 = 0.0;
    if (vmuld_lane_f64(v28.f64[0], v28, 1) >= 0.0)
    {
      v30 = v28.f64[1];
      v29 = -0.0;
    }
    v25.f64[0] = vaddvq_f64(v25);
    v31 = v30 + v28.f64[0] + v29;
    v32 = v25.f64[0];
    v33 = v31;
    if (v25.f64[0] == 0.0)
      v34 = 0.5;
    else
      v34 = v25.f64[1] / v25.f64[0] + 0.5;
    v35 = v34;
    v36 = v30 / v31 + 2.5;
    if (v31 == 0.0)
      v36 = 2.5;
    v37 = v36;
    v159 = v33;
    v160 = v32;
    v157 = v37;
    v158 = v35;
    if (*(float *)&v9 > 0.5 || *((float *)&v8 + 1) > 0.5)
    {
      v168 = v9;
    }
    else
    {
      v172 = v32;
      v164 = v33;
      v38 = v35;
      v163 = vdupq_n_s64(0x7FF0000000000000uLL);
      v39 = v37;
      v40 = (double *)MEMORY[0x1E0C9D5E0];
      v168 = v8;
      do
      {
        -[CIImage extent](inputImage, "extent");
        x = v195.origin.x;
        y = v195.origin.y;
        width = v195.size.width;
        height = v195.size.height;
        if (CGRectIsInfinite(v195))
        {
          v45 = 1.79769313e308;
          v46 = -8.98846567e307;
          v47 = 1.79769313e308;
          v48 = -8.98846567e307;
        }
        else
        {
          v196.origin.x = x;
          v196.origin.y = y;
          v196.size.width = width;
          v196.size.height = height;
          IsNull = CGRectIsNull(v196);
          v48 = INFINITY;
          if (IsNull)
            v46 = INFINITY;
          else
            v46 = x;
          v47 = 0.0;
          if (IsNull)
            v45 = 0.0;
          else
            v45 = height;
          if (!IsNull)
          {
            v47 = width;
            v48 = y;
          }
        }
        v50 = fabs(v48);
        if (fabs(v46) == INFINITY || v50 == INFINITY)
        {
          *(int64x2_t *)&v184.var0 = v163;
          v184.var2 = 0.0;
          v184.var3 = 0.0;
        }
        else if (v46 == -8.98846567e307 && v48 == -8.98846567e307 && v47 == 1.79769313e308 && v45 == 1.79769313e308)
        {
          *(int64x2_t *)&v184.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v184.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v184.var0 = v46 * 0.5;
          v184.var1 = v48 * 0.5;
          v184.var2 = v47 * 0.5;
          v184.var3 = v45 * 0.5;
        }
        Rectangle::inset(&v184, -2.0, -2.0, (uint64_t)&v185);
        *(_QWORD *)&v52 = *(_OWORD *)&Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
        var0 = v186.var0;
        var1 = v186.var1;
        var2 = v186.var2;
        var3 = v186.var3;
        v57 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2, v52);
        if (var0 == -8.98846567e307 && var1 == -8.98846567e307 && var2 == 1.79769313e308 && var3 == 1.79769313e308)
        {
          var0 = *v40;
          var1 = v40[1];
          var2 = v40[2];
          var3 = v40[3];
        }
        v194[0] = inputImage;
        v194[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v172, v164, v38, v39);
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v57, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_67, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 2), var0, var1, var2, var3);
        v8 = v168;
        *(float32x2_t *)&v8 = vadd_f32(*(float32x2_t *)&v8, *(float32x2_t *)&v8);
        v168 = v8;
      }
      while (*(float *)&v8 <= 0.5 && *((float *)&v8 + 1) <= 0.5);
    }
    v173 = v8;
    if (*(float *)&v168 <= 0.5)
    {
      v165 = vdupq_n_s64(0x7FF0000000000000uLL);
      v64 = (double *)MEMORY[0x1E0C9D5E0];
      do
      {
        -[CIImage extent](inputImage, "extent");
        v65 = v198.origin.x;
        v66 = v198.origin.y;
        v67 = v198.size.width;
        v68 = v198.size.height;
        if (CGRectIsInfinite(v198))
        {
          v69 = 1.79769313e308;
          v70 = -8.98846567e307;
          v71 = 1.79769313e308;
          v72 = -8.98846567e307;
        }
        else
        {
          v199.origin.x = v65;
          v199.origin.y = v66;
          v199.size.width = v67;
          v199.size.height = v68;
          v73 = CGRectIsNull(v199);
          v72 = INFINITY;
          if (v73)
            v70 = INFINITY;
          else
            v70 = v66;
          v71 = 0.0;
          if (v73)
            v69 = 0.0;
          else
            v69 = v67;
          if (!v73)
          {
            v71 = v68;
            v72 = v65;
          }
        }
        v74 = fabs(v70);
        if (fabs(v72) == INFINITY || v74 == INFINITY)
        {
          *(int64x2_t *)&v184.var0 = v165;
          v184.var2 = 0.0;
          v184.var3 = 0.0;
        }
        else if (v72 == -8.98846567e307 && v70 == -8.98846567e307 && v69 == 1.79769313e308 && v71 == 1.79769313e308)
        {
          *(int64x2_t *)&v184.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v184.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v184.var0 = v72 * 0.5;
          v184.var1 = v70;
          v184.var2 = v69 * 0.5;
          v184.var3 = v71;
        }
        Rectangle::inset(&v184, -2.0, -0.0, (uint64_t)&v185);
        *(_QWORD *)&v76 = *(_OWORD *)&Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
        v77 = v186.var0;
        v78 = v186.var1;
        v80 = v186.var2;
        v79 = v186.var3;
        v81 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2h, v76);
        if (v77 == -8.98846567e307 && v78 == -8.98846567e307 && v80 == 1.79769313e308 && v79 == 1.79769313e308)
        {
          v77 = *v64;
          v78 = v64[1];
          v80 = v64[2];
          v79 = v64[3];
        }
        v193[0] = inputImage;
        v193[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v160, v159, v158, v157);
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v81, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_25, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 2), v77, v78, v80, v79);
        v83 = v168;
        v82 = v173;
        *(float *)&v83 = *(float *)&v83 + *(float *)&v83;
        LODWORD(v82) = v83;
        v168 = v83;
        v173 = v82;
      }
      while (*(float *)&v83 <= 0.5);
    }
    v58 = v173;
    LODWORD(v58) = DWORD1(v173);
    if (*((float *)&v173 + 1) <= 0.5)
    {
      v169 = v58;
      v166 = vdupq_n_s64(0x7FF0000000000000uLL);
      v84 = (double *)MEMORY[0x1E0C9D5E0];
      do
      {
        -[CIImage extent](inputImage, "extent");
        v85 = v200.origin.x;
        v86 = v200.origin.y;
        v87 = v200.size.width;
        v88 = v200.size.height;
        if (CGRectIsInfinite(v200))
        {
          v89 = 1.79769313e308;
          v90 = -8.98846567e307;
          v91 = 1.79769313e308;
          v92 = -8.98846567e307;
        }
        else
        {
          v201.origin.x = v85;
          v201.origin.y = v86;
          v201.size.width = v87;
          v201.size.height = v88;
          v93 = CGRectIsNull(v201);
          v92 = INFINITY;
          if (v93)
            v90 = INFINITY;
          else
            v90 = v86;
          v91 = 0.0;
          if (v93)
            v89 = 0.0;
          else
            v89 = v87;
          if (!v93)
          {
            v91 = v88;
            v92 = v85;
          }
        }
        v94 = fabs(v90);
        if (fabs(v92) == INFINITY || v94 == INFINITY)
        {
          *(int64x2_t *)&v184.var0 = v166;
          v184.var2 = 0.0;
          v184.var3 = 0.0;
        }
        else if (v92 == -8.98846567e307 && v90 == -8.98846567e307 && v89 == 1.79769313e308 && v91 == 1.79769313e308)
        {
          *(int64x2_t *)&v184.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v184.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v184.var0 = v92;
          v184.var1 = v90 * 0.5;
          v184.var2 = v89;
          v184.var3 = v91 * 0.5;
        }
        Rectangle::inset(&v184, -0.0, -2.0, (uint64_t)&v185);
        *(_QWORD *)&v96 = *(_OWORD *)&Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
        v97 = v186.var0;
        v98 = v186.var1;
        v100 = v186.var2;
        v99 = v186.var3;
        v101 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsample2v, v96);
        if (v97 == -8.98846567e307 && v98 == -8.98846567e307 && v100 == 1.79769313e308 && v99 == 1.79769313e308)
        {
          v97 = *v84;
          v98 = v84[1];
          v100 = v84[2];
          v99 = v84[3];
        }
        v192[0] = inputImage;
        v192[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v160, v159, v158, v157);
        inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v101, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_26_0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 2), v97, v98, v100, v99);
        v103 = v169;
        v102 = v173;
        *(float *)&v103 = *(float *)&v103 + *(float *)&v103;
        DWORD1(v102) = v103;
        v169 = v103;
        v173 = v102;
      }
      while (*(float *)&v103 <= 0.5);
    }
    HIDWORD(v59) = DWORD1(v173);
    if (*(float *)&v173 >= 1.0)
    {
      v104 = v173;
      goto LABEL_127;
    }
    -[CIImage extent](inputImage, "extent", *(double *)&v173);
    v60 = v197.origin.x;
    v61 = v197.origin.y;
    v62 = v197.size.width;
    v63 = v197.size.height;
    if (CGRectIsInfinite(v197))
    {
      v62 = 1.79769313e308;
      v61 = -8.98846567e307;
      v63 = 1.79769313e308;
    }
    else
    {
      v202.origin.x = v60;
      v202.origin.y = v61;
      v202.size.width = v62;
      v202.size.height = v63;
      if (!CGRectIsNull(v202))
        goto LABEL_118;
      v62 = 0.0;
      v61 = INFINITY;
      v63 = 0.0;
    }
    v60 = v61;
LABEL_118:
    v105 = *(float *)&v173;
    if (fabs(v60) == INFINITY || fabs(v61) == INFINITY)
    {
      *(int64x2_t *)&v184.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v184.var2 = 0.0;
      v184.var3 = 0.0;
    }
    else if (v60 == -8.98846567e307 && v61 == -8.98846567e307 && v62 == 1.79769313e308 && v63 == 1.79769313e308)
    {
      *(int64x2_t *)&v184.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v184.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v184.var0 = v60 * v105;
      v184.var1 = v61;
      v184.var2 = v62 * v105;
      v184.var3 = v63;
    }
    Rectangle::inset(&v184, -2.0, -0.0, (uint64_t)&v185);
    *(_QWORD *)&v106 = *(_OWORD *)&Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
    v107 = v186.var0;
    v108 = v186.var1;
    v110 = v186.var2;
    v109 = v186.var3;
    v111 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsampleH, v106);
    if (v107 == -8.98846567e307 && v108 == -8.98846567e307 && v110 == 1.79769313e308 && v109 == 1.79769313e308)
    {
      v107 = *MEMORY[0x1E0C9D5E0];
      v108 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v110 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v109 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v183[0] = MEMORY[0x1E0C809B0];
    v183[1] = 3221225472;
    v183[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_6;
    v183[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v183[4] = v173;
    v191[0] = inputImage;
    v191[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(1.0 / *(float *)&v173), 1.0, v105, 1.0);
    v191[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v162.f32[0], v162.f32[1], v162.f32[2], v162.f32[3]);
    v191[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v161.f32[0], v161.f32[1], v161.f32[2], v161.f32[3]);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v111, "applyWithExtent:roiCallback:arguments:", v183, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 4), v107, v108, v110, v109);
    v104 = __PAIR64__(DWORD1(v173), 1.0);
LABEL_127:
    LODWORD(v59) = HIDWORD(v104);
    v170 = v59;
    v174 = v104;
    if (*((float *)&v104 + 1) >= 1.0)
    {
LABEL_143:
      LODWORD(v59) = 1.0;
      v175 = (float32x2_t)v104;
      if (*(float *)&v104 > 1.0 || (v104 = *(_QWORD *)&v170, *(float *)&v170 > 1.0) || inputImage == self->inputImage)
      {
        -[CIImage extent](inputImage, "extent", v59, *(double *)&v104);
        v123 = v205.origin.x;
        v124 = v205.origin.y;
        v125 = v205.size.width;
        v126 = v205.size.height;
        if (CGRectIsInfinite(v205))
        {
          *(int64x2_t *)&v186.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          *(int64x2_t *)&v186.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        else
        {
          v206.origin.x = v123;
          v206.origin.y = v124;
          v206.size.width = v125;
          v206.size.height = v126;
          if (CGRectIsNull(v206))
          {
            *(int64x2_t *)&v186.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
            v186.var2 = 0.0;
            v186.var3 = 0.0;
          }
          else
          {
            v186.var0 = v123;
            v186.var1 = v124;
            v186.var2 = v125;
            v186.var3 = v126;
          }
        }
        Rectangle::inset(&v186, -2.0, -2.0, (uint64_t)&v180);
        if (fabs(v180.f64[0]) == INFINITY || fabs(v180.f64[1]) == INFINITY)
        {
          *(int64x2_t *)&v184.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
          v184.var2 = 0.0;
          v184.var3 = 0.0;
        }
        else
        {
          v143 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
          v144 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
          if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v180, v144), (int32x4_t)vceqq_f64(v181, v143))))) & 1) != 0)
          {
            v184.var0 = v180.f64[0] * v175.f32[0];
            v184.var1 = v180.f64[1] * *(float *)&v170;
            v184.var2 = v175.f32[0] * v181.f64[0];
            v184.var3 = vmuld_lane_f64(*(float *)&v170, v181, 1);
          }
          else
          {
            *(float64x2_t *)&v184.var0 = v144;
            *(float64x2_t *)&v184.var2 = v143;
          }
        }
        Rectangle::integralize(&v184, 0.0001, (uint64_t)&v185);
        v186 = v185;
        v127 = COERCE_DOUBLE(vdiv_f32(v154, v175));
        v176 = v127;
        *(float *)&v127 = v156;
        if (*(float *)&v155 == 1.0 && v156 == 0.0)
        {
          v128 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample10, v127, v155);
          v129 = v186.var0;
          v130 = v186.var1;
          v132 = v186.var2;
          v131 = v186.var3;
          if (v186.var0 == -8.98846567e307
            && v186.var1 == -8.98846567e307
            && v186.var2 == 1.79769313e308
            && v186.var3 == 1.79769313e308)
          {
            v129 = *MEMORY[0x1E0C9D5E0];
            v130 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
            v132 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
            v131 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
          }
          v179[0] = MEMORY[0x1E0C809B0];
          v179[1] = 3221225472;
          v179[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_8;
          v179[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v179[4] = v176;
          v189[0] = inputImage;
          v189[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)&v176, *((float *)&v176 + 1));
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v128, "applyWithExtent:roiCallback:arguments:", v179, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 2), v129, v130, v132, v131);
        }
        else if (v156 == 0.0)
        {
          v134 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsampleX0, v127, v155);
          Rectangle::operator CGRect();
          v136 = v135;
          v138 = v137;
          v140 = v139;
          v142 = v141;
          v178[0] = MEMORY[0x1E0C809B0];
          v178[1] = 3221225472;
          v178[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_9;
          v178[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v178[4] = v176;
          v188[0] = inputImage;
          v188[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)&v176, *((float *)&v176 + 1));
          v188[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v162.f32[0], v162.f32[1], v162.f32[2], v162.f32[3]);
          v188[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v161.f32[0], v161.f32[1], v161.f32[2], v161.f32[3]);
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v134, "applyWithExtent:roiCallback:arguments:", v178, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 4), v136, v138, v140, v142);
        }
        else
        {
          v145 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicUpsample, v127, v155);
          Rectangle::operator CGRect();
          v147 = v146;
          v149 = v148;
          v151 = v150;
          v153 = v152;
          v177[0] = MEMORY[0x1E0C809B0];
          v177[1] = 3221225472;
          v177[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_10;
          v177[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          *(double *)&v177[4] = v176;
          v187[0] = inputImage;
          v187[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)&v176, *((float *)&v176 + 1));
          v187[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v162.f32[0], v162.f32[1], v162.f32[2], v162.f32[3]);
          v187[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v161.f32[0], v161.f32[1], v161.f32[2], v161.f32[3]);
          return -[CIKernel applyWithExtent:roiCallback:arguments:](v145, "applyWithExtent:roiCallback:arguments:", v177, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 4), v147, v149, v151, v153);
        }
      }
      return inputImage;
    }
    -[CIImage extent](inputImage, "extent");
    v112 = v203.origin.x;
    v113 = v203.origin.y;
    v114 = v203.size.width;
    v115 = v203.size.height;
    if (CGRectIsInfinite(v203))
    {
      v114 = 1.79769313e308;
      v113 = -8.98846567e307;
      v115 = 1.79769313e308;
    }
    else
    {
      v204.origin.x = v112;
      v204.origin.y = v113;
      v204.size.width = v114;
      v204.size.height = v115;
      if (!CGRectIsNull(v204))
        goto LABEL_134;
      v114 = 0.0;
      v113 = INFINITY;
      v115 = 0.0;
    }
    v112 = v113;
LABEL_134:
    v116 = *(float *)&v170;
    if (fabs(v112) == INFINITY || fabs(v113) == INFINITY)
    {
      *(int64x2_t *)&v184.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      v184.var2 = 0.0;
      v184.var3 = 0.0;
    }
    else if (v112 == -8.98846567e307 && v113 == -8.98846567e307 && v114 == 1.79769313e308 && v115 == 1.79769313e308)
    {
      *(int64x2_t *)&v184.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
      *(int64x2_t *)&v184.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    }
    else
    {
      v184.var0 = v112;
      v184.var1 = v113 * v116;
      v184.var2 = v114;
      v184.var3 = v115 * v116;
    }
    Rectangle::inset(&v184, -0.0, -2.0, (uint64_t)&v185);
    *(_QWORD *)&v117 = *(_OWORD *)&Rectangle::integralize(&v185, 0.0001, (uint64_t)&v186);
    v118 = v186.var0;
    v119 = v186.var1;
    v121 = v186.var2;
    v120 = v186.var3;
    v122 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cubicDownsampleV, v117);
    if (v118 == -8.98846567e307 && v119 == -8.98846567e307 && v121 == 1.79769313e308 && v120 == 1.79769313e308)
    {
      v118 = *MEMORY[0x1E0C9D5E0];
      v119 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v121 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v120 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    }
    v182[0] = MEMORY[0x1E0C809B0];
    v182[1] = 3221225472;
    v182[2] = __38__CIBicubicScaleTransform_outputImage__block_invoke_7;
    v182[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v182[4] = v174;
    v190[0] = inputImage;
    v190[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, (float)(1.0 / *(float *)&v170), 1.0, v116);
    v190[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v162.f32[0], v162.f32[1], v162.f32[2], v162.f32[3]);
    v190[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v161.f32[0], v161.f32[1], v161.f32[2], v161.f32[3]);
    inputImage = -[CIKernel applyWithExtent:roiCallback:arguments:](v122, "applyWithExtent:roiCallback:arguments:", v182, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 4), v118, v119, v121, v120);
    v104 = __PAIR64__(1.0, v174);
    LODWORD(v59) = 1.0;
    v170 = v59;
    goto LABEL_143;
  }
  return +[CIImage emptyImage](CIImage, "emptyImage");
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  Rectangle v11;
  double v12;
  double v13;
  float64x2_t v14;
  Rectangle v15;
  uint64_t v16;
  CGRect v17;

  if (CGRectIsInfinite(*(CGRect *)&a1))
  {
    *(int64x2_t *)&v11.var0 = vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v11.var2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  else
  {
    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    if (CGRectIsNull(v17))
    {
      *(int64x2_t *)&v11.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
      *(_OWORD *)&v11.var2 = 0uLL;
    }
    else
    {
      v11.var0 = a1;
      v11.var1 = a2;
      v11.var2 = a3;
      v11.var3 = a4;
    }
  }
  Rectangle::inset(&v11, -2.0, -2.0, (uint64_t)&v12);
  if (fabs(v12) == INFINITY || fabs(v13) == INFINITY)
  {
    *(int64x2_t *)&v15.var0 = vdupq_n_s64(0x7FF0000000000000uLL);
    v15.var2 = 0.0;
    v15.var3 = 0.0;
  }
  else
  {
    v8.f64[0] = v13;
    v8.f64[1] = v12;
    v9 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v10 = (float64x2_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v8, v10), (int32x4_t)vceqq_f64(v14, v9))))) & 1) != 0)
    {
      v15.var0 = v12 + v12;
      v15.var1 = v13 + v13;
      *(float64x2_t *)&v15.var2 = vaddq_f64(v14, v14);
    }
    else
    {
      *(float64x2_t *)&v15.var0 = v10;
      *(float64x2_t *)&v15.var2 = v9;
    }
  }
  Rectangle::integralize(&v15, 0.0001, (uint64_t)&v16);
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  downsampleRoiH(*(CGRect *)&a1, 2.0);
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
{
  downsampleRoiV(*(CGRect *)&a1, 2.0);
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_6(uint64_t a1, double a2, double a3, double a4, double a5)
{
  downsampleRoiH(*(CGRect *)&a2, 1.0 / COERCE_FLOAT(*(_QWORD *)(a1 + 32)));
}

void __38__CIBicubicScaleTransform_outputImage__block_invoke_7(uint64_t a1, double a2, double a3, double a4, double a5)
{
  downsampleRoiV(*(CGRect *)&a2, 1.0 / *(float *)(a1 + 36));
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_8(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_9(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

double __38__CIBicubicScaleTransform_outputImage__block_invoke_10(float32x2_t *a1, float64_t a2, float64_t a3, double a4, double a5)
{
  return upsampleRoi(a2, a3, a4, a5, a1[4]);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputAspectRatio
{
  return self->inputAspectRatio;
}

- (void)setInputAspectRatio:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputB
{
  return self->inputB;
}

- (void)setInputB:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputC
{
  return self->inputC;
}

- (void)setInputC:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
