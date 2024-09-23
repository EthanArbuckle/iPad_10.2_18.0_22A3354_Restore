@implementation CNContactContentContainerViewController

- (CNContactContentContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNContactContentContainerViewController *v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentContainerViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  return v6;
}

- (CNContactContentContainerViewController)initWithEnvironment:(id)a3
{
  id v5;
  CNContactContentContainerViewController *v6;
  uint64_t v7;
  NSArray *displayedProperties;
  CNContactContentViewControllerConfiguration *v9;
  CNContactContentViewControllerConfiguration *contactViewConfiguration;
  uint64_t v11;
  CNContactFormatter *contactFormatter;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNContactContentContainerViewController;
  v6 = -[CNContactContentViewController initWithEnvironment:](&v20, sel_initWithEnvironment_, v5);
  objc_storeStrong((id *)&v6->_environment, a3);
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  +[CNContactView allCardProperties](CNContactView, "allCardProperties");
  v7 = objc_claimAutoreleasedReturnValue();
  displayedProperties = v6->_displayedProperties;
  v6->_displayedProperties = (NSArray *)v7;

  v9 = -[CNContactContentViewControllerConfiguration initForOutOfProcess:]([CNContactContentViewControllerConfiguration alloc], "initForOutOfProcess:", -[CNContactContentContainerViewController isOutOfProcess](v6, "isOutOfProcess"));
  contactViewConfiguration = v6->_contactViewConfiguration;
  v6->_contactViewConfiguration = v9;

  objc_msgSend(MEMORY[0x1E0C97218], "sharedFullNameFormatter");
  v11 = objc_claimAutoreleasedReturnValue();
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v11;

  -[CNContactContentContainerViewController setNeedsReloadLazy](v6, "setNeedsReloadLazy");
  -[CNContactContentContainerViewController setRestorationIdentifier:](v6, "setRestorationIdentifier:", CFSTR("ContactCard"));
  -[CNContactContentContainerViewController setRestorationClass:](v6, "setRestorationClass:", objc_opt_class());
  -[CNContactContentContainerViewController navigationItem](v6, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setBackgroundHidden:", 1);

  -[CNContactContentContainerViewController navigationItem](v6, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLargeTitleDisplayMode:", 2);

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "featureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_supportsDrafts = objc_msgSend(v16, "isFeatureEnabled:", 18);

  if (-[CNContactContentContainerViewController supportsDrafts](v6, "supportsDrafts"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v6, sel_applicationLeftForeground_, *MEMORY[0x1E0DC4868], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v6, sel_applicationLeftForeground_, *MEMORY[0x1E0DC4870], 0);

  }
  return v6;
}

- (CNContactContentContainerViewController)initWithContact:(id)a3
{
  id v4;
  CNContactContentContainerViewController *v5;
  CNContactContentContainerViewController *v6;
  CNContactContentContainerViewController *v7;

  v4 = a3;
  v5 = -[CNContactContentContainerViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    -[CNContactContentContainerViewController setContact:](v5, "setContact:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)createDisplayViewControllerIfNeeded
{
  CNContactContentDisplayViewController *v3;
  void *v4;
  void *v5;
  CNContactContentDisplayViewController *v6;
  CNContactContentDisplayViewController *displayContactViewController;

  if (!self->_displayContactViewController)
  {
    v3 = [CNContactContentDisplayViewController alloc];
    -[CNContactContentContainerViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactContentDisplayViewController initWithContact:contactViewConfiguration:](v3, "initWithContact:contactViewConfiguration:", v4, v5);
    displayContactViewController = self->_displayContactViewController;
    self->_displayContactViewController = v6;

    -[CNContactContentDisplayViewController setDelegate:](self->_displayContactViewController, "setDelegate:", self);
    -[CNContactContentDisplayViewController setNavigationItemDelegate:](self->_displayContactViewController, "setNavigationItemDelegate:", self);
  }
}

- (void)createEditingViewControllerIfNeeded
{
  CNContactContentEditViewController *v3;
  void *v4;
  void *v5;
  CNContactContentEditViewController *v6;
  CNContactContentEditViewController *editContactViewController;

  if (!self->_editContactViewController)
  {
    v3 = [CNContactContentEditViewController alloc];
    -[CNContactContentContainerViewController contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CNContactContentEditViewController initWithContact:contactViewConfiguration:](v3, "initWithContact:contactViewConfiguration:", v4, v5);
    editContactViewController = self->_editContactViewController;
    self->_editContactViewController = v6;

    -[CNContactContentEditViewController setDelegate:](self->_editContactViewController, "setDelegate:", self);
    -[CNContactContentEditViewController setNavigationItemDelegate:](self->_editContactViewController, "setNavigationItemDelegate:", self);
  }
}

- (void)setContactStore:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_contactStore, a3);
  v5 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactStore:", v5);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (void)setTitle:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  objc_super v8;

  v5 = a3;
  if (v5
    || (-[CNContactContentContainerViewController title](self, "title"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNContactContentContainerViewController title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (!v5)
    {

      if ((v7 & 1) != 0)
        goto LABEL_6;
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentContainerViewController;
      -[CNContactContentContainerViewController setTitle:](&v8, sel_setTitle_, v5);
      -[CNContactContentContainerViewController didChangeToShowTitle:](self, "didChangeToShowTitle:", v5 != 0);
    }
  }
LABEL_6:

}

- (void)dealloc
{
  CNContactContentDisplayViewController *displayContactViewController;
  CNContactContentEditViewController *editContactViewController;
  objc_super v5;

  displayContactViewController = self->_displayContactViewController;
  self->_displayContactViewController = 0;

  editContactViewController = self->_editContactViewController;
  self->_editContactViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController dealloc](&v5, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (id)contactView
{
  void *v3;
  void *v4;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  else
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactHeaderView
{
  void *v3;
  void *v4;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  else
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)displayHeaderView
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)contactNavigationItemProvider:(id)a3 didUpdateNavigationItem:(id)a4 doneButtonItem:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v11 == v20;

  }
  if (-[CNContactContentContainerViewController isEditing](self, "isEditing"))
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12 == v20;

  }
  else
  {
    v13 = 0;
  }
  if (v10 || v13)
  {
    -[CNContactContentContainerViewController applyChangesToNavigationItemFromItem:](self, "applyChangesToNavigationItemFromItem:", v8);
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[CNContactContentContainerViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CNContactContentContainerViewController isEditing](self, "isEditing");
      v18 = objc_msgSend(v9, "isEnabled");
      objc_msgSend(v9, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateEditing:doneButtonEnabled:doneButtonText:", v17, v18, v19);

    }
  }

}

- (void)applyChangesToNavigationItemFromItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNContactContentContainerViewController navigationItemController](self, "navigationItemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leftBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItems:", v6);

  objc_msgSend(v4, "rightBarButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRightBarButtonItems:", v7);
}

- (void)setDisplayedProperties:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedProperties");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (v6 != v14)
  {
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactContentContainerViewController.m"), 352, CFSTR("Properties should be strings, are you still using old AB properties?"));

      }
    }
    if (v14)
    {
      v11 = objc_msgSend(v14, "copy");
    }
    else
    {
      +[CNContactView allCardProperties](CNContactView, "allCardProperties");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDisplayedProperties:", v12);

    -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
    v7 = v14;
  }

}

