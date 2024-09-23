@implementation EKSpotlightSearch

+ (id)searchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  EKSpotlightSearch *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[EKSpotlightSearch initWithSearchWithCSQuery:inStore:inCalendars:resultHandler:completionHandler:]([EKSpotlightSearch alloc], "initWithSearchWithCSQuery:inStore:inCalendars:resultHandler:completionHandler:", v15, v14, v13, v12, v11);

  return v16;
}

- (EKSpotlightSearch)initWithSearchWithCSQuery:(id)a3 inStore:(id)a4 inCalendars:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  EKSpotlightSearch *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CSSearchQuery *csQuery;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;
  objc_super v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)EKSpotlightSearch;
  v17 = -[EKSpotlightSearch init](&v34, sel_init);
  if (v17)
  {
    objc_initWeak(&location, v17);
    objc_storeWeak((id *)&v17->_eventStore, v13);
    v18 = (objc_class *)EKWeakLinkClass();
    EKWeakLinkClass();
    v19 = (void *)objc_opt_new();
    v36[0] = *MEMORY[0x1E0CA68C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFetchAttributes:", v20);

    v35 = *MEMORY[0x1E0D0C520];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBundleIDs:", v21);

    v22 = objc_msgSend([v18 alloc], "initWithQueryString:context:", v12, v19);
    csQuery = v17->csQuery;
    v17->csQuery = (CSSearchQuery *)v22;

    v24 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke;
    v29[3] = &unk_1E4787798;
    objc_copyWeak(&v32, &location);
    v30 = v14;
    v31 = v15;
    -[CSSearchQuery setFoundItemsHandler:](v17->csQuery, "setFoundItemsHandler:", v29);
    v26[0] = v24;
    v26[1] = 3221225472;
    v26[2] = __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_2;
    v26[3] = &unk_1E47877C0;
    v27 = v16;
    objc_copyWeak(&v28, &location);
    -[CSSearchQuery setCompletionHandler:](v17->csQuery, "setCompletionHandler:", v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  id *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v8, "attributeSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v8, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v13);

          }
          objc_msgSend(v3, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v10);

        }
        else
        {
          v17 = (void *)EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_cold_1(v33, v17, v8, &v34);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }

  v18 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "eventStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "eventsWithUUIDToOccurrenceDateMap:inCalendars:", v3, *(_QWORD *)(a1 + 32));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
  {
    v22 = objc_loadWeakRetained(v18);
    objc_msgSend(v22, "setCachedNextOccurrenceDateOnRepeatingRemindersInEvents:withDateMap:", v21, v3);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_63);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "count"))
    {
      v25 = *(_QWORD *)(a1 + 40);
      v26 = objc_loadWeakRetained(v18);
      (*(void (**)(uint64_t, id, void *))(v25 + 16))(v25, v26, v24);

    }
  }
  else
  {
    v24 = v21;
  }

}

BOOL __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "isReminderIntegrationEvent"))
    v3 = objc_msgSend(v2, "reminderOccurrenceType") != 1;
  else
    v3 = 1;

  return v3;
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);

}

- (void)setCachedNextOccurrenceDateOnRepeatingRemindersInEvents:(id)a3 withDateMap:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
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
        if (objc_msgSend(v11, "hasRecurrenceRules")
          && objc_msgSend(v11, "isReminderIntegrationEvent"))
        {
          objc_msgSend(v11, "calendarItemIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v12);
            objc_msgSend(v13, "sortUsingSelector:", sel_compare_);
          }
          v14 = objc_msgSend(v13, "count");
          objc_msgSend(v11, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, v14, 0, &__block_literal_global_18_2);

          if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 + 1 < v14)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_setNextCachedReminderOccurrenceDate:", v18);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

uint64_t __89__EKSpotlightSearch_setCachedNextOccurrenceDateOnRepeatingRemindersInEvents_withDateMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)query
{
  return (id)-[CSSearchQuery queryString](self->csQuery, "queryString");
}

+ (id)_queryStringForPeopleMatchingSearchTerm:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("primaryRecipients == \"%@*\"cdwt || authors == \"%@*\"cdwt || recipientNames == \"%@*\"cdwt || recipientEmailAddresses == \"%@*\"cdwt || authorNames == \"%@*\"cdwt || authorEmailAddresses ==  \"%@*\"cdwt || "), a3, a3, a3, a3, a3, a3);
}

+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4
{
  return +[EKSpotlightSearch queryStringForSearchTerm:matchingTypes:fromStartDate:toEndDate:](EKSpotlightSearch, "queryStringForSearchTerm:matchingTypes:fromStartDate:toEndDate:", a3, a4, 0, 0);
}

+ (id)queryStringForSearchTerm:(id)a3 matchingTypes:(unint64_t)a4 fromStartDate:(id)a5 toEndDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend((id)*MEMORY[0x1E0CEC478], "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("contentType == \"%@\" && ("), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    objc_msgSend(v15, "appendFormat:", CFSTR("title == \"%@*\"cdwt || comment == \"%@*\"cdwt || namedLocation == \"%@*\"cdwt || "), v10, v10, v10);
    objc_msgSend(a1, "_queryStringForPeopleMatchingSearchTerm:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v16);

    goto LABEL_12;
  }
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(v15, "appendFormat:", CFSTR("namedLocation == \"%@*\"cdwt || "), v10);
    if ((a4 & 4) == 0)
    {
LABEL_5:
      if ((a4 & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_msgSend(v15, "appendFormat:", CFSTR("title == \"%@*\"cdwt || "), v10);
  if ((a4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a4 & 4) == 0)
    goto LABEL_5;
LABEL_10:
  objc_msgSend(a1, "_queryStringForPeopleMatchingSearchTerm:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:", v17);

  if ((a4 & 8) != 0)
LABEL_11:
    objc_msgSend(v15, "appendFormat:", CFSTR("comment == \"%@*\"cdwt || "), v10);
LABEL_12:
  v18 = objc_msgSend(CFSTR(" || "), "length");
  objc_msgSend(v15, "replaceCharactersInRange:withString:", objc_msgSend(v15, "length") - v18, v18, CFSTR(")"));
  if (v11 && v12)
  {
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v20 = v19;
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "appendFormat:", CFSTR("&& startDate <= $time.absolute(%f) && endDate >= $time.absolute(%f)"), v21, v20);
  }
  else if (v11)
  {
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "appendFormat:", CFSTR("&& endDate > $time.absolute(%f)"), v22, v25);
  }
  else if (v12)
  {
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v15, "appendFormat:", CFSTR("&& startDate < $time.absolute(%f)"), v23, v25);
  }

  return v15;
}

- (void)start
{
  -[CSSearchQuery start](self->csQuery, "start");
}

- (void)cancel
{
  -[CSSearchQuery cancel](self->csQuery, "cancel");
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)setEventStore:(id)a3
{
  objc_storeWeak((id *)&self->_eventStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->csQuery, 0);
}

void __99__EKSpotlightSearch_initWithSearchWithCSQuery_inStore_inCalendars_resultHandler_completionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_1A2318000, v7, OS_LOG_TYPE_ERROR, "Fetched search item had nil start date, skipping showing search result: %@", a1, 0xCu);

}

@end
