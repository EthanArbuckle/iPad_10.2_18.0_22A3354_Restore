@implementation CRKASMConcreteUserFetcher

- (CRKASMConcreteUserFetcher)initWithRosterRequirements:(id)a3
{
  id v5;
  CRKASMConcreteUserFetcher *v6;
  CRKASMConcreteUserFetcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMConcreteUserFetcher;
  v6 = -[CRKASMConcreteUserFetcher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rosterRequirements, a3);

  return v7;
}

- (void)fetchASMUsersWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[CRKASMConcreteUserFetcher rosterRequirements](self, "rosterRequirements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeQueryForPersonsWithIdentifiers:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke;
  v12[3] = &unk_24D9C6DC0;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "setCompletion:", v12);
  -[CRKASMConcreteUserFetcher rosterRequirements](self, "rosterRequirements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeQuery:", v9);

}

void __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_2;
  block[3] = &unk_24D9C6D98;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_0, &__block_literal_global_2_0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

CRKASMConcreteUser *__69__CRKASMConcreteUserFetcher_fetchASMUsersWithIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  CRKASMConcreteUser *v3;

  v2 = a2;
  v3 = -[CRKASMConcreteUser initWithBackingPerson:]([CRKASMConcreteUser alloc], "initWithBackingPerson:", v2);

  return v3;
}

- (CRKClassKitRosterRequirements)rosterRequirements
{
  return self->_rosterRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rosterRequirements, 0);
}

@end
