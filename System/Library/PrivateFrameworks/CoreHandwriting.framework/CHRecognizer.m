@implementation CHRecognizer

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5 learningDictionaryURL:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __CFLocale *v14;
  const char *v15;
  __CFLocale *v16;
  CHRecognizer *v17;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v13 = a6;
  if (a5)
  {
    v14 = a5;
  }
  else
  {
    objc_msgSend_defaultLocaleForRecognitionType_withMode_(CHRecognizerConfiguration, v10, v8, v7, v11, v12);
    v14 = (__CFLocale *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v14;
  self->_recognitionType = v8;
  v17 = (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, v15, v7, (uint64_t)v14, (uint64_t)v13, 0);

  return v17;
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, 0, 0);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, 0, (uint64_t)a5);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5
{
  return (CHRecognizer *)objc_msgSend_initWithMode_locale_learningDictionaryURL_recognizerOptions_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, 0);
}

- (CHRecognizer)initWithMode:(int)a3 locale:(id)a4 learningDictionaryURL:(id)a5 recognizerOptions:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  CHRecognizerOptions *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CHRecognizer *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *recognitionQueue;
  CHCornerDetector *cornerDetector;
  CHCTCRecognitionModel *recognitionModel;
  CHSpellChecker *spellChecker;
  CHStringOVSChecker *ovsStringChecker;
  CHMecabraWrapper *mecabraWrapper;
  CHDrawing *cachedDrawing;
  NSMutableIndexSet *v26;
  NSMutableIndexSet *lastCharacterSegmentIndexes;
  CHPostProcessingManager *postProcessor;
  CHPostProcessingManager *mergedResultPostProcessor;
  CHRecognizerConfiguration *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  NSCharacterSet *activeCharacterSet;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CGFloat v59;
  CGFloat v60;
  CHRecognizer *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  objc_super v75;
  _BYTE buf[24];
  void *v77;
  CHRecognizer *v78;
  uint64_t v79;

  v8 = *(_QWORD *)&a3;
  v79 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (CHRecognizerOptions *)a6;
  if ((objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, v13, (uint64_t)v10, v8, v14, v15) & 1) != 0)
  {
    v75.receiver = self;
    v75.super_class = (Class)CHRecognizer;
    v16 = -[CHRecognizer init](&v75, sel_init);
    if (v16)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create("com.apple.CoreHandwriting.recognizerQueue", v17);
      recognitionQueue = v16->_recognitionQueue;
      v16->_recognitionQueue = (OS_dispatch_queue *)v18;

      v16->_engine = 0;
      cornerDetector = v16->_cornerDetector;
      v16->_cornerDetector = 0;

      recognitionModel = v16->_recognitionModel;
      v16->_recognitionModel = 0;

      spellChecker = v16->_spellChecker;
      v16->_spellChecker = 0;

      ovsStringChecker = v16->_ovsStringChecker;
      v16->_ovsStringChecker = 0;

      v16->_wordLanguageModel = 0;
      v16->_characterLanguageModel = 0;
      mecabraWrapper = v16->_mecabraWrapper;
      v16->_mecabraWrapper = 0;

      v16->_staticLexicon = 0;
      v16->_customLexicon = 0;
      v16->_customPhraseLexicon = 0;
      v16->_radicalClusterFST = 0;
      v16->_formatGrammarFST = 0;
      v16->_cjkDynamicLexicon = 0;
      v16->_secondaryStaticLexicon = 0;
      v16->_cjkStaticLexicon = 0;
      cachedDrawing = v16->_cachedDrawing;
      v16->_cachedDrawing = 0;
      v16->_transliterationVariantMap = 0;

      objc_storeStrong((id *)&v16->_learningDictionaryURL, a5);
      v16->_lastCharacterSegmentCount = -1;
      v26 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
      lastCharacterSegmentIndexes = v16->_lastCharacterSegmentIndexes;
      v16->_lastCharacterSegmentIndexes = v26;

      postProcessor = v16->_postProcessor;
      v16->_postProcessor = 0;

      mergedResultPostProcessor = v16->_mergedResultPostProcessor;
      v16->_mergedResultPostProcessor = 0;

      if (!v12)
        v12 = objc_alloc_init(CHRecognizerOptions);
      v30 = [CHRecognizerConfiguration alloc];
      v36 = objc_msgSend_enableCachingIfAvailable(v12, v31, v32, v33, v34, v35);
      v42 = objc_msgSend_enableGen2ModelIfAvailable(v12, v37, v38, v39, v40, v41);
      v48 = objc_msgSend_enableGen2CharacterLMIfAvailable(v12, v43, v44, v45, v46, v47);
      v50 = (void *)objc_msgSend_initWithMode_locale_contentType_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(v30, v49, v8, (uint64_t)v10, 0, v36, v42, v48);
      objc_storeStrong((id *)&v16->_configuration, v50);
      activeCharacterSet = v16->_activeCharacterSet;
      v16->_activeCharacterSet = 0;

      v16->_maxRecognitionResultCount = 0;
      v52 = (void *)objc_opt_class();
      objc_msgSend_defaultMinimumDrawingSize(v52, v53, v54, v55, v56, v57);
      v58 = MEMORY[0x1E0C809B0];
      v16->_minimumDrawingSize.width = v59;
      v16->_minimumDrawingSize.height = v60;
      *(_QWORD *)buf = v58;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1BE63FBC8;
      v77 = &unk_1E77F1F38;
      v78 = v16;
      sub_1BE63EFDC((uint64_t)v16, buf);

    }
    self = v16;
    v61 = self;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v62 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_stringForRecognitionMode_(CHRecognizerConfiguration, v63, v8, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localeIdentifier(v10, v68, v69, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v73;
      _os_log_impl(&dword_1BE607000, v62, OS_LOG_TYPE_ERROR, "Configuration for recognizer with mode=%@ and locale=%@ is not supported.", buf, 0x16u);

    }
    v61 = 0;
  }

  return v61;
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 learningDictionaryURL:(id)a5
{
  return (CHRecognizer *)MEMORY[0x1E0DE7D20](self, sel_initWithType_mode_locale_learningDictionaryURL_, *(_QWORD *)&a3, *(_QWORD *)&a4, 0, a5);
}

- (id)strokeIndexesForLastCharacter
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE63EF8C;
  v9 = sub_1BE63EF9C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE63EFA4;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_defaultPunctuationStringsOutputScores:(id *)a3 maxCandidateCount:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  VariantMap *transliterationVariantMap;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  BOOL v33;
  uint64_t v35;
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
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v53;
  char *v54;
  char *v55;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, a4, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  transliterationVariantMap = self->_transliterationVariantMap;
  if (transliterationVariantMap)
  {
    VariantMap::VariantsForCode(transliterationVariantMap, 57425, &v54);
    v22 = v54;
    v23 = v55;
    if (v54 != v55)
    {
      v53 = v54;
      v24 = v54 + 4;
      v25 = 0.0;
      do
      {
        unicodeToNSString(*((_DWORD *)v24 - 1), v17, v18, v19, v20, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v26;
        v32 = *((_DWORD *)v24 - 1);
        v33 = v32 == 8212 || v32 == 8943;
        if (v33 || v32 == 8230)
        {
          objc_msgSend_stringByAppendingString_(v26, v27, (uint64_t)v26, v28, v29, v30);
          v35 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v35;
        }
        objc_msgSend_addObject_(v9, v27, (uint64_t)v31, v28, v29, v30);
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v36, v37, v38, v39, v40, v25);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v15, v42, (uint64_t)v41, v43, v44, v45);

        v51 = objc_msgSend_count(v9, v46, v47, v48, v49, v50);
        if (v51 == a4)
          break;
        v25 = v25 + 2.22044605e-16;
        v33 = v24 == v23;
        v24 += 4;
      }
      while (!v33);
      v22 = v53;
    }
    if (a3)
      goto LABEL_18;
  }
  else
  {
    v22 = 0;
    if (a3)
LABEL_18:
      *a3 = objc_retainAutorelease(v15);
  }
  if (v22)
    operator delete(v22);

  return v9;
}

- (BOOL)isOVSString:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE63F36C;
  v7[3] = &unk_1E77F23D8;
  v8 = v4;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)transliterationVariantsForString:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE63EF8C;
  v15 = sub_1BE63EF9C;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE63F49C;
  v8[3] = &unk_1E77F23D8;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_initializeMergedResultPostProcessor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1BE6404F0;
  v2[3] = &unk_1E77F1F38;
  v2[4] = self;
  sub_1BE63EFDC((uint64_t)self, v2);
}

- (BOOL)_isLocaleSupported:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char isLocaleSupported_withMode;

  v4 = a3;
  v10 = objc_msgSend_mode(self->_configuration, v5, v6, v7, v8, v9);
  isLocaleSupported_withMode = objc_msgSend_isLocaleSupported_withMode_(CHRecognizer, v11, (uint64_t)v4, v10, v12, v13);

  return isLocaleSupported_withMode;
}

+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_isLocaleSupported_withMode_(CHRecognizerConfiguration, a2, (uint64_t)a3, *(uint64_t *)&a4, v4, v5);
}

- (void)updateAddressBookLexicon:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BE643548;
    v10[3] = &unk_1E77F2428;
    v10[4] = self;
    v11 = v4;
    sub_1BE63EFDC((uint64_t)self, v10);

  }
}

- (void)updateUserDictionaryLexicon:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BE643710;
    v10[3] = &unk_1E77F2428;
    v10[4] = self;
    v11 = v4;
    sub_1BE63EFDC((uint64_t)self, v10);

  }
}

- (void)updateMecabraWithRegionalOTAAssets:(id)a3 nonRegionalOTAAssets:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE6438F4;
  v10[3] = &unk_1E77F2450;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  sub_1BE63EFDC((uint64_t)self, v10);

}

- (void)setCustomLexicon:(_LXLexicon *)a3 customVocabulary:(void *)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE643A34;
  v4[3] = &unk_1E77F2478;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  sub_1BE63EFDC((uint64_t)self, v4);
}

- (void)setCustomPhraseLexicon:(_LXLexicon *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE643B80;
  v3[3] = &unk_1E77F24A0;
  v3[4] = self;
  v3[5] = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (void)setTextReplacements:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE643CA8;
  v6[3] = &unk_1E77F2428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v6);

}

- (void)_updateWordLanguageModel:(void *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE643EE0;
  v3[3] = &unk_1E77F24A0;
  v3[4] = self;
  v3[5] = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (void)candidateAccepted:(void *)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE644010;
  v3[3] = &unk_1E77F24A0;
  v3[4] = self;
  v3[5] = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (vector<const)completionsForCandidate:(CHRecognizer *)self prefix:(SEL)a3 option:(id)a4
{
  return (vector<const void *, std::allocator<const void *>> *)MEMORY[0x1E0DE7D20](self, sel_completionsForCandidate_candidateContext_prefix_option_, a4, 0, a5, a6);
}

- (vector<const)completionsForCandidate:(CHRecognizer *)self candidateContext:(SEL)a3 prefix:(id)a4 option:(id)a5
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t *v17;
  _BYTE *v18;
  _BYTE *v19;
  int64_t v20;
  void **v21;
  void **v22;
  vector<const void *, std::allocator<const void *>> *result;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  void (*v33)(uint64_t);
  void *v34;
  void *__p;
  void *v36;
  uint64_t v37;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x4812000000;
  v32 = sub_1BE644298;
  v33 = sub_1BE6442BC;
  v34 = &unk_1BE94989A;
  __p = 0;
  v36 = 0;
  v37 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BE6442D4;
  v24[3] = &unk_1E77F24C8;
  v24[4] = self;
  v15 = v13;
  v25 = v15;
  v16 = v14;
  v27 = &v29;
  v28 = a7;
  v26 = v16;
  sub_1BE63EFDC((uint64_t)self, v24);
  v17 = v30;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v19 = (_BYTE *)v17[6];
  v18 = (_BYTE *)v17[7];
  v20 = v18 - v19;
  if (v18 != v19)
  {
    if (v20 < 0)
      sub_1BE61F930();
    v21 = (void **)operator new(v18 - v19);
    retstr->var0 = v21;
    v22 = &v21[v20 >> 3];
    retstr->var2.var0 = v22;
    memcpy(v21, v19, v20);
    retstr->var1 = v22;
  }

  _Block_object_dispose(&v29, 8);
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }

  return result;
}

- (BOOL)isRareChineseEntry:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE644598;
  v7[3] = &unk_1E77F24F0;
  v7[4] = self;
  v8 = v4;
  v9 = &v10;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4
{
  return (CHRecognizer *)((uint64_t (*)(CHRecognizer *, char *, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithType_mode_locale_, *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (CHRecognizer)initWithType:(int)a3 mode:(int)a4 locale:(__CFLocale *)a5
{
  return (CHRecognizer *)MEMORY[0x1E0DE7D20](self, sel_initWithType_mode_locale_learningDictionaryURL_, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0);
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  if (self)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_1BE643160;
    v4[3] = &unk_1E77F1F38;
    v4[4] = self;
    sub_1BE63EFDC((uint64_t)self, v4);
  }
  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHRecognizer;
  -[CHRecognizer dealloc](&v3, sel_dealloc);
}

- (id)supportedCharacterSet
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v10;
  char *v11;

  if (!self->_engine)
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  CHNeuralNetwork::supportedCodes(self->_engine, &v10);
  v7 = v10;
  v8 = v11;
  if (v10 != v11)
  {
    do
    {
      objc_msgSend_addCharactersInRange_(v3, v4, *(int *)v7, 1, v5, v6);
      v7 += 4;
    }
    while (v7 != v8);
    v7 = v10;
  }
  if (v7)
  {
    v11 = v7;
    operator delete(v7);
  }
  return v3;
}

- (id)supportedStrings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v27;
  char *v28;

  if (self->_engine)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CHNeuralNetwork::supportedCodes(self->_engine, &v27);
    v13 = v27;
    v14 = v28;
    if (v27 != v28)
    {
      do
      {
        v15 = (const char *)*(unsigned int *)v13;
        if (objc_msgSend_mode(self->_configuration, v8, v9, v10, v11, v12) == 3)
          sub_1BE644944((uint64_t)self, v15, v17, v18, v19, v20);
        else
          unicodeToNSString((int)v15, v16, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v7, v22, (uint64_t)v21, v23, v24, v25);

        v13 += 4;
      }
      while (v13 != v14);
      v13 = v27;
    }
    if (v13)
    {
      v28 = v13;
      operator delete(v13);
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)characterSetForStrings:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    if (self)
    {
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v6);
          v14 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend_objectForKey_(&unk_1E7827240, v15, (uint64_t)v14, v16, v17, v18, (_QWORD)v32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v25 = objc_msgSend_integerValue(v19, v20, v21, v22, v23, v24);
            objc_msgSend_addCharactersInRange_(v5, v26, v25, 1, v27, v28);
          }

        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v29, (uint64_t)&v32, (uint64_t)v36, 16, v30);
      }
      while (v11);
    }
    else
    {
      do
      {
        if (*(_QWORD *)v33 == v12)
        {
          do
            --v11;
          while (v11);
        }
        else
        {
          do
          {
            if (*(_QWORD *)v33 != v12)
              objc_enumerationMutation(v6);
            --v11;
          }
          while (v11);
        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v10);
      }
      while (v11);
    }
  }

  return v5;
}

- (double)_calculateJointWordLMScoreForString:(id)a3 wordRanges:(id)a4 wordIDs:(id)a5 patternEntries:(id)a6 history:(unsigned int *)a7 historyLength:(unint64_t)a8
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t i;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  double v72;
  void *v76;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  CHRecognizer *v86;
  uint64_t *v87;
  unint64_t v88;
  unsigned int *v89;
  uint64_t v90;
  double *v91;
  uint64_t v92;
  uint64_t v93;
  id v94[2];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18 = a6;
  if (qword_1EF568C10 != -1)
    dispatch_once(&qword_1EF568C10, &unk_1E77F25F8);
  v78 = v13;
  v76 = v18;
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v14, (uint64_t)v18, v15, v16, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v12, v19, v20, v21, v22, v23); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v24, v26, i, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_BOOLValue(v30, v31, v32, v33, v34, v35);

    if (v36)
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v19, i, v21, v22, v23);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_rangeValue(v37, v38, v39, v40, v41, v42);
      v45 = v44;

      objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E0CB3500], v46, v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_rangeOfCharacterFromSet_options_range_(v11, v52, (uint64_t)v51, 2, v43, v45);

      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v19, 0, v21, v22, v23);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v24, v55, (uint64_t)v54, i, v56, v57);

      }
    }
  }
  if (objc_msgSend_indexOfObject_(v78, v26, (uint64_t)&unk_1E7828268, v27, v28, v29) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v59 = v12;
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99DE8], v60, (uint64_t)v78, v61, v62, v63);
    v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v94[0] = 0;
    objc_msgSend__tokensUsingLMTokenizerForString_wordRanges_nonWordPatterns_outTokenIDs_(self, v58, (uint64_t)v11, (uint64_t)v12, (uint64_t)v24, (uint64_t)v94);
    v65 = objc_claimAutoreleasedReturnValue();
    v64 = v94[0];
    v59 = (id)v65;
  }
  v90 = 0;
  v91 = (double *)&v90;
  v92 = 0x2020000000;
  v93 = 0;
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = sub_1BE6493F8;
  v79[3] = &unk_1E77F2620;
  v88 = a8;
  v66 = v59;
  v80 = v66;
  v89 = a7;
  v67 = v12;
  v81 = v67;
  v68 = v11;
  v82 = v68;
  v69 = v76;
  v83 = v69;
  v70 = v78;
  v84 = v70;
  v85 = v64;
  v86 = self;
  v87 = &v90;
  v71 = v64;
  sub_1BE63EFDC((uint64_t)self, v79);
  v72 = v91[3];

  _Block_object_dispose(&v90, 8);
  return v72;
}

- (id)_tokensUsingLMTokenizerForString:(id)a3 wordRanges:(id)a4 nonWordPatterns:(id)a5 outTokenIDs:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
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
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  id v43;
  CHRecognizer *v44;
  id v45;
  id v46;
  id v47;
  id v48;

  v10 = a3;
  v11 = a4;
  v17 = a5;
  if (qword_1EF568C20 != -1)
    dispatch_once(&qword_1EF568C20, &unk_1E77F2640);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v10, v25, (uint64_t)CFSTR(" "), v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE6499B4;
  v42[3] = &unk_1E77F2690;
  v30 = v29;
  v43 = v30;
  v44 = self;
  v31 = v11;
  v45 = v31;
  v32 = v17;
  v46 = v32;
  v33 = v24;
  v47 = v33;
  v34 = v18;
  v48 = v34;
  sub_1BE63EFDC((uint64_t)self, v42);
  if (a6)
  {
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v35, (uint64_t)v33, v36, v37, v38);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v39 = v48;
  v40 = v34;

  return v40;
}

- (id)_addAlternativeCandidatesForTokenizedResult:(id)a3
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
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
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t j;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  NSIndexPath *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _BOOL4 v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSIndexPath *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  CHMutableTokenizedResultColumn *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  id obj;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  id v193;
  void *v194;
  void *v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  v193 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_transcriptionPaths(v193, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v8, v15, (uint64_t)v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_transcriptionPathScores(v193, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v20, v27, (uint64_t)v26, v28, v29, v30);
  v195 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  objc_msgSend_tokenColumns(v193, v31, v32, v33, v34, v35);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v196, (uint64_t)v200, 16, v37);
  if (v38)
  {
    v44 = 0;
    v190 = *(_QWORD *)v197;
    do
    {
      v192 = v38;
      for (i = 0; i != v192; ++i)
      {
        if (*(_QWORD *)v197 != v190)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * i);
        objc_msgSend_firstObject(v19, v39, v40, v41, v42, v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_indexAtPosition_(v47, v48, v44, v49, v50, v51);

        objc_msgSend_transcriptionPaths(v193, v53, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v58, v59, v60, v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v193, v65, (uint64_t)v64, v44, v66, v67);
        v194 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_count(v194, v68, v69, v70, v71, v72) == 1)
        {
          v78 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend_textTokenRows(v46, v73, v74, v75, v76, v77);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayWithArray_(v78, v80, (uint64_t)v79, v81, v82, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend_count(v84, v85, v86, v87, v88, v89) >= 2)
          {
            for (j = 1; j < objc_msgSend_count(v19, v90, v91, v92, v93, v94); ++j)
            {
              objc_msgSend_objectAtIndexedSubscript_(v19, v96, j, v98, v99, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend_indexAtPosition_(v101, v102, v44, v103, v104, v105);

              if (v106 > v52)
              {
                objc_msgSend_objectAtIndex_(v19, v90, j, v92, v93, v94);
                v107 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
                v112 = objc_msgSend_indexAtPosition_(v107, v108, v44, v109, v110, v111);
                modifyIndexPath(v107, v44, v112);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_replaceObjectAtIndex_withObject_(v19, v114, j, (uint64_t)v113, v115, v116);

              }
            }
            v121 = objc_msgSend_count(v84, v96, v97, v98, v99, v100) - 1;
            if (v121 >= 0)
            {
              do
              {
                objc_msgSend_objectAtIndex_(v84, v117, v121, v118, v119, v120);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                v128 = v122;
                if (v121 != v52 && objc_msgSend_count(v122, v123, v124, v125, v126, v127) == 1)
                {
                  objc_msgSend_firstObject(v128, v129, v130, v131, v132, v133);
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  v140 = (objc_msgSend_properties(v134, v135, v136, v137, v138, v139) & 4) == 0;

                  if (v140)
                  {
                    objc_msgSend_removeObjectAtIndex_(v84, v141, v121, v142, v143, v144);
                    v154 = objc_msgSend_count(v19, v145, v146, v147, v148, v149);
                    if (v154 - 1 >= 0)
                    {
                      do
                      {
                        objc_msgSend_objectAtIndex_(v19, v150, --v154, v151, v152, v153);
                        v155 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend_indexAtPosition_(v155, v156, v44, v157, v158, v159) == v121)
                        {
                          objc_msgSend_removeObjectAtIndex_(v19, v160, v154, v161, v162, v163);
                          objc_msgSend_removeObjectAtIndex_(v195, v164, v154, v165, v166, v167);
                        }
                        else if (objc_msgSend_indexAtPosition_(v155, v160, v44, v161, v162, v163) > (unint64_t)v121)
                        {
                          v172 = objc_msgSend_indexAtPosition_(v155, v168, v44, v169, v170, v171);
                          modifyIndexPath(v155, v44, v172 - 1);
                          v173 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_replaceObjectAtIndex_withObject_(v19, v174, v154, (uint64_t)v173, v175, v176);

                        }
                      }
                      while (v154 > 0);
                    }
                  }
                }

              }
              while (v121-- > 0);
            }
          }
          v178 = [CHMutableTokenizedResultColumn alloc];
          v183 = (void *)objc_msgSend_initWithTokenRows_(v178, v179, (uint64_t)v84, v180, v181, v182);
          objc_msgSend_addObject_(v191, v184, (uint64_t)v183, v185, v186, v187);

        }
        else
        {
          objc_msgSend_addObject_(v191, v73, (uint64_t)v46, v75, v76, v77);
        }

        ++v44;
      }
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v196, (uint64_t)v200, 16, v43);
    }
    while (v38);
  }

  return v193;
}