- (id)displayedProperties
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEditing:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsEditing
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsEditing");

  return v3;
}

- (void)setAlwaysEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlwaysEditing:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)alwaysEditing
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alwaysEditing");

  return v3;
}

- (void)setAllowsActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsActions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsActions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsActions");

  return v3;
}

- (void)setAllowsPropertyActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsPropertyActions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsPropertyActions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsPropertyActions");

  return v3;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsCardActions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsCardActions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsCardActions");

  return v3;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsConferencing:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsConferencing
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsConferencing");

  return v3;
}

- (void)setAllowsSharing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsSharing:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsSharing
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsSharing");

  return v3;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsAddToFavorites:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsAddToFavorites
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAddToFavorites");

  return v3;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsSendMessage:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsSendMessage
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsSendMessage");

  return v3;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsContactBlocking:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsContactBlocking
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsContactBlocking");

  return v3;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsContactBlockingAndReporting:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsContactBlockingAndReporting
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsContactBlockingAndReporting");

  return v3;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsAddingToAddressBook:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsAddingToAddressBook
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAddingToAddressBook");

  return v3;
}

- (void)setShouldShowLinkedContacts:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldShowLinkedContacts:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)shouldShowLinkedContacts
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowLinkedContacts");

  return v3;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsSettingLinkedContactsAsPreferred:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsSettingLinkedContactsAsPreferred");

  return v3;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsDeletion:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsDeletion
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsDeletion");

  return v3;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsActionsModel:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsActionsModel
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsActionsModel");

  return v3;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsDisplayModePickerActions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsDisplayModePickerActions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsDisplayModePickerActions");

  return v3;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEditPhoto:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)allowsEditPhoto
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsEditPhoto");

  return v3;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIgnoresParentalRestrictions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)ignoresParentalRestrictions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoresParentalRestrictions");

  return v3;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditingProposedInformation:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)editingProposedInformation
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "editingProposedInformation");

  return v3;
}

- (void)setHideCardActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHideCardActions:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)hideCardActions
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hideCardActions");

  return v3;
}

- (void)setIsMailVIP:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsMailVIP:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)isMailVIP
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMailVIP");

  return v3;
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowContactBlockingFirst:", v3);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (BOOL)showContactBlockingFirst
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showContactBlockingFirst");

  return v3;
}

- (void)setAlternateName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternateName:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)alternateName
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)message
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setWarningMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWarningMessage:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)warningMessage
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "warningMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setImportantMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImportantMessage:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)importantMessage
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importantMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVerifiedInfoMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVerifiedInfoMessage:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)verifiedInfoMessage
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifiedInfoMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPrimaryProperty:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryProperty:", v4);

  -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
}

- (id)primaryProperty
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPersonHeaderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id firstValue;

  firstValue = a3;
  if (firstValue)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", firstValue);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("personHeaderView"), firstValue, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[personHeaderView]|"), 0, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[personHeaderView]|"), 0, 0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
    -[CNContactContentContainerViewController setPersonHeaderViewController:](self, "setPersonHeaderViewController:", v4);

  }
  else
  {
    -[CNContactContentContainerViewController setPersonHeaderViewController:](self, "setPersonHeaderViewController:", 0);
  }

}

- (id)personHeaderView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNContactContentContainerViewController personHeaderViewController](self, "personHeaderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPersonHeaderViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonHeaderViewController:", v4);

}

