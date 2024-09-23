@implementation CHSynthesisRequestOptions

- (CHSynthesisRequestOptions)initWithStyleDrawing:(id)a3 styleContent:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 distanceBetweenDigits:(id)a16 validateSegments:(BOOL)a17 forwardProcessRatio:(id)a18 backwardProcessRatio:(id)a19
{
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  CHSynthesisRequestOptions *v30;
  CHSynthesisRequestOptions *v31;
  id obj;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v39 = a3;
  v38 = a4;
  v36 = a5;
  obj = a7;
  v25 = a7;
  v35 = a8;
  v26 = a8;
  v37 = a10;
  v27 = a16;
  v28 = a18;
  v29 = a19;
  v40.receiver = self;
  v40.super_class = (Class)CHSynthesisRequestOptions;
  v30 = -[CHSynthesisRequestOptions init](&v40, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_styleDrawing, a3);
    objc_storeStrong((id *)&v31->_styleContent, a4);
    objc_storeStrong((id *)&v31->_stylePrediction, a5);
    v31->_isFastPath = a6;
    objc_storeStrong((id *)&v31->_fitWidth, obj);
    objc_storeStrong((id *)&v31->_fitHeight, v35);
    v31->_synthesizeCharacterInventoryBehavior = a9;
    objc_storeStrong((id *)&v31->_xZeroDrawing, a10);
    v31->_fastPathAsXZero = a11;
    v31->_fastPathUseDefaultStyle = a12;
    v31->_styleInventoryQuery = a13;
    v31->_skipStyleInventoryLookup = a14;
    v31->_saveStyleSample = a15;
    objc_storeStrong((id *)&v31->_distanceBetweenDigits, a16);
    v31->_validateSegments = a17;
    objc_storeStrong((id *)&v31->_forwardProcessRatio, a18);
    objc_storeStrong((id *)&v31->_backwardProcessRatio, a19);
  }

  return v31;
}

+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  CHSynthesisRequestOptions *v7;
  const char *v8;
  void *isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = a4;
  v7 = [CHSynthesisRequestOptions alloc];
  v12 = 0;
  BYTE4(v11) = 0;
  LODWORD(v11) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio = (void *)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v7, v8, (uint64_t)v5, (uint64_t)v6, 0, 0, 0, 0, 0, 0, v11, 0, v12, 0, 0);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
}

+ (id)synthesisOptionsWithFastPath:(BOOL)a3
{
  _BOOL8 v3;
  CHSynthesisRequestOptions *v4;
  const char *v5;
  uint64_t v7;
  char v8;

  v3 = a3;
  v4 = [CHSynthesisRequestOptions alloc];
  v8 = 0;
  BYTE4(v7) = 0;
  LODWORD(v7) = 0;
  return (id)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v4, v5, 0, 0, 0, v3, 0, 0, 0, 0, v7, 0, v8, 0, 0);
}

+ (id)synthesisOptionsWithSynthesizeCharacterInventoryBehavior:(int64_t)a3
{
  CHSynthesisRequestOptions *v4;
  const char *v5;
  uint64_t v7;
  char v8;

  v4 = [CHSynthesisRequestOptions alloc];
  v8 = 0;
  BYTE4(v7) = 0;
  LODWORD(v7) = 0;
  return (id)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v4, v5, 0, 0, 0, 0, 0, 0, a3, 0, v7, 0, v8, 0, 0);
}

