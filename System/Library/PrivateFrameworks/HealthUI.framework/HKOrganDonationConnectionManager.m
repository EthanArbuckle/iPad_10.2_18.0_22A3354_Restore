@implementation HKOrganDonationConnectionManager

- (HKOrganDonationConnectionManager)initWithHealthStore:(id)a3
{
  id v5;
  HKOrganDonationConnectionManager *v6;
  HKOrganDonationConnectionManager *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMapTable *taskQueue;
  id v13;
  uint64_t v14;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKOrganDonationConnectionManager;
  v6 = -[HKOrganDonationConnectionManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    -[HKOrganDonationConnectionManager _transitionToState:](v7, "_transitionToState:", 0);
    v8 = (void *)MEMORY[0x1E0CB39F0];
    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKOrganDonationConnectionManager setDefaultSession:](v7, "setDefaultSession:", v10);
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0x10000);
    v11 = objc_claimAutoreleasedReturnValue();
    taskQueue = v7->_taskQueue;
    v7->_taskQueue = (NSMapTable *)v11;

    -[HKOrganDonationConnectionManager _refreshAccessTokenIfNeeded](v7, "_refreshAccessTokenIfNeeded");
    v13 = objc_alloc(MEMORY[0x1E0CB62B8]);
    v14 = objc_msgSend(v13, "initWithLoggingCategory:healthDataSource:", *MEMORY[0x1E0CB5378], v5);
    analyticsEventSubmissionManager = v7->_analyticsEventSubmissionManager;
    v7->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v14;

  }
  return v7;
}

+ (id)_host
{
  unint64_t v2;

  v2 = objc_msgSend(a1, "_hostConfiguration");
  if (v2 > 3)
    return CFSTR("dlaapibeta.lifelogics.org");
  else
    return off_1E9C3FD50[v2];
}

+ (id)_gatewayHost
{
  unint64_t v2;

  v2 = objc_msgSend(a1, "_hostConfiguration");
  if (v2 > 3)
    return CFSTR("dlabeta.lifelogics.org");
  else
    return off_1E9C3FD70[v2];
}

+ (id)_scheme
{
  return CFSTR("https");
}

+ (id)_port
{
  return &unk_1E9CEAD90;
}

+ (int64_t)_hostConfiguration
{
  void *v2;
  int64_t v3;

  if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    return 2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("donateLifeHost"));

  return v3;
}

+ (BOOL)_organDonationDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("donateLifeDisabled"));

  return v3;
}

- (void)cleanUp
{
  void *v3;
  id WeakRetained;

  -[HKOrganDonationConnectionManager defaultSession](self, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAndCancel");

  WeakRetained = objc_loadWeakRetained((id *)&self->_accessTokenInvalidationTimer);
  objc_msgSend(WeakRetained, "invalidate");

  -[NSMapTable removeAllObjects](self->_taskQueue, "removeAllObjects");
}

- (void)_transitionToState:(int64_t)a3
{
  uint64_t v3;

  if (self->_managerState != a3)
  {
    self->_managerState = a3;
    switch(a3)
    {
      case 0:
        -[HKOrganDonationConnectionManager _refreshAccessTokenIfNeeded](self, "_refreshAccessTokenIfNeeded");
        break;
      case 2:
        -[HKOrganDonationConnectionManager _sendQueuedTokenDependentRequests](self, "_sendQueuedTokenDependentRequests");
        break;
      case 3:
        v3 = 3;
        goto LABEL_4;
      case 4:
      case 5:
        v3 = 4;
LABEL_4:
        -[HKOrganDonationConnectionManager _flushTokenDependentRequestsWithStatus:](self, "_flushTokenDependentRequestsWithStatus:", v3);
        break;
      default:
        return;
    }
  }
}

- (void)submitRegistrant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v6 = a4;
  v7 = a3;
  -[HKOrganDonationConnectionManager _urlWithPath:](self, "_urlWithPath:", CFSTR("/v1/oauth/token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOrganDonationConnectionManager _registrationJWTWithRegistrant:](self, "_registrationJWTWithRegistrant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    -[HKOrganDonationConnectionManager _jsonBodyPostRequestWithURL:method:postData:bearerToken:](self, "_jsonBodyPostRequestWithURL:method:postData:bearerToken:", v8, CFSTR("POST"), v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationConnectionManager _transitionToState:](self, "_transitionToState:", 1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke;
    v15[3] = &unk_1E9C3FC78;
    v15[4] = self;
    v16 = v6;
    -[HKOrganDonationConnectionManager _genericJSONDataTaskWithRequest:completionHandler:](self, "_genericJSONDataTaskWithRequest:completionHandler:", v13, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, 4);
  }

}

void __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "submitOrganDonationEventWithErrorType:", 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke_2;
    v10[3] = &unk_1E9C3FC50;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, a3, v7);

}

