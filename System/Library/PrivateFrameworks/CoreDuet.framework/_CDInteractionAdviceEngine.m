@implementation _CDInteractionAdviceEngine

+ (id)interactionAdviceEngineWithStore:(id)a3
{
  id v3;
  _CDInteractionAdviceEngine *v4;

  v3 = a3;
  v4 = -[_CDInteractionAdviceEngine initWithStore:]([_CDInteractionAdviceEngine alloc], "initWithStore:", v3);

  return v4;
}

- (_CDInteractionAdviceEngine)initWithStore:(id)a3
{
  id v5;
  _CDInteractionAdviceEngine *v6;
  _CDInteractionAdviceEngine *v7;
  _CDTemporalInteractionAdvisor *temporalAdvisor;
  _CDSocialInteractionAdvisor *socialAdvisor;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CDInteractionAdviceEngine;
  v6 = -[_CDInteractionAdviceEngine init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    temporalAdvisor = v7->_temporalAdvisor;
    v7->_temporalAdvisor = 0;

    socialAdvisor = v7->_socialAdvisor;
    v7->_socialAdvisor = 0;

  }
  return v7;
}

- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  id v11;
  _CDContact *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _CDContact *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v31 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!objc_msgSend(v5, "count"))
  {
LABEL_11:
    v13 = v32;
    objc_msgSend(v32, "seedIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v26 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v26, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v26, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = v26;
      v16 = v26;
      v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v21 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), 0, 0, 0, 0, 0, 0);
            objc_msgSend(v15, "addObject:", v21);

          }
          v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v18);
      }

      -[_CDInteractionAdviceEngine socialAdvisor](self, "socialAdvisor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v32;
      objc_msgSend(v22, "rankContacts:withSeedContacts:usingSettings:", v6, v15, v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v29;
      if ((v7 & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      -[_CDInteractionAdviceEngine temporalAdvisor](self, "temporalAdvisor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rankContacts:usingSettings:", v6, v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v7 & 1) != 0)
      {
LABEL_20:
        objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v25 = v23;
        goto LABEL_29;
      }
    }
    v23 = v9;
    v9 = v23;
    goto LABEL_23;
  }
  v8 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v11 = v9;
      v12 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", v11, 0, 0, 0, 0, 0, 0);

      objc_msgSend(v6, "addObject:", v12);
      if (!v8)
        goto LABEL_9;
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v6, "addObject:", v9);
    if (!v8)
    {
LABEL_9:
      v7 = isKindOfClass;
      goto LABEL_10;
    }
LABEL_5:
    if ((v7 & 1) != (isKindOfClass & 1))
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_CDInteractionAdviceEngine rankCandidateContacts:usingSettings:].cold.1();
      goto LABEL_28;
    }
LABEL_10:

    if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
      goto LABEL_11;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[_CDInteractionAdviceEngine rankCandidateContacts:usingSettings:].cold.2();
LABEL_28:
  v25 = 0;
  v13 = v32;
LABEL_29:

  objc_autoreleasePoolPop(v31);
  return v25;
}

- (id)adviseInteractionsUsingSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _CDContact *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v4, "seedIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "interactionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:].cold.3();

  if (objc_msgSend(v7, "count"))
  {
    v25 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 0, 0, 0, 0, 0, 0);
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:].cold.2();

    -[_CDInteractionAdviceEngine socialAdvisor](self, "socialAdvisor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "adviseInteractionsForDate:andSeedContacts:usingSettings:", v11, v13, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v25;
  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:].cold.1();

    -[_CDInteractionAdviceEngine temporalAdvisor](self, "temporalAdvisor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "adviseInteractionsForDate:usingSettings:", v11, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v5);
  return v22;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[_CDInteractionAdviceEngine temporalAdvisor](self, "temporalAdvisor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adviseInteractionsForDate:usingSettings:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  id v6;
  id v7;
  _CDQueryInteractionAdvisor *queryAdvisor;
  _CDQueryInteractionAdvisor *v9;
  _CDQueryInteractionAdvisor *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  queryAdvisor = self->_queryAdvisor;
  if (!queryAdvisor)
  {
    v9 = -[_CDQueryInteractionAdvisor initWithStore:]([_CDQueryInteractionAdvisor alloc], "initWithStore:", self->_store);
    v10 = self->_queryAdvisor;
    self->_queryAdvisor = v9;

    queryAdvisor = self->_queryAdvisor;
  }
  -[_CDQueryInteractionAdvisor adviseInteractionsForKeywordsInString:usingSettings:](queryAdvisor, "adviseInteractionsForKeywordsInString:usingSettings:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_CDInteractionAdviceEngine socialAdvisor](self, "socialAdvisor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "adviseInteractionsForDate:andSeedContacts:usingSettings:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_CDInteractionAdviceEngine socialAdvisor](self, "socialAdvisor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tuneUsingSettings:heartBeatHandler:", v7, v6);

}

- (_CDSocialInteractionAdvisor)socialAdvisor
{
  _CDInteractionAdviceEngine *v2;
  _CDSocialInteractionAdvisor *v3;
  _CDSocialInteractionAdvisor *socialAdvisor;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_socialAdvisor)
  {
    v3 = -[_CDSocialInteractionAdvisor initWithStore:]([_CDSocialInteractionAdvisor alloc], "initWithStore:", v2->_store);
    socialAdvisor = v2->_socialAdvisor;
    v2->_socialAdvisor = v3;

  }
  objc_sync_exit(v2);

  return v2->_socialAdvisor;
}

- (_CDTemporalInteractionAdvisor)temporalAdvisor
{
  _CDInteractionAdviceEngine *v2;
  _CDTemporalInteractionAdvisor *v3;
  _CDTemporalInteractionAdvisor *temporalAdvisor;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_temporalAdvisor)
  {
    v3 = -[_CDTemporalInteractionAdvisor initWithStore:]([_CDTemporalInteractionAdvisor alloc], "initWithStore:", v2->_store);
    temporalAdvisor = v2->_temporalAdvisor;
    v2->_temporalAdvisor = v3;

  }
  objc_sync_exit(v2);

  return v2->_temporalAdvisor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAdvisor, 0);
  objc_storeStrong((id *)&self->_socialAdvisor, 0);
  objc_storeStrong((id *)&self->_temporalAdvisor, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)rankCandidateContacts:usingSettings:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "All candidate contacts must be the same type", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)rankCandidateContacts:usingSettings:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_ERROR, "Cannot rank invalid contact type : %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)adviseInteractionsUsingSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Using temporal advisor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)adviseInteractionsUsingSettings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Using social advisor", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)adviseInteractionsUsingSettings:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Advising interactions using settings : %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
