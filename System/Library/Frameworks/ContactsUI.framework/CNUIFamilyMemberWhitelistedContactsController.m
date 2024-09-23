@implementation CNUIFamilyMemberWhitelistedContactsController

- (CNUIFamilyMemberWhitelistedContactsController)init
{
  CNUIFamilyMemberWhitelistedContactsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CNUIFamilyMemberWhitelistedContactsController *v10;
  CNUIFamilyMemberWhitelistedContactsController *v11;
  uint64_t v12;
  CNSchedulerProvider *schedulerProvider;
  uint64_t v14;
  CNContactStore *familyMemberScopedContactStore;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CNDowntimeWhitelistContainerFetching *v20;
  CNDowntimeWhitelistContainerFetching *downtimeContaienerFetcher;
  void *v22;
  CNUICoreFamilyMemberWhitelistedContactsDataSource *dataSource;
  CNUICoreContactManagementConsentCheck *v24;
  CNUICoreContactManagementConsentCheck *contactManagentConsentCheck;
  CNContactFormatter *v26;
  CNContactFormatter *contactCardWarningFormatter;
  CNUIFamilyMemberWhitelistedContactsController *v28;
  id v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("parameter ‘familyMemberContactsPresentation’ must be nonnull"), 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)CNUIFamilyMemberWhitelistedContactsController;
  v10 = -[CNUIFamilyMemberWhitelistedContactsController init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyMember, a3);
    objc_storeStrong((id *)&v11->_familyMemberContactsPresentation, a4);
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v11->_schedulerProvider;
    v11->_schedulerProvider = (CNSchedulerProvider *)v12;

    if (v11->_familyMember)
    {
      objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      familyMemberScopedContactStore = v11->_familyMemberScopedContactStore;
      v11->_familyMemberScopedContactStore = (CNContactStore *)v14;

      v16 = (void *)MEMORY[0x1E0D13CD0];
      objc_msgSend(MEMORY[0x1E0D13CF0], "iosOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "controllerWithFamilyMember:options:schedulerProvider:", v7, v17, v18);
    }
    else
    {
      v20 = (CNDowntimeWhitelistContainerFetching *)objc_alloc_init(MEMORY[0x1E0C972E0]);
      downtimeContaienerFetcher = v11->_downtimeContaienerFetcher;
      v11->_downtimeContaienerFetcher = v20;

      v22 = (void *)MEMORY[0x1E0D13CE0];
      objc_msgSend(MEMORY[0x1E0D13CF0], "iosOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "controllerWithOptions:schedulerProvider:", v17, v18);
    }
    v19 = objc_claimAutoreleasedReturnValue();
    dataSource = v11->_dataSource;
    v11->_dataSource = (CNUICoreFamilyMemberWhitelistedContactsDataSource *)v19;

    -[CNUICoreFamilyMemberWhitelistedContactsDataSource setObserver:](v11->_dataSource, "setObserver:", v11);
    v24 = (CNUICoreContactManagementConsentCheck *)objc_alloc_init(MEMORY[0x1E0D13CB0]);
    contactManagentConsentCheck = v11->_contactManagentConsentCheck;
    v11->_contactManagentConsentCheck = v24;

    v26 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactCardWarningFormatter = v11->_contactCardWarningFormatter;
    v11->_contactCardWarningFormatter = v26;

    -[CNContactFormatter setIgnoresNickname:](v11->_contactCardWarningFormatter, "setIgnoresNickname:", 1);
    -[CNContactFormatter setIgnoresOrganization:](v11->_contactCardWarningFormatter, "setIgnoresOrganization:", 1);
    -[CNContactFormatter setStyle:](v11->_contactCardWarningFormatter, "setStyle:", 1000);
    v28 = v11;
  }

  return v11;
}

- (CNUIFamilyMemberContactsPresentation)familyMemberContactsPresentation
{
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNUIFamilyMemberWhitelistedContactsController.m"), 99, CFSTR("communication with presentation should only take place on main thread"));

  }
  return self->_familyMemberContactsPresentation;
}

