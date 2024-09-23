@implementation SUUILoadGratisEligibilityOperation

- (SUUILoadGratisEligibilityOperation)init
{
  void *v3;
  SUUILoadGratisEligibilityOperation *v4;

  +[SUUIClientContext defaultContext](SUUIClientContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUUILoadGratisEligibilityOperation initWithBundleIdentifiers:clientContext:](self, "initWithBundleIdentifiers:clientContext:", 0, v3);

  return v4;
}

- (SUUILoadGratisEligibilityOperation)initWithBundleIdentifiers:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUILoadGratisEligibilityOperation *v8;
  uint64_t v9;
  NSArray *bundleIDs;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *dispatchQueue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUILoadGratisEligibilityOperation;
  v8 = -[SUUILoadGratisEligibilityOperation init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIDs = v8->_bundleIDs;
    v8->_bundleIDs = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_clientContext, a4);
    v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUUILoadGratisEligibilityOperation")));
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v12;

  }
  return v8;
}

- (id)outputBlock
{
  NSObject *dispatchQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *(*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__60;
  v10 = __Block_byref_object_dispose__60;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__SUUILoadGratisEligibilityOperation_outputBlock__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__SUUILoadGratisEligibilityOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputBlock:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SUUILoadGratisEligibilityOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_2511F4C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __53__SUUILoadGratisEligibilityOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 272) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 272);
    *(_QWORD *)(v5 + 272) = v4;

  }
}

- (void)main
{
  dispatch_semaphore_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__4;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v3 = dispatch_semaphore_create(0);
  -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__SUUILoadGratisEligibilityOperation_main__block_invoke;
  v15[3] = &unk_2511F7068;
  v17 = &v19;
  v18 = &v25;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "loadValueForKey:completionBlock:", CFSTR("up-to-date-eligibility-read"), v15);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v20[5])
  {
    v7 = objc_alloc(MEMORY[0x24BDB7458]);
    v8 = (void *)objc_msgSend(v7, "initWithURL:", v20[5]);
    -[SUUILoadGratisEligibilityOperation _bodyData](self, "_bodyData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHTTPBody:", v9);

    objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    v10 = -[SUUIClientContext newLoadStoreURLOperationWithURLRequest:](self->_clientContext, "newLoadStoreURLOperationWithURLRequest:", v8);
    objc_msgSend(MEMORY[0x24BEB20B8], "consumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataConsumer:", v11);

    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __42__SUUILoadGratisEligibilityOperation_main__block_invoke_2;
    v14[3] = &unk_2511F6F18;
    v14[4] = &v31;
    v14[5] = &v25;
    objc_msgSend(v10, "setOutputBlock:", v14);
    objc_msgSend(v10, "main");

  }
  -[SUUILoadGratisEligibilityOperation outputBlock](self, "outputBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v32[5], v26[5]);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __42__SUUILoadGratisEligibilityOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__SUUILoadGratisEligibilityOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v7, "integerValue"))
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      objc_msgSend(v5, "objectForKey:", CFSTR("items"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v6;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = v11;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v17, "objectForKey:", CFSTR("item-id"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v18);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        v6 = v22;
        v11 = v21;
      }

    }
  }
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v6;

}

- (id)_bodyData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BEB2038]);
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountIdentifier:", v6);

  objc_msgSend(v3, "setBundleIdentifiers:", self->_bundleIDs);
  objc_msgSend(v3, "JSONBodyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end
