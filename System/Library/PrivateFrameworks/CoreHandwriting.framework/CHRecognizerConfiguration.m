@implementation CHRecognizerConfiguration

+ (BOOL)isLocaleSupported:(id)a3 withMode:(int)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v7, &v6);
  return sub_1BE811C80((uint64_t)CHRecognizerConfiguration, v7, a4);
}

- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 enableCachingIfAvailable:(BOOL)a6 enableGen2ModelIfAvailable:(BOOL)a7 enableGen2CharacterLMIfAvailable:(BOOL)a8
{
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  CHRecognizerConfiguration *v19;
  int v21;

  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a3;
  v15 = a4;
  v16 = (_DWORD)v12 == 2 || a8;
  if ((_DWORD)v12 == 6)
    v17 = 2;
  else
    v17 = 0;
  if ((_DWORD)v12 == 6)
    v18 = a8;
  else
    v18 = v16;
  BYTE2(v21) = v18;
  BYTE1(v21) = a7;
  LOBYTE(v21) = a6;
  v19 = (CHRecognizerConfiguration *)objc_msgSend_initWithMode_locale_contentType_autoCapitalizationMode_autoCorrectionMode_baseWritingDirection_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(self, v14, v12, (uint64_t)v15, v11, (_DWORD)v12 != 6, v17, 0x7FFFFFFFFFFFFFFFLL, v21);

  return v19;
}

- (CHRecognizerConfiguration)initWithMode:(int)a3 locale:(id)a4 contentType:(int)a5 autoCapitalizationMode:(int)a6 autoCorrectionMode:(int)a7 baseWritingDirection:(int)a8 enableCachingIfAvailable:(BOOL)a9 enableGen2ModelIfAvailable:(BOOL)a10 enableGen2CharacterLMIfAvailable:(BOOL)a11
{
  uint64_t v11;
  id v17;
  CHRecognizerConfiguration *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CHRecognizerConfiguration *v24;
  uint64_t v25;
  NSLocale *locale;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  objc_super v31;

  v11 = *(_QWORD *)&a8;
  v17 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CHRecognizerConfiguration;
  v18 = -[CHRecognizerConfiguration init](&v31, sel_init);
  v24 = v18;
  if (v18)
  {
    v18->_mode = a3;
    v25 = objc_msgSend_copy(v17, v19, v20, v21, v22, v23);
    locale = v24->_locale;
    v24->_locale = (NSLocale *)v25;

    v24->_contentType = a5;
    *(_QWORD *)&v24->_baseWritingDirection = v11;
    v29 = 0;
    v30 = 0;
    sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v17, (uint64_t *)&v30, &v29);
    v27 = v29;
    v24->_language = v30;
    v24->_script = v27;
    v24->_autoCapitalizationMode = a6;
    v24->_autoCorrectionMode = a7;
    v24->_enableCachingIfAvailable = a9;
    v24->_enableGen2ModelIfAvailable = a10;
    v24->_enableGen2CharacterLMIfAvailable = a11;
  }

  return v24;
}

+ (id)stringForRecognitionMode:(int)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return off_1E77F5988[a3 - 1];
}

+ (id)stringForRecognitionContentType:(int)a3
{
  if (a3 > 7)
    return 0;
  else
    return off_1E77F59B8[a3];
}

+ (id)stringForAutoCapitalizationMode:(int)a3
{
  if (a3 > 6)
    return 0;
  else
    return off_1E77F59F8[a3];
}

+ (id)stringForAutoCorrectionMode:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E77F5A30[a3];
}

+ (id)stringForBaseWritingDirection:(int)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v3 = CFSTR("default-ltr");
  v4 = CFSTR("default-rtl");
  v5 = CFSTR("none");
  if (*(_QWORD *)&a3 != 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  if (*(_QWORD *)&a3 != 255)
    v4 = v5;
  if (*(_QWORD *)&a3 != 254)
    v3 = v4;
  v6 = CFSTR("ltr");
  v7 = CFSTR("rtl");
  if (*(_QWORD *)&a3 != 1)
    v7 = 0;
  if (*(_QWORD *)&a3)
    v6 = v7;
  if (*(uint64_t *)&a3 <= 253)
    return (id)v6;
  else
    return (id)v3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t language;
  __CFString *v28;
  unint64_t script;
  __CFString *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  objc_super v44;

  objc_msgSend_stringForRecognitionMode_(CHRecognizerConfiguration, a2, self->_mode, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRecognitionContentType_(CHRecognizerConfiguration, v7, self->_contentType, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForAutoCapitalizationMode_(CHRecognizerConfiguration, v12, self->_autoCapitalizationMode, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForAutoCorrectionMode_(CHRecognizerConfiguration, v17, self->_autoCorrectionMode, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForBaseWritingDirection_(CHRecognizerConfiguration, v22, *(_QWORD *)&self->_baseWritingDirection, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  language = self->_language;
  objc_opt_self();
  if (language > 0x1B)
    v28 = 0;
  else
    v28 = off_1E77F5A48[language];
  script = self->_script;
  objc_opt_self();
  if (script > 8)
    v30 = 0;
  else
    v30 = off_1E77F5B28[script];
  v44.receiver = self;
  v44.super_class = (Class)CHRecognizerConfiguration;
  -[CHRecognizerConfiguration description](&v44, sel_description);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeIdentifier(self->_locale, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v31, v38, (uint64_t)CFSTR(" Recognizer configuration with mode: %@, locale: %@, contentType: %@, autoCapitalizationMode: %@, autoCorrectionMode: %@, baseWritingDirection: %@, language: %@, script: %@"), v39, v40, v41, v6, v37, v11, v16, v21, v26, v28, v30);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

+ (id)defaultLocaleForRecognitionType:(int)a3 withMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;

  v6 = 0;
  v8 = CFSTR("en");
  switch(a3)
  {
    case 0:
      if (a4 != 3)
        goto LABEL_8;
      v6 = 0;
      return v6;
    case 1:
      goto LABEL_8;
    case 2:
      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], a2, (uint64_t)CFSTR("zh_Hans"), *(uint64_t *)&a4, v4, v5);
      goto LABEL_9;
    case 4:
      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], a2, (uint64_t)CFSTR("zh_Hant"), *(uint64_t *)&a4, v4, v5);
      goto LABEL_9;
    case 8:
      v8 = CFSTR("ja");
LABEL_8:
      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], a2, (uint64_t)v8, *(uint64_t *)&a4, v4, v5);
LABEL_9:
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v6;
  }
  return v6;
}

+ (BOOL)isSupportedLatinScriptLocale:(id)a3 withMode:(int)a4
{
  id v5;
  char v6;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v8 = 0;
  v9 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v5, &v9, &v8);
  if (v8 == 1)
    v6 = sub_1BE811C80((uint64_t)CHRecognizerConfiguration, v9, a4);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)isSupportedCyrillicScriptLocale:(id)a3 withMode:(int)a4
{
  id v5;
  char v6;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v8 = 0;
  v9 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v5, &v9, &v8);
  if (v8 == 7)
    v6 = sub_1BE811C80((uint64_t)CHRecognizerConfiguration, v9, a4);
  else
    v6 = 0;

  return v6;
}

+ (id)forcedGen2ModelLocaleForLocale:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  unint64_t v10;

  v9 = 0;
  v10 = 0;
  sub_1BE609EE8((uint64_t)a1, a3, &v9, (uint64_t *)&v10);
  v7 = 0;
  if (v9 == 20)
  {
    if (v10 > 8)
      return 0;
    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v3, (uint64_t)off_1E77F5B70[v10], v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)effectiveRecognitionLocales:(id)a3 recognitionMode:(int)a4
{
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
  uint64_t v28;
  char v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _BOOL4 v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  char v76;
  id obj;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v13, v14, v15, v16, v17);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v6;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v81, (uint64_t)v85, 16, v19);
  if (!v20)
  {
    v76 = 0;
    goto LABEL_31;
  }
  v76 = 0;
  v21 = *(_QWORD *)v82;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v82 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v22);
      v79 = 0;
      v80 = 0;
      sub_1BE609EE8((uint64_t)a1, v23, &v79, (uint64_t *)&v80);
      v28 = v80;
      if (v80 > 8)
      {
        v29 = 0;
      }
      else
      {
        if (((1 << v80) & 0x1F0) == 0)
        {
          if (((1 << v80) & 3) != 0)
          {
            v29 = 0;
            v76 |= v79 != 27;
            goto LABEL_12;
          }
          v28 = 2;
        }
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v24, v28, v25, v26, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend_containsObject_(v78, v31, (uint64_t)v30, v32, v33, v34);

      }
LABEL_12:
      v35 = (void *)objc_opt_class();
      objc_msgSend_forcedGen2ModelLocaleForLocale_(v35, v36, (uint64_t)v23, v37, v38, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v40;
      if (v40)
        v42 = (void *)v40;
      else
        v42 = v23;
      v48 = v42;
      if ((v29 & 1) == 0 && (objc_msgSend_containsObject_(v12, v43, (uint64_t)v48, v45, v46, v47) & 1) == 0)
      {
        objc_msgSend_addObject_(v12, v43, (uint64_t)v48, v45, v46, v47);
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v49, v28, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v78, v54, (uint64_t)v53, v55, v56, v57);

      }
      v58 = objc_msgSend_count(v12, v43, v44, v45, v46, v47);
      v60 = a4 == 6 || v58 < 2;

      if (!v60)
        goto LABEL_31;
      ++v22;
    }
    while (v20 != v22);
    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v81, (uint64_t)v85, 16, v62);
    v20 = v63;
  }
  while (v63);
LABEL_31:

  if (!((a4 == 6) | v76 & 1))
  {
    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v64, (uint64_t)CFSTR("en_US"), v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v12, v70, (uint64_t)v69, v71, v72, v73);

  }
  v74 = (void *)objc_msgSend_copy(v12, v64, v65, v66, v67, v68);

  return v74;
}

+ (id)localeForScriptClass:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4, v5);
  if (v6 > 0x10)
    return 0;
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v7, (uint64_t)off_1E77F5BB8[v6], v8, v9, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)localesForScriptClassification:(id)a3 selectedScriptCodepoints:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v71;
  id obj;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v71 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v71;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v83, (uint64_t)v88, 16, v18);
  if (v24)
  {
    v76 = *(_QWORD *)v84;
    while (1)
    {
      v25 = 0;
      v73 = v24;
LABEL_4:
      if (*(_QWORD *)v84 != v76)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v25);
      v27 = objc_msgSend_integerValue(v26, v19, v20, v21, v22, v23);
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v28 = v77;
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v79, (uint64_t)v87, 16, v30);
      if (!v31)
      {

LABEL_28:
        objc_msgSend_localeForScriptClass_(a1, v19, (uint64_t)v26, v21, v22, v23);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v16, v42, (uint64_t)v28, v43, v44, v45) & 1) == 0)
        {
          objc_msgSend_addObject_(v75, v46, (uint64_t)v28, v47, v48, v49);
          objc_msgSend_addObject_(v16, v50, (uint64_t)v28, v51, v52, v53);
        }
LABEL_69:

        goto LABEL_70;
      }
      v74 = v26;
      v32 = *(_QWORD *)v80;
      if (v27 != 2)
      {
        if (v27 == 9)
        {
          v33 = 0;
          while (1)
          {
            v34 = 0;
            while (2)
            {
              if (*(_QWORD *)v80 != v32)
                objc_enumerationMutation(v28);
              v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v34);
              v78 = 0;
              sub_1BE609EE8((uint64_t)a1, v35, 0, &v78);
              switch(v78)
              {
                case 1:
                  if ((v33 & 1) == 0)
                    goto LABEL_11;
                  goto LABEL_23;
                case 2:
                case 3:
                  if ((v33 & 1) != 0)
                    goto LABEL_23;
                  goto LABEL_11;
                case 4:
                  if ((v33 & 1) == 0)
                    goto LABEL_11;
                  goto LABEL_23;
                case 6:
                  goto LABEL_23;
                default:
                  if ((v33 & 1) == 0)
                  {
LABEL_11:
                    v33 = 0;
                    if (v31 == ++v34)
                      goto LABEL_25;
                    continue;
                  }
LABEL_23:
                  if (!objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v37, v38, v39))
                    goto LABEL_68;
                  v33 = 1;
                  if (v31 != ++v34)
                    continue;
LABEL_25:
                  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
                  if (!v31)
                    goto LABEL_66;
                  break;
              }
              break;
            }
          }
        }
        v33 = 0;
LABEL_49:
        v57 = 0;
        while (1)
        {
          if (*(_QWORD *)v80 != v32)
            objc_enumerationMutation(v28);
          v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v57);
          v78 = 0;
          sub_1BE609EE8((uint64_t)a1, v35, 0, &v78);
          switch(v78)
          {
            case 1:
              if (!((v27 == 7) | v33 & 1))
                goto LABEL_50;
              goto LABEL_63;
            case 2:
            case 3:
              if (!((v27 == 4) | v33 & 1))
                goto LABEL_50;
              goto LABEL_63;
            case 4:
              if ((v27 == 5) | v33 & 1)
                goto LABEL_63;
              goto LABEL_50;
            case 5:
              if ((v27 == 6) | v33 & 1)
                goto LABEL_63;
              goto LABEL_50;
            default:
              if ((v33 & 1) != 0)
              {
LABEL_63:
                if ((objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v58, v59, v39) & 1) == 0)
                  goto LABEL_68;
                v33 = 1;
                if (v31 == ++v57)
                {
LABEL_65:
                  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
                  if (!v31)
                    goto LABEL_66;
                  goto LABEL_49;
                }
              }
              else
              {
LABEL_50:
                v33 = 0;
                if (v31 == ++v57)
                  goto LABEL_65;
              }
              break;
          }
        }
      }
      v33 = 0;
LABEL_31:
      v54 = 0;
      while (2)
      {
        if (*(_QWORD *)v80 != v32)
          objc_enumerationMutation(v28);
        v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v54);
        v78 = 0;
        sub_1BE609EE8((uint64_t)a1, v35, 0, &v78);
        switch(v78)
        {
          case 1:
            if (!((v27 == 7) | v33 & 1))
              goto LABEL_32;
            goto LABEL_44;
          case 2:
          case 3:
            if ((v27 == 4) | v33 & 1)
              goto LABEL_44;
            goto LABEL_32;
          case 4:
            if (!((v27 == 5) | v33 & 1))
              goto LABEL_32;
            goto LABEL_44;
          case 7:
            goto LABEL_44;
          default:
            if ((v33 & 1) == 0)
            {
LABEL_32:
              v33 = 0;
              if (v31 == ++v54)
                goto LABEL_46;
              continue;
            }
LABEL_44:
            if (!objc_msgSend_containsObject_(v16, v36, (uint64_t)v35, v55, v56, v39))
            {
LABEL_68:
              objc_msgSend_addObject_(v16, v36, (uint64_t)v35, v40, v41, v39);
              objc_msgSend_addObject_(v75, v60, (uint64_t)v35, v61, v62, v63);
              v24 = v73;
              goto LABEL_69;
            }
            v33 = 1;
            if (v31 != ++v54)
              continue;
LABEL_46:
            v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v36, (uint64_t)&v79, (uint64_t)v87, 16, v39);
            if (v31)
              goto LABEL_31;
LABEL_66:

            v24 = v73;
            v26 = v74;
            if ((v33 & 1) == 0)
              goto LABEL_28;
LABEL_70:
            if (++v25 != v24)
              goto LABEL_4;
            v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v83, (uint64_t)v88, 16, v23);
            if (!v24)
              goto LABEL_72;
            break;
        }
        break;
      }
    }
  }
LABEL_72:

  v69 = (void *)objc_msgSend_copy(v75, v64, v65, v66, v67, v68);
  return v69;
}

+ (id)recognitionEngineCachingKeyForRecognitionLocale:(id)a3
{
  id result;
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  result = 0;
  if ((unint64_t)(v4 - 1) <= 0x1A)
    return off_1E77F5C40[v4 - 1];
  return result;
}

+ (id)localesByLanguageGroup:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = v56;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v57, (uint64_t)v63, 16, v11);
  if (v12)
  {
    v13 = *(_QWORD *)v58;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v14);
        v16 = (void *)objc_opt_class();
        objc_msgSend_recognitionEngineCachingKeyForRecognitionLocale_(v16, v17, (uint64_t)v15, v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v26 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_localeIdentifier(v15, v27, v28, v29, v30, v31);
            v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v38 = objc_msgSend_UTF8String(v32, v33, v34, v35, v36, v37);
            *(_DWORD *)buf = 136315138;
            v62 = v38;
            _os_log_impl(&dword_1BE607000, v26, OS_LOG_TYPE_FAULT, "Unexpected locale with identifer %s has no matching engine caching key.", buf, 0xCu);

          }
        }
        objc_msgSend_objectForKeyedSubscript_(v8, v21, (uint64_t)v25, v22, v23, v24);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (v40)
        {
          objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99DE8], v41, (uint64_t)v15, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v8, v50, (uint64_t)v45, (uint64_t)v25, v51, v52);
        }
        else
        {
          objc_msgSend_objectForKeyedSubscript_(v8, v41, (uint64_t)v25, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v45, v46, (uint64_t)v15, v47, v48, v49);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v53, (uint64_t)&v57, (uint64_t)v63, 16, v54);
    }
    while (v12);
  }

  return v8;
}

