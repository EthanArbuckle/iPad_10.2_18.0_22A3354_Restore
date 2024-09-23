@implementation HDRapportMessenger

- (id)initForCompanionDevice
{
  HDRapportMessenger *v2;
  HDRapportMessenger *v3;
  uint64_t v4;
  RPCompanionLinkClient *rapportClient;
  NSMutableDictionary *v6;
  NSMutableDictionary *observersBySchemaIdentifier;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  RPCompanionLinkClient *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HDRapportMessenger;
  v2 = -[HDRapportMessenger init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[HDRapportMessenger newRapportClient](v2, "newRapportClient");
    rapportClient = v3->_rapportClient;
    v3->_rapportClient = (RPCompanionLinkClient *)v4;

    -[RPCompanionLinkClient setServiceType:](v3->_rapportClient, "setServiceType:", CFSTR("com.apple.healthd.rapport"));
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersBySchemaIdentifier = v3->_observersBySchemaIdentifier;
    v3->_observersBySchemaIdentifier = v6;

    v3->_lock._os_unfair_lock_opaque = 0;
    NSStringForRapportSchemaIdentifier(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v3);
    _HKInitializeLogging();
    v9 = (id)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v8;
      v11 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Registering Rapport requestID %{public}@", buf, 0x16u);

    }
    v12 = v3->_rapportClient;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__HDRapportMessenger_initForCompanionDevice__block_invoke;
    v14[3] = &unk_1E6D10F18;
    objc_copyWeak(&v15, &location);
    -[RPCompanionLinkClient registerRequestID:options:handler:](v12, "registerRequestID:options:handler:", v8, 0, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __44__HDRapportMessenger_initForCompanionDevice__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleIncomingRequest:responseHandler:", v7, v6);

}

- (id)newRapportClient
{
  return objc_alloc_init(MEMORY[0x1E0D83900]);
}

- (void)sendRequest:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  RPCompanionLinkClient *rapportClient;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringToIndex:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_opt_class();
    v16 = v15;
    *(_DWORD *)buf = 138544130;
    v32 = v15;
    v33 = 2114;
    v34 = v12;
    v35 = 2114;
    v36 = v8;
    v37 = 2048;
    v38 = objc_msgSend(v9, "length");
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending request [%{public}@] %{public}@ (%lu bytes)", buf, 0x2Au);

  }
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "schemaIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("schemaId"));

  objc_msgSend(v8, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("requestName"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("requestId"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("data"));
  NSStringForRapportSchemaIdentifier(objc_msgSend(v8, "schemaIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  rapportClient = self->_rapportClient;
  v22 = (void *)objc_msgSend(v17, "copy");
  v23 = *MEMORY[0x1E0D83968];
  v29 = *MEMORY[0x1E0D839A0];
  v30 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__HDRapportMessenger_sendRequest_data_completion___block_invoke;
  v27[3] = &unk_1E6D10F40;
  v27[4] = self;
  v28 = v26;
  v25 = v26;
  -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:](rapportClient, "sendRequestID:request:destinationID:options:responseHandler:", v20, v22, v23, v24, v27);

}

void __50__HDRapportMessenger_sendRequest_data_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  _BYTE v31[24];
  __CFString *v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestName"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("[missing name]");
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestId"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_1E6D11BB8;
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  v20 = v7;
  v21 = v20;
  if (v8)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    if (v11)
    {
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v8, v10, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
  }
  if (v21)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v29 = v24;
      *(_DWORD *)v31 = 138544130;
      *(_QWORD *)&v31[4] = objc_opt_class();
      *(_WORD *)&v31[12] = 2114;
      *(_QWORD *)&v31[14] = v19;
      *(_WORD *)&v31[22] = 2114;
      v32 = v15;
      LOWORD(v33) = 2114;
      *(_QWORD *)((char *)&v33 + 2) = v21;
      v30 = *(id *)&v31[4];
      _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Request %{public}@:%{public}@ failed with error: %{public}@", v31, 0x2Au);

    }
  }
  objc_msgSend(v21, "domain", *(_OWORD *)v31, *(_QWORD *)&v31[16], v32, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D83988]);

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 300, CFSTR("Remote device is unreachable"), v20);
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)addObserver:(id)a3 forSchemaIdentifier:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  NSStringForRapportSchemaIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersBySchemaIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    v7 = (void *)objc_msgSend(v8, "initWithName:loggingCategory:", v6, *MEMORY[0x1E0CB5370]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observersBySchemaIdentifier, "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "registerObserver:", v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3 forSchemaIdentifier:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *observersBySchemaIdentifier;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  observersBySchemaIdentifier = self->_observersBySchemaIdentifier;
  NSStringForRapportSchemaIdentifier(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](observersBySchemaIdentifier, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unregisterObserver:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_observersBySchemaIdentifier, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unregisterObserver:", v4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleIncomingRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  HDRapportRequestIdentifier *v10;
  void *v11;
  HDRapportRequestIdentifier *v12;
  HDRapportRequestIdentifier *v13;
  void *v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSMutableDictionary *observersBySchemaIdentifier;
  void *v21;
  NSObject *v22;
  os_log_t v23;
  void *v24;
  id v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  HDRapportRequestIdentifier *v31;
  id v32;
  HDRapportRequestIdentifier *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  HDRapportRequestIdentifier *v38;
  __int16 v39;
  HDRapportRequestIdentifier *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("schemaId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = [HDRapportRequestIdentifier alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDRapportRequestIdentifier initWithSchemaIdentifier:name:](v10, "initWithSchemaIdentifier:name:", v9, v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestId"));
  v13 = (HDRapportRequestIdentifier *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v15 = (os_log_t *)MEMORY[0x1E0CB5370];
  v16 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = (void *)objc_opt_class();
    v19 = v18;
    *(_DWORD *)buf = 138544130;
    v36 = v18;
    v37 = 2114;
    v38 = v13;
    v39 = 2114;
    v40 = v12;
    v41 = 2048;
    v42 = objc_msgSend(v14, "length");
    _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Received request [%{public}@] %{public}@ (%lu bytes)", buf, 0x2Au);

  }
  if (v12)
  {
    os_unfair_lock_lock(&self->_lock);
    observersBySchemaIdentifier = self->_observersBySchemaIdentifier;
    NSStringForRapportSchemaIdentifier(v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](observersBySchemaIdentifier, "objectForKeyedSubscript:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    if (-[NSObject count](v22, "count"))
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke;
      v30[3] = &unk_1E6D10F90;
      v30[4] = self;
      v31 = v12;
      v32 = v14;
      v33 = v13;
      v34 = v6;
      -[NSObject notifyObservers:](v22, "notifyObservers:", v30);

    }
    else
    {
      _HKInitializeLogging();
      v26 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      {
        v27 = v26;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v36 = v28;
        v37 = 2114;
        v38 = v12;
        v29 = v28;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: No observer to handle incoming request %{public}@", buf, 0x16u);

      }
    }
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v23 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
  {
    v22 = v23;
    v24 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    v25 = v24;
    _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Malformed incoming request does not have an identifier", buf, 0xCu);

LABEL_10:
  }

}

void __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke_2;
  v7[3] = &unk_1E6D10F68;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(a2, "rapportMessenger:didReceiveRequest:data:responseHandler:", v5, v8, v6, v7);

}

void __61__HDRapportMessenger__handleIncomingRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a3;
  v7 = a2;
  v14 = objc_alloc_init(v5);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("requestName"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("requestId"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("data"));

  objc_msgSend(v6, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("errorCode"));

  objc_msgSend(v6, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("errorDescription"));
  v12 = *(_QWORD *)(a1 + 48);
  v13 = (void *)objc_msgSend(v14, "copy");
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v12 + 16))(v12, v13, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersBySchemaIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
}

@end
