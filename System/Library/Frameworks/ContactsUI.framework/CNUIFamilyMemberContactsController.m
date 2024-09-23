@implementation CNUIFamilyMemberContactsController

- (CNUIFamilyMemberContactsController)init
{
  CNUIFamilyMemberContactsController *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIFamilyMemberContactsController)initWithFamilyMember:(id)a3 familyMemberContactsPresentation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CNUIFamilyMemberContactsController *v10;
  CNUIFamilyMemberContactsController *v11;
  uint64_t v12;
  CNContactStore *familyMemberScopedContactStore;
  uint64_t v14;
  CNSchedulerProvider *schedulerProvider;
  uint64_t v16;
  CNUICoreFamilyMemberContactsDataSource *dataSource;
  CNUIFamilyMemberContactsController *v18;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("parameter ‘familyMember’ must be nonnull");
    goto LABEL_8;
  }
  v9 = v8;
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("parameter ‘familyMemberContactsPresentation’ must be nonnull");
LABEL_8:
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v24.receiver = self;
  v24.super_class = (Class)CNUIFamilyMemberContactsController;
  v10 = -[CNUIFamilyMemberContactsController init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyMember, a3);
    objc_storeStrong((id *)&v11->_familyMemberContactsPresentation, a4);
    objc_msgSend(MEMORY[0x1E0C97298], "storeForFamilyMember:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    familyMemberScopedContactStore = v11->_familyMemberScopedContactStore;
    v11->_familyMemberScopedContactStore = (CNContactStore *)v12;

    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v11->_schedulerProvider;
    v11->_schedulerProvider = (CNSchedulerProvider *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13CC8]), "initWithFamilyMember:schedulerProvider:", v7, v11->_schedulerProvider);
    dataSource = v11->_dataSource;
    v11->_dataSource = (CNUICoreFamilyMemberContactsDataSource *)v16;

    -[CNUICoreFamilyMemberContactsDataSource setObserver:](v11->_dataSource, "setObserver:", v11);
    v18 = v11;
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
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNUIFamilyMemberContactsController.m"), 70, CFSTR("communication with presentation should only take place on main thread"));

  }
  return self->_familyMemberContactsPresentation;
}

- (int64_t)fetchStatus
{
  void *v2;
  int64_t v3;

  -[CNUIFamilyMemberContactsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CNUIFamilyMemberControllerShared contactsUIFetchStatusFromContactsUICoreFetchStatus:](CNUIFamilyMemberControllerShared, "contactsUIFetchStatusFromContactsUICoreFetchStatus:", objc_msgSend(v2, "fetchStatus"));

  return v3;
}

- (int64_t)countOfFamilyMemberContacts
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CNUIFamilyMemberContactsController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countOfFamilyMemberContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)familyMemberContactItemsDidChange
{
  id v2;

  -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "familyMemberContactsDidChange");

}

- (void)performInteraction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      -[CNUIFamilyMemberContactsController performDefaultInteraction](self, "performDefaultInteraction");
      break;
    case 1:
      -[CNUIFamilyMemberContactsController performAddContactsInteraction](self, "performAddContactsInteraction");
      break;
    case 2:
      -[CNUIFamilyMemberContactsController performAddFromMainContactsInteraction](self, "performAddFromMainContactsInteraction");
      break;
    case 3:
      -[CNUIFamilyMemberContactsController performDisplayContactsInteraction](self, "performDisplayContactsInteraction");
      break;
    default:
      return;
  }
}

- (void)performDefaultInteraction
{
  if (-[CNUIFamilyMemberContactsController fetchStatus](self, "fetchStatus") == 2
    && -[CNUIFamilyMemberContactsController countOfFamilyMemberContacts](self, "countOfFamilyMemberContacts") >= 1)
  {
    -[CNUIFamilyMemberContactsController performDisplayContactsInteraction](self, "performDisplayContactsInteraction");
  }
  else
  {
    -[CNUIFamilyMemberContactsController performAddContactsInteraction](self, "performAddContactsInteraction");
  }
}

