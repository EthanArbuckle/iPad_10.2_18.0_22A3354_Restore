@implementation ATXInformationHeuristicResult

- (ATXInformationHeuristicResult)initWithHeuristicName:(id)a3 suggestions:(id)a4 refreshTriggers:(id)a5 hasFailed:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  ATXInformationHeuristicResult *v14;
  ATXInformationHeuristicResult *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXInformationHeuristicResult;
  v14 = -[ATXInformationHeuristicResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_heuristicName, a3);
    objc_storeStrong((id *)&v15->_suggestions, a4);
    objc_storeStrong((id *)&v15->_refreshTriggers, a5);
    v15->_hasFailed = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *heuristicName;
  id v5;

  heuristicName = self->_heuristicName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", heuristicName, CFSTR("heuristicName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestions, CFSTR("suggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshTriggers, CFSTR("refreshTriggers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasFailed, CFSTR("hasFailed"));

}

- (ATXInformationHeuristicResult)initWithCoder:(id)a3
{
  id v4;
  ATXInformationHeuristicResult *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSArray *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSSet *v14;
  void *v15;
  ATXInformationHeuristicResult *v16;
  NSString *heuristicName;
  NSString *v18;
  NSArray *suggestions;
  NSArray *v20;
  NSSet *refreshTriggers;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXInformationHeuristicResult;
  v5 = -[ATXInformationHeuristicResult init](&v23, sel_init);
  if (!v5)
    goto LABEL_8;
  -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClass:forKey:withCoder:nonNull:", objc_opt_class(), CFSTR("heuristicName"), v4, 1);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationHeuristicResult _safeDecodeObjectOfClasses:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClasses:forKey:withCoder:nonNull:", v9, CFSTR("suggestions"), v4, 1);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXInformationHeuristicResult _safeDecodeObjectOfClasses:forKey:withCoder:nonNull:](v5, "_safeDecodeObjectOfClasses:forKey:withCoder:nonNull:", v13, CFSTR("refreshTriggers"), v4, 1);
  v14 = (NSSet *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v10)
    {
      if (v14)
      {
        objc_msgSend(v4, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          heuristicName = v5->_heuristicName;
          v5->_heuristicName = v6;
          v18 = v6;

          suggestions = v5->_suggestions;
          v5->_suggestions = v10;
          v20 = v10;

          refreshTriggers = v5->_refreshTriggers;
          v5->_refreshTriggers = v14;

          v5->_hasFailed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasFailed"));
LABEL_8:
          v16 = v5;
          goto LABEL_9;
        }
      }
    }
  }

  v16 = 0;
LABEL_9:

  return v16;
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
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
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

      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicResult"), -1, v24);
      objc_msgSend(v10, "failWithError:", v14);
      __atxlog_handle_gi();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();

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
    v18 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicResult"), -1, v17);
    objc_msgSend(v10, "failWithError:", v18);

    __atxlog_handle_gi();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
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
    v21 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicResult"), -1, v20);
    objc_msgSend(v11, "failWithError:", v21);

    __atxlog_handle_gi();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
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
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();
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

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ATXInformationHeuristicResult"), -1, v28);
      objc_msgSend(v11, "failWithError:", v13);
      __atxlog_handle_gi();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ATXInformationHeuristicResult _safeDecodeObjectOfClass:forKey:withCoder:nonNull:].cold.1();

    }
  }
  v22 = 0;
LABEL_25:

LABEL_26:
  return v22;
}

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSSet)refreshTriggers
{
  return self->_refreshTriggers;
}

- (BOOL)hasFailed
{
  return self->_hasFailed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTriggers, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_heuristicName, 0);
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
  OUTLINED_FUNCTION_0_4(&dword_1C99DF000, v3, v4, "ATXInformationHeuristicResult: error decoding %@ - %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

@end
