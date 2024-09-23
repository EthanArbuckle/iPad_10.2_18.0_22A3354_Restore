@implementation CIHoleDistortion

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryDistortionEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19F00;
  v6[1] = &unk_1E2F19F00;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19F10;
  v6[3] = &unk_1E2F19F20;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F19F30;
  v6[5] = CFSTR("CIAttributeTypeDistance");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputCenter");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v4[1] = CFSTR("CIAttributeTypePosition");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  return v2 <= 0.1;
}

- (id)_geomKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIWarpKernel, "kernelWithInternalRepresentation:", &CI::_holeDistortion);
}

- (id)_colorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_holeAntialias);
}

- (CGRect)computeDOD
{
  CGFloat v3;
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
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  CGFloat v19;
  float v20;
  float32x2_t v21;
  float v22;
  float32x2_t v23;
  float32x2_t v24;
  double v25;
  float v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  unint64_t v33;
  float32x2_t v34;
  double v35;
  float v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  float32x2_t v43;
  float32x2_t v44;
  double v45;
  float v46;
  CGFloat v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  unint64_t v53;
  float32x2_t v54;
  double v55;
  float v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  unint64_t v61;
  float32x2_t v62;
  double v63;
  float v64;
  CGFloat v65;
  double v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  unint64_t v71;
  float32x2_t v72;
  double v73;
  float v74;
  double v75;
  double v76;
  double v77;
  unint64_t v78;
  float32x2_t v79;
  double v80;
  float v81;
  CGFloat v82;
  double v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  unint64_t v88;
  float32x2_t v89;
  double v90;
  float v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  float v98;
  float v99;
  float v100;
  unsigned int v101;
  float v102;
  __int32 v103;
  __int32 v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  float32x2_t v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect result;

  v111 = *MEMORY[0x1E0C9D628];
  v108 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v106 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  -[CIImage extent](self->inputImage, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CIVector X](self->inputCenter, "X");
  v13 = v12;
  -[CIVector Y](self->inputCenter, "Y");
  v15 = v14;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v17 = v16;
  v113.origin.x = v5;
  v113.origin.y = v7;
  v113.size.width = v9;
  v113.size.height = v11;
  if (CGRectIsInfinite(v113))
  {
    v18 = v5;
  }
  else
  {
    v19 = v111;
    v105 = v9;
    v110 = v11;
    v21.f32[0] = v13;
    v20 = v15;
    v99 = v20;
    v100 = v21.f32[0];
    v21.f32[1] = v20;
    v23.f32[0] = v5;
    v22 = v7;
    v104 = v23.i32[0];
    v102 = v22;
    v23.f32[1] = v22;
    v24 = vsub_f32(v23, v21);
    v25 = vaddv_f32(vmul_f32(v24, v24));
    if (v25 >= 0.00001)
    {
      v26 = sqrt((float)(v17 * v17) * 4.0 / v25 + 1.0) + 1.0;
      v23 = vadd_f32(v21, vmul_n_f32(vmul_f32(v24, (float32x2_t)0x3F0000003F000000), v26));
    }
    v112 = v21;
    v28 = unionPointWithRect(*(double *)&v23, v19, v108, v106, v3);
    v30 = v29;
    v32 = v31;
    *(float *)&v29 = v7 + v11;
    v33 = __PAIR64__(LODWORD(v29), v104);
    v101 = LODWORD(v29);
    v34 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v29), v104), v112);
    v35 = vaddv_f32(vmul_f32(v34, v34));
    if (v35 >= 0.00001)
    {
      v36 = sqrt((float)(v17 * v17) * 4.0 / v35 + 1.0) + 1.0;
      v33 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v34, (float32x2_t)0x3F0000003F000000), v36));
    }
    v38 = unionPointWithRect(*(double *)&v33, v28, v30, v32, v27);
    v40 = v39;
    v42 = v41;
    v43.f32[0] = v5 + v9;
    v103 = v43.i32[0];
    v43.f32[1] = v102;
    v44 = vsub_f32(v43, v112);
    v45 = vaddv_f32(vmul_f32(v44, v44));
    if (v45 >= 0.00001)
    {
      v46 = sqrt((float)(v17 * v17) * 4.0 / v45 + 1.0) + 1.0;
      v43 = vadd_f32(v112, vmul_n_f32(vmul_f32(v44, (float32x2_t)0x3F0000003F000000), v46));
    }
    v109 = v7;
    v48 = unionPointWithRect(*(double *)&v43, v38, v40, v42, v37);
    v50 = v49;
    v52 = v51;
    v53 = __PAIR64__(v101, v103);
    v54 = vsub_f32((float32x2_t)__PAIR64__(v101, v103), v112);
    v55 = vaddv_f32(vmul_f32(v54, v54));
    if (v55 >= 0.00001)
    {
      v56 = sqrt((float)(v17 * v17) * 4.0 / v55 + 1.0) + 1.0;
      v53 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v54, (float32x2_t)0x3F0000003F000000), v56));
    }
    v98 = v17;
    v107 = unionPointWithRect(*(double *)&v53, v48, v50, v52, v47);
    v7 = v57;
    v9 = v58;
    v11 = v59;
    v114.origin.x = v5;
    v114.origin.y = v109;
    v114.size.width = v105;
    v60 = v110;
    v114.size.height = v110;
    if (CGRectGetMinX(v114) < v100)
    {
      v115.origin.x = v5;
      v115.origin.y = v109;
      v115.size.width = v105;
      v115.size.height = v110;
      if (CGRectGetMaxX(v115) <= v100)
      {
        v60 = v110;
      }
      else
      {
        v61 = __PAIR64__(LODWORD(v102), v112.u32[0]);
        v62 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v102), v112.u32[0]), v112);
        v63 = vaddv_f32(vmul_f32(v62, v62));
        if (v63 >= 0.00001)
        {
          v64 = sqrt((float)(v98 * v98) * 4.0 / v63 + 1.0) + 1.0;
          v61 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v62, (float32x2_t)0x3F0000003F000000), v64));
        }
        v66 = unionPointWithRect(*(double *)&v61, v107, v7, v9, v11);
        v68 = v67;
        v70 = v69;
        v71 = __PAIR64__(v101, v112.u32[0]);
        v72 = vsub_f32((float32x2_t)__PAIR64__(v101, v112.u32[0]), v112);
        v73 = vaddv_f32(vmul_f32(v72, v72));
        if (v73 >= 0.00001)
        {
          v74 = sqrt((float)(v98 * v98) * 4.0 / v73 + 1.0) + 1.0;
          v71 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v72, (float32x2_t)0x3F0000003F000000), v74));
        }
        v107 = unionPointWithRect(*(double *)&v71, v66, v68, v70, v65);
        v7 = v75;
        v9 = v76;
        v11 = v77;
        v60 = v110;
      }
    }
    v116.origin.x = v5;
    v116.origin.y = v109;
    v116.size.width = v105;
    v116.size.height = v60;
    if (CGRectGetMinY(v116) >= v99
      || (v117.origin.x = v5,
          v117.origin.y = v109,
          v117.size.width = v105,
          v117.size.height = v60,
          CGRectGetMaxY(v117) <= v99))
    {
      v18 = v107;
    }
    else
    {
      v78 = __PAIR64__(v112.u32[1], v104);
      v79 = vsub_f32((float32x2_t)__PAIR64__(v112.u32[1], v104), v112);
      v80 = vaddv_f32(vmul_f32(v79, v79));
      if (v80 >= 0.00001)
      {
        v81 = sqrt((float)(v98 * v98) * 4.0 / v80 + 1.0) + 1.0;
        v78 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v79, (float32x2_t)0x3F0000003F000000), v81));
      }
      v83 = unionPointWithRect(*(double *)&v78, v107, v7, v9, v11);
      v85 = v84;
      v87 = v86;
      v88 = __PAIR64__(v112.u32[1], v103);
      v89 = vsub_f32((float32x2_t)__PAIR64__(v112.u32[1], v103), v112);
      v90 = vaddv_f32(vmul_f32(v89, v89));
      if (v90 >= 0.00001)
      {
        v91 = sqrt((float)(v98 * v98) * 4.0 / v90 + 1.0) + 1.0;
        v88 = (unint64_t)vadd_f32(v112, vmul_n_f32(vmul_f32(v89, (float32x2_t)0x3F0000003F000000), v91));
      }
      v18 = unionPointWithRect(*(double *)&v88, v83, v85, v87, v82);
      v7 = v92;
      v9 = v93;
      v11 = v94;
    }
  }
  v95 = v7;
  v96 = v9;
  v97 = v11;
  result.size.height = v97;
  result.size.width = v96;
  result.origin.y = v95;
  result.origin.x = v18;
  return result;
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  float64x2_t v6;
  float64_t v7;
  float32x2_t v8;
  CIVector *inputCenter;
  double x;
  double y;
  double width;
  double height;
  id v14;
  CIImage *inputImage;
  uint64_t v16;
  id v17;
  float64_t v19;
  _QWORD v20[6];
  _QWORD v21[3];
  _QWORD v22[3];
  CGRect v23;
  CGRect v24;

  v22[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v4 = v3;
  if (v3 <= 0.1)
    return self->inputImage;
  -[CIVector X](self->inputCenter, "X");
  v19 = v5;
  -[CIVector Y](self->inputCenter, "Y");
  v6.f64[0] = v19;
  v6.f64[1] = v7;
  v8 = vcvt_f32_f64(v6);
  inputCenter = self->inputCenter;
  if (!inputCenter)
    inputCenter = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  -[CIHoleDistortion computeDOD](self, "computeDOD");
  v24 = CGRectIntegral(v23);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  v14 = -[CIHoleDistortion _geomKernel](self, "_geomKernel");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __31__CIHoleDistortion_outputImage__block_invoke;
  v20[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v20[4] = v8;
  *(double *)&v20[5] = v4;
  inputImage = self->inputImage;
  v22[0] = inputCenter;
  v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 * v4);
  v16 = objc_msgSend(v14, "applyWithExtent:roiCallback:inputImage:arguments:", v20, inputImage, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2), x, y, width, height);
  v17 = -[CIHoleDistortion _colorKernel](self, "_colorKernel");
  v21[0] = v16;
  v21[1] = inputCenter;
  v21[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3), x, y, width, height);
}

