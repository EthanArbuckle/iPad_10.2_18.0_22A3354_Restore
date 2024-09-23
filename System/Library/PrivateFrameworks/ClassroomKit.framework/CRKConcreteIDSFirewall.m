@implementation CRKConcreteIDSFirewall

- (CRKConcreteIDSFirewall)initWithUnderlyingFirewall:(id)a3
{
  id v5;
  CRKConcreteIDSFirewall *v6;
  CRKConcreteIDSFirewall *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSFirewall;
  v6 = -[CRKConcreteIDSFirewall init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingFirewall, a3);

  return v7;
}

- (void)addAllowedAppleIDs:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSFirewall.m"), 42, CFSTR("%@ must be called from the main thread"), v14);

  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke;
    v17[3] = &unk_24D9C6E60;
    v17[4] = self;
    objc_msgSend(v7, "crk_mapUsingBlock:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKConcreteIDSFirewall underlyingFirewall](self, "underlyingFirewall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_2;
    v15[3] = &unk_24D9C6EB0;
    v16 = v8;
    objc_msgSend(v11, "donateEntries:withCompletion:", v12, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

id __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "firewallEntryForAppleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_3;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __56__CRKConcreteIDSFirewall_addAllowedAppleIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeAllowedAppleIDs:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSFirewall.m"), 65, CFSTR("%@ must be called from the main thread"), v14);

  }
  if (objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke;
    v17[3] = &unk_24D9C6E60;
    v17[4] = self;
    objc_msgSend(v7, "crk_mapUsingBlock:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKConcreteIDSFirewall underlyingFirewall](self, "underlyingFirewall");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_2;
    v15[3] = &unk_24D9C6EB0;
    v16 = v8;
    objc_msgSend(v11, "removeDonatedEntries:withCompletion:", v12, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

id __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "firewallEntryForAppleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_3;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __59__CRKConcreteIDSFirewall_removeAllowedAppleIDs_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchAllowedAppleIDsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSFirewall.m"), 88, CFSTR("%@ must be called from the main thread"), v9);

  }
  -[CRKConcreteIDSFirewall underlyingFirewall](self, "underlyingFirewall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke;
  v10[3] = &unk_24D9C6F68;
  v10[4] = self;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "currentDonatedEntries:", v10);

}

void __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_2;
  v11[3] = &unk_24D9C6F40;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v15 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "crk_filterUsingBlock:", &__block_literal_global_3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x24BDBCF20];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_4;
    v6[3] = &unk_24D9C6F18;
    v6[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "crk_mapUsingBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDonated");
}

id __61__CRKConcreteIDSFirewall_fetchAllowedAppleIDsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "appleIDFromFirewallEntry:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)firewallEntryForAppleID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE4FCE0], "URIWithUnprefixedURI:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FC30]), "initWithURI:", v3);

  return v4;
}

+ (id)appleIDFromFirewallEntry:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "uri");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unprefixedURI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (IDSFirewall)underlyingFirewall
{
  return self->_underlyingFirewall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingFirewall, 0);
}

@end
