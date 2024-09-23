@implementation AKAppleIDSession

- (AKAppleIDSession)init
{
  return -[AKAppleIDSession initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (id)appleIDHeadersForRequest:(id)a3
{
  return -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:](self, "_generateAppleIDHeadersForRequest:error:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_anisetteControllerLock, 0);
  objc_storeStrong((id *)&self->_proxiedAnisetteData, 0);
  objc_storeStrong((id *)&self->_pairedDeviceAnisetteController, 0);
  objc_storeStrong((id *)&self->_nativeAnisetteController, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

- (id)_generateAppleIDHeadersForRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;

  v5 = a3;
  -[AKAppleIDSession _genericAppleIDHeadersDictionaryForRequest:](self, "_genericAppleIDHeadersDictionaryForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "attestationDataForRequest:error:", v5, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;

  _AKTrafficLogSubsystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:].cold.4();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:].cold.3();
  }

  if (v9)
  {
    -[AKAppleIDSession _reportOnRequest:response:attestationData:](self, "_reportOnRequest:response:attestationData:", v5, 0, v9);
    objc_msgSend(v9, "attestationHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v13);

  }
  if (self->_proxiedAnisetteData)
  {
    _AKTrafficLogSubsystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0C92C28], "ak_proxiedHeadersForDevice:anisetteData:", self->_pairedDevice, self->_proxiedAnisetteData);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v6, "addEntriesFromDictionary:", v15);
LABEL_21:

    goto LABEL_22;
  }
  -[AKAppleIDSession _pairedDeviceAnisetteController](self, "_pairedDeviceAnisetteController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    _AKTrafficLogSubsystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:].cold.1();

    -[AKAppleIDSession _pairedDeviceAnisetteController](self, "_pairedDeviceAnisetteController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v18, "anisetteDataForURLRequest:error:", v5, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C92C28], "ak_proxiedHeadersForDevice:anisetteData:", self->_pairedDevice, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v6, "addEntriesFromDictionary:", v20);

    }
    goto LABEL_21;
  }
LABEL_22:
  v21 = (void *)objc_msgSend(v6, "copy");

  return v21;
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AKTrafficLogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = a1[5];
      *(_DWORD *)buf = 138412802;
      v29 = v7;
      v30 = 2114;
      v31 = v10;
      v32 = 2112;
      v33 = v6;
      _os_log_error_impl(&dword_19202F000, v9, OS_LOG_TYPE_ERROR, "Unable to append header for request %@! Task %{public}@ Error: %@.", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_2();
  }

  objc_msgSend(a1[6], "_genericAppleIDHeadersDictionaryForRequest:", a1[4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attestationHeaders");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1[6], "_reportOnRequest:response:attestationData:", a1[4], 0, v5);
    objc_msgSend(v5, "attestationHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v13);

  }
  v14 = a1[6];
  if (v14[4])
  {
    _AKTrafficLogSubsystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x1E0C92C28], "ak_proxiedHeadersForDevice:anisetteData:", *((_QWORD *)a1[6] + 6), *((_QWORD *)a1[6] + 4));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v11, "addEntriesFromDictionary:", v16);
    (*((void (**)(void))a1[7] + 2))();

  }
  else
  {
    objc_msgSend(v14, "_pairedDeviceAnisetteController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      dispatch_get_global_queue(25, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_49;
      v21[3] = &unk_1E2E60D58;
      v22 = v7;
      v19 = a1[5];
      v20 = a1[6];
      v23 = v19;
      v24 = v20;
      v25 = a1[4];
      v26 = v11;
      v27 = a1[7];
      dispatch_async(v18, v21);

    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }
  }

}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

uint64_t __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_generateAppleIDHeadersForSessionTask:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  AKAppleIDSession *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "originalRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke;
  v21[3] = &unk_1E2E60D08;
  v22 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x194022E4C](v21);
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2;
  v16[3] = &unk_1E2E60D80;
  v17 = v8;
  v18 = v6;
  v19 = self;
  v20 = v11;
  v13 = v11;
  v14 = v6;
  v15 = v8;
  objc_msgSend(v12, "attestationDataForRequest:completion:", v15, v16);

}

