@implementation CHLanguageUtilities

+ (unsigned)normalizeLMTokenIDForWord:(id)a3 tokenID:(unsigned int)a4 isFromPattern:(BOOL)a5 score:(double *)a6 wordLanguageModel:(void *)a7
{
  _BOOL4 v7;
  id v9;
  int TokenIDForString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  unsigned int v18;

  v7 = a5;
  v9 = a3;
  if (v7)
    TokenIDForString = 3;
  else
    TokenIDForString = a4;
  if (!TokenIDForString)
  {
    TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (!TokenIDForString)
    {
      objc_msgSend_lowercaseString(v9, v11, v12, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TokenIDForString = LMLanguageModelGetTokenIDForString();

    }
  }
  if (TokenIDForString == 28)
    v17 = 6;
  else
    v17 = TokenIDForString;
  if ((v17 & 0xFFFFFFFE) == 0x82)
    v17 = 3;
  if (v17 == 46)
    v18 = 0;
  else
    v18 = v17;

  return v18;
}

+ (id)tokensRangesForString:(id)a3 outTokenIDs:(id *)a4 wordLanguageModel:(void *)a5
{
  __CFString *v7;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFStringTokenizer *v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *length;
  uint64_t v35;
  uint64_t v36;
  CFRange CurrentTokenRange;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
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
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t TokenIDForString;
  void *v97;
  const char *v98;
  unsigned int v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v160;
  __CFString *v161;
  id *v162;
  void *v163;
  id v164;
  CFRange v165;

  v160 = a1;
  v7 = (__CFString *)a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v164 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v165.length = objc_msgSend_length(v7, v18, v19, v20, v21, v22);
  v165.location = 0;
  v27 = CFStringTokenizerCreate(0, v7, v165, 0, 0);
  if (v27)
  {
    v28 = 0;
    v161 = v7;
    v162 = a4;
    while (CFStringTokenizerAdvanceToNextToken(v27))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v27);
      length = (const char *)CurrentTokenRange.length;
      if (CurrentTokenRange.location > v28)
      {
        objc_msgSend_substringWithRange_(v7, (const char *)CurrentTokenRange.length, v28, CurrentTokenRange.location - v28, v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v39, v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByTrimmingCharactersInSet_(v38, v45, (uint64_t)v44, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_length(v49, v50, v51, v52, v53, v54))
        {
          v59 = objc_msgSend_rangeOfString_(v38, v55, (uint64_t)v49, v56, v57, v58);
          v65 = objc_msgSend_length(v49, v60, v61, v62, v63, v64);
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v66, 0, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v163, v71, (uint64_t)v70, v72, v73, v74);

          objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v75, v59 + v28, v65, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v164, v79, (uint64_t)v78, v80, v81, v82);

        }
        v7 = v161;
        a4 = v162;
      }
      objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], length, CurrentTokenRange.location, CurrentTokenRange.length, v35, v36, v160);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v164, v84, (uint64_t)v83, v85, v86, v87);

      if (a4)
      {
        objc_msgSend_substringWithRange_(v7, v88, CurrentTokenRange.location, CurrentTokenRange.length, v89, v90);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
          TokenIDForString = LMLanguageModelGetTokenIDForString();
          v97 = (void *)objc_opt_class();
          v99 = objc_msgSend_normalizeLMTokenIDForWord_tokenID_isFromPattern_score_wordLanguageModel_(v97, v98, (uint64_t)v95, TokenIDForString, 0, 0, a5);
        }
        else
        {
          v99 = 0;
        }
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v91, v99, v92, v93, v94);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v163, v101, (uint64_t)v100, v102, v103, v104);

      }
      v28 = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    if (objc_msgSend_length(v7, v29, v30, v31, v32, v33) > v28)
    {
      v110 = objc_msgSend_length(v7, v105, v106, v107, v108, v109);
      objc_msgSend_substringWithRange_(v7, v111, v28, v110 - v28, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v115, v116, v117, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByTrimmingCharactersInSet_(v114, v121, (uint64_t)v120, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v125, v126, v127, v128, v129, v130))
      {
        v135 = objc_msgSend_rangeOfString_(v114, v131, (uint64_t)v125, v132, v133, v134);
        v141 = objc_msgSend_length(v125, v136, v137, v138, v139, v140);
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v142, 0, v143, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v163, v147, (uint64_t)v146, v148, v149, v150);

        objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v151, v135 + v28, v141, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v164, v155, (uint64_t)v154, v156, v157, v158);

      }
      a4 = v162;
    }
    CFRelease(v27);
  }
  if (a4)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v23, (uint64_t)v163, v24, v25, v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v164;
}

+ (id)splitStringIntoSubtokensForLexicon:(id)a3 minLength:(int64_t)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[8];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a4 <= 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v11 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v11, OS_LOG_TYPE_FAULT, "minLength has to be > 0", buf, 2u);
    }

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF567EF8 != -1)
    dispatch_once(&qword_1EF567EF8, &unk_1E77F1490);
  objc_msgSend_componentsSeparatedByCharactersInSet_(v10, v12, qword_1EF567EF0, v13, v14, v15);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v36, (uint64_t)v41, 16, v19);
  if (v25)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v17);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend_length(v28, v20, v21, v22, v23, v24, (_QWORD)v36) >= (unint64_t)a4)
        {
          v29 = objc_msgSend_length(v28, v20, v21, v22, v23, v24);
          if (v29 != objc_msgSend_length(v10, v30, v31, v32, v33, v34))
            objc_msgSend_addObject_(v16, v20, (uint64_t)v28, v22, v23, v24);
        }
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v36, (uint64_t)v41, 16, v24);
    }
    while (v25);
  }

  return v16;
}

+ (BOOL)findPartialMatchInPhraseLexicon:(_LXLexicon *)a3 token:(id)a4 contextBeforeToken:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSUInteger v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSUInteger v64;
  int v65;
  id v66;
  const char *v67;
  uint64_t v68;
  const char *length;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  NSUInteger v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSUInteger v89;
  void *v91;
  void *v92;
  __CFString *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  _BYTE v100[128];
  uint64_t v101;
  NSRange v102;
  _NSRange v103;
  NSRange v104;
  _NSRange v105;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v94 = a5;
  v92 = v7;
  if (a3)
  {
    v13 = objc_msgSend_properties(v7, v8, v9, v10, v11, v12);
    v14 = CFSTR(" ");
    if ((v13 & 0x20) == 0)
      v14 = &stru_1E77F6F28;
    v93 = v14;
    objc_msgSend_string(v7, v15, v16, v17, v18, v19);
    if (v94)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingFormat_(v94, v21, (uint64_t)CFSTR("%@%@"), v22, v23, v24, v93, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = objc_msgSend_length(v94, v26, v27, v28, v29, v30);
    v38 = objc_msgSend_length(v93, v33, v34, v35, v36, v37);
    objc_msgSend_string(v7, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_length(v44, v45, v46, v47, v48, v49);

    v99 = 0x7FFFFFFFFFFFFFFFLL;
    v56 = objc_msgSend_length(v25, v51, v52, v53, v54, v55);
    v62 = objc_msgSend_length(v25, v57, v58, v59, v60, v61);
    v103.location = 0x7FFFFFFFFFFFFFFFLL;
    v103.length = 0;
    v105.location = 0;
    v105.length = v56;
    phraseMatchingCandidates((NSString *)v25, a3, v103, v105, 3, v62, &v99);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v38 + v32;
    v91 = v63;
    if (v99 < v64 || v99 - v64 >= v50)
    {
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v66 = v63;
      v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v95, (uint64_t)v100, 16, v68);
      if (v74)
      {
        v75 = *(_QWORD *)v96;
        while (2)
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v96 != v75)
              objc_enumerationMutation(v66);
            v77 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
            v78 = objc_msgSend_integerValue(v77, length, v70, v71, v72, v73);
            objc_msgSend_objectForKeyedSubscript_(v66, v79, (uint64_t)v77, v80, v81, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend_length(v83, v84, v85, v86, v87, v88);

            v102.location = v64;
            v102.length = v50;
            v104.location = v78;
            v104.length = v89;
            length = (const char *)NSIntersectionRange(v102, v104).length;
            if (length)
            {
              v65 = 1;
              goto LABEL_21;
            }
          }
          v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, 0, (uint64_t)&v95, (uint64_t)v100, 16, v73);
          if (v74)
            continue;
          break;
        }
      }
      v65 = 0;
