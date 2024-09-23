@implementation _EAREmojiRecognition

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EAREmojiRecognition)initWithLanguage:(id)a3
{
  id v4;
  _EAREmojiRecognition *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  EMFEmojiLocaleData *localeData;
  uint64_t v10;
  uint64_t v11;
  EMFEmojiPreferencesClient *preferences;
  _EAREmojiRecognition *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EAREmojiRecognition;
  v5 = -[_EAREmojiRecognition init](&v15, sel_init);
  if (!v5)
    goto LABEL_10;
  if (v4
    && (objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-")),
        v6 = objc_claimAutoreleasedReturnValue(),
        v4,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0D1F238], "emojiLocaleDataWithLocaleIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
    localeData = v5->_localeData;
    v5->_localeData = (EMFEmojiLocaleData *)v7;
    v4 = (id)v6;
  }
  else
  {
    v4 = 0;
    localeData = v5->_localeData;
    v5->_localeData = 0;
    v8 = 1;
  }

  v5->_isLocaleRTL = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v4) == 2;
  v10 = (v8 & 1) != 0 ? 0 : CEMCreateEmojiLocaleData();
  v5->_cemlocaleRef = (__EmojiLocaleDataWrapper *)v10;
  *(_WORD *)&v5->_isEmojiPersonalizationUsed = 0;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F250]), "_initWithoutConnection");
  preferences = v5->_preferences;
  v5->_preferences = (EMFEmojiPreferencesClient *)v11;

  -[EMFEmojiPreferencesClient readEmojiDefaults](v5->_preferences, "readEmojiDefaults");
  if (!-[_EAREmojiRecognition isEmojiRecognitionCapable](v5, "isEmojiRecognitionCapable"))
    v13 = 0;
  else
LABEL_10:
    v13 = v5;

  return v13;
}

- (void)dealloc
{
  __EmojiLocaleDataWrapper *cemlocaleRef;
  objc_super v4;

  cemlocaleRef = self->_cemlocaleRef;
  if (cemlocaleRef)
    CFRelease(cemlocaleRef);
  v4.receiver = self;
  v4.super_class = (Class)_EAREmojiRecognition;
  -[_EAREmojiRecognition dealloc](&v4, sel_dealloc);
}

- (id)formatEmojiStrings:(id)a3
{
  -[_EAREmojiRecognition formatEmojiStrings:isLogging:](self, "formatEmojiStrings:isLogging:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)formatEmojiStrings:(id)a3 isLogging:(BOOL)a4
{
  id v6;
  void *v7;
  EARLogger *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *__p[2];
  char v31;
  void *v32[2];
  char v33;
  std::string v34;

  v6 = a3;
  v7 = v6;
  if (+[_EARFeatureFlags isEmojiV2Enabled](_EARFeatureFlags, "isEmojiV2Enabled"))
    goto LABEL_18;
  if (v6)
    objc_msgSend(v6, "ear_toString");
  else
    memset(&v34, 0, sizeof(v34));
  std::string::basic_string[abi:ne180100]<0>(v32, "spokenemoji|");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::replaceFirst((uint64_t)&v34, (uint64_t *)v32, (uint64_t)__p);
  if (v31 < 0)
    operator delete(__p[0]);
  if (v33 < 0)
    operator delete(v32[0]);
  std::string::basic_string[abi:ne180100]<0>(__p, "|");
  v8 = (EARLogger *)quasar::splitAndTrimNoEmpty(&v34, (char *)__p, v32);
  if (v31 < 0)
    operator delete(__p[0]);
  if (v32[0] == v32[1])
  {
    EARLogger::QuasarOSLogger(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_EAREmojiRecognition formatEmojiStrings:isLogging:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = 0;
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[_EAREmojiRecognition isValidEmoji:](self, "isValidEmoji:", v7);
  }
  __p[0] = v32;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v34.__r_.__value_.__l.__data_);
    if (v17)
      goto LABEL_18;
LABEL_31:
    v21 = 0;
    goto LABEL_32;
  }
  if (!v17)
    goto LABEL_31;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0D1F260], "emojiTokenWithString:localeData:", v7, self->_localeData);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if (-[NSObject supportsSkinToneVariants](v18, "supportsSkinToneVariants") && !a4)
    {
      -[EMFEmojiPreferencesClient lastUsedVariantEmojiForEmoji:](self->_preferences, "lastUsedVariantEmojiForEmoji:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (-[EMFEmojiPreferencesClient hasLastUsedVariantForEmoji:](self->_preferences, "hasLastUsedVariantForEmoji:", v20)&& !self->_isEmojiPersonalizationUsed)
      {
        self->_isEmojiPersonalizationUsed = 1;
      }
      v19 = v20;
    }
    -[NSObject string](v19, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[_EAREmojiRecognition formatEmojiStrings:isLogging:].cold.1(v19, v22, v23, v24, v25, v26, v27, v28);
    v21 = 0;
  }

LABEL_32:
  return v21;
}