- (id)personHeaderViewController
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personHeaderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cardTopGroup
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardTopGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cardBottomGroup
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardBottomGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cardFooterGroup
{
  void *v2;
  void *v3;

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardFooterGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContact:(id)a3
{
  CNContact *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = (CNContact *)a3;
  v5 = v4;
  self->_needsRefetch = 0;
  if (self->_contact == v4)
    goto LABEL_15;
  -[CNContact identifier](v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContact identifier](self->_contact, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
    -[CNContactContentContainerViewController setDidSetNewContact:](self, "setDidSetNewContact:", 1);
  -[CNContactContentContainerViewController environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultSchedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "suspendBackgroundScheduler");
  objc_msgSend(v10, "afterCACommitScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __54__CNContactContentContainerViewController_setContact___block_invoke;
  v30[3] = &unk_1E204F648;
  v12 = v10;
  v31 = v12;
  objc_msgSend(v11, "performBlock:", v30);

  -[CNContactContentContainerViewController contactViewCache](self, "contactViewCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resetCache");

  LODWORD(v11) = -[CNContactContentContainerViewController isOutOfProcess](self, "isOutOfProcess");
  objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if ((_DWORD)v11)
  {
    v35[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController _updateContact:withMissingKeysFromRequiredKeys:](self, "_updateContact:withMissingKeysFromRequiredKeys:", v5, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v17;
  }
  else
  {
    v34 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertKeysAreAvailable:", v16);
  }

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContact:", v5);

  -[CNContactContentEditViewController setContact:](self->_editContactViewController, "setContact:", v5);
  -[CNContactContentContainerViewController editAuthorizationManager](self, "editAuthorizationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateWithContact:", v5);

  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_10;
  v21 = (void *)v20;
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_11:

    goto LABEL_12;
  }
  v23 = (void *)v22;
  v24 = objc_msgSend(v5, "hasBeenPersisted");

  if (v24)
  {
LABEL_10:
    -[CNContactContentContainerViewController contactViewCache](self, "contactViewCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "containerForContact:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentViewController setParentContainer:](self, "setParentContainer:", v25);

    goto LABEL_11;
  }
LABEL_12:
  objc_storeStrong((id *)&self->_contact, v5);
  CNUILogContactCard();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v27;
    _os_log_impl(&dword_18AC56000, v26, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@", buf, 0xCu);

  }
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController contact](self, "contact");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logContactShown:", v29);

  -[CNContactContentContainerViewController prepareContactDidAppearForPPT](self, "prepareContactDidAppearForPPT");
LABEL_15:

}

- (void)favoritesDidChangeWithNotification:(id)a3
{
  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing", a3) & 1) == 0)
    -[CNContactContentContainerViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
}

- (void)_refetchContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
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
  int v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[CNContactContentContainerViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentViewController parentContainer](self, "parentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isMeContact:", v6);

    CNUILogContactCard();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v10;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentContainerViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v11, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v13, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v3, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);

      }
      -[CNContactContentContainerViewController contactStore](self, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForContact:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v11, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v17, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

    }
    -[CNContactContentContainerViewController contactViewCache](self, "contactViewCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerForContact:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 || !v14)
    {
      CNUILogContactCard();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentContainerViewController contactStore](self, "contactStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v28 = v23;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v24;
        v33 = 2112;
        v34 = v3;
        _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);

      }
    }
    else
    {
      v20 = objc_msgSend(v14, "isEqual:", v3);
      v21 = objc_msgSend(v19, "isEqual:", v4);
      if (!v20 || (v21 & 1) == 0)
        -[CNContactContentContainerViewController setContact:](self, "setContact:", v14);
    }

  }
}

- (id)originalContacts
{
  NSArray *originalContacts;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  originalContacts = self->_originalContacts;
  if (originalContacts)
    return originalContacts;
  if (self->_contact)
  {
    v5[0] = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[CNContactContentContainerViewController isViewLoaded](self, "isViewLoaded")
    && (!-[CNContactContentContainerViewController isOutOfProcess](self, "isOutOfProcess")
     || -[CNContactContentContainerViewController outOfProcessSetupComplete](self, "outOfProcessSetupComplete")))
  {
    self->_needsReload = 0;
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadDataPreservingChanges:", v3);

    if (self->_editContactViewController)
    {
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadDataPreservingChanges:", v3);

    }
  }
}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
  -[CNContactContentContainerViewController addActionWithTitle:target:selector:menuProvider:inGroup:destructive:](self, "addActionWithTitle:target:selector:menuProvider:inGroup:destructive:", a3, 0, 0, a4, a5, a6);
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a8;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addActionWithTitle:menuProvider:inGroup:destructive:", v14, v13, v12, v8);

}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addActionWithTitle:target:selector:inGroup:destructive:", v14, v13, a5, v12, v7);

}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6
{
  -[CNContactContentContainerViewController addActionWithTitle:target:selector:inGroup:destructive:](self, "addActionWithTitle:target:selector:inGroup:destructive:", a3, a4, a5, a6, 0);
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeActionWithTarget:selector:inGroup:", v9, a4, v8);

}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadCardGroup:forTableView:", v7, v6);

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (a3 == 4)
  {
    if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
    {
      -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CNContactContentEditViewController contactView](self->_editContactViewController, "contactView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)navigationItemController
{
  CNContactContentContainerViewController *v2;
  CNContactContentContainerViewController *v3;
  CNContactContentContainerViewController *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (1)
    {
      -[CNContactContentContainerViewController parentViewController](v4, "parentViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      -[CNContactContentContainerViewController parentViewController](v4, "parentViewController");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (CNContactContentContainerViewController *)v7;
      if (!v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v4 = v3;
  }
  return v4;
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[CNContactContentContainerViewController title](self, "title");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[CNContactContentContainerViewController navigationController](self, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[CNContactContentContainerViewController contactFormatter](self, "contactFormatter");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactContentContainerViewController contact](self, "contact");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromContact:", v6);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[CNContactContentContainerViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

  }
  else
  {
    -[CNContactContentContainerViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", 0);
  }

}

- (BOOL)hasPendingChanges
{
  return -[CNContactContentEditViewController hasPendingChanges](self->_editContactViewController, "hasPendingChanges");
}

- (void)presentConfirmCancelAlertController
{
  id v2;

  -[CNContactContentContainerViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentCancelConfirmationAlert");

}

- (BOOL)saveWasAuthorized
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController editAuthorizationManager](self, "editAuthorizationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "saveWasAuthorized");

  return v3;
}

- (void)editCancel
{
  -[CNContactContentContainerViewController editCancel:](self, "editCancel:", 0);
}

- (void)editCancel:(id)a3
{
  id v4;

  if (-[CNContactContentContainerViewController isEditing](self, "isEditing", a3))
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editCancel");

  }
}

- (void)toggleEditing
{
  -[CNContactContentContainerViewController toggleEditing:](self, "toggleEditing:", 0);
}

- (void)toggleEditing:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CNContactContentContainerViewController isEditing](self, "isEditing"))
    -[CNContactContentContainerViewController finishEditing:](self, "finishEditing:", v4);
  else
    -[CNContactContentContainerViewController setEditing:](self, "setEditing:", -[CNContactContentContainerViewController isEditing](self, "isEditing") ^ 1);

}

