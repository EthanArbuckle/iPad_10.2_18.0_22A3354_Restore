@implementation DEPClient

- (DEPClient)init
{
  DEPClient *v2;
  NSXPCConnection *v3;
  void *v4;
  uint64_t v5;
  DEPClient *v6;
  DEPClient *v7;
  NSXPCConnection *connection;
  NSXPCConnection *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  DEPClient *v15;
  _QWORD v16[4];
  DEPClient *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)DEPClient;
  v2 = -[DEPClient init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.managedconfiguration.teslad"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF00C08);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);

    v5 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __17__DEPClient_init__block_invoke;
    v16[3] = &unk_1E98BF190;
    v6 = v2;
    v17 = v6;
    -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", v16);
    v11 = v5;
    v12 = 3221225472;
    v13 = __17__DEPClient_init__block_invoke_2;
    v14 = &unk_1E98BF190;
    v7 = v6;
    v15 = v7;
    -[NSXPCConnection setInvalidationHandler:](v3, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](v3, "resume", v11, v12, v13, v14);
    connection = v7->_connection;
    v7->_connection = v3;
    v9 = v3;

  }
  return v2;
}

void __17__DEPClient_init__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_connectionError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completeServiceWithSuccess:response:error:", 0, 0, v2);

}

void __17__DEPClient_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_connectionError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completeServiceWithSuccess:response:error:", 0, 0, v2);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[DEPClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)DEPClient;
  -[DEPClient dealloc](&v4, sel_dealloc);
}

- (id)_connectionError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  DEPErrorArray(CFSTR("CLOUD_CONFIG_XPC_FAILURE"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DEPErrorWithDomain:code:descriptionArray:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33023, v9, CFSTR("DEPFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_completeServiceWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  uint8_t v13[16];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *DEPLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D4F35000, v10, OS_LOG_TYPE_DEFAULT, "Service completed", v13, 2u);
  }
  -[DEPClient callback](self, "callback");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[DEPClient setCallback:](self, "setCallback:", 0);
    ((void (**)(_QWORD, _BOOL8, id, id))v11)[2](v11, v6, v8, v9);
  }
  -[DEPClient connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[DEPClient setConnection:](self, "setConnection:", 0);
}

- (void)_callServiceByType:(int64_t)a3 onProxy:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v8 = a4;
  v9 = a5;
  v10 = *DEPLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1D4F35000, v10, OS_LOG_TYPE_DEFAULT, "Calling service on proxy", v19, 2u);
  }
  switch(a3)
  {
    case 0:
      -[DEPClient nonce](self, "nonce");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "provisionallyEnrollWithNonce:completionBlock:", v11, v9);

      -[DEPClient setNonce:](self, "setNonce:", 0);
      break;
    case 1:
      objc_msgSend(v8, "fetchConfigurationWithCompletionBlock:", v9);
      break;
    case 2:
      objc_msgSend(v8, "fetchConfigurationWithoutValidationWithCompletionBlock:", v9);
      break;
    case 3:
      objc_msgSend(v8, "unenrollWithCompletionBlock:", v9);
      break;
    case 4:
      -[DEPClient userCredentials](self, "userCredentials");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "retrieveDeviceUploadOrganizationsWithCredentials:completionBlock:", v12, v9);
      goto LABEL_10;
    case 5:
      -[DEPClient userCredentials](self, "userCredentials");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "retrieveDeviceUploadRequestTypesWithCredentials:completionBlock:", v12, v9);
LABEL_10:

      goto LABEL_13;
    case 6:
      -[DEPClient organization](self, "organization");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEPClient userCredentials](self, "userCredentials");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "retrieveDeviceUploadSoldToIdsForOrganization:credentials:completionBlock:", v13, v14, v9);

      -[DEPClient setOrganization:](self, "setOrganization:", 0);
      goto LABEL_13;
    case 7:
      -[DEPClient deviceUploadRequest](self, "deviceUploadRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEPClient userCredentials](self, "userCredentials");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submitDeviceUploadRequest:credentials:completionBlock:", v15, v16, v9);

      -[DEPClient setDeviceUploadRequest:](self, "setDeviceUploadRequest:", 0);