- (int64_t)fetchStatus
{
  void *v2;
  int64_t v3;

  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CNUIFamilyMemberControllerShared contactsUIFetchStatusFromContactsUICoreFetchStatus:](CNUIFamilyMemberControllerShared, "contactsUIFetchStatusFromContactsUICoreFetchStatus:", objc_msgSend(v2, "fetchStatus"));

  return v3;
}

- (NSArray)familyMemberContactItems
{
  void *v2;
  void *v3;
  void *v4;

  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyMemberContactItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_49798);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)familyMemberContactItemsDidChange
{
  id v2;

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyMemberContactsDidChange");

}

- (BOOL)contactManagementEnabled
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D139D8]);
    -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFamilyMember:", v5);

  }
  else
  {
    v6 = 0;
  }

  -[CNUIFamilyMemberWhitelistedContactsController contactManagentConsentCheck](self, "contactManagentConsentCheck");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "contactManagementConsentStateOfDelegateWithInfo:", v6);

  return v8 == 3;
}

- (void)presentDetailsOfFamilyMemberContactItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D13CC0]);
  objc_msgSend(v4, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithContactIdentifier:", v7);
  objc_msgSend(v5, "contactRepresentingItem:", v8);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CNUIFamilyMemberWhitelistedContactsController familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIFamilyMemberControllerShared contactViewControllerForContact:fromStore:](CNUIFamilyMemberControllerShared, "contactViewControllerForContact:fromStore:", v21, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIFamilyMemberWhitelistedContactsController setContactViewControllerPresentingItemDetails:](self, "setContactViewControllerPresentingItemDetails:", v10);
    -[CNUIFamilyMemberWhitelistedContactsController contactViewControllerPresentingItemDetails](self, "contactViewControllerPresentingItemDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[CNUIFamilyMemberWhitelistedContactsController warningMessageForContact:](self, "warningMessageForContact:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberWhitelistedContactsController contactViewControllerPresentingItemDetails](self, "contactViewControllerPresentingItemDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWarningMessage:", v12);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPresentationOfDetailsOfFamilyMemberContactItem_);
    -[CNUIFamilyMemberWhitelistedContactsController contactViewControllerPresentingItemDetails](self, "contactViewControllerPresentingItemDetails");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftBarButtonItem:", v14);

    v17 = objc_alloc(MEMORY[0x1E0DC3A40]);
    -[CNUIFamilyMemberWhitelistedContactsController contactViewControllerPresentingItemDetails](self, "contactViewControllerPresentingItemDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithRootViewController:", v18);

    -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:", v19);

  }
}

- (id)warningMessageForContact:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNUIFamilyMemberWhitelistedContactsController contactCardWarningFormatter](self, "contactCardWarningFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromContact:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_CONTACT_CARD_WARNING"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v12, v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)cancelPresentationOfDetailsOfFamilyMemberContactItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberWhitelistedContactsController contactViewControllerPresentingItemDetails](self, "contactViewControllerPresentingItemDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissPresentedViewController:", v5);

}

- (void)deleteFamilyMemberContactItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D13CC0]);
  objc_msgSend(v4, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithContactIdentifier:", v7);
  objc_msgSend(v5, "contactRepresentingItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWhitelistByRemovingContacts:", v11);

  }
}

- (void)performInteraction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      -[CNUIFamilyMemberWhitelistedContactsController performDefaultInteraction](self, "performDefaultInteraction");
      break;
    case 1:
      -[CNUIFamilyMemberWhitelistedContactsController performAddFromMainContacts](self, "performAddFromMainContacts");
      break;
    case 2:
      -[CNUIFamilyMemberWhitelistedContactsController performAddFromFamilyMemberContacts](self, "performAddFromFamilyMemberContacts");
      break;
    case 3:
      -[CNUIFamilyMemberWhitelistedContactsController performAddNewContact](self, "performAddNewContact");
      break;
    default:
      return;
  }
}

