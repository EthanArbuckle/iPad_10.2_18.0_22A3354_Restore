@implementation GEOTransitUpdateRequester

+ (id)sharedRequester
{
  if (qword_1ECDBC7F0 != -1)
    dispatch_once(&qword_1ECDBC7F0, &__block_literal_global_173);
  return (id)_MergedGlobals_309;
}

void __44__GEOTransitUpdateRequester_sharedRequester__block_invoke()
{
  GEOTransitUpdateRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOTransitUpdateRequester);
  v1 = (void *)_MergedGlobals_309;
  _MergedGlobals_309 = (uint64_t)v0;

}

- (GEOTransitUpdateRequester)init
{
  GEOTransitUpdateRequester *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  NSHashTable *pendingRequests;
  GEOTransitUpdateRequester *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOTransitUpdateRequester;
  v2 = -[GEOTransitUpdateRequester init](&v9, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSHashTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 networkActivity:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  GEOTransitRouteUpdateRequestSimple *v26;
  void *global_workloop;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  GEOTransitUpdateRequester *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v17)
  {
    v18 = v14;
    v19 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke;
    v45[3] = &unk_1E1C14CA8;
    v31 = v15;
    v20 = v15;
    v46 = v20;
    v47 = v17;
    v21 = a5;
    v22 = a4;
    v23 = (void *)MEMORY[0x18D765024](v45);
    v30 = v16;
    if (v16)
    {
      v42[0] = v19;
      v42[1] = 3221225472;
      v42[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_3;
      v42[3] = &unk_1E1C028E0;
      v43 = v20;
      v44 = v16;
      v24 = (void *)MEMORY[0x18D765024](v42);

    }
    else
    {
      v24 = 0;
    }
    v25 = v19;
    v36 = v19;
    v37 = 3221225472;
    v38 = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_5;
    v39 = &unk_1E1C00738;
    v40 = self;
    v41 = v18;
    geo_isolate_sync_data();
    v26 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOTransitRouteUpdateRequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("TransitUpdate.startTransitRouteUpdateRequest"), 0, v22, v21);

    v14 = v18;
    -[GEOTransitRouteUpdateRequestSimple setRequest:](v26, "setRequest:", v41);
    global_workloop = (void *)geo_get_global_workloop();
    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_6;
    v32[3] = &unk_1E1C14CD0;
    v32[4] = self;
    v33 = v41;
    v34 = v24;
    v35 = v23;
    v28 = v23;
    v29 = v24;
    -[GEOXPCRequest send:withReply:handler:](v26, "send:withReply:handler:", 0, global_workloop, v32);

    v16 = v30;
    v15 = v31;
  }

}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_2;
  block[3] = &unk_1E1C01358;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_4;
  v4[3] = &unk_1E1C0C650;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

void __118__GEOTransitUpdateRequester_startTransitRouteUpdateRequest_auditToken_throttleToken_queue_networkActivity_completion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_finishRequest:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v10, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (v7 && !v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)cancelTransitRouteUpdateRequest:(id)a3
{
  GEOTransitRouteUpdateRequestSimple *v4;
  id v5;

  v5 = a3;
  if (-[GEOTransitUpdateRequester _finishRequest:](self, "_finishRequest:"))
  {
    v4 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOTransitRouteUpdateRequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("TransitUpdate.cancelTransitRouteUpdateRequest"), 0, 0, 0);
    -[GEOTransitRouteUpdateRequestSimple setRequest:](v4, "setRequest:", v5);
    -[GEOXPCRequest send:](v4, "send:", 0);

  }
}

- (BOOL)_finishRequest:(id)a3
{
  id v4;
  BOOL v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  v5 = -[NSHashTable containsObject:](self->_pendingRequests, "containsObject:", v4);
  if (v5)
    -[NSHashTable removeObject:](self->_pendingRequests, "removeObject:", v4);
  _geo_isolate_unlock();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