LABEL_21:

    }
    else
    {
      v65 = 1;
    }

    v31 = v65 != 0;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)transliterateStringUsingICUTransliterator:(id)a3 _icuTransliterator:(void *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  const char *v14;
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
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v33 - ((v12 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend_getCharacters_(v5, v14, (uint64_t)v13, v15, v16, v17);
  *(_WORD *)&v13[2 * objc_msgSend_length(v5, v18, v19, v20, v21, v22)] = 0;
  v28 = v5;
  if (a4)
  {
    v35 = objc_msgSend_length(v5, v23, v24, v25, v26, v27);
    v36 = v35;
    v34 = 0;
    utrans_transUChars();
    v28 = v5;
    if (v34 <= 0)
    {
      objc_msgSend_stringWithCharacters_length_(MEMORY[0x1E0CB3940], v29, (uint64_t)v13, v36, v30, v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v28;
}

+ (id)transformString:(id)a3 usingConfusions:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[4];
  id v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_copy(v5, v13, v14, v15, v16, v17);
  objc_msgSend_addObject_(v12, v19, (uint64_t)v18, v20, v21, v22);

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE6231CC;
  v29[3] = &unk_1E77F20F0;
  v23 = v12;
  v30 = v23;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v24, (uint64_t)v29, v25, v26, v27);

  return v23;
}

+ (id)transformLatinToCyrillic:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transformString_usingConfusions_(CHLanguageUtilities, v9, (uint64_t)v31, (uint64_t)&unk_1E78271C8, v10, v11);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, (uint64_t)v36, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v12);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v22);
        objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v15, v16, v17, v18, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_rangeOfCharacterFromSet_(v23, v25, (uint64_t)v24, v26, v27, v28);

        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend_addObject_(v8, v15, (uint64_t)v23, v17, v18, v19);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v32, (uint64_t)v36, 16, v19);
    }
    while (v20);
  }

  return v8;
}

+ (id)transformCyrillicToLatin:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transformString_usingConfusions_(CHLanguageUtilities, v9, (uint64_t)v31, (uint64_t)&unk_1E78271F0, v10, v11);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v32, (uint64_t)v36, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v12);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v22);
        objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v15, v16, v17, v18, v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_rangeOfCharacterFromSet_(v23, v25, (uint64_t)v24, v26, v27, v28);

        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend_addObject_(v8, v15, (uint64_t)v23, v17, v18, v19);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v32, (uint64_t)v36, 16, v19);
    }
    while (v20);
  }

  return v8;
}

+ (id)performInverseBiDiForNumeric:(id)a3 isRTLContext:(BOOL)a4
{
  _BOOL4 v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
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
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
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
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSString *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t i;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char IsMember;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  uint64_t j;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  id v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t k;
  void *v198;
  id v199;
  const char *v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t m;
  const char *v209;
  uint64_t v210;
  NSObject *v211;
  NSCharacterSet *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  NSString *v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  uint8_t buf[4];
  NSString *v228;
  __int16 v229;
  NSString *v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _QWORD v233[4];

  v4 = a4;
  v233[1] = *MEMORY[0x1E0C80C00];
  v218 = (NSString *)a3;
  if (v4)
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v5, (uint64_t)CFSTR("0123456789٠١٢٣٤٥٦٧٨٩/."), v6, v7, v8);
  else
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v5, (uint64_t)CFSTR("٠١٢٣٤٥٦٧٨٩/."), v6, v7, v8);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v9, (uint64_t)CFSTR("*+-^="), v10, v11, v12);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = (NSCharacterSet *)objc_msgSend_mutableCopy(v217, v13, v14, v15, v16, v17);
  objc_msgSend_formUnionWithCharacterSet_(v213, v18, (uint64_t)v215, v19, v20, v21);
  if (isStringEntirelyFromSet(v218, v213) && (unint64_t)objc_msgSend_length(v218, v22, v23, v24, v25, v26) >= 2)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v27 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v27, OS_LOG_TYPE_DEBUG, "performInverseBiDiForNumeric is attempting to rearrange a numeric token", buf, 2u);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v34, v35, v36, v37, v38);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = 1;
    while (v44 < objc_msgSend_length(v218, v39, v40, v41, v42, v43))
    {
      objc_msgSend_substringWithRange_(v218, v46, v44, 1, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend_characterAtIndex_(v51, v52, 0, v53, v54, v55);
      if (objc_msgSend_characterIsMember_(v215, v57, v56, v58, v59, v60))
      {
        if (objc_msgSend_count(v216, v61, v62, v63, v64, v65))
        {
          v71 = (void *)objc_msgSend_mutableCopy(v216, v66, v67, v68, v69, v70);
          objc_msgSend_addObject_(v33, v72, (uint64_t)v71, v73, v74, v75);

        }
        v233[0] = v51;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v66, (uint64_t)v233, 1, v69, v70);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v33, v77, (uint64_t)v76, v78, v79, v80);

        objc_msgSend_removeAllObjects(v216, v81, v82, v83, v84, v85);
        v45 = 0;
      }
      else
      {
        v86 = objc_msgSend_characterAtIndex_(v51, v61, 0, v63, v64, v65);
        if (objc_msgSend_characterIsMember_(v217, v87, v86, v88, v89, v90))
        {
          if ((v45 & 1) != 0 || !objc_msgSend_count(v216, v91, v92, v93, v94, v95))
          {
            objc_msgSend_addObject_(v216, v91, (uint64_t)v51, v93, v94, v95);
          }
          else if (objc_msgSend_count(v216, v91, v96, v93, v94, v95))
          {
            v102 = (void *)objc_msgSend_mutableCopy(v216, v97, v98, v99, v100, v101);
            objc_msgSend_addObject_(v33, v103, (uint64_t)v102, v104, v105, v106);

            objc_msgSend_removeAllObjects(v216, v107, v108, v109, v110, v111);
          }
          v45 = 1;
        }
      }

      ++v44;
    }
    if (objc_msgSend_count(v216, v46, v47, v48, v49, v50))
    {
      v118 = (void *)objc_msgSend_mutableCopy(v216, v113, v114, v115, v116, v117);
      objc_msgSend_addObject_(v33, v119, (uint64_t)v118, v120, v121, v122);

    }
    v123 = objc_msgSend_count(v33, v113, v114, v115, v116, v117);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v124, v125, v126, v127, v128);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < (unint64_t)objc_msgSend_count(v33, v129, v130, v131, v132, v133); ++i)
    {
      objc_msgSend_objectAtIndex_(v33, v129, i, v131, v132, v133);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v135, v136, 0, v137, v138, v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend_characterAtIndex_(v140, v141, 0, v142, v143, v144);
      IsMember = objc_msgSend_characterIsMember_(v217, v146, v145, v147, v148, v149);

      if ((IsMember & 1) != 0)
        break;
    }
    v151 = v123 - 1;
    do
    {
      v152 = v151;
      if (v151 < i)
        break;
      objc_msgSend_objectAtIndex_(v33, v129, v151, v131, v132, v133);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v153, v154, 0, v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend_characterAtIndex_(v158, v159, 0, v160, v161, v162);
      v168 = objc_msgSend_characterIsMember_(v217, v164, v163, v165, v166, v167);

      v151 = v152 - 1;
    }
    while ((v168 & 1) == 0);
    if (i == v152)
    {
      v112 = v218;
    }
    else
    {
      if (i)
      {
        for (j = 0; j != i; ++j)
        {
          objc_msgSend_objectAtIndex_(v33, v129, j, v131, v132, v133);
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v214, v171, (uint64_t)v170, v172, v173, v174);

        }
      }
      v175 = v152 + 1;
      if (v152 >= i)
      {
        v176 = v152 + 1;
        do
        {
          objc_msgSend_objectAtIndex_(v33, v129, --v176, v131, v132, v133);
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v214, v178, (uint64_t)v177, v179, v180, v181);

        }
        while (v176 > i);
      }
      while (v175 < objc_msgSend_count(v33, v129, v130, v131, v132, v133))
      {
        objc_msgSend_objectAtIndex_(v33, v187, v175, v189, v190, v191);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v214, v183, (uint64_t)v182, v184, v185, v186);

        ++v175;
      }
      objc_msgSend_string(MEMORY[0x1E0CB37A0], v187, v188, v189, v190, v191);
      v112 = (NSString *)objc_claimAutoreleasedReturnValue();
      v225 = 0u;
      v226 = 0u;
      v223 = 0u;
      v224 = 0u;
      v192 = v214;
      v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v193, (uint64_t)&v223, (uint64_t)v232, 16, v194);
      if (v195)
      {
        v196 = *(_QWORD *)v224;
        do
        {
          for (k = 0; k != v195; ++k)
          {
            if (*(_QWORD *)v224 != v196)
              objc_enumerationMutation(v192);
            v198 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * k);
            v219 = 0u;
            v220 = 0u;
            v221 = 0u;
            v222 = 0u;
            v199 = v198;
            v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v200, (uint64_t)&v219, (uint64_t)v231, 16, v201);
            if (v206)
            {
              v207 = *(_QWORD *)v220;
              do
              {
                for (m = 0; m != v206; ++m)
                {
                  if (*(_QWORD *)v220 != v207)
                    objc_enumerationMutation(v199);
                  objc_msgSend_appendString_(v112, v202, *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * m), v203, v204, v205);
                }
                v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v199, v202, (uint64_t)&v219, (uint64_t)v231, 16, v205);
              }
              while (v206);
            }

          }
          v195 = objc_msgSend_countByEnumeratingWithState_objects_count_(v192, v209, (uint64_t)&v223, (uint64_t)v232, 16, v210);
        }
        while (v195);
      }

      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v211 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v228 = v218;
        v229 = 2112;
        v230 = v112;
        _os_log_impl(&dword_1BE607000, v211, OS_LOG_TYPE_DEBUG, "performInverseBiDiForNumeric rearranged numeric string %@ to %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v112 = v218;
  }

  return v112;
}