- (void)finishEditing:(id)a3
{
  id v4;

  if (-[CNContactContentContainerViewController isEditing](self, "isEditing", a3))
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishEditing");

  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  BOOL v14;
  id location;

  v4 = a4;
  v5 = a3;
  if (-[CNContactContentContainerViewController isEditing](self, "isEditing") != a3)
  {
    if (-[CNContactContentContainerViewController editingChangeRequiresAuthorization](self, "editingChangeRequiresAuthorization"))
    {
      objc_initWeak(&location, self);
      -[CNContactContentContainerViewController editAuthorizationManager](self, "editAuthorizationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rightBarButtonItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __63__CNContactContentContainerViewController_setEditing_animated___block_invoke;
      v11[3] = &unk_1E20481B8;
      objc_copyWeak(&v12, &location);
      v13 = v5;
      v14 = v4;
      objc_msgSend(v7, "authorizeForViewController:sender:animated:completionBlock:", self, v9, v4, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CNContactContentContainerViewController;
      -[CNContactContentContainerViewController setEditing:animated:](&v10, sel_setEditing_animated_, v5, v4);
      -[CNContactContentContainerViewController performAuthorizedSetEditing:animated:](self, "performAuthorizedSetEditing:animated:", v5, v4);
    }
  }
}

- (BOOL)editingChangeRequiresAuthorization
{
  void *v4;
  char v5;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
    return 0;
  -[CNContactContentContainerViewController editAuthorizationManager](self, "editAuthorizationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldPromptForPasscodeAuthorization");

  return v5;
}

- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  id v38;
  void *v39;
  char v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  CNContactContentContainerViewController *v45;
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  CNUILogContactCard();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Entering Edit Mode", buf, 2u);
    }

    -[CNContactContentContainerViewController createEditingViewControllerIfNeeded](self, "createEditingViewControllerIfNeeded");
    if (-[CNContactContentContainerViewController didSetNewContact](self, "didSetNewContact"))
    {
      -[CNContactContentContainerViewController setDidSetNewContact:](self, "setDidSetNewContact:", 0);
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController contact](self, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContact:", v10);

      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactViewConfigurationDidUpdate");

    }
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Leaving Edit Mode", buf, 2u);
    }

    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v16;
  objc_msgSend(v15, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 != v21)
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v23)
    {
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController addChildViewController:](self, "addChildViewController:", v25);

      -[CNContactContentContainerViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v28);

      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "didMoveToParentViewController:", self);
    }
    else
    {
      -[CNContactContentContainerViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSubview:", v15);
    }

    -[CNContactContentContainerViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNeedsUpdateConstraints");

  }
  objc_msgSend(v19, "effectiveNavigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doneButtonItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController contactNavigationItemProvider:didUpdateNavigationItem:doneButtonItem:](self, "contactNavigationItemProvider:didUpdateNavigationItem:doneButtonItem:", v19, v32, v33);

  v34 = (void *)MEMORY[0x1E0DC3F10];
  -[CNContactContentContainerViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v36 = 0.25;
  else
    v36 = 0.0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __80__CNContactContentContainerViewController_performAuthorizedSetEditing_animated___block_invoke;
  v42[3] = &unk_1E204FAA0;
  v37 = v13;
  v43 = v37;
  v38 = v15;
  v44 = v38;
  v45 = self;
  objc_msgSend(v34, "transitionWithView:duration:options:animations:completion:", v35, 5242880, v42, 0, v36);

  -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_opt_respondsToSelector();

  if ((v40 & 1) != 0)
  {
    -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "contactViewController:didChangeToEditMode:", self, v5);

  }
}

- (void)clearMapsDataIfEdited
{
  -[CNContactContentEditViewController clearMapsDataIfEdited](self->_editContactViewController, "clearMapsDataIfEdited");
}

- (BOOL)saveChanges
{
  void *v3;
  char v4;

  if (-[CNContactContentContainerViewController isEditing](self, "isEditing"))
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
  else
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "saveChanges");

  return v4;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController viewDidLoad](&v16, sel_viewDidLoad);
  v3 = *MEMORY[0x1E0D13848];
  -[CNContactContentContainerViewController initialPrompt](self, "initialPrompt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    -[CNContactContentContainerViewController initialPrompt](self, "initialPrompt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrompt:", v5);

  }
  if (-[CNContactContentContainerViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"))
  {
    -[CNContactContentContainerViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setBackgroundHidden:", 0);

  }
  -[CNContactContentContainerViewController reloadDataIfNeeded](self, "reloadDataIfNeeded");
  -[CNContactContentContainerViewController createDisplayViewControllerIfNeeded](self, "createDisplayViewControllerIfNeeded");
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController addChildViewController:](self, "addChildViewController:", v8);

  -[CNContactContentContainerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v11);

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didMoveToParentViewController:", self);

  -[CNContactContentContainerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsUpdateConstraints");

}

- (void)setupConstraints
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
  void *v27;
  void *v28;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNContactContentContainerViewController activatedConstraints](self, "activatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[CNContactContentContainerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v14);

    -[CNContactContentContainerViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v20);

    -[CNContactContentContainerViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v26);

    -[CNContactContentContainerViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v32);

  }
  if (self->_editContactViewController)
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "superview");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35 == v36)
    {
      -[CNContactContentContainerViewController view](self, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v42);

      -[CNContactContentContainerViewController view](self, "view");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "trailingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v48);

      -[CNContactContentContainerViewController view](self, "view");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "view");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "topAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v54);

      -[CNContactContentContainerViewController view](self, "view");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "bottomAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v60);

    }
  }
  -[CNContactContentContainerViewController setActivatedConstraints:](self, "setActivatedConstraints:", v61);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v61);

}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[CNContactContentContainerViewController setupConstraints](self, "setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_needsRefetch)
  {
    -[CNContactContentContainerViewController _refetchContact](self, "_refetchContact");
    self->_needsRefetch = 0;
  }
  if (!-[CNContactContentContainerViewController alwaysEditing](self, "alwaysEditing"))
    -[CNContactContentContainerViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CNContactContentContainerViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 1);
}

