@implementation ICShareNotifier

+ (BOOL)shareNotifierEnabled
{
  return sShareNotifierEnabled;
}

+ (void)setShareNotifierEnabled:(BOOL)a3
{
  sShareNotifierEnabled = a3;
}

+ (void)clearNotificationForRecordID:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "recordName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier clearNotificationForRecordID:].cold.1();

    objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:", v6);

  }
}

+ (void)showNotificationIfNecessaryForCloudObject:(id)a3 accountID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "ic_loggingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = CFSTR("lastNotifiedTimestamp");
      objc_msgSend(v6, "lastNotifiedTimestamp");
      v18 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v18;
      if (v18)
        v19 = (const __CFString *)v18;
      else
        v19 = CFSTR("nil");
      v38[0] = v19;
      v37[1] = CFSTR("lastNotifiedDate");
      objc_msgSend(v6, "lastNotifiedDate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
        v21 = (const __CFString *)v20;
      else
        v21 = CFSTR("nil");
      v38[1] = v21;
      v37[2] = CFSTR("lastViewedTimestamp");
      objc_msgSend(v6, "lastViewedTimestamp", v20);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        v24 = (const __CFString *)v22;
      else
        v24 = CFSTR("nil");
      v38[2] = v24;
      v37[3] = CFSTR("lastViewedModificationDate");
      objc_msgSend(v6, "lastViewedModificationDate");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (const __CFString *)v25;
      else
        v27 = CFSTR("nil");
      v38[3] = v27;
      v37[4] = CFSTR("modificationDate");
      objc_msgSend(v6, "modificationDate");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (const __CFString *)v28;
      else
        v30 = CFSTR("nil");
      v38[4] = v30;
      v37[5] = CFSTR("timestamp");
      objc_msgSend(v6, "timestamp");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
        v33 = (const __CFString *)v31;
      else
        v33 = CFSTR("nil");
      v38[5] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v17;
      v41 = 2112;
      v42 = v34;
      _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Showing notification if necesary for (%@): %@", buf, 0x16u);

    }
    if (objc_msgSend(a1, "shouldShowNotificationForNote:", v6))
    {
      objc_msgSend(v6, "timestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastNotifiedTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "replicaIDsThatEditedTimestamp:sinceTimestamp:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:].cold.2(v10);

      objc_msgSend(a1, "participantsWithReplicaIDs:inNote:", v10, v6);
      v12 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v13 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:].cold.1(v12);

      objc_msgSend(a1, "showNotificationForNote:editors:", v6, v12);
      objc_msgSend(v6, "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLastNotifiedTimestamp:", v14);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLastNotifiedDate:", v15);

      objc_msgSend(v6, "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_saveWithLogDescription:", CFSTR("setting notification metadata"));

    }
    else
    {
      v12 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier showNotificationIfNecessaryForCloudObject:accountID:].cold.3(v6);
      v10 = v12;
    }

  }
}

+ (BOOL)shouldShowNotificationForNote:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  const __CFString *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (shouldShowNotificationForNote__onceToken != -1)
    dispatch_once(&shouldShowNotificationForNote__onceToken, &__block_literal_global_14);
  if ((objc_msgSend(a1, "shareNotifierEnabled") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.12(v4);
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "isSharedViaICloud") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.11(v4);
    goto LABEL_12;
  }
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "shouldPreventNotificationsForRecordID:", v5);

  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.1(v4);
