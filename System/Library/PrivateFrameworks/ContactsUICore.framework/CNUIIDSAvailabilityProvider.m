@implementation CNUIIDSAvailabilityProvider

void __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "finishWithResult:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  CNLogicalNot();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "handle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 209);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "finishWithError:", v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

}

- (id)validateHandlesForFaceTime:(id)a3 schedulerProvider:(id)a4
{
  return -[CNUIIDSAvailabilityProvider validateHandles:forService:schedulerProvider:](self, "validateHandles:forService:schedulerProvider:", a3, 0, a4);
}

- (id)validateHandles:(id)a3 forService:(int64_t)a4 schedulerProvider:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(id *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a5;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIIDSAvailabilityProvider cacheForService:](self, "cacheForService:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIIDSAvailabilityProvider resourceLock](self, "resourceLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke;
  v26 = &unk_1EA604770;
  v27 = v8;
  v28 = v13;
  v29 = v12;
  v30 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v8;
  objc_msgSend(v14, "performBlock:", &v23);

  objc_msgSend(v10, "backgroundScheduler", v23, v24, v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIIDSAvailabilityProvider startRequestForCacheMisses:service:scheduler:](self, "startRequestForCacheMisses:service:scheduler:", v16, a4, v19);

  objc_msgSend(v15, "_cn_map:", &__block_literal_global_26_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "merge:schedulerProvider:", v20, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)startRequestForCacheMisses:(id)a3 service:(int64_t)a4 scheduler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) == 0)
  {
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIIDSAvailabilityProvider queryControllerWrapper](self, "queryControllerWrapper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIIDSRequest validateHandles:forService:scheduler:queryControllerWrapper:](CNUIIDSRequest, "validateHandles:forService:scheduler:queryControllerWrapper:", v10, a4, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke;
    v17[3] = &unk_1EA604728;
    v14 = v8;
    v18 = v14;
    objc_msgSend(v12, "addSuccessBlock:", v17);
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke_2;
    v15[3] = &unk_1EA602FF8;
    v16 = v14;
    objc_msgSend(v12, "addFailureBlock:", v15);

  }
}

- (CNScheduler)resourceLock
{
  return self->_resourceLock;
}

- (id)cacheForService:(int64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2:
      -[CNUIIDSAvailabilityProvider expanseRequests](self, "expanseRequests");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[CNUIIDSAvailabilityProvider iMessageRequests](self, "iMessageRequests");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      -[CNUIIDSAvailabilityProvider faceTimeRequests](self, "faceTimeRequests");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

- (CNUIDSHandleAvailabilityCache)faceTimeRequests
{
  return self->_faceTimeRequests;
}

- (CNUIIDSIDQueryControllerWrapper)queryControllerWrapper
{
  return self->_queryControllerWrapper;
}

void __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CNUIDSHandleAvailabilityPromise *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(a1[5], "objectForKey:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8
          || objc_msgSend(v8, "isFinished")
          && (objc_msgSend(v9, "result:", 0),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              !v10))
        {
          v11 = objc_alloc_init(CNUIDSHandleAvailabilityPromise);
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v11, v7);
          -[CNPromise future](v11, "future");
          v12 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[5], "setObject:forKey:", v12, v7);
          v9 = (void *)v12;
        }
        objc_msgSend(a1[7], "addObject:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (CNUIDSHandleAvailabilityCache)iMessageRequests
{
  return self->_iMessageRequests;
}

id __76__CNUIIDSAvailabilityProvider_validateHandles_forService_schedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithFuture:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)validateHandlesForIMessage:(id)a3 schedulerProvider:(id)a4
{
  return -[CNUIIDSAvailabilityProvider validateHandles:forService:schedulerProvider:](self, "validateHandles:forService:schedulerProvider:", a3, 1, a4);
}

- (CNUIIDSAvailabilityProvider)initWithQueryControllerWrapper:(id)a3
{
  id v5;
  CNUIIDSAvailabilityProvider *v6;
  CNUIIDSAvailabilityProvider *v7;
  uint64_t v8;
  CNUIDSHandleAvailabilityCache *faceTimeRequests;
  uint64_t v10;
  CNUIDSHandleAvailabilityCache *iMessageRequests;
  uint64_t v12;
  CNUIDSHandleAvailabilityCache *expanseRequests;
  NSArray *requestFutures;
  uint64_t v15;
  CNScheduler *resourceLock;
  CNUIIDSAvailabilityProvider *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNUIIDSAvailabilityProvider;
  v6 = -[CNUIIDSAvailabilityProvider init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryControllerWrapper, a3);
    objc_msgSend((id)objc_opt_class(), "makeFaceTimeRequestsCache");
    v8 = objc_claimAutoreleasedReturnValue();
    faceTimeRequests = v7->_faceTimeRequests;
    v7->_faceTimeRequests = (CNUIDSHandleAvailabilityCache *)v8;

    objc_msgSend((id)objc_opt_class(), "makeIMessageRequestsCache");
    v10 = objc_claimAutoreleasedReturnValue();
    iMessageRequests = v7->_iMessageRequests;
    v7->_iMessageRequests = (CNUIDSHandleAvailabilityCache *)v10;

    objc_msgSend((id)objc_opt_class(), "makeExpanseRequestsCache");
    v12 = objc_claimAutoreleasedReturnValue();
    expanseRequests = v7->_expanseRequests;
    v7->_expanseRequests = (CNUIDSHandleAvailabilityCache *)v12;

    requestFutures = v7->_requestFutures;
    v7->_requestFutures = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0D13B68], "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contactsuicore.CNUIIDSAvailabilityProvider"));
    v15 = objc_claimAutoreleasedReturnValue();
    resourceLock = v7->_resourceLock;
    v7->_resourceLock = (CNScheduler *)v15;

    v17 = v7;
  }

  return v7;
}

