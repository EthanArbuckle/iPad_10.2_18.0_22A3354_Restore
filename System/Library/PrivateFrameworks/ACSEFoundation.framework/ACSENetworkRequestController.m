@implementation ACSENetworkRequestController

- (ACSENetworkRequestController)initWithSession:(id)a3
{
  return -[ACSENetworkRequestController initWithSession:numberOfSecondsBetweenRetries:](self, "initWithSession:numberOfSecondsBetweenRetries:", a3, &unk_2506E2008);
}

- (ACSENetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4
{
  NSURLSession *v6;
  NSArray *v7;
  ACSENetworkRequestController *v8;
  NSURLSession *session;
  NSURLSession *v10;
  NSArray *numberOfSecondsBetweenRetries;
  objc_super v13;

  v6 = (NSURLSession *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)ACSENetworkRequestController;
  v8 = -[ACSENetworkRequestController init](&v13, sel_init);
  session = v8->_session;
  v8->_session = v6;
  v10 = v6;

  numberOfSecondsBetweenRetries = v8->_numberOfSecondsBetweenRetries;
  v8->_numberOfSecondsBetweenRetries = v7;

  return v8;
}

- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ACSERetryController *v12;
  NSUInteger v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)-[NSArray copy](self->_numberOfSecondsBetweenRetries, "copy");
  objc_initWeak(&location, self);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v12 = [ACSERetryController alloc];
  v13 = -[NSArray count](self->_numberOfSecondsBetweenRetries, "count");
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke;
  v20[3] = &unk_2506E0E98;
  objc_copyWeak(&v26, &location);
  v14 = v10;
  v24 = v14;
  v25 = &v27;
  v15 = v8;
  v21 = v15;
  v16 = v9;
  v22 = v16;
  v17 = v11;
  v23 = v17;
  v18 = -[ACSERetryController initWithMaxNumberOfRetries:block:](v12, "initWithMaxNumberOfRetries:block:", v13, v20);
  v19 = (void *)v28[5];
  v28[5] = v18;

  objc_msgSend((id)v28[5], "executeBlock");
  _Block_object_dispose(&v27, 8);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 1);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke_2;
    v16 = &unk_2506E0E70;
    v5 = *(_QWORD *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v19 = v6;
    v20 = v7;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v4, "dataTaskWithRequest:completionHandler:", v5, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume", v13, v14, v15, v16);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "forACSEError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v10);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

void __78__ACSENetworkRequestController_executeRequest_acceptedStatusCodes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

  if (!(_DWORD)v10)
  {
    if (objc_msgSend(v9, "statusCode") == 429 || objc_msgSend(v9, "statusCode") == 503)
    {
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "forACSEError:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, id, void *))(v12 + 16))(v12, v19, v9, v13);

      goto LABEL_6;
    }
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "numberOfAttempts") - 1;
    if (v16 < objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "retryAfterSeconds:", v18);
      goto LABEL_7;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = 0;

LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSecondsBetweenRetries, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
