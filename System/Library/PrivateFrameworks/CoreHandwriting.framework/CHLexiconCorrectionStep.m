@implementation CHLexiconCorrectionStep

+ (id)validatedTokenForCorrectedToken:(id)a3 rawToken:(id)a4 autoCapitalizationMode:(int)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isEqualToString;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
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
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
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
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  char v115;
  NSString *v116;
  unint64_t i;
  NSString *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSString *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  BOOL v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char isAbbreviation;
  void *v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  char v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  __int16 v217;
  void *v218;
  int v219;
  id v220;
  _QWORD v221[4];
  id v222;
  _QWORD v223[4];
  id v224;

  v7 = a3;
  v220 = a4;
  if (qword_1EF568DC8 != -1)
    dispatch_once(&qword_1EF568DC8, &unk_1E77F1B50);
  objc_msgSend_string(v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v220, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v20, (uint64_t)v19, v21, v22, v23);

  v25 = v7;
  v31 = v25;
  v32 = v25;
  if ((isEqualToString & 1) != 0)
    goto LABEL_42;
  v219 = a5;
  objc_msgSend_string(v25, v26, v27, v28, v29, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v220, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_caseInsensitiveCompare_(v33, v40, (uint64_t)v39, v41, v42, v43);

  v50 = v31;
  if (v44)
    goto LABEL_27;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v45, v46, v47, v48, v49);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v31, v51, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v31, v57, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_length(v62, v63, v64, v65, v66, v67);
  v69 = MEMORY[0x1E0C809B0];
  v223[0] = MEMORY[0x1E0C809B0];
  v223[1] = 3221225472;
  v223[2] = sub_1BE8A52F4;
  v223[3] = &unk_1E77F2070;
  v70 = v218;
  v224 = v70;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v56, v71, 0, v68, 2, (uint64_t)v223);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v220, v78, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v220, v84, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend_length(v89, v90, v91, v92, v93, v94);
  v221[0] = v69;
  v221[1] = 3221225472;
  v221[2] = sub_1BE8A5300;
  v221[3] = &unk_1E77F2070;
  v96 = v77;
  v222 = v96;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v83, v97, 0, v95, 2, (uint64_t)v221);

  v103 = objc_msgSend_count(v70, v98, v99, v100, v101, v102);
  v50 = v31;
  if (v103 != objc_msgSend_count(v96, v104, v105, v106, v107, v108))
    goto LABEL_26;
  v114 = 0;
  v115 = 0;
  v116 = 0;
  for (i = 0; i < objc_msgSend_count(v70, v109, v110, v111, v112, v113); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v70, v119, i, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v96, v124, i, v125, v126, v127);
    v128 = (NSString *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend_isEqualToString_(v123, v129, (uint64_t)v128, v130, v131, v132);
    if (!v133)
    {
      if ((v115 & 1) != 0)
      {
        v118 = v128;
        v128 = (NSString *)v123;
        v123 = v116;
      }
      else
      {
        if (v116)
          v114 |= !isStringEntirelyFromSet(v116, (NSCharacterSet *)qword_1EF568DC0);
        else
          v114 = 1;

        v118 = v128;
        v128 = (NSString *)v123;
        v123 = 0;
      }
      goto LABEL_8;
    }
    if ((v114 & 1) == 0)
    {
      v114 = 0;
      v118 = v116;
LABEL_8:

      goto LABEL_9;
    }
    v134 = isStringEntirelyFromSet((NSString *)v123, (NSCharacterSet *)qword_1EF568DC0);

    if (!v134)
    {
      v116 = (NSString *)v123;
      goto LABEL_24;
    }
    v114 = 0;
LABEL_9:
    v115 = v133 ^ 1;
    v116 = (NSString *)v123;
  }
  if ((v114 & 1) == 0)
  {
    v50 = v220;

    goto LABEL_25;
  }
LABEL_24:
  v50 = v31;
LABEL_25:

LABEL_26:
LABEL_27:
  objc_msgSend_string(v220, v45, v46, v47, v48, v49);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v135, v136, (uint64_t)CFSTR("."), (uint64_t)&stru_1E77F6F28, v137, v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v31, v140, v141, v142, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v145, v146, (uint64_t)CFSTR("."), (uint64_t)&stru_1E77F6F28, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend_caseInsensitiveCompare_(v139, v150, (uint64_t)v149, v151, v152, v153);

  if (!v154)
  {
    objc_msgSend_string(v220, v155, v156, v157, v158, v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    isAbbreviation = objc_msgSend_isAbbreviation(v160, v161, v162, v163, v164, v165);

    v167 = v220;
    if ((isAbbreviation & 1) != 0)
      goto LABEL_41;
  }
  if (v219 == 5)
    goto LABEL_40;
  objc_msgSend_string(v220, v155, v156, v157, v158, v159);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_countSubstringsWithOptions_(v168, v169, 2, v170, v171, v172) <= 4)
  {
    objc_msgSend_string(v220, v173, v174, v175, v176, v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isAllUppercase(v178, v179, v180, v181, v182, v183) & 1) != 0)
    {
      v189 = objc_msgSend_properties(v220, v184, v185, v186, v187, v188);

      v167 = v220;
      if ((v189 & 4) != 0)
      {
        if (v219 != 6)
          goto LABEL_40;
        goto LABEL_37;
      }
      goto LABEL_41;
    }

  }
  if (v219 != 6)
    goto LABEL_40;
