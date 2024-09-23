@implementation DKEvent

void __54___DKEvent_CSSearchableItem__allowedWebpageURLSchemes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("http"), CFSTR("https"), 0);
  v1 = (void *)allowedWebpageURLSchemes_result;
  allowedWebpageURLSchemes_result = v0;

}

void __95___DKEvent_CSSearchableItem__eventRepresentingUserActivityWithSearchableItem_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __63___DKEvent_INInteraction__relatedContactIdentifiersFromIntent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "contactIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v6, "addObject:", v5);

  }
}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  if (objc_msgSend(a2, "isEqual:", v5))
    v6 = *(_QWORD *)(a1 + 40);
  else
    v6 = 0;
  v7[2](v7, v6);

}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(v3, "_keyImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

uint64_t __84___DKEvent_MOConversion__metadataFromStructuredMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metadataFromStructuredMetadata:excludedMetadataKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59___DKEvent_MOConversion__metadataFromCustomMetadata_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "metadataFromCustomMetadata:", *(_QWORD *)(a1 + 40));
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

uint64_t __90___DKEvent_MOConversion__objectFromManagedObject_readMetadata_excludedMetadataKeys_cache___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(*(id *)(a1 + 32), "secondsFromGMT"));
}

uint64_t __105___DKEvent_MOConversion__eventValueFromManagedObject_streamName_readMetadata_excludedMetadataKeys_cache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 56), "uncachedEventValueFromManagedObject:readMetadata:excludedMetadataKeys:cache:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("CustomMetadata"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("name == %@ AND valueHash == %@"), a1[5], a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  v5 = (void *)a1[4];
  v12 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v2, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_msgSend(v6, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v7)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke_cold_1();

  }
}

uint64_t __23___DKEvent_description__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = _DKStringContainsPrivacySensitiveMetadataKey(v2) ^ 1;
  else
    v3 = 1;

  return v3;
}

void __65___DKEvent_INInteraction__fetchInteractionWithPopulatedKeyImage___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "Failed to inject serialized key image into interaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __72___DKEvent_MOConversion__fetchCustomMetadataWithName_valueHash_context___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Error during fetch request: %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
