@implementation FCEndpointConnection

- (FCEndpointConnection)initWithNetworkBehaviorMonitor:(id)a3
{
  return -[FCEndpointConnection initWithSourceApplicationBundleIdentifier:networkBehaviorMonitor:](self, "initWithSourceApplicationBundleIdentifier:networkBehaviorMonitor:", 0, a3);
}

- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3 networkBehaviorMonitor:(id)a4
{
  id v6;
  id v7;
  FCEndpointConnection *v8;
  FCEndpointConnection *v9;
  id v10;
  uint64_t v11;
  NFLazy *lazySession;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCEndpointConnection;
  v8 = -[FCEndpointConnection init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_networkBehaviorMonitor, a4);
    objc_initWeak(&location, v9);
    v10 = objc_alloc(MEMORY[0x1E0D60AD0]);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__FCEndpointConnection_initWithSourceApplicationBundleIdentifier_networkBehaviorMonitor___block_invoke;
    v14[3] = &unk_1E46408E8;
    v15 = v6;
    objc_copyWeak(&v16, &location);
    v11 = objc_msgSend(v10, "initWithConstructor:", v14);
    lazySession = v9->_lazySession;
    v9->_lazySession = (NFLazy *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (FCEndpointConnection)init
{
  return -[FCEndpointConnection initWithSourceApplicationBundleIdentifier:](self, "initWithSourceApplicationBundleIdentifier:", 0);
}

- (FCEndpointConnection)initWithSourceApplicationBundleIdentifier:(id)a3
{
  return -[FCEndpointConnection initWithSourceApplicationBundleIdentifier:networkBehaviorMonitor:](self, "initWithSourceApplicationBundleIdentifier:networkBehaviorMonitor:", a3, 0);
}

+ (id)errorForStatus:(int64_t)a3 url:(id)a4
{
  return NSErrorForHTTPStatusCode(a3, a4);
}

id __89__FCEndpointConnection_initWithSourceApplicationBundleIdentifier_networkBehaviorMonitor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:");
  if (FCProcessIsMemoryConstrained())
    objc_msgSend(v3, "setURLCache:", 0);
  objc_msgSend(v3, "setNetworkServiceType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPMaximumConnectionsPerHost:", 2 * objc_msgSend(v4, "processorCount"));

  objc_msgSend(v3, "set_timingDataOptions:", objc_msgSend(v3, "_timingDataOptions") | 1);
  v5 = (void *)MEMORY[0x1E0C92C98];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "sessionWithConfiguration:delegate:delegateQueue:", v3, WeakRetained, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)session
{
  void *v2;
  void *v3;

  -[FCEndpointConnection lazySession](self, "lazySession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 callbackQueue:(id)a9 completion:(id)a10
{
  unsigned int v10;

  LOBYTE(v10) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, MEMORY[0x1E0C9AA70], a4, a5, a6, a8, v10, a9, a10);
}

- (void)performHTTPRequestWithURL:(id)a3 method:(id)a4 data:(id)a5 contentType:(id)a6 priority:(float)a7 requiresMescalSigning:(BOOL)a8 networkEventType:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  uint64_t v11;

  HIDWORD(v11) = a9;
  LOBYTE(v11) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, 0, a4, a5, a6, a8, v11, a10, a11);
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11
{
  unsigned int v11;

  LOBYTE(v11) = 0;
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, a4, a5, a6, a7, a9, v11, a10, a11);
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12
{
  -[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:](self, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", a3, a4, a5, a6, a7, a9);
}

- (void)performHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 requiresMescalSigning:(BOOL)a9 requiresAuthKitHeaders:(BOOL)a10 networkEventType:(int)a11 callbackQueue:(id)a12 completion:(id)a13
{
  _BOOL4 v13;
  id v19;
  id v20;
  id v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  id v37;
  void (**v38)(void);
  void (**v39)(void);
  void *v40;
  id v41;
  void (*v42)(void);
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  void (**v55)(void);
  uint8_t buf[16];
  _QWORD v57[4];
  id v58;
  __CFString *v59;
  id v60;
  id v61;
  __CFString *v62;
  FCEndpointConnection *v63;
  id v64;
  int v65;
  float v66;
  BOOL v67;
  BOOL v68;
  _QWORD aBlock[4];
  id v70;
  id v71;

  v13 = a9;
  v50 = a3;
  v49 = a4;
  v19 = a5;
  v20 = a6;
  v48 = a7;
  v21 = a12;
  v22 = a13;
  v23 = (__CFString *)v19;
  v24 = v23;
  if (v13)
  {
    if (-[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("Signed_GET")))
    {
      v25 = CFSTR("GET");

      objc_msgSend(CFSTR("SIGNATURE-MESSAGE"), "dataUsingEncoding:", 4);
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v26;
    }
    else
    {
      v25 = v24;
      v27 = v20;
    }
    if (-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("Signed_DELETE")))
    {
      v29 = CFSTR("DELETE");

      objc_msgSend(CFSTR("SIGNATURE-MESSAGE"), "dataUsingEncoding:", 4);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v28 = v29;
    }
    else
    {
      v20 = v27;
      v28 = v25;
    }
  }
  else
  {
    v28 = v23;
  }
  v30 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke;
  aBlock[3] = &unk_1E4642CA8;
  v31 = v21;
  v70 = v31;
  v32 = v22;
  v71 = v32;
  v33 = _Block_copy(aBlock);
  NewsCoreUserDefaults();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "BOOLForKey:", CFSTR("simulate_retryable_analytics_upload_failure")))
  {
    v46 = v31;
    v57[0] = v30;
    v57[1] = 3221225472;
    v57[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_3;
    v57[3] = &unk_1E46454F0;
    v45 = v50;
    v58 = v45;
    v67 = a10;
    v35 = v28;
    v59 = v28;
    v60 = v48;
    v61 = v49;
    v68 = v13;
    v62 = v24;
    v63 = self;
    v65 = a11;
    v37 = v33;
    v64 = v37;
    v66 = a8;
    v38 = (void (**)(void))_Block_copy(v57);
    v39 = v38;
    v36 = v20;
    if (v20)
    {
      if (v13)
      {
        if ((objc_msgSend(v34, "BOOLForKey:", CFSTR("simulate_bad_analytics_mescal_signature")) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "description");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "dataUsingEncoding:", 4);
          v41 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v41 = v20;
        }
        v43 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_DEFAULT, "Endpoint connection will generate Mescal signature", buf, 2u);
        }
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_26;
        v51[3] = &unk_1E4645518;
        v51[4] = self;
        v52 = v45;
        v54 = v37;
        v55 = v39;
        v53 = v36;
        +[FCMescalSignature signatureFromData:completion:](FCMescalSignature, "signatureFromData:completion:", v41, v51);

        goto LABEL_22;
      }
      v42 = v38[2];
    }
    else
    {
      v42 = v38[2];
    }
    v42();
