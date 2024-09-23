@implementation ATXHeuristicReturnCall

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshContextChangeTrigger *v3;
  void *v4;
  ATXInformationHeuristicRefreshContextChangeTrigger *v5;
  void *v6;
  void *v7;

  v2 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("com.apple.CallHistoryPluginHelper.launchnotification"), 1);
  v3 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForActiveCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXInformationHeuristicRefreshContextChangeTrigger initWithCDContextualKeyPath:](v3, "initWithCDContextualKeyPath:", v4);

  v6 = (void *)MEMORY[0x1CAA46CBC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, v5, 0);
  objc_autoreleasePoolPop(v6);

  return v7;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  ATXCallHistoryDataSource *v4;
  void *v5;
  ATXCallHistoryDataSource *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  ATXContextHeuristicResult *v34;
  ATXCallHistoryDataSource *v36;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [ATXCallHistoryDataSource alloc];
  v39 = v3;
  objc_msgSend(v3, "heuristicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXCallHistoryDataSource initWithDevice:](v4, "initWithDevice:", v5);

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__15;
  v53 = __Block_byref_object_dispose__15;
  v54 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke;
  v48[3] = &unk_1E82C5568;
  v48[4] = &v49;
  v36 = v6;
  -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:](v6, "callNewerThan:showIncoming:showOutgoing:missedOnly:callback:", 1, 1, 0, v48, 3600.0);
  __atxlog_handle_context_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend((id)v50[5], "count");
    *(_DWORD *)buf = 134217984;
    v57 = v8;
    _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment %lu calls", buf, 0xCu);
  }

  v9 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)v50[5];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("date"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("date"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18)
              v20 = v17 == 0;
            else
              v20 = 1;
            if (!v20)
            {
              objc_msgSend(v18, "doubleValue");
              v22 = v21;
              objc_msgSend(v17, "doubleValue");
              if (v22 > v23)
                objc_msgSend(v9, "setValue:forKey:", v13, v14);
            }
            __atxlog_handle_context_heuristic();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v57 = (uint64_t)v14;
              v58 = 2112;
              v59 = v19;
              _os_log_impl(&dword_1C99DF000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@, callDate:%@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v9, "setValue:forKey:", v13, v14);
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v10);
  }

  v25 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = v9;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v26);
        -[ATXHeuristicReturnCall _addActionWithContactId:toActions:environment:lastCallDict:](self, "_addActionWithContactId:toActions:environment:lastCallDict:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), v25, v39, v26);
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    }
    while (v27);
  }

  __atxlog_handle_context_heuristic();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 134217984;
    v57 = v31;
    _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment %lu actions", buf, 0xCu);
  }

  objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_opt_new();
  v34 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v32, v33);

  _Block_object_dispose(&v49, 8);
  return v34;
}

void __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __57__ATXHeuristicReturnCall_heuristicResultWithEnvironment___block_invoke_22(uint64_t a1, uint64_t a2)
{
  return +[ATXContextHeuristicSuggestionProducer suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:", a2, 0x40000000, 0, 0, 70.0);
}

- (void)_addActionWithContactId:(id)a3 toActions:(id)a4 environment:(id)a5 lastCallDict:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a6, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("missed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("remoteParticipantHandles"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v15, "count") == 1)
    {
      -[NSObject firstObject](v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
      v17 = objc_claimAutoreleasedReturnValue();

      -[ATXHeuristicReturnCall _serviceWithCall:](self, "_serviceWithCall:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        v24 = v18;
        v25 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeuristicReturnCall _contactsDataSourceWithIdentifiers:environment:](self, "_contactsDataSourceWithIdentifiers:environment:", v19, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "count") == 1)
        {
          objc_msgSend(v20, "firstObject");
          v21 = objc_claimAutoreleasedReturnValue();
          -[ATXHeuristicReturnCall _interactionCountAfterCall:contactDict:environment:](self, "_interactionCountAfterCall:contactDict:environment:", v13, v21, v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "integerValue") < 1)
          {
            -[ATXHeuristicReturnCall _actionWithCall:contactDict:contactId:handle:service:](self, "_actionWithCall:contactDict:contactId:handle:service:", v13, v21, v10, v17, v24);
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v11, "addObject:", v22);
          }
          else
          {
            __atxlog_handle_context_heuristic();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v23;
              _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Skipping contact that has already been interacted with %@ times after the missed call", buf, 0xCu);
            }
          }

        }
        else
        {
          __atxlog_handle_context_heuristic();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v10;
            _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ Could not find exactly 1 CNContact for identifier", buf, 0xCu);
          }
        }

        v18 = v24;
      }

    }
    else
    {
      __atxlog_handle_context_heuristic();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ Cannot find exactly 1 remote participant handle", buf, 0xCu);
      }
    }

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall: heuristicResultWithEnvironment contactId %@ last call was not missed. Skipping", buf, 0xCu);
    }
  }

}

