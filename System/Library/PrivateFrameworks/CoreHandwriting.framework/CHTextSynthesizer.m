@implementation CHTextSynthesizer

+ (id)diffusionModelHash
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CHDiffusionTextSynthesizer, sel_modelHash);
}

+ (int64_t)maxNumberOfSynthesizedCharactersForSize:(CGSize)a3 withDecimalSeparator:(BOOL)a4
{
  return vcvtmd_s64_f64(a3.width / a3.height * 3.0);
}

- (CHTextSynthesizer)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHTextSynthesizer *)objc_msgSend_initWithStyleInventory_(self, a2, 0, v2, v3, v4);
}

- (CHTextSynthesizer)initWithStyleInventory:(id)a3
{
  id v4;
  CHTextSynthesizer *v5;
  CHDiffusionTextSynthesizer *v6;
  CHDiffusionTextSynthesizer *diffusionSynthesizer;
  CHFastPathTextSynthesizer *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CHFastPathTextSynthesizer *fastPathSynthesizer;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHTextSynthesizer;
  v5 = -[CHTextSynthesizer init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(CHDiffusionTextSynthesizer);
    diffusionSynthesizer = v5->_diffusionSynthesizer;
    v5->_diffusionSynthesizer = v6;

    v8 = [CHFastPathTextSynthesizer alloc];
    v13 = objc_msgSend_initWithStyleInventory_(v8, v9, (uint64_t)v4, v10, v11, v12);
    fastPathSynthesizer = v5->_fastPathSynthesizer;
    v5->_fastPathSynthesizer = (CHFastPathTextSynthesizer *)v13;

  }
  return v5;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_shouldAlwaysUseFastPathSynthesis(self, v8, v9, v10, v11, v12) & 1) != 0)
  {
    v17 = 16;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)CHTextSynthesisOptionFastPath[0], v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_BOOLValue(v18, v19, v20, v21, v22, v23);

    v17 = 8;
    if (v24)
      v17 = 16;
  }
  objc_msgSend_supportedCharacterIndexesForString_options_(*(void **)((char *)&self->super.isa + v17), v13, (uint64_t)v6, (uint64_t)v7, v15, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)shouldAlwaysUseFastPathSynthesis
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v6, v7, (uint64_t)CFSTR("com.apple.corehandwriting"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("CHForceUseFastPathSynthesis"), v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_BOOLValue(v16, v17, v18, v19, v20, v21);

  return v22;
}

- (id)drawingWithDesiredDistanceBetweenDigitCenters:(double)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double Height;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  double MidX;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double MaxX;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double MinX;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v103;
  uint64_t v104;
  id v105;
  CHDrawing *v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v9 = a4;
  v105 = a5;
  v103 = a6;
  objc_msgSend_bounds(v9, v10, v11, v12, v13, v14);
  Height = CGRectGetHeight(v107);
  v106 = objc_alloc_init(CHDrawing);
  v104 = objc_msgSend_count(v105, v16, v17, v18, v19, v20);
  if (v104 >= 1)
  {
    v25 = 0;
    v26 = Height * 0.05;
    v27 = a3 * 0.5;
    v28 = 0x8000000000000000;
    v29 = 0.0;
    v30 = 0x8000000000000000;
    MidX = 0.0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v103, v21, v25, v22, v23, v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawingWithStrokesFromIndexSet_(v9, v33, (uint64_t)v32, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v105, v38, v25, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v106, v43, v44, v45, v46, v47);
      MaxX = CGRectGetMaxX(v108);
      objc_msgSend_bounds(v37, v49, v50, v51, v52, v53);
      MinX = CGRectGetMinX(v109);
      objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E0CB3500], v55, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v42, v61, (uint64_t)v60, 1, v62, v63);
      v65 = v29 + MinX;

      if (!v64)
      {
        objc_msgSend_ch_mathDecimalSeparatorCharSet(MEMORY[0x1E0CB3500], v66, v67, v68, v69, v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v42, v74, (uint64_t)v73, 1, v75, v76);

        if (!v77)
          goto LABEL_11;
        if (v25 - 1 != v28)
          goto LABEL_11;
        v67 = v25 + 1;
        if (v25 + 1 >= v104)
          goto LABEL_11;
        objc_msgSend_objectAtIndexedSubscript_(v105, v66, v67, v68, v69, v70);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E0CB3500], v79, v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v78, v85, (uint64_t)v84, 1, v86, v87);

        if (v88)
        {
          objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
          v90 = MaxX + fmax(v27 + MidX - MaxX + v89 * -0.5, v26);
          v30 = v25;
        }
        else
        {
LABEL_11:
          v90 = v65;
        }
        goto LABEL_17;
      }
      if (v25 - 1 == v28)
      {
        objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
        v72 = fmax(MidX + a3 - MaxX + v71 * -0.5, 0.0);
      }
      else
      {
        if (v25 - 2 != v28 || v25 - 1 != v30)
        {
          v90 = v65;
          v28 = v25;
          goto LABEL_17;
        }
        objc_msgSend_bounds(v37, v66, v67, v68, v69, v70);
        v72 = fmax(v27 + MidX - MaxX + v91 * -0.5, v26);
      }
      v90 = MaxX + v72;
      v28 = v25;