- (void)prepareContactDidAppearForPPT
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[CNContactContentContainerViewController runningPPT](self, "runningPPT"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)*MEMORY[0x1E0DC4730];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __72__CNContactContentContainerViewController_prepareContactDidAppearForPPT__block_invoke;
    v4[3] = &unk_1E204F880;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "installCACommitCompletionBlock:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNContactContentContainerViewController updateWindowTitleForAppearing:](self, "updateWindowTitleForAppearing:", 0);
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  int v44;
  CNContactEditAuthorizationManager *v45;
  void *v46;
  void *v47;
  CNContactEditAuthorizationManager *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD);
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[5];
  uint8_t v64[128];
  __int128 buf;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CNUILogContactCard();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Properties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController setIsSupressingViewConfigurationUpdates:](self, "setIsSupressingViewConfigurationUpdates:", 1);
  if (-[CNContactContentContainerViewController isOutOfProcess](self, "isOutOfProcess"))
  {
    -[CNContactContentContainerViewController setOutOfProcessSetupComplete:](self, "setOutOfProcessSetupComplete:", 0);
    if (objc_msgSend(MEMORY[0x1E0C97200], "suggestionsEnabled"))
      v10 = 3;
    else
      v10 = 1;
    -[CNContactContentContainerViewController managedConfiguration](self, "managedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0C97298]);
      -[CNContactContentContainerViewController environment](self, "environment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cnEnvironment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController managedConfiguration](self, "managedConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v12, "initWithEnvironment:options:managedConfiguration:", v14, v10, v15);
      -[CNContactContentContainerViewController setContactStore:](self, "setContactStore:", v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController setContactStore:](self, "setContactStore:", v13);
    }

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("runningPPT"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController setRunningPPT:](self, "setRunningPPT:", objc_msgSend(v17, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("showingMeContact"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController setShowingMeContact:](self, "setShowingMeContact:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ignoresParentalRestrictions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIgnoresParentalRestrictions:", v20);

  v54 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("prohibitedPropertyKeys"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProhibitedPropertyKeys:", v22);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("warningMessage"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWarningMessage:", v24);

  v61 = 0u;
  v62 = 0u;
  *(_QWORD *)&buf = CFSTR("allowsDeletion");
  *((_QWORD *)&buf + 1) = CFSTR("allowsCardActions");
  v66 = CFSTR("alwaysEditing");
  v67 = CFSTR("personHeaderView");
  v68 = CFSTR("allowsActions");
  v69 = CFSTR("verifiedInfoMessage");
  v70 = CFSTR("allowsEditInApp");
  v71 = CFSTR("shouldShowLinkedContacts");
  v59 = 0u;
  v60 = 0u;
  v72 = CFSTR("parentContainer");
  v73 = CFSTR("allowsDisplayModePickerActions");
  v74 = CFSTR("allowsAddToFavorites");
  v75 = CFSTR("ignoresParentalRestrictions");
  v76 = CFSTR("primaryProperty");
  v77 = CFSTR("allowsAddingToAddressBook");
  v78 = CFSTR("alternateName");
  v79 = CFSTR("allowsEditPhoto");
  v80 = CFSTR("allowsNamePicking");
  v81 = CFSTR("showsInlineActions");
  v82 = CFSTR("showsSharedProfile");
  v83 = CFSTR("showsGroupMembership");
  v84 = CFSTR("displayedProperties");
  v85 = CFSTR("editingProposedInformation");
  v86 = CFSTR("allowsContactBlocking");
  v87 = CFSTR("allowsContactBlockingAndReporting");
  v88 = CFSTR("allowsSharing");
  v89 = CFSTR("highlightedProperties");
  v90 = CFSTR("highlightedPropertyImportant");
  v91 = CFSTR("allowsConferencing");
  v92 = CFSTR("importantMessage");
  v93 = CFSTR("allowsEditing");
  v94 = CFSTR("personHeaderViewController");
  v95 = CFSTR("personHeaderViewDelegate");
  v96 = CFSTR("shouldDrawNavigationBar");
  v97 = CFSTR("message");
  v98 = CFSTR("layoutPositionallyAfterNavBar");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setValue:forKey:", v32, v31);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v28);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  *(_QWORD *)&buf = CFSTR("mode");
  *((_QWORD *)&buf + 1) = CFSTR("parentGroup");
  v66 = CFSTR("originalContacts");
  v67 = CFSTR("recentsData");
  v68 = CFSTR("showingMeContact");
  v69 = CFSTR("runningPPT");
  v70 = CFSTR("contact");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v56 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
          -[CNContactContentContainerViewController setValue:forKey:](self, "setValue:forKey:", v40, v39);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v36);
  }

  -[CNContactContentContainerViewController contactViewConfiguration](self, "contactViewConfiguration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "alwaysEditing"))
  {

    v42 = v53;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isEditing"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "BOOLValue");

    v42 = v53;
    if (!v44)
      goto LABEL_33;
  }
  -[CNContactContentContainerViewController createEditingViewControllerIfNeeded](self, "createEditingViewControllerIfNeeded");
  -[CNContactContentContainerViewController setEditing:animated:](self, "setEditing:animated:", 1, 0);
LABEL_33:
  v45 = [CNContactEditAuthorizationManager alloc];
  -[CNContactContentContainerViewController contact](self, "contact");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController contactStore](self, "contactStore");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[CNContactEditAuthorizationManager initWithContact:contactStore:](v45, "initWithContact:contactStore:", v46, v47);
  -[CNContactContentContainerViewController setEditAuthorizationManager:](self, "setEditAuthorizationManager:", v48);

  -[CNContactContentContainerViewController editAuthorizationManager](self, "editAuthorizationManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setEditAuthorizationManager:", v49);

  -[CNContactContentContainerViewController setIsSupressingViewConfigurationUpdates:](self, "setIsSupressingViewConfigurationUpdates:", 0);
  -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "contactViewConfigurationDidUpdate");

  if (self->_editContactViewController)
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "contactViewConfigurationDidUpdate");

  }
  if (-[CNContactContentContainerViewController isOutOfProcess](self, "isOutOfProcess"))
    -[CNContactContentContainerViewController setOutOfProcessSetupComplete:](self, "setOutOfProcessSetupComplete:", 1);
  if (v42)
    v42[2](v42, 0);

}

