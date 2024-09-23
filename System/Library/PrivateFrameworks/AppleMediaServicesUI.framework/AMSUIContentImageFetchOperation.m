@implementation AMSUIContentImageFetchOperation

- (AMSUIContentImageFetchOperation)initWithURL:(id)a3
{
  id v5;
  AMSUIContentImageFetchOperation *v6;
  AMSUIContentImageFetchOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIContentImageFetchOperation;
  v6 = -[AMSUIContentImageFetchOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageURL, a3);

  return v7;
}

- (void)main
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc(MEMORY[0x24BDD1808]);
  -[AMSUIContentImageFetchOperation imageURL](self, "imageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithURL:resolvingAgainstBaseURL:", v5, 0);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v13, v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("fallbackURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByRemovingPercentEncoding");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v16);
  else
    v17 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("app"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("cacheKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v34 = objc_alloc_init(MEMORY[0x24BE08148]);
      objc_msgSend(v3, "objectForKey:", CFSTR("version"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contentInfoForApp:cacheKey:version:", v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = MEMORY[0x24BDAC760];
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __39__AMSUIContentImageFetchOperation_main__block_invoke;
      v39[3] = &unk_24CB4F828;
      v39[4] = self;
      v23 = v17;
      v40 = v23;
      objc_msgSend(v21, "addErrorBlock:", v39);
      v37[0] = v22;
      v37[1] = 3221225472;
      v37[2] = __39__AMSUIContentImageFetchOperation_main__block_invoke_12;
      v37[3] = &unk_24CB4F890;
      v37[4] = self;
      v38 = v23;
      objc_msgSend(v21, "addSuccessBlock:", v37);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_opt_class();
        v33 = v31;
        AMSLogKey();
        v36 = v6;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v31;
        v47 = 2114;
        v48 = v32;
        _os_log_impl(&dword_211102000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing content cache key", buf, 0x16u);

        v6 = v36;
      }

      -[AMSUIContentImageFetchOperation _fallbackWithURL:](self, "_fallbackWithURL:", v17);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_opt_class();
      v35 = v6;
      v27 = v26;
      AMSLogKey();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v26;
      v47 = 2114;
      v48 = v28;
      _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing application identifier", buf, 0x16u);

      v6 = v35;
    }

    -[AMSUIContentImageFetchOperation _fallbackWithURL:](self, "_fallbackWithURL:", v17);
  }

}

void __39__AMSUIContentImageFetchOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get content info: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_fallbackWithURL:", *(_QWORD *)(a1 + 40));

}

void __39__AMSUIContentImageFetchOperation_main__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithContentsOfFile:", v8);
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(*(id *)(a1 + 32), "_finishWithImage:error:", v9, 0);

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v13;
        v18 = 2114;
        v19 = v15;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load image: %{public}@", (uint8_t *)&v16, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_fallbackWithURL:", *(_QWORD *)(a1 + 40));
    goto LABEL_11;
  }
LABEL_12:

}

uint64_t __39__AMSUIContentImageFetchOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (void)_fallbackWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  -[AMSUIContentImageFetchOperation fallbackBlock](self, "fallbackBlock");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4
    && v5
    && ((*(void (**)(uint64_t, id))(v5 + 16))(v5, v4),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__AMSUIContentImageFetchOperation__fallbackWithURL___block_invoke;
    v9[3] = &unk_24CB4F8B8;
    v9[4] = self;
    objc_msgSend(v7, "addFinishBlock:", v9);
  }
  else
  {
    AMSError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAssetFetchOperation _finishWithImage:error:](self, "_finishWithImage:error:", 0, v8);
  }

}

uint64_t __52__AMSUIContentImageFetchOperation__fallbackWithURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithImage:error:", a2, a3);
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
}

@end
