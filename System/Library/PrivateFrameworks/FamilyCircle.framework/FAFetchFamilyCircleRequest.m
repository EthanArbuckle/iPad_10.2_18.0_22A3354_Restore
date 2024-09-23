@implementation FAFetchFamilyCircleRequest

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_expectedAltDSIDs, 0);
  objc_storeStrong((id *)&self->_expectedDSIDs, 0);
}

- (FAFetchFamilyCircleRequest)init
{
  FAFetchFamilyCircleRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FAFetchFamilyCircleRequest;
  result = -[FAFamilyCircleRequest init](&v3, sel_init);
  if (result)
    result->_cachePolicy = 1;
  return result;
}

- (void)startRequestWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  FAFetchFamilyCircleRequest *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E8561870;
  v6 = v4;
  v17 = v6;
  -[FAFamilyCircleRequest serviceRemoteObjectWithErrorHandler:](self, "serviceRemoteObjectWithErrorHandler:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1CAEBA000, v8, OS_LOG_TYPE_DEFAULT, "Starting family request: %@", buf, 0xCu);
  }

  v9 = -[FAFetchFamilyCircleRequest _cachePolicy](self, "_cachePolicy");
  v10 = -[FAFetchFamilyCircleRequest signedInAccountShouldBeApprover](self, "signedInAccountShouldBeApprover");
  -[FAFetchFamilyCircleRequest context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchFamilyCircleRequest requestOptions](self, "requestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke_16;
  v14[3] = &unk_1E8562738;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v7, "fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:", v9, v10, v11, v12, v14);

}

- (BOOL)signedInAccountShouldBeApprover
{
  return self->_signedInAccountShouldBeApprover;
}

- (id)requestOptions
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)FAFetchFamilyCircleRequest;
  -[FAFamilyCircleRequest requestOptions](&v11, sel_requestOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FAFetchFamilyCircleRequest promptUserToResolveAuthenticatonFailure](self, "promptUserToResolveAuthenticatonFailure"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("promptUserToResolveAuthenticatonFailure"));

  if (-[FAFetchFamilyCircleRequest qualityOfService](self, "qualityOfService"))
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      FALogStringForQualityOfService(-[FAFetchFamilyCircleRequest qualityOfService](self, "qualityOfService"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "Client set desired QOS - %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[FAFetchFamilyCircleRequest qualityOfService](self, "qualityOfService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("FAQualityOfServiceOptionKey"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (BOOL)promptUserToResolveAuthenticatonFailure
{
  return self->_promptUserToResolveAuthenticatonFailure;
}

- (NSString)context
{
  return self->_context;
}

- (unint64_t)_cachePolicy
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t result;

  if (-[FAFetchFamilyCircleRequest doNotFetchFromServer](self, "doNotFetchFromServer"))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[FAFetchFamilyCircleRequest _cachePolicy].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);

    self->_cachePolicy = 0;
  }
  if (!-[FAFetchFamilyCircleRequest forceServerFetch](self, "forceServerFetch"))
    return self->_cachePolicy;
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[FAFetchFamilyCircleRequest _cachePolicy].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  result = 2;
  self->_cachePolicy = 2;
  return result;
}

- (BOOL)forceServerFetch
{
  return self->_forceServerFetch;
}

- (BOOL)doNotFetchFromServer
{
  return self->_doNotFetchFromServer;
}