void __64__HKOrganDonationConnectionManager_submitRegistrant_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("access_token"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("expires_in"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 40), "setRefreshToken:", v2);
  objc_msgSend(*(id *)(a1 + 40), "_updateAccessTokenAndScheduleInvalidationTimer:expiresIn:", v6, v5);
  objc_msgSend(*(id *)(a1 + 40), "_transitionToState:", 2);

}

- (void)_refreshAccessTokenIfNeeded
{
  NSString *v3;
  NSString *refreshToken;
  NSString *v5;
  _QWORD v6[5];

  objc_msgSend((id)objc_opt_class(), "_tokenWithIdentifier:shouldReturnData:", CFSTR("refresh_token"), 1);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  refreshToken = self->_refreshToken;
  self->_refreshToken = v3;

  if (-[NSString length](self->_refreshToken, "length"))
  {
    if ((unint64_t)(self->_managerState - 1) >= 2)
    {
      -[HKOrganDonationConnectionManager _transitionToState:](self, "_transitionToState:", 1);
      v5 = self->_refreshToken;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __63__HKOrganDonationConnectionManager__refreshAccessTokenIfNeeded__block_invoke;
      v6[3] = &unk_1E9C3FCA0;
      v6[4] = self;
      -[HKOrganDonationConnectionManager refreshBearerTokenWithRefreshToken:completion:](self, "refreshBearerTokenWithRefreshToken:completion:", v5, v6);
    }
  }
}

void __63__HKOrganDonationConnectionManager__refreshAccessTokenIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v5 = a2;
  if (!a3)
  {
    v10 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("access_token"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("expires_in"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(*(id *)(a1 + 32), "_updateAccessTokenAndScheduleInvalidationTimer:expiresIn:", v6, v9);
      objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 2);
    }

    v5 = v10;
  }

}

- (void)refreshBearerTokenWithRefreshToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[HKOrganDonationConnectionManager _urlWithPath:](self, "_urlWithPath:", CFSTR("/v1/oauth/token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConnectionManager _refreshBearerTokenJWTWithRefreshToken:](self, "_refreshBearerTokenJWTWithRefreshToken:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;
    -[HKOrganDonationConnectionManager _jsonBodyPostRequestWithURL:method:postData:bearerToken:](self, "_jsonBodyPostRequestWithURL:method:postData:bearerToken:", v8, CFSTR("POST"), v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__HKOrganDonationConnectionManager_refreshBearerTokenWithRefreshToken_completion___block_invoke;
    v14[3] = &unk_1E9C3FC78;
    v14[4] = self;
    v15 = v6;
    -[HKOrganDonationConnectionManager _genericJSONDataTaskWithRequest:completionHandler:](self, "_genericJSONDataTaskWithRequest:completionHandler:", v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, 4);
  }

}

void __82__HKOrganDonationConnectionManager_refreshBearerTokenWithRefreshToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "submitOrganDonationEventWithErrorType:", 4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)reloadRegistrantWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HKOrganDonationConnectionManager _urlWithPath:](self, "_urlWithPath:", CFSTR("/v1/registrants/me"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConnectionManager _getRequestWithURL:bearerToken:](self, "_getRequestWithURL:bearerToken:", v5, self->_accessToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HKOrganDonationConnectionManager_reloadRegistrantWithCompletion___block_invoke;
  v8[3] = &unk_1E9C3FC78;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKOrganDonationConnectionManager _scheduleAccessTokenDependentRequest:withCompletion:](self, "_scheduleAccessTokenDependentRequest:withCompletion:", v6, v8);

}