LABEL_12:
    v8 = 0;
    v9 = v7;
    goto LABEL_13;
  }
  objc_msgSend(v4, "lastNotifiedTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(v4, "lastViewedTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v7 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier shouldShowNotificationForNote:].cold.2(v4);
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -259200.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (v15 == -1)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.3(v4);
    goto LABEL_12;
  }
  objc_msgSend(v4, "lastNotifiedDate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v4, "lastNotifiedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceNow");
    v20 = v19;

    v21 = v20 >= 0.0 ? v20 : -v20;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleForKey:", CFSTR("MinSecondsBetweenSharedNoteNotifications"));
    v24 = v23;

    if (v21 < v24)
    {
      v7 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier shouldShowNotificationForNote:].cold.10(v4);
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "lastNotifiedTimestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v4, "lastNotifiedTimestamp");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "compareTo:", v27) & 1;

  }
  else
  {
    v28 = 1;
  }

  objc_msgSend(v4, "lastViewedTimestamp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v4, "lastViewedTimestamp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "compareTo:", v31) & 1;

  }
  else
  {
    v32 = 1;
  }

  v33 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "shortLoggingDescription");
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    v50 = CFSTR("N");
    if (v28)
      v51 = CFSTR("Y");
    else
      v51 = CFSTR("N");
    *(_DWORD *)buf = 138412802;
    v56 = v48;
    v58 = v51;
    v57 = 2112;
    if (v32)
      v50 = CFSTR("Y");
    v59 = 2112;
    v60 = v50;
    _os_log_debug_impl(&dword_1BD918000, v33, OS_LOG_TYPE_DEBUG, "%@ - hasEditsSinceLastNotification:%@, hasEditsSinceLastView:%@", buf, 0x20u);

  }
  if ((v32 & v28) != 1)
  {
    v7 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.9(v4);
    goto LABEL_12;
  }
  objc_msgSend(v4, "account");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "userRecordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = os_log_create("com.apple.notes", "Notifications");
  v36 = v35;
  if (v9)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.8();

    objc_msgSend(v4, "timestamp");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastNotifiedTimestamp");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "replicaIDsThatEditedTimestamp:sinceTimestamp:", v37, v38);
    v7 = objc_claimAutoreleasedReturnValue();

    v39 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.7(v7);

    objc_msgSend(v4, "timestamp");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastViewedTimestamp");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "replicaIDsThatEditedTimestamp:sinceTimestamp:", v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.6(v42);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setByAddingObjectsFromArray:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke_34;
    v52[3] = &unk_1E76C92B8;
    v46 = v4;
    v53 = v46;
    v54 = v9;
    v8 = objc_msgSend(v45, "ic_containsObjectPassingTest:", v52);
    if ((v8 & 1) == 0)
    {
      v47 = os_log_create("com.apple.notes", "Notifications");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        +[ICShareNotifier shouldShowNotificationForNote:].cold.5(v46);

    }
  }
  else
  {
    v42 = v35;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier shouldShowNotificationForNote:].cold.4(v4);
    v8 = 0;
    v7 = v42;
  }

LABEL_13:
  return v8;
}

void __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke()
{
  void *v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CFSTR("MinSecondsBetweenSharedNoteNotifications");
  v3[0] = &unk_1E771AC80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v1);

}

uint64_t __49__ICShareNotifier_shouldShowNotificationForNote___block_invoke_34(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "userIDForReplicaID:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v3) ^ 1;

  return v4;
}

+ (id)replicaIDsThatEditedTimestamp:(id)a3 sinceTimestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v6, "timestamps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 >= v11)
    v12 = v11;
  else
    v12 = v9;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "sortedUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(obj);
        if (v12)
        {
          v17 = 0;
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          do
          {
            v19 = objc_msgSend(v5, "clockForUUID:atIndex:", v18, v17);
            if (v19 > objc_msgSend(v6, "clockForUUID:atIndex:", v18, v17))
              objc_msgSend(v7, "addObject:", v18);
            ++v17;
          }
          while (v12 != v17);
        }
        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(v7, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)participantsWithReplicaIDs:(id)a3 inNote:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  __int128 v32;
  void *v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ICShareNotifier participantsWithReplicaIDs:inNote:].cold.1(v5, v6);
  obj = v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v6, "serverShare");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "userIdentity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "userRecordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v12);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obja = obj;
  v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v37;
    *(_QWORD *)&v20 = 138412546;
    v32 = v20;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obja);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v6, "userIDForReplicaID:", v24, v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = os_log_create("com.apple.notes", "Notifications");
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
        if (v25)
        {
          if (v27)
          {
            *(_DWORD *)buf = v32;
            v45 = v25;
            v46 = 2112;
            v47 = v24;
            _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "Found user ID %@ for replica ID %@", buf, 0x16u);
          }

          objc_msgSend(v8, "objectForKeyedSubscript:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_create("com.apple.notes", "Notifications");
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
          if (v26)
          {
            if (v29)
            {
              *(_DWORD *)buf = 138412290;
              v45 = v25;
              _os_log_debug_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEBUG, "Found participant for user ID %@", buf, 0xCu);
            }

            objc_msgSend(v33, "addObject:", v26);
          }
          else
          {
            if (v29)
            {
              *(_DWORD *)buf = 138412290;
              v45 = v25;
              _os_log_debug_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEBUG, "No participant for user ID %@", buf, 0xCu);
            }

          }
        }
        else if (v27)
        {
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_debug_impl(&dword_1BD918000, v26, OS_LOG_TYPE_DEBUG, "No user ID for replica ID %@", buf, 0xCu);
        }

      }
      v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v21);
  }

  objc_msgSend(v33, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (void)showNotificationForNote:(id)a3 editors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICShareNotifier showNotificationForNote:editors:].cold.2(v7, v6, v8);

  objc_msgSend(a1, "notificationTitleForEditors:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = os_log_create("com.apple.notes", "Notifications");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ICShareNotifier showNotificationForNote:editors:].cold.1(v6);

    v15 = CFSTR("Note");
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "showNotificationWithTitle:message:userInfo:", v9, v11, v14);
  }

}