+ (id)synthesisOptionsWithStyleStrength:(id)a3
{
  id v3;
  CHSynthesisRequestOptions *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
  uint64_t v34;
  char v35;

  v3 = a3;
  v4 = [CHSynthesisRequestOptions alloc];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(v3, v6, v7, v8, v9, v10);
  objc_msgSend_numberWithDouble_(v5, v12, v13, v14, v15, v16, 1.0 - v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(v3, v19, v20, v21, v22, v23);
  objc_msgSend_numberWithDouble_(v18, v25, v26, v27, v28, v29, 1.0 - v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  BYTE4(v34) = 0;
  LODWORD(v34) = 0;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio = (void *)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v4, v31, 0, 0, 0, 0, 0, 0, 0, 0, v34, 0, v35, v17, v30);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
}

+ (id)synthesisOptionsWithDrawing:(id)a3 content:(id)a4 stylePrediction:(id)a5 isFastPath:(BOOL)a6 fitWidth:(id)a7 fitHeight:(id)a8 synthesizeCharacterInventoryBehavior:(int64_t)a9 xZeroDrawing:(id)a10 fastPathAsXZero:(BOOL)a11 fastPathUseDefaultStyle:(BOOL)a12 styleInventoryQuery:(BOOL)a13 skipStyleInventoryLookup:(BOOL)a14 saveStyleSample:(BOOL)a15 forwardProcessRatio:(id)a16 backwardProcessRatio:(id)a17
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CHSynthesisRequestOptions *v28;
  const char *v29;
  void *isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
  uint64_t v32;
  char v33;
  _BOOL4 v34;
  id v35;

  v34 = a6;
  v35 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a7;
  v24 = a8;
  v25 = a10;
  v26 = a16;
  v27 = a17;
  v28 = [CHSynthesisRequestOptions alloc];
  v33 = 0;
  BYTE4(v32) = a15;
  WORD1(v32) = __PAIR16__(a14, a13);
  LOWORD(v32) = __PAIR16__(a12, a11);
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio = (void *)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v28, v29, (uint64_t)v35, (uint64_t)v21, (uint64_t)v22, v34, v23, v24, a9, v25, v32, 0, v33, v26, v27);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
}