- (void)_adjustResultsForConfusableCharacters:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
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
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
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
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t i;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const void *RootCursor;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;

  v112 = a3;
  if (objc_msgSend_count(v112, v3, v4, v5, v6, v7))
  {
    objc_msgSend_objectAtIndexedSubscript_(v112, v8, 0, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v12, v13, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_length(v18, v19, v20, v21, v22, v23);

    if (v24)
    {
      objc_msgSend_objectAtIndexedSubscript_(v112, v25, 0, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v29, v30, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v35, v36, 0, v37, v38, v39);
      if (v44 == 1)
      {
        objc_msgSend_string(v29, (const char *)1, v40, v41, v42, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_characterAtIndex_(v45, v46, 0, v47, v48, v49);

        if (v50 != 161)
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend_string(v29, v51, v52, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v57, (uint64_t)CFSTR("%c"), v58, v59, v60, 105);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingCharactersInRange_withString_(v56, v62, 0, 1, (uint64_t)v61, v63);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        for (i = 0; i < objc_msgSend_count(v112, v64, v65, v66, v67, v68); ++i)
        {
          objc_msgSend_objectAtIndexedSubscript_(v112, v70, i, v71, v72, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v74, v75, v76, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend_compare_options_(v35, v81, (uint64_t)v80, 129, v82, v83);

          if (!v84)
          {
            if (i != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend_objectAtIndexedSubscript_(v112, v64, i, v66, v67, v68);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              RootCursor = (const void *)LXLexiconCreateRootCursor();
              objc_msgSend_string(v85, v87, v88, v89, v90, v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = (const void *)LXCursorCreateByAdvancing();

              CFRelease(RootCursor);
              if (v93)
              {
                objc_msgSend_score(v29, v94, v95, v96, v97, v98);
                objc_msgSend_setScore_(v85, v100, v101, v102, v103, v104, v99 + -0.0001);
                objc_msgSend_insertObject_atIndex_(v112, v105, (uint64_t)v85, 0, v106, v107);
                objc_msgSend_removeObjectAtIndex_(v112, v108, i + 1, v109, v110, v111);
                CFRelease(v93);
              }

            }
            break;
          }
        }
      }

      goto LABEL_14;
    }
  }
LABEL_15:

}

- (id)_tokenFromLegacyResult:(id)a3 wordIndex:(unint64_t)a4 strokeSet:(id)a5 substrokeCount:(int64_t)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
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
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int shouldUseTokenPrecedingSpaces;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  CHMutableTokenizedTextResultToken *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  void *v183;
  unsigned int v185;
  id v187;

  v9 = a3;
  v187 = a5;
  objc_msgSend_wordRanges(v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v15, v16, a4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_rangeValue(v20, v21, v22, v23, v24, v25);
  v28 = v27;

  objc_msgSend_wordIDs(v9, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v34, v35, a4, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = objc_msgSend_intValue(v39, v40, v41, v42, v43, v44);

  objc_msgSend_wordRecognitionScores(v9, v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v50, v51, a4, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v55, v56, v57, v58, v59, v60);
  v62 = v61;

  objc_msgSend_wordCombinedScores(v9, v63, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v68, v69, a4, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v73, v74, v75, v76, v77, v78);
  v80 = v79;

  if (v187)
  {
    v91 = v187;
  }
  else
  {
    objc_msgSend_wordStrokeSets(v9, v81, v82, v83, v84, v85);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v92, v93, a4, v94, v95, v96);
    v91 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_wordLexicalEntries(v9, v86, v87, v88, v89, v90);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v97, v98, a4, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend_BOOLValue(v102, v103, v104, v105, v106, v107);

  if (v108)
    v114 = 261;
  else
    v114 = 1;
  objc_msgSend_wordPatternEntries(v9, v109, v110, v111, v112, v113);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v115, v116, a4, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend_BOOLValue(v120, v121, v122, v123, v124, v125);

  if (v126)
    v132 = v114 | 8;
  else
    v132 = v114;
  objc_msgSend_inappropriateWordIndexes(v9, v127, v128, v129, v130, v131);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend_containsIndex_(v133, v134, a4, v135, v136, v137);

  shouldUseTokenPrecedingSpaces = objc_msgSend_shouldUseTokenPrecedingSpaces(self->_configuration, v139, v140, v141, v142, v143);
  v150 = v132 | 0x10;
  if (!v138)
    v150 = v132;
  if (shouldUseTokenPrecedingSpaces)
    v151 = v150 | 0x20;
  else
    v151 = v150;
  objc_msgSend_rareWordIndexes(v9, v145, v146, v147, v148, v149);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend_containsIndex_(v152, v153, a4, v154, v155, v156);

  if (v157)
    v163 = v151 | 2;
  else
    v163 = v151;
  if (objc_msgSend_isTextReplacement(v9, v158, v159, v160, v161, v162))
    v169 = 17;
  else
    v169 = 1;
  objc_msgSend_string(v9, v164, v165, v166, v167, v168);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringWithRange_(v170, v171, v26, v28, v172, v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  v175 = [CHMutableTokenizedTextResultToken alloc];
  objc_msgSend_locale(self->_configuration, v176, v177, v178, v179, v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v175, v182, (uint64_t)v174, (uint64_t)v91, v185, v163, v181, v169, v62, v62, v80, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), a6);

  return v183;
}

- (id)bestTranscriptionPathsForTokenizedResult:(id)a3 scores:(id *)a4 history:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v25[8];
  id v26;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v15 = objc_msgSend__effectiveMaxRecognitionResultCount(self, v10, v11, v12, v13, v14);
  objc_msgSend__calculateBestTranscriptionPaths_scores_fromTokenizedResult_pathCount_history_skipLMRescoring_(self, v16, (uint64_t)&v26, (uint64_t)a4, (uint64_t)v8, v15, v9, 0);
  v17 = v26;
  if (!objc_msgSend_count(v17, v18, v19, v20, v21, v22))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v23 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_FAULT, "There must be at least one valid path", v25, 2u);
    }

  }
  return v17;
}