double __31__CIHoleDistortion_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float32x2_t v6;
  float v7;
  float32x2_t v8;
  double v9;
  unsigned int v10;
  double v11;
  float32x2_t v12;
  float v13;
  float32x2_t v14;
  float v15;
  float v16;
  float32x2_t v17;
  float v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  float32x2_t v25;
  float v26;
  float v27;
  float32x2_t v28;
  float v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  float32x2_t v36;
  float v37;
  float v38;
  float32x2_t v39;
  float v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  float32x2_t v47;
  float v48;
  float v49;
  float32x2_t v50;
  float v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  float32x2_t v57;
  double v58;
  CGFloat v59;
  float32x2_t v65;
  int32x2_t v66;
  float32x2_t v67;
  int32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  int32x2_t v73;
  float v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  CGFloat v79;
  float32x2_t v80;
  float v81;
  double v82;
  double v83;
  double v84;
  float32x2_t v85;
  int32x2_t v86;
  float32x2_t v87;
  float32x2_t v88;
  int32x2_t v89;
  float32x2_t v90;
  float32x2_t v91;
  float32x2_t v92;
  float32x2_t v93;
  int32x2_t v94;
  float v95;
  CGFloat v96;
  CGFloat v97;
  double v98;
  double v99;
  CGFloat v100;
  float32x2_t v101;
  float v102;
  float v104;
  unsigned int v105;
  __int32 v106;
  __int32 v107;
  float32x2_t v108;
  __int8 v109;
  float32x2_t v110;
  float32_t v111;
  __int8 v112;
  float32x2_t v113;
  float v114;
  float v115;
  float v116;
  float32_t v117;
  float32x2_t v118;

  v6 = *(float32x2_t *)(a1 + 32);
  v8.f32[0] = a2;
  v9 = a3 + a5;
  *(float *)&v10 = a3 + a5;
  v11 = a2 + a4;
  v12.f32[0] = a2 + a4;
  v105 = v10;
  v106 = v12.i32[0];
  v107 = v8.i32[0];
  v108 = (float32x2_t)__PAIR64__(v10, v12.u32[0]);
  v13 = a3;
  v8.f32[1] = v13;
  v104 = v13;
  v12.f32[1] = v13;
  v110 = v8;
  v113 = v12;
  v14 = vsub_f32((float32x2_t)__PAIR64__(v10, v8.u32[0]), v6);
  v15 = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
  v16 = 1.0 / v15;
  if (v15 == 0.0)
    v16 = 0.0;
  v17 = vmul_n_f32(v14, v16);
  v7 = *(double *)(a1 + 40);
  v116 = -(float)(v7 * v7);
  v118 = *(float32x2_t *)(a1 + 32);
  v18 = v15 + (float)(v116 * v16);
  if (v18 <= 0.0)
    v18 = 0.0;
  v20 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v6, vmul_n_f32(v17, v18))), *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
  v22 = v21;
  v24 = v23;
  v25 = vsub_f32(v108, v118);
  v26 = sqrtf(vaddv_f32(vmul_f32(v25, v25)));
  v27 = 1.0 / v26;
  if (v26 == 0.0)
    v27 = 0.0;
  v28 = vmul_n_f32(v25, v27);
  v29 = v26 + (float)(v116 * v27);
  if (v29 <= 0.0)
    v29 = 0.0;
  v31 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v28, v29))), v20, v22, v24, v19);
  v33 = v32;
  v35 = v34;
  v36 = vsub_f32(v110, v118);
  v37 = sqrtf(vaddv_f32(vmul_f32(v36, v36)));
  v38 = 1.0 / v37;
  if (v37 == 0.0)
    v38 = 0.0;
  v39 = vmul_n_f32(v36, v38);
  v40 = v37 + (float)(v116 * v38);
  if (v40 <= 0.0)
    v40 = 0.0;
  v42 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v39, v40))), v31, v33, v35, v30);
  v44 = v43;
  v46 = v45;
  v47 = vsub_f32(v113, v118);
  v48 = sqrtf(vaddv_f32(vmul_f32(v47, v47)));
  v49 = 1.0 / v48;
  if (v48 == 0.0)
    v49 = 0.0;
  v50 = vmul_n_f32(v47, v49);
  v51 = v48 + (float)(v116 * v49);
  if (v51 <= 0.0)
    v51 = 0.0;
  v52 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v50, v51))), v42, v44, v46, v41);
  v54 = v53;
  v56 = v55;
  v57 = v118;
  v59 = v58;
  __asm { FMOV            V9.2S, #1.0 }
  if (_NF && v11 > v118.f32[0])
  {
    v65 = vsub_f32((float32x2_t)__PAIR64__(v105, v118.u32[0]), v118);
    v66 = (int32x2_t)vmul_f32(v65, v65);
    v67 = vsub_f32((float32x2_t)__PAIR64__(LODWORD(v104), v118.u32[0]), v118);
    v68 = (int32x2_t)vmul_f32(v67, v67);
    v69 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v68, v66), (float32x2_t)vzip2_s32(v68, v66)));
    v70 = (float32x2_t)vbic_s8((int8x8_t)vdiv_f32(_D9, v69), (int8x8_t)vceqz_f32(v69));
    v114 = v70.f32[0];
    v71 = vmul_lane_f32(v65, v70, 1);
    v72 = vmla_n_f32(v69, v70, v116);
    v73 = vclez_f32(v72);
    v109 = v73.i8[0];
    v74 = v72.f32[1];
    v111 = v72.f32[0];
    if ((v73.i8[4] & 1) != 0)
      v74 = 0.0;
    v77 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v71, v74))), v52, v54, v56, v59);
    v79 = v78;
    v80 = vmul_n_f32(v67, v114);
    v81 = v111;
    if ((v109 & 1) != 0)
      v81 = 0.0;
    v52 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v80, v81))), v77, v79, v75, v76);
    v54 = v82;
    v56 = v83;
    v57 = v118;
    v59 = v84;
  }
  if (a3 < v57.f32[1] && v9 > v57.f32[1])
  {
    v85 = vsub_f32((float32x2_t)__PAIR64__(v57.u32[1], v106), v57);
    v86 = (int32x2_t)vmul_f32(v85, v85);
    v87 = v57;
    v57.i32[0] = v107;
    v88 = vsub_f32(v57, v87);
    v89 = (int32x2_t)vmul_f32(v88, v88);
    v90 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v89, v86), (float32x2_t)vzip2_s32(v89, v86)));
    v91 = (float32x2_t)vbic_s8((int8x8_t)vdiv_f32(_D9, v90), (int8x8_t)vceqz_f32(v90));
    v115 = v91.f32[0];
    v92 = vmul_lane_f32(v85, v91, 1);
    v93 = vmla_n_f32(v90, v91, v116);
    v117 = v93.f32[0];
    v94 = vclez_f32(v93);
    v112 = v94.i8[0];
    v95 = v93.f32[1];
    if ((v94.i8[4] & 1) != 0)
      v95 = 0.0;
    v98 = unionPointWithRect(COERCE_DOUBLE(vadd_f32(v87, vmul_n_f32(v92, v95))), v52, v54, v56, v59);
    v100 = v99;
    v101 = vmul_n_f32(v88, v115);
    v102 = v117;
    if ((v112 & 1) != 0)
      v102 = 0.0;
    return unionPointWithRect(COERCE_DOUBLE(vadd_f32(v118, vmul_n_f32(v101, v102))), v98, v100, v96, v97);
  }
  return v52;
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

@end
