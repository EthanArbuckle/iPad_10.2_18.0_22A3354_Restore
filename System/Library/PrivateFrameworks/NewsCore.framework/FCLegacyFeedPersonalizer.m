@implementation FCLegacyFeedPersonalizer

- (FCLegacyFeedPersonalizer)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLegacyFeedPersonalizer init]";
    v9 = 2080;
    v10 = "FCLegacyFeedPersonalizer.m";
    v11 = 1024;
    v12 = 23;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCLegacyFeedPersonalizer init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCLegacyFeedPersonalizer)initWithFeedPersonalizer:(id)a3 functionProvider:(id)a4
{
  id v7;
  id v8;
  FCLegacyFeedPersonalizer *v9;
  FCLegacyFeedPersonalizer *v10;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedPersonalizer");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCLegacyFeedPersonalizer initWithFeedPersonalizer:functionProvider:]";
    v17 = 2080;
    v18 = "FCLegacyFeedPersonalizer.m";
    v19 = 1024;
    v20 = 28;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "functionProvider");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCLegacyFeedPersonalizer initWithFeedPersonalizer:functionProvider:]";
    v17 = 2080;
    v18 = "FCLegacyFeedPersonalizer.m";
    v19 = 1024;
    v20 = 29;
    v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCLegacyFeedPersonalizer;
  v9 = -[FCLegacyFeedPersonalizer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedPersonalizer, a3);
    objc_storeStrong((id *)&v10->_functionProvider, a4);
  }

  return v10;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForUseWithCompletionHandler:", v4);

}

- (id)rankTagIDsDescending:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankTagIDsDescending:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)scoresForTagIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoresForTagIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)decayedPublisherDiversificationPenalty
{
  void *v2;
  double v3;
  double v4;

  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decayedPublisherDiversificationPenalty");
  v4 = v3;

  return v4;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "limitItemsByFlowRate:timeInterval:publisherCount:", v8, a5, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "limitItemsByMinimumItemQuality:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FCLegacyFeedPersonalizer feedPersonalizer](self, "feedPersonalizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortItems:options:configurationSet:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[FCLegacyFeedPersonalizer functionProvider](self, "functionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "diversifyItems:limit:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (FCPersonalizationFunctionProviding)functionProvider
{
  return self->_functionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionProvider, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