+ (unsigned)tokenIDForString:(id)a3 withLexicon:(_LXLexicon *)a4
{
  id v4;
  unsigned int v5;
  id v7;
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0xFFEFFFFFFFFFFFFFLL;
  v7 = a3;
  v4 = v7;
  LXLexiconEnumerateEntriesForString();
  v5 = *((_DWORD *)v10 + 6);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (BOOL)lexiconHasEntryForString:(id)a3 withLexicon:(_LXLexicon *)a4 outHasMatchingString:(BOOL *)a5
{
  id v6;
  char v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6 = a3;
  LXLexiconEnumerateEntriesForString();
  if (a5)
    *a5 = *((_BYTE *)v10 + 24);
  v7 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

+ (double)characterLMLogProbabilityForString:(id)a3 characterLM:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;

  v5 = a3;
  v6 = a4;
  v12 = v6;
  v13 = 0.0;
  if (v6 && objc_msgSend_lmSPIType(v6, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_languageModel(v12, v14, v15, v16, v17, v18);
    CVNLPLanguageModelLogJointProbability();
    v13 = v19;
  }

  return v13;
}

+ (BOOL)isMecabraConversionCandidateAllowed:(id)a3
{
  NSString *v3;
  BOOL v4;

  v3 = (NSString *)a3;
  if (qword_1EF567F00 != -1)
    dispatch_once(&qword_1EF567F00, &unk_1E77F2160);
  v4 = isStringEntirelyFromSet(v3, (NSCharacterSet *)qword_1EF567F08);

  return v4;
}

+ (id)mecabraTokenizationAndKanaConversionForString:(id)a3 mecabraEngine:(__Mecabra *)a4 contextRef:(__MecabraContext *)a5 leftCandidateRef:(void *)a6 alternativeCandidateLimit:(int64_t)a7
{
  id v10;
  void *NextCandidate;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int WordCount;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t NextPhraseBoundary;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int WordReadingLengthAtIndex;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __Mecabra *v51;
  void *v52;
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
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *CandidateFromContextString;
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
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __MecabraContext *v103;
  int64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;

  v10 = a3;
  MecabraContextAddCandidate();
  if (MecabraAnalyzeStringWithContext()
    && (NextCandidate = (void *)MecabraGetNextCandidate(), (v12 = NextCandidate) != 0))
  {
    v13 = NextCandidate;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17, v18);
    v106 = (id)objc_claimAutoreleasedReturnValue();
    WordCount = MecabraCandidateGetWordCount();
    v103 = a5;
    if (WordCount < 1)
    {
      v72 = 0;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v107 = 0;
      v104 = a7;
      v105 = WordCount;
      do
      {
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22, v23, v24, v103);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v106, v27, (uint64_t)v110, v28, v29, v30);
        NextPhraseBoundary = MecabraCandidateGetNextPhraseBoundary();
        v35 = NextPhraseBoundary;
        if (v26 <= NextPhraseBoundary)
        {
          LOBYTE(v37) = 0;
          v36 = 0;
          v109 = NextPhraseBoundary + 1;
          while (1)
          {
            WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
            v37 = (v37 & 1) != 0 ? 1 : MecabraCandidateHasAlternativeSurfaceFormForWordAtIndex();
            v36 += WordReadingLengthAtIndex;
            v49 = v36 + v25;
            if (v36 + v25 < (unint64_t)objc_msgSend_length(v10, v38, v39, v40, v41, v42))
            {
              v108 = v36;
              v50 = v10;
              v51 = a4;
              objc_msgSend_ch_basicAlphanumericCharacterSet(MEMORY[0x1E0CB3500], v44, v45, v46, v47, v48);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend_characterAtIndex_(v50, v53, v49 - 1, v54, v55, v56);
              v62 = objc_msgSend_characterAtIndex_(v50, v58, v49, v59, v60, v61);
              LODWORD(v57) = objc_msgSend_characterIsMember_(v52, v63, v57, v64, v65, v66);
              LODWORD(v62) = objc_msgSend_characterIsMember_(v52, v67, v62, v68, v69, v70);

              v71 = (_DWORD)v57 == (_DWORD)v62;
              a4 = v51;
              v10 = v50;
              v36 = v108;
              if (!v71)
                break;
            }
            if (v109 == ++v26)
              goto LABEL_17;
          }
          v35 = v26;
LABEL_17:
          a7 = v104;
          objc_msgSend_substringWithRange_(v10, v44, v25, v36, v47, v48);
        }
        else
        {
          v36 = 0;
          v37 = 0;
          objc_msgSend_substringWithRange_(v10, v32, v25, 0, v33, v34);
        }
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v110, v73, (uint64_t)v72, v74, v75, v76);
        if (v37)
        {
          MecabraContextCreateMutable();
          if (v107)
          {
            CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
            MecabraContextAddCandidate();

          }
          if (MecabraAnalyzeStringWithContext())
          {
            while (MecabraGetNextCandidate()
                 && objc_msgSend_count(v110, v78, v79, v80, v81, v82) <= (unint64_t)a7)
            {
              MecabraCandidateGetSurface();
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_length(v83, v84, v85, v86, v87, v88))
              {
                if ((objc_msgSend_isEqualToString_(v83, v89, (uint64_t)v72, v90, v91, v92) & 1) == 0)
                {
                  v93 = (void *)objc_opt_class();
                  if (objc_msgSend_isMecabraConversionCandidateAllowed_(v93, v94, (uint64_t)v83, v95, v96, v97))objc_msgSend_addObject_(v110, v98, (uint64_t)v83, v99, v100, v101);
                }
              }

            }
          }
          MecabraContextRelease();
        }
        v26 = v35 + 1;
        v25 += v36;

        v107 = v72;
      }
      while (v35 + 1 < v105);
    }

  }
  else
  {
    v106 = 0;
  }
  MecabraContextGetCandidateCount();
  MecabraContextRemoveCandidatesInRange();

  return v106;
}

