@implementation EKEvent

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_cold_1(a1);
    goto LABEL_7;
  }
  v10 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));
  +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_INFO, "URL %@ is still valid.", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_11;
  }
  if (v12)
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v23 = v14;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1B8A6A000, v11, OS_LOG_TYPE_INFO, "Will replace URL %@ with %@.", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_271;
  block[3] = &unk_1E6EB6C40;
  block[4] = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v15 = v7;
  v16 = *(_QWORD *)(a1 + 48);
  v19 = v15;
  v21 = v16;
  v20 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_11:
}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_271(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "objectsHaveChangesToCommit:", v3);

  objc_msgSend(*(id *)(a1 + 32), "shallowCopyWithoutChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualConference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend((id)objc_opt_class(), "updateVirtualConference:replacing:with:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(v5, "setVirtualConference:", v7);
    objc_msgSend(*(id *)(a1 + 32), "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v20 = 0;
    v10 = objc_msgSend(v8, "saveEvent:span:commit:error:", v5, v9, v4 ^ 1u, &v20);
    v11 = v20;

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "postModifiedNotification");
    }
    else
    {
      +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_271_cold_1();

      v17 = (void *)MEMORY[0x1E0CAA038];
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "eventStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidateConferenceURLIfNeeded:inEventStore:", v18, v19);

    }
  }
  else
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_1B8A6A000, v12, OS_LOG_TYPE_INFO, "Didn't find old URL %@ to update on event; just invalidating the new URL",
        buf,
        0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CAA038];
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "eventStore");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidateConferenceURLIfNeeded:inEventStore:", v15, v11);
  }

}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v1, v2, "Failed to create valid URL for old URL %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __55__EKEvent_Saving__fixInvalidatedVirtualConferenceURLs___block_invoke_271_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B8A6A000, v0, OS_LOG_TYPE_ERROR, "Error saving revalidated URL: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
