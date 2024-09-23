@implementation CNContactListActionHelper

- (CNContactListActionHelper)initWithContactStore:(id)a3 environment:(id)a4 contactFormatter:(id)a5 undoManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNContactListActionHelper *v14;
  CNContactListActionExecutor *v15;
  CNContactListActionExecutor *actionExecutor;
  CNContactListActionConfiguration *v17;
  CNContactListActionConfiguration *actionConfiguration;
  CNContactViewCache *v19;
  CNContactListActionHelper *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNContactListActionHelper;
  v14 = -[CNContactListActionHelper init](&v22, sel_init);
  if (v14)
  {
    v15 = -[CNContactListActionExecutor initWithUndoManager:]([CNContactListActionExecutor alloc], "initWithUndoManager:", v13);
    actionExecutor = v14->_actionExecutor;
    v14->_actionExecutor = v15;

    v17 = objc_alloc_init(CNContactListActionConfiguration);
    actionConfiguration = v14->_actionConfiguration;
    v14->_actionConfiguration = v17;

    -[CNContactListActionConfiguration setContactStore:](v14->_actionConfiguration, "setContactStore:", v10);
    -[CNContactListActionConfiguration setEnvironment:](v14->_actionConfiguration, "setEnvironment:", v11);
    -[CNContactListActionConfiguration setContactFormatter:](v14->_actionConfiguration, "setContactFormatter:", v12);
    v19 = objc_alloc_init(CNContactViewCache);
    -[CNContactListActionConfiguration setContactViewCache:](v14->_actionConfiguration, "setContactViewCache:", v19);

    v20 = v14;
  }

  return v14;
}

- (id)searchMenuActionProviderForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CNActionMenuHelper *v8;
  CNActionMenuHelper *actionMenuHelper;
  CNContactOrbActionsController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if (!self->_actionMenuHelper)
    {
      v8 = objc_alloc_init(CNActionMenuHelper);
      actionMenuHelper = self->_actionMenuHelper;
      self->_actionMenuHelper = v8;

    }
    v10 = -[CNContactOrbActionsController initWithContact:]([CNContactOrbActionsController alloc], "initWithContact:", v7);
    -[CNContactListActionHelper setContactActionsController:](self, "setContactActionsController:", v10);

    -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentAvailableMenuItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactListActionHelper delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contextMenuInteraction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateWithMenuItems:contextMenuInteraction:", v14, v17);

      }
    }
    -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configurationActionProviderWithActionBlock:", &__block_literal_global_53_62469);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)willDismissMenu
{
  id v2;

  -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willDismissMenu");

}

- (void)willDisplayMenuWithContextMenuInteraction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDisplayMenuWithContextMenuInteraction:", v4);

}

