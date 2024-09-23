@implementation EKUIDiscoverabilityUtilities

+ (void)sendDiscoverabilitySignalForConference:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyApp"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v3, "joinMethods", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v20;
      v7 = CFSTR("facetime");
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x1E0D0C288];
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v9, "isTUConversationLink:", v10);

        if ((v9 & 1) != 0)
          break;
        if (v5 == ++v8)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v34, 16);
          if (v5)
            goto LABEL_4;
          v7 = CFSTR("other");
          break;
        }
      }
    }
    else
    {
      v7 = CFSTR("other");
    }

    v32 = CFSTR("type");
    v33 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v12 = (void *)getBMStreamsClass_softClass;
    v31 = getBMStreamsClass_softClass;
    if (!getBMStreamsClass_softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __getBMStreamsClass_block_invoke;
      v26 = &unk_1E6018EE8;
      v27 = &v28;
      __getBMStreamsClass_block_invoke((uint64_t)&v23);
      v12 = (void *)v29[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v28, 8);
    objc_msgSend(v13, "discoverabilitySignal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v15 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
    v31 = getBMDiscoverabilitySignalEventClass_softClass;
    if (!getBMDiscoverabilitySignalEventClass_softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __getBMDiscoverabilitySignalEventClass_block_invoke;
      v26 = &unk_1E6018EE8;
      v27 = &v28;
      __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)&v23);
      v15 = (void *)v29[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v28, 8);
    v17 = (void *)objc_msgSend([v16 alloc], "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.mobilecal.virtual-conference-added"), CFSTR("com.apple.mobilecal"), 0, v11);
    objc_msgSend(v14, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEvent:", v17);

  }
}

+ (void)scanEventsForDiscoveredConferencesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyApp"))
  {
    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scanForDiscoveredVirtualConferences");

    if (v6)
    {
      v28 = a1;
      v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 28, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setDay:", 1);
      objc_msgSend(v7, "setMonth:", 6);
      objc_msgSend(v7, "setYear:", 2021);
      objc_msgSend(v10, "setYear:", objc_msgSend(v10, "year") + 1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateFromComponents:", v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateFromComponents:", v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "sourcesEnabledForEntityType:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (objc_msgSend(v20, "sourceType", v26) != 5 && objc_msgSend(v20, "sourceType") != 4)
            {
              objc_msgSend(v20, "calendarsForEntityType:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "allObjects");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "addObjectsFromArray:", v22);
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v17);
      }

      objc_msgSend(v4, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v27, v26, v14, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(-32768, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__EKUIDiscoverabilityUtilities_scanEventsForDiscoveredConferencesIfNeeded___block_invoke;
      block[3] = &unk_1E601A7F0;
      v30 = v4;
      v31 = v23;
      v32 = v28;
      v25 = v23;
      dispatch_async(v24, block);

    }
  }

}

void __75__EKUIDiscoverabilityUtilities_scanEventsForDiscoveredConferencesIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventsMatchingPredicate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "virtualConference");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          v10 = objc_msgSend(v7, "isSelfOrganized");

          if (v10)
          {
            v11 = *(void **)(a1 + 48);
            objc_msgSend(v7, "virtualConference");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "sendDiscoverabilitySignalForConference:", v12);

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScanForDiscoveredVirtualConferences:", 0);

  }
}

@end