LABEL_17:
      v29 = v29 + v90 - v65;
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v37, v66, v67, v68, v69, v70, v29, 0.0, 1.0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_bounds(v92, v93, v94, v95, v96, v97);
      MidX = CGRectGetMidX(v110);
      objc_msgSend_appendDrawing_(v106, v98, (uint64_t)v92, v99, v100, v101);

      ++v25;
    }
    while (v104 != v25);
  }

  return v106;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int isLoaded;
  const char *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  unint64_t v62;
  NSObject *v63;
  NSObject *v64;
  const char *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
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
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  os_signpost_id_t v88;
  NSObject *v89;
  NSObject *v90;
  unint64_t v91;
  NSObject *v92;
  const char *v93;
  NSObject *v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  BOOL v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  float v125;
  float v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  float v137;
  float v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  BOOL v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  float v166;
  float v167;
  double v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  float v184;
  float v185;
  double v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v193;
  BOOL v194;
  id v195;
  void *v196;
  id v197;
  uint8_t buf[4];
  int v199;
  uint64_t v200;

  v200 = *MEMORY[0x1E0C80C00];
  v195 = a3;
  v10 = a4;
  v197 = a5;
  if ((objc_msgSend_shouldAlwaysUseFastPathSynthesis(self, v11, v12, v13, v14, v15) & 1) != 0)
  {
    v21 = 1;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v16, (uint64_t)CHTextSynthesisOptionFastPath[0], v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_BOOLValue(v22, v23, v24, v25, v26, v27);

  }
  if (((objc_msgSend_isLoaded(self->_diffusionSynthesizer, v16, v17, v18, v19, v20, v195) | v21) & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v44 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v44, OS_LOG_TYPE_FAULT, "CHTextSynthesizer isn't expected to get personalized synthesis requests if the diffusion model is not loaded.", buf, 2u);
    }
    v41 = 0;
    goto LABEL_32;
  }
  if (!v21)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v45 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v45, OS_LOG_TYPE_DEFAULT, "Synthesizer: Use diffusion model to synthesize drawing", buf, 2u);
    }

    v46 = v10;
    objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)CHTextSynthesisOptionFastPathAsXZero[0], v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_BOOLValue(v51, v52, v53, v54, v55, v56);

    if (!v57)
    {
      v43 = v46;
      goto LABEL_62;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v58 = (id)qword_1EF568E50;
    v59 = os_signpost_id_generate(v58);

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v60 = (id)qword_1EF568E50;
    v61 = v60;
    v62 = v59 - 1;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "CHFastPathSynthesizeDrawing", ", buf, 2u);
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v63 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v63, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHFastPathSynthesizeDrawing\", buf, 2u);
    }

    if (qword_1EF568E88 == -1)
    {
      v64 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        goto LABEL_52;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v64 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
LABEL_52:

        objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_fastPathSynthesizer, v65, (uint64_t)v196, (uint64_t)v46, (uint64_t)v197, (uint64_t)a6);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (qword_1EF568E88 == -1)
        {
          v67 = (id)qword_1EF568E50;
          if (v62 <= 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_54;
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v67 = (id)qword_1EF568E50;
          if (v62 <= 0xFFFFFFFFFFFFFFFDLL)
          {
LABEL_54:
            if (os_signpost_enabled(v67))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BE607000, v67, OS_SIGNPOST_INTERVAL_END, v59, "CHFastPathSynthesizeDrawing", ", buf, 2u);
            }
          }
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v68 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v68, OS_LOG_TYPE_DEFAULT, "END \"CHFastPathSynthesizeDrawing\", buf, 2u);
        }

        objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99E08], v69, (uint64_t)v46, v70, v71, v72);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawing(v66, v73, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedDrawingUsingStrokeMidPoint_(v78, v79, 0, v80, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v43, v84, (uint64_t)v83, (uint64_t)CHTextSynthesisOptionXZeroDrawing[0], v85, v86);

LABEL_62:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v87 = (id)qword_1EF568E50;
        v88 = os_signpost_id_generate(v87);

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v89 = (id)qword_1EF568E50;
        v90 = v89;
        v91 = v88 - 1;
        if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v88, "CHDiffusionSynthesizeDrawing", ", buf, 2u);
        }

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v92 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE607000, v92, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionSynthesizeDrawing\", buf, 2u);
        }

        objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_diffusionSynthesizer, v93, (uint64_t)v196, (uint64_t)v43, (uint64_t)v197, (uint64_t)a6);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (qword_1EF568E88 == -1)
        {
          v94 = (id)qword_1EF568E50;
          if (v91 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_77;
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v94 = (id)qword_1EF568E50;
          if (v91 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_77;
        }
        if (os_signpost_enabled(v94))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v94, OS_SIGNPOST_INTERVAL_END, v88, "CHDiffusionSynthesizeDrawing", ", buf, 2u);
        }
LABEL_77:

        if (qword_1EF568E88 == -1)
        {
          v95 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
LABEL_80:

            objc_msgSend_resampleDrawing(v41, v96, v97, v98, v99, v100);
            goto LABEL_81;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v95 = (id)qword_1EF568E18[0];
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            goto LABEL_80;
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v95, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionSynthesizeDrawing\", buf, 2u);
        goto LABEL_80;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v64, OS_LOG_TYPE_DEBUG, "Synthesizer: Use fast path to synthesize X0 drawing", buf, 2u);
    goto LABEL_52;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v28 = (id)qword_1EF568E50;
  v29 = os_signpost_id_generate(v28);

  if (qword_1EF568E88 == -1)
  {
    v30 = (id)qword_1EF568E50;
    v31 = v29 - 1;
    if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v30 = (id)qword_1EF568E50;
    v31 = v29 - 1;
    if (v29 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_12;
  }
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v29, "CHFastPathSynthesizeDrawing", ", buf, 2u);
  }
LABEL_12:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v32 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHFastPathSynthesizeDrawing\", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v33 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    isLoaded = objc_msgSend_isLoaded(self->_diffusionSynthesizer, v34, v35, v36, v37, v38);
    *(_DWORD *)buf = 67109120;
    v199 = isLoaded;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_DEFAULT, "Synthesizer: Use fast path to synthesize drawing, diffusionModel.isLoaded=%d", buf, 8u);
  }

  objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_fastPathSynthesizer, v40, (uint64_t)v196, (uint64_t)v10, (uint64_t)v197, (uint64_t)a6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 == -1)
  {
    v42 = (id)qword_1EF568E50;
    if (v31 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_24;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v42 = (id)qword_1EF568E50;
    if (v31 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_24;
  }
  if (os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v42, OS_SIGNPOST_INTERVAL_END, v29, "CHFastPathSynthesizeDrawing", ", buf, 2u);
  }
LABEL_24:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v43 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      goto LABEL_81;
    goto LABEL_26;
  }
  v43 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
LABEL_26:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v43, OS_LOG_TYPE_DEFAULT, "END \"CHFastPathSynthesizeDrawing\", buf, 2u);
  }
