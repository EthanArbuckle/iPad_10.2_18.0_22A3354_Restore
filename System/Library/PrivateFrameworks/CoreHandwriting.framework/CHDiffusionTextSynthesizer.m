@implementation CHDiffusionTextSynthesizer

- (CHDiffusionTextSynthesizer)init
{
  CHDiffusionTextSynthesizer *v2;
  CoreHandwriting::synthesis::CHDiffusionSynthesisModel *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (***v9)();
  CHDiffusionPipeline *v10;
  uint64_t *value;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CHDiffusionTextSynthesizer;
  v2 = -[CHDiffusionTextSynthesizer init](&v16, sel_init);
  if (v2)
  {
    v3 = (CoreHandwriting::synthesis::CHDiffusionSynthesisModel *)operator new();
    CoreHandwriting::synthesis::CHDiffusionSynthesisModel::CHDiffusionSynthesisModel(v3, v4, v5, v6, v7, v8);
    v9 = (void (***)())operator new();
    CoreHandwriting::synthesis::DPMSolverMultistepScheduler::DPMSolverMultistepScheduler(v9, (CoreHandwriting::synthesis *)0x3E8, 12);
    v10 = (CHDiffusionPipeline *)operator new();
    *(_QWORD *)v10 = v3;
    *((_QWORD *)v10 + 1) = v9;
    value = (uint64_t *)v2->_pipeline.__ptr_.__value_;
    v2->_pipeline.__ptr_.__value_ = v10;
    if (value)
    {
      v12 = value[1];
      value[1] = 0;
      if (v12)
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      v13 = *value;
      *value = 0;
      if (v13)
      {
        v14 = sub_1BE7E5864(v13);
        MEMORY[0x1C3B812EC](v14, 0x10A0C409A4FACE1);
      }
      MEMORY[0x1C3B812EC](value, 0x20C40A4A59CD2);
    }
  }
  return v2;
}

- (BOOL)isLoaded
{
  uint64_t v2;

  v2 = *(_QWORD *)self->_pipeline.__ptr_.__value_;
  return v2 && *(_QWORD *)(v2 + 16) && *(_QWORD *)(v2 + 40) != 0;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v5;
  id v6;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  if ((CHHasPersonalizedSynthesisModelReady((uint64_t)v6, v7, v8, v9, v10, v11) & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v12, (uint64_t)CHTextSynthesisOptionSupportedCharactersStrict[0], v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

    indicesWithPersonalizedSynthesisSupport(v5, v23);
  }
  else
  {
    objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v12, v13, v14, v15, v16);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  CHSynthesisResult *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  CHSynthesisResult *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  void *v108;
  id v109;
  __int128 v110;
  int v111;
  uint8_t v112[4];
  void *v113;
  _BYTE buf[24];
  uint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v109 = a5;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_length(v9, v12, v13, v14, v15, v16);
    _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_DEFAULT, "Synthesizer: Synthesizing drawing with content=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }

  if (!objc_msgSend_length(v9, v17, v18, v19, v20, v21))
  {
    v84 = 0;
    goto LABEL_25;
  }
  replaceUnsupportedCharactersByTransliteration(v9, 0, buf);
  v111 = 0;
  v110 = xmmword_1BE8DF6B0;
  objc_msgSend_objectForKeyedSubscript_(v10, v22, (uint64_t)CHTextSynthesisOptionXZeroDrawing[0], v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    if (qword_1EF568E88 == -1)
    {
      v32 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        v111 = 2;
        v110 = xmmword_1BE8DF6C4;
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v32 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
    }
    *(_WORD *)v112 = 0;
    _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_DEBUG, "Synthesizer: Using DEFAULT_CONFIG_WITH_X0_INIT", v112, 2u);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v28, (uint64_t)v10, v29, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, *(void **)buf, v33, v109, (uint64_t)&v110);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    v84 = 0;
    goto LABEL_22;
  }
  if (!objc_msgSend_saveStyleSample(v33, v34, v35, v36, v37, v38)
    || !os_variant_has_internal_diagnostics())
  {
    v85 = [CHSynthesisResult alloc];
    objc_msgSend_content(v39, v86, v87, v88, v89, v90);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_drawing(v39, v91, v92, v93, v94, v95);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segmentContents(v39, v96, v97, v98, v99, v100);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_segmentStrokeIndexes(v39, v101, v102, v103, v104, v105);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v85, v106, (uint64_t)v53, (uint64_t)v59, (uint64_t)v65, (uint64_t)v71, v115);
    goto LABEL_20;
  }
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v40 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    goto LABEL_16;
  }
  v40 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