- (id)_serviceWithCall:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("serviceProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Telephony")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.FaceTime")) & 1) != 0)
    {
      v5 = CFSTR("facetime");
      goto LABEL_10;
    }
    __atxlog_handle_context_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_DEFAULT, "Suppressing action since third party calls are not supported", v8, 2u);
    }

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = CFSTR("phone");
LABEL_10:

  return (id)v5;
}

- (id)_duetInteractionCountFromDataSourceWithHandles:(id)a3 date:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATXDuetInteractionDataSource *v10;
  void *v11;
  ATXDuetInteractionDataSource *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v10 = [ATXDuetInteractionDataSource alloc];
    objc_msgSend(v9, "heuristicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ATXDuetInteractionDataSource initWithDevice:](v10, "initWithDevice:", v11);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__15;
    v28 = __Block_byref_object_dispose__15;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__15;
    v22 = __Block_byref_object_dispose__15;
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__ATXHeuristicReturnCall__duetInteractionCountFromDataSourceWithHandles_date_environment___block_invoke;
    v17[3] = &unk_1E82C47E0;
    v17[4] = &v24;
    v17[5] = &v18;
    -[ATXDuetInteractionDataSource duetInteractionCountForHandles:sinceDate:callback:](v12, "duetInteractionCountForHandles:sinceDate:callback:", v13, v8, v17);

    if (v19[5])
    {
      __atxlog_handle_context_heuristic();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicReturnCall _duetInteractionCountFromDataSourceWithHandles:date:environment:].cold.1();

      v15 = 0;
    }
    else
    {
      v15 = (id)v25[5];
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __90__ATXHeuristicReturnCall__duetInteractionCountFromDataSourceWithHandles_date_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_contactsDataSourceWithIdentifiers:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  ATXContactsDataSource *v7;
  void *v8;
  ATXContactsDataSource *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = [ATXContactsDataSource alloc];
  objc_msgSend(v6, "heuristicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXContactsDataSource initWithDevice:](v7, "initWithDevice:", v8);

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__15;
  v24 = __Block_byref_object_dispose__15;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__ATXHeuristicReturnCall__contactsDataSourceWithIdentifiers_environment___block_invoke;
  v13[3] = &unk_1E82C47B8;
  v13[4] = &v20;
  v13[5] = &v14;
  -[ATXContactsDataSource contactsWithIdentifiers:callback:](v9, "contactsWithIdentifiers:callback:", v5, v13);
  if (v15[5])
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicReturnCall _contactsDataSourceWithIdentifiers:environment:].cold.1();

    v11 = 0;
  }
  else
  {
    v11 = (id)v21[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __73__ATXHeuristicReturnCall__contactsDataSourceWithIdentifiers_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_interactionCountAfterCall:(id)a3 contactDict:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("CNContact"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:](self, "_bestContactHandleFromDataSourceWithContact:service:environment:", v10, *MEMORY[0x1E0D34210], v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:](self, "_bestContactHandleFromDataSourceWithContact:service:environment:", v10, *MEMORY[0x1E0D34208], v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:](self, "_bestContactHandleFromDataSourceWithContact:service:environment:", v10, *MEMORY[0x1E0D34240], v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  v15 = v14;
  if (v11)
    objc_msgSend(v14, "addObject:", v11);
  if (v12)
    objc_msgSend(v15, "addObject:", v12);
  if (v13)
    objc_msgSend(v15, "addObject:", v13);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v16, "doubleValue");
  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:", v18 + 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicReturnCall _duetInteractionCountFromDataSourceWithHandles:date:environment:](self, "_duetInteractionCountFromDataSourceWithHandles:date:environment:", v15, v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_bestContactHandleFromDataSourceWithContact:(id)a3 service:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  ATXBestContactHandleForServiceDataSource *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && v8)
  {
    v10 = [ATXBestContactHandleForServiceDataSource alloc];
    objc_msgSend(v9, "heuristicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ATXBestContactHandleForServiceDataSource initWithDevice:](v10, "initWithDevice:", v11);

    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__15;
    v27 = __Block_byref_object_dispose__15;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__15;
    v21 = __Block_byref_object_dispose__15;
    v22 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__ATXHeuristicReturnCall__bestContactHandleFromDataSourceWithContact_service_environment___block_invoke;
    v16[3] = &unk_1E82C4DC0;
    v16[4] = &v23;
    v16[5] = &v17;
    -[NSObject bestHandleForContact:service:callback:](v12, "bestHandleForContact:service:callback:", v7, v8, v16);
    if (v18[5])
    {
      __atxlog_handle_context_heuristic();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:].cold.1();

      v14 = 0;
    }
    else
    {
      v14 = (id)v24[5];
    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicReturnCall _bestContactHandleFromDataSourceWithContact:service:environment:].cold.2((uint64_t)v7, (uint64_t)v8, v12);
    v14 = 0;
  }

  return v14;
}

void __90__ATXHeuristicReturnCall__bestContactHandleFromDataSourceWithContact_service_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_actionWithCall:(id)a3 contactDict:(id)a4 contactId:(id)a5 handle:(id)a6 service:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  NSObject *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0CB34D0];
  v16 = a4;
  objc_msgSend(v15, "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("displayName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
  {
    v44 = v12;
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RETURN_CALL_TITLE"), &stru_1E82C5A18, 0);
    v46 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v18;
    objc_msgSend(v19, "localizedStringWithFormat:", v20, v18);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("date"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C99D68];
    v42 = v22;
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v24, 0, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = +[ATXHeuristicEventUtilities isEventAtOneWithDate:](ATXHeuristicEventUtilities, "isEventAtOneWithDate:", v24);
    v27 = (void *)MEMORY[0x1E0CB3940];
    if (v26)
      v28 = CFSTR("RETURN_CALL_SUBTITLE_(hour is 1)");
    else
      v28 = CFSTR("RETURN_CALL_SUBTITLE");
    v45 = v17;
    objc_msgSend(v17, "localizedStringForKey:value:table:", v28, &stru_1E82C5A18, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v25;
    objc_msgSend(v27, "localizedStringWithFormat:", v29, v25);
    v30 = objc_claimAutoreleasedReturnValue();

    __atxlog_handle_context_heuristic();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413059;
      v48 = v13;
      v49 = 2112;
      v50 = v14;
      v51 = 2117;
      v52 = v21;
      v53 = 2112;
      v54 = v30;
      _os_log_impl(&dword_1C99DF000, v31, OS_LOG_TYPE_DEFAULT, "Action with handle %@ service %@ title %{sensitive}@, subtitle %@", buf, 0x2Au);
    }

    v32 = (void *)MEMORY[0x1E0CF8C20];
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("mediaType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "atx_startCallActionWithTitle:subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:", v21, v30, v43, v13, v14, v44, 0, CFSTR("returnCall"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "dateByAddingTimeInterval:", 120.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dateByAddingTimeInterval:", 1800.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v24;
    v38 = (void *)v30;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v35, v36, 0, 0);
    objc_msgSend(v34, "setCriteria:", v39);

    v12 = v44;
    v11 = v46;

    v17 = v45;
    v18 = v43;
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicReturnCall _actionWithCall null recipient name dropping action", buf, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (void)_duetInteractionCountFromDataSourceWithHandles:date:environment:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1C99DF000, v0, v1, "_duetInteractionCountFromDataSourceWithHandles error querying data source %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_contactsDataSourceWithIdentifiers:environment:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1C99DF000, v0, v1, "_contactsDataSourceWithIdentifiers error querying contacts data source %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_bestContactHandleFromDataSourceWithContact:service:environment:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1(&dword_1C99DF000, v0, v1, "_bestContactHandleFromDataSourceWithContact Error querying data source %@: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_bestContactHandleFromDataSourceWithContact:(uint64_t)a1 service:(uint64_t)a2 environment:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1C99DF000, a2, a3, "Contact %@ or service %@ from is invalid", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