- (void)didUpdateContactViewConfiguration
{
  void *v3;
  id v4;

  if (!-[CNContactContentContainerViewController isSupressingViewConfigurationUpdates](self, "isSupressingViewConfigurationUpdates"))
  {
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contactViewConfigurationDidUpdate");

    if (self->_editContactViewController)
    {
      -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactViewConfigurationDidUpdate");

    }
  }
}

- (void)didChangeToEditMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[CNContactContentContainerViewController isEditing](self, "isEditing") != a3)
    -[CNContactContentContainerViewController setEditing:animated:](self, "setEditing:animated:", v3, 0);
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  CGRect v30;

  v6 = a3;
  v7 = a4;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  v29 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v29;
  else
    v9 = 0;
  v10 = v9;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) != 0)
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
  else
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contactView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v10);

  objc_msgSend(v10, "bounds");
  -[CNContactContentContainerViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v7, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  objc_msgSend(v7, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPermittedArrowDirections:", 15);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "presentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", self);

  }
  if (!self->_disablingRotation)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "userInterfaceIdiom"))
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_referenceBounds");
    if (CGRectGetHeight(v30) <= 667.0 || objc_msgSend(v7, "modalPresentationStyle"))
    {

      goto LABEL_14;
    }
    v27 = objc_msgSend(v7, "supportedInterfaceOrientations");
    v28 = -[CNContactContentContainerViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations");

    if (v27 != v28)
    {
      -[CNContactContentContainerViewController _beginDisablingInterfaceAutorotation](self, "_beginDisablingInterfaceAutorotation");
      self->_disablingRotation = 1;
    }
  }
LABEL_15:
  -[CNContactContentContainerViewController setBackgroundColorIfNeededForPresentedViewController:](self, "setBackgroundColorIfNeededForPresentedViewController:", v7);
  -[CNContactContentContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing") & 1) == 0)
  {
    objc_msgSend(v9, "layoutMargins");
    v11 = v10;
    objc_msgSend(v9, "layoutMargins");
    width = width - (v11 + v12);
    objc_msgSend(v9, "layoutMargins");
    v14 = v13;
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionContentInset");
    x = x + v14 - v16;

  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService())
    return -1;
  else
    return -2;
}

- (void)performConfirmedCancel
{
  id v2;

  -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performConfirmedCancel");

}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 1;
  }

  -[CNContactContentContainerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    -[CNContactContentContainerViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactContentContainerViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__CNContactContentContainerViewController_sender_dismissViewController_completionHandler___block_invoke;
  v9[3] = &unk_1E204F9B0;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNContactContentContainerViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)contactDisplayViewControllerWillPresentFullscreen:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentContainerViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isPresentingFullscreen:", 1);

    }
  }
}

- (void)contactDisplayViewControllerWillDismissFullscreen:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if ((-[CNContactContentContainerViewController isEditing](self, "isEditing", a3) & 1) == 0)
  {
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentContainerViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isPresentingFullscreen:", 0);

    }
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "contactViewController:shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", self, v9, v10, v11);

  }
  else
  {
    v15 = 1;
  }
  -[CNContactContentContainerViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[CNContactContentContainerViewController _removeUnauthorizedKeysFromContact:](self, "_removeUnauthorizedKeysFromContact:", v9);
    v18 = objc_claimAutoreleasedReturnValue();

    -[CNContactContentContainerViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v19, "shouldPerformDefaultActionForContact:propertyKey:propertyIdentifier:", v18, v10, v11);

    v9 = (id)v18;
  }

  return v15;
}

- (void)contactDisplayViewController:(id)a3 didChangeToEditMode:(BOOL)a4
{
  -[CNContactContentContainerViewController setEditing:](self, "setEditing:", 1, a4);
}

- (void)contactEditViewControllerWillPresentFullscreen:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[CNContactContentContainerViewController isEditing](self, "isEditing", a3))
  {
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentContainerViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isPresentingFullscreen:", 1);

    }
  }
}

- (void)contactEditViewControllerWillDismissFullscreen:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[CNContactContentContainerViewController isEditing](self, "isEditing", a3))
  {
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactContentContainerViewController delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isPresentingFullscreen:", 0);

    }
  }
}

