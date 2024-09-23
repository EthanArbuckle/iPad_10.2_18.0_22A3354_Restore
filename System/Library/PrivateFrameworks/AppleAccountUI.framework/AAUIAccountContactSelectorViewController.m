@implementation AAUIAccountContactSelectorViewController

- (AAUIAccountContactSelectorViewController)initWithViewModel:(id)a3
{
  id v4;
  AAUIAccountContactSelectorViewController *v5;
  uint64_t v6;
  NSArray *suggestedContacts;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAccountContactSelectorViewController;
  v5 = -[AAUIOBTableWelcomeController initWithViewModel:](&v9, sel_initWithViewModel_, v4);
  if (v5)
  {
    objc_msgSend(v4, "suggestedContacts");
    v6 = objc_claimAutoreleasedReturnValue();
    suggestedContacts = v5->_suggestedContacts;
    v5->_suggestedContacts = (NSArray *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *continueButton;
  UIBarButtonItem *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountContactSelectorViewController;
  -[AAUIOBTableWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  -[AAUIOBTableWelcomeController primaryButton](self, "primaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[AAUIOBTableWelcomeController primaryButton](self, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__selectContact, 64);

  -[AAUIAccountContactSelectorViewController _setupTableView](self, "_setupTableView");
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__selectContact);
  continueButton = self->_continueButton;
  self->_continueButton = v8;

  -[UIBarButtonItem setEnabled:](self->_continueButton, "setEnabled:", 0);
  v10 = self->_continueButton;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "AAUIAccountContactSelectorViewController dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AAUIAccountContactSelectorViewController;
  -[AAUIAccountContactSelectorViewController dealloc](&v4, sel_dealloc);
}

- (id)_pictureStore
{
  AAUIProfilePictureStore *pictureStore;
  AAUIProfilePictureStore *v4;
  AAUIProfilePictureStore *v5;

  pictureStore = self->_pictureStore;
  if (!pictureStore)
  {
    v4 = objc_alloc_init(AAUIProfilePictureStore);
    v5 = self->_pictureStore;
    self->_pictureStore = v4;

    pictureStore = self->_pictureStore;
  }
  return pictureStore;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_suggestedContacts, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (-[AAUIAccountContactSelectorViewController _isOtherContactRowForIndexPath:](self, "_isOtherContactRowForIndexPath:", v7))
  {
    -[AAUIAccountContactSelectorViewController _otherContactCellForTableView:](self, "_otherContactCellForTableView:", v6);
  }
  else
  {
    -[AAUIAccountContactSelectorViewController _suggestedContactCellForTableView:atRow:](self, "_suggestedContactCellForTableView:atRow:", v6, objc_msgSend(v7, "row"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_otherContactCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("OtherContactsCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("OtherContactsCell"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_CONTACT_PICKER_CHOOSE_SOMEONE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1438]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v11);

  return v3;
}

- (id)_suggestedContactCellForTableView:(id)a3 atRow:(int64_t)a4
{
  AAUISuggestedContactCell *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ContactSelectorCell"));
  v6 = (AAUISuggestedContactCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = -[AAUISuggestedContactCell initWithStyle:reuseIdentifier:]([AAUISuggestedContactCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("ContactSelectorCell"));
  -[NSArray objectAtIndexedSubscript:](self->_suggestedContacts, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountContactSelectorViewController _pictureStore](self, "_pictureStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISuggestedContactCell updateWithContact:pictureStore:](v6, "updateWithContact:pictureStore:", v7, v8);

  return v6;
}

- (BOOL)_isOtherContactRowForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "section");

  LOBYTE(v4) = v5 == objc_msgSend(v6, "numberOfRowsInSection:", v7) - 1;
  return (char)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSArray *suggestedContacts;
  uint64_t v11;
  AALocalContactInfo *v12;
  AALocalContactInfo *selectedContact;
  id v14;

  v14 = a3;
  v6 = a4;
  if (-[AAUIAccountContactSelectorViewController _isOtherContactRowForIndexPath:](self, "_isOtherContactRowForIndexPath:", v6))
  {
    objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);

    -[AAUIOBTableWelcomeController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[AAUIOBTableWelcomeController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountContactSelectorShowOtherContacts:", self);

    }
  }
  else
  {
    suggestedContacts = self->_suggestedContacts;
    v11 = objc_msgSend(v6, "row");

    -[NSArray objectAtIndexedSubscript:](suggestedContacts, "objectAtIndexedSubscript:", v11);
    v12 = (AALocalContactInfo *)objc_claimAutoreleasedReturnValue();
    selectedContact = self->_selectedContact;
    self->_selectedContact = v12;

    -[UIBarButtonItem setEnabled:](self->_continueButton, "setEnabled:", 1);
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  if (!-[AAUIAccountContactSelectorViewController _isOtherContactRowForIndexPath:](self, "_isOtherContactRowForIndexPath:", a4))-[UIBarButtonItem setEnabled:](self->_continueButton, "setEnabled:", 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  _BOOL4 v4;
  double result;

  v4 = -[AAUIAccountContactSelectorViewController _isOtherContactRowForIndexPath:](self, "_isOtherContactRowForIndexPath:", a4);
  result = *MEMORY[0x1E0DC53D8];
  if (v4)
    return 58.0;
  return result;
}

- (void)_setupTableView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  v5 = *MEMORY[0x1E0DC53D8];
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", v5);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionHeaderHeight:", v5);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsSelection:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ContactSelectorCell"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("OtherContactsCell"));

}

- (void)_selectContact
{
  id v3;

  -[AAUIOBTableWelcomeController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountContactSelector:didSelectContact:", self, self->_selectedContact);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
}

@end
