@implementation HUFaceRecognitionRecentEventsItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HUFaceRecognitionRecentEventsItemProvider)initWithHome:(id)a3
{
  id v5;
  HUFaceRecognitionRecentEventsItemProvider *v6;
  HUFaceRecognitionRecentEventsItemProvider *v7;
  uint64_t v8;
  NSMutableSet *personItems;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSDateInterval *dateRange;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUFaceRecognitionRecentEventsItemProvider;
  v6 = -[HFItemProvider init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    personItems = v7->_personItems;
    v7->_personItems = (NSMutableSet *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -604800.0);
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithStartDate:endDate:", v10, v12);
    dateRange = v7->_dateRange;
    v7->_dateRange = (NSDateInterval *)v13;

    v7->_fetchLimit = 1000;
  }

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;

  -[HUFaceRecognitionRecentEventsItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allCameraProfilesSupportingRecording");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_map:", &__block_literal_global_206);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__25;
  v15[4] = __Block_byref_object_dispose__25;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D519C0];
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4;
  v14[3] = &unk_1E6F5AE60;
  v14[4] = self;
  v14[5] = v15;
  objc_msgSend(v5, "na_map:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combineAllFutures:ignoringErrors:scheduler:", v8, 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_12;
  v13[3] = &unk_1E6F5AEE8;
  v13[4] = self;
  v13[5] = v15;
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v15, 8);
  return v11;
}

uint64_t __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clipManager");
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2;
  v15[3] = &unk_1E6F4D600;
  v15[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "futureWithBlock:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_5;
  v12[3] = &unk_1E6F5AE38;
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = (id)objc_msgSend(v7, "addCompletionBlock:", v12);

  return v7;
}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dateRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dateRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "fetchLimit");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4;
    v11[3] = &unk_1E6F4C708;
    v8 = &v12;
    v12 = v3;
    v9 = v3;
    objc_msgSend(v5, "fetchSignificantEventsWithDateInterval:limit:shouldOrderAscending:completion:", v6, v7, 0, v11);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3;
    v13[3] = &unk_1E6F52828;
    v8 = &v14;
    v14 = v3;
    v10 = v3;
    objc_msgSend(v5, "fetchAllSignificantEventsWithCompletion:", v13);
  }

}

uint64_t __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:error:", v7, v6);

}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Error on clip manager %@ fetching significant events %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    objc_opt_class();
    v9 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v7 = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "unionSet:", v7);
  }

}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_12(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "na_filter:", &__block_literal_global_15_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
    *(_DWORD *)buf = 134218240;
    v15 = v11;
    v16 = 2048;
    v17 = objc_msgSend(v2, "count");
    _os_log_debug_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEBUG, "Recent Events reload: %lu significant events %lu have face classifications", buf, 0x16u);
  }

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v2, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_16;
  v13[3] = &unk_1E6F53E48;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "reloadItemsWithHomeKitObjects:filter:itemMap:", v5, 0, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_20;
  v12[3] = &unk_1E6F514A0;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "flatMap:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recover:", &__block_literal_global_26_2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "faceClassification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_debug_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEBUG, "No face classification, skipping event %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3 != 0;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "faceClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D313D0]);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithSignificantEvent:home:", v6, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_20(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUFaceRecognitionRecentEventsItemProvider _coalescedItems:](HUFaceRecognitionRecentEventsItemProvider, "_coalescedItems:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addedItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_setByIntersectingWithSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "existingItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "existingItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "minusSet:", v14);
  objc_msgSend(v5, "removedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "unionSet:", v14);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D314A0]), "initWithAddedItems:removedItems:existingItems:", v12, v18, v16);
  v20 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setPersonItems:", v20);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3_24(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Recent Events person fetch failed with error %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_coalescedItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HUFaceRecognitionRecentEventsItemProvider cameraSignificantEventDateComparator](HUFaceRecognitionRecentEventsItemProvider, "cameraSignificantEventDateComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke;
  v18 = &unk_1E6F5AF50;
  v19 = v6;
  v8 = v7;
  v20 = v8;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v15);
  objc_msgSend(v5, "objectsAtIndexes:", v8, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_msgSend(v5, "count");
    v14 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134218240;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    _os_log_debug_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEBUG, "Reduced events from %lu to %lu", buf, 0x16u);
  }

  return v10;
}

void __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "person");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "person");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personLinks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "na_map:", &__block_literal_global_29_2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_11;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v13))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
    objc_msgSend(*(id *)(a1 + 32), "unionSet:", v13);
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    goto LABEL_12;
  }
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B38]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v16;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEBUG, "Ignoring later event %@ %@", (uint8_t *)&v17, 0x16u);

  }
LABEL_12:

}

uint64_t __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personUUID");
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUFaceRecognitionRecentEventsItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cameraSignificantEventDateComparator
{
  return &__block_literal_global_34_2;
}

uint64_t __81__HUFaceRecognitionRecentEventsItemProvider_cameraSignificantEventDateComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v30;
  void *v31;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v30 = v10;

  objc_opt_class();
  v11 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_opt_class();
  v14 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v8, "latestResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D30B38];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B38]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v31 = v8;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(v13, "event");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dateOfOccurrence");
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v30, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(v16, "event");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateOfOccurrence");
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v21)
    v28 = -1;
  else
    v28 = v26 != 0;
  if (v21 && v26)
    v28 = objc_msgSend(v26, "compare:", v21);

  return v28;
}

- (NSDateInterval)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
  objc_storeStrong((id *)&self->_dateRange, a3);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
  objc_storeStrong((id *)&self->_personItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_dateRange, 0);
}

@end
