@implementation CRKConcreteContactsPrimitives

- (CRKConcreteContactsPrimitives)init
{
  void *v3;
  CRKConcreteContactsPrimitives *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKConcreteContactsPrimitives initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (CRKConcreteContactsPrimitives)initWithContactStore:(id)a3
{
  id v5;
  CRKConcreteContactsPrimitives *v6;
  CRKConcreteContactsPrimitives *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteContactsPrimitives;
  v6 = -[CRKConcreteContactsPrimitives init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contactStore, a3);

  return v7;
}

- (id)fetchMeCardContactWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CRKConcreteContact *v10;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  -[CRKConcreteContactsPrimitives contactStore](self, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBA2C8];
  v12[0] = *MEMORY[0x24BDBA2E0];
  v12[1] = v5;
  v6 = *MEMORY[0x24BDBA360];
  v12[2] = *MEMORY[0x24BDBA2C0];
  v12[3] = v6;
  v7 = *MEMORY[0x24BDBA328];
  v12[4] = *MEMORY[0x24BDBA358];
  v12[5] = v7;
  v12[6] = *MEMORY[0x24BDBA3E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = -[CRKConcreteContact initWithContact:]([CRKConcreteContact alloc], "initWithContact:", v9);
  else
    v10 = 0;

  return v10;
}

- (id)subscribeToContactsChanges:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = *MEMORY[0x24BDBA3D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__CRKConcreteContactsPrimitives_subscribeToContactsChanges___block_invoke;
  v9[3] = &unk_24D9C7130;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "subscribeToNotificationWithName:object:handler:", v5, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__CRKConcreteContactsPrimitives_subscribeToContactsChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
