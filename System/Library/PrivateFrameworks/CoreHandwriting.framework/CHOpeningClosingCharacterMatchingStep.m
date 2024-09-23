@implementation CHOpeningClosingCharacterMatchingStep

- (CHOpeningClosingCharacterMatchingStep)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHOpeningClosingCharacterMatchingStep *v6;
  uint64_t v7;
  NSCharacterSet *openingBracketCharacters;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSCharacterSet *closingBracketCharacters;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSCharacterSet *openingQuoteCharacters;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSCharacterSet *closingQuoteCharacters;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSCharacterSet *symmetricQuoteCharacters;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CHOpeningClosingCharacterMatchingStep;
  v6 = -[CHOpeningClosingCharacterMatchingStep init](&v34, sel_init);
  if (v6)
  {
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v2, (uint64_t)CFSTR("<([{＜（［｛"), v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    openingBracketCharacters = v6->_openingBracketCharacters;
    v6->_openingBracketCharacters = (NSCharacterSet *)v7;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v9, (uint64_t)CFSTR(">)]}＞）］｝"), v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    closingBracketCharacters = v6->_closingBracketCharacters;
    v6->_closingBracketCharacters = (NSCharacterSet *)v13;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v15, (uint64_t)CFSTR("‘“「｢"), v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    openingQuoteCharacters = v6->_openingQuoteCharacters;
    v6->_openingQuoteCharacters = (NSCharacterSet *)v19;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v21, (uint64_t)CFSTR("’”」｣"), v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    closingQuoteCharacters = v6->_closingQuoteCharacters;
    v6->_closingQuoteCharacters = (NSCharacterSet *)v25;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v27, (uint64_t)CFSTR("＂＇\"'"), v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    symmetricQuoteCharacters = v6->_symmetricQuoteCharacters;
    v6->_symmetricQuoteCharacters = (NSCharacterSet *)v31;

  }
  return v6;
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
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  const char *v85;
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
  void *v96;
  id *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  id v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
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
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  _QWORD v187[5];
  id v188;
  id v189;
  id v190;
  id v191;
  _QWORD v192[5];
  id v193;
  id v194;
  uint8_t buf[16];

  v5 = (id *)a3;
  v180 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHOpeningClosingCharacterMatchingStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  while (1)
  {
    objc_msgSend_result(v5, v17, v18, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v23, v24, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34);

    if (v22 >= v35)
      break;
    objc_msgSend_result(v5, v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v22;
    objc_msgSend_objectAtIndexedSubscript_(v47, v49, v22, v50, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v60, v61, v62, v63, v64);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leftContext(v5, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = (void *)v53;
    objc_msgSend_leftContext(v5, v71, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_length(v76, v77, v78, v79, v80, v81);
    v192[0] = MEMORY[0x1E0C809B0];
    v192[1] = 3221225472;
    v192[2] = sub_1BE8AC9C8;
    v192[3] = &unk_1E77F6730;
    v192[4] = self;
    v83 = v59;
    v193 = v83;
    v84 = v184;
    v194 = v84;
    objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v70, v85, 0, v82, 2, (uint64_t)v192);

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v86, v87, v88, v89, v90);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v91, v92, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v5;
    objc_msgSend_result(v5, v98, v99, v100, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend_length(v185, v104, v105, v106, v107, v108);
    v187[0] = MEMORY[0x1E0C809B0];
    v187[1] = 3221225472;
    v187[2] = sub_1BE8ACBB4;
    v187[3] = &unk_1E77F4E98;
    v187[4] = self;
    v110 = v83;
    v188 = v110;
    v111 = v84;
    v189 = v111;
    v112 = v183;
    v190 = v112;
    v113 = v96;
    v191 = v113;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v103, v114, (uint64_t)v185, 0, v109, (uint64_t)v187);

    objc_msgSend_addObject_(v182, v115, (uint64_t)v113, v116, v117, v118);
    objc_msgSend_result(v5, v119, v120, v121, v122, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v124, v125, v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v130, v131, v48, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v181, v136, (uint64_t)v135, v137, v138, v139);

    if ((objc_msgSend_modifiesOriginalTokens(self, v140, v141, v142, v143, v144) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v112, v145, (uint64_t)v113, v146, v147, v148) & 1) == 0)
    {
      objc_msgSend_addObject_(v182, v149, (uint64_t)v112, v150, v151, v152);
      objc_msgSend_result(v97, v153, v154, v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v158, v159, v160, v161, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v164, v165, v48, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v181, v170, (uint64_t)v169, v171, v172, v173);

    }
    v22 = v48 + 1;
    v5 = v97;
  }
  objc_msgSend_result(v5, v36, v37, v38, v39, v40);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v174, v175, (uint64_t)v182, (uint64_t)v181, v176, v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v178);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symmetricQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_closingQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_openingQuoteCharacters, 0);
  objc_storeStrong((id *)&self->_closingBracketCharacters, 0);
  objc_storeStrong((id *)&self->_openingBracketCharacters, 0);
}

@end
