@implementation CHMathRecognizer

- (CHMathRecognizer)init
{
  CHMathRecognizer *v2;
  CHEncoderDecoderNetwork *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHEncoderDecoderNetwork *recognitionModel;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *recognitionQueue;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CHBracketsMatchingStep *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CHRemoveVariableCasingAlternativesStep *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CHRemoveSubscriptFromVariableStep *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  CHDotTransliterationStep *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CHCombineAlternativesStep *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  CHRemoveInvalidExpressionCandidatesStep *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CHRemoveInvalidStringCandidatesStep *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  CHDecorateSpecialSymbolsStep *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  CHMathPostProcessingManager *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  CHRemoveSpacingAlternativesStep *v126;
  CHInsertPrecedingSpaceForUnitsStep *v127;
  CHDecodeMathFunctionStep *v128;
  void *v129;
  CHTransliterateExponentsStep *v130;
  CHPruneCandidatesComparingColumnScoresStep *v131;
  CHRemoveInvalidSegmentationCandidatesStep *v132;
  objc_super v133;

  v133.receiver = self;
  v133.super_class = (Class)CHMathRecognizer;
  v2 = -[CHMathRecognizer init](&v133, sel_init);
  if (v2)
  {
    v3 = [CHEncoderDecoderNetwork alloc];
    v7 = objc_msgSend_initWithModelNames_decoderName_(v3, v4, (uint64_t)CFSTR("math_encoder.bundle"), (uint64_t)CFSTR("math_decoder.bundle"), v5, v6);
    recognitionModel = v2->_recognitionModel;
    v2->_recognitionModel = (CHEncoderDecoderNetwork *)v7;

    v9 = (void *)objc_opt_class();
    objc_msgSend_definedMathFunctionNameSet(v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDefinedMathFunctionNameSet_(v2->_recognitionModel, v16, (uint64_t)v15, v17, v18, v19);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.CoreHandwriting.mathRecognizerQueue", v20);
    recognitionQueue = v2->_recognitionQueue;
    v2->_recognitionQueue = (OS_dispatch_queue *)v21;

    __asm { FMOV            V0.2D, #3.0 }
    v2->_minimumDrawingSize = _Q0;
    v2->_enableCachingIfAvailable = 0;
    v2->_maxRecognitionResultCount = 1;
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v132 = objc_alloc_init(CHRemoveInvalidSegmentationCandidatesStep);
    objc_msgSend_addObject_(v28, v29, (uint64_t)v132, v30, v31, v32);
    v131 = objc_alloc_init(CHPruneCandidatesComparingColumnScoresStep);
    objc_msgSend_addObject_(v28, v33, (uint64_t)v131, v34, v35, v36);
    v130 = objc_alloc_init(CHTransliterateExponentsStep);
    objc_msgSend_addObject_(v28, v37, (uint64_t)v130, v38, v39, v40);
    v41 = [CHBracketsMatchingStep alloc];
    objc_msgSend_codeMap(v2->_recognitionModel, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_initWithCodemap_(v41, v48, (uint64_t)v47, v49, v50, v51);

    v129 = (void *)v52;
    objc_msgSend_addObject_(v28, v53, v52, v54, v55, v56);
    v128 = objc_alloc_init(CHDecodeMathFunctionStep);
    objc_msgSend_addObject_(v28, v57, (uint64_t)v128, v58, v59, v60);
    v127 = objc_alloc_init(CHInsertPrecedingSpaceForUnitsStep);
    objc_msgSend_addObject_(v28, v61, (uint64_t)v127, v62, v63, v64);
    v126 = objc_alloc_init(CHRemoveSpacingAlternativesStep);
    objc_msgSend_addObject_(v28, v65, (uint64_t)v126, v66, v67, v68);
    v69 = objc_alloc_init(CHRemoveVariableCasingAlternativesStep);
    objc_msgSend_addObject_(v28, v70, (uint64_t)v69, v71, v72, v73);
    v74 = objc_alloc_init(CHRemoveSubscriptFromVariableStep);
    objc_msgSend_addObject_(v28, v75, (uint64_t)v74, v76, v77, v78);
    v79 = objc_alloc_init(CHDotTransliterationStep);
    objc_msgSend_addObject_(v28, v80, (uint64_t)v79, v81, v82, v83);
    v84 = objc_alloc_init(CHCombineAlternativesStep);
    objc_msgSend_addObject_(v28, v85, (uint64_t)v84, v86, v87, v88);
    v89 = [CHRemoveInvalidExpressionCandidatesStep alloc];
    objc_msgSend_codeMap(v2->_recognitionModel, v90, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend_initWithCodemap_(v89, v96, (uint64_t)v95, v97, v98, v99);

    objc_msgSend_addObject_(v28, v101, (uint64_t)v100, v102, v103, v104);
    v105 = objc_alloc_init(CHRemoveInvalidStringCandidatesStep);
    objc_msgSend_addObject_(v28, v106, (uint64_t)v105, v107, v108, v109);
    v110 = objc_alloc_init(CHDecorateSpecialSymbolsStep);
    objc_msgSend_addObject_(v28, v111, (uint64_t)v110, v112, v113, v114);
    v115 = [CHMathPostProcessingManager alloc];
    v120 = (void *)objc_msgSend_initWithSequence_(v115, v116, (uint64_t)v28, v117, v118, v119);
    objc_msgSend_setPostProcessor_(v2, v121, (uint64_t)v120, v122, v123, v124);

  }
  return v2;
}

- (id)mathRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  CHRecognitionInsight *activeRecognitionInsight;
  CHRecognitionInsight *v9;
  CHRecognitionInsight *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHRecognitionInsightRequest *nextRecognitionInsightRequest;
  CHRecognitionInsight *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *recognitionQueue;
  uint64_t (**v26)(_QWORD);
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  unint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  BOOL v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char isEqualToIndexSet;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  CHTokenizedMathResult *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  os_signpost_id_t v147;
  NSObject *v148;
  NSObject *v149;
  unint64_t v150;
  NSObject *v151;
  CHMathResultWithContext *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  NSObject *v183;
  void *v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  CHRecognitionInsight *v191;
  id v192;
  os_signpost_id_t spid;
  id v194;
  uint64_t (**v195)(void);
  _QWORD block[4];
  id v197;
  CHMathRecognizer *v198;
  id v199;
  id v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  id v207;
  __int16 v208;
  char v209;
  __int16 v210;
  uint8_t buf[4];
  uint64_t v212;
  __int16 v213;
  void *v214;
  uint64_t v215;

  v215 = *MEMORY[0x1E0C80C00];
  v194 = a3;
  v187 = a4;
  v188 = a5;
  if (self)
  {
    activeRecognitionInsight = self->_activeRecognitionInsight;
    self->_activeRecognitionInsight = 0;

    if (self->_nextRecognitionInsightRequest)
    {
      v9 = objc_alloc_init(CHRecognitionInsight);
      v10 = self->_activeRecognitionInsight;
      self->_activeRecognitionInsight = v9;

      objc_msgSend_recordInsightRequest_(self->_activeRecognitionInsight, v11, (uint64_t)self->_nextRecognitionInsightRequest, v12, v13, v14);
      nextRecognitionInsightRequest = self->_nextRecognitionInsightRequest;
      self->_nextRecognitionInsightRequest = 0;

    }
  }
  v16 = self->_activeRecognitionInsight;
  v191 = v16;
  if (v16)
    objc_msgSend_recordInputDrawing_(v16, v17, (uint64_t)v194, v18, v19, v20);
  v202 = 0;
  v203 = &v202;
  v204 = 0x3032000000;
  v205 = sub_1BE755DC4;
  v206 = sub_1BE755DD4;
  v207 = 0;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v21 = (id)qword_1EF568E50;
  spid = os_signpost_id_generate(v21);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v22 = (id)qword_1EF568E50;
  v23 = v22;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v23, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHMathRecognition", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v24 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHMathRecognition\", buf, 2u);
  }

  recognitionQueue = self->_recognitionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE755DDC;
  block[3] = &unk_1E77F4A90;
  v192 = v194;
  v197 = v192;
  v198 = self;
  v190 = v187;
  v199 = v190;
  v201 = &v202;
  v26 = (uint64_t (**)(_QWORD))v188;
  v200 = v26;
  dispatch_sync(recognitionQueue, block);
  v32 = (void *)v203[5];
  v195 = (uint64_t (**)(void))v26;
  if (v32)
  {
    if (v26)
    {
      if ((v26[2](v26) & 1) != 0)
      {
        v33 = 0;
        goto LABEL_54;
      }
      v32 = (void *)v203[5];
    }
    v35 = v32;
    v36 = v192;
    v42 = objc_msgSend_count(v35, v37, v38, v39, v40, v41);
    v48 = v35;
    v49 = v48;
    if (v42 >= 2)
    {
      v210 = 0;
      v209 = 0;
      objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v43, v44, v45, v46, v47);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v48, v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE7564F0(v55, v36, (_BYTE *)&v210 + 1, &v210, &v209, v185);

      v186 = v185;
      v189 = v186;
      v49 = v48;
      if (!v209)
      {
        v189 = v186;
        v49 = v48;
        if ((_BYTE)v210)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59, v60);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend_firstObject(v48, v62, v63, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayWithObject_(v61, v68, (uint64_t)v67, v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = HIBYTE(v210);
          v79 = 1;
          v189 = v186;
          while (1)
          {
            if (v79 >= objc_msgSend_count(v48, v73, v74, v75, v76, v77))
            {
              objc_msgSend_addObjectsFromArray_(v49, v80, (uint64_t)v72, v82, v83, v84);

              goto LABEL_43;
            }
            buf[0] = 0;
            v208 = 0;
            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v80, v81, v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v48, v86, v79, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1BE7564F0(v90, v36, buf, (_BYTE *)&v208 + 1, &v208, v85);

            if (!HIBYTE(v208))
              break;
            v95 = v78 || buf[0] == 0;
            v96 = v95;
            if (!(_BYTE)v208 && v96)
              break;
            objc_msgSend_objectAtIndexedSubscript_(v48, v91, v79, v92, v93, v94);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v49, v103, (uint64_t)v102, v104, v105, v106);

            if (objc_msgSend_count(v49, v107, v108, v109, v110, v111) == 1)
            {
              v97 = v189;
              v189 = v85;
              goto LABEL_38;
            }
LABEL_39:

            ++v79;
          }
          objc_msgSend_objectAtIndexedSubscript_(v48, v91, v79, v92, v93, v94);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v72, v98, (uint64_t)v97, v99, v100, v101);
LABEL_38:

          goto LABEL_39;
        }
      }
LABEL_43:
      v112 = (void *)MEMORY[0x1E0CB36B8];
      v113 = objc_msgSend_strokeCount(v36, v56, v57, v58, v59, v60);
      objc_msgSend_indexSetWithIndexesInRange_(v112, v114, 0, v113, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v189, v118, (uint64_t)v117, v119, v120, v121);

      if ((isEqualToIndexSet & 1) == 0)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v123 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          v129 = objc_msgSend_strokeCount(v36, v124, v125, v126, v127, v128);
          objc_msgSend_description(v189, v130, v131, v132, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v212 = v129;
          v213 = 2112;
          v214 = v135;
          _os_log_impl(&dword_1BE607000, v123, OS_LOG_TYPE_ERROR, "Math recognition result doesn't cover all the strokes. Strokes in drawing: %lu, Covergae: %@", buf, 0x16u);

        }
      }

    }
    v136 = (void *)v203[5];
    v203[5] = (uint64_t)v49;

    v137 = [CHTokenizedMathResult alloc];
    v34 = objc_msgSend_initWithBestPathTokens_(v137, v138, v203[5], v139, v140, v141);
    if (v191)
      objc_msgSend_recordMathResult_(v191, v27, v34, v29, v30, v31);
  }
  else
  {
    v34 = 0;
  }
  if (!v195)
  {
    v142 = 1;
    v33 = (void *)v34;
    goto LABEL_57;
  }
  v33 = (void *)v34;
