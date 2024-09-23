@implementation MGRemoteQueryServerHandlerQuery

- (id)_initWithRequest:(id)a3
{
  id v5;
  MGRemoteQueryServerHandlerQuery *v6;
  MGRemoteQueryServerHandlerQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGRemoteQueryServerHandlerQuery;
  v6 = -[MGRemoteQueryServerHandlerQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_request, a3);
    -[MGRemoteQueryServerHandlerQuery _requestParse](v7, "_requestParse");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryServerHandlerQuery setQuery:](self, "setQuery:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerHandlerQuery;
  -[MGRemoteQueryServerHandlerQuery dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerHandlerQuery requestPredicate](self, "requestPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerHandlerQuery query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _predicate = %@, _query = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)urlPath
{
  return CFSTR("/mgquery");
}

+ (id)handlerForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRequest:", v4);

  return v5;
}

- (BOOL)validateRequest
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "urlPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerHandlerQuery request](self, "request");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqual:", v6);

  -[MGRemoteQueryServerHandlerQuery requestPredicate](self, "requestPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 != 0;

  -[MGRemoteQueryServerHandlerQuery requestPredicate](self, "requestPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v9, "mg_containsCurrentDevice");

  return v4 & ~(_BYTE)v3 & v7;
}

- (int)prepareResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerHandlerQuery setResponseBoundary:](self, "setResponseBoundary:", v7);

  v8 = (void *)MEMORY[0x24BDD17C8];
  -[MGRemoteQueryServerHandlerQuery responseBoundary](self, "responseBoundary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("multipart/x-mixed-replace; boundary=\"%@\"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "UTF8String");
  nw_http_fields_append();

  -[MGRemoteQueryServerHandlerQuery _queryStart](self, "_queryStart");
  return 200;
}

- (void)provideResponseData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__MGRemoteQueryServerHandlerQuery_provideResponseData___block_invoke;
  v6[3] = &unk_24E0AA7A0;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  v8 = &v9;
  -[MGRemoteQueryServerHandlerQuery _withLock:](self, "_withLock:", v6);
  if (*((_BYTE *)v10 + 24))
    -[MGRemoteQueryServerHandlerQuery _querySendResults](self, "_querySendResults");

  _Block_object_dispose(&v9, 8);
}

uint64_t __55__MGRemoteQueryServerHandlerQuery_provideResponseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPayloadProvider:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "pendingUpdate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_requestParse
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerHandlerQuery request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v18 = v4;
  objc_msgSend(v4, "queryItems");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 134218498;
    v16 = v7;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "name", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(CFSTR("predicate"), "isEqual:", v11);

        if (v12)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            if (objc_msgSend(v13, "length"))
            {
              objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                -[MGRemoteQueryServerHandlerQuery setRequestPredicate:](self, "setRequestPredicate:", v15);

                goto LABEL_18;
              }
            }
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_18:

}

- (void)_queryStart
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  MGRemoteQueryServerHandlerQuery *v23;
  __int16 v24;
  NSObject *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerHandlerQuery query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    MGLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v23 = self;
      _os_log_error_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_ERROR, "%p handler already started query", buf, 0xCu);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForHaveCurrentHome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v6;
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForLocal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v7;
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForRestrictedTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v8;
    objc_msgSend(MEMORY[0x24BE64B90], "rq_predicateForInCurrentHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v9;
    -[MGRemoteQueryServerHandlerQuery requestPredicate](self, "requestPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "andPredicateWithSubpredicates:", v11);
    v4 = objc_claimAutoreleasedReturnValue();

    MGLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      _os_log_debug_impl(&dword_21CBD2000, v12, OS_LOG_TYPE_DEBUG, "%p handler starting query with predicate %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x24BE64BA0];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __46__MGRemoteQueryServerHandlerQuery__queryStart__block_invoke;
    v19 = &unk_24E0AA7C8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v13, "queryWithPredicate:updateHandler:", v4, &v16);
    v14 = objc_claimAutoreleasedReturnValue();
    -[MGRemoteQueryServerHandlerQuery setQuery:](self, "setQuery:", v14, v16, v17, v18, v19);
    MGLogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_DEFAULT, "%p handler started query %@", buf, 0x16u);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

void __46__MGRemoteQueryServerHandlerQuery__queryStart__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_queryHandleResults:error:", v8, v5);

}

- (void)_queryHandleResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  MGRemoteQueryServerHandlerQuery *v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __61__MGRemoteQueryServerHandlerQuery__queryHandleResults_error___block_invoke;
  v13 = &unk_24E0AA7F0;
  v14 = self;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v17 = &v18;
  -[MGRemoteQueryServerHandlerQuery _withLock:](self, "_withLock:", &v10);
  if (v19[5])
    -[MGRemoteQueryServerHandlerQuery _querySendResults](self, "_querySendResults", v10, v11, v12, v13, v14, v15);

  _Block_object_dispose(&v18, 8);
}

