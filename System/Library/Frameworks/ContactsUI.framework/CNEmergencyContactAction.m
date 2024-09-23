@implementation CNEmergencyContactAction

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setAddingToEmergency:(BOOL)a3
{
  self->_addingToEmergency = a3;
}

- (CNEmergencyContactAction)initWithContact:(id)a3 healthStoreManager:(id)a4 propertyItems:(id)a5
{
  id v9;
  CNEmergencyContactAction *v10;
  CNEmergencyContactAction *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CNScheduler *mainThreadScheduler;
  void *v16;
  void *v17;
  uint64_t v18;
  CNScheduler *workQueue;
  CNEmergencyContactAction *v20;
  objc_super v22;

  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CNEmergencyContactAction;
  v10 = -[CNPropertyAction initWithContact:propertyItems:](&v22, sel_initWithContact_propertyItems_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_healthStoreManager, a4);
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultSchedulerProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mainThreadScheduler");
    v14 = objc_claimAutoreleasedReturnValue();
    mainThreadScheduler = v11->_mainThreadScheduler;
    v11->_mainThreadScheduler = (CNScheduler *)v14;

    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultSchedulerProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "newSerialSchedulerWithName:", CFSTR("com.apple.Contacts.CNEmergencyContactAction.workQueue"));
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v18;

    v20 = v11;
  }

  return v11;
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction setContactProperty:](self, "setContactProperty:", v8);

  if (-[CNEmergencyContactAction addingToEmergency](self, "addingToEmergency"))
  {
    objc_msgSend(v6, "contactProperty");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNEmergencyContactAction showRelationshipPickerForContactProperty:sender:](self, "showRelationshipPickerForContactProperty:sender:", v9, v7);

  }
  else
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__CNEmergencyContactAction_performActionForItem_sender___block_invoke;
    v10[3] = &unk_1E204F910;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    -[CNEmergencyContactAction showConfirmRemoveAlertWithSender:completion:](self, "showConfirmRemoveAlertWithSender:completion:", v7, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)performActionWithContactProperty:(id)a3 relationship:(id)a4
{
  id v6;
  id v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[CNEmergencyContactAction addingToEmergency](self, "addingToEmergency"))
  {
    v8 = (Class)get_HKEmergencyContactClass[0]();
    objc_msgSend(v6, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class emergencyContactWithContact:property:](v8, "emergencyContactWithContact:property:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setRelationship:", v7);
    -[CNEmergencyContactAction workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke;
    v16[3] = &unk_1E2050400;
    v16[4] = self;
    v17 = v10;
    v12 = v10;
    objc_msgSend(v11, "performBlock:", v16);

  }
  else
  {
    -[CNEmergencyContactAction healthStoreManager](self, "healthStoreManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3_209;
    v15[3] = &unk_1E204CBE8;
    v15[4] = self;
    v14 = (id)objc_msgSend(v13, "registerMedicalIDDataHandler:", v15);

  }
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CNEmergencyContactAction addingToEmergency](self, "addingToEmergency")
    && (-[CNPropertyAction propertyItems](self, "propertyItems"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 != 1))
  {
    -[CNEmergencyContactAction presentDisambiguationAlertWithSender:](self, "presentDisambiguationAlertWithSender:", v7);
  }
  else
  {
    -[CNPropertyAction propertyItem](self, "propertyItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNEmergencyContactAction performActionForItem:sender:](self, "performActionForItem:sender:", v6, v7);

  }
}

- (void)showHKMedicalIDViewControllerForMedicalID:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (Class (__cdecl *)())getHKMedicalIDViewControllerClass_39354;
  v5 = a3;
  v10 = (id)objc_msgSend(objc_alloc(v4()), "initInEditMode:", 1);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setAllowsEditing:", 1);
  objc_msgSend(v10, "setShowsDismissButton:", 1);
  objc_msgSend(v10, "setMedicalID:", v5);

  -[CNEmergencyContactAction healthStoreManager](self, "healthStoreManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHealthStore:", v7);

  objc_msgSend(v10, "setShowsDeleteButton:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
  -[CNContactAction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:presentViewController:sender:", self, v8, 0);

}

- (void)showMIUIMedicalIDViewControllerForMedicalID:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (Class (__cdecl *)())getMIUIDisplayConfigurationClass_39339;
  v5 = a3;
  -[objc_class standardConfiguration](v4(), "standardConfiguration");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEntryPoint:", 1);
  v6 = objc_alloc(getMIUIMedicalIDViewControllerClass_39342());
  -[CNEmergencyContactAction healthStoreManager](self, "healthStoreManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithHealthStore:medicalIDData:displayConfiguration:", v8, v5, v15);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  -[CNEmergencyContactAction setMedicalIDNavigationController:](self, "setMedicalIDNavigationController:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissMedicalID);
  objc_msgSend(v9, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  -[CNContactAction delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction medicalIDNavigationController](self, "medicalIDNavigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "action:presentViewController:sender:", self, v14, 0);

}

- (void)createMedicalIDWithEmergencyContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNEmergencyContactAction contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNHealthStoreManager descriptorForRequiredKeys](CNHealthStoreManager, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  -[CNEmergencyContactAction healthStoreManager](self, "healthStoreManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createMedicalIDFromContact:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setEmergencyContacts:", v12);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "featureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v14, "isFeatureEnabled:", 10);

  if ((_DWORD)v9)
    -[CNEmergencyContactAction showMIUIMedicalIDViewControllerForMedicalID:](self, "showMIUIMedicalIDViewControllerForMedicalID:", v11);
  else
    -[CNEmergencyContactAction showHKMedicalIDViewControllerForMedicalID:](self, "showHKMedicalIDViewControllerForMedicalID:", v11);

}

- (void)presentDisambiguationAlertWithSender:(id)a3
{
  id v4;
  CNUINavigationListViewController *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(CNUINavigationListViewController);
  -[CNEmergencyContactAction setListController:](self, "setListController:", v5);

  -[CNEmergencyContactAction listController](self, "listController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[CNEmergencyContactAction listController](self, "listController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentAlignment:", 1);

  -[CNEmergencyContactAction listController](self, "listController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShowFirstSectionTopSeparator:", 1);

  v9 = (void *)MEMORY[0x1E0C99D20];
  -[CNPropertyAction propertyItems](self, "propertyItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_map:", &__block_literal_global_221);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNEmergencyContactAction listController](self, "listController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItems:", v12);

  v14 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_ADD_SHEET_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", 0, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction setAlertController:](self, "setAlertController:", v17);

  -[CNEmergencyContactAction listController](self, "listController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction alertController](self, "alertController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentViewController:", v18);

  objc_initWeak(&location, self);
  -[CNEmergencyContactAction alertController](self, "alertController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke_2;
  v30 = &unk_1E204CC50;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v24, v27, v28, v29, v30);

  -[CNContactAction delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction alertController](self, "alertController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "action:presentViewController:sender:", self, v26, v4);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)showConfirmRemoveAlertWithSender:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id location;
  _QWORD v36[4];
  id v37;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C97218];
  -[CNEmergencyContactAction contactProperty](self, "contactProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromContact:style:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v6;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    -[CNEmergencyContactAction contactProperty](self, "contactProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "formattedStringValue");
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  v15 = (void *)MEMORY[0x1E0DC3450];
  v16 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_REMOVE_SHEET_TITLE-%@"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", 0, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_REMOVE"), &stru_1E20507A8, CFSTR("Localized"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke;
  v36[3] = &unk_1E204E498;
  v25 = v7;
  v37 = v25;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 2, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v26);

  objc_initWeak(&location, self);
  v27 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v24;
  v33[1] = 3221225472;
  v33[2] = __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke_2;
  v33[3] = &unk_1E204CC50;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAction:", v30);

  -[CNContactAction delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "action:presentViewController:sender:", self, v20, v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (void)showRelationshipPickerForContactProperty:(id)a3 sender:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = *MEMORY[0x1E0C96840];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNCardPropertyGroup groupForProperty:contact:store:policy:linkedPolicies:](CNCardPropertyGroup, "groupForProperty:contact:store:policy:linkedPolicies:", v6, v9, 0, 0, 0);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v8, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "labeledValueWithLabel:value:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupItem, "propertyGroupItemWithLabeledValue:group:contact:", v12, v20, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[CNLabelPickerController initForPropertyItem:]([CNLabelPickerController alloc], "initForPropertyItem:", v14);
  objc_msgSend(v15, "setDelegate:", self);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v15);
  objc_msgSend(v16, "setDelegate:", self);
  CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_RELATIONSHIP_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v18);

  -[CNEmergencyContactAction setContactProperty:](self, "setContactProperty:", v8);
  -[CNContactAction delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "action:presentViewController:sender:", self, v16, v7);

}

- (void)navigationListController:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[CNEmergencyContactAction alertController](self, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__CNEmergencyContactAction_navigationListController_didSelectItem___block_invoke;
  v10[3] = &unk_1E204F910;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CNEmergencyContactAction_picker_didPickItem___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)pickerDidCancel:(id)a3
{
  id v4;

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CNContactAction delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWasCanceled:", self);

}

- (void)dismissMedicalID
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNEmergencyContactAction medicalIDNavigationController](self, "medicalIDNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action:dismissViewController:sender:", self, v5, self);

  -[CNEmergencyContactAction setMedicalIDNavigationController:](self, "setMedicalIDNavigationController:", 0);
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWasCanceled:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "action:dismissViewController:sender:", self, v6, self);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (BOOL)addingToEmergency
{
  return self->_addingToEmergency;
}