+ (id)makeIMessageRequestsCache
{
  void *v2;
  void *v3;
  CNUIDSIMessageHandleAvailabilityCache *v4;
  void *v5;
  CNUIDSIMessageHandleAvailabilityCache *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [CNUIDSIMessageHandleAvailabilityCache alloc];
  objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNCache initWithBoundingStrategies:resourceScheduler:](v4, "initWithBoundingStrategies:resourceScheduler:", v3, v5);

  -[CNCache addDidEvictHandler:](v6, "addDidEvictHandler:", &__block_literal_global_11_1);
  return v6;
}

+ (id)makeFaceTimeRequestsCache
{
  void *v2;
  void *v3;
  CNUIDSFaceTimeHandleAvailabilityCache *v4;
  void *v5;
  CNUIDSFaceTimeHandleAvailabilityCache *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [CNUIDSFaceTimeHandleAvailabilityCache alloc];
  objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNCache initWithBoundingStrategies:resourceScheduler:](v4, "initWithBoundingStrategies:resourceScheduler:", v3, v5);

  -[CNCache addDidEvictHandler:](v6, "addDidEvictHandler:", &__block_literal_global_38);
  return v6;
}

+ (id)makeExpanseRequestsCache
{
  void *v2;
  void *v3;
  CNUIDSExpanseHandleAvailabilityCache *v4;
  void *v5;
  CNUIDSExpanseHandleAvailabilityCache *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D139B0], "boundingStrategyWithCapacity:", 20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [CNUIDSExpanseHandleAvailabilityCache alloc];
  objc_msgSend(MEMORY[0x1E0D139B0], "nonatomicCacheScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNCache initWithBoundingStrategies:resourceScheduler:](v4, "initWithBoundingStrategies:resourceScheduler:", v3, v5);

  -[CNCache addDidEvictHandler:](v6, "addDidEvictHandler:", &__block_literal_global_13_0);
  return v6;
}

uint64_t __56__CNUIIDSAvailabilityProvider_makeFaceTimeRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __56__CNUIIDSAvailabilityProvider_makeIMessageRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

uint64_t __55__CNUIIDSAvailabilityProvider_makeExpanseRequestsCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (CNUIIDSAvailabilityProvider)init
{
  CNUIIDSIDQueryControllerWrapper *v3;
  CNUIIDSAvailabilityProvider *v4;

  v3 = objc_alloc_init(CNUIIDSIDQueryControllerWrapper);
  v4 = -[CNUIIDSAvailabilityProvider initWithQueryControllerWrapper:](self, "initWithQueryControllerWrapper:", v3);

  return v4;
}

void __76__CNUIIDSAvailabilityProvider_startRequestForCacheMisses_service_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishWithError:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)validateHandlesForExpanse:(id)a3 schedulerProvider:(id)a4
{
  return -[CNUIIDSAvailabilityProvider validateHandles:forService:schedulerProvider:](self, "validateHandles:forService:schedulerProvider:", a3, 2, a4);
}

- (void)setQueryControllerWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_queryControllerWrapper, a3);
}

- (void)setFaceTimeRequests:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeRequests, a3);
}

- (void)setIMessageRequests:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageRequests, a3);
}

- (CNUIDSHandleAvailabilityCache)expanseRequests
{
  return self->_expanseRequests;
}

- (void)setExpanseRequests:(id)a3
{
  objc_storeStrong((id *)&self->_expanseRequests, a3);
}

- (NSArray)requestFutures
{
  return self->_requestFutures;
}

- (void)setRequestFutures:(id)a3
{
  objc_storeStrong((id *)&self->_requestFutures, a3);
}

- (void)setResourceLock:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_requestFutures, 0);
  objc_storeStrong((id *)&self->_expanseRequests, 0);
  objc_storeStrong((id *)&self->_iMessageRequests, 0);
  objc_storeStrong((id *)&self->_faceTimeRequests, 0);
  objc_storeStrong((id *)&self->_queryControllerWrapper, 0);
}

@end
