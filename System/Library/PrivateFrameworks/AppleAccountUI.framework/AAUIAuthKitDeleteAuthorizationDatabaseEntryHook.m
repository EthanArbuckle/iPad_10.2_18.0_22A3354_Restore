@implementation AAUIAuthKitDeleteAuthorizationDatabaseEntryHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("database:revoke"));

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

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("database:revoke"));
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("clientID"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAuthKitDeleteAuthorizationDatabaseEntryHook _revokeAuthorizationForClientID:completion:](self, "_revokeAuthorizationForClientID:completion:", v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAuthKitDeleteAuthorizationDatabaseEntryHook _revokeAuthorizationForClientID:completion:](self, "_revokeAuthorizationForClientID:completion:", v7, v6);

}

- (void)_revokeAuthorizationForClientID:(id)a3 completion:(id)a4
{
  objc_class *v5;
  void (**v6)(id, uint64_t, id);
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0D00130];
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v11 = 0;
  v9 = objc_msgSend(v8, "revokeAuthorizationForApplicationWithClientID:error:", v7, &v11);

  v10 = v11;
  v6[2](v6, v9, v10);

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
}

@end
