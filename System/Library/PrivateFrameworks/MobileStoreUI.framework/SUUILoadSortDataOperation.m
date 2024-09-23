@implementation SUUILoadSortDataOperation

- (SUUILoadSortDataOperation)initWithResourceRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUILoadSortDataOperation;
  return -[SUUILoadResourceOperation initWithResourceRequest:](&v4, sel_initWithResourceRequest_, a3);
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = objc_alloc(MEMORY[0x24BEB2040]);
  -[SUUILoadResourceOperation resourceRequest](self, "resourceRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithURL:", v5);

  objc_msgSend(MEMORY[0x24BEB20B8], "consumer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataConsumer:", v7);

  -[SUUILoadResourceOperation clientContext](self, "clientContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStoreFrontSuffix:", v9);

  -[SUUILoadResourceOperation outputBlock](self, "outputBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__SUUILoadSortDataOperation_main__block_invoke;
  v12[3] = &unk_2511F78B8;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v6, "setOutputBlock:", v12);
  -[SUUILoadSortDataOperation setUnderlyingOperation:](self, "setUnderlyingOperation:", v6);
  objc_msgSend(v6, "main");

}

void __33__SUUILoadSortDataOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  SUUILockupComponent *v20;
  SUUILockupComponent *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("storePlatformData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("storePlatformPrewarmDataKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v11 = objc_opt_class();
      SUUIStorePageItemsWithStorePlatformDictionary(v7, v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("adamIds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v7;
      v27 = a1;
      v28 = v5;
      v36 = 0uLL;
      v37 = 0;
      SUUILockupStyleDefault((uint64_t)&v36);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = v12;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v10, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = [SUUILockupComponent alloc];
              v21 = v20;
              if (v19)
              {
                v30 = v36;
                v31 = v37;
                v22 = -[SUUILockupComponent initWithItem:style:](v20, "initWithItem:style:", v19, &v30);
              }
              else
              {
                v23 = objc_msgSend(v18, "longLongValue");
                v30 = v36;
                v31 = v37;
                v22 = -[SUUILockupComponent initWithItemIdentifier:style:](v21, "initWithItemIdentifier:style:", v23, &v30);
              }
              v24 = (void *)v22;
              objc_msgSend(v29, "addObject:", v22, v25);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v15);
      }

      v5 = v28;
      v7 = v26;
      a1 = v27;
      v12 = v25;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUILoadSortDataOperation;
  -[SUUILoadResourceOperation cancel](&v4, sel_cancel);
  -[SUUILoadSortDataOperation underlyingOperation](self, "underlyingOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (SSVLoadURLOperation)underlyingOperation
{
  return (SSVLoadURLOperation *)objc_loadWeakRetained((id *)&self->_underlyingOperation);
}

- (void)setUnderlyingOperation:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingOperation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_underlyingOperation);
}

@end
