@implementation CIConvolution

- (int)samplesPerPass
{
  return 8;
}

- (id)_CIConvolutionAdd_1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_1);
}

- (id)_CIConvolutionAdd_2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_2);
}

- (id)_CIConvolutionAdd_3
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_3);
}

- (id)_CIConvolutionAdd_4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_4);
}

- (id)_CIConvolutionAdd_5
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_5);
}

- (id)_CIConvolutionAdd_6
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_6);
}

- (id)_CIConvolutionAdd_7
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_7);
}

- (id)_CIConvolutionAdd_8
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_convolutionAdd_8);
}

- (id)doConvolutionPass:(id)a3 weights:(id)a4 sums:(id)a5
{
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
  double v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id result;
  float v38;
  double v39;
  float v40;
  CIVector *v41;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  float v47;
  double v48;
  float v49;
  double v50;
  float v51;
  CIVector *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CIVector *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CIVector *v72;
  float v73;
  double v74;
  float v75;
  double v76;
  float v77;
  double v78;
  float v79;
  CIVector *v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CIVector *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  CIVector *v100;
  float v101;
  double v102;
  float v103;
  double v104;
  float v105;
  double v106;
  float v107;
  CIVector *v108;
  uint64_t v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  CGFloat v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  CIVector *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  CIVector *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  CIVector *v137;
  float v138;
  double v139;
  float v140;
  double v141;
  float v142;
  double v143;
  float v144;
  CIVector *v145;
  float v146;
  double v147;
  float v148;
  CIVector *v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  CIVector *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  CIVector *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  CIVector *v177;
  float v178;
  double v179;
  float v180;
  double v181;
  float v182;
  double v183;
  float v184;
  CIVector *v185;
  float v186;
  double v187;
  float v188;
  double v189;
  float v190;
  CIVector *v191;
  CGFloat v192;
  CGFloat v193;
  CGFloat v194;
  CGFloat v195;
  CIImage *inputImage;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  CIVector *v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  CIVector *v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  CIVector *v227;
  float v228;
  double v229;
  float v230;
  double v231;
  float v232;
  double v233;
  float v234;
  CIVector *v235;
  float v236;
  double v237;
  float v238;
  double v239;
  float v240;
  double v241;
  float v242;
  CIVector *v243;
  CGFloat v244;
  CGFloat v245;
  CGFloat v246;
  CGFloat v247;
  CIVector *v248;
  id v249;
  _QWORD v250[5];
  _QWORD v251[5];
  _QWORD v252[5];
  _QWORD v253[5];
  _QWORD v254[5];
  _QWORD v255[5];
  _QWORD v256[5];
  _QWORD v257[5];
  _QWORD v258[8];
  _QWORD v259[8];
  _QWORD v260[7];
  _QWORD v261[7];
  _QWORD v262[5];
  _QWORD v263[6];
  _QWORD v264[5];
  _QWORD v265[6];
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;

  v265[4] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = boundsForPointArray((NSArray *)a3);
  v266.origin.x = v10 - (v17 + v18);
  v266.size.width = v14 + v18;
  v266.origin.y = v12 - (v19 + v20);
  v266.size.height = v16 + v20;
  v267 = CGRectIntegral(v266);
  x = v267.origin.x;
  y = v267.origin.y;
  width = v267.size.width;
  height = v267.size.height;
  switch(objc_msgSend(a3, "count"))
  {
    case 1u:
      v25 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v284.origin.x = v26;
      v284.origin.y = v27;
      v284.size.width = v28;
      v284.size.height = v29;
      v268.origin.x = x;
      v268.origin.y = y;
      v268.size.width = width;
      v268.size.height = height;
      v269 = CGRectUnion(v268, v284);
      v30 = v269.origin.x;
      v31 = v269.origin.y;
      v32 = v269.size.width;
      v33 = v269.size.height;
      v257[0] = MEMORY[0x1E0C809B0];
      v257[1] = 3221225472;
      v257[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke;
      v257[3] = &unk_1E2EC3588;
      v257[4] = a3;
      v265[0] = self->inputImage;
      v265[1] = a5;
      v265[2] = objc_msgSend(a3, "objectAtIndex:", 0);
      v265[3] = objc_msgSend(a4, "objectAtIndex:", 0);
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v265, 4);
      v35 = v257;
      v36 = (void *)v25;
      goto LABEL_12;
    case 2u:
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v39 = v38;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v41 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v39, v40);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v285.origin.x = v43;
      v285.origin.y = v44;
      v285.size.width = v45;
      v285.size.height = v46;
      v270.origin.x = x;
      v270.origin.y = y;
      v270.size.width = width;
      v270.size.height = height;
      v271 = CGRectUnion(v270, v285);
      v30 = v271.origin.x;
      v31 = v271.origin.y;
      v32 = v271.size.width;
      v33 = v271.size.height;
      v256[0] = MEMORY[0x1E0C809B0];
      v256[1] = 3221225472;
      v256[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_2;
      v256[3] = &unk_1E2EC3588;
      v256[4] = a3;
      v264[0] = self->inputImage;
      v264[1] = a5;
      v264[2] = objc_msgSend(a3, "objectAtIndex:", 0);
      v264[3] = objc_msgSend(a3, "objectAtIndex:", 1);
      v264[4] = v41;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v264, 5);
      v35 = v256;
      goto LABEL_11;
    case 3u:
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v48 = v47;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v50 = v49;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v52 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v48, v50, v51);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v286.origin.x = v53;
      v286.origin.y = v54;
      v286.size.width = v55;
      v286.size.height = v56;
      v272.origin.x = x;
      v272.origin.y = y;
      v272.size.width = width;
      v272.size.height = height;
      v273 = CGRectUnion(v272, v286);
      v30 = v273.origin.x;
      v31 = v273.origin.y;
      v32 = v273.size.width;
      v33 = v273.size.height;
      v255[0] = MEMORY[0x1E0C809B0];
      v255[1] = 3221225472;
      v255[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_3;
      v255[3] = &unk_1E2EC3588;
      v255[4] = a3;
      v263[0] = self->inputImage;
      v263[1] = a5;
      v263[2] = objc_msgSend(a3, "objectAtIndex:", 0);
      v263[3] = objc_msgSend(a3, "objectAtIndex:", 1);
      v263[4] = objc_msgSend(a3, "objectAtIndex:", 2);
      v263[5] = v52;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v263, 6);
      v35 = v255;
      goto LABEL_11;
    case 4u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      v58 = v57;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      v60 = v59;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      v62 = v61;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v64 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v58, v60, v62, v63);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      v66 = v65;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      v68 = v67;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      v70 = v69;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v72 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v66, v68, v70, v71);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v74 = v73;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v76 = v75;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v78 = v77;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v80 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v74, v76, v78, v79);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v287.origin.x = v81;
      v287.origin.y = v82;
      v287.size.width = v83;
      v287.size.height = v84;
      v274.origin.x = x;
      v274.origin.y = y;
      v274.size.width = width;
      v274.size.height = height;
      v275 = CGRectUnion(v274, v287);
      v30 = v275.origin.x;
      v31 = v275.origin.y;
      v32 = v275.size.width;
      v33 = v275.size.height;
      v254[0] = MEMORY[0x1E0C809B0];
      v254[1] = 3221225472;
      v254[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_4;
      v254[3] = &unk_1E2EC3588;
      v254[4] = a3;
      v262[0] = self->inputImage;
      v262[1] = a5;
      v262[2] = v64;
      v262[3] = v72;
      v262[4] = v80;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v262, 5);
      v35 = v254;
      goto LABEL_11;
    case 5u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      v86 = v85;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      v88 = v87;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      v90 = v89;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v92 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v86, v88, v90, v91);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      v94 = v93;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      v96 = v95;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      v98 = v97;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v100 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v94, v96, v98, v99);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v102 = v101;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v104 = v103;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v106 = v105;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v108 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v102, v104, v106, v107);
      v109 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v288.origin.x = v110;
      v288.origin.y = v111;
      v288.size.width = v112;
      v288.size.height = v113;
      v276.origin.x = x;
      v276.origin.y = y;
      v276.size.width = width;
      v276.size.height = height;
      v277 = CGRectUnion(v276, v288);
      v30 = v277.origin.x;
      v31 = v277.origin.y;
      v32 = v277.size.width;
      v33 = v277.size.height;
      v253[0] = MEMORY[0x1E0C809B0];
      v253[1] = 3221225472;
      v253[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_5;
      v253[3] = &unk_1E2EC3588;
      v253[4] = a3;
      v261[0] = self->inputImage;
      v261[1] = a5;
      v261[2] = v92;
      v261[3] = v100;
      v261[4] = objc_msgSend(a3, "objectAtIndex:", 4);
      v261[5] = v108;
      v261[6] = objc_msgSend(a4, "objectAtIndex:", 4);
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v261, 7);
      v35 = v253;
      v36 = (void *)v109;
      goto LABEL_12;
    case 6u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      v115 = v114;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      v117 = v116;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      v119 = v118;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v121 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v115, v117, v119, v120);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      v123 = v122;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      v125 = v124;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      v127 = v126;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v129 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v123, v125, v127, v128);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      v131 = v130;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      v133 = v132;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      v135 = v134;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v137 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v131, v133, v135, v136);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v139 = v138;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v141 = v140;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v143 = v142;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v145 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v139, v141, v143, v144);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      v147 = v146;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      v149 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v147, v148);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v289.origin.x = v150;
      v289.origin.y = v151;
      v289.size.width = v152;
      v289.size.height = v153;
      v278.origin.x = x;
      v278.origin.y = y;
      v278.size.width = width;
      v278.size.height = height;
      v279 = CGRectUnion(v278, v289);
      v30 = v279.origin.x;
      v31 = v279.origin.y;
      v32 = v279.size.width;
      v33 = v279.size.height;
      v252[0] = MEMORY[0x1E0C809B0];
      v252[1] = 3221225472;
      v252[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_6;
      v252[3] = &unk_1E2EC3588;
      v252[4] = a3;
      v260[0] = self->inputImage;
      v260[1] = a5;
      v260[2] = v121;
      v260[3] = v129;
      v260[4] = v137;
      v260[5] = v145;
      v260[6] = v149;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v260, 7);
      v35 = v252;
      goto LABEL_11;
    case 7u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      v155 = v154;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      v157 = v156;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      v159 = v158;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v161 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v155, v157, v159, v160);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      v163 = v162;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      v165 = v164;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      v167 = v166;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v169 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v163, v165, v167, v168);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      v171 = v170;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      v173 = v172;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      v175 = v174;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v177 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v171, v173, v175, v176);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v179 = v178;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v181 = v180;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v183 = v182;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v185 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v179, v181, v183, v184);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      v187 = v186;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      v189 = v188;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      v191 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v187, v189, v190);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(a5, "extent");
      v290.origin.x = v192;
      v290.origin.y = v193;
      v290.size.width = v194;
      v290.size.height = v195;
      v280.origin.x = x;
      v280.origin.y = y;
      v280.size.width = width;
      v280.size.height = height;
      v281 = CGRectUnion(v280, v290);
      v30 = v281.origin.x;
      v31 = v281.origin.y;
      v32 = v281.size.width;
      v33 = v281.size.height;
      v251[0] = MEMORY[0x1E0C809B0];
      v251[1] = 3221225472;
      v251[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_7;
      v251[3] = &unk_1E2EC3588;
      inputImage = self->inputImage;
      v251[4] = a3;
      v259[0] = inputImage;
      v259[1] = a5;
      v259[2] = v161;
      v259[3] = v169;
      v259[4] = v177;
      v259[5] = objc_msgSend(a3, "objectAtIndex:", 6);
      v259[6] = v185;
      v259[7] = v191;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v259, 8);
      v35 = v251;
      goto LABEL_11;
    case 8u:
      v249 = a5;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      v198 = v197;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      v200 = v199;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      v202 = v201;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v248 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v198, v200, v202, v203);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      v205 = v204;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      v207 = v206;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      v209 = v208;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v211 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v205, v207, v209, v210);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      v213 = v212;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      v215 = v214;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      v217 = v216;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v219 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v213, v215, v217, v218);
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 6), "X");
      v221 = v220;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 6), "Y");
      v223 = v222;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 7), "X");
      v225 = v224;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 7), "Y");
      v227 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v221, v223, v225, v226);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      v229 = v228;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v231 = v230;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v233 = v232;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v235 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v229, v231, v233, v234);
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      v237 = v236;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      v239 = v238;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      v241 = v240;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 7), "floatValue");
      v243 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v237, v239, v241, v242);
      v42 = -[CIConvolution _CIConvolutionAdd](self, "_CIConvolutionAdd");
      objc_msgSend(v249, "extent");
      v291.origin.x = v244;
      v291.origin.y = v245;
      v291.size.width = v246;
      v291.size.height = v247;
      v282.origin.x = x;
      v282.origin.y = y;
      v282.size.width = width;
      v282.size.height = height;
      v283 = CGRectUnion(v282, v291);
      v30 = v283.origin.x;
      v31 = v283.origin.y;
      v32 = v283.size.width;
      v33 = v283.size.height;
      v250[0] = MEMORY[0x1E0C809B0];
      v250[1] = 3221225472;
      v250[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_8;
      v250[3] = &unk_1E2EC3588;
      v250[4] = a3;
      v258[0] = self->inputImage;
      v258[1] = v249;
      v258[2] = v248;
      v258[3] = v211;
      v258[4] = v219;
      v258[5] = v227;
      v258[6] = v235;
      v258[7] = v243;
      v34 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v258, 8);
      v35 = v250;