void __67__HKOrganDonationConnectionManager_reloadRegistrantWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "submitOrganDonationEventWithErrorType:", 1);
    v5 = v8;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inactive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRefreshToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setAccessToken:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateRegistrantWithParams:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKOrganDonationConnectionManager _urlWithPath:](self, "_urlWithPath:", CFSTR("/v1/registrants/me"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB36D8];
  v19 = CFSTR("registrant");
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "dataWithJSONObject:options:error:", v10, 0, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v12)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKOrganDonationConnectionManager updateRegistrantWithParams:completion:].cold.1((uint64_t)v6, v13);
  }
  -[HKOrganDonationConnectionManager _jsonBodyPostRequestWithURL:method:postData:bearerToken:](self, "_jsonBodyPostRequestWithURL:method:postData:bearerToken:", v8, CFSTR("PATCH"), v11, self->_accessToken);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__HKOrganDonationConnectionManager_updateRegistrantWithParams_completion___block_invoke;
  v16[3] = &unk_1E9C3FC78;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  -[HKOrganDonationConnectionManager _scheduleAccessTokenDependentRequest:withCompletion:](self, "_scheduleAccessTokenDependentRequest:withCompletion:", v14, v16);

}

void __74__HKOrganDonationConnectionManager_updateRegistrantWithParams_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a2;
  if (a3)
  {
    objc_msgSend(v5, "submitOrganDonationEventWithErrorType:", 2);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_tokenWithIdentifier:shouldReturnData:", CFSTR("refresh_token"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRefreshToken:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)deleteRegistrantWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HKOrganDonationConnectionManager _urlWithPath:](self, "_urlWithPath:", CFSTR("/v1/registrants/me"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConnectionManager _jsonBodyPostRequestWithURL:method:postData:bearerToken:](self, "_jsonBodyPostRequestWithURL:method:postData:bearerToken:", v5, CFSTR("DELETE"), 0, self->_accessToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HKOrganDonationConnectionManager_deleteRegistrantWithCompletion___block_invoke;
  v8[3] = &unk_1E9C3FC78;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HKOrganDonationConnectionManager _scheduleAccessTokenDependentRequest:withCompletion:](self, "_scheduleAccessTokenDependentRequest:withCompletion:", v6, v8);

}

void __67__HKOrganDonationConnectionManager_deleteRegistrantWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (a3)
  {
    objc_msgSend(v5, "submitOrganDonationEventWithErrorType:", 3);
  }
  else
  {
    objc_msgSend(v5, "setRefreshToken:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setAccessToken:", 0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)openRegisterMeSiteInSafariIfAuthenticated
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[HKOrganDonationConnectionManager accessToken](self, "accessToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend((id)objc_opt_class(), "_scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheme:", v6);

    objc_msgSend((id)objc_opt_class(), "_gatewayHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHost:", v7);

    objc_msgSend(v5, "setPath:", CFSTR("/ios_gateway"));
    v8 = (void *)MEMORY[0x1E0CB39D8];
    -[HKOrganDonationConnectionManager accessToken](self, "accessToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryItemWithName:value:", CFSTR("at"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setQueryItems:", v11);

    objc_msgSend(v5, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "openURL:withOptions:", v12, 0);

    }
  }
}

- (void)_scheduleAccessTokenDependentRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  int64_t managerState;
  void *v8;
  NSMapTable *taskQueue;
  id v10;

  v10 = a3;
  v6 = a4;
  managerState = self->_managerState;
  if (managerState == 1)
    goto LABEL_5;
  if (managerState != 2)
  {
    -[HKOrganDonationConnectionManager _refreshAccessTokenIfNeeded](self, "_refreshAccessTokenIfNeeded");
LABEL_5:
    taskQueue = self->_taskQueue;
    v8 = _Block_copy(v6);
    -[NSMapTable setObject:forKey:](taskQueue, "setObject:forKey:", v8, v10);
    goto LABEL_6;
  }
  -[HKOrganDonationConnectionManager _genericJSONDataTaskWithRequest:completionHandler:](self, "_genericJSONDataTaskWithRequest:completionHandler:", v10, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");
LABEL_6:

}

- (id)_urlWithPath:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend((id)objc_opt_class(), "_scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v6);

  objc_msgSend((id)objc_opt_class(), "_host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHost:", v7);

  objc_msgSend(v5, "setPath:", v4);
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)submitOrganDonationEventWithErrorType:(int)a3
{
  HKOrganDonationFlowErrorAnalyticEvent *v4;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  uint64_t v6;

  v4 = -[HKOrganDonationFlowErrorAnalyticEvent initWithErrorType:]([HKOrganDonationFlowErrorAnalyticEvent alloc], "initWithErrorType:", *(_QWORD *)&a3);
  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  v6 = 0;
  -[HKAnalyticsEventSubmissionManager submitEvent:error:](analyticsEventSubmissionManager, "submitEvent:error:", v4, &v6);

}

+ (BOOL)hasStoredRegistrant
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_tokenWithIdentifier:shouldReturnData:", CFSTR("refresh_token"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)isOrganDonationRegistrationAvailable
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB6F18], "hasTelephonyCapability");
  if (v3)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99DC8], "hk_isUSLocale");
    if (v3)
    {
      if (objc_msgSend(a1, "_hostConfiguration") == 3)
        LOBYTE(v3) = 0;
      else
        LOBYTE(v3) = objc_msgSend(a1, "_organDonationDisabled") ^ 1;
    }
  }
  return v3;
}

