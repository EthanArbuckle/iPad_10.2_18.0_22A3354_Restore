@implementation FCFeedDescriptor

- (id)latestHeadlineResultsWithContext:(id)a3
{
  id v4;
  FCStreamingResults *v5;
  void *v6;
  FCStreamingResults *v7;

  v4 = a3;
  v5 = [FCStreamingResults alloc];
  -[FCFeedDescriptor streamOfLatestHeadlinesWithContext:](self, "streamOfLatestHeadlinesWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FCStreamingResults initWithStream:](v5, "initWithStream:", v6);
  return v7;
}

- (id)streamOfHeadlinesWithIDs:(id)a3 context:(id)a4 cachedOnly:(BOOL)a5 maxCachedAge:(double)a6
{
  id v10;
  id v11;
  FCArrayStream *v12;
  FCTransformedResultsStream *v13;
  id v14;
  FCTransformedResultsStream *v15;
  void *v17;
  _QWORD v18[5];
  id v19;
  double v20;
  BOOL v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCFeedDescriptor streamOfHeadlinesWithIDs:context:cachedOnly:maxCachedAge:]";
    v24 = 2080;
    v25 = "FCFeedDescriptor.m";
    v26 = 1024;
    v27 = 238;
    v28 = 2114;
    v29 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v12 = -[FCArrayStream initWithArray:]([FCArrayStream alloc], "initWithArray:", v10);
  v13 = [FCTransformedResultsStream alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke;
  v18[3] = &unk_1E463DDB0;
  v18[4] = self;
  v19 = v11;
  v21 = a5;
  v20 = a6;
  v14 = v11;
  v15 = -[FCTransformedResultsStream initWithStream:asyncTransformBlock:](v13, "initWithStream:asyncTransformBlock:", v12, v18);

  return v15;
}

- (FCFeedDescriptor)initWithIdentifier:(id)a3
{
  id v4;
  FCFeedDescriptor *v5;
  FCFeedDescriptor *v6;
  uint64_t v7;
  FCFeedDescriptor *identifier;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFeedDescriptor initWithIdentifier:]";
    v14 = 2080;
    v15 = "FCFeedDescriptor.m";
    v16 = 1024;
    v17 = 65;
    v18 = 2114;
    v19 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11.receiver = self;
  v11.super_class = (Class)FCFeedDescriptor;
  v5 = -[FCFeedDescriptor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      identifier = (FCFeedDescriptor *)v6->_identifier;
      v6->_identifier = (NSString *)v7;
    }
    else
    {
      identifier = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (FCFeedDescriptor)init
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
    v8 = "-[FCFeedDescriptor init]";
    v9 = 2080;
    v10 = "FCFeedDescriptor.m";
    v11 = 1024;
    v12 = 60;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCFeedDescriptor identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCFeedDescriptor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  +[FCDescription descriptionWithObject:](FCDescription, "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedDescriptor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("name"), v4);

  -[FCFeedDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("identifier"), v5);

  v6 = -[FCFeedDescriptor feedConfiguration](self, "feedConfiguration") - 1;
  if (v6 > 0xA)
    v7 = CFSTR("Default");
  else
    v7 = off_1E463DDD0[v6];
  objc_msgSend(v3, "addField:value:", CFSTR("feedConfiguration"), v7);
  -[FCFeedDescriptor alternativeFeedDescriptor](self, "alternativeFeedDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("alternativeFeedDescriptor"), v8);

  objc_msgSend(v3, "descriptionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (FCFeedTheming)theme
{
  return 0;
}

- (unint64_t)feedConfiguration
{
  return 0;
}

- (NSString)name
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedDescriptor name]";
    v9 = 2080;
    v10 = "FCFeedDescriptor.m";
    v11 = 1024;
    v12 = 124;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedDescriptor name]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (BOOL)isSubscribable
{
  return 0;
}

- (BOOL)isSubscribedToWithSubscriptionController:(id)a3
{
  id v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FCFeedDescriptor isSubscribable](self, "isSubscribable"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
      *(_DWORD *)buf = 136315906;
      v12 = "-[FCFeedDescriptor isSubscribedToWithSubscriptionController:]";
      v13 = 2080;
      v14 = "FCFeedDescriptor.m";
      v15 = 1024;
      v16 = 142;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedDescriptor isSubscribedToWithSubscriptionController:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }

  return 0;
}

- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3
{
  return 0;
}

- (FCTagProviding)backingTag
{
  return 0;
}

- (FCChannelProviding)backingChannel
{
  return 0;
}

- (NSString)backingChannelID
{
  return 0;
}

- (NSString)backingSectionID
{
  return 0;
}

- (NSString)backingTopicID
{
  return 0;
}

- (NSArray)iAdCategories
{
  return 0;
}

- (NSArray)iAdKeywords
{
  return 0;
}

- (int64_t)iAdContentProvider
{
  return 1;
}

- (NSString)iAdPrimaryAudience
{
  return 0;
}

- (NSString)iAdFeedID
{
  return (NSString *)&stru_1E464BC40;
}

- (NSString)iAdSectionID
{
  return (NSString *)&stru_1E464BC40;
}

- (int64_t)feedSortMethod
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedDescriptor feedSortMethod]";
    v9 = 2080;
    v10 = "FCFeedDescriptor.m";
    v11 = 1024;
    v12 = 216;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedDescriptor feedSortMethod]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (unint64_t)feedFilterOptions
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
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedDescriptor feedFilterOptions]";
    v9 = 2080;
    v10 = "FCFeedDescriptor.m";
    v11 = 1024;
    v12 = 221;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedDescriptor feedFilterOptions]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return 0;
}

- (id)associateAlternativeFeedDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeFeedDescriptor, a3);
  return self;
}

void __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "fetchOperationForHeadlinesWithIDs:context:", a2, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*(_BYTE *)(a1 + 56))
    v10 = 3;
  else
    v10 = 4;
  objc_msgSend(v8, "setCachePolicy:", v10);
  objc_msgSend(v9, "setMaximumCachedAge:", *(double *)(a1 + 48));
  objc_msgSend(v9, "setQualityOfService:", a3);
  if (a3 == 9)
    v11 = -1;
  else
    v11 = a3 == 33 || a3 == 25;
  objc_msgSend(v9, "setRelativePriority:", v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke_2;
  v14[3] = &unk_1E463B608;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v9, "setFetchCompletionBlock:", v14);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v9);

}

void __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "fetchedObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)fetchOperationForHeadlinesWithIDs:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "context");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCFeedDescriptor fetchOperationForHeadlinesWithIDs:context:]";
    v13 = 2080;
    v14 = "FCFeedDescriptor.m";
    v15 = 1024;
    v16 = 263;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "articleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headlinesFetchOperationForArticleIDs:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)streamOfLatestHeadlinesWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCFeedDescriptor streamOfLatestHeadlinesWithContext:]";
    v11 = 2080;
    v12 = "FCFeedDescriptor.m";
    v13 = 1024;
    v14 = 271;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCFeedDescriptor streamOfLatestHeadlinesWithContext:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)referringFeedItemIdentifier
{
  return self->_referringFeedItemIdentifier;
}

- (void)setReferringFeedItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FCFeedDescriptor)alternativeFeedDescriptor
{
  return self->_alternativeFeedDescriptor;
}

- (NSArray)otherArticleIDs
{
  return self->_otherArticleIDs;
}

- (void)setOtherArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_otherArticleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherArticleIDs, 0);
  objc_storeStrong((id *)&self->_alternativeFeedDescriptor, 0);
  objc_storeStrong((id *)&self->_referringFeedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