+ (id)synthesisOptionsWithDictionary:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  CHSynthesisRequestOptions *v146;
  const char *v147;
  uint64_t v148;
  void *isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
  uint64_t v151;
  char v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;

  v3 = a3;
  objc_msgSend_valueForKey_(v3, v4, (uint64_t)CHTextSynthesisOptionStyleDrawing[0], v5, v6, v7);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v8, (uint64_t)CHTextSynthesisOptionStyleContent[0], v9, v10, v11);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v12, (uint64_t)CHTextSynthesisOptionStylePrediction[0], v13, v14, v15);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v16, (uint64_t)CHTextSynthesisOptionForwardProcessRatio[0], v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v21, (uint64_t)CHTextSynthesisOptionBackwardProcessRatio[0], v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v26, (uint64_t)CHTextSynthesisOptionStyleStrength[0], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v30;
  v157 = v30;
  if (v30)
  {
    v37 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_floatValue(v30, v31, v32, v33, v34, v35);
    objc_msgSend_numberWithDouble_(v37, v39, v40, v41, v42, v43, 1.0 - v38);
    v44 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_floatValue(v36, v46, v47, v48, v49, v50);
    objc_msgSend_numberWithDouble_(v45, v52, v53, v54, v55, v56, 1.0 - v51);
    v57 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v57;
  }
  else
  {
    v44 = (uint64_t)v25;
  }
  v158 = (void *)v44;
  v159 = v20;
  objc_msgSend_valueForKey_(v3, v31, (uint64_t)CHTextSynthesisOptionFitWidth[0], v33, v34, v35);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v58, (uint64_t)CHTextSynthesisOptionFitHeight[0], v59, v60, v61);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v62, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters[0], v63, v64, v65);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v66, (uint64_t)CHTextSynthesisOptionXZeroDrawing[0], v67, v68, v69);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v3, v70, (uint64_t)CHTextSynthesisOptionFastPath[0], v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend_BOOLValue(v74, v75, v76, v77, v78, v79);

  objc_msgSend_valueForKey_(v3, v81, (uint64_t)CHTextSynthesisOptionFastPathAsXZero[0], v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend_BOOLValue(v85, v86, v87, v88, v89, v90);

  objc_msgSend_valueForKey_(v3, v92, (uint64_t)CHTextSynthesisOptionFastPathUseDefaultStyle[0], v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend_BOOLValue(v96, v97, v98, v99, v100, v101);

  objc_msgSend_valueForKey_(v3, v103, (uint64_t)CHTextSynthesisStyleInventoryDebugView[0], v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend_BOOLValue(v107, v108, v109, v110, v111, v112);

  objc_msgSend_valueForKey_(v3, v114, (uint64_t)CHTextSynthesisOptionSkipStyleInventoryLookup[0], v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend_BOOLValue(v118, v119, v120, v121, v122, v123);

  objc_msgSend_valueForKey_(v3, v125, (uint64_t)CHTextSynthesisOptionSaveStyleSample[0], v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend_BOOLValue(v129, v130, v131, v132, v133, v134);

  objc_msgSend_valueForKey_(v3, v135, (uint64_t)CHTextSynthesisOptionSynthesizeCharacterInventory[0], v136, v137, v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend_integerValue(v139, v140, v141, v142, v143, v144);

  v146 = [CHSynthesisRequestOptions alloc];
  v148 = 2;
  if (v145 < 2)
    v148 = v145;
  BYTE4(v151) = v152;
  BYTE3(v151) = v124;
  BYTE2(v151) = v113;
  BYTE1(v151) = v102;
  LOBYTE(v151) = v91;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio = (void *)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v146, v147, (uint64_t)v162, (uint64_t)v161, (uint64_t)v160, v80, v156, v155, v148 & ~(v148 >> 63), v153, v151, v154, 0, v159, v158);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
}

- (id)dictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CHDrawing *styleDrawing;
  NSString *styleContent;
  MLMultiArray *stylePrediction;
  NSNumber *forwardProcessRatio;
  NSNumber *backwardProcessRatio;
  NSNumber *fitWidth;
  NSNumber *fitHeight;
  NSNumber *distanceBetweenDigits;
  CHDrawing *xZeroDrawing;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  styleDrawing = self->_styleDrawing;
  if (styleDrawing)
    objc_msgSend_setValue_forKey_(v7, v8, (uint64_t)styleDrawing, (uint64_t)CHTextSynthesisOptionStyleDrawing[0], v10, v11);
  styleContent = self->_styleContent;
  if (styleContent)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)styleContent, (uint64_t)CHTextSynthesisOptionStyleContent[0], v10, v11);
  stylePrediction = self->_stylePrediction;
  if (stylePrediction)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)stylePrediction, (uint64_t)CHTextSynthesisOptionStylePrediction[0], v10, v11);
  forwardProcessRatio = self->_forwardProcessRatio;
  if (forwardProcessRatio)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)forwardProcessRatio, (uint64_t)CHTextSynthesisOptionForwardProcessRatio[0], v10, v11);
  backwardProcessRatio = self->_backwardProcessRatio;
  if (backwardProcessRatio)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)backwardProcessRatio, (uint64_t)CHTextSynthesisOptionBackwardProcessRatio[0], v10, v11);
  fitWidth = self->_fitWidth;
  if (fitWidth)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)fitWidth, (uint64_t)CHTextSynthesisOptionFitWidth[0], v10, v11);
  fitHeight = self->_fitHeight;
  if (fitHeight)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)fitHeight, (uint64_t)CHTextSynthesisOptionFitHeight[0], v10, v11);
  distanceBetweenDigits = self->_distanceBetweenDigits;
  if (distanceBetweenDigits)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)distanceBetweenDigits, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters[0], v10, v11);
  xZeroDrawing = self->_xZeroDrawing;
  if (xZeroDrawing)
    objc_msgSend_setValue_forKey_(v12, v8, (uint64_t)xZeroDrawing, (uint64_t)CHTextSynthesisOptionXZeroDrawing[0], v10, v11);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, self->_isFastPath, v9, v10, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v23, (uint64_t)v22, (uint64_t)CHTextSynthesisOptionFastPath[0], v24, v25);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v26, self->_synthesizeCharacterInventoryBehavior, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v31, (uint64_t)v30, (uint64_t)CHTextSynthesisOptionSynthesizeCharacterInventory[0], v32, v33);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v34, self->_fastPathAsXZero, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v39, (uint64_t)v38, (uint64_t)CHTextSynthesisOptionFastPathAsXZero[0], v40, v41);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v42, self->_fastPathUseDefaultStyle, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v47, (uint64_t)v46, (uint64_t)CHTextSynthesisOptionFastPathUseDefaultStyle[0], v48, v49);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v50, self->_styleInventoryQuery, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v55, (uint64_t)v54, (uint64_t)CHTextSynthesisStyleInventoryDebugView[0], v56, v57);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v58, self->_skipStyleInventoryLookup, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v63, (uint64_t)v62, (uint64_t)CHTextSynthesisOptionSkipStyleInventoryLookup[0], v64, v65);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v66, self->_saveStyleSample, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v12, v71, (uint64_t)v70, (uint64_t)CHTextSynthesisOptionSaveStyleSample[0], v72, v73);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  void *isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
  uint64_t v108;
  char v109;
  uint64_t v110;
  unsigned int isFastPath;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;

  v5 = (void *)objc_opt_class();
  v112 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  objc_msgSend_styleDrawing(self, v10, v11, v12, v13, v14);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_styleContent(self, v15, v16, v17, v18, v19);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stylePrediction(self, v20, v21, v22, v23, v24);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  isFastPath = objc_msgSend_isFastPath(self, v25, v26, v27, v28, v29);
  objc_msgSend_fitWidth(self, v30, v31, v32, v33, v34);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fitHeight(self, v35, v36, v37, v38, v39);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend_synthesizeCharacterInventoryBehavior(self, v40, v41, v42, v43, v44);
  objc_msgSend_xZeroDrawing(self, v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_fastPathAsXZero(self, v51, v52, v53, v54, v55);
  v62 = objc_msgSend_fastPathUseDefaultStyle(self, v57, v58, v59, v60, v61);
  v68 = objc_msgSend_styleInventoryQuery(self, v63, v64, v65, v66, v67);
  v74 = objc_msgSend_skipStyleInventoryLookup(self, v69, v70, v71, v72, v73);
  v80 = objc_msgSend_saveStyleSample(self, v75, v76, v77, v78, v79);
  objc_msgSend_distanceBetweenDigits(self, v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend_validateSegments(self, v87, v88, v89, v90, v91);
  objc_msgSend_forwardProcessRatio(self, v93, v94, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_backwardProcessRatio(self, v99, v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v92;
  BYTE4(v108) = v80;
  BYTE3(v108) = v74;
  BYTE2(v108) = v68;
  BYTE1(v108) = v62;
  LOBYTE(v108) = v56;
  isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio = (void *)objc_msgSend_initWithStyleDrawing_styleContent_stylePrediction_isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio_(v112, v105, (uint64_t)v117, (uint64_t)v116, (uint64_t)v115, isFastPath, v114, v113, v110, v50, v108, v86, v109, v98, v104);

  return isFastPath_fitWidth_fitHeight_synthesizeCharacterInventoryBehavior_xZeroDrawing_fastPathAsXZero_fastPathUseDefaultStyle_styleInventoryQuery_skipStyleInventoryLookup_saveStyleSample_distanceBetweenDigits_validateSegments_forwardProcessRatio_backwardProcessRatio;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;

  v55 = a3;
  objc_msgSend_encodeObject_forKey_(v55, v4, (uint64_t)self->_styleDrawing, (uint64_t)CFSTR("styleDrawing"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v55, v7, (uint64_t)self->_styleContent, (uint64_t)CFSTR("styleContent"), v8, v9);
  objc_msgSend_encodeObject_forKey_(v55, v10, (uint64_t)self->_stylePrediction, (uint64_t)CFSTR("stylePrediction"), v11, v12);
  objc_msgSend_encodeBool_forKey_(v55, v13, self->_isFastPath, (uint64_t)CFSTR("isFastPath"), v14, v15);
  objc_msgSend_encodeObject_forKey_(v55, v16, (uint64_t)self->_forwardProcessRatio, (uint64_t)CFSTR("forwardProcessRatio"), v17, v18);
  objc_msgSend_encodeObject_forKey_(v55, v19, (uint64_t)self->_backwardProcessRatio, (uint64_t)CFSTR("backwardProcessRatio"), v20, v21);
  objc_msgSend_encodeObject_forKey_(v55, v22, (uint64_t)self->_fitWidth, (uint64_t)CFSTR("fitWidth"), v23, v24);
  objc_msgSend_encodeObject_forKey_(v55, v25, (uint64_t)self->_fitHeight, (uint64_t)CFSTR("fitHeight"), v26, v27);
  objc_msgSend_encodeInteger_forKey_(v55, v28, self->_synthesizeCharacterInventoryBehavior, (uint64_t)CFSTR("synthesizeCharacterInventory"), v29, v30);
  objc_msgSend_encodeObject_forKey_(v55, v31, (uint64_t)self->_xZeroDrawing, (uint64_t)CFSTR("xZeroDrawing"), v32, v33);
  objc_msgSend_encodeBool_forKey_(v55, v34, self->_fastPathAsXZero, (uint64_t)CFSTR("fastPathAsXZero"), v35, v36);
  objc_msgSend_encodeBool_forKey_(v55, v37, self->_fastPathUseDefaultStyle, (uint64_t)CFSTR("fastPathUseDefaultStyle"), v38, v39);
  objc_msgSend_encodeBool_forKey_(v55, v40, self->_styleInventoryQuery, (uint64_t)CFSTR("styleInventoryQuery"), v41, v42);
  objc_msgSend_encodeBool_forKey_(v55, v43, self->_skipStyleInventoryLookup, (uint64_t)CFSTR("skipStyleInventoryLookup"), v44, v45);
  objc_msgSend_encodeBool_forKey_(v55, v46, self->_saveStyleSample, (uint64_t)CFSTR("saveStyleSampleLookup"), v47, v48);
  objc_msgSend_encodeObject_forKey_(v55, v49, (uint64_t)self->_distanceBetweenDigits, (uint64_t)CFSTR("distanceBetweenDigits"), v50, v51);
  objc_msgSend_encodeBool_forKey_(v55, v52, self->_validateSegments, (uint64_t)CFSTR("validateSegments"), v53, v54);

}

- (CHSynthesisRequestOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CHDrawing *v9;
  CHDrawing *styleDrawing;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *styleContent;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  MLMultiArray *v21;
  MLMultiArray *stylePrediction;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *v31;
  NSNumber *forwardProcessRatio;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *v37;
  NSNumber *backwardProcessRatio;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSNumber *v43;
  NSNumber *fitWidth;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSNumber *v49;
  NSNumber *fitHeight;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  CHDrawing *v61;
  CHDrawing *xZeroDrawing;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  NSNumber *v87;
  NSNumber *distanceBetweenDigits;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("styleDrawing"), v7, v8);
  v9 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  styleDrawing = self->_styleDrawing;
  self->_styleDrawing = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("styleContent"), v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  styleContent = self->_styleContent;
  self->_styleContent = v15;

  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("stylePrediction"), v19, v20);
  v21 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
  stylePrediction = self->_stylePrediction;
  self->_stylePrediction = v21;

  self->_isFastPath = objc_msgSend_decodeBoolForKey_(v4, v23, (uint64_t)CFSTR("isFastPath"), v24, v25, v26);
  v27 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("forwardProcessRatio"), v29, v30);
  v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  forwardProcessRatio = self->_forwardProcessRatio;
  self->_forwardProcessRatio = v31;

  v33 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("backwardProcessRatio"), v35, v36);
  v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  backwardProcessRatio = self->_backwardProcessRatio;
  self->_backwardProcessRatio = v37;

  v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)CFSTR("fitWidth"), v41, v42);
  v43 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fitWidth = self->_fitWidth;
  self->_fitWidth = v43;

  v45 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, (uint64_t)CFSTR("fitHeight"), v47, v48);
  v49 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fitHeight = self->_fitHeight;
  self->_fitHeight = v49;

  v55 = objc_msgSend_decodeIntegerForKey_(v4, v51, (uint64_t)CFSTR("synthesizeCharacterInventory"), v52, v53, v54);
  v56 = 2;
  if (v55 < 2)
    v56 = v55;
  self->_synthesizeCharacterInventoryBehavior = v56 & ~(v56 >> 63);
  v57 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v57, (uint64_t)CFSTR("xZeroDrawing"), v59, v60);
  v61 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  xZeroDrawing = self->_xZeroDrawing;
  self->_xZeroDrawing = v61;

  self->_fastPathAsXZero = objc_msgSend_decodeBoolForKey_(v4, v63, (uint64_t)CFSTR("fastPathAsXZero"), v64, v65, v66);
  self->_fastPathUseDefaultStyle = objc_msgSend_decodeBoolForKey_(v4, v67, (uint64_t)CFSTR("fastPathUseDefaultStyle"), v68, v69, v70);
  self->_styleInventoryQuery = objc_msgSend_decodeBoolForKey_(v4, v71, (uint64_t)CFSTR("styleInventoryQuery"), v72, v73, v74);
  self->_skipStyleInventoryLookup = objc_msgSend_decodeBoolForKey_(v4, v75, (uint64_t)CFSTR("skipStyleInventoryLookup"), v76, v77, v78);
  self->_saveStyleSample = objc_msgSend_decodeBoolForKey_(v4, v79, (uint64_t)CFSTR("saveStyleSampleLookup"), v80, v81, v82);
  v83 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, (uint64_t)CFSTR("distanceBetweenDigits"), v85, v86);
  v87 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  distanceBetweenDigits = self->_distanceBetweenDigits;
  self->_distanceBetweenDigits = v87;

  self->_validateSegments = objc_msgSend_decodeBoolForKey_(v4, v89, (uint64_t)CFSTR("validateSegments"), v90, v91, v92);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)styleDrawing
{
  return self->_styleDrawing;
}