- (CNHealthStoreManager)healthStoreManager
{
  return self->_healthStoreManager;
}

- (void)setHealthStoreManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthStoreManager, a3);
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

- (void)setContactProperty:(id)a3
{
  objc_storeStrong((id *)&self->_contactProperty, a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (CNUINavigationListViewController)listController
{
  return self->_listController;
}

- (void)setListController:(id)a3
{
  objc_storeStrong((id *)&self->_listController, a3);
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (void)setMainThreadScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_mainThreadScheduler, a3);
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (void)setMedicalIDNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_listController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
  objc_storeStrong((id *)&self->_healthStoreManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

void __47__CNEmergencyContactAction_picker_didPickItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "contactProperty");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionWithContactProperty:relationship:", v3, *(_QWORD *)(a1 + 40));

}

void __67__CNEmergencyContactAction_navigationListController_didSelectItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlertController:", 0);
  objc_msgSend(WeakRetained, "setListController:", 0);
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    objc_msgSend(WeakRetained, "showRelationshipPickerForContactProperty:sender:", v4, 0);

}

uint64_t __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__CNEmergencyContactAction_showConfirmRemoveAlertWithSender_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionWasCanceled:", WeakRetained);

}

void __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionWasCanceled:", WeakRetained);

  objc_msgSend(WeakRetained, "setAlertController:", 0);
}

