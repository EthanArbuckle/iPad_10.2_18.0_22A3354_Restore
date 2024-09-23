@implementation FAShowAccountDetailsHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:showAccountDetails"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:showAccountDetails"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("altDSID"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:](self, "_showAccountDetailsFor:withCompletion:", v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("altDSID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:](self, "_showAccountDetailsFor:withCompletion:", v7, v6);

}

- (void)_showAccountDetailsFor:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "%s - show account details for %@", buf, 0x16u);
  }

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setCachePolicy:", 1);
  objc_msgSend(v9, "setQualityOfService:", 33);
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke;
  v12[3] = &unk_24C88CDF0;
  objc_copyWeak(&v15, (id *)buf);
  v10 = v7;
  v14 = v10;
  v11 = v6;
  v13 = v11;
  objc_msgSend(v9, "startRequestWithCompletionHandler:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    _FALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_cold_1((uint64_t)v6, v8);

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    objc_msgSend(v5, "members");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12;
    v14 = objc_msgSend(a1[4], "length");
    v15 = MEMORY[0x24BDAC760];
    v16 = v13;
    if (v14)
    {
      objc_msgSend(v5, "members");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1758];
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_2;
      v31[3] = &unk_24C88CDA0;
      v32 = a1[4];
      objc_msgSend(v18, "predicateWithBlock:", v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filteredArrayUsingPredicate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_3;
    block[3] = &unk_24C88CDC8;
    v25 = v13;
    v26 = v16;
    v27 = v5;
    v28 = WeakRetained;
    v21 = a1[5];
    v29 = 0;
    v30 = v21;
    v22 = v16;
    v23 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMe");
}

uint64_t __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[FASwiftUIHostingControllerProvider familyMemberAccountChangePasswordControllerWithMainAccount:memberToShow:familyCircle:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "familyMemberAccountChangePasswordControllerWithMainAccount:memberToShow:familyCircle:", a1[4], a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 8));
  objc_msgSend(WeakRetained, "presentationContextForHook:", a1[7]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "showViewController:sender:", v2, 0);
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 136315650;
    v9 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]_block_invoke_3";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "%s - %@ Displaying member details for %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[9] + 16))();
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

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]_block_invoke";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "Error %s - %@", (uint8_t *)&v2, 0x16u);
}

@end