LABEL_13:
      -[DEPClient setUserCredentials:](self, "setUserCredentials:", 0);
      break;
    case 8:
      objc_msgSend(v8, "pingWithCompletionBlock:", v9);
      break;
    case 9:
      -[DEPClient pushToken](self, "pushToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[DEPClient pushTopic](self, "pushTopic");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "syncDEPPushToken:pushTopic:completionBlock:", v17, v18, v9);

      break;
    default:
      break;
  }

}

- (void)_retrieveProxyObjectAndRunServiceType:(int64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[5];

  v6 = a4;
  -[DEPClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[DEPClient setCallback:](self, "setCallback:", v6);
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke;
    v15[3] = &unk_1E98BF1B8;
    v15[4] = self;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_initWeak(&location, self);
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke_2;
      v12[3] = &unk_1E98BF1E0;
      objc_copyWeak(&v13, &location);
      v10 = (void *)MEMORY[0x1D826C784](v12);
      -[DEPClient _callServiceByType:onProxy:completionBlock:](self, "_callServiceByType:onProxy:completionBlock:", a3, v9, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    -[DEPClient _connectionError](self, "_connectionError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DEPClient _completeServiceWithSuccess:response:error:](self, "_completeServiceWithSuccess:response:error:", 0, 0, v11);

  }
}

uint64_t __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeServiceWithSuccess:response:error:", 0, 0, a2);
}

void __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_completeServiceWithSuccess:response:error:", a2, v8, v7);

}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  -[DEPClient setNonce:](self, "setNonce:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__DEPClient_provisionallyEnrollWithNonce_completionBlock___block_invoke;
  v8[3] = &unk_1E98BF208;
  v9 = v6;
  v7 = v6;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 0, v8);

}

void __58__DEPClient_provisionallyEnrollWithNonce_completionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v14 = a4;
  if ((a2 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33007, v16, v14, CFSTR("DEPFatalError"));
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v17;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4;

  -[DEPClient _cloudConfigRetrievalBlockWithClientCompletionBlock:](self, "_cloudConfigRetrievalBlockWithClientCompletionBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 1, v4);

}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4;

  -[DEPClient _cloudConfigRetrievalBlockWithClientCompletionBlock:](self, "_cloudConfigRetrievalBlockWithClientCompletionBlock:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 2, v4);

}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__DEPClient_unenrollWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E98BF208;
  v7 = v4;
  v5 = v4;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 3, v6);

}

void __41__DEPClient_unenrollWithCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v14 = a4;
  if ((a2 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_UNENROLLMENT_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33008, v16, v14, CFSTR("DEPFatalError"));
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v17;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  -[DEPClient setUserCredentials:](self, "setUserCredentials:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__DEPClient_retrieveDeviceUploadOrganizationsWithCredentials_completionBlock___block_invoke;
  v8[3] = &unk_1E98BF230;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 4, v8);

}

void __78__DEPClient_retrieveDeviceUploadOrganizationsWithCredentials_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;

  v19 = a4;
  if (a2)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("organizations"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_organizationsFromArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_ORGANIZATION_REQUEST_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33019, v15, v20, CFSTR("DEPFatalError"));
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v19 = (id)v18;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  -[DEPClient setUserCredentials:](self, "setUserCredentials:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__DEPClient_retrieveDeviceUploadRequestTypesWithCredentials_completionBlock___block_invoke;
  v8[3] = &unk_1E98BF230;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 5, v8);

}

void __77__DEPClient_retrieveDeviceUploadRequestTypesWithCredentials_completionBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  v19 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestTypesFromDict:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_REQUEST_TYPES_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33020, v17, v20, CFSTR("DEPFatalError"));
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = (id)v18;
  }
  v21 = v15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  v9 = a3;
  -[DEPClient setUserCredentials:](self, "setUserCredentials:", a4);
  -[DEPClient setOrganization:](self, "setOrganization:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__DEPClient_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock___block_invoke;
  v11[3] = &unk_1E98BF230;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 6, v11);

}