- (id)_nativeAnisetteController
{
  AKAnisetteProvisioningController *v3;
  AKAnisetteProvisioningController *nativeAnisetteController;

  -[NSLock lock](self->_anisetteControllerLock, "lock");
  if (!self->_nativeAnisetteController)
  {
    v3 = objc_alloc_init(AKAnisetteProvisioningController);
    nativeAnisetteController = self->_nativeAnisetteController;
    self->_nativeAnisetteController = v3;

  }
  -[NSLock unlock](self->_anisetteControllerLock, "unlock");
  return self->_nativeAnisetteController;
}

- (id)_pairedDeviceAnisetteController
{
  AKAnisetteProvisioningController *v3;
  AKAnisetteProvisioningController *pairedDeviceAnisetteController;

  -[NSLock lock](self->_anisetteControllerLock, "lock");
  if (!self->_pairedDeviceAnisetteController && self->_pairedDevice)
  {
    v3 = -[AKAnisetteProvisioningController initForDevice:provider:]([AKAnisetteProvisioningController alloc], "initForDevice:provider:", self->_pairedDevice, self->_anisetteDataProvider);
    pairedDeviceAnisetteController = self->_pairedDeviceAnisetteController;
    self->_pairedDeviceAnisetteController = v3;

  }
  -[NSLock unlock](self->_anisetteControllerLock, "unlock");
  return self->_pairedDeviceAnisetteController;
}

- (void)handleResponse:(id)a3 forRequest:(id)a4 shouldRetry:(BOOL *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  dispatch_semaphore_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v10 = objc_msgSend(v8, "statusCode");
  if ((unint64_t)(v10 - 433) > 0xA || ((1 << (v10 + 79)) & 0x703) == 0)
  {
    _AKTrafficLogSubsystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "statusCode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAppleIDSession handleResponse:forRequest:shouldRetry:].cold.1(v14, v15, (uint64_t)v23, v13);
    }
  }
  else
  {
    v12 = dispatch_semaphore_create(0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__AKAppleIDSession_handleResponse_forRequest_shouldRetry___block_invoke;
    v16[3] = &unk_1E2E60CE0;
    v18 = &v19;
    v13 = v12;
    v17 = v13;
    -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:](self, "_handleAnissetteURLResponse:forRequest:withCompletion:", v8, v9, v16);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a5)
    *a5 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);

}

- (id)copyWithZone:(_NSZone *)a3
{
  AKAppleIDSession *v4;
  uint64_t v5;
  AKAnisetteData *proxiedAnisetteData;

  v4 = -[AKAppleIDSession initWithIdentifier:]([AKAppleIDSession alloc], "initWithIdentifier:", self->_serviceID);
  objc_storeStrong((id *)&v4->_anisetteDataProvider, self->_anisetteDataProvider);
  objc_storeStrong((id *)&v4->_pairedDevice, self->_pairedDevice);
  v5 = -[AKAnisetteData copy](self->_proxiedAnisetteData, "copy");
  proxiedAnisetteData = v4->_proxiedAnisetteData;
  v4->_proxiedAnisetteData = (AKAnisetteData *)v5;

  return v4;
}

- (AKAppleIDSession)initWithIdentifier:(id)a3
{
  id v4;
  AKAppleIDSession *v5;
  uint64_t v6;
  NSString *serviceID;
  NSLock *v8;
  NSLock *anisetteControllerLock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAppleIDSession;
  v5 = -[AKAppleIDSession init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    anisetteControllerLock = v5->_anisetteControllerLock;
    v5->_anisetteControllerLock = v8;

    -[NSLock setName:](v5->_anisetteControllerLock, "setName:", CFSTR("AKAnisetteControllerLock"));
  }

  return v5;
}