+ (id)defaultActiveCharacterSetForLocale:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v10, 0);
  v8 = 0;
  if ((unint64_t)(v10 - 1) <= 0x11)
  {
    objc_msgSend_ch_latinCharacterSet(MEMORY[0x1E0CB3500], v3, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (id)defaultActiveCharacterSetForLocales:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t i;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  v11 = objc_msgSend_count(v4, v6, v7, v8, v9, v10);
  objc_msgSend_dictionaryWithCapacity_(v5, v12, v11, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v4;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v33, (uint64_t)v37, 16, v19);
  if (v24)
  {
    v25 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v34 != v25)
          objc_enumerationMutation(v17);
        v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend_defaultActiveCharacterSetForLocale_(a1, v20, v27, v21, v22, v23, (_QWORD)v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend_setObject_forKeyedSubscript_(v16, v28, (uint64_t)v31, v27, v29, v30);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v33, (uint64_t)v37, 16, v23);
    }
    while (v24);
  }

  return v16;
}

+ (BOOL)shouldForceNoAlternativeRecognitionCandidates:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 8;
}

- (BOOL)isEqualToRecognizerConfiguration:(id)a3
{
  CHRecognizerConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHRecognizerConfiguration *v10;
  int v11;
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
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
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
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  int isEqual;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v4 = (CHRecognizerConfiguration *)a3;
  v10 = v4;
  if (v4)
  {
    if (self == v4)
    {
      LOBYTE(v105) = 1;
      goto LABEL_15;
    }
    v11 = objc_msgSend_mode(self, v5, v6, v7, v8, v9);
    if (v11 == objc_msgSend_mode(v10, v12, v13, v14, v15, v16))
    {
      v22 = objc_msgSend_contentType(self, v17, v18, v19, v20, v21);
      if (v22 == objc_msgSend_contentType(v10, v23, v24, v25, v26, v27))
      {
        v33 = objc_msgSend_autoCapitalizationMode(self, v28, v29, v30, v31, v32);
        if (v33 == objc_msgSend_autoCapitalizationMode(v10, v34, v35, v36, v37, v38))
        {
          v44 = objc_msgSend_autoCorrectionMode(self, v39, v40, v41, v42, v43);
          if (v44 == objc_msgSend_autoCorrectionMode(v10, v45, v46, v47, v48, v49))
          {
            v55 = objc_msgSend_baseWritingDirection(self, v50, v51, v52, v53, v54);
            if (v55 == objc_msgSend_baseWritingDirection(v10, v56, v57, v58, v59, v60)
              && self->_script == v10->_script
              && self->_language == v10->_language)
            {
              objc_msgSend_locale(self, v61, v62, v63, v64, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_locale(v10, v67, v68, v69, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v66, v73, (uint64_t)v72, v74, v75, v76);

              if (isEqual)
              {
                v83 = objc_msgSend_enableCachingIfAvailable(self, v78, v79, v80, v81, v82);
                if (v83 == objc_msgSend_enableCachingIfAvailable(v10, v84, v85, v86, v87, v88))
                {
                  v94 = objc_msgSend_enableGen2ModelIfAvailable(self, v89, v90, v91, v92, v93);
                  if (v94 == objc_msgSend_enableGen2ModelIfAvailable(v10, v95, v96, v97, v98, v99))
                  {
                    v107 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v100, v101, v102, v103, v104);
                    v105 = v107 ^ objc_msgSend_enableGen2CharacterLMIfAvailable(v10, v108, v109, v110, v111, v112) ^ 1;
                    goto LABEL_15;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v105) = 0;
LABEL_15:

  return v105;
}

- (id)configurationKey
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
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;
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
  int shouldRunNextGenRecognizer;
  int v33;
  unint64_t language;
  const __CFString *v35;
  void *v36;

  objc_msgSend_locale(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeIdentifier(v7, v8, v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
    v19 = (__CFString *)v13;
  else
    v19 = CFSTR("none");
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = objc_msgSend_mode(self, v14, v15, v16, v17, v18);
  shouldRunNextGenRecognizer = objc_msgSend_shouldRunNextGenRecognizer(self, v22, v23, v24, v25, v26);
  if (self
    && (v33 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v27, v28, v29, v30, v31),
        language = self->_language,
        language - 1 >= 0x12)
    && language - 21 > 6)
  {
    if (shouldRunNextGenRecognizer)
      v35 = CFSTR("G2");
    else
      v35 = CFSTR("G1");
    if (v33)
    {
      objc_msgSend_stringWithFormat_(v20, v27, (uint64_t)CFSTR("%@-%ld-%@-%@"), v29, v30, v31, v19, v21, v35, CFSTR("G2"));
      goto LABEL_10;
    }
  }
  else
  {
    v35 = CFSTR("G2");
    if (!shouldRunNextGenRecognizer)
      v35 = CFSTR("G1");
  }
  objc_msgSend_stringWithFormat_(v20, v27, (uint64_t)CFSTR("%@-%ld-%@-%@"), v29, v30, v31, v19, v21, v35, CFSTR("G1"));
LABEL_10:
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (BOOL)hasSameResourcesAsConfiguration:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  NSObject *v10;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t language;
  unint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v32;
  uint8_t buf[8];

  v9 = (uint64_t *)a3;
  if (!v9)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "Recognizer configuration needs to be defined", buf, 2u);
    }

  }
  if (objc_msgSend_mode(v9, v4, v5, v6, v7, v8) != self->_mode
    || self->_enableGen2ModelIfAvailable != objc_msgSend_enableGen2ModelIfAvailable(v9, v11, v12, v13, v14, v15)|| self->_enableGen2CharacterLMIfAvailable != objc_msgSend_enableGen2CharacterLMIfAvailable(v9, v16, v17, v18, v19, v20))
  {
    v30 = 0;
    goto LABEL_20;
  }
  v32 = 0;
  *(_QWORD *)buf = 0;
  objc_msgSend_locale(v9, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v26, (uint64_t *)buf, &v32);

  language = self->_language;
  if (self->_contentType == 6)
    v28 = 1;
  else
    v28 = self->_language;
  if (!v9)
  {
    v29 = 0;
    v30 = 0;
    if (*(_QWORD *)buf != language)
      goto LABEL_20;
    goto LABEL_17;
  }
  v29 = v9[1];
  if (*((_DWORD *)v9 + 8) == 6)
    v29 = 1;
  v30 = 0;
  if (*(_QWORD *)buf == language)
  {
LABEL_17:
    if (v28 == v29)
      v30 = v32 == self->_script;
  }
LABEL_20:

  return v30;
}

- (BOOL)hasSamePostProcessingAsConfiguration:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
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
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  int shouldTransliterateHalfWidthPunctuations;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int shouldApplySemanticTokenization;
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
  int shouldIdentifyChangeableColumns;
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
  int v77;
  int shouldMarkNoWhiteSpaceColumnsChangeable;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint8_t v85[16];

  v9 = a3;
  if (!v9)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "Recognizer configuration needs to be defined", v85, 2u);
    }

  }
  v11 = objc_msgSend_effectiveAutoCapitalizationMode(v9, v4, v5, v6, v7, v8);
  if (v11 == objc_msgSend_effectiveAutoCapitalizationMode(self, v12, v13, v14, v15, v16)
    && (v22 = objc_msgSend_autoCorrectionMode(v9, v17, v18, v19, v20, v21),
        v22 == objc_msgSend_autoCorrectionMode(self, v23, v24, v25, v26, v27))
    && (v33 = objc_msgSend_baseWritingDirection(v9, v28, v29, v30, v31, v32),
        v33 == objc_msgSend_baseWritingDirection(self, v34, v35, v36, v37, v38))
    && (shouldTransliterateHalfWidthPunctuations = objc_msgSend_shouldTransliterateHalfWidthPunctuations(v9, v39, v40, v41, v42, v43), shouldTransliterateHalfWidthPunctuations == objc_msgSend_shouldTransliterateHalfWidthPunctuations(self, v45, v46, v47, v48, v49))&& (shouldApplySemanticTokenization = objc_msgSend_shouldApplySemanticTokenization(v9, v50, v51, v52, v53, v54), shouldApplySemanticTokenization == objc_msgSend_shouldApplySemanticTokenization(self, v56, v57, v58,
                                                           v59,
                                                           v60))
    && (shouldIdentifyChangeableColumns = objc_msgSend_shouldIdentifyChangeableColumns(v9, v61, v62, v63, v64, v65),
        shouldIdentifyChangeableColumns == objc_msgSend_shouldIdentifyChangeableColumns(self, v67, v68, v69, v70, v71)))
  {
    shouldMarkNoWhiteSpaceColumnsChangeable = objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(v9, v72, v73, v74, v75, v76);
    v77 = shouldMarkNoWhiteSpaceColumnsChangeable ^ objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(self, v80, v81, v82, v83, v84) ^ 1;
  }
  else
  {
    LOBYTE(v77) = 0;
  }

  return v77;
}

- (BOOL)shouldGenerateDigitLetterAlternatives
{
  return self->_script == 1;
}

- (BOOL)shouldEnforceGrammarOnTransliterations
{
  return self->_script == 1 && self->_mode != 1;
}

- (unint64_t)supportedSegmentationStrategy
{
  return self->_script == 1 && self->_mode == 5;
}

- (BOOL)shouldApplyRomanPostProcessing
{
  return self->_script == 1;
}

- (BOOL)shouldApplyChinesePostProcessing
{
  return (self->_script & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)shouldRefineChineseCharacterCandidates
{
  unsigned int mode;
  BOOL v3;
  BOOL v4;
  unsigned int v5;

  if (self->_script - 2 > 2)
    return 0;
  mode = self->_mode;
  v3 = mode >= 6;
  v4 = mode == 6;
  v5 = (0x54u >> mode) & 1;
  if (!v4 && v3)
    return 0;
  else
    return v5;
}

- (BOOL)shouldLoadCJKLexicons
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0 && self->_script - 2 < 4;
}

- (BOOL)shouldComposeLexiconWithNetwork
{
  return self->_script - 2 < 4;
}

- (BOOL)shouldExpandLexiconInNetwork
{
  return self->_script == 1;
}

- (BOOL)shouldApplyLexicalPenalty
{
  return (self->_contentType > 7u) | (0x39u >> self->_contentType) & 1;
}

- (BOOL)shouldApplyDiacriticSensitivity
{
  return (self->_language < 0x1B) & (0x707EE7Cu >> self->_language);
}

- (BOOL)shouldExpandCodePoints
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldRunNextGenRecognizer
{
  BOOL result;

  result = 0;
  switch(self->_mode)
  {
    case 1:
    case 2:
    case 6:
      result = 1;
      break;
    case 4:
      result = self->_language < 0x1C;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)skipLatinActivationThreshold
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  double v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKey_(0, a2, (uint64_t)CFSTR("SkipLatinProbabilityThreshold"), v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v6 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEFAULT, "shouldSkipLatinActivation from override weights: %@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend_floatValue(v5, v7, v8, v9, v10, v11);
    v13 = v12;
  }
  else
  {
    v13 = 0.01;
  }

  return v13;
}

- (BOOL)shouldPenalizePrefixes
{
  return (self->_mode < 7u) & (0x54u >> self->_mode);
}

- (BOOL)shouldPerformGlobalBestSearch
{
  return self->_mode == 5;
}

- (BOOL)shouldPerformGlobalBestSearchWithSmallLattice
{
  int mode;

  mode = self->_mode;
  if (mode == 5)
    return 1;
  if (mode == 4)
    return self->_script == 1;
  return 0;
}

- (BOOL)shouldPerformIntegratedLexiconExpansion
{
  return self->_script == 1;
}

- (BOOL)shouldFallbackOnSingleCharacterExpansion
{
  return self->_mode == 4;
}

- (BOOL)shouldComputeStrokePenalties
{
  return self->_mode == 5;
}

- (BOOL)shouldPenalizeLetterInsertion
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldApplyCandidatesThresholding
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldRelaxFinalCandidatesThresholding
{
  int mode;

  if (self->_script - 2 > 2)
    return 0;
  mode = self->_mode;
  return mode == 4 || mode == 2;
}

- (BOOL)shouldFilterLowProbabilityTranscriptionPaths
{
  return self->_mode == 4;
}

- (BOOL)shouldAutoCapitalize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  BOOL result;

  v7 = objc_msgSend_effectiveAutoCapitalizationMode(self, a2, v2, v3, v4, v5);
  result = 0;
  switch(v7)
  {
    case 0:
      return result;
    case 1:
    case 3:
    case 6:
      result = (self->_contentType - 8) < 0xFFFFFFF9;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (int)effectiveAutoCapitalizationMode
{
  if ((self->_autoCapitalizationMode & 0xFFFFFFFD) == 1 && self->_language == 27)
    return 6;
  else
    return self->_autoCapitalizationMode;
}

- (BOOL)shouldCreatePseudoTokens
{
  return self->_script != 7;
}

- (BOOL)shouldAutoCorrect
{
  unint64_t script;
  int autoCorrectionMode;

  script = self->_script;
  autoCorrectionMode = self->_autoCorrectionMode;
  if (autoCorrectionMode)
    return autoCorrectionMode != 2 && script != 8;
  return (self->_contentType - 8) < 0xFFFFFFF9 && script != 8;
}

- (BOOL)unsafeForSpellCorrection
{
  return self->_script == 7;
}

- (BOOL)shouldRunLexiconCorrectionPostProcessingStep
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend_shouldAutoCapitalize(self, a2, v2, v3, v4, v5) & 1) != 0)
    return 1;
  else
    return objc_msgSend_shouldAutoCorrect(self, v7, v8, v9, v10, v11);
}

- (BOOL)shouldApplyLMRescoring
{
  return self->_language - 19 < 4;
}

- (BOOL)shouldApplyLMSorting
{
  return self->_script == 1 && self->_mode == 4;
}

- (BOOL)shouldTransliterateAndSynthetizeCandidates
{
  return self->_language - 19 < 3;
}

- (BOOL)shouldTransliterateSentencesSCTC
{
  return self->_script == 3;
}

- (BOOL)shouldReorderSCTCConfusion
{
  return self->_script == 2;
}

- (BOOL)shouldRecoverCyrillicCandidates
{
  return self->_script == 7;
}

- (BOOL)shouldRemoveInvalidArabicDiacritics
{
  return self->_script == 8;
}

- (BOOL)shouldUseCaching
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;

  v7 = objc_msgSend_enableCachingIfAvailable(self, a2, v2, v3, v4, v5);
  if (v7)
    LOBYTE(v7) = self->_script != 1 || self->_mode != 4;
  return v7;
}

- (BOOL)shouldPreserveLegacyTranscriptionPaths
{
  return self->_language - 19 < 2;
}

- (BOOL)shouldUseTokenPrecedingSpaces
{
  return self->_language - 22 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)shouldReplaceInvalidTokenIDs
{
  return self->_mode == 1;
}

- (BOOL)shouldTransformCharacterProbabilitiesIntoLogScores
{
  return (self->_mode < 7u) & (0x74u >> self->_mode);
}

- (BOOL)shouldPromoteCJKCommonCharacters
{
  return self->_script - 2 < 4;
}

- (BOOL)shouldMarkMultiWordOVS
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldKeepOutOfPatternCandidates
{
  return self->_script - 2 < 7;
}

- (BOOL)shouldKeepDuplicateTokenIDs
{
  return self->_mode == 5;
}

- (BOOL)shouldRefineCandidates
{
  return self->_script - 2 > 2 || self->_mode == 2;
}

- (BOOL)shouldDetectChinesePunctuation
{
  return (self->_script < 7) & (0x5Cu >> self->_script);
}

- (BOOL)shouldDetectRomanPunctuation
{
  return self->_script == 1;
}

- (BOOL)shouldTreatAllSmallStrokesAsPunctuation
{
  return self->_mode == 5;
}

- (BOOL)shouldTransliterateHalfWidthPunctuations
{
  return self->_script - 2 < 3;
}

- (BOOL)shouldAddAlternativeWidthCandidates
{
  return self->_script == 4;
}

- (BOOL)shouldApplySemanticTokenization
{
  unint64_t script;
  BOOL v3;
  uint64_t v4;
  BOOL v5;

  script = self->_script;
  v3 = script >= 6;
  v5 = script == 6;
  v4 = (1 << script) & 0x5C;
  v5 = !v5 && v3 || v4 == 0;
  return !v5 && self->_mode != 2;
}

- (BOOL)shouldIdentifyChangeableColumns
{
  return (self->_script < 9) & (0x17Cu >> self->_script);
}

- (BOOL)shouldMarkNoWhiteSpaceColumnsChangeable
{
  unint64_t script;
  BOOL v3;
  uint64_t v4;
  int mode;

  script = self->_script;
  v3 = script > 6;
  v4 = (1 << script) & 0x5C;
  if (v3 || v4 == 0)
    return 0;
  mode = self->_mode;
  return mode == 4 || mode == 2;
}

- (BOOL)shouldRemoveSpacesFromHashtagsAndMentions
{
  return self->_mode == 6;
}

- (BOOL)shouldPerformArabicPostProcessing
{
  return self->_script == 8;
}

- (BOOL)shouldPromoteInLexiconCandidates
{
  return self->_script - 7 < 2;
}

- (BOOL)shouldConvertKanaInPostProcessing
{
  return self->_script == 4 && self->_mode != 2;
}

- (BOOL)shouldUpdateChangeableColumnCountWithPhraseLexicon
{
  return self->_script == 1;
}

- (unsigned)requiredInappropriateFilteringFlags
{
  unsigned int result;
  unsigned int mode;
  int v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;

  result = 0;
  mode = self->_mode;
  if (mode <= 6)
  {
    v5 = 1 << mode;
    if ((v5 & 0x54) != 0)
    {
      v6 = self->_script == 5;
      v7 = 25165824;
      v8 = 25165826;
    }
    else
    {
      if ((v5 & 0x22) == 0)
        return result;
      v6 = self->_script == 5;
      v7 = 58720256;
      v8 = 58720258;
    }
    if (v6)
      return v8;
    else
      return v7;
  }
  return result;
}

