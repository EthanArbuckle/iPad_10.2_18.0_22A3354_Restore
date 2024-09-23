@implementation CNReputationFutureBuilder

- (CNReputationFutureBuilder)initWithHandle:(id)a3 coreRecentsAdapter:(id)a4 contactsAdapter:(id)a5 logger:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNReputationFutureBuilder *v14;
  uint64_t v15;
  CNReputationHandle *handle;
  CNReputationFutureBuilder *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNReputationFutureBuilder;
  v14 = -[CNReputationFutureBuilder init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    handle = v14->_handle;
    v14->_handle = (CNReputationHandle *)v15;

    objc_storeStrong((id *)&v14->_coreRecentsAdapter, a4);
    objc_storeStrong((id *)&v14->_contactsAdapter, a5);
    objc_storeStrong((id *)&v14->_logger, a6);
    v17 = v14;
  }

  return v14;
}

- (void)addCoreRecentsTrust
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__CNReputationFutureBuilder_addCoreRecentsTrust__block_invoke;
    v9[3] = &unk_1E29FAA38;
    v9[4] = self;
    objc_msgSend(v4, "recover:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v5);

  }
  else
  {
    -[CNReputationFutureBuilder handle](self, "handle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder coreRecentsTrustForHandle:](self, "coreRecentsTrustForHandle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v7);

  }
}

id __48__CNReputationFutureBuilder_addCoreRecentsTrust__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coreRecentsTrustForHandle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)coreRecentsTrustForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  -[CNReputationFutureBuilder coreRecentsAdapter](self, "coreRecentsAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNReputationFutureBuilder coreRecentsAdapter](self, "coreRecentsAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recentContactsForHandle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke;
    v14[3] = &unk_1E29F89E0;
    v14[4] = self;
    objc_msgSend(v7, "addFailureBlock:", v14);
    objc_msgSend(v7, "flatMap:", &__block_literal_global_65);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_2;
    v13[3] = &unk_1E29FAA60;
    v13[4] = self;
    objc_msgSend(v9, "addSuccessBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_3;
    v12[3] = &unk_1E29F89E0;
    v12[4] = self;
    objc_msgSend(v9, "addFailureBlock:", v12);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D13A68];
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "logger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "couldNotQueryCoreRecentsWithError:", v3);

}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coreRecentsConfirmedTrust");

}

void __55__CNReputationFutureBuilder_coreRecentsTrustForHandle___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coreRecentsCouldNotConfirmTrust");

}

- (void)addContactsTrustForEmailAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__CNReputationFutureBuilder_addContactsTrustForEmailAddress__block_invoke;
    v9[3] = &unk_1E29FAA38;
    v9[4] = self;
    objc_msgSend(v4, "recover:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v5);

  }
  else
  {
    -[CNReputationFutureBuilder handle](self, "handle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder contactsTrustForEmailAddress:](self, "contactsTrustForEmailAddress:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v7);

  }
}

id __60__CNReputationFutureBuilder_addContactsTrustForEmailAddress__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsTrustForEmailAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactsTrustForEmailAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  -[CNReputationFutureBuilder contactsAdapter](self, "contactsAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNReputationFutureBuilder contactsAdapter](self, "contactsAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactsForEmailAddress:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke;
    v14[3] = &unk_1E29F89E0;
    v14[4] = self;
    objc_msgSend(v7, "addFailureBlock:", v14);
    objc_msgSend(v7, "flatMap:", &__block_literal_global_65);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_2;
    v13[3] = &unk_1E29FAA60;
    v13[4] = self;
    objc_msgSend(v9, "addSuccessBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_3;
    v12[3] = &unk_1E29F89E0;
    v12[4] = self;
    objc_msgSend(v9, "addFailureBlock:", v12);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D13A68];
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "logger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "couldNotQueryContactsForEmailAddressWithError:", v3);

}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsConfirmedTrustOfEmailAddress");

}

void __58__CNReputationFutureBuilder_contactsTrustForEmailAddress___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsCouldNotConfirmTrustOfEmailAddress");

}

- (void)addContactsTrustForPhoneNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__CNReputationFutureBuilder_addContactsTrustForPhoneNumber__block_invoke;
    v9[3] = &unk_1E29FAA38;
    v9[4] = self;
    objc_msgSend(v4, "recover:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v5);

  }
  else
  {
    -[CNReputationFutureBuilder handle](self, "handle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder contactsTrustForPhoneNumber:](self, "contactsTrustForPhoneNumber:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNReputationFutureBuilder setScoreFuture:](self, "setScoreFuture:", v7);

  }
}

id __59__CNReputationFutureBuilder_addContactsTrustForPhoneNumber__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsTrustForPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contactsTrustForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  -[CNReputationFutureBuilder contactsAdapter](self, "contactsAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNReputationFutureBuilder contactsAdapter](self, "contactsAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactsForPhoneNumber:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke;
    v14[3] = &unk_1E29F89E0;
    v14[4] = self;
    objc_msgSend(v7, "addFailureBlock:", v14);
    objc_msgSend(v7, "flatMap:", &__block_literal_global_65);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_2;
    v13[3] = &unk_1E29FAA60;
    v13[4] = self;
    objc_msgSend(v9, "addSuccessBlock:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_3;
    v12[3] = &unk_1E29F89E0;
    v12[4] = self;
    objc_msgSend(v9, "addFailureBlock:", v12);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D13A68];
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "logger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "couldNotQueryContactsForPhoneNumberWithError:", v3);

}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsConfirmedTrustOfPhoneNumber");

}

void __57__CNReputationFutureBuilder_contactsTrustForPhoneNumber___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contactsCouldNotConfirmTrustOfPhoneNumber");

}

- (id)build
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  -[CNReputationFutureBuilder scoreFuture](self, "scoreFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__CNReputationFutureBuilder_build__block_invoke;
  v9[3] = &unk_1E29F7C48;
  v9[4] = self;
  objc_msgSend(v3, "recover:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __34__CNReputationFutureBuilder_build__block_invoke_8;
  v8[3] = &unk_1E29FAA88;
  v8[4] = self;
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __34__CNReputationFutureBuilder_build__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reputationUnestablished");

  return objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", &unk_1E2A40050);
}

id __34__CNReputationFutureBuilder_build__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  CNReputationResult *v4;
  void *v5;
  uint64_t v6;
  CNReputationResult *v7;
  void *v8;

  v3 = a2;
  v4 = [CNReputationResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = objc_msgSend(v3, "integerValue");
  else
    v6 = 0;
  v7 = -[CNReputationResult initWithHandle:score:](v4, "initWithHandle:score:", v5, v6);

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNReputationHandle)handle
{
  return self->_handle;
}

- (CNReputationCoreRecentsAdapter)coreRecentsAdapter
{
  return self->_coreRecentsAdapter;
}

- (CNReputationContactsAdapter)contactsAdapter
{
  return self->_contactsAdapter;
}

- (CNReputationLogger)logger
{
  return self->_logger;
}

- (CNFuture)scoreFuture
{
  return self->_scoreFuture;
}

- (void)setScoreFuture:(id)a3
{
  objc_storeStrong((id *)&self->_scoreFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreFuture, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_contactsAdapter, 0);
  objc_storeStrong((id *)&self->_coreRecentsAdapter, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