- (void)_calculateBestTranscriptionPaths:(id *)a3 scores:(id *)a4 fromTokenizedResult:(id)a5 pathCount:(int64_t)a6 history:(id)a7 skipLMRescoring:(BOOL)a8
{
  _BOOL4 v8;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
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
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t i;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
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
  id v111;
  id v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t j;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  BOOL v155;
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
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _BOOL4 v178;
  uint64_t v179;
  _QWORD *v180;
  _QWORD *v181;
  double *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  double v188;
  uint64_t v189;
  unint64_t v190;
  double v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  id v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  double v205;
  uint64_t k;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  double v213;
  double v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  double v219;
  double v220;
  void *v221;
  id v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  id v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  id v248;
  id v249;
  id v250;
  void *v251;
  const char *v252;
  void *v253;
  const char *v254;
  double v255;
  double v256;
  id v257;
  BOOL v258;
  id v259;
  id v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  double v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  size_t v274;
  size_t v275;
  __int128 *v276;
  double v277;
  char *v278;
  void *v279;
  uint64_t v280;
  uint64_t v281;
  size_t v282;
  __int128 *v283;
  char **v284;
  char *v285;
  char **v286;
  char *v287;
  char *v288;
  int v289;
  size_t v290;
  char *v291;
  size_t v292;
  int v293;
  _BOOL4 v294;
  char **v295;
  char *v296;
  char *v297;
  size_t v298;
  size_t v299;
  char *v300;
  size_t v301;
  char *v302;
  size_t v303;
  int v304;
  _BOOL4 v305;
  char *v306;
  char *v307;
  double *v308;
  double *v309;
  unint64_t v310;
  id v311;
  id v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  char isEqual;
  double v319;
  id v320;
  void *v321;
  double *v322;
  unint64_t v323;
  id v324;
  char *v325;
  char **v326;
  char **v327;
  size_t v328;
  uint8_t *v329;
  char *v330;
  char *v331;
  char *v332;
  int v333;
  size_t v334;
  char *v335;
  size_t v336;
  int v337;
  _BOOL4 v338;
  int v339;
  _BOOL4 v340;
  char *v341;
  char *v342;
  uint64_t v343;
  char *v344;
  uint64_t v345;
  _BYTE *v346;
  int v347;
  uint64_t v348;
  int v349;
  uint64_t *v350;
  uint64_t v351;
  uint64_t v352;
  char *v353;
  char **v354;
  char **v355;
  char *v356;
  char *v357;
  char *v358;
  int v359;
  size_t v360;
  char *v361;
  size_t v362;
  int v363;
  _BOOL4 v364;
  int v365;
  _BOOL4 v366;
  char *v367;
  _BYTE *v368;
  id v369;
  char *v370;
  const char *v371;
  uint64_t v372;
  char *v373;
  char *v374;
  uint64_t v375;
  char *v376;
  uint64_t v377;
  _BYTE *v378;
  int v379;
  uint64_t v380;
  int v381;
  uint64_t *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  char *v386;
  uint64_t v387;
  id v388;
  unint64_t v389;
  id v390;
  uint64_t v391;
  uint64_t v392;
  id v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  char v399;
  id *v400;
  id v401;
  unint64_t v402;
  double v403;
  unint64_t v404;
  unint64_t v405;
  double *v406;
  unint64_t v407;
  double v408;
  double *v409;
  unint64_t v410;
  double v411;
  uint64_t v412;
  double *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  _QWORD *v417;
  _QWORD *v418;
  _QWORD *v419;
  _QWORD *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  double *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  id v429;
  double v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  double *v441;
  uint64_t v442;
  uint64_t v443;
  NSObject *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  id *v454;
  id *v455;
  id v456;
  int v457;
  uint64_t v458;
  void *v459;
  int64_t v460;
  unint64_t v461;
  void *v462;
  void *v463;
  _QWORD *v464;
  unint64_t v465;
  void *v466;
  unint64_t v467;
  char *v468;
  unint64_t v469;
  void *v470;
  int v471;
  uint64_t v472;
  id v473;
  _DWORD *v474;
  id v475;
  void *v476;
  char **v477;
  id v478;
  int v479;
  uint64_t v480;
  id v481;
  void *v482;
  id v483;
  CHRecognizer *v484;
  uint64_t v485;
  uint64_t v486;
  id v487[3];
  id v488[3];
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int16 v497;
  uint64_t v498;
  unint64_t v499;
  _QWORD *v500;
  unint64_t v501;
  char **v502;
  char *v503;
  uint64_t v504;
  __int16 v505;
  __int128 v506;
  double *v507;
  unint64_t v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  int64_t v518;
  uint64_t v519;
  _BYTE v520[128];
  _BYTE v521[128];
  _BYTE v522[128];
  _BYTE v523[128];
  uint8_t buf[16];
  void (*v525)(_QWORD *, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v526;
  double v527;
  id v528;
  id v529;
  __int128 *v530;
  uint64_t v531;

  v8 = a8;
  v460 = a6;
  v454 = a4;
  v455 = a3;
  v531 = *MEMORY[0x1E0C80C00];
  v473 = a5;
  v456 = a7;
  v484 = self;
  if (objc_msgSend_shouldApplyLMSorting(self->_configuration, v11, v12, v13, v14, v15))
  {
    v21 = !v8;
    if (!v484->_wordLanguageModel)
      v21 = 0;
    v457 = v21;
  }
  else
  {
    v457 = 0;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasValidColumns(v473, v27, v28, v29, v30, v31) & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v37 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_descriptionWithSensitiveInformation_(v473, v38, 0, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v42;
      _os_log_impl(&dword_1BE607000, v37, OS_LOG_TYPE_FAULT, "Unexpected tokenized result with invalid columns passed to _calculateBestTranscriptionPaths, description = %@", buf, 0xCu);

    }
  }
  if ((v457 & 1) == 0)
  {
    objc_msgSend_tokenColumns(v473, v32, v33, v34, v35, v36);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48) == 1;

    if (v49)
    {
      objc_msgSend_tokenColumns(v473, v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v55, v56, 0, v57, v58, v59);
      v485 = objc_claimAutoreleasedReturnValue();

      v515 = 0u;
      v516 = 0u;
      v513 = 0u;
      v514 = 0u;
      objc_msgSend_textTokenRows((void *)v485, v60, v61, v62, v63, v64);
      v486 = objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v486, v65, (uint64_t)&v513, (uint64_t)v523, 16, v66);
      if (v67)
      {
        v68 = 0;
        v69 = *(_QWORD *)v514;
LABEL_16:
        v70 = 0;
        while (1)
        {
          if (*(_QWORD *)v514 != v69)
            objc_enumerationMutation((id)v486);
          v71 = *(void **)(*((_QWORD *)&v513 + 1) + 8 * v70);
          v509 = 0u;
          v510 = 0u;
          v511 = 0u;
          v512 = 0u;
          v72 = v71;
          v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v509, (uint64_t)v522, 16, v74);
          if (v80)
          {
            v81 = *(_QWORD *)v510;
            v82 = 0.0;
            do
            {
              for (i = 0; i != v80; ++i)
              {
                if (*(_QWORD *)v510 != v81)
                  objc_enumerationMutation(v72);
                objc_msgSend_combinedScore(*(void **)(*((_QWORD *)&v509 + 1) + 8 * i), v75, v76, v77, v78, v79);
                v82 = v82 + v84;
              }
              v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v509, (uint64_t)v522, 16, v79);
            }
            while (v80);
          }
          else
          {
            v82 = 0.0;
          }

          objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v85, v68, v86, v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v462, v90, (uint64_t)v89, v91, v92, v93);

          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v94, v95, v96, v97, v98, v82);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v459, v100, (uint64_t)v99, v101, v102, v103);

          if (objc_msgSend_count(v462, v104, v105, v106, v107, v108) == v460)
            break;
          ++v68;
          if (++v70 == v67)
          {
            v67 = objc_msgSend_countByEnumeratingWithState_objects_count_((void *)v486, v109, (uint64_t)&v513, (uint64_t)v523, 16, v110);
            if (v67)
              goto LABEL_16;
            break;
          }
        }
      }

      goto LABEL_32;
    }
  }
  v505 = 1;
  v506 = xmmword_1BE8D52D0;
  v113 = operator new[]();
  *(_OWORD *)v113 = xmmword_1BE8D52E0;
  *(_OWORD *)(v113 + 32) = 0u;
  *(_OWORD *)(v113 + 48) = 0u;
  *(_OWORD *)(v113 + 64) = 0u;
  *(_QWORD *)(v113 + 80) = 0;
  *(_OWORD *)(v113 + 16) = 0u;
  v507 = (double *)(v113 + 16);
  v508 = 0;
  v503 = 0;
  v504 = 0;
  v477 = &v503;
  v502 = &v503;
  sub_1BE656ABC((uint64_t)&v505, 0, 0, 0.0);
  objc_msgSend__contextTokenIDsFromHistory_maxCharacterLength_maxTokenCount_(v484, v114, (uint64_t)v456, 60, 8, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v466 = v116;
  v122 = objc_msgSend_count(v116, v117, v118, v119, v120, v121);
  v453 = (uint64_t)&v453;
  v472 = v122 + 1;
  MEMORY[0x1E0C80A78](v122);
  v124 = 0;
  v474 = (_DWORD *)((char *)&v453 - ((v123 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v474 = 1;
  for (j = objc_msgSend_count(v116, v125, v126, v127, v128, v129);
        v124 < j;
        j = objc_msgSend_count(v466, v143, v144, v145, v146, v147))
  {
    objc_msgSend_objectAtIndexedSubscript_(v116, v131, v124, v133, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend_unsignedIntegerValue(v136, v137, v138, v139, v140, v141);
    v474[v124 + 1] = v142;

    ++v124;
    v116 = v466;
  }
  v461 = 0;
LABEL_41:
  objc_msgSend_tokenColumns(v473, v131, v132, v133, v134, v135);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend_count(v148, v149, v150, v151, v152, v153);
  v155 = v461 < v154;

  if (v155)
  {
    objc_msgSend_tokenColumns(v473, v156, v157, v158, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v161, v162, v461, v163, v164, v165);
    v463 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_tokenColumns(v473, v166, v167, v168, v169, v170);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend_count(v171, v172, v173, v174, v175, v176);
    v178 = v461 == v177 - 1;

    if (v178)
      v179 = v460;
    else
      v179 = 20;
    v497 = 1;
    v498 = v179;
    v499 = 0;
    is_mul_ok(v179 + 2, 0x18uLL);
    v180 = (_QWORD *)operator new[]();
    *v180 = 24;
    v180[1] = v179 + 2;
    v181 = v180 + 2;
    if (v179 != -2)
      bzero(v180 + 2, 24 * ((24 * v179 + 24) / 0x18uLL) + 24);
    v458 = 24;
    v500 = v181;
    v501 = 0;
    if (!*((_QWORD *)&v506 + 1))
    {
      v190 = 0;
      v189 = 0;
      goto LABEL_320;
    }
    v479 = v457 & v178;
    while (1)
    {
      v182 = v507;
      v481 = *((id *)v507 + 4);
      v188 = v182[5];
      v189 = v499;
      if (v499 == v498)
      {
        v190 = v501;
        if (v501)
        {
          if (v188 > *(double *)&v500[3 * v501])
            goto LABEL_319;
        }
        else
        {
          v191 = -2147483650.0;
          if (!(_BYTE)v497)
            v191 = 2147483650.0;
          if (v188 > v191)
          {
LABEL_319:

            v179 = v189;
LABEL_320:
            v505 = v497;
            *(_QWORD *)&v506 = v179;
            *((_QWORD *)&v506 + 1) = v189;
            v508 = v190;
            if (v507)
            {
              v413 = v507 - 2;
              v414 = *((_QWORD *)v507 - 1);
              if (v414)
              {
                v415 = 3 * v414;
                do
                {

                  v415 -= 3;
                }
                while (v415 * 8);
              }
              MEMORY[0x1C3B812C8](v413, 0x1080C801842DC26);
            }
            v416 = v179 + 2;
            is_mul_ok(v179 + 2, 0x18uLL);
            v417 = (_QWORD *)operator new[]();
            v418 = v417;
            *v417 = 24;
            v417[1] = v179 + 2;
            v419 = v417 + 2;
            if (v179 == -2)
            {
              v507 = (double *)(v417 + 2);
              v419 = v500;
LABEL_331:
              v420 = v419;
              if (v419)
                goto LABEL_332;
              goto LABEL_336;
            }
            bzero(v417 + 2, v458 + 24 * ((v458 + 24 * v179) / 0x18uLL));
            v507 = (double *)v419;
            v420 = v500;
            if (v419 == v500)
              goto LABEL_331;
            v421 = 0;
            do
            {
              v418[v421 + 2] = v420[v421];
              objc_storeStrong((id *)&v418[v421 + 3], (id)v420[v421 + 1]);
              v418[v421 + 4] = v420[v421 + 2];
              v421 += 3;
              --v416;
            }
            while (v416);
LABEL_332:
            v422 = *(v420 - 1);
            if (v422)
            {
              v423 = 3 * v422;
              do
              {

                v423 -= 3;
              }
              while (v423 * 8);
            }
            MEMORY[0x1C3B812C8](v420 - 2, 0x1080C801842DC26);
LABEL_336:

            ++v461;
            goto LABEL_41;
          }
        }
      }
      v495 = 0u;
      v496 = 0u;
      v493 = 0u;
      v494 = 0u;
      objc_msgSend_textTokenRows(v463, v183, v184, v185, v186, v187);
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      v482 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v476, v192, (uint64_t)&v493, (uint64_t)v521, 16, v193);
      if (!v482)
        goto LABEL_316;
      v486 = 0;
      v480 = *(_QWORD *)v494;
LABEL_58:
      v485 = 0;
      v486 = (int)v486;
LABEL_59:
      if (*(_QWORD *)v494 != v480)
        objc_enumerationMutation(v476);
      v194 = *(void **)(*((_QWORD *)&v493 + 1) + 8 * v485);
      v489 = 0u;
      v490 = 0u;
      v491 = 0u;
      v492 = 0u;
      v195 = v194;
      v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v195, v196, (uint64_t)&v489, (uint64_t)v520, 16, v197);
      if (v203)
      {
        v204 = *(_QWORD *)v490;
        v205 = 0.0;
        do
        {
          for (k = 0; k != v203; ++k)
          {
            while (1)
            {
              if (*(_QWORD *)v490 != v204)
                objc_enumerationMutation(v195);
              v207 = *(void **)(*((_QWORD *)&v489 + 1) + 8 * k);
              if ((objc_msgSend_inputSources(v207, v198, v199, v200, v201, v202) & 0x10) != 0)
                break;
              objc_msgSend_combinedScore(v207, v208, v209, v210, v211, v212);
              v205 = v205 + v213;
              if (v203 == ++k)
                goto LABEL_70;
            }
            objc_msgSend_combinedScore(v207, v208, v209, v210, v211, v212);
            v205 = v205 + v214 * 0.5;
          }
LABEL_70:
          v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v195, v198, (uint64_t)&v489, (uint64_t)v520, 16, v202);
        }
        while (v203);
      }
      else
      {
        v205 = 0.0;
      }

      v219 = v188 + v205;
      if (v499 != v498)
        goto LABEL_80;
      if (v501)
      {
        if (v219 > *(double *)&v500[3 * v501])
          goto LABEL_316;
LABEL_80:
        if (v481)
          objc_msgSend_indexPathByAddingIndex_(v481, v215, v486, v216, v217, v218);
        else
          objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v215, v486, v216, v217, v218);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = v221;
        if (!v479)
        {
          v279 = v222;
          sub_1BE656ABC((uint64_t)&v497, v222, *(uint64_t *)&v219, v219);
          goto LABEL_240;
        }
        v478 = v222;
        v483 = v222;
        v228 = v473;
        v475 = v221;
        if (v484)
        {
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v223, v224, v225, v226, v227);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v230, v231, v232, v233, v234);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v236, v237, v238, v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v517 = 0;
          *((_QWORD *)&v517 + 1) = &v517;
          v518 = 0x2020000000;
          v519 = 0;
          v247 = objc_msgSend_tokenColumnCount(v228, v242, v243, v244, v245, v246);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          v525 = sub_1BE648D18;
          v526 = &unk_1E77F25D8;
          v248 = v229;
          v527 = *(double *)&v248;
          v249 = v235;
          v528 = v249;
          v250 = v241;
          v529 = v250;
          v530 = &v517;
          v251 = v483;
          objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v228, v252, (uint64_t)v483, 0, v247, 0, 0, 0, buf);
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__calculateJointWordLMScoreForString_wordRanges_wordIDs_patternEntries_history_historyLength_(v484, v254, (uint64_t)v253, (uint64_t)v248, (uint64_t)v249, (uint64_t)v250, v474, v472);
          v256 = v255;
          v257 = objc_retainAutorelease(v253);

          _Block_object_dispose(&v517, 8);
        }
        else
        {
          v257 = 0;
          v256 = 0.0;
          v251 = v483;
        }
        v258 = v484 == 0;

        v259 = v257;
        v260 = v251;
        v266 = v260;
        if (v258)
        {
          v267 = 0.0;
        }
        else if ((unint64_t)objc_msgSend_length(v260, v261, v262, v263, v264, v265) >= 2)
        {
          v267 = 0.3;
        }
        else
        {
          v267 = 0.2;
        }

        v483 = objc_retainAutorelease(v259);
        v273 = (const char *)objc_msgSend_UTF8String(v483, v268, v269, v270, v271, v272);
        v274 = strlen(v273);
        if (v274 >= 0x7FFFFFFFFFFFFFF8)
          sub_1BE61F1B4();
        v275 = v274;
        if (v274 >= 0x17)
        {
          v280 = (v274 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v274 | 7) != 0x17)
            v280 = v274 | 7;
          v281 = v280 + 1;
          v276 = (__int128 *)operator new(v280 + 1);
          v518 = v281 | 0x8000000000000000;
          *(_QWORD *)&v517 = v276;
          *((_QWORD *)&v517 + 1) = v275;
        }
        else
        {
          HIBYTE(v518) = v274;
          v276 = &v517;
          if (!v274)
          {
            v277 = v219 - v256 * v267;
            LOBYTE(v517) = 0;
            v278 = v503;
            if (!v503)
              goto LABEL_150;
LABEL_100:
            v471 = SHIBYTE(v518);
            v469 = *((_QWORD *)&v517 + 1);
            v470 = (void *)v517;
            if (v518 >= 0)
              v282 = HIBYTE(v518);
            else
              v282 = *((_QWORD *)&v517 + 1);
            if (v518 >= 0)
              v283 = &v517;
            else
              v283 = (__int128 *)v517;
            v284 = v477;
            do
            {
              v285 = v278;
              v286 = v284;
              v288 = v278 + 32;
              v287 = (char *)*((_QWORD *)v278 + 4);
              v289 = v285[55];
              if (v289 >= 0)
                v290 = v285[55];
              else
                v290 = *((_QWORD *)v285 + 5);
              if (v289 >= 0)
                v291 = v288;
              else
                v291 = v287;
              if (v282 >= v290)
                v292 = v290;
              else
                v292 = v282;
              v293 = memcmp(v291, v283, v292);
              if (v293)
                v294 = v293 < 0;
              else
                v294 = v290 < v282;
              v295 = (char **)(v285 + 8);
              if (v294)
              {
                v284 = v286;
              }
              else
              {
                v295 = (char **)v285;
                v284 = (char **)v285;
              }
              v278 = *v295;
            }
            while (v278);
            if (v284 == v477)
              goto LABEL_150;
            v296 = (char *)(v286 + 4);
            if (v294)
              v297 = (char *)v286;
            else
              v297 = v285;
            if (!v294)
              v296 = v288;
            v298 = *((unsigned __int8 *)v284 + 55);
            v300 = (char *)*((_QWORD *)v297 + 4);
            v299 = *((_QWORD *)v297 + 5);
            if ((v298 & 0x80u) == 0)
              v301 = v298;
            else
              v301 = v299;
            if ((v298 & 0x80u) == 0)
              v302 = v296;
            else
              v302 = v300;
            if (v301 >= v282)
              v303 = v282;
            else
              v303 = v301;
            v304 = memcmp(v283, v302, v303);
            v305 = v282 >= v301;
            if (v304)
              v305 = v304 >= 0;
            if (!v305)
            {
LABEL_150:
              v311 = v266;
              if (sub_1BE656ABC((uint64_t)&v497, v311, *(uint64_t *)&v277, v277))
              {
                if (SHIBYTE(v518) < 0)
                {
                  sub_1BE61F128(buf, (void *)v517, *((unint64_t *)&v517 + 1));
                }
                else
                {
                  *(_OWORD *)buf = v517;
                  v525 = (void (*)(_QWORD *, void *, uint64_t, uint64_t, uint64_t, uint64_t))v518;
                }
                v324 = v311;
                v526 = v324;
                v527 = v277;
                v325 = v503;
                v326 = v477;
                v327 = v477;
                if (v503)
                {
                  v328 = SHIBYTE(v525) >= 0 ? HIBYTE(v525) : *(_QWORD *)&buf[8];
                  v329 = SHIBYTE(v525) >= 0 ? buf : *(uint8_t **)buf;
                  while (1)
                  {
                    while (1)
                    {
                      v326 = (char **)v325;
                      v332 = (char *)*((_QWORD *)v325 + 4);
                      v330 = v325 + 32;
                      v331 = v332;
                      v333 = v330[23];
                      if (v333 >= 0)
                        v334 = v330[23];
                      else
                        v334 = *((_QWORD *)v330 + 1);
                      if (v333 >= 0)
                        v335 = v330;
                      else
                        v335 = v331;
                      if (v334 >= v328)
                        v336 = v328;
                      else
                        v336 = v334;
                      v337 = memcmp(v329, v335, v336);
                      v338 = v328 < v334;
                      if (v337)
                        v338 = v337 < 0;
                      if (!v338)
                        break;
                      v325 = *v326;
                      v327 = v326;
                      if (!*v326)
                        goto LABEL_189;
                    }
                    v339 = memcmp(v335, v329, v336);
                    v340 = v334 < v328;
                    if (v339)
                      v340 = v339 < 0;
                    if (!v340)
                      break;
                    v325 = v326[1];
                    if (!v325)
                    {
                      v327 = v326 + 1;
                      goto LABEL_189;
                    }
                  }
                }
                else
                {
LABEL_189:
                  v341 = (char *)operator new(0x48uLL);
                  *((_OWORD *)v341 + 2) = *(_OWORD *)buf;
                  *((_QWORD *)v341 + 6) = v525;
                  v525 = 0;
                  memset(buf, 0, sizeof(buf));
                  *((_QWORD *)v341 + 7) = v324;
                  *((double *)v341 + 8) = v277;
                  *(_QWORD *)v341 = 0;
                  *((_QWORD *)v341 + 1) = 0;
                  *((_QWORD *)v341 + 2) = v326;
                  *v327 = v341;
                  if (*v502)
                  {
                    v502 = (char **)*v502;
                    v341 = *v327;
                  }
                  v342 = v503;
                  v341[24] = v341 == v503;
                  if (v341 != v342)
                  {
                    do
                    {
                      v343 = *((_QWORD *)v341 + 2);
                      if (*(_BYTE *)(v343 + 24))
                        break;
                      v344 = *(char **)(v343 + 16);
                      v345 = *(_QWORD *)v344;
                      if (*(_QWORD *)v344 == v343)
                      {
                        v348 = *((_QWORD *)v344 + 1);
                        if (!v348 || (v349 = *(unsigned __int8 *)(v348 + 24), v346 = (_BYTE *)(v348 + 24), v349))
                        {
                          if (*(char **)v343 == v341)
                          {
                            *(_BYTE *)(v343 + 24) = 1;
                            v344[24] = 0;
                            v352 = *(_QWORD *)(v343 + 8);
                            *(_QWORD *)v344 = v352;
                            if (v352)
                              goto LABEL_205;
                          }
                          else
                          {
                            v350 = *(uint64_t **)(v343 + 8);
                            v351 = *v350;
                            *(_QWORD *)(v343 + 8) = *v350;
                            if (v351)
                            {
                              *(_QWORD *)(v351 + 16) = v343;
                              v344 = *(char **)(v343 + 16);
                            }
                            v350[2] = (uint64_t)v344;
                            *(_QWORD *)(*(_QWORD *)(v343 + 16) + 8 * (**(_QWORD **)(v343 + 16) != v343)) = v350;
                            *v350 = v343;
                            *(_QWORD *)(v343 + 16) = v350;
                            v344 = (char *)v350[2];
                            v343 = *(_QWORD *)v344;
                            *((_BYTE *)v350 + 24) = 1;
                            v344[24] = 0;
                            v352 = *(_QWORD *)(v343 + 8);
                            *(_QWORD *)v344 = v352;
                            if (v352)
LABEL_205:
                              *(_QWORD *)(v352 + 16) = v344;
                          }
                          *(_QWORD *)(v343 + 16) = *((_QWORD *)v344 + 2);
                          *(_QWORD *)(*((_QWORD *)v344 + 2) + 8 * (**((_QWORD **)v344 + 2) != (_QWORD)v344)) = v343;
                          *(_QWORD *)(v343 + 8) = v344;
LABEL_234:
                          *((_QWORD *)v344 + 2) = v343;
                          break;
                        }
                      }
                      else if (!v345 || (v347 = *(unsigned __int8 *)(v345 + 24), v346 = (_BYTE *)(v345 + 24), v347))
                      {
                        if (*(char **)v343 == v341)
                        {
                          v385 = *((_QWORD *)v341 + 1);
                          *(_QWORD *)v343 = v385;
                          if (v385)
                          {
                            *(_QWORD *)(v385 + 16) = v343;
                            v344 = *(char **)(v343 + 16);
                          }
                          *((_QWORD *)v341 + 2) = v344;
                          *(_QWORD *)(*(_QWORD *)(v343 + 16) + 8 * (**(_QWORD **)(v343 + 16) != v343)) = v341;
                          *((_QWORD *)v341 + 1) = v343;
                          *(_QWORD *)(v343 + 16) = v341;
                          v344 = (char *)*((_QWORD *)v341 + 2);
                          v341[24] = 1;
                          v344[24] = 0;
                          v343 = *((_QWORD *)v344 + 1);
                          v370 = *(char **)v343;
                          *((_QWORD *)v344 + 1) = *(_QWORD *)v343;
                          if (v370)
LABEL_232:
                            *((_QWORD *)v370 + 2) = v344;
                        }
                        else
                        {
                          *(_BYTE *)(v343 + 24) = 1;
                          v344[24] = 0;
                          v343 = *((_QWORD *)v344 + 1);
                          v370 = *(char **)v343;
                          *((_QWORD *)v344 + 1) = *(_QWORD *)v343;
                          if (v370)
                            goto LABEL_232;
                        }
                        *(_QWORD *)(v343 + 16) = *((_QWORD *)v344 + 2);
                        *(_QWORD *)(*((_QWORD *)v344 + 2) + 8 * (**((_QWORD **)v344 + 2) != (_QWORD)v344)) = v343;
                        *(_QWORD *)v343 = v344;
                        goto LABEL_234;
                      }
                      *(_BYTE *)(v343 + 24) = 1;
                      v341 = v344;
                      v344[24] = v344 == v342;
                      *v346 = 1;
                    }
                    while (v344 != v342);
                  }
                  ++v504;
                  v324 = v526;
                }

                if (SHIBYTE(v525) < 0)
                {
                  operator delete(*(void **)buf);
                  if (SHIBYTE(v518) < 0)
                    goto LABEL_238;
                  goto LABEL_239;
                }
              }
LABEL_237:
              if (SHIBYTE(v518) < 0)
                goto LABEL_238;
              goto LABEL_239;
            }
            if (v294)
              v306 = (char *)v286;
            else
              v306 = v285;
            if (*((double *)v306 + 8) <= v277)
              goto LABEL_237;
            if (v294)
              v307 = (char *)v286;
            else
              v307 = v285;
            v467 = v499;
            v468 = v307;
            v465 = v499 - 1;
            if (v499 - 1 > 0xFFFFFFFFFFFFFFFDLL)
            {
LABEL_207:
              sub_1BE656ABC((uint64_t)&v497, v266, *(uint64_t *)&v277, v277);
              goto LABEL_208;
            }
            v464 = v500;
            v308 = (double *)(v500 + 5);
            v309 = (double *)(v500 + 5);
            v310 = v467;
            while (1)
            {
              if (*(v309 - 2) == *((double *)v306 + 8))
              {
                v312 = *((id *)v309 - 1);
                v317 = v312;
                if (*v309 == *((double *)v306 + 8))
                {
                  isEqual = objc_msgSend_isEqual_(v312, v313, *((_QWORD *)v468 + 7), v314, v315, v316, *v309);

                  if ((isEqual & 1) != 0)
                  {
                    v319 = *((double *)v306 + 8);
                    v320 = v266;
                    v321 = v320;
                    if (v467)
                    {
                      v322 = v308;
                      v323 = 1;
                      while (*(v322 - 2) != v319)
                      {
                        ++v323;
                        v322 += 3;
                        if (v323 > v467)
                          goto LABEL_285;
                      }
                      objc_storeStrong((id *)v322 - 1, v475);
                      *v322 = v277;
LABEL_285:

                      v390 = v321;
                      v391 = 0;
                      if (v467 <= 1)
                        v392 = 1;
                      else
                        v392 = v467;
                      while (1)
                      {
                        v393 = *((id *)v308 - 1);
                        v398 = v393;
                        if (*v308 == v277)
                        {
                          v399 = objc_msgSend_isEqual_(v393, v394, (uint64_t)v390, v395, v396, v397, *v308);

                          if ((v399 & 1) != 0)
                          {
                            v389 = v391 + 1;
                            goto LABEL_293;
                          }
                        }
                        else
                        {

                        }
                        ++v391;
                        v308 += 3;
                        if (v392 == v391)
                          goto LABEL_283;
                      }
                    }

                    v388 = v321;
LABEL_283:
                    v389 = -1;
LABEL_293:
                    v400 = (id *)&v464[3 * v389];
                    *(double *)v400 = v277;
                    objc_storeStrong(v400 + 1, v475);
                    v401 = v321;
                    *((double *)v400 + 2) = v277;

                    sub_1BE67161C((uint64_t)&v497, v389);
                    v402 = v465;
                    v403 = *(double *)&v464[3 * v501];
                    if ((_BYTE)v497)
                    {
                      v404 = v467;
                      if (v403 >= v277)
                        goto LABEL_312;
                    }
                    else
                    {
                      v404 = v467;
                      if (v403 <= v277)
                        goto LABEL_312;
                    }
                    v501 = v404;
                    if (v404)
                    {
                      v405 = v404 >> 1;
                      if (v465 > v404 >> 1)
                      {
                        if ((_BYTE)v497)
                        {
                          v406 = (double *)&v464[3 * v404 - 3];
                          v407 = v404;
                          do
                          {
                            v408 = *v406;
                            v406 -= 3;
                            if (v408 > *(double *)&v464[3 * v407])
                            {
                              v404 = v402;
                              v407 = v402;
                            }
                            --v402;
                          }
                          while (v402 > v405);
                        }
                        else
                        {
                          v409 = (double *)&v464[3 * v404 - 3];
                          v410 = v404;
                          do
                          {
                            v411 = *v409;
                            v409 -= 3;
                            if (v411 < *(double *)&v464[3 * v410])
                            {
                              v404 = v402;
                              v410 = v402;
                            }
                            --v402;
                          }
                          while (v402 > v405);
                        }
                        v501 = v404;
                      }
                    }
LABEL_312:

LABEL_208:
                    v353 = v503;
                    v354 = v477;
LABEL_210:
                    v355 = v354;
                    if (v353)
                    {
                      while (1)
                      {
                        v354 = (char **)v353;
                        v358 = (char *)*((_QWORD *)v353 + 4);
                        v356 = v353 + 32;
                        v357 = v358;
                        v359 = v356[23];
                        if (v359 >= 0)
                          v360 = v356[23];
                        else
                          v360 = *((_QWORD *)v356 + 1);
                        if (v359 >= 0)
                          v361 = v356;
                        else
                          v361 = v357;
                        if (v360 >= v282)
                          v362 = v282;
                        else
                          v362 = v360;
                        v363 = memcmp(v283, v361, v362);
                        v364 = v282 < v360;
                        if (v363)
                          v364 = v363 < 0;
                        if (v364)
                        {
                          v353 = *v354;
                          goto LABEL_210;
                        }
                        v365 = memcmp(v361, v283, v362);
                        v366 = v360 < v282;
                        if (v365)
                          v366 = v365 < 0;
                        if (!v366)
                          break;
                        v353 = v354[1];
                        if (!v353)
                        {
                          v355 = v354 + 1;
                          goto LABEL_228;
                        }
                      }
                      v367 = (char *)v354;
                      v369 = v475;
                    }
                    else
                    {
LABEL_228:
                      v367 = (char *)operator new(0x48uLL);
                      v368 = v367 + 32;
                      if (v471 < 0)
                      {
                        sub_1BE61F128(v368, v470, v469);
                      }
                      else
                      {
                        *(_OWORD *)v368 = v517;
                        *((_QWORD *)v367 + 6) = v518;
                      }
                      v369 = v475;
                      *((_QWORD *)v367 + 7) = 0;
                      *((_QWORD *)v367 + 8) = 0;
                      *(_QWORD *)v367 = 0;
                      *((_QWORD *)v367 + 1) = 0;
                      *((_QWORD *)v367 + 2) = v354;
                      *v355 = v367;
                      v373 = v367;
                      if (*v502)
                      {
                        v502 = (char **)*v502;
                        v373 = *v355;
                      }
                      v374 = v503;
                      v373[24] = v373 == v503;
                      if (v373 != v374)
                      {
                        do
                        {
                          v375 = *((_QWORD *)v373 + 2);
                          if (*(_BYTE *)(v375 + 24))
                            break;
                          v376 = *(char **)(v375 + 16);
                          v377 = *(_QWORD *)v376;
                          if (*(_QWORD *)v376 == v375)
                          {
                            v380 = *((_QWORD *)v376 + 1);
                            if (!v380 || (v381 = *(unsigned __int8 *)(v380 + 24), v378 = (_BYTE *)(v380 + 24), v381))
                            {
                              if (*(char **)v375 == v373)
                              {
                                *(_BYTE *)(v375 + 24) = 1;
                                v376[24] = 0;
                                v384 = *(_QWORD *)(v375 + 8);
                                *(_QWORD *)v376 = v384;
                                if (v384)
                                  goto LABEL_261;
                              }
                              else
                              {
                                v382 = *(uint64_t **)(v375 + 8);
                                v383 = *v382;
                                *(_QWORD *)(v375 + 8) = *v382;
                                if (v383)
                                {
                                  *(_QWORD *)(v383 + 16) = v375;
                                  v376 = *(char **)(v375 + 16);
                                }
                                v382[2] = (uint64_t)v376;
                                *(_QWORD *)(*(_QWORD *)(v375 + 16) + 8 * (**(_QWORD **)(v375 + 16) != v375)) = v382;
                                *v382 = v375;
                                *(_QWORD *)(v375 + 16) = v382;
                                v376 = (char *)v382[2];
                                v375 = *(_QWORD *)v376;
                                *((_BYTE *)v382 + 24) = 1;
                                v376[24] = 0;
                                v384 = *(_QWORD *)(v375 + 8);
                                *(_QWORD *)v376 = v384;
                                if (v384)
LABEL_261:
                                  *(_QWORD *)(v384 + 16) = v376;
                              }
                              *(_QWORD *)(v375 + 16) = *((_QWORD *)v376 + 2);
                              *(_QWORD *)(*((_QWORD *)v376 + 2) + 8 * (**((_QWORD **)v376 + 2) != (_QWORD)v376)) = v375;
                              *(_QWORD *)(v375 + 8) = v376;
LABEL_272:
                              *((_QWORD *)v376 + 2) = v375;
                              break;
                            }
                          }
                          else if (!v377 || (v379 = *(unsigned __int8 *)(v377 + 24), v378 = (_BYTE *)(v377 + 24), v379))
                          {
                            if (*(char **)v375 == v373)
                            {
                              v387 = *((_QWORD *)v373 + 1);
                              *(_QWORD *)v375 = v387;
                              if (v387)
                              {
                                *(_QWORD *)(v387 + 16) = v375;
                                v376 = *(char **)(v375 + 16);
                              }
                              *((_QWORD *)v373 + 2) = v376;
                              *(_QWORD *)(*(_QWORD *)(v375 + 16) + 8 * (**(_QWORD **)(v375 + 16) != v375)) = v373;
                              *((_QWORD *)v373 + 1) = v375;
                              *(_QWORD *)(v375 + 16) = v373;
                              v376 = (char *)*((_QWORD *)v373 + 2);
                              v373[24] = 1;
                              v376[24] = 0;
                              v375 = *((_QWORD *)v376 + 1);
                              v386 = *(char **)v375;
                              *((_QWORD *)v376 + 1) = *(_QWORD *)v375;
                              if (v386)
LABEL_270:
                                *((_QWORD *)v386 + 2) = v376;
                            }
                            else
                            {
                              *(_BYTE *)(v375 + 24) = 1;
                              v376[24] = 0;
                              v375 = *((_QWORD *)v376 + 1);
                              v386 = *(char **)v375;
                              *((_QWORD *)v376 + 1) = *(_QWORD *)v375;
                              if (v386)
                                goto LABEL_270;
                            }
                            *(_QWORD *)(v375 + 16) = *((_QWORD *)v376 + 2);
                            *(_QWORD *)(*((_QWORD *)v376 + 2) + 8 * (**((_QWORD **)v376 + 2) != (_QWORD)v376)) = v375;
                            *(_QWORD *)v375 = v376;
                            goto LABEL_272;
                          }
                          *(_BYTE *)(v375 + 24) = 1;
                          v373 = v376;
                          v376[24] = v376 == v374;
                          *v378 = 1;
                        }
                        while (v376 != v374);
                      }
                      ++v504;
                    }
                    objc_storeStrong((id *)v367 + 7, v369);
                    *((double *)v367 + 8) = v277;
                    if (SHIBYTE(v518) < 0)
LABEL_238:
                      operator delete((void *)v517);
LABEL_239:

                    v279 = v478;
LABEL_240:

                    ++v485;
                    ++v486;
                    if ((void *)v485 == v482)
                    {
                      v412 = objc_msgSend_countByEnumeratingWithState_objects_count_(v476, v371, (uint64_t)&v493, (uint64_t)v521, 16, v372);
                      v482 = (void *)v412;
                      if (!v412)
                        goto LABEL_316;
                      goto LABEL_58;
                    }
                    goto LABEL_59;
                  }
                }
                else
                {

                }
              }
              v309 += 3;
              if (!--v310)
                goto LABEL_207;
            }
          }
        }
        memmove(v276, v273, v275);
        v277 = v219 - v256 * v267;
        *((_BYTE *)v276 + v275) = 0;
        v278 = v503;
        if (!v503)
          goto LABEL_150;
        goto LABEL_100;
      }
      v220 = -2147483650.0;
      if (!(_BYTE)v497)
        v220 = 2147483650.0;
      if (v219 <= v220)
        goto LABEL_80;
LABEL_316:

      sub_1BE671744((uint64_t)v488, (uint64_t)&v505);
      if (!*((_QWORD *)&v506 + 1))
      {
        v179 = v498;
        v189 = v499;
        v190 = v501;
        goto LABEL_320;
      }
    }
  }
  if (!*((_QWORD *)&v506 + 1))
  {
LABEL_340:

    sub_1BE6715BC(v503);
    if (v507)
    {
      v441 = v507 - 2;
      v442 = *((_QWORD *)v507 - 1);
      if (v442)
      {
        v443 = 3 * v442;
        do
        {

          v443 -= 3;
        }
        while (v443 * 8);
      }
      MEMORY[0x1C3B812C8](v441, 0x1080C801842DC26);
    }
LABEL_32:
    if (v455)
    {
      v111 = objc_retainAutorelease(v462);
      *v455 = v111;
    }
    if (v454)
    {
      v112 = objc_retainAutorelease(v459);
      *v454 = v112;
    }
    goto LABEL_36;
  }
  while (1)
  {
    v424 = v507;
    v429 = *((id *)v507 + 4);
    if (!v429)
      break;
    v430 = v424[5];
    objc_msgSend_addObject_(v462, v425, (uint64_t)v429, v426, v427, v428);
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v431, v432, v433, v434, v435, v430);
    v436 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v459, v437, (uint64_t)v436, v438, v439, v440);

    sub_1BE671744((uint64_t)v487, (uint64_t)&v505);
    if (!*((_QWORD *)&v506 + 1))
      goto LABEL_340;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v444 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v444, OS_LOG_TYPE_ERROR))
  {
    v450 = objc_msgSend_tokenColumnCount(v473, v445, v446, v447, v448, v449);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v450;
    _os_log_impl(&dword_1BE607000, v444, OS_LOG_TYPE_ERROR, "Incorrect nil best path obtained in _calculateBestTranscriptionPaths for result with %ld columns.", buf, 0xCu);
  }

  sub_1BE6715BC(v503);
  v451 = *((_QWORD *)v424 - 1);
  if (v451)
  {
    v452 = 3 * v451;
    do
    {

      v452 -= 3;
    }
    while (v452 * 8);
  }
  MEMORY[0x1C3B812C8](v424 - 2, 0x1080C801842DC26);
