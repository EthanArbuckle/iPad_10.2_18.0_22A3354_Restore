@implementation CNVCardViewController

- (CNVCardViewController)initWithVCardData:(id)a3
{
  id v3;
  CNVCardViewController *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNVCardViewController;
  v3 = a3;
  v4 = -[CNVCardViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v12;
  -[CNVCardViewController setContacts:](v4, "setContacts:", v5);

  if (v6)
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNVCardViewController.m", 35, 3, CFSTR("Error parsing vCard data: %@"), v7, v8, v9, v10, (uint64_t)v6);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CNContactNavigationController *v7;
  CNContactCustomDataSource *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  CNContactCustomDataSource *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)CNVCardViewController;
  -[CNVCardViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[CNVCardViewController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v7 = (CNContactNavigationController *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v10, v11, v12, v13);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    +[CNUIColorRepository contactStyleDefaultDisabledTextColor](CNUIColorRepository, "contactStyleDefaultDisabledTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    CNContactsUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NO_VCARDS_FOUND"), &stru_1E20507A8, CFSTR("Localized"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v18);

    objc_msgSend(v14, "sizeToFit");
    -[CNContactNavigationController addSubview:](v7, "addSubview:", v14);
    v19 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 9, 0, v7, 9, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, v7, 10, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v22);

    +[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactNavigationController setBackgroundColor:](v7, "setBackgroundColor:", v23);

    if (!v7)
      return;
    -[CNVCardViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    -[CNContactNavigationController setFrame:](v7, "setFrame:");

    -[CNContactNavigationController setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[CNVCardViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v7);

    goto LABEL_9;
  }
  if (v4 == 1)
  {
    -[CNVCardViewController contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v6);
    v7 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue();

    v8 = (CNContactCustomDataSource *)objc_alloc_init(MEMORY[0x1E0C97298]);
    -[CNContactNavigationController setContactStore:](v7, "setContactStore:", v8);
  }
  else
  {
    v26 = [CNContactCustomDataSource alloc];
    -[CNVCardViewController contacts](self, "contacts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNContactCustomDataSource initWithContacts:keysToFetch:](v26, "initWithContacts:keysToFetch:", v27, v29);

    -[CNContactCustomDataSource setAutoUpdateContacts:](v8, "setAutoUpdateContacts:", 0);
    v7 = -[CNContactNavigationController initWithDataSource:]([CNContactNavigationController alloc], "initWithDataSource:", v8);
    -[CNContactNavigationController setAllowsCanceling:](v7, "setAllowsCanceling:", 1);
    -[CNContactNavigationController setDelegate:](v7, "setDelegate:", self);
  }

  if (v7)
  {
    -[UIViewController cnui_addChildViewController:](self, "cnui_addChildViewController:", v7);
LABEL_9:

  }
}

- (id)contactNavigationController:(id)a3 contactViewControllerForContact:(id)a4 preferredMode:(int64_t)a5
{
  return +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", a4);
}

- (void)contactNavigationControllerDidComplete:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNVCardViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNVCardViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vCardViewControllerDidComplete:", self);

  }
}

- (void)contactNavigationControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNVCardViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNVCardViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vCardViewControllerDidComplete:", self);

  }
}

- (CNContactNavigationController)contactNavigationController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[CNVCardViewController view](self, "view");

  -[CNVCardViewController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    -[CNVCardViewController childViewControllers](self, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 != 1)
    {
      v6 = 0;
      return (CNContactNavigationController *)v6;
    }
    -[CNVCardViewController childViewControllers](self, "childViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (CNContactNavigationController *)v6;
}

- (CNVCardViewControllerDelegate)delegate
{
  return (CNVCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
