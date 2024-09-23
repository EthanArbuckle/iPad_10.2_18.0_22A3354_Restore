@implementation _NSLexiconMorphunDictionary

- (_NSLexiconMorphunDictionary)initWithLanguage:(id)a3
{
  _NSLexiconMorphunDictionary *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  CFTypeRef cf;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  CFTypeRef v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_NSLexiconMorphunDictionary;
  v4 = -[_NSLexiconMorphunDictionary init](&v18, sel_init);
  if (v4)
  {
    if (qword_1ECD09EF8 != -1)
      dispatch_once(&qword_1ECD09EF8, &__block_literal_global_30);
    if (!off_1ECD09DC8 || !_NSRequiresMorphunInflectionForLanguageIdentifier(a3))
      goto LABEL_49;
    if (qword_1ECD09EF8 != -1)
      dispatch_once(&qword_1ECD09EF8, &__block_literal_global_30);
    if (!off_1ECD09DC8)
      __assert_rtn("_NSLexiconGetMorphunAnalyzerFactory", "NSLexiconMorphun.m", 564, "_NSLexiconLoadMorphunIfNeeded()");
    if (qword_1ECD09F40 != -1)
      dispatch_once(&qword_1ECD09F40, &__block_literal_global_273);
    v5 = qword_1ECD09F38;
    if (!qword_1ECD09F38)
      goto LABEL_49;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
    if (v6)
    {
      cf = 0;
      v7 = off_1ECD09E20(v5, v6, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v8 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v20 = a3;
          v21 = 2114;
          v22 = cf;
          _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Getting analyzer from factory): %{public}@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      if (v7)
      {
        cf = 0;
        v9 = off_1ECD09E28(v6, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v10 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v20 = a3;
            v21 = 2114;
            v22 = cf;
            _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Creating a tokenizer): %{public}@", buf, 0x16u);
          }
          CFRelease(cf);
        }
        cf = 0;
        off_1ECD09E30(v9, 2, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v11 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v20 = a3;
            v21 = 2114;
            v22 = cf;
            _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Setting the tokenizer to use the unmodified style): %{public}@", buf, 0x16u);
          }
          CFRelease(cf);
          off_1ECD09E38(v9);
          v12 = 0;
          v9 = 0;
        }
        else
        {
          if (v9)
          {
            cf = 0;
            v13 = off_1ECD09E40(v6, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1)
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              v15 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v20 = a3;
                v21 = 2114;
                v22 = cf;
                _os_log_error_impl(&dword_1817D9000, v15, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Getting the dictionary for this locale): %{public}@", buf, 0x16u);
              }
              CFRelease(cf);
            }
            v12 = 1;
            goto LABEL_44;
          }
          v12 = 0;
        }
        v13 = 0;
LABEL_44:
        v14 = 1;
        goto LABEL_45;
      }
      v12 = 0;
      v9 = 0;
    }
    else
    {
      v12 = 0;
      v9 = 0;
      v7 = 0;
    }
    v14 = 0;
    v13 = 0;
LABEL_45:
    v4->_languageCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "copy");
    if (v12 && v14 && v13)
    {
      v4->_analyzer = (MANAConfigurableAnalyzer *)v7;
      v4->_tokenizer = (MTokenizer *)v9;
      v4->_dictionary = (const MDDictionaryMetaData *)v13;
      v4->_appropriateLocale = (NSLocale *)objc_msgSend(v6, "copy");
      return v4;
    }
LABEL_49:

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  MTokenizer *tokenizer;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  tokenizer = self->_tokenizer;
  if (tokenizer)
    off_1ECD09E38(tokenizer);

  v4.receiver = self;
  v4.super_class = (Class)_NSLexiconMorphunDictionary;
  -[_NSLexiconMorphunDictionary dealloc](&v4, sel_dealloc);
}

