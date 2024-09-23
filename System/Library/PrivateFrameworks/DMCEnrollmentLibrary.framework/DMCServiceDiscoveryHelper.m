@implementation DMCServiceDiscoveryHelper

- (void)discoverServerForUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, uint64_t, _QWORD);
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  void (**v31)(id, void *, uint64_t, _QWORD);
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("@"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 2)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
    {
      v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v13, OS_LOG_TYPE_DEFAULT, "Simulating service discovery.", buf, 2u);
      }
      v14 = (void *)MEMORY[0x24BE2A850];
      objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedMDMEnrollmentMode");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "buildWithVersion:baseURL:", v15, CFSTR("https://mdm.example.com/sign-in"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v17, 3, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2A7F0], "serviceDiscoveryDomainWithValue:", v12);
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BE2A7F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 443);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serviceDiscoveryDefaultPortWithValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "integerValue");

      v26 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v21;
        _os_log_impl(&dword_219D1D000, v26, OS_LOG_TYPE_DEBUG, "Domain is: %{public}@", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke;
      v28[3] = &unk_24DBE3ED0;
      v31 = v10;
      v28[4] = self;
      v29 = v8;
      v30 = v9;
      -[DMCServiceDiscoveryHelper _discoverServerURLForDomain:port:userIdentifier:anchorCertificateRefs:completionHandler:](self, "_discoverServerURLForDomain:port:userIdentifier:anchorCertificateRefs:completionHandler:", v21, v27, v29, v30, v28);

      v16 = v31;
      v12 = (void *)v21;
    }
  }
  else
  {
    v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = (uint64_t)v8;
      _os_log_impl(&dword_219D1D000, v18, OS_LOG_TYPE_ERROR, "User identifier is wrong format for discovery: %{public}@", buf, 0xCu);
    }
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BE2A578];
    DMCErrorArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 15000, v12, *MEMORY[0x24BE2A588], v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, uint64_t, void *))v10)[2](v10, 0, 0, v16);
  }

}

void __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_2;
    v8[3] = &unk_24DBE3EA8;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v4, "_discoverAppleServerWithUserIdentifier:anchorCertificateRefs:completionHandler:", v5, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_219D1D000, v5, OS_LOG_TYPE_ERROR, "Failed to discover apple well-known URL with error: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_fallbackServer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      v10 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v8 + 16))(v8, v9, 3, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v8 + 16))(v8, 0, 2, v4);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)discoverEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __135__DMCServiceDiscoveryHelper_discoverEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  v14[3] = &unk_24DBE3EF8;
  v15 = v12;
  v13 = v12;
  -[DMCServiceDiscoveryHelper determineEnrollmentMethodWithServiceURL:enrollmentType:machineInfo:anchorCertificateRefs:completionHandler:](self, "determineEnrollmentMethodWithServiceURL:enrollmentType:machineInfo:anchorCertificateRefs:completionHandler:", a3, a4, a5, a6, v14);

}

void __135__DMCServiceDiscoveryHelper_discoverEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)determineEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  DMCServiceDiscoveryHelper *v29;
  id v30;
  unint64_t v31;
  uint8_t buf[8];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment"))
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219D1D000, v16, OS_LOG_TYPE_DEFAULT, "Simulating determination of enrollment method.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedMDMAccountDrivenEnrollmentAuthMethod");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE60D50], "authenticationMethod");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE60DA8], "authenticationMethod");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v17, "isEqualToString:", v22);

      if ((v23 & 1) != 0)
      {
        v20 = 5;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE60D98], "authenticationMethod");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v17, "isEqualToString:", v24);

        if (v25)
          v20 = 1;
        else
          v20 = 2;
      }
    }
    v26 = *MEMORY[0x24BE60CF8];
    v33[0] = *MEMORY[0x24BE60CE0];
    v33[1] = v26;
    v34[0] = v17;
    v34[1] = CFSTR("https://mdm.example.com/auth");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *, _QWORD, _QWORD))v15 + 2))(v15, v20, v21, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttribution:", 1);
    objc_msgSend(v17, "setHTTPMethod:", *MEMORY[0x24BE2A5F0]);
    objc_msgSend(v17, "setTimeoutInterval:", *MEMORY[0x24BE2A5F8]);
    objc_msgSend(v17, "setValue:forHTTPHeaderField:", CFSTR("application/pkcs7-signature"), CFSTR("Content-Type"));
    objc_msgSend(v17, "setHTTPBody:", v13);
    v21 = (void *)objc_opt_new();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __136__DMCServiceDiscoveryHelper_determineEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
    v27[3] = &unk_24DBE3F20;
    v28 = v12;
    v30 = v15;
    v31 = a4;
    v29 = self;
    objc_msgSend(v21, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v17, 0, 0, v14, v27);

  }
}

