@implementation TESPatternMatcherBase

- (TESPatternMatcherBase)init
{
  TESPatternMatcherBase *v2;
  TESPatternMatcherBase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherBase;
  v2 = -[TESPatternMatcherBase init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TESPatternMatcherBase setMatchType:](v2, "setMatchType:", 1);
    -[TESPatternMatcherBase setMatchMustBeWordOrSentenceTerminal:](v3, "setMatchMustBeWordOrSentenceTerminal:", 1);
  }
  return v3;
}

- (void)configurePrecompiledRegularExpression
{
  void *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_1B3DE1000, a3, OS_LOG_TYPE_ERROR, "configurePrecompiledRegularExpression: regular expression pattern \"%{public}@\" could not be compiled. Error: '%{public}@'", v7, 0x16u);

  OUTLINED_FUNCTION_0_3();
}

- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  TESMatchResult *v8;
  objc_class *v9;
  void *v10;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = objc_alloc_init(TESMatchResult);
  -[TESMatchResult setMatchType:](v8, "setMatchType:", -[TESPatternMatcherBase matchType](self, "matchType"));
  -[TESMatchResult setEffectType:](v8, "setEffectType:", -[TESPatternMatcherBase effectType](self, "effectType"));
  -[TESMatchResult setMatchRange:](v8, "setMatchRange:", location, length);
  -[TESMatchResult setSourceString:](v8, "setSourceString:", v7);

  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TESMatchResult setMatcherClass:](v8, "setMatcherClass:", v10);

  return v8;
}

- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TESPatternMatcherBase regularExpression](self, "regularExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke;
  v14[3] = &unk_1E66F9ED8;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, location, length, v14);

  v12 = (void *)objc_msgSend(v10, "copy");
  return v12;
}

void __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "range");
  objc_msgSend(v4, "createMatchResultForMatchRange:sourceString:", v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "range");
  objc_msgSend(v3, "range");
  v10 = v9 + v8;
  v11 = objc_msgSend(*(id *)(a1 + 40), "length");
  v12 = objc_msgSend(v3, "range");
  v13 = v12;
  if (v10 == v11)
  {
    v14 = 1;
    if (!v12)
      goto LABEL_11;
  }
  else
  {
    v15 = *(void **)(a1 + 40);
    v16 = objc_msgSend(v3, "range");
    objc_msgSend(v3, "range");
    v18 = objc_msgSend(v15, "characterAtIndex:", v17 + v16);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "characterIsMember:", v18) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v20, "characterIsMember:", v18);

    }
    if (!v13)
      goto LABEL_11;
  }
  v21 = objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", objc_msgSend(v3, "range") - 1);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "characterIsMember:", v21) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "characterIsMember:", v21);

  }
LABEL_11:
  if (v14)
  {
    emf_logging_get_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke_cold_1(v7, v24);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  }

}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)setPattern:(id)a3
{
  objc_storeStrong((id *)&self->_pattern, a3);
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  objc_storeStrong((id *)&self->_regularExpression, a3);
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (BOOL)matchMustBeWordOrSentenceTerminal
{
  return self->_matchMustBeWordOrSentenceTerminal;
}

- (void)setMatchMustBeWordOrSentenceTerminal:(BOOL)a3
{
  self->_matchMustBeWordOrSentenceTerminal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpression, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
}

void __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "matchingSubString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "matcherClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1B3DE1000, a2, OS_LOG_TYPE_DEBUG, "[TESPatternMatcherBase]: found result '%{private}@' (matcher class: %{public}@)", v6, 0x16u);

  OUTLINED_FUNCTION_0_3();
}

@end