- (id)allPossibleWordAttributesForWord:(id)a3
{
  NSLocale *appropriateLocale;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  appropriateLocale = self->_appropriateLocale;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke;
  v7[3] = &unk_1E0F4FA78;
  v7[4] = self;
  v7[5] = &v8;
  _NSLexiconIterateFormsOfWord(a3, (uint64_t)appropriateLocale, (uint64_t)v7);
  v4 = (void *)v9[5];
  if (v4)
    v5 = v4;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)preferredPronoun:(id)a3 forTermOfAddress:(id)a4 morphology:(id)a5 dependency:(id)a6
{
  id result;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  __CFArray *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const void *v34;
  const void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  char v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  CFTypeRef v67;
  const void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  __CFArray *theArray;
  void *obj;
  uint64_t obja;
  uint64_t v86;
  uint64_t v87;
  CFTypeRef cf;
  _BYTE v89[128];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  CFTypeRef v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09EF8 != -1)
    dispatch_once(&qword_1ECD09EF8, &__block_literal_global_30);
  if (!off_1ECD09DC8)
    return 0;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", -[_NSLexiconMorphunDictionary languageCode](self, "languageCode"));
  if (result)
  {
    v12 = result;
    cf = 0;
    v13 = off_1ECD09DC8(&cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getDefaultCommonConceptFactoryProvider(&error)";
      v106 = 2112;
      v107 = cf;
LABEL_27:
      _os_log_error_impl(&dword_1817D9000, v14, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_9:
      CFRelease(cf);
LABEL_10:
      v15 = 0;
      return v15;
    }
    if (!v13)
      goto LABEL_10;
    cf = 0;
    v16 = off_1ECD09DD0(v13, v12, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getCommonConceptFactory(provider, (CFLocaleRef)locale, &error)";
      v106 = 2112;
      v107 = cf;
      goto LABEL_27;
    }
    if (!v16)
      goto LABEL_10;
    cf = 0;
    v17 = off_1ECD09DD8(v16, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136315394;
      v105 = "mccf_getSemanticFeatureModel(factory, &error)";
      v106 = 2112;
      v107 = cf;
      goto LABEL_27;
    }
    v18 = v17;
    if (!v17)
      goto LABEL_10;
    cf = 0;
    v19 = off_1ECD09E98(v17, a3, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_createFromInitialPronoun(model, (CFStringRef)original, &error)";
      v106 = 2112;
      v107 = cf;
      goto LABEL_27;
    }
    v20 = v19;
    if (!v19)
      goto LABEL_10;
    v86 = v18;
    cf = 0;
    v21 = off_1ECD09EA0(v19, &cf);
    v22 = (void (**)(_QWORD))&metadata instantiation cache for protocol conformance descriptor for Calendar.Identifier;
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v23 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_toSemanticFeatureConcept(pronoun, &error)";
      v106 = 2112;
      v107 = cf;
LABEL_65:
      _os_log_error_impl(&dword_1817D9000, v23, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_39:
      CFRelease(cf);
LABEL_40:
      v15 = 0;
      v24 = 0;
      v25 = v20;
      goto LABEL_41;
    }
    v26 = v21;
    if (!v21)
      goto LABEL_40;
    v79 = a3;
    v80 = v12;
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress feminine](NSTermOfAddress, "feminine")))
    {
      cf = 0;
      off_1ECD09EA8(v26, CFSTR("gender"), CFSTR("feminine"), &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v23 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, CFSTR(\"gender\"), CFSTR(\"feminine\"), &error)";
        v106 = 2112;
        v107 = cf;
        goto LABEL_65;
      }
      v87 = v26;
      v82 = v20;
LABEL_89:
      v81 = 0;
      theArray = 0;
      v78 = 0;
      if (!a5)
        goto LABEL_103;
LABEL_90:
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v38 = (void *)objc_msgSend(a5, "_morphunConstraints", v76);
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v91;
        do
        {
          v42 = 0;
          do
          {
            if (*(_QWORD *)v91 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v42);
            v44 = objc_msgSend((id)objc_msgSend(a5, "_morphunConstraints"), "objectForKeyedSubscript:", v43);
            cf = 0;
            off_1ECD09EA8(v87, v43, v44, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1)
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              v45 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, (__bridge CFStringRef)grammeme, (__bridge"
                       " CFStringRef)value, &error)";
                v106 = 2112;
                v107 = cf;
                _os_log_error_impl(&dword_1817D9000, v45, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
              }
              CFRelease(cf);
            }
            ++v42;
          }
          while (v40 != v42);
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
        }
        while (v40);
      }
LABEL_103:
      cf = 0;
      v46 = off_1ECD09ED0(v87, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v47 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          goto LABEL_107;
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_isExists(pronounSemanticFeatureConcept, &error)";
        v106 = 2112;
        v107 = cf;
LABEL_137:
        _os_log_error_impl(&dword_1817D9000, v47, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_107:
        CFRelease(cf);
LABEL_188:
        v15 = 0;
        goto LABEL_189;
      }
      if ((v46 & 1) == 0)
        goto LABEL_188;
      if (a6)
      {
        cf = 0;
        v48 = off_1ECD09DE0(a6, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v47 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_107;
          *(_DWORD *)buf = 136315394;
          v105 = "mss_create((CFStringRef)dependency, &error)";
          v106 = 2112;
          v107 = cf;
          goto LABEL_137;
        }
        v51 = v48;
        if (!v48)
          goto LABEL_188;
        cf = 0;
        v52 = off_1ECD09DE8(v86, v48, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v53 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v105 = "minf_create(model, dependencySpeakableString, &error)";
            v106 = 2112;
            v107 = cf;
            _os_log_error_impl(&dword_1817D9000, v53, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
          }
          CFRelease(cf);
          goto LABEL_135;
        }
        v70 = v52;
        if (!v52)
        {
LABEL_135:
          off_1ECD09E10(v51);
          goto LABEL_188;
        }
        cf = 0;
        v71 = off_1ECD09ED8(v52, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v72 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_186;
          *(_DWORD *)buf = 136315394;
          v105 = "minf_toSemanticFeatureConcept(dependencyInflectableStringConcept, &error)";
          v106 = 2112;
          v107 = cf;
LABEL_214:
          _os_log_error_impl(&dword_1817D9000, v72, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_186:
          CFRelease(cf);
LABEL_187:
          off_1ECD09E10(v51);
          off_1ECD09E18(v70);
          goto LABEL_188;
        }
        if (!v71)
          goto LABEL_187;
        cf = 0;
        v75 = off_1ECD09EE0(v87, v71, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v72 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_186;
          *(_DWORD *)buf = 136315394;
          v105 = "msfc_toSpeakableStringWithDependencyCopy(pronounSemanticFeatureConcept, dependencySemanticFeatureConcept, &error)";
          v106 = 2112;
          v107 = cf;
          goto LABEL_214;
        }
        v54 = v75;
        if (!v75)
          goto LABEL_187;
        off_1ECD09E10(v51);
        off_1ECD09E18(v70);
      }
      else
      {
        cf = 0;
        v50 = off_1ECD09EE8(v87, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v47 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
            goto LABEL_107;
          *(_DWORD *)buf = 136315394;
          v105 = "msfc_toSpeakableStringCopy(pronounSemanticFeatureConcept, &error)";
          v106 = 2112;
          v107 = cf;
          goto LABEL_137;
        }
        v54 = v50;
        if (!v50)
          goto LABEL_188;
      }
      cf = 0;
      v55 = off_1ECD09E08(v54, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v56 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v105 = "(NSString *)mss_createPrintCopy(speakableResult, &error)";
          v106 = 2112;
          v107 = cf;
          _os_log_error_impl(&dword_1817D9000, v56, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      else
      {
        v73 = (void *)v55;
        if (v55)
        {
          if (v81 && !objc_msgSend(a4, "_containsPronoun:withGrammemes:", v55, v78))
          {
            v73 = 0;
            v15 = 0;
          }
          else
          {
            if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "lowercaseStringWithLocale:", v80, v76)))
            {
              v74 = (void *)objc_msgSend(v73, "lowercaseStringWithLocale:", v80);
            }
            else if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "uppercaseStringWithLocale:", v80)))
            {
              v74 = (void *)objc_msgSend(v73, "uppercaseStringWithLocale:", v80);
            }
            else if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "capitalizedStringWithLocale:", v80)))
            {
              v74 = (void *)objc_msgSend(v73, "capitalizedStringWithLocale:", v80);
            }
            else
            {
              v74 = v73;
            }
            v15 = (void *)objc_msgSend(v74, "copy");
          }

          goto LABEL_212;
        }
      }
      v15 = 0;