void __136__DMCServiceDiscoveryHelper_determineEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(void);
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v12;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_ERROR, "Failed to discover enrollment method with service URL: %{public}@, error: %{public}@", buf, 0x16u);
    }
LABEL_14:
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_impl(&dword_219D1D000, v15, OS_LOG_TYPE_ERROR, "Response from the MDM server does not follow the HTTP protocol: %@", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE2A578];
    DMCErrorArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v17, 15003, v18, 0, *MEMORY[0x24BE2A588], 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v10 = v8;
  if (objc_msgSend(v10, "statusCode") != 200 && objc_msgSend(v10, "statusCode") != 401)
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    goto LABEL_30;
  }
  v13 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v13 - 1) > 2)
  {
LABEL_20:
    if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 4 || objc_msgSend(v10, "statusCode") == 401)
    {
      v20 = (void *)MEMORY[0x24BE60D48];
      objc_msgSend(v10, "allHeaderFields");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BE2A5E0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v23 = objc_msgSend(v20, "enrollmentMethodFromAuthenticateString:outParams:", v22, &v34);
      v24 = v34;

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 40), "_checkForESSOWithMethod:authParams:httpResponse:completionHandler:", v23, v24, v10, *(_QWORD *)(a1 + 48));
      }
      else
      {
        v25 = (void *)MEMORY[0x24BDD1540];
        v26 = *MEMORY[0x24BE2A578];
        DMCErrorArray();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v26, 15003, v27, 0, *MEMORY[0x24BE2A588], 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      goto LABEL_32;
    }
    v29 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_219D1D000, v29, OS_LOG_TYPE_ERROR, "Server's response is not 401 for the BYOD/ADDE enrollment. Response: %{public}@", buf, 0xCu);
    }
    v30 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BE2A578];
LABEL_31:
    DMCErrorArray();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v31, 15003, v33, 0, *MEMORY[0x24BE2A588], 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_32:

    goto LABEL_16;
  }
  if (objc_msgSend(v10, "statusCode") != 200)
  {
    v13 = *(_QWORD *)(a1 + 56);
    goto LABEL_20;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_29:
      v32 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v36 = v32;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_219D1D000, v19, OS_LOG_TYPE_ERROR, "Failed to discover enrollment method with service URL: %{public}@, response: %{public}@", buf, 0x16u);
    }
LABEL_30:
    v30 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BE2A578];
    goto LABEL_31;
  }
  v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_15:
  v14();