- (id)actionsForContacts:(id)a3 dataSourceFilter:(id)a4 sourceView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];
  id v78;
  _QWORD v79[4];
  id v80;
  CNContactListActionHelper *v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[2];
  uint8_t buf[4];
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v72 = a5;
  v9 = a4;
  -[CNContactListActionHelper setContacts:](self, "setContacts:", v8);
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContactStoreFilter:", v9);

  if (-[CNContactListActionHelper canShowContactActionsForContacts:](self, "canShowContactActionsForContacts:", v8))
  {
    objc_opt_class();
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      -[CNContactListActionHelper contactActionsMenuForContact:](self, "contactActionsMenuForContact:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "firstObject");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v91 = v69;
        _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Attempted to orb non-contact: %@", buf, 0xCu);

      }
      v15 = MEMORY[0x1E0C9AA60];
    }
    v70 = (void *)v15;

  }
  else
  {
    v70 = (void *)MEMORY[0x1E0C9AA60];
  }
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LIST_MENU_ACTION_COPY_CARD"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke;
  v87[3] = &unk_1E20504A8;
  v87[4] = self;
  v22 = v8;
  v88 = v22;
  v74 = (void *)v18;
  objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v18, v20, 0, v87);
  v23 = objc_claimAutoreleasedReturnValue();

  CNContactsUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("LIST_MENU_ACTION_SHARE_CARD"), &stru_1E20507A8, CFSTR("Localized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v21;
  v84[1] = 3221225472;
  v84[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_2;
  v84[3] = &unk_1E20504D0;
  v84[4] = self;
  v28 = v22;
  v85 = v28;
  v71 = v72;
  v86 = v71;
  objc_msgSend(v26, "actionWithTitle:image:identifier:handler:", v25, v27, 0, v84);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0DC39D0];
  v73 = (void *)v23;
  v89[0] = v23;
  v89[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "menuWithTitle:image:identifier:options:children:", &stru_1E20507A8, 0, 0, 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "arrayByAddingObject:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CNContactListActionHelper includesEditingActions](self, "includesEditingActions"))
  {
    if (-[CNContactListActionHelper canShowMergeActionForContacts:](self, "canShowMergeActionForContacts:", v28))
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_MERGE_CARDS_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringWithFormat:", v36, objc_msgSend(v28, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.triangle.merge"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_3;
      v82[3] = &unk_1E20504A8;
      v82[4] = self;
      v83 = v28;
      objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v37, v39, 0, v82);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = (void *)MEMORY[0x1E0C9AA60];
    }
    v42 = v25;
    if (-[CNContactListActionHelper canShowSetAsMyCardActionForContacts:](self, "canShowSetAsMyCardActionForContacts:", v28))
    {
      v43 = (void *)MEMORY[0x1E0CB3940];
      CNContactsUIBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("LIST_MENU_ACTION_MY_CARD"), &stru_1E20507A8, CFSTR("Localized"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringWithFormat:", v45, objc_msgSend(v28, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_4;
      v79[3] = &unk_1E20504A8;
      v80 = v28;
      v81 = self;
      objc_msgSend(v47, "actionWithTitle:image:identifier:handler:", v46, v48, 0, v79);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "arrayByAddingObject:", v49);
      v50 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v50;
    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E20507A8, 0, 0, 1, v41);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "arrayByAddingObject:", v51);
      v52 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v52;
    }
    if (-[CNContactListActionHelper canRemoveFromGroup](self, "canRemoveFromGroup"))
    {
      CNContactsUIBundle();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("LIST_ACTION_ALERT_ACTION_REMOVE_FROM_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_5;
      v77[3] = &unk_1E20504A8;
      v77[4] = self;
      v78 = v28;
      objc_msgSend(v55, "actionWithTitle:image:identifier:handler:", v54, v56, 0, v77);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v57, "setAttributes:", 2);
      objc_msgSend(v33, "arrayByAddingObject:", v57);
      v58 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v58;
    }
    v25 = v42;
    if (-[CNContactListActionHelper canShowDeleteAction](self, "canShowDeleteAction"))
    {
      if ((unint64_t)objc_msgSend(v28, "count") < 2)
      {
        CNContactsUIBundle();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_DELETE_CARD"), &stru_1E20507A8, CFSTR("Localized"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = (void *)MEMORY[0x1E0CB3940];
        CNContactsUIBundle();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_DELETE_CARD_MULTIPLE"), &stru_1E20507A8, CFSTR("Localized"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringWithFormat:", v61, objc_msgSend(v28, "count"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v63 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_6;
      v75[3] = &unk_1E20504A8;
      v75[4] = self;
      v76 = v28;
      objc_msgSend(v63, "actionWithTitle:image:identifier:handler:", v62, v64, 0, v75);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "setAttributes:", 2);
      objc_msgSend(v33, "arrayByAddingObject:", v65);
      v66 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v66;
      v25 = v42;
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x1E0C9AA60];
  }
  v67 = v33;

  return v67;
}

- (id)trailingSwipeActionsForContact:(id)a3 dataSourceFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  CNContactListActionHelper *v19;
  id v20;

  v6 = a3;
  if (v6
    && (v7 = a4,
        -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "setContactStoreFilter:", v7),
        v7,
        v8,
        -[CNContactListActionHelper canRemoveFromGroup](self, "canRemoveFromGroup")))
  {
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LIST_SWIPE_ACTION_REMOVE_FROM_GROUP"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC36C8];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __77__CNContactListActionHelper_trailingSwipeActionsForContact_dataSourceFilter___block_invoke;
    v18 = &unk_1E20504F8;
    v19 = self;
    v20 = v6;
    objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 1, v10, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v12, v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (void)removeContactsFromGroup:(id)a3 withConfirmation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CNContactListRemoveContactsFromGroupAction *v7;
  void *v8;
  void *v9;
  CNContactListRemoveContactsFromGroupAction *v10;

  v4 = a4;
  v6 = a3;
  v7 = [CNContactListRemoveContactsFromGroupAction alloc];
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactListRemoveContactsFromGroupAction initWithContacts:configuration:withConfirmation:](v7, "initWithContacts:configuration:withConfirmation:", v6, v8, v4);

  -[CNContactListAction setDelegate:](v10, "setDelegate:", self);
  -[CNContactListActionHelper actionExecutor](self, "actionExecutor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeUndoableAction:", v10);

}

