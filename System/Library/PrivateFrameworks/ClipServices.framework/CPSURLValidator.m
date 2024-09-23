@implementation CPSURLValidator

- (CPSURLValidator)initWithRequest:(id)a3
{
  id v5;
  CPSURLValidator *v6;
  CPSURLValidator *v7;
  CPSURLValidator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSURLValidator;
  v6 = -[CPSURLValidator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CPSValidationRequest *request;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v7 = v5;
    -[CPSValidationRequest urls](request, "urls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSValidationRequest bundleIdentifiers](self->_request, "bundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v14 = v8;
    v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_INFO, "Client requests validation for URLs: %{private}@, bundleIDs: %{private}@", buf, 0x16u);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__CPSURLValidator_validateWithCompletion___block_invoke;
  v11[3] = &unk_24C3B9B98;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:](CPSClipInvocationPolicy, "requestAccountPolicyWithCompletion:", v11);

}

void __42__CPSURLValidator_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  dispatch_time_t v18;
  CPSValidationResult *v19;
  CPSValidationResult *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  NSObject *v25;

  v3 = a2;
  if ((objc_msgSend(v3, "isEligible") & 1) != 0 || (objc_msgSend(v3, "isRecoverable") & 1) != 0)
  {
    v4 = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "urls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "urls");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bundleIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter(v4);
        v13 = *(void **)(a1 + 32);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __42__CPSURLValidator_validateWithCompletion___block_invoke_2;
        v21[3] = &unk_24C3B9B70;
        v22 = v10;
        v23 = v12;
        v24 = v5;
        v25 = v4;
        v14 = v12;
        v15 = v10;
        objc_msgSend(v13, "_validateURL:forBundleID:policy:completion:", v15, v14, v3, v21);

        ++v8;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "urls");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v8 < v17);
    }
    v18 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v4, v18);
    v19 = -[CPSValidationResult initWithRequest:response:]([CPSValidationResult alloc], "initWithRequest:response:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v20 = [CPSValidationResult alloc];
    v4 = -[CPSValidationResult initWithRequest:response:](v20, "initWithRequest:response:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), MEMORY[0x24BDBD1B8]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __42__CPSURLValidator_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "invocationPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEligible"))
  {

LABEL_4:
    objc_msgSend(v3, "clipBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 32));

    goto LABEL_5;
  }
  objc_msgSend(v3, "invocationPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRecoverable");

  if ((v6 & 1) != 0)
    goto LABEL_4;
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138478083;
    v12 = v9;
    v13 = 2113;
    v14 = v10;
    _os_log_impl(&dword_20AD44000, v8, OS_LOG_TYPE_INFO, "Failed validation for URL: %{private}@, bundleID: %{private}@", (uint8_t *)&v11, 0x16u);
  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (void)_validateURL:(id)a3 forBundleID:(id)a4 policy:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CPSClipMetadata *v13;
  void *v14;
  void *v15;
  CPSClipMetadata *v16;
  id v17;
  _QWORD v18[4];
  CPSClipMetadata *v19;
  id v20;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(CPSClipMetadata);
  -[CPSClipMetadata setClipRequestURL:](v13, "setClipRequestURL:", v12);

  -[CPSClipMetadata setClipBundleID:](v13, "setClipBundleID:", v11);
  -[CPSClipMetadata setInvocationPolicy:](v13, "setInvocationPolicy:", v10);

  +[CPSSessionManager sharedManager](CPSSessionManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appInfoFetcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__CPSURLValidator__validateURL_forBundleID_policy_completion___block_invoke;
  v18[3] = &unk_24C3B9BC0;
  v19 = v13;
  v20 = v9;
  v16 = v13;
  v17 = v9;
  objc_msgSend(v15, "lookUpClipMetadataByBundleID:sourceBundleID:downloadIconIfNeeded:skipCaching:completionHandler:", v11, 0, 0, 0, v18);

}

uint64_t __62__CPSURLValidator__validateURL_forBundleID_policy_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  char v6;
  uint64_t (*v7)(void);

  if (!a2 || a3)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "_updateWithAMSMetadata:", a2);
  objc_msgSend(*(id *)(a1 + 32), "invocationPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEligible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "invocationPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRecoverable");

    if ((v6 & 1) != 0)
      goto LABEL_6;
LABEL_7:
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    return v7();
  }

LABEL_6:
  v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  return v7();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
