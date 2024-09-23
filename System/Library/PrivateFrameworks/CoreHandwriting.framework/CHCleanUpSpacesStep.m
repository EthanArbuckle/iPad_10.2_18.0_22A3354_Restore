@implementation CHCleanUpSpacesStep

- (CHCleanUpSpacesStep)initWithLocale:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHCleanUpSpacesStep *v10;
  uint64_t v11;
  NSLocale *locale;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHCleanUpSpacesStep;
  v10 = -[CHCleanUpSpacesStep init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v11;

  }
  return v10;
}

- (id)process:(id)a3 options:(id)a4
{
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
  uint64_t (*i)(uint64_t, uint64_t);
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
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  unint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id *v108;
  CHCleanUpSpacesStep *v109;
  void (*v110)(uint64_t);
  id v111;
  id v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
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
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void (*v184)(uint64_t);
  void *v185;
  id *v186;
  unint64_t v187;
  _QWORD v188[4];
  id *v189;
  CHCleanUpSpacesStep *v190;
  void (*v191)(uint64_t);
  id v192;
  id v193;
  _QWORD *v194;
  uint64_t *v195;
  uint8_t *v196;
  _QWORD v197[4];
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t (*v201)(uint64_t, uint64_t);
  void (*v202)(uint64_t);
  id v203;
  uint8_t buf[8];
  uint8_t *v205;
  uint64_t v206;
  uint64_t (*v207)(uint64_t, uint64_t);
  void (*v208)(uint64_t);
  id v209;

  v186 = (id *)a3;
  v179 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHCleanUpSpacesStep is running", buf, 2u);
  }

  v7 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = 0;
  for (i = sub_1BE8A7340; ; i = v100)
  {
    objc_msgSend_result(v186, v18, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (v187 >= v36)
      break;
    objc_msgSend_result(v186, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v48, v49, v187, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v185 = v53;
    v59 = objc_msgSend_length(v53, v54, v55, v56, v57, v58);
    *(_QWORD *)buf = 0;
    v205 = buf;
    v206 = 0x3032000000;
    v207 = i;
    v208 = sub_1BE8A7350;
    objc_msgSend_leftContext(v186, v60, v61, v62, v63, v64);
    v209 = (id)objc_claimAutoreleasedReturnValue();
    v69 = *((id *)v205 + 5);
    if (self
      && objc_msgSend_shouldAddSpaceToNeutralQuotationMarks_(CHRecognizerConfiguration, v65, (uint64_t)self->_locale, v66, v67, v68))
    {
      objc_msgSend_set(MEMORY[0x1E0CB3550], v70, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend_length(v69, v76, v77, v78, v79, v80);
      v198 = MEMORY[0x1E0C809B0];
      v199 = 3221225472;
      v200 = (uint64_t)sub_1BE8AE960;
      v201 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E77F2070;
      v184 = v75;
      v202 = v184;
      objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v69, v82, 0, v81, 2, (uint64_t)&v198);

    }
    else
    {
      v184 = 0;
    }

    v198 = 0;
    v199 = (uint64_t)&v198;
    v200 = 0x3032000000;
    v201 = i;
    v202 = sub_1BE8A7350;
    objc_msgSend_result(v186, v83, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v88, v89, (uint64_t)v185, 0, v59, 0);
    v203 = (id)objc_claimAutoreleasedReturnValue();

    v197[0] = 0;
    v197[1] = v197;
    v197[2] = 0x2020000000;
    v197[3] = 0;
    objc_msgSend_array(*(void **)(v7 + 3560), v90, v91, v92, v93, v94);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v7 + 3560), v95, v96, v97, v98, v99);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = i;
    v101 = v7;
    objc_msgSend_result(v186, v102, v103, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v188[0] = MEMORY[0x1E0C809B0];
    v188[1] = 3221225472;
    v188[2] = sub_1BE8AF270;
    v188[3] = &unk_1E77F67D0;
    v194 = v197;
    v108 = v186;
    v189 = v108;
    v190 = self;
    v109 = self;
    v195 = &v198;
    v196 = buf;
    v110 = v184;
    v191 = v110;
    v111 = v183;
    v192 = v111;
    v112 = v182;
    v193 = v112;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v107, v113, (uint64_t)v185, 0, v59, (uint64_t)v188);

    objc_msgSend_addObject_(v181, v114, (uint64_t)v112, v115, v116, v117);
    objc_msgSend_result(v108, v118, v119, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v123, v124, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v129, v130, v187, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v180, v135, (uint64_t)v134, v136, v137, v138);

    if (objc_msgSend_count(v111, v139, v140, v141, v142, v143))
    {
      if ((objc_msgSend_isEqual_(v111, v144, (uint64_t)v112, v145, v146, v147) & 1) == 0)
      {
        objc_msgSend_addObject_(v181, v148, (uint64_t)v111, v149, v150, v151);
        objc_msgSend_result(v108, v152, v153, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v157, v158, v159, v160, v161, v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v163, v164, v187, v165, v166, v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v180, v169, (uint64_t)v168, v170, v171, v172);

      }
    }

    _Block_object_dispose(v197, 8);
    _Block_object_dispose(&v198, 8);

    _Block_object_dispose(buf, 8);
    ++v187;
    self = v109;
    v7 = v101;
  }
  objc_msgSend_result(v186, v37, v38, v39, v40, v41);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v173, v174, (uint64_t)v181, (uint64_t)v180, v175, v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  if (v186)
    objc_storeStrong(v186 + 3, v177);

  return v186;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
