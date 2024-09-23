@implementation CHTransliterateHalfWidthPunctuationStep

- (CHTransliterateHalfWidthPunctuationStep)initWithShouldAddAlternatives:(BOOL)a3
{
  CHTransliterateHalfWidthPunctuationStep *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHTransliterateHalfWidthPunctuationStep *v9;
  uint64_t v10;
  NSCharacterSet *contextInvariantCharacterSet;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCharacterSet *forwardLookingCharacterSet;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSCharacterSet *backwardLookingCharacterSet;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSCharacterSet *widthAlternativeCharacterSet;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CHTransliterateHalfWidthPunctuationStep;
  v4 = -[CHTransliterateHalfWidthPunctuationStep init](&v47, sel_init);
  v9 = v4;
  if (v4)
  {
    v4->_shouldAddAlternatives = a3;
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v5, (uint64_t)CFSTR("@#＠＃"), v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    contextInvariantCharacterSet = v9->_contextInvariantCharacterSet;
    v9->_contextInvariantCharacterSet = (NSCharacterSet *)v10;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v12, (uint64_t)CFSTR("|｜~～+=$＋＝＄([{<（［｛＜‘“＂＇\"'「｢『〈〔〘《【〖"), v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    forwardLookingCharacterSet = v9->_forwardLookingCharacterSet;
    v9->_forwardLookingCharacterSet = (NSCharacterSet *)v16;

    objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3780], v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeCharactersInString_(v23, v24, (uint64_t)CFSTR("@#＠＃"), v25, v26, v27);
    objc_msgSend_addCharactersInString_(v23, v28, (uint64_t)CFSTR("|｜~～>＞"), v29, v30, v31);
    v37 = objc_msgSend_copy(v23, v32, v33, v34, v35, v36);
    backwardLookingCharacterSet = v9->_backwardLookingCharacterSet;
    v9->_backwardLookingCharacterSet = (NSCharacterSet *)v37;

    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v39, v40, v41, v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    widthAlternativeCharacterSet = v9->_widthAlternativeCharacterSet;
    v9->_widthAlternativeCharacterSet = (NSCharacterSet *)v44;

  }
  return v9;
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  id v6;
  NSObject *v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t i;
  void *v41;
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
  unint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
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
  void *v79;
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
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  unint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  id v120;
  id v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
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
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
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
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  _QWORD v217[5];
  __CFString *v218;
  __CFString *v219;
  id v220;
  id v221;
  id v222;
  uint8_t *v223;
  uint8_t buf[8];
  uint8_t *v225;
  uint64_t v226;
  uint64_t (*v227)(uint64_t, uint64_t);
  void (*v228)(uint64_t);
  __CFString *v229;

  v5 = (id *)a3;
  v6 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEBUG, "CHTransliterateHalfWidthPunctuationStep is running", buf, 2u);
  }

  v8 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17, v18);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v209 = v6;
  objc_msgSend_leftContext(v5, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(v24, v31, (uint64_t)v30, v32, v33, v34);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v5, v35, v36, v37, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v41, v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_count(v47, v48, v49, v50, v51, v52);

    if (i >= v53)
      break;
    *(_QWORD *)buf = 0;
    v225 = buf;
    v226 = 0x3032000000;
    v227 = sub_1BE8A7340;
    v228 = sub_1BE8A7350;
    v229 = &stru_1E77F6F28;
    if (objc_msgSend_length(v212, v54, v55, v56, v57, v58))
    {
      objc_msgSend_lastComposedCharacter(v212, v59, v60, v61, v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)*((_QWORD *)v225 + 5);
      *((_QWORD *)v225 + 5) = v64;

    }
    v66 = (void *)*((_QWORD *)v225 + 5);
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v59, v60, v61, v62, v63);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend_rangeOfCharacterFromSet_(v66, v68, (uint64_t)v67, v69, v70, v71);

    if (v72 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v78 = (void *)*((_QWORD *)v225 + 5);
      *((_QWORD *)v225 + 5) = &stru_1E77F6F28;

    }
    objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v79, v80, v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v85, v86, i, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(*(void **)(v8 + 3560), v91, v92, v93, v94, v95);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v8 + 3560), v96, v97, v98, v99, v100);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v8 + 3560), v101, v102, v103, v104, v105);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v106, v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v8;
    v118 = objc_msgSend_length(v90, v113, v114, v115, v116, v117);
    v217[0] = MEMORY[0x1E0C809B0];
    v217[1] = 3221225472;
    v217[2] = sub_1BE8ABB54;
    v217[3] = &unk_1E77F6708;
    v217[4] = self;
    v218 = CFSTR("#");
    v223 = buf;
    v219 = CFSTR("＃");
    v119 = v215;
    v220 = v119;
    v120 = v214;
    v221 = v120;
    v121 = v213;
    v222 = v121;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v111, v122, (uint64_t)v90, 0, v118, (uint64_t)v217);

    objc_msgSend_addObject_(v211, v123, (uint64_t)v120, v124, v125, v126);
    objc_msgSend_result(v5, v127, v128, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v132, v133, v134, v135, v136, v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v138, v139, i, v140, v141, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v210, v144, (uint64_t)v143, v145, v146, v147);

    if ((objc_msgSend_modifiesOriginalTokens(self, v148, v149, v150, v151, v152) & 1) == 0
      && (objc_msgSend_isEqualToArray_(v119, v153, (uint64_t)v120, v154, v155, v156) & 1) == 0)
    {
      objc_msgSend_addObject_(v211, v153, (uint64_t)v119, v154, v155, v156);
      objc_msgSend_result(v5, v157, v158, v159, v160, v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v162, v163, v164, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v168, v169, i, v170, v171, v172);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v210, v174, (uint64_t)v173, v175, v176, v177);

    }
    if (self
      && self->_shouldAddAlternatives
      && (objc_msgSend_isEqualToArray_(v121, v153, (uint64_t)v120, v154, v155, v156) & 1) == 0)
    {
      objc_msgSend_addObject_(v211, v178, (uint64_t)v121, v179, v180, v181);
      objc_msgSend_result(v5, v182, v183, v184, v185, v186);
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v187, v188, v189, v190, v191, v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v193, v194, i, v195, v196, v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v210, v199, (uint64_t)v198, v200, v201, v202);

    }
    _Block_object_dispose(buf, 8);

    v8 = v112;
  }
  objc_msgSend_result(v5, v54, v55, v56, v57, v58);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v203, v204, (uint64_t)v211, (uint64_t)v210, v205, v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v207);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthAlternativeCharacterSet, 0);
  objc_storeStrong((id *)&self->_backwardLookingCharacterSet, 0);
  objc_storeStrong((id *)&self->_forwardLookingCharacterSet, 0);
  objc_storeStrong((id *)&self->_contextInvariantCharacterSet, 0);
}

@end
