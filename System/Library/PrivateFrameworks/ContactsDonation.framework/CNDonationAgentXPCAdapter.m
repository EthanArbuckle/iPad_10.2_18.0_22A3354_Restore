@implementation CNDonationAgentXPCAdapter

- (id)donateMeCardValues:(id)a3
{
  id v3;
  _CNDonationAgentXPCMethodScope *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "donateMeCardValues:scope:", v3, v4);

  -[_CNDonationAgentXPCMethodScope promise](v4, "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)donateMeCardValues:(id)a3 scope:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "proxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "donateMeCardValues:completionHandler:", v6, v8);

}

- (id)removeDonatedMeCardValuesForIdentifiers:(id)a3
{
  id v3;
  _CNDonationAgentXPCMethodScope *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "removeDonatedMeCardValuesForIdentifiers:scope:", v3, v4);

  -[_CNDonationAgentXPCMethodScope promise](v4, "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)removeDonatedMeCardValuesForIdentifiers:(id)a3 scope:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__CNDonationAgentXPCAdapter_removeDonatedMeCardValuesForIdentifiers_scope___block_invoke;
  v9[3] = &unk_24C236498;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "removeDonatedMeCardValuesForIdentifiers:completionHandler:", v6, v9);

}

void __75__CNDonationAgentXPCAdapter_removeDonatedMeCardValuesForIdentifiers_scope___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", v7);

  }
  else
  {
    objc_msgSend(v5, "finishWithError:", v8);
  }

}

- (id)fetchDonatedMeCard
{
  _CNDonationAgentXPCMethodScope *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "fetchDonatedMeCardWithScope:", v2);
  -[_CNDonationAgentXPCMethodScope promise](v2, "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)fetchDonatedMeCardWithScope:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "proxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchDonatedMeCard:", v5);

}

- (id)meCardDonations
{
  _CNDonationAgentXPCMethodScope *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "meCardDonationsWithScope:", v2);
  -[_CNDonationAgentXPCMethodScope promise](v2, "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)meCardDonationsWithScope:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "proxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "completionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meCardDonations:", v5);

}

- (id)rejectValueWithDonationIdentifier:(id)a3
{
  id v3;
  _CNDonationAgentXPCMethodScope *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "rejectValueWithDonationIdentifier:scope:", v3, v4);

  -[_CNDonationAgentXPCMethodScope promise](v4, "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)changeFromAccount:(id)a3 toAccount:(id)a4 scope:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "proxy");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "errorOnlyCompletionHandlerAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changeFromAccount:toAccount:completionHandler:", v9, v8, v11);

}

- (id)changeFromAccount:(id)a3 toAccount:(id)a4
{
  id v5;
  id v6;
  _CNDonationAgentXPCMethodScope *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "changeFromAccount:toAccount:scope:", v6, v5, v7);

  -[_CNDonationAgentXPCMethodScope promise](v7, "promise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "future");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)rejectValueWithDonationIdentifier:(id)a3 scope:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "proxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rejectValueWithDonationIdentifier:completionHandler:", v6, v8);

}

- (id)rejectValuesWithClusterIdentifier:(id)a3
{
  id v3;
  _CNDonationAgentXPCMethodScope *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "rejectValuesWithClusterIdentifier:scope:", v3, v4);

  -[_CNDonationAgentXPCMethodScope promise](v4, "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)rejectValuesWithClusterIdentifier:(id)a3 scope:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "proxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "errorOnlyCompletionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rejectValuesWithClusterIdentifier:completionHandler:", v6, v8);

}

- (id)removeAllRejections
{
  _CNDonationAgentXPCMethodScope *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(_CNDonationAgentXPCMethodScope);
  objc_msgSend((id)objc_opt_class(), "removeAllRejectionsWithScope:", v2);
  -[_CNDonationAgentXPCMethodScope promise](v2, "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)donatedMeCardEither
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v2 = +[CNDonationAgentXPCAdapter newXPCConnection](CNDonationAgentXPCAdapter, "newXPCConnection");
  v3 = (void *)MEMORY[0x24BE192F0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAllowedClasses:toInterface:forSelector:argumentIndex:ofReply:", v4, v5, sel_synchronousDonatedMeCard_, 0, 1);

  objc_msgSend(v2, "resume");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v6 = MEMORY[0x24BDAC760];
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke;
  v19[3] = &unk_24C2364C0;
  v19[4] = &v20;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke_2;
  v12[3] = &unk_24C2364E8;
  v12[4] = &v13;
  objc_msgSend(v7, "synchronousDonatedMeCard:", v12);
  objc_msgSend(v2, "invalidate");
  v8 = (void *)v14[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19250], "eitherWithRight:", v21[5]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __48__CNDonationAgentXPCAdapter_donatedMeCardEither__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)removeAllRejectionsWithScope:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "proxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllRejectionsWithCompletionHandler:", v5);

}

+ (id)newXPCConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.contacts.donation.agent"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B36D8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

@end
