@implementation SUUIReloadConfigurationOperation

+ (NSString)cachePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeFrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUIClientContext _cachePathForStoreFrontIdentifier:](SUUIClientContext, "_cachePathForStoreFrontIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SUUIReloadConfigurationOperation)init
{
  SUUIReloadConfigurationOperation *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIReloadConfigurationOperation;
  v2 = -[SUUIReloadConfigurationOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIReloadConfigurationOperation", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
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
  v9 = __Block_byref_object_copy__71;
  v10 = __Block_byref_object_dispose__71;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__SUUIReloadConfigurationOperation_outputBlock__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__SUUIReloadConfigurationOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "copy");
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
  v7[2] = __51__SUUIReloadConfigurationOperation_setOutputBlock___block_invoke;
  v7[3] = &unk_2511F4C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__SUUIReloadConfigurationOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 256) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 256);
    *(_QWORD *)(v5 + 256) = v4;

  }
}

- (void)setURLBag:(id)a3
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
  v7[2] = __46__SUUIReloadConfigurationOperation_setURLBag___block_invoke;
  v7[3] = &unk_2511F46D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __46__SUUIReloadConfigurationOperation_setURLBag___block_invoke(uint64_t a1)
{
  id v1;
  id *v2;

  v1 = *(id *)(a1 + 40);
  v2 = (id *)(*(_QWORD *)(a1 + 32) + 264);
  if (*v2 != v1)
    objc_storeStrong(v2, v1);
}

- (SSURLBag)URLBag
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3_0;
  v10 = __Block_byref_object_dispose__4_0;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__SUUIReloadConfigurationOperation_URLBag__block_invoke;
  v5[3] = &unk_2511F4720;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSURLBag *)v3;
}

void __42__SUUIReloadConfigurationOperation_URLBag__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

- (void)main
{
  SUUIURLBag *v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int *v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  int v48;
  SUUIReloadConfigurationOperation *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3_0;
  v46 = __Block_byref_object_dispose__4_0;
  v47 = 0;
  -[SUUIReloadConfigurationOperation URLBag](self, "URLBag");
  v3 = (SUUIURLBag *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIgnoresCaches:", 1);
    SSVDefaultUserAgent();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, *MEMORY[0x24BEB2518]);

    v3 = -[SSURLBag initWithURLBagContext:]([SUUIURLBag alloc], "initWithURLBagContext:", v4);
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3_0;
  v40 = __Block_byref_object_dispose__4_0;
  v41 = 0;
  v6 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __40__SUUIReloadConfigurationOperation_main__block_invoke;
  v32[3] = &unk_2511FBB80;
  v34 = &v36;
  v35 = &v42;
  v7 = v6;
  v33 = v7;
  -[SUUIURLBag loadWithCompletionBlock:](v3, "loadWithCompletionBlock:", v32);
  v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLog");
    v11 = objc_msgSend(v9, "shouldLogToDisk");
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v10 |= 2u;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v14 = v10;
    else
      v14 = v10 & 2;
    if (v14)
    {
      v48 = 138543362;
      v49 = self;
      LODWORD(v30) = 12;
      v29 = &v48;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), 6, 0);
        v17 = (void *)v43[5];
        v43[5] = v16;

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v48, v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      free(v15);
      v29 = (int *)v13;
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (objc_msgSend((id)v37[5], "count", v29))
  {
    -[SUUIURLBag storeFrontIdentifier](v3, "storeFrontIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activeAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    SSVStoreFrontIdentifierForAccount();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length") || v21 && objc_msgSend(v18, "hasPrefix:", v21))
    {
      v22 = v21;

      v18 = v22;
    }
    if (v18)
    {
      +[SUUIClientContext _cachePathForStoreFrontIdentifier:](SUUIClientContext, "_cachePathForStoreFrontIdentifier:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUUIClientContext _configurationDictionaryWithBagDictionary:](SUUIClientContext, "_configurationDictionaryWithBagDictionary:", v37[5]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 && v23)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v24, 200, 0, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v31 = objc_alloc_init(MEMORY[0x24BDD1580]);
          objc_msgSend(v23, "stringByDeletingLastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, 0);

          objc_msgSend(v25, "writeToFile:options:error:", v23, 1, 0);
        }

      }
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  -[SUUIReloadConfigurationOperation outputBlock](self, "outputBlock");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    (*(void (**)(uint64_t, void *, uint64_t))(v27 + 16))(v27, v24, v43[5]);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

}

intptr_t __40__SUUIReloadConfigurationOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