LABEL_16:

}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authToken:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = *MEMORY[0x24BE60CF0];
  v20[0] = a4;
  v12 = (void *)MEMORY[0x24BDBCE70];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCServiceDiscoveryHelper fetchEnrollmentProfileWithServiceURL:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:](self, "fetchEnrollmentProfileWithServiceURL:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:", v17, v18, 1, v15, v14, v13);
}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authTokens:(id)a4 enrollmentMethod:(unint64_t)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7 completionHandler:(id)a8
{
  -[DMCServiceDiscoveryHelper fetchEnrollmentProfileWithServiceURL:username:password:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:](self, "fetchEnrollmentProfileWithServiceURL:username:password:authTokens:enrollmentMethod:machineInfo:anchorCertificateRefs:completionHandler:", a3, 0, 0, a4, a5, a6, a7, a8);
}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 username:(id)a4 password:(id)a5 authTokens:(id)a6 enrollmentMethod:(unint64_t)a7 machineInfo:(id)a8 anchorCertificateRefs:(id)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  Class *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if ((objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateMDMAccountDrivenEnrollment") & 1) == 0
    && !objc_msgSend(MEMORY[0x24BE2A7F0], "shouldSimulateDEPCommunication"))
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v15);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAttribution:", 1);
    objc_msgSend(v25, "setHTTPMethod:", *MEMORY[0x24BE2A5F0]);
    objc_msgSend(v25, "setTimeoutInterval:", *MEMORY[0x24BE2A5F8]);
    objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/pkcs7-signature"), CFSTR("Content-Type"));
    objc_msgSend(v25, "setHTTPBody:", v19);
    v26 = (void *)objc_opt_new();
    switch(a7)
    {
      case 5uLL:
        v27 = (Class *)0x24BE60DA8;
        break;
      case 2uLL:
        v27 = (Class *)0x24BE60D50;
        break;
      case 1uLL:
        v27 = (Class *)0x24BE60D98;
        break;
      default:
LABEL_13:
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke_2;
        v30[3] = &unk_24DBE3F48;
        v31 = v15;
        v32 = v21;
        v29 = v21;
        objc_msgSend(v26, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v25, v16, v17, v20, v30);

        goto LABEL_14;
    }
    v28 = (void *)objc_msgSend(objc_alloc(*v27), "initWithTokens:", v18);
    objc_msgSend(v26, "setAuthenticator:", v28);

    goto LABEL_13;
  }
  v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219D1D000, v22, OS_LOG_TYPE_DEFAULT, "Simulating enrollment profile.", buf, 2u);
  }
  v23 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(21, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  block[3] = &unk_24DBE3A70;
  v34 = v21;
  v25 = v21;
  dispatch_after(v23, v24, block);

  v26 = v34;
LABEL_14:

}

void __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2A7F0], "simulatedMDMEnrollmentProfile");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218242;
    v32 = objc_msgSend(v7, "length");
    v33 = 2114;
    v34 = v8;
    _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "Fetch enrollment profile finished with data: %lu bytes, response: %{public}@", buf, 0x16u);

  }
  if (v9)
  {
    v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch enrollment profile with service URL: %{public}@, error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = objc_msgSend(v8, "statusCode");
    if (v14 == 200)
    {
      objc_msgSend(MEMORY[0x24BE2A7F0], "enrollmentProfileWithDefaultValue:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "length"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v25 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219D1D000, v25, OS_LOG_TYPE_ERROR, "Empty profile!", buf, 2u);
        }
        v26 = *(_QWORD *)(a1 + 40);
        v27 = (void *)MEMORY[0x24BDD1540];
        v28 = *MEMORY[0x24BE2A578];
        DMCErrorArray();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v28, 15003, v29, 0, *MEMORY[0x24BE2A588], 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v30);

      }
      v7 = v23;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BE2A578];
      if (v14 == 401)
      {
        DMCErrorArray();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x24BE2A588];
        v20 = v16;
        v21 = v17;
        v22 = 15009;
      }
      else
      {
        DMCErrorArray();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x24BE2A588];
        v20 = v16;
        v21 = v17;
        v22 = 15003;
      }
      objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v21, v22, v18, 0, v19, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v24);

    }
  }

}

- (void)_discoverServerURLForDomain:(id)a3 port:(id)a4 userIdentifier:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setScheme:", CFSTR("https"));
  objc_msgSend(v17, "setHost:", v16);

  if (objc_msgSend(v12, "intValue") != 443)
    objc_msgSend(v17, "setPort:", v12);
  objc_msgSend(v17, "setPath:", CFSTR("/.well-known/com.apple.remotemanagement"));
  -[DMCServiceDiscoveryHelper _defaultServiceDiscoveryQueryItemsWithUserIdentifier:](self, "_defaultServiceDiscoveryQueryItemsWithUserIdentifier:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  if (objc_msgSend(MEMORY[0x24BE2A7E8], "isAppleInternal")
    && objc_msgSend(MEMORY[0x24BE2A7D8], "DSLiveOnModeEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ignoreBusinessEssentialsSubscription"), CFSTR("true"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

  }
  objc_msgSend(v17, "setQueryItems:", v19);
  objc_msgSend(v17, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138543362;
    v24 = v21;
    _os_log_impl(&dword_219D1D000, v22, OS_LOG_TYPE_DEBUG, "Well known url is: %{public}@", (uint8_t *)&v23, 0xCu);
  }
  -[DMCServiceDiscoveryHelper _serversFromWellKnownURL:anchorCertificateRefs:completionHandler:](self, "_serversFromWellKnownURL:anchorCertificateRefs:completionHandler:", v21, v14, v13);

}

