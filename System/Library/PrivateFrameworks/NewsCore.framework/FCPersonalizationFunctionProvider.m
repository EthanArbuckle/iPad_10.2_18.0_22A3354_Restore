@implementation FCPersonalizationFunctionProvider

- (FCPersonalizationFunctionProvider)init
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
    v8 = "-[FCPersonalizationFunctionProvider init]";
    v9 = 2080;
    v10 = "FCPersonalizationFunctionProvider.m";
    v11 = 1024;
    v12 = 28;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPersonalizationFunctionProvider init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCPersonalizationFunctionProvider)initWithAppConfiguration:(id)a3
{
  id v4;
  FCPersonalizationFunctionProvider *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appConfiguration");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCPersonalizationFunctionProvider initWithAppConfiguration:]";
    v15 = 2080;
    v16 = "FCPersonalizationFunctionProvider.m";
    v17 = 1024;
    v18 = 33;
    v19 = 2114;
    v20 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v12.receiver = self;
  v12.super_class = (Class)FCPersonalizationFunctionProvider;
  v5 = -[FCPersonalizationFunctionProvider init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "articleDiversificationSimilarityExpectationStart");
    v5->_articleDiversificationSimilarityExpectationStart = v6;
    objc_msgSend(v4, "articleDiversificationSimilarityExpectationEnd");
    v5->_articleDiversificationSimilarityExpectationEnd = v7;
    objc_msgSend(v4, "articleDiversificationUniquePublisherExpectationSlope");
    v5->_articleDiversificationUniquePublisherExpectationSlope = v8;
    objc_msgSend(v4, "articleDiversificationUniquePublisherExpectationYIntercept");
    v5->_articleDiversificationUniquePublisherExpectationYIntercept = v9;
  }

  return v5;
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4
{
  return -[FCPersonalizationFunctionProvider diversifyItems:limit:preselectedItems:](self, "diversifyItems:limit:preselectedItems:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4 preselectedItems:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v8 = a5;
  v9 = a3;
  -[FCPersonalizationFunctionProvider articleDiversificationSimilarityExpectationStart](self, "articleDiversificationSimilarityExpectationStart");
  v11 = v10;
  -[FCPersonalizationFunctionProvider articleDiversificationSimilarityExpectationEnd](self, "articleDiversificationSimilarityExpectationEnd");
  v13 = v12;
  -[FCPersonalizationFunctionProvider articleDiversificationUniquePublisherExpectationSlope](self, "articleDiversificationUniquePublisherExpectationSlope");
  v15 = v14;
  -[FCPersonalizationFunctionProvider articleDiversificationUniquePublisherExpectationYIntercept](self, "articleDiversificationUniquePublisherExpectationYIntercept");
  +[FCPersonalizationUtilities diversifyItems:withPreselectedItems:limit:similarityStartExpectation:similarityEndExpectation:publisherDiversificationSlope:publisherDiversificationYIntercept:](FCPersonalizationUtilities, "diversifyItems:withPreselectedItems:limit:similarityStartExpectation:similarityEndExpectation:publisherDiversificationSlope:publisherDiversificationYIntercept:", v9, v8, a4, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)articleDiversificationSimilarityExpectationStart
{
  return self->_articleDiversificationSimilarityExpectationStart;
}

- (void)setArticleDiversificationSimilarityExpectationStart:(double)a3
{
  self->_articleDiversificationSimilarityExpectationStart = a3;
}

- (double)articleDiversificationSimilarityExpectationEnd
{
  return self->_articleDiversificationSimilarityExpectationEnd;
}

- (void)setArticleDiversificationSimilarityExpectationEnd:(double)a3
{
  self->_articleDiversificationSimilarityExpectationEnd = a3;
}

- (double)articleDiversificationUniquePublisherExpectationSlope
{
  return self->_articleDiversificationUniquePublisherExpectationSlope;
}

- (void)setArticleDiversificationUniquePublisherExpectationSlope:(double)a3
{
  self->_articleDiversificationUniquePublisherExpectationSlope = a3;
}

- (double)articleDiversificationUniquePublisherExpectationYIntercept
{
  return self->_articleDiversificationUniquePublisherExpectationYIntercept;
}

- (void)setArticleDiversificationUniquePublisherExpectationYIntercept:(double)a3
{
  self->_articleDiversificationUniquePublisherExpectationYIntercept = a3;
}

@end