+ (void)openDonateLifeMicroSiteInSafari
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://registerme.org/ios"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

}

+ (int64_t)registrationSubmissionHostConfiguration
{
  unint64_t v3;

  if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    return 2;
  v3 = objc_msgSend(a1, "_hostConfiguration");
  if (v3 > 3)
    return 1;
  else
    return qword_1D7B80F00[v3];
}

+ (void)refreshOrganDonationFeatureAvailability
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://health-assets.cdn-apple.com/hippocrates/manifest.json"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataTaskWithRequest:completionHandler:", v2, &__block_literal_global_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "resume");
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (a2)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a2, 0, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("disabled"));
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBool:forKey:", v11, CFSTR("donateLifeDisabled"));

    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(v14, v6);
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_1(v13);
  }

}

- (id)_jsonObjectWithData:(id)a3 response:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 4, &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;
    if (v8)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(v9, v6);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      v21 = v6;
      v22 = v5;
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v7, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKey:", v15, v20, v21, v22);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if ((v18 & 1) == 0)
              objc_msgSend(v23, "setObject:forKey:", v16, v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v12);
      }

      v6 = v21;
      v5 = v22;
      v8 = v20;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_genericJSONDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  HKOrganDonationConnectionManager *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HKOrganDonationConnectionManager defaultSession](self, "defaultSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke;
  v13[3] = &unk_1E9C3FD30;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int8x16_t v15;
  _QWORD v16[4];
  id v17;
  int8x16_t v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_cold_1(a1, v9);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_293;
    block[3] = &unk_1E9C3FBE0;
    block[4] = *(_QWORD *)(a1 + 40);
    v22 = v8;
    v23 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v10 = v7;
    objc_msgSend(*(id *)(a1 + 40), "_jsonObjectWithData:response:", a2, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_2;
    v16[3] = &unk_1E9C3FD08;
    v17 = v10;
    v15 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v15.i64[0];
    v18 = vextq_s8(v15, v15, 8uLL);
    v19 = v11;
    v20 = *(id *)(a1 + 48);
    v13 = v11;
    v14 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

uint64_t __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_293(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleURLTaskError:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "statusCode") - 200) >= 0x64)
    return objc_msgSend(*(id *)(a1 + 40), "_handleServerErrorWithResponse:originRequest:payload:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (id)_jsonBodyPostRequestWithURL:(id)a3 method:(id)a4 postData:(id)a5 bearerToken:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0CB37A8];
  v12 = a4;
  objc_msgSend(v11, "requestWithURL:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPMethod:", v12);

  objc_msgSend(v13, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v14, CFSTR("Authorization"));

  }
  if (v9)
    objc_msgSend(v13, "setHTTPBody:", v9);

  return v13;
}

- (id)_getRequestWithURL:(id)a3 bearerToken:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB37A8];
  v6 = a4;
  objc_msgSend(v5, "requestWithURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v8, CFSTR("Authorization"));
  return v7;
}

- (void)_sendQueuedTokenDependentRequests
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable keyEnumerator](self->_taskQueue, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), self->_accessToken);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("Authorization"));

        -[NSMapTable objectForKey:](self->_taskQueue, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOrganDonationConnectionManager _genericJSONDataTaskWithRequest:completionHandler:](self, "_genericJSONDataTaskWithRequest:completionHandler:", v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resume");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_taskQueue, "removeAllObjects");
}

- (void)_flushTokenDependentRequestsWithStatus:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id obj;
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
  -[NSMapTable keyEnumerator](self->_taskQueue, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bearer %@"), self->_accessToken);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("Authorization"));

        -[NSMapTable objectForKey:](self->_taskQueue, "objectForKey:", v9);
        v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, a3);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[NSMapTable removeAllObjects](self->_taskQueue, "removeAllObjects");
}

