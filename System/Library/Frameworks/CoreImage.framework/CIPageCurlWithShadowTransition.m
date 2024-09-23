@implementation CIPageCurlWithShadowTransition

- (id)_CIPageCurlWithShadowTransition
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_pageCurlWithShadowTransition);
}

- (id)_CIPageCurlNoShadowTransition
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_pageCurlNoShadowTransition);
}

- (id)outputImage
{
  double v3;
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
  double v16;
  double v17;
  double v18;
  double v19;
  CIImage *inputBacksideImage;
  double v21;
  CIImage *inputImage;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
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
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  __double2 v49;
  __double2 v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  int v80;
  uint64_t v81;
  CGFloat *p_y;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  double MinX;
  double MinY;
  double MaxX;
  void *v95;
  id v96;
  id result;
  CGFloat r1;
  CGFloat r1a;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat width;
  CGFloat v105;
  CGFloat v106;
  uint64_t v107;
  CGFloat v108;
  CGFloat y;
  CGFloat v110;
  CGFloat v111;
  uint64_t v112;
  CGFloat v113;
  CGFloat x;
  uint64_t v115;
  CGFloat v116;
  uint64_t v117;
  CGFloat v118;
  CIVector *v119;
  CIVector *v120;
  CGFloat height;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double c;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  _QWORD v155[26];
  _QWORD v156[26];
  CGAffineTransform v157;
  CGAffineTransform v158;
  CGAffineTransform v159;
  CGAffineTransform v160;
  CGAffineTransform v161;
  CGAffineTransform v162;
  CGAffineTransform v163;
  CGAffineTransform v164;
  CGAffineTransform v165;
  _QWORD v166[11];
  _QWORD v167[14];
  CGPoint v168;
  uint64_t v169;
  CGPoint v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;

  v169 = *MEMORY[0x1E0C80C00];
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  v153 = v3;
  -[NSNumber doubleValue](self->inputTime, "doubleValue");
  v149 = v4;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v147 = v5;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v7 = fmax(v6, 0.0);
  -[NSNumber doubleValue](self->inputShadowSize, "doubleValue");
  v9 = v8;
  -[NSNumber doubleValue](self->inputShadowAmount, "doubleValue");
  v11 = v10;
  -[CIImage extent](self->inputImage, "extent");
  v15 = v14;
  v16 = v12;
  v18 = v17;
  v19 = v7 * 0.0625;
  if (v7 >= 16.0)
    v19 = 1.0;
  v150 = v7;
  v151 = v19;
  inputBacksideImage = self->inputBacksideImage;
  v131 = v12;
  v133 = v15;
  v128 = v13;
  if (!inputBacksideImage
    || (v21 = v13, inputBacksideImage == +[CIImage emptyImage](CIImage, "emptyImage")))
  {
    v120 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.764706, 0.764706, 0.764706, 0.8);
    v119 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.701961, 0.701961, 0.701961, 1.0);
    inputImage = self->inputImage;
  }
  else
  {
    v120 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v119 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.701961, 0.701961, 0.701961, 1.0);
    inputImage = -[CIImage imageByCroppingToRect:](self->inputBacksideImage, "imageByCroppingToRect:", v15, v16, v21, v18);
  }
  v23 = fmax(v9, 0.01);
  v24 = fmax(v11, 0.0);
  -[CIVector X](self->inputExtent, "X");
  v26 = v25;
  -[CIVector Y](self->inputExtent, "Y");
  v28 = v27;
  -[CIVector Z](self->inputExtent, "Z");
  v30 = v29;
  -[CIVector W](self->inputExtent, "W");
  v32 = v31;
  v171.origin.x = v26;
  v171.origin.y = v28;
  v171.size.width = v30;
  v171.size.height = v32;
  v126 = v18;
  if (CGRectIsEmpty(v171))
  {
    -[CIImage extent](self->inputImage, "extent");
    v26 = v33;
    v144 = v34;
    v30 = v35;
    v32 = v36;
  }
  else
  {
    v144 = v28;
  }
  v140 = fmin(v23, 1.0);
  v138 = fmin(v24, 1.0);
  v142 = fmax(v149, 0.0);
  v37 = fmax(v147, 0.01);
  -[CIVector X](self->inputShadowExtent, "X");
  v39 = v38;
  -[CIVector Y](self->inputShadowExtent, "Y");
  v41 = v40;
  -[CIVector Z](self->inputShadowExtent, "Z");
  v43 = v42;
  -[CIVector W](self->inputShadowExtent, "W");
  v172.size.height = v44;
  v172.origin.x = v39;
  v122 = v43;
  v123 = v41;
  v172.origin.y = v41;
  v172.size.width = v43;
  height = v172.size.height;
  if (CGRectIsEmpty(v172))
  {
    -[CIImage extent](self->inputImage, "extent");
    v118 = v45;
    v122 = v47;
    v123 = v46;
    height = v48;
  }
  else
  {
    v118 = v39;
  }
  v125 = v140 * 0.3045;
  v130 = v151 * v138;
  v49 = __sincos_stret(v153);
  v50 = __sincos_stret(v153 + v153);
  v51 = -v49.__sinval;
  v52 = -(v49.__sinval * v144);
  v53 = v52 - v26 * v49.__cosval;
  v54 = v52 - (v30 + v26) * v49.__cosval;
  v55 = fmin(v53, v54);
  v56 = fmax(v53, v54);
  v57 = -(v49.__sinval * (v32 + v144));
  v58 = v57 - v26 * v49.__cosval;
  v59 = v57 - (v30 + v26) * v49.__cosval;
  v60 = fmax(fmax(v56, v58), v59);
  v61 = -(v60 - v142 * (v150 + v60 - fmin(fmin(v55, v58), v59)));
  v62 = v49.__sinval * (v26 + v30 * 0.5) - v49.__cosval * (v144 + v32 * 0.5);
  v152 = v61 / v37;
  v63 = v49.__sinval * v62 + v49.__cosval * v61;
  v124 = v62;
  v64 = v49.__sinval * v61 - v49.__cosval * v62;
  v65 = v63 + -(v49.__cosval * v37) * 0.5 * 3.14159265;
  v66 = v63;
  v145 = -(v49.__sinval * v37);
  v67 = v64 + v145 * 0.5 * 3.14159265;
  v148 = v65 + v50.__sinval * v67 + v50.__cosval * v65;
  v113 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v116 = *MEMORY[0x1E0C9D628];
  v103 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v108 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v165.a = -v49.__cosval / v37;
  v165.b = -v49.__sinval;
  v165.c = -v49.__sinval / v37;
  v136 = -(v49.__cosval * v37);
  c = v165.c;
  v165.d = v49.__cosval;
  v165.tx = v152;
  v165.ty = v62;
  v164.a = v136;
  v164.b = v145;
  v141 = -v50.__cosval;
  v143 = v67 + v50.__sinval * v65 - v50.__cosval * v67;
  v164.c = -v49.__sinval;
  v164.d = v49.__cosval;
  v135 = -v50.__sinval;
  v164.tx = v63;
  v146 = v63;
  v164.ty = v64;
  v154 = v64;
  v170.y = v131;
  v170.x = v133;
  pageCurlMapInverse(v170, &v165, &v164);
  v189.origin.x = v68;
  v189.origin.y = v69;
  v189.size.width = 0.0;
  v189.size.height = 0.0;
  v173.origin.y = v113;
  v173.origin.x = v116;
  v173.size.height = v103;
  v173.size.width = v108;
  v174 = CGRectUnion(v173, v189);
  y = v174.origin.y;
  x = v174.origin.x;
  v100 = v174.size.height;
  width = v174.size.width;
  v139 = -v49.__cosval / v37;
  v163.a = v139;
  v163.b = -v49.__sinval;
  v174.origin.y = v131 + v126;
  v163.c = -v49.__sinval / v37;
  v163.d = v49.__cosval;
  v163.tx = v152;
  v163.ty = v124;
  v162.a = v136;
  v162.b = v145;
  v162.c = -v49.__sinval;
  v162.d = v49.__cosval;
  v162.tx = v66;
  v162.ty = v64;
  v174.origin.x = v133;
  pageCurlMapInverse(v174.origin, &v163, &v162);
  v190.origin.x = v70;
  v190.origin.y = v71;
  v190.size.width = 0.0;
  v190.size.height = 0.0;
  v175.origin.y = y;
  v175.origin.x = x;
  v175.size.height = v100;
  v175.size.width = width;
  v176 = CGRectUnion(v175, v190);
  v105 = v176.origin.y;
  v110 = v176.origin.x;
  v101 = v176.size.width;
  r1 = v176.size.height;
  v161.a = v139;
  v161.b = -v49.__sinval;
  v176.origin.x = v133 + v128;
  v161.c = -v49.__sinval / v37;
  v161.d = v49.__cosval;
  v161.tx = v152;
  v161.ty = v124;
  v160.a = v136;
  v160.b = v145;
  v160.c = -v49.__sinval;
  v160.d = v49.__cosval;
  v160.tx = v146;
  v160.ty = v64;
  v176.origin.y = v131;
  pageCurlMapInverse(v176.origin, &v161, &v160);
  v191.origin.x = v72;
  v191.origin.y = v73;
  v191.size.width = 0.0;
  v191.size.height = 0.0;
  v177.origin.y = v105;
  v177.origin.x = v110;
  v177.size.width = v101;
  v177.size.height = r1;
  v178 = CGRectUnion(v177, v191);
  v106 = v178.origin.y;
  v111 = v178.origin.x;
  v102 = v178.size.width;
  r1a = v178.size.height;
  v159.a = v139;
  v159.b = -v49.__sinval;
  v159.c = -v49.__sinval / v37;
  v159.d = v49.__cosval;
  v159.tx = v152;
  v159.ty = v124;
  v158.a = v136;
  v158.b = v145;
  v158.c = -v49.__sinval;
  v158.d = v49.__cosval;
  v158.tx = v146;
  v158.ty = v64;
  v178.origin.x = v133 + v128;
  v178.origin.y = v131 + v126;
  pageCurlMapInverse(v178.origin, &v159, &v158);
  v192.origin.x = v74;
  v192.origin.y = v75;
  v192.size.width = 0.0;
  v192.size.height = 0.0;
  v179.origin.y = v106;
  v179.origin.x = v111;
  v179.size.width = v102;
  v179.size.height = r1a;
  v180 = CGRectUnion(v179, v192);
  v76 = v180.origin.x;
  v77 = v180.origin.y;
  v78 = v180.size.width;
  v79 = v180.size.height;
  v157.a = v139;
  v157.b = -v49.__sinval;
  v157.c = c;
  v157.d = v49.__cosval;
  v157.tx = v152;
  v157.ty = v124;
  v180.origin.y = v131;
  v180.origin.x = v133;
  v180.size.height = v126;
  v180.size.width = v128;
  v80 = CriticalPointsDOD(v180, &v157, &v168);
  if (v80 >= 1)
  {
    v81 = v80;
    p_y = &v168.y;
    do
    {
      v193.origin.x = *(p_y - 1);
      v193.origin.y = *p_y;
      v193.size.width = 0.0;
      v193.size.height = 0.0;
      v181.origin.x = v76;
      v181.origin.y = v77;
      v181.size.width = v78;
      v181.size.height = v79;
      v182 = CGRectUnion(v181, v193);
      v76 = v182.origin.x;
      v77 = v182.origin.y;
      v78 = v182.size.width;
      v79 = v182.size.height;
      p_y += 2;
      --v81;
    }
    while (v81);
  }
  v183.origin.x = v76;
  v183.origin.y = v77;
  v183.size.width = v78;
  v183.size.height = v79;
  v184 = CGRectInset(v183, -(v150 * v125) - v150 * v125, -(v150 * v125) - v150 * v125);
  v132 = v184.origin.y;
  v134 = v184.origin.x;
  v127 = v184.size.height;
  v129 = v184.size.width;
  -[CIImage extent](self->inputImage, "extent");
  v84 = v83;
  v115 = v85;
  v117 = v83;
  v86 = v85;
  v88 = v87;
  v107 = v89;
  v112 = v87;
  v90 = v89;
  v91 = -[CIPageCurlWithShadowTransition _CIPageCurlWithShadowTransition](self, "_CIPageCurlWithShadowTransition");
  v156[0] = MEMORY[0x1E0C809B0];
  v156[1] = 3221225472;
  v156[2] = __45__CIPageCurlWithShadowTransition_outputImage__block_invoke;
  v156[3] = &__block_descriptor_208_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v156[4] = v139;
  *(double *)&v156[5] = -v49.__sinval;
  *(double *)&v156[6] = c;
  v156[7] = *(_QWORD *)&v49.__cosval;
  *(double *)&v156[8] = v152;
  *(double *)&v156[9] = v124;
  *(double *)&v156[10] = v136;
  *(double *)&v156[11] = v145;
  *(double *)&v156[12] = -v49.__sinval;
  v156[13] = *(_QWORD *)&v49.__cosval;
  *(double *)&v156[14] = v146;
  *(double *)&v156[15] = v154;
  *(double *)&v156[16] = -v50.__cosval;
  *(double *)&v156[17] = -v50.__sinval;
  *(double *)&v156[18] = -v50.__sinval;
  v156[19] = *(_QWORD *)&v50.__cosval;
  *(double *)&v156[20] = v148;
  *(double *)&v156[21] = v143;
  v156[22] = v84;
  v156[23] = v86;
  v156[24] = v88;
  v156[25] = v90;
  v167[0] = self->inputImage;
  v167[1] = inputImage;
  v167[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v139, c, v51, v49.__cosval);
  v167[3] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v152, v124);
  v167[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v136, v51, v145, v49.__cosval);
  v167[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v146, v154);
  v167[6] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v141, v135, v135, v50.__cosval);
  v167[7] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v148, v143);
  v167[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v150);
  v185.origin.x = v118;
  v185.origin.y = v123;
  v185.size.width = v122;
  v185.size.height = height;
  MinX = CGRectGetMinX(v185);
  v186.origin.x = v118;
  v186.origin.y = v123;
  v186.size.width = v122;
  v186.size.height = height;
  MinY = CGRectGetMinY(v186);
  v187.origin.x = v118;
  v187.origin.y = v123;
  v187.size.width = v122;
  v187.size.height = height;
  MaxX = CGRectGetMaxX(v187);
  v188.origin.x = v118;
  v188.origin.y = v123;
  v188.size.width = v122;
  v188.size.height = height;
  v167[9] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", MinX, MinY, MaxX, CGRectGetMaxY(v188));
  v167[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v125);
  v167[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v130);
  v167[12] = v120;
  v167[13] = v119;
  v95 = (void *)objc_msgSend(v91, "applyWithExtent:roiCallback:arguments:", v156, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 14), v134, v132, v129, v127);
  v96 = -[CIPageCurlWithShadowTransition _CIPageCurlNoShadowTransition](self, "_CIPageCurlNoShadowTransition");
  v155[0] = MEMORY[0x1E0C809B0];
  v155[1] = 3221225472;
  v155[2] = __45__CIPageCurlWithShadowTransition_outputImage__block_invoke_2;
  v155[3] = &__block_descriptor_208_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v155[4] = v139;
  *(double *)&v155[5] = -v49.__sinval;
  *(double *)&v155[6] = c;
  v155[7] = *(_QWORD *)&v49.__cosval;
  *(double *)&v155[8] = v152;
  *(double *)&v155[9] = v124;
  *(double *)&v155[10] = v136;
  *(double *)&v155[11] = v145;
  *(double *)&v155[12] = -v49.__sinval;
  v155[13] = *(_QWORD *)&v49.__cosval;
  *(double *)&v155[14] = v146;
  *(double *)&v155[15] = v154;
  *(double *)&v155[16] = -v50.__cosval;
  *(double *)&v155[17] = -v50.__sinval;
  *(double *)&v155[18] = -v50.__sinval;
  v155[19] = *(_QWORD *)&v50.__cosval;
  *(double *)&v155[20] = v148;
  *(double *)&v155[21] = v143;
  v155[22] = v117;
  v155[23] = v115;
  v155[24] = v112;
  v155[25] = v107;
  v166[0] = self->inputImage;
  v166[1] = inputImage;
  v166[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
  v166[3] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v152, v124);
  v166[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v136, v51, v145, v49.__cosval);
  v166[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v146, v154);
  v166[6] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v141, v135, v135, v50.__cosval);
  v166[7] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v148, v143);
  v166[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v150);
  v166[9] = v120;
  v166[10] = v119;
  result = (id)objc_msgSend(v96, "applyWithExtent:roiCallback:arguments:", v155, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 11), v134, v132, v129, v127);
  if (v130 > 0.001)
    result = v95;
  if (result)
  {
    if (self->inputTargetImage)
      return (id)-[CIFilter valueForKey:](+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CISourceOverCompositing"), CFSTR("inputImage"), 0.001, v130, result, CFSTR("inputBackgroundImage"), self->inputTargetImage, 0), "valueForKey:", CFSTR("outputImage"));
  }
  return result;
}

