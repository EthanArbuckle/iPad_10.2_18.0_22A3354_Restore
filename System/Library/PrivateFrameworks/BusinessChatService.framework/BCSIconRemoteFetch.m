@implementation BCSIconRemoteFetch

- (id)initWithCoalesceHelper:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSIconRemoteFetch;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (void)fetchSquareIconDataForBusinessItem:(void *)a3 forClientBundleID:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BCSCoalesceObjectData *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  char *v21;
  char *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  unsigned __int8 v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v7, "squareLogoURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:cachePolicy:timeoutInterval:", v10, 1, 10.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "bizID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("squareLogoFetch__%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = -[BCSCoalesceObjectData initWithCompletionBlock:coalesceKey:]([BCSCoalesceObjectData alloc], "initWithCompletionBlock:coalesceKey:", v9, v14);
      objc_msgSend(a1, "coalesceHelper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "enqueueCoalesceObject:isDuplicateRequest:", v15, &v27);

      v17 = v27;
      ABSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]";
          _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "New request is duplicate and already in progress: %s", buf, 0xCu);
        }
      }
      else
      {
        if (v19)
        {
          objc_msgSend(v7, "bizID");
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v22;
          _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "Remote Fetch icon data for business: %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
        v18 = objc_claimAutoreleasedReturnValue();
        -[NSObject set_sourceApplicationBundleIdentifier:](v18, "set_sourceApplicationBundleIdentifier:", v8);
        objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __86__BCSIconRemoteFetch_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
        v25[3] = &unk_24C39D468;
        v25[4] = a1;
        v26 = v14;
        objc_msgSend(v23, "dataTaskWithRequest:completionHandler:", v11, v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "resume");

      }
    }
    else
    {
      ABSLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "bizID");
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v21;
        _os_log_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_DEFAULT, "No square logo URL set for business item with ID: %@", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }

  }
}

void __86__BCSIconRemoteFetch_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "coalesceHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueCoalesceObjectsForCoalesceKey:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "dataCompletionBlock");
          v16 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v6, v7);
        }
        else
        {
          ABSLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "-[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]_block_invoke";
            _os_log_error_impl(&dword_20ACAD000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Wrong type of completion block added to data pool: %s", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }

}

- (BCSCoalesceHelperProtocol)coalesceHelper
{
  return self->_coalesceHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceHelper, 0);
}

@end
