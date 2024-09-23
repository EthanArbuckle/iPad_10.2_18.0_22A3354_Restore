@implementation AMSMockNetworkProxy

+ (id)_overrides
{
  if (_MergedGlobals_132 != -1)
    dispatch_once(&_MergedGlobals_132, &__block_literal_global_95);
  return (id)qword_1ECEAD738;
}

void __33__AMSMockNetworkProxy__overrides__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)qword_1ECEAD738;
  qword_1ECEAD738 = (uint64_t)v0;

}

+ (NSArray)registeredOverrides
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__49;
  v9 = __Block_byref_object_dispose__49;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__AMSMockNetworkProxy_registeredOverrides__block_invoke;
  v4[3] = &unk_1E2540228;
  v4[4] = &v5;
  v4[5] = a1;
  objc_msgSend(a1, "_sync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __42__AMSMockNetworkProxy_registeredOverrides__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "_overrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (NSArray)executedOverrides
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__49;
  v11 = __Block_byref_object_dispose__49;
  v12 = 0;
  v3 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__AMSMockNetworkProxy_executedOverrides__block_invoke;
  v6[3] = &unk_1E2540228;
  v6[4] = &v7;
  v6[5] = a1;
  objc_msgSend(v3, "_sync:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __40__AMSMockNetworkProxy_executedOverrides__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "_executedOverrides");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)addOverride:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__AMSMockNetworkProxy_addOverride___block_invoke;
  v6[3] = &unk_1E2540A40;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "_sync:", v6);

}

void __35__AMSMockNetworkProxy_addOverride___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "_overrides");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

+ (void)clearOverrides
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__AMSMockNetworkProxy_clearOverrides__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  objc_msgSend(a1, "_sync:", v2);
}

void __37__AMSMockNetworkProxy_clearOverrides__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_overrides");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

+ (void)removeOverride:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AMSMockNetworkProxy_removeOverride___block_invoke;
  v6[3] = &unk_1E2540A40;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "_sync:", v6);

}

uint64_t __38__AMSMockNetworkProxy_removeOverride___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_removeOverride:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__AMSMockNetworkProxy_canInitWithRequest___block_invoke;
  v7[3] = &unk_1E2544040;
  v10 = a1;
  v5 = v4;
  v8 = v5;
  v9 = &v11;
  objc_msgSend(a1, "_sync:", v7);
  LOBYTE(a1) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)a1;
}

void __42__AMSMockNetworkProxy_canInitWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "_overrides", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldOverrideURLRequest:", *(_QWORD *)(a1 + 32)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

- (void)startLoading
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__49;
  v19 = __Block_byref_object_dispose__49;
  v20 = 0;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (id)objc_opt_class();
    -[NSURLProtocol request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableURLRequest((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding request: %{public}@", buf, 0x16u);

  }
  v8 = (void *)objc_opt_class();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke;
  v14[3] = &unk_1E253E378;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v8, "_sync:", v14);
  -[AMSMockNetworkProxy setCurrentOverride:](self, "setCurrentOverride:", v16[5]);
  objc_msgSend((id)v16[5], "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 0, sizeof(buf));
  -[NSURLProtocol request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v10, "handleReceivedRequest:", v11);
  else
    memset(buf, 0, sizeof(buf));

  if (*(_QWORD *)&buf[8])
    -[AMSMockNetworkProxy sendResponse:](self, "sendResponse:");
  if (*(_QWORD *)&buf[16])
  {
    -[AMSMockNetworkProxy finishWithError:](self, "finishWithError:");
    objc_msgSend((id)v16[5], "executedObservable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendFailure:", *(_QWORD *)&buf[16]);
  }
  else
  {
    -[AMSMockNetworkProxy finishWithData:](self, "finishWithData:", *(_QWORD *)buf);
    objc_msgSend((id)v16[5], "executedObservable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendResult:", *(_QWORD *)&buf[8]);
  }

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke_3;
  v13[3] = &unk_1E2542338;
  v13[4] = self;
  v13[5] = &v15;
  objc_msgSend((id)objc_opt_class(), "_sync:", v13);

  _Block_object_dispose(&v15, 8);
}

void __35__AMSMockNetworkProxy_startLoading__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend((id)objc_opt_class(), "_overrides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__AMSMockNetworkProxy_startLoading__block_invoke_2;
  v6[3] = &unk_1E2544068;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "ams_firstObjectPassingTest:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __35__AMSMockNetworkProxy_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldOverrideURLRequest:", v4);

  return v5;
}