id __65__CNEmergencyContactAction_presentDisambiguationAlertWithSender___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "contactProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUINavigationListItem navigationListItemForContactProperty:](CNUINavigationListItem, "navigationListItemForContactProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[5];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "healthStoreManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medicalIDStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "medicalIDSetUpStatus");

  v5 = MEMORY[0x1E0C809B0];
  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "mainThreadScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2;
    v14[3] = &unk_1E2050400;
    v7 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v7;
    objc_msgSend(v6, "performBlock:", v14);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "healthStoreManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "medicalIDStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3;
  v11[3] = &unk_1E204CBC0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v9, "addEmergencyContact:completion:", v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3_209(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "healthStoreManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterHandlerForToken:", v6);

  objc_msgSend(v5, "emergencyContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNHealthStoreManager emergencyContactMatchingContact:](CNHealthStoreManager, "emergencyContactMatchingContact:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_firstObjectPassingTest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "healthStoreManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "medicalIDStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4_211;
  v14[3] = &unk_1E204CBC0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "removeEmergencyContact:completion:", v11, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4_211(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "mainThreadScheduler");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_212;
    v9[3] = &unk_1E204F648;
    v9[4] = v7;
    -[NSObject performBlock:](v8, "performBlock:", v9);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to delete Medical ID: %@", buf, 0xCu);
    }
  }

}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_212(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", *(_QWORD *)(a1 + 32));

}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createMedicalIDWithEmergencyContact:", *(_QWORD *)(a1 + 40));
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "healthStoreManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "medicalIDStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4;
    v27[3] = &unk_1E204CB98;
    v27[4] = v7;
    objc_msgSend(v9, "fetchMedicalIDDataWithCompletion:", v27);

  }
  else
  {
    v10 = objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 130);
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "User has reached maximum number of emergency contacts: %@", buf, 0xCu);
      }

      CNContactsUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_MAXIMUM_CONTACTS_REACHED_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      CNContactsUIBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_MAXIMUM_CONTACTS_REACHED_BODY"), &stru_1E20507A8, CFSTR("Localized"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlertController:", v17);

    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v29 = v5;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Received an error that we do not handle: %@", buf, 0xCu);
      }

      CNContactsUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CARD_ACTION_EMERGENCY_CONTACT_NOT_ADDED_ERROR_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlertController:", v16);
    }

    objc_msgSend(v7, "alertController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_205;
    v26[3] = &unk_1E204F7F0;
    v26[4] = v7;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:", v24);

    objc_msgSend(v7, "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v23;
    v25[1] = 3221225472;
    v25[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2_207;
    v25[3] = &unk_1E204F648;
    v25[4] = v7;
    objc_msgSend(v8, "performBlock:", v25);
  }

}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "mainThreadScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_188;
    v9[3] = &unk_1E2050400;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    objc_msgSend(v7, "performBlock:", v9);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch Medical ID to display edit view: %@", buf, 0xCu);
    }

  }
}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_205(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlertController:", 0);
}

void __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_2_207(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action:presentViewController:sender:", v2, v3, *(_QWORD *)(a1 + 32));

}

uint64_t __74__CNEmergencyContactAction_performActionWithContactProperty_relationship___block_invoke_188(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 10);

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v4)
    return objc_msgSend(v5, "showMIUIMedicalIDViewControllerForMedicalID:", v6);
  else
    return objc_msgSend(v5, "showHKMedicalIDViewControllerForMedicalID:", v6);
}

void __56__CNEmergencyContactAction_performActionForItem_sender___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "contactProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "performActionWithContactProperty:relationship:", v2, 0);

}

+ (id)log
{
  if (log_cn_once_token_4_39382 != -1)
    dispatch_once(&log_cn_once_token_4_39382, &__block_literal_global_39383);
  return (id)log_cn_once_object_4_39384;
}

void __31__CNEmergencyContactAction_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNEmergencyContactAction");
  v1 = (void *)log_cn_once_object_4_39384;
  log_cn_once_object_4_39384 = (uint64_t)v0;

}

@end
