@implementation EKEvent(Saving)

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:
{
  void *v7;
  uint64_t v8;
  NSObject *v9;

  objc_msgSend(a1, "fixInvalidatedVirtualConferenceURLs:");
  objc_msgSend(a1, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "saveEvent:span:commit:error:", a1, a3, 0, a4);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "postModifiedNotification");
  }
  else
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EKEvent(Saving) CUIKEditingContext_saveWithSpan:error:].cold.1();

  }
  return v8;
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:
{
  void *v7;
  uint64_t v8;
  NSObject *v9;

  objc_msgSend(a1, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "removeEvent:span:commit:error:", a1, a3, 0, a4);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "postModifiedNotification");
    +[CUIKEditingContext postLiveEditNotificationForObject:](CUIKEditingContext, "postLiveEditNotificationForObject:", a1);
  }
  else
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EKEvent(Saving) CUIKEditingContext_removeWithSpan:error:].cold.1();

  }
  return v8;
}

- (void)fixInvalidatedVirtualConferenceURLs:()Saving
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[4];
  id v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "virtualConference");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "joinMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (!v6)
  {
    v8 = v5;
    goto LABEL_21;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v27;
  obj = v5;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CAA038];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke;
      v22[3] = &unk_1E6EB6C68;
      v13 = v11;
      v23 = v13;
      v24 = a1;
      v25 = a3;
      objc_msgSend(v12, "validURLForConferenceURL:completion:", v13, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "isEqual:", v13);
        +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
        if (v16)
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412290;
            v31 = v13;
            _os_log_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_INFO, "URL %@ is still valid.", buf, 0xCu);
          }
        }
        else
        {
          if (v18)
          {
            *(_DWORD *)buf = 138412546;
            v31 = v13;
            v32 = 2112;
            v33 = v15;
            _os_log_impl(&dword_1B8A6A000, v17, OS_LOG_TYPE_INFO, "Replacing URL %@ with %@.", buf, 0x16u);
          }

          if (!v8)
            v8 = (void *)objc_msgSend(v20, "copy");
          v19 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "updateVirtualConference:replacing:with:", v8, v17, v15);
        }

      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  }
  while (v7);

  if (v8)
  {
    objc_msgSend(a1, "setVirtualConference:", v8);
LABEL_21:

  }
}

+ (uint64_t)updateVirtualConference:()Saving replacing:with:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "joinMethods");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "URL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v8, "containsObject:", v16);

        if (v17)
        {
          objc_msgSend(v7, "joinMethods");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          v20 = (void *)objc_msgSend(v15, "copy");
          objc_msgSend(v20, "setURL:", v22);
          objc_msgSend(v19, "setObject:atIndexedSubscript:", v20, v11 + i);
          objc_msgSend(v7, "setJoinMethods:", v19);

          v12 = 1;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v11 += i;
    }
    while (v10);
  }
  else
  {
    v12 = 0;
  }

  return v12 & 1;
}

- (void)CUIKEditingContext_saveWithSpan:()Saving error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v0, v1, "Event %@ failed to save with error %@");
  OUTLINED_FUNCTION_2();
}

- (void)CUIKEditingContext_removeWithSpan:()Saving error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v0, v1, "Event %@ failed to remove with error %@");
  OUTLINED_FUNCTION_2();
}

@end