- (void)_handleAnissetteURLResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldEnableAttestationLogging");

  if (v12 == 1)
  {
    _AKTrafficLogSubsystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.9();

  }
  v14 = objc_msgSend(v8, "statusCode") - 433;
  if (v14 <= 0xA && ((1 << v14) & 0x703) != 0)
  {
    v15 = v8;
    objc_msgSend(v15, "allHeaderFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("X-Apple-I-MD-Cmd-Target"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", CFSTR("paired"));

    if (v18)
      -[AKAppleIDSession _pairedDeviceAnisetteController](self, "_pairedDeviceAnisetteController");
    else
      -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      switch(v14)
      {
        case 0uLL:
          _AKTrafficLogSubsystem();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.6();

          objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", 433);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "ak_generalErrorWithCode:errorDomain:underlyingError:", -8022, CFSTR("AKAnisetteError"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CF0E68], "ak_analyticsEventWithEventName:error:", CFSTR("com.apple.authkit.midInvalidated"), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AKAnalyticsReporterRTC rtcAnalyticsReporter](AKAnalyticsReporterRTC, "rtcAnalyticsReporter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sendEvent:", v23);

          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62;
          v44[3] = &unk_1E2E60DA8;
          v46 = v9;
          v45 = v19;
          objc_msgSend(v45, "eraseWithCompletion:", v44);

          goto LABEL_38;
        case 1uLL:
          _AKTrafficLogSubsystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.5();

          objc_msgSend(v15, "allHeaderFields");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", CFSTR("X-Apple-I-MD-DATA"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "aaf_toBase64DecodedData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke;
            v47[3] = &unk_1E2E5E778;
            v48 = v9;
            objc_msgSend(v19, "syncWithSIMData:completion:", v22, v47);

          }
          else
          {
            _AKLogSystem();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.4();

            (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
          }
LABEL_38:

          goto LABEL_39;
        case 8uLL:
          -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = MEMORY[0x1E0C809B0];
          v36 = 3221225472;
          v37 = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_66;
          v38 = &unk_1E2E60DD0;
          v40 = v9;
          v39 = v10;
          objc_msgSend(v30, "resetDeviceIdentityWithCompletion:", &v35);

          break;
        case 9uLL:
          _AKLogSystem();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.8();

          goto LABEL_32;
        case 0xAuLL:
          objc_msgSend(v15, "allHeaderFields");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", CFSTR("x-apple-server-time"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64;
            v41[3] = &unk_1E2E60DD0;
            v43 = v9;
            v42 = v10;
            -[AKAppleIDSession _handleServerTimeAdjustmentWithTime:completion:](self, "_handleServerTimeAdjustmentWithTime:completion:", v21, v41);

          }
          else
          {
            _AKLogSystem();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.7();

            (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
          }
LABEL_39:

          break;
        default:
          _AKLogSystem();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.3();

LABEL_32:
          (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
          break;
      }
      -[AKAppleIDSession _reportOnRequest:response:attestationData:](self, "_reportOnRequest:response:attestationData:", 0, v15, 0, v35, v36, v37, v38);
    }
    else
    {
      _AKTrafficLogSubsystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.2();

      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

  }
  else
  {
    _AKTrafficLogSubsystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:].cold.1();

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

intptr_t __58__AKAppleIDSession_handleResponse_forRequest_shouldRetry___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_genericAppleIDHeadersDictionaryForRequest:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("X-Apple-I-Client-Time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "length"))
  {
    v12 = CFSTR("X-Apple-I-Client-Time");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "ak_clientTimeHeader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v8);
  objc_msgSend(MEMORY[0x1E0C92C28], "ak_localeHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v9);
  objc_msgSend(MEMORY[0x1E0C92C28], "ak_timeZoneHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v5, "addEntriesFromDictionary:", v10);

  return v5;
}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDRequestOrHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  id *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  id v26;
  _QWORD v27[4];
  id v28;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AKAppleIDSession shouldDenyRequestForURL:task:](self, "shouldDenyRequestForURL:task:", v13, v9))
  {
LABEL_13:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
    goto LABEL_14;
  }
  if (!v10)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke;
    v27[3] = &unk_1E2E60C68;
    v28 = v11;
    -[AKAppleIDSession _generateAppleIDHeadersForSessionTask:withCompletion:](self, "_generateAppleIDHeadersForSessionTask:withCompletion:", v9, v27);

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AKTrafficLogSubsystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:].cold.1();

    goto LABEL_13;
  }
  v14 = v10;
  if (objc_msgSend(v14, "statusCode") == 434 || objc_msgSend(v14, "statusCode") == 433)
  {
    objc_msgSend(v9, "originalRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_38;
    v23[3] = &unk_1E2E60C90;
    v16 = &v24;
    v24 = v13;
    v17 = (id *)v25;
    v25[0] = v9;
    v25[1] = self;
    v26 = v11;
    -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:](self, "_handleAnissetteURLResponse:forRequest:withCompletion:", v14, v15, v23);

  }
  else
  {
    if (objc_msgSend(v14, "statusCode") != 435)
      goto LABEL_8;
    objc_msgSend(v9, "originalRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2;
    v20[3] = &unk_1E2E60CB8;
    v16 = &v21;
    v21 = v13;
    v17 = &v22;
    v22 = v11;
    -[AKAppleIDSession _handleURLSwitchingResponse:forRequest:withCompletion:](self, "_handleURLSwitchingResponse:forRequest:withCompletion:", v14, v19, v20);

  }
LABEL_8:

LABEL_14:
}

