@implementation NTQueueConfigSectionQueueDescriptor

- (NTQueueConfigSectionQueueDescriptor)init
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
    v8 = "-[NTQueueConfigSectionQueueDescriptor init]";
    v9 = 2080;
    v10 = "NTQueueConfigSectionQueueDescriptor.m";
    v11 = 1024;
    v12 = 20;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTQueueConfigSectionQueueDescriptor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTQueueConfigSectionQueueDescriptor)initWithQueueConfig:(id)a3 appConfiguration:(id)a4 todayData:(id)a5 inFavoritesOnlyMode:(BOOL)a6 respectsWidgetVisibleSectionsLimit:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  NTQueueConfigSectionQueueDescriptor *v15;
  void *v16;
  uint64_t v17;
  NSArray *sectionDescriptors;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  BOOL v24;
  objc_super v25;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:].cold.2();
    if (v13)
      goto LABEL_6;
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:].cold.1();
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)NTQueueConfigSectionQueueDescriptor;
  v15 = -[NTQueueConfigSectionQueueDescriptor init](&v25, sel_init);
  if (v15)
  {
    objc_msgSend(v12, "todaySectionConfigs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __141__NTQueueConfigSectionQueueDescriptor_initWithQueueConfig_appConfiguration_todayData_inFavoritesOnlyMode_respectsWidgetVisibleSectionsLimit___block_invoke;
    v21[3] = &unk_24DB5F9F0;
    v24 = a6;
    v22 = v13;
    v23 = v14;
    objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", v21);
    v17 = objc_claimAutoreleasedReturnValue();
    sectionDescriptors = v15->_sectionDescriptors;
    v15->_sectionDescriptors = (NSArray *)v17;

    if (v7)
      v19 = objc_msgSend(v12, "widgetVisibleSectionsLimit");
    else
      v19 = -1;
    v15->_visibleSectionConfigsLimit = v19;

  }
  return v15;
}

NTSectionConfigSectionDescriptor *__141__NTQueueConfigSectionQueueDescriptor_initWithQueueConfig_appConfiguration_todayData_inFavoritesOnlyMode_respectsWidgetVisibleSectionsLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NTSectionConfigSectionDescriptor *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NTSectionConfigSectionDescriptor *v11;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(v3, "filterNonSubscribedInFavoritesOnlyMode"))
      v5 = 0x20000000;
    else
      v5 = 1;
  }
  else
  {
    v5 = 1;
  }
  v6 = [NTSectionConfigSectionDescriptor alloc];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "topStoriesConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "channelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hiddenFeedIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTSectionConfigSectionDescriptor initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:](v6, "initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:", v4, v7, v9, v10, 1, *(_QWORD *)(a1 + 40), v5);

  return v11;
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (unint64_t)visibleSectionConfigsLimit
{
  return self->_visibleSectionConfigsLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionDescriptors, 0);
}

- (void)initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfiguration", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queueConfig", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
