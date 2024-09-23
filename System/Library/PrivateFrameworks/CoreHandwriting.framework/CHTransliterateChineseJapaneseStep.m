@implementation CHTransliterateChineseJapaneseStep

- (CHTransliterateChineseJapaneseStep)initWithTransliterateSentences:(BOOL)a3
{
  CHTransliterateChineseJapaneseStep *v4;
  objc_super v6;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CHTransliterateChineseJapaneseStep;
  v4 = -[CHTransliterateChineseJapaneseStep init](&v6, sel_init);
  if (v4)
  {
    v7 = *(_OWORD *)"S";
    v8[0] = *(_OWORD *)L"ed-Traditional";
    *(_OWORD *)((char *)v8 + 14) = *(_OWORD *)L"itional";
    v4->_icuTransliterator = (void **)utrans_openU();
    v4->_transliterateSentences = a3;
  }
  return v4;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  unint64_t v7;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t i;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
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
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v168;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  _QWORD v177[4];
  id v178;
  id v179;
  id v180;
  id v181;
  CHTransliterateChineseJapaneseStep *v182;
  uint8_t buf[16];

  v5 = (id *)a3;
  v168 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHTransliterateChineseJapaneseStep is running", buf, 2u);
  }

  v7 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v18, v19, v20, v21, v22, v168);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (i >= v36)
      break;
    objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v48, v49, i, v50, v51, v52);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(*(void **)(v7 + 3560), v53, v54, v55, v56, v57);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v7 + 3560), v58, v59, v60, v61, v62);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v7 + 3560), v63, v64, v65, v66, v67);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v7 + 3560), v68, v69, v70, v71, v72);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v79, v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v7;
    v91 = objc_msgSend_tokenColumnCount(v84, v86, v87, v88, v89, v90);
    v177[0] = MEMORY[0x1E0C809B0];
    v177[1] = 3221225472;
    v177[2] = sub_1BE8B3EEC;
    v177[3] = &unk_1E77F4E98;
    v92 = v173;
    v178 = v92;
    v93 = v172;
    v179 = v93;
    v94 = v175;
    v180 = v94;
    v95 = v174;
    v181 = v95;
    v182 = self;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v78, v96, (uint64_t)v176, 0, v91, (uint64_t)v177);

    if (objc_msgSend_count(v92, v97, v98, v99, v100, v101))
      sub_1BE8A313C((uint64_t)CHPostprocessingStep, v92, v93, v94, v95);
    if (objc_msgSend_count(v94, v102, v103, v104, v105, v106))
    {
      objc_msgSend_addObject_(v171, v107, (uint64_t)v94, v109, v110, v111);
      objc_msgSend_result(v5, v112, v113, v114, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v117, v118, v119, v120, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v123, v124, i, v125, v126, v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v170, v129, (uint64_t)v128, v130, v131, v132);

    }
    if (objc_msgSend_count(v95, v107, v108, v109, v110, v111))
    {
      if ((objc_msgSend_isEqual_(v95, v133, (uint64_t)v94, v134, v135, v136) & 1) == 0)
      {
        objc_msgSend_addObject_(v171, v137, (uint64_t)v95, v138, v139, v140);
        objc_msgSend_result(v5, v141, v142, v143, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v146, v147, v148, v149, v150, v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v152, v153, i, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v170, v158, (uint64_t)v157, v159, v160, v161);

      }
    }

    v7 = v85;
  }
  objc_msgSend_result(v5, v37, v38, v39, v40, v41);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v162, v163, (uint64_t)v171, (uint64_t)v170, v164, v165);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v166);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHTransliterateChineseJapaneseStep;
  -[CHTransliterateChineseJapaneseStep dealloc](&v3, sel_dealloc);
}

@end
