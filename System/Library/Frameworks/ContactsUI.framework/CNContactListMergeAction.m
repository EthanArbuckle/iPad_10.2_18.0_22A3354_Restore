@implementation CNContactListMergeAction

+ (id)log
{
  if (log_cn_once_token_4_34322 != -1)
    dispatch_once(&log_cn_once_token_4_34322, &__block_literal_global_34323);
  return (id)log_cn_once_object_4_34324;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C97200];
  +[ContactListMergeUnifyActionHelper descriptorForRequiredKeys](_TtC10ContactsUI33ContactListMergeUnifyActionHelper, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListMergeAction descriptorForRequiredKeys]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __31__CNContactListMergeAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIContactListMergeAction");
  v1 = (void *)log_cn_once_object_4_34324;
  log_cn_once_object_4_34324 = (uint64_t)v0;

}

- (BOOL)shouldReloadListOnCompletion
{
  return 1;
}

- (void)performAction
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  -[CNContactListAction contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactListMergeAction mergeWillRequireLinkingForContacts:](self, "mergeWillRequireLinkingForContacts:", v3);

  v5 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = CFSTR("LIST_ACTION_MERGE_LINK_CARDS_MESSAGE");
  else
    v8 = CFSTR("LIST_ACTION_MERGE_CARDS_MESSAGE");
  if (v4)
    v9 = CFSTR("LIST_ACTION_MERGE_LINK_CARDS_TITLE");
  else
    v9 = CFSTR("LIST_ACTION_MERGE_CARDS_TITLE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListAction contacts](self, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  objc_msgSend(v5, "localizedStringWithFormat:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", v9, &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListAction contacts](self, "contacts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 <= 1)
    v21 = 1;
  else
    v21 = v20;
  objc_msgSend(v16, "localizedStringWithFormat:", v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __41__CNContactListMergeAction_performAction__block_invoke;
  v29[3] = &unk_1E204F7F0;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v22, 0, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v23);

  v24 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, &__block_literal_global_21_34375);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v27);

  -[CNContactListAction delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "action:presentViewController:", self, v15);

}

- (BOOL)executeAction
{
  id v3;
  void *v4;
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *v5;
  void *v6;
  void *v7;
  _TtC10ContactsUI33ContactListMergeUnifyActionHelper *v8;
  void *v9;
  CNUIGroupsAndContainersSaveManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNUIGroupsAndContainersSaveManager *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  void *v41;
  id v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  NSObject *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  -[CNContactListMergeAction mergeUnifyActionHelper](self, "mergeUnifyActionHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [_TtC10ContactsUI33ContactListMergeUnifyActionHelper alloc];
    -[CNContactListAction configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ContactListMergeUnifyActionHelper initWithContactStore:](v5, "initWithContactStore:", v7);
    -[CNContactListMergeAction setMergeUnifyActionHelper:](self, "setMergeUnifyActionHelper:", v8);

  }
  v41 = v3;
  -[CNContactListMergeAction groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = [CNUIGroupsAndContainersSaveManager alloc];
    -[CNContactListAction configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListAction configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactViewCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:contactViewCache:](v10, "initWithContactStore:contactViewCache:", v12, v14);
    -[CNContactListMergeAction setGroupsAndContainersSaveManager:](self, "setGroupsAndContainersSaveManager:", v15);

  }
  v16 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CNContactListAction contacts](self, "contacts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[CNContactListAction contacts](self, "contacts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v45;
    v23 = *MEMORY[0x1E0D137F8];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v45 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[CNContactListMergeAction groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "parentGroupsForContact:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (((*(uint64_t (**)(uint64_t, void *))(v23 + 16))(v23, v27) & 1) == 0)
        {
          objc_msgSend(v25, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v27, v28);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v21);
  }

  -[CNContactListMergeAction mergeUnifyActionHelper](self, "mergeUnifyActionHelper");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListAction contacts](self, "contacts");
  v30 = objc_claimAutoreleasedReturnValue();
  -[CNContactListAction contacts](self, "contacts");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __41__CNContactListMergeAction_executeAction__block_invoke;
  v43[3] = &unk_1E2050548;
  v43[4] = self;
  objc_msgSend(v31, "_cn_map:", v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mergeContacts:withContainerIdentifiers:withContactIDToParentGroupsDict:", v30, v32, v18);

  -[CNContactListMergeAction mergeUnifyActionHelper](self, "mergeUnifyActionHelper");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = objc_msgSend(v33, "applyMergeResultToSaveRequest:", v41);

  if ((v30 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v38, OS_LOG_TYPE_ERROR, "Failed to merge contacts action: no merge result", buf, 2u);
    }
    goto LABEL_21;
  }
  v34 = 1;
  objc_msgSend(v41, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListAction configuration](self, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "contactStore");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v37 = objc_msgSend(v36, "executeSaveRequest:error:", v41, &v42);
  v38 = v42;

  if ((v37 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v38;
      _os_log_error_impl(&dword_18AC56000, v39, OS_LOG_TYPE_ERROR, "Failed to merge contacts: %@", buf, 0xCu);
    }

LABEL_21:
    v34 = 0;
  }

  return v34;
}

- (BOOL)mergeWillRequireLinkingForContacts:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNContactListMergeAction_mergeWillRequireLinkingForContacts___block_invoke;
  v7[3] = &unk_1E204C350;
  v7[4] = self;
  objc_msgSend(a3, "_cn_groupBy:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

- (void)performUndoAction
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  NSObject *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  v4 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v3, "setIgnoresGuardianRestrictions:", 1);
  objc_msgSend(v4, "setIgnoresGuardianRestrictions:", 1);
  -[CNContactListMergeAction mergeUnifyActionHelper](self, "mergeUnifyActionHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applyUndoTo:and:", v3, v4);

  if ((v6 & 1) != 0)
  {
    -[CNContactListAction configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v9 = objc_msgSend(v8, "executeSaveRequest:error:", v3, &v17);
    v10 = v17;

    v11 = 0;
    if (!v9)
      goto LABEL_7;
    -[CNContactListAction configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contactStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14 = objc_msgSend(v13, "executeSaveRequest:error:", v4, &v16);
    v11 = v16;

    if ((v14 & 1) != 0)
    {
      -[CNContactListAction delegate](self, "delegate");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject actionDidFinish:](v15, "actionDidFinish:", self);
    }
    else
    {
LABEL_7:
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, "Failed to undo merge contacts action: %@ | %@", buf, 0x16u);
      }
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v10, OS_LOG_TYPE_ERROR, "Failed to undo merge contacts action: no merge result to undo", buf, 2u);
    }
  }

}

- (void)showMergeFailureAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MERGE_CARDS_SHEET_FAILURE_ALERT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v9);

  -[CNContactListAction delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action:presentViewController:", self, v11);

}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)mergeUnifyActionHelper
{
  return self->_mergeUnifyActionHelper;
}

- (void)setMergeUnifyActionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_mergeUnifyActionHelper, a3);
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_mergeUnifyActionHelper, 0);
}

__CFString *__63__CNContactListMergeAction_mergeWillRequireLinkingForContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactViewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerForContact:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_1E20507A8;
  v9 = v7;

  return v9;
}

__CFString *__41__CNContactListMergeAction_executeAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactViewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerForContact:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &stru_1E20507A8;
  v9 = v7;

  return v9;
}

void __41__CNContactListMergeAction_performAction__block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "executeAction") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "showMergeFailureAlert");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

@end