- (void)_discoverAppleServerWithUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = (void *)MEMORY[0x24BDD1808];
  v9 = (void *)MEMORY[0x24BE2A7F0];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "appleMDMWellKnownURLWithDefaultValue:", CFSTR("https://axm-adm-enroll.apple.com/.well-known/com.apple.remotemanagement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsWithString:", v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[DMCServiceDiscoveryHelper _defaultServiceDiscoveryQueryItemsWithUserIdentifier:](self, "_defaultServiceDiscoveryQueryItemsWithUserIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setQueryItems:", v14);
  objc_msgSend(v16, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCServiceDiscoveryHelper _serversFromWellKnownURL:anchorCertificateRefs:completionHandler:](self, "_serversFromWellKnownURL:anchorCertificateRefs:completionHandler:", v15, v11, v10);

}

- (id)_defaultServiceDiscoveryQueryItemsWithUserIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE2A7F0];
  v4 = (void *)MEMORY[0x24BE2A818];
  v5 = a3;
  objc_msgSend(v4, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productNameWithDefaultValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("user-identifier"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("model-family"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_serversFromWellKnownURL:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD16B0];
  v10 = a4;
  objc_msgSend(v9, "requestWithURL:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribution:", 1);
  objc_msgSend(v11, "setHTTPMethod:", *MEMORY[0x24BE2A5E8]);
  objc_msgSend(v11, "setTimeoutInterval:", 90.0);
  v12 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __94__DMCServiceDiscoveryHelper__serversFromWellKnownURL_anchorCertificateRefs_completionHandler___block_invoke;
  v15[3] = &unk_24DBE3F48;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v12, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v11, 0, 0, v10, v15);

}

void __94__DMCServiceDiscoveryHelper__serversFromWellKnownURL_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218242;
    v55 = objc_msgSend(v7, "length");
    v56 = 2114;
    v57 = v8;
    _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "Service URL from wellknown URL request finished with data: %lu bytes, response: %{public}@", buf, 0x16u);

  }
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v8;
    else
      v16 = 0;
    v17 = v16;
    v18 = v17;
    if (!v7
      || !v8
      || !v17
      || (objc_msgSend(v17, "MIMEType"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BE2A5C8]),
          v19,
          (v20 & 1) == 0))
    {
      v29 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v55 = v30;
        v56 = 2114;
        v57 = v8;
        _os_log_impl(&dword_219D1D000, v29, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: %{public}@", buf, 0x16u);
      }
      v31 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BE2A578];
      v33 = *(_QWORD *)(a1 + 40);
      v48 = *(_QWORD *)(a1 + 32);
      DMCErrorArray();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:errorType:", v32, 15002, v22, *MEMORY[0x24BE2A588], v48, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v21);
      goto LABEL_25;
    }
    if (objc_msgSend(v18, "statusCode") != 200)
    {
      v34 = *(_QWORD *)(a1 + 40);
      v35 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v36, 15003, v22, 0, *MEMORY[0x24BE2A588], 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v34 + 16))(v34, 0, v21);
