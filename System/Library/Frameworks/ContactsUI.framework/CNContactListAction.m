@implementation CNContactListAction

- (CNContactListAction)initWithContacts:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  CNContactListAction *v9;
  CNContactListAction *v10;
  CNContactListAction *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactListAction;
  v9 = -[CNContactListAction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a4);
    objc_storeStrong((id *)&v10->_contacts, a3);
    v11 = v10;
  }

  return v10;
}

- (BOOL)shouldReloadListOnCompletion
{
  return 0;
}

- (BOOL)editRequiresAuthorization
{
  CNContactListAction *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[CNContactListAction contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CNContactListAction_editRequiresAuthorization__block_invoke;
  v5[3] = &unk_1E2050520;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "_cn_any:", v5);

  return (char)v2;
}

- (BOOL)editRequiresAuthorizationCheckForContact:(id)a3 containerIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0D13CB8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[CNContactListAction configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerForContainerIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v9, "initWithContact:parentContainer:ignoresParentalRestrictions:", v8, v11, 0);
  LOBYTE(v8) = objc_msgSend(v12, "shouldPromptForPasscodeAuthorization");

  return (char)v8;
}

- (CNContactListActionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (CNContactListActionDelegate)delegate
{
  return (CNContactListActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __48__CNContactListAction_editRequiresAuthorization__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactViewCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerForContact:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(*(id *)(a1 + 32), "editRequiresAuthorizationCheckForContact:containerIdentifier:", v4, v8);
  return v9;
}

@end
