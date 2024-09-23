@implementation FCAssertPreparedFeedPersonalizer

uint64_t __71__FCAssertPreparedFeedPersonalizer_prepareForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPreparedForUse:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPreparedForUse:(BOOL)a3
{
  self->_preparedForUse = a3;
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortItems:options:configurationSet:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__FCAssertPreparedFeedPersonalizer_prepareForUseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E463B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "prepareForUseWithCompletionHandler:", v7);

}

- (FCFeedPersonalizing)target
{
  return self->_target;
}

- (FCAssertPreparedFeedPersonalizer)initWithTarget:(id)a3
{
  id v5;
  FCAssertPreparedFeedPersonalizer *v6;
  FCAssertPreparedFeedPersonalizer *v7;
  void *v9;
  objc_super v10;
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
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "target");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCAssertPreparedFeedPersonalizer initWithTarget:]";
    v13 = 2080;
    v14 = "FCAssertPreparedFeedPersonalizer.m";
    v15 = 1024;
    v16 = 31;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCAssertPreparedFeedPersonalizer;
  v6 = -[FCAssertPreparedFeedPersonalizer init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_target, a3);

  return v7;
}

- (id)rankTagIDsDescending:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankTagIDsDescending:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCAssertPreparedFeedPersonalizer)init
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
    v8 = "-[FCAssertPreparedFeedPersonalizer init]";
    v9 = 2080;
    v10 = "FCAssertPreparedFeedPersonalizer.m";
    v11 = 1024;
    v12 = 26;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCAssertPreparedFeedPersonalizer init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)scoresForTagIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scoresForTagIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "limitItemsByMinimumItemQuality:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "limitItemsByFlowRate:timeInterval:publisherCount:", v8, a5, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)decayedPublisherDiversificationPenalty
{
  void *v2;
  double v3;
  double v4;

  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decayedPublisherDiversificationPenalty");
  v4 = v3;

  return v4;
}

- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCAssertPreparedFeedPersonalizer target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[FCAssertPreparedFeedPersonalizer target](self, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchAggregateMapForPersonalizingItem:completion:", v6, v7);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
    v11 = 136315906;
    v12 = "-[FCAssertPreparedFeedPersonalizer fetchAggregateMapForPersonalizingItem:completion:]";
    v13 = 2080;
    v14 = "FCAssertPreparedFeedPersonalizer.m";
    v15 = 1024;
    v16 = 104;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }

LABEL_5:
}

- (BOOL)isPreparedForUse
{
  return self->_preparedForUse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
}

@end
