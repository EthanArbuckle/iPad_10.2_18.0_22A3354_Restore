@implementation GEOImageServiceRequester

+ (id)sharedRequester
{
  if (qword_1ECDBCAD8 != -1)
    dispatch_once(&qword_1ECDBCAD8, &__block_literal_global_187);
  return (id)_MergedGlobals_323;
}

void __43__GEOImageServiceRequester_sharedRequester__block_invoke()
{
  GEOImageServiceRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOImageServiceRequester);
  v1 = (void *)_MergedGlobals_323;
  _MergedGlobals_323 = (uint64_t)v0;

}

- (GEOImageServiceRequester)init
{
  GEOImageServiceRequester *v2;
  uint64_t v3;
  geo_isolater *isolater;
  uint64_t v5;
  NSHashTable *pendingRequests;
  uint64_t v7;
  NSMapTable *requestToIdentifier;
  GEOImageServiceRequester *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GEOImageServiceRequester;
  v2 = -[GEOImageServiceRequester init](&v11, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSHashTable *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 5);
    requestToIdentifier = v2->_requestToIdentifier;
    v2->_requestToIdentifier = (NSMapTable *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)startImageServiceRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 queue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEOImageServiceRequestSimple *v26;
  void *global_workloop;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(_QWORD *);
  void *v48;
  GEOImageServiceRequester *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;

  v15 = a3;
  v39 = a4;
  v38 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = v19;
  v21 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke;
    v58[3] = &unk_1E1C15E50;
    v59 = v16;
    v60 = v17;
    v35 = (void *)MEMORY[0x18D765024](v58);

    if (v20)
    {
LABEL_3:
      v55[0] = v21;
      v55[1] = 3221225472;
      v55[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_3;
      v55[3] = &unk_1E1C00A28;
      v56 = v16;
      v57 = v20;
      v22 = (void *)MEMORY[0x18D765024](v55);

      goto LABEL_6;
    }
  }
  else
  {
    v35 = 0;
    if (v19)
      goto LABEL_3;
  }
  v22 = 0;
LABEL_6:
  v36 = v20;
  v37 = v17;
  v33 = v16;
  v34 = v18;
  if (v18)
  {
    v52[0] = v21;
    v52[1] = 3221225472;
    v52[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_5;
    v52[3] = &unk_1E1C028E0;
    v53 = v16;
    v54 = v18;
    v18 = (id)MEMORY[0x18D765024](v52);

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v21;
  v46 = 3221225472;
  v47 = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_7;
  v48 = &unk_1E1C01790;
  v49 = self;
  v50 = v15;
  v51 = v23;
  v32 = v23;
  geo_isolate_sync_data();
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defaultTraits");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOImageServiceRequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ImageService.startImageServiceRequest"), v25, v39, v38);
  -[GEOImageServiceRequestSimple setRequest:](v26, "setRequest:", v50);
  -[GEOImageServiceRequestSimple setIdentifier:](v26, "setIdentifier:", v32);
  global_workloop = (void *)geo_get_global_workloop();
  v40[0] = v21;
  v40[1] = 3221225472;
  v40[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_11;
  v40[3] = &unk_1E1C15E78;
  v40[4] = self;
  v41 = v50;
  v42 = v18;
  v43 = v35;
  v44 = v22;
  v28 = v22;
  v29 = v35;
  v30 = v18;
  v31 = v50;
  -[GEOXPCRequest send:withReply:handler:](v26, "send:withReply:handler:", 0, global_workloop, v40);

}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_2;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_4;
  v7[3] = &unk_1E1BFF970;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_5(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_6;
  v4[3] = &unk_1E1C0C650;
  v3 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(v3, v4);

}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_7(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]))
  {
    if (qword_1ECDBCAE8 != -1)
      dispatch_once(&qword_1ECDBCAE8, &__block_literal_global_42_1);
    v2 = qword_1ECDBCAE0;
    if (os_log_type_enabled((os_log_t)qword_1ECDBCAE0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_FAULT, "Attempting to start a request which has already been started", v4, 2u);
    }
  }
  objc_msgSend(*(id *)(a1[4] + 16), "addObject:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKey:", a1[6], a1[5]);
}

void __115__GEOImageServiceRequester_startImageServiceRequest_auditToken_throttleToken_queue_finished_networkActivity_error___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_finishRequest:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v13, "response");
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
    if (v6)
    {
      v10 = *(_QWORD *)(a1 + 56);
      if (v10)
      {
        v11 = *(void (**)(void))(v10 + 16);
LABEL_12:
        v11();
      }
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 64);
      if (v12)
      {
        v11 = *(void (**)(void))(v12 + 16);
        goto LABEL_12;
      }
    }

  }
}

- (void)cancelImageServiceRequest:(id)a3
{
  id v4;
  id v5;
  GEOImageServiceRequestSimple *v6;
  uint8_t v7[8];
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *);
  void *v11;
  GEOImageServiceRequester *v12;
  id v13;
  uint64_t *v14;
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
  v18 = __Block_byref_object_copy__94;
  v19 = __Block_byref_object_dispose__94;
  v20 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__GEOImageServiceRequester_cancelImageServiceRequest___block_invoke;
  v11 = &unk_1E1C041E8;
  v14 = &v15;
  v12 = self;
  v5 = v4;
  v13 = v5;
  geo_isolate_sync_data();
  if (-[GEOImageServiceRequester _finishRequest:](self, "_finishRequest:", v5))
  {
    if (v16[5])
    {
      v6 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOImageServiceRequestSimple alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ImageService.cancelImageServiceRequest"), 0, 0, 0);
      -[GEOImageServiceRequestSimple setRequest:](v6, "setRequest:", v5);
      -[GEOImageServiceRequestSimple setIdentifier:](v6, "setIdentifier:", v16[5]);
      -[GEOXPCRequest send:](v6, "send:", 0);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: uuid != ((void *)0)", v7, 2u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __54__GEOImageServiceRequester_cancelImageServiceRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  -[NSMapTable removeObjectForKey:](self->_requestToIdentifier, "removeObjectForKey:", v4);
  _geo_isolate_unlock();

  return v5;
}

- (unint64_t)calculateFreeableSize
{
  GEOImageServiceCalculateFreeableSizeRequest *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v7;

  v2 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOImageServiceCalculateFreeableSizeRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ImageService.calculateFreeable"), 0, 0, 0);
  v7 = 0;
  -[GEOXPCRequest sendSync:error:](v2, "sendSync:error:", 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "size");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)shrinkDiskCacheToSize:(unint64_t)a3
{
  GEOImageServicePurgeCacheToSizeRequest *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v9;

  v4 = -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:]([GEOImageServicePurgeCacheToSizeRequest alloc], "initWithMessage:traits:auditToken:throttleToken:", CFSTR("ImageService.purgeDiskCache"), 0, 0, 0);
  -[GEOImageServicePurgeCacheToSizeRequest setTargetSize:](v4, "setTargetSize:", a3);
  v9 = 0;
  -[GEOXPCRequest sendSync:error:](v4, "sendSync:error:", 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "amountDeleted");
  else
    v7 = 0;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
