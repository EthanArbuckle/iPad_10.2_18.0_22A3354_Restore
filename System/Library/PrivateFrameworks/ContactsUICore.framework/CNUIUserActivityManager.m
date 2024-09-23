@implementation CNUIUserActivityManager

- (id)makeActivityAdvertisingViewingOfContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIUserActivityManager contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userActivityUserInfoForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3B10]);
    v8 = (void *)objc_msgSend(v7, "initWithActivityType:", CNUIActivityTypeViewingContact);
    objc_msgSend(v8, "setEligibleForSearch:", 1);
    objc_msgSend(v8, "setEligibleForPublicIndexing:", 1);
    objc_msgSend(v8, "setEligibleForHandoff:", 1);
    objc_msgSend(v8, "_setEligibleForPrediction:", 0);
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1DD140000, v9, OS_LOG_TYPE_INFO, "activity continuity - %@ needs to save the user activity", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CNUIUserActivityManager makeActivityAdvertisingViewingOfContact:].cold.1((uint64_t)v4, v9);
    v8 = 0;
  }

  return v8;
}

- (void)updateUserActivityState:(id)a3 withContentsOfContact:(id)a4
{
  id v6;
  id v7;
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
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setTitle:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1EA606688, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v10);

  }
  -[CNUIUserActivityManager contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userActivityUserInfoForContact:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v12);

  v13 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequiredUserInfoKeys:", v16);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "searchableItemAttributeSetForUserActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentAttributeSet:", v17);

  }
  objc_msgSend((id)objc_opt_class(), "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v6;
    v23 = 2112;
    v24 = v19;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_1DD140000, v18, OS_LOG_TYPE_INFO, "activity continuity - updated %@ with title %@, userInfo %@", (uint8_t *)&v21, 0x20u);

  }
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_1_2 != -1)
    dispatch_once(&log_cn_once_token_1_2, &__block_literal_global_31);
  return (OS_os_log *)(id)log_cn_once_object_1_2;
}

void __30__CNUIUserActivityManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("contactsui", "activity");
  v1 = (void *)log_cn_once_object_1_2;
  log_cn_once_object_1_2 = (uint64_t)v0;

}

- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v6;
  id v7;
  CNUIInteractionDonor *v8;
  CNUIUserActivityManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CNUIInteractionDonor);
  v9 = -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:interactionDonor:](self, "initWithContactStore:applicationWorkspace:interactionDonor:", v7, v6, v8);

  return v9;
}

- (CNUIUserActivityManager)initWithContactStore:(id)a3 applicationWorkspace:(id)a4 interactionDonor:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CNUIUserActivityManager *v36;
  CNUIUserActivityManager *v37;
  CNUIUserActivityManager *v38;
  objc_super v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_59);
  v12 = CNGuardOSLog_cn_once_object_0_7;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v10)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_59);
  v20 = CNGuardOSLog_cn_once_object_0_7;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
    -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:interactionDonor:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_59);
    v28 = CNGuardOSLog_cn_once_object_0_7;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:interactionDonor:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  v40.receiver = self;
  v40.super_class = (Class)CNUIUserActivityManager;
  v36 = -[CNUIUserActivityManager init](&v40, sel_init);
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_contactStore, a3);
    objc_storeStrong((id *)&v37->_applicationWorkspace, a4);
    objc_storeStrong((id *)&v37->_interactionDonor, a5);
    v38 = v37;
  }

  return v37;
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
}

- (CNUIUserActivityManager)initWithContactStore:(id)a3
{
  id v4;
  CNLSApplicationWorkspace *v5;
  CNUIUserActivityManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNLSApplicationWorkspace);
  v6 = -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:](self, "initWithContactStore:applicationWorkspace:", v4, v5);

  return v6;
}

- (CNUIUserActivityManager)initWithApplicationWorkspace:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CNUIUserActivityManager *v7;

  v4 = (objc_class *)MEMORY[0x1E0C97298];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[CNUIUserActivityManager initWithContactStore:applicationWorkspace:](self, "initWithContactStore:applicationWorkspace:", v6, v5);

  return v7;
}

- (void)publishRequestToCreateContact:(id)a3
{
  void *v4;
  void *v5;
  CNUICreateContactIntent *v6;

  v6 = objc_alloc_init(CNUICreateContactIntent);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v6, 0);
  -[CNUIUserActivityManager interactionDonor](self, "interactionDonor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "donateInteraction:", v4);

}

- (void)publishRequestToEditContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3B10]);
  v6 = (void *)objc_msgSend(v5, "initWithActivityType:", CNUIActivityTypeEditingContact);
  -[CNUIUserActivityManager contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userActivityUserInfoForContact:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v8);

  -[CNUIUserActivityManager applicationWorkspace](self, "applicationWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke;
  v11[3] = &unk_1EA604358;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "openUserActivity:inApplication:options:completionHandler:", v6, 0, 0, v11);

}

void __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DD140000, v7, OS_LOG_TYPE_INFO, "opened contacts successfully", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke_cold_1(a1, (uint64_t)v5, v7);
  }

}

- (void)updateUserActivityState:(id)a3 withContentsOfListTopContact:(id)a4 displayedContact:(id)a5 searchString:(id)a6 isShowingGroups:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v7 = a7;
  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v13
    && (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v13, 0),
        (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)v16;
    objc_msgSend(v12, "setTitle:", v16);
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1EA606688, CFSTR("Localized"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v20);

    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!v13)
      goto LABEL_6;
  }
  -[CNUIUserActivityManager contactStore](self, "contactStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userActivityUserInfoForContact:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CNUIActivityUserInformationListTopContactKey);

LABEL_6:
  if (v14)
  {
    -[CNUIUserActivityManager contactStore](self, "contactStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userActivityUserInfoForContact:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CNUIActivityUserInformationDisplayedContactKey);

  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CNUIActivityUserInformationSearchStringKey);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CNUIActivityUserInformationIsShowingGroupsKey);

  objc_msgSend(v12, "setUserInfo:", v18);
  v26 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v12, "userInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRequiredUserInfoKeys:", v29);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "searchableItemAttributeSetForUserActivity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentAttributeSet:", v30);

  }
  objc_msgSend((id)objc_opt_class(), "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412802;
    v35 = v12;
    v36 = 2112;
    v37 = v32;
    v38 = 2112;
    v39 = v33;
    _os_log_impl(&dword_1DD140000, v31, OS_LOG_TYPE_INFO, "activity continuity - updated %@ with title %@, userInfo %@", (uint8_t *)&v34, 0x20u);

  }
}

- (id)makeActivityAdvertisingViewingList
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CB3B10]);
  return (id)objc_msgSend(v2, "initWithActivityType:", CNUIActivityTypeViewingList);
}

- (id)makeActivityAdvertisingViewingGroups
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0CB3B10]);
  return (id)objc_msgSend(v2, "initWithActivityType:", CNUIActivityTypeViewingGroups);
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (CNUIInteractionDonor)interactionDonor
{
  return self->_interactionDonor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionDonor, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStore:(uint64_t)a3 applicationWorkspace:(uint64_t)a4 interactionDonor:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘interactionDonor’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithContactStore:(uint64_t)a3 applicationWorkspace:(uint64_t)a4 interactionDonor:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘applicationWorkspace’ must be nonnull", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __55__CNUIUserActivityManager_publishRequestToEditContact___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DD140000, log, OS_LOG_TYPE_ERROR, "error opening contacts to edit mode for contact: %@, error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)makeActivityAdvertisingViewingOfContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "activity continuity - %@ has no user activity", (uint8_t *)&v2, 0xCu);
}

@end
