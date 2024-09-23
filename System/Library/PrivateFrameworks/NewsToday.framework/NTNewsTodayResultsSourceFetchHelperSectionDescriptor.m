@implementation NTNewsTodayResultsSourceFetchHelperSectionDescriptor

- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)init
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

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsTodayResultsSourceFetchHelperSectionDescriptor init]";
    v9 = 2080;
    v10 = "NTNewsTodayResultsSourceFetchHelper.m";
    v11 = 1024;
    v12 = 125;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsTodayResultsSourceFetchHelperSectionDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)initWithSectionDescriptor:(id)a3 parentSectionQueueDescriptor:(id)a4
{
  id v6;
  id v7;
  NTNewsTodayResultsSourceFetchHelperSectionDescriptor *v8;
  uint64_t v9;
  NTSectionDescriptor *sectionDescriptor;
  uint64_t v11;
  NTSectionQueueDescriptor *parentSectionQueueDescriptor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor initWithSectionDescriptor:parentSectionQueueDescriptor:].cold.2();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor initWithSectionDescriptor:parentSectionQueueDescriptor:].cold.1();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTNewsTodayResultsSourceFetchHelperSectionDescriptor;
  v8 = -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sectionDescriptor = v8->_sectionDescriptor;
    v8->_sectionDescriptor = (NTSectionDescriptor *)v9;

    v11 = objc_msgSend(v7, "copy");
    parentSectionQueueDescriptor = v8->_parentSectionQueueDescriptor;
    v8->_parentSectionQueueDescriptor = (NTSectionQueueDescriptor *)v11;

  }
  return v8;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureCatchUpOperationWithFetchRequest:", v4);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assembleResultsWithCatchUpOperation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incrementalSortTransformationWithFeedPersonalizer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:", v9, a4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subidentifier
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subidentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)personalizationFeatureID
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personalizationFeatureID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)compactName
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)referralBarName
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referralBarName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)nameColorLight
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameColorLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)nameColorDark
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameColorDark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)cachedResultCutoffTime
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cachedResultCutoffTime");

  return v3;
}

- (unint64_t)fallbackOrder
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fallbackOrder");

  return v3;
}

- (unint64_t)minimumStoriesAllocation
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumStoriesAllocation");

  return v3;
}

- (unint64_t)maximumStoriesAllocation
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumStoriesAllocation");

  return v3;
}

- (int)readArticlesFilterMethod
{
  void *v2;
  int v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "readArticlesFilterMethod");

  return v3;
}

- (int)seenArticlesFilterMethod
{
  void *v2;
  int v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "seenArticlesFilterMethod");

  return v3;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  void *v2;
  int64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "seenArticlesMinimumTimeSinceFirstSeenToFilter");

  return v3;
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supplementalInterSectionFilterOptions");

  return v3;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  void *v2;
  unint64_t v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supplementalIntraSectionFilterOptions");

  return v3;
}

- (NSString)actionTitle
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)actionURL
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int)promotionCriterion
{
  void *v2;
  int v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "promotionCriterion");

  return v3;
}

- (NSString)backingTagID
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingTagID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)nameActionURL
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameActionURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)backgroundColorLight
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColorLight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)backgroundColorDark
{
  void *v2;
  void *v3;

  -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor sectionDescriptor](self, "sectionDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColorDark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NTSectionDescriptor)sectionDescriptor
{
  return self->_sectionDescriptor;
}

- (NTSectionQueueDescriptor)parentSectionQueueDescriptor
{
  return self->_parentSectionQueueDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSectionQueueDescriptor, 0);
  objc_storeStrong((id *)&self->_sectionDescriptor, 0);
}

- (void)initWithSectionDescriptor:parentSectionQueueDescriptor:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parentSectionQueueDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSectionDescriptor:parentSectionQueueDescriptor:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