LABEL_37:
  objc_msgSend_string(v220, v190, v191, v192, v193, v194);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v31, v196, v197, v198, v199, v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_caseInsensitiveCompare_(v195, v202, (uint64_t)v201, v203, v204, v205)
    || (objc_msgSend_inputSources(v31, v206, v207, v208, v209, v210) & 0x100) == 0)
  {

    goto LABEL_40;
  }
  v217 = objc_msgSend_properties(v31, v211, v212, v213, v214, v215);

  v167 = v220;
  if ((v217 & 0x200) != 0)
LABEL_40:
    v167 = v50;
LABEL_41:
  v32 = v167;

LABEL_42:
  return v32;
}

- (CHLexiconCorrectionStep)initWithAutoCapitalizationMode:(int)a3 shouldAutoCorrect:(BOOL)a4 shouldAutoCapitalize:(BOOL)a5 shouldCreatePseudoTokens:(BOOL)a6 locale:(id)a7 staticLexicon:(_LXLexicon *)a8 customLexicon:(_LXLexicon *)cf phraseLexicon:(_LXLexicon *)a10 customPhraseLexicon:(_LXLexicon *)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 ovsStringChecker:(id)a14 textReplacements:(id)a15
{
  CHLexiconCorrectionStep *v22;
  id *p_isa;
  CHLexiconCorrectionStep *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSCharacterSet *consumableStrokesCharSet;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSCharacterSet *fullWidthPunctuationThatExpectsUppercaseAfter;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSCharacterSet *punctuationThatExpectsUppercaseAfter;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v47 = a7;
  v46 = a12;
  v45 = a14;
  v44 = a15;
  v48.receiver = self;
  v48.super_class = (Class)CHLexiconCorrectionStep;
  v22 = -[CHLexiconCorrectionStep init](&v48, sel_init);
  p_isa = (id *)&v22->super.super.isa;
  v24 = v22;
  if (v22)
  {
    v22->_autoCapitalizationMode = a3;
    v22->_shouldAutoCorrect = a4;
    v22->_shouldAutoCapitalize = a5;
    v22->_shouldCreatePseudoTokens = a6;
    objc_storeStrong((id *)&v22->_locale, a7);
    if (a8)
      v24->_staticLexicon = (_LXLexicon *)CFRetain(a8);
    if (cf)
      v24->_customLexicon = (_LXLexicon *)CFRetain(cf);
    if (a10)
      v24->_phraseLexicon = (_LXLexicon *)CFRetain(a10);
    if (a11)
      v24->_customPhraseLexicon = (_LXLexicon *)CFRetain(a11);
    v24->_lmVocabulary = a13;
    objc_storeStrong(p_isa + 7, a14);
    objc_storeStrong(p_isa + 8, a12);
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v25, (uint64_t)CFSTR("'\".-"), v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    consumableStrokesCharSet = v24->_consumableStrokesCharSet;
    v24->_consumableStrokesCharSet = (NSCharacterSet *)v29;

    objc_storeStrong(p_isa + 9, a15);
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v31, (uint64_t)CFSTR("．！？；：。"), v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    fullWidthPunctuationThatExpectsUppercaseAfter = v24->_fullWidthPunctuationThatExpectsUppercaseAfter;
    v24->_fullWidthPunctuationThatExpectsUppercaseAfter = (NSCharacterSet *)v35;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v37, (uint64_t)CFSTR("¿¡"), v38, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    punctuationThatExpectsUppercaseAfter = v24->_punctuationThatExpectsUppercaseAfter;
    v24->_punctuationThatExpectsUppercaseAfter = (NSCharacterSet *)v41;

  }
  return v24;
}

