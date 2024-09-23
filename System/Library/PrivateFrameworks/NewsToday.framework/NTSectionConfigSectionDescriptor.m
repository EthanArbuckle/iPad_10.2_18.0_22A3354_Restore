@implementation NTSectionConfigSectionDescriptor

- (NTSectionConfigSectionDescriptor)init
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
    v8 = "-[NTSectionConfigSectionDescriptor init]";
    v9 = 2080;
    v10 = "NTSectionConfigSectionDescriptor.m";
    v11 = 1024;
    v12 = 54;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTSectionConfigSectionDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTSectionConfigSectionDescriptor)initWithSectionConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 hiddenFeedIDs:(id)a6 allowPaidBundleFeed:(BOOL)a7 todayData:(id)a8 supplementalFeedFilterOptions:(unint64_t)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NTSectionConfigSectionDescriptor *v20;
  void *v21;
  uint64_t v22;
  NSString *identifier;
  void *v24;
  uint64_t v25;
  NSString *subidentifier;
  void *v27;
  uint64_t v28;
  NSString *personalizationFeatureID;
  void *v30;
  uint64_t v31;
  NSString *name;
  void *v33;
  uint64_t v34;
  NSString *compactName;
  void *v36;
  uint64_t v37;
  NSString *referralBarName;
  void *v39;
  uint64_t v40;
  NSString *nameColorLight;
  void *v42;
  uint64_t v43;
  NSString *nameColorDark;
  uint64_t v45;
  NSString *actionTitle;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSURL *actionURL;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSString *backgroundColorDark;
  uint64_t v62;
  NSString *backgroundColorLight;
  NTForYouSectionFetchDescriptor *v64;
  NTArticleListSectionFetchDescriptor *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  NTArticleIDsSectionFetchDescriptor *v71;
  NTPersonalizedSectionFetchDescriptor *v72;
  NTItemsSectionFetchDescriptor *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  NTTagSectionFetchDescriptor *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  NTForYouSectionFetchDescriptor *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NTSectionFetchDescriptor *fetchDescriptor;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  _BOOL4 v96;
  id v97;
  void *v98;
  id v99;
  objc_super v100;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (!v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionConfigSectionDescriptor initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:].cold.1();
  v100.receiver = self;
  v100.super_class = (Class)NTSectionConfigSectionDescriptor;
  v20 = -[NTSectionConfigSectionDescriptor init](&v100, sel_init);
  if (v20)
  {
    v98 = v19;
    objc_msgSend(v15, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v22;

    objc_msgSend(v15, "subidentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    subidentifier = v20->_subidentifier;
    v20->_subidentifier = (NSString *)v25;

    objc_msgSend(v15, "personalizationFeatureID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    personalizationFeatureID = v20->_personalizationFeatureID;
    v20->_personalizationFeatureID = (NSString *)v28;

    objc_msgSend(v15, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v31;

    objc_msgSend(v15, "compactName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    compactName = v20->_compactName;
    v20->_compactName = (NSString *)v34;

    objc_msgSend(v15, "referralBarName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    referralBarName = v20->_referralBarName;
    v20->_referralBarName = (NSString *)v37;

    objc_msgSend(v15, "nameColorLight");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    nameColorLight = v20->_nameColorLight;
    v20->_nameColorLight = (NSString *)v40;

    objc_msgSend(v15, "nameColorDark");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    nameColorDark = v20->_nameColorDark;
    v20->_nameColorDark = (NSString *)v43;

    v20->_cachedResultCutoffTime = objc_msgSend(v15, "cachedResultCutoffTime");
    v20->_fallbackOrder = objc_msgSend(v15, "fallbackOrder");
    v20->_minimumStoriesAllocation = objc_msgSend(v15, "minimumStoriesAllocation");
    v20->_maximumStoriesAllocation = objc_msgSend(v15, "maximumStoriesAllocation");
    v20->_readArticlesFilterMethod = objc_msgSend(v15, "readArticlesFilterMethod");
    v20->_seenArticlesFilterMethod = objc_msgSend(v15, "seenArticlesFilterMethod");
    v20->_seenArticlesMinimumTimeSinceFirstSeenToFilter = objc_msgSend(v15, "seenArticlesMinimumTimeSinceFirstSeenToFilter");
    v20->_supplementalIntraSectionFilterOptions = objc_msgSend(v15, "intraSectionFilteringOptions") | a9;
    v20->_supplementalInterSectionFilterOptions = objc_msgSend(v15, "interSectionFilteringOptions");
    objc_msgSend(v15, "groupActionTitle");
    v45 = objc_claimAutoreleasedReturnValue();
    actionTitle = v20->_actionTitle;
    v20->_actionTitle = (NSString *)v45;

    objc_msgSend(v15, "groupActionUrl");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v16;
    v97 = v17;
    if (v47)
    {
      v48 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v15, "groupActionUrl");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "URLWithString:", v49);
      v50 = objc_claimAutoreleasedReturnValue();
      actionURL = v20->_actionURL;
      v20->_actionURL = (NSURL *)v50;

    }
    else
    {
      v49 = v20->_actionURL;
      v20->_actionURL = 0;
    }
    v96 = v10;

    v20->_promotionCriterion = objc_msgSend(v15, "promotionCriterion");
    objc_msgSend(v15, "tagTodaySectionConfig");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "tagID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v20->_backingTagID, v53);
    objc_msgSend(v15, "groupNameActionUrl");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      v55 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v15, "groupNameActionUrl");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "URLWithString:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v57 = 0;
    }
    v19 = v98;

    if (v53)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fc_NewsURLForTagID:", v53);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
    if (v57)
      v59 = v57;
    else
      v59 = v58;
    objc_storeStrong((id *)&v20->_nameActionURL, v59);
    objc_msgSend(v15, "backgroundColorDark");
    v60 = objc_claimAutoreleasedReturnValue();
    backgroundColorDark = v20->_backgroundColorDark;
    v20->_backgroundColorDark = (NSString *)v60;

    objc_msgSend(v15, "backgroundColorLight");
    v62 = objc_claimAutoreleasedReturnValue();
    backgroundColorLight = v20->_backgroundColorLight;
    v20->_backgroundColorLight = (NSString *)v62;

    v64 = 0;
    switch(objc_msgSend(v15, "sectionType"))
    {
      case 0u:
        v65 = [NTArticleListSectionFetchDescriptor alloc];
        objc_msgSend(v15, "articleListTodaySectionConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[NTArticleListSectionFetchDescriptor initWithArticleListConfiguration:](v65, "initWithArticleListConfiguration:", v66);
        goto LABEL_24;
      case 1u:
        objc_msgSend(v98, "mutedTagIDs");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v68;
        if (v68)
          v70 = v68;
        else
          v70 = (id)objc_opt_new();
        v66 = v70;

        objc_msgSend(v98, "purchasedTagIDs");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v77;
        if (v77)
          v79 = v77;
        else
          v79 = (id)objc_opt_new();
        v94 = v79;

        objc_msgSend(v98, "rankedAllSubscribedTagIDs");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v82;
        v93 = v58;
        if (v82)
          v84 = v82;
        else
          v84 = (id)objc_opt_new();
        v85 = v84;
        v92 = v84;

        v86 = [NTForYouSectionFetchDescriptor alloc];
        objc_msgSend(v15, "forYouTodaySectionConfig");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18);
        v95 = v18;
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v98;
        v64 = -[NTForYouSectionFetchDescriptor initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:](v86, "initWithForYouConfiguration:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:mutedTagIDs:purchasedTagIDs:rankedAllSubscribedTagIDs:bundleSubscriptionProvider:", v87, v99, v97, v88, v96, v66, v94, v85, v98);

        v18 = v95;
        v58 = v93;
        goto LABEL_37;
      case 3u:
        v71 = [NTArticleIDsSectionFetchDescriptor alloc];
        objc_msgSend(v15, "articleIDsTodaySectionConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[NTArticleIDsSectionFetchDescriptor initWithArticleIDsConfiguration:](v71, "initWithArticleIDsConfiguration:", v66);
        goto LABEL_24;
      case 4u:
        v72 = [NTPersonalizedSectionFetchDescriptor alloc];
        objc_msgSend(v15, "personalizedTodaySectionConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[NTPersonalizedSectionFetchDescriptor initWithPersonalizedConfiguration:](v72, "initWithPersonalizedConfiguration:", v66);
        goto LABEL_24;
      case 5u:
        v73 = [NTItemsSectionFetchDescriptor alloc];
        objc_msgSend(v15, "itemsTodaySectionConfig");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[NTItemsSectionFetchDescriptor initWithItemsConfiguration:](v73, "initWithItemsConfiguration:", v66);
LABEL_24:
        v64 = (NTForYouSectionFetchDescriptor *)v67;
        goto LABEL_37;
      case 6u:
        objc_msgSend(v98, "purchasedTagIDs");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v74;
        if (v74)
          v76 = v74;
        else
          v76 = (id)objc_opt_new();
        v66 = v76;

        v80 = [NTTagSectionFetchDescriptor alloc];
        objc_msgSend(v15, "tagTodaySectionConfig");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = -[NTTagSectionFetchDescriptor initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:](v80, "initWithTagConfiguration:appConfiguration:purchasedTagIDs:bundleSubscriptionProvider:", v81, v99, v66, v98);

        v19 = v98;
LABEL_37:

        break;
      default:
        break;
    }
    v89 = -[NTForYouSectionFetchDescriptor copy](v64, "copy");
    fetchDescriptor = v20->_fetchDescriptor;
    v20->_fetchDescriptor = (NTSectionFetchDescriptor *)v89;

    v16 = v99;
    v17 = v97;
  }

  return v20;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionConfigSectionDescriptor configureCatchUpOperationWithFetchRequest:].cold.1();
  -[NTSectionConfigSectionDescriptor fetchDescriptor](self, "fetchDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureCatchUpOperationWithFetchRequest:", v4);

}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionConfigSectionDescriptor assembleResultsWithCatchUpOperation:].cold.1();
  -[NTSectionConfigSectionDescriptor fetchDescriptor](self, "fetchDescriptor");
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
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionConfigSectionDescriptor incrementalSortTransformationWithFeedPersonalizer:].cold.1();
  -[NTSectionConfigSectionDescriptor fetchDescriptor](self, "fetchDescriptor");
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

  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTSectionConfigSectionDescriptor incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:].cold.2();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionConfigSectionDescriptor incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:].cold.1();
LABEL_6:
  -[NTSectionConfigSectionDescriptor fetchDescriptor](self, "fetchDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:", v8, a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (unint64_t)cachedResultCutoffTime
{
  return self->_cachedResultCutoffTime;
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (int)readArticlesFilterMethod
{
  return self->_readArticlesFilterMethod;
}

- (int)seenArticlesFilterMethod
{
  return self->_seenArticlesFilterMethod;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  return self->_supplementalInterSectionFilterOptions;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  return self->_supplementalIntraSectionFilterOptions;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSURL)nameActionURL
{
  return self->_nameActionURL;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (NTSectionFetchDescriptor)fetchDescriptor
{
  return self->_fetchDescriptor;
}

- (void)setFetchDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDescriptor, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);
  objc_storeStrong((id *)&self->_nameActionURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_compactName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)configureCatchUpOperationWithFetchRequest:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperation", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)assembleResultsWithCatchUpOperation:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperation", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)incrementalSortTransformationWithFeedPersonalizer:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorFeedItems", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