LABEL_16:
    objc_msgSend_styleContent(v33, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v112 = 138412290;
    v113 = v46;
    _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_DEBUG, "Style Sampling: saving style sample with content: %@ for inventory debugging experiments", v112, 0xCu);

  }
LABEL_17:

  v47 = [CHSynthesisResult alloc];
  objc_msgSend_content(v39, v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_drawing(v39, v54, v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentContents(v39, v60, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentStrokeIndexes(v39, v66, v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_styleDrawing(v33, v72, v73, v74, v75, v76);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_styleContent(v33, v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(v47, v83, (uint64_t)v53, (uint64_t)v59, (uint64_t)v65, (uint64_t)v71, v108, v82, v115);

LABEL_20:
LABEL_22:

  if (*(_QWORD *)&buf[8])
  {
    *(_QWORD *)&buf[16] = *(_QWORD *)&buf[8];
    operator delete(*(void **)&buf[8]);
  }

LABEL_25:
  return v84;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  int isEqualToString;
  CHSynthesisResult *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  CHSynthesisResult *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  void *v138;
  void *v140;
  id v141;
  id v142;
  id v143;
  uint8_t buf[4];
  id v145;
  __int16 v146;
  uint64_t v147;
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v143 = a3;
  v11 = a4;
  v141 = a5;
  v142 = a6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v12 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    v145 = v11;
    v146 = 2048;
    v147 = objc_msgSend_length(v11, v13, v14, v15, v16, v17);
    _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_DEFAULT, "Synthesizer: Refining drawing with transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }

  if (objc_msgSend_length(v11, v18, v19, v20, v21, v22) && objc_msgSend_pointCount(v143, v23, v24, v25, v26, v27))
  {
    objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v28, (uint64_t)v141, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_styleContent(v32, v33, v34, v35, v36, v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v43
      || (objc_msgSend_styleDrawing(v32, v38, v39, v40, v41, v42),
          v44 = (void *)objc_claimAutoreleasedReturnValue(),
          v45 = v44 == 0,
          v44,
          v43,
          v45))
    {
      objc_msgSend_setStyleDrawing_(v32, v38, (uint64_t)v143, v40, v41, v42);
      objc_msgSend_setStyleContent_(v32, v46, (uint64_t)v11, v47, v48, v49);
    }
    CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, v11, v32, v142, (uint64_t)&CoreHandwriting::synthesis::CHDiffusionPipeline::REFINE_CONFIG);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      if ((unint64_t)objc_msgSend_length(v11, v50, v51, v52, v53, v54) >= 6)
      {
        objc_msgSend_styleContent(v32, v56, v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v11, v62, (uint64_t)v61, v63, v64, v65);

        if (isEqualToString)
        {
          v67 = [CHSynthesisResult alloc];
          objc_msgSend_content(v55, v68, v69, v70, v71, v72);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_drawing(v55, v73, v74, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_alignAlphaShapes_original_allowAnisotropicScaling_(self, v79, (uint64_t)v78, (uint64_t)v143, 0, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_segmentContents(v55, v82, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_segmentStrokeIndexes(v55, v88, v89, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend_numberOfNotSynthesizedCharacters(v55, v94, v95, v96, v97, v98);
          v101 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v67, v100, (uint64_t)v140, (uint64_t)v81, (uint64_t)v87, (uint64_t)v93, v99);

          v55 = (void *)v101;
        }
      }
      v102 = [CHSynthesisResult alloc];
      objc_msgSend_content(v55, v103, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawing(v55, v109, v110, v111, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rescaleAndShiftSynthesizedDrawing_original_(self, v115, (uint64_t)v114, (uint64_t)v143, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segmentContents(v55, v119, v120, v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segmentStrokeIndexes(v55, v125, v126, v127, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend_numberOfNotSynthesizedCharacters(v55, v131, v132, v133, v134, v135);
      v138 = (void *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v102, v137, (uint64_t)v108, (uint64_t)v118, (uint64_t)v124, (uint64_t)v130, v136);

    }
    else
    {
      v138 = 0;
    }

  }
  else
  {
    v138 = 0;
  }

  return v138;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
  void *v61;
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
  void *v73;
  CHSynthesisResult *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  CHSynthesisResult *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  void *v143;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  uint8_t v151[4];
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  _BYTE buf[24];
  id v156;
  _BYTE v157[10];
  __int16 v158;
  id v159;
  __int16 v160;
  uint64_t v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v149 = a6;
  v150 = a7;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v16 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219267;
    *(_QWORD *)&buf[4] = objc_msgSend_strokeCount(v13, v17, v18, v19, v20, v21);
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend_pointCount(v13, v22, v23, v24, v25, v26);
    *(_WORD *)&buf[22] = 2117;
    v156 = v14;
    *(_WORD *)v157 = 2048;
    *(_QWORD *)&v157[2] = objc_msgSend_length(v14, v27, v28, v29, v30, v31);
    v158 = 2117;
    v159 = v15;
    v160 = 2048;
    v161 = objc_msgSend_length(v15, v32, v33, v34, v35, v36);
    _os_log_impl(&dword_1BE607000, v16, OS_LOG_TYPE_DEFAULT, "Synthesizer: Replacing drawing (numStrokes=%lu, numPts=%lu) with originalTranscription=\"%{sensitive}@\" (length=%lu) and replacementTranscription=\"%{sensitive}@\" (length=%lu)", buf, 0x3Eu);
  }

  replaceUnsupportedCharactersByTransliteration(v15, 1, buf);
  if (*(uint64_t *)v157 >= 1)
  {
    if (qword_1EF568E88 == -1)
    {
      v42 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v42 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
    }
    *(_DWORD *)v151 = 138740227;
    v152 = *(_QWORD *)buf;
    v153 = 2048;
    v154 = *(_QWORD *)v157;
    _os_log_impl(&dword_1BE607000, v42, OS_LOG_TYPE_DEFAULT, "Synthesizer: replacementTranscription after sanitization (%{sensitive}@) contains %lu unsupported characters", v151, 0x16u);
    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend_length(*(void **)buf, v37, v38, v39, v40, v41)
    && objc_msgSend_length(v14, v43, v44, v45, v46, v47)
    && objc_msgSend_pointCount(v13, v48, v49, v50, v51, v52))
  {
    objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v53, (uint64_t)v149, v54, v55, v56);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedDrawingUsingStrokeMidPoint_(v13, v57, 0, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStyleDrawing_(v148, v62, (uint64_t)v61, v63, v64, v65);

    objc_msgSend_setStyleContent_(v148, v66, (uint64_t)v14, v67, v68, v69);
    CoreHandwriting::synthesis::CHDiffusionPipeline::run((uint64_t)self->_pipeline.__ptr_.__value_, *(void **)buf, v148, v150, (uint64_t)&CoreHandwriting::synthesis::CHDiffusionPipeline::DEFAULT_CONFIG);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      if (objc_msgSend_shouldAlignAlphaShapesForOriginalString_replacementString_(self, v70, (uint64_t)v14, *(uint64_t *)buf, v71, v72))
      {
        v74 = [CHSynthesisResult alloc];
        objc_msgSend_content(v73, v75, v76, v77, v78, v79);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawing(v73, v80, v81, v82, v83, v84);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_alignAlphaShapes_original_allowAnisotropicScaling_(self, v85, (uint64_t)v145, (uint64_t)v13, 1, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_segmentContents(v73, v88, v89, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_segmentStrokeIndexes(v73, v94, v95, v96, v97, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend_numberOfNotSynthesizedCharacters(v73, v100, v101, v102, v103, v104);
        v107 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v74, v106, (uint64_t)v146, (uint64_t)v87, (uint64_t)v93, (uint64_t)v99, v105);

        v73 = (void *)v107;
      }
      v108 = [CHSynthesisResult alloc];
      objc_msgSend_content(v73, v109, v110, v111, v112, v113);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawing(v73, v114, v115, v116, v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rescaleAndShiftSynthesizedDrawing_original_(self, v120, (uint64_t)v119, (uint64_t)v13, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segmentContents(v73, v124, v125, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segmentStrokeIndexes(v73, v130, v131, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend_numberOfNotSynthesizedCharacters(v73, v136, v137, v138, v139, v140);
      v143 = (void *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v108, v142, (uint64_t)v147, (uint64_t)v123, (uint64_t)v129, (uint64_t)v135, v141);

    }
    else
    {
      v143 = 0;
    }

  }
  else
  {
    v143 = 0;
  }
  if (*(_QWORD *)&buf[8])
  {
    *(_QWORD *)&buf[16] = *(_QWORD *)&buf[8];
    operator delete(*(void **)&buf[8]);
  }

  return v143;
}

- (id)rescaleAndShiftSynthesizedDrawing:(id)a3 original:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v5 = a3;
  objc_msgSend_bounds(a4, v6, v7, v8, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend_bounds(v5, v19, v20, v21, v22, v23);
  *(float *)&v24 = sqrt(v16 * v16 + v18 * v18) / sqrt(v24 * v24 + v25 * v25);
  objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v5, v28, v29, v30, v31, v32, (v12 - v26) / *(float *)&v24, (v14 - v27) / *(float *)&v24);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)alignAlphaShapes:(id)a3 original:(id)a4 allowAnisotropicScaling:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  CGFloat a;
  CGFloat d;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _BYTE *v23;
  NSObject *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  void *__p;
  _BYTE *v29;
  void *v30;
  _BYTE *v31;
  CGAffineTransformComponents components;
  CGAffineTransform transform;
  _BYTE v34[52];
  __int16 v35;
  CGFloat ty;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sub_1BE7E32A4((char **)&v30, v7);
  sub_1BE7E32A4((char **)&__p, v8);
  if (v30 != v31 && __p != v29)
  {
    sub_1BE7FBA2C((uint64_t)v34, (unint64_t *)&__p, (unint64_t *)&v30);
    memset(&v27, 0, sizeof(v27));
    CoreHandwriting::CPDAffineRegistration::run((CoreHandwriting::CPDAffineRegistration *)v34, &v27);
    sub_1BE7FE8A8(v34);
    transform = v27;
    memset(v34, 0, 48);
    CGAffineTransformDecompose((CGAffineTransformComponents *)v34, &transform);
    v9 = *(double *)&v34[8];
    if (*(double *)v34 >= *(double *)&v34[8])
      v10 = *(double *)v34;
    else
      v10 = *(double *)&v34[8];
    if (v5)
    {
      v11 = v10 * 0.5;
      if (v10 * 0.5 >= *(double *)v34)
        v10 = v10 * 0.5;
      else
        v10 = *(double *)v34;
      if (v11 >= *(double *)&v34[8])
        v9 = v11;
    }
    else
    {
      v9 = v10;
    }
    *(double *)v34 = v10;
    *(double *)&v34[8] = v9;
    *(_QWORD *)&v34[16] = 0;
    components = *(CGAffineTransformComponents *)v34;
    CGAffineTransformMakeWithComponents(&v27, &components);
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      a = v27.a;
      d = v27.d;
      *(_DWORD *)v34 = 134219264;
      *(CGFloat *)&v34[4] = v27.a;
      *(_WORD *)&v34[12] = 2048;
      *(CGFloat *)&v34[14] = v27.b;
      *(_WORD *)&v34[22] = 2048;
      *(CGFloat *)&v34[24] = v27.c;
      *(_WORD *)&v34[32] = 2048;
      *(CGFloat *)&v34[34] = v27.d;
      *(_WORD *)&v34[42] = 2048;
      *(CGFloat *)&v34[44] = v27.tx;
      v35 = 2048;
      ty = v27.ty;
      _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEBUG, "Synthesizer: alignAlphaShapes done. transform:(a=%1.2f, b=%1.2f, c=%1.2f, d=%1.2f, t=[%1.2f, %1.2f])", v34, 0x3Eu);
      v16 = a;
      v17 = d;
    }
    else
    {
      v16 = v27.a;
      v17 = v27.d;
    }

    if (v16 >= 0.0 && v17 >= 0.0)
    {
      v26 = v27;
      v22 = (id)objc_msgSend_newDrawingWithAffineTransform_(v7, v18, (uint64_t)&v26, v19, v20, v21);
      v23 = __p;
      if (!__p)
        goto LABEL_28;
      goto LABEL_27;
    }
    if (qword_1EF568E88 == -1)
    {
      v25 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v25 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_34;
    }
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1BE607000, v25, OS_LOG_TYPE_DEBUG, "Synthesizer: alignAlphaShapes transformation is invalid. Dropping transform.", v34, 2u);
    goto LABEL_34;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v12 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v34 = 134218240;
    *(_QWORD *)&v34[4] = (v31 - (_BYTE *)v30) >> 4;
    *(_WORD *)&v34[12] = 2048;
    *(_QWORD *)&v34[14] = (v29 - (_BYTE *)__p) >> 4;
    _os_log_impl(&dword_1BE607000, v12, OS_LOG_TYPE_ERROR, "Synthesizer: Got empty alpha shape (drawing alpha shape: %lu, original alpha shape: %lu). Dropping transform.", v34, 0x16u);
  }

LABEL_35:
  v22 = v7;
  v23 = __p;
  if (__p)
  {
LABEL_27:
    v29 = v23;
    operator delete(v23);
  }
LABEL_28:
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }

  return v22;
}

- (BOOL)shouldAlignAlphaShapesForOriginalString:(id)a3 replacementString:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v42;

  v5 = a3;
  v6 = a4;
  v12 = objc_msgSend_length(v5, v7, v8, v9, v10, v11);
  if (v12 >= objc_msgSend_length(v6, v13, v14, v15, v16, v17))
  {
    v35 = objc_msgSend_length(v5, v18, v19, v20, v21, v22);
    v34 = v35 - objc_msgSend_length(v6, v36, v37, v38, v39, v40);
  }
  else
  {
    v23 = objc_msgSend_length(v5, v18, v19, v20, v21, v22);
    v34 = objc_msgSend_length(v6, v24, v25, v26, v27, v28) - v23;
  }
  v42 = (unint64_t)objc_msgSend_length(v6, v29, v30, v31, v32, v33) > 5 && v34 < 2;

  return v42;
}

- (id)supportedCharactersForPersonalizedSynthesis
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (objc_msgSend_isLoaded(self, a2, v2, v3, v4, v5)
    && (v7 = *(_QWORD *)self->_pipeline.__ptr_.__value_) != 0)
  {
    return *(id *)(v7 + 112);
  }
  else
  {
    return 0;
  }
}

- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5
{
  CoreHandwriting::synthesis::CHDiffusionPipeline::predictStyleEmbedding((CoreHandwriting::synthesis::CHDiffusionSynthesisModel **)self->_pipeline.__ptr_.__value_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  CHDiffusionPipeline *value;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  value = self->_pipeline.__ptr_.__value_;
  self->_pipeline.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = *((_QWORD *)value + 1);
    *((_QWORD *)value + 1) = 0;
    if (v3)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v3 + 8))(v3, a2);
    v4 = *(_QWORD *)value;
    *(_QWORD *)value = 0;
    if (v4)
    {
      v5 = sub_1BE7E5864(v4);
      MEMORY[0x1C3B812EC](v5, 0x10A0C409A4FACE1);
    }
    JUMPOUT(0x1C3B812ECLL);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
