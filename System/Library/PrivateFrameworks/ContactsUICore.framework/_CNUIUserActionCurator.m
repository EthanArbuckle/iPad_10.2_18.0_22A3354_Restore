@implementation _CNUIUserActionCurator

- (_CNUIUserActionCurator)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v7;
  id v8;
  _CNUIUserActionCurator *v9;
  _CNUIUserActionCurator *v10;
  _CNUIUserActionCurator *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNUIUserActionCurator;
  v9 = -[_CNUIUserActionCurator init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_applicationWorkspace, a4);
    v11 = v10;
  }

  return v10;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  id v4;
  CNContactStore *v5;
  CNContactStore *v6;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
    objc_msgSend(v4, "setIncludeLocalContacts:", 1);
    objc_msgSend(v4, "setIncludeSuggestedContacts:", 1);
    v5 = (CNContactStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  CNLSApplicationWorkspace *applicationWorkspace;
  CNLSApplicationWorkspace *v4;
  CNLSApplicationWorkspace *v5;

  applicationWorkspace = self->_applicationWorkspace;
  if (!applicationWorkspace)
  {
    v4 = objc_alloc_init(CNLSApplicationWorkspace);
    v5 = self->_applicationWorkspace;
    self->_applicationWorkspace = v4;

    applicationWorkspace = self->_applicationWorkspace;
  }
  return applicationWorkspace;
}

- (id)curateUserAction:(id)a3
{
  return -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:](self, "curateUserAction:withKeysToFetch:", a3, MEMORY[0x1E0C9AA60]);
}