LABEL_36:

}

- (id)_contextTokenIDsFromHistory:(id)a3 maxCharacterLength:(unint64_t)a4 maxTokenCount:(unint64_t)a5
{
  id v8;
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
  unint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
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
  id v55;
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
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v72;

  v8 = a3;
  v14 = v8;
  if (v8)
  {
    v19 = objc_msgSend_length(v8, v9, v10, v11, v12, v13);
    if (v19 <= a4)
    {
      objc_msgSend_substringWithRange_(v14, v15, 0, v19, v17, v18);
    }
    else
    {
      v20 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v14, v15, v19 - a4, v16, v17, v18);
      objc_msgSend_substringWithRange_(v14, v21, v20, v19 - v20, v22, v23);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0C99D20];
    v27 = (void *)MEMORY[0x1E0CB3B18];
    v33 = objc_msgSend_length(v25, v28, v29, v30, v31, v32);
    objc_msgSend_valueWithRange_(v27, v34, 0, v33, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObject_(v26, v38, (uint64_t)v37, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v44, 0, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObject_(v43, v49, (uint64_t)v48, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = 0;
    v55 = (id)objc_msgSend__tokensUsingLMTokenizerForString_wordRanges_nonWordPatterns_outTokenIDs_(self, v54, (uint64_t)v25, (uint64_t)v42, (uint64_t)v53, (uint64_t)&v72);
    v24 = v72;
    if (objc_msgSend_count(v24, v56, v57, v58, v59, v60) > a5)
    {
      v66 = objc_msgSend_count(v24, v61, v62, v63, v64, v65);
      objc_msgSend_subarrayWithRange_(v24, v67, v66 - a5, a5, v68, v69);
      v70 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v70;
    }

  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (id)_tokenizedTextResultFromResults:(id)a3 segmentGroup:(id)a4 offsetSegment:(int64_t)a5 decodedStrokeSets:(BOOL)a6 spaceBehavior:(int64_t)a7
{
  id v10;
  unint64_t v11;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t i;
  const char *v29;
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
  void *v44;
  unint64_t j;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t k;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
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
  uint64_t v162;
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
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  CHMutableTokenizedTextResult *v187;
  void *v189;
  CHMutableTokenizedResultColumn *v190;
  void *v191;
  void *v192;
  id v193;
  _QWORD v194[2];

  v194[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v193 = a4;
  v187 = objc_alloc_init(CHMutableTokenizedTextResult);
  v190 = objc_alloc_init(CHMutableTokenizedResultColumn);
  v11 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15, v16);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v18, v19, v20, v21);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v189 = v10;
  for (i = objc_msgSend_count(v10, v23, v24, v25, v26, v27);
        v22 < i;
        i = objc_msgSend_count(v189, v173, v174, v175, v176, v177))
  {
    objc_msgSend_objectAtIndex_(v10, v29, v22, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v11 + 3560), v34, v35, v36, v37, v38);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      for (j = 0; ; ++j)
      {
        objc_msgSend_wordRanges(v33, v39, v40, v41, v42, v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51);

        if (j >= v52)
          break;
        v58 = objc_msgSend_totalSegmentCount(v193, v53, v54, v55, v56, v57);
        objc_msgSend__tokenFromLegacyResult_wordIndex_strokeSet_substrokeCount_(self, v59, (uint64_t)v33, j, 0, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend_properties(v60, v61, v62, v63, v64, v65);
        v76 = objc_msgSend_inputSources(v60, v67, v68, v69, v70, v71);
        v77 = v66 & 0xFFFFFFFFFFFFFFDFLL;
        if (a7 != 1)
          v77 = v66;
        if (a7 == 2)
          objc_msgSend_setProperties_(v60, v72, v66 | 0x20, v73, v74, v75);
        else
          objc_msgSend_setProperties_(v60, v72, v77, v73, v74, v75);
        if (v22)
          objc_msgSend_setInputSources_(v60, v78, v76, v79, v80, v81);
        else
          objc_msgSend_setInputSources_(v60, v78, v76 | 4, v79, v80, v81);
        objc_msgSend_addObject_(v44, v82, (uint64_t)v60, v83, v84, v85);

      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        objc_msgSend_wordRanges(v33, v39, v40, v41, v42, v43);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend_count(v87, v88, v89, v90, v91, v92);

        if (k >= v93)
          break;
        objc_msgSend_wordStrokeSets(v33, v53, v94, v55, v56, v57);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v95, v96, k, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_wordStrokeSets(v33, v101, v102, v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v106, v107, k, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend_count(v111, v112, v113, v114, v115, v116);

        objc_msgSend__tokenFromLegacyResult_wordIndex_strokeSet_substrokeCount_(self, v118, (uint64_t)v33, k, (uint64_t)v100, v117);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend_properties(v119, v120, v121, v122, v123, v124);
        v131 = objc_msgSend_inputSources(v119, v126, v127, v128, v129, v130);
        v136 = v125 | 0x20;
        if (a7 != 2)
          v136 = v125;
        if (a7 == 1)
          v137 = v125 & 0xFFFFFFFFFFFFFFDFLL;
        else
          v137 = v136;
        v138 = v131;
        objc_msgSend_setProperties_(v119, v132, v137, v133, v134, v135);
        if (v22)
          objc_msgSend_setInputSources_(v119, v139, v138, v140, v141, v142);
        else
          objc_msgSend_setInputSources_(v119, v139, v138 | 4, v140, v141, v142);
        objc_msgSend_addObject_(v44, v143, (uint64_t)v119, v144, v145, v146);

      }
    }
    v147 = objc_msgSend_addTokenRowWithTokens_(v190, v53, (uint64_t)v44, v55, v56, v57);
    objc_msgSend_indexPathWithIndex_(MEMORY[0x1E0CB36B0], v148, v147, v149, v150, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v191, v153, (uint64_t)v152, v154, v155, v156);

    v157 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_score(v33, v158, v159, v160, v161, v162);
    objc_msgSend_numberWithDouble_(v157, v163, v164, v165, v166, v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v192, v169, (uint64_t)v168, v170, v171, v172);

    ++v22;
    v10 = v189;
    v11 = 0x1E0C99000;
  }
  v194[0] = v190;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v194, 1, v31, v32);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTokenColumns_(v187, v179, (uint64_t)v178, v180, v181, v182);

  objc_msgSend_setTranscriptionPaths_scores_(v187, v183, (uint64_t)v191, (uint64_t)v192, v184, v185);
  return v187;
}

- (id)_resultUsingNextGenerationPipelineWithDrawing:(id)a3 options:(id)a4
{
  uint64_t v4;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  unint64_t i;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  _BYTE *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  _OWORD *v85;
  char *v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  char *v116;
  int64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  int64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  NSObject *v140;
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
  NSObject *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  NSObject *v166;
  os_signpost_id_t v167;
  NSObject *v168;
  NSObject *v169;
  unint64_t v170;
  NSObject *v171;
  id v172;
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
  double v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  CHRecognizer *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  double v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  CHCTCRecognitionModel *v209;
  const char *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  _QWORD *v221;
  unint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  char *v234;
  uint64_t *v235;
  unint64_t v236;
  const char *v237;
  NSObject *v238;
  NSObject *v239;
  NSObject *v240;
  NSObject *v241;
  NSObject *v242;
  NSObject *v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  NSString *v259;
  int v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  id v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  id v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  NSObject *v318;
  id v319;
  void *v320;
  CFTypeRef v321;
  void *v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  NSObject *v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  CHRecognizerConfiguration *configuration;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  id v376;
  const char *v377;
  _BOOL8 v378;
  uint64_t shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths;
  const char *v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  void *active;
  id v385;
  const char *v386;
  uint64_t v387;
  void *v388;
  NSObject *v389;
  void **v390;
  void **v391;
  void *v392;
  void **v393;
  void *v394;
  char *v395;
  char *v396;
  char *v397;
  char *v398;
  void *v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  int v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  void *v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  int isEqualToString;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  void *v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  id v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  void *v440;
  id v441;
  void *v442;
  const char *v443;
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
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  BOOL v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  const char *v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  BOOL v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  NSObject *v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  void *v527;
  const char *v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  const char *v534;
  uint64_t v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  char v552;
  void *v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  BOOL v559;
  const char *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  const char *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  void *v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  double v581;
  double v582;
  const char *v583;
  uint64_t v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  void *v588;
  const char *v589;
  uint64_t v590;
  uint64_t v591;
  void *v592;
  const char *v593;
  uint64_t v594;
  uint64_t v595;
  const char *v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  void *v601;
  const char *v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  const char *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  const char *v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  const char *v618;
  NSObject *v619;
  const char *v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  unint64_t v625;
  uint64_t *v626;
  uint64_t v627;
  const char *v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  uint64_t v632;
  const char *v633;
  uint64_t v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  const char *v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t Index;
  const char *v644;
  uint64_t v645;
  uint64_t v646;
  uint64_t v647;
  NSObject *v648;
  const char *v649;
  uint64_t v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  id v659;
  const char *v660;
  uint64_t v661;
  uint64_t v662;
  uint64_t v663;
  uint64_t v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  const char *v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t v675;
  unint64_t v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  uint64_t v680;
  const char *v681;
  uint64_t v682;
  uint64_t v683;
  uint64_t v684;
  uint64_t v685;
  const char *v686;
  uint64_t v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t staticLexicon;
  uint64_t v691;
  const char *v692;
  uint64_t v693;
  uint64_t customLexicon;
  void *v695;
  const char *v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t v699;
  char v700;
  const char *v701;
  uint64_t v702;
  uint64_t v703;
  uint64_t v704;
  uint64_t v705;
  const char *v706;
  uint64_t v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  const char *v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  void *v716;
  void *v717;
  const char *v718;
  uint64_t v719;
  uint64_t v720;
  uint64_t v721;
  double v722;
  CGFloat v723;
  double v724;
  CGFloat v725;
  double v726;
  CGFloat v727;
  double v728;
  CGFloat v729;
  const char *v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  uint64_t v734;
  void *v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  uint64_t v740;
  void *v741;
  const char *v742;
  uint64_t v743;
  uint64_t v744;
  uint64_t v745;
  uint64_t v746;
  const char *v747;
  uint64_t v748;
  uint64_t v749;
  void *v750;
  const char *v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  const char *v757;
  uint64_t v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  uint64_t v762;
  const char *v763;
  uint64_t v764;
  uint64_t v765;
  const char *v766;
  uint64_t v767;
  uint64_t v768;
  int isInappropriateString;
  uint64_t v770;
  void *v771;
  const char *v772;
  uint64_t v773;
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  void *v777;
  const char *v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  NSString *v783;
  const char *v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  NSString *v789;
  const char *v790;
  uint64_t v791;
  unint64_t v792;
  void *v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  uint64_t v797;
  uint64_t v798;
  void *v799;
  void *v800;
  const char *v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  double v805;
  double v806;
  double v807;
  double v808;
  double v809;
  double v810;
  double v811;
  double v812;
  CHTokenizedTextResultToken *v813;
  const char *v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  uint64_t v818;
  void *v819;
  const char *v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  double v825;
  double v826;
  const char *v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  void *v832;
  const char *v833;
  uint64_t v834;
  uint64_t v835;
  uint64_t v836;
  uint64_t v837;
  uint64_t v838;
  const char *v839;
  void *v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  uint64_t v844;
  const char *v845;
  uint64_t v846;
  uint64_t v847;
  uint64_t v848;
  uint64_t v849;
  void *v850;
  const char *v851;
  uint64_t v852;
  uint64_t v853;
  uint64_t v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  uint64_t v858;
  void *v859;
  const char *v860;
  uint64_t v861;
  uint64_t v862;
  uint64_t v863;
  uint64_t v864;
  const char *v865;
  uint64_t v866;
  uint64_t v867;
  uint64_t v868;
  uint64_t v869;
  void *v870;
  const char *v871;
  uint64_t v872;
  uint64_t v873;
  uint64_t v874;
  const char *v875;
  uint64_t v876;
  uint64_t v877;
  uint64_t v878;
  uint64_t v879;
  CHTokenizedTextResult *v880;
  const char *v881;
  void *v882;
  NSObject *v883;
  double v884;
  id v885;
  const char *v886;
  uint64_t v887;
  uint64_t v888;
  uint64_t v889;
  uint64_t v890;
  id v891;
  uint64_t v892;
  void *v893;
  uint64_t v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  void *v898;
  CHTokenizedTextResultToken *v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  uint64_t v903;
  uint64_t v904;
  void *v905;
  const char *v906;
  uint64_t v907;
  uint64_t v908;
  uint64_t v909;
  uint64_t v910;
  uint64_t v911;
  const char *v912;
  uint64_t v913;
  uint64_t v914;
  uint64_t v915;
  uint64_t v916;
  const char *v917;
  double v918;
  double v919;
  double v920;
  double v921;
  uint64_t v922;
  NSObject *v923;
  CHTokenizedTextResultToken *v924;
  const char *v925;
  uint64_t v926;
  uint64_t v927;
  uint64_t v928;
  uint64_t v929;
  const char *v930;
  uint64_t v931;
  uint64_t v932;
  uint64_t v933;
  uint64_t v934;
  uint64_t v935;
  const char *v936;
  uint64_t v937;
  uint64_t v938;
  uint64_t v939;
  uint64_t v940;
  const char *v941;
  double v942;
  double v943;
  double v944;
  double v945;
  void *v946;
  CHTokenizedTextResult *v947;
  const char *v948;
  uint64_t v949;
  uint64_t v950;
  void *v951;
  const char *v952;
  uint64_t v953;
  uint64_t v954;
  void *v955;
  const char *v956;
  uint64_t v957;
  uint64_t v958;
  uint64_t v959;
  uint64_t v960;
  void *v961;
  const char *v962;
  uint64_t v963;
  uint64_t v964;
  void *v965;
  const char *v966;
  NSObject *v967;
  NSObject *v968;
  NSObject *v969;
  __CFString *v971;
  void *v972;
  void *v973;
  void *v974;
  id v975;
  os_signpost_id_t spid;
  uint64_t v977;
  id v978;
  void *v979;
  id v980;
  id v981;
  id v982;
  void *v983;
  void *v984;
  id obj;
  void *v986;
  void *v987;
  void *v988;
  uint64_t v989;
  uint64_t v990;
  uint64_t k;
  void *v992;
  void *v993;
  id v994;
  void *v995;
  void *v996;
  void *v997;
  CHRecognizer *v998;
  unint64_t v999;
  void *v1000;
  id v1001;
  __CFString *v1002;
  id v1003;
  void *v1004;
  id v1005;
  CFTypeRef cf;
  id v1007;
  double v1008;
  void *v1009;
  char *v1010;
  char *v1011;
  void *v1012;
  char *v1013;
  char *v1014;
  BOOL v1015;
  _BYTE v1016[12];
  _OWORD __p[2];
  _BYTE buf[32];
  __int128 v1019;
  __int128 v1020;
  uint64_t v1021;
  uint64_t v1022;
  uint8_t v1023[32];
  __int128 v1024;
  __int128 v1025;
  uint64_t v1026;
  CGRect v1027;
  CGRect v1028;

  v1026 = *MEMORY[0x1E0C80C00];
  v980 = a3;
  v981 = a4;
  v998 = self;
  if (self->_recognitionModel)
  {
    if (self->_legacyTextDecoder)
      goto LABEL_10;
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v7 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_FAULT, "The recognition model must be loaded before inference can be called on it", buf, 2u);
    }

    if (self->_legacyTextDecoder)
      goto LABEL_10;
  }
  if (!self->_textDecoder.__engaged_)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v16 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v16, OS_LOG_TYPE_FAULT, "The text decoder must be loaded before decoding can be executed", buf, 2u);
    }

    if (!self->_recognitionModel)
      goto LABEL_21;
    goto LABEL_11;
  }
LABEL_10:
  if (!self->_recognitionModel)
  {
LABEL_21:
    v17 = 0;
    goto LABEL_366;
  }
LABEL_11:
  if (!self->_legacyTextDecoder && !self->_textDecoder.__engaged_)
    goto LABEL_21;
  v1012 = 0;
  v1013 = 0;
  v1014 = 0;
  v1009 = 0;
  v1010 = 0;
  v1011 = 0;
  v8 = v981;
  v13 = v8;
  v14 = 0;
  v984 = v8;
  if (v8)
  {
    objc_msgSend_objectForKey_(v8, v9, CHRecognitionOptionInferenceCache, v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v15;
    else
      v14 = 0;

    v13 = v984;
  }

  v18 = v14;
  v1001 = v980;
  v979 = v18;
  if (!v18)
  {
    v988 = 0;
    goto LABEL_116;
  }
  objc_msgSend_recognitionEngineCachingKey(v998, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)v1023 = 0;
  objc_msgSend_retrieveActivationMatrixForDrawing_recognitionEngineCachingKey_outStrokeIndexMapping_outStrokeEndings_(v18, v25, (uint64_t)v1001, (uint64_t)v24, (uint64_t)buf, (uint64_t)v1023);
  v988 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *(id *)buf;
  v1003 = *(id *)v1023;

  if (v988 && v26)
  {
    v1013 = (char *)v1012;
    v32 = objc_msgSend_count(v26, v27, v28, v29, v30, v31);
    v38 = v32;
    if (v32 > (v1014 - (_BYTE *)v1012) >> 3)
    {
      if (v32 >> 61)
        sub_1BE61F930();
      v39 = (char *)operator new(8 * v32);
      v1012 = &v39[(v1013 - (_BYTE *)v1012) & 0xFFFFFFFFFFFFFFF8];
      v1013 = (char *)v1012;
      v1014 = &v39[8 * v38];
    }
    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend_count(v26, v33, v34, v35, v36, v37))
        goto LABEL_55;
      objc_msgSend_objectAtIndexedSubscript_(v26, v27, i, v29, v30, v31);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_integerValue(v41, v42, v43, v44, v45, v46);
      v48 = v47;
      v49 = v1013;
      if (v1013 < v1014)
      {
        *(_QWORD *)v1013 = v47;
        v50 = (uint64_t)(v49 + 8);
        goto LABEL_54;
      }
      v4 = (uint64_t)v1012;
      v51 = v1013 - (_BYTE *)v1012;
      v52 = (v1013 - (_BYTE *)v1012) >> 3;
      v53 = v52 + 1;
      if ((unint64_t)(v52 + 1) >> 61)
        sub_1BE61F930();
      v54 = v1014 - (_BYTE *)v1012;
      if ((v1014 - (_BYTE *)v1012) >> 2 > v53)
        v53 = v54 >> 2;
      v55 = (unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v53;
      if (v55)
        break;
      v56 = 0;
      v57 = (uint64_t *)(8 * v52);
      *(_QWORD *)(8 * v52) = v48;
      v50 = 8 * v52 + 8;
      v58 = &v49[-v4];
      if (v49 != (char *)v4)
        goto LABEL_46;
LABEL_52:
      v1012 = v57;
      v1013 = (char *)v50;
      v1014 = &v56[8 * v55];
      if (v4)
        operator delete((void *)v4);
LABEL_54:
      v1013 = (char *)v50;

    }
    if (v55 >> 61)
      sub_1BE61F100();
    v56 = (char *)operator new(8 * v55);
    v57 = (uint64_t *)&v56[8 * v52];
    *v57 = v48;
    v50 = (uint64_t)(v57 + 1);
    v58 = &v49[-v4];
    if (v49 == (char *)v4)
      goto LABEL_52;
LABEL_46:
    v59 = (unint64_t)(v58 - 8);
    if (v59 < 0x58)
      goto LABEL_379;
    if ((unint64_t)(v49 - v56 - v51) < 0x20)
      goto LABEL_379;
    v60 = (v59 >> 3) + 1;
    v61 = 8 * (v60 & 0x3FFFFFFFFFFFFFFCLL);
    v62 = &v49[-v61];
    v57 = (uint64_t *)((char *)v57 - v61);
    v63 = &v56[8 * v52 - 16];
    v64 = v49 - 16;
    v65 = v60 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v66 = *(_OWORD *)v64;
      *((_OWORD *)v63 - 1) = *((_OWORD *)v64 - 1);
      *(_OWORD *)v63 = v66;
      v63 -= 32;
      v64 -= 32;
      v65 -= 4;
    }
    while (v65);
    v49 = v62;
    if (v60 != (v60 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_379:
      do
      {
        v67 = *((_QWORD *)v49 - 1);
        v49 -= 8;
        *--v57 = v67;
      }
      while (v49 != (char *)v4);
    }
    goto LABEL_52;
  }
