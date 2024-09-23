@implementation ATXUserEducationSuggestionFocusModeSetup

- (ATXUserEducationSuggestionFocusModeSetup)initWithModeSemanticType:(int64_t)a3
{
  ATXUserEducationSuggestionFocusModeSetup *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  result = -[ATXUserEducationSuggestion initWithRandomUUID](&v5, sel_initWithRandomUUID);
  if (result)
    result->_modeSemanticType = a3;
  return result;
}

+ (int64_t)suggestionType
{
  return 3;
}

- (id)description
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_opt_class();
  DNDModeSemanticTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@ modeSemanticType: %@>"), v3, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  v4 = a3;
  -[ATXUserEducationSuggestion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modeSemanticType, CFSTR("DiscoverySuggestions.codingKeyForModeSemanticType"), v5.receiver, v5.super_class);

}

- (ATXUserEducationSuggestionFocusModeSetup)initWithCoder:(id)a3
{
  id v4;
  ATXUserEducationSuggestionFocusModeSetup *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ATXUserEducationSuggestionFocusModeSetup *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXUserEducationSuggestionFocusModeSetup;
  v5 = -[ATXUserEducationSuggestion initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_modeSemanticType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DiscoverySuggestions.codingKeyForModeSemanticType"));
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v16 = v5;
      goto LABEL_9;
    }
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[ATXUserEducationSuggestionFocusModeSetup initWithCoder:]";
      v21 = 2114;
      v22 = v8;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    __atxlog_handle_context_user_education_suggestions();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXUserEducationSuggestionFocusModeSetup initWithCoder:].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
  }

  v16 = 0;
LABEL_9:

  return v16;
}

- (int64_t)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: decoding issue, got nil instance", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