LABEL_25:

      goto LABEL_26;
    }
    v53 = 0;
    objc_msgSend(MEMORY[0x24BE2A848], "loadData:serializationType:error:", v7, 1, &v53);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v53;
    if (v21)
    {
      objc_msgSend(v21, "responseServers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_35:

        goto LABEL_25;
      }
      v42 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v55 = v43;
        v56 = 2114;
        v57 = v7;
        _os_log_impl(&dword_219D1D000, v42, OS_LOG_TYPE_ERROR, "Invalid well-known servers response for %{public}@: no servers: %{public}@", buf, 0x16u);
      }
      v52 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BE2A578];
      v45 = *(_QWORD *)(a1 + 40);
      v50 = *(_QWORD *)(a1 + 32);
      DMCErrorArray();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "DMCErrorWithDomain:code:descriptionArray:errorType:", v44, 15002, v41, *MEMORY[0x24BE2A588], v50, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v45 + 16))(v45, 0, v46);

    }
    else
    {
      v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v55 = v38;
        v56 = 2114;
        v57 = v22;
        _os_log_impl(&dword_219D1D000, v37, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: JSON error: %{public}@", buf, 0x16u);
      }
      v51 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BE2A578];
      v40 = *(_QWORD *)(a1 + 40);
      v49 = *(_QWORD *)(a1 + 32);
      DMCErrorArray();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v39, 15002, v23, v22, *MEMORY[0x24BE2A588], v49, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v40 + 16))(v40, 0, v41);
    }

    goto LABEL_35;
  }
  v12 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v55 = v13;
    v56 = 2114;
    v57 = v9;
    _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_ERROR, "Well-known request for %{public}@ failed: %{public}@", buf, 0x16u);
  }
  objc_msgSend(v9, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE2A600]))
  {

    goto LABEL_21;
  }
  v15 = objc_msgSend(v9, "code");

  if (v15 != 23009)
  {
LABEL_21:
    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BE2A578];
    v26 = *(_QWORD *)(a1 + 40);
    v47 = *(_QWORD *)(a1 + 32);
    DMCErrorArray();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:errorType:", v25, 15001, v27, *MEMORY[0x24BE2A588], v47, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v28);

    goto LABEL_26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:

}

- (id)_serverForAppleMAID
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2A7F0], "serviceDiscoveryFallbackURLWithValue:", CFSTR("https://axm-adm-enroll.apple.com/enroll/byod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE2A850], "buildWithVersion:baseURL:", *MEMORY[0x24BE2A8C0], v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v2;
      _os_log_impl(&dword_219D1D000, v5, OS_LOG_TYPE_ERROR, "Invalid Apple MAID service URL: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

- (id)_fallbackServer
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2A7F0], "serviceDiscoveryFallbackURLWithValue:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2A7F0], "serviceDiscoveryFallbackServerVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = v2;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_219D1D000, v6, OS_LOG_TYPE_ERROR, "Invalid fallback service URL: %{public}@, fallabck server version: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2A850], "buildWithVersion:baseURL:", v3, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_checkForESSOWithMethod:(unint64_t)a3 authParams:(id)a4 httpResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  unint64_t v25;

  v10 = a4;
  v11 = a6;
  objc_msgSend(a5, "allHeaderFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(MEMORY[0x24BE2A7D8], "ESSOTestModeEnabled");
  v14 = (_QWORD *)MEMORY[0x24BE2A5D8];
  if (!v13)
    v14 = (_QWORD *)MEMORY[0x24BE2A5D0];
  objc_msgSend(v12, "objectForKeyedSubscript:", *v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __95__DMCServiceDiscoveryHelper__checkForESSOWithMethod_authParams_httpResponse_completionHandler___block_invoke;
      v22[3] = &unk_24DBE3F70;
      v24 = v11;
      v25 = a3;
      v23 = v10;
      -[DMCServiceDiscoveryHelper _fetchESSODictionaryFromURL:completionHandler:](self, "_fetchESSODictionaryFromURL:completionHandler:", v17, v22);

    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BE2A578];
      DMCErrorArray();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v19, 15003, v20, 0, *MEMORY[0x24BE2A588], 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, 0, v21);
    }
  }
  else
  {
    (*((void (**)(id, unint64_t, id, _QWORD, _QWORD))v11 + 2))(v11, a3, v10, 0, 0);
  }

}

