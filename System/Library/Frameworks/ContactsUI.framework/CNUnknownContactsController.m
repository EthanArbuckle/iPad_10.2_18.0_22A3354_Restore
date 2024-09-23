@implementation CNUnknownContactsController

- (CNUnknownContactsController)initWithContacts:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNUnknownContactsController *v9;
  CNContactStore *v10;
  CNContactStore *contactStore;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)CNUnknownContactsController;
    v9 = -[CNUnknownContactsController init](&v13, sel_init);
    if (v9)
    {
      if (v8)
        v10 = (CNContactStore *)v8;
      else
        v10 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
      contactStore = v9->_contactStore;
      v9->_contactStore = v10;

      objc_storeStrong((id *)&v9->_contacts, a3);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)viewController
{
  CNMultipleUnknownContactsViewController *v3;
  void *v4;
  unint64_t v5;
  CNMultipleUnknownContactsViewController *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CNUnknownContactsController displayedController](self, "displayedController");
  v3 = (CNMultipleUnknownContactsViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CNUnknownContactsController contacts](self, "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 < 2)
    {
      -[CNUnknownContactsController contacts](self, "contacts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v8);
      v3 = (CNMultipleUnknownContactsViewController *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = [CNMultipleUnknownContactsViewController alloc];
      -[CNUnknownContactsController contacts](self, "contacts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[CNMultipleUnknownContactsViewController initWithContacts:](v6, "initWithContacts:", v7);
    }

    -[CNUnknownContactsController contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMultipleUnknownContactsViewController setContactStore:](v3, "setContactStore:", v9);

    -[CNMultipleUnknownContactsViewController setDelegate:](v3, "setDelegate:", self);
    -[CNUnknownContactsController setDisplayedController:](self, "setDisplayedController:", v3);
  }
  return v3;
}

- (void)multipleUnknownContactsViewControllerDidComplete:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNUnknownContactsController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNUnknownContactsController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unknownContactsControllerDidComplete:", self);

  }
}

- (BOOL)multipleUnknownContactsViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNUnknownContactsController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNUnknownContactsController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unknownContactsController:shouldPerformDefaultActionForContactProperty:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[CNUnknownContactsController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNUnknownContactsController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unknownContactsController:shouldPerformDefaultActionForContactProperty:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[CNUnknownContactsController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNUnknownContactsController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unknownContactsControllerDidComplete:", self);

  }
}

- (CNUnknownContactsControllerDelegate)delegate
{
  return (CNUnknownContactsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (UIViewController)displayedController
{
  return self->_displayedController;
}

- (void)setDisplayedController:(id)a3
{
  objc_storeStrong((id *)&self->_displayedController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedController, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[CNMultipleUnknownContactsViewController descriptorForRequiredKeys](CNMultipleUnknownContactsViewController, "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUnknownContactsController descriptorForRequiredKeys]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
