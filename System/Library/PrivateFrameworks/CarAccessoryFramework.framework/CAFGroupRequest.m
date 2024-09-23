@implementation CAFGroupRequest

- (CAFGroupRequest)initWithCar:(id)a3
{
  id v4;
  CAFGroupRequest *v5;
  CAFGroupRequest *v6;
  uint64_t v7;
  NSUUID *uniqueIdentifier;
  uint64_t v9;
  NSMutableDictionary *requests;
  uint64_t v11;
  NSMutableDictionary *errors;
  CAFCachedDescription *v13;
  CAFCachedDescription *cachedDescription;
  CAFCachedDescription *v15;
  CAFCachedDescription *cachedRequestsDescription;
  CAFCachedDescription *v17;
  CAFCachedDescription *cachedFullDescription;
  NSObject *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CAFGroupRequest;
  v5 = -[CAFGroupRequest init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSUUID *)v7;

    objc_storeWeak((id *)&v6->_car, v4);
    v9 = objc_opt_new();
    requests = v6->_requests;
    v6->_requests = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableDictionary *)v11;

    v13 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v6);
    cachedDescription = v6->_cachedDescription;
    v6->_cachedDescription = v13;

    v15 = -[CAFCachedDescription initWithCacheable:lazyRefreshDescription:]([CAFCachedDescription alloc], "initWithCacheable:lazyRefreshDescription:", v6, 1);
    cachedRequestsDescription = v6->_cachedRequestsDescription;
    v6->_cachedRequestsDescription = v15;

    v17 = -[CAFCachedDescription initWithCacheable:lazyRefreshDescription:]([CAFCachedDescription alloc], "initWithCacheable:lazyRefreshDescription:", v6, 1);
    cachedFullDescription = v6->_cachedFullDescription;
    v6->_cachedFullDescription = v17;

    CAFGroupRequestLogging();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[CAFGroupRequest initWithCar:].cold.1();

  }
  return v6;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CAFGroupRequest requests](self, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addCharacteristic:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CAFGroupRequest *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __37__CAFGroupRequest_addCharacteristic___block_invoke;
  v11 = &unk_2508FD240;
  v12 = self;
  v13 = v4;
  v5 = v4;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", &v8);
  -[CAFGroupRequest cachedRequestsDescription](self, "cachedRequestsDescription", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefreshDescription");

  -[CAFGroupRequest cachedFullDescription](self, "cachedFullDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsRefreshDescription");

}

void __37__CAFGroupRequest_addCharacteristic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "requestForCharacteristic:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_addRequest:", v2);
    v2 = v3;
  }

}

- (void)addCharacteristics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  CAFGroupRequest *v13;

  v4 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __38__CAFGroupRequest_addCharacteristics___block_invoke;
  v11 = &unk_2508FD240;
  v12 = v4;
  v13 = self;
  v5 = v4;
  -[CAFGroupRequest _lockedPerformBlock:](self, "_lockedPerformBlock:", &v8);
  -[CAFGroupRequest cachedRequestsDescription](self, "cachedRequestsDescription", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefreshDescription");

  -[CAFGroupRequest cachedFullDescription](self, "cachedFullDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsRefreshDescription");

}

void __38__CAFGroupRequest_addCharacteristics___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "requestForCharacteristic:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 40), "_addRequest:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(id, void *);
  uint8_t buf[4];
  CAFGroupRequest *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CAFGroupRequest performed](self, "performed"))
  {
    CAFGroupRequestLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CAFGroupRequest performWithCompletion:].cold.1(self, v6);

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "CAF_groupRequestAlreadyPerformed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);

    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_21;
  }
  -[CAFGroupRequest setPerformed:](self, "setPerformed:", 1);
  os_unfair_lock_unlock(&self->_lock);
  -[CAFGroupRequest cachedFullDescription](self, "cachedFullDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsRefreshDescription");

  -[CAFGroupRequest requests](self, "requests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFGroupRequest setPendingGroups:](self, "setPendingGroups:", objc_msgSend(v9, "count"));

  -[CAFGroupRequest requests](self, "requests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    CAFGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[CAFGroupRequest performWithCompletion:].cold.3(self, v12);

    CARSignpostLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (self)
    {
      CARSignpostLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_signpost_id_make_with_pointer(v14, self);

      if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_20:

        -[CAFGroupRequest requests](self, "requests");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __41__CAFGroupRequest_performWithCompletion___block_invoke;
        v19[3] = &unk_2508FE998;
        v19[4] = self;
        v20 = v4;
        objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);

        goto LABEL_21;
      }
    }
    else
    {
      v15 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_signpost_emit_with_name_impl(&dword_237717000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Perform", "GroupRequest %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
  CAFGroupRequestLogging();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CAFGroupRequest performWithCompletion:].cold.2(self, v16);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "CAF_groupRequestWithNoCharacteristics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v17);

  }
