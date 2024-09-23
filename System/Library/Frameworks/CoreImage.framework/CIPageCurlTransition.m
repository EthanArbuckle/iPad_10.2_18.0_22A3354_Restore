@implementation CIPageCurlTransition

- (id)_CIPageCurlTransition
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_pageCurlTransition);
}

- (id)_CIPageCurlTransNoEmap
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_pageCurlTransNoEmap);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CIImage *inputBacksideImage;
  double v10;
  double v11;
  double v12;
  double v13;
  CIImage *inputImage;
  CIVector *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __double2 v26;
  __double2 v27;
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
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int v62;
  uint64_t v63;
  CGFloat *p_y;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  _QWORD *v79;
  void *v80;
  id v81;
  id result;
  CGFloat height;
  CGFloat v84;
  CGFloat v85;
  uint64_t v86;
  CGFloat width;
  CGFloat v88;
  CGFloat v89;
  uint64_t v90;
  CGFloat v91;
  CGFloat y;
  CGFloat v93;
  CGFloat v94;
  uint64_t v95;
  CGFloat v96;
  CGFloat x;
  CGFloat v98;
  CGFloat v99;
  double v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat r1a;
  double r1;
  double r1_8;
  double r1_16;
  double r1_24;
  double r1_24a;
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
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  _QWORD v127[30];
  _QWORD v128[30];
  CGAffineTransform v129;
  CGAffineTransform v130;
  CGAffineTransform v131;
  CGAffineTransform v132;
  CGAffineTransform v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  _QWORD v138[11];
  _QWORD v139[9];
  CGPoint v140;
  uint64_t v141;
  CGPoint v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;

  v141 = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputTime, "doubleValue");
  v125 = fmax(v5, 0.0);
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v7 = fmax(v6, 0.01);
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v113 = fmax(v8, 0.0);
  -[CIImage extent](self->inputImage, "extent");
  inputBacksideImage = self->inputBacksideImage;
  v114 = v11;
  v116 = v10;
  r1_16 = v13;
  r1_24 = v12;
  if (inputBacksideImage)
    inputImage = -[CIImage imageByCroppingToRect:](inputBacksideImage, "imageByCroppingToRect:");
  else
    inputImage = self->inputImage;
  -[CIImage extent](self->inputShadingImage, "extent");
  v15 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  -[CIVector X](self->inputExtent, "X");
  v17 = v16;
  -[CIVector Y](self->inputExtent, "Y");
  v19 = v18;
  -[CIVector Z](self->inputExtent, "Z");
  v21 = v17 + v20;
  -[CIVector W](self->inputExtent, "W");
  v121 = v19 + v22;
  -[CIVector Z](self->inputExtent, "Z");
  v123 = v17 + v23 * 0.5;
  -[CIVector W](self->inputExtent, "W");
  v25 = v19 + v24 * 0.5;
  v26 = __sincos_stret(v4);
  v27 = __sincos_stret(v4 + v4);
  v28 = -(v26.__sinval * v19);
  v29 = v28 - v17 * v26.__cosval;
  v30 = v28 - v21 * v26.__cosval;
  v31 = fmin(v29, v30);
  v32 = fmax(v29, v30);
  v33 = -(v26.__sinval * v121);
  v34 = v33 - v17 * v26.__cosval;
  v35 = fmin(v31, v34);
  v36 = v33 - v21 * v26.__cosval;
  v37 = fmax(fmax(v32, v34), v36);
  v38 = -(v37 - v125 * (v113 + v37 - fmin(v35, v36)));
  v39 = v26.__sinval * v123 - v26.__cosval * v25;
  v126 = v38 / v7;
  v40 = -(v26.__cosval * v7);
  v41 = -(v26.__sinval * v7);
  v42 = v26.__sinval * v39 + v26.__cosval * v38;
  v43 = v39;
  v44 = v26.__sinval * v38 - v26.__cosval * v39;
  v120 = -v26.__cosval / v7;
  v122 = v40;
  v45 = v42 + v40 * 0.5 * 3.14159265;
  v46 = v44 + v41 * 0.5 * 3.14159265;
  v124 = v44;
  v102 = v27.__sinval * v46 + v27.__cosval * v45;
  v103 = v46;
  r1a = *MEMORY[0x1E0C9D628];
  r1_8 = -v26.__sinval / v7;
  v47 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v91 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v96 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v137.a = v120;
  v137.b = -v26.__sinval;
  v137.c = r1_8;
  v137.d = v26.__cosval;
  v137.tx = v126;
  v137.ty = v43;
  v48 = v43;
  v112 = v43;
  v136.a = v40;
  v136.b = v41;
  v49 = v41;
  v118 = v41;
  v119 = v42;
  v136.c = -v26.__sinval;
  v136.d = v26.__cosval;
  v105 = v45;
  v100 = v27.__sinval * v45 - v27.__cosval * v46;
  v136.tx = v42;
  v136.ty = v44;
  v142.x = v116;
  v142.y = v114;
  pageCurlMapInverse(v142, &v137, &v136);
  v154.origin.x = v50;
  v154.origin.y = v51;
  v154.size.width = 0.0;
  v154.size.height = 0.0;
  v143.origin.x = r1a;
  v143.size.width = v91;
  v143.origin.y = v96;
  v143.size.height = v47;
  v144 = CGRectUnion(v143, v154);
  y = v144.origin.y;
  x = v144.origin.x;
  height = v144.size.height;
  width = v144.size.width;
  v135.a = v120;
  v135.b = -v26.__sinval;
  v144.origin.y = v114 + r1_16;
  v135.c = r1_8;
  v135.d = v26.__cosval;
  v135.tx = v126;
  v135.ty = v48;
  v134.a = v122;
  v134.b = v49;
  v134.c = -v26.__sinval;
  v134.d = v26.__cosval;
  v134.tx = v42;
  v134.ty = v124;
  v144.origin.x = v116;
  pageCurlMapInverse(v144.origin, &v135, &v134);
  v155.origin.x = v52;
  v155.origin.y = v53;
  v155.size.width = 0.0;
  v155.size.height = 0.0;
  v145.origin.y = y;
  v145.origin.x = x;
  v145.size.height = height;
  v145.size.width = width;
  v146 = CGRectUnion(v145, v155);
  v93 = v146.origin.y;
  v98 = v146.origin.x;
  v84 = v146.size.height;
  v88 = v146.size.width;
  v133.a = v120;
  v133.b = -v26.__sinval;
  v146.origin.x = v116 + r1_24;
  v133.c = r1_8;
  v133.d = v26.__cosval;
  v133.tx = v126;
  v133.ty = v112;
  v132.a = v122;
  v132.b = v118;
  v132.c = -v26.__sinval;
  v132.d = v26.__cosval;
  v132.tx = v42;
  v132.ty = v124;
  v146.origin.y = v114;
  pageCurlMapInverse(v146.origin, &v133, &v132);
  v156.origin.x = v54;
  v156.origin.y = v55;
  v156.size.width = 0.0;
  v156.size.height = 0.0;
  v147.origin.y = v93;
  v147.origin.x = v98;
  v147.size.height = v84;
  v147.size.width = v88;
  v148 = CGRectUnion(v147, v156);
  v94 = v148.origin.y;
  v99 = v148.origin.x;
  v85 = v148.size.height;
  v89 = v148.size.width;
  v131.a = v120;
  v131.b = -v26.__sinval;
  v131.c = r1_8;
  v131.d = v26.__cosval;
  v131.tx = v126;
  v131.ty = v112;
  v130.a = v122;
  v130.b = v118;
  v130.c = -v26.__sinval;
  v130.d = v26.__cosval;
  v130.tx = v42;
  v130.ty = v124;
  v148.origin.x = v116 + r1_24;
  v148.origin.y = v114 + r1_16;
  pageCurlMapInverse(v148.origin, &v131, &v130);
  v157.origin.x = v56;
  v157.origin.y = v57;
  v157.size.width = 0.0;
  v157.size.height = 0.0;
  v149.origin.y = v94;
  v149.origin.x = v99;
  v149.size.height = v85;
  v149.size.width = v89;
  v150 = CGRectUnion(v149, v157);
  v58 = v150.origin.x;
  v59 = v150.origin.y;
  v60 = v150.size.width;
  v61 = v150.size.height;
  v129.a = v120;
  r1 = -v26.__sinval;
  v129.b = -v26.__sinval;
  v129.c = r1_8;
  v129.d = v26.__cosval;
  v129.tx = v126;
  v129.ty = v112;
  v150.origin.y = v114;
  v150.origin.x = v116;
  v150.size.height = r1_16;
  v150.size.width = r1_24;
  v62 = CriticalPointsDOD(v150, &v129, &v140);
  if (v62 >= 1)
  {
    v63 = v62;
    p_y = &v140.y;
    do
    {
      v158.origin.x = *(p_y - 1);
      v158.origin.y = *p_y;
      v158.size.width = 0.0;
      v158.size.height = 0.0;
      v151.origin.x = v58;
      v151.origin.y = v59;
      v151.size.width = v60;
      v151.size.height = v61;
      v152 = CGRectUnion(v151, v158);
      v58 = v152.origin.x;
      v59 = v152.origin.y;
      v60 = v152.size.width;
      v61 = v152.size.height;
      p_y += 2;
      --v63;
    }
    while (v63);
  }
  r1_24a = -v27.__cosval;
  v115 = v103 + v100;
  v117 = v105 + v102;
  v104 = -v27.__sinval;
  -[CIImage extent](self->inputShadingImage, "extent");
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  -[CIImage extent](self->inputImage, "extent");
  v86 = v73;
  v90 = v74;
  v95 = v75;
  v101 = v76;
  v153.origin.x = v66;
  v153.origin.y = v68;
  v153.size.width = v70;
  v153.size.height = v72;
  if (CGRectIsEmpty(v153))
  {
    v77 = -[CIPageCurlTransition _CIPageCurlTransNoEmap](self, "_CIPageCurlTransNoEmap");
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __35__CIPageCurlTransition_outputImage__block_invoke;
    v128[3] = &__block_descriptor_240_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v128[4] = v120;
    *(double *)&v128[5] = -v26.__sinval;
    *(double *)&v128[6] = r1_8;
    v128[7] = *(_QWORD *)&v26.__cosval;
    *(double *)&v128[8] = v126;
    *(double *)&v128[9] = v112;
    *(double *)&v128[10] = v122;
    *(double *)&v128[11] = v118;
    *(double *)&v128[12] = -v26.__sinval;
    v128[13] = *(_QWORD *)&v26.__cosval;
    *(double *)&v128[14] = v119;
    *(double *)&v128[15] = v124;
    *(double *)&v128[16] = -v27.__cosval;
    *(double *)&v128[17] = -v27.__sinval;
    *(double *)&v128[18] = -v27.__sinval;
    v128[19] = *(_QWORD *)&v27.__cosval;
    *(double *)&v128[20] = v105 + v102;
    *(double *)&v128[21] = v115;
    v128[22] = v86;
    v128[23] = v90;
    v128[24] = v95;
    v128[25] = v101;
    *(CGFloat *)&v128[26] = v66;
    *(CGFloat *)&v128[27] = v68;
    *(CGFloat *)&v128[28] = v70;
    *(CGFloat *)&v128[29] = v72;
    v139[0] = self->inputImage;
    v139[1] = inputImage;
    v139[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
    v139[3] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v126, v112);
    v139[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v122, r1, v118, v26.__cosval);
    v139[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v119, v124);
    v139[6] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", r1_24a, v104, v104, v27.__cosval);
    v139[7] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v117, v115);
    v139[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v113);
    v78 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v139, 9);
    v79 = v128;
    v80 = v77;
  }
  else
  {
    v81 = -[CIPageCurlTransition _CIPageCurlTransition](self, "_CIPageCurlTransition");
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __35__CIPageCurlTransition_outputImage__block_invoke_2;
    v127[3] = &__block_descriptor_240_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v127[4] = v120;
    *(double *)&v127[5] = -v26.__sinval;
    *(double *)&v127[6] = r1_8;
    v127[7] = *(_QWORD *)&v26.__cosval;
    *(double *)&v127[8] = v126;
    *(double *)&v127[9] = v112;
    *(double *)&v127[10] = v122;
    *(double *)&v127[11] = v118;
    *(double *)&v127[12] = -v26.__sinval;
    v127[13] = *(_QWORD *)&v26.__cosval;
    *(double *)&v127[14] = v119;
    *(double *)&v127[15] = v124;
    *(double *)&v127[16] = -v27.__cosval;
    *(double *)&v127[17] = -v27.__sinval;
    *(double *)&v127[18] = -v27.__sinval;
    v127[19] = *(_QWORD *)&v27.__cosval;
    *(double *)&v127[20] = v105 + v102;
    *(double *)&v127[21] = v115;
    v127[22] = v86;
    v127[23] = v90;
    v127[24] = v95;
    v127[25] = v101;
    *(CGFloat *)&v127[26] = v66;
    *(CGFloat *)&v127[27] = v68;
    *(CGFloat *)&v127[28] = v70;
    *(CGFloat *)&v127[29] = v72;
    v138[0] = self->inputImage;
    v138[1] = inputImage;
    v138[2] = self->inputShadingImage;
    v138[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
    v138[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v126, v112);
    v138[5] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v122, r1, v118, v26.__cosval);
    v138[6] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v119, v124);
    v138[7] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", r1_24a, v104, v104, v27.__cosval);
    v138[8] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v117, v115);
    v138[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v113);
    v138[10] = v15;
    v78 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 11);
    v79 = v127;
    v80 = v81;
  }
  result = (id)objc_msgSend(v80, "applyWithExtent:roiCallback:arguments:", v79, v78, v58, v59, v60, v61);
  if (result)
  {
    if (self->inputTargetImage)
      return (id)-[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceOverCompositing"), CFSTR("inputImage"), result, CFSTR("inputBackgroundImage"), self->inputTargetImage, 0), "valueForKey:", CFSTR("outputImage"));
  }
  return result;
}

