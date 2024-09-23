@implementation MPStoreModelRequestOperation

- (MPStoreModelRequestOperation)init
{
  MPStoreModelRequestOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessSerialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPStoreModelRequestOperation;
  v2 = -[MPAsyncOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaPlayer.MPStoreModelRequestOperation.accessSerialQueue", 0);
    accessSerialQueue = v2->_accessSerialQueue;
    v2->_accessSerialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (MPStoreModelRequestOperation)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  MPStoreModelRequestOperation *v8;
  uint64_t v9;
  MPStoreModelRequest *request;
  uint64_t v11;
  id responseHandler;

  v6 = a3;
  v7 = a4;
  v8 = -[MPStoreModelRequestOperation init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (MPStoreModelRequest *)v9;

    v11 = objc_msgSend(v7, "copy");
    responseHandler = v8->_responseHandler;
    v8->_responseHandler = (id)v11;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MPStoreModelRequestOperation _tearDownTimeoutTimerSource](self, "_tearDownTimeoutTimerSource");
  v3.receiver = self;
  v3.super_class = (Class)MPStoreModelRequestOperation;
  -[MPStoreModelRequestOperation dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  NSObject *accessSerialQueue;
  objc_super v4;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35271;
  v10 = __Block_byref_object_dispose__35272;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MPStoreModelRequestOperation_cancel__block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(accessSerialQueue, block);
  objc_msgSend((id)v7[5], "cancel");
  v4.receiver = self;
  v4.super_class = (Class)MPStoreModelRequestOperation;
  -[MPAsyncOperation cancel](&v4, sel_cancel);
  _Block_object_dispose(&v6, 8);

}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *accessSerialQueue;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23[3];
  id location;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[MPStoreModelRequest timeoutInterval](self->_request, "timeoutInterval");
  v6 = v5;
  objc_initWeak(&location, self);
  accessSerialQueue = self->_accessSerialQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MPStoreModelRequestOperation_execute__block_invoke;
  block[3] = &unk_1E315D590;
  block[4] = self;
  v23[1] = v4;
  v23[2] = v6;
  objc_copyWeak(v23, &location);
  dispatch_async(accessSerialQueue, block);
  objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreModelRequest clientIdentifier](self->_request, "clientIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  -[MPStoreModelRequest clientVersion](self->_request, "clientVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 | v11)
  {
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    v13 = v12;
    if (v10)
      objc_msgSend(v12, "setClientIdentifier:", v10);
    if (v11)
      objc_msgSend(v13, "setClientVersion:", v11);
    v14 = objc_msgSend(v13, "copy");

    v9 = (void *)v14;
  }
  v15 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithIdentity:clientInfo:", v16, v9);

  objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __39__MPStoreModelRequestOperation_execute__block_invoke_3;
  v20[3] = &unk_1E315D5B8;
  v20[4] = self;
  v19 = v17;
  v21 = v19;
  objc_msgSend(v18, "getBagForRequestContext:withCompletionHandler:", v19, v20);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *accessSerialQueue;
  uint64_t v6;
  objc_super v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__35271;
  v13 = __Block_byref_object_dispose__35272;
  v14 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MPStoreModelRequestOperation_finishWithError___block_invoke;
  block[3] = &unk_1E31626B8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessSerialQueue, block);
  v6 = v16[5];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v10[5], v4);
  v7.receiver = self;
  v7.super_class = (Class)MPStoreModelRequestOperation;
  -[MPAsyncOperation finishWithError:](&v7, sel_finishWithError_, v4);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
}

- (double)remainingTimeInterval
{
  NSObject *accessSerialQueue;
  double v3;
  double v4;
  double v5;
  _QWORD block[7];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPStoreModelRequestOperation_remainingTimeInterval__block_invoke;
  block[3] = &unk_1E31626B8;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(accessSerialQueue, block);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v13[3] + v9[3] - v3;
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = 0.0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (double)adjustTimeoutInterval:(double)a3
{
  -[MPStoreModelRequestOperation assertRunningInAccessQueue](self, "assertRunningInAccessQueue");
  return a3;
}

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)assertRunningInAccessQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessSerialQueue);
}

- (void)dispatchAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_accessSerialQueue, a3);
}

- (void)dispatchSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_accessSerialQueue, a3);
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6;
  NSObject *accessSerialQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;

  v6 = a3;
  accessSerialQueue = self->_accessSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MPStoreModelRequestOperation__finishWithResponse_error___block_invoke;
  block[3] = &unk_1E31635F8;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  v8 = a4;
  dispatch_sync(accessSerialQueue, block);
  -[MPStoreModelRequestOperation finishWithError:](self, "finishWithError:", v8);

}