LABEL_81:

  objc_msgSend_objectForKeyedSubscript_(v10, v101, (uint64_t)CHTextSynthesisOptionFitHeight[0], v102, v103, v104);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v109
    || ((objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters[0], v106, v107, v108), (v110 = (void *)objc_claimAutoreleasedReturnValue()) != 0)? (v111 = v21): (v111 = 0), v110, v109, !v111))
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionFitWidth[0], v106, v107, v108);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    if (v144)
    {

LABEL_96:
      objc_msgSend_objectForKeyedSubscript_(v10, v149, (uint64_t)CHTextSynthesisOptionFitWidth[0], v150, v151, v152);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      if (v159)
      {
        objc_msgSend_objectForKeyedSubscript_(v10, v155, (uint64_t)CHTextSynthesisOptionFitWidth[0], v156, v157, v158);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v160, v161, v162, v163, v164, v165);
        v167 = v166;

        v168 = v167;
      }
      else
      {
        v168 = -1.0;
      }

      objc_msgSend_objectForKeyedSubscript_(v10, v169, (uint64_t)CHTextSynthesisOptionFitHeight[0], v170, v171, v172);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      if (v177)
      {
        objc_msgSend_objectForKeyedSubscript_(v10, v173, (uint64_t)CHTextSynthesisOptionFitHeight[0], v174, v175, v176);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v178, v179, v180, v181, v182, v183);
        v185 = v184;

        v186 = v185;
      }
      else
      {
        v186 = -1.0;
      }

      objc_msgSend_scaleDrawingWithWidth_height_desiredDistanceBetweenDigitCenters_(v41, v187, v188, v189, v190, v191, v168, v186, -1.0);
      goto LABEL_103;
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v145, (uint64_t)CHTextSynthesisOptionFitHeight[0], v146, v147, v148);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v153 == 0;

    if (!v154)
      goto LABEL_96;
    objc_msgSend_objectForKeyedSubscript_(v10, v149, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters[0], v150, v151, v152);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v194 = v193 == 0;

    if (v194)
      goto LABEL_103;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v44 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v44, OS_LOG_TYPE_ERROR, "Synthesizer: CHTextSynthesisOptionDistanceBetweenDigitsCenters option is set but not processed. Only valid in combination with CHTextSynthesisOptionFitHeight in FastPath mode.", buf, 2u);
    }
