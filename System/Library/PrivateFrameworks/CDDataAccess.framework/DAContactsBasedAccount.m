@implementation DAContactsBasedAccount

- (DAContactsBasedAccount)initWithAccount:(id)a3
{
  id v5;
  DAContactsBasedAccount *v6;
  DAContactsBasedAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DAContactsBasedAccount;
  v6 = -[DAContactsBasedAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (int)legacyIdentifier
{
  void *v2;
  int v3;

  -[DAContactsBasedAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iOSLegacyIdentifier");

  return v3;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[DAContactsBasedAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)externalIdentifier
{
  void *v2;
  void *v3;

  -[DAContactsBasedAccount account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isContact
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isContainer
{
  return 0;
}

- (BOOL)isAccount
{
  return 1;
}

- (void)updateSaveRequest:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  v4 = -[DAContactsBasedAccount markedForDeletion](self, "markedForDeletion");
  -[DAContactsBasedAccount account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v8, "removeAccount:", v5);
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "iOSLegacyIdentifier");

  if (v7 == -1)
  {
    -[DAContactsBasedAccount account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAccount:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)markForDeletion
{
  -[DAContactsBasedAccount setMarkedForDeletion:](self, "setMarkedForDeletion:", 1);
}

- (CNAccount)account
{
  return self->_account;
}

- (BOOL)markedForDeletion
{
  return self->_markedForDeletion;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  self->_markedForDeletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
