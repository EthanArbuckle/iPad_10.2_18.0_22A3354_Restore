@implementation CHCharacterSetRules

+ (unint64_t)expectedMaxStrokeCount:(unsigned int)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (qword_1EF568428 != -1)
    dispatch_once(&qword_1EF568428, &unk_1E77F1AB0);
  v4 = (id)qword_1EF568420;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
    v5 = v4[33];
  else
    v5 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE85C6C0;
  block[3] = &unk_1E77F63E8;
  v10 = v4;
  v11 = &v13;
  v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)expectedMinStrokeCount:(unsigned int)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (qword_1EF568428 != -1)
    dispatch_once(&qword_1EF568428, &unk_1E77F1AB0);
  v4 = (id)qword_1EF568420;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
    v5 = v4[33];
  else
    v5 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE85C9EC;
  block[3] = &unk_1E77F63E8;
  v10 = v4;
  v11 = &v13;
  v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)expectedMaxDotCount:(unsigned int)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (qword_1EF568428 != -1)
    dispatch_once(&qword_1EF568428, &unk_1E77F1AB0);
  v4 = (id)qword_1EF568420;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
    v5 = v4[33];
  else
    v5 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE85CB5C;
  block[3] = &unk_1E77F63E8;
  v10 = v4;
  v11 = &v13;
  v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)characterType:(unsigned int)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (qword_1EF568428 != -1)
    dispatch_once(&qword_1EF568428, &unk_1E77F1AB0);
  v4 = (id)qword_1EF568420;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (v4)
    v5 = v4[33];
  else
    v5 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE85CCB8;
  block[3] = &unk_1E77F63E8;
  v10 = v4;
  v11 = &v13;
  v12 = a3;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (unint64_t)characterTypeFromString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
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
  unint64_t v29;
  int v31;
  _DWORD v32[7];

  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v4, v5, 0, v6, v7, v8);
  if (v16 != (const char *)objc_msgSend_length(v4, v16, v9, v10, v11, v12))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v17 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v31 = 138412290;
      *(_QWORD *)v32 = v4;
      _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_FAULT, "Method can only be called on a single character string: %@", (uint8_t *)&v31, 0xCu);
    }

  }
  v18 = objc_msgSend_codepointAtIndex_outRange_(v4, v13, 0, (uint64_t)&v31, v14, v15);
  v19 = *(_QWORD *)&v32[1];
  if (v19 == objc_msgSend_length(v4, v20, v21, v22, v23, v24))
    v29 = objc_msgSend_characterType_(a1, v25, v18, v26, v27, v28);
  else
    v29 = 0;

  return v29;
}

