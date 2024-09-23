@implementation CNDonationStore

- (CNDonationStore)init
{
  CNDonationAgentXPCAdapter *v3;
  CNDonationStore *v4;

  v3 = objc_alloc_init(CNDonationAgentXPCAdapter);
  v4 = -[CNDonationStore initWithAdapter:](self, "initWithAdapter:", v3);

  return v4;
}

- (CNDonationStore)initWithAdapter:(id)a3
{
  id v5;
  CNDonationStore *v6;
  CNDonationStore *v7;
  CNDonationStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDonationStore;
  v6 = -[CNDonationStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adapter, a3);
    v8 = v7;
  }

  return v7;
}

- (void)donateMeCardValues:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "donateMeCardValues:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__CNDonationStore_donateMeCardValues_completionHandler___block_invoke;
  v15[3] = &unk_24C236268;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __56__CNDonationStore_donateMeCardValues_completionHandler___block_invoke_2;
  v13[3] = &unk_24C236290;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", v13);

}

uint64_t __56__CNDonationStore_donateMeCardValues_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__CNDonationStore_donateMeCardValues_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeDonatedMeCardValuesForIdentifiers:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__CNDonationStore_removeDonatedMeCardValuesForIdentifiers_completionHandler___block_invoke;
  v15[3] = &unk_24C236268;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __77__CNDonationStore_removeDonatedMeCardValuesForIdentifiers_completionHandler___block_invoke_2;
  v13[3] = &unk_24C236290;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", v13);

}

uint64_t __77__CNDonationStore_removeDonatedMeCardValuesForIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__CNDonationStore_removeDonatedMeCardValuesForIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDonatedMeCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchDonatedMeCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __38__CNDonationStore_fetchDonatedMeCard___block_invoke;
  v12[3] = &unk_24C2362B8;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __38__CNDonationStore_fetchDonatedMeCard___block_invoke_2;
  v10[3] = &unk_24C236290;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "addFailureBlock:", v10);

}

uint64_t __38__CNDonationStore_fetchDonatedMeCard___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__CNDonationStore_fetchDonatedMeCard___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)donatedMeCard
{
  void *v2;
  void *v3;

  -[CNDonationStore adapter](self, "adapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchDonatedMeCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)donatedMeCardEither
{
  void *v2;
  void *v3;

  -[CNDonationStore adapter](self, "adapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "donatedMeCardEither");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meCardDonations
{
  void *v2;
  void *v3;

  -[CNDonationStore adapter](self, "adapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meCardDonations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)changeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeFromAccount:toAccount:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)rejectValueWithDonationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rejectValueWithDonationIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__CNDonationStore_rejectValueWithDonationIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C236268;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __71__CNDonationStore_rejectValueWithDonationIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_24C236290;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", v13);

}

uint64_t __71__CNDonationStore_rejectValueWithDonationIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CNDonationStore_rejectValueWithDonationIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)rejectValuesWithClusterIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rejectValuesWithClusterIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__CNDonationStore_rejectValuesWithClusterIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24C236268;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v9, "addSuccessBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __71__CNDonationStore_rejectValuesWithClusterIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_24C236290;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v9, "addFailureBlock:", v13);

}

uint64_t __71__CNDonationStore_rejectValuesWithClusterIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__CNDonationStore_rejectValuesWithClusterIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllRejectionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[CNDonationStore adapter](self, "adapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllRejections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CNDonationStore_removeAllRejectionsWithCompletionHandler___block_invoke;
  v12[3] = &unk_24C236268;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __60__CNDonationStore_removeAllRejectionsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_24C236290;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "addFailureBlock:", v10);

}

uint64_t __60__CNDonationStore_removeAllRejectionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__CNDonationStore_removeAllRejectionsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CNDonationAgentAdapter)adapter
{
  return self->_adapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
}

@end
