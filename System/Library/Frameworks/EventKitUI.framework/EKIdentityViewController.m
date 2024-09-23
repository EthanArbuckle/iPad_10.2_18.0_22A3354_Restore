@implementation EKIdentityViewController

- (id)CNContactEmailAddressesKey
{
  return (id)EKWeakLinkStringConstant();
}

- (id)CNContactPhoneNumbersKey
{
  return (id)EKWeakLinkStringConstant();
}

+ (id)_CNLabelWork
{
  return (id)EKWeakLinkStringConstant();
}

+ (Class)_CNContactStoreClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNContactStoreConfigurationClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNContactClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNMutableContactClass
{
  return (Class)EKWeakLinkClass();
}

- (Class)_CNContactViewControllerClass
{
  return (Class)EKWeakLinkClass();
}

+ (Class)_CNLabeledValueClass
{
  return (Class)EKWeakLinkClass();
}

- (EKIdentityViewController)initWithIdentity:(id)a3
{
  id v4;
  EKIdentityViewController *v5;
  uint64_t v6;
  CNContactStore *store;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKIdentityViewController;
  v5 = -[EKIdentityViewController init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_createContactStore");
    v6 = objc_claimAutoreleasedReturnValue();
    store = v5->_store;
    v5->_store = (CNContactStore *)v6;

    -[EKIdentityViewController _setIdentity:](v5, "_setIdentity:", v4);
  }

  return v5;
}

+ (id)_createContactStore
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)objc_msgSend(a1, "_CNContactStoreConfigurationClass"));
  objc_msgSend(v3, "setIncludeIncludeManagedAppleIDs:", 1);
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_CNContactStoreClass")), "initWithConfiguration:", v3);

  return v4;
}

+ (id)contactForIdentity:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_createContactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fetchContactForIdentity:store:keysToFetch:", v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "_createContactForIdentity:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_fetchContactForIdentity:(id)a3 store:(id)a4 keysToFetch:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "emailAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(a1, "_CNContactClass");
  if (v11)
  {
    objc_msgSend(v10, "emailAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "predicateForContactsMatchingEmailAddress:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C97398];
    objc_msgSend(v10, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "phoneNumberWithStringValue:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateForContactsMatchingPhoneNumber:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v14, v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_createContactForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_CNMutableContactClass");
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length")
    && (objc_msgSend(v8, "cal_isPhoneNumber") & 1) == 0
    && (!objc_msgSend(v9, "length") || !objc_msgSend(v10, "length")))
  {
    CUIKDecomposedAttendeeName();
    v11 = v9;

    v12 = v10;
    v10 = v12;
    v9 = v11;
  }
  if (v6)
  {
    v13 = objc_alloc((Class)objc_msgSend(a1, "_CNLabeledValueClass"));
    objc_msgSend(a1, "_CNLabelWork");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithLabel:value:", v14, v6);

    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEmailAddresses:", v16);
  }
  else
  {
    if (!v7)
      goto LABEL_11;
    v17 = objc_alloc((Class)objc_msgSend(a1, "_CNLabeledValueClass"));
    objc_msgSend(a1, "_CNLabelWork");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v17, "initWithLabel:value:", v18, v19);

    v21 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPhoneNumbers:", v16);
  }

LABEL_11:
  if (v9)
  {
    objc_msgSend(v5, "setGivenName:", v9);
    if (!v10)
      goto LABEL_16;
  }
  else if (!v10)
  {
    objc_msgSend(v5, "setGivenName:", v8);
    goto LABEL_16;
  }
  objc_msgSend(v5, "setFamilyName:", v10);
LABEL_16:

  return v5;
}

- (void)_updateControllerWithContact:(id)a3 isNew:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  CNContactViewController *v7;
  CNContactViewController *v8;
  CNContactViewController *personViewController;
  CNContactViewController *v10;
  CNContactViewController *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = -[EKIdentityViewController _CNContactViewControllerClass](self, "_CNContactViewControllerClass");
  if (v12)
  {
    if (v4)
      -[objc_class viewControllerForUnknownContact:](v6, "viewControllerForUnknownContact:", v12);
    else
      -[objc_class viewControllerForContact:](v6, "viewControllerForContact:", v12);
    v7 = (CNContactViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[objc_class viewControllerForNewContact:](v6, "viewControllerForNewContact:", 0);
    v7 = (CNContactViewController *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  -[CNContactViewController setContactStore:](v7, "setContactStore:", self->_store);
  -[CNContactViewController setShouldShowLinkedContacts:](v8, "setShouldShowLinkedContacts:", 1);
  -[CNContactViewController setDisplayMode:](v8, "setDisplayMode:", 1);
  -[CNContactViewController setAllowsEditing:](v8, "setAllowsEditing:", 0);
  personViewController = self->_personViewController;
  self->_personViewController = v8;
  v10 = v8;
  v11 = personViewController;

  -[EKIdentityViewController addChildViewController:](self, "addChildViewController:", self->_personViewController);
  -[EKIdentityViewController removeChildViewController:](self, "removeChildViewController:", v11);
  -[CNContactViewController didMoveToParentViewController:](self->_personViewController, "didMoveToParentViewController:", self);

}

- (void)loadView
{
  id v3;
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
  id firstValue;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKIdentityViewController setView:](self, "setView:", v4);

  -[CNContactViewController view](self->_personViewController, "view");
  firstValue = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(firstValue, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKIdentityViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", firstValue);

  -[EKIdentityViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("personView"), firstValue, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[personView]|"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v9);

  -[EKIdentityViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("personView"), firstValue, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[personView]|"), 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v13);

}

- (void)_setIdentity:(id)a3
{
  EKIdentityProtocol *v5;
  EKIdentityProtocol **p_identity;
  void *v7;
  CNContactStore *store;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  CNContactViewController *personViewController;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = (EKIdentityProtocol *)a3;
  p_identity = &self->_identity;
  if (self->_identity != v5)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    if (*p_identity)
    {
      v7 = (void *)objc_opt_class();
      store = self->_store;
      -[objc_class descriptorForRequiredKeys](-[EKIdentityViewController _CNContactViewControllerClass](self, "_CNContactViewControllerClass"), "descriptorForRequiredKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_fetchContactForIdentity:store:keysToFetch:", v5, store, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[EKIdentityViewController _updateControllerWithContact:isNew:](self, "_updateControllerWithContact:isNew:", v11, 0);
        -[EKIdentityProtocol URL](v5, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "cal_hasSchemeTel");

        personViewController = self->_personViewController;
        if (v13)
          -[EKIdentityViewController CNContactPhoneNumbersKey](self, "CNContactPhoneNumbersKey");
        else
          -[EKIdentityViewController CNContactEmailAddressesKey](self, "CNContactEmailAddressesKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactViewController highlightPropertyWithKey:identifier:](personViewController, "highlightPropertyWithKey:identifier:", v15, v16);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_createContactForIdentity:", *p_identity);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKIdentityViewController _updateControllerWithContact:isNew:](self, "_updateControllerWithContact:isNew:", v11, 1);
      }

    }
    else
    {
      -[EKIdentityViewController _updateControllerWithContact:isNew:](self, "_updateControllerWithContact:isNew:", 0, 1);
    }
  }

}

- (id)EKUI_oopContentBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_personViewController, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