- (CHCharacterSetRules)init
{
  CHCharacterSetRules *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *charSetRulesQueue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSCharacterSet *lowercaseCharSet;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSCharacterSet *uppercaseCharSet;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSCharacterSet *digitCharSet;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSCharacterSet *startPunctuationCharSet;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSCharacterSet *middlePunctuationCharSet;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSCharacterSet *endOfWordPunctuationCharSet;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSCharacterSet *endOfSentencePunctuationCharSet;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSCharacterSet *digitStartPunctuationCharSet;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSCharacterSet *digitEndPunctuationCharSet;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSCharacterSet *arithmeticOperatorCharSet;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSCharacterSet *dateTimeSeparatorCharSet;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSCharacterSet *dateTimeEndLetterCharSet;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSCharacterSet *numeralEndLetterCharSet;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSCharacterSet *lexiconSkipCharSet;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSCharacterSet *containsDotCharSet;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSCharacterSet *containsTwoDotsCharSet;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSCharacterSet *prefixCapitalizationExceptionCharSet;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSCharacterSet *selfLoopPunctuationCharSet;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSCharacterSet *emoticonTopCharSet;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSCharacterSet *emoticonMiddleCharSet;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSCharacterSet *emoticonBottomCharSet;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSCharacterSet *emailAtCharSet;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  NSCharacterSet *emailPunctuationCharSet;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  NSCharacterSet *urlPunctuationCharSet;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  NSCharacterSet *nonSpaceSeparatorCharSet;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  NSCharacterSet *punctuationThatNeedSpaceCleanup;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSCharacterSet *symbolsRequiringSpaceBeforeInFrench;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSCharacterSet *currencySymbols;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  NSCharacterSet *sentenceStartPunctuationInSpanish;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSCharacterSet *commonJapaneseSymbols;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  NSCharacterSet *CJKPairedPunctuationsCharSet;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  NSCharacterSet *alphaNumericCharSet;
  objc_super v208;

  v208.receiver = self;
  v208.super_class = (Class)CHCharacterSetRules;
  v2 = -[CHCharacterSetRules init](&v208, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.CoreHandwriting.CHCharacterSetsRules", v3);
    charSetRulesQueue = v2->__charSetRulesQueue;
    v2->__charSetRulesQueue = (OS_dispatch_queue *)v4;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v6, (uint64_t)CFSTR("abcdefghijklmnopqrstuvwxyzàáâãäçèéêëìíîïñòóôõöùúûü\xFFœæß"), v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    lowercaseCharSet = v2->_lowercaseCharSet;
    v2->_lowercaseCharSet = (NSCharacterSet *)v10;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v12, (uint64_t)CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜŸŒÆ"), v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    uppercaseCharSet = v2->_uppercaseCharSet;
    v2->_uppercaseCharSet = (NSCharacterSet *)v16;

    objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v18, v19, v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    digitCharSet = v2->_digitCharSet;
    v2->_digitCharSet = (NSCharacterSet *)v23;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v25, (uint64_t)CFSTR("\"#@(¡¿“„«"), v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    startPunctuationCharSet = v2->_startPunctuationCharSet;
    v2->_startPunctuationCharSet = (NSCharacterSet *)v29;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v31, (uint64_t)CFSTR("-'_"), v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    middlePunctuationCharSet = v2->_middlePunctuationCharSet;
    v2->_middlePunctuationCharSet = (NSCharacterSet *)v35;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v37, (uint64_t)CFSTR(".,;:)!?\"“»"),
      v38,
      v39,
      v40);
    v41 = objc_claimAutoreleasedReturnValue();
    endOfWordPunctuationCharSet = v2->_endOfWordPunctuationCharSet;
    v2->_endOfWordPunctuationCharSet = (NSCharacterSet *)v41;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v43, (uint64_t)CFSTR(".!?"), v44, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    endOfSentencePunctuationCharSet = v2->_endOfSentencePunctuationCharSet;
    v2->_endOfSentencePunctuationCharSet = (NSCharacterSet *)v47;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v49, (uint64_t)CFSTR("$€¢£-.+["), v50, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    digitStartPunctuationCharSet = v2->_digitStartPunctuationCharSet;
    v2->_digitStartPunctuationCharSet = (NSCharacterSet *)v53;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v55, (uint64_t)CFSTR("%?!.,:;)\"])$€¢£₽°"),
      v56,
      v57,
      v58);
    v59 = objc_claimAutoreleasedReturnValue();
    digitEndPunctuationCharSet = v2->_digitEndPunctuationCharSet;
    v2->_digitEndPunctuationCharSet = (NSCharacterSet *)v59;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v61, (uint64_t)CFSTR("^*+=<>.,"), v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    arithmeticOperatorCharSet = v2->_arithmeticOperatorCharSet;
    v2->_arithmeticOperatorCharSet = (NSCharacterSet *)v65;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v67, (uint64_t)CFSTR(":'\"-/"), v68, v69, v70);
    v71 = objc_claimAutoreleasedReturnValue();
    dateTimeSeparatorCharSet = v2->_dateTimeSeparatorCharSet;
    v2->_dateTimeSeparatorCharSet = (NSCharacterSet *)v71;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v73, (uint64_t)CFSTR("apmAPM."), v74, v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();
    dateTimeEndLetterCharSet = v2->_dateTimeEndLetterCharSet;
    v2->_dateTimeEndLetterCharSet = (NSCharacterSet *)v77;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v79, (uint64_t)CFSTR("strdndth."), v80, v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    numeralEndLetterCharSet = v2->_numeralEndLetterCharSet;
    v2->_numeralEndLetterCharSet = (NSCharacterSet *)v83;

    objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E0CB3500], v85, v86, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_invertedSet(v90, v91, v92, v93, v94, v95);
    v96 = objc_claimAutoreleasedReturnValue();
    lexiconSkipCharSet = v2->_lexiconSkipCharSet;
    v2->_lexiconSkipCharSet = (NSCharacterSet *)v96;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v98, (uint64_t)CFSTR("!?:;ij%¡¿ÄËÏÖÜŸäëïöü\xFF"),
      v99,
      v100,
      v101);
    v102 = objc_claimAutoreleasedReturnValue();
    containsDotCharSet = v2->_containsDotCharSet;
    v2->_containsDotCharSet = (NSCharacterSet *)v102;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v104, (uint64_t)CFSTR(":;%ÄËÏÖÜŸäëïöü\xFF"),
      v105,
      v106,
      v107);
    v108 = objc_claimAutoreleasedReturnValue();
    containsTwoDotsCharSet = v2->_containsTwoDotsCharSet;
    v2->_containsTwoDotsCharSet = (NSCharacterSet *)v108;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v110, (uint64_t)CFSTR("@#"), v111, v112, v113);
    v114 = objc_claimAutoreleasedReturnValue();
    prefixCapitalizationExceptionCharSet = v2->_prefixCapitalizationExceptionCharSet;
    v2->_prefixCapitalizationExceptionCharSet = (NSCharacterSet *)v114;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v116, (uint64_t)CFSTR("!?."), v117, v118, v119);
    v120 = objc_claimAutoreleasedReturnValue();
    selfLoopPunctuationCharSet = v2->_selfLoopPunctuationCharSet;
    v2->_selfLoopPunctuationCharSet = (NSCharacterSet *)v120;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v122, (uint64_t)CFSTR(":;B="),
      v123,
      v124,
      v125);
    v126 = objc_claimAutoreleasedReturnValue();
    emoticonTopCharSet = v2->_emoticonTopCharSet;
    v2->_emoticonTopCharSet = (NSCharacterSet *)v126;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v128, (uint64_t)CFSTR("-'"), v129, v130, v131);
    v132 = objc_claimAutoreleasedReturnValue();
    emoticonMiddleCharSet = v2->_emoticonMiddleCharSet;
    v2->_emoticonMiddleCharSet = (NSCharacterSet *)v132;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v134, (uint64_t)CFSTR(")(pPDoOxX*"), v135, v136, v137);
    v138 = objc_claimAutoreleasedReturnValue();
    emoticonBottomCharSet = v2->_emoticonBottomCharSet;
    v2->_emoticonBottomCharSet = (NSCharacterSet *)v138;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v140, (uint64_t)CFSTR("@"), v141, v142, v143);
    v144 = objc_claimAutoreleasedReturnValue();
    emailAtCharSet = v2->_emailAtCharSet;
    v2->_emailAtCharSet = (NSCharacterSet *)v144;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v146, (uint64_t)CFSTR("_-.+"), v147, v148, v149);
    v150 = objc_claimAutoreleasedReturnValue();
    emailPunctuationCharSet = v2->_emailPunctuationCharSet;
    v2->_emailPunctuationCharSet = (NSCharacterSet *)v150;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v152, (uint64_t)CFSTR("_-.:/+&?%()$="), v153, v154, v155);
    v156 = objc_claimAutoreleasedReturnValue();
    urlPunctuationCharSet = v2->_urlPunctuationCharSet;
    v2->_urlPunctuationCharSet = (NSCharacterSet *)v156;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v158, (uint64_t)CFSTR("-/.@_"), v159, v160, v161);
    v162 = objc_claimAutoreleasedReturnValue();
    nonSpaceSeparatorCharSet = v2->_nonSpaceSeparatorCharSet;
    v2->_nonSpaceSeparatorCharSet = (NSCharacterSet *)v162;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v164, (uint64_t)CFSTR(".,!?;:۔،؛؟"),
      v165,
      v166,
      v167);
    v168 = objc_claimAutoreleasedReturnValue();
    punctuationThatNeedSpaceCleanup = v2->_punctuationThatNeedSpaceCleanup;
    v2->_punctuationThatNeedSpaceCleanup = (NSCharacterSet *)v168;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v170, (uint64_t)CFSTR("!?:;"),
      v171,
      v172,
      v173);
    v174 = objc_claimAutoreleasedReturnValue();
    symbolsRequiringSpaceBeforeInFrench = v2->_symbolsRequiringSpaceBeforeInFrench;
    v2->_symbolsRequiringSpaceBeforeInFrench = (NSCharacterSet *)v174;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v176, (uint64_t)CFSTR("$£€¥₽₫"), v177, v178, v179);
    v180 = objc_claimAutoreleasedReturnValue();
    currencySymbols = v2->_currencySymbols;
    v2->_currencySymbols = (NSCharacterSet *)v180;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v182, (uint64_t)CFSTR("¡¿"), v183, v184, v185);
    v186 = objc_claimAutoreleasedReturnValue();
    sentenceStartPunctuationInSpanish = v2->_sentenceStartPunctuationInSpanish;
    v2->_sentenceStartPunctuationInSpanish = (NSCharacterSet *)v186;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v188, (uint64_t)CFSTR("〒"), v189, v190, v191);
    v192 = objc_claimAutoreleasedReturnValue();
    commonJapaneseSymbols = v2->_commonJapaneseSymbols;
    v2->_commonJapaneseSymbols = (NSCharacterSet *)v192;

    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v194, (uint64_t)CFSTR("()［］【】《》『』「」〈〉｛｝（）〝〟"), v195, v196, v197);
    v198 = objc_claimAutoreleasedReturnValue();
    CJKPairedPunctuationsCharSet = v2->_CJKPairedPunctuationsCharSet;
    v2->_CJKPairedPunctuationsCharSet = (NSCharacterSet *)v198;

    objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E0CB3500], v200, v201, v202, v203, v204);
    v205 = objc_claimAutoreleasedReturnValue();
    alphaNumericCharSet = v2->_alphaNumericCharSet;
    v2->_alphaNumericCharSet = (NSCharacterSet *)v205;

  }
  return v2;
}

