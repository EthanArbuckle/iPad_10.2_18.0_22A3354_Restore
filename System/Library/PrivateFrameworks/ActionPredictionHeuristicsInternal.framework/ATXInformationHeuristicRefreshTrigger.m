@implementation ATXInformationHeuristicRefreshTrigger

- (ATXInformationHeuristicRefreshTrigger)init
{
  ATXInformationHeuristicRefreshTrigger *v2;
  uint64_t v3;
  NSMutableSet *registeredHeuristics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  v2 = -[ATXInformationHeuristicRefreshTrigger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registeredHeuristics = v2->_registeredHeuristics;
    v2->_registeredHeuristics = (NSMutableSet *)v3;

  }
  return v2;
}

- (void)dealloc
{
  ATXInformationHeuristicRefreshTrigger *v2;
  objc_super v3;

  v2 = self;
  objc_sync_enter(v2);
  -[ATXInformationHeuristicRefreshTrigger _stop](v2, "_stop");
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  -[ATXInformationHeuristicRefreshTrigger dealloc](&v3, sel_dealloc);
}

- (NSSet)registeredHeuristics
{
  ATXInformationHeuristicRefreshTrigger *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_registeredHeuristics, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)startTriggeringRefreshForHeuristicIfNotAlready:(id)a3
{
  ATXInformationHeuristicRefreshTrigger *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_registeredHeuristics, "addObject:", v5);
  -[ATXInformationHeuristicRefreshTrigger _start](v4, "_start");
  objc_sync_exit(v4);

}

- (void)stopTriggeringRefreshForHeuristicIfAlready:(id)a3
{
  ATXInformationHeuristicRefreshTrigger *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_registeredHeuristics, "removeObject:", v5);
  if (!-[NSMutableSet count](v4->_registeredHeuristics, "count"))
    -[ATXInformationHeuristicRefreshTrigger _stop](v4, "_stop");
  objc_sync_exit(v4);

}

- (void)stopTriggeringRefreshForAllHeuristics
{
  ATXInformationHeuristicRefreshTrigger *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableSet removeAllObjects](obj->_registeredHeuristics, "removeAllObjects");
  -[ATXInformationHeuristicRefreshTrigger _stop](obj, "_stop");
  objc_sync_exit(obj);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_registeredHeuristics, CFSTR("registeredHeuristics"));
}

- (ATXInformationHeuristicRefreshTrigger)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicRefreshTrigger *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableSet *v9;
  void *v10;
  ATXInformationHeuristicRefreshTrigger *v11;
  NSMutableSet *registeredHeuristics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATXInformationHeuristicRefreshTrigger;
  v5 = -[ATXInformationHeuristicRefreshTrigger init](&v14, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClasses:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClasses:forKey:withCoder:nonNull:", v8, CFSTR("registeredHeuristics"), v4, 1);
  v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      registeredHeuristics = v5->_registeredHeuristics;
      v5->_registeredHeuristics = v9;

LABEL_6:
      v11 = v5;
      goto LABEL_7;
    }
  }

  v11 = 0;
LABEL_7:

  return v11;
}

- (id)_safeDecodeObjectOfClass:(Class)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void **v22;
  uint64_t *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v6 = a6;
  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "decodeObjectOfClass:forKey:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      __atxlog_handle_gi();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
    }
    else
    {
      if (!v6)
        goto LABEL_3;
      if (objc_msgSend(v10, "containsValueForKey:", v9))
      {
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("archive contains illegal nil value for key \"%@\"), v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v20;
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = (void **)v31;
        v23 = &v30;
      }
      else
      {
        v28 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" not present"), v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v20;
        v21 = (void *)MEMORY[0x1E0C99D80];
        v22 = &v29;
        v23 = &v28;
      }
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicRefreshTrigger"), -1, v24);
      objc_msgSend(v10, "failWithError:", v14);
      __atxlog_handle_gi();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();

    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" maps to unexpected class"), v9, *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicRefreshTrigger"), -1, v17);
    objc_msgSend(v10, "failWithError:", v18);

    __atxlog_handle_gi();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
    goto LABEL_9;
  }
LABEL_3:
  v12 = v11;
LABEL_10:

  return v12;
}

- (id)_safeDecodeObjectOfClasses:(id)a3 forKey:(id)a4 withCoder:(id)a5 nonNull:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t *v27;
  void *v28;
  NSObject *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v6 = a6;
  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v9;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v12;
            goto LABEL_25;
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v15)
          continue;
        break;
      }
    }

    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" maps to unexpected class"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicRefreshTrigger"), -1, v20);
    objc_msgSend(v11, "failWithError:", v21);

    __atxlog_handle_gi();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
  }
  else
  {
    objc_msgSend(v11, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      __atxlog_handle_gi();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
    }
    else
    {
      if (!v6)
      {
        v22 = 0;
        goto LABEL_26;
      }
      if (objc_msgSend(v11, "containsValueForKey:", v10))
      {
        v40 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("archive contains illegal nil value for key \"%@\"), v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = (void **)v41;
        v27 = &v40;
      }
      else
      {
        v38 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key \"%@\" not present"), v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v39;
        v27 = &v38;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicRefreshTrigger"), -1, v28);
      objc_msgSend(v11, "failWithError:", v13);
      __atxlog_handle_gi();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicRefreshTrigger _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();

    }
  }
  v22 = 0;
LABEL_25:

LABEL_26:
  return v22;
}

- (ATXInformationHeuristicRefreshTriggerDelegate)delegate
{
  return (ATXInformationHeuristicRefreshTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registeredHeuristics, 0);
}

- (void)_safeDecodeObjectOfClass:forKey:withCoder:nonNull:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(v0, v1), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1C99DF000, v3, v4, "ATXInformationHeuristicRefreshTrigger: error decoding %@ - %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

@end