LABEL_55:
  if (v988 && v1003)
  {
    v1010 = (char *)v1009;
    objc_msgSend_activations(v988, v27, v28, v29, v30, v31);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_timestepCount(v68, v69, v70, v71, v72, v73);
    v4 = v74;
    v75 = (char *)v1009;
    if (v74 <= (v1011 - (_BYTE *)v1009) >> 3)
    {
LABEL_69:

      for (j = 0; ; ++j)
      {
        objc_msgSend_activations(v988, v90, v91, v92, v93, v94);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = j < objc_msgSend_timestepCount(v97, v98, v99, v100, v101, v102);

        if (!v103)
          goto LABEL_115;
        v108 = v1010;
        if (objc_msgSend_containsIndex_(v1003, v104, j, v105, v106, v107))
        {
          if (v1010 < v1011)
          {
            *(_QWORD *)v1010 = 1;
            v109 = (uint64_t)(v108 + 8);
LABEL_70:
            v96 = v109;
            goto LABEL_71;
          }
          v110 = (char *)v1009;
          v4 = v1010 - (_BYTE *)v1009;
          v118 = (v1010 - (_BYTE *)v1009) >> 3;
          v119 = v118 + 1;
          if ((unint64_t)(v118 + 1) >> 61)
            sub_1BE61F930();
          v120 = v1011 - (_BYTE *)v1009;
          if ((v1011 - (_BYTE *)v1009) >> 2 > v119)
            v119 = v120 >> 2;
          if ((unint64_t)v120 >= 0x7FFFFFFFFFFFFFF8)
            v114 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v114 = v119;
          if (v114)
          {
            if (v114 >> 61)
              sub_1BE61F100();
            v115 = (char *)operator new(8 * v114);
            v116 = &v115[8 * v118];
            *(_QWORD *)v116 = 1;
            v96 = (uint64_t)(v116 + 8);
            v121 = v108 - v110;
            if (v108 == v110)
              goto LABEL_113;
LABEL_107:
            v131 = v121 - 8;
            if (v131 < 0x58)
              goto LABEL_380;
            if ((unint64_t)(v108 - &v115[v4]) < 0x20)
              goto LABEL_380;
            v132 = (v131 >> 3) + 1;
            v133 = 8 * (v132 & 0x3FFFFFFFFFFFFFFCLL);
            v134 = &v108[-v133];
            v116 -= v133;
            v135 = &v115[8 * v118 - 16];
            v136 = v108 - 16;
            v137 = v132 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v138 = *(_OWORD *)v136;
              *((_OWORD *)v135 - 1) = *((_OWORD *)v136 - 1);
              *(_OWORD *)v135 = v138;
              v135 -= 32;
              v136 -= 32;
              v137 -= 4;
            }
            while (v137);
            v108 = v134;
            if (v132 != (v132 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_380:
              do
              {
                v139 = *((_QWORD *)v108 - 1);
                v108 -= 8;
                *((_QWORD *)v116 - 1) = v139;
                v116 -= 8;
              }
              while (v108 != v110);
            }
            goto LABEL_113;
          }
          v115 = 0;
          v116 = (char *)(8 * v118);
          *(_QWORD *)(8 * v118) = 1;
          v96 = 8 * v118 + 8;
          v121 = v108 - v110;
          if (v108 != v110)
            goto LABEL_107;
        }
        else
        {
          if (v1010 < v1011)
          {
            *(_QWORD *)v1010 = 0;
            v109 = (uint64_t)(v108 + 8);
            goto LABEL_70;
          }
          v110 = (char *)v1009;
          v4 = v1010 - (_BYTE *)v1009;
          v111 = (v1010 - (_BYTE *)v1009) >> 3;
          v112 = v111 + 1;
          if ((unint64_t)(v111 + 1) >> 61)
            sub_1BE61F930();
          v113 = v1011 - (_BYTE *)v1009;
          if ((v1011 - (_BYTE *)v1009) >> 2 > v112)
            v112 = v113 >> 2;
          if ((unint64_t)v113 >= 0x7FFFFFFFFFFFFFF8)
            v114 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v114 = v112;
          if (v114)
          {
            if (v114 >> 61)
              sub_1BE61F100();
            v115 = (char *)operator new(8 * v114);
            v116 = &v115[8 * v111];
            *(_QWORD *)v116 = 0;
            v96 = (uint64_t)(v116 + 8);
            v117 = v108 - v110;
            if (v108 == v110)
              goto LABEL_113;
LABEL_99:
            v122 = v117 - 8;
            if (v122 < 0x58)
              goto LABEL_381;
            if ((unint64_t)(v108 - v115 - v4) < 0x20)
              goto LABEL_381;
            v123 = (v122 >> 3) + 1;
            v124 = 8 * (v123 & 0x3FFFFFFFFFFFFFFCLL);
            v125 = &v108[-v124];
            v116 -= v124;
            v126 = &v115[8 * v111 - 16];
            v127 = v108 - 16;
            v128 = v123 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v129 = *(_OWORD *)v127;
              *((_OWORD *)v126 - 1) = *((_OWORD *)v127 - 1);
              *(_OWORD *)v126 = v129;
              v126 -= 32;
              v127 -= 32;
              v128 -= 4;
            }
            while (v128);
            v108 = v125;
            if (v123 != (v123 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_381:
              do
              {
                v130 = *((_QWORD *)v108 - 1);
                v108 -= 8;
                *((_QWORD *)v116 - 1) = v130;
                v116 -= 8;
              }
              while (v108 != v110);
            }
            goto LABEL_113;
          }
          v115 = 0;
          v116 = (char *)(8 * v111);
          *(_QWORD *)(8 * v111) = 0;
          v96 = 8 * v111 + 8;
          v117 = v108 - v110;
          if (v108 != v110)
            goto LABEL_99;
        }
LABEL_113:
        v1009 = v116;
        v1010 = (char *)v96;
        v1011 = &v115[8 * v114];
        if (v110)
          operator delete(v110);
LABEL_71:
        v1010 = (char *)v96;
      }
    }
    if (v74 >> 61)
      sub_1BE61F930();
    v76 = v1010;
    v77 = operator new(8 * v74);
    v78 = v1010 - (_BYTE *)v1009;
    v79 = &v77[(v1010 - (_BYTE *)v1009) & 0xFFFFFFFFFFFFFFF8];
    v80 = v79;
    if (v1010 != v1009)
    {
      if ((unint64_t)(v78 - 8) < 0x58)
      {
        v80 = &v77[(v1010 - (_BYTE *)v1009) & 0xFFFFFFFFFFFFFFF8];
        do
        {
LABEL_66:
          v89 = *((_QWORD *)v76 - 1);
          v76 -= 8;
          *((_QWORD *)v80 - 1) = v89;
          v80 -= 8;
        }
        while (v76 != v75);
        goto LABEL_67;
      }
      v80 = &v77[(v1010 - (_BYTE *)v1009) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(v1010 - &v77[v78 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
        goto LABEL_66;
      v81 = v78 >> 3;
      v82 = ((unint64_t)(v78 - 8) >> 3) + 1;
      v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
      v84 = &v1010[-v83];
      v80 = &v79[-v83];
      v85 = &v77[8 * v81 - 16];
      v86 = v1010 - 16;
      v87 = v82 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v88 = *(_OWORD *)v86;
        *(v85 - 1) = *((_OWORD *)v86 - 1);
        *v85 = v88;
        v85 -= 2;
        v86 -= 32;
        v87 -= 4;
      }
      while (v87);
      v76 = v84;
      if (v82 != (v82 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_66;
    }
LABEL_67:
    v1009 = v80;
    v1010 = v79;
    v1011 = &v77[8 * v4];
    if (v75)
      operator delete(v75);
    goto LABEL_69;
  }
LABEL_115:

LABEL_116:
  v1008 = 0.0;
  if (v988)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v140 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_description(v998->_configuration, v141, v142, v143, v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v1001, v147, v148, v149, v150, v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v146;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v152;
      _os_log_impl(&dword_1BE607000, v140, OS_LOG_TYPE_DEBUG, "Activation matrix retrieved from inference cache for config %@ and drawing %@.", buf, 0x16u);

    }
    v975 = 0;
    goto LABEL_168;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v153 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_description(v998->_configuration, v154, v155, v156, v157, v158);
    v159 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v1001, v160, v161, v162, v163, v164);
    v165 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v159;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v165;
    _os_log_impl(&dword_1BE607000, v153, OS_LOG_TYPE_DEBUG, "Obtaining activation matrix by model inference for config %@ and drawing %@.", buf, 0x16u);

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v166 = (id)qword_1EF568E50;
  v167 = os_signpost_id_generate(v166);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v168 = (id)qword_1EF568E50;
  v169 = v168;
  v170 = v167 - 1;
  if (v167 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v168))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v169, OS_SIGNPOST_INTERVAL_BEGIN, v167, "CHRecognizerActivationMatrix", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v171 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v171, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRecognizerActivationMatrix\", buf, 2u);
  }

  v172 = v984;
  v177 = v172;
  *(_QWORD *)buf = 0x4034000000000000;
  if (v984)
  {
    objc_msgSend_objectForKey_(v172, v173, CHRecognitionOptionMinSizeForReliableRescaling, v174, v175, v176);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_getValue_(v178, v179, (uint64_t)buf, v180, v181, v182);

    v183 = *(double *)buf;
    v184 = v177;
    *(_OWORD *)buf = *MEMORY[0x1E0C9D538];
    objc_msgSend_objectForKey_(v184, v185, (uint64_t)CHRecognitionOptionDrawingAnchorPoint[0], v186, v187, v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_getValue_(v189, v190, (uint64_t)buf, v191, v192, v193);

    v195 = *(double *)buf;
    v194 = *(double *)&buf[8];
    v196 = v998;
    v140 = v998->_activeCharacterSet;
    if (!v140)
      goto LABEL_148;
  }
  else
  {

    v202 = v177;
    *(_OWORD *)buf = *MEMORY[0x1E0C9D538];
    v203 = *(double *)buf;
    v194 = *(double *)&buf[8];
    if (objc_msgSend_mode(v998->_configuration, v204, v205, v206, v207, v208) == 1)
    {
      v194 = -20.0;
      v195 = 0.0;
    }
    else
    {
      v195 = v203;
    }
    v183 = 20.0;
    v196 = v998;
    v140 = v998->_activeCharacterSet;
    if (!v140)
    {
LABEL_148:
      objc_msgSend_forcedActiveCharacterSet(v196->_configuration, v197, v198, v199, v200, v201);
      v140 = objc_claimAutoreleasedReturnValue();
      v196 = v998;
    }
  }
  v209 = v196->_recognitionModel;
  v1007 = 0;
  objc_msgSend_recognizeDrawing_minimumDrawingSize_initialVectorAnchorPoint_activeCharacterSet_outStrokeIndexMapping_outStrokeEndings_outFallbackSymbol_outFallbackSymbolScore_(v209, v210, (uint64_t)v1001, (uint64_t)v140, (uint64_t)&v1012, (uint64_t)&v1009, &v1007, &v1008, v183, v183, v195, v194);
  v988 = (void *)objc_claimAutoreleasedReturnValue();
  v975 = v1007;

  if (v979)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v211, (v1013 - (_BYTE *)v1012) >> 3, v212, v213, v214);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = v1012;
    if (v1013 != v1012)
    {
      v222 = 0;
      do
      {
        objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v215, v221[v222], v217, v218, v219);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v220, v224, (uint64_t)v223, v225, v226, v227);

        ++v222;
        v221 = v1012;
      }
      while (v222 < (v1013 - (_BYTE *)v1012) >> 3);
    }
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v215, v216, v217, v218, v219);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v235 = (uint64_t *)v1009;
    v234 = v1010;
    if (v1010 != v1009)
    {
      v236 = 0;
      do
      {
        if (v235[v236] >= 1)
        {
          objc_msgSend_addIndex_(v233, v228, v236, v230, v231, v232);
          v235 = (uint64_t *)v1009;
          v234 = v1010;
        }
        ++v236;
      }
      while (v236 < (v234 - (char *)v235) >> 3);
    }
    objc_msgSend_recognitionEngineCachingKey(v998, v228, v229, v230, v231, v232);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_cacheActivationMatrix_strokeIndexMapping_strokeEndings_drawing_recognitionEngineCachingKey_(v979, v237, (uint64_t)v988, (uint64_t)v220, (uint64_t)v233, (uint64_t)v1001, v4);

  }
  if (qword_1EF568E88 == -1)
  {
    v238 = (id)qword_1EF568E50;
    if (v170 <= 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_161;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v238 = (id)qword_1EF568E50;
    if (v170 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_161:
      if (os_signpost_enabled(v238))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE607000, v238, OS_SIGNPOST_INTERVAL_END, v167, "CHRecognizerActivationMatrix", ", buf, 2u);
      }
    }
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v239 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v239, OS_LOG_TYPE_DEFAULT, "END \"CHRecognizerActivationMatrix\", buf, 2u);
  }

LABEL_168:
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v240 = (id)qword_1EF568E50;
  spid = os_signpost_id_generate(v240);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v241 = (id)qword_1EF568E50;
  v242 = v241;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v241))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v242, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHRecognizerDecoding", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v243 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v243, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHRecognizerDecoding\", buf, 2u);
  }

  sub_1BE65280C((uint64_t)v998, v984);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_precomposedStringWithCanonicalMapping(v244, v245, v246, v247, v248, v249);
  v983 = (void *)objc_claimAutoreleasedReturnValue();

  if (v983)
  {
    if (objc_msgSend_length(v983, v250, v251, v252, v253, v254))
    {
      if (sub_1BE6528B8((uint64_t)v998, v984) == 2)
      {
        objc_msgSend_stringByAppendingString_(v983, v255, (uint64_t)CFSTR(" "), v256, v257, v258);
        v259 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v259 = (NSString *)v983;
      }
      v983 = v259;
      lastWordInString(v259);
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      v328 = objc_msgSend_length(v259, v323, v324, v325, v326, v327);
      v334 = objc_msgSend_length(v322, v329, v330, v331, v332, v333);
      v1003 = (id)objc_msgSend_length(v322, v335, v336, v337, v338, v339);

      v260 = 0;
      v4 = v328 - v334;
      if (!v998->_textDecoder.__engaged_)
        goto LABEL_201;
LABEL_185:
      objc_msgSend_activations(v988, v250, v251, v252, v253, v254);
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getActivationsMultiArray(v261, v262, v263, v264, v265, v266);
      v267 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_activations(v988, v268, v269, v270, v271, v272);
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getIndicesMultiArray(v273, v274, v275, v276, v277, v278);
      v279 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_activations(v988, v280, v281, v282, v283, v284);
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      v291 = objc_msgSend_timestepCount(v285, v286, v287, v288, v289, v290);
      objc_msgSend_activations(v988, v292, v293, v294, v295, v296);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      v303 = objc_msgSend_observationCount(v297, v298, v299, v300, v301, v302);
      v304 = objc_retainAutorelease(v267);
      v310 = objc_msgSend_dataPointer(v304, v305, v306, v307, v308, v309);
      if (v279)
      {
        v311 = objc_retainAutorelease(v279);
        v317 = objc_msgSend_dataPointer(v311, v312, v313, v314, v315, v316);
      }
      else
      {
        v317 = 0;
      }
      *(_QWORD *)buf = v291;
      *(_QWORD *)&buf[8] = v303;
      *(_OWORD *)&buf[16] = 0u;
      v1019 = 0u;
      v1020 = 0u;
      v1021 = v310;
      v1022 = v317;

      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v318 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v1023 = 134218240;
        *(_QWORD *)&v1023[4] = *(_QWORD *)buf;
        *(_WORD *)&v1023[12] = 2048;
        *(_QWORD *)&v1023[14] = *(_QWORD *)&buf[8];
        _os_log_impl(&dword_1BE607000, v318, OS_LOG_TYPE_DEBUG, "CTCMOD logActivations.shape=(%lu, %lu)", v1023, 0x16u);
      }

      if (v260)
      {
        memset(v1023, 0, 24);
      }
      else
      {
        v319 = v983;
        v320 = v319;
        if (v319)
          CFRetain(v319);
        sub_1BE66D024(&cf, v320);

        v321 = cf;
        if (cf)
        {
          CFRetain(cf);
          *(_QWORD *)v1023 = v321;
          *(_QWORD *)&v1023[8] = v4;
          *(_QWORD *)&v1023[16] = v1003;
          if (cf)
            CFRelease(cf);
        }
        else
        {
          *(_QWORD *)v1023 = 0;
          *(_QWORD *)&v1023[8] = v4;
          *(_QWORD *)&v1023[16] = v1003;
        }
      }
      (*((void (**)(_OWORD *__return_ptr, optional<CoreRecognition::decoder::CTCBeamSearchDecoder<CoreRecognition::decoder::AdditiveCombiningBeamScorer<>, CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::CombinedBeamState>>> *, _BYTE *, uint8_t *))v998->_textDecoder.var0.__val_._vptr$AbstractCTCDecoder
       + 2))(__p, &v998->_textDecoder, buf, v1023);
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v389 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v389, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v1016 = 134217984;
        *(_QWORD *)&v1016[4] = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)&__p[0] + 1) - *(_QWORD *)&__p[0]) >> 3);
        _os_log_impl(&dword_1BE607000, v389, OS_LOG_TYPE_DEBUG, "CTCMOD num paths %lu", v1016, 0xCu);
      }

      v1005 = v988;
      convertToCVNLPTextDecodingResult();
      v388 = (void *)objc_claimAutoreleasedReturnValue();

      v390 = *(void ***)&__p[0];
      if (*(_QWORD *)&__p[0])
      {
        v391 = (void **)*((_QWORD *)&__p[0] + 1);
        v392 = *(void **)&__p[0];
        if (*((_QWORD *)&__p[0] + 1) != *(_QWORD *)&__p[0])
        {
          v393 = (void **)*((_QWORD *)&__p[0] + 1);
          do
          {
            v396 = (char *)*(v393 - 5);
            v393 -= 5;
            v395 = v396;
            if (v396)
            {
              v397 = (char *)*(v391 - 4);
              v394 = v395;
              if (v397 != v395)
              {
                v398 = (char *)*(v391 - 4);
                do
                {
                  v400 = (void *)*((_QWORD *)v398 - 8);
                  v398 -= 64;
                  v399 = v400;
                  if (v400)
                  {
                    *((_QWORD *)v397 - 7) = v399;
                    operator delete(v399);
                  }
                  v397 = v398;
                }
                while (v398 != v395);
                v394 = *v393;
              }
              *(v391 - 4) = v395;
              operator delete(v394);
            }
            v391 = v393;
          }
          while (v393 != v390);
          v392 = *(void **)&__p[0];
        }
        *((_QWORD *)&__p[0] + 1) = v390;
        operator delete(v392);
      }
      if (*(_QWORD *)v1023)
        CFRelease(*(CFTypeRef *)v1023);
      if (*((_QWORD *)&v1019 + 1))
      {
        *(_QWORD *)&v1020 = *((_QWORD *)&v1019 + 1);
        operator delete(*((void **)&v1019 + 1));
      }
      if (*(_QWORD *)&buf[16])
      {
        *(_QWORD *)&buf[24] = *(_QWORD *)&buf[16];
        operator delete(*(void **)&buf[16]);
      }
      goto LABEL_240;
    }
  }
  else
  {
    v983 = 0;
  }
  v260 = 1;
  if (v998->_textDecoder.__engaged_)
    goto LABEL_185;
LABEL_201:
  objc_msgSend_activations(v988, v250, v251, v252, v253, v254);
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActivationMatrix_(v998->_legacyTextDecoder, v341, (uint64_t)v340, v342, v343, v344);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v345 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v345, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v345, OS_LOG_TYPE_DEBUG, "Using the CVNLP Text Decoder", buf, 2u);
  }

  objc_msgSend_decodingCommitActionBlock(v998->_configuration, v346, v347, v348, v349, v350);
  v304 = (id)objc_claimAutoreleasedReturnValue();
  configuration = v998->_configuration;
  objc_msgSend_languageResourceBundle(v998->_legacyTextDecoder, v352, v353, v354, v355, v356);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathScoringFunctionForLanguageResourceBundle_(configuration, v358, (uint64_t)v357, v359, v360, v361);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  v367 = objc_msgSend__effectiveMaxRecognitionResultCount(v998, v362, v363, v364, v365, v366);
  v373 = v367;
  if (2 * v367 <= 20)
    v374 = 20;
  else
    v374 = 2 * v367;
  v375 = objc_msgSend_mixedScriptPenalty(v998->_configuration, v368, v369, v370, v371, v372);
  v376 = objc_alloc(MEMORY[0x1E0D09AE0]);
  v378 = v375 == 1;
  if (v373 <= 3)
    shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_(v376, v377, (uint64_t)v304, (uint64_t)v279, v374, 3, 1, v378);
  else
    shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths_(v376, v377, (uint64_t)v304, (uint64_t)v279, v374, v373, 1, v378);
  v383 = (void *)shouldOptimizeAlignment_pruneProblematicMixedScriptWordPaths;
  if ((v260 & 1) != 0)
  {
    active = 0;
  }
  else
  {
    v385 = objc_alloc(MEMORY[0x1E0D09AF0]);
    active = (void *)objc_msgSend_initWithHistory_activeRange_(v385, v386, (uint64_t)v983, v4, (uint64_t)v1003, v387);
  }
  objc_msgSend_decodingResultWithConfiguration_withContext_(v998->_legacyTextDecoder, v380, (uint64_t)v383, (uint64_t)active, v381, v382);
  v388 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_240:
  v977 = sub_1BE6528B8((uint64_t)v998, v984);
  v406 = objc_msgSend_mode(v998->_configuration, v401, v402, v403, v404, v405);
  v982 = v388;
  v978 = v984;
  v994 = v1001;
  objc_msgSend_modelName(v998->_recognitionModel, v407, v408, v409, v410, v411);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelNameChinese(CHRecognizerConfiguration, v413, v414, v415, v416, v417);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v412, v419, (uint64_t)v418, v420, v421, v422);

  if (isEqualToString)
  {
    v428 = v984;
      v425,
      v426,
      v427);
    v993 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v993 = 0;
    v428 = v984;
  }
  sub_1BE65280C((uint64_t)v998, v978);
  v429 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_precomposedStringWithCanonicalMapping(v429, v430, v431, v432, v433, v434);
  v973 = (void *)objc_claimAutoreleasedReturnValue();

  v435 = v978;
  v440 = v435;
  if (v428)
  {
    objc_msgSend_objectForKey_(v435, v436, (uint64_t)CHRecognitionOptionTextAfter[0], v437, v438, v439);
    v442 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v441 = v442;
    else
      v441 = 0;

  }
  else
  {
    v441 = 0;
  }
  v972 = v440;

  objc_msgSend_precomposedStringWithCanonicalMapping(v441, v443, v444, v445, v446, v447);
  v974 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v982
    || (objc_msgSend_candidates(v982, v448, v449, v450, v451, v452),
        v453 = (void *)objc_claimAutoreleasedReturnValue(),
        v459 = objc_msgSend_count(v453, v454, v455, v456, v457, v458) == 0,
        v453,
        v459))
  {
    v882 = 0;
  }
  else
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v460, v461, v462, v463, v464);
    v987 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v465, v466, v467, v468, v469);
    v986 = (void *)objc_claimAutoreleasedReturnValue();
    v1015 = v977 == 2;
    objc_msgSend_candidates(v982, v470, v471, v472, v473, v474);
    v475 = (void *)objc_claimAutoreleasedReturnValue();
    v481 = objc_msgSend_count(v475, v476, v477, v478, v479, v480) == 0;

    v971 = CFSTR(" ");
    if (!v481)
    {
      objc_msgSend_candidates(v982, v482, v483, v484, v485, v486);
      v487 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v487, v488, v489, v490, v491, v492);
      v493 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fullString(v493, v494, v495, v496, v497, v498);
      v499 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v499, v500, (uint64_t)CFSTR(""), (uint64_t)&stru_1E77F6F28, v501, v502);
      v503 = (void *)objc_claimAutoreleasedReturnValue();

      if (v406 == 1)
      {
        if (objc_msgSend_length(v503, v504, v505, v506, v507, v508))
        {
          v509 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v503, v504, 0, v506, v507, v508);
          v511 = (uint64_t)v510;
          if ((unint64_t)v510 < objc_msgSend_length(v503, v510, v512, v513, v514, v515))
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v516 = (id)qword_1EF568E20;
            if (os_log_type_enabled(v516, OS_LOG_TYPE_ERROR))
            {
              v522 = objc_msgSend_countCodepoints(v503, v517, v518, v519, v520, v521);
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v522;
              _os_log_impl(&dword_1BE607000, v516, OS_LOG_TYPE_ERROR, "Decoder predicted string with %ld code points in single character mode, truncating results to 1 character.", buf, 0xCu);
            }

            objc_msgSend_substringWithRange_(v503, v523, v509, v511, v524, v525);
            v526 = objc_claimAutoreleasedReturnValue();

            v503 = (void *)v526;
          }
        }
      }
      objc_msgSend_locale(v998->_configuration, v504, v505, v506, v507, v508);
      v527 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v1016 = CFSTR(" ");
      objc_msgSend__updatePrecedingAndTrailingSeparatorsForTopCandidate_history_textAfter_locale_outTrailingSeparator_inFirstTokenHasPrecedingSpace_outFirstTokenHasPrecedingSpace_(CHRecognizer, v528, (uint64_t)v503, (uint64_t)v973, (uint64_t)v974, (uint64_t)v527, v1016, v977 == 2, &v1015);
      v971 = (__CFString *)*(id *)v1016;

    }
    objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v482, 1, (uint64_t)v998->_patternFST, 0, v486);
    v992 = (void *)objc_claimAutoreleasedReturnValue();
    v1024 = 0u;
    v1025 = 0u;
    memset(v1023, 0, sizeof(v1023));
    objc_msgSend_candidates(v982, v529, v530, v531, v532, v533);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v990 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v534, (uint64_t)v1023, (uint64_t)buf, 16, v535);
    if (v990)
    {
      v989 = **(_QWORD **)&v1023[16];
      do
      {
        for (k = 0; k != v990; ++k)
        {
          if (**(_QWORD **)&v1023[16] != v989)
            objc_enumerationMutation(obj);
          v997 = *(void **)(*(_QWORD *)&v1023[8] + 8 * k);
          objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v536, v537, v538, v539, v540);
          v995 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v541, v542, v543, v544, v545);
          v996 = (void *)objc_claimAutoreleasedReturnValue();
          v999 = 0;
          v1000 = 0;
          v551 = 0;
          v552 = v1015;
          while (1)
          {
            objc_msgSend_tokens(v997, v546, v547, v548, v549, v550);
            v553 = (void *)objc_claimAutoreleasedReturnValue();
            v559 = v999 < objc_msgSend_count(v553, v554, v555, v556, v557, v558);

            if (!v559)
              break;
            objc_msgSend_tokens(v997, v560, v561, v562, v563, v564);
            v565 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v565, v566, v999, v567, v568, v569);
            v1004 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_score(v1004, v570, v571, v572, v573, v574);
            v575 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v575, v576, v577, v578, v579, v580);
            v582 = v581;

            objc_msgSend_string(v1004, v583, v584, v585, v586, v587);
            v588 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v588, v589, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v590, v591);
            v592 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v592, v593, (uint64_t)CFSTR(""), (uint64_t)&stru_1E77F6F28, v594, v595);
            v1002 = (__CFString *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v596, v597, v598, v599, v600);
            v601 = (void *)objc_claimAutoreleasedReturnValue();
            v607 = objc_msgSend_activationRange(v1004, v602, v603, v604, v605, v606);
            objc_msgSend_activationRange(v1004, v608, v609, v610, v611, v612);
            v618 = &v613[v607];
            if ((unint64_t)&v613[v607] > (v1010 - (_BYTE *)v1009) >> 3)
            {
              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v619 = (id)qword_1EF568E18[0];
              if (os_log_type_enabled(v619, OS_LOG_TYPE_FAULT))
              {
                LOWORD(__p[0]) = 0;
                _os_log_impl(&dword_1BE607000, v619, OS_LOG_TYPE_FAULT, "The token activation range is longer than the sequence in the activation matrix.", (uint8_t *)__p, 2u);
              }

            }
            v625 = objc_msgSend_activationRange(v1004, v613, v614, v615, v616, v617);
            if (v625 < (unint64_t)v618)
            {
              v626 = (uint64_t *)v1009;
              do
              {
                if (v626[v625] >= 1)
                {
                  v627 = 0;
                  do
                  {
                    objc_msgSend_addIndex_(v601, v620, v551 + v627++, v622, v623, v624);
                    v626 = (uint64_t *)v1009;
                  }
                  while (v627 < *((_QWORD *)v1009 + v625));
                  v551 += v627;
                }
                ++v625;
              }
              while ((const char *)v625 != v618);
            }
            if (!objc_msgSend_count(v601, v620, v621, v622, v623, v624)
              && objc_msgSend_length(v1002, v628, v629, v630, v631, v632))
            {
              if (objc_msgSend_count(v1000, v633, v634, v635, v636, v637))
              {
                Index = objc_msgSend_lastIndex(v1000, v638, v639, v640, v641, v642);
                objc_msgSend_addIndex_(v601, v644, Index, v645, v646, v647);
              }
              else
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v648 = (id)qword_1EF568E20;
                if (os_log_type_enabled(v648, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend_string(v1004, v649, v650, v651, v652, v653);
                  v654 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(__p[0]) = 138412290;
                  *(_QWORD *)((char *)__p + 4) = v654;
                  _os_log_impl(&dword_1BE607000, v648, OS_LOG_TYPE_ERROR, "Previous token stroke index set is empty, and current token %@ stroke index set is also empty", (uint8_t *)__p, 0xCu);

                }
                objc_msgSend_addIndex_(v601, v655, 0, v656, v657, v658);
              }
            }
            v659 = v601;

            v1000 = v659;
            if (objc_msgSend_length(v1002, v660, v661, v662, v663, v664))
            {
              if (v993)
              {
                objc_msgSend_activationRange(v1004, v665, v666, v667, v668, v669);
                if ((unint64_t)v665 <= 2)
                {
                  v670 = objc_msgSend_codepointAtIndex_outRange_(v1002, v665, 0, (uint64_t)__p, v668, v669);
                  v676 = objc_msgSend_length(v1002, v671, v672, v673, v674, v675);
                  if (v676 > *((_QWORD *)&__p[0] + 1)
                    || (objc_msgSend_longCharacterIsMember_(v993, v677, v670, v678, v679, v680) & 1) == 0)
                  {

                    v1002 = CFSTR(".");
                  }
                }
              }
              objc_msgSend_addIndexes_(v1000, v665, (uint64_t)v995, v667, v668, v669);
              objc_msgSend_removeAllIndexes(v995, v681, v682, v683, v684, v685);
              LOBYTE(__p[0]) = 0;
              staticLexicon = (uint64_t)v998->_staticLexicon;
              if (staticLexicon)
              {
                v691 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v686, (uint64_t)v1002, staticLexicon, v688, v689);
                if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v692, (uint64_t)v1002, (uint64_t)v998->_staticLexicon, (uint64_t)__p, v693) & 1) == 0)
                {
                  customLexicon = (uint64_t)v998->_customLexicon;
                  if (!customLexicon)
                  {
LABEL_309:
                    v768 = 8;
                    goto LABEL_314;
                  }
LABEL_304:
                  v691 = objc_msgSend_tokenIDForString_withLexicon_(CHLanguageUtilities, v686, (uint64_t)v1002, customLexicon, v688, v689);
                  if (!objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v766, (uint64_t)v1002, (uint64_t)v998->_customLexicon, (uint64_t)__p, v767))goto LABEL_309;
                }
                if (objc_msgSend_isInappropriateTokenID_(v998->_ovsStringChecker, v686, v691, customLexicon, v688, v689))
                {
                  v768 = 12;
                  if (LOBYTE(__p[0]))
                    v768 = 268;
                }
                else
                {
                  isInappropriateString = objc_msgSend_isInappropriateString_(v998->_ovsStringChecker, v686, (uint64_t)v1002, customLexicon, v688, v689);
                  v768 = 12;
                  if (LOBYTE(__p[0]))
                    v768 = 268;
                  if (!isInappropriateString)
                    goto LABEL_314;
                }
                v768 |= 0x10uLL;