- (BOOL)canRemoveFromGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[CNContactListActionHelper includesEditingActions](self, "includesEditingActions"))
    return 0;
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactStoreFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "groupIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v4, "containerIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)shareContacts:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNContactListShareContactsAction *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[CNContactListShareContactsAction initWithContacts:sourceView:]([CNContactListShareContactsAction alloc], "initWithContacts:sourceView:", v7, v6);

  -[CNContactListShareContactsAction setDelegate:](v9, "setDelegate:", self);
  -[CNContactListActionHelper actionExecutor](self, "actionExecutor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeAction:", v9);

}

- (BOOL)canShowDeleteAction
{
  CNContactListActionHelper *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[CNContactListActionHelper contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CNContactListActionHelper_canShowDeleteAction__block_invoke;
  v5[3] = &unk_1E2050520;
  v5[4] = v2;
  LODWORD(v2) = objc_msgSend(v3, "_cn_any:", v5) ^ 1;

  return (char)v2;
}

- (void)deleteContacts:(id)a3
{
  id v4;
  CNContactListDeleteContactsAction *v5;
  void *v6;
  void *v7;
  CNContactListDeleteContactsAction *v8;

  v4 = a3;
  v5 = [CNContactListDeleteContactsAction alloc];
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactListDeleteContactsAction initWithContacts:configuration:](v5, "initWithContacts:configuration:", v4, v6);

  -[CNContactListAction setDelegate:](v8, "setDelegate:", self);
  -[CNContactListActionHelper actionExecutor](self, "actionExecutor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeUndoableAction:", v8);

}

- (void)deleteContacts:(id)a3 dataSourceFilter:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactStoreFilter:", v6);

  -[CNContactListActionHelper deleteContacts:](self, "deleteContacts:", v8);
}

- (void)mergeContacts:(id)a3
{
  id v4;
  CNContactListMergeAction *v5;
  void *v6;
  void *v7;
  CNContactListMergeAction *v8;

  v4 = a3;
  v5 = [CNContactListMergeAction alloc];
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactListAction initWithContacts:configuration:](v5, "initWithContacts:configuration:", v4, v6);

  -[CNContactListAction setDelegate:](v8, "setDelegate:", self);
  -[CNContactListActionHelper actionExecutor](self, "actionExecutor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeUndoableAction:", v8);

}

- (BOOL)canShowMergeActionForContacts:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "count") > 1;
}

- (void)updateMeContact:(id)a3
{
  id v4;
  CNContactListSetMyCardAction *v5;
  void *v6;
  void *v7;
  CNContactListSetMyCardAction *v8;

  v4 = a3;
  v5 = [CNContactListSetMyCardAction alloc];
  -[CNContactListActionHelper actionConfiguration](self, "actionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactListSetMyCardAction initWithContact:configuration:](v5, "initWithContact:configuration:", v4, v6);

  -[CNContactListAction setDelegate:](v8, "setDelegate:", self);
  -[CNContactListActionHelper actionExecutor](self, "actionExecutor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeUndoableAction:", v8);

}

- (BOOL)canShowSetAsMyCardActionForContacts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMeContact:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)copyContacts:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CNContactListActionHelper_copyContacts___block_invoke;
  v5[3] = &unk_1E2050548;
  v5[4] = self;
  objc_msgSend(a3, "_cn_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemProviders:", v3);

}

- (id)contactActionsMenuForContact:(id)a3
{
  id v4;
  CNContactOrbActionsController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[CNContactOrbActionsController initWithContact:]([CNContactOrbActionsController alloc], "initWithContact:", v4);

  -[CNContactListActionHelper setContactActionsController:](self, "setContactActionsController:", v5);
  -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[CNContactListActionHelper contactActionsController](self, "contactActionsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAvailableMenuItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CNContactListActionHelper contactActionsMenuFromItems:](self, "contactActionsMenuFromItems:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contactActionsMenuFromItems:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E20507A8, 0, CFSTR("CNContactListActionHelperOrbMenuIdentifier"), 1, a3);
}