LABEL_32:

    goto LABEL_103;
  }
  objc_msgSend_objectForKeyedSubscript_(v10, v105, (uint64_t)CHTextSynthesisOptionFitWidth[0], v106, v107, v108);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v112 == 0;

  if (!v113)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v118 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v118, OS_LOG_TYPE_ERROR, "Synthesizer: CHTextSynthesisOptionFitWidth option is ignored in CHTextSynthesisOptionDistanceBetweenDigitsCenters mode.", buf, 2u);
    }

  }
  objc_msgSend_objectForKeyedSubscript_(v10, v114, (uint64_t)CHTextSynthesisOptionFitHeight[0], v115, v116, v117);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v119, v120, v121, v122, v123, v124);
  v126 = v125;

  objc_msgSend_objectForKeyedSubscript_(v10, v127, (uint64_t)CHTextSynthesisOptionDistanceBetweenDigitCenters[0], v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v131, v132, v133, v134, v135, v136);
  v138 = v137;

  objc_msgSend_scaleDrawingWithWidth_height_desiredDistanceBetweenDigitCenters_(v41, v139, v140, v141, v142, v143, -1.0, v126, v138);
LABEL_103:

  return v41;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v32;
  uint8_t v33[16];
  uint8_t v34[16];
  uint8_t v35[16];
  uint8_t buf[16];
  uint8_t v37[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (self->_diffusionSynthesizer)
  {
    v32 = (uint64_t)v12;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E50;
    v17 = os_signpost_id_generate(v16);

    if (qword_1EF568E88 == -1)
    {
      v18 = (id)qword_1EF568E50;
      v19 = v17 - 1;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_8;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v18 = (id)qword_1EF568E50;
      v19 = v17 - 1;
      if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_8;
    }
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CHDiffusionRefineDrawing", ", buf, 2u);
    }