LABEL_314:
                if ((v552 & 1) != 0)
                  v770 = v768 | 0x20;
                else
                  v770 = v768;
                objc_msgSend_lastObject(v996, v686, v687, customLexicon, v688, v689);
                v771 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_string(v771, v772, v773, v774, v775, v776);
                v777 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_lastComposedCharacter(v777, v778, v779, v780, v781, v782);
                v783 = (NSString *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_firstComposedCharacter(v1002, v784, v785, v786, v787, v788);
                v789 = (NSString *)objc_claimAutoreleasedReturnValue();
                if (shouldForbidSpaceInBetween(v783, v789))
                  v792 = v770 & 0xFFFFFFFFFFFFFFDFLL;
                else
                  v792 = v770;
                if (!v999)
                {
                  v793 = (void *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v790, (uint64_t)v1002, (uint64_t)v992, (uint64_t)v998->_patternFST, v791);
                  v799 = v793;
                  if (v793)
                  {
                    if (objc_msgSend_isCompletePattern(v793, v794, v795, v796, v797, v798))
                      v792 |= 0x80uLL;
                  }

                }
                sub_1BE705C80(v1000, (uint64_t)&v1012);
                v800 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_boundsForStrokeIndexes_(v994, v801, (uint64_t)v800, v802, v803, v804);
                v806 = v805;
                v808 = v807;
                v810 = v809;
                v812 = v811;
                v813 = [CHTokenizedTextResultToken alloc];
                objc_msgSend_alignmentScore(v1004, v814, v815, v816, v817, v818);
                v819 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v819, v820, v821, v822, v823, v824);
                v826 = v825;
                objc_msgSend_locale(v998->_configuration, v827, v828, v829, v830, v831);
                v832 = (void *)objc_claimAutoreleasedReturnValue();
                v838 = objc_msgSend_count(v800, v833, v834, v835, v836, v837);
                v840 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v813, v839, (uint64_t)v1002, (uint64_t)v800, v691, v792, v832, 2, v582, v582, v582, v826, v806, v808, v810, v812, v838);

                objc_msgSend_addObject_(v996, v841, (uint64_t)v840, v842, v843, v844);
                objc_msgSend_terminatingCharacter(v1004, v845, v846, v847, v848, v849);
                v850 = (void *)objc_claimAutoreleasedReturnValue();
                v552 = objc_msgSend_isEqualToString_(v850, v851, (uint64_t)CFSTR(" "), v852, v853, v854);

                goto LABEL_326;
              }
              v691 = 0;
              customLexicon = (uint64_t)v998->_customLexicon;
              if (!customLexicon)
                goto LABEL_309;
              goto LABEL_304;
            }
            objc_msgSend_terminatingCharacter(v1004, v665, v666, v667, v668, v669);
            v695 = (void *)objc_claimAutoreleasedReturnValue();
            v700 = objc_msgSend_isEqualToString_(v695, v696, (uint64_t)CFSTR(" "), v697, v698, v699);

            v552 |= v700;
            if (objc_msgSend_count(v1000, v701, v702, v703, v704, v705))
            {
              if (objc_msgSend_count(v996, v706, v707, v708, v709, v710))
              {
                objc_msgSend_lastObject(v996, v711, v712, v713, v714, v715);
                v716 = (void *)objc_claimAutoreleasedReturnValue();
                sub_1BE705C80(v1000, (uint64_t)&v1012);
                v717 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_boundsForStrokeIndexes_(v994, v718, (uint64_t)v717, v719, v720, v721);
                v723 = v722;
                v725 = v724;
                v727 = v726;
                v729 = v728;
                objc_msgSend_bounds(v716, v730, v731, v732, v733, v734);
                v1028.origin.x = v723;
                v1028.origin.y = v725;
                v1028.size.width = v727;
                v1028.size.height = v729;
                CGRectUnion(v1027, v1028);
                v735 = (void *)objc_opt_class();
                objc_msgSend_alignmentScore(v1004, v736, v737, v738, v739, v740);
                v741 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v741, v742, v743, v744, v745, v746);
                objc_msgSend_extendedToken_withStrokeIndexSet_alignmentScore_bounds_(v735, v747, (uint64_t)v716, (uint64_t)v717, v748, v749);
                v750 = (void *)objc_claimAutoreleasedReturnValue();

                v756 = objc_msgSend_lastIndex(v1000, v751, v752, v753, v754, v755);
                v762 = objc_msgSend_count(v996, v757, v758, v759, v760, v761);
                objc_msgSend_setObject_atIndexedSubscript_(v996, v763, (uint64_t)v750, v762 - 1, v764, v765);

                v551 = v756 + 1;
              }
              else
              {
                objc_msgSend_addIndexes_(v995, v711, (uint64_t)v1000, v713, v714, v715);
              }
            }
LABEL_326:

            ++v999;
          }
          if (objc_msgSend_count(v996, v560, v561, v562, v563, v564))
          {
            objc_msgSend_addObject_(v987, v855, (uint64_t)v996, v856, v857, v858);
            v859 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend_score(v997, v860, v861, v862, v863, v864);
            objc_msgSend_numberWithDouble_(v859, v865, v866, v867, v868, v869);
            v870 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v986, v871, (uint64_t)v870, v872, v873, v874);

          }
        }
        v990 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v536, (uint64_t)v1023, (uint64_t)buf, 16, v540);
      }
      while (v990);
    }

    if (objc_msgSend_count(v987, v875, v876, v877, v878, v879))
    {
      v880 = [CHTokenizedTextResult alloc];
      v882 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v880, v881, (uint64_t)v987, (uint64_t)v986, (uint64_t)v971, 2);
    }
    else
    {
      v882 = 0;
    }

  }
  if (!v882)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v883 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v883, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v883, OS_LOG_TYPE_ERROR, "Text decoding unexpectedly leads to empty result - falling back on single-character result from the activation matrix.", buf, 2u);
    }

    v884 = v1008;
    v885 = v994;
    v891 = v975;
    if (v977 == 2)
      v892 = 40;
    else
      v892 = 8;
    v893 = (void *)MEMORY[0x1E0CB36B8];
    v894 = objc_msgSend_strokeCount(v885, v886, v887, v888, v889, v890);
    objc_msgSend_indexSetWithIndexesInRange_(v893, v895, 0, v894, v896, v897);
    v898 = (void *)objc_claimAutoreleasedReturnValue();
    if (v891)
    {
      v899 = [CHTokenizedTextResultToken alloc];
      objc_msgSend_locale(v998->_configuration, v900, v901, v902, v903, v904);
      v905 = (void *)objc_claimAutoreleasedReturnValue();
      v911 = objc_msgSend_strokeCount(v885, v906, v907, v908, v909, v910);
      objc_msgSend_bounds(v885, v912, v913, v914, v915, v916);
      v922 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v899, v917, (uint64_t)v891, (uint64_t)v898, 0, v892, v905, 4, v884, v884, v884, v884, v918, v919, v920, v921, v911);
    }
    else
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v923 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v923, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v923, OS_LOG_TYPE_ERROR, "No fallback symbol could be retrieved from the activation matrix. Creating fallback token with empty string.", buf, 2u);
      }

      v924 = [CHTokenizedTextResultToken alloc];
      objc_msgSend_locale(v998->_configuration, v925, v926, v927, v928, v929);
      v905 = (void *)objc_claimAutoreleasedReturnValue();
      v935 = objc_msgSend_strokeCount(v885, v930, v931, v932, v933, v934);
      objc_msgSend_bounds(v885, v936, v937, v938, v939, v940);
      v922 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v924, v941, (uint64_t)&stru_1E77F6F28, (uint64_t)v898, 0, v892, v905, 4, 0.0, 0.0, 0.0, 0.0, v942, v943, v944, v945, v935);
    }
    v946 = (void *)v922;

    v947 = [CHTokenizedTextResult alloc];
    *(_QWORD *)v1023 = v946;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v948, (uint64_t)v1023, 1, v949, v950);
    v951 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v951;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v952, (uint64_t)buf, 1, v953, v954);
    v955 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v956, v957, v958, v959, v960, v884);
    v961 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&__p[0] = v961;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v962, (uint64_t)__p, 1, v963, v964);
    v965 = (void *)objc_claimAutoreleasedReturnValue();
    v882 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v947, v966, (uint64_t)v955, (uint64_t)v965, (uint64_t)&stru_1E77F6F28, 2);

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v967 = (id)qword_1EF568E50;
  v968 = v967;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v967))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v968, OS_SIGNPOST_INTERVAL_END, spid, "CHRecognizerDecoding", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v969 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v969, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v969, OS_LOG_TYPE_DEFAULT, "END \"CHRecognizerDecoding\", buf, 2u);
  }

  v17 = v882;
  if (v1009)
  {
    v1010 = (char *)v1009;
    operator delete(v1009);
  }
  if (v1012)
  {
    v1013 = (char *)v1012;
    operator delete(v1012);
  }
LABEL_366:

  return v17;
}

- (id)recognitionEngineCachingKey
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *recognitionModel;

  recognitionModel = self->_recognitionModel;
  if (recognitionModel)
  {
    objc_msgSend_modelName(recognitionModel, a2, v2, v3, v4, v5);
    recognitionModel = (void *)objc_claimAutoreleasedReturnValue();
  }
  return recognitionModel;
}

+ (void)_updatePrecedingAndTrailingSeparatorsForTopCandidate:(id)a3 history:(id)a4 textAfter:(id)a5 locale:(id)a6 outTrailingSeparator:(id *)a7 inFirstTokenHasPrecedingSpace:(BOOL)a8 outFirstTokenHasPrecedingSpace:(BOOL *)a9
{
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSCharacterSet *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSCharacterSet *v52;
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
  NSCharacterSet *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSCharacterSet *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BOOL4 v80;
  uint64_t v81;
  int v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  NSCharacterSet *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSCharacterSet *v96;
  _BOOL4 v97;
  int v98;
  char v99;
  int v100;
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
  NSCharacterSet *v111;
  _BOOL4 v112;
  int v113;
  char v114;
  char v115;
  int v116;
  int v117;
  char v118;
  int v119;
  __CFString *v120;
  _BOOL4 v121;
  BOOL v122;
  int v123;
  _BOOL4 v124;
  char shouldApplyThaiSpacingForLocale;
  _BOOL4 v126;
  _BOOL4 v127;
  _BOOL4 v128;
  _BOOL4 v129;
  id *v130;
  NSString *v131;
  NSString *v132;
  void *v133;
  void *v134;
  void *v135;
  NSString *v136;
  uint64_t v137;
  uint64_t v138;
  id v139;

  v139 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v134 = v15;
  v135 = v14;
  v133 = v16;
  objc_msgSend_lastComposedCharacter(v14, v17, v18, v19, v20, v21);
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  v132 = v22;
  objc_msgSend_firstComposedCharacter(v15, v23, v24, v25, v26, v27);
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstComposedCharacter(v139, v29, v30, v31, v32, v33);
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  v130 = a7;
  v131 = v34;
  objc_msgSend_lastComposedCharacter(v139, v35, v36, v37, v38, v39);
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  v136 = v40;
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v41, v42, v43, v44, v45);
  v46 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v129 = isStringEntirelyFromSet(v22, v46);

  objc_msgSend_ch_sentenceEndPunctuationCharacterSet(MEMORY[0x1E0CB3500], v47, v48, v49, v50, v51);
  v52 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v128 = isStringEntirelyFromSet(v22, v52);

  v138 = objc_msgSend_length(v14, v53, v54, v55, v56, v57);
  v137 = objc_msgSend_length(v15, v58, v59, v60, v61, v62);
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v63, v64, v65, v66, v67);
  v68 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v127 = isStringEntirelyFromSet(v28, v68);

  objc_msgSend_ch_sentenceEndPunctuationCharacterSet(MEMORY[0x1E0CB3500], v69, v70, v71, v72, v73);
  v74 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v126 = isStringEntirelyFromSet(v28, v74);

  if (v138 && objc_msgSend_length(v22, v75, v76, v77, v78, v79) == 1)
  {
    v80 = objc_msgSend_firstCodepointInString(v22, v75, v76, v77, v78, v79) == 65532;
    if (!v137)
      goto LABEL_8;
  }
  else
  {
    v80 = 0;
    if (!v137)
      goto LABEL_8;
  }
  if (objc_msgSend_length(v28, v75, v76, v77, v78, v79) == 1)
  {
    v124 = objc_msgSend_firstCodepointInString(v28, v75, v81, v77, v78, v79) == 65532;
    goto LABEL_9;
  }
LABEL_8:
  v124 = 0;
LABEL_9:
  shouldApplyThaiSpacingForLocale = objc_msgSend_shouldApplyThaiSpacingForLocale_(CHRecognizerConfiguration, v75, (uint64_t)v16, v77, v78, v79);
  if (isCharacterLatinOrCommonScript(v34))
    v123 = isCharacterFullWidth(v34) ^ 1;
  else
    v123 = 0;
  v122 = a8;
  if (isCharacterLatinOrCommonScript(v40))
    v82 = isCharacterFullWidth(v40) ^ 1;
  else
    v82 = 0;
  v121 = v80;
  if (isCharacterLatinOrCommonScript(v28))
    v88 = isCharacterFullWidth(v28) ^ 1;
  else
    v88 = 0;
  objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v83, v84, v85, v86, v87);
  v89 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v90 = isStringEntirelyFromSet(v28, v89);

  objc_msgSend_newlineCharacterSet(MEMORY[0x1E0CB3500], v91, v92, v93, v94, v95);
  v96 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  v97 = isStringEntirelyFromSet(v22, v96);

  if (isCharacterLatinOrCommonScript(v22))
    v98 = isCharacterFullWidth(v22) ^ 1;
  else
    v98 = 0;
  v99 = shouldForbidSpaceInBetween(v22, v34);
  v100 = shouldForbidSpaceInBetween(v136, v28);
  if (objc_msgSend_countCharacters(v139, v101, v102, v103, v104, v105) < 2)
  {
    v112 = 1;
  }
  else
  {
    objc_msgSend_ch_latinCharacterSet(MEMORY[0x1E0CB3500], v106, v107, v108, v109, v110);
    v111 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    v112 = isStringEntirelyFromSet((NSString *)v139, v111);

  }
  v113 = v129 || v128 || v127 || v90 || v97 || v126;
  if (!v138)
    v113 = 1;
  if (v137)
    v114 = v90;
  else
    v114 = 1;
  v115 = v114 ^ 1 | v122;
  if ((shouldApplyThaiSpacingForLocale & 1) != 0)
  {
    v116 = v82 & v88;
    v115 &= v98 & v123;
  }
  else
  {
    v116 = 1;
  }
  v117 = v112 & ~(v113 | (v137 == 0 || v121 || v124) | v123 ^ v98 | v82 ^ v88);
  if (v138)
    v118 = v129;
  else
    v118 = 1;
  if (v130)
  {
    v119 = v90 || v126;
    if (!v137)
      v119 = 1;
    if ((v116 & ~(v119 | v100 | v117)) != 0)
      v120 = CFSTR(" ");
    else
      v120 = &stru_1E77F6F28;
    *v130 = objc_retainAutorelease(v120);
  }
  if (a9)
    *a9 = v115 & ~(v118 | v97 | v99 | v117);

}