+ (BOOL)shouldCapitalizeGivenHistory:(id)a3 shouldAutoCapitalizeSetting:(BOOL)a4 locale:(id)a5
{
  _BOOL4 v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  void *v80;
  _QWORD v81[2];

  v6 = a4;
  v81[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13 = a5;
  if (v6)
  {
    objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rangeOfCharacterFromSet_(v7, v15, (uint64_t)v14, v16, v17, v18);
    v20 = v19;
    v25 = objc_msgSend_length(v7, v19, v21, v22, v23, v24);

    v36 = 1;
    if (objc_msgSend_length(v7, v26, v27, v28, v29, v30) && v20 != (const char *)v25)
    {
      v76 = 0;
      v77 = &v76;
      v78 = 0x2020000000;
      v79 = 0;
      v37 = objc_msgSend_length(v7, v31, v32, v33, v34, v35);
      v38 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend_localeIdentifier(v13, v39, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_(v38, v45, (uint64_t)v44, v46, v47, v48, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (qword_1EF568BF8 != -1)
        dispatch_once(&qword_1EF568BF8, &unk_1E77F2180);
      objc_msgSend_localeIdentifier(v13, v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v55;
      v81[0] = v49;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v56, (uint64_t)v81, (uint64_t)&v80, 1, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v64 = (void *)MEMORY[0x1E0CB3840];
        objc_msgSend_localeIdentifier(v13, v59, v60, v61, v62, v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orthographyWithDominantScript_languageMap_(v64, v66, (uint64_t)v65, (uint64_t)v58, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = *MEMORY[0x1E0CB2D08];
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = sub_1BE624F58;
        v73[3] = &unk_1E77F21A8;
        v75 = &v76;
        v74 = v7;
        objc_msgSend_enumerateLinguisticTagsInRange_scheme_options_orthography_usingBlock_(v74, v71, 0, v37, v70, 0, v69, v73);

      }
      v36 = *((_BYTE *)v77 + 24) != 0;

      _Block_object_dispose(&v76, 8);
    }
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

+ (double)computeEditPenalizationFromString:(id)a3 toReferenceString:(id)a4 withSuffix:(id)a5 withCaseSensitivity:(BOOL)a6 withFirstLetterCaseSensitivity:(BOOL)a7 withDiacriticSensitivity:(BOOL)a8 withDiacriticsCharSet:(id)a9 withConsumableStrokesCharSet:(id)a10 outputSuffix:(id *)a11 lexiconExtraCharacters:(id *)a12 firstLetterCaseFlipped:(BOOL *)a13
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
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
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  uint64_t v59;
  int v60;
  int v61;
  char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _BYTE *v87;
  char *v88;
  int64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  _BYTE *v95;
  char *v96;
  int64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  _BYTE *v106;
  int *v107;
  int64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  _OWORD *v120;
  char *v121;
  uint64_t v122;
  __int128 v123;
  int v124;
  char v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  _OWORD *v130;
  char *v131;
  uint64_t v132;
  __int128 v133;
  int v134;
  char *v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  _BYTE *v140;
  char *v141;
  int64_t v142;
  char *v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  _BYTE *v149;
  char *v150;
  int64_t v151;
  int v152;
  int IsMember;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  char v159;
  int v160;
  char *v161;
  char *v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  _OWORD *v167;
  char *v168;
  uint64_t v169;
  __int128 v170;
  int v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  _OWORD *v180;
  char *v181;
  uint64_t v182;
  __int128 v183;
  int v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  uint64_t v198;
  unint64_t v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  _BYTE *v203;
  int *v204;
  int64_t v205;
  int v206;
  char *v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char *v212;
  _OWORD *v213;
  char *v214;
  uint64_t v215;
  __int128 v216;
  int v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  char *v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  unint64_t v232;
  _BYTE *v233;
  char *v234;
  int64_t v235;
  unint64_t v236;
  uint64_t v237;
  uint64_t v238;
  char *v239;
  _OWORD *v240;
  char *v241;
  uint64_t v242;
  __int128 v243;
  int v244;
  char *v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  _BYTE *v251;
  char *v252;
  uint64_t v253;
  unint64_t v254;
  uint64_t v255;
  unint64_t v256;
  unint64_t v257;
  _BYTE *v258;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  char *v262;
  _OWORD *v263;
  char *v264;
  uint64_t v265;
  __int128 v266;
  int v267;
  char *v268;
  unint64_t v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  _OWORD *v273;
  char *v274;
  uint64_t v275;
  __int128 v276;
  int v277;
  char *v278;
  unint64_t v279;
  uint64_t v280;
  uint64_t v281;
  char *v282;
  _OWORD *v283;
  char *v284;
  uint64_t v285;
  __int128 v286;
  int v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  int v291;
  void *v292;
  void *v293;
  int v294;
  __CFString *v295;
  double v296;
  id *v297;
  id *v298;
  char *v299;
  int v300;
  signed int v301;
  unsigned int v302;
  int v303;
  int v304;
  uint64_t v305;
  unint64_t v306;
  int v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  int v318;
  char v319;
  char v320;
  unsigned int v321;
  unsigned int v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v332;
  uint64_t v333;
  int v334;
  int v335;
  int v336;
  unsigned int v337;
  int v338;
  int v339;
  uint64_t v340;
  char *v341;
  uint64_t v342;
  _BOOL4 v343;
  _BOOL4 v344;
  uint64_t v345;
  id v346;
  uint64_t v347;
  _BOOL4 v348;
  _BOOL4 v349;
  uint64_t v350;
  id v351;
  void *v352;
  id v353;
  id v354;
  void *v355;
  _QWORD v356[2];
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  char *v361;
  char *v362;
  char *v363;

  v349 = a8;
  v343 = a6;
  v344 = a7;
  v15 = a3;
  v16 = a4;
  v346 = a5;
  v351 = a9;
  v354 = a10;
  v355 = v16;
  v361 = 0;
  v362 = 0;
  v363 = 0;
  v353 = v15;
  v20 = objc_msgSend_codepointAtIndex_outRange_(v16, v17, 0, (uint64_t)&v359, v18, v19);
  v24 = objc_msgSend_codepointAtIndex_outRange_(v15, v21, 0, (uint64_t)&v357, v22, v23);
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v25, v26, v27, v28, v29);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  v350 = 0;
  v347 = 0;
  v345 = 0;
  v35 = v349;
  if (!v351)
    v35 = 0;
  v348 = v35;
  *a13 = 0;
  while (1)
  {
    if (!(v20 | v24))
    {
LABEL_241:
      v288 = v362 - v361;
      if (v362 == v361)
      {
        v300 = 0;
        v301 = 0;
        v292 = v346;
        v293 = v354;
      }
      else
      {
        v289 = v288 >> 2;
        v290 = (v288 >> 2) - 1;
        if ((unint64_t)(v288 >> 2) <= 1)
          v289 = 1;
        v291 = *(_DWORD *)v361;
        v292 = v346;
        v293 = v354;
        if (v288 >> 2 == 1)
          v294 = 0;
        else
          v294 = *((_DWORD *)v361 + 1);
        if (v291 >= 0)
          v302 = *(_DWORD *)v361;
        else
          v302 = -v291;
        v303 = v294 + v291;
        if (v303 < 0)
          v303 = -v303;
        if (v302 >= v303)
          v300 = v303;
        else
          v300 = v302;
        if ((unint64_t)v288 >= 8)
        {
          v332 = 0;
          v333 = v289 - 1;
          do
          {
            v340 = v332 + 1;
            v341 = &v361[4 * v332];
            if (v290 > v332 + 1)
              v334 = *((_DWORD *)v341 + 2);
            else
              v334 = 0;
            v335 = *(_DWORD *)&v361[4 * v332];
            v336 = *((_DWORD *)v341 + 1);
            if (v336 >= 0)
              v337 = v336;
            else
              v337 = -v336;
            v338 = v336 + v335;
            if (v338 < 0)
              v338 = -v338;
            v339 = v334 + v336;
            if (v339 < 0)
              v339 = -v339;
            if (v338 >= v339)
              v338 = v339;
            if (v337 >= v338)
              v301 = v338;
            else
              v301 = v337;
            v300 += v301;
            v332 = v340;
          }
          while (v333 != v340);
        }
        else
        {
          v301 = v300;
        }
      }
      v304 = *((_DWORD *)v362 - 1);
      v306 = 0;
      if (objc_msgSend_length(v292, v30, v31, v32, v33, v34, v342) && v304 < 0 && v301)
      {
        v306 = 0;
        v307 = 0;
        do
        {
          v308 = objc_msgSend_codepointAtIndex_outRange_(v292, v30, v306, (uint64_t)v356, v33, v34);
          if (objc_msgSend_characterIsMember_(v293, v309, (unsigned __int16)v308, v310, v311, v312)
            && (v318 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v313, v308, v315, v316, v317), v301 >= v307 + v318))
          {
            v306 = v356[1] + v356[0];
            v319 = 1;
            v307 += v318;
          }
          else
          {
            v319 = 0;
          }
          if (v306 < objc_msgSend_length(v292, v313, v314, v315, v316, v317))
            v320 = v319;
          else
            v320 = 0;
        }
        while ((v320 & 1) != 0);
        if (v307 >= 1)
        {
          if (v304 >= 0)
            v321 = v304;
          else
            v321 = -v304;
          v322 = v307 + v304;
          if (v307 + v304 < 0)
            v322 = -v322;
          if (v321 >= v322)
            v321 = v322;
          v300 = v300 - v301 + v321;
        }
      }
      if (v300 >= 0)
        v323 = v300;
      else
        v323 = -v300;
      v324 = v347;
      if (v347 < 0)
        v324 = -v347;
      v325 = v324 + v345;
      if (!v349)
        v325 = 0;
      v326 = v350;
      if (!v343)
        v326 = 0;
      v296 = (double)(v325 + v326 + v323);
      if (!a11)
      {
        v295 = 0;
        v298 = a12;
        if (!a12)
          goto LABEL_295;
LABEL_248:
        objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v30, (uint64_t)v352, v32, v33, v34, v342);
        *v298 = (id)objc_claimAutoreleasedReturnValue();

        v299 = v361;
        if (!v361)
          goto LABEL_297;
        goto LABEL_296;
      }
      v327 = objc_msgSend_length(v292, v30, v305, v32, v33, v34);
      objc_msgSend_substringWithRange_(v292, v328, v306, v327 - v306, v329, v330);
      v295 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v297 = a11;
LABEL_294:
      v295 = objc_retainAutorelease(v295);
      *v297 = v295;
      v298 = a12;
      if (!a12)
        goto LABEL_295;
      goto LABEL_248;
    }
    if (!v360)
    {
      if (!objc_msgSend_characterIsMember_(v354, v30, (unsigned __int16)v24, v32, v33, v34))
        goto LABEL_160;
      v60 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v30, v24, v32, v33, v34);
      v61 = v60;
      v62 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v60;
        v63 = (uint64_t)(v62 + 4);
LABEL_80:
        v125 = 0;
        v362 = (char *)v63;
        v15 = v353;
        goto LABEL_161;
      }
      v90 = v361;
      v91 = (v362 - v361) >> 2;
      v92 = v91 + 1;
      if ((unint64_t)(v91 + 1) >> 62)
        sub_1BE61F930();
      v93 = v363 - v361;
      if ((v363 - v361) >> 1 > v92)
        v92 = v93 >> 1;
      if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL)
        v94 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v94 = v92;
      if (v94)
      {
        if (v94 >> 62)
          sub_1BE61F100();
        v95 = operator new(4 * v94);
        v96 = &v95[4 * v91];
        *(_DWORD *)v96 = v61;
        v63 = (uint64_t)(v96 + 4);
        v97 = v62 - v90;
        if (v62 == v90)
          goto LABEL_78;
      }
      else
      {
        v95 = 0;
        v96 = (char *)(4 * v91);
        *(_DWORD *)(4 * v91) = v61;
        v63 = 4 * v91 + 4;
        v97 = v62 - v90;
        if (v62 == v90)
        {
LABEL_78:
          v361 = v96;
          v362 = (char *)v63;
          v363 = &v95[4 * v94];
          if (v90)
            operator delete(v90);
          goto LABEL_80;
        }
      }
      v126 = v97 - 4;
      if (v126 < 0x2C)
        goto LABEL_337;
      if ((unint64_t)(v90 - v95) < 0x20)
        goto LABEL_337;
      v127 = (v126 >> 2) + 1;
      v128 = 4 * (v127 & 0x7FFFFFFFFFFFFFF8);
      v129 = &v62[-v128];
      v96 -= v128;
      v130 = &v95[4 * v91 - 16];
      v131 = v62 - 16;
      v132 = v127 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v133 = *(_OWORD *)v131;
        *(v130 - 1) = *((_OWORD *)v131 - 1);
        *v130 = v133;
        v130 -= 2;
        v131 -= 32;
        v132 -= 8;
      }
      while (v132);
      v62 = v129;
      if (v127 != (v127 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_337:
        do
        {
          v134 = *((_DWORD *)v62 - 1);
          v62 -= 4;
          *((_DWORD *)v96 - 1) = v134;
          v96 -= 4;
        }
        while (v62 != v90);
      }
      goto LABEL_78;
    }
    if (!v358)
    {
      if (!objc_msgSend_characterIsMember_(v354, v30, (unsigned __int16)v20, v32, v33, v34))
      {
LABEL_117:
        unicodeToNSString(v20, v64, v65, v66, v67, v68);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v352, v172, (uint64_t)v48, v173, v174, v175);
        v125 = 0;
        v152 = 0;
        goto LABEL_133;
      }
      v69 = -(int)objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v64, v20, v66, v67, v68);
      v70 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v69;
        v71 = (uint64_t)(v70 + 4);
LABEL_116:
        v362 = (char *)v71;
        v15 = v353;
        goto LABEL_117;
      }
      v101 = v361;
      v102 = (v362 - v361) >> 2;
      v103 = v102 + 1;
      if ((unint64_t)(v102 + 1) >> 62)
        sub_1BE61F930();
      v104 = v363 - v361;
      if ((v363 - v361) >> 1 > v103)
        v103 = v104 >> 1;
      if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFFCLL)
        v105 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v105 = v103;
      if (v105)
      {
        if (v105 >> 62)
          sub_1BE61F100();
        v106 = operator new(4 * v105);
        v107 = (int *)&v106[4 * v102];
        *v107 = v69;
        v71 = (uint64_t)(v107 + 1);
        v108 = v70 - v101;
        if (v70 == v101)
          goto LABEL_114;
      }
      else
      {
        v106 = 0;
        v107 = (int *)(4 * v102);
        *(_DWORD *)(4 * v102) = v69;
        v71 = 4 * v102 + 4;
        v108 = v70 - v101;
        if (v70 == v101)
        {
LABEL_114:
          v361 = (char *)v107;
          v362 = (char *)v71;
          v363 = &v106[4 * v105];
          if (v101)
            operator delete(v101);
          goto LABEL_116;
        }
      }
      v163 = v108 - 4;
      if (v163 < 0x2C)
        goto LABEL_338;
      if ((unint64_t)(v101 - v106) < 0x20)
        goto LABEL_338;
      v164 = (v163 >> 2) + 1;
      v165 = 4 * (v164 & 0x7FFFFFFFFFFFFFF8);
      v166 = &v70[-v165];
      v107 = (int *)((char *)v107 - v165);
      v167 = &v106[4 * v102 - 16];
      v168 = v70 - 16;
      v169 = v164 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v170 = *(_OWORD *)v168;
        *(v167 - 1) = *((_OWORD *)v168 - 1);
        *v167 = v170;
        v167 -= 2;
        v168 -= 32;
        v169 -= 8;
      }
      while (v169);
      v70 = v166;
      if (v164 != (v164 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_338:
        do
        {
          v171 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *--v107 = v171;
        }
        while (v70 != v101);
      }
      goto LABEL_114;
    }
    v37 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v30, v24, v32, v33, v34);
    v42 = objc_msgSend_expectedMinStrokeCount_(CHCharacterSetRules, v38, v20, v39, v40, v41);
    unicodeToNSString(v24, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    unicodeToNSString(v20, v49, v50, v51, v52, v53);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v24 == (_DWORD)v20)
    {
      v58 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = 0;
        v59 = (uint64_t)(v58 + 4);
LABEL_70:
        v125 = 0;
LABEL_129:
        v362 = (char *)v59;
LABEL_130:
        v152 = 1;
        goto LABEL_131;
      }
      v82 = v361;
      v83 = (v362 - v361) >> 2;
      v84 = v83 + 1;
      if ((unint64_t)(v83 + 1) >> 62)
        sub_1BE61F930();
      v85 = v363 - v361;
      if ((v363 - v361) >> 1 > v84)
        v84 = v85 >> 1;
      if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL)
        v86 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v86 = v84;
      if (v86)
      {
        if (v86 >> 62)
          sub_1BE61F100();
        v87 = operator new(4 * v86);
        v88 = &v87[4 * v83];
        *(_DWORD *)v88 = 0;
        v59 = (uint64_t)(v88 + 4);
        v89 = v58 - v82;
        if (v58 == v82)
          goto LABEL_68;
      }
      else
      {
        v87 = 0;
        v88 = (char *)(4 * v83);
        *(_DWORD *)(4 * v83) = 0;
        v59 = 4 * v83 + 4;
        v89 = v58 - v82;
        if (v58 == v82)
        {
LABEL_68:
          v361 = v88;
          v362 = (char *)v59;
          v363 = &v87[4 * v86];
          if (v82)
            operator delete(v82);
          goto LABEL_70;
        }
      }
      v116 = v89 - 4;
      if (v116 < 0x2C)
        goto LABEL_339;
      if ((unint64_t)(v82 - v87) < 0x20)
        goto LABEL_339;
      v117 = (v116 >> 2) + 1;
      v118 = 4 * (v117 & 0x7FFFFFFFFFFFFFF8);
      v119 = &v58[-v118];
      v88 -= v118;
      v120 = &v87[4 * v83 - 16];
      v121 = v58 - 16;
      v122 = v117 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v123 = *(_OWORD *)v121;
        *(v120 - 1) = *((_OWORD *)v121 - 1);
        *v120 = v123;
        v120 -= 2;
        v121 -= 32;
        v122 -= 8;
      }
      while (v122);
      v58 = v119;
      if (v117 != (v117 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_339:
        do
        {
          v124 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v88 - 1) = v124;
          v88 -= 4;
        }
        while (v58 != v82);
      }
      goto LABEL_68;
    }
    if (!objc_msgSend_compare_options_(v48, v54, (uint64_t)v57, 1, v55, v56))
    {
      if (v359)
      {
        v98 = 1;
        v100 = v362;
        v99 = v363;
        if (v362 < v363)
          goto LABEL_47;
LABEL_82:
        v135 = v361;
        v136 = (v100 - v361) >> 2;
        v137 = v136 + 1;
        if ((unint64_t)(v136 + 1) >> 62)
          sub_1BE61F930();
        v138 = v99 - v361;
        if (v138 >> 1 > v137)
          v137 = v138 >> 1;
        if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFFCLL)
          v139 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v139 = v137;
        v342 = v98;
        if (v139)
        {
          if (v139 >> 62)
            sub_1BE61F100();
          v140 = operator new(4 * v139);
          v141 = &v140[4 * v136];
          *(_DWORD *)v141 = 0;
          v59 = (uint64_t)(v141 + 4);
          v142 = v100 - v135;
          if (v100 == v135)
          {
LABEL_125:
            v361 = v141;
            v362 = (char *)v59;
            v363 = &v140[4 * v139];
            if (v135)
              operator delete(v135);
            v98 = v342;
            goto LABEL_128;
          }
        }
        else
        {
          v140 = 0;
          v141 = (char *)(4 * v136);
          *(_DWORD *)(4 * v136) = 0;
          v59 = 4 * v136 + 4;
          v142 = v100 - v135;
          if (v100 == v135)
            goto LABEL_125;
        }
        v176 = v142 - 4;
        if (v176 < 0x2C)
          goto LABEL_340;
        if ((unint64_t)(v135 - v140) < 0x20)
          goto LABEL_340;
        v177 = (v176 >> 2) + 1;
        v178 = 4 * (v177 & 0x7FFFFFFFFFFFFFF8);
        v179 = &v100[-v178];
        v141 -= v178;
        v180 = &v140[4 * v136 - 16];
        v181 = v100 - 16;
        v182 = v177 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v183 = *(_OWORD *)v181;
          *(v180 - 1) = *((_OWORD *)v181 - 1);
          *v180 = v183;
          v180 -= 2;
          v181 -= 32;
          v182 -= 8;
        }
        while (v182);
        v100 = v179;
        if (v177 != (v177 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_340:
          do
          {
            v184 = *((_DWORD *)v100 - 1);
            v100 -= 4;
            *((_DWORD *)v141 - 1) = v184;
            v141 -= 4;
          }
          while (v100 != v135);
        }
        goto LABEL_125;
      }
      *a13 = 1;
      v98 = v344;
      v100 = v362;
      v99 = v363;
      if (v362 >= v363)
        goto LABEL_82;