LABEL_22:
    v31 = v46;

    goto LABEL_23;
  }
  (*((void (**)(void *, _QWORD, _QWORD, _QWORD))v33 + 2))(v33, 0, 0, 0);
  v35 = v28;
  v36 = v20;
LABEL_23:

}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
  }
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2;
    v14[3] = &unk_1E463DCB0;
    v18 = v13;
    v15 = v7;
    v16 = v8;
    v17 = v9;
    dispatch_async(v11, v14);

  }
}

uint64_t __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  _BYTE *v32;
  uint64_t v33;
  int v34;
  _QWORD v35[4];
  id v36;
  _BYTE buf[24];
  __int128 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v7, "HTTPUserAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_INFO, "Client request: %@, current userAgent: %@", buf, 0x16u);

  }
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(v7, "ak_addDeviceUDIDHeader");
    objc_msgSend(v7, "ak_addClientInfoHeader");
    objc_msgSend(v7, "ak_addAnisetteHeaders");
  }
  objc_msgSend(v7, "setHTTPMethod:", *(_QWORD *)(a1 + 40));
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    objc_msgSend(v7, "addValue:forHTTPHeaderField:", v11, CFSTR("Content-Type"));
  v12 = *(void **)(a1 + 56);
  v13 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_10;
  v35[3] = &unk_1E4643580;
  v14 = v7;
  v36 = v14;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v35);
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endpointConnectionClientID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addValue:forHTTPHeaderField:", v16, CFSTR("X-CLIENT-ID"));

  if (v6)
  {
    objc_msgSend(v14, "addValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-ActionSignature"));
    if ((objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("Signed_GET")) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 64), "isEqualToString:", CFSTR("Signed_DELETE")))
    {
      objc_msgSend(v14, "addValue:forHTTPHeaderField:", CFSTR("SIGNATURE-MESSAGE"), CFSTR("X-SIGNATURE-MESSAGE"));
      goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 97) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Shouldn't be here if the request requires Mescal signing"));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCEndpointConnection performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentTyp"
                         "e:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completi"
                         "on:]_block_invoke_3";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCEndpointConnection.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v38) = 285;
    WORD2(v38) = 2114;
    *(_QWORD *)((char *)&v38 + 6) = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v14, "setHTTPBody:", v5);