void __86__DEPClient_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  v19 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_soldToIdsFromDict:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_ORGANIZATION_SOLD_TO_IDS_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33021, v17, v20, CFSTR("DEPFatalError"));
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = (id)v18;
  }
  v21 = v15;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v9 = a4;
  -[DEPClient setDeviceUploadRequest:](self, "setDeviceUploadRequest:", a3);
  -[DEPClient setUserCredentials:](self, "setUserCredentials:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__DEPClient_submitDeviceUploadRequest_credentials_completionBlock___block_invoke;
  v11[3] = &unk_1E98BF208;
  v12 = v8;
  v10 = v8;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 7, v11);

}

void __67__DEPClient_submitDeviceUploadRequest_credentials_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  DEPDeviceUploadSubmissionResponse *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v14 = a4;
  if (a2)
  {
    v15 = -[DEPDeviceUploadSubmissionResponse initWithDict:]([DEPDeviceUploadSubmissionResponse alloc], "initWithDict:", v19);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_DEVICE_UPLOAD_SUBMIT_REQUEST_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33022, v17, v14, CFSTR("DEPFatalError"));
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v14 = (id)v18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v9 = a4;
  -[DEPClient setPushToken:](self, "setPushToken:", a3);
  -[DEPClient setPushTopic:](self, "setPushTopic:", v9);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__DEPClient_syncDEPPushToken_pushTopic_completionBlock___block_invoke;
  v11[3] = &unk_1E98BF208;
  v12 = v8;
  v10 = v8;
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 9, v11);

}

void __56__DEPClient_syncDEPPushToken_pushTopic_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v14 = a4;
  if ((a2 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED"), v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33024, v16, v14, CFSTR("DEPFatalError"));
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v17;
  }
  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, uint64_t, id, id))(v18 + 16))(v18, a2, v19, v14);

}

- (void)pingWithCompletionBlock:(id)a3
{
  -[DEPClient _retrieveProxyObjectAndRunServiceType:completionBlock:](self, "_retrieveProxyObjectAndRunServiceType:completionBlock:", 8, a3);
}

- (id)_cloudConfigRetrievalBlockWithClientCompletionBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__DEPClient__cloudConfigRetrievalBlockWithClientCompletionBlock___block_invoke;
  v7[3] = &unk_1E98BF208;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D826C784](v7);

  return v5;
}

void __65__DEPClient__cloudConfigRetrievalBlockWithClientCompletionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v20 = v7;
  if (a2)
  {
    v16 = (void *)objc_msgSend(v20, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E98C2830, CFSTR("ConfigurationSource"));
    v17 = v20;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    DEPErrorArray(CFSTR("CLOUD_CONFIG_NOT_AVAILABLE"), v9, v10, v11, v12, v13, v14, v15, 0, (uint64_t)v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "DEPErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("DEPCloudConfigErrorDomain"), 33001, v17, v8, CFSTR("DEPFatalError"));
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = v20;
    v8 = (id)v19;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_organizationsFromArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[DEPClient _organizationFromDict:](self, "_organizationFromDict:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_organizationFromDict:(id)a3
{
  id v3;
  DEPDeviceUploadOrganization *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[DEPDeviceUploadOrganization initWithDict:]([DEPDeviceUploadOrganization alloc], "initWithDict:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_requestTypesFromDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DEPDeviceUploadRequestType *v11;
  void *v12;
  DEPDeviceUploadRequestType *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [DEPDeviceUploadRequestType alloc];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[DEPDeviceUploadRequestType initWithCode:name:](v11, "initWithCode:name:", v10, v12);

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (id)_soldToIdsFromDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("soldToIds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("soldToIds"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("soldToId"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
  }
  v14 = (void *)objc_msgSend(v4, "copy");

  return v14;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (DEPDeviceUploadCredentials)userCredentials
{
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (DEPDeviceUploadOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
  objc_storeStrong((id *)&self->_organization, a3);
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)deviceUploadRequest
{
  return self->_deviceUploadRequest;
}

- (void)setDeviceUploadRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUploadRequest, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_deviceUploadRequest, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