- (BOOL)shouldDenyRequestForURL:(id)a3 task:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  v6 = a4;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalBuild");

  if (v8)
  {
    _AKTrafficLogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession shouldDenyRequestForURL:task:].cold.3();

    +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationValueForKey:", CFSTR("com.apple.authkit.anisette.deny.url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _AKTrafficLogSubsystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDSession shouldDenyRequestForURL:task:].cold.2();

    }
    objc_msgSend(v5, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "isEqualToString:", v13);

    if (v8)
    {
      _AKTrafficLogSubsystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[AKAppleIDSession shouldDenyRequestForURL:task:].cold.1();

    }
  }

  return v8;
}

- (id)relevantHTTPStatusCodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2E9A328, &unk_1E2E9A340, &unk_1E2E9A358, 0);
}

uint64_t __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 task:(id)a4 getAppleIDHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  AKAppleIDSession *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "originalRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AKAppleIDSession shouldDenyRequestForURL:task:](self, "shouldDenyRequestForURL:task:", v13, v9))
  {
LABEL_10:
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    goto LABEL_11;
  }
  if (!v10)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke;
    v22[3] = &unk_1E2E60C68;
    v23 = v11;
    -[AKAppleIDSession _generateAppleIDHeadersForSessionTask:withCompletion:](self, "_generateAppleIDHeadersForSessionTask:withCompletion:", v9, v22);
    v15 = v23;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AKTrafficLogSubsystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:].cold.1();

    goto LABEL_10;
  }
  objc_msgSend(v9, "originalRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_42;
  v17[3] = &unk_1E2E60C90;
  v18 = v13;
  v19 = v9;
  v20 = self;
  v21 = v11;
  -[AKAppleIDSession _handleAnissetteURLResponse:forRequest:withCompletion:](self, "_handleAnissetteURLResponse:forRequest:withCompletion:", v10, v14, v17);

  v15 = v18;
LABEL_6:

LABEL_11:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDSession)initWithCoder:(id)a3
{
  id v4;
  AKAppleIDSession *v5;
  uint64_t v6;
  NSString *serviceID;
  uint64_t v8;
  AKDevice *pairedDevice;
  uint64_t v10;
  AKAnisetteData *proxiedAnisetteData;
  NSLock *v12;
  NSLock *anisetteControllerLock;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAppleIDSession;
  v5 = -[AKAppleIDSession init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pairedDevice"));
    v8 = objc_claimAutoreleasedReturnValue();
    pairedDevice = v5->_pairedDevice;
    v5->_pairedDevice = (AKDevice *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAnisetteData"));
    v10 = objc_claimAutoreleasedReturnValue();
    proxiedAnisetteData = v5->_proxiedAnisetteData;
    v5->_proxiedAnisetteData = (AKAnisetteData *)v10;

    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    anisetteControllerLock = v5->_anisetteControllerLock;
    v5->_anisetteControllerLock = v12;

    -[NSLock setName:](v5->_anisetteControllerLock, "setName:", CFSTR("AKAnisetteControllerLock"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceID;
  id v5;

  serviceID = self->_serviceID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceID, CFSTR("_serviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairedDevice, CFSTR("_pairedDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedAnisetteData, CFSTR("_proxiedAnisetteData"));

}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_38(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    _AKTrafficLogSubsystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_38_cold_1();

    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_39;
    v6[3] = &unk_1E2E60C68;
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v4, "_generateAppleIDHeadersForSessionTask:withCompletion:", v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void (*v11)(void);
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_19202F000, v8, OS_LOG_TYPE_DEFAULT, "Redirecting urlRequest from URL: %@ to alternate URL: %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2_cold_1();

    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

void __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_42(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  if (a2)
  {
    _AKTrafficLogSubsystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_38_cold_1();

    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_43;
    v6[3] = &unk_1E2E60C68;
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v4, "_generateAppleIDHeadersForSessionTask:withCompletion:", v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __83__AKAppleIDSession_URLSession_task_getAppleIDHeadersForResponse_completionHandler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appleIDHeadersForRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  v6 = (void (**)(id, void *, id))a4;
  v9 = 0;
  -[AKAppleIDSession _generateAppleIDHeadersForRequest:error:](self, "_generateAppleIDHeadersForRequest:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v6)
    v6[2](v6, v7, v8);

}

- (void)appleIDHeadersWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void (**)(id, _QWORD, id))a3;
  -[AKAppleIDSession _genericAppleIDHeadersDictionaryForRequest:](self, "_genericAppleIDHeadersDictionaryForRequest:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "attestationDataForRequest:error:", 0, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  _AKTrafficLogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSession appleIDHeadersWithCompletion:].cold.2();

    if (v4)
      v4[2](v4, 0, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession appleIDHeadersWithCompletion:].cold.1();

    -[AKAppleIDSession _reportOnRequest:response:attestationData:](self, "_reportOnRequest:response:attestationData:", 0, 0, v7);
    objc_msgSend(v7, "attestationHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "attestationHeaders");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addEntriesFromDictionary:", v12);

    }
    if (v4)
    {
      v13 = (void *)objc_msgSend(v5, "copy");
      ((void (**)(id, void *, id))v4)[2](v4, v13, 0);

    }
  }

}

- (void)appleIDHeadersUsingAnisetteWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void (**)(id, _QWORD, id))a3;
  -[AKAppleIDSession _genericAppleIDHeadersDictionaryForRequest:](self, "_genericAppleIDHeadersDictionaryForRequest:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "anisetteDataWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  _AKTrafficLogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSession appleIDHeadersWithCompletion:].cold.2();

    if (v4)
      v4[2](v4, 0, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AKAppleIDSession appleIDHeadersWithCompletion:].cold.1();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C92C28], "ak_anisetteHeadersWithData:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v5, "addEntriesFromDictionary:", v11);

    }
    if (v4)
    {
      v12 = (void *)objc_msgSend(v5, "copy");
      ((void (**)(id, void *, id))v4)[2](v4, v12, 0);

    }
  }

}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  _AKTrafficLogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_49_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "_pairedDeviceAnisetteController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_50;
  v5[3] = &unk_1E2E60D30;
  v4 = *(_QWORD *)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  objc_msgSend(v3, "anisetteDataForURLRequest:completion:", v4, v5);

}