LABEL_47:
      *(_DWORD *)v100 = 0;
      v59 = (uint64_t)(v100 + 4);
LABEL_128:
      v125 = 0;
      v350 += v98;
      goto LABEL_129;
    }
    if (v348 && !objc_msgSend_compare_options_(v48, v72, (uint64_t)v57, 129, v74, v75))
    {
      IsMember = objc_msgSend_characterIsMember_(v351, v72, (unsigned __int16)v24, v73, v74, v75);
      v158 = objc_msgSend_characterIsMember_(v351, v154, (unsigned __int16)v20, v155, v156, v157);
      if (((IsMember ^ 1 | v158) & 1) != 0)
      {
        v159 = IsMember | v158 ^ 1;
        v160 = v37 - v42;
        v161 = v362;
        if ((v159 & 1) != 0)
        {
          if (v362 >= v363)
          {
            v245 = v361;
            v246 = (v362 - v361) >> 2;
            v247 = v246 + 1;
            if ((unint64_t)(v246 + 1) >> 62)
              sub_1BE61F930();
            v248 = v363 - v361;
            if ((v363 - v361) >> 1 > v247)
              v247 = v248 >> 1;
            if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFFCLL)
              v249 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v249 = v247;
            if (v249)
            {
              if (v249 >> 62)
                sub_1BE61F100();
              v250 = v249;
              v251 = operator new(4 * v249);
              v249 = v250;
            }
            else
            {
              v251 = 0;
            }
            v268 = &v251[4 * v246];
            *(_DWORD *)v268 = v160;
            v162 = v268 + 4;
            if (v161 == v245)
            {
              v15 = v353;
            }
            else
            {
              v269 = v161 - v245 - 4;
              v15 = v353;
              if (v269 < 0x2C)
                goto LABEL_341;
              if ((unint64_t)(v245 - v251) < 0x20)
                goto LABEL_341;
              v270 = (v269 >> 2) + 1;
              v271 = 4 * (v270 & 0x7FFFFFFFFFFFFFF8);
              v272 = &v161[-v271];
              v268 -= v271;
              v273 = &v251[4 * v246 - 16];
              v274 = v161 - 16;
              v275 = v270 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v276 = *(_OWORD *)v274;
                *(v273 - 1) = *((_OWORD *)v274 - 1);
                *v273 = v276;
                v273 -= 2;
                v274 -= 32;
                v275 -= 8;
              }
              while (v275);
              v161 = v272;
              if (v270 != (v270 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_341:
                do
                {
                  v277 = *((_DWORD *)v161 - 1);
                  v161 -= 4;
                  *((_DWORD *)v268 - 1) = v277;
                  v268 -= 4;
                }
                while (v161 != v245);
              }
            }
            v361 = v268;
            v362 = v162;
            v363 = &v251[4 * v249];
            if (v245)
              operator delete(v245);
          }
          else
          {
            *(_DWORD *)v362 = v160;
            v162 = v161 + 4;
            v15 = v353;
          }
          v125 = 0;
          v362 = v162;
          ++v345;
          v152 = 1;
        }
        else
        {
          if (v362 >= v363)
          {
            v252 = v361;
            v253 = (v362 - v361) >> 2;
            v254 = v253 + 1;
            if ((unint64_t)(v253 + 1) >> 62)
              sub_1BE61F930();
            v255 = v363 - v361;
            if ((v363 - v361) >> 1 > v254)
              v254 = v255 >> 1;
            if ((unint64_t)v255 >= 0x7FFFFFFFFFFFFFFCLL)
              v256 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v256 = v254;
            if (v256)
            {
              if (v256 >> 62)
                sub_1BE61F100();
              v257 = v256;
              v258 = operator new(4 * v256);
              v256 = v257;
            }
            else
            {
              v258 = 0;
            }
            v278 = &v258[4 * v253];
            *(_DWORD *)v278 = v160;
            v226 = v278 + 4;
            if (v161 == v252)
            {
              v15 = v353;
            }
            else
            {
              v279 = v161 - v252 - 4;
              v15 = v353;
              if (v279 < 0x2C)
                goto LABEL_342;
              if ((unint64_t)(v252 - v258) < 0x20)
                goto LABEL_342;
              v280 = (v279 >> 2) + 1;
              v281 = 4 * (v280 & 0x7FFFFFFFFFFFFFF8);
              v282 = &v161[-v281];
              v278 -= v281;
              v283 = &v258[4 * v253 - 16];
              v284 = v161 - 16;
              v285 = v280 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v286 = *(_OWORD *)v284;
                *(v283 - 1) = *((_OWORD *)v284 - 1);
                *v283 = v286;
                v283 -= 2;
                v284 -= 32;
                v285 -= 8;
              }
              while (v285);
              v161 = v282;
              if (v280 != (v280 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_342:
                do
                {
                  v287 = *((_DWORD *)v161 - 1);
                  v161 -= 4;
                  *((_DWORD *)v278 - 1) = v287;
                  v278 -= 4;
                }
                while (v161 != v252);
              }
            }
            v361 = v278;
            v362 = v226;
            v363 = &v258[4 * v256];
            if (v252)
              operator delete(v252);
          }
          else
          {
            *(_DWORD *)v362 = v160;
            v226 = v161 + 4;
            v15 = v353;
          }
          v125 = 0;
          v362 = v226;
          --v347;
          v152 = 1;
        }
        goto LABEL_132;
      }
      v206 = v37 - v42;
      v207 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v206;
        v208 = (uint64_t)(v207 + 4);