- (void)_updateAccessTokenAndScheduleInvalidationTimer:(id)a3 expiresIn:(double)a4
{
  id v7;
  id obj;

  self->_accessTokenStatus = 0;
  objc_storeStrong((id *)&self->_accessToken, a3);
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__invalidateAccessToken_, 0, 0, a4);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_accessTokenInvalidationTimer, obj);
}

- (void)_invalidateAccessToken:(id)a3
{
  NSString *accessToken;

  accessToken = self->_accessToken;
  self->_accessToken = 0;

  -[HKOrganDonationConnectionManager _refreshAccessTokenIfNeeded](self, "_refreshAccessTokenIfNeeded");
}

- (void)_handleURLTaskError:(id)a3 withCompletion:(id)a4
{
  uint64_t v6;
  void (**v7)(id, _QWORD, uint64_t);

  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  if (objc_msgSend(a3, "code") == -1009)
    v6 = 3;
  else
    v6 = 4;
  if (v7)
    v7[2](v7, 0, v6);
  -[HKOrganDonationConnectionManager _transitionToState:](self, "_transitionToState:", v6);

}

- (void)_handleServerErrorWithResponse:(id)a3 originRequest:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, uint64_t);
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, uint64_t))a6;
  if ((unint64_t)(objc_msgSend(v10, "statusCode") - 400) > 0x63)
  {
    v18 = 4;
    v17 = 4;
    if (!v13)
      goto LABEL_11;
LABEL_10:
    v13[2](v13, v12, v18);
    goto LABEL_11;
  }
  -[HKOrganDonationConnectionManager setAccessToken:](self, "setAccessToken:", 0);
  objc_msgSend(v11, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasSuffix:", CFSTR("/v1/oauth/token"));

  if (v16)
  {
    -[HKOrganDonationConnectionManager setRefreshToken:](self, "setRefreshToken:", 0);
    v17 = 0;
  }
  else
  {
    v17 = 5;
  }
  if (objc_msgSend(v10, "statusCode") == 404 || objc_msgSend(v10, "statusCode") == 410)
  {
    -[HKOrganDonationConnectionManager setRefreshToken:](self, "setRefreshToken:", 0);
    v18 = 2;
    if (!v13)
      goto LABEL_11;
    goto LABEL_10;
  }
  v18 = 1;
  if (v13)
    goto LABEL_10;
LABEL_11:
  -[HKOrganDonationConnectionManager _transitionToState:](self, "_transitionToState:", v17);
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
    -[HKOrganDonationConnectionManager _handleServerErrorWithResponse:originRequest:payload:completion:].cold.1(v19, v10);

}

- (void)setRefreshToken:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_refreshToken, a3);
  v5 = (void *)_TokenRefreshDate;
  _TokenRefreshDate = 0;

  if (objc_msgSend(v6, "length"))
    -[HKOrganDonationConnectionManager _upsertTokenInKeychain:identifier:](self, "_upsertTokenInKeychain:identifier:", v6, CFSTR("refresh_token"));
  else
    -[HKOrganDonationConnectionManager _deleteTokenWithIdentifier:](self, "_deleteTokenWithIdentifier:", CFSTR("refresh_token"));

}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)_upsertTokenInKeychain:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  OSStatus v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_keychainQueryDictionaryForIdentifier:", v6);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_tokenWithIdentifier:shouldReturnData:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKey:", v9, *MEMORY[0x1E0CD70D8]);
    v12 = SecItemUpdate(v8, (CFDictionaryRef)v11);

    if (v12)
      goto LABEL_3;
LABEL_6:
    -[HKOrganDonationConnectionManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "organDonationConnectionManagerDidStoreCredential:", self);

    notify_post("HKOrganDonationRegistrationDidUpdate");
    goto LABEL_7;
  }
  -[__CFDictionary setObject:forKey:](v8, "setObject:forKey:", v9, *MEMORY[0x1E0CD70D8]);
  if (!SecItemAdd(v8, 0))
    goto LABEL_6;
LABEL_3:
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
    -[HKOrganDonationConnectionManager _upsertTokenInKeychain:identifier:].cold.1();
LABEL_7:

}