- (void)performDefaultInteraction
{
  void *v3;
  id v4;

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberWhitelistedContactsController generateContactSourceOptionSheet](self, "generateContactSourceOptionSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:", v3);

}

- (id)generateContactSourceOptionSheet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double MidX;
  double MinY;
  void *v9;
  void *v10;
  CGRect v12;
  CGRect v13;

  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberControllerShared addContactsToWhitelistOptionsSheetForFamilyMember:offerChooseFromFamilyMemberContactsOption:delegate:](CNUIFamilyMemberControllerShared, "addContactsToWhitelistOptionsSheetForFamilyMember:offerChooseFromFamilyMemberContactsOption:delegate:", v3, -[CNUIFamilyMemberWhitelistedContactsController contactManagementEnabled](self, "contactManagementEnabled"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberWhitelistedContactsController anchorViewForDefaultInteraction](self, "anchorViewForDefaultInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceView:", v5);

  objc_msgSend(v5, "bounds");
  MidX = CGRectGetMidX(v12);
  objc_msgSend(v5, "bounds");
  MinY = CGRectGetMinY(v13);
  objc_msgSend(v4, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceRect:", MidX, MinY, 0.0, 0.0);

  objc_msgSend(v4, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPermittedArrowDirections:", 2);

  return v4;
}

- (id)anchorViewForDefaultInteraction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNUIFamilyMemberWhitelistedContactsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNUIFamilyMemberWhitelistedContactsController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "whitelistedContactsController:anchorViewForPresentationOfInteraction:", self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "windows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)performAddFromMainContacts
{
  void *v3;

  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CNUIFamilyMemberWhitelistedContactsController performAddFromMainContactsForFamilyMember](self, "performAddFromMainContactsForFamilyMember");
  else
    -[CNUIFamilyMemberWhitelistedContactsController performAddFromMainContactsForThisDevice](self, "performAddFromMainContactsForThisDevice");
}

- (void)performAddFromMainContactsForFamilyMember
{
  CNUIFamilyMemberDowntimeContactPickerController *v3;
  void *v4;
  void *v5;
  CNUIFamilyMemberDowntimeContactPickerController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy](CNUIFamilyMemberContactsEditingStrategy, "whitelistedContactsStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNUIFamilyMemberDowntimeContactPickerController initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:](v3, "initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:", v4, 0, v11, v5, 0);

  -[CNUIFamilyMemberDowntimeContactPickerController setDelegate:](v6, "setDelegate:", self);
  v7 = *MEMORY[0x1E0D137F8];
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactItems](self, "familyMemberContactItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactPickerController setShouldPreselectFamilyMemberContacts:](v6, "setShouldPreselectFamilyMemberContacts:", (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:", v9);

}

- (void)performAddFromMainContactsForThisDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_opt_class();
  -[CNUIFamilyMemberWhitelistedContactsController downtimeContaienerFetcher](self, "downtimeContaienerFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downtimeWhitelistContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPickerWithDelegate:familyMember:parentContainer:", self, 0, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:", v7);

}

- (void)performAddFromFamilyMemberContacts
{
  CNUIFamilyMemberDowntimeContactPickerController *v3;
  void *v4;
  void *v5;
  CNUIFamilyMemberDowntimeContactPickerController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  -[CNUIFamilyMemberWhitelistedContactsController familyMember](self, "familyMember");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy](CNUIFamilyMemberContactsEditingStrategy, "whitelistedContactsStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNUIFamilyMemberDowntimeContactPickerController initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:](v3, "initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:", v4, 0, v11, v5, 1);

  -[CNUIFamilyMemberDowntimeContactPickerController setDelegate:](v6, "setDelegate:", self);
  v7 = *MEMORY[0x1E0D137F8];
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactItems](self, "familyMemberContactItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactPickerController setShouldPreselectFamilyMemberContacts:](v6, "setShouldPreselectFamilyMemberContacts:", (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:", v9);

}

