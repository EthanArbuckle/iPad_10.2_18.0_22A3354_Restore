@implementation _AKAnisetteProviderProxy

- (_AKAnisetteProviderProxy)initWithProvider:(id)a3
{
  id v5;
  _AKAnisetteProviderProxy *v6;
  _AKAnisetteProviderProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AKAnisetteProviderProxy;
  v6 = -[_AKAnisetteProviderProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_anisetteDataProvider, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
}

- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  void *v8;

  v5 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy provisionAnisetteForContext:withCompletion:].cold.1();

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    -[AKAnisetteServiceProtocol provisionAnisetteWithCompletion:](anisetteDataProvider, "provisionAnisetteWithCompletion:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v8);

  }
}

- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  void *v11;

  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy syncAnisetteForContext:withSIMData:completion:].cold.1();

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    -[AKAnisetteServiceProtocol syncAnisetteWithSIMData:completion:](anisetteDataProvider, "syncAnisetteWithSIMData:completion:", v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

  }
}

- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  void *v8;

  v5 = (void (**)(id, _QWORD, void *))a4;
  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy eraseAnisetteForContext:withCompletion:].cold.1();

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    -[AKAnisetteServiceProtocol eraseAnisetteWithCompletion:](anisetteDataProvider, "eraseAnisetteWithCompletion:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v8);

  }
}

- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  void *v10;

  v5 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:].cold.1();

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    -[AKAnisetteServiceProtocol fetchAnisetteDataAndProvisionIfNecessary:withCompletion:](anisetteDataProvider, "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:", v5, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);

  }
}

- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  void *v11;

  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy legacyAnisetteDataForContext:DSID:withCompletion:].cold.1();

  anisetteDataProvider = self->_anisetteDataProvider;
  if (anisetteDataProvider)
  {
    -[AKAnisetteServiceProtocol legacyAnisetteDataForDSID:withCompletion:](anisetteDataProvider, "legacyAnisetteDataForDSID:withCompletion:", v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

  }
}

- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, uint64_t);
  NSObject *v9;
  AKAnisetteServiceProtocol *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  _AKAnisetteProviderProxy *v17;
  __int16 v18;
  AKAnisetteServiceProtocol *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  _AKLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_AKAnisetteProviderProxy fetchPeerAttestationDataForContext:withRequest:completion:].cold.1();

  v10 = self->_anisetteDataProvider;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7060);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v15 = (void *)v14;
    v8[2](v8, 0, v14);

    goto LABEL_13;
  }
  v11 = objc_opt_respondsToSelector();
  _AKLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_19202F000, v13, OS_LOG_TYPE_ERROR, "%@: Unable to call anisette data provider (%@) to fetch peer attestation data for request (%@) because it does not implement 'fetchPeerAttestationDataForRequest:completion:'", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AKAnisetteError"), -8009, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19202F000, v13, OS_LOG_TYPE_DEFAULT, "%@: Calling anisette data provider (%@) to fetch peer attestation data for request (%@)", (uint8_t *)&v16, 0x20u);
  }

  -[AKAnisetteServiceProtocol fetchPeerAttestationDataForRequest:completion:](v10, "fetchPeerAttestationDataForRequest:completion:", v7, v8);
LABEL_13:

}

- (AKAnisetteServiceProtocol)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (void)setAnisetteDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, a3);
}

- (void)provisionAnisetteForContext:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncAnisetteForContext:withSIMData:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)eraseAnisetteForContext:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)legacyAnisetteDataForContext:DSID:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchPeerAttestationDataForContext:withRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_19202F000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