LABEL_54:
  v142 = 0;
  if ((v195[2]() & 1) == 0)
LABEL_57:
    objc_msgSend_transformNotationToInternal(v33, v27, v28, v29, v30, v31);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v143 = (id)qword_1EF568E50;
  v144 = v143;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v143))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v144, OS_SIGNPOST_INTERVAL_END, spid, "CHMathRecognition", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v145 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v145, OS_LOG_TYPE_DEFAULT, "END \"CHMathRecognition\", buf, 2u);
  }

  if (self->_postProcessor && v33 && ((v142 & 1) != 0 || (v195[2]() & 1) == 0))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v146 = (id)qword_1EF568E50;
    v147 = os_signpost_id_generate(v146);

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v148 = (id)qword_1EF568E50;
    v149 = v148;
    v150 = v147 - 1;
    if (v147 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v148))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v149, OS_SIGNPOST_INTERVAL_BEGIN, v147, "CHMathRecognizerPostProcessingBlock", ", buf, 2u);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v151 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v151, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHMathRecognizerPostProcessingBlock\", buf, 2u);
    }

    v152 = [CHMathResultWithContext alloc];
    objc_msgSend_declaredVariables(self, v153, v154, v155, v156, v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = (void *)objc_msgSend_initWithResult_declaredVariables_(v152, v159, (uint64_t)v33, (uint64_t)v158, v160, v161);

    v168 = (void *)objc_msgSend_mutableCopy(v190, v163, v164, v165, v166, v167);
    objc_msgSend_setObject_forKeyedSubscript_(v168, v169, (uint64_t)self->_locales, (uint64_t)CHMathPostProcessingOptionLocales, v170, v171);
    objc_msgSend_process_options_(self->_postProcessor, v172, (uint64_t)v162, (uint64_t)v168, v173, v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v175, v176, v177, v178, v179, v180);
    v181 = objc_claimAutoreleasedReturnValue();

    if (qword_1EF568E88 == -1)
    {
      v182 = (id)qword_1EF568E50;
      if (v150 <= 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_84;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v182 = (id)qword_1EF568E50;
      if (v150 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_84:
        if (os_signpost_enabled(v182))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v182, OS_SIGNPOST_INTERVAL_END, v147, "CHMathRecognizerPostProcessingBlock", ", buf, 2u);
        }
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v183 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v183, OS_LOG_TYPE_DEFAULT, "END \"CHMathRecognizerPostProcessingBlock\", buf, 2u);
    }

    v33 = (void *)v181;
  }

  _Block_object_dispose(&v202, 8);
  return v33;
}

- (NSSet)declaredVariables
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE755DC4;
  v9 = sub_1BE755DD4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE756A84;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE7568D8((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

- (void)setDeclaredVariables:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE756B28;
  v6[3] = &unk_1E77F2428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_1BE7568D8((uint64_t)self, v6);

}

- (CGSize)minimumDrawingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumDrawingSize.width;
  height = self->_minimumDrawingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  self->_minimumDrawingSize = a3;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  self->_maxRecognitionResultCount = a3;
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CHMathPostProcessingManager)postProcessor
{
  return self->_postProcessor;
}

- (void)setPostProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_recognitionModel, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_activeRecognitionInsight, 0);
  objc_storeStrong((id *)&self->_nextRecognitionInsightRequest, 0);
}

- (void)recordInsightWithRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHMathRecognizer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE756C90;
  v6[3] = &unk_1E77F2428;
  v7 = v4;
  v8 = self;
  v5 = v4;
  sub_1BE7568D8((uint64_t)self, v6);

}

- (CHRecognitionInsight)recordedInsightFromLastRequest
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE755DC4;
  v9 = sub_1BE755DD4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE756D74;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE7568D8((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionInsight *)v2;
}

@end