- (void)_executeItemMetadataLoadForRequestedItemIdentifiers:(id)a3 reason:(unint64_t)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  MPStoreItemMetadataRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(MPStoreItemMetadataRequest);
  objc_msgSend(v8, "clientInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreItemMetadataRequest setClientInfo:](v10, "setClientInfo:", v11);

  objc_msgSend(v8, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPStoreItemMetadataRequest setUserIdentity:](v10, "setUserIdentity:", v12);
  -[MPStoreItemMetadataRequest setItemIdentifiers:](v10, "setItemIdentifiers:", v9);

  -[MPStoreItemMetadataRequest setReason:](v10, "setReason:", a4);
  +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke;
  v15[3] = &unk_1E315D608;
  v15[4] = self;
  v14 = (id)objc_msgSend(v13, "getStoreItemMetadataForRequest:responseHandler:", v10, v15);

}

- (void)_executeURLLoadWithRequest:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5
{
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[MPStoreModelRequestOperation _URLLoadRequestWithRequest:requestContext:](self, "_URLLoadRequestWithRequest:requestContext:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC0F0], "highPrioritySession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke;
  v8[3] = &unk_1E315D630;
  v8[4] = self;
  objc_msgSend(v7, "enqueueDataRequest:withCompletionHandler:", v6, v8);

}

- (void)_executeURLLoadWithRequests:(id)a3 storeURLBag:(id)a4 requestContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id obj;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v22 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        -[MPStoreModelRequestOperation _URLLoadRequestWithRequest:requestContext:](self, "_URLLoadRequestWithRequest:requestContext:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DDC0F0], "highPrioritySession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke;
        v27[3] = &unk_1E315D680;
        v27[4] = self;
        v28 = v9;
        v29 = v8;
        v30 = v15;
        v31 = v10;
        objc_msgSend(v17, "enqueueDataRequest:withCompletionHandler:", v16, v27);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_3;
  block[3] = &unk_1E315D848;
  block[4] = self;
  v24 = v9;
  v25 = obj;
  v26 = v8;
  v18 = v8;
  v19 = obj;
  v20 = v9;
  dispatch_group_notify(v10, MEMORY[0x1E0C80D38], block);

}

- (void)_handleTimeout
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1001, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreModelRequestOperation _finishWithResponse:error:](self, "_finishWithResponse:error:", 0, v3);

  -[MPStoreModelRequestOperation cancel](self, "cancel");
}

- (void)_tearDownTimeoutTimerSource
{
  NSObject *timeoutTimerSource;
  OS_dispatch_source *v4;

  timeoutTimerSource = self->_timeoutTimerSource;
  if (timeoutTimerSource)
  {
    dispatch_source_cancel(timeoutTimerSource);
    v4 = self->_timeoutTimerSource;
    self->_timeoutTimerSource = 0;

  }
}

- (id)_URLLoadRequestWithRequest:(id)a3 requestContext:(id)a4
{
  id v6;
  MPStoreModelRequest *request;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v6 = a4;
  request = self->_request;
  v8 = a3;
  if ((-[MPStoreModelRequest authenticationOptions](request, "authenticationOptions") & 1) != 0)
  {
    objc_msgSend(v6, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    v12 = (void *)MEMORY[0x1E0DDBEF8];
    objc_msgSend(v10, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:", v13, v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0DDBFA8]);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __74__MPStoreModelRequestOperation__URLLoadRequestWithRequest_requestContext___block_invoke;
    v24 = &unk_1E31619C0;
    v25 = v15;
    v26 = v6;
    v17 = v15;
    v18 = (void *)objc_msgSend(v16, "initWithBlock:", &v21);
    v19 = objc_alloc(MEMORY[0x1E0DDBFB0]);
    v9 = (void *)objc_msgSend(v19, "initWithURLRequest:requestContext:", v8, v18, v21, v22, v23, v24);

    v8 = v10;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A8]), "initWithURLRequest:requestContext:", v8, v6);
  }

  return v9;
}

- (MPStoreModelRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeoutTimerSource, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_childOperation, 0);
  objc_storeStrong((id *)&self->_accessSerialQueue, 0);
}

