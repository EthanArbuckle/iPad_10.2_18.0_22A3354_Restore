@implementation RAWProfileGainTableMap

- (id)gainImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSData *inputGainData;
  uint64_t v18;
  const char *v19;
  void *v20;
  NSData *v21;
  NSData *v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  _QWORD v28[4];
  NSData *v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_unsignedLongValue(self->inputMapPointsH, a2, v2, v3, v4);
  v11 = objc_msgSend_unsignedLongValue(self->inputMapPointsV, v7, v8, v9, v10);
  v16 = objc_msgSend_unsignedLongValue(self->inputMapPointsN, v12, v13, v14, v15) * v6;
  inputGainData = self->inputGainData;
  v18 = *MEMORY[0x1E0C9E150];
  v31[0] = *MEMORY[0x1E0C9E148];
  v31[1] = v18;
  v32[0] = inputGainData;
  v32[1] = CFSTR("RAWProfileGainTableMap");
  v31[2] = *MEMORY[0x1E0C9E108];
  v32[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v32, (uint64_t)v31, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->inputGainData;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_1D533E1A4;
  v28[3] = &unk_1E9980850;
  v29 = v21;
  v30 = 4 * v16;
  v22 = v21;
  v23 = (void *)MEMORY[0x1D82721B4](v28);
  v24 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  v26 = (void *)objc_msgSend_initWithImageProvider_width_height_format_colorSpace_options_(v24, v25, (uint64_t)v23, v16, v11, *MEMORY[0x1E0C9E098], 0, v20);

  return v26;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double x;
  double y;
  double width;
  double height;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CIImage *inputImage;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CIImage *v81;
  double v83;
  NSObject *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  CIImage *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id inputColorSpace;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  double v166;
  void *v167;
  void *v168;
  void (**v169)(void);
  double v170;
  void *v171;
  double v172;
  void *v173;
  _QWORD v174[4];
  CGAffineTransform v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD v179[5];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v182;
  CGAffineTransform v183;
  CGAffineTransform v184;
  CGAffineTransform v185;
  CGAffineTransform v186;
  _QWORD v187[10];
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;

  v187[8] = *MEMORY[0x1E0C80C00];
  if (qword_1EFF326F8 != -1)
    dispatch_once(&qword_1EFF326F8, &unk_1E9980870);
  if (!qword_1EFF32700)
  {
    sub_1D540E8A0();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_1D54444E8(v64, v65, v66, v67, v68, v69, v70, v71);

    inputImage = self->inputImage;
    goto LABEL_21;
  }
  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  x = v188.origin.x;
  y = v188.origin.y;
  width = v188.size.width;
  height = v188.size.height;
  if (CGRectIsEmpty(v188))
    goto LABEL_20;
  v189.origin.x = x;
  v189.origin.y = y;
  v189.size.width = width;
  v189.size.height = height;
  if (CGRectIsInfinite(v189))
    goto LABEL_20;
  objc_msgSend_floatValue(self->inputStrength, v10, v11, v12, v13);
  if (fminf(fmaxf(v14, 0.0), 1.0) <= 0.0)
    goto LABEL_20;
  v190.origin.x = x;
  v190.origin.y = y;
  v190.size.width = width;
  v190.size.height = height;
  if (CGRectIsEmpty(v190)
    || (v191.origin.x = x, v191.origin.y = y, v191.size.width = width, v191.size.height = height, CGRectIsInfinite(v191)))
  {
LABEL_20:
    inputImage = self->inputImage;
LABEL_21:
    v81 = inputImage;
    return v81;
  }
  v19 = objc_msgSend_unsignedLongValue(self->inputMapPointsH, v15, v16, v17, v18);
  v24 = objc_msgSend_unsignedLongValue(self->inputMapPointsV, v20, v21, v22, v23);
  v29 = objc_msgSend_unsignedLongValue(self->inputMapPointsN, v25, v26, v27, v28);
  objc_msgSend_doubleValue(self->inputMapSpacingH, v30, v31, v32, v33);
  v35 = v34;
  objc_msgSend_doubleValue(self->inputMapSpacingV, v36, v37, v38, v39);
  v41 = v40;
  objc_msgSend_doubleValue(self->inputMapOriginH, v42, v43, v44, v45);
  v47 = v46;
  objc_msgSend_doubleValue(self->inputMapOriginV, v48, v49, v50, v51);
  v57 = v24 * v19 * v29;
  if (!v57
    || (v58 = v56, !objc_msgSend_length(self->inputGainData, v52, v53, v54, v55))
    || objc_msgSend_length(self->inputGainData, v59, v60, v61, v62) != 4 * v57)
  {
    sub_1D540E8A0();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      sub_1D544451C(v73, v74, v75, v76, v77, v78, v79, v80);

    goto LABEL_20;
  }
  v172 = v47;
  v63 = (double)(unint64_t)v19;
  if (v35 <= 1.0)
  {
    v170 = v35;
  }
  else
  {
    v170 = 1.0 / v63;
    v172 = 0.5 / v63;
  }
  v83 = (double)(unint64_t)v24;
  if (v41 > 1.0)
  {
    v41 = 1.0 / v83;
    v58 = 0.5 / v83;
  }
  memset(&v186, 0, sizeof(v186));
  v185.a = v170 * v63;
  v185.b = 0.0;
  v185.c = 0.0;
  v166 = 1.0 - (v58 + v41 * (double)(unint64_t)(v24 - 1));
  v185.d = v41 * v83;
  v185.tx = v172 - v170 * 0.5;
  v185.ty = v166 - v41 * 0.5;
  CGAffineTransformInvert(&v186, &v185);
  memset(&v185, 0, sizeof(v185));
  CGAffineTransformMakeScale(&v185, 1.0 / width, 1.0 / height);
  memset(&v184, 0, sizeof(v184));
  CGAffineTransformMakeScale(&v184, (double)(unint64_t)v19, (double)(unint64_t)v24);
  memset(&v183, 0, sizeof(v183));
  t1 = v185;
  t2 = v186;
  CGAffineTransformConcat(&v182, &t1, &t2);
  t1 = v184;
  CGAffineTransformConcat(&v183, &v182, &t1);
  sub_1D52EB19C();
  v84 = objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v84))
  {
    LOWORD(t1.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v85, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWProfileGainTableMap", (const char *)&unk_1D548AF1A, (uint8_t *)&t1, 2u);
  }

  v179[0] = MEMORY[0x1E0C809B0];
  v179[1] = 3221225472;
  v179[2] = sub_1D533E988;
  v179[3] = &unk_1E996F870;
  v179[4] = self;
  v169 = (void (**)(void))MEMORY[0x1D82721B4](v179);
  objc_msgSend_gainImage(self, v86, v87, v88, v89);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v90, v91, v92, v93, width * v172, height * v166, width * v170, height * v41);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_valueAtIndex_(self->inputWeights, v95, 0, v96, v97);
  v99 = v98;
  objc_msgSend_valueAtIndex_(self->inputWeights, v100, 1, v101, v102);
  v104 = v103;
  objc_msgSend_valueAtIndex_(self->inputWeights, v105, 2, v106, v107);
  objc_msgSend_vectorWithX_Y_Z_(v94, v108, v109, v110, v111, v99, v104, v112);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_valueAtIndex_(self->inputWeights, v114, 3, v115, v116);
  v118 = v117;
  objc_msgSend_valueAtIndex_(self->inputWeights, v119, 4, v120, v121);
  objc_msgSend_vectorWithX_Y_(v113, v122, v123, v124, v125, v118, v126);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v127, v128, v129, v130, (double)(unint64_t)v19, (double)(unint64_t)v24, (double)(unint64_t)v29);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = self->inputImage;
  v137 = v132;
  inputColorSpace = self->inputColorSpace;
  if (inputColorSpace)
  {
    objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v132, v133, (uint64_t)self->inputColorSpace, v135, v136);
    v139 = objc_claimAutoreleasedReturnValue();

    v137 = (void *)v139;
  }
  v140 = (void *)qword_1EFF32700;
  v174[0] = MEMORY[0x1E0C809B0];
  v174[1] = 3221225472;
  v174[2] = sub_1D533EA0C;
  v174[3] = &unk_1E9980890;
  v175 = v183;
  v176 = v19;
  v177 = v24;
  v178 = v29;
  v187[0] = v137;
  v187[1] = v168;
  v187[2] = v173;
  v187[3] = v131;
  v187[4] = v171;
  v187[5] = v167;
  v141 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(self->inputGamma, v133, v134, v135, v136);
  objc_msgSend_numberWithFloat_(v141, v142, v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v187[6] = v146;
  v147 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(self->inputStrength, v148, v149, v150, v151);
  objc_msgSend_numberWithFloat_(v147, v152, v153, v154, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v187[7] = v156;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v157, (uint64_t)v187, 8, v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_roiCallback_arguments_(v140, v160, (uint64_t)v174, (uint64_t)v159, v161, x, y, width, height);
  v81 = (CIImage *)objc_claimAutoreleasedReturnValue();

  if (inputColorSpace)
  {
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v81, v162, (uint64_t)inputColorSpace, v163, v164);
    v165 = objc_claimAutoreleasedReturnValue();

    v81 = (CIImage *)v165;
  }

  v169[2]();
  return v81;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputStrength, 0);
  objc_storeStrong((id *)&self->inputGamma, 0);
  objc_storeStrong((id *)&self->inputGainData, 0);
  objc_storeStrong((id *)&self->inputWeights, 0);
  objc_storeStrong((id *)&self->inputMapPointsN, 0);
  objc_storeStrong((id *)&self->inputMapOriginH, 0);
  objc_storeStrong((id *)&self->inputMapOriginV, 0);
  objc_storeStrong((id *)&self->inputMapSpacingH, 0);
  objc_storeStrong((id *)&self->inputMapSpacingV, 0);
  objc_storeStrong((id *)&self->inputMapPointsH, 0);
  objc_storeStrong((id *)&self->inputMapPointsV, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