- (void)performDisplayContactsInteraction
{
  void *v3;
  void *v4;
  void *v5;
  CNContactPickerViewController *v6;

  v6 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setDelegate:](v6, "setDelegate:", self);
  -[CNContactPickerViewController setMode:](v6, "setMode:", 2);
  -[CNContactPickerViewController setAllowsEditing:](v6, "setAllowsEditing:", 1);
  -[CNContactPickerViewController setAllowsDeletion:](v6, "setAllowsDeletion:", 1);
  -[CNContactPickerViewController setAllowsCancel:](v6, "setAllowsCancel:", 0);
  -[CNContactPickerViewController setAllowsDone:](v6, "setAllowsDone:", 1);
  -[CNContactPickerViewController setIgnoresParentalRestrictions:](v6, "setIgnoresParentalRestrictions:", 1);
  -[CNUIFamilyMemberContactsController familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setFamilyMember:](v6, "setFamilyMember:", v3);

  objc_msgSend(MEMORY[0x1E0D13CC8], "propertyKeysContainingSenstiveData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPickerViewController setProhibitedPropertyKeys:](v6, "setProhibitedPropertyKeys:", v4);

  -[CNUIFamilyMemberContactsController setContactPickerViewController:](self, "setContactPickerViewController:", v6);
  -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:", v6);

}

- (void)performAddFromMainContactsInteraction
{
  CNUIFamilyMemberDowntimeContactPickerController *v3;
  void *v4;
  void *v5;
  CNUIFamilyMemberDowntimeContactPickerController *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v3 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  -[CNUIFamilyMemberContactsController familyMember](self, "familyMember");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberContactsEditingStrategy managedContactsStrategy](CNUIFamilyMemberContactsEditingStrategy, "managedContactsStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNUIFamilyMemberDowntimeContactPickerController initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:](v3, "initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:", v4, 0, v9, v5, 0);

  -[CNUIFamilyMemberDowntimeContactPickerController setShouldPreselectFamilyMemberContacts:](v6, "setShouldPreselectFamilyMemberContacts:", -[CNUIFamilyMemberContactsController countOfFamilyMemberContacts](self, "countOfFamilyMemberContacts") == 0);
  -[CNUIFamilyMemberDowntimeContactPickerController setDelegate:](v6, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:", v7);

}

- (void)performAddContactsInteraction
{
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  double MinY;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  -[CNUIFamilyMemberContactsController familyMember](self, "familyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberControllerShared addContactsOptionsSheetForFamilyMember:delegate:](CNUIFamilyMemberControllerShared, "addContactsOptionsSheetForFamilyMember:delegate:", v3, self);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberContactsController anchorViewForAddContactsInteraction](self, "anchorViewForAddContactsInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceView:", v4);

  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v12);
  objc_msgSend(v4, "bounds");
  MinY = CGRectGetMinY(v13);
  objc_msgSend(v11, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceRect:", MidX, MinY, 0.0, 0.0);

  objc_msgSend(v11, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPermittedArrowDirections:", 2);

  -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:", v11);

}

- (id)anchorViewForAddContactsInteraction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNUIFamilyMemberContactsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNUIFamilyMemberContactsController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactsController:anchorViewForPresentationOfInteraction:", self, 1);
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

- (void)addContactsOptionsSheetViewControllerDidSelectAddFromLocalContacts:(id)a3
{
  CNUIFamilyMemberDowntimeContactPickerController *v4;
  void *v5;
  void *v6;
  CNUIFamilyMemberDowntimeContactPickerController *v7;
  void *v8;
  id v9;

  v9 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = [CNUIFamilyMemberDowntimeContactPickerController alloc];
  -[CNUIFamilyMemberContactsController familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberContactsEditingStrategy managedContactsStrategy](CNUIFamilyMemberContactsEditingStrategy, "managedContactsStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIFamilyMemberDowntimeContactPickerController initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:](v4, "initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:", v5, 0, v9, v6, 0);

  -[CNUIFamilyMemberDowntimeContactPickerController setShouldPreselectFamilyMemberContacts:](v7, "setShouldPreselectFamilyMemberContacts:", -[CNUIFamilyMemberContactsController countOfFamilyMemberContacts](self, "countOfFamilyMemberContacts") == 0);
  -[CNUIFamilyMemberDowntimeContactPickerController setDelegate:](v7, "setDelegate:", self);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  -[CNUIFamilyMemberContactsController presentViewController:](self, "presentViewController:", v8);

}

- (void)addContactsOptionsSheetViewControllerDidSelectAddNewContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[CNContactViewController viewControllerForNewContact:](CNContactViewController, "viewControllerForNewContact:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIgnoresParentalRestrictions:", 1);
  -[CNUIFamilyMemberContactsController familyMemberScopedContactStore](self, "familyMemberScopedContactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactStore:", v4);

  objc_msgSend(v7, "setDisplayMode:", 2);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D13CC8], "propertyKeysContainingSenstiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProhibitedPropertyKeys:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  -[CNUIFamilyMemberContactsController presentViewController:](self, "presentViewController:", v6);

}

- (void)presentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:", v4);
  }

}

