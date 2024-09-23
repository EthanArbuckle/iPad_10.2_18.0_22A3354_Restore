@implementation FAFollowupManager

+ (void)tearDownFollowupItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D15E30];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithClientIdentifier:", CFSTR("com.icloud.family"));
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E8561988;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v9, v11);

}

void __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke_cold_1(v5);

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

+ (void)synchronizeFollowupWithPayload:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_followupManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "synchronizeFollowUpsWithServerPayload:altDSID:error:", v7, v6, &v13);

  v10 = v13;
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
      +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:].cold.1(v11);
  }
  else if (v12)
  {
    +[FAFollowupManager synchronizeFollowupWithPayload:altDSID:].cold.2(v10, v11);
  }

}

+ (void)teardownPendingFollowup
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1CAEBA000, v2, v3, "Failed to clear pending family followup items with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)teardownFollowUpWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "teardownFollowUpWithContext called with context: %@", buf, 0xCu);
  }

  objc_msgSend(a1, "_followupManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__FAFollowupManager_teardownFollowUpWithContext_completion___block_invoke;
  v11[3] = &unk_1E8561988;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "teardownFollowUpWithContext:completion:", v6, v11);

}

void __60__FAFollowupManager_teardownFollowUpWithContext_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "Successfully cleared pending family followup items.", (uint8_t *)&v9, 2u);
    }
  }
  else if (v7)
  {
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clear pending family followup items with error: %@", (uint8_t *)&v9, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)_followupManager
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.icloud.family"));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00200]), "initWithFLFollowupController:", v2);
  v4 = objc_alloc_init(MEMORY[0x1E0D00208]);
  objc_msgSend(v4, "setExtensionIdentifier:", CFSTR("com.apple.family.FAFollowupExtension"));
  objc_msgSend(v4, "setRepresentingBundlePath:", CFSTR("/System/Library/PreferencePanes/FamilySharingPrefPane.prefPane"));
  objc_msgSend(v4, "setBundleIconName:", CFSTR("iCloudFamily"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00190]), "initWithFollowUpFactory:provider:", v4, v3);

  return v5;
}

void __67__FAFollowupManager_tearDownFollowupItemWithIdentifier_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1CAEBA000, v2, v3, "Failed to teardown followup item with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)synchronizeFollowupWithPayload:(os_log_t)log altDSID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CAEBA000, log, OS_LOG_TYPE_DEBUG, "Family followup posted successfully.", v1, 2u);
}

+ (void)synchronizeFollowupWithPayload:(void *)a1 altDSID:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "Failed to post followup with error %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
