@implementation FAFamilyMessageGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.iCloud.Family");
}

- (BOOL)shouldPerformModalMessagePresentation
{
  return 1;
}

- (id)contextPropertyWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("familyClientBundleID")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BE30A48]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithPropertyName:bundleID:", v3, v8);

    v16 = 0;
    v10 = objc_msgSend(v9, "fetchEligibilityWithError:", &v16);
    v11 = v16;
    _FALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup contextPropertyWithName: %@, response: %lu", buf, 0x16u);
    }

    if (v11)
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FAFamilyMessageGroup contextPropertyWithName:].cold.1((uint64_t)v3, (uint64_t)v11, v13);

    }
    v14 = (void *)MEMORY[0x24BDBD1C0];
    if (v10 != 1)
      v14 = 0;
    if (v10 == 2)
      v5 = (void *)MEMORY[0x24BDBD1C8];
    else
      v5 = v14;

  }
  return v5;
}

- (void)performModalMessagePresentation:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FACircleContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  FACircleContext *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  FACircleContext *v23;
  id v24;
  FAFamilyMessageGroup *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup will present message: %@", buf, 0xCu);
  }

  v9 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeMercuryJourney"));
  -[FACircleContext setActivityIndicatorStyle:](v9, "setActivityIndicatorStyle:", 0);
  objc_msgSend(v6, "contentPages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BE30A88]);
  objc_msgSend(v14, "setCachePolicy:", 0);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke;
  v20[3] = &unk_24C88D840;
  v21 = v13;
  v22 = v12;
  v23 = v9;
  v24 = v7;
  v25 = self;
  v26 = v6;
  v15 = v6;
  v16 = v7;
  v17 = v9;
  v18 = v12;
  v19 = v13;
  objc_msgSend(v14, "startRequestWithCompletionHandler:", v20);

}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  id v30;
  id location;
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  FACircleStateController *v39;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "eligibilityRequirements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requirementsForPropertyName:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "serverPayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("mercury-journey"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("serverPayload"));
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(*(id *)(a1 + 48), "setAdditionalParameters:", v11);

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__9;
  v38 = __Block_byref_object_dispose__9;
  v39 = objc_alloc_init(FACircleStateController);
  objc_msgSend((id)v35[5], "setPresenter:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 1)
    v14 = 2;
  else
    v14 = -2;
  objc_msgSend((id)v35[5], "setModalPresentationStyle:", v14);
  v21 = v5;
  v15 = v6;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  objc_initWeak(&location, *(id *)(a1 + 64));
  v16 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_27;
  v27[3] = &unk_24C88D7F0;
  v29 = v32;
  objc_copyWeak(&v30, &location);
  v28 = *(id *)(a1 + 72);
  objc_msgSend((id)v35[5], "setPresentationHandler:", v27);
  v17 = (void *)v35[5];
  v18 = *(_QWORD *)(a1 + 48);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_29;
  v22[3] = &unk_24C88D818;
  v25 = v32;
  v19 = *(id *)(a1 + 72);
  v20 = *(_QWORD *)(a1 + 64);
  v23 = v19;
  v24 = v20;
  v26 = &v34;
  objc_msgSend(v17, "performOperationWithContext:completion:", v18, v22);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup did present message: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportModalMessageWasPresentedWithIdentifier:", v5);

}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "FAFamilyMessageGroup did dismiss message: %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportModalMessageWasDismissedWithIdentifier:", v10);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_29_cold_1(a1, (uint64_t)v4, v7);

    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportModalMessagePresentationFailedWithIdentifier:", v10);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

- (void)contextPropertyWithName:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_20DE41000, a2, a3, "failed to fetch recommendation for property: %@, error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __75__FAFamilyMessageGroup_performModalMessagePresentation_fromViewController___block_invoke_29_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_20DE41000, a2, a3, "FAFamilyMessageGroup circleController complete without UI for message: %@, error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