uint64_t __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_50(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "ak_proxiedHeadersForDevice:anisetteData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "addEntriesFromDictionary:", v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  _AKTrafficLogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  _AKTrafficLogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62_cold_1();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63;
    v9[3] = &unk_1E2E5E778;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "provisionWithCompletion:", v9);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  _AKTrafficLogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64_cold_2();
  }
  else
  {
    _AKTrafficLogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    _AKLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_66_cold_2();
  }
  else
  {
    _AKTrafficLogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_handleURLSwitchingResponse:(id)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  _BYTE v29[18];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v29 = v7;
    *(_WORD *)&v29[8] = 2112;
    *(_QWORD *)&v29[10] = v10;
    _os_log_impl(&dword_19202F000, v11, OS_LOG_TYPE_DEFAULT, "Handling response %@ for URL %@...", buf, 0x16u);
  }

  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v29 = 435;
    *(_WORD *)&v29[4] = 2112;
    *(_QWORD *)&v29[6] = v10;
    _os_log_impl(&dword_19202F000, v12, OS_LOG_TYPE_DEFAULT, "URL Switching state code (%d) received for URL: %@", buf, 0x12u);
  }

  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v13, "ak_valueForEncodedHeaderWithKey:", CFSTR("X-Apple-I-UrlSwitch-Info"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "count") > 1)
  {
    objc_msgSend(v15, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForHTTPHeaderField:", CFSTR("X-Apple-I-Data"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      +[AKURLBag bagForAltDSID:](AKURLBag, "bagForAltDSID:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke;
      v23[3] = &unk_1E2E60DF8;
      v24 = v20;
      v25 = v18;
      v27 = v8;
      v26 = v13;
      v21 = v20;
      objc_msgSend(v21, "forceUpdateBagWithUrlSwitchData:completion:", v19, v23);

    }
    else
    {
      _AKLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[AKAppleIDSession _handleURLSwitchingResponse:forRequest:withCompletion:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7087);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v21);
    }

  }
  else
  {
    _AKLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AKAppleIDSession _handleURLSwitchingResponse:forRequest:withCompletion:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7087);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v17);
  }

}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlAtKey:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 48), "setURL:", v6);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      _AKLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7088);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
  }
  else
  {
    _AKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_reportOnRequest:(id)a3 response:(id)a4 attestationData:(id)a5
{
  unint64_t v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v8 = (unint64_t)a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isInternalBuild") & 1) == 0)
    goto LABEL_10;
  +[AKDevice currentDevice](AKDevice, "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isVirtualMachine");

  if (v13)
  {
    v11 = (void *)objc_opt_new();
    if (v8 | v10)
    {
      objc_msgSend((id)v8, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEndPointVIP:", v15);

      objc_msgSend((id)v8, "HTTPMethod");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRequestMethod:", v16);

      objc_msgSend((id)v8, "HTTPBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBodySize:", objc_msgSend(v17, "length"));

      v18 = (void *)MEMORY[0x1E0CB36D8];
      objc_msgSend((id)v10, "attestationHeaders");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v18, "dataWithJSONObject:options:error:", v19, 0, &v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v29;

      if (!v21)
        objc_msgSend(v11, "setHeaderSize:", objc_msgSend(v20, "length"));

    }
    else
    {
      if (!v9)
        goto LABEL_10;
      objc_msgSend(v9, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "host");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEndPointVIP:", v23);

      v24 = objc_msgSend(v9, "statusCode");
      v25 = objc_msgSend(v9, "statusCode") - 200;
      objc_msgSend(v9, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "host");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEndPointVIP:", v27);

      objc_msgSend(v11, "setErrorCode:", v24);
      objc_msgSend(v11, "setErrorDomain:", CFSTR("AKAuthenticationServerError"));
      if (v25 < 0x64)
        goto LABEL_10;
    }
    -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postAttestationAnalytics:completion:", v11, &__block_literal_global_32);

LABEL_10:
  }

}

void __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _AKLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke_cold_1();

  }
}