+ (void)showNotificationWithTitle:(id)a3 message:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Note"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_log_create("com.apple.notes", "Notifications");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[ICShareNotifier showNotificationWithTitle:message:userInfo:].cold.1();

  v12 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_msgSend(v12, "setTitle:", v9);

  objc_msgSend(v12, "setBody:", v8);
  objc_msgSend(v12, "setUserInfo:", v7);

  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSound:", v13);

  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v10, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC7A0], "currentNotificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke;
  v17[3] = &unk_1E76C92E0;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "addNotificationRequest:withCompletionHandler:", v14, v17);

}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Notifications");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_2(a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_1(a1, v5, v6);
  }

}

+ (id)notificationTitleForEditors:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0C95130];
  v4 = a3;
  objc_msgSend(v3, "ic_displayableNames:maximumNamesCount:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  if (v7 == 1 && v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%@ Edited"), CFSTR("%@ Edited"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v9, v13);
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v7 != 2 || v6 != 2)
  {
    if (v7 < 2 || !v6)
    {
      objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("New Edits"), CFSTR("New Edits"), 0, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%2$@ & %1$d More Edited"), CFSTR("%2$@ & %1$d More Edited"), 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, (v7 - 1), v9);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%@ & %@ Edited"), CFSTR("%@ & %@ Edited"), 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_12:

  return v11;
}

+ (id)defaultsKeyForPreventingNotificationsForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PreventNotifications-%@"), a3);
}

+ (BOOL)shouldPreventNotificationsForRecordID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultsKeyForPreventingNotificationsForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", v5);

  return v7;
}

+ (void)setShouldPreventNotifications:(BOOL)a3 forRecordID:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a4, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultsKeyForPreventingNotificationsForIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "setBool:forKey:", 1, v9);
  else
    objc_msgSend(v7, "removeObjectForKey:", v9);

}

+ (void)clearNotificationForRecordID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Attempting to clear notification for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "count");
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "%lu editors: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "replicaIDsWithEdits: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)showNotificationIfNecessaryForCloudObject:(void *)a1 accountID:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: do not disturb is on", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: never notified and never viewed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: last modification date was too long ago", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "No user record name when checking if we should send a notification about %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: no non-current-user editors", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Editors since last view: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.7(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Editors since last notification: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Found current user record name (%@)", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.9(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: no new edits since last view or notification", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.10(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastNotifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Not showing notification for %@: notified at %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.11(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notification for %@: not shared", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)shouldShowNotificationForNote:(void *)a1 .cold.12(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not showing notifications for %@: app is active", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)participantsWithReplicaIDs:(void *)a1 inNote:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Matching participants to replica IDs [%@] in %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

+ (void)showNotificationForNote:(void *)a1 editors:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Requesting notification for %@ %f seconds after it was last modified.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

+ (void)showNotificationForNote:(NSObject *)a3 editors:.cold.2(void *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  objc_msgSend(a2, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v5;
  v8 = 2112;
  v9 = v6;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Showing notification for %d editors for %@", (uint8_t *)v7, 0x12u);

  OUTLINED_FUNCTION_2();
}

+ (void)showNotificationWithTitle:message:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Delivering user notification for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, a3, "Added notification request for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __62__ICShareNotifier_showNotificationWithTitle_message_userInfo___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Error adding notification request for %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