LABEL_214:
        v125 = 0;
        v362 = (char *)v208;
        ++v347;
        goto LABEL_130;
      }
      v227 = v361;
      v228 = (v362 - v361) >> 2;
      v229 = v228 + 1;
      if ((unint64_t)(v228 + 1) >> 62)
        sub_1BE61F930();
      v230 = v363 - v361;
      if ((v363 - v361) >> 1 > v229)
        v229 = v230 >> 1;
      if ((unint64_t)v230 >= 0x7FFFFFFFFFFFFFFCLL)
        v231 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v231 = v229;
      if (v231)
      {
        if (v231 >> 62)
          sub_1BE61F100();
        v232 = v231;
        v233 = operator new(4 * v231);
        v231 = v232;
        v234 = &v233[4 * v228];
        *(_DWORD *)v234 = v206;
        v208 = (uint64_t)(v234 + 4);
        v235 = v207 - v227;
        if (v207 == v227)
          goto LABEL_212;
LABEL_206:
        v259 = v235 - 4;
        if (v259 < 0x2C)
          goto LABEL_343;
        if ((unint64_t)(v227 - v233) < 0x20)
          goto LABEL_343;
        v260 = (v259 >> 2) + 1;
        v261 = 4 * (v260 & 0x7FFFFFFFFFFFFFF8);
        v262 = &v207[-v261];
        v234 -= v261;
        v263 = &v233[4 * v228 - 16];
        v264 = v207 - 16;
        v265 = v260 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v266 = *(_OWORD *)v264;
          *(v263 - 1) = *((_OWORD *)v264 - 1);
          *v263 = v266;
          v263 -= 2;
          v264 -= 32;
          v265 -= 8;
        }
        while (v265);
        v207 = v262;
        if (v260 != (v260 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_343:
          do
          {
            v267 = *((_DWORD *)v207 - 1);
            v207 -= 4;
            *((_DWORD *)v234 - 1) = v267;
            v234 -= 4;
          }
          while (v207 != v227);
        }
      }
      else
      {
        v233 = 0;
        v234 = (char *)(4 * v228);
        *(_DWORD *)(4 * v228) = v206;
        v208 = 4 * v228 + 4;
        v235 = v207 - v227;
        if (v207 != v227)
          goto LABEL_206;
      }
LABEL_212:
      v361 = v234;
      v362 = (char *)v208;
      v363 = &v233[4 * v231];
      if (v227)
        operator delete(v227);
      goto LABEL_214;
    }
    if (objc_msgSend_characterIsMember_(v354, v72, (unsigned __int16)v24, v73, v74, v75, v342))
    {
      v80 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v37;
        v81 = (uint64_t)(v80 + 4);
        goto LABEL_159;
      }
      v143 = v361;
      v144 = (v362 - v361) >> 2;
      v145 = v144 + 1;
      if ((unint64_t)(v144 + 1) >> 62)
        sub_1BE61F930();
      v146 = v363 - v361;
      if ((v363 - v361) >> 1 > v145)
        v145 = v146 >> 1;
      if ((unint64_t)v146 >= 0x7FFFFFFFFFFFFFFCLL)
        v147 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v147 = v145;
      if (v147)
      {
        if (v147 >> 62)
          sub_1BE61F100();
        v148 = v147;
        v149 = operator new(4 * v147);
        v147 = v148;
        v150 = &v149[4 * v144];
        *(_DWORD *)v150 = v37;
        v81 = (uint64_t)(v150 + 4);
        v151 = v80 - v143;
        if (v80 == v143)
          goto LABEL_157;
LABEL_151:
        v209 = v151 - 4;
        if (v209 < 0x2C)
          goto LABEL_344;
        if ((unint64_t)(v143 - v149) < 0x20)
          goto LABEL_344;
        v210 = (v209 >> 2) + 1;
        v211 = 4 * (v210 & 0x7FFFFFFFFFFFFFF8);
        v212 = &v80[-v211];
        v150 -= v211;
        v213 = &v149[4 * v144 - 16];
        v214 = v80 - 16;
        v215 = v210 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v216 = *(_OWORD *)v214;
          *(v213 - 1) = *((_OWORD *)v214 - 1);
          *v213 = v216;
          v213 -= 2;
          v214 -= 32;
          v215 -= 8;
        }
        while (v215);
        v80 = v212;
        if (v210 != (v210 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_344:
          do
          {
            v217 = *((_DWORD *)v80 - 1);
            v80 -= 4;
            *((_DWORD *)v150 - 1) = v217;
            v150 -= 4;
          }
          while (v80 != v143);
        }
      }
      else
      {
        v149 = 0;
        v150 = (char *)(4 * v144);
        *(_DWORD *)(4 * v144) = v37;
        v81 = 4 * v144 + 4;
        v151 = v80 - v143;
        if (v80 != v143)
          goto LABEL_151;
      }
