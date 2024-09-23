@implementation FCFeedTransformationPersonalizedSort

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5 configurationSet:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setFeedPersonalizer:", v10);

  objc_msgSend(v11, "setFeedItemScores:", v9);
  objc_msgSend(v11, "setSortOptions:", a5);
  objc_msgSend(v11, "setConfigurationSet:", a6);
  return v11;
}

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5
{
  return (id)objc_msgSend(a1, "transformationWithPersonalizer:feedItemScores:sortOptions:configurationSet:", a3, a4, a5, 0);
}

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4
{
  return (id)objc_msgSend(a1, "transformationWithPersonalizer:feedItemScores:sortOptions:", a3, a4, 1);
}

+ (id)transformationWithPersonalizer:(id)a3 sortOptions:(int64_t)a4
{
  return (id)objc_msgSend(a1, "transformationWithPersonalizer:feedItemScores:sortOptions:", a3, 0, a4);
}

+ (id)transformationWithPersonalizer:(id)a3 configurationSet:(int64_t)a4
{
  return (id)objc_msgSend(a1, "transformationWithPersonalizer:feedItemScores:sortOptions:configurationSet:", a3, 0, 1, a4);
}

+ (id)transformationWithPersonalizer:(id)a3
{
  return (id)objc_msgSend(a1, "transformationWithPersonalizer:feedItemScores:", a3, 0);
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];

  v4 = a3;
  NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("personalization_disabled")))
  {

LABEL_6:
    v8 = v4;
    goto LABEL_7;
  }
  -[FCFeedTransformationPersonalizedSort feedPersonalizer](self, "feedPersonalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  -[FCFeedTransformationPersonalizedSort feedItemScores](self, "feedItemScores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__FCFeedTransformationPersonalizedSort_transformFeedItems___block_invoke;
    v11[3] = &unk_1E463F360;
    v11[4] = self;
    objc_msgSend(v4, "sortedArrayUsingComparator:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FCFeedTransformationPersonalizedSort personalizedHeadlines:](self, "personalizedHeadlines:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  v9 = v8;

  return v9;
}

uint64_t __59__FCFeedTransformationPersonalizedSort_transformFeedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "feedItemScores");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "feedItemScores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected a score for item %@"), v6);
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFeedTransformationPersonalizedSort transformFeedItems:]_block_invoke";
    v21 = 2080;
    v22 = "FCFeedTransformationPersonalize.m";
    v23 = 1024;
    v24 = 90;
    v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected a score for item %@"), v5);
      *(_DWORD *)buf = 136315906;
      v20 = "-[FCFeedTransformationPersonalizedSort transformFeedItems:]_block_invoke";
      v21 = 2080;
      v22 = "FCFeedTransformationPersonalize.m";
      v23 = 1024;
      v24 = 91;
      v25 = 2114;
      v26 = v18;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = &unk_1E470B120;
  }
  v12 = &unk_1E470B120;
  if (v8)
    v12 = v8;
  v13 = v12;

  v14 = v11;
  v15 = objc_msgSend(v13, "compare:", v14);

  return v15;
}

- (id)transformHeadlines:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("personalization_disabled")))
  {

LABEL_5:
    v7 = v4;
    goto LABEL_6;
  }
  -[FCFeedTransformationPersonalizedSort feedPersonalizer](self, "feedPersonalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  -[FCFeedTransformationPersonalizedSort personalizedHeadlines:](self, "personalizedHeadlines:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v7;

  return v8;
}

- (id)personalizedHeadlines:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FCFeedTransformationPersonalizedSort feedPersonalizer](self, "feedPersonalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortItems:options:configurationSet:", v4, -[FCFeedTransformationPersonalizedSort sortOptions](self, "sortOptions"), -[FCFeedTransformationPersonalizedSort configurationSet](self, "configurationSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sortedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (FCMapTable)feedItemScores
{
  return self->_feedItemScores;
}

- (void)setFeedItemScores:(id)a3
{
  objc_storeStrong((id *)&self->_feedItemScores, a3);
}

- (int64_t)sortOptions
{
  return self->_sortOptions;
}

- (void)setSortOptions:(int64_t)a3
{
  self->_sortOptions = a3;
}

- (int64_t)configurationSet
{
  return self->_configurationSet;
}

- (void)setConfigurationSet:(int64_t)a3
{
  self->_configurationSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItemScores, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
