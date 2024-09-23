@implementation CHTransliterateConfusableCharactersStep

- (CHTransliterateConfusableCharactersStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 locale:(id)a5
{
  id v8;
  CHTransliterateConfusableCharactersStep *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSLocale *locale;
  objc_super v18;

  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CHTransliterateConfusableCharactersStep;
  v9 = -[CHTransliterateConfusableCharactersStep init](&v18, sel_init);
  if (v9)
  {
    objc_opt_self();
    if (qword_1EF568DF8 != -1)
      dispatch_once(&qword_1EF568DF8, &unk_1E77F6908);
    v9->_characterTransliterations = (NSArray *)qword_1EF568DF0;
    v9->_staticLexicon = a3;
    v9->_customLexicon = a4;
    v15 = objc_msgSend_copy(v8, v10, v11, v12, v13, v14);
    locale = v9->_locale;
    v9->_locale = (NSLocale *)v15;

  }
  return v9;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v184;
  void *v186;
  void *v187;
  id *i;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  _QWORD v193[4];
  id v194;
  id v195;
  id v196;
  id v197;
  CHTransliterateConfusableCharactersStep *v198;
  uint8_t *v199;
  unint64_t v200;
  uint8_t buf[8];
  uint8_t *v202;
  uint64_t v203;
  uint64_t (*v204)(uint64_t, uint64_t);
  void (*v205)(uint64_t);
  id v206;

  v5 = (id *)a3;
  v184 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHTransliterateConfusableCharactersStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  for (i = v5; ; v5 = i)
  {
    objc_msgSend_result(v5, v17, v18, v19, v20, v21, v184);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v23, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (v22 >= v35)
      break;
    *(_QWORD *)buf = 0;
    v202 = buf;
    v203 = 0x3032000000;
    v204 = sub_1BE8A7340;
    v205 = sub_1BE8A7350;
    objc_msgSend_leftContext(v5, v36, v37, v38, v39, v40);
    v206 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v41, v42, v43, v44, v45);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v49, v50);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v51, v52, v53, v54, v55);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59, v60);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v61, v62, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v66, v67, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v72, v73, v22, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_result(v5, v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v84, v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend_tokenColumnCount(v89, v90, v91, v92, v93, v94);
    v193[0] = MEMORY[0x1E0C809B0];
    v193[1] = 3221225472;
    v193[2] = sub_1BE8B6DC4;
    v193[3] = &unk_1E77F6898;
    v96 = v190;
    v194 = v96;
    v97 = v189;
    v195 = v97;
    v98 = v192;
    v196 = v98;
    v99 = v191;
    v197 = v99;
    v198 = self;
    v199 = buf;
    v200 = v22;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v83, v100, (uint64_t)v77, 0, v95, (uint64_t)v193);

    if (objc_msgSend_count(v96, v101, v102, v103, v104, v105))
      sub_1BE8A313C((uint64_t)CHPostprocessingStep, v96, v97, v98, v99);
    if (objc_msgSend_count(v98, v106, v107, v108, v109, v110))
    {
      objc_msgSend_addObject_(v187, v111, (uint64_t)v98, v113, v114, v115);
      objc_msgSend_result(i, v116, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v121, v122, v123, v124, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v127, v128, v22, v129, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = (void *)objc_msgSend_copy(v132, v133, v134, v135, v136, v137);
      objc_msgSend_addObject_(v186, v139, (uint64_t)v138, v140, v141, v142);

    }
    if (objc_msgSend_count(v99, v111, v112, v113, v114, v115))
    {
      if ((objc_msgSend_isEqual_(v99, v143, (uint64_t)v98, v144, v145, v146) & 1) == 0)
      {
        objc_msgSend_addObject_(v187, v147, (uint64_t)v99, v148, v149, v150);
        objc_msgSend_result(i, v151, v152, v153, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v156, v157, v158, v159, v160, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v162, v163, v22, v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v173 = (void *)objc_msgSend_copy(v167, v168, v169, v170, v171, v172);
        objc_msgSend_addObject_(v186, v174, (uint64_t)v173, v175, v176, v177);

      }
    }

    _Block_object_dispose(buf, 8);
    ++v22;
  }
  objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v178, v179, (uint64_t)v187, (uint64_t)v186, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v182);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