- (id)_postprocessingMergedRecognitionResult:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CHPostProcessingManager *mergedResultPostProcessor;
  void *v14;
  CHResultWithContext *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v12 = a4;
  mergedResultPostProcessor = self->_mergedResultPostProcessor;
  if (mergedResultPostProcessor)
  {
    if (!v6)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend__initializeMergedResultPostProcessor(self, v7, v8, v9, v10, v11);
    mergedResultPostProcessor = self->_mergedResultPostProcessor;
    if (!v6)
      goto LABEL_7;
  }
  if (mergedResultPostProcessor)
  {
    sub_1BE65280C((uint64_t)self, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [CHResultWithContext alloc];
    v21 = objc_msgSend_contentType(self->_configuration, v16, v17, v18, v19, v20);
    v24 = (void *)objc_msgSend_initWithResult_leftContext_contentType_(v15, v22, (uint64_t)v6, (uint64_t)v14, v21, v23);
    objc_msgSend_process_options_(self->_mergedResultPostProcessor, v25, (uint64_t)v24, (uint64_t)v12, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v28, v29, v30, v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v34;
  }
LABEL_7:

  return v6;
}

- (id)_changeableColumnCountUpdatedResult:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char shouldUpdateChangeableColumnCountWithPhraseLexicon;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  _LXLexicon *phraseLexicon;
  uint64_t v34;
  _LXLexicon *customPhraseLexicon;
  uint64_t v36;
  id v37;
  _QWORD v39[4];
  id v40;
  _QWORD *v41;
  uint64_t *v42;
  _QWORD v43[4];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v6 = a3;
  v12 = a4;
  if ((self->_phraseLexicon || self->_customPhraseLexicon)
    && (objc_msgSend_configuration(self, v7, v8, v9, v10, v11),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        shouldUpdateChangeableColumnCountWithPhraseLexicon = objc_msgSend_shouldUpdateChangeableColumnCountWithPhraseLexicon(v13, v14, v15, v16, v17, v18), v13, (shouldUpdateChangeableColumnCountWithPhraseLexicon & 1) != 0))
  {
    sub_1BE65280C((uint64_t)self, v12);
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_1BE63EF8C;
    v48 = sub_1BE63EF9C;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v49 = v20;
    if (objc_msgSend_length(v20, v21, v22, v23, v24, v25))
    {
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      v43[3] = 0;
      v31 = objc_msgSend_length(v20, v26, v27, v28, v29, v30);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = sub_1BE65BE70;
      v39[3] = &unk_1E77F2818;
      v41 = v43;
      v42 = &v44;
      v40 = v20;
      objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v40, v32, 0, v31, 259, (uint64_t)v39);

      _Block_object_dispose(v43, 8);
    }
    phraseLexicon = self->_phraseLexicon;
    if (phraseLexicon)
    {
      objc_msgSend_changeableColumnCountUpdatedResultWithHistory_phraseLexicon_maxPhraseLength_(v6, v26, v45[5], (uint64_t)phraseLexicon, 3, v30);
      v34 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v34;
    }
    customPhraseLexicon = self->_customPhraseLexicon;
    if (customPhraseLexicon)
    {
      objc_msgSend_changeableColumnCountUpdatedResultWithHistory_phraseLexicon_maxPhraseLength_(v6, v26, v45[5], (uint64_t)customPhraseLexicon, 3, v30);
      v36 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v36;
    }
    v37 = v6;
    _Block_object_dispose(&v44, 8);

  }
  else
  {
    v37 = v6;
  }

  return v37;
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  objc_msgSend_textRecognitionResultForDrawing_options_writingStatistics_shouldCancel_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, (uint64_t)a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 writingStatistics:(id)a5 shouldCancel:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t (**v13)(_QWORD);
  CHRecognitionInsight *activeRecognitionInsight;
  CHRecognitionInsight *v15;
  CHRecognitionInsight *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CHRecognitionInsightRequest *nextRecognitionInsightRequest;
  id v22;
  NSObject *recognitionQueue;
  id v24;
  CHRecognitionInsight *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CHRecognitionInsight *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v37;
  id v38;
  CHRecognizer *v39;
  id v40;
  id v41;
  uint64_t (**v42)(_QWORD);
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (uint64_t (**)(_QWORD))a6;
  if (self)
  {
    activeRecognitionInsight = self->_activeRecognitionInsight;
    self->_activeRecognitionInsight = 0;

    if (self->_nextRecognitionInsightRequest)
    {
      v15 = objc_alloc_init(CHRecognitionInsight);
      v16 = self->_activeRecognitionInsight;
      self->_activeRecognitionInsight = v15;

      objc_msgSend_recordInsightRequest_(self->_activeRecognitionInsight, v17, (uint64_t)self->_nextRecognitionInsightRequest, v18, v19, v20);
      nextRecognitionInsightRequest = self->_nextRecognitionInsightRequest;
      self->_nextRecognitionInsightRequest = 0;

    }
  }
  if (v13 && (v13[2](v13) & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_1BE63EF8C;
    v48 = sub_1BE63EF9C;
    v49 = 0;
    recognitionQueue = self->_recognitionQueue;
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = sub_1BE65C158;
    v37 = &unk_1E77F2840;
    v38 = v10;
    v39 = self;
    v43 = &v44;
    v40 = v12;
    v24 = v11;
    v41 = v24;
    v42 = v13;
    dispatch_sync(recognitionQueue, &v34);
    v25 = self->_activeRecognitionInsight;
    v29 = v25;
    if (v25)
    {
      objc_msgSend_recordConfigurationForRecognizer_options_(v25, v26, (uint64_t)self, (uint64_t)v24, v27, v28, v34, v35, v36, v37, v38, v39, v40, v41);
      objc_msgSend_recordTextResult_recognitionError_(v29, v30, v45[5], 0, v31, v32);
    }
    v22 = (id)v45[5];

    _Block_object_dispose(&v44, 8);
  }

  return v22;
}

- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *recognitionQueue;
  _QWORD block[4];
  id v16;
  CHRecognizer *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && ((*((uint64_t (**)(id))v10 + 2))(v10) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1BE63EF8C;
    v25 = sub_1BE63EF9C;
    v26 = 0;
    recognitionQueue = self->_recognitionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE65C844;
    block[3] = &unk_1E77F2868;
    v16 = v8;
    v17 = self;
    v20 = &v21;
    v18 = v9;
    v19 = v11;
    dispatch_sync(recognitionQueue, block);
    v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }

  return v12;
}

- (id)recognitionResultsForDrawing:(id)a3 options:(id)a4
{
  uint64_t v4;

  objc_msgSend_recognitionResultsForDrawing_options_shouldCancel_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_adjustCandidatesForConfusableCharacters:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  float v19;
  int *v20;
  size_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  int *v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  _QWORD *v32;
  char *v33;
  unint64_t v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  __int128 *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  if (objc_msgSend_characterIsMember_(self->_activeCharacterSet, a2, 161, v3, v4, v5))
  {
    v8 = *(int **)a3;
    v7 = (int *)*((_QWORD *)a3 + 1);
    v9 = (uint64_t)v7 - *(_QWORD *)a3;
    if (v7 != *(int **)a3)
    {
      v10 = 0;
      v11 = v9 >> 3;
      v12 = (unint64_t)(v9 >> 3) <= 1 ? 1 : v9 >> 3;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v14 = *(int **)a3;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v17 = *v14;
        v14 += 2;
        v16 = v17;
        if (v17 == 161)
          v18 = v10;
        else
          v18 = v15;
        if (v16 == 105)
          v13 = v10;
        else
          v15 = v18;
        ++v10;
      }
      while (v12 != v10);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = *(float *)&v8[2 * v13 + 1] * 0.75;
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = &v8[2 * v15];
          if (v19 <= *((float *)v20 + 1))
            return;
          v21 = (char *)v7 - (char *)(v20 + 2);
          if (v21)
          {
            memmove(&v8[2 * v15], v20 + 2, v21);
            v8 = *(int **)a3;
          }
          v7 = (int *)((char *)v20 + v21);
          *((_QWORD *)a3 + 1) = v7;
          v11 = ((char *)v7 - (char *)v8) >> 3;
        }
        LODWORD(v43) = 161;
        *((float *)&v43 + 1) = v19;
        if (v7 != v8)
        {
          v22 = v11 <= 1 ? 1 : v11;
          v23 = (float *)(v8 + 1);
          v24 = 0x7FFFFFFFFFFFFFFFLL;
          v25 = v8;
          while (v19 <= *v23)
          {
            v25 += 2;
            --v24;
            v23 += 2;
            if (!--v22)
              goto LABEL_30;
          }
          if (v24)
          {
            sub_1BE63D2AC((unint64_t *)a3, v25, (char *)&v43);
            return;
          }
        }
LABEL_30:
        v26 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v7 < v26)
        {
          *(_QWORD *)v7 = v43;
          v27 = v7 + 2;
LABEL_54:
          *((_QWORD *)a3 + 1) = v27;
          return;
        }
        v28 = v11 + 1;
        if ((v11 + 1) >> 61)
          sub_1BE61F930();
        v29 = v26 - (_QWORD)v8;
        if (v29 >> 2 > v28)
          v28 = v29 >> 2;
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
          v30 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v30 = v28;
        if (v30)
        {
          if (v30 >> 61)
            sub_1BE61F100();
          v31 = operator new(8 * v30);
        }
        else
        {
          v31 = 0;
        }
        v32 = &v31[8 * v11];
        v33 = &v31[8 * v30];
        *v32 = v43;
        v27 = v32 + 1;
        if (v7 == v8)
        {
LABEL_52:
          *(_QWORD *)a3 = v32;
          *((_QWORD *)a3 + 1) = v27;
          *((_QWORD *)a3 + 2) = v33;
          if (v7)
            operator delete(v7);
          goto LABEL_54;
        }
        v34 = (char *)v7 - (char *)v8 - 8;
        if (v34 >= 0x58)
        {
          if ((char *)v7 - v31 - 8 * v11 >= 0x20)
          {
            v36 = (v34 >> 3) + 1;
            v37 = 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
            v35 = &v7[v37 / 0xFFFFFFFFFFFFFFFCLL];
            v32 = (_QWORD *)((char *)v32 - v37);
            v38 = &v31[8 * v11 - 16];
            v39 = (__int128 *)(v7 - 4);
            v40 = v36 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v41 = *v39;
              *(v38 - 1) = *(v39 - 1);
              *v38 = v41;
              v38 -= 2;
              v39 -= 2;
              v40 -= 4;
            }
            while (v40);
            if (v36 == (v36 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_51;
          }
          else
          {
            v35 = v7;
          }
        }
        else
        {
          v35 = v7;
        }
        do
        {
          v42 = *((_QWORD *)v35 - 1);
          v35 -= 2;
          *--v32 = v42;
        }
        while (v35 != v8);
LABEL_51:
        v7 = *(int **)a3;
        goto LABEL_52;
      }
    }
  }
}

- (id)_applySentenceTransliterationCandidates:(unsigned __int16 *)a3 codesLen:(int)a4 codesMax:(int)a5
{
  uint64_t v8;
  char *v9;
  int v10;
  void **v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  int v18;
  int v19;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = a4;
  MEMORY[0x1E0C80A78](self);
  v9 = (char *)&v17 - v8;
  memcpy((char *)&v17 - v8, a3, 2 * v10);
  if (!self->_icuTransliterator)
  {
    v20 = *(_OWORD *)"S";
    v21[0] = *(_OWORD *)L"ed-Traditional";
    *(_OWORD *)((char *)v21 + 14) = *(_OWORD *)L"itional";
    v11 = (void **)utrans_openU();
    self->_icuTransliterator = v11;
    if (!v11)
    {
      v15 = a4;
      goto LABEL_7;
    }
  }
  LODWORD(v20) = a4;
  utrans_transUChars();
  if (v18 >= 1)
  {
    v15 = v19;
LABEL_7:
    objc_msgSend_stringWithCharacters_length_(MEMORY[0x1E0CB3940], v12, (uint64_t)v9, v15, v13, v14);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_stringWithCharacters_length_(MEMORY[0x1E0CB3940], v12, (uint64_t)a3, v19, v13, v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_applyTransliterationAndSyntheticCandidates:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  _DWORD *v11;
  uint64_t v12;
  float v13;
  char *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  double v18;
  double *v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _BYTE *v25;
  char *v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  char *v30;
  int v31;
  double *v32;
  int64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _BYTE *v38;
  double *v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  _OWORD *v45;
  double *v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  char *v54;
  uint64_t v55;
  __int128 v56;
  int v57;
  char *v58;
  double v59;
  double *v60;
  uint64_t v61;
  char *v62;
  int64_t v63;
  char *v64;
  char *v65;
  _QWORD *v66;
  double *v67;
  int64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  double *v74;
  uint64_t v75;
  int64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double *v80;
  char *v81;
  double *v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  char *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  int64_t v94;
  char *v95;
  char *v96;
  char *v97;
  __int128 v98;
  char *v99;
  char *v100;
  void *v101;
  void *v102;
  char *v103;
  void *v104;
  int64_t v105;
  char *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  char *v118;
  float *v119;
  float v120;
  _QWORD *v122;
  int v123;
  _QWORD **v124;
  _QWORD *v125;
  int v126;
  _QWORD *v127;
  _QWORD *v128;
  BOOL v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  _BYTE *v133;
  int v134;
  uint64_t v135;
  int v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  _BYTE *v148;
  _QWORD *v149;
  char *v150;
  char *v151;
  _QWORD *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  _OWORD *v156;
  char *v157;
  uint64_t v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  void *v164;
  char *v165;
  void *v166;
  void *v167;
  char *v168;
  char *v169;
  void *v170;
  char *v171;
  void *v172;
  void *v173;
  char *v174;
  unint64_t v175;
  uint64_t v178;
  unint64_t v179;
  char *v180;
  char *v181;
  void *__p;
  _BYTE *v183;
  void *v184;
  double *v185;
  double *v186;
  _QWORD *v187;
  _QWORD *v188;
  uint64_t v189;
  void *v190;
  char *v191;
  unint64_t v192;
  void *v193;
  __int128 v194;
  char *v195;
  char *v196;
  __int128 v197;
  char *v198;

  if (self->_transliterationVariantMap)
  {
    v6 = (uint64_t *)a3;
    v193 = 0;
    v194 = 0uLL;
    v190 = 0;
    v191 = 0;
    v192 = 0;
    v188 = 0;
    v189 = 0;
    v187 = &v188;
    v7 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
    if (v7)
    {
      v8 = 0;
      v9 = v7 >> 3;
      if (v9 <= 1)
        v9 = 1;
      v174 = (char *)&v194 + 8;
      v175 = v9;
      while (1)
      {
        v184 = 0;
        v185 = 0;
        v186 = 0;
        VariantMap::VariantsForCode(self->_transliterationVariantMap, *(_DWORD *)(*v6 + 8 * v8), (char **)&__p);
        v10 = v6;
        v180 = 0;
        v181 = 0;
        v11 = __p;
        v12 = *v10;
        v178 = v8;
        if (v183 != __p)
        {
          v13 = *(float *)(v12 + 8 * v8 + 4);
          if (v13 > 0.0)
          {
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = v13;
            while (1)
            {
              if (v16 < v15)
              {
                *(_DWORD *)v16 = v11[v17];
                v16 += 4;
                v181 = v16;
                v20 = v185;
                v19 = v186;
                if (v185 >= v186)
                  goto LABEL_30;
                goto LABEL_12;
              }
              v22 = (v16 - v14) >> 2;
              v23 = v22 + 1;
              if ((unint64_t)(v22 + 1) >> 62)
                sub_1BE61F930();
              if ((v15 - v14) >> 1 > v23)
                v23 = (v15 - v14) >> 1;
              if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFFCLL)
                v24 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v24 = v23;
              if (v24)
              {
                if (v24 >> 62)
                  goto LABEL_218;
                v25 = operator new(4 * v24);
                v26 = &v25[4 * v22];
                *(_DWORD *)v26 = v11[v17];
                v27 = (uint64_t)(v26 + 4);
                v28 = v16 - v14;
                if (v16 == v14)
                  goto LABEL_27;
              }
              else
              {
                v25 = 0;
                v26 = (char *)(4 * v22);
                *(_DWORD *)(4 * v22) = v11[v17];
                v27 = 4 * v22 + 4;
                v28 = v16 - v14;
                if (v16 == v14)
                  goto LABEL_27;
              }
              v29 = v28 - 4;
              if (v29 < 0xBC)
              {
                v30 = v16;
                goto LABEL_26;
              }
              v50 = (v16 - 4 - v14) & 0xFFFFFFFFFFFFFFFCLL;
              if (&v25[v16 - v14 - 4 - v50] > &v25[v16 - v14 - 4])
              {
                v30 = v16;
                do
                {
LABEL_26:
                  v31 = *((_DWORD *)v30 - 1);
                  v30 -= 4;
                  *((_DWORD *)v26 - 1) = v31;
                  v26 -= 4;
                }
                while (v30 != v14);
                goto LABEL_27;
              }
              if (&v16[-v50 - 4] > v16 - 4)
              {
                v30 = v16;
                goto LABEL_26;
              }
              if ((unint64_t)(v14 - v25) < 0x20)
              {
                v30 = v16;
                goto LABEL_26;
              }
              v51 = (v29 >> 2) + 1;
              v52 = 4 * (v51 & 0x7FFFFFFFFFFFFFF8);
              v30 = &v16[-v52];
              v26 -= v52;
              v53 = &v25[4 * v22 - 16];
              v54 = v16 - 16;
              v55 = v51 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v56 = *(_OWORD *)v54;
                *(v53 - 1) = *((_OWORD *)v54 - 1);
                *v53 = v56;
                v53 -= 2;
                v54 -= 32;
                v55 -= 8;
              }
              while (v55);
              if (v51 != (v51 & 0x7FFFFFFFFFFFFFF8))
                goto LABEL_26;
LABEL_27:
              v15 = &v25[4 * v24];
              v180 = v26;
              if (v14)
                operator delete(v14);
              v14 = v26;
              v16 = (char *)v27;
              v181 = (char *)v27;
              v20 = v185;
              v19 = v186;
              if (v185 >= v186)
              {
LABEL_30:
                v32 = (double *)v184;
                v33 = (char *)v20 - (_BYTE *)v184;
                v34 = ((char *)v20 - (_BYTE *)v184) >> 3;
                v35 = v34 + 1;
                if ((unint64_t)(v34 + 1) >> 61)
                  sub_1BE61F930();
                v36 = (char *)v19 - (_BYTE *)v184;
                if (v36 >> 2 > v35)
                  v35 = v36 >> 2;
                if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
                  v37 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v37 = v35;
                if (v37)
                {
                  if (v37 >> 61)
LABEL_218:
                    sub_1BE61F100();
                  v38 = operator new(8 * v37);
                  v39 = (double *)&v38[8 * v34];
                  *v39 = v18;
                  v21 = (uint64_t)(v39 + 1);
                  v40 = (char *)v20 - (char *)v32;
                  if (v20 == v32)
                    goto LABEL_47;
LABEL_41:
                  v41 = v40 - 8;
                  if (v41 < 0x58)
                    goto LABEL_232;
                  if ((unint64_t)((char *)v20 - v38 - v33) < 0x20)
                    goto LABEL_232;
                  v42 = (v41 >> 3) + 1;
                  v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
                  v44 = &v20[v43 / 0xFFFFFFFFFFFFFFF8];
                  v39 = (double *)((char *)v39 - v43);
                  v45 = &v38[8 * v34 - 16];
                  v46 = v20 - 2;
                  v47 = v42 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v48 = *(_OWORD *)v46;
                    *(v45 - 1) = *((_OWORD *)v46 - 1);
                    *v45 = v48;
                    v45 -= 2;
                    v46 -= 4;
                    v47 -= 4;
                  }
                  while (v47);
                  v20 = v44;
                  if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_232:
                    do
                    {
                      v49 = *((_QWORD *)v20-- - 1);
                      *((_QWORD *)v39-- - 1) = v49;
                    }
                    while (v20 != v32);
                  }
                }
                else
                {
                  v38 = 0;
                  v39 = (double *)(8 * v34);
                  *(double *)(8 * v34) = v18;
                  v21 = 8 * v34 + 8;
                  v40 = (char *)v20 - (char *)v32;
                  if (v20 != v32)
                    goto LABEL_41;
                }
LABEL_47:
                v184 = v39;
                v185 = (double *)v21;
                v186 = (double *)&v38[8 * v37];
                if (v32)
                  operator delete(v32);
                goto LABEL_49;
              }
LABEL_12:
              *v20 = v18;
              v21 = (uint64_t)(v20 + 1);
LABEL_49:
              v185 = (double *)v21;
              ++v17;
              v11 = __p;
              if (v17 < (v183 - (_BYTE *)__p) >> 2)
              {
                v18 = v18 + -0.00000011920929;
                if (v18 > 0.0)
                  continue;
              }
              break;
            }
          }
LABEL_64:
          v61 = *((_QWORD *)&v194 + 1);
          v62 = (char *)v194;
          if ((unint64_t)v194 < *((_QWORD *)&v194 + 1))
            goto LABEL_65;
          goto LABEL_89;
        }
        v57 = *(_DWORD *)(v12 + 8 * v8);
        v58 = (char *)operator new(4uLL);
        *(_DWORD *)v58 = v57;
        v181 = v58 + 4;
        v180 = v58;
        v59 = *(float *)(v12 + 8 * v8 + 4);
        v60 = v185;
        if (v185 < v186)
        {
          *v185 = v59;
          v185 = v60 + 1;
          goto LABEL_64;
        }
        v67 = (double *)v184;
        v68 = (char *)v185 - (_BYTE *)v184;
        v69 = ((char *)v185 - (_BYTE *)v184) >> 3;
        v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 61)
          sub_1BE61F930();
        v71 = (char *)v186 - (_BYTE *)v184;
        if (((char *)v186 - (_BYTE *)v184) >> 2 > v70)
          v70 = v71 >> 2;
        v72 = (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v70;
        if (!v72)
          break;
        if (v72 >> 61)
          sub_1BE61F100();
        v73 = (char *)operator new(8 * v72);
        v74 = (double *)&v73[8 * v69];
        *v74 = v59;
        v75 = (uint64_t)(v74 + 1);
        v76 = (char *)v60 - (char *)v67;
        if (v60 != v67)
          goto LABEL_80;
LABEL_86:
        v184 = v74;
        v185 = (double *)v75;
        v186 = (double *)&v73[8 * v72];
        if (v67)
          operator delete(v67);
        v185 = (double *)v75;
        v61 = *((_QWORD *)&v194 + 1);
        v62 = (char *)v194;
        if ((unint64_t)v194 < *((_QWORD *)&v194 + 1))
        {
LABEL_65:
          *(_QWORD *)v62 = 0;
          *((_QWORD *)v62 + 1) = 0;
          *((_QWORD *)v62 + 2) = 0;
          v63 = v181 - v180;
          if (v181 != v180)
          {
            if (v63 < 0)
              sub_1BE61F930();
            v64 = (char *)operator new(v181 - v180);
            *(_QWORD *)v62 = v64;
            *((_QWORD *)v62 + 1) = v64;
            v65 = &v64[4 * (v63 >> 2)];
            *((_QWORD *)v62 + 2) = v65;
            memcpy(v64, v180, v63);
            *((_QWORD *)v62 + 1) = v65;
          }
          v66 = v62 + 24;
          goto LABEL_112;
        }
LABEL_89:
        v86 = (char *)v193;
        v87 = 0xAAAAAAAAAAAAAAABLL * ((v62 - (_BYTE *)v193) >> 3);
        v88 = v87 + 1;
        if (v87 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_1BE61F930();
        v89 = 0xAAAAAAAAAAAAAAABLL * ((v61 - (uint64_t)v193) >> 3);
        if (2 * v89 > v88)
          v88 = 2 * v89;
        if (v89 >= 0x555555555555555)
          v90 = 0xAAAAAAAAAAAAAAALL;
        else
          v90 = v88;
        v198 = (char *)&v194 + 8;
        if (v90)
        {
          if (v90 > 0xAAAAAAAAAAAAAAALL)
            sub_1BE61F100();
          v91 = (char *)operator new(24 * v90);
        }
        else
        {
          v91 = 0;
        }
        v92 = &v91[24 * v87];
        v195 = v91;
        v196 = v92;
        v93 = &v91[24 * v90];
        *((_QWORD *)v92 + 1) = 0;
        *(_QWORD *)&v197 = v92;
        *((_QWORD *)&v197 + 1) = v93;
        *((_QWORD *)v92 + 2) = 0;
        *(_QWORD *)v92 = 0;
        v94 = v181 - v180;
        if (v181 != v180)
        {
          if (v94 < 0)
            sub_1BE61F930();
          v95 = (char *)operator new(v94);
          *(_QWORD *)v92 = v95;
          v96 = &v95[4 * (v94 >> 2)];
          *((_QWORD *)v92 + 2) = v96;
          memcpy(v95, v180, v94);
          *((_QWORD *)v92 + 1) = v96;
        }
        v66 = v92 + 24;
        *(_QWORD *)&v197 = v92 + 24;
        if (v62 == v86)
        {
          v193 = v92;
          *(_QWORD *)&v194 = v92 + 24;
          *((_QWORD *)&v194 + 1) = v93;
        }
        else
        {
          do
          {
            v97 = v92;
            *((_QWORD *)v92 - 2) = 0;
            *((_QWORD *)v92 - 1) = 0;
            v98 = *(_OWORD *)(v62 - 24);
            v62 -= 24;
            *(_OWORD *)(v92 - 24) = v98;
            v92 -= 24;
            *((_QWORD *)v97 - 1) = *((_QWORD *)v62 + 2);
            *(_QWORD *)v62 = 0;
            *((_QWORD *)v62 + 1) = 0;
            *((_QWORD *)v62 + 2) = 0;
          }
          while (v62 != v86);
          v62 = (char *)v193;
          v99 = (char *)v194;
          v193 = v92;
          v194 = v197;
          v66 = (_QWORD *)v197;
          if (v99 != v62)
          {
            v100 = v99;
            do
            {
              v102 = (void *)*((_QWORD *)v100 - 3);
              v100 -= 24;
              v101 = v102;
              if (v102)
              {
                *((_QWORD *)v99 - 2) = v101;
                operator delete(v101);
              }
              v99 = v100;
            }
            while (v100 != v62);
          }
        }
        if (v62)
          operator delete(v62);
LABEL_112:
        *(_QWORD *)&v194 = v66;
        v103 = v191;
        if ((unint64_t)v191 < v192)
        {
          *(_QWORD *)v191 = 0;
          *((_QWORD *)v103 + 1) = 0;
          *((_QWORD *)v103 + 2) = 0;
          v104 = v184;
          v105 = (char *)v185 - (_BYTE *)v184;
          v6 = (uint64_t *)a3;
          if (v185 != v184)
          {
            if (v105 < 0)
              sub_1BE61F930();
            v106 = (char *)operator new((char *)v185 - (_BYTE *)v184);
            *(_QWORD *)v103 = v106;
            *((_QWORD *)v103 + 1) = v106;
            v107 = &v106[8 * (v105 >> 3)];
            *((_QWORD *)v103 + 2) = v107;
            memcpy(v106, v104, v105);
            *((_QWORD *)v103 + 1) = v107;
          }
          v191 = v103 + 24;
          v109 = v178;
          v108 = v180;
          if (!v180)
            goto LABEL_120;
LABEL_119:
          operator delete(v108);
          goto LABEL_120;
        }
        v6 = (uint64_t *)a3;
        v191 = sub_1BE671CD8((char **)&v190, (uint64_t)&v184);
        v109 = v178;
        v108 = v180;
        if (v180)
          goto LABEL_119;
LABEL_120:
        if (__p)
        {
          v183 = __p;
          operator delete(__p);
        }
        if (v184)
        {
          v185 = (double *)v184;
          operator delete(v184);
        }
        v8 = v109 + 1;
        if (v8 == v175)
          goto LABEL_124;
      }
      v73 = 0;
      v74 = (double *)(8 * v69);
      *(double *)(8 * v69) = v59;
      v75 = 8 * v69 + 8;
      v76 = (char *)v60 - (char *)v67;
      if (v60 == v67)
        goto LABEL_86;
LABEL_80:
      v77 = v76 - 8;
      if (v77 < 0x58)
        goto LABEL_233;
      if ((unint64_t)((char *)v60 - v73 - v68) < 0x20)
        goto LABEL_233;
      v78 = (v77 >> 3) + 1;
      v79 = 8 * (v78 & 0x3FFFFFFFFFFFFFFCLL);
      v80 = &v60[v79 / 0xFFFFFFFFFFFFFFF8];
      v74 = (double *)((char *)v74 - v79);
      v81 = &v73[8 * v69 - 16];
      v82 = v60 - 2;
      v83 = v78 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v84 = *(_OWORD *)v82;
        *((_OWORD *)v81 - 1) = *((_OWORD *)v82 - 1);
        *(_OWORD *)v81 = v84;
        v81 -= 32;
        v82 -= 4;
        v83 -= 4;
      }
      while (v83);
      v60 = v80;
      if (v78 != (v78 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_233:
        do
        {
          v85 = *((_QWORD *)v60-- - 1);
          *((_QWORD *)v74-- - 1) = v85;
        }
        while (v60 != v67);
      }
      goto LABEL_86;
    }
LABEL_124:
    v179 = objc_msgSend__effectiveMaxRecognitionResultCount(self, a2, (uint64_t)a3, v3, v4, v5, v174);
    v110 = v193;
    v111 = v194;
    if ((void *)v194 != v193 && v179)
    {
      v112 = 0;
      v113 = 0;
      while (1)
      {
        v115 = v110[3 * v113];
        if (v110[3 * v113 + 1] != v115)
          break;
LABEL_128:
        if (++v113 >= 0xAAAAAAAAAAAAAAABLL * ((v111 - (uint64_t)v110) >> 3) || v112 >= v179)
          goto LABEL_201;
      }
      v116 = 0;
      while (1)
      {
        v122 = v188;
        v123 = *(_DWORD *)(v115 + 4 * v116);
        v124 = &v188;
LABEL_143:
        v125 = v124;
        if (v122)
        {
          do
          {
            v124 = (_QWORD **)v122;
            v126 = *((_DWORD *)v122 + 7);
            if (v123 < v126)
            {
              v122 = *v124;
              goto LABEL_143;
            }
            if (v126 >= v123)
              goto LABEL_137;
            v122 = v124[1];
          }
          while (v122);
          v125 = v124 + 1;
        }
        v127 = operator new(0x20uLL);
        *((_DWORD *)v127 + 7) = v123;
        *v127 = 0;
        v127[1] = 0;
        v127[2] = v124;
        *v125 = v127;
        if (*v187)
        {
          v187 = (_QWORD *)*v187;
          v127 = (_QWORD *)*v125;
        }
        v128 = v188;
        v129 = v127 == v188;
        *((_BYTE *)v127 + 24) = v127 == v188;
        if (!v129)
        {
          do
          {
            v130 = v127[2];
            if (*(_BYTE *)(v130 + 24))
              break;
            v131 = *(_QWORD **)(v130 + 16);
            v132 = *v131;
            if (*v131 == v130)
            {
              v135 = v131[1];
              if (!v135 || (v136 = *(unsigned __int8 *)(v135 + 24), v133 = (_BYTE *)(v135 + 24), v136))
              {
                if (*(_QWORD **)v130 == v127)
                {
                  *(_BYTE *)(v130 + 24) = 1;
                  *((_BYTE *)v131 + 24) = 0;
                  v139 = *(_QWORD *)(v130 + 8);
                  *v131 = v139;
                  if (v139)
                    goto LABEL_165;
                }
                else
                {
                  v137 = *(uint64_t **)(v130 + 8);
                  v138 = *v137;
                  *(_QWORD *)(v130 + 8) = *v137;
                  if (v138)
                  {
                    *(_QWORD *)(v138 + 16) = v130;
                    v131 = *(_QWORD **)(v130 + 16);
                  }
                  v137[2] = (uint64_t)v131;
                  *(_QWORD *)(*(_QWORD *)(v130 + 16) + 8 * (**(_QWORD **)(v130 + 16) != v130)) = v137;
                  *v137 = v130;
                  *(_QWORD *)(v130 + 16) = v137;
                  v131 = (_QWORD *)v137[2];
                  v130 = *v131;
                  *((_BYTE *)v137 + 24) = 1;
                  *((_BYTE *)v131 + 24) = 0;
                  v139 = *(_QWORD *)(v130 + 8);
                  *v131 = v139;
                  if (v139)
LABEL_165:
                    *(_QWORD *)(v139 + 16) = v131;
                }
                *(_QWORD *)(v130 + 16) = v131[2];
                *(_QWORD *)(v131[2] + 8 * (*(_QWORD *)v131[2] != (_QWORD)v131)) = v130;
                *(_QWORD *)(v130 + 8) = v131;
LABEL_171:
                v131[2] = v130;
                break;
              }
            }
            else if (!v132 || (v134 = *(unsigned __int8 *)(v132 + 24), v133 = (_BYTE *)(v132 + 24), v134))
            {
              if (*(_QWORD **)v130 == v127)
              {
                v161 = v127[1];
                *(_QWORD *)v130 = v161;
                if (v161)
                {
                  *(_QWORD *)(v161 + 16) = v130;
                  v131 = *(_QWORD **)(v130 + 16);
                }
                v127[2] = v131;
                *(_QWORD *)(*(_QWORD *)(v130 + 16) + 8 * (**(_QWORD **)(v130 + 16) != v130)) = v127;
                v127[1] = v130;
                *(_QWORD *)(v130 + 16) = v127;
                v131 = (_QWORD *)v127[2];
                *((_BYTE *)v127 + 24) = 1;
                *((_BYTE *)v131 + 24) = 0;
                v130 = v131[1];
                v140 = *(_QWORD **)v130;
                v131[1] = *(_QWORD *)v130;
                if (v140)
LABEL_169:
                  v140[2] = v131;
              }
              else
              {
                *(_BYTE *)(v130 + 24) = 1;
                *((_BYTE *)v131 + 24) = 0;
                v130 = v131[1];
                v140 = *(_QWORD **)v130;
                v131[1] = *(_QWORD *)v130;
                if (v140)
                  goto LABEL_169;
              }
              *(_QWORD *)(v130 + 16) = v131[2];
              *(_QWORD *)(v131[2] + 8 * (*(_QWORD *)v131[2] != (_QWORD)v131)) = v130;
              *(_QWORD *)v130 = v131;
              goto LABEL_171;
            }
            *(_BYTE *)(v130 + 24) = 1;
            v127 = v131;
            *((_BYTE *)v131 + 24) = v131 == v128;
            *v133 = 1;
          }
          while (v131 != v128);
        }
        ++v189;
        v118 = (char *)*v6;
        v141 = (char *)v6[1];
        v142 = (uint64_t)&v141[-*v6];
        v143 = v142 >> 3;
        if (v142 >> 3 > v112)
          goto LABEL_136;
        v144 = v6[2];
        if ((unint64_t)v141 < v144)
        {
          *(_QWORD *)v141 = 0;
          v117 = v141 + 8;
          goto LABEL_135;
        }
        v145 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 61)
          sub_1BE61F930();
        v146 = v144 - (_QWORD)v118;
        if (v146 >> 2 > v145)
          v145 = v146 >> 2;
        v147 = (unint64_t)v146 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v145;
        if (v147)
        {
          if (v147 >> 61)
            sub_1BE61F100();
          v148 = operator new(8 * v147);
          v149 = &v148[8 * v143];
          *v149 = 0;
          v150 = (char *)(v141 - v118);
          if (v141 == v118)
          {
LABEL_186:
            v117 = v149 + 1;
            *(_QWORD *)a3 = v149;
            *((_QWORD *)a3 + 1) = v149 + 1;
            *((_QWORD *)a3 + 2) = &v148[8 * v147];
            v6 = (uint64_t *)a3;
            if (!v141)
              goto LABEL_135;
LABEL_194:
            operator delete(v141);
            goto LABEL_135;
          }
        }
        else
        {
          v148 = 0;
          v149 = (_QWORD *)(8 * v143);
          *(_QWORD *)(8 * v143) = 0;
          v150 = (char *)(v141 - v118);
          if (v141 == v118)
            goto LABEL_186;
        }
        v151 = v150 - 8;
        if ((unint64_t)(v150 - 8) < 0x58)
          break;
        v152 = v149;
        if ((unint64_t)(v141 - v148 - v142) < 0x20)
          goto LABEL_192;
        v153 = ((unint64_t)v151 >> 3) + 1;
        v154 = 8 * (v153 & 0x3FFFFFFFFFFFFFFCLL);
        v155 = &v141[-v154];
        v152 = &v149[v154 / 0xFFFFFFFFFFFFFFF8];
        v156 = &v148[8 * v143 - 16];
        v157 = v141 - 16;
        v158 = v153 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v159 = *(_OWORD *)v157;
          *(v156 - 1) = *((_OWORD *)v157 - 1);
          *v156 = v159;
          v156 -= 2;
          v157 -= 32;
          v158 -= 4;
        }
        while (v158);
        v141 = v155;
        if (v153 != (v153 & 0x3FFFFFFFFFFFFFFCLL))
          goto LABEL_192;
LABEL_193:
        v141 = *(char **)a3;
        v117 = v149 + 1;
        *(_QWORD *)a3 = v152;
        *((_QWORD *)a3 + 1) = v149 + 1;
        *((_QWORD *)a3 + 2) = &v148[8 * v147];
        v6 = (uint64_t *)a3;
        if (v141)
          goto LABEL_194;
LABEL_135:
        v6[1] = (uint64_t)v117;
        v118 = (char *)*v6;
LABEL_136:
        v110 = v193;
        v115 = *((_QWORD *)v193 + 3 * v113);
        v119 = (float *)&v118[8 * v112];
        *v119 = *(float *)(v115 + 4 * v116);
        v120 = *(double *)(*((_QWORD *)v190 + 3 * v113) + 8 * v116);
        v119[1] = v120;
        ++v112;
LABEL_137:
        if (++v116 >= (unint64_t)((v110[3 * v113 + 1] - v115) >> 2) || v112 >= v179)
        {
          v111 = v194;
          goto LABEL_128;
        }
      }
      v152 = v149;
      do
      {
LABEL_192:
        v160 = *((_QWORD *)v141 - 1);
        v141 -= 8;
        *--v152 = v160;
      }
      while (v141 != v118);
      goto LABEL_193;
    }