LABEL_21:

}

void __41__CAFGroupRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CAFGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_2(a1);

  CARSignpostLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CARSignpostLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, v5);

    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_9;
  }
  else
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v8))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v29 = v5;
    v30 = 2112;
    v31 = v11;
    _os_signpost_emit_with_name_impl(&dword_237717000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Perform", "Request %@ from %@", buf, 0x16u);
  }
LABEL_9:

  v12 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "groupRequestValueForRequests:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "car");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __41__CAFGroupRequest_performWithCompletion___block_invoke_19;
    v23[3] = &unk_2508FE970;
    v16 = v5;
    v17 = *(_QWORD *)(a1 + 32);
    v24 = v16;
    v25 = v17;
    v26 = v6;
    v27 = *(id *)(a1 + 40);
    objc_msgSend(v14, "performGroupedRequest:key:value:withResponse:", v15, v16, v13, v23);

    v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "valueForKey:", CFSTR("characteristic"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "CAF_groupRequestNilForCharacteristics:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "errors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v5);

    CAFGroupRequestLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_1(v12);
  }

}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CAFGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v48 = v5;
    v49 = 2112;
    v50 = v6;
    v51 = 2048;
    v52 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_237717000, v4, OS_LOG_TYPE_DEFAULT, "Perform group request completed key: %@ error=%@ value count: %ld", buf, 0x20u);

  }
  v8 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "setPendingGroups:", objc_msgSend(*(id *)(a1 + 40), "pendingGroups") - 1);
  objc_msgSend(*(id *)(a1 + 40), "cachedFullDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsRefreshDescription");

  CAFGroupRequestLogging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v48 = v39;
    v49 = 2112;
    v50 = v40;
    v51 = 2112;
    v52 = (uint64_t)v41;
    _os_log_debug_impl(&dword_237717000, v10, OS_LOG_TYPE_DEBUG, "%@ completed request %@ error=%@", buf, 0x20u);

  }
  v11 = 0xEEEEB0B5B2B2EEEELL;

  CARSignpostLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = 0xEEEEB0B5B2B2EEEELL;
  if (!*(_QWORD *)(a1 + 32)
    || (CARSignpostLogForCategory(),
        v14 = objc_claimAutoreleasedReturnValue(),
        v13 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 32)),
        v14,
        v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_237717000, v12, OS_SIGNPOST_INTERVAL_END, v13, "Perform", (const char *)&unk_2377DBA75, buf, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "completedRequests:withResponse:", *(_QWORD *)(a1 + 48), v3);
  objc_msgSend(v3, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "errors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 32));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = *(id *)(a1 + 48);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v43;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v22);
          objc_msgSend(v3, "error", (_QWORD)v42);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "characteristic");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setError:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v20);
    }

  }
  if (!objc_msgSend(*v8, "pendingGroups", (_QWORD)v42))
  {
    objc_msgSend(*v8, "errors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    objc_msgSend(*v8, "errors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27 == 1)
    {
      objc_msgSend(v28, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = objc_msgSend(v28, "count");

      if (v32 < 2)
      {
        v34 = 0;
        goto LABEL_25;
      }
      v33 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*v8, "errors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "CAF_groupRequestErrors:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v31;

LABEL_25:
    CAFGeneralLogging();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      __41__CAFGroupRequest_performWithCompletion___block_invoke_19_cold_1((id *)(a1 + 40));

    CARSignpostLogForCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (!*v8
      || (CARSignpostLogForCategory(),
          v37 = objc_claimAutoreleasedReturnValue(),
          v11 = os_signpost_id_make_with_pointer(v37, *v8),
          v37,
          v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_237717000, v36, OS_SIGNPOST_INTERVAL_END, v11, "Perform", (const char *)&unk_2377DBA75, buf, 2u);
      }
    }

    v38 = *(_QWORD *)(a1 + 56);
    if (v38)
      (*(void (**)(uint64_t, void *))(v38 + 16))(v38, v34);

  }
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFGroupRequest cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fullDescription
{
  void *v2;
  void *v3;

  -[CAFGroupRequest cachedFullDescription](self, "cachedFullDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_lockedPerformBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;

  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[CAFGroupRequest performed](self, "performed"))
  {
    CAFGroupRequestLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CAFGroupRequest _lockedPerformBlock:].cold.1();

  }
  else
  {
    v4[2](v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_addRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CAFGroupRequest requests](self, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[CAFGroupRequest requests](self, "requests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

- (id)currentDescriptionForCache:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[CAFGroupRequest cachedFullDescription](self, "cachedFullDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CAFGroupRequest _currentDescriptionForFull](self, "_currentDescriptionForFull");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v11;
    goto LABEL_7;
  }
  -[CAFGroupRequest cachedRequestsDescription](self, "cachedRequestsDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[CAFGroupRequest _currentDescriptionForRequests](self, "_currentDescriptionForRequests");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_opt_class();
  -[CAFGroupRequest uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p %@>"), v8, self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (id)_currentDescriptionForFull
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CAFGroupRequest uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAFGroupRequest performed](self, "performed");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" Pending=%lu"), -[CAFGroupRequest pendingGroups](self, "pendingGroups"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_2508FF798;
  }
  -[CAFGroupRequest cachedRequestsDescription](self, "cachedRequestsDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@%@ {%@}>"), v4, self, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  return v9;
}

- (id)_currentDescriptionForRequests
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  -[CAFGroupRequest requests](self, "requests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CAFGroupRequest__currentDescriptionForRequests__block_invoke;
  v8[3] = &unk_2508FE9C0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __49__CAFGroupRequest__currentDescriptionForRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %lu"), v6, objc_msgSend(a3, "count"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
}

- (CAFCar)car
{
  return (CAFCar *)objc_loadWeakRetained((id *)&self->_car);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (NSMutableDictionary)errors
{
  return self->_errors;
}

- (BOOL)performed
{
  return self->_performed;
}

- (void)setPerformed:(BOOL)a3
{
  self->_performed = a3;
}

- (unint64_t)pendingGroups
{
  return self->_pendingGroups;
}

- (void)setPendingGroups:(unint64_t)a3
{
  self->_pendingGroups = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (CAFCachedDescription)cachedRequestsDescription
{
  return self->_cachedRequestsDescription;
}

- (void)setCachedRequestsDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRequestsDescription, a3);
}

- (CAFCachedDescription)cachedFullDescription
{
  return self->_cachedFullDescription;
}

- (void)setCachedFullDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedFullDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFullDescription, 0);
  objc_storeStrong((id *)&self->_cachedRequestsDescription, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)initWithCar:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, v0, v1, "%@", v2);
}

- (void)performWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, a2, v4, "%@ already performed", v5);

  OUTLINED_FUNCTION_12();
}

- (void)performWithCompletion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, a2, v4, "%@ no characteristics", v5);

  OUTLINED_FUNCTION_12();
}

- (void)performWithCompletion:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fullDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, a2, v4, "%@ start ", v5);

  OUTLINED_FUNCTION_12();
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%@ nil groupRequest %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%@ performing %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __41__CAFGroupRequest_performWithCompletion___block_invoke_19_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "fullDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%@ completed all requests error=%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)_lockedPerformBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1(&dword_237717000, v0, v1, "%@ already performed", v2);
}

@end
