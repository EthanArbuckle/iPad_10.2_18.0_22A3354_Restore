@implementation SUUIAddToWishlistOperation

- (SUUIAddToWishlistOperation)initWithItem:(id)a3 reason:(int64_t)a4
{
  id v6;
  SUUIAddToWishlistOperation *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *requestParameters;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIAddToWishlistOperation;
  v7 = -[SUUIAddToWishlistOperation init](&v19, sel_init);
  if (v7)
  {
    v7->_itemIdentifier = objc_msgSend(v6, "itemIdentifier");
    v7->_reason = a4;
    objc_msgSend(v6, "primaryItemOffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v9, 1);
      requestParameters = v7->_requestParameters;
      v7->_requestParameters = (NSMutableDictionary *)v10;

      -[NSMutableDictionary removeObjectForKey:](v7->_requestParameters, "removeObjectForKey:", CFSTR("salableAdamId"));
    }
    else
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = v7->_requestParameters;
      v7->_requestParameters = v12;

    }
    v14 = v7->_requestParameters;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), v7->_itemIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, CFSTR("id"));

    objc_msgSend(v6, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[NSMutableDictionary setObject:forKey:](v7->_requestParameters, "setObject:forKey:", v16, CFSTR("wishlistItemName"));
    objc_msgSend(v6, "itemKindString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[NSMutableDictionary setObject:forKey:](v7->_requestParameters, "setObject:forKey:", v17, CFSTR("kind"));

  }
  return v7;
}

- (void)main
{
  id v3;
  void *v4;
  SUUIURLConnectionRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v18;
  int64_t itemIdentifier;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  int v38;
  void *v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v3, "setAllowedRetryCount:", 0);
  objc_msgSend(v3, "setCachePolicy:", 1);
  objc_msgSend(v3, "setITunesStoreRequest:", 1);
  objc_msgSend(v3, "setRequestParameters:", self->_requestParameters);
  objc_msgSend(v3, "setShouldProcessProtocol:", self->_reason == 0);
  objc_msgSend(v3, "setURLBagKey:", CFSTR("addToWishlistBaseUrl"));
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", CFSTR("Software"), *MEMORY[0x24BEB2548]);
  SSVDefaultUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("User-Agent"));

  v5 = -[SSURLConnectionRequest initWithRequestProperties:]([SUUIURLConnectionRequest alloc], "initWithRequestProperties:", v3);
  -[SSURLConnectionRequest setShouldMescalSign:](v5, "setShouldMescalSign:", 1);
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DC0]), "initWithAccount:", v7);
  -[SSURLConnectionRequest setAuthenticationContext:](v5, "setAuthenticationContext:", v8);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__26;
  v36 = __Block_byref_object_dispose__26;
  v37 = 0;
  v9 = dispatch_semaphore_create(0);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __34__SUUIAddToWishlistOperation_main__block_invoke;
  v29[3] = &unk_2511F70B8;
  v31 = &v32;
  v10 = v9;
  v30 = v10;
  -[SUUIURLConnectionRequest startWithConnectionResponseBlock:](v5, "startWithConnectionResponseBlock:", v29);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = v33[5];
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v27, "objectForKey:", CFSTR("status"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldLog");
    v14 = objc_msgSend(v12, "shouldLogToDisk");
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
      v17 = v13 | 2;
    else
      v17 = v13;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      v18 = v17;
    else
      v18 = v17 & 2;
    if (v18)
    {
      itemIdentifier = self->_itemIdentifier;
      v38 = 138412546;
      v39 = v26;
      v40 = 2048;
      v41 = itemIdentifier;
      LODWORD(v25) = 22;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_13:

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((unint64_t)objc_msgSend(v26, "integerValue") >= 2)
            v21 = 3;
          else
            v21 = 0;
        }
        else
        {
          v21 = 3;
        }
        v22 = objc_alloc(MEMORY[0x24BEB20C8]);
        objc_msgSend(v7, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithAccountIdentifier:", objc_msgSend(v23, "longLongValue"));

        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __34__SUUIAddToWishlistOperation_main__block_invoke_32;
        v28[3] = &unk_2511F7450;
        v28[4] = self;
        v28[5] = v21;
        objc_msgSend(v24, "performTransactionWithBlock:", v28);

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v38, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_20:

  _Block_object_dispose(&v32, 8);
}

intptr_t __34__SUUIAddToWishlistOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "bodyData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __34__SUUIAddToWishlistOperation_main__block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BEB1FA8];
  v4 = *MEMORY[0x24BEB2BD8];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248);
  v6 = a2;
  objc_msgSend(v3, "predicateWithProperty:equalToLongLong:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB20D0], "anyInDatabase:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forProperty:", v9, *MEMORY[0x24BEB2BF0]);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
}

@end
