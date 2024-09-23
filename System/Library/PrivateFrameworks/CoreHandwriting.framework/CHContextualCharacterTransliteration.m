@implementation CHContextualCharacterTransliteration

- (CHContextualCharacterTransliteration)initWithConfusion:(id)a3 correction:(id)a4 locales:(id)a5 leftContext:(id)a6 rightContext:(id)a7 requiresLexiconMatch:(BOOL)a8 shouldPreserveOriginal:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  CHContextualCharacterTransliteration *v19;
  CHContextualCharacterTransliteration *v20;
  id v22;
  id v23;
  objc_super v24;

  v16 = a3;
  v17 = a4;
  v23 = a5;
  v22 = a6;
  v18 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CHContextualCharacterTransliteration;
  v19 = -[CHContextualCharacterTransliteration init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_confusion, a3);
    objc_storeStrong((id *)&v20->_correction, a4);
    objc_storeStrong((id *)&v20->_locales, a5);
    objc_storeStrong((id *)&v20->_requiredLeftContext, a6);
    objc_storeStrong((id *)&v20->_requiredRightContext, a7);
    v20->_requiresLexiconMatch = a8;
    v20->_shouldPreserveOriginal = a9;
  }

  return v20;
}

- (BOOL)meetsContextRequirementWithLeftContext:(id)a3 rightContext:(id)a4
{
  id v6;
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
  void *v18;
  NSCharacterSet *requiredLeftContext;
  uint64_t v20;
  _BOOL4 v21;
  NSCharacterSet *requiredRightContext;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend_ch_emptyCharacterSet(MEMORY[0x1E0CB3500], v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  requiredLeftContext = self->_requiredLeftContext;
  if (!requiredLeftContext)
    goto LABEL_6;
  if (objc_msgSend_isSupersetOfSet_(v13, v14, (uint64_t)requiredLeftContext, v15, v16, v17))
  {
    if (v6)
    {
      v21 = objc_msgSend_length(v6, v14, v20, v15, v16, v17) == 0;
      requiredRightContext = self->_requiredRightContext;
      if (!requiredRightContext)
        goto LABEL_19;
LABEL_10:
      if (v21)
      {
        if (objc_msgSend_isSupersetOfSet_(v18, v14, (uint64_t)requiredRightContext, v15, v16, v17))
        {
          if (!v7)
          {
            LOBYTE(v21) = 1;
            goto LABEL_19;
          }
          v34 = objc_msgSend_length(v7, v29, v30, v31, v32, v33);
          goto LABEL_16;
        }
        if (v7)
        {
          v34 = objc_msgSend_rangeOfCharacterFromSet_(v7, v29, (uint64_t)self->_requiredRightContext, v31, v32, v33);
LABEL_16:
          LOBYTE(v21) = v34 == 0;
          goto LABEL_19;
        }
LABEL_17:
        LOBYTE(v21) = 0;
        goto LABEL_19;
      }
      goto LABEL_19;
    }
LABEL_6:
    v21 = 1;
    requiredRightContext = self->_requiredRightContext;
    if (!requiredRightContext)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (!v6)
    goto LABEL_17;
  v23 = objc_msgSend_rangeOfCharacterFromSet_options_(v6, v14, (uint64_t)self->_requiredLeftContext, 4, v16, v17);
  v21 = v23 == objc_msgSend_length(v6, v24, v25, v26, v27, v28) - 1;
  requiredRightContext = self->_requiredRightContext;
  if (requiredRightContext)
    goto LABEL_10;
LABEL_19:

  return v21;
}

- (BOOL)isValidForLocale:(id)a3
{
  id v4;
  NSArray *locales;
  BOOL v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  char isEqualToString;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  locales = self->_locales;
  v6 = locales == 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = locales;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v33, (uint64_t)v37, 16, v9);
  if (v10)
  {
    v16 = v10;
    v17 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v7);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend_languageCode(v4, v11, v12, v13, v14, v15, (_QWORD)v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_languageCode(v19, v21, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v20, v27, (uint64_t)v26, v28, v29, v30);

        if ((isEqualToString & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v33, (uint64_t)v37, 16, v15);
      if (v16)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)confusion
{
  return self->_confusion;
}

- (NSString)correction
{
  return self->_correction;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSCharacterSet)requiredLeftContext
{
  return self->_requiredLeftContext;
}

- (NSCharacterSet)requiredRightContext
{
  return self->_requiredRightContext;
}

- (BOOL)requiresLexiconMatch
{
  return self->_requiresLexiconMatch;
}

- (BOOL)shouldPreserveOriginal
{
  return self->_shouldPreserveOriginal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredRightContext, 0);
  objc_storeStrong((id *)&self->_requiredLeftContext, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_correction, 0);
  objc_storeStrong((id *)&self->_confusion, 0);
}

@end