void __74__MPStoreModelRequestOperation__URLLoadRequestWithRequest_requestContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setClientInfo:", v3);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v5);

}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 272);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_2;
  block[3] = &unk_1E315D658;
  block[1] = 3221225472;
  v14 = v6;
  v15 = v7;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v16 = v9;
  v17 = v10;
  v18 = v5;
  v11 = v5;
  v12 = v6;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_3(id *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  _BYTE v35[128];
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v2 = a1[5];
  v3 = *((_QWORD *)a1[4] + 34);
  block[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_4;
  block[3] = &unk_1E3163580;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v28 = &v29;
  v27 = v2;
  dispatch_sync(v3, block);
  v5 = v30[3];
  if (v5)
  {
    if (v5 == 1)
    {
      v6 = a1[4];
      objc_msgSend(a1[5], "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_finishWithResponse:error:", 0, v7);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = a1[5];
      v36 = CFSTR("errors");
      v37[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MPMusicAPIErrorDomain"), 1000, v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "_finishWithResponse:error:", 0, v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[6], "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = a1[6];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(a1[7], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v7, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      }
      while (v9);
    }

    v13 = objc_msgSend(v7, "count");
    if (v13 >= objc_msgSend(a1[6], "count"))
    {
      v20 = a1[4];
      v21[0] = v4;
      v21[1] = 3221225472;
      v21[2] = __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_5;
      v21[3] = &unk_1E315D5E0;
      v21[4] = v20;
      objc_msgSend(v20, "produceResponseWithLoadedOutput:completion:", v7, v21);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2938];
      v34 = CFSTR("Failed to get response body objects for each request in the compound URL load group.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("MPMusicAPIErrorDomain"), 1000, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "_finishWithResponse:error:", 0, v16);
    }
  }

  _Block_object_dispose(&v29, 8);
}

uint64_t __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", a2, a3);
}

void __87__MPStoreModelRequestOperation__executeURLLoadWithRequests_storeURLBag_requestContext___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "parsedBody");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 56));

  }
}

void __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, a3);
  }
  else
  {
    objc_msgSend(a2, "parsedBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke_2;
    v6[3] = &unk_1E315D5E0;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "produceResponseWithLoadedOutput:completion:", v5, v6);

  }
}

uint64_t __86__MPStoreModelRequestOperation__executeURLLoadWithRequest_storeURLBag_requestContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", a2, a3);
}

void __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, a3);
  }
  else if (objc_msgSend(v5, "isFinalResponse"))
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke_2;
    v8[3] = &unk_1E315D5E0;
    v8[4] = v7;
    objc_msgSend(v7, "produceResponseWithLoadedOutput:completion:", v6, v8);
  }

}

uint64_t __106__MPStoreModelRequestOperation__executeItemMetadataLoadForRequestedItemIdentifiers_reason_requestContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", a2, a3);
}

void __58__MPStoreModelRequestOperation__finishWithResponse_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_tearDownTimeoutTimerSource");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), *(id *)(a1 + 40));
}

uint64_t __53__MPStoreModelRequestOperation_remainingTimeInterval__block_invoke(_QWORD *a1)
{
  id *v2;
  uint64_t result;
  uint64_t v4;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 296);
  v2 = (id *)a1[4];
  objc_msgSend(v2[39], "timeoutInterval");
  result = objc_msgSend(v2, "adjustTimeoutInterval:");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  return result;
}

void __48__MPStoreModelRequestOperation_finishWithError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 288));
  v2 = MEMORY[0x19403A810](*(_QWORD *)(a1[4] + 320));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  v6 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = 0;

}

void __39__MPStoreModelRequestOperation_execute__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD handler[4];
  id v10;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = *(_QWORD *)(a1 + 48);
  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 304);
  *(_QWORD *)(v4 + 304) = v3;

  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 304);
  v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 304);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39__MPStoreModelRequestOperation_execute__block_invoke_2;
  handler[3] = &unk_1E315E5D0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 304));
  objc_destroyWeak(&v10);
}

void __39__MPStoreModelRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "serverEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverCorrelationKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "msv_description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v9;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      v31 = 2114;
      v32 = v12;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Got bag from server environment '%{public}@' with correlation key '%{public}@'. error=%{public}@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, v6);
    goto LABEL_18;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "serverEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverCorrelationKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Got bag from server environment '%{public}@' with correlation key '%{public}@'.", buf, 0x20u);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v16 = *(void **)(a1 + 32);
    v24 = 0;
    objc_msgSend(v16, "configurationForLoadingModelDataWithStoreURLBag:error:", v5, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "_finishWithResponse:error:", 0, v18);
LABEL_17:

      goto LABEL_18;
    }
    v19 = objc_msgSend(v17, "type");
    if (v19 == 2)
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v17, "URLRequests");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_executeURLLoadWithRequests:storeURLBag:requestContext:", v21, v5, *(_QWORD *)(a1 + 40));
    }
    else if (v19 == 1)
    {
      v23 = *(void **)(a1 + 32);
      objc_msgSend(v17, "requestedItemIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_executeItemMetadataLoadForRequestedItemIdentifiers:reason:requestContext:", v21, objc_msgSend(v17, "itemMetadataRequestReason"), *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (v19)
        goto LABEL_17;
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v17, "URLRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_executeURLLoadWithRequest:storeURLBag:requestContext:", v21, v5, *(_QWORD *)(a1 + 40));
    }

    goto LABEL_17;
  }
LABEL_18:

}

void __39__MPStoreModelRequestOperation_execute__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleTimeout");
    WeakRetained = v2;
  }

}

void __38__MPStoreModelRequestOperation_cancel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 280));
}

@end