- (void)_resetDeviceIdentityWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetDeviceIdentityWithCompletion:", v4);

}

- (void)_handleServerTimeAdjustmentWithTime:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKAppleIDSession _nativeAnisetteController](self, "_nativeAnisetteController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeAdjustmentWithServerTime:completion:", v7, v6);

}

- (AKDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevice, a3);
}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, a3);
}

- (void)shouldDenyRequestForURL:task:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, v3, "Denying Anisette to URL:%@ Task: %{public}@ ...", v4);

  OUTLINED_FUNCTION_10_0();
}

- (void)shouldDenyRequestForURL:task:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Anisette deny url is set: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldDenyRequestForURL:task:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, v3, "Checking for deny listing URL:%@ Task: %{public}@ ...", v4);

  OUTLINED_FUNCTION_10_0();
}

- (void)URLSession:task:getAppleIDRequestOrHeadersForResponse:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, (uint64_t)v0, "Not going to do anything with non-HTTP response from URL: %@ Task: %{public}@.", v1);
  OUTLINED_FUNCTION_1();
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_38_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, v1, "Trying to get new Anisette headers to retry request for URL:%@ Task: %{public}@ ...", v2);
  OUTLINED_FUNCTION_1();
}

void __92__AKAppleIDSession_URLSession_task_getAppleIDRequestOrHeadersForResponse_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Url Switch request failed with error: %@, ignoring URL Switch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)appleIDHeadersWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Creating header data from Anisette.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)appleIDHeadersWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unable to create headers! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleResponse:(uint64_t)a3 forRequest:(NSObject *)a4 shouldRetry:.cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_3(&dword_19202F000, a4, a3, "No handling for HTTP status code %@ in response for URL %@", (uint8_t *)a3);

}

- (void)_generateAppleIDHeadersForRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Fetching paired device Anisette data for headers to URL: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Using proxied Anisette data for headers to URL: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19202F000, v0, v1, "Passing along decorated request for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_generateAppleIDHeadersForRequest:error:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(&dword_19202F000, v0, OS_LOG_TYPE_ERROR, "Unable to append header for request %@! Error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, (uint64_t)v0, "Using proxied Anisette data for headers to URL: %@ Task %{public}@.", v1);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, (uint64_t)v0, "Passing along decorated request for URL: %@ Task %{public}@.", v1);
  OUTLINED_FUNCTION_1();
}

void __73__AKAppleIDSession__generateAppleIDHeadersForSessionTask_withCompletion___block_invoke_49_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, v1, "Fetching paired device Anisette data for headers to URL: %@. Task: %{public}@.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_16();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "statusCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v1;
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, v4, "No handling for HTTP status code %@ in response for URL %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_10_0();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  OUTLINED_FUNCTION_16();
  v3 = v2;
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "statusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  v8 = 2112;
  v9 = v1;
  v10 = 2112;
  v11 = v5;
  _os_log_error_impl(&dword_19202F000, v0, OS_LOG_TYPE_ERROR, "No instance of AKAnisetteProvisioningController to handle HTTP code %@ in response to %@ %@.", (uint8_t *)&v6, 0x20u);

}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unhandled status code (%ld). Not retrying.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "HTTP 434 without sync data received!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "Sync status code (%d) received for URL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "Reprovision status code (%d) received for URL: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "HTTP BAA error 443 without server time received!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "The host certificate for the device is invalid. It needs to be renewed to proceed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleAnissetteURLResponse:forRequest:withCompletion:.cold.9()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_3(&dword_19202F000, v0, (uint64_t)v0, "Handling response %@ for URL %@...", v1);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Anisette sync was successful!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Anisette sync failed! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Erased Anisette data successfully. Time to provision!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_62_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Unable to reprovision because Anisette data could not be erased! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Successfully provisioned new Anisette data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_63_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Provisioning new Anisette data failed! Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "Trying to get new attestation headers to retry request for URL:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_64_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Could not set server adjusted time. Error: %@, not retrying", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__AKAppleIDSession__handleAnissetteURLResponse_forRequest_withCompletion___block_invoke_66_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Could not reset the BAA certs for renewal. Error: %@, not retrying", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleURLSwitchingResponse:forRequest:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No Value found for URLSwitching header ignoring URL Switching request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_handleURLSwitchingResponse:forRequest:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No Value found for Response URLSwitch data header ignoring URL Switching request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19202F000, v0, v1, "No URL found for UrlKey after URLBag update, ignoring URL Switching request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKAppleIDSession__handleURLSwitchingResponse_forRequest_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "URLBag failed to update with error: %@, ignoring URL Switching request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__AKAppleIDSession__reportOnRequest_response_attestationData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_19202F000, v0, v1, "Error posting attestation analytics - %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