- (int)mecabraInputMethodType
{
  int result;

  switch(self->_script)
  {
    case 2uLL:
      result = 11;
      break;
    case 3uLL:
      if (self->_language == 20)
        result = 14;
      else
        result = 12;
      break;
    case 4uLL:
      result = 1;
      break;
    case 5uLL:
      result = 17;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)shouldForwardMecabraOTAAssetsUpdate
{
  return self->_language == 20;
}

- (int64_t)precedingSpaceDefaultBehavior
{
  unint64_t v2;

  v2 = self->_script - 2;
  if (v2 > 4)
    return 0;
  else
    return qword_1BE8DFDE0[v2];
}

- (id)forcedActiveCharacterSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  if (self->_script != 7 || self->_mode != 4)
    return 0;
  if (self->_language == 25)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v7, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v6, v13, (uint64_t)v12, v14, v15, v16);

    objc_msgSend_ch_russianOnlyCharacterSet(MEMORY[0x1E0CB3500], v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_formUnionWithCharacterSet_(v6, v23, (uint64_t)v22, v24, v25, v26);

  }
  else
  {
    objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], a2, v2, v3, v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_invertedSet(v6, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)linguisticResourcesFallbackLocale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (self->_language != 20)
    return 0;
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], a2, (uint64_t)CFSTR("zh_hant"), v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_LXLexicon)newStaticLexicon:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v7;
  int v8;
  unint64_t script;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _LXLexicon *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v7 = mode > 6;
  v8 = (1 << mode) & 0x76;
  if (v7 || v8 == 0)
    return 0;
  script = self->_script;
  if (script > 8)
  {
    v17 = 0;
    if (!a3)
      return v17;
    goto LABEL_17;
  }
  if (((1 << script) & 0x1A2) != 0)
  {
    v23 = *MEMORY[0x1E0D437B8];
    objc_msgSend_localeIdentifier(self->_locale, a2, (uint64_t)a3, v3, v4, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v24, (uint64_t)&v23, 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = LXLexiconCreate();
    goto LABEL_12;
  }
  v17 = 0;
  if (((1 << script) & 0x1C) != 0)
  {
    if (objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, v3, v4, v5))
    {
      v21 = *MEMORY[0x1E0D437B8];
      v22 = CFSTR("en_US");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)&v22, (uint64_t)&v21, 1, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = LXLexiconCreate();
LABEL_12:
      v17 = (_LXLexicon *)v16;

      if (!a3)
        return v17;
      goto LABEL_17;
    }
    v17 = 0;
  }
  if (a3)
LABEL_17:
    *a3 = objc_retainAutorelease(0);
  return v17;
}

- (_LXLexicon)newSecondaryStaticLexicon:(id *)a3
{
  uint64_t v3;
  unsigned int mode;
  BOOL v5;
  int v6;
  _LXLexicon *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v5 = mode > 6;
  v6 = (1 << mode) & 0x76;
  if (v5 || v6 == 0)
    return 0;
  v9 = 0;
  if (self->_script == 5)
  {
    v12 = *MEMORY[0x1E0D437B8];
    v13[0] = CFSTR("en_US");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v13, (uint64_t)&v12, 1, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_LXLexicon *)LXLexiconCreate();

  }
  if (a3)
    *a3 = objc_retainAutorelease(0);
  return v9;
}

- (_LXLexicon)postProcessorLexiconWithStaticLexicon:(_LXLexicon *)a3 secondaryLexicon:(_LXLexicon *)a4
{
  if (self->_script == 5)
    return a4;
  else
    return a3;
}

- (_LXLexicon)newPhraseLexicon:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v8;
  int v9;
  BOOL v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _LXLexicon *v17;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v8 = mode > 6;
  v9 = (1 << mode) & 0x76;
  v10 = v8 || v9 == 0;
  if (v10
    || !objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, v3, v4, v5)
    || self->_mode == 5)
  {
    return 0;
  }
  v17 = 0;
  if (self->_script == 1)
  {
    v23[0] = *MEMORY[0x1E0D437B8];
    objc_msgSend_localeIdentifier(self->_locale, v12, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = *MEMORY[0x1E0D437D8];
    v24[0] = v19;
    v24[1] = *MEMORY[0x1E0D437E0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v24, (uint64_t)v23, 2, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (_LXLexicon *)LXLexiconCreate();
  }
  if (a3)
    *a3 = objc_retainAutorelease(0);
  return v17;
}

- (void)newCJKStaticLexicon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v8;
  int v9;
  BOOL v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v8 = mode > 6;
  v9 = (1 << mode) & 0x76;
  v10 = v8 || v9 == 0;
  if (v10 || !objc_msgSend_shouldLoadCJKLexicons(self, a2, v2, v3, v4, v5))
    return 0;
  v16 = (_QWORD *)MEMORY[0x1E0D434C8];
  v43[0] = *MEMORY[0x1E0D434C8];
  objc_msgSend_localeIdentifier(self->_locale, v11, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (_QWORD *)MEMORY[0x1E0D434F8];
  v43[1] = *MEMORY[0x1E0D434F8];
  v19 = MEMORY[0x1E0C9AAA0];
  v44[0] = v17;
  v44[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v44, (uint64_t)v43, 2, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)LMLexiconCreate();
  if (!v28)
  {
    objc_msgSend_linguisticResourcesFallbackLocale(self, v23, v24, v25, v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v29;
    if (v29)
    {
      v41[0] = *v16;
      objc_msgSend_localeIdentifier(v29, v30, v31, v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = *v18;
      v42[0] = v36;
      v42[1] = v19;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v42, (uint64_t)v41, 2, v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)LMLexiconCreate();
      v22 = (void *)v39;
    }
    else
    {
      v28 = 0;
    }

  }
  return v28;
}

- (void)newWordLanguageModel
{
  uint64_t v2;

  return (void *)objc_msgSend_newWordLanguageModelForRecognizer_async_synchronizationQueue_(self, a2, 0, 0, 0, v2);
}

- (void)newWordLanguageModelForRecognizer:(id)a3 async:(BOOL)a4 synchronizationQueue:(id)a5
{
  _BOOL4 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  const char *v87;
  id v89;
  _QWORD block[4];
  NSObject *v91;
  CHRecognizerConfiguration *v92;
  id v93;
  id v94;
  void *v95;
  uint8_t buf[4];
  const char *v97;
  uint64_t v98;

  v6 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v13 = a5;
  v14 = 0;
  switch(self->_mode)
  {
    case 1:
      if (objc_msgSend_shouldApplyLMRescoring(self, v8, v9, v10, v11, v12))
        goto LABEL_2;
      v14 = 0;
      goto LABEL_34;
    case 2:
    case 4:
    case 6:
LABEL_2:
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9, v10, v11, v12, v89);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localeIdentifier(self->_locale, v16, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v15, v22, (uint64_t)v21, *MEMORY[0x1E0D434C8], v23, v24);

      objc_msgSend_setObject_forKeyedSubscript_(v15, v25, MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D434F8], v26, v27);
      if (self->_script == 1)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v15, v28, MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D43450], v29, v30);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v31, (uint64_t)&unk_1E78292D0, *MEMORY[0x1E0D434D0], v32, v33);
      }
      objc_msgSend_pathForLanguageModelForLocale_modelType_resourceType_(MEMORY[0x1E0D09AC0], v28, (uint64_t)self->_locale, 2, 1, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v34;
      if (v34)
      {
        objc_msgSend_lastPathComponent(v34, v35, v36, v37, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByDeletingPathExtension(v41, v42, v43, v44, v45, v46);
        v47 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringByDeletingLastPathComponent(v40, v48, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v15, v54, (uint64_t)v53, *MEMORY[0x1E0D43478], v55, v56);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v57, (uint64_t)v47, *MEMORY[0x1E0D43468], v58, v59);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v60, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D43458], v61, v62);
        objc_msgSend_setObject_forKeyedSubscript_(v15, v63, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D434B8], v64, v65);
        if (qword_1EF568E88 == -1)
        {
          v66 = (id)qword_1EF568E20;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
LABEL_8:

            goto LABEL_12;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v66 = (id)qword_1EF568E20;
          if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            goto LABEL_8;
        }
        *(_DWORD *)buf = 138412290;
        v97 = (const char *)v40;
        _os_log_impl(&dword_1BE607000, v66, OS_LOG_TYPE_DEBUG, "Attempting to load wordLM from %@", buf, 0xCu);
        goto LABEL_8;
      }
      if (qword_1EF568E88 == -1)
      {
        v47 = (id)qword_1EF568E20;
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          goto LABEL_12;
        goto LABEL_11;
      }
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v47 = (id)qword_1EF568E20;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v47, OS_LOG_TYPE_DEBUG, "Attempting to load wordLM from default LanguageModeling search path", buf, 2u);
      }
LABEL_12:

      if (v6)
      {
        objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99E08], v67, (uint64_t)v15, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v72, v73, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D434E8], v74, v75);
        objc_msgSend_linguisticResourcesFallbackLocale(self, v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)sub_1BE814620((uint64_t)CHRecognizerConfiguration, v72, v81);

        if (!v13)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v82 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v82, OS_LOG_TYPE_FAULT, "Synchronization queue can not be nil when async loading language models.", buf, 2u);
          }

        }
        if (!v89)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v83 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v83, OS_LOG_TYPE_FAULT, "Recognizer can not be nil when async loading language models.", buf, 2u);
          }

        }
        if (qword_1EF5683C0 != -1)
          dispatch_once(&qword_1EF5683C0, &unk_1E77F1A30);
        v84 = qword_1EF5683B8;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BE814E64;
        block[3] = &unk_1E77F38D0;
        v91 = v15;
        v92 = self;
        v95 = v14;
        v93 = v13;
        v94 = v89;
        dispatch_async(v84, block);

        v85 = v91;
      }
      else
      {
        objc_msgSend_linguisticResourcesFallbackLocale(self, v67, v68, v69, v70, v71);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)sub_1BE814620((uint64_t)CHRecognizerConfiguration, v15, v86);

        if (qword_1EF568E88 == -1)
        {
          v85 = (id)qword_1EF568E20;
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v85 = (id)qword_1EF568E20;
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            goto LABEL_33;
        }
        v87 = "has";
        if (!v14)
          v87 = "has not";
        *(_DWORD *)buf = 136315138;
        v97 = v87;
        _os_log_impl(&dword_1BE607000, v85, OS_LOG_TYPE_DEBUG, "wordLM %s been loaded", buf, 0xCu);
      }
LABEL_33:

LABEL_34:
      return v14;
    default:
      goto LABEL_34;
  }
}

- (id)newSpellChecker
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v8;
  int v9;
  BOOL v10;
  unsigned int v11;

  if (self
    && ((mode = self->_mode, v8 = mode > 6, v9 = (1 << mode) & 0x76, !v8) ? (v10 = v9 == 0) : (v10 = 1),
        !v10
     && (objc_msgSend_unsafeForSpellCorrection(self, a2, v2, v3, v4, v5) & 1) == 0
     && self->_enableGen2ModelIfAvailable
     && (v11 = self->_mode, v11 <= 6)
     && ((1 << v11) & 0x54) != 0))
  {
    return objc_alloc_init(CHSpellChecker);
  }
  else
  {
    return 0;
  }
}

- (void)newCharacterLanguageModelAndMap:(void *)a3 force:(BOOL)a4
{
  uint64_t v4;
  uint64_t **v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t **v10;
  unsigned int v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
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
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  BOOL v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
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
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  _BOOL4 v105;
  FILE *v106;
  uint64_t **v107;
  char *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int CodepointInString;
  char *v120;
  int v121;
  uint64_t *v122;
  uint64_t **v123;
  uint64_t **v124;
  unsigned int v125;
  _DWORD *v126;
  uint64_t *v127;
  uint64_t *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char v137;
  id v138;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  NSObject *log;
  void *v155;
  void *v156;
  __CFString *v157;
  int v158;
  id v159[5];
  id v160;
  uint64_t v161;
  char __str[4];
  void *v163;
  __int16 v164;
  void *v165;
  UInt8 v166[1024];
  _QWORD v167[4];
  _QWORD v168[4];
  UInt8 v169[1024];
  uint64_t v170;

  v4 = MEMORY[0x1E0C80A78](self);
  v170 = *MEMORY[0x1E0C80C00];
  if (v4)
  {
    v7 = v4;
    v8 = *(_DWORD *)(v4 + 28);
    if (v8 <= 6 && ((1 << v8) & 0x76) != 0)
    {
      v10 = v5;
      if (!*(_BYTE *)(v4 + 25))
      {
        v11 = (v8 < 7) & (0x74u >> v8);
        if ((unint64_t)(*(_QWORD *)(v4 + 8) - 19) < 2)
          LOBYTE(v11) = 1;
        if ((v11 & 1) != 0)
          goto LABEL_12;
      }
      if (v6)
      {
LABEL_12:
        bzero(v169, 0x400uLL);
        firstMatchingResourceForLocale(*(NSLocale **)(v7 + 48), &stru_1E77F6F28, CFSTR("lm"), v169);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v13, (uint64_t)v169, v15, v16, v17);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_URLWithString_(v19, v21, (uint64_t)v20, v22, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15, v16, v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v159[1] = (id)MEMORY[0x1E0C809B0];
        v159[2] = (id)3221225472;
        v159[3] = sub_1BE815854;
        v159[4] = &unk_1E77F5898;
        v20 = v26;
        v160 = v20;
        v161 = v7;
        LDEnumerateAssetDataItems();
        objc_msgSend_localeIdentifier(*(void **)(v7 + 48), v27, v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v20, v33, (uint64_t)v32, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        v44 = *(void **)(v7 + 48);
        if (v38)
        {
          objc_msgSend_languageCode(v44, v39, v40, v41, v42, v43);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v20, v51, (uint64_t)v50, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55 == 0;

          if (v56)
          {
            v18 = 0;
            v25 = 0;
            goto LABEL_19;
          }
          objc_msgSend_languageCode(*(void **)(v7 + 48), v57, v58, v59, v60, v61);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v20, v62, (uint64_t)v18, v63, v64, v65);
          v49 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_localeIdentifier(v44, v39, v40, v41, v42, v43);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v20, v45, (uint64_t)v18, v46, v47, v48);
          v49 = objc_claimAutoreleasedReturnValue();
        }
        v25 = (void *)v49;
LABEL_19:

LABEL_20:
        if (v25)
          goto LABEL_21;
        if (*(_QWORD *)(v7 + 8) == 6)
        {

          objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v129, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/TextRecognition.framework/pt_BR.lm"), v130, v131, v132);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v159[0] = 0;
          v137 = objc_msgSend_checkResourceIsReachableAndReturnError_(v25, v133, (uint64_t)v159, v134, v135, v136);
          v138 = v159[0];
          if ((v137 & 1) == 0)
          {
            v155 = v138;

            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            log = (id)qword_1EF568E20;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_absoluteString(0, v140, v141, v142, v143, v144);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_debugDescription(v155, v146, v147, v148, v149, v150);
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)__str = 138412546;
              v163 = v145;
              v164 = 2112;
              v165 = v151;
              _os_log_impl(&dword_1BE607000, log, OS_LOG_TYPE_ERROR, "Failed to load n-gram model from TextRecognition.framework at location %@ with error %@", (uint8_t *)__str, 0x16u);

            }
            v25 = 0;
            v12 = 0;
            v18 = CFSTR("pt_BR");
LABEL_47:

LABEL_50:
            return v12;
          }

          v18 = CFSTR("pt_BR");
          if (v25)
          {
LABEL_21:
            objc_msgSend_path(v25, v66, v67, v68, v69, v70);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v25;
            v157 = v18;
            objc_msgSend_lastPathComponent(v155, v71, v72, v73, v74, v75);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByDeletingPathExtension(v76, v77, v78, v79, v80, v81);
            log = objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringByDeletingLastPathComponent(v155, v82, v83, v84, v85, v86);
            v87 = objc_claimAutoreleasedReturnValue();
            v88 = *MEMORY[0x1E0D43450];
            v167[0] = *MEMORY[0x1E0D434C8];
            v167[1] = v88;
            v168[0] = v18;
            v168[1] = MEMORY[0x1E0C9AAA0];
            v89 = *MEMORY[0x1E0D43468];
            v167[2] = *MEMORY[0x1E0D43478];
            v167[3] = v89;
            v153 = (void *)v87;
            v168[2] = v87;
            v168[3] = log;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v90, (uint64_t)v168, (uint64_t)v167, 4, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)LMLanguageModelCreate();
            if (v10)
            {
              bzero(v166, 0x400uLL);
              v152 = v92;
              objc_msgSend_lastPathComponent(v25, v93, v94, v95, v96, v97);
              v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v104 = (const char *)objc_msgSend_UTF8String(v98, v99, v100, v101, v102, v103);
              v105 = pathForResource("corpus.wid", v104, v166);

              if (v105)
              {
                v106 = fopen((const char *)v166, "r");
                if (fgets(__str, 4096, v106))
                {
                  v107 = v10 + 1;
                  do
                  {
                    v108 = strtok(__str, " \t\n\r\b");
                    if (v108)
                    {
                      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v109, (uint64_t)v108, v110, v111, v112);
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      CodepointInString = objc_msgSend_firstCodepointInString(v113, v114, v115, v116, v117, v118);

                      v158 = 0;
                      v120 = strtok(0, " \t\n\r\b");
                      if (v120)
                      {
                        sscanf(v120, "%d", &v158);
                        v121 = v158;
                        v122 = *v107;
                        v123 = v10 + 1;
                        v124 = v10 + 1;
                        if (*v107)
                        {
                          while (1)
                          {
                            while (1)
                            {
                              v124 = (uint64_t **)v122;
                              v125 = *((_DWORD *)v122 + 7);
                              if (CodepointInString >= v125)
                                break;
                              v122 = *v124;
                              v123 = v124;
                              if (!*v124)
                                goto LABEL_37;
                            }
                            if (v125 >= CodepointInString)
                              break;
                            v122 = v124[1];
                            if (!v122)
                            {
                              v123 = v124 + 1;
                              goto LABEL_37;
                            }
                          }
                          v126 = v124;
                        }
                        else
                        {
LABEL_37:
                          v126 = operator new(0x28uLL);
                          v126[7] = CodepointInString;
                          v126[8] = 0;
                          *(_QWORD *)v126 = 0;
                          *((_QWORD *)v126 + 1) = 0;
                          *((_QWORD *)v126 + 2) = v124;
                          *v123 = (uint64_t *)v126;
                          v127 = (uint64_t *)**v10;
                          v128 = (uint64_t *)v126;
                          if (v127)
                          {
                            *v10 = v127;
                            v128 = *v123;
                          }
                          sub_1BE61F5C0(v10[1], v128);
                          v10[2] = (uint64_t *)((char *)v10[2] + 1);
                        }
                        v126[8] = v121;
                        v25 = v156;
                        v18 = v157;
                      }
                    }
                  }
                  while (fgets(__str, 4096, v106));
                }
                fclose(v106);
              }
              v92 = v152;
            }

            goto LABEL_47;
          }
        }
        else
        {
          v25 = 0;
        }
        v12 = 0;
        goto LABEL_50;
      }
    }
  }
  return 0;
}

