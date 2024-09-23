@implementation NPKContinuityCoordinator

+ (id)sharedContinuityCoordinator
{
  if (sharedContinuityCoordinator_onceToken != -1)
    dispatch_once(&sharedContinuityCoordinator_onceToken, &__block_literal_global_14);
  return (id)sharedContinuityCoordinator_controller;
}

void __55__NPKContinuityCoordinator_sharedContinuityCoordinator__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NPKContinuityCoordinator _init]([NPKContinuityCoordinator alloc], "_init");
  v1 = (void *)sharedContinuityCoordinator_controller;
  sharedContinuityCoordinator_controller = (uint64_t)v0;

}

- (NPKContinuityCoordinator)init
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKContinuityCoordinator init]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
      v9 = 2048;
      v10 = 49;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Don't call -[NPKContinuityController init] but instead use singleton!)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (id)_init
{
  NPKContinuityCoordinator *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKContinuityCoordinator;
  v2 = -[NPKContinuityCoordinator init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NanoPassKit.NPKContinuityCoordinator", v3);
    -[NPKContinuityCoordinator setQueue:](v2, "setQueue:", v4);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)NPKContinuityCoordinator;
  -[NPKContinuityCoordinator dealloc](&v4, sel_dealloc);
}

- (void)userViewingPassList
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user is viewing pass list", buf, 2u);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__NPKContinuityCoordinator_userViewingPassList__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v6, block);

}

void __47__NPKContinuityCoordinator_userViewingPassList__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "passListUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1960]);
    v4 = (void *)objc_msgSend(v3, "initWithActivityType:", *MEMORY[0x24BE6F5D8]);
    objc_msgSend(*(id *)(a1 + 32), "setPassListUserActivity:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "passListUserActivity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_saveUserActivity:", v5);

}

- (void)userViewingPassWithUniqueID:(id)a3 isPaymentPass:(BOOL)a4
{
  _BOOL4 v4;
  char *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  _QWORD block[4];
  char *v16;
  NPKContinuityCoordinator *v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a3;
  if (!v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_General_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v20 = "-[NPKContinuityCoordinator userViewingPassWithUniqueID:isPaymentPass:]";
        v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
        v23 = 2048;
        v24 = 78;
        v25 = 2080;
        v26 = "-[NPKContinuityCoordinator userViewingPassWithUniqueID:isPaymentPass:]";
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil uniqueID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 1024;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: User viewing pass with unique ID %@ (payment pass: %d)", buf, 0x12u);
    }

  }
  kdebug_trace();
  -[NPKContinuityCoordinator queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__NPKContinuityCoordinator_userViewingPassWithUniqueID_isPaymentPass___block_invoke;
  block[3] = &unk_24CFE8FA8;
  v18 = v4;
  v16 = v6;
  v17 = self;
  v14 = v6;
  dispatch_async(v13, block);

}

void __70__NPKContinuityCoordinator_userViewingPassWithUniqueID_isPaymentPass___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(unsigned __int8 *)(a1 + 48);
    v3 = *(void **)(a1 + 40);
    if (v2)
    {
      objc_msgSend(v3, "provisionPassUserActivity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "_skeletonBridgeUserActivity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setProvisionPassUserActivity:", v5);

      }
      objc_msgSend(*(id *)(a1 + 40), "provisionPassUserActivity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "individualPassUserActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = objc_alloc(MEMORY[0x24BDD1960]);
        v9 = (void *)objc_msgSend(v8, "initWithActivityType:", *MEMORY[0x24BE6F9E0]);
        objc_msgSend(*(id *)(a1 + 40), "setIndividualPassUserActivity:", v9);

      }
      objc_msgSend(*(id *)(a1 + 40), "individualPassUserActivity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v12 = *MEMORY[0x24BE6F9D8];
      v13[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addUserInfoEntriesFromDictionary:", v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "_saveUserActivity:", v6);

  }
}

- (void)userNeedsToProvisionPassWithUniqueID:(id)a3
{
  char *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  _QWORD v13[4];
  char *v14;
  NPKContinuityCoordinator *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  if (!v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "-[NPKContinuityCoordinator userNeedsToProvisionPassWithUniqueID:]";
        v18 = 2082;
        v19 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
        v20 = 2048;
        v21 = 104;
        v22 = 2080;
        v23 = "-[NPKContinuityCoordinator userNeedsToProvisionPassWithUniqueID:]";
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil uniqueID)", buf, 0x2Au);
      }

    }
    _NPKAssertAbort();
  }
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: User needs to provision pass with unique ID %@", buf, 0xCu);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__NPKContinuityCoordinator_userNeedsToProvisionPassWithUniqueID___block_invoke;
  v13[3] = &unk_24CFE7E40;
  v14 = v4;
  v15 = self;
  v12 = v4;
  dispatch_async(v11, v13);

}