void __35__CIPageCurlTransition_outputImage__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  float64x2_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];
  _OWORD v13[3];
  float64x2_t v14[3];

  v6 = *(float64x2_t *)(a1 + 48);
  v14[0] = *(float64x2_t *)(a1 + 32);
  v14[1] = v6;
  v7 = *(_OWORD *)(a1 + 80);
  v14[2] = *(float64x2_t *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 112);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v10 = *(_OWORD *)(a1 + 160);
  v11 = *(_OWORD *)(a1 + 128);
  v12[1] = *(_OWORD *)(a1 + 144);
  v12[2] = v10;
  v12[0] = v11;
  pageCurlROI(a2, v14, (double *)v13, (double *)v12, a3, a4, a5, a6, *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
}

void __35__CIPageCurlTransition_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  float64x2_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];
  _OWORD v13[3];
  float64x2_t v14[3];

  v6 = *(float64x2_t *)(a1 + 48);
  v14[0] = *(float64x2_t *)(a1 + 32);
  v14[1] = v6;
  v7 = *(_OWORD *)(a1 + 80);
  v14[2] = *(float64x2_t *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 112);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v9;
  v10 = *(_OWORD *)(a1 + 160);
  v11 = *(_OWORD *)(a1 + 128);
  v12[1] = *(_OWORD *)(a1 + 144);
  v12[2] = v10;
  v12[0] = v11;
  pageCurlROI(a2, v14, (double *)v13, (double *)v12, a3, a4, a5, a6, *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryTransition");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("9");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A560;
  v6[1] = &unk_1E2F1A560;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A570;
  v6[3] = &unk_1E2F1A580;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputExtent");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeRectangle");
  v3[0] = CFSTR("CIAttributeType");
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 300.0, 300.0);
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
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

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIImage)inputBacksideImage
{
  return self->inputBacksideImage;
}

- (void)setInputBacksideImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