- (id)newOVSStringCheckerWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v8;
  int v9;
  uint64_t v13;
  unint64_t language;
  uint64_t v15;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CHStringOVSChecker *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  char v34[1024];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v8 = mode > 6;
  v9 = (1 << mode) & 0x76;
  if (v8 || v9 == 0)
    return 0;
  v13 = objc_msgSend_requiredInappropriateFilteringFlags(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  language = self->_language;
  v8 = language > 0x17;
  v15 = (1 << language) & 0xE80000;
  if (v8 || v15 == 0)
  {
    v23 = 0;
  }
  else
  {
    bzero(v34, 0x400uLL);
    firstMatchingResourceForLocale(self->_locale, &stru_1E77F6F28, CFSTR("odat"), (UInt8 *)v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v17, (uint64_t)v34, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFBurstTrieCreateFromFile();

    }
    else
    {
      v23 = 0;
    }

  }
  v25 = [CHStringOVSChecker alloc];
  v31 = objc_msgSend_lexiconStringNormalizationFunction(self, v26, v27, v28, v29, v30);
  v24 = (void *)objc_msgSend_initWithTrie_staticLexicon_customLexicon_flags_stringNormalizationFunction_(v25, v32, v23, (uint64_t)a3, (uint64_t)a4, v13, v31);
  if (v23)
    CFBurstTrieRelease();
  return v24;
}

- (id)newPatternFST
{
  unsigned int mode;
  BOOL v3;
  int v4;
  BOOL v5;
  CHPatternNetwork *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!self)
    return 0;
  mode = self->_mode;
  v3 = mode > 6;
  v4 = (1 << mode) & 0x76;
  v5 = v3 || v4 == 0;
  if (v5 || self->_enableGen2ModelIfAvailable)
    return 0;
  v7 = [CHPatternNetwork alloc];
  return (id)objc_msgSend_initWithFile_(v7, v8, (uint64_t)CFSTR("P.bin"), v9, v10, v11);
}

- (id)sharedPostProcessingFST
{
  unsigned int mode;
  BOOL v3;
  int v4;
  BOOL v5;

  if (self)
  {
    mode = self->_mode;
    v3 = mode > 6;
    v4 = (1 << mode) & 0x76;
    v5 = v3 || v4 == 0;
    if (v5 || !self->_enableGen2ModelIfAvailable)
    {
      self = 0;
    }
    else
    {
      if (qword_1EF5683D0 != -1)
        dispatch_once(&qword_1EF5683D0, &unk_1E77F58B8);
      self = (CHRecognizerConfiguration *)(id)qword_1EF5683C8;
    }
  }
  return self;
}

- (void)newGrammarFST
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v7;
  int v8;
  BOOL v9;
  void *v10;
  char __s[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v7 = mode > 6;
  v8 = (1 << mode) & 0x76;
  v9 = v7 || v8 == 0;
  if (v9 || self->_language - 19 > 1 || (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) != 0)
    return 0;
  if (!pathForResource("G.bin", 0, (UInt8 *)__s))
    return 0;
  v10 = (void *)operator new();
  sub_1BE81B52C((uint64_t)v10, __s, 1);
  return v10;
}

- (void)newRadicalClusterFST
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int mode;
  BOOL v7;
  int v8;
  BOOL v9;
  void *v10;
  char __s[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v7 = mode > 6;
  v8 = (1 << mode) & 0x76;
  v9 = v7 || v8 == 0;
  if (v9 || self->_language - 19 > 1 || (objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) != 0)
    return 0;
  if (!pathForResource("R.bin", 0, (UInt8 *)__s))
    return 0;
  v10 = (void *)operator new();
  sub_1BE81B52C((uint64_t)v10, __s, 1);
  return v10;
}

- (id)newMecabraWrapper
{
  if (self->_language - 19 > 2)
    return 0;
  else
    return objc_alloc_init(CHMecabraWrapper);
}

- (VariantMap)newTransliterationVariantMap
{
  unsigned int mode;
  BOOL v4;
  int v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  VariantMap *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  _BOOL4 v26;
  void *v27;
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
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  _BOOL4 v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  unint64_t script;
  unint64_t language;
  int v74;
  void *v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  char *v81;
  char v82[1024];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  mode = self->_mode;
  v4 = mode > 6;
  v5 = (1 << mode) & 0x76;
  v6 = v4 || v5 == 0;
  if (v6 || self->_language - 1 > 0x1A)
    return 0;
  bzero(v82, 0x400uLL);
  firstMatchingResourceForLocale(self->_locale, CFSTR("synthetics_"), CFSTR("txt"), (UInt8 *)v82);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_8:
    v12 = (VariantMap *)operator new();
    VariantMap::VariantMap(v12, v82);
  }
  else
  {
    switch(self->_script)
    {
      case 1uLL:
        objc_msgSend_stringByAppendingString_(CFSTR("synthetics_"), v7, (uint64_t)CFSTR("en"), v8, v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathExtension_(v13, v14, (uint64_t)CFSTR("txt"), v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_retainAutorelease(v18);
        v25 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22, v23, v24);
        v26 = pathForResource(v25, 0, (UInt8 *)v82);
        goto LABEL_15;
      case 2uLL:
        objc_msgSend_stringByAppendingString_(CFSTR("synthetics_"), v7, (uint64_t)CFSTR("zh-Hans"), v8, v9, v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathExtension_(v27, v28, (uint64_t)CFSTR("txt"), v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_retainAutorelease(v32);
        v38 = (const char *)objc_msgSend_UTF8String(v19, v33, v34, v35, v36, v37);
        v26 = pathForResource(v38, 0, (UInt8 *)v82);
        goto LABEL_15;
      case 3uLL:
        objc_msgSend_stringByAppendingString_(CFSTR("synthetics_"), v7, (uint64_t)CFSTR("zh-Hant"), v8, v9, v10);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathExtension_(v39, v40, (uint64_t)CFSTR("txt"), v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_retainAutorelease(v44);
        v50 = (const char *)objc_msgSend_UTF8String(v19, v45, v46, v47, v48, v49);
        v26 = pathForResource(v50, 0, (UInt8 *)v82);
        goto LABEL_15;
      case 8uLL:
        objc_msgSend_stringByAppendingString_(CFSTR("synthetics_"), v7, (uint64_t)CFSTR("ar"), v8, v9, v10);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingPathExtension_(v51, v52, (uint64_t)CFSTR("txt"), v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_retainAutorelease(v56);
        v62 = (const char *)objc_msgSend_UTF8String(v19, v57, v58, v59, v60, v61);
        v26 = pathForResource(v62, 0, (UInt8 *)v82);
LABEL_15:
        v63 = v26;

        if (!v63)
          goto LABEL_16;
        goto LABEL_8;
      default:
LABEL_16:
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v64 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend_debugDescription(self->_locale, v65, v66, v67, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          language = self->_language;
          script = self->_script;
          v74 = 138413058;
          v75 = v70;
          v76 = 2048;
          v77 = script;
          v78 = 2048;
          v79 = language;
          v80 = 2080;
          v81 = v82;
          _os_log_impl(&dword_1BE607000, v64, OS_LOG_TYPE_FAULT, "Resource for transliteration map not found for locale \"%@\" (script=%lu, language=%lu) with resource path \"%s\", (uint8_t *)&v74, 0x2Au);

        }
        v12 = 0;
        break;
    }
  }

  return v12;
}

- (CHNeuralNetwork)newRecognitionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHNeuralNetwork *v11;
  id v12;
  unsigned int mode;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t language;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
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
  const char *v35;
  uint64_t v36;
  size_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  BOOL v48;
  NSObject *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  size_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  void *v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  void *__p[2];
  unint64_t v77;
  void *__dst[2];
  unint64_t v79;
  uint8_t buf[4];
  id v81;
  char __s[1024];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5) & 1) == 0)
  {
    v12 = 0;
    mode = self->_mode;
    if (mode > 6)
    {
      v11 = 0;
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D628];
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      if (((1 << mode) & 0x76) != 0)
      {
        language = self->_language;
        if (language - 19 <= 1)
        {
          objc_msgSend_stringByAppendingPathExtension_(CFSTR("zh"), v7, (uint64_t)CFSTR("bundle"), v8, v9, v10);
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = (const char *)objc_msgSend_UTF8String(v12, v19, v20, v21, v22, v23);
          if (!pathForResource(v24, 0, (UInt8 *)__s))
          {
            objc_msgSend_stringByAppendingPathExtension_(CFSTR("zh_compact"), v25, (uint64_t)CFSTR("bundle"), v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = objc_retainAutorelease(v29);
            v35 = (const char *)objc_msgSend_UTF8String(v12, v30, v31, v32, v33, v34);
            if (pathForResource(v35, 0, (UInt8 *)__s))
            {
              v36 = 1;
              v37 = strlen(__s);
              if (v37 > 0x7FFFFFFFFFFFFFF7)
                goto LABEL_9;
              goto LABEL_41;
            }
LABEL_20:
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v49 = (id)qword_1EF568E18[0];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v81 = v12;
              _os_log_impl(&dword_1BE607000, v49, OS_LOG_TYPE_FAULT, "Error loading model resource from path=%@", buf, 0xCu);
            }

            v11 = 0;
            goto LABEL_50;
          }
LABEL_40:
          v36 = 0;
          v37 = strlen(__s);
          if (v37 > 0x7FFFFFFFFFFFFFF7)
LABEL_9:
            sub_1BE61F1B4();
LABEL_41:
          v71 = (void *)v37;
          if (v37 >= 0x17)
          {
            v73 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v37 | 7) != 0x17)
              v73 = v37 | 7;
            v74 = v73 + 1;
            v72 = (void **)operator new(v73 + 1);
            __dst[1] = v71;
            v79 = v74 | 0x8000000000000000;
            __dst[0] = v72;
          }
          else
          {
            HIBYTE(v79) = v37;
            v72 = __dst;
            if (!v37)
            {
LABEL_48:
              *((_BYTE *)v71 + (_QWORD)v72) = 0;
              v11 = (CHNeuralNetwork *)sub_1BE63A2D8((uint64_t)__dst, (const char *)v36, 1u, v15, v14, v17, v16, v38, v39, v40);
              if (SHIBYTE(v79) < 0)
                operator delete(__dst[0]);
              goto LABEL_50;
            }
          }
          memcpy(v72, __s, (size_t)v71);
          goto LABEL_48;
        }
        if (self->_script == 1)
        {
          v15 = *MEMORY[0x1E0C9D648];
          v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          if (mode == 1)
          {
            objc_msgSend_stringByAppendingPathExtension_(CFSTR("vo_en_compact"), v7, (uint64_t)CFSTR("bundle"), v8, v9, v10);
            v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v70 = (const char *)objc_msgSend_UTF8String(v12, v65, v66, v67, v68, v69);
            v48 = pathForResource(v70, 0, (UInt8 *)__s);
            goto LABEL_39;
          }
          if (mode == 5)
          {
            v41 = CFSTR("vo_other");
            if (language == 5)
              v41 = CFSTR("vo_de");
            if (language == 1)
              objc_msgSend_stringByAppendingPathExtension_(CFSTR("vo_en_compact"), v7, (uint64_t)CFSTR("bundle"), v8, v9, v10);
            else
              objc_msgSend_stringByAppendingPathExtension_(v41, v7, (uint64_t)CFSTR("bundle"), v8, v9, v10);
            v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v47 = (const char *)objc_msgSend_UTF8String(v12, v42, v43, v44, v45, v46);
            v48 = pathForResource(v47, 0, (UInt8 *)__s);
LABEL_39:
            if (!v48)
              goto LABEL_20;
            goto LABEL_40;
          }
        }
        v12 = 0;
        goto LABEL_20;
      }
      v11 = 0;
      if (mode == 3)
      {
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("is"), v7, (uint64_t)CFSTR("bundle"), v8, v9, v10);
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v56 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53, v54, v55);
        pathForResource(v56, 0, (UInt8 *)__s);

        v57 = strlen(__s);
        if (v57 > 0x7FFFFFFFFFFFFFF7)
          sub_1BE61F1B4();
        v61 = (void *)v57;
        if (v57 >= 0x17)
        {
          v63 = (v57 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v57 | 7) != 0x17)
            v63 = v57 | 7;
          v64 = v63 + 1;
          v62 = operator new(v63 + 1);
          __p[1] = v61;
          v77 = v64 | 0x8000000000000000;
          __p[0] = v62;
        }
        else
        {
          HIBYTE(v77) = v57;
          v62 = __p;
          if (!v57)
            goto LABEL_35;
        }
        memcpy(v62, __s, (size_t)v61);
LABEL_35:
        *((_BYTE *)v61 + (_QWORD)v62) = 0;
        v11 = (CHNeuralNetwork *)sub_1BE63A2D8((uint64_t)__p, 0, 1u, v15, v14, v17, v16, v58, v59, v60);
        if (SHIBYTE(v77) < 0)
          operator delete(__p[0]);
        v12 = 0;
      }
    }
LABEL_50:

    return v11;
  }
  return 0;
}

+ (id)parametersOverride
{
  return 0;
}

+ (void)setParametersOverride:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "not supported", v4, 2u);
  }

}