- (void)setStyleDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_styleDrawing, a3);
}

- (NSString)styleContent
{
  return self->_styleContent;
}

- (void)setStyleContent:(id)a3
{
  objc_storeStrong((id *)&self->_styleContent, a3);
}

- (MLMultiArray)stylePrediction
{
  return self->_stylePrediction;
}

- (void)setStylePrediction:(id)a3
{
  objc_storeStrong((id *)&self->_stylePrediction, a3);
}

- (BOOL)isFastPath
{
  return self->_isFastPath;
}

- (void)setIsFastPath:(BOOL)a3
{
  self->_isFastPath = a3;
}

- (NSNumber)forwardProcessRatio
{
  return self->_forwardProcessRatio;
}

- (void)setForwardProcessRatio:(id)a3
{
  objc_storeStrong((id *)&self->_forwardProcessRatio, a3);
}

- (NSNumber)backwardProcessRatio
{
  return self->_backwardProcessRatio;
}

- (void)setBackwardProcessRatio:(id)a3
{
  objc_storeStrong((id *)&self->_backwardProcessRatio, a3);
}

- (NSNumber)fitWidth
{
  return self->_fitWidth;
}

- (void)setFitWidth:(id)a3
{
  objc_storeStrong((id *)&self->_fitWidth, a3);
}

