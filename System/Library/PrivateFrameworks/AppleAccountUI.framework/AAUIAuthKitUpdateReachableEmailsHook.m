@implementation AAUIAuthKitUpdateReachableEmailsHook

- (AAUIAuthKitUpdateReachableEmailsHook)initWithAltDSID:(id)a3
{
  id v5;
  AAUIAuthKitUpdateReachableEmailsHook *v6;
  AAUIAuthKitUpdateReachableEmailsHook *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAuthKitUpdateReachableEmailsHook;
  v6 = -[AAUIAuthKitUpdateReachableEmailsHook init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("emails:update"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  char v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D87308]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("emails:update"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v8 = a6;
  v9 = a4;
  objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("reachableEmails"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  -[AAUIAuthKitUpdateReachableEmailsHook _updateAccountWithReachableEmails:completion:](self, "_updateAccountWithReachableEmails:completion:", v12, v8);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  objc_msgSend(v7, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reachableEmails"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  -[AAUIAuthKitUpdateReachableEmailsHook _updateAccountWithReachableEmails:completion:](self, "_updateAccountWithReachableEmails:completion:", v10, v6);
}

- (void)_updateAccountWithReachableEmails:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0D002B0];
  v7 = a4;
  v8 = a3;
  v10 = objc_alloc_init(v6);
  objc_msgSend(v10, "setReachableEmails:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0D00130]);
  objc_msgSend(v9, "updateUserInformationForAltDSID:userInformation:completion:", self->_altDSID, v10, v7);

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
