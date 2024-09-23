@implementation FAMegadomeRecommendationsLoader

+ (id)taggingOptions
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[18];
  _QWORD v16[19];

  v16[18] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 0.7);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 0.82);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getGDPersonTaggingOptionsClass_softClass;
  v14 = getGDPersonTaggingOptionsClass_softClass;
  if (!getGDPersonTaggingOptionsClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getGDPersonTaggingOptionsClass_block_invoke;
    v10[3] = &unk_1E85620F8;
    v10[4] = &v11;
    __getGDPersonTaggingOptionsClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v6 = [v5 alloc];
  v15[0] = CFSTR("family");
  v15[1] = CFSTR("parent");
  v16[0] = v2;
  v16[1] = v2;
  v15[2] = CFSTR("father");
  v15[3] = CFSTR("mother");
  v16[2] = v2;
  v16[3] = v2;
  v15[4] = CFSTR("child");
  v15[5] = CFSTR("daughter");
  v16[4] = v2;
  v16[5] = v2;
  v15[6] = CFSTR("son");
  v15[7] = CFSTR("sibling");
  v16[6] = v2;
  v16[7] = v2;
  v15[8] = CFSTR("brother");
  v15[9] = CFSTR("sister");
  v16[8] = v2;
  v16[9] = v2;
  v15[10] = CFSTR("partner");
  v15[11] = CFSTR("husband");
  v16[10] = v3;
  v16[11] = v2;
  v15[12] = CFSTR("wife");
  v15[13] = CFSTR("friend");
  v16[12] = v2;
  v16[13] = v2;
  v15[14] = CFSTR("coworker");
  v15[15] = CFSTR("alumni");
  v16[14] = v2;
  v16[15] = v2;
  v15[16] = CFSTR("myself");
  v15[17] = CFSTR("familyAndFriends");
  v16[16] = v2;
  v16[17] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTagThresholds:", v7);

  return v8;
}

- (id)peopleViewWithError:(id *)a3
{
  uint64_t v3;
  void (**v4)(void *, id);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  _QWORD aBlock[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__FAMegadomeRecommendationsLoader_peopleViewWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a3;
  v4 = (void (**)(void *, id))_Block_copy(aBlock);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getGDViewServiceClass_softClass;
  v19 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __getGDViewServiceClass_block_invoke;
    v15[3] = &unk_1E85620F8;
    v15[4] = &v16;
    __getGDViewServiceClass_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v6, "clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v7, "visualIdentifierViewWithError:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v8)
  {
    v10 = v8;
  }
  else
  {
    _FALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FAMegadomeRecommendationsLoader peopleViewWithError:].cold.1();

    v4[2](v4, v9);
  }

  return v8;
}

_QWORD **__55__FAMegadomeRecommendationsLoader_peopleViewWithError___block_invoke(_QWORD **result, id a2)
{
  _QWORD **v2;

  if (result[4])
  {
    v2 = result;
    result = (_QWORD **)objc_retainAutorelease(a2);
    *v2[4] = result;
  }
  return result;
}