void __35__AMSMockNetworkProxy_startLoading__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_executedOverrides");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  objc_msgSend(v3, "addObject:", v2);

}

- (void)stopLoading
{
  void *v2;
  id v3;

  -[AMSMockNetworkProxy currentOverride](self, "currentOverride");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRunningTasks");

}

- (void)sendResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;

  objc_msgSend(v4, "ams_valueForHTTPHeaderField:", CFSTR("Location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "statusCode") >= 300 && objc_msgSend(v4, "statusCode") <= 399 && v5)
  {
    -[AMSMockNetworkProxy performRedirectFromResponse:](self, "performRedirectFromResponse:", v7);
  }
  else
  {
    -[NSURLProtocol client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v7, 2);

  }
}

- (void)performRedirectFromResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v14;
  else
    v4 = 0;

  -[NSURLProtocol request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "ams_valueForHTTPHeaderField:", CFSTR("Location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setURL:", v8);

  v9 = objc_msgSend(v4, "statusCode");
  if (v9 == 303
    || (unint64_t)(v9 - 301) <= 1
    && (objc_msgSend(v6, "HTTPMethod"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (v11 = v10, v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("POST")), v11, v12))
  {
    objc_msgSend(v6, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(v6, "setHTTPBody:", 0);
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", 0, CFSTR("Content-Length"));
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", 0, CFSTR("Content-Type"));
  }
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", 0, CFSTR("Authorization"));
  -[NSURLProtocol client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLProtocol:wasRedirectedToRequest:redirectResponse:", self, v6, v14);

}

- (void)finishWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NSURLProtocol client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLProtocol:didLoadData:", self, v4);

  -[NSURLProtocol client](self, "client");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLProtocolDidFinishLoading:", self);

}

- (void)finishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSURLProtocol client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLProtocol:didFailWithError:", self, v4);

}

+ (NSMutableArray)_executedOverrides
{
  if (qword_1ECEAD740 != -1)
    dispatch_once(&qword_1ECEAD740, &__block_literal_global_8_0);
  return (NSMutableArray *)(id)qword_1ECEAD748;
}

void __41__AMSMockNetworkProxy__executedOverrides__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)qword_1ECEAD748;
  qword_1ECEAD748 = (uint64_t)v0;

}

+ (void)_removeAllOverrides
{
  id v2;

  objc_msgSend(a1, "_overrides");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (void)_removeOverride:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "_overrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 - 1 >= 0)
  {
    v6 = v5;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", --v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v7))
        break;

      if (v6 <= 0)
        goto LABEL_7;
    }
    objc_msgSend(v4, "removeObjectAtIndex:", v6);

  }
LABEL_7:

}

+ (void)_sync:(id)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  id v5;

  v3 = qword_1ECEAD750;
  v4 = (void (**)(_QWORD))a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECEAD750, &__block_literal_global_9_4);
  v5 = (id)qword_1ECEAD758;
  objc_msgSend(v5, "lock");
  v4[2](v4);

  objc_msgSend(v5, "unlock");
}

void __29__AMSMockNetworkProxy__sync___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)qword_1ECEAD758;
  qword_1ECEAD758 = (uint64_t)v0;

}

- (AMSMockURLOverride)currentOverride
{
  return self->_currentOverride;
}

- (void)setCurrentOverride:(id)a3
{
  objc_storeStrong((id *)&self->_currentOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOverride, 0);
}

@end
