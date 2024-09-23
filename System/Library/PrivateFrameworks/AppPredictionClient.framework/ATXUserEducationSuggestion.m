@implementation ATXUserEducationSuggestion

- (ATXUserEducationSuggestion)initWithUUID:(id)a3
{
  id v5;
  ATXUserEducationSuggestion *v6;
  ATXUserEducationSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserEducationSuggestion;
  v6 = -[ATXUserEducationSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (ATXUserEducationSuggestion)initWithRandomUUID
{
  void *v3;
  ATXUserEducationSuggestion *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXUserEducationSuggestion initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

+ (int64_t)suggestionType
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("subclass must define +suggestionType"));
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ uuid: %@>"), objc_opt_class(), self->_uuid);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uuid, CFSTR("DiscoverySuggestions.codingKeyForUUID"));
}

- (ATXUserEducationSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  ATXUserEducationSuggestion *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_context_user_education_suggestions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("DiscoverySuggestions.codingKeyForUUID"), v4, 1, CFSTR("com.apple.proactive.decode.ATXUserEducationSuggestion"), -7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    __atxlog_handle_context_user_education_suggestions();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[ATXUserEducationSuggestion initWithCoder:]";
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);

    }
    v12 = 0;
  }
  else
  {
    v12 = (ATXUserEducationSuggestion *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUUID:", v8);
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