- (NSNumber)fitHeight
{
  return self->_fitHeight;
}

- (void)setFitHeight:(id)a3
{
  objc_storeStrong((id *)&self->_fitHeight, a3);
}

- (NSNumber)distanceBetweenDigits
{
  return self->_distanceBetweenDigits;
}

- (void)setDistanceBetweenDigits:(id)a3
{
  objc_storeStrong((id *)&self->_distanceBetweenDigits, a3);
}

- (int64_t)synthesizeCharacterInventoryBehavior
{
  return self->_synthesizeCharacterInventoryBehavior;
}

- (void)setSynthesizeCharacterInventoryBehavior:(int64_t)a3
{
  self->_synthesizeCharacterInventoryBehavior = a3;
}

- (CHDrawing)xZeroDrawing
{
  return self->_xZeroDrawing;
}

- (void)setXZeroDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_xZeroDrawing, a3);
}

- (BOOL)fastPathAsXZero
{
  return self->_fastPathAsXZero;
}

- (void)setFastPathAsXZero:(BOOL)a3
{
  self->_fastPathAsXZero = a3;
}

- (BOOL)fastPathUseDefaultStyle
{
  return self->_fastPathUseDefaultStyle;
}

- (void)setFastPathUseDefaultStyle:(BOOL)a3
{
  self->_fastPathUseDefaultStyle = a3;
}