- (void)dealloc
{
  _LXLexicon *staticLexicon;
  _LXLexicon *customLexicon;
  _LXLexicon *phraseLexicon;
  _LXLexicon *customPhraseLexicon;
  objc_super v7;

  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  customLexicon = self->_customLexicon;
  if (customLexicon)
  {
    CFRelease(customLexicon);
    self->_customLexicon = 0;
  }
  phraseLexicon = self->_phraseLexicon;
  if (phraseLexicon)
  {
    CFRelease(phraseLexicon);
    self->_phraseLexicon = 0;
  }
  customPhraseLexicon = self->_customPhraseLexicon;
  if (customPhraseLexicon)
  {
    CFRelease(customPhraseLexicon);
    self->_customPhraseLexicon = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CHLexiconCorrectionStep;
  -[CHLexiconCorrectionStep dealloc](&v7, sel_dealloc);
}

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSCharacterSet *v26;
  NSObject *v27;
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
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
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
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  BOOL v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  NSDictionary *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  id v218;
  id v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  NSString *v262;
  BOOL v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  id v275;
  id v276;
  const char *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  double v300;
  double v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  double v307;
  double v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  double v314;
  double v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  double v321;
  double v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  double v347;
  double v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  const char *v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  void *v394;
  const char *v395;
  uint64_t v396;
  unint64_t v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t j;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  void *v453;
  id v454;
  const char *v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t k;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  char isEqualToString;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  double v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  double v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  double v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  double v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  void *v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  double v550;
  double v551;
  double v552;
  double v553;
  double v554;
  double v555;
  double v556;
  double v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  const char *v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  void *v576;
  const char *v577;
  uint64_t v578;
  void *v579;
  const char *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  void *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  void *v591;
  const char *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  char v596;
  const char *v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  const char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  void *v611;
  const char *v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  void *v617;
  const char *v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  void *v622;
  const char *v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  const char *v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  void *v632;
  const char *v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  unint64_t m;
  void *v638;
  const char *v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  void *v644;
  const char *v645;
  uint64_t v646;
  uint64_t v647;
  uint64_t v648;
  void *v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  uint64_t v654;
  void *v655;
  const char *v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  BOOL v661;
  uint64_t v662;
  void *v663;
  const char *v664;
  uint64_t v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  void *v669;
  const char *v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  void *v674;
  const char *v675;
  uint64_t v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t v679;
  void *v680;
  const char *v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  void *v685;
  const char *v686;
  uint64_t v687;
  const char *v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t n;
  void *v696;
  void *v697;
  const char *v698;
  uint64_t v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  void *v703;
  const char *v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  const char *v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  void *v713;
  const char *v714;
  uint64_t v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  const char *v720;
  uint64_t v721;
  uint64_t v722;
  uint64_t v723;
  int isEqualToIndexSet;
  void *v725;
  const char *v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  uint64_t v730;
  const char *v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  const char *v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  const char *v741;
  uint64_t v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  void *v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  uint64_t v750;
  uint64_t v751;
  void *v752;
  const char *v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  void *v757;
  const char *v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  const char *v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  uint64_t v766;
  void *v767;
  const char *v768;
  uint64_t v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  void *v773;
  const char *v774;
  uint64_t v775;
  uint64_t v776;
  uint64_t v777;
  void *v778;
  const char *v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  void *v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  void *v787;
  unsigned int autoCapitalizationMode;
  id v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  uint64_t v794;
  const char *v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  uint64_t v799;
  uint64_t v800;
  const char *v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  void *v805;
  const char *v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  uint64_t v810;
  void *v811;
  void *v812;
  const char *v813;
  uint64_t v814;
  void *v815;
  const char *v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  void *v821;
  id v823;
  void *v824;
  void *v825;
  void *v826;
  void *v827;
  char v828;
  uint64_t v829;
  void *v830;
  void *v831;
  unint64_t v832;
  void *v833;
  void *v834;
  void *v835;
  id v836;
  id obj;
  uint64_t v838;
  void *v839;
  uint64_t v840;
  int v841;
  void *v842;
  NSDictionary *v843;
  void *v844;
  int shouldAutoCapitalizeSetting_locale;
  uint64_t v846;
  uint64_t v847;
  id v848;
  void *v849;
  _BOOL4 v850;
  uint64_t v851;
  unint64_t i;
  id *v853;
  id v855;
  double v856;
  double v857;
  double v858;
  double v859;
  double v860;
  double v861;
  double v862;
  double v863;
  uint64_t v864;
  uint64_t v865;
  void *v866;
  id v867;
  id v868;
  void *v869;
  uint64_t v870;
  id v871;
  id v872;
  _QWORD v873[4];
  id v874;
  __int128 *v875;
  __int128 *p_buf;
  __int128 v877;
  __int128 v878;
  __int128 v879;
  __int128 v880;
  __int128 v881;
  __int128 v882;
  __int128 v883;
  __int128 v884;
  _QWORD v885[4];
  id v886;
  _QWORD *v887;
  _QWORD *v888;
  uint64_t *v889;
  char v890;
  char v891;
  _QWORD v892[5];
  id v893;
  _QWORD v894[3];
  char v895;
  uint64_t v896;
  uint64_t *v897;
  uint64_t v898;
  char v899;
  __int128 v900;
  __int128 v901;
  __int128 v902;
  __int128 v903;
  __int128 v904;
  __int128 v905;
  __int128 v906;
  __int128 v907;
  __int128 v908;
  __int128 v909;
  __int128 v910;
  __int128 v911;
  _QWORD v912[3];
  BOOL v913;
  uint64_t v914;
  uint64_t *v915;
  uint64_t v916;
  uint64_t v917;
  __int128 v918;
  __int128 v919;
  __int128 v920;
  __int128 v921;
  _BYTE v922[128];
  _BYTE v923[5];
  __int128 v924;
  __int128 v925;
  __int128 v926;
  __int128 v927;
  __int128 v928;
  __int128 v929;
  __int128 v930;
  __int128 v931;
  __int128 buf;
  uint64_t v933;
  uint64_t (*v934)(uint64_t, uint64_t);
  void (*v935)(uint64_t);
  id v936;
  uint64_t v937;

  v937 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v823 = a4;
  v853 = v5;
  objc_msgSend_leftContext(v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v833 = v11;
  if (v11 && objc_msgSend_length(v11, v12, v13, v14, v15, v16))
  {
    objc_msgSend_lastComposedCharacter(v833, v12, v17, v18, v19, v16);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v21, v22, v23, v24, v25);
    v26 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v829) = isStringEntirelyFromSet(v20, v26);

    if (isCharacterLatinOrCommonScript(v20))
      HIDWORD(v829) = isCharacterCJKSymbolsPunctuations(v20) ^ 1;
    else
      BYTE4(v829) = 0;

    v828 = 0;
  }
  else
  {
    v829 = 0;
    v828 = 1;
  }
  shouldAutoCapitalizeSetting_locale = objc_msgSend_shouldCapitalizeGivenHistory_shouldAutoCapitalizeSetting_locale_(CHLanguageUtilities, v12, (uint64_t)v833, self->_shouldAutoCapitalize, (uint64_t)self->_locale, v16);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v27 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_stringForAutoCapitalizationMode_(CHRecognizerConfiguration, v28, self->_autoCapitalizationMode, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v32;
    _os_log_impl(&dword_1BE607000, v27, OS_LOG_TYPE_DEBUG, "CHLexiconCorrectionStep is running with autoCapitalizationMode: %@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v33, v34, v35, v36, v37);
  v824 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40, v41, v42);
  v825 = (void *)objc_claimAutoreleasedReturnValue();
  v832 = 0;
LABEL_13:
  objc_msgSend_result(v853, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v48, v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v832 < objc_msgSend_count(v54, v55, v56, v57, v58, v59);

  if (v60)
  {
    v835 = (void *)objc_msgSend_mutableCopy(v833, v61, v62, v63, v64, v65);
    objc_msgSend_result(v853, v66, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v71, v72, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v77, v78, v832, v79, v80, v81);
    v834 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v82, v83, v84, v85, v86);
    v826 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v87, v88, v89, v90, v91);
    v827 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95, v96);
    v830 = (void *)objc_claimAutoreleasedReturnValue();
    v896 = 0;
    v897 = &v896;
    v898 = 0x2020000000;
    v899 = 1;
    v894[0] = 0;
    v894[1] = v894;
    v894[2] = 0x2020000000;
    v895 = BYTE4(v829);
    v892[0] = 0;
    v892[1] = v892;
    v892[2] = 0x3032000000;
    v892[3] = sub_1BE8A7340;
    v892[4] = sub_1BE8A7350;
    v893 = v833;
    objc_msgSend_result(v853, v97, v98, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend_length(v834, v103, v104, v105, v106, v107);
    v885[0] = MEMORY[0x1E0C809B0];
    v885[1] = 3221225472;
    v885[2] = sub_1BE8A9384;
    v885[3] = &unk_1E77F66E0;
    v887 = v894;
    v888 = v892;
    v889 = &v896;
    v890 = v828;
    v891 = v829;
    v836 = v830;
    v886 = v836;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v102, v109, (uint64_t)v834, 0, v108, (uint64_t)v885);

    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v110, *((unsigned __int8 *)v897 + 24), v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v836, v115, (uint64_t)v114, v116, v117, v118);

    v844 = 0;
    v846 = 0;
    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend_length(v834, v119, v120, v121, v122, v123))
      {
        if ((objc_msgSend_isEqual_(v826, v124, (uint64_t)v827, v125, v126, v127) & 1) == 0)
        {
          objc_msgSend_addObject_(v824, v737, (uint64_t)v826, v738, v739, v740);
          objc_msgSend_result(v853, v741, v742, v743, v744, v745);
          v746 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_transcriptionPathScores(v746, v747, v748, v749, v750, v751);
          v752 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v752, v753, v832, v754, v755, v756);
          v757 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v825, v758, (uint64_t)v757, v759, v760, v761);

        }
        objc_msgSend_addObject_(v824, v737, (uint64_t)v827, v738, v739, v740);
        objc_msgSend_result(v853, v762, v763, v764, v765, v766);
        v767 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v767, v768, v769, v770, v771, v772);
        v773 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v773, v774, v832, v775, v776, v777);
        v778 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v825, v779, (uint64_t)v778, v780, v781, v782);

        _Block_object_dispose(v892, 8);
        _Block_object_dispose(v894, 8);
        _Block_object_dispose(&v896, 8);

        ++v832;
        goto LABEL_13;
      }
      v851 = objc_msgSend_indexAtPosition_(v834, v124, i, v125, v126, v127);
      objc_msgSend_result(v853, v128, v129, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v133, v134, v135, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v139, v140, i, v141, v142, v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTokenRows(v144, v145, v146, v147, v148, v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v150, v151, v851, v152, v153, v154);
      v831 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v155, v156, v157, v158, v159);
      v842 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v160, v161, v162, v163, v164);
      v839 = (void *)objc_claimAutoreleasedReturnValue();
      v883 = 0u;
      v884 = 0u;
      v882 = 0u;
      v881 = 0u;
      obj = v831;
      v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v165, (uint64_t)&v881, (uint64_t)v923, 16, v166);
      if (!v167)
        goto LABEL_102;
      v838 = *(_QWORD *)v882;
      do
      {
        v847 = 0;
        v840 = v167;
        do
        {
          if (*(_QWORD *)v882 != v838)
            objc_enumerationMutation(obj);
          v173 = *(void **)(*((_QWORD *)&v881 + 1) + 8 * v847);
          objc_msgSend_string(v173, v168, v169, v170, v171, v172);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v180 = objc_msgSend_length(v174, v175, v176, v177, v178, v179) == 0;

          if (v180)
          {
            objc_msgSend_addObject_(v839, v181, (uint64_t)v173, v182, v183, v184);
            objc_msgSend_addObject_(v842, v198, (uint64_t)v173, v199, v200, v201);
            goto LABEL_19;
          }
          objc_msgSend_objectAtIndex_(v836, v181, v846, v182, v183, v184);
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          v191 = objc_msgSend_BOOLValue(v185, v186, v187, v188, v189, v190);

          if (v191)
            v197 = self->_textReplacements;
          else
            v197 = 0;
          objc_msgSend_string(v173, v192, v193, v194, v195, v196);
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v841 = objc_msgSend_length(v202, v203, v204, v205, v206, v207) == 1
              && objc_msgSend_length(v834, v208, v209, v210, v211, v212) == 1
              && objc_msgSend_count(obj, v213, v214, v215, v216, v217) == 1;

          v850 = v846 == 0;
          v218 = v173;
          v848 = v835;
          v843 = v197;
          v219 = v218;
          v849 = v219;
          if (!self->_shouldCreatePseudoTokens)
            goto LABEL_77;
          v871 = v219;
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v220, v221, v222, v223, v224);
          v869 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v871, v225, v226, v227, v228, v229);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v231, v232, v233, v234, v235);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByCharactersInSet_(v230, v237, (uint64_t)v236, v238, v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();

          v920 = 0u;
          v921 = 0u;
          v918 = 0u;
          v919 = 0u;
          v855 = v241;
          v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v855, v242, (uint64_t)&v918, (uint64_t)&buf, 16, v243);
          if (v244)
          {
            v864 = *(_QWORD *)v919;
            do
            {
              v250 = 0;
              v865 = v244;
              do
              {
                if (*(_QWORD *)v919 != v864)
                  objc_enumerationMutation(v855);
                v251 = *(void **)(*((_QWORD *)&v918 + 1) + 8 * v250);
                if (objc_msgSend_length(v251, v245, v246, v247, v248, v249))
                {
                  v914 = 0;
                  v915 = &v914;
                  v916 = 0x2020000000;
                  v917 = 0;
                  v917 = objc_msgSend_properties(v871, v245, v246, v247, v248, v249);
                  if (objc_msgSend_count(v869, v252, v253, v254, v255, v256))
                    v915[3] |= 0x20uLL;
                  v912[0] = 0;
                  v912[1] = v912;
                  v912[2] = 0x2020000000;
                  v913 = 0;
                  objc_msgSend_firstComposedCharacter(v251, v257, v258, v259, v260, v261);
                  v262 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v263 = isCharacterLatinOrCommonScript(v262);

                  v913 = v263;
                  *(_QWORD *)&v908 = 0;
                  *((_QWORD *)&v908 + 1) = &v908;
                  *(_QWORD *)&v909 = 0x3032000000;
                  *((_QWORD *)&v909 + 1) = sub_1BE8A7340;
                  *(_QWORD *)&v910 = sub_1BE8A7350;
                  objc_msgSend_string(MEMORY[0x1E0CB37A0], v264, v265, v266, v267, v268);
                  *((_QWORD *)&v910 + 1) = objc_claimAutoreleasedReturnValue();
                  v274 = objc_msgSend_length(v251, v269, v270, v271, v272, v273);
                  *(_QWORD *)&v900 = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&v900 + 1) = 3221225472;
                  *(_QWORD *)&v901 = sub_1BE8A7408;
                  *((_QWORD *)&v901 + 1) = &unk_1E77F66B8;
                  *(_QWORD *)&v903 = v912;
                  *((_QWORD *)&v903 + 1) = &v908;
                  v275 = v871;
                  *(_QWORD *)&v902 = v275;
                  *(_QWORD *)&v904 = &v914;
                  v276 = v869;
                  *((_QWORD *)&v902 + 1) = v276;
                  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v251, v277, 0, v274, 2, (uint64_t)&v900);
                  if (objc_msgSend_length(*(void **)(*((_QWORD *)&v908 + 1) + 40), v278, v279, v280, v281, v282))
                  {
                    v288 = *(_QWORD *)(*((_QWORD *)&v908 + 1) + 40);
                    objc_msgSend_strokeIndexes(v275, v283, v284, v285, v286, v287);
                    v867 = (id)objc_claimAutoreleasedReturnValue();
                    v294 = objc_msgSend_wordID(v275, v289, v290, v291, v292, v293);
                    objc_msgSend_modelScore(v275, v295, v296, v297, v298, v299);
                    v301 = v300;
                    objc_msgSend_recognitionScore(v275, v302, v303, v304, v305, v306);
                    v308 = v307;
                    objc_msgSend_combinedScore(v275, v309, v310, v311, v312, v313);
                    v315 = v314;
                    objc_msgSend_alignmentScore(v275, v316, v317, v318, v319, v320);
                    v322 = v321;
                    v323 = v915[3];
                    objc_msgSend_recognizerSourceLocale(v275, v324, v325, v326, v327, v328);
                    v329 = (void *)objc_claimAutoreleasedReturnValue();
                    v856 = v322;
                    v858 = v315;
                    v860 = v308;
                    v862 = v301;
                    v335 = objc_msgSend_inputSources(v275, v330, v331, v332, v333, v334);
                    v341 = objc_msgSend_substrokeCount(v275, v336, v337, v338, v339, v340);
                    objc_msgSend_bounds(v275, v342, v343, v344, v345, v346);
                    v348 = v347;
                    v350 = v349;
                    v352 = v351;
                    v354 = v353;
                    objc_msgSend_originalBounds(v275, v355, v356, v357, v358, v359);
                    v366 = v365;
                    v368 = v367;
                    v370 = v369;
                    v372 = v371;
                    if (v871)
                    {
                      objc_msgSend_principalLines(v275, v360, v361, v362, v363, v364);
                    }
                    else
                    {
                      v930 = 0u;
                      v931 = 0u;
                      v928 = 0u;
                      v929 = 0u;
                      v926 = 0u;
                      v927 = 0u;
                      v924 = 0u;
                      v925 = 0u;
                    }
                    objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v360, v288, (uint64_t)v867, v294, v323, v329, v335, v862, v860, v858, v856, v348, v350, v352, v354, v341, v366, v368,
                      v370,
                      v372,
                      &v924);
                    v373 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend_addObject_(v276, v374, (uint64_t)v373, v375, v376, v377);
                  }

                  _Block_object_dispose(&v908, 8);
                  _Block_object_dispose(v912, 8);
                  _Block_object_dispose(&v914, 8);
                }
                ++v250;
              }
              while (v865 != v250);
              v244 = objc_msgSend_countByEnumeratingWithState_objects_count_(v855, v245, (uint64_t)&v918, (uint64_t)&buf, 16, v249);
            }
            while (v244);
          }

          if (v869)
          {
            if ((unint64_t)objc_msgSend_count(v869, v378, v379, v380, v381, v382) >= 2)
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v383, v384, v385, v386, v387);
              v388 = (void *)objc_claimAutoreleasedReturnValue();
              v394 = (void *)objc_msgSend_mutableCopy(v848, v389, v390, v391, v392, v393);
              v920 = 0u;
              v921 = 0u;
              v918 = 0u;
              v919 = 0u;
              v868 = v869;
              v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(v868, v395, (uint64_t)&v918, (uint64_t)&buf, 16, v396);
              if (v397)
              {
                v398 = *(_QWORD *)v919;
                do
                {
                  if (*(_QWORD *)v919 != v398)
                    objc_enumerationMutation(v868);
                  sub_1BE8A6430((uint64_t)self, **((void ***)&v918 + 1), v850, v394, shouldAutoCapitalizeSetting_locale & v850, 0, 0, 0);
                  v399 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend_properties(v399, v400, v401, v402, v403, v404) & 0x20) != 0)
                    objc_msgSend_appendString_(v394, v405, (uint64_t)CFSTR(" "), v407, v408, v409);
                  objc_msgSend_string(v399, v405, v406, v407, v408, v409);
                  v410 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_appendString_(v394, v411, (uint64_t)v410, v412, v413, v414);

                  objc_msgSend_addObject_(v388, v415, (uint64_t)v399, v416, v417, v418);
                  if (v397 >= 2)
                  {
                    for (j = 1; j != v397; ++j)
                    {
                      if (*(_QWORD *)v919 != v398)
                        objc_enumerationMutation(v868);
                      sub_1BE8A6430((uint64_t)self, *(void **)(*((_QWORD *)&v918 + 1) + 8 * j), 0, v394, 0, 0, 0, 0);
                      v422 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend_properties(v422, v423, v424, v425, v426, v427) & 0x20) != 0)
                        objc_msgSend_appendString_(v394, v428, (uint64_t)CFSTR(" "), v430, v431, v432);
                      objc_msgSend_string(v422, v428, v429, v430, v431, v432);
                      v433 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_appendString_(v394, v434, (uint64_t)v433, v435, v436, v437);

                      objc_msgSend_addObject_(v388, v438, (uint64_t)v422, v439, v440, v441);
                    }
                  }
                  v397 = objc_msgSend_countByEnumeratingWithState_objects_count_(v868, v419, (uint64_t)&v918, (uint64_t)&buf, 16, v420);
                  v850 = 0;
                }
                while (v397);
              }

              v447 = objc_msgSend_inputSources(v871, v442, v443, v444, v445, v446);
              objc_msgSend_string(MEMORY[0x1E0CB37A0], v448, v449, v450, v451, v452);
              v453 = (void *)objc_claimAutoreleasedReturnValue();
              v910 = 0u;
              v911 = 0u;
              v908 = 0u;
              v909 = 0u;
              v454 = v388;
              v462 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v455, (uint64_t)&v908, (uint64_t)&v924, 16, v456);
              if (v462)
              {
                v463 = *(_QWORD *)v909;
                do
                {
                  for (k = 0; k != v462; ++k)
                  {
                    if (*(_QWORD *)v909 != v463)
                      objc_enumerationMutation(v454);
                    v465 = *(void **)(*((_QWORD *)&v908 + 1) + 8 * k);
                    if (objc_msgSend_length(v453, v457, v458, v459, v460, v461)
                      && (objc_msgSend_properties(v465, v466, v467, v468, v469, v470) & 0x20) != 0)
                    {
                      objc_msgSend_appendString_(v453, v466, (uint64_t)CFSTR(" "), v468, v469, v470);
                    }
                    objc_msgSend_string(v465, v466, v467, v468, v469, v470);
                    v471 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_appendString_(v453, v472, (uint64_t)v471, v473, v474, v475);

                    v447 |= objc_msgSend_inputSources(v465, v476, v477, v478, v479, v480);
                  }
                  v462 = objc_msgSend_countByEnumeratingWithState_objects_count_(v454, v457, (uint64_t)&v908, (uint64_t)&v924, 16, v461);
                }
                while (v462);
              }

              objc_msgSend_string(v871, v481, v482, v483, v484, v485);
              v486 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v453, v487, (uint64_t)v486, v488, v489, v490);

              if ((isEqualToString & 1) == 0)
              {
                objc_msgSend_strokeIndexes(v871, v492, v493, v494, v495, v496);
                v866 = (void *)objc_claimAutoreleasedReturnValue();
                v502 = objc_msgSend_wordID(v871, v497, v498, v499, v500, v501);
                objc_msgSend_modelScore(v871, v503, v504, v505, v506, v507);
                v863 = v508;
                objc_msgSend_recognitionScore(v871, v509, v510, v511, v512, v513);
                v861 = v514;
                objc_msgSend_combinedScore(v871, v515, v516, v517, v518, v519);
                v859 = v520;
                objc_msgSend_alignmentScore(v871, v521, v522, v523, v524, v525);
                v857 = v526;
                v532 = objc_msgSend_properties(v871, v527, v528, v529, v530, v531);
                objc_msgSend_recognizerSourceLocale(v871, v533, v534, v535, v536, v537);
                v538 = (void *)objc_claimAutoreleasedReturnValue();
                v544 = objc_msgSend_substrokeCount(v871, v539, v540, v541, v542, v543);
                objc_msgSend_bounds(v871, v545, v546, v547, v548, v549);
                v551 = v550;
                v553 = v552;
                v555 = v554;
                v557 = v556;
                objc_msgSend_originalBounds(v871, v558, v559, v560, v561, v562);
                v569 = v568;
                v571 = v570;
                v573 = v572;
                v575 = v574;
                if (v871)
                {
                  objc_msgSend_principalLines(v871, v563, v564, v565, v566, v567);
                }
                else
                {
                  v906 = 0u;
                  v907 = 0u;
                  v904 = 0u;
                  v905 = 0u;
                  v902 = 0u;
                  v903 = 0u;
                  v900 = 0u;
                  v901 = 0u;
                }
                objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v563, (uint64_t)v453, (uint64_t)v866, v502, v532, v538, v447, v863, v861, v859, v857, v551, v553, v555, v557, v544, v569, v571,
                  v573,
                  v575,
                  &v900);
                v736 = objc_claimAutoreleasedReturnValue();

                v871 = (id)v736;
              }

              v869 = v868;
              goto LABEL_79;
            }
          }
          else
          {
LABEL_77:
            v869 = 0;
          }
          sub_1BE8A6430((uint64_t)self, v849, v846 == 0, v848, shouldAutoCapitalizeSetting_locale, v843, v841, 1);
          v454 = v849;
          v871 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

          v576 = (void *)objc_opt_class();
          objc_msgSend_validatedTokenForCorrectedToken_rawToken_autoCapitalizationMode_(v576, v577, (uint64_t)v871, (uint64_t)v849, self->_autoCapitalizationMode, v578);
          v579 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_string(v579, v580, v581, v582, v583, v584);
          v585 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v849, v586, v587, v588, v589, v590);
          v591 = (void *)objc_claimAutoreleasedReturnValue();
          v596 = objc_msgSend_isEqualToString_(v585, v592, (uint64_t)v591, v593, v594, v595);

          if ((v596 & 1) == 0)
          {
            for (m = 0; ; m = v662 + 1)
            {
              objc_msgSend_result(v853, v597, v598, v599, v600, v601);
              v638 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_tokenColumns(v638, v639, v640, v641, v642, v643);
              v644 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v644, v645, i, v646, v647, v648);
              v649 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_textTokenRows(v649, v650, v651, v652, v653, v654);
              v655 = (void *)objc_claimAutoreleasedReturnValue();
              v870 = m;
              v661 = m < objc_msgSend_count(v655, v656, v657, v658, v659, v660);

              if (!v661)
                break;
              v662 = v870;
              if (v870 != v851)
              {
                objc_msgSend_result(v853, v597, v598, v599, v600, v601);
                v663 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_tokenColumns(v663, v664, v665, v666, v667, v668);
                v669 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v669, v670, i, v671, v672, v673);
                v674 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_textTokenRows(v674, v675, v676, v677, v678, v679);
                v680 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v680, v681, v870, v682, v683, v684);
                v685 = (void *)objc_claimAutoreleasedReturnValue();

                v879 = 0u;
                v880 = 0u;
                v877 = 0u;
                v878 = 0u;
                v872 = v685;
                v693 = objc_msgSend_countByEnumeratingWithState_objects_count_(v872, v686, (uint64_t)&v877, (uint64_t)v922, 16, v687);
                if (v693)
                {
                  v694 = *(_QWORD *)v878;
                  do
                  {
                    for (n = 0; n != v693; ++n)
                    {
                      if (*(_QWORD *)v878 != v694)
                        objc_enumerationMutation(v872);
                      v696 = *(void **)(*((_QWORD *)&v877 + 1) + 8 * n);
                      if ((objc_msgSend_inputSources(v696, v688, v689, v690, v691, v692) & 0x20) == 0)
                      {
                        objc_msgSend_string(v696, v688, v689, v690, v691, v692);
                        v697 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend_string(v579, v698, v699, v700, v701, v702);
                        v703 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend_isEqualToString_(v697, v704, (uint64_t)v703, v705, v706, v707) & 1) != 0)
                        {
                          objc_msgSend_strokeIndexes(v696, v708, v709, v710, v711, v712);
                          v713 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_strokeIndexes(v579, v714, v715, v716, v717, v718);
                          v719 = (void *)objc_claimAutoreleasedReturnValue();
                          isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v713, v720, (uint64_t)v719, v721, v722, v723);

                          if (isEqualToIndexSet)
                          {
                            v725 = (void *)objc_msgSend_mutableCopy(v579, v688, v689, v690, v691, v692);

                            objc_msgSend_modelScore(v696, v726, v727, v728, v729, v730);
                            v579 = v725;
                            objc_msgSend_setModelScore_(v725, v731, v732, v733, v734, v735);
                          }
                        }
                        else
                        {

                        }
                      }
                    }
                    v693 = objc_msgSend_countByEnumeratingWithState_objects_count_(v872, v688, (uint64_t)&v877, (uint64_t)v922, 16, v692);
                  }
                  while (v693);
                }

                v662 = v870;
              }
            }
          }
          objc_msgSend_addObject_(v839, v597, (uint64_t)v849, v599, v600, v601);
          objc_msgSend_addObject_(v842, v602, (uint64_t)v579, v603, v604, v605);
          objc_msgSend_lastObject(v842, v606, v607, v608, v609, v610);
          v611 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_result(v853, v612, v613, v614, v615, v616);
          v617 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_precedingSeparatorForToken_(v617, v618, (uint64_t)v611, v619, v620, v621);
          v622 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v848, v623, (uint64_t)v622, v624, v625, v626);

          objc_msgSend_string(v611, v627, v628, v629, v630, v631);
          v632 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v848, v633, (uint64_t)v632, v634, v635, v636);

          ++v846;
          v844 = v611;