LABEL_201:
    sub_1BE671438(v188);
    v162 = (char *)v190;
    if (v190)
    {
      v163 = v191;
      v164 = v190;
      if (v191 != v190)
      {
        v165 = v191;
        do
        {
          v167 = (void *)*((_QWORD *)v165 - 3);
          v165 -= 24;
          v166 = v167;
          if (v167)
          {
            *((_QWORD *)v163 - 2) = v166;
            operator delete(v166);
          }
          v163 = v165;
        }
        while (v165 != v162);
        v164 = v190;
      }
      v191 = v162;
      operator delete(v164);
    }
    v168 = (char *)v193;
    if (v193)
    {
      v169 = (char *)v194;
      v170 = v193;
      if ((void *)v194 != v193)
      {
        v171 = (char *)v194;
        do
        {
          v173 = (void *)*((_QWORD *)v171 - 3);
          v171 -= 24;
          v172 = v173;
          if (v173)
          {
            *((_QWORD *)v169 - 2) = v172;
            operator delete(v172);
          }
          v169 = v171;
        }
        while (v171 != v168);
        v170 = v193;
      }
      *(_QWORD *)&v194 = v168;
      operator delete(v170);
    }
  }
}

- (void)_rescoreCandidatesWithLanguageModel:(void *)a3 history:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  void *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE65F700;
  v8[3] = &unk_1E77F28E0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  sub_1BE63EFDC((uint64_t)self, v8);

}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE66059C;
  v3[3] = &unk_1E77F24A0;
  v3[4] = self;
  v3[5] = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (unint64_t)_effectiveMaxRecognitionResultCount
{
  if (self->_maxRecognitionResultCount)
    return self->_maxRecognitionResultCount;
  else
    return ((uint64_t (*)(CHRecognizerConfiguration *, char *))MEMORY[0x1E0DE7D20])(self->_configuration, sel_maxRecognitionResultDefaultCount);
}

- (CGSize)minimumDrawingSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  void *v12;
  CGSize result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x4012000000;
  v10 = sub_1BE660688;
  v11 = nullsub_3;
  v12 = &unk_1BE94989A;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE660698;
  v6[3] = &unk_1E77F23B0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1BE63EFDC((uint64_t)self, v6);
  v2 = v8[6];
  v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  _QWORD v3[5];
  CGSize v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE660704;
  v3[3] = &unk_1E77F2478;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (void)setRecognitionType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE66076C;
  v3[3] = &unk_1E77F2908;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (int)recognitionMode
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE660AE0;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setRecognitionMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE660B6C;
  v3[3] = &unk_1E77F2908;
  v4 = a3;
  v3[4] = self;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (void)_setConfiguration:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CHRecognizerConfiguration *configuration;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char hasSamePostProcessingAsConfiguration;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  CHRecognizer *v29;

  v5 = a3;
  if ((objc_msgSend_isEqualToRecognizerConfiguration_(self->_configuration, v6, (uint64_t)v5, v7, v8, v9) & 1) == 0)
  {
    configuration = self->_configuration;
    if (configuration
      && objc_msgSend_hasSameResourcesAsConfiguration_(configuration, v10, (uint64_t)v5, v11, v12, v13))
    {
      hasSamePostProcessingAsConfiguration = objc_msgSend_hasSamePostProcessingAsConfiguration_(self->_configuration, v15, (uint64_t)v5, v16, v17, v18);
      objc_storeStrong((id *)&self->_configuration, a3);
      if ((hasSamePostProcessingAsConfiguration & 1) == 0)
      {
        v25 = MEMORY[0x1E0C809B0];
        v26 = 3221225472;
        v27 = sub_1BE6403AC;
        v28 = &unk_1E77F1F38;
        v29 = self;
        sub_1BE63EFDC((uint64_t)self, &v25);
        if (self->_mergedResultPostProcessor)
          objc_msgSend__initializeMergedResultPostProcessor(self, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_configuration, a3);
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = sub_1BE63FBC8;
      v28 = &unk_1E77F1F38;
      v29 = self;
      sub_1BE63EFDC((uint64_t)self, &v25);
    }
  }

}

- (NSLocale)locale
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE63EF8C;
  v9 = sub_1BE63EF9C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE6610C8;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSLocale *)v2;
}

- (void)setLocale:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE661194;
  v6[3] = &unk_1E77F2428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v6);

}

- (void)setActiveCharacterSet:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE661508;
  v6[3] = &unk_1E77F2428;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v6);

}

- (int)contentType
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE6615C8;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setContentType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE661654;
  v3[3] = &unk_1E77F2908;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (int)autoCapitalizationMode
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE66186C;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE6618F8;
  v3[3] = &unk_1E77F2908;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (int)autoCorrectionMode
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE661B10;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setAutoCorrectionMode:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE661B9C;
  v3[3] = &unk_1E77F2908;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (int)baseWritingDirection
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE661DB4;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setBaseWritingDirection:(int)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE661E3C;
  v3[3] = &unk_1E77F24A0;
  v3[4] = self;
  v3[5] = *(_QWORD *)&a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (BOOL)enableCachingIfAvailable
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE662050;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableCachingIfAvailable:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE6620DC;
  v3[3] = &unk_1E77F2930;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (BOOL)enableGen2ModelIfAvailable
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE6622FC;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableGen2ModelIfAvailable:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE662388;
  v3[3] = &unk_1E77F2930;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE6625A8;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1BE662634;
  v3[3] = &unk_1E77F2930;
  v3[4] = self;
  v4 = a3;
  sub_1BE63EFDC((uint64_t)self, v3);
}

- (int)recognitionType
{
  return self->_recognitionType;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (NSCharacterSet)activeCharacterSet
{
  return self->_activeCharacterSet;
}

- (CHSpellChecker)spellChecker
{
  return self->_spellChecker;
}

- (void)setSpellChecker:(id)a3
{
  objc_storeStrong((id *)&self->_spellChecker, a3);
}

- (_LXLexicon)customPhraseLexicon
{
  return self->_customPhraseLexicon;
}

- (NSDictionary)textReplacements
{
  return self->_textReplacements;
}

- (CHPostProcessingManager)postProcessor
{
  return self->_postProcessor;
}

- (void)setPostProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_postProcessor, a3);
}

- (CHPostProcessingManager)mergedResultPostProcessor
{
  return self->_mergedResultPostProcessor;
}

- (void)setMergedResultPostProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_mergedResultPostProcessor, a3);
}

- (CHRecognizerConfiguration)configuration
{
  return self->_configuration;
}

- (CHMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraWrapper, a3);
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_staticLexicon = a3;
}

- (void)wordLanguageModel
{
  return self->_wordLanguageModel;
}

- (void)setWordLanguageModel:(void *)a3
{
  self->_wordLanguageModel = a3;
}

- (CHStringOVSChecker)ovsStringChecker
{
  return self->_ovsStringChecker;
}

- (void)setOvsStringChecker:(id)a3
{
  objc_storeStrong((id *)&self->_ovsStringChecker, a3);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  _QWORD *v4;
  _QWORD *end;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  sub_1BE62033C((uint64_t)&self->_characterIDMap, (_QWORD *)self->_characterIDMap.__tree_.__pair1_.__value_.__left_);
  sub_1BE66D224((_QWORD *)self->_cachedResults.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mergedResultPostProcessor, 0);
  objc_storeStrong((id *)&self->_postProcessor, 0);
  objc_storeStrong((id *)&self->_textReplacements, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_lastCharacterSegmentIndexes, 0);
  objc_storeStrong((id *)&self->_cachedDrawing, 0);
  objc_storeStrong((id *)&self->_learningDictionaryURL, 0);
  objc_storeStrong((id *)&self->_textReplacementLowercasedKeyMapping, 0);
  objc_storeStrong((id *)&self->_postProcessingFST, 0);
  objc_storeStrong((id *)&self->_patternFST, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_legacyTextDecoder, 0);
  objc_storeStrong((id *)&self->_recognitionModel, 0);
  objc_storeStrong((id *)&self->_cornerDetector, 0);
  objc_storeStrong((id *)&self->_activeCharacterSet, 0);
  if (self->_textDecoder.__engaged_)
  {
    self->_textDecoder.var0.__val_._vptr$AbstractCTCDecoder = (void **)&off_1E77F1038;
    self->_textDecoder.var0.__val_.pathBuilder_._vptr$AbstractResultPathBuilder = (void **)&off_1E77F1118;
    begin = self->_textDecoder.var0.__val_.pathBuilder_.spaceLabels_.__begin_;
    if (begin)
    {
      self->_textDecoder.var0.__val_.pathBuilder_.spaceLabels_.__end_ = begin;
      operator delete(begin);
    }
    self->_textDecoder.var0.__val_.beamScorer_._vptr$BaseBeamScorer = (void **)&off_1E77F1160;
    v4 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
    if (v4)
    {
      end = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__end_;
      v6 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
      if (end != v4)
      {
        do
        {
          v8 = *--end;
          v7 = v8;
          *end = 0;
          if (v8)
            (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
        }
        while (end != v4);
        v6 = self->_textDecoder.var0.__val_.beamScorer_.scorers_.__begin_;
      }
      self->_textDecoder.var0.__val_.beamScorer_.scorers_.__end_ = v4;
      operator delete(v6);
    }
  }
  objc_storeStrong((id *)&self->_whitelistMecabraRareCharacters, 0);
  objc_storeStrong((id *)&self->_activeRecognitionInsight, 0);
  objc_storeStrong((id *)&self->_nextRecognitionInsightRequest, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 32) = 0;
  *((_BYTE *)self + 192) = 0;
  *(_OWORD *)((char *)self + 520) = 0u;
  *((_QWORD *)self + 64) = (char *)self + 520;
  *((_OWORD *)self + 34) = 0u;
  *((_QWORD *)self + 67) = (char *)self + 544;
  return self;
}

- (void)recordInsightWithRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CHRecognizer *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1BE662AD0;
  v6[3] = &unk_1E77F2428;
  v7 = v4;
  v8 = self;
  v5 = v4;
  sub_1BE63EFDC((uint64_t)self, v6);

}

- (CHRecognitionInsight)recordedInsightFromLastRequest
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE63EF8C;
  v9 = sub_1BE63EF9C;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BE662BB4;
  v4[3] = &unk_1E77F23B0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1BE63EFDC((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CHRecognitionInsight *)v2;
}

@end
