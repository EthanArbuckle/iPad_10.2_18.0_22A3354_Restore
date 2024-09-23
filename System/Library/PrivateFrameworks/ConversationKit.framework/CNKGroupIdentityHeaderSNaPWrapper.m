@implementation CNKGroupIdentityHeaderSNaPWrapper

- (void)configureGroupIdentityHeaderViewController:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ConversationKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1BD004000, v8, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Configuring viewController: %@ with contact: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "setDelegate:", self);
  -[CNKGroupIdentityHeaderSNaPWrapper setOracleUsingController:contact:](self, "setOracleUsingController:contact:", v6, v7);

}

- (void)groupIdentityHeaderViewController:(id)a3 sharedProfileBannerDidUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a4;
  v8 = a3;
  ConversationKitLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BD004000, v9, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Received sharedProfileBannerDidUpdateContact callback", v10, 2u);
  }

  -[CNKGroupIdentityHeaderSNaPWrapper handleSharedProfileUpdateForController:contact:](self, "handleSharedProfileUpdateForController:contact:", v8, v7);
}

- (void)groupIdentityHeaderViewController:(id)a3 didDismissSharedProfileBannerWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a4;
  v8 = a3;
  ConversationKitLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BD004000, v9, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Received didDismissSharedProfileBannerWithUpdatedContact callback", v10, 2u);
  }

  -[CNKGroupIdentityHeaderSNaPWrapper handleSharedProfileUpdateForController:contact:](self, "handleSharedProfileUpdateForController:contact:", v8, v7);
}

- (void)setOracleUsingController:(id)a3 contact:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  ConversationKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1BD004000, v7, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Setting oracle on controller: %@ with contact: %@", (uint8_t *)&v15, 0x16u);
  }

  v8 = objc_alloc(MEMORY[0x1E0C973E0]);
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithContact:contactStore:", v6, v10);

  ConversationKitLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "currentNickname");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pendingNickname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1BD004000, v12, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Created oracle %@ current nickname %@ pending nickname %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v5, "setSharedProfileStateOracle:", v11);

}

- (void)handleSharedProfileUpdateForController:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ConversationKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1BD004000, v8, OS_LOG_TYPE_DEFAULT, "[CNKGroupIdentityHeaderSNaPWrapper] Handling shared profile update for controller: %@ with contact: %@", buf, 0x16u);
  }

  objc_msgSend(v6, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfContacts");

  if (v10 == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0C974F0]);
    objc_msgSend(v6, "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "group");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupPhoto");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initGroupWithName:photo:contacts:", v13, v15, v16);

    objc_msgSend(v6, "groupIdentityDidUpdate:", v17);
    -[CNKGroupIdentityHeaderSNaPWrapper setOracleUsingController:contact:](self, "setOracleUsingController:contact:", v6, v7);

  }
}

@end