- (BOOL)styleInventoryQuery
{
  return self->_styleInventoryQuery;
}

- (void)setStyleInventoryQuery:(BOOL)a3
{
  self->_styleInventoryQuery = a3;
}

- (BOOL)skipStyleInventoryLookup
{
  return self->_skipStyleInventoryLookup;
}

- (void)setSkipStyleInventoryLookup:(BOOL)a3
{
  self->_skipStyleInventoryLookup = a3;
}

- (BOOL)saveStyleSample
{
  return self->_saveStyleSample;
}

- (void)setSaveStyleSample:(BOOL)a3
{
  self->_saveStyleSample = a3;
}

- (BOOL)validateSegments
{
  return self->_validateSegments;
}

- (void)setValidateSegments:(BOOL)a3
{
  self->_validateSegments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xZeroDrawing, 0);
  objc_storeStrong((id *)&self->_distanceBetweenDigits, 0);
  objc_storeStrong((id *)&self->_fitHeight, 0);
  objc_storeStrong((id *)&self->_fitWidth, 0);
  objc_storeStrong((id *)&self->_backwardProcessRatio, 0);
  objc_storeStrong((id *)&self->_forwardProcessRatio, 0);
  objc_storeStrong((id *)&self->_stylePrediction, 0);
  objc_storeStrong((id *)&self->_styleContent, 0);
  objc_storeStrong((id *)&self->_styleDrawing, 0);
}

@end