- (void)_deleteTokenWithIdentifier:(id)a3
{
  id v4;
  const __CFDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_keychainQueryDictionaryForIdentifier:", v4);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_tokenWithIdentifier:shouldReturnData:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (SecItemDelete(v5))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[HKOrganDonationConnectionManager _deleteTokenWithIdentifier:].cold.1();
    }
    else
    {
      -[HKOrganDonationConnectionManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "organDonationConnectionManagerDidRemoveCredential:", self);

      notify_post("HKOrganDonationRegistrationDidUpdate");
    }
  }

}

+ (id)_tokenWithIdentifier:(id)a3 shouldReturnData:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  OSStatus v9;
  void *v10;
  void *v11;
  CFTypeRef result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_keychainQueryDictionaryForIdentifier:", v6);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    -[__CFDictionary setObject:forKey:](v7, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  result = 0;
  v9 = SecItemCopyMatching(v8, &result);
  if (v9 == -25300)
    goto LABEL_8;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      +[HKOrganDonationConnectionManager _tokenWithIdentifier:shouldReturnData:].cold.1();
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = (void *)result;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", result, 4);

LABEL_9:
  return v11;
}

+ (id)_keychainQueryDictionaryForIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD6CB8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v6, "setObject:forKey:", CFSTR("com.apple.HealthUI.OrganDonation"), *MEMORY[0x1E0CD68F8]);
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0CD6AC0]);
  objc_msgSend(a1, "_host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0CD6B50]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD6B00], *MEMORY[0x1E0CD6AD0]);
  objc_msgSend(a1, "_port");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x1E0CD6AC8]);

  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD6918], *MEMORY[0x1E0CD6910]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0CD68E8], *MEMORY[0x1E0CD68A0]);
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD6B80]);
  objc_msgSend(v6, "setObject:forKey:", CFSTR("com.apple.Health"), *MEMORY[0x1E0CD6898]);

  return v6;
}

+ (void)organDonationSignificantDate:(id)a3
{
  void (**v4)(id, _QWORD, BOOL);
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  CFTypeRef result;

  v4 = (void (**)(id, _QWORD, BOOL))a3;
  v5 = (void *)_TokenCreationDate;
  if (_TokenRefreshDate)
    v6 = _TokenCreationDate == 0;
  else
    v6 = 1;
  if (v6)
  {
    objc_msgSend(a1, "_keychainQueryDictionaryForIdentifier:", CFSTR("refresh_token"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7010]);
    result = 0;
    v8 = SecItemCopyMatching((CFDictionaryRef)v7, &result);
    if ((_DWORD)v8)
    {
      v9 = v8;
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        +[HKOrganDonationConnectionManager organDonationSignificantDate:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      v17 = (void *)result;
      objc_msgSend((id)result, "objectForKey:", *MEMORY[0x1E0CD6A98]);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)_TokenRefreshDate;
      _TokenRefreshDate = v18;

      objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0CD6990]);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)_TokenCreationDate;
      _TokenCreationDate = v20;

    }
    v5 = (void *)_TokenCreationDate;
  }
  v22 = objc_msgSend(v5, "compare:");
  v23 = &_TokenCreationDate;
  if (v22 == -1)
    v23 = &_TokenRefreshDate;
  v4[2](v4, *v23, v22 != -1);

}

+ (id)storeDemoModeModifiedDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 30, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHour:", 9);
  objc_msgSend(v4, "setMinute:", 41);
  objc_msgSend(v2, "dateFromComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", -1);
  objc_msgSend(v2, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)shouldShowStoreDemoOrganDonation
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "isOrganDonationRegistrationAvailable");
  return v3;
}