- (id)curateUserAction:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  _CNUIUserActionCurator *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  CNUIUserActionItem *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  _CNUIUserActionCurator *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  NSObject *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  void *v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v88 = v6;
  objc_msgSend(v6, "contactProperty");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasBeenPersisted");

  if ((v9 & 1) == 0)
  {
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.5(v6);
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "isSuggested"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C973F0]);
    objc_msgSend(v6, "contactProperty");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "labeledValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "confirmSuggestion:", v12);

    v13 = self;
    -[_CNUIUserActionCurator contactStore](self, "contactStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    v15 = objc_msgSend(v14, "executeSaveRequest:error:", v10, &v93);
    v16 = v93;

    if ((v15 & 1) == 0)
    {
      +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.4((uint64_t)v16, v6, v17);

    }
    self = v13;
  }
  objc_msgSend(v87, "contact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C96868];
  v20 = objc_msgSend(v18, "isKeyAvailable:", *MEMORY[0x1E0C96868]);

  objc_msgSend(v87, "contact");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
  {
    v23 = objc_msgSend(v21, "mutableCopy");
  }
  else
  {
    objc_msgSend(v21, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
      goto LABEL_21;
    -[_CNUIUserActionCurator contactStore](self, "contactStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "contact");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
    v27 = v19;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unifiedContactWithIdentifier:keysToFetch:error:", v26, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v29, "mutableCopy");

    v19 = v27;
  }

  if (!v23)
  {
LABEL_21:
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.1(v6);
LABEL_23:
    v38 = 0;
    goto LABEL_45;
  }
  if (objc_msgSend(v6, "isSuggested"))
  {
    v30 = v19;
    objc_opt_class();
    objc_msgSend(v6, "contactProperty");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "labeledValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
    v35 = v34;

    if (v35)
    {
      objc_msgSend(v35, "userIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "service");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "displayname");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
      v85 = 0;
      v36 = 0;
    }

    v19 = v30;
    v39 = (void *)v37;
  }
  else
  {
    v39 = 0;
    v85 = 0;
    v36 = 0;
  }
  v83 = v19;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    v40 = *MEMORY[0x1E0D13850];
    objc_msgSend(v6, "bundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = (*(uint64_t (**)(uint64_t, void *))(v40 + 16))(v40, v41);

    if ((_DWORD)v40)
    {
      -[_CNUIUserActionCurator applicationWorkspace](self, "applicationWorkspace");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "applicationForBundleIdentifier:", v43);
      v44 = v36;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedName");
      v46 = objc_claimAutoreleasedReturnValue();

      v36 = v44;
      v39 = (void *)v46;
    }
  }
  objc_msgSend(v6, "bundleIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v7;
  v84 = self;
  if (v47)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v49 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = MEMORY[0x1E0C9AA60];
  }

  v50 = objc_alloc(MEMORY[0x1E0C97380]);
  objc_msgSend(v6, "targetHandle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = MEMORY[0x1E0D13870];
  v82 = (void *)v36;
  (*(void (**)(void))(*MEMORY[0x1E0D13870] + 16))();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)v52 + 16))();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)v52 + 16))();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teamIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v49;
  v57 = objc_msgSend(v50, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", 0, v51, v53, v54, v55, v56, v49);
  v58 = v39;
  v59 = (void *)v57;

  v81 = v58;
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject socialProfiles](v23, "socialProfiles");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "arrayByAddingObject:", v60);
  v62 = objc_claimAutoreleasedReturnValue();
  -[NSObject setSocialProfiles:](v23, "setSocialProfiles:", v62);

  v63 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  objc_msgSend(v63, "updateContact:", v23);
  -[_CNUIUserActionCurator contactStore](v84, "contactStore");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  LOBYTE(v62) = objc_msgSend(v64, "executeSaveRequest:error:", v63, &v92);
  v65 = v92;

  if ((v62 & 1) == 0)
  {
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v88, "type");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v95 = v65;
      v96 = 2112;
      v97 = v23;
      v98 = 2114;
      v99 = v79;
      v100 = 2112;
      v101 = v88;
      _os_log_debug_impl(&dword_1DD140000, v66, OS_LOG_TYPE_DEBUG, "[User Action Curator] cannot save mutable contact with curated action, error = %{public}@\n mutable contact = %@\n user action = %{public}@: %@", buf, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v83, 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addObjectsFromArray:", v86);
  -[_CNUIUserActionCurator contactStore](v84, "contactStore");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject identifier](v23, "identifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "unifiedContactWithIdentifier:keysToFetch:error:", v69, v67, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "socialProfiles");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __59___CNUIUserActionCurator_curateUserAction_withKeysToFetch___block_invoke;
  v89[3] = &unk_1EA605680;
  v90 = v60;
  v72 = v59;
  v91 = v72;
  objc_msgSend(v71, "_cn_firstObjectPassingTest:", v89);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    v74 = (void *)MEMORY[0x1E0C97280];
    objc_msgSend(v73, "identifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v70, v83, v75);
    v76 = objc_claimAutoreleasedReturnValue();

    v38 = -[CNUIUserActionItem initWithItem:contactProperty:]([CNUIUserActionItem alloc], "initWithItem:contactProperty:", v88, v76);
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.3(v38);
    v87 = (void *)v76;
  }
  else
  {
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      -[_CNUIUserActionCurator curateUserAction:withKeysToFetch:].cold.2(v70);
    v38 = 0;
  }

  v7 = v86;
LABEL_45:

  return v38;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setApplicationWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_applicationWorkspace, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v2, v3, "[User Action Curator] cannot get mutable contact to curate action %{public}@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "socialProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v1, v2, "[User Action Curator] could not find curated labeled value %@ saved in %@", v3, v4, v5, v6, 2u);

}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v2, v3, "[User Action Curator] curated action %{public}@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)curateUserAction:(NSObject *)a3 withKeysToFetch:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_1DD140000, a3, OS_LOG_TYPE_ERROR, "[User Action Curator] cannot confirm suggestion, error = %{public}@\n user action = %{public}@: %@", (uint8_t *)&v7, 0x20u);

}

- (void)curateUserAction:(void *)a1 withKeysToFetch:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_1DD140000, v2, v3, "[User Action Curator] cannot curate action to a contact not in database %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