LABEL_157:
      v361 = v150;
      v362 = (char *)v81;
      v363 = &v149[4 * v147];
      if (v143)
        operator delete(v143);
LABEL_159:
      v15 = v353;
      v362 = (char *)v81;

LABEL_160:
      v125 = 0;
      goto LABEL_161;
    }
    if (objc_msgSend_characterIsMember_(v354, v76, (unsigned __int16)v20, v77, v78, v79))
    {
      objc_msgSend_appendString_(v352, v109, (uint64_t)v57, v110, v111, v112);
      v113 = -v42;
      v114 = v362;
      if (v362 < v363)
      {
        *(_DWORD *)v362 = v113;
        v115 = (uint64_t)(v114 + 4);
LABEL_186:
        v152 = 0;
        v125 = 0;
        v362 = (char *)v115;
        goto LABEL_131;
      }
      v197 = v361;
      v198 = (v362 - v361) >> 2;
      v199 = v198 + 1;
      if ((unint64_t)(v198 + 1) >> 62)
        sub_1BE61F930();
      v200 = v363 - v361;
      if ((v363 - v361) >> 1 > v199)
        v199 = v200 >> 1;
      if ((unint64_t)v200 >= 0x7FFFFFFFFFFFFFFCLL)
        v201 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v201 = v199;
      if (v201)
      {
        if (v201 >> 62)
          sub_1BE61F100();
        v202 = v201;
        v203 = operator new(4 * v201);
        v201 = v202;
        v204 = (int *)&v203[4 * v198];
        *v204 = v113;
        v115 = (uint64_t)(v204 + 1);
        v205 = v114 - v197;
        if (v114 == v197)
          goto LABEL_184;
LABEL_178:
        v236 = v205 - 4;
        if (v236 < 0x2C)
          goto LABEL_345;
        if ((unint64_t)(v197 - v203) < 0x20)
          goto LABEL_345;
        v237 = (v236 >> 2) + 1;
        v238 = 4 * (v237 & 0x7FFFFFFFFFFFFFF8);
        v239 = &v114[-v238];
        v204 = (int *)((char *)v204 - v238);
        v240 = &v203[4 * v198 - 16];
        v241 = v114 - 16;
        v242 = v237 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v243 = *(_OWORD *)v241;
          *(v240 - 1) = *((_OWORD *)v241 - 1);
          *v240 = v243;
          v240 -= 2;
          v241 -= 32;
          v242 -= 8;
        }
        while (v242);
        v114 = v239;
        if (v237 != (v237 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_345:
          do
          {
            v244 = *((_DWORD *)v114 - 1);
            v114 -= 4;
            *--v204 = v244;
          }
          while (v114 != v197);
        }
      }
      else
      {
        v203 = 0;
        v204 = (int *)(4 * v198);
        *(_DWORD *)(4 * v198) = v113;
        v115 = 4 * v198 + 4;
        v205 = v114 - v197;
        if (v114 != v197)
          goto LABEL_178;
      }
LABEL_184:
      v361 = (char *)v204;
      v362 = (char *)v115;
      v363 = &v203[4 * v201];
      if (v197)
        operator delete(v197);
      goto LABEL_186;
    }
    v152 = 1;
    v125 = 1;
LABEL_131:
    v15 = v353;
LABEL_132:

LABEL_133:
    v185 = v359;
    v186 = v360;
    if (v186 + v185 >= (unint64_t)objc_msgSend_length(v355, v187, v188, v189, v190, v191))
    {
      v359 = objc_msgSend_length(v355, v192, v193, v194, v195, v196);
      v360 = 0;
      if ((v152 & 1) == 0)
        goto LABEL_4;
    }
    else
    {
      v20 = objc_msgSend_codepointAtIndex_outRange_(v355, v192, v360 + v359, (uint64_t)&v359, v195, v196);
      if (!v152)
        goto LABEL_4;
    }
LABEL_161:
    v218 = v357;
    v219 = v358;
    if (v219 + v218 < (unint64_t)objc_msgSend_length(v15, v30, v31, v32, v33, v34, v342))
    {
      v24 = objc_msgSend_codepointAtIndex_outRange_(v15, v220, v358 + v357, (uint64_t)&v357, v223, v224);
LABEL_4:
      if ((v125 & 1) != 0)
        break;
      v36 = v358;
      goto LABEL_6;
    }
    v225 = objc_msgSend_length(v15, v220, v221, v222, v223, v224);
    v36 = 0;
    v357 = v225;
    v358 = 0;
    if ((v125 & 1) != 0)
      break;
LABEL_6:
    if (!(v360 | v36))
      goto LABEL_241;
  }
  v295 = &stru_1E77F6F28;
  v296 = 100.0;
  v292 = v346;
  v293 = v354;
  v297 = a11;
  if (a11)
    goto LABEL_294;
  v298 = a12;
  if (a12)
    goto LABEL_248;
LABEL_295:

  v299 = v361;
  if (!v361)
    goto LABEL_297;
LABEL_296:
  v362 = v299;
  operator delete(v299);
LABEL_297:

  return v296;
}