- (id)megadomeResultsForFamilyTagWithError:(id *)a3
{
  uint64_t v3;
  void (**v4)(void *, _QWORD);
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  _QWORD aBlock[5];
  uint64_t v22;
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__FAMegadomeRecommendationsLoader_megadomeResultsForFamilyTagWithError___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a3;
  v4 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v5 = (void *)getGDConfigurationClass_softClass;
  v30 = getGDConfigurationClass_softClass;
  if (!getGDConfigurationClass_softClass)
  {
    v22 = v3;
    v23 = 3221225472;
    v24 = __getGDConfigurationClass_block_invoke;
    v25 = &unk_1E85620F8;
    v26 = &v27;
    __getGDConfigurationClass_block_invoke((uint64_t)&v22);
    v5 = (void *)v28[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v27, 8);
  v7 = objc_alloc_init(v6);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v8 = (void *)getGDEntityTaggingServiceClass_softClass;
  v30 = getGDEntityTaggingServiceClass_softClass;
  if (!getGDEntityTaggingServiceClass_softClass)
  {
    v22 = v3;
    v23 = 3221225472;
    v24 = __getGDEntityTaggingServiceClass_block_invoke;
    v25 = &unk_1E85620F8;
    v26 = &v27;
    __getGDEntityTaggingServiceClass_block_invoke((uint64_t)&v22);
    v8 = (void *)v28[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v27, 8);
  v20 = 0;
  v10 = (void *)objc_msgSend([v9 alloc], "initWithConfig:error:", v7, &v20);
  v11 = v20;
  if (v10)
  {
    +[FAMegadomeRecommendationsLoader taggingOptions](FAMegadomeRecommendationsLoader, "taggingOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "entitiesForTag:options:error:", 4, v12, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    if (v13)
    {
      v4[2](v4, 0);
      v15 = v13;
    }
    else
    {
      _FALogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FAMegadomeRecommendationsLoader megadomeResultsForFamilyTagWithError:].cold.2();

      ((void (**)(void *, id))v4)[2](v4, v14);
    }

  }
  else
  {
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FAMegadomeRecommendationsLoader megadomeResultsForFamilyTagWithError:].cold.1();

    ((void (**)(void *, id))v4)[2](v4, v11);
    v13 = 0;
  }

  return v13;
}

_QWORD **__72__FAMegadomeRecommendationsLoader_megadomeResultsForFamilyTagWithError___block_invoke(_QWORD **result, id a2)
{
  _QWORD **v2;

  if (result[4])
  {
    v2 = result;
    result = (_QWORD **)objc_retainAutorelease(a2);
    *v2[4] = result;
  }
  return result;
}

- (id)megadomePeopleFromScoredEntities:(id)a3 inVisualIdentifierView:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  FAMegadomePerson *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "idValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "personForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = -[FAMegadomePerson initWithVisualIdentifierViewPerson:]([FAMegadomePerson alloc], "initWithVisualIdentifierViewPerson:", v13);
          objc_msgSend(v7, "addObject:", v14);
        }
        else
        {
          _FALogSystem();
          v14 = (FAMegadomePerson *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_impl(&dword_1CAEBA000, &v14->super, OS_LOG_TYPE_DEFAULT, "Did not find megadome person with identifier %@. Skipping recommendation.", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

- (id)familyHandles
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FAFetchFamilyCircleRequest *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v20 = objc_alloc_init(FAFetchFamilyCircleRequest);
  -[FAFetchFamilyCircleRequest fetchFamilyCircleWithError:](v20, "fetchFamilyCircleWithError:", &v25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v25;
  if (v3)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[FAMegadomeRecommendationsLoader familyHandles].cold.1();

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v2, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "appleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "appleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        objc_msgSend(v11, "memberPhoneNumbers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "memberPhoneNumbers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(","));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          +[FAMegadomeRecommendationsLoader normalizedPhoneNumbersForPhoneNumbers:](FAMegadomeRecommendationsLoader, "normalizedPhoneNumbersForPhoneNumbers:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return v18;
}

+ (id)normalizedPhoneNumbersForPhoneNumbers:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138412290;
    v17 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v11, v17, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "formattedStringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v4, "addObject:", v13);
        }
        else
        {
          _FALogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v11;
            _os_log_error_impl(&dword_1CAEBA000, v14, OS_LOG_TYPE_ERROR, "Could not normalize phone number \"%@\".", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (void)peopleViewWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Error initializing megadome visual identifier view: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)megadomeResultsForFamilyTagWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Error initializing megadome entity tagging service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)megadomeResultsForFamilyTagWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "Error initializing megadome entities for Family tag: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)familyHandles
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1CAEBA000, v0, v1, "FAFetchFamilyCircleRequest failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