void __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CAEBA000, v4, OS_LOG_TYPE_DEFAULT, "FAFetchFamilyCircleRequest: Error from service - %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__FAFetchFamilyCircleRequest_startRequestWithCompletionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CAEBA000, v11, OS_LOG_TYPE_DEFAULT, "Family request came back with response: %@ - %@ - %@", (uint8_t *)&v14, 0x20u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  v12 = *(_QWORD *)(a1 + 40);
  if (v9 | v10)
  {
    (*(void (**)(uint64_t, unint64_t, unint64_t))(v12 + 16))(v12, v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fa_familyErrorWithCode:", -1015);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
}

- (id)fetchFamilyCircleWithError:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  unint64_t Nanoseconds;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  id v23;
  int v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  os_signpost_id_t v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8;
  v38 = __Block_byref_object_dispose__8;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  v33 = 0;
  _FASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = _FASignpostCreate(v5);
  v8 = v7;

  _FASignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchFamilyCircleRequestSync", ", buf, 2u);
  }

  _FASignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FAFetchFamilyCircleRequest fetchFamilyCircleWithError:].cold.1(v6, v11);

  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke;
  v27[3] = &unk_1E85624E0;
  v27[4] = &v34;
  -[FAFamilyCircleRequest synchronousRemoteObjectWithErrorHandler:](self, "synchronousRemoteObjectWithErrorHandler:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FAFetchFamilyCircleRequest _cachePolicy](self, "_cachePolicy");
  v15 = -[FAFetchFamilyCircleRequest signedInAccountShouldBeApprover](self, "signedInAccountShouldBeApprover");
  -[FAFetchFamilyCircleRequest context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAFetchFamilyCircleRequest requestOptions](self, "requestOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke_2;
  v26[3] = &unk_1E8562760;
  v26[4] = &v34;
  v26[5] = &v28;
  objc_msgSend(v13, "fetchFamilyCircleWithCachePolicy:signedInAccountShouldBeApprover:context:options:replyBlock:", v14, v15, v16, v17, v26);

  if (a3)
    *a3 = objc_retainAutorelease((id)v35[5]);
  Nanoseconds = _FASignpostGetNanoseconds(v6, v8);
  _FASignpostLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v21 = objc_msgSend((id)v35[5], "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v41) = v21;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v20, OS_SIGNPOST_INTERVAL_END, v6, "FetchFamilyCircleRequestSync", " ErrorCode=%{public,signpost.telemetry:number1,name=ErrorCode}d ", buf, 8u);
  }

  _FASignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v25 = objc_msgSend((id)v35[5], "code");
    *(_DWORD *)buf = 134218496;
    v41 = v6;
    v42 = 2048;
    v43 = (double)Nanoseconds / 1000000000.0;
    v44 = 1026;
    v45 = v25;
    _os_log_debug_impl(&dword_1CAEBA000, v22, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:FetchFamilyCircleRequestSync  ErrorCode=%{public,signpost.telemetry:number1,name=ErrorCode}d ", buf, 0x1Cu);
  }

  v23 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __57__FAFetchFamilyCircleRequest_fetchFamilyCircleWithError___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CAEBA000, v10, OS_LOG_TYPE_DEFAULT, "Synchronous family request came back with response: %@ - %@ - %@", (uint8_t *)&v16, 0x20u);
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v13 = v9;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v8;

}

- (id)fetchCachedFamilyCircle:(id *)a3
{
  FADeviceInfo *v5;
  void *v6;
  FAFamilyCircleCache *v7;
  void *v8;
  FAFamilyCircleCache *v9;
  void *v10;

  v5 = objc_alloc_init(FADeviceInfo);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [FAFamilyCircleCache alloc];
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FAFamilyCircleCache initWithAccount:](v7, "initWithAccount:", v8);

  -[FAFetchFamilyCircleRequest fetchCachedFamilyCircleWithCache:deviceInfo:error:](self, "fetchCachedFamilyCircleWithCache:deviceInfo:error:", v9, v5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchCachedFamilyCircleWithCache:(id)a3 deviceInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  char v11;
  void *v12;
  id v13;
  FAFetchFamilyCircleRequest *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  FAFetchFamilyCircleRequest *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1CAEBA000, v10, OS_LOG_TYPE_DEFAULT, "Starting in process family request: %@", buf, 0xCu);
  }

  v11 = objc_msgSend(v9, "unlockedSinceBoot");
  if ((v11 & 1) != 0)
  {
    v17 = 0;
    objc_msgSend(v8, "loadWithError:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    objc_msgSend(v12, "familyCircleIfFresh");
    v14 = (FAFetchFamilyCircleRequest *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fa_familyErrorWithCode:", -1010);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  _FALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1CAEBA000, v15, OS_LOG_TYPE_DEFAULT, "Family request came back with response: %@ - %@", buf, 0x16u);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v14;
}

- (NSArray)expectedDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExpectedDSIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)expectedAltDSIDs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExpectedAltDSIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setSignedInAccountShouldBeApprover:(BOOL)a3
{
  self->_signedInAccountShouldBeApprover = a3;
}

- (void)setForceServerFetch:(BOOL)a3
{
  self->_forceServerFetch = a3;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setDoNotFetchFromServer:(BOOL)a3
{
  self->_doNotFetchFromServer = a3;
}

- (void)setPromptUserToResolveAuthenticatonFailure:(BOOL)a3
{
  self->_promptUserToResolveAuthenticatonFailure = a3;
}

- (NSDictionary)serverResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)fetchFamilyCircleWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%lld]: FetchFamilyCircleRequestSync ", (uint8_t *)&v2, 0xCu);
}

- (void)_cachePolicy
{
  OUTLINED_FUNCTION_0_2(&dword_1CAEBA000, a1, a3, "Deprecated - doNotFetchFromServer set, please use FACachePolicy", a5, a6, a7, a8, 0);
}

- (void)fetchCachedFamilyCircle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CAEBA000, a2, OS_LOG_TYPE_ERROR, "fetchCachedFamilyCircle exception %@", (uint8_t *)&v2, 0xCu);
}

@end