void __65__NPKContinuityCoordinator_userNeedsToProvisionPassWithUniqueID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "provisionPassUserActivity");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "_skeletonBridgeUserActivity");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setProvisionPassUserActivity:", v3);

    }
    objc_msgSend(*(id *)(a1 + 40), "provisionPassUserActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("passUniqueID");
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v6);

    objc_msgSend(*(id *)(a1 + 40), "_saveUserActivity:", v4);
  }
}

- (void)userNeedsPaymentPasses
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs payment passes", buf, 2u);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__NPKContinuityCoordinator_userNeedsPaymentPasses__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v6, block);

}

void __50__NPKContinuityCoordinator_userNeedsPaymentPasses__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "getPaymentPassesUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_skeletonBridgeUserActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setGetPaymentPassesUserActivity:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "getPaymentPassesUserActivity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_saveUserActivity:", v4);

}

- (void)userNeedsToSetUpPeerPayment
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs to set up peer payment", buf, 2u);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NPKContinuityCoordinator_userNeedsToSetUpPeerPayment__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v6, block);

}

void __55__NPKContinuityCoordinator_userNeedsToSetUpPeerPayment__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setUpPeerPaymentUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_skeletonBridgeUserActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSetUpPeerPaymentUserActivity:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "setUpPeerPaymentUserActivity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_saveUserActivity:", v4);

}

- (void)userNeedsToViewPeerPaymentForHandle:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs to view peer payment", buf, 2u);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v7, block);

}

void __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke(uint64_t a1)
{
  void *v2;
  void **v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "viewPeerPaymentUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v3 = (void **)getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr;
    v13 = getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr;
    if (!getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getIMChatRegistryContinuityActivityTypeSymbolLoc_block_invoke;
      v9[3] = &unk_24CFE81D0;
      v9[4] = &v10;
      __getIMChatRegistryContinuityActivityTypeSymbolLoc_block_invoke((uint64_t)v9);
      v3 = (void **)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v3)
      __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke_cold_1();
    v4 = *v3;
    if (*v3)
    {
      v5 = (objc_class *)MEMORY[0x24BDD1960];
      v6 = v4;
      v7 = (void *)objc_msgSend([v5 alloc], "initWithActivityType:", v6);
      objc_msgSend(*(id *)(a1 + 32), "setViewPeerPaymentUserActivity:", v7);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "viewPeerPaymentUserActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_saveUserActivity:", v8);

}

- (id)userActivityForPassWithUniqueID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1960];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithActivityType:", *MEMORY[0x24BE6F9E0]);
  v9 = *MEMORY[0x24BE6F9D8];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addUserInfoEntriesFromDictionary:", v7);
  return v6;
}

- (void)invalidateAllActivities
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: invalidateAllActivities", buf, 2u);
    }

  }
  -[NPKContinuityCoordinator queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NPKContinuityCoordinator_invalidateAllActivities__block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v6, block);

}

uint64_t __51__NPKContinuityCoordinator_invalidateAllActivities__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "provisionPassUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "getPaymentPassesUserActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "passListUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "individualPassUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setProvisionPassUserActivity:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setGetPaymentPassesUserActivity:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPassListUserActivity:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setIndividualPassUserActivity:", 0);
}

