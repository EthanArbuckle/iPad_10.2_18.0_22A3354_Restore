@implementation ECSubjectFormatter

ECSubjectFormatter *__62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke_2(uint64_t a1)
{
  return -[ECSubjectFormatter initWithStyle:]([ECSubjectFormatter alloc], "initWithStyle:", *(_QWORD *)(a1 + 32));
}

- (ECSubjectFormatter)initWithStyle:(int64_t)a3
{
  ECSubjectFormatter *v4;
  ECSubjectFormatter *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _ECSubjectFormatterContext *replyContext;
  void *v10;
  void *v11;
  uint64_t v12;
  _ECSubjectFormatterContext *forwardContext;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ECSubjectFormatter;
  v4 = -[ECSubjectFormatter init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    objc_msgSend((id)objc_opt_class(), "localizedReplyPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nonLocalizedReplyPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __36__ECSubjectFormatter_initWithStyle___block_invoke((uint64_t)v7, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    replyContext = v5->_replyContext;
    v5->_replyContext = (_ECSubjectFormatterContext *)v8;

    objc_msgSend((id)objc_opt_class(), "localizedForwardPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nonLocalizedForwardPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __36__ECSubjectFormatter_initWithStyle___block_invoke((uint64_t)v11, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    forwardContext = v5->_forwardContext;
    v5->_forwardContext = (_ECSubjectFormatterContext *)v12;

  }
  return v5;
}

_ECSubjectFormatterContext *__36__ECSubjectFormatter_initWithStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _ECSubjectFormatterContext *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a2;
  v5 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("(\\s*)(.*)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v8, 0, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9)
    {
      v6 = -[_ECSubjectFormatterContext initWithRegex:localizedPrefix:]([_ECSubjectFormatterContext alloc], "initWithRegex:localizedPrefix:", v9, v4);
    }
    else
    {
      +[ECSubjectFormatter log](ECSubjectFormatter, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __36__ECSubjectFormatter_initWithStyle___block_invoke_cold_1((uint64_t)v8, v11);

      v6 = 0;
    }

  }
  return v6;
}

+ (NSString)nonLocalizedReplyPrefix
{
  return (NSString *)CFSTR("Re: ");
}

+ (NSString)nonLocalizedForwardPrefix
{
  return (NSString *)CFSTR("Fwd: ");
}

+ (NSString)localizedReplyPrefix
{
  if (localizedReplyPrefix_onceToken != -1)
    dispatch_once(&localizedReplyPrefix_onceToken, &__block_literal_global_19);
  return (NSString *)(id)localizedReplyPrefix_localizedReplyPrefix;
}

+ (NSString)localizedForwardPrefix
{
  if (localizedForwardPrefix_onceToken != -1)
    dispatch_once(&localizedForwardPrefix_onceToken, &__block_literal_global_26);
  return (NSString *)(id)localizedForwardPrefix_localizedForwardPrefix;
}

+ (id)subjectStringForDisplayForSubject:(id)a3 style:(int64_t)a4
{
  objc_msgSend(a1, "_subjectStringForDisplayForObject:style:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_subjectStringForDisplayForObject:(id)a3 style:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v5 = a3;
  if (_subjectStringForDisplayForObject_style__onceToken != -1)
    dispatch_once(&_subjectStringForDisplayForObject_style__onceToken, &__block_literal_global_27);
  v6 = (void *)_subjectStringForDisplayForObject_style__formatterCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke_2;
  v11[3] = &__block_descriptor_40_e5__8__0l;
  v11[4] = a4;
  objc_msgSend(v6, "objectForKey:generator:", v7, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringForObjectValue:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ECSubjectFormatter style](self, "style");
      if (!v6)
      {
        -[ECSubjectFormatter _localizedPrefixForSubjectFromSubject:](self, "_localizedPrefixForSubjectFromSubject:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (v6 == 1)
      {
        +[ECSubjectParser subjectWithoutPrefixForSubject:](ECSubjectParser, "subjectWithoutPrefixForSubject:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v9 = v5;
LABEL_21:
        v12 = (void *)v7;
        goto LABEL_22;
      }
      v9 = v5;
      goto LABEL_19;
    }
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF24FB40))
    {
      objc_msgSend(v4, "subject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_19;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
        goto LABEL_19;
      }
      v9 = v4;
    }
    v10 = -[ECSubjectFormatter style](self, "style");
    if (v10 == 1)
    {
      objc_msgSend(v9, "subjectWithoutPrefix");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (!v10)
    {
      objc_msgSend(v9, "subjectString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECSubjectFormatter _localizedPrefixForSubjectFromSubject:](self, "_localizedPrefixForSubjectFromSubject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
LABEL_19:
    v12 = 0;
    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (int64_t)style
{
  return self->_style;
}

- (id)_localizedPrefixForSubjectFromSubject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[ECSubjectFormatter replyContext](self, "replyContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    -[ECSubjectFormatter replyContext](self, "replyContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    localizePrefixIfNeeded(v4, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ECSubjectFormatter forwardContext](self, "forwardContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ECSubjectFormatter forwardContext](self, "forwardContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    localizePrefixIfNeeded(v6, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (_ECSubjectFormatterContext)replyContext
{
  return self->_replyContext;
}

- (_ECSubjectFormatterContext)forwardContext
{
  return self->_forwardContext;
}

void __62__ECSubjectFormatter__subjectStringForDisplayForObject_style___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D1EED8]);
  v1 = (void *)_subjectStringForDisplayForObject_style__formatterCache;
  _subjectStringForDisplayForObject_style__formatterCache = (uint64_t)v0;

}

void __44__ECSubjectFormatter_localizedForwardPrefix__block_invoke()
{
  uint64_t v0;
  void *v1;

  _EFLocalizedString();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedForwardPrefix_localizedForwardPrefix;
  localizedForwardPrefix_localizedForwardPrefix = v0;

}

void __42__ECSubjectFormatter_localizedReplyPrefix__block_invoke()
{
  uint64_t v0;
  void *v1;

  _EFLocalizedString();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)localizedReplyPrefix_localizedReplyPrefix;
  localizedReplyPrefix_localizedReplyPrefix = v0;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__ECSubjectFormatter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (OS_os_log *)(id)log_log_4;
}

void __25__ECSubjectFormatter_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

+ (id)subjectStringForDisplayForSubjectString:(id)a3
{
  objc_msgSend(a1, "subjectStringForDisplayForSubjectString:style:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectStringForDisplayForSubjectString:(id)a3 style:(int64_t)a4
{
  objc_msgSend(a1, "_subjectStringForDisplayForObject:style:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectStringForDisplayForSubject:(id)a3
{
  objc_msgSend(a1, "subjectStringForDisplayForSubject:style:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectStringForDisplayForMessage:(id)a3
{
  objc_msgSend(a1, "subjectStringForDisplayForMessage:style:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)subjectStringForDisplayForMessage:(id)a3 style:(int64_t)a4
{
  objc_msgSend(a1, "_subjectStringForDisplayForObject:style:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ECSubjectFormatter)init
{
  return -[ECSubjectFormatter initWithStyle:](self, "initWithStyle:", 0);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setReplyContext:(id)a3
{
  objc_storeStrong((id *)&self->_replyContext, a3);
}

- (void)setForwardContext:(id)a3
{
  objc_storeStrong((id *)&self->_forwardContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardContext, 0);
  objc_storeStrong((id *)&self->_replyContext, 0);
}

void __36__ECSubjectFormatter_initWithStyle___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1B9ADE000, a2, OS_LOG_TYPE_DEBUG, "Failed to create regex with patter: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