- (void)contactEditViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (v6)
  {
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContact:", v6);

  }
  -[CNContactContentContainerViewController setEditing:](self, "setEditing:", 0);
  -[CNContactContentContainerViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (BOOL)isSuggestedContact
{
  void *v2;
  char v3;

  -[CNContactContentContainerViewController contact](self, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuggested");

  return v3;
}

- (void)setNeedsReload
{
  _QWORD block[5];

  self->_needsReload = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CNContactContentContainerViewController_setNeedsReload__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating)
    return 0;
  -[CNContactContentContainerViewController reloadDataPreservingChanges:](self, "reloadDataPreservingChanges:", 0);
  return 1;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "areKeysAvailable:useIgnorableKeys:findMissingKeys:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(v8, "second");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController setMissingRequiredKeys:](self, "setMissingRequiredKeys:", v12);

    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2299;
    v28 = __Block_byref_object_dispose__2300;
    v29 = 0;
    v13 = objc_alloc(MEMORY[0x1E0C97210]);
    -[CNContactContentContainerViewController missingRequiredKeys](self, "missingRequiredKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v14);

    v16 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateForContactsWithIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v19);

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    -[CNContactContentContainerViewController contactStore](self, "contactStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__CNContactContentContainerViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E204FB18;
    v23[4] = &v24;
    objc_msgSend(v20, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, 0, v23);

    v21 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v21, "overwriteStateFromContact:", v25[5]);
    objc_msgSend(v21, "freeze");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNContactContentContainerViewController missingRequiredKeys](self, "missingRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CNContactContentContainerViewController missingRequiredKeys](self, "missingRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeKeys:", v8);

    objc_msgSend(v7, "setFrozenSelfAsSnapshot");
    v4 = v7;
  }
  return v4;
}

- (void)_didCompleteWithContact:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactContentContainerViewController contactDelegate](self, "contactDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactViewController:didCompleteWithContact:", self, v10);

  }
  -[CNContactContentContainerViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNContactContentContainerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didCompleteWithContact:", v10);

  }
}

- (void)createdNewContact:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[CNContactContentContainerViewController setPrimaryProperty:](self, "setPrimaryProperty:", 0);
    -[CNContactContentContainerViewController setContact:](self, "setContact:", v6);
    -[CNContactContentContainerViewController setMode:](self, "setMode:", 1);
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMode:", 1);

    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsReload");

    -[CNContactContentContainerViewController setIsSupressingViewConfigurationUpdates:](self, "setIsSupressingViewConfigurationUpdates:", 1);
    -[CNContactContentContainerViewController setAllowsEditing:](self, "setAllowsEditing:", 1);
    -[CNContactContentContainerViewController setAllowsAddingToAddressBook:](self, "setAllowsAddingToAddressBook:", 0);
    -[CNContactContentContainerViewController setAllowsAddToFavorites:](self, "setAllowsAddToFavorites:", 1);
    -[CNContactContentContainerViewController setIsSupressingViewConfigurationUpdates:](self, "setIsSupressingViewConfigurationUpdates:", 0);
    -[CNContactContentContainerViewController didUpdateContactViewConfiguration](self, "didUpdateContactViewConfiguration");
  }
  -[CNContactContentContainerViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (void)updatedExistingContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CNContactContentContainerViewController contact](self, "contact");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[CNContactContentContainerViewController setContact:](self, "setContact:", v5);
  -[CNContactContentContainerViewController _didCompleteWithContact:](self, "_didCompleteWithContact:", v6);

}

- (void)reloadUnifiedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNContactContentContainerViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();

  -[CNContactContentContainerViewController contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkedContacts");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    objc_msgSend(v4, "unifyContacts:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController setContact:](self, "setContact:", v7);

    v6 = v8;
  }

}

- (void)setMode:(int64_t)a3
{
  void *v5;
  CNContactContentEditViewController *editContactViewController;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[CNContactContentContainerViewController displayContactViewController](self, "displayContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMode:", a3);

    editContactViewController = self->_editContactViewController;
    if (editContactViewController)
      -[CNContactContentEditViewController setMode:](editContactViewController, "setMode:", a3);
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentContainerViewController;
  -[CNContactContentContainerViewController encodeRestorableStateWithCoder:](&v18, sel_encodeRestorableStateWithCoder_, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[CNContactContentContainerViewController BOOLStateRestorationProperties](CNContactContentContainerViewController, "BOOLStateRestorationProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CNContactContentContainerViewController valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  -[CNContactContentContainerViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("Identifier"));

}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentContainerViewController saveCommand](self, "saveCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController setSaveCommand:](self, "setSaveCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SAVE_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController saveCommand](self, "saveCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentContainerViewController saveCommand](self, "saveCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentContainerViewController saveCommand](self, "saveCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentContainerViewController setSaveCommand:](self, "setSaveCommand:", 0);
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[CNContactContentContainerViewController cancelCommand](self, "cancelCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_editCancel_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController setCancelCommand:](self, "setCancelCommand:", v6);

      -[CNContactContentContainerViewController cancelCommand](self, "cancelCommand");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController addKeyCommand:](self, "addKeyCommand:", v8);

    }
  }
  else if (v5)
  {
    -[CNContactContentContainerViewController cancelCommand](self, "cancelCommand");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController removeKeyCommand:](self, "removeKeyCommand:", v7);

    -[CNContactContentContainerViewController setCancelCommand:](self, "setCancelCommand:", 0);
  }
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[CNContactContentContainerViewController editCommand](self, "editCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("l"), 0x100000, sel_toggleEditing_);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController setEditCommand:](self, "setEditCommand:", v6);

      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_CONTACT_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController editCommand](self, "editCommand");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDiscoverabilityTitle:", v8);

      -[CNContactContentContainerViewController editCommand](self, "editCommand");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactContentContainerViewController addKeyCommand:](self, "addKeyCommand:", v11);

    }
  }
  else if (v5)
  {
    -[CNContactContentContainerViewController editCommand](self, "editCommand");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactContentContainerViewController removeKeyCommand:](self, "removeKeyCommand:", v10);

    -[CNContactContentContainerViewController setEditCommand:](self, "setEditCommand:", 0);
  }
}