LABEL_15:
  v17 = FCAnalyticsLog;
  if (os_log_type_enabled((os_log_t)FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_INFO, "Client request: %@, signature: %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v38 = __Block_byref_object_copy__41;
  *((_QWORD *)&v38 + 1) = __Block_byref_object_dispose__41;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 72), "session");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_20;
  v28[3] = &unk_1E46454C8;
  v34 = *(_DWORD *)(a1 + 88);
  v21 = v14;
  v33 = v19;
  v32 = buf;
  v22 = *(_QWORD *)(a1 + 72);
  v23 = *(void **)(a1 + 80);
  v29 = v21;
  v30 = v22;
  v31 = v23;
  objc_msgSend(v20, "dataTaskWithRequest:completionHandler:", v21, v28);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v24;

  LODWORD(v26) = *(_DWORD *)(a1 + 92);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setPriority:", v26);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "resume");

  _Block_object_dispose(buf, 8);
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2_11;
  v7[3] = &unk_1E463FD48;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_2_11(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", a2, *(_QWORD *)(a1 + 40));
}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  FCNetworkEvent *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  FCNetworkEvent *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  NSErrorByUpdatingRetryStatusForError(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v7;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (*(_DWORD *)(a1 + 72))
  {
    v12 = [FCNetworkEvent alloc];
    v13 = *(unsigned int *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_incompleteCurrentTaskTransactionMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCNetworkEvent initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:](v12, "initWithType:URLRequest:operationID:requestUUID:startTime:HTTPResponse:metrics:containerName:error:", v13, v14, 0, 0, v11, v16, v15, 0, v9);

    objc_msgSend(*(id *)(a1 + 40), "networkBehaviorMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logNetworkEvent:", v17);

  }
  v19 = FCAnalyticsLog;
  if (os_log_type_enabled((os_log_t)FCAnalyticsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_INFO, "Endpoint response: %@, error: %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __194__FCEndpointConnection_performHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_requiresMescalSigning_requiresAuthKitHeaders_networkEventType_callbackQueue_completion___block_invoke_26(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Failed to sign analytics data with Mescal", v11, 2u);
    }
    +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNetworkReachable");

    if ((v9 & 1) != 0)
    {
      (*(void (**)(void))(a1[7] + 16))();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "errorForStatus:url:", 0, a1[5]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[7] + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
  }

}

- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 callbackQueue:(id)a10 completion:(id)a11
{
  uint64_t v11;

  LODWORD(v11) = 0;
  -[FCEndpointConnection performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:networkEventType:callbackQueue:completion:](self, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:networkEventType:callbackQueue:completion:", a3, a4, a5, a6, a7, a9, v11, a10, a11);
}

- (void)performAuthenticatedHTTPRequestWithURL:(id)a3 valuesByHTTPHeaderField:(id)a4 method:(id)a5 data:(id)a6 contentType:(id)a7 priority:(float)a8 reauthenticateIfNeeded:(BOOL)a9 networkEventType:(int)a10 callbackQueue:(id)a11 completion:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  FCEndpointConnection *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;
  float v44;
  BOOL v45;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a11;
  v24 = a12;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke;
  v34[3] = &unk_1E4645568;
  v35 = v19;
  v36 = self;
  v37 = v18;
  v38 = v20;
  v39 = v21;
  v40 = v22;
  v43 = a10;
  v41 = v23;
  v42 = v24;
  v45 = a9;
  v44 = a8;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = v20;
  v30 = v18;
  v31 = v19;
  v32 = v24;
  objc_msgSend(v25, "getGSTokenWithCompletionHandler:", v34);

}

void __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int v32;
  char v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v8 = v7;
    v23 = v6;
    if (v7)
      v9 = v7;
    else
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v9;

    v34[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("X-Apple-GS-Token"));

    v14 = *(void **)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *MEMORY[0x1E0C92BC8];
    v18 = *(_DWORD *)(a1 + 96);
    v20 = *(_QWORD *)(a1 + 72);
    v19 = *(_QWORD *)(a1 + 80);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_3;
    v24[3] = &unk_1E4645540;
    v33 = *(_BYTE *)(a1 + 104);
    v24[4] = v14;
    v25 = v13;
    v26 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 56);
    v28 = *(id *)(a1 + 64);
    v29 = *(id *)(a1 + 72);
    v32 = *(_DWORD *)(a1 + 100);
    v30 = *(id *)(a1 + 80);
    v31 = *(id *)(a1 + 88);
    HIDWORD(v22) = v18;
    LOBYTE(v22) = 1;
    LODWORD(v21) = v17;
    objc_msgSend(v14, "performHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:requiresMescalSigning:requiresAuthKitHeaders:networkEventType:callbackQueue:completion:", v25, v11, v15, v16, v20, 1, v21, v22, v19, v24);

    v6 = v23;
  }
  else
  {
    v10 = *(id *)(a1 + 88);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v6);
  }

}

void __185__FCEndpointConnection_performAuthenticatedHTTPRequestWithURL_valuesByHTTPHeaderField_method_data_contentType_priority_reauthenticateIfNeeded_networkEventType_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  double v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "statusCode") != 401 && objc_msgSend(v7, "statusCode") != 434;
  if (!*(_BYTE *)(a1 + 100) || v9)
  {
    v12 = *(_QWORD *)(a1 + 88);
    if (v12)
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v13, v7, v8);
  }
  else
  {
    +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateGSTokenCache");

    LODWORD(v11) = *(_DWORD *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 32), "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, v11, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  }

}

- (NFLazy)lazySession
{
  return self->_lazySession;
}

- (void)setLazySession:(id)a3
{
  objc_storeStrong((id *)&self->_lazySession, a3);
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_lazySession, 0);
}

@end