LABEL_8:

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v20 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionRefineDrawing\", v35, 2u);
    }

    v12 = (id)v32;
    objc_msgSend_refineDrawing_transcription_options_shouldCancel_error_(self->_diffusionSynthesizer, v21, v32, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, a7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF568E88 == -1)
    {
      v23 = (id)qword_1EF568E50;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v23 = (id)qword_1EF568E50;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_14:
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)v34 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v23, OS_SIGNPOST_INTERVAL_END, v17, "CHDiffusionRefineDrawing", ", v34, 2u);
        }
      }
    }

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v24 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionRefineDrawing\", v33, 2u);
    }

    objc_msgSend_resampleDrawing(v22, v25, v26, v27, v28, v29);
    goto LABEL_26;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v30 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_1BE607000, v30, OS_LOG_TYPE_ERROR, "Synthesizer: Currently no diffusion synthesizer available for refinement.", v37, 2u);
  }

  v22 = 0;
LABEL_26:

  return v22;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  NSObject *v21;
  unint64_t v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v35;
  id v36;
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];
  uint8_t v41[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v36 = a6;
  v17 = a7;
  if (self->_diffusionSynthesizer)
  {
    v35 = (uint64_t)v14;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E50;
    v19 = os_signpost_id_generate(v18);

    v20 = (uint64_t)v16;
    if (qword_1EF568E88 == -1)
    {
      v21 = (id)qword_1EF568E50;
      v22 = v19 - 1;
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_8;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v21 = (id)qword_1EF568E50;
      v22 = v19 - 1;
      if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_8;
    }
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "CHDiffusionReplaceDrawing", ", buf, 2u);
    }
LABEL_8:

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v23 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHDiffusionReplaceDrawing\", v39, 2u);
    }

    v14 = (id)v35;
    objc_msgSend_replaceDrawing_originalTranscription_replacementTranscription_options_shouldCancel_error_(self->_diffusionSynthesizer, v24, v35, (uint64_t)v15, v20, (uint64_t)v36, v17, a8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF568E88 == -1)
    {
      v26 = (id)qword_1EF568E50;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v26 = (id)qword_1EF568E50;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_14:
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)v38 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BE607000, v26, OS_SIGNPOST_INTERVAL_END, v19, "CHDiffusionReplaceDrawing", ", v38, 2u);
        }
      }
    }

    v16 = (id)v20;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v27 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_1BE607000, v27, OS_LOG_TYPE_DEFAULT, "END \"CHDiffusionReplaceDrawing\", v37, 2u);
    }

    objc_msgSend_resampleDrawing(v25, v28, v29, v30, v31, v32);
    goto LABEL_26;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v33 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_ERROR, "Synthesizer: Diffusion synthesizer is not available to generate a replacement drawing.", v41, 2u);
  }

  v25 = 0;
LABEL_26:

  return v25;
}

- (id)supportedCharactersForPersonalizedSynthesis
{
  return (id)((uint64_t (*)(CHDiffusionTextSynthesizer *, char *))MEMORY[0x1E0DE7D20])(self->_diffusionSynthesizer, sel_supportedCharactersForPersonalizedSynthesis);
}

- (id)stylePredictionResultForTranscription:(id)a3 drawing:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  CHDiffusionTextSynthesizer *diffusionSynthesizer;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  v8 = a3;
  v9 = a4;
  v12 = a5;
  diffusionSynthesizer = self->_diffusionSynthesizer;
  if (diffusionSynthesizer)
  {
    objc_msgSend_stylePredictionResultForTranscription_drawing_shouldCancel_(diffusionSynthesizer, v10, (uint64_t)v8, (uint64_t)v9, (uint64_t)v12, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_ERROR, "Synthesizer: Diffusion synthesizer is not available to predict the style for a sample.", v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleInventory, 0);
  objc_storeStrong((id *)&self->_fastPathSynthesizer, 0);
  objc_storeStrong((id *)&self->_diffusionSynthesizer, 0);
}

@end
