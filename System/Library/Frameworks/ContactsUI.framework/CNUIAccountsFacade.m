@implementation CNUIAccountsFacade

- (CNUIAccountsFacade)init
{
  return -[CNUIAccountsFacade initWithAccountStore:requestRunner:](self, "initWithAccountStore:requestRunner:", 0, 0);
}

- (CNUIAccountsFacade)initWithAccountStore:(id)a3 requestRunner:(id)a4
{
  id v6;
  id v7;
  CNUIAccountsFacade *v8;
  ACAccountStore *v9;
  ACAccountStore *accountStore;
  CNUIAccountsFacadeRequestRunner *v11;
  CNUIAccountsFacadeRequestRunner *requestRunner;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNUIAccountsFacade;
  v8 = -[CNUIAccountsFacade init](&v14, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (ACAccountStore *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v9 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    }
    accountStore = v8->_accountStore;
    v8->_accountStore = v9;

    if (v7)
      v11 = (CNUIAccountsFacadeRequestRunner *)v7;
    else
      v11 = objc_alloc_init(CNUIAccountsFacadeRequestRunner);
    requestRunner = v8->_requestRunner;
    v8->_requestRunner = v11;

    if (LoadAppleAccount_loadPredicate_48244 != -1)
      dispatch_once(&LoadAppleAccount_loadPredicate_48244, &__block_literal_global_39_48245);
  }

  return v8;
}

- (void)fetchiCloudFamilyMembersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNUIAccountsFacade accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIAccountsFacade requestRunner](self, "requestRunner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "aa_grandSlamAccountForiCloudAccount:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc((Class)getAAFamilyDetailsRequestClass[0]()), "initWithAppleAccount:grandSlamAccount:accountStore:", v7, v8, v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E204DF60;
    v11 = v4;
    objc_msgSend(v6, "performRequest:withHandler:", v9, v10);

  }
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (CNUIAccountsFacadeRequestRunner)requestRunner
{
  return self->_requestRunner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRunner, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E204F098;
  v12 = v7;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v1)
      (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else if (v1)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "members");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cn_map:", &__block_literal_global_48241);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v3, 0);

  }
}

id __68__CNUIAccountsFacade_fetchiCloudFamilyMembersWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[CNUIAAfamilyMember cnuiFamilyMemberWithAAFamilyMember:](CNUIAAfamilyMember, "cnuiFamilyMemberWithAAFamilyMember:", a2);
}

@end
