@implementation AMSKeybag

- (AMSKeybag)init
{
  AMSKeybag *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  AMSFairPlayContext *v5;
  AMSFairPlayContext *fairPlayContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSKeybag;
  v2 = -[AMSKeybag init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ams.AMSKeybag.dispatch", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(AMSFairPlayContext);
    fairPlayContext = v2->_fairPlayContext;
    v2->_fairPlayContext = v5;

  }
  return v2;
}

+ (AMSKeybag)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AMSKeybag_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECEAD2C8 != -1)
    dispatch_once(&qword_1ECEAD2C8, block);
  return (AMSKeybag *)(id)_MergedGlobals_115;
}

void __27__AMSKeybag_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_115;
  _MergedGlobals_115 = (uint64_t)v1;

}

- (unsigned)fairplayContextWithError:(id *)a3
{
  void *v4;

  -[AMSKeybag fairPlayContext](self, "fairPlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v4, "fairplayContextIDWithError:", a3);

  return a3;
}

- (BOOL)importKeybagWithData:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  AMSKeybag *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39;
  v24 = __Block_byref_object_dispose__39;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__AMSKeybag_importKeybagWithData_error___block_invoke;
  v11[3] = &unk_1E25426E8;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v20;
  dispatch_sync(dispatchQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __40__AMSKeybag_importKeybagWithData_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    return;
  }
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "fairplayContextWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
    objc_msgSend(*(id *)(a1 + 32), "length");
    ha0dkchaters6();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Import error with status: %ld"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(505, CFSTR("Fairplay Import error"), v6, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      return;
    }
    goto LABEL_6;
  }
}

- (BOOL)importDiversityBagWithData:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return 0;
}

- (id)keybagSyncDataWithAccountID:(id)a3 transactionType:(unsigned int)a4 error:(id *)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__39;
  v28 = __Block_byref_object_dispose__39;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__39;
  v22 = __Block_byref_object_dispose__39;
  v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AMSKeybag_keybagSyncDataWithAccountID_transactionType_error___block_invoke;
  block[3] = &unk_1E2542710;
  block[4] = self;
  v15 = &v18;
  v10 = v8;
  v17 = a4;
  v14 = v10;
  v16 = &v24;
  dispatch_sync(dispatchQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __63__AMSKeybag_keybagSyncDataWithAccountID_transactionType_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "fairplayContextWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v18 = 0;
    v17 = 0;
    v5 = objc_msgSend(*(id *)(a1 + 40), "longLongValue");
    Mt76Vq80ux(v4, v5, 0, *(unsigned int *)(a1 + 64), (uint64_t)&v18, (uint64_t)&v17);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("KBSync generation error for dsid: %@, status: %ld"), v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      AMSError(505, CFSTR("Keybag Error"), v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, v17);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;
    }

    if (v18)
      jEHf8Xzsv8K(v18);
  }
}

- (void)resetContext
{
  id v2;

  -[AMSKeybag fairPlayContext](self, "fairPlayContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destroyContext");

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (AMSFairPlayContext)fairPlayContext
{
  return self->_fairPlayContext;
}

- (void)setFairPlayContext:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlayContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayContext, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
