@implementation ATXUserEducationSuggestionEvent

- (ATXUserEducationSuggestionEvent)initWithUserEducationSuggestion:(id)a3 userEducationSuggestionEventType:(unint64_t)a4
{
  id v7;
  ATXUserEducationSuggestionEvent *v8;
  ATXUserEducationSuggestionEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXUserEducationSuggestionEvent;
  v8 = -[ATXUserEducationSuggestionEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userEducationSuggestion, a3);
    v9->_userEducationSuggestionEventType = a4;
  }

  return v9;
}

- (id)description
{
  id v3;
  uint64_t v4;
  ATXUserEducationSuggestion *userEducationSuggestion;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  userEducationSuggestion = self->_userEducationSuggestion;
  ATXUserEducationSuggestionEventTypeToString(self->_userEducationSuggestionEventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ userEducationSuggestion: %@ eventType: %@>"), v4, userEducationSuggestion, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXUserEducationSuggestion *userEducationSuggestion;
  id v5;

  userEducationSuggestion = self->_userEducationSuggestion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userEducationSuggestion, CFSTR("ATXUserEducationSuggestionEvent.codingKeyForUserEducationSuggestion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userEducationSuggestionEventType, CFSTR("ATXUserEducationSuggestionEvent.codingKeyForUserEducationSuggestionEventType"));

}

- (ATXUserEducationSuggestionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ATXUserEducationSuggestionEvent *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_context_user_education_suggestions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("ATXUserEducationSuggestionEvent.codingKeyForUserEducationSuggestion"), v4, 1, CFSTR("com.apple.proactive.decode.ATXUserEducationSuggestionEvent"), -7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    __atxlog_handle_context_user_education_suggestions();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      objc_msgSend(v4, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v17 = "-[ATXUserEducationSuggestionEvent initWithCoder:]";
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1A49EF000, v10, OS_LOG_TYPE_DEFAULT, "%s: decoding error: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ATXUserEducationSuggestionEvent.codingKeyForUserEducationSuggestionEventType"));
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = (ATXUserEducationSuggestionEvent *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserEducationSuggestion:userEducationSuggestionEventType:", v8, v11);
      goto LABEL_8;
    }
    __atxlog_handle_context_user_education_suggestions();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
  }

  v14 = 0;
LABEL_8:

  return v14;
}

- (ATXUserEducationSuggestion)userEducationSuggestion
{
  return self->_userEducationSuggestion;
}

- (unint64_t)userEducationSuggestionEventType
{
  return self->_userEducationSuggestionEventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userEducationSuggestion, 0);
}

@end
