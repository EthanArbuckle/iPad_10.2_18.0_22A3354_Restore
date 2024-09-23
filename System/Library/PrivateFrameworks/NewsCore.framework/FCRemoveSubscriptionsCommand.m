@implementation FCRemoveSubscriptionsCommand

- (FCRemoveSubscriptionsCommand)initWithSubscriptions:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  FCRemoveSubscriptionsCommand *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0C94730];
  v8 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("Subscriptions"), *MEMORY[0x1E0C94730]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("SensitiveSubscriptions"), v7);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__FCRemoveSubscriptionsCommand_initWithSubscriptions___block_invoke;
  v16[3] = &unk_1E464B360;
  v17 = v9;
  v18 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)FCRemoveSubscriptionsCommand;
  v13 = -[FCRemoveRecordsCommand initWithRecordIDs:](&v15, sel_initWithRecordIDs_, v12);

  return v13;
}

id __54__FCRemoveSubscriptionsCommand_initWithSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "zone");
  v5 = 40;
  if (v4 == 1)
    v5 = 32;
  v6 = *(void **)(a1 + v5);
  v7 = (objc_class *)MEMORY[0x1E0C95070];
  v8 = v6;
  v9 = [v7 alloc];
  objc_msgSend(v3, "subscriptionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithRecordName:zoneID:", v10, v8);
  return v11;
}

- (FCRemoveSubscriptionsCommand)initWithSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCRemoveSubscriptionsCommand *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCRemoveSubscriptionsCommand initWithSubscriptions:](self, "initWithSubscriptions:", v6);

  }
  else
  {
    v7 = -[FCRemoveSubscriptionsCommand initWithSubscriptions:](self, "initWithSubscriptions:", MEMORY[0x1E0C9AA60]);
  }

  return v7;
}

@end
