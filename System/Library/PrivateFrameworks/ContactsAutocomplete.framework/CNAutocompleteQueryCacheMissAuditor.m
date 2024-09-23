@implementation CNAutocompleteQueryCacheMissAuditor

- (CNAutocompleteQueryCacheMissAuditor)init
{
  CNAutocompleteQueryCacheMissLogger *v3;
  CNAutocompleteQueryCacheMissAuditor *v4;

  v3 = objc_alloc_init(CNAutocompleteQueryCacheMissLogger);
  v4 = -[CNAutocompleteQueryCacheMissAuditor initWithLogger:](self, "initWithLogger:", v3);

  return v4;
}

- (CNAutocompleteQueryCacheMissAuditor)initWithLogger:(id)a3
{
  id v5;
  CNAutocompleteQueryCacheMissAuditor *v6;
  CNAutocompleteQueryCacheMissAuditor *v7;
  CNAutocompleteQueryCacheMissAuditor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteQueryCacheMissAuditor;
  v6 = -[CNAutocompleteQueryCacheMissAuditor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logger, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteQueryCacheMissAuditor cachedResults](self, "cachedResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("cached"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didReturnLiveResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  if (self->_cachedResults)
  {
    -[CNAutocompleteQueryCacheMissAuditor cachedResults](self, "cachedResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v6);
  if (objc_msgSend(v8, "count"))
  {
    -[CNAutocompleteQueryCacheMissAuditor logger](self, "logger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didReturnCacheFalseNegatives:", v10);

  }
  v11 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v11, "minusSet:", v7);
  if (objc_msgSend(v11, "count"))
  {
    -[CNAutocompleteQueryCacheMissAuditor logger](self, "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didReturnCacheFalsePositives:", v13);

  }
}

- (CNAutocompleteQueryCacheMissLogger)logger
{
  return (CNAutocompleteQueryCacheMissLogger *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)cachedResults
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedResults:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