- (BOOL)canShowContactActionsForContacts:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CNContactListActionHelper includesContactOrbActions](self, "includesContactOrbActions"))
    v5 = objc_msgSend(v4, "count") == 1;
  else
    v5 = 0;

  return v5;
}

- (void)action:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactListActionHelper delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action:presentViewController:", v7, v6);

}

- (void)actionDidFinish:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactListActionHelper delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", v4);

}

- (id)presentingViewControllerForActions
{
  void *v2;
  void *v3;

  -[CNContactListActionHelper delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewControllerForActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactListActionHelper actionMenuHelper](self, "actionMenuHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListActionHelper delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextMenuInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWithMenuItems:contextMenuInteraction:", v5, v9);

LABEL_5:
    goto LABEL_6;
  }
  -[CNContactListActionHelper delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CNContactListActionHelper contactActionsMenuFromItems:](self, "contactActionsMenuFromItems:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListActionHelper delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "listActionHelper:didUpdateWithMenu:", self, v13);

    goto LABEL_5;
  }
LABEL_6:

}

- (CNContactListActionHelperDelegate)delegate
{
  return (CNContactListActionHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactListActionConfiguration)actionConfiguration
{
  return self->_actionConfiguration;
}

- (void)setActionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_actionConfiguration, a3);
}

- (BOOL)includesContactOrbActions
{
  return self->_includesContactOrbActions;
}

- (void)setIncludesContactOrbActions:(BOOL)a3
{
  self->_includesContactOrbActions = a3;
}

- (BOOL)includesEditingActions
{
  return self->_includesEditingActions;
}

- (void)setIncludesEditingActions:(BOOL)a3
{
  self->_includesEditingActions = a3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (CNContactListActionExecutor)actionExecutor
{
  return self->_actionExecutor;
}

- (void)setActionExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_actionExecutor, a3);
}

- (CNContactOrbActionsController)contactActionsController
{
  return self->_contactActionsController;
}

- (void)setContactActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactActionsController, a3);
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_contactActionsController, 0);
  objc_storeStrong((id *)&self->_actionExecutor, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_actionConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __42__CNContactListActionHelper_copyContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIDraggingContacts itemProviderForContact:withContactStore:](CNUIDraggingContacts, "itemProviderForContact:withContactStore:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUIVCardUtilities fileNameForContact:](CNUIVCardUtilities, "fileNameForContact:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSuggestedName:", v7);
  return v6;
}

uint64_t __48__CNContactListActionHelper_canShowDeleteAction__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactViewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policyForContact:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isReadonly");
  return v7;
}

void __77__CNContactListActionHelper_trailingSwipeActionsForContact_dataSourceFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeContactsFromGroup:withConfirmation:", v7, 0, v8, v9);

  v6[2](v6, 1);
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copyContacts:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shareContacts:sourceView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeContacts:", *(_QWORD *)(a1 + 40));
}

void __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "updateMeContact:", v2);

}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeContactsFromGroup:withConfirmation:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteContacts:", *(_QWORD *)(a1 + 40));
}

+ (id)log
{
  if (log_cn_once_token_3_62478 != -1)
    dispatch_once(&log_cn_once_token_3_62478, &__block_literal_global_40_62479);
  return (id)log_cn_once_object_3_62480;
}

+ (id)descriptorForRequiredKeysForMultiSelectAction:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97200];
  +[CNContactListDeleteContactsAction descriptorForRequiredKeys](CNContactListDeleteContactsAction, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactListShareContactsAction descriptorForRequiredKeys](CNContactListShareContactsAction, "descriptorForRequiredKeys", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNContactListMergeAction descriptorForRequiredKeys](CNContactListMergeAction, "descriptorForRequiredKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptorWithKeyDescriptors:description:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __32__CNContactListActionHelper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactListActionHelper");
  v1 = (void *)log_cn_once_object_3_62480;
  log_cn_once_object_3_62480 = (uint64_t)v0;

}

@end