void __95__DMCServiceDiscoveryHelper__checkForESSOWithMethod_authParams_httpResponse_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void (*v10)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t);
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1[5];
  if (a2)
  {
    v4 = a1[6];
    v5 = a1[4];
    v11 = *MEMORY[0x24BE60D08];
    v12[0] = a2;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = a2;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, _QWORD))(v3 + 16))(v3, v4, v5, v8, 0);

  }
  else
  {
    v10 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(v3 + 16);
    v8 = 0;
    v10(v3, 0, 0, 0, a3);
  }

}

- (void)_fetchESSODictionaryFromURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttribution:", 1);
  objc_msgSend(v7, "setHTTPMethod:", *MEMORY[0x24BE2A5E8]);
  objc_msgSend(v7, "setTimeoutInterval:", 90.0);
  v8 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__DMCServiceDiscoveryHelper__fetchESSODictionaryFromURL_completionHandler___block_invoke;
  v11[3] = &unk_24DBE3F48;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v7, 0, 0, 0, v11);

}

void __75__DMCServiceDiscoveryHelper__fetchESSODictionaryFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void (*v24)(void);
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218242;
    v45 = objc_msgSend(v7, "length");
    v46 = 2114;
    v47 = v8;
    _os_log_impl(&dword_219D1D000, v11, OS_LOG_TYPE_DEFAULT, "Fetch ESSO dictionary request finished with data: %lu bytes, response: %{public}@", buf, 0x16u);

  }
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v8;
    else
      v19 = 0;
    v20 = v19;
    v17 = v20;
    if (v7
      && v8
      && v20
      && (objc_msgSend(v20, "MIMEType"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE2A5C8]),
          v21,
          (v22 & 1) != 0))
    {
      if (objc_msgSend(v17, "statusCode") == 200)
      {
        v43 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v43);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v43;
        if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v33 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v34 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v45 = v34;
            v46 = 2114;
            v47 = v18;
            _os_log_impl(&dword_219D1D000, v33, OS_LOG_TYPE_ERROR, "Invalid ESSO dictionary response for %{public}@: JSON error: %{public}@", buf, 0x16u);
          }
          v35 = (void *)MEMORY[0x24BDD1540];
          v36 = *MEMORY[0x24BE2A578];
          v37 = *(_QWORD *)(a1 + 40);
          v42 = *(_QWORD *)(a1 + 32);
          DMCErrorArray();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v36, 15027, v38, v18, *MEMORY[0x24BE2A588], v42, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v37 + 16))(v37, 0, v39);

          goto LABEL_22;
        }
        v24 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      }
      else
      {
        v30 = *(_QWORD *)(a1 + 40);
        v31 = (void *)MEMORY[0x24BDD1540];
        v32 = *MEMORY[0x24BE2A578];
        DMCErrorArray();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v32, 15003, v18, 0, *MEMORY[0x24BE2A588], 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void (**)(void))(v30 + 16);
      }
    }
    else
    {
      v25 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        v46 = 2114;
        v47 = v8;
        _os_log_impl(&dword_219D1D000, v25, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: %{public}@", buf, 0x16u);
      }
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BE2A578];
      v29 = *(_QWORD *)(a1 + 40);
      v41 = *(_QWORD *)(a1 + 32);
      DMCErrorArray();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "DMCErrorWithDomain:code:descriptionArray:errorType:", v28, 15027, v18, *MEMORY[0x24BE2A588], v41, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void (**)(void))(v29 + 16);
    }
    v24();
LABEL_22:

    goto LABEL_23;
  }
  v12 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v45 = v13;
    v46 = 2114;
    v47 = v9;
    _os_log_impl(&dword_219D1D000, v12, OS_LOG_TYPE_ERROR, "Fetch ESSO dictionary request for %{public}@ failed: %{public}@", buf, 0x16u);
  }
  v14 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BE2A578];
  v16 = *(_QWORD *)(a1 + 40);
  v40 = *(_QWORD *)(a1 + 32);
  DMCErrorArray();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", v15, 15026, v17, *MEMORY[0x24BE2A588], v40, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v18);
LABEL_23:

}

@end