- (void)performAddNewContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIgnoresParentalRestrictions:", 1);
  objc_msgSend(MEMORY[0x1E0D13CD0], "propertyKeysContainingSenstiveData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProhibitedPropertyKeys:", v3);

  objc_msgSend(v9, "setDisplayMode:", 2);
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContactStore:", v4);

  -[CNUIFamilyMemberWhitelistedContactsController downtimeContaienerFetcher](self, "downtimeContaienerFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downtimeWhitelistContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParentContainer:", v6);

  objc_msgSend(v9, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:", v7);

}

- (void)addContactsToWhitelistOptionsSheetDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPresentedViewController:", v4);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dismissPresentedViewController:", v9);
  if (v6 && (objc_msgSend(MEMORY[0x1E0C972D8], "isWhitelistedContact:", v6) & 1) == 0)
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberWhitelistedContactsController addContactsToWhitelist:](self, "addContactsToWhitelist:", v10);

  }
}

- (void)contactViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPresentedViewController:", v6);

  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWhitelistByRemovingContacts:", v9);

}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissPresentedViewController:", v6);
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "presentedViewControllerDidCancel:", v4);
  else
    objc_msgSend(v7, "dismissPresentedViewController:", v4);

}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissPresentedViewController:", v6);

  -[CNUIFamilyMemberWhitelistedContactsController addContactsToWhitelist:](self, "addContactsToWhitelist:", v8);
}

- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4
{
  uint64_t v6;
  unsigned int (*v7)(uint64_t, id);
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = *MEMORY[0x1E0D137F8];
  v7 = *(unsigned int (**)(uint64_t, id))(*MEMORY[0x1E0D137F8] + 16);
  v8 = a3;
  if (!v7(v6, v11))
    -[CNUIFamilyMemberWhitelistedContactsController addContactsToWhitelist:](self, "addContactsToWhitelist:", v11);
  -[CNUIFamilyMemberWhitelistedContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dismissPresentedViewController:", v10);
}

- (void)addContactsToWhitelist:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNUIFamilyMemberWhitelistedContactsController dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWhitelistByAddingContacts:", v4);

}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (CNUIFamilyMemberWhitelistedContactsControllerDelegate)delegate
{
  return (CNUIFamilyMemberWhitelistedContactsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (CNContactFormatter)contactCardWarningFormatter
{
  return self->_contactCardWarningFormatter;
}

- (CNUICoreFamilyMemberWhitelistedContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNUICoreContactManagementConsentCheck)contactManagentConsentCheck
{
  return self->_contactManagentConsentCheck;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContaienerFetcher
{
  return self->_downtimeContaienerFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNContactViewController)contactViewControllerPresentingItemDetails
{
  return (CNContactViewController *)objc_loadWeakRetained((id *)&self->_contactViewControllerPresentingItemDetails);
}

- (void)setContactViewControllerPresentingItemDetails:(id)a3
{
  objc_storeWeak((id *)&self->_contactViewControllerPresentingItemDetails, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactViewControllerPresentingItemDetails);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContaienerFetcher, 0);
  objc_storeStrong((id *)&self->_contactManagentConsentCheck, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactCardWarningFormatter, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsPresentation, 0);
}

+ (id)contactPickerWithDelegate:(id)a3 familyMember:(id)a4 parentContainer:(id)a5
{
  id v7;
  id v8;
  id v9;
  CNContactPickerViewController *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setMode:](v10, "setMode:", 2);
  objc_msgSend(MEMORY[0x1E0D13CD0], "propertyKeysContainingSenstiveData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setProhibitedPropertyKeys:](v10, "setProhibitedPropertyKeys:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setPredicateForSelectionOfContact:](v10, "setPredicateForSelectionOfContact:", v12);

  -[CNContactPickerViewController setDelegate:](v10, "setDelegate:", v9);
  -[CNContactPickerViewController setFamilyMember:](v10, "setFamilyMember:", v8);

  -[CNContactPickerViewController setParentContainer:](v10, "setParentContainer:", v7);
  return v10;
}

@end