- (id)_registrationJWTWithRegistrant:(id)a3
{
  void *v4;
  void *v5;

  -[HKOrganDonationConnectionManager jwtPayloadWithRegistrant:](self, "jwtPayloadWithRegistrant:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConnectionManager _jwtWithPayload:grantType:](self, "_jwtWithPayload:grantType:", v4, CFSTR("urn:dla:oauth:grant-type:jwt-bearer-registrant-info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_refreshBearerTokenJWTWithRefreshToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HKOrganDonationConnectionManager payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationConnectionManager _jwtWithPayload:grantType:](self, "_jwtWithPayload:grantType:", v5, CFSTR("urn:dla:oauth:grant-type:jwt-bearer-refresh"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("refresh_token"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_jwtWithPayload:(id)a3 grantType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __SecKey *PrivateSecKeyRefFromP12;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _DecodedString((uint64_t)&_ConsumerSecret);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PrivateSecKeyRefFromP12 = _createPrivateSecKeyRefFromP12(v8);

  if (PrivateSecKeyRefFromP12)
  {
    v10 = (void *)MEMORY[0x1E0CB36D8];
    -[HKOrganDonationConnectionManager jwtHeader](self, "jwtHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v10, "dataWithJSONObject:options:error:", v11, 0, &v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v34;

    objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationConnectionManager _base64URLEncoding:](self, "_base64URLEncoding:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v12;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, &v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v33;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\/"), CFSTR("/"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "dataUsingEncoding:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationConnectionManager _base64URLEncoding:](self, "_base64URLEncoding:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v27, v17);
    v32 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _SignStringWithSHA256RSA(v19, PrivateSecKeyRefFromP12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationConnectionManager _base64URLEncoding:](self, "_base64URLEncoding:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v18, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(PrivateSecKeyRefFromP12);
    v35[0] = CFSTR("grant_type");
    v35[1] = CFSTR("assertion");
    v36[0] = v21;
    v36[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v32;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_base64URLEncoding:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_1E9C4C428, 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

- (id)jwtHeader
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("alg");
  v3[1] = CFSTR("typ");
  v4[0] = CFSTR("RS256");
  v4[1] = CFSTR("JWT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)payload
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = (uint64_t)v3;

  v9[0] = CFSTR("iss");
  _DecodedString((uint64_t)&_ConsumerId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = CFSTR("https://donatelifeamerica.com/api/");
  v9[1] = CFSTR("aud");
  v9[2] = CFSTR("iat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)jwtPayloadWithRegistrant:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = (uint64_t)v6;

  v12[0] = CFSTR("iss");
  _DecodedString((uint64_t)&_ConsumerId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = CFSTR("https://donatelifeamerica.com/api/");
  v12[1] = CFSTR("aud");
  v12[2] = CFSTR("iat");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = CFSTR("registrant");
  v13[2] = v9;
  v13[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKAnalyticsEventSubmissionManager)analyticsEventSubmissionManager
{
  return self->_analyticsEventSubmissionManager;
}

- (void)setAnalyticsEventSubmissionManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, a3);
}

- (HKOrganDonationConnectionManagerDelegate)delegate
{
  return (HKOrganDonationConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURLSession)defaultSession
{
  return self->_defaultSession;
}

- (void)setDefaultSession:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSession, a3);
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
  objc_storeStrong((id *)&self->_accessToken, a3);
}

- (NSTimer)accessTokenInvalidationTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_accessTokenInvalidationTimer);
}

- (void)setAccessTokenInvalidationTimer:(id)a3
{
  objc_storeWeak((id *)&self->_accessTokenInvalidationTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessTokenInvalidationTimer);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_defaultSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
}

- (void)updateRegistrantWithParams:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Error serializing json object for updating registrant: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_7_0();
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v3, v4, "Error downloading the od availability manifest from cdn: %{public}@, response: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_2();
}

void __75__HKOrganDonationConnectionManager_refreshOrganDonationFeatureAvailability__block_invoke_cold_2(void *a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "URL");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v5, v6, "Error deserializing json data for response at URL: %{public}@, error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_2();
}

void __86__HKOrganDonationConnectionManager__genericJSONDataTaskWithRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "URL");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1(&dword_1D7813000, v6, v7, "Error finishing data task with URL: %{public}@, error: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_0_2();
}

- (void)_handleServerErrorWithResponse:(void *)a1 originRequest:(void *)a2 payload:completion:.cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(), "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "statusCode");
  _os_log_error_impl(&dword_1D7813000, v2, OS_LOG_TYPE_ERROR, "Http error with URL: %{public}@, status code: %li", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

- (void)_upsertTokenInKeychain:identifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7813000, v0, v1, "Error storing token from keychain with identifier: %@ (%i)");
  OUTLINED_FUNCTION_7_0();
}

- (void)_deleteTokenWithIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7813000, v0, v1, "Error deleting token from keychain with identifier: %@ (%i)");
  OUTLINED_FUNCTION_7_0();
}

+ (void)_tokenWithIdentifier:shouldReturnData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1D7813000, v0, v1, "Error loading token from keychain with identifier: %@ (%i)");
  OUTLINED_FUNCTION_7_0();
}

+ (void)organDonationSignificantDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1D7813000, a2, a3, "Error loading token creation date with error (%i)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

@end