- (id)newCTCRecognitionModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (**v23)(_QWORD, _QWORD);
  void *v24;
  unsigned int mode;
  unint64_t language;
  unint64_t v27;
  void *v28;
  CHCTCRecognitionModel *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  __CFString *v58;
  id v59;
  NSObject *v60;
  float v62;
  CHCTCRecognitionModel *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  __CFString *v88;
  CHCTCRecognitionModel *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  __CFString *v114;
  CHCTCRecognitionModel *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  float v146;
  CHCTCRecognitionModel *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  CHCTCRecognitionModel *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  CHCTCRecognitionModel *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  NSObject *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  CHCTCRecognitionModel *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  NSObject *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  __int128 v246;
  uint64_t v247;
  __int128 v248;
  uint64_t v249;
  __int128 v250;
  uint64_t v251;
  __int128 v252;
  uint64_t v253;
  uint64_t v254;
  int v255;
  float v256;
  uint64_t v257;
  uint64_t v258;
  int v259;
  float v260;
  uint64_t v261;
  __int128 v262;
  uint64_t v263;
  __int128 v264;
  uint64_t v265;
  _QWORD v266[4];
  id v267;
  uint8_t buf[4];
  void *v269;
  __int16 v270;
  const __CFString *v271;
  __int16 v272;
  void *v273;
  uint64_t v274;

  v274 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5))
    return 0;
  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v12, v13, (uint64_t)CFSTR("com.apple.corehandwriting"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v266[0] = MEMORY[0x1E0C809B0];
  v266[1] = 3221225472;
  v266[2] = sub_1BE817878;
  v266[3] = &unk_1E77F58E0;
  v18 = v17;
  v267 = v18;
  v23 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1C3B81A84](v266);
  v24 = 0;
  mode = self->_mode;
  if (mode <= 6 && ((1 << mode) & 0x56) != 0)
  {
    if (self->_contentType == 6)
      language = 1;
    else
      language = self->_language;
    v27 = language - 1;
    switch(language)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_latn"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = [CHCTCRecognitionModel alloc];
        v264 = xmmword_1BE8DFCD0;
        v265 = 20;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v29, v30, (uint64_t)v28, (uint64_t)&v264, v31, v32);
        objc_msgSend_setNormalizeFeatures_(v24, v33, 0, v34, v35, v36);
        objc_msgSend_setInterpointDistance_(v24, v37, v38, v39, v40, v41, 0.05);
        objc_msgSend_setStrokeOrdering_(v24, v42, 1, v43, v44, v45);
        v46 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_latn"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v47, v46, v48, v49, v50);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v51 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v52, v53, v54, v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          if (v27 > 0x11)
            v58 = 0;
          else
            v58 = off_1E77F5D18[v27];
          *(_DWORD *)buf = 138412802;
          v269 = v57;
          v270 = 2112;
          v271 = v58;
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v51, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v60 = (id)qword_1EF568E18[0];
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x13uLL:
      case 0x14uLL:
        if (mode == 2)
          v62 = -6.9078;
        else
          v62 = -3.912;
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_zh"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = [CHCTCRecognitionModel alloc];
        v259 = 0;
        v258 = 1;
        v260 = v62;
        v261 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v63, v64, (uint64_t)v28, (uint64_t)&v258, v65, v66);
        objc_msgSend_setNormalizeFeatures_(v24, v67, 0, v68, v69, v70);
        objc_msgSend_setInterpointDistance_(v24, v71, v72, v73, v74, v75, 0.1);
        v76 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_zh"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v77, v76, v78, v79, v80);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v81 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v82, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1BE8119A8((uint64_t)CHRecognizerConfiguration, language);
          v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v269 = v87;
          v270 = 2112;
          v271 = v88;
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v81, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x15uLL:
        if (mode == 2)
          v146 = -6.9078;
        else
          v146 = -3.912;
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_ja"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = [CHCTCRecognitionModel alloc];
        v255 = 0;
        v254 = 1;
        v256 = v146;
        v257 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v147, v148, (uint64_t)v28, (uint64_t)&v254, v149, v150);
        objc_msgSend_setNormalizeFeatures_(v24, v151, 0, v152, v153, v154);
        objc_msgSend_setInterpointDistance_(v24, v155, v156, v157, v158, v159, 0.1);
        v160 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_ja"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v161, v160, v162, v163, v164);
        CHOSLogForCategory(1);
        v165 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v166, v167, v168, v169, v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          *(_DWORD *)buf = 138412802;
          v269 = v171;
          v270 = 2112;
          v271 = CFSTR("Japanese");
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v165, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x16uLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_ko"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v172 = [CHCTCRecognitionModel alloc];
        v250 = xmmword_1BE8DFCE8;
        v251 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v172, v173, (uint64_t)v28, (uint64_t)&v250, v174, v175);
        objc_msgSend_setNormalizeFeatures_(v24, v176, 0, v177, v178, v179);
        objc_msgSend_setInterpointDistance_(v24, v180, v181, v182, v183, v184, 0.1);
        v185 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_ko"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v186, v185, v187, v188, v189);
        CHOSLogForCategory(1);
        v190 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v191, v192, v193, v194, v195);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          *(_DWORD *)buf = 138412802;
          v269 = v196;
          v270 = 2112;
          v271 = CFSTR("Korean");
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v190, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x17uLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_th"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = [CHCTCRecognitionModel alloc];
        v252 = xmmword_1BE8DFCE8;
        v253 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v197, v198, (uint64_t)v28, (uint64_t)&v252, v199, v200);
        objc_msgSend_setNormalizeFeatures_(v24, v201, 0, v202, v203, v204);
        objc_msgSend_setInterpointDistance_(v24, v205, v206, v207, v208, v209, 0.1);
        v210 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_th"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v211, v210, v212, v213, v214);
        CHOSLogForCategory(1);
        v215 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v216, v217, v218, v219, v220);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          *(_DWORD *)buf = 138412802;
          v269 = v221;
          v270 = 2112;
          v271 = CFSTR("Thai");
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v215, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x18uLL:
      case 0x19uLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_cyrl"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = [CHCTCRecognitionModel alloc];
        v248 = xmmword_1BE8DFCE8;
        v249 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v89, v90, (uint64_t)v28, (uint64_t)&v248, v91, v92);
        objc_msgSend_setNormalizeFeatures_(v24, v93, 0, v94, v95, v96);
        objc_msgSend_setInterpointDistance_(v24, v97, v98, v99, v100, v101, 0.05);
        v102 = ((uint64_t (**)(_QWORD, const __CFString *))v23)[2](v23, CFSTR("ctc_cyrl"));
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v103, v102, v104, v105, v106);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v107 = (id)qword_1EF568E20;
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v108, v109, v110, v111, v112);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1BE8119A8((uint64_t)CHRecognizerConfiguration, language);
          v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v269 = v113;
          v270 = 2112;
          v271 = v114;
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v107, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      case 0x1AuLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_ar"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = [CHCTCRecognitionModel alloc];
        v246 = xmmword_1BE8DFCE8;
        v247 = 0xFFFFFFFFLL;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v115, v116, (uint64_t)v28, (uint64_t)&v246, v117, v118);
        objc_msgSend_setNormalizeFeatures_(v24, v119, 0, v120, v121, v122);
        objc_msgSend_setInterpointDistance_(v24, v123, v124, v125, v126, v127, 0.05);
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v128, 1, v129, v130, v131);
        objc_msgSend_setShouldUseStrokeDirectionFeature_(v24, v132, 1, v133, v134, v135);
        objc_msgSend_setShouldUseArabicVisualOrderFeatureExtraction_(v24, v136, 1, v137, v138, v139);
        CHOSLogForCategory(1);
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v140, v141, v142, v143, v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          *(_DWORD *)buf = 138412802;
          v269 = v145;
          v270 = 2112;
          v271 = CFSTR("Arabic");
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v60, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        goto LABEL_23;
      case 0x1BuLL:
        objc_msgSend_stringByAppendingPathExtension_(CFSTR("ctc_vi"), v19, (uint64_t)CFSTR("bundle"), v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = [CHCTCRecognitionModel alloc];
        v262 = xmmword_1BE8DFCD0;
        v263 = 20;
        v24 = (void *)objc_msgSend_initWithModelName_decodingPruningPolicy_(v222, v223, (uint64_t)v28, (uint64_t)&v262, v224, v225);
        objc_msgSend_setNormalizeFeatures_(v24, v226, 0, v227, v228, v229);
        objc_msgSend_setInterpointDistance_(v24, v230, v231, v232, v233, v234, 0.1);
        objc_msgSend_setShouldUseCPPFeatureExtraction_(v24, v235, 1, v236, v237, v238);
        CHOSLogForCategory(1);
        v239 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_localeIdentifier(self->_locale, v240, v241, v242, v243, v244);
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          *(_DWORD *)buf = 138412802;
          v269 = v245;
          v270 = 2112;
          v271 = CFSTR("Vietnamese");
          v272 = 2112;
          v273 = v28;
          _os_log_impl(&dword_1BE607000, v239, OS_LOG_TYPE_DEFAULT, "configuration locale %@, effective language %@, recognition engine %@", buf, 0x20u);

        }
        if (v24)
          goto LABEL_24;
        CHOSLogForCategory(0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v269 = v28;
        break;
      default:
        v24 = 0;
        goto LABEL_25;
    }
    _os_log_impl(&dword_1BE607000, v60, OS_LOG_TYPE_FAULT, "An error occurred when loading the CTC model %@", buf, 0xCu);
LABEL_22:
    v24 = 0;
LABEL_23:

LABEL_24:
  }
LABEL_25:
  v59 = v24;

  return v59;
}

