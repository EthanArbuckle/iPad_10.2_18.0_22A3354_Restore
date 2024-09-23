@implementation CNReputationContactsAdapter

- (CNReputationContactsAdapter)init
{
  CNContactStore *v3;
  CNReputationContactsAdapter *v4;

  v3 = objc_alloc_init(CNContactStore);
  v4 = -[CNReputationContactsAdapter initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (CNReputationContactsAdapter)initWithContactStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNReputationContactsAdapter *v7;

  v4 = (void *)MEMORY[0x1E0D13B70];
  v5 = a3;
  objc_msgSend(v4, "providerWithBackgroundConcurrencyLimit:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNReputationContactsAdapter initWithContactStore:schedulerProvider:](self, "initWithContactStore:schedulerProvider:", v5, v6);

  return v7;
}

- (CNReputationContactsAdapter)initWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  id v7;
  id v8;
  CNReputationContactsAdapter *v9;
  CNReputationContactsAdapter *v10;
  uint64_t v11;
  CNScheduler *storeScheduler;
  CNReputationContactsAdapter *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNReputationContactsAdapter;
  v9 = -[CNReputationContactsAdapter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    v11 = objc_msgSend(v8, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.reputation.contacts-store-scheduler"));
    storeScheduler = v10->_storeScheduler;
    v10->_storeScheduler = (CNScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)contactsForEmailAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  (*(void (**)(void))(*MEMORY[0x1E0D13760] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke;
  v9[3] = &unk_1E29FCB88;
  v9[4] = self;
  objc_msgSend(v4, "_cn_map:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "join:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flatMap:", &__block_literal_global_102);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[CNContact predicateForContactsMatchingEmailAddress:](CNContact, "predicateForContactsMatchingEmailAddress:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v8[0] = CFSTR("emailAddresses");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactsForPredicate:keys:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__CNReputationContactsAdapter_contactsForEmailAddress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13A68];
  objc_msgSend(a2, "_cn_flatten");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactsForPhoneNumber:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContact predicateForContactsMatchingPhoneNumber:](CNContact, "predicateForContactsMatchingPhoneNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = CFSTR("phoneNumbers");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReputationContactsAdapter contactsForPredicate:keys:](self, "contactsForPredicate:keys:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactsForPredicate:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D13A68];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CNReputationContactsAdapter_contactsForPredicate_keys___block_invoke;
  v14[3] = &unk_1E29FCBB0;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  -[CNReputationContactsAdapter storeScheduler](self, "storeScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithBlock:scheduler:", v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __57__CNReputationContactsAdapter_contactsForPredicate_keys___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)storeScheduler
{
  return self->_storeScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
