@implementation NTPBTodayPersonalizationEvent(FTAdditions)

+ (id)ft_eventWithDate:()FTAdditions action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  if (!v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[NTPBTodayPersonalizationEvent(FTAdditions) ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:].cold.4();
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NTPBTodayPersonalizationEvent(FTAdditions) ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:].cold.3();
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NTPBTodayPersonalizationEvent(FTAdditions) ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:].cold.2();
  objc_msgSend(v15, "personalizationMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[NTPBTodayPersonalizationEvent(FTAdditions) ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:].cold.1();
  v18 = (void *)objc_opt_new();
  objc_msgSend(v14, "timeIntervalSince1970");
  objc_msgSend(v18, "setCreatedAt:");
  objc_msgSend(v18, "setAction:", a4);
  objc_msgSend(v17, "articleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setArticleId:", v19);

  objc_msgSend(v17, "scoredTopicIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __157__NTPBTodayPersonalizationEvent_FTAdditions__ft_eventWithDate_action_headline_section_headlineIndexInSection_precedingHeadlinesCount_precedingSectionsCount___block_invoke;
  v25[3] = &unk_24DB5F888;
  v21 = v18;
  v26 = v21;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_msgSend(v17, "publisherID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHeadlinePublisher:", v22);

  objc_msgSend(v21, "setOrderInGroup:", a7);
  objc_msgSend(v21, "setOverallOrder:", a8);
  objc_msgSend(v21, "setSectionOrder:", a9);
  objc_msgSend(v16, "personalizationFeatureID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPersonalizationSectionFeatureId:", v23);

  return v21;
}

+ (void)ft_eventWithDate:()FTAdditions action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"personalizationMetadata", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)ft_eventWithDate:()FTAdditions action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"section", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)ft_eventWithDate:()FTAdditions action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)ft_eventWithDate:()FTAdditions action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