void __61__MGRemoteQueryServerHandlerQuery__queryHandleResults_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setQueryGroups:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setQueryError:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setPendingUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "payloadProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_querySendResults
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[8];
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
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  MGRemoteQueryServerHandlerQuery *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__18;
  v34 = __Block_byref_object_dispose__19;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__18;
  v28 = __Block_byref_object_dispose__19;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __52__MGRemoteQueryServerHandlerQuery__querySendResults__block_invoke;
  v17[3] = &unk_24E0AA818;
  v17[4] = self;
  v17[5] = &v30;
  v17[6] = &v24;
  v17[7] = &v18;
  -[MGRemoteQueryServerHandlerQuery _withLock:](self, "_withLock:", v17);
  if (v19[5])
  {
    if (v31[5])
    {
      +[MGRemoteQueryReply replyWithGroups:](MGRemoteQueryReply, "replyWithGroups:");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v25[5])
      {
        v4 = 0;
        goto LABEL_9;
      }
      +[MGRemoteQueryReply replyWithError:](MGRemoteQueryReply, "replyWithError:");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
LABEL_9:
    v5 = (void *)MEMORY[0x24BDD1608];
    -[NSObject rq_coded](v4, "rq_coded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;

    if (v8)
    {
      (*(void (**)(void))(v19[5] + 16))();
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      -[MGRemoteQueryServerHandlerQuery responseBoundary](self, "responseBoundary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("\r\n--%@\r\n"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("content-length: %lu\r\ncontent-type: application/json; charset=utf8\r\n\r\n"),
        objc_msgSend(v7, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataUsingEncoding:", 5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dataUsingEncoding:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v15, "appendData:", v14);
      objc_msgSend(v15, "appendData:", v7);
      (*(void (**)(void))(v19[5] + 16))();

    }
    goto LABEL_13;
  }
  MGLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v37 = self;
    _os_log_error_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_ERROR, "%p handler not sending query results without payload provider", buf, 0xCu);
  }
LABEL_13:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __52__MGRemoteQueryServerHandlerQuery__querySendResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "pendingUpdate") & 1) == 0)
  {
    MGLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 134217984;
      v15 = v13;
      _os_log_debug_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_DEBUG, "%p transaction not sending query results without update", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "queryGroups");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "queryError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    MGLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 134217984;
      v15 = v12;
      _os_log_error_impl(&dword_21CBD2000, v11, OS_LOG_TYPE_ERROR, "%p transaction has no result or error to send", (uint8_t *)&v14, 0xCu);
    }
LABEL_8:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "payloadProvider");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "setPayloadProvider:", 0);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "setPendingUpdate:", 0);
}

- (NSArray)queryGroups
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_queryGroups;
}

- (void)setQueryGroups:(id)a3
{
  NSArray *v5;
  NSArray **p_queryGroups;
  NSArray *queryGroups;
  char v8;
  NSArray *v9;

  v9 = (NSArray *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = v9;
  queryGroups = self->_queryGroups;
  p_queryGroups = &self->_queryGroups;
  if (queryGroups != v9)
  {
    v8 = -[NSArray isEqual:](v9, "isEqual:");
    v5 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_queryGroups, a3);
      v5 = v9;
    }
  }

}

- (NSError)queryError
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_queryError;
}

- (void)setQueryError:(id)a3
{
  NSError *v5;
  NSError **p_queryError;
  NSError *queryError;
  char v8;
  NSError *v9;

  v9 = (NSError *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = v9;
  queryError = self->_queryError;
  p_queryError = &self->_queryError;
  if (queryError != v9)
  {
    v8 = -[NSError isEqual:](v9, "isEqual:");
    v5 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_queryError, a3);
      v5 = v9;
    }
  }

}

- (id)payloadProvider
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)MEMORY[0x220788584](self->_payloadProvider);
}

- (void)setPayloadProvider:(id)a3
{
  void *v4;
  void *v5;
  id payloadProvider;
  id v7;

  v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v4 = v7;
  if (self->_payloadProvider != v7)
  {
    v5 = (void *)MEMORY[0x220788584](v7);
    payloadProvider = self->_payloadProvider;
    self->_payloadProvider = v5;

    v4 = v7;
  }

}

- (BOOL)pendingUpdate
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_pendingUpdate;
}

- (void)setPendingUpdate:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_pendingUpdate != v3)
    self->_pendingUpdate = v3;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSPredicate)requestPredicate
{
  return self->_requestPredicate;
}

- (void)setRequestPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_requestPredicate, a3);
}

- (NSString)responseBoundary
{
  return self->_responseBoundary;
}

- (void)setResponseBoundary:(id)a3
{
  objc_storeStrong((id *)&self->_responseBoundary, a3);
}

- (MGGroupQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_responseBoundary, 0);
  objc_storeStrong((id *)&self->_requestPredicate, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_payloadProvider, 0);
  objc_storeStrong((id *)&self->_queryError, 0);
  objc_storeStrong((id *)&self->_queryGroups, 0);
}

@end