- (id)newPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 phraseLexicon:(_LXLexicon *)a5 customPhraseLexicon:(_LXLexicon *)a6 textReplacements:(id)a7 postProcessingFST:(id)a8 wordLM:(void *)a9 mecabraWrapper:(id)a10 ovsStringChecker:(id)a11 spellChecker:(id)a12 lmVocabulary:(void *)a13 maxResultCount:(int64_t)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned int mode;
  BOOL v29;
  int v30;
  BOOL v31;
  id v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  CHTransliterateConfusableCharactersArabicStep *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CHVisualToLogicalTransformStep *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
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
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  CHRemoveSpacesFromStrongURLsAndEmailsStep *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  CHCleanUpSpacesStep *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
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
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  CHReorderSCTCConfusionStep *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  CHRemoveInvalidArabicDiacriticsStep *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  CHJapaneseTokenizationAndConversionStep *v193;
  const char *v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  CHSemanticTokenizerStep *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  unint64_t language;
  CHRemoveSpacesFromEnglishAndKoreanParticlesStep *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t PseudoTokens;
  CHLexiconCorrectionStep *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t shouldAutoCorrect;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t shouldAutoCapitalize;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  void *PseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  CHSpellCorrectionCandidatesStep *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  CHPromoteInLexiconCandidatesStep *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t shouldAddAlternativeWidthCandidates;
  CHTransliterateHalfWidthPunctuationStep *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *ShouldAddAlternatives;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  CHOpeningClosingCharacterMatchingStep *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  CHTransliterateChineseJapaneseStep *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t shouldTransliterateSentencesSCTC;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  CHCandidateRefinementStep *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t shouldKeepOutOfPatternCandidates;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
  void *shouldKeepOriginalSpelling;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  CHMultiWordOVSFilteringStep *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  CHIdentifyLowAlignmentConfidenceColumnsStep *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  CHMarkNoWhiteSpaceColumnsChangeableStep *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  CHRemoveSpacesFromHashtagsAndMentionsStep *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  CHRemoveSpacesFromSpecialFieldsStep *v422;
  const char *v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  CHNumberFieldResultReorderingStep *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  CHRemoveSpacesFromSpecialFieldsStep *v440;
  const char *v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  CHNumberFieldResultReorderingStep *v447;
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
  CHPostProcessingManager *v458;
  const char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  void *v463;
  CHPostProcessingManager *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  void *v469;
  CHPostProcessingManager *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  CHPostProcessingManager *v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  void *v481;
  CHPostProcessingManager *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  void *v487;
  CHTextFieldTypeSwitchStep *v488;
  const char *v489;
  void *inited;
  CHPostProcessingManager *v491;
  const char *v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  CHTransliterateConfusableCharactersStep *v497;
  const char *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  void *v503;
  const char *v504;
  uint64_t v505;
  void *v506;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  CHTransliterateIsolatedConfusableCharactersStep *v511;
  const char *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  id v516;
  id v517;
  _LXLexicon *v518;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  id v524;
  id v525;
  CHPreserveOriginalRecognitionStep *v526;
  id v527;

  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = a11;
  v27 = a12;
  if (!self)
    goto LABEL_51;
  mode = self->_mode;
  v29 = mode > 6;
  v30 = (1 << mode) & 0x76;
  v31 = v29 || v30 == 0;
  if (v31 || (objc_msgSend_shouldRunNextGenRecognizer(self, v22, v23, v24, v25, v26) & 1) == 0)
  {
    self = 0;
    goto LABEL_51;
  }
  v517 = v20;
  v518 = a3;
  v521 = (uint64_t)v27;
  v522 = (uint64_t)v21;
  v523 = (uint64_t)v19;
  v516 = v18;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v525 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v527 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v524 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v526 = objc_alloc_init(CHPreserveOriginalRecognitionStep);
  objc_msgSend_addObject_(v32, v34, (uint64_t)v526, v35, v36, v37);
  objc_msgSend_addObject_(v33, v38, (uint64_t)v526, v39, v40, v41);
  objc_msgSend_addObject_(v525, v42, (uint64_t)v526, v43, v44, v45);
  objc_msgSend_addObject_(v527, v46, (uint64_t)v526, v47, v48, v49);
  objc_msgSend_addObject_(v524, v50, (uint64_t)v526, v51, v52, v53);
  if (objc_msgSend_shouldPerformArabicPostProcessing(self, v54, v55, v56, v57, v58))
  {
    v64 = objc_alloc_init(CHTransliterateConfusableCharactersArabicStep);
    objc_msgSend_addObject_(v32, v65, (uint64_t)v64, v66, v67, v68);
    objc_msgSend_addObject_(v33, v69, (uint64_t)v64, v70, v71, v72);
    v73 = [CHVisualToLogicalTransformStep alloc];
    v79 = objc_msgSend_baseWritingDirection(self, v74, v75, v76, v77, v78);
    v85 = objc_msgSend_mode(self, v80, v81, v82, v83, v84);
    v89 = (void *)objc_msgSend_initWithBaseDirection_mode_(v73, v86, v79, v85, v87, v88);
    objc_msgSend_addObject_(v32, v90, (uint64_t)v89, v91, v92, v93);
    objc_msgSend_addObject_(v33, v94, (uint64_t)v89, v95, v96, v97);
    objc_msgSend_addObject_(v525, v98, (uint64_t)v89, v99, v100, v101);
    objc_msgSend_addObject_(v527, v102, (uint64_t)v89, v103, v104, v105);
    objc_msgSend_addObject_(v524, v106, (uint64_t)v89, v107, v108, v109);

  }
  v110 = self->_mode;
  if (v110 == 4 || v110 == 2)
  {
    v111 = [CHRemoveSpacesFromStrongURLsAndEmailsStep alloc];
    v116 = (void *)objc_msgSend_initWithPatternFst_(v111, v112, v523, v113, v114, v115);
    objc_msgSend_addObject_(v32, v117, (uint64_t)v116, v118, v119, v120);
    objc_msgSend_addObject_(v33, v121, (uint64_t)v116, v122, v123, v124);

  }
  if ((objc_msgSend_shouldRunLexiconCorrectionPostProcessingStep(self, v59, v60, v61, v62, v63) & 1) != 0
    || objc_msgSend_shouldConvertKanaInPostProcessing(self, v125, v126, v127, v128, v129))
  {
    v135 = [CHCleanUpSpacesStep alloc];
    objc_msgSend_locale(self, v136, v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = (void *)objc_msgSend_initWithLocale_(v135, v142, (uint64_t)v141, v143, v144, v145);

    objc_msgSend_addObject_(v32, v147, (uint64_t)v146, v148, v149, v150);
    objc_msgSend_addObject_(v33, v151, (uint64_t)v146, v152, v153, v154);

  }
  if (objc_msgSend_shouldReorderSCTCConfusion(self, v130, v131, v132, v133, v134))
  {
    v160 = [CHReorderSCTCConfusionStep alloc];
    v165 = (void *)objc_msgSend_initWithMaxResultCount_(v160, v161, a14, v162, v163, v164);
    objc_msgSend_addObject_(v32, v166, (uint64_t)v165, v167, v168, v169);
    objc_msgSend_addObject_(v33, v170, (uint64_t)v165, v171, v172, v173);

  }
  if (objc_msgSend_shouldRemoveInvalidArabicDiacritics(self, v155, v156, v157, v158, v159))
  {
    v179 = objc_alloc_init(CHRemoveInvalidArabicDiacriticsStep);
    objc_msgSend_addObject_(v32, v180, (uint64_t)v179, v181, v182, v183);
    objc_msgSend_addObject_(v33, v184, (uint64_t)v179, v185, v186, v187);

  }
  if (objc_msgSend_shouldConvertKanaInPostProcessing(self, v174, v175, v176, v177, v178))
  {
    v193 = [CHJapaneseTokenizationAndConversionStep alloc];
    v195 = (void *)objc_msgSend_initWithMecabra_wordLanguageModel_ovsStringChecker_promoteKanaConversion_(v193, v194, (uint64_t)v20, (uint64_t)a9, (uint64_t)v21, 0);
    objc_msgSend_addObject_(v32, v196, (uint64_t)v195, v197, v198, v199);
    objc_msgSend_addObject_(v33, v200, (uint64_t)v195, v201, v202, v203);

  }
  if (objc_msgSend_shouldApplySemanticTokenization(self, v188, v189, v190, v191, v192))
  {
    v209 = [CHSemanticTokenizerStep alloc];
    v213 = (void *)objc_msgSend_initWithWordLanguageModel_ovsStringChecker_(v209, v210, (uint64_t)a9, (uint64_t)v21, v211, v212);
    objc_msgSend_addObject_(v32, v214, (uint64_t)v213, v215, v216, v217);
    objc_msgSend_addObject_(v33, v218, (uint64_t)v213, v219, v220, v221);

  }
  language = self->_language;
  if (language - 4 >= 0xF && (language > 0x1A || ((1 << language) & 0x4800007) == 0))
  {
    v497 = [CHTransliterateConfusableCharactersStep alloc];
    objc_msgSend_locale(self, v498, v499, v500, v501, v502);
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    v506 = (void *)objc_msgSend_initWithStaticLexicon_customLexicon_locale_(v497, v504, (uint64_t)v518, (uint64_t)a4, (uint64_t)v503, v505);

    objc_msgSend_addObject_(v32, v507, (uint64_t)v506, v508, v509, v510);
    if (self->_script != 5)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (self->_script == 5)
  {
LABEL_27:
    v223 = objc_alloc_init(CHRemoveSpacesFromEnglishAndKoreanParticlesStep);
    objc_msgSend_addObject_(v32, v224, (uint64_t)v223, v225, v226, v227);
    objc_msgSend_addObject_(v33, v228, (uint64_t)v223, v229, v230, v231);

  }
LABEL_28:
  if (objc_msgSend_shouldRunLexiconCorrectionPostProcessingStep(self, v204, v205, v206, v207, v208))
  {
    PseudoTokens = objc_msgSend_shouldCreatePseudoTokens(self, v232, v233, v234, v235, v236);
    v238 = [CHLexiconCorrectionStep alloc];
    v244 = objc_msgSend_effectiveAutoCapitalizationMode(self, v239, v240, v241, v242, v243);
    shouldAutoCorrect = objc_msgSend_shouldAutoCorrect(self, v245, v246, v247, v248, v249);
    shouldAutoCapitalize = objc_msgSend_shouldAutoCapitalize(self, v251, v252, v253, v254, v255);
    objc_msgSend_locale(self, v257, v258, v259, v260, v261);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    PseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements = (void *)objc_msgSend_initWithAutoCapitalizationMode_shouldAutoCorrect_shouldAutoCapitalize_shouldCreatePseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements_(v238, v263, v244, shouldAutoCorrect, shouldAutoCapitalize, PseudoTokens, v262, v518, a4, a5, a6, v521, a13, v522, v516);

    objc_msgSend_addObject_(v32, v265, (uint64_t)PseudoTokens_locale_staticLexicon_customLexicon_phraseLexicon_customPhraseLexicon_spellChecker_lmVocabulary_ovsStringChecker_textReplacements, v266, v267, v268);
    v269 = [CHSpellCorrectionCandidatesStep alloc];
    objc_msgSend_locale(self, v270, v271, v272, v273, v274);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    v277 = (void *)objc_msgSend_initWithLocale_spellChecker_staticLexicon_customLexicon_(v269, v276, (uint64_t)v275, v521, (uint64_t)v518, (uint64_t)a4);

    objc_msgSend_addObject_(v32, v278, (uint64_t)v277, v279, v280, v281);
  }
  if (objc_msgSend_shouldPromoteInLexiconCandidates(self, v232, v233, v234, v235, v236))
  {
    v287 = [CHPromoteInLexiconCandidatesStep alloc];
    v291 = (void *)objc_msgSend_initWithStaticLexicon_customLexicon_(v287, v288, (uint64_t)v518, (uint64_t)a4, v289, v290);
    objc_msgSend_addObject_(v32, v292, (uint64_t)v291, v293, v294, v295);

  }
  if (objc_msgSend_shouldTransliterateHalfWidthPunctuations(self, v282, v283, v284, v285, v286))
  {
    shouldAddAlternativeWidthCandidates = objc_msgSend_shouldAddAlternativeWidthCandidates(self, v296, v297, v298, v299, v300);
    v302 = [CHTransliterateHalfWidthPunctuationStep alloc];
    ShouldAddAlternatives = (void *)objc_msgSend_initWithShouldAddAlternatives_(v302, v303, shouldAddAlternativeWidthCandidates, v304, v305, v306);
    objc_msgSend_addObject_(v32, v308, (uint64_t)ShouldAddAlternatives, v309, v310, v311);
    v312 = objc_alloc_init(CHOpeningClosingCharacterMatchingStep);
    objc_msgSend_addObject_(v32, v313, (uint64_t)v312, v314, v315, v316);

  }
  if (self->_script - 2 <= 2)
  {
    v317 = [CHTransliterateChineseJapaneseStep alloc];
    shouldTransliterateSentencesSCTC = objc_msgSend_shouldTransliterateSentencesSCTC(self, v318, v319, v320, v321, v322);
    v328 = (void *)objc_msgSend_initWithTransliterateSentences_(v317, v324, shouldTransliterateSentencesSCTC, v325, v326, v327);
    objc_msgSend_addObject_(v32, v329, (uint64_t)v328, v330, v331, v332);
    objc_msgSend_addObject_(v33, v333, (uint64_t)v328, v334, v335, v336);

  }
  if (objc_msgSend_shouldRefineCandidates(self, v296, v297, v298, v299, v300))
  {
    v342 = [CHCandidateRefinementStep alloc];
    shouldKeepOutOfPatternCandidates = objc_msgSend_shouldKeepOutOfPatternCandidates(self, v343, v344, v345, v346, v347);
    v354 = objc_msgSend_shouldTransliterateSentencesSCTC(self, v349, v350, v351, v352, v353);
    shouldKeepOriginalSpelling = (void *)objc_msgSend_initWithShouldKeepOutOfPatternCandidates_shouldKeepDuplicateTokenIDs_shouldKeepOutOfLexiconAlternatives_shouldKeepAlternativeLengths_shouldKeepSubstrings_shouldKeepOriginalSpelling_(v342, v355, shouldKeepOutOfPatternCandidates, v354, 0, 0, 0, 1);
    objc_msgSend_addObject_(v32, v357, (uint64_t)shouldKeepOriginalSpelling, v358, v359, v360);
    objc_msgSend_addObject_(v33, v361, (uint64_t)shouldKeepOriginalSpelling, v362, v363, v364);

  }
  v365 = self->_language;
  if (v365 - 4 >= 0xF && (v365 > 0x1A || ((1 << v365) & 0x4800007) == 0))
  {
    v511 = objc_alloc_init(CHTransliterateIsolatedConfusableCharactersStep);
    objc_msgSend_addObject_(v32, v512, (uint64_t)v511, v513, v514, v515);

  }
  if (objc_msgSend_shouldMarkMultiWordOVS(self, v337, v338, v339, v340, v341))
  {
    v371 = [CHMultiWordOVSFilteringStep alloc];
    v376 = (void *)objc_msgSend_initWithOVSStringChecker_(v371, v372, v522, v373, v374, v375);
    objc_msgSend_addObject_(v32, v377, (uint64_t)v376, v378, v379, v380);
    objc_msgSend_addObject_(v33, v381, (uint64_t)v376, v382, v383, v384);

  }
  if (objc_msgSend_shouldIdentifyChangeableColumns(self, v366, v367, v368, v369, v370))
  {
    v390 = objc_alloc_init(CHIdentifyLowAlignmentConfidenceColumnsStep);
    objc_msgSend_addObject_(v32, v391, (uint64_t)v390, v392, v393, v394);
    objc_msgSend_addObject_(v33, v395, (uint64_t)v390, v396, v397, v398);

  }
  if (objc_msgSend_shouldMarkNoWhiteSpaceColumnsChangeable(self, v385, v386, v387, v388, v389))
  {
    v404 = objc_alloc_init(CHMarkNoWhiteSpaceColumnsChangeableStep);
    objc_msgSend_addObject_(v32, v405, (uint64_t)v404, v406, v407, v408);
    objc_msgSend_addObject_(v33, v409, (uint64_t)v404, v410, v411, v412);

  }
  if (objc_msgSend_shouldRemoveSpacesFromHashtagsAndMentions(self, v399, v400, v401, v402, v403))
  {
    v413 = objc_alloc_init(CHRemoveSpacesFromHashtagsAndMentionsStep);
    objc_msgSend_addObject_(v32, v414, (uint64_t)v413, v415, v416, v417);
    objc_msgSend_addObject_(v33, v418, (uint64_t)v413, v419, v420, v421);

  }
  v422 = [CHRemoveSpacesFromSpecialFieldsStep alloc];
  v424 = (void *)objc_msgSend_initWithPatternFst_patternType_capitalizationToSplit_convertToLowercase_(v422, v423, v523, 10, 1, 1);
  objc_msgSend_addObject_(v525, v425, (uint64_t)v424, v426, v427, v428);

  v429 = [CHNumberFieldResultReorderingStep alloc];
  v435 = (void *)objc_msgSend_initForPhoneNumberFields(v429, v430, v431, v432, v433, v434);
  objc_msgSend_addObject_(v527, v436, (uint64_t)v435, v437, v438, v439);

  v440 = [CHRemoveSpacesFromSpecialFieldsStep alloc];
  v442 = (void *)objc_msgSend_initWithPatternFst_patternType_capitalizationToSplit_convertToLowercase_(v440, v441, v523, 8, 0, 0);
  objc_msgSend_addObject_(v527, v443, (uint64_t)v442, v444, v445, v446);

  v447 = [CHNumberFieldResultReorderingStep alloc];
  v453 = (void *)objc_msgSend_initForDigitFields(v447, v448, v449, v450, v451, v452);
  objc_msgSend_addObject_(v524, v454, (uint64_t)v453, v455, v456, v457);

  v458 = [CHPostProcessingManager alloc];
  v463 = (void *)objc_msgSend_initWithSequence_(v458, v459, (uint64_t)v32, v460, v461, v462);
  v464 = [CHPostProcessingManager alloc];
  v469 = (void *)objc_msgSend_initWithSequence_(v464, v465, (uint64_t)v33, v466, v467, v468);
  v470 = [CHPostProcessingManager alloc];
  v475 = (void *)objc_msgSend_initWithSequence_(v470, v471, (uint64_t)v525, v472, v473, v474);
  v476 = [CHPostProcessingManager alloc];
  v481 = (void *)objc_msgSend_initWithSequence_(v476, v477, (uint64_t)v527, v478, v479, v480);
  v482 = [CHPostProcessingManager alloc];
  v487 = (void *)objc_msgSend_initWithSequence_(v482, v483, (uint64_t)v524, v484, v485, v486);
  v488 = [CHTextFieldTypeSwitchStep alloc];
  inited = (void *)objc_msgSend_initProcessorDefault_processorDigits_processorPhone_processorUsername_processorEmail_processorURL_processorASCII_processorEquation_(v488, v489, (uint64_t)v463, (uint64_t)v487, (uint64_t)v481, (uint64_t)v475, v475, v469, v469, v469);
  v491 = [CHPostProcessingManager alloc];
  self = (CHRecognizerConfiguration *)objc_msgSend_initWithStep_(v491, v492, (uint64_t)inited, v493, v494, v495);

  v18 = v516;
  v20 = v517;
  v21 = (id)v522;
  v19 = (id)v523;
  v27 = (id)v521;
LABEL_51:

  return self;
}

- (id)newMergedResultPostProcessorWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 stringChecker:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unsigned int mode;
  BOOL v15;
  int v16;
  BOOL v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CHCyrillicAddAlternativeScriptCandidatesStep *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CHCyrillicRecoverConfusableWordsStep *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CHMultiWordOVSFilteringStep *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CHCandidateRefinementStep *v48;
  const char *v49;
  void *shouldKeepOriginalSpelling;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CHPostProcessingManager *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;

  v13 = a5;
  if (self
    && ((mode = self->_mode, v15 = mode > 6, v16 = (1 << mode) & 0x76, !v15) ? (v17 = v16 == 0) : (v17 = 1),
        !v17 && (objc_msgSend_shouldRunNextGenRecognizer(self, v8, v9, v10, v11, v12) & 1) != 0))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend_shouldRecoverCyrillicCandidates(self, v19, v20, v21, v22, v23))
    {
      v24 = [CHCyrillicAddAlternativeScriptCandidatesStep alloc];
      v28 = (void *)objc_msgSend_initWithStaticLexicon_customLexicon_(v24, v25, (uint64_t)a3, (uint64_t)a4, v26, v27);
      objc_msgSend_addObject_(v18, v29, (uint64_t)v28, v30, v31, v32);
      v33 = objc_alloc_init(CHCyrillicRecoverConfusableWordsStep);
      objc_msgSend_addObject_(v18, v34, (uint64_t)v33, v35, v36, v37);

    }
    v38 = [CHMultiWordOVSFilteringStep alloc];
    v43 = (void *)objc_msgSend_initWithOVSStringChecker_(v38, v39, (uint64_t)v13, v40, v41, v42);
    objc_msgSend_addObject_(v18, v44, (uint64_t)v43, v45, v46, v47);
    v48 = [CHCandidateRefinementStep alloc];
    shouldKeepOriginalSpelling = (void *)objc_msgSend_initWithShouldKeepOutOfPatternCandidates_shouldKeepDuplicateTokenIDs_shouldKeepOutOfLexiconAlternatives_shouldKeepAlternativeLengths_shouldKeepSubstrings_shouldKeepOriginalSpelling_(v48, v49, 1, 1, 1, 1, 1, 1);
    objc_msgSend_addObject_(v18, v51, (uint64_t)shouldKeepOriginalSpelling, v52, v53, v54);
    v55 = [CHPostProcessingManager alloc];
    v60 = (void *)objc_msgSend_initWithSequence_(v55, v56, (uint64_t)v18, v57, v58, v59);

  }
  else
  {
    v60 = 0;
  }

  return v60;
}

- (id)newCTCTextDecoderWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5
{
  uint64_t v5;
  const char *v10;
  uint64_t v11;
  unsigned int mode;
  BOOL v13;
  int v14;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  if (!objc_msgSend_shouldRunNextGenRecognizer(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5))
    return 0;
  mode = self->_mode;
  v13 = mode > 6;
  v14 = (1 << mode) & 0x56;
  if (v13 || v14 == 0)
    return 0;
  objc_msgSend_languageResourceBundleWithStaticLexicon_customLexicon_wordLanguageModel_(self, v10, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D09AB8]);
  v22 = (void *)objc_msgSend_initWithLanguageResourceBundle_(v17, v18, (uint64_t)v16, v19, v20, v21);

  return v22;
}

- (CHNeuralNetwork)newFreeFormEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CHNeuralNetwork *v18;
  uint64_t v19;
  uint64_t v20;
  void *__p[2];
  unint64_t v23;
  char __s[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_mode != 3)
    return 0;
  objc_msgSend_stringByAppendingPathExtension_(CFSTR("gd"), a2, (uint64_t)CFSTR("bundle"), v2, v3, v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (const char *)objc_msgSend_UTF8String(v5, v6, v7, v8, v9, v10);
  pathForResource(v11, 0, (UInt8 *)__s);

  v12 = strlen(__s);
  if (v12 >= 0x7FFFFFFFFFFFFFF8)
    sub_1BE61F1B4();
  v16 = (void *)v12;
  if (v12 >= 0x17)
  {
    v19 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v19 = v12 | 7;
    v20 = v19 + 1;
    v17 = operator new(v19 + 1);
    __p[1] = v16;
    v23 = v20 | 0x8000000000000000;
    __p[0] = v17;
    goto LABEL_10;
  }
  HIBYTE(v23) = v12;
  v17 = __p;
  if (v12)
LABEL_10:
    memcpy(v17, __s, (size_t)v16);
  *((_BYTE *)v16 + (_QWORD)v17) = 0;
  v18 = (CHNeuralNetwork *)sub_1BE63A2D8((uint64_t)__p, 0, 1u, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v13, v14, v15);
  if (SHIBYTE(v23) < 0)
    operator delete(__p[0]);
  return v18;
}

- (id)newCornerDetector
{
  CHCornerDetector *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (self->_mode != 3)
    return 0;
  v2 = objc_alloc_init(CHCornerDetector);
  objc_msgSend_setShouldUseDynamicSampling_(v2, v3, 0, v4, v5, v6);
  return v2;
}

- (int64_t)maxRecognitionResultDefaultCount
{
  if (self->_language - 19 < 2 || self->_mode == 3)
    return 15;
  else
    return 6;
}

+ (CGSize)defaultMinimumDrawingSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 11.0;
  v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)shouldUseStrokeReorderingForMode:(int)a3
{
  return a3 == 2;
}

- (int64_t)engineCandidateCount
{
  int64_t v2;

  v2 = 6;
  if (self->_mode == 5)
    v2 = 4;
  if (self->_language - 19 >= 2)
    return v2;
  else
    return 15;
}

- (id)decodingCommitActionBlock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  unint64_t language;
  BOOL v9;
  uint64_t v10;
  void *v12;

  objc_msgSend_defaultCommitActionBehaviorForLocale_(MEMORY[0x1E0D09AE8], a2, (uint64_t)self->_locale, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  language = self->_language;
  v9 = language > 0x17;
  v10 = (1 << language) & 0xB80000;
  if (!v9 && v10 != 0)
  {

    v7 = &unk_1E77F5920;
  }
  v12 = (void *)MEMORY[0x1C3B81A84](v7);

  return v12;
}

- (id)pathScoringFunctionForLanguageResourceBundle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(MEMORY[0x1E0D09AF8], v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_mode == 1)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1BE818C70;
    v15[3] = &unk_1E77F5948;
    v16 = v9;
    v11 = (void *)MEMORY[0x1C3B81A84](v15);
    v12 = (void *)MEMORY[0x1C3B81A84]();

  }
  else
  {
    v12 = (void *)MEMORY[0x1C3B81A84](v9);
  }
  v13 = (void *)MEMORY[0x1C3B81A84](v12);

  return v13;
}

- (unint64_t)mixedScriptPenalty
{
  unint64_t script;

  script = self->_script;
  if (script == 7)
    return 1;
  else
    return 2 * (script == 8);
}

