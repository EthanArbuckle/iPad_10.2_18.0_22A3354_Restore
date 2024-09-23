@implementation CHSpellChecker

- (CHSpellChecker)init
{
  CHSpellChecker *v2;
  CHSpellCheckerErrorModel *v3;
  CHSpellCheckerErrorModel *errorModel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHSpellChecker;
  v2 = -[CHSpellChecker init](&v6, sel_init);
  if (v2)
  {
    objc_opt_self();
    if (qword_1EF568208 != -1)
      dispatch_once(&qword_1EF568208, &unk_1E77F1810);
    objc_storeStrong((id *)&v2->_spellServer, (id)qword_1EF568200);
    objc_opt_self();
    v3 = objc_alloc_init(CHSpellCheckerErrorModel);
    errorModel = v2->_errorModel;
    v2->_errorModel = v3;

  }
  return v2;
}

- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4
{
  return 0;
}

- (id)topCorrectionForString:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLanguage:(id)a7
{
  NSString *v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSCharacterSet *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSCharacterSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  NSCharacterSet *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  NSString *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSString *v51;
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
  uint64_t v63;
  uint64_t v64;
  AppleSpell *v65;
  const char *v66;
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
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  __CFString *v89;
  id v90;

  v11 = (NSString *)a3;
  v12 = a4;
  v90 = a5;
  v13 = a7;
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v14, v15, v16, v17, v18);
  v19 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = isStringEntirelyFromSet(v11, v19);

  if ((a7 & 1) != 0)
  {
    v25 = 0;
    goto LABEL_15;
  }
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v20, v21, v22, v23, v24);
  v26 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v27 = rangeOfCharactersFromSet(v11, v26, 0);
  v29 = v28;

  if (v29)
  {
    objc_msgSend_substringWithRange_(v11, v30, v27, v29, v33, v34);
    v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = &stru_1E77F6F28;
  }
  v89 = (__CFString *)v35;
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v30, v31, v32, v33, v34);
  v36 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v37 = rangeOfCharactersFromSet(v11, v36, 1);
  v39 = v38;

  if (!v39)
  {
    v44 = &stru_1E77F6F28;
    if (v12)
      goto LABEL_8;
LABEL_10:
    v45 = v11;
    goto LABEL_11;
  }
  objc_msgSend_substringWithRange_(v11, v40, v37, v39, v42, v43);
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_10;
LABEL_8:
  objc_msgSend_stringByAppendingFormat_(v12, v40, (uint64_t)CFSTR("%@%@"), v41, v42, v43, v90, v11);
  v45 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v51 = v45;
  v52 = objc_msgSend_length(v45, v46, v47, v48, v49, v50);
  v63 = v52 + v29 - objc_msgSend_length(v11, v53, v54, v55, v56, v57);
  v64 = objc_msgSend_length(v11, v58, v59, v60, v61, v62) - (v39 + v29);
  v65 = self->_spellServer;
  objc_sync_enter(v65);
  objc_msgSend_spellServer_suggestGuessesForWordRange_inString_language_options_(self->_spellServer, v66, (uint64_t)self, v63, v64, (uint64_t)v51, v13, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v65);

  if (objc_msgSend_count(v67, v68, v69, v70, v71, v72))
  {
    objc_msgSend_objectAtIndexedSubscript_(v67, v73, 0, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(v89, v78, (uint64_t)v77, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByAppendingString_(v82, v83, (uint64_t)v44, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  v25 = v87;

LABEL_15:
  return v25;
}

- (id)correctionsForString:(id)a3 shouldUseErrorModel:(BOOL)a4 forLocale:(id)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  CHSpellCheckerErrorModel *errorModel;
  void *v13;
  CHSpellCheckerErrorModel *v14;
  AppleSpell *v15;
  AppleSpell *spellServer;
  const char *v17;
  uint64_t v18;
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
  void *v30;
  const __CFString *v32;
  _QWORD v33[2];

  v6 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = a5;
  if (v6)
  {
    errorModel = self->_errorModel;
    v32 = CFSTR("ErrorModel");
    v33[0] = errorModel;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v33, (uint64_t)&v32, 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_errorModel;
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  v15 = self->_spellServer;
  objc_sync_enter(v15);
  spellServer = self->_spellServer;
  v22 = objc_msgSend_length(v8, v17, v18, v19, v20, v21);
  objc_msgSend_localeIdentifier(v11, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_spellServer_suggestGuessDictionariesForWordRange_inString_language_options_errorModel_(spellServer, v29, (uint64_t)self, 0, v22, (uint64_t)v8, v28, v13, v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v15);
  return v30;
}

- (id)topCorrectionForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  objc_msgSend_topCorrectionsForRecognition_contextBeforeToken_contextSeparator_shouldUseErrorModel_forLocale_minScore_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  if (v8 && objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    objc_msgSend_objectAtIndexedSubscript_(v14, v15, 0, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
  else
  {

    return 0;
  }
}

- (id)topCorrectionsForRecognition:(id)a3 contextBeforeToken:(id)a4 contextSeparator:(id)a5 shouldUseErrorModel:(BOOL)a6 forLocale:(id)a7 minScore:(double)a8
{
  NSString *v13;
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
  NSCharacterSet *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSCharacterSet *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSCharacterSet *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  NSString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  _BOOL4 v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  NSString *v110;
  NSString *v111;
  id v112;
  id v113;
  id v114;
  __CFString *v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v13 = (NSString *)a3;
  v113 = a4;
  v112 = a5;
  v114 = a7;
  v111 = v13;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17, v18);
  v116 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v19, v20, v21, v22, v23);
  v24 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = isStringEntirelyFromSet(v13, v24);

  if ((a5 & 1) != 0)
    goto LABEL_20;
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v25, v26, v27, v28, v29);
  v30 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v31 = rangeOfCharactersFromSet(v13, v30, 0);
  v33 = v32;

  if (v33)
  {
    objc_msgSend_substringWithRange_(v13, v34, v31, v33, v37, v38);
    v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v115 = &stru_1E77F6F28;
  }
  objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3500], v34, v35, v36, v37, v38);
  v39 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v40 = rangeOfCharactersFromSet(v13, v39, 1);
  v42 = v41;

  if (!v42)
  {
    v47 = &stru_1E77F6F28;
    v48 = v113;
    if (v113)
      goto LABEL_7;
LABEL_9:
    v49 = v13;
    goto LABEL_10;
  }
  objc_msgSend_substringWithRange_(v13, v43, v40, v42, v45, v46);
  v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v48 = v113;
  if (!v113)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_stringByAppendingFormat_(v48, v43, (uint64_t)CFSTR("%@%@"), v44, v45, v46, v112, v13);
  v49 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v110 = v49;
  v55 = objc_msgSend_length(v49, v50, v51, v52, v53, v54);
  v61 = objc_msgSend_length(v13, v56, v57, v58, v59, v60);
  v67 = objc_msgSend_length(v13, v62, v63, v64, v65, v66);
  objc_msgSend_substringWithRange_(v110, v68, v55 + v33 - v61, v67 - (v42 + v33), v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_correctionsForString_shouldUseErrorModel_forLocale_(self, v72, (uint64_t)v71, 1, (uint64_t)v114, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v75 = v74;
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v117, (uint64_t)v121, 16, v77);
  if (v82)
  {
    v83 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v82; ++i)
      {
        if (*(_QWORD *)v118 != v83)
          objc_enumerationMutation(v75);
        v85 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v85, v78, (uint64_t)CFSTR("Score"), v79, v80, v81);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v86, v87, v88, v89, v90, v91);
        v93 = v92 > a8;

        if (v93)
        {
          objc_msgSend_objectForKeyedSubscript_(v85, v78, (uint64_t)CFSTR("Guess"), v79, v80, v81);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByAppendingString_(v115, v95, (uint64_t)v94, v96, v97, v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_stringByAppendingString_(v99, v100, (uint64_t)v47, v101, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObject_(v116, v105, (uint64_t)v104, v106, v107, v108);
        }
      }
      v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v117, (uint64_t)v121, 16, v81);
    }
    while (v82);
  }

LABEL_20:
  return v116;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorModel, 0);
  objc_storeStrong((id *)&self->_spellServer, 0);
}

@end