LABEL_11:
      v36 = (void *)v42;
LABEL_12:
      result = (id)objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", v35, v34, v30, v31, v32, v33);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_3(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_4(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_5(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_6(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_7(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_8(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

- (id)outputImage
{
  int v3;
  int v4;
  BOOL v5;
  CIImage *v6;
  uint64_t v7;
  int v8;
  int v9;

  v3 = -[NSArray count](self->inputPoints, "count");
  v4 = -[NSArray count](self->inputWeights, "count");
  if (v3)
    v5 = v4 == v3;
  else
    v5 = 0;
  if (!v5)
    return 0;
  v6 = +[CIImage emptyImage](CIImage, "emptyImage");
  if (v3 >= 1)
  {
    v7 = 0;
    v8 = v3;
    do
    {
      v9 = v8 - 8;
      if (v8 >= 8)
        v8 = 8;
      v6 = -[CIConvolution doConvolutionPass:weights:sums:](self, "doConvolutionPass:weights:sums:", -[NSArray subarrayWithRange:](self->inputPoints, "subarrayWithRange:", v7, v8), -[NSArray subarrayWithRange:](self->inputWeights, "subarrayWithRange:", v7, v8), v6);
      v7 += 8;
      v8 = v9;
    }
    while ((int)v7 < v3);
  }
  return v6;
}

@end
