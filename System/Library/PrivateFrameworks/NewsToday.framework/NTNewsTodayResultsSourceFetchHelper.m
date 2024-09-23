@implementation NTNewsTodayResultsSourceFetchHelper

- (NTNewsTodayResultsSourceFetchHelper)init
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
    v8 = "-[NTNewsTodayResultsSourceFetchHelper init]";
    v9 = 2080;
    v10 = "NTNewsTodayResultsSourceFetchHelper.m";
    v11 = 1024;
    v12 = 33;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NTNewsTodayResultsSourceFetchHelper init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsSourceFetchHelper)initWithSectionQueueDescriptors:(id)a3
{
  id v4;
  NTNewsTodayResultsSourceFetchHelper *v5;
  NSMutableArray *v6;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *sectionQueueDescriptors;
  NSMutableArray *v17;
  NSMutableDictionary *remainingSectionsBySectionQueueDescriptors;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsSourceFetchHelper initWithSectionQueueDescriptors:].cold.1();
  v25.receiver = self;
  v25.super_class = (Class)NTNewsTodayResultsSourceFetchHelper;
  v5 = -[NTNewsTodayResultsSourceFetchHelper init](&v25, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = (NSMutableDictionary *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "sectionDescriptors");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            -[NSMutableArray addObject:](v6, "addObject:", v13);
            v15 = (void *)objc_msgSend(v14, "mutableCopy");
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v13);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v10);
    }

    sectionQueueDescriptors = v5->_sectionQueueDescriptors;
    v5->_sectionQueueDescriptors = v6;
    v17 = v6;

    remainingSectionsBySectionQueueDescriptors = v5->_remainingSectionsBySectionQueueDescriptors;
    v5->_remainingSectionsBySectionQueueDescriptors = v7;

    v4 = v20;
  }

  return v5;
}

- (id)sectionDescriptorsAtHeadsOfQueues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[NTNewsTodayResultsSourceFetchHelper sectionQueueDescriptors](self, "sectionQueueDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__NTNewsTodayResultsSourceFetchHelper_sectionDescriptorsAtHeadsOfQueues__block_invoke;
  v11[3] = &unk_24DB5EF00;
  v11[4] = self;
  v12 = v4;
  v6 = v3;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

void __72__NTNewsTodayResultsSourceFetchHelper_sectionDescriptorsAtHeadsOfQueues__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NTNewsTodayResultsSourceFetchHelperSectionDescriptor *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "remainingSectionsBySectionQueueDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_subarrayWithMaxCount:", objc_msgSend(v3, "visibleSectionConfigsLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "identifier", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(a1[5], "containsObject:", v13) & 1) == 0)
        {
          v14 = -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor initWithSectionDescriptor:parentSectionQueueDescriptor:]([NTNewsTodayResultsSourceFetchHelperSectionDescriptor alloc], "initWithSectionDescriptor:parentSectionQueueDescriptor:", v12, v3);
          objc_msgSend(a1[6], "addObject:", v14);
          objc_msgSend(a1[5], "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)removeSectionDescriptors:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsTodayResultsSourceFetchHelper removeSectionDescriptors:].cold.1();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        FCCheckedDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentSectionQueueDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTNewsTodayResultsSourceFetchHelper remainingSectionsBySectionQueueDescriptors](self, "remainingSectionsBySectionQueueDescriptors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v13, "count") && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("expected inequality between %s and %s"), "remainingSectionsForParent.count", "0");
          *(_DWORD *)buf = 136315906;
          v22 = "-[NTNewsTodayResultsSourceFetchHelper removeSectionDescriptors:]";
          v23 = 2080;
          v24 = "NTNewsTodayResultsSourceFetchHelper.m";
          v25 = 1024;
          v26 = 104;
          v27 = 2114;
          v28 = v16;
          _os_log_error_impl(&dword_2197E6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        if (objc_msgSend(v13, "count") == 1)
        {
          -[NTNewsTodayResultsSourceFetchHelper sectionQueueDescriptors](self, "sectionQueueDescriptors");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v11);

          -[NTNewsTodayResultsSourceFetchHelper remainingSectionsBySectionQueueDescriptors](self, "remainingSectionsBySectionQueueDescriptors");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeObjectForKey:", v11);

        }
        else
        {
          objc_msgSend(v13, "removeObjectAtIndex:", 0);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v7);
  }

}

- (NSMutableArray)sectionQueueDescriptors
{
  return self->_sectionQueueDescriptors;
}

- (void)setSectionQueueDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sectionQueueDescriptors, a3);
}

- (NSMutableDictionary)remainingSectionsBySectionQueueDescriptors
{
  return self->_remainingSectionsBySectionQueueDescriptors;
}

- (void)setRemainingSectionsBySectionQueueDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_remainingSectionsBySectionQueueDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingSectionsBySectionQueueDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionQueueDescriptors, 0);
}

- (void)initWithSectionQueueDescriptors:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionQueueDescriptors", v6, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)removeSectionDescriptors:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