+ (id)lexiconCorrectionsForToken:(id)a3 locale:(id)a4 lexicon:(_LXLexicon *)a5 lmVocabulary:(void *)a6 ovsStringChecker:(id)a7 textReplacements:(id)a8 consumableStrokesSet:(id)a9 minimumTokenScore:(double)a10 activeHistoryRange:(_NSRange)a11 outBestTokenScore:(double *)a12 shouldCapitalizeWord:(BOOL)a13 shouldSkipEntryCorrection:(BOOL)a14 allowFullCapsCorrections:(BOOL)a15 minimalLengthForLowConfidenceCorrections:(int64_t)a16 lowConfidenceThreshold:(double)a17 minimalLengthForCustomCapitalizationCorrections:(int64_t)a18 outBestTokenIndex:(int64_t *)a19 outFoundTokenInLexicon:(BOOL *)a20 outFoundCaseMatchingTokenInLexicon:(BOOL *)a21 outCorrectionFromOutOfContextEntry:(BOOL *)a22
{
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  double v52;
  double v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  BOOL v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  id v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
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
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSString *v127;
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
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  CHTokenizedTextResultToken *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  double v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  double v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  id v261;
  uint64_t v263;
  double v264;
  double v265;
  double v266;
  double v267;
  id v268;
  id v269;
  id v270;
  int isEqualToString;
  unsigned int v272;
  void *v273;
  void *v274;
  uint64_t v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  id v283;
  id v284;
  void *v285;
  void *v286;
  id v287;
  void *v289;
  _OWORD v290[8];
  uint64_t v291;
  uint64_t v292;
  void (*v293)(uint64_t, uint64_t);
  void *v294;
  id v295;
  id v296;
  id v297;
  id v298;
  id v299;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  uint64_t *v305;
  uint8_t *v306;
  uint8_t *v307;
  _QWORD *v308;
  _QWORD *v309;
  uint64_t *v310;
  double v311;
  int64_t v312;
  int64_t v313;
  uint64_t v314;
  NSUInteger length;
  BOOL *v316;
  unint64_t v317;
  void *v318;
  BOOL *v319;
  double v320;
  double v321;
  double v322;
  int64_t *v323;
  BOOL *v324;
  BOOL v325;
  BOOL v326;
  BOOL v327;
  uint64_t v328;
  uint64_t *v329;
  uint64_t v330;
  char v331;
  _QWORD v332[3];
  char v333;
  _QWORD v334[4];
  uint8_t v335[8];
  uint8_t *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t *v340;
  uint64_t v341;
  char v342[8];
  uint8_t buf[8];
  uint8_t *v344;
  uint64_t v345;
  char v346;

  v27 = a3;
  v28 = a4;
  v284 = a7;
  v283 = a8;
  v34 = a9;
  if (qword_1EF567F30 != -1)
    dispatch_once(&qword_1EF567F30, &unk_1E77F21C8);
  v285 = v28;
  v286 = v27;
  v268 = v34;
  objc_msgSend_string(v27, v29, v30, v31, v32, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v35, v36, v37, v38, v39, v40))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v45 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v45, OS_LOG_TYPE_FAULT, "Lexicon correction requires non-empty token string.", buf, 2u);
    }

  }
  objc_msgSend_uppercaseStringWithLocale_(v35, v41, (uint64_t)v28, v42, v43, v44);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lowercaseStringWithLocale_(v35, v46, (uint64_t)v28, v47, v48, v49);
  v50 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v344 = buf;
  v345 = 0x2020000000;
  v346 = 0;
  v339 = 0;
  v340 = &v339;
  v341 = 0x2020000000;
  v342[0] = 0;
  v281 = (void *)v50;
  objc_msgSend_computeEditPenalizationFromString_toReferenceString_withSuffix_withCaseSensitivity_withFirstLetterCaseSensitivity_withDiacriticSensitivity_withDiacriticsCharSet_withConsumableStrokesCharSet_outputSuffix_lexiconExtraCharacters_firstLetterCaseFlipped_(CHLanguageUtilities, v51, (uint64_t)v35, v50, (uint64_t)&stru_1E77F6F28, 1, 1, 0, 0, v34, 0, 0, v342);
  v53 = v52;
  objc_msgSend_computeEditPenalizationFromString_toReferenceString_withSuffix_withCaseSensitivity_withFirstLetterCaseSensitivity_withDiacriticSensitivity_withDiacriticsCharSet_withConsumableStrokesCharSet_outputSuffix_lexiconExtraCharacters_firstLetterCaseFlipped_(CHLanguageUtilities, v54, (uint64_t)v35, (uint64_t)v282, (uint64_t)&stru_1E77F6F28, 1, 1, 0, 0, v34, 0, 0, v340 + 3);
  v61 = v60;
  v62 = v53 + v60;
  v63 = v60 / v62 < 0.5 && a15;
  v344[24] = v63;
  if (objc_msgSend_length(v35, v55, v56, v57, v58, v59) <= a11.length)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v67 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v335 = 0;
      _os_log_impl(&dword_1BE607000, v67, OS_LOG_TYPE_FAULT, "The prefix length should be smaller than the candidate string length", v335, 2u);
    }

  }
  objc_msgSend_substringWithRange_(v35, v64, 0, a11.length, v65, v66);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v68, v69, v70, v71, v72);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v335 = 0;
  v336 = v335;
  v337 = 0x2020000000;
  v338 = 0x7FEFFFFFFFFFFFFFLL;
  v334[0] = 0;
  v334[1] = v334;
  v334[2] = 0x2020000000;
  v334[3] = 0x7FEFFFFFFFFFFFFFLL;
  v332[0] = 0;
  v332[1] = v332;
  v332[2] = 0x2020000000;
  v333 = 0;
  v73 = v35;
  v83 = objc_msgSend_rangeOfString_(v73, v74, (uint64_t)CFSTR("'"), v75, v76, v77);
  v328 = 0;
  v329 = &v328;
  v330 = 0x2020000000;
  v331 = 0;
  v84 = v73;
  if (v83 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v84 = v73;
    if (v83 < objc_msgSend_length(v73, v78, v79, v80, v81, v82) - 1)
    {
      v84 = v73;
      if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v78, (uint64_t)v73, (uint64_t)a5, 0, v82) & 1) == 0)
      {
        objc_msgSend_substringFromIndex_(v73, v78, v83 + 1, v80, v81, v82);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v73;
        if (objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v86, (uint64_t)v85, (uint64_t)a5, 0, v87))
        {
          v84 = v85;

          *((_BYTE *)v329 + 24) = 1;
        }

        v34 = v268;
      }
    }
  }
  objc_msgSend_stringByTrimmingCharactersInSet_(v84, v78, qword_1EF567F28, v80, v81, v82);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v291 = MEMORY[0x1E0C809B0];
  v292 = 3221225472;
  v293 = sub_1BE627038;
  v294 = &unk_1E77F21F0;
  v311 = a17;
  v89 = v84;
  v295 = v89;
  v312 = a16;
  v270 = v88;
  v296 = v270;
  v313 = a18;
  v269 = v280;
  v297 = v269;
  v314 = 0;
  length = a11.length;
  v316 = a20;
  v90 = v284;
  v298 = v90;
  v91 = v286;
  v317 = 0xBFF4D104D427DE80;
  v318 = a6;
  v319 = a21;
  v325 = a13;
  v299 = v91;
  v305 = &v328;
  v92 = v73;
  v300 = v92;
  v93 = v283;
  v326 = a14;
  v301 = v93;
  v306 = buf;
  v320 = v61;
  v321 = v62;
  v327 = a15;
  v94 = v285;
  v302 = v94;
  v95 = v34;
  v322 = a10;
  v303 = v95;
  v307 = v335;
  v308 = v332;
  v309 = v334;
  v310 = &v339;
  v96 = v279;
  v304 = v96;
  v323 = a19;
  v324 = a22;
  LXLexiconEnumerateEntriesForString();
  if (a12)
    *a12 = *((double *)v336 + 3);
  v289 = v90;
  if (!objc_msgSend_count(v96, v97, v98, v99, v100, v101))
  {
    v276 = objc_msgSend_properties(v91, v102, v103, v104, v105, v106);
    if (a14)
    {
      v287 = v92;
    }
    else if (v344[24])
    {
      objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uppercaseStringWithLocale_(v117, v118, (uint64_t)v94, v119, v120, v121);
      v287 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (a13)
    {
      objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseStringWithLocale_(v122, v123, (uint64_t)v94, v124, v125, v126);
      v127 = (NSString *)objc_claimAutoreleasedReturnValue();

      uppercaseFirstLetter(v127);
      v128 = objc_claimAutoreleasedReturnValue();

      v276 |= 0x200uLL;
      v287 = (id)v128;
    }
    else
    {
      objc_msgSend_string(v91, v107, v108, v109, v110, v111);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v129, v130, v131, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      v287 = v135;
      objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v135, v136, 0, v137, v138, v139);
      v141 = (uint64_t)v140;
      if (objc_msgSend_length(v135, v140, v142, v143, v144, v145) > (unint64_t)v140)
      {
        objc_msgSend_substringFromIndex_(v135, v112, v141, v114, v115, v116);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v91, v146, v147, v148, v149, v150);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_substringFromIndex_(v273, v151, v141, v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v277, v156, (uint64_t)v155, v157, v158, v159);

        v160 = v276;
        if (!isEqualToString)
          v160 = v276 | 0x200;
        v276 = v160;
      }
    }
    objc_msgSend_string(v91, v112, v113, v114, v115, v116);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend_isEqualToString_(v287, v162, (uint64_t)v161, v163, v164, v165);

    if ((v166 & 1) == 0)
    {
      v167 = [CHTokenizedTextResultToken alloc];
      objc_msgSend_strokeIndexes(v91, v168, v169, v170, v171, v172);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      v272 = objc_msgSend_wordID(v91, v173, v174, v175, v176, v177);
      objc_msgSend_modelScore(v91, v178, v179, v180, v181, v182);
      v267 = v183;
      objc_msgSend_recognitionScore(v91, v184, v185, v186, v187, v188);
      v266 = v189;
      objc_msgSend_combinedScore(v91, v190, v191, v192, v193, v194);
      v265 = v195;
      objc_msgSend_alignmentScore(v91, v196, v197, v198, v199, v200);
      v264 = v201;
      objc_msgSend_recognizerSourceLocale(v91, v202, v203, v204, v205, v206);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      v212 = objc_msgSend_inputSources(v91, v207, v208, v209, v210, v211);
      v263 = objc_msgSend_substrokeCount(v91, v213, v214, v215, v216, v217);
      objc_msgSend_bounds(v91, v218, v219, v220, v221, v222);
      v224 = v223;
      v226 = v225;
      v228 = v227;
      v230 = v229;
      objc_msgSend_originalBounds(v91, v231, v232, v233, v234, v235);
      v242 = v241;
      v244 = v243;
      v246 = v245;
      v248 = v247;
      if (v91)
        objc_msgSend_principalLines(v91, v236, v237, v238, v239, v240);
      else
        memset(v290, 0, sizeof(v290));
      v249 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v167, v236, (uint64_t)v287, (uint64_t)v278, v272, v276, v274, v212 | 0x100, v267, v266, v265, v264, v224, v226, v228, v230, v263, v242, v244,
                       v246,
                       v248,
                       v290);

      objc_msgSend_addObject_(v96, v250, (uint64_t)v249, v251, v252, v253);
      if (a12)
      {
        objc_msgSend_combinedScore(v91, v254, v255, v256, v257, v258);
        *(_QWORD *)a12 = v259;
      }
      if (a19)
        *a19 = 0;
      if (a22)
        *a22 = 0;

    }
  }
  v260 = v304;
  v261 = v96;

  _Block_object_dispose(&v328, 8);
  _Block_object_dispose(v332, 8);
  _Block_object_dispose(v334, 8);
  _Block_object_dispose(v335, 8);

  _Block_object_dispose(&v339, 8);
  _Block_object_dispose(buf, 8);

  return v261;
}

@end
