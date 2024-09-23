@implementation EKAutocompletePendingSearch

- (EKAutocompletePendingSearch)initWithEventStore:(id)a3 searchString:(id)a4 maximumResultCount:(unint64_t)a5 ignoreScheduledEvents:(BOOL)a6 initialEvent:(id)a7 pasteboardItemProvider:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  EKAutocompletePendingSearch *v19;
  EKAutocompletePendingSearch *v20;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v24.receiver = self;
  v24.super_class = (Class)EKAutocompletePendingSearch;
  v19 = -[EKAutocompletePendingSearch init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_eventStore, a3);
    v20->_maximumResultCount = a5;
    v20->_ignoreScheduledEvents = a6;
    objc_storeStrong((id *)&v20->_initialEvent, a7);
    objc_storeStrong((id *)&v20->_pasteboardItemProvider, a8);
    -[EKAutocompletePendingSearch searchWithString:completionHandler:](v20, "searchWithString:completionHandler:", v15, v18);
  }

  return v20;
}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_20);
  return (id)_queue_queue;
}

void __37__EKAutocompletePendingSearch__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mobilecal.autocompletesearchcontroller.internalqueue", 0);
  v1 = (void *)_queue_queue;
  _queue_queue = (uint64_t)v0;

}

+ (id)_eventKitQueue
{
  if (_eventKitQueue_onceToken != -1)
    dispatch_once(&_eventKitQueue_onceToken, &__block_literal_global_7);
  return (id)_eventKitQueue_queue;
}

void __45__EKAutocompletePendingSearch__eventKitQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.mobilecal.autocompletesearchcontroller.eventkitqueue", 0);
  v1 = (void *)_eventKitQueue_queue;
  _eventKitQueue_queue = (uint64_t)v0;

}

- (id)firstNaturalLanguageResultWithSearchString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKEventStore predicateForNaturalLanguageSuggestedEventsWithSearchString:](self->_eventStore, "predicateForNaturalLanguageSuggestedEventsWithSearchString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "uniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", v8);

    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    objc_msgSend(v7, "setNaturalLanguageSuggestedEvent:", 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldReturnResultForEvent:(id)a3 considerReadonlyEvents:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  EKEvent *initialEvent;
  void *v13;
  void *v14;
  char v15;

  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  if (!a4)
  {
    objc_msgSend(v6, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "allowsContentModifications"))
    {

    }
    else
    {
      objc_msgSend(v7, "calendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isNaturalLanguageSuggestedEventCalendar");

      if (!v10)
      {
LABEL_8:
        v11 = 0;
        goto LABEL_12;
      }
    }
  }
  if (objc_msgSend(v7, "hasAttendees") && self->_ignoreScheduledEvents)
    goto LABEL_8;
  initialEvent = self->_initialEvent;
  if (initialEvent)
  {
    -[EKObject uniqueIdentifier](initialEvent, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    v11 = v15 ^ 1;
  }
  else
  {
    v11 = 1;
  }
LABEL_12:

  return v11;
}

- (EKAutocompletePendingSearch)searchWithString:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  CalSpotlightQueryPendingSearchProtocol *v16;
  CalSpotlightQueryPendingSearchProtocol *pendingSearch;
  EKAutocompletePendingSearch *result;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD block[5];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v7 = a3;
  v8 = a4;
  if (self->_pendingSearch)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKAutocompleteSearch.m"), 129, CFSTR("searchWithString:completionHandler: called multiple times"));

  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__3;
  v27[4] = __Block_byref_object_dispose__3;
  v28 = 0;
  objc_msgSend((id)objc_opt_class(), "_eventKitQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke;
  block[3] = &unk_1E4785298;
  v26 = v27;
  block[4] = self;
  v11 = v7;
  v25 = v11;
  dispatch_async(v9, block);

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    -[EKAutocompletePendingSearch searchWithString:completionHandler:].cold.1();
  v12 = (id)*MEMORY[0x1E0D0C520];
  v13 = (void *)MEMORY[0x1E0D0C3A0];
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_15;
  v20[3] = &unk_1E47857D0;
  v20[4] = self;
  v14 = v11;
  v21 = v14;
  v15 = v8;
  v22 = v15;
  v23 = v27;
  objc_msgSend(v13, "searchWithString:clientBundleID:completionHandler:", v14, v12, v20);
  v16 = (CalSpotlightQueryPendingSearchProtocol *)objc_claimAutoreleasedReturnValue();
  pendingSearch = self->_pendingSearch;
  self->_pendingSearch = v16;

  _Block_object_dispose(v27, 8);
  return result;
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "firstNaturalLanguageResultWithSearchString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend((id)objc_opt_class(), "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2;
  v13[3] = &unk_1E47857A8;
  v8 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v17 = v9;
  v18 = v10;
  v16 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, v13);

}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_3();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_2(a1, (uint64_t *)(a1 + 40), v2);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 48);
      *(_QWORD *)(v3 + 48) = 0;

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_eventKitQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16;
      v8[3] = &unk_1E4785780;
      v14 = *(_QWORD *)(a1 + 72);
      v6 = *(id *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 32);
      v9 = v6;
      v10 = v7;
      v11 = *(id *)(a1 + 48);
      v13 = *(id *)(a1 + 64);
      v12 = *(id *)(a1 + 40);
      dispatch_async(v5, v8);

    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
  {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_1();
  }
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EKAutocompleteSearchResult *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  EKAutocompleteSearchResult *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  EKAutocompleteSearchResult *v31;
  void *v32;
  EKAutocompleteSearchResult *v33;
  void *v34;
  _BOOL8 v35;
  NSObject *v36;
  void *v37;
  id obj;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD block[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_4();
  v37 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v2, 0);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v3)
  {
    v4 = 0;
    v41 = *(_QWORD *)v57;
LABEL_7:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v41)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v5);
      v52 = 0;
      v53 = &v52;
      v54 = 0x2020000000;
      v55 = 0;
      objc_msgSend((id)objc_opt_class(), "_queue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_20;
      block[3] = &unk_1E4785190;
      block[4] = *(_QWORD *)(a1 + 40);
      block[5] = &v52;
      dispatch_sync(v7, block);

      if (*((_BYTE *)v53 + 24))
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_3();
        _Block_object_dispose(&v52, 8);

        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v39);
      if (v9 >= 0.5)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
          __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_2();

        _Block_object_dispose(&v52, 8);
        goto LABEL_37;
      }
      objc_msgSend(v6, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "objectForKey:", v13);
      v14 = (EKAutocompleteSearchResult *)objc_claimAutoreleasedReturnValue();
      if (!v4 || v14 != 0)
        break;
      v4 = 1;