LABEL_212:
      off_1ECD09E10(v54);
LABEL_189:
      v22 = (void (**)(_QWORD))&metadata instantiation cache for protocol conformance descriptor for Calendar.Identifier;
      off_1ECD09EF0(v82);
      v25 = v81;
      v24 = theArray;
      if (!v81)
      {
LABEL_42:
        if (v24)
          CFRelease(v24);
        return v15;
      }
LABEL_41:
      v22[478](v25);
      goto LABEL_42;
    }
    v82 = v20;
    v87 = v26;
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress masculine](NSTermOfAddress, "masculine")))
    {
      cf = 0;
      off_1ECD09EA8(v26, CFSTR("gender"), CFSTR("masculine"), &cf);
      if (!cf)
        goto LABEL_89;
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v27 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, CFSTR(\"gender\"), CFSTR(\"masculine\"), &error)";
        v106 = 2112;
        v107 = cf;
LABEL_180:
        _os_log_error_impl(&dword_1817D9000, v27, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress neutral](NSTermOfAddress, "neutral")))
    {
      cf = 0;
      off_1ECD09EB0(v26, CFSTR("gender"), &cf);
      if (!cf)
        goto LABEL_89;
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v27 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_clearConstraintByName(pronounSemanticFeatureConcept, CFSTR(\"gender\"), &error)";
        v106 = 2112;
        v107 = cf;
        goto LABEL_180;
      }
LABEL_62:
      CFRelease(cf);
      v15 = 0;
      v24 = 0;
      v25 = v20;
      goto LABEL_41;
    }
    if (!objc_msgSend((id)objc_msgSend(a4, "pronouns"), "count"))
      goto LABEL_89;
    theArray = CFArrayCreateMutable(0, objc_msgSend((id)objc_msgSend(a4, "pronouns"), "count"), &_DisplayValueArrayCallbacks);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = (void *)objc_msgSend(a4, "pronouns");
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v99, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v101;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v101 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v31);
          v33 = objc_msgSend(v32, "_morphunConstraints");
          cf = 0;
          v34 = (const void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *))off_1ECD09EB8)(v86, objc_msgSend(v32, "pronoun"), v33, &cf);
          if (v34)
          {
            v35 = v34;
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1)
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              v36 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v105 = (const char *)cf;
                _os_log_error_impl(&dword_1817D9000, v36, OS_LOG_TYPE_ERROR, "Inflection engine reported an error in mdv_create: %@", buf, 0xCu);
              }
              off_1ECD09E90(v35);
            }
            else
            {
              CFArrayAppendValue(theArray, v34);
            }
          }
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v99, 16);
      }
      while (v29);
    }
    cf = 0;
    v81 = off_1ECD09EC0(v86, theArray, 0, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v37 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "mpron_createWithCustom(model, localizedPronouns, nil, &error)";
        v106 = 2112;
        v107 = cf;
        _os_log_error_impl(&dword_1817D9000, v37, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      CFRelease(cf);
      goto LABEL_88;
    }
    if (!v81)
    {
LABEL_88:
      v15 = 0;
      v25 = v82;
      v24 = theArray;
      v22 = (void (**)(_QWORD))&metadata instantiation cache for protocol conformance descriptor for Calendar.Identifier;
      goto LABEL_41;
    }
    cf = 0;
    v77 = off_1ECD09EA0(v81, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v49 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "mpron_toSemanticFeatureConcept(localizedPronoun, &error)";
        v106 = 2112;
        v107 = cf;
        _os_log_error_impl(&dword_1817D9000, v49, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      CFRelease(cf);
      goto LABEL_122;
    }
    if (!v77)
    {
LABEL_122:
      v22 = (void (**)(_QWORD))&metadata instantiation cache for protocol conformance descriptor for Calendar.Identifier;
      off_1ECD09EF0(v82);
      v15 = 0;
      v25 = v81;
      v24 = theArray;
      goto LABEL_41;
    }
    v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v57 = objc_msgSend(&unk_1E0FCCAF0, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
    if (!v57)
      goto LABEL_177;
    v59 = v57;
    obja = *(_QWORD *)v96;
    *(_QWORD *)&v58 = 136315394;
    v76 = v58;
LABEL_149:
    v60 = 0;
    while (1)
    {
      if (*(_QWORD *)v96 != obja)
        objc_enumerationMutation(&unk_1E0FCCAF0);
      v61 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v60);
      cf = 0;
      v62 = off_1ECD09EC8(v87, v61, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v63 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v76;
          v105 = "msfc_createFeatureValueByNameCopy(pronounSemanticFeatureConcept, (CFStringRef)grammeme, &error)";
          v106 = 2112;
          v107 = cf;
          _os_log_error_impl(&dword_1817D9000, v63, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
        goto LABEL_175;
      }
      v64 = v62;
      if (v62)
        break;
LABEL_175:
      if (v59 == ++v60)
      {
        v59 = objc_msgSend(&unk_1E0FCCAF0, "countByEnumeratingWithState:objects:count:", &v95, v94, 16);
        if (!v59)
        {
LABEL_177:
          v87 = v77;
          if (!a5)
            goto LABEL_103;
          goto LABEL_90;
        }
        goto LABEL_149;
      }
    }
    cf = 0;
    v65 = off_1ECD09E08(v62, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v66 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v76;
        v105 = "mss_createPrintCopy(grammemeValue, &error)";
        v106 = 2112;
        v107 = cf;
        _os_log_error_impl(&dword_1817D9000, v66, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      v67 = cf;
    }
    else
    {
      v68 = (const void *)v65;
      if (!v65)
      {
LABEL_174:
        off_1ECD09E10(v64);
        goto LABEL_175;
      }
      objc_msgSend(v78, "setObject:forKeyedSubscript:", v65, v61);
      cf = 0;
      off_1ECD09EA8(v77, v61, v68, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v69 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v76;
          v105 = "msfc_putConstraintByName(localizedSemanticFeatureConcept, (__bridge CFStringRef)grammeme, grammemeValueString, &error)";
          v106 = 2112;
          v107 = cf;
          _os_log_error_impl(&dword_1817D9000, v69, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      v67 = v68;
    }
    CFRelease(v67);
    goto LABEL_174;
  }
  return result;
}

- (void)_iterateFormsOfWord:(id)a3 usingBlock:(id)a4
{
  _NSLexiconIterateFormsOfWord(a3, (uint64_t)self->_appropriateLocale, (uint64_t)a4);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

@end