- (id)languageResourceBundleWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4 wordLanguageModel:(void *)a5
{
  uint64_t v5;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  double v34;
  int contentType;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
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
  uint64_t v72;
  const char *v73;
  void *v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  unint64_t v82;
  int v83;
  int v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  float v96;
  double v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float v109;
  double v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  int v117;
  unint64_t v118;
  uint64_t v119;
  id v120;
  NSLocale *locale;
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
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  float v142;
  double v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  NSObject *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  float v155;
  double v156;
  void *v157;
  id v158;
  NSLocale *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  id v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  unint64_t script;
  unint64_t v179;
  unint64_t v180;
  void *v181;
  id v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const void *v197;
  id v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  unint64_t language;
  void *v213;
  id v214;
  void *v216;
  __int128 buf;
  uint64_t v218;
  _QWORD v219[2];
  _QWORD v220[3];

  v220[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self)
  {
LABEL_26:
    v74 = 0;
    if (qword_1EF568E88 != -1)
      goto LABEL_24;
    goto LABEL_27;
  }
  objc_msgSend_objectForKey_(0, v9, (uint64_t)CFSTR("DecodingLexiconWeight"), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (qword_1EF568E88 == -1)
    {
      v14 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        objc_msgSend_floatValue(v13, v15, v16, v17, v18, v19);
        v21 = v20;
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v14 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
    }
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "decodingLexiconWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_6;
  }
  contentType = self->_contentType;
  if ((contentType - 4) < 2)
  {
    v21 = 0.1;
  }
  else
  {
    v21 = 0.0;
    if (contentType == 3 || !contentType)
    {
      switch(self->_script)
      {
        case 0uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
          v21 = 0.3;
          break;
        case 1uLL:
          language = self->_language;
          if (language == 27)
            v21 = 0.2;
          else
            v21 = dbl_1BE8DFE50[language - 7 < 0xC];
          break;
        default:
          break;
      }
    }
  }
LABEL_7:

  objc_msgSend_objectForKey_(0, v22, (uint64_t)CFSTR("DecodingLexiconLowerBoundLogProbability"), v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (qword_1EF568E88 == -1)
    {
      v27 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        objc_msgSend_floatValue(v26, v28, v29, v30, v31, v32);
        v34 = v33;
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v27 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
    }
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v26;
    _os_log_impl(&dword_1BE607000, v27, OS_LOG_TYPE_DEFAULT, "decodingLexiconLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  v34 = -6.90775528;
LABEL_18:

  if (v21 <= 0.0)
    goto LABEL_26;
  if (a3)
  {
    v36 = objc_alloc(MEMORY[0x1E0D09AC8]);
    v40 = (void *)objc_msgSend_initWithLexicon_priority_(v36, v37, (uint64_t)a3, 1, v38, v39);
    objc_msgSend_addObject_(v216, v41, (uint64_t)v40, v42, v43, v44);

  }
  if (a4)
  {
    v45 = objc_alloc(MEMORY[0x1E0D09AC8]);
    v49 = (void *)objc_msgSend_initWithLexicon_priority_(v45, v46, (uint64_t)a4, 0, v47, v48);
    objc_msgSend_addObject_(v216, v50, (uint64_t)v49, v51, v52, v53);

  }
  v54 = objc_alloc(MEMORY[0x1E0D09AD0]);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v55, v56, v57, v58, v59, v21);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v61, v62, v63, v64, v65, v34);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend_lexiconStringNormalizationFunction(self, v67, v68, v69, v70, v71);
  v74 = (void *)objc_msgSend_initWithLexicons_decodingWeight_lowerBoundLogProbability_inputNormalizationFunction_(v54, v73, (uint64_t)v216, (uint64_t)v60, (uint64_t)v66, v72);

  if (qword_1EF568E88 != -1)
  {
LABEL_24:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v75 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    goto LABEL_28;
  }
LABEL_27:
  v75 = (id)qword_1EF568E20;
  if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    goto LABEL_36;
LABEL_28:
  if (self)
  {
    v81 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v76, v77, v78, v79, v80);
    v82 = self->_language - 1;
    if (((0x7F3FFFFu >> v82) & 1) != 0)
      v83 = 0;
    else
      v83 = v81;
    if (v82 <= 0x1A)
      v84 = v83;
    else
      v84 = v81;
  }
  else
  {
    v84 = 0;
  }
  LODWORD(buf) = 67109120;
  DWORD1(buf) = v84;
  _os_log_impl(&dword_1BE607000, v75, OS_LOG_TYPE_DEFAULT, "CHRecognizer is running rnn character language model: %d", (uint8_t *)&buf, 8u);
LABEL_36:

  if (!self)
  {
    v116 = 0;
    v157 = 0;
    goto LABEL_75;
  }
  objc_msgSend_objectForKey_(0, v85, (uint64_t)CFSTR("DecodingCharacterLMWeight"), v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    if (qword_1EF568E88 == -1)
    {
      v90 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        objc_msgSend_floatValue(v89, v91, v92, v93, v94, v95);
        v97 = v96;
        goto LABEL_42;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v90 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
    }
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v89;
    _os_log_impl(&dword_1BE607000, v90, OS_LOG_TYPE_DEFAULT, "decodingCharacterLMWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_41;
  }
  v97 = 0.0;
  switch(self->_script)
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
      v97 = 0.3;
      break;
    case 1uLL:
      v180 = self->_language;
      if (v180 != 27)
      {
        if (v180 - 7 >= 0xC)
          v97 = 0.219690248;
        else
          v97 = 0.0;
      }
      break;
    case 4uLL:
      v97 = 0.15;
      break;
    case 6uLL:
      v97 = 0.1;
      break;
    case 7uLL:
      v97 = 0.4;
      break;
    case 8uLL:
      v97 = 0.2;
      break;
    default:
      break;
  }
LABEL_42:

  objc_msgSend_objectForKey_(0, v98, (uint64_t)CFSTR("DecodingCharacterLMLowerBoundLogProbability"), v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    if (qword_1EF568E88 == -1)
    {
      v103 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
LABEL_46:

        objc_msgSend_floatValue(v102, v104, v105, v106, v107, v108);
        v110 = v109;
        goto LABEL_52;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v103 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
    }
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v102;
    _os_log_impl(&dword_1BE607000, v103, OS_LOG_TYPE_DEFAULT, "characterLMLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_46;
  }
  if (self->_script == 1)
    v110 = -6.90775528;
  else
    v110 = -1.79769313e308;
LABEL_52:

  if (v97 <= 0.0)
  {
LABEL_53:
    v116 = 0;
    goto LABEL_60;
  }
  v117 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v111, v112, v113, v114, v115);
  v118 = self->_language;
  if (v118 - 1 < 0x12 || v118 - 21 < 7)
    goto LABEL_56;
  if (!v117)
  {
    if (v118 <= 0x14 && ((1 << v118) & 0x180001) != 0)
      goto LABEL_53;
LABEL_56:
    *((_QWORD *)&buf + 1) = 0;
    v218 = 0;
    *(_QWORD *)&buf = (char *)&buf + 8;
    v119 = objc_msgSend_newCharacterLanguageModelAndMap_force_(self, v111, (uint64_t)&buf, 1, v114, v115);
    if (v119)
    {
      v120 = objc_alloc(MEMORY[0x1E0D09AC0]);
      locale = self->_locale;
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v122, v123, v124, v125, v126, v97);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v128, v129, v130, v131, v132, v110);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = (void *)objc_msgSend_initWithLMLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v120, v134, v119, (uint64_t)locale, (uint64_t)v127, (uint64_t)v133);

      LMLanguageModelRelease();
    }
    else
    {
      v116 = 0;
    }
    sub_1BE62033C((uint64_t)&buf, *((_QWORD **)&buf + 1));
    goto LABEL_60;
  }
  objc_msgSend_forcedGen2ModelLocaleForLocale_(CHRecognizerConfiguration, v111, (uint64_t)self->_locale, v113, v114, v115);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = v181;
  if (!v181)
    v181 = self->_locale;
  v182 = v181;
  v219[0] = *MEMORY[0x1E0D09B20];
  v214 = v182;
  objc_msgSend_localeIdentifier(v182, v183, v184, v185, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v188;
  v219[1] = *MEMORY[0x1E0D09B28];
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v189, 1, v190, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v193;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v194, (uint64_t)v220, (uint64_t)v219, 2, v195);
  v196 = (void *)objc_claimAutoreleasedReturnValue();

  v197 = (const void *)CVNLPLanguageModelCreate();
  if (v197)
  {
    v198 = objc_alloc(MEMORY[0x1E0D09AC0]);
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v199, v200, v201, v202, v203, v97, v213);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v205, v206, v207, v208, v209, v110);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)objc_msgSend_initWithCVNLPLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v198, v211, (uint64_t)v197, (uint64_t)v214, (uint64_t)v204, (uint64_t)v210);

    CFRelease(v197);
  }
  else
  {
    v116 = 0;
  }

LABEL_60:
  objc_msgSend_objectForKey_(0, v111, (uint64_t)CFSTR("DecodingWordLMWeight"), v113, v114, v115, v213);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    if (qword_1EF568E88 == -1)
    {
      v136 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
LABEL_64:

        objc_msgSend_floatValue(v135, v137, v138, v139, v140, v141);
        v143 = v142;
        goto LABEL_66;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v136 = (id)qword_1EF568E20;
      if (!os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
        goto LABEL_64;
    }
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v135;
    _os_log_impl(&dword_1BE607000, v136, OS_LOG_TYPE_DEFAULT, "decodingWordLMWeight from override weights: %@", (uint8_t *)&buf, 0xCu);
    goto LABEL_64;
  }
  v143 = 0.0;
  if (!self->_contentType)
  {
    script = self->_script;
    if (script == 7)
    {
      v143 = 0.117129375;
    }
    else if (script == 1)
    {
      v179 = self->_language;
      if (v179 == 27)
        v143 = 0.1;
      else
        v143 = dbl_1BE8DFE60[v179 - 7 < 0xC];
    }
  }
LABEL_66:

  objc_msgSend_objectForKey_(0, v144, (uint64_t)CFSTR("DecodingWordLMLowerBoundLogProbability"), v145, v146, v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v148)
  {
    v156 = -6.90775528;
    goto LABEL_72;
  }
  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v149 = (id)qword_1EF568E20;
    if (!os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
      goto LABEL_70;
    goto LABEL_69;
  }
  v149 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
  {
LABEL_69:
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v148;
    _os_log_impl(&dword_1BE607000, v149, OS_LOG_TYPE_DEFAULT, "decodingWordLMLowerBoundLogProbability from override weights: %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_70:

  objc_msgSend_floatValue(v148, v150, v151, v152, v153, v154);
  v156 = v155;
LABEL_72:

  v157 = 0;
  if (a5 && v143 > 0.0)
  {
    v158 = objc_alloc(MEMORY[0x1E0D09AC0]);
    v159 = self->_locale;
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v160, v161, v162, v163, v164, v143);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v166, v167, v168, v169, v170, v156);
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = (void *)objc_msgSend_initWithLMLanguageModel_locale_decodingWeight_lowerBoundLogProbability_(v158, v172, (uint64_t)a5, (uint64_t)v159, (uint64_t)v165, (uint64_t)v171);

  }
LABEL_75:
  v173 = objc_alloc(MEMORY[0x1E0D09AD8]);
  v176 = (void *)objc_msgSend_initWithLexicons_characterLanguageModel_wordLanguageModel_(v173, v174, (uint64_t)v74, (uint64_t)v116, (uint64_t)v157, v175);

  return v176;
}

- (BOOL)shouldUseModernizedCTCDecoder
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int shouldRunNextGenRecognizer;
  unsigned int mode;
  BOOL v9;
  int v10;

  shouldRunNextGenRecognizer = objc_msgSend_shouldRunNextGenRecognizer(self, a2, v2, v3, v4, v5);
  if (shouldRunNextGenRecognizer)
  {
    mode = self->_mode;
    v9 = mode > 6;
    v10 = (1 << mode) & 0x56;
    LOBYTE(shouldRunNextGenRecognizer) = !v9 && v10 != 0 && self->_script < 9;
  }
  return shouldRunNextGenRecognizer;
}

- (void)lexiconStringNormalizationFunction
{
  if (self->_script == 5)
    return compatibilityJamoFromComposedHangulString;
  else
    return 0;
}

+ (BOOL)shouldApplyLatinSpacingForLocale:(id)a3
{
  unint64_t v5;

  v5 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, (uint64_t *)&v5);
  return (v5 > 6) | (0x23u >> v5) & 1;
}

+ (BOOL)shouldUseFullWidthSpaceBasedOnContextForLocale:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 4;
}

+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4
{
  uint64_t v4;

  objc_msgSend_swappableColumnIndexesFromResults_locales_topLocaleIndex_(CHRecognizerConfiguration, a2, (uint64_t)a3, (uint64_t)a4, 0, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)swappableColumnIndexesFromResults:(id)a3 locales:(id)a4 topLocaleIndex:(int64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
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
  uint64_t Index;
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
  uint64_t v125;
  void *v126;
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
  _BOOL8 v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD v147[5];
  _QWORD v148[2];

  v148[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v13;
  v147[1] = &unk_1E78292E8;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_objectAtIndexedSubscript_(v7, v15, a5, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v19, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
  objc_msgSend_numberWithUnsignedInteger_(v14, v32, v31, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v36;
  v147[3] = &unk_1E78292E8;
  v147[4] = &unk_1E78292E8;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v147, 5, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v148[0] = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v148, 1, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend_count(v7, v45, v46, v47, v48, v49) >= 2
    && (unint64_t)objc_msgSend_count(v8, v50, v51, v52, v53, v54) > 1)
  {
    v145 = 0;
    v146 = 0;
    objc_msgSend_objectAtIndexedSubscript_(v8, v55, a5, v56, v57, v58);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v61, &v146, &v145);

    v66 = objc_msgSend_indexOfObjectPassingTest_(v8, v62, (uint64_t)&unk_1E77F5968, v63, v64, v65);
    if (v146 == 27 || v145 != 1)
    {
      v73 = v66;
      if (v66 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v74 = objc_msgSend_count(v7, v67, v68, v69, v70, v71);
        if (v74 == objc_msgSend_count(v8, v75, v76, v77, v78, v79))
        {
          if (v145 == 8)
          {
            objc_msgSend_objectAtIndexedSubscript_(v7, v80, a5, v81, v82, v83);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v7, v84, v73, v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_tokenColumnCount(v88, v89, v90, v91, v92, v93) < 2)
            {
              v138 = 0;
            }
            else
            {
              objc_msgSend_tokenColumns(v88, v94, v95, v96, v97, v98);
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lastObject(v141, v99, v100, v101, v102, v103);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIndexes(v142, v104, v105, v106, v107, v108);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              Index = objc_msgSend_firstIndex(v143, v109, v110, v111, v112, v113);
              objc_msgSend_tokenColumns(v144, v115, v116, v117, v118, v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v120, v121, v122, v123, v124, v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIndexes(v126, v127, v128, v129, v130, v131);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = Index == objc_msgSend_firstIndex(v132, v133, v134, v135, v136, v137);

            }
            objc_msgSend_swappableColumnIndexesInResults_locales_topLocaleIndex_swappableIndex_shouldReverseSwappableColumns_(CHTokenizedTextResult, v139, (uint64_t)v7, (uint64_t)v8, a5, v73, v138);
          }
          else
          {
            objc_msgSend_swappableColumnIndexesInResults_locales_topLocaleIndex_swappableIndex_shouldReverseSwappableColumns_(CHTokenizedTextResult, v80, (uint64_t)v7, (uint64_t)v8, a5, v73, 0);
          }
          v140 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v140;
        }
      }
    }
  }
  v59 = v44;

  return v59;
}

+ (BOOL)shouldPerformStrictCandidateFiltering:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 4;
}

+ (id)spellCheckingLocaleForRecognitionLocale:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v21 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v7, 0, &v21);
  v13 = v7;
  if ((unint64_t)(v21 - 2) < 4)
  {
    objc_msgSend_firstComposedCharacter(v6, v8, v9, v10, v11, v12);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = isCharacterLatinOrCommonScript(v14);

    v13 = v7;
    if (v15)
    {
      objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v16, (uint64_t)CFSTR("en"), v17, v18, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13;
}

+ (BOOL)shouldAdjustGroupingForLocale:(id)a3
{
  unint64_t v5;

  v5 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, (uint64_t *)&v5);
  return (v5 < 9) & (0x17Cu >> v5);
}

+ (int64_t)writingOrientationForLocale:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  if (v4 == 8)
    return 2;
  else
    return 1;
}

+ (BOOL)shouldAdjustGroupingHeuristicsForVeryComplexCharacters:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return (unint64_t)(v4 - 3) < 3;
}

+ (id)modelNameChinese
{
  return CFSTR("ctc_zh");
}

+ (id)modelNameJapanese
{
  return CFSTR("ctc_ja");
}

+ (id)modelNameThai
{
  return CFSTR("ctc_th");
}

+ (id)modelNameKorean
{
  return CFSTR("ctc_ko");
}

+ (id)modelNameLatin
{
  return CFSTR("ctc_latn");
}

+ (id)modelNameCyrillic
{
  return CFSTR("ctc_cyrl");
}

+ (id)modelNameArabic
{
  return CFSTR("ctc_ar");
}

+ (id)modelNameVietnamese
{
  return CFSTR("ctc_vi");
}

