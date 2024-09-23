@implementation NTSectionPlaceholderDescriptor

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  return -[NTFeedTransformationLimit initWithLimit:]([NTFeedTransformationLimit alloc], "initWithLimit:", a4);
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  return self->_supplementalInterSectionFilterOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_nameActionURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_compactName, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  return self->_supplementalIntraSectionFilterOptions;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (NTSectionPlaceholderDescriptor)init
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
    v8 = "-[NTSectionPlaceholderDescriptor init]";
    v9 = 2080;
    v10 = "NTSectionPlaceholderDescriptor.m";
    v11 = 1024;
    v12 = 43;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSectionPlaceholderDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTSectionPlaceholderDescriptor)initWithName:(id)a3 nameColorLight:(id)a4 nameColorDark:(id)a5 minimumStoriesAllocation:(unint64_t)a6 maximumStoriesAllocation:(unint64_t)a7 backingTagID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NTSectionPlaceholderDescriptor *v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *name;
  uint64_t v24;
  NSString *nameColorLight;
  void *v26;
  uint64_t v27;
  NSString *nameColorDark;
  uint64_t v29;
  NSString *backingTagID;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)NTSectionPlaceholderDescriptor;
  v18 = -[NTSectionPlaceholderDescriptor init](&v32, sel_init);
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = objc_claimAutoreleasedReturnValue();
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    nameColorLight = v18->_nameColorLight;
    v18->_nameColorLight = (NSString *)v24;

    if (v16)
      v26 = v16;
    else
      v26 = v15;
    v27 = objc_msgSend(v26, "copy");
    nameColorDark = v18->_nameColorDark;
    v18->_nameColorDark = (NSString *)v27;

    v18->_maximumStoriesAllocation = a7;
    v18->_minimumStoriesAllocation = a6;
    v29 = objc_msgSend(v17, "copy");
    backingTagID = v18->_backingTagID;
    v18->_backingTagID = (NSString *)v29;

  }
  return v18;
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
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

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[NTSectionPlaceholderDescriptor assembleResultsWithCatchUpOperation:]";
    v11 = 2080;
    v12 = "NTSectionPlaceholderDescriptor.m";
    v13 = 1024;
    v14 = 75;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSectionPlaceholderDescriptor assembleResultsWithCatchUpOperation:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  NTFeedTransformationItemFeedTransformation *v3;
  void *v4;
  NTFeedTransformationItemFeedTransformation *v5;

  v3 = [NTFeedTransformationItemFeedTransformation alloc];
  objc_msgSend(MEMORY[0x24BE6CB98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NTFeedTransformationItemFeedTransformation initWithFeedItemTransformation:](v3, "initWithFeedItemTransformation:", v4);

  return v5;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (unint64_t)cachedResultCutoffTime
{
  return self->_cachedResultCutoffTime;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (int)readArticlesFilterMethod
{
  return self->_readArticlesFilterMethod;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (int)seenArticlesFilterMethod
{
  return self->_seenArticlesFilterMethod;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSURL)nameActionURL
{
  return self->_nameActionURL;
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

@end