void __45__CIPageCurlWithShadowTransition_outputImage__block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
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

void __45__CIPageCurlWithShadowTransition_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
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
  uint64_t v3;
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[10];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryTransition");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("9");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.9");
  v14[3] = CFSTR("inputRadius");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1A560;
  v12[1] = &unk_1E2F1A560;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1A570;
  v12[3] = &unk_1E2F1A580;
  v11[4] = CFSTR("CIAttributeType");
  v12[4] = CFSTR("CIAttributeTypeDistance");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v14[4] = CFSTR("inputShadowSize");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1A590;
  v10[1] = &unk_1E2F1A590;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1A5A0;
  v10[3] = &unk_1E2F1A5A0;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1A5B0;
  v10[5] = CFSTR("CIAttributeTypeDistance");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v14[5] = CFSTR("inputShadowAmount");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1A590;
  v8[1] = &unk_1E2F1A590;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1A5A0;
  v8[3] = &unk_1E2F1A5A0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1A5C0;
  v8[5] = CFSTR("CIAttributeTypeDistance");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v14[6] = CFSTR("inputShadowExtent");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeRectangle");
  v5[0] = CFSTR("CIAttributeType");
  v6[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputExtent");
  v4[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0, CFSTR("CIAttributeType"), CFSTR("CIAttributeDefault"), CFSTR("CIAttributeTypeRectangle"));
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
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

@end