LABEL_28:

      _Block_object_dispose(&v52, 8);
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v3)
          goto LABEL_7;
        goto LABEL_37;
      }
    }
    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "eventWithUniqueId:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(*(id *)(a1 + 40), "_shouldReturnResultForEvent:considerReadonlyEvents:", v17, 0) & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    if (v14)
    {
      if (-[EKAutocompleteSearchResult source](v14, "source") == 2)
      {
LABEL_24:
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
          v4 = (unint64_t)objc_msgSend(v37, "count") >= *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
        else
          v4 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      v18 = objc_msgSend(v6, "isNaturalLanguageSuggestedEvent");
      v19 = [EKAutocompleteSearchResult alloc];
      if (v18)
        v20 = 2;
      else
        v20 = 0;
      v14 = -[EKAutocompleteSearchResult initWithSource:](v19, "initWithSource:", v20);
      objc_msgSend(v40, "setObject:forKey:", v14, v13);
      objc_msgSend(v37, "addObject:", v14);
      -[EKAutocompleteSearchResult setAllDay:](v14, "setAllDay:", objc_msgSend(v17, "isAllDay"));
    }
    -[EKAutocompleteSearchResult updateSelfFromEvent:](v14, "updateSelfFromEvent:", v17);
    goto LABEL_24;
  }
LABEL_37:

  v21 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  if (v21)
  {
    objc_msgSend(v21, "eventsFromPasteboard");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = v22;
    v24 = 0;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v48 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 40), "_shouldReturnResultForEvent:considerReadonlyEvents:", v28, 1) & 1) != 0)
          {
            if (objc_msgSend(*(id *)(a1 + 48), "length"))
            {
              objc_msgSend(v28, "title");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "containsCaseAndDiacriticInsensitive:", *(_QWORD *)(a1 + 48));

            }
            else
            {
              v30 = 1;
            }
            v31 = -[EKAutocompleteSearchResult initWithSource:]([EKAutocompleteSearchResult alloc], "initWithSource:", 3);
            -[EKAutocompleteSearchResult setAllDay:](v31, "setAllDay:", objc_msgSend(v28, "isAllDay"));
            objc_msgSend(v28, "travelTime");
            -[EKAutocompleteSearchResult setTravelTime:](v31, "setTravelTime:");
            objc_msgSend(v28, "travelStartLocation");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKAutocompleteSearchResult setTravelStartLocation:](v31, "setTravelStartLocation:", v32);

            -[EKAutocompleteSearchResult updateSelfFromEvent:](v31, "updateSelfFromEvent:", v28);
            -[EKAutocompleteSearchResult setCalendarColor:](v31, "setCalendarColor:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "colorOfCalendarToPasteTo"));
            objc_msgSend(v42, "addObject:", v31);

            v24 |= v30;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      }
      while (v25);
    }

    if (((objc_msgSend(v42, "count") != 0) & v24) == 1)
    {
      v33 = -[EKAutocompleteSearchResult initWithSource:]([EKAutocompleteSearchResult alloc], "initWithSource:", 4);
      -[EKAutocompleteSearchResult setPasteboardResults:](v33, "setPasteboardResults:", v42);
      objc_msgSend(v37, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "source") == 2;

      objc_msgSend(v37, "insertObject:atIndex:", v33, v35);
    }

  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_1();
  objc_msgSend((id)objc_opt_class(), "_queue");
  v36 = objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23;
  v43[3] = &unk_1E4785758;
  v43[4] = *(_QWORD *)(a1 + 40);
  v46 = *(id *)(a1 + 64);
  v44 = v37;
  v45 = *(id *)(a1 + 56);
  dispatch_async(v36, v43);

LABEL_56:
}

uint64_t __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_20(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) == 0;
  return result;
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3)
      __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23_cold_2();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (v3)
  {
    __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23_cold_1();
  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EKAutocompletePendingSearch_cancel__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __37__EKAutocompletePendingSearch_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "cancel");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSearch, 0);
  objc_storeStrong((id *)&self->_pasteboardItemProvider, 0);
  objc_storeStrong((id *)&self->_initialEvent, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)searchWithString:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Beginning spotlight search.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Search was cancelled before we processed results. Abandoning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Spotlight query controller returned an error when searching for string (%@), error: %@", (uint8_t *)&v5, 0x16u);
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Got spotlight search results.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Finished processing results.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Search took longer than allowed time. Stopping earlier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Search was cancelled while processing results. Abandoning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_16_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Processing results.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Search was cancelled while we processed results. Abandoning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EKAutocompletePendingSearch_searchWithString_completionHandler___block_invoke_23_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "EKAutocompleteSearch: Returning results via callback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