- (void)dismissPresentedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_opt_class();
  -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isViewController:presentedByContactPicker:", v7, v5);

  if (!(_DWORD)v4)
  {
    -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissPresentedViewController:", v7);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_5:

  }
}

- (void)cancelPresentationOfViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_opt_class();
  -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isViewController:presentedByContactPicker:", v10, v5);

  if (!(_DWORD)v4)
  {
    -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    -[CNUIFamilyMemberContactsController familyMemberContactsPresentation](self, "familyMemberContactsPresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if ((v8 & 1) != 0)
      objc_msgSend(v9, "presentedViewControllerDidCancel:", v10);
    else
      objc_msgSend(v9, "dismissPresentedViewController:", v10);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[CNUIFamilyMemberContactsController contactPickerViewController](self, "contactPickerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_7:

  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5;

  objc_msgSend(a3, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberContactsController dismissPresentedViewController:](self, "dismissPresentedViewController:", v5);

}

- (void)pickerDidSelectAddNewContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CNUIFamilyMemberContactsController familyMember](self, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIFamilyMemberControllerShared addContactsOptionsSheetForFamilyMember:delegate:](CNUIFamilyMemberControllerShared, "addContactsOptionsSheetForFamilyMember:delegate:", v5, self);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addContactBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBarButtonItem:", v6);

  objc_msgSend(v9, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanOverlapSourceViewRect:", 1);

  objc_msgSend(v4, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;

  v4 = a3;
  -[CNUIFamilyMemberContactsController setContactPickerViewController:](self, "setContactPickerViewController:", 0);
  -[CNUIFamilyMemberContactsController cancelPresentationOfViewController:](self, "cancelPresentationOfViewController:", v4);

}

- (void)downtimePickerController:(id)a3 didFinishWithContacts:(id)a4
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, id);
  id v8;
  id v9;

  v9 = a4;
  v6 = *MEMORY[0x1E0D137F8];
  v7 = *(uint64_t (**)(uint64_t, id))(*MEMORY[0x1E0D137F8] + 16);
  v8 = a3;
  if ((v7(v6, v9) & 1) != 0)
  {
    -[CNUIFamilyMemberContactsController cancelPresentationOfViewController:](self, "cancelPresentationOfViewController:", v8);
  }
  else
  {
    -[CNUIFamilyMemberContactsController dismissPresentedViewController:](self, "dismissPresentedViewController:", v8);

    -[CNUIFamilyMemberContactsController dataSource](self, "dataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateListByAddingContacts:", v9);
  }

}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (CNUIFamilyMemberContactsControllerDelegate)delegate
{
  return (CNUIFamilyMemberContactsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (CNUICoreFamilyMemberContactsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNContactPickerViewController)contactPickerViewController
{
  return (CNContactPickerViewController *)objc_loadWeakRetained((id *)&self->_contactPickerViewController);
}

- (void)setContactPickerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contactPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactPickerViewController);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsPresentation, 0);
}

+ (BOOL)isViewController:(id)a3 presentedByContactPicker:(id)a4
{
  BOOL v4;

  if (a4)
    v4 = a3 == a4;
  else
    v4 = 1;
  return !v4;
}

@end