LABEL_19:
          ++v847;
        }
        while (v847 != v840);
        v167 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v168, (uint64_t)&v881, (uint64_t)v923, 16, v172);
      }
      while (v167);
LABEL_102:

      sub_1BE8A313C((uint64_t)CHPostprocessingStep, v842, v839, v826, v827);
    }
  }
  objc_msgSend_result(v853, v61, v62, v63, v64, v65);
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v783, v784, (uint64_t)v824, (uint64_t)v825, v785, v786);
  v787 = (void *)objc_claimAutoreleasedReturnValue();
  if (v853)
    objc_storeStrong(v853 + 3, v787);

  if (self->_phraseLexicon || self->_customPhraseLexicon)
  {
    autoCapitalizationMode = self->_autoCapitalizationMode;
    if (autoCapitalizationMode > 5 || ((1 << autoCapitalizationMode) & 0x31) == 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v933 = 0x3032000000;
      v934 = sub_1BE8A7340;
      v935 = sub_1BE8A7350;
      v789 = v833;
      v936 = v789;
      if (objc_msgSend_length(v789, v790, v791, v792, v793, v794))
      {
        *(_QWORD *)&v924 = 0;
        *((_QWORD *)&v924 + 1) = &v924;
        v925 = 0x2020000000uLL;
        v800 = objc_msgSend_length(v789, v795, v796, v797, v798, v799);
        v873[0] = MEMORY[0x1E0C809B0];
        v873[1] = 3221225472;
        v873[2] = sub_1BE8A964C;
        v873[3] = &unk_1E77F2818;
        v875 = &v924;
        p_buf = &buf;
        v874 = v789;
        objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v874, v801, 0, v800, 259, (uint64_t)v873);

        _Block_object_dispose(&v924, 8);
      }
      if (self->_phraseLexicon)
      {
        objc_msgSend_result(v853, v795, v796, v797, v798, v799);
        v802 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phraseCaseCorrectedResultWithHistory_phraseLexicon_maxPhraseLength_(v802, v803, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), (uint64_t)self->_phraseLexicon, 3, v804);
        v805 = (void *)objc_claimAutoreleasedReturnValue();
        v811 = (void *)objc_msgSend_mutableCopy(v805, v806, v807, v808, v809, v810);
        sub_1BE8A2C6C((uint64_t)v853, v811);

      }
      if (self->_customPhraseLexicon)
      {
        objc_msgSend_result(v853, v795, v796, v797, v798, v799);
        v812 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_phraseCaseCorrectedResultWithHistory_phraseLexicon_maxPhraseLength_(v812, v813, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), (uint64_t)self->_customPhraseLexicon, 3, v814);
        v815 = (void *)objc_claimAutoreleasedReturnValue();
        v821 = (void *)objc_msgSend_mutableCopy(v815, v816, v817, v818, v819, v820);
        sub_1BE8A2C6C((uint64_t)v853, v821);

      }
      _Block_object_dispose(&buf, 8);

    }
  }

  return v853;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_staticLexicon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuationThatExpectsUppercaseAfter, 0);
  objc_storeStrong((id *)&self->_fullWidthPunctuationThatExpectsUppercaseAfter, 0);
  objc_storeStrong((id *)&self->_consumableStrokesCharSet, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