- (void)didUseEmoji:(id)a3 replacementContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[_EAREmojiRecognition isValidEmoji:](self, "isValidEmoji:", v8))
  {
    objc_msgSend(MEMORY[0x1E0D1F260], "emojiTokenWithString:localeData:", v8, self->_localeData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFEmojiPreferencesClient didUseEmoji:](self->_preferences, "didUseEmoji:", v7);
    -[EMFEmojiPreferencesClient _disconnect](self->_preferences, "_disconnect");
    -[EMFEmojiPreferencesClient didUseEmojiInDictation:replacementContext:](self->_preferences, "didUseEmojiInDictation:replacementContext:", v7, v6);

  }
}

- (void)resetEmojiPreferences
{
  EMFEmojiPreferencesClient *preferences;
  EMFEmojiPreferencesClient *v4;
  EMFEmojiPreferencesClient *v5;

  preferences = self->_preferences;
  self->_preferences = 0;

  v4 = (EMFEmojiPreferencesClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F250]), "_initWithoutConnection");
  v5 = self->_preferences;
  self->_preferences = v4;

  -[EMFEmojiPreferencesClient readEmojiDefaults](self->_preferences, "readEmojiDefaults");
}

- (void)resetEmojiMetrics
{
  *(_WORD *)&self->_isEmojiPersonalizationUsed = 0;
}

- (id)baseStringForEmojiString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if ((objc_msgSend(v4, "_isSingleEmoji") & 1) != 0 && -[_EAREmojiRecognition isValidEmoji:](self, "isValidEmoji:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D1F260], "emojiTokenWithString:localeData:", v4, self->_localeData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyWithoutModifiers");
    objc_msgSend(v6, "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (BOOL)isEmojiRecognitionCapable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _OWORD v8[17];

  if (self->_preferences)
  {
    objc_msgSend(MEMORY[0x1E0D1F260], "emojiTokenWithString:localeData:", CFSTR("👍"), self->_localeData);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "string");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        objc_msgSend(v3, "string");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("👍"));

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    if (quasar::gLogLevel >= 4)
    {
      memset(v8, 0, sizeof(v8));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v8);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"Emoji Prefrences is nil", 23);
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v8);
    }
    return 0;
  }
  return v6;
}

- (BOOL)isValidEmoji:(id)a3
{
  const void *v3;
  const void *v4;

  v3 = (const void *)CEMEmojiTokenCreateWithString();
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4 != 0;
}

- (id)searchEmojiAlternativesForSpokenEmoji:(id)a3 count:(int64_t)a4 emojiCharacter:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v38 = a5;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[EMFEmojiLocaleData localeIdentifier](self->_localeData, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E5D5BF90, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(&unk_1E5D5BF90, "objectForKey:", CFSTR("en-US"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v9;
  objc_msgSend(v37, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E5D49530);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[_EAREmojiRecognition baseStringForEmojiString:](self, "baseStringForEmojiString:", v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFEmojiLocaleData emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:](self->_localeData, "emojiTokensForText:phoneticReading:options:searchType:includePrefixMatches:", v39, 0, 17, 2, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 && objc_msgSend(v40, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v13 = v40;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v17, "string");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[_EAREmojiRecognition isValidEmoji:](self, "isValidEmoji:", v18);

          if (v19)
          {
            objc_msgSend(v17, "string");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v14);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = self->_frequentEmojis;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v48;
      while (2)
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v21);
          if (!a4)
          {
            v33 = v41;

            goto LABEL_41;
          }
          v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          if ((objc_msgSend(v25, "isEqualToString:", v42) & 1) == 0
            && objc_msgSend(v12, "containsObject:", v25))
          {
            objc_msgSend(v41, "addObject:", v25);
            --a4;
          }
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v22)
          continue;
        break;
      }
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v26 = v12;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v44;
      while (2)
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v26);
          v30 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * k);
          v31 = v30;
          if (!a4)
          {

            goto LABEL_40;
          }
          if ((objc_msgSend(v30, "isEqualToString:", v42) & 1) == 0
            && (objc_msgSend(v41, "containsObject:", v31) & 1) == 0)
          {
            objc_msgSend(v41, "addObject:", v31);
            --a4;
          }

        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_40:

    v34 = v41;
LABEL_41:

  }
  else
  {
    v32 = v41;
  }

  return v41;
}

- (void)recognizeEmojisInInputString:(id)a3 enumerateUsingBlock:(id)a4
{
  id v6;
  EMFEmojiLocaleData *localeData;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  localeData = self->_localeData;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73___EAREmojiRecognition_recognizeEmojisInInputString_enumerateUsingBlock___block_invoke;
  v9[3] = &unk_1E5D48958;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[EMFEmojiLocaleData enumerateAnchoredReplacementCandidatesForContext:withOptions:usingBlock:](localeData, "enumerateAnchoredReplacementCandidatesForContext:withOptions:usingBlock:", a3, 0, v9);

}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isLocaleRTL
{
  return self->_isLocaleRTL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentEmojis, 0);
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)formatEmojiStrings:(uint64_t)a3 isLogging:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AD756000, a1, a3, "Cannot create EMFEmojiToken; Unable to connect to Emoji Foundation framework",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)formatEmojiStrings:(uint64_t)a3 isLogging:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AD756000, a1, a3, "Cannot find emoji recognition candidate from emoji hammer", a5, a6, a7, a8, 0);
}

@end