- (void).cxx_destruct
{
  sub_1BE671438((_QWORD *)self->_signatureUniChar.__tree_.__pair1_.__value_.__left_);
  sub_1BE62033C((uint64_t)&self->_strokeMaxPenalties, (_QWORD *)self->_strokeMaxPenalties.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->__charSetRulesQueue, 0);
  objc_storeStrong((id *)&self->_alphaNumericCharSet, 0);
  objc_storeStrong((id *)&self->_CJKPairedPunctuationsCharSet, 0);
  objc_storeStrong((id *)&self->_commonJapaneseSymbols, 0);
  objc_storeStrong((id *)&self->_sentenceStartPunctuationInSpanish, 0);
  objc_storeStrong((id *)&self->_symbolsRequiringSpaceBeforeInFrench, 0);
  objc_storeStrong((id *)&self->_currencySymbols, 0);
  objc_storeStrong((id *)&self->_punctuationThatNeedSpaceCleanup, 0);
  objc_storeStrong((id *)&self->_nonSpaceSeparatorCharSet, 0);
  objc_storeStrong((id *)&self->_urlPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_emailPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_emailAtCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonBottomCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonMiddleCharSet, 0);
  objc_storeStrong((id *)&self->_emoticonTopCharSet, 0);
  objc_storeStrong((id *)&self->_selfLoopPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_prefixCapitalizationExceptionCharSet, 0);
  objc_storeStrong((id *)&self->_containsTwoDotsCharSet, 0);
  objc_storeStrong((id *)&self->_containsDotCharSet, 0);
  objc_storeStrong((id *)&self->_lexiconSkipCharSet, 0);
  objc_storeStrong((id *)&self->_numeralEndLetterCharSet, 0);
  objc_storeStrong((id *)&self->_dateTimeEndLetterCharSet, 0);
  objc_storeStrong((id *)&self->_dateTimeSeparatorCharSet, 0);
  objc_storeStrong((id *)&self->_arithmeticOperatorCharSet, 0);
  objc_storeStrong((id *)&self->_digitEndPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_digitStartPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_endOfSentencePunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_endOfWordPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_middlePunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_startPunctuationCharSet, 0);
  objc_storeStrong((id *)&self->_digitCharSet, 0);
  objc_storeStrong((id *)&self->_uppercaseCharSet, 0);
  objc_storeStrong((id *)&self->_lowercaseCharSet, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = (char *)self + 280;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 37) = (char *)self + 304;
  return self;
}

@end