+ (id)allNonLatinModelNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD v42[7];

  v42[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend_modelNameChinese(CHRecognizerConfiguration, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v6;
  objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v12;
  objc_msgSend_modelNameKorean(CHRecognizerConfiguration, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v18;
  objc_msgSend_modelNameThai(CHRecognizerConfiguration, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v24;
  objc_msgSend_modelNameCyrillic(CHRecognizerConfiguration, v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v30;
  objc_msgSend_modelNameArabic(CHRecognizerConfiguration, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v36;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v42, 6, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (int64_t)drawingStrokeLimitForLocale:(id)a3
{
  id v3;
  int64_t v4;
  uint64_t v6;

  v3 = a3;
  if (v3)
  {
    v6 = 0;
    sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v3, 0, &v6);
    if ((unint64_t)(v6 - 2) >= 4)
      v4 = 1000;
    else
      v4 = 100;

    return v4;
  }
  else
  {

    return 1000;
  }
}

+ (BOOL)shouldRemoveSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5
{
  NSString *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int isCharacterEmoji;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;

  v7 = (NSString *)a3;
  v8 = a4;
  v13 = a5;
  LOBYTE(v14) = 0;
  if (v7 && v8)
  {
    v15 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v9, (uint64_t)v7, v10, v11, v12);
    v20 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v16, (uint64_t)v8, v17, v18, v19);
    v61 = 0;
    sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v13, &v61, 0);
    objc_msgSend_countryCode(v13, v21, v22, v23, v24, v25);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_uppercaseString((void *)v14, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)objc_opt_class();
    LODWORD(v14) = objc_msgSend_isCharacterEmoji_(v32, v33, (uint64_t)v7, v34, v35, v36);
    v37 = (void *)objc_opt_class();
    isCharacterEmoji = objc_msgSend_isCharacterEmoji_(v37, v38, (uint64_t)v8, v39, v40, v41);
    switch(v61)
    {
      case 0:
      case 4:
      case 5:
      case 6:
      case 23:
      case 27:
        v14 = (v20 >> 25) & 1;
        break;
      case 1:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 24:
      case 25:
      case 26:
        v14 = (v20 >> 25) & 1;
        if ((objc_msgSend_containsString_(v31, v43, (uint64_t)CFSTR("AU"), v44, v45, v46) & 1) == 0
          && (objc_msgSend_containsString_(v31, v47, (uint64_t)CFSTR("CA"), v48, v49, v50) & 1) == 0)
        {
          v51 = (v20 >> 2) & 1 & (v15 >> 27) | v14;
          goto LABEL_21;
        }
        break;
      case 2:
        if (objc_msgSend_containsString_(v31, v43, (uint64_t)CFSTR("CA"), v44, v45, v46))
        {
          if ((v20 & 0x2000000) == 0)
            goto LABEL_17;
          LODWORD(v14) = objc_msgSend_isEqualToString_(v8, v56, (uint64_t)CFSTR(":"), v57, v58, v59) ^ 1;
        }
        else
        {
          LOBYTE(v14) = (v20 & 0x6000000) == 0x2000000;
        }
        break;
      case 3:
        LODWORD(v14) = ((v20 >> 25) | (v15 >> 28)) & 1;
        break;
      case 19:
      case 20:
      case 21:
      case 22:
        v52 = (v20 >> 30) & 1;
        if ((v15 & 0x80000000) == 0)
          LODWORD(v52) = 0;
        v53 = (v15 >> 30) & 1;
        if ((v20 & 0x80000000) == 0)
          LODWORD(v53) = 0;
        v54 = (v20 >> 25) & 1 | v52 | v53 | v14 | isCharacterEmoji;
        LOBYTE(v14) = v54 != 0;
        if (v61 != 22)
        {
          v55 = !isCharacterLatinOrCommonScript(v7) || !isCharacterLatinOrCommonScript((NSString *)v8);
          v51 = v55 | v54;
LABEL_21:
          LOBYTE(v14) = v51 != 0;
        }
        break;
      default:
LABEL_17:
        LOBYTE(v14) = 0;
        break;
    }

  }
  return v14;
}

+ (BOOL)shouldInsertSpaceBetweenPreviousChar:(id)a3 andNextChar:(id)a4 inLocale:(id)a5 inString:(id)a6 atRange:(_NSRange)a7 withQuoteCount:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  NSString *v14;
  id v15;
  NSString *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int HasEmoticonStartingAtIndex;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
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
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BOOL4 v83;
  char v84;
  int v85;
  _BOOL4 v86;
  uint64_t v87;
  int v88;
  BOOL v90;
  int v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
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
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
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
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  _BOOL4 v187;
  int v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char hasPrefix;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
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
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  BOOL v258;
  uint64_t v259;
  int v260;
  int IsMember;
  int v262;
  void *v263;
  void *v264;
  void *v265;
  int v266;
  int v267;
  void *v268;
  id v269;
  uint64_t v270;

  length = a7.length;
  location = a7.location;
  v13 = a3;
  v14 = (NSString *)a4;
  v15 = a5;
  v16 = (NSString *)a6;
  v17 = a8;
  LOBYTE(HasEmoticonStartingAtIndex) = 0;
  if (!v13 || !v14)
    goto LABEL_14;
  v269 = v17;
  v23 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v18, (uint64_t)v13, v19, v20, v21);
  v28 = objc_msgSend_characterTypeFromString_(CHCharacterSetRules, v24, (uint64_t)v14, v25, v26, v27);
  HasEmoticonStartingAtIndex = stringHasEmoticonStartingAtIndex(location, v16, v28, 1);
  v270 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, v15, &v270, 0);
  objc_msgSend_countryCode(v15, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uppercaseString(v34, v35, v36, v37, v38, v39);
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v270)
  {
    case 0:
    case 19:
    case 20:
    case 21:
    case 22:
      if ((v23 & 0x40) == 0)
        goto LABEL_8;
      v44 = v268;
      HasEmoticonStartingAtIndex = !isCharacterLatinOrCommonScript(v14);
      goto LABEL_13;
    case 1:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      v44 = v268;
      if ((objc_msgSend_containsString_(v268, v40, (uint64_t)CFSTR("AU"), v41, v42, v43) & 1) != 0
        || objc_msgSend_containsString_(v268, v45, (uint64_t)CFSTR("CA"), v46, v47, v48))
      {
        v49 = (v28 >> 2) & 1 & (v23 >> 27);
      }
      else
      {
        v49 = 0;
      }
      LOBYTE(HasEmoticonStartingAtIndex) = (v49 | HasEmoticonStartingAtIndex) != 0;
      goto LABEL_13;
    case 2:
      v44 = v268;
      if ((objc_msgSend_containsString_(v268, v40, (uint64_t)CFSTR("CA"), v41, v42, v43) & 1) != 0)
        LOBYTE(v55) = objc_msgSend_isEqualToString_(v14, v51, (uint64_t)CFSTR(":"), v52, v53, v54);
      else
        v55 = (v28 >> 26) & 1;
      if ((v23 & 0x2000000) != 0)
        v84 = 0;
      else
        v84 = v55;
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v84 | ((v28 & 0x8000000) != 0) & (v23 >> 2);
      goto LABEL_13;
    case 3:
      v44 = v268;
      if (objc_msgSend_containsString_(v268, v40, (uint64_t)CFSTR("ES"), v41, v42, v43))
        v60 = (v28 >> 27) & 1 & (v23 >> 2);
      else
        v60 = 0;
      if (objc_msgSend_containsString_(v268, v56, (uint64_t)CFSTR("MX"), v57, v58, v59))
        v60 |= (v28 >> 2) & 1 & (v23 >> 27);
      HasEmoticonStartingAtIndex |= v60 | (v28 >> 28) & 1 & (v23 >> 25);
      goto LABEL_13;
    case 4:
    case 5:
    case 24:
    case 25:
    case 27:
      HasEmoticonStartingAtIndex |= (v28 >> 27) & 1 & (v23 >> 2);
      goto LABEL_10;
    case 6:
      v44 = v268;
      if (objc_msgSend_containsString_(v268, v40, (uint64_t)CFSTR("PT"), v41, v42, v43))
        v65 = (v28 >> 27) & 1 & (v23 >> 2);
      else
        v65 = 0;
      if (objc_msgSend_containsString_(v268, v61, (uint64_t)CFSTR("BR"), v62, v63, v64))
        v65 |= (v28 >> 2) & 1 & (v23 >> 27);
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v65;
      goto LABEL_13;
    case 23:
      v66 = (void *)objc_opt_class();
      v71 = objc_msgSend_singleScriptCodeForString_(v66, v67, (uint64_t)v13, v68, v69, v70);
      v72 = (void *)objc_opt_class();
      v267 = objc_msgSend_singleScriptCodeForString_(v72, v73, (uint64_t)v14, v74, v75, v76);
      v83 = (v23 & 4) != 0 && (v28 & 4) == 0 && v267 == 38;
      v85 = v71;
      v86 = v71 == 38;
      if ((v23 & 4) != 0)
        v86 = 0;
      v87 = (v28 >> 2) & 1;
      v88 = v86 & v87 | v83;
      if (v85 == 38)
      {
        v259 = 0;
        if (v267 != 38 && v267 != 0)
          v88 = 1;
        v260 = v88;
      }
      else
      {
        v260 = v88;
        v90 = v85 == 0;
        v91 = !v90;
        if (v267 != 38)
          v91 = 0;
        LOBYTE(v259) = v90;
        HIDWORD(v259) = v91;
      }
      if ((v28 & 0x2000000) != 0)
      {
        IsMember = 1;
      }
      else
      {
        objc_msgSend_ch_basicClosingParenthesesSet(MEMORY[0x1E0CB3500], v77, v78, v79, v80, v81);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend_characterAtIndex_(v14, v92, 0, v93, v94, v95);
        if ((objc_msgSend_characterIsMember_(v263, v97, v96, v98, v99, v100) & 1) != 0)
        {
          IsMember = 1;
        }
        else
        {
          objc_msgSend_ch_thaiExtraSpaceAfterSymbolsSet(MEMORY[0x1E0CB3500], v101, v102, v103, v104, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = objc_msgSend_characterAtIndex_(v14, v107, 0, v108, v109, v110);
          IsMember = objc_msgSend_characterIsMember_(v106, v112, v111, v113, v114, v115);

        }
        LODWORD(v87) = (v28 >> 2) & 1;
      }
      if ((v23 & 0x2000000) != 0)
      {
        if (((v87 | IsMember) & 1) == 0)
          goto LABEL_67;
LABEL_70:
        v130 = 0;
        goto LABEL_74;
      }
      objc_msgSend_ch_thaiExtraSpaceAfterSymbolsSet(MEMORY[0x1E0CB3500], v77, v78, v79, v80, v81);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend_characterAtIndex_(v13, v116, 0, v117, v118, v119);
      if (!objc_msgSend_characterIsMember_(v264, v121, v120, v122, v123, v124))
      {
        v130 = 0;
        goto LABEL_72;
      }

      if (((v87 | IsMember) & 1) != 0)
        goto LABEL_70;
LABEL_67:
      v125 = objc_msgSend_length(v16, v77, v78, v79, v80, v81);
      v78 = location + length;
      if (location + length < v125)
      {
        objc_msgSend_substringFromIndex_(v16, v77, v78, v79, v80, v81);
        v264 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend_hasPrefix_(v264, v126, (uint64_t)CFSTR("."), v127, v128, v129) ^ 1;
LABEL_72:

        goto LABEL_74;
      }
      v130 = 1;
LABEL_74:
      objc_msgSend_ch_basicOpeningParenthesesSet(MEMORY[0x1E0CB3500], v77, v78, v79, v80, v81);
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend_characterAtIndex_(v13, v131, 0, v132, v133, v134);
      v145 = v260 | HIDWORD(v259) | v130;
      if ((objc_msgSend_characterIsMember_(v265, v136, v135, v137, v138, v139) & 1) == 0)
      {
        objc_msgSend_ch_basicOpeningParenthesesSet(MEMORY[0x1E0CB3500], v140, v141, v142, v143, v144);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend_characterAtIndex_(v14, v147, 0, v148, v149, v150);
        v145 |= objc_msgSend_characterIsMember_(v146, v152, v151, v153, v154, v155);

      }
      objc_msgSend_ch_basicClosingParenthesesSet(MEMORY[0x1E0CB3500], v156, v157, v158, v159, v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend_characterAtIndex_(v13, v162, 0, v163, v164, v165);
      v266 = objc_msgSend_characterIsMember_(v161, v167, v166, v168, v169, v170);

      objc_msgSend_ch_thaiMathSymbolsNeedingSpaceSet(MEMORY[0x1E0CB3500], v171, v172, v173, v174, v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend_characterAtIndex_(v13, v177, 0, v178, v179, v180);
      v262 = IsMember ^ 1;
      if (objc_msgSend_characterIsMember_(v176, v182, v181, v183, v184, v185))
        v187 = (v28 & 4) == 0 && v267 != 0;
      else
        v187 = 0;
      v188 = v145 | v266 & v262 | v187;

      if (!((v23 >> 2) & 1 | v259 & 1))
      {
        objc_msgSend_ch_thaiMathSymbolsNeedingSpaceSet(MEMORY[0x1E0CB3500], v189, v190, v191, v192, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = objc_msgSend_characterAtIndex_(v14, v195, 0, v196, v197, v198);
        v188 |= objc_msgSend_characterIsMember_(v194, v200, v199, v201, v202, v203);

      }
      if (objc_msgSend_isEqualToString_(v13, v189, (uint64_t)CFSTR("ฯ"), v191, v192, v193))
      {
        objc_msgSend_substringFromIndex_(v16, v204, location, v205, v206, v207);
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v188 |= objc_msgSend_hasPrefix_(v208, v209, (uint64_t)CFSTR("ลฯ"), v210, v211, v212) ^ 1;

      }
      objc_msgSend_substringFromIndex_(v16, v204, location, v205, v206, v207);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      hasPrefix = objc_msgSend_hasPrefix_(v213, v214, (uint64_t)CFSTR("ฯลฯ"), v215, v216, v217);

      objc_msgSend_ch_neutralQuotationMarkSet(MEMORY[0x1E0CB3500], v219, v220, v221, v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = objc_msgSend_characterAtIndex_(v13, v225, 0, v226, v227, v228);
      if (objc_msgSend_characterIsMember_(v224, v230, v229, v231, v232, v233))
      {
        if ((objc_msgSend_countForObject_(v269, v234, (uint64_t)v13, v235, v236, v237) & 1) != 0)
          v238 = 0;
        else
          v238 = v262;
      }
      else
      {
        v238 = 0;
      }

      objc_msgSend_ch_neutralQuotationMarkSet(MEMORY[0x1E0CB3500], v239, v240, v241, v242, v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      v249 = objc_msgSend_characterAtIndex_(v14, v245, 0, v246, v247, v248);
      if (objc_msgSend_characterIsMember_(v244, v250, v249, v251, v252, v253))
        v258 = (objc_msgSend_countForObject_(v269, v254, (uint64_t)v14, v255, v256, v257) & 1) == 0;
      else
        v258 = 0;
      LOBYTE(HasEmoticonStartingAtIndex) = HasEmoticonStartingAtIndex | v258 | v188 | hasPrefix | v238;

LABEL_10:
      v44 = v268;
LABEL_13:

      v17 = v269;
LABEL_14:

      return HasEmoticonStartingAtIndex;
    case 26:
      goto LABEL_10;
    default:
LABEL_8:
      LOBYTE(HasEmoticonStartingAtIndex) = 0;
      goto LABEL_10;
  }
}

+ (BOOL)shouldRefinePrefixQueryMatchesForLocale:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)a1, a3, &v4, 0);
  return (unint64_t)(v4 - 19) < 4;
}

+ (BOOL)shouldAllowSpaceInsertionGestureForLocale:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 6;
}

+ (BOOL)shouldApplyThaiSpacingForLocale:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, 0, &v4);
  return v4 == 6;
}

+ (BOOL)shouldSwapCyrillicTopResult:(id)a3 topRange:(_NSRange)a4 englishResult:(id)a5 englishRange:(_NSRange)a6 prevousGroupTopString:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
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
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  int v106;
  BOOL v108;
  int v109;
  _BOOL4 v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  BOOL v117;
  BOOL v118;
  BOOL v119;
  BOOL v120;
  char v121;
  BOOL v122;
  void *v124;

  length = a6.length;
  location = a6.location;
  v10 = a4.length;
  v11 = a4.location;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_opt_self();
  objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v12, v15, v11, v10, v16, v17);
  v19 = v18;
  objc_msgSend_heuristicTextScoreForColumnRange_(v12, v20, v11, v10, v21, v22);
  v24 = v23;
  objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v13, v25, location, length, v26, v27);
  v29 = v28;
  objc_msgSend_heuristicTextScoreForColumnRange_(v13, v30, location, length, v31, v32);
  v34 = v33;
  objc_msgSend_transcriptionPaths(v12, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v12, v46, (uint64_t)v45, v11, v10, 0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_transcriptionPaths(v13, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v52, v53, 0, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v13, v58, (uint64_t)v57, location, length, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v60, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v124, v66, (uint64_t)v65, 0, v67, v68);

  objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v70, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v59, v76, (uint64_t)v75, 0, v77, v78);

  objc_msgSend_ch_basicCyrillicCharacterSet(MEMORY[0x1E0CB3500], v80, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v14, v86, (uint64_t)v85, 1, v87, v88);

  objc_msgSend_ch_basicAlphabeticCharacterSet(MEMORY[0x1E0CB3500], v90, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v14;
  v100 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v14, v97, (uint64_t)v95, 1, v98, v99);

  v105 = v69 == 1 && v79 == 1;
  v106 = v105;
  v108 = v105 && v100 > 0 && v89 < 1;
  if (v100 >= 1)
    v106 = 0;
  if (v89 > 0)
    v109 = v106;
  else
    v109 = 0;
  v110 = (v69 | v79) == 0;
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v101, (uint64_t)CFSTR("èéêëÈÉÊË"), v102, v103, v104);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v59, v112, (uint64_t)v111, 1, v113, v114);

  v116 = 0;
  if (((v109 | v110) & 1) == 0 && v115 <= 0)
  {
    v117 = v24 > v34 * 1.45;
    if (v19 < v29 * 0.55)
      v117 = 0;
    v118 = v19 > 0.98;
    if (v29 >= 0.98)
      v118 = 0;
    v116 = !v118 && !v117;
  }
  v119 = v29 > v19 * 1.052664;
  if (v34 < v24 * 0.948053)
    v119 = 0;
  v120 = v34 > v24 * 1.478344;
  if (v29 < v19 * 0.943234)
    v120 = 0;
  v121 = v119 || v120;
  if (v34 > v24 * 2.858661)
    v121 = 1;
  if (v29 > v19 * 1.33896)
    v121 = 1;
  v122 = (v121 | v108) & v116;

  return v122;
}

+ (BOOL)shouldAddSpaceToNeutralQuotationMarks:(id)a3
{
  uint64_t v4;

  v4 = 0;
  sub_1BE609EE8((uint64_t)CHRecognizerConfiguration, a3, &v4, 0);
  return v4 == 23;
}

- (int)mode
{
  return self->_mode;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)contentTypeForNoSpaceRecognition
{
  return self->_contentTypeForNoSpaceRecognition;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(_QWORD *)&self->_baseWritingDirection;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