- (id)_skeletonBridgeUserActivity
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "initWithActivityType:", CFSTR("com.apple.nano.passbook.provisioning"));
}

- (void)_saveUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412290;
      v28 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Saving user activity %@", (uint8_t *)&v27, 0xCu);
    }

  }
  -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    pk_General_log();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      pk_General_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v26;
        _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: New activity was already current, calling -becomeCurrent again: %@", (uint8_t *)&v27, 0xCu);

      }
    }
  }
  else
  {
    -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        pk_General_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v13;
          _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Invalidating old activity %@", (uint8_t *)&v27, 0xCu);

        }
      }
      -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKContinuityCoordinator provisionPassUserActivity](self, "provisionPassUserActivity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == v16)
      {
        -[NPKContinuityCoordinator setProvisionPassUserActivity:](self, "setProvisionPassUserActivity:", 0);
      }
      else
      {
        -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKContinuityCoordinator getPaymentPassesUserActivity](self, "getPaymentPassesUserActivity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 == v18)
        {
          -[NPKContinuityCoordinator setGetPaymentPassesUserActivity:](self, "setGetPaymentPassesUserActivity:", 0);
        }
        else
        {
          -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPKContinuityCoordinator passListUserActivity](self, "passListUserActivity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            -[NPKContinuityCoordinator setPassListUserActivity:](self, "setPassListUserActivity:", 0);
          }
          else
          {
            -[NPKContinuityCoordinator currentUserActivity](self, "currentUserActivity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPKContinuityCoordinator individualPassUserActivity](self, "individualPassUserActivity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21 == v22)
              -[NPKContinuityCoordinator setIndividualPassUserActivity:](self, "setIndividualPassUserActivity:", 0);
          }
        }
      }
    }
    -[NPKContinuityCoordinator setCurrentUserActivity:](self, "setCurrentUserActivity:", v4);
  }
  objc_msgSend(v4, "becomeCurrent");

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUserActivity)provisionPassUserActivity
{
  return self->_provisionPassUserActivity;
}

- (void)setProvisionPassUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_provisionPassUserActivity, a3);
}

- (NSUserActivity)getPaymentPassesUserActivity
{
  return self->_getPaymentPassesUserActivity;
}

- (void)setGetPaymentPassesUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_getPaymentPassesUserActivity, a3);
}

- (NSUserActivity)passListUserActivity
{
  return self->_passListUserActivity;
}

- (void)setPassListUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_passListUserActivity, a3);
}

- (NSUserActivity)individualPassUserActivity
{
  return self->_individualPassUserActivity;
}

- (void)setIndividualPassUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_individualPassUserActivity, a3);
}

- (NSUserActivity)setUpPeerPaymentUserActivity
{
  return self->_setUpPeerPaymentUserActivity;
}

- (void)setSetUpPeerPaymentUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_setUpPeerPaymentUserActivity, a3);
}

- (NSUserActivity)viewPeerPaymentUserActivity
{
  return self->_viewPeerPaymentUserActivity;
}

- (void)setViewPeerPaymentUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_viewPeerPaymentUserActivity, a3);
}

- (NSUserActivity)currentUserActivity
{
  return (NSUserActivity *)objc_loadWeakRetained((id *)&self->_currentUserActivity);
}

- (void)setCurrentUserActivity:(id)a3
{
  objc_storeWeak((id *)&self->_currentUserActivity, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentUserActivity);
  objc_storeStrong((id *)&self->_viewPeerPaymentUserActivity, 0);
  objc_storeStrong((id *)&self->_setUpPeerPaymentUserActivity, 0);
  objc_storeStrong((id *)&self->_individualPassUserActivity, 0);
  objc_storeStrong((id *)&self->_passListUserActivity, 0);
  objc_storeStrong((id *)&self->_getPaymentPassesUserActivity, 0);
  objc_storeStrong((id *)&self->_provisionPassUserActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  -[NPKProtoCheckInvitationStatusForMailboxAddressRequest writeTo:].cold.1(v0);
}

@end