- (void)applicationLeftForeground:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isFullAccessGranted")
    && -[CNContactContentContainerViewController isEditing](self, "isEditing")
    && -[CNContactContentContainerViewController hasPendingChanges](self, "hasPendingChanges")
    && -[CNContactContentContainerViewController mode](self, "mode") == 3)
  {
    -[CNContactContentContainerViewController editContactViewController](self, "editContactViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveNewContactDraft");

  }
}

- (CNContactViewHostProtocol)delegate
{
  return (CNContactViewHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  return (CNContactViewControllerPPTDelegate *)objc_loadWeakRetained((id *)&self->_pptDelegate);
}

- (void)setPptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pptDelegate, a3);
}

- (id)presentingDelegate
{
  return objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (id)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewConfiguration, a3);
}

- (id)contact
{
  return self->_contact;
}

- (id)contactStore
{
  return self->_contactStore;
}

- (void)setOriginalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_originalContacts, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (id)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (id)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (id)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (id)missingRequiredKeys
{
  return self->_missingRequireedKeys;
}

- (void)setMissingRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingRequireedKeys, a3);
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (id)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (id)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveContactExecutor, a3);
}

- (id)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, a3);
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (id)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (id)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (void)setCardFaceTimeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, a3);
}

- (id)contactDelegate
{
  return objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (id)recentsData
{
  return self->_recentsData;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (id)propertyGroups
{
  return self->_propertyGroups;
}

- (id)displayGroups
{
  return self->_displayGroups;
}

- (void)setDisplayGroups:(id)a3
{
  objc_storeStrong((id *)&self->_displayGroups, a3);
}

- (CNContactContentDisplayViewController)displayContactViewController
{
  return self->_displayContactViewController;
}

- (void)setDisplayContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_displayContactViewController, a3);
}

- (CNContactContentEditViewController)editContactViewController
{
  return self->_editContactViewController;
}

- (void)setEditContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editContactViewController, a3);
}

- (BOOL)isSupressingViewConfigurationUpdates
{
  return self->_isSupressingViewConfigurationUpdates;
}

- (void)setIsSupressingViewConfigurationUpdates:(BOOL)a3
{
  self->_isSupressingViewConfigurationUpdates = a3;
}

- (CNContactEditAuthorizationManager)editAuthorizationManager
{
  return self->_editAuthorizationManager;
}

- (void)setEditAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationManager, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activatedConstraints, a3);
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_headerHeightConstraint, a3);
}

- (BOOL)outOfProcessSetupComplete
{
  return self->_outOfProcessSetupComplete;
}

- (void)setOutOfProcessSetupComplete:(BOOL)a3
{
  self->_outOfProcessSetupComplete = a3;
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
}

- (void)setSaveCommand:(id)a3
{
  objc_storeStrong((id *)&self->_saveCommand, a3);
}

- (UIKeyCommand)editCommand
{
  return self->_editCommand;
}

- (void)setEditCommand:(id)a3
{
  objc_storeStrong((id *)&self->_editCommand, a3);
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)setCancelCommand:(id)a3
{
  objc_storeStrong((id *)&self->_cancelCommand, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_editAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_editContactViewController, 0);
  objc_storeStrong((id *)&self->_displayContactViewController, 0);
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_missingRequireedKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

void __90__CNContactContentContainerViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

uint64_t __57__CNContactContentContainerViewController_setNeedsReload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadDataIfNeeded");
}

uint64_t __90__CNContactContentContainerViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[1306])
  {
    objc_msgSend(v2, "_endDisablingInterfaceAutorotation");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1306) = 0;
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__CNContactContentContainerViewController_prepareContactDidAppearForPPT__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pptDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "viewDidAppearForContactViewController:", WeakRetained);

}

uint64_t __80__CNContactContentContainerViewController_performAuthorizedSetEditing_animated___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setAlpha:", 0.0);
  objc_msgSend(a1[5], "setAlpha:", 1.0);
  return objc_msgSend(a1[6], "setupConstraints");
}

void __63__CNContactContentContainerViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "performAuthorizedSetEditing:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    WeakRetained = v5;
  }

}

uint64_t __54__CNContactContentContainerViewController_setContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeBackgroundScheduler");
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableKeyDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentContainerViewController descriptorForRequiredKeysForContact:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptorWithKeyDescriptors:description:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)descriptorForRequiredKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactContentContainerViewController descriptorForRequiredKeys]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "descriptorForRequiredKeysWithDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CNContactContentContainerViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E204F648;
  v11 = v3;
  v4 = descriptorForRequiredKeysWithDescription__cn_once_token_3;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_3, block);
    v7 = v11;
  }
  v8 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_3;

  return v8;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1E20D3748;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactContentViewController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v7 = (void *)MEMORY[0x1E0C97200];
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactWithStateRestorationCoder:store:keys:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = v6;
    v11 = -[CNContactContentViewController initWithContact:]([CNContactContentViewController alloc], "initWithContact:", v10);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a1, "BOOLStateRestorationProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            -[CNContactContentViewController setValue:forKey:](v11, "setValue:forKey:", v18, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v6 = v20;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __84__CNContactContentContainerViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[CNContactContentDisplayViewController descriptorForRequiredKeys](CNContactContentDisplayViewController, "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  +[CNContactContentEditViewController descriptorForRequiredKeys](CNContactContentEditViewController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97200], "descriptorWithKeyDescriptors:description:", v4, *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_3;
  descriptorForRequiredKeysWithDescription__cn_once_object_3 = v5;

}

@end
