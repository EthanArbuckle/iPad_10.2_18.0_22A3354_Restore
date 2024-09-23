@implementation FCFeedTransformationComposite

- (FCFeedTransformationComposite)init
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
    v8 = "-[FCFeedTransformationComposite init]";
    v9 = 2080;
    v10 = "FCFeedTransformationComposite.m";
    v11 = 1024;
    v12 = 27;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedTransformationComposite init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3
{
  id v4;
  FCFeedTransformationComposite *v5;
  uint64_t v6;
  NSArray *feedTransformations;
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
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedTransformations");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCFeedTransformationComposite initWithFeedTransformations:]";
    v13 = 2080;
    v14 = "FCFeedTransformationComposite.m";
    v15 = 1024;
    v16 = 32;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCFeedTransformationComposite;
  v5 = -[FCFeedTransformationComposite init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    feedTransformations = v5->_feedTransformations;
    v5->_feedTransformations = (NSArray *)v6;

  }
  return v5;
}

- (FCFeedTransformationComposite)initWithFeedTransformations:(id)a3 logTransformationResults:(BOOL)a4
{
  id v6;
  FCFeedTransformationComposite *v7;
  FCFeedTransformationComposite *v8;
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
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "feedTransformations");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCFeedTransformationComposite initWithFeedTransformations:logTransformationResults:]";
    v13 = 2080;
    v14 = "FCFeedTransformationComposite.m";
    v15 = 1024;
    v16 = 43;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v7 = -[FCFeedTransformationComposite initWithFeedTransformations:](self, "initWithFeedTransformations:", v6);
  v8 = v7;
  if (v7)
    v7->_shouldLogTransformationResults = a4;

  return v8;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FCFeedTransformationComposite feedTransformations](self, "feedTransformations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCFeedTransformationComposite shouldLogTransformationResults](self, "shouldLogTransformationResults");
  -[FCFeedTransformationComposite transformationLogs](self, "transformationLogs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCApplyFeedTransformationsAndLog(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldLogTransformationResults
{
  return self->_shouldLogTransformationResults;
}

- (NSMutableArray)transformationLogs
{
  return self->_transformationLogs;
}

- (NSArray)feedTransformations
{
  return self->_feedTransformations;
}

- (void)setFeedTransformations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedTransformations, 0);
  objc_storeStrong((id *)&self->_transformationLogs, 0);
}

@end
