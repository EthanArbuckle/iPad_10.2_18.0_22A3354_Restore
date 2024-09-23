@implementation GEOWiFiQualityServiceRemoteProxy

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  int BOOL;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v11, "networkSearches");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  BOOL = GEOConfigGetBOOL(GeoServicesConfig_WiFiQualityNetworkDisabled, (uint64_t)off_1EDF4DCC8);
  if (v17
    && BOOL
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("WiFiQualityService - Network lookup is administratively disabled")), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = (void *)v19;
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v20;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "ticket submit failed with early out error : %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke;
    block[3] = &unk_1E1BFF970;
    v33 = v20;
    v34 = v15;
    v22 = v20;
    v23 = v15;
    dispatch_async(v14, block);

    v24 = v34;
  }
  else
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 19, CFSTR("GEOWiFiQualityService"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v35[0] = CFSTR("wifireq");
    objc_msgSend(v11, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = CFSTR("wifireqid");
    v36[0] = v25;
    v36[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("wifiqualsvc.submit"), CFSTR("message"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("userInfo"));
    objc_msgSend(v13, "proxiedBundleId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
    {
      objc_msgSend(v13, "proxiedBundleId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("proxiedBundleId"));

    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke_2;
    v30[3] = &unk_1E1C02190;
    v31 = v15;
    v29 = v15;
    objc_msgSend(v23, "sendDictionary:withReply:handler:", v24, v14, v30);

  }
}

uint64_t __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __116__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityServiceRequest_requestId_auditToken_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  GEOWiFiQualityServiceResponse *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "ticket submit failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("wifiresp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOWiFiQualityServiceResponse initWithData:]([GEOWiFiQualityServiceResponse alloc], "initWithData:", v8);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "ticket submit completed successfully", (uint8_t *)&v10, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (GEOConfigGetBOOL(GeoServicesConfig_WiFiQualityTileDisabled, (uint64_t)off_1EDF4DCD8))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -6, CFSTR("WiFiQualityService - Tile load is administratively disabled"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke;
    block[3] = &unk_1E1C01358;
    v35 = v19;
    v36 = v18;
    v34 = v13;
    v20 = v13;
    v21 = v18;
    v22 = v19;
    dispatch_async(v17, block);

    v23 = v36;
  }
  else
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 19, CFSTR("GEOWiFiQualityService"), 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, CFSTR("wifitk"));
    v29 = v15;
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("wifireqid"));
    if (v14)
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("wifiet"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("wifiqualsvc.tile"), CFSTR("message"));
    v24 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("userInfo"));

    objc_msgSend(v16, "proxiedBundleId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      objc_msgSend(v16, "proxiedBundleId");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, CFSTR("proxiedBundleId"));

    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke_2;
    v30[3] = &unk_1E1C052D0;
    v31 = v13;
    v32 = v18;
    v28 = v13;
    v23 = v18;
    objc_msgSend(v22, "sendDictionary:withReply:handler:", v20, v17, v30);

    v15 = v29;
  }

}

uint64_t __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

void __121__GEOWiFiQualityServiceRemoteProxy_submitWiFiQualityTileLoadForKey_eTag_requestId_auditToken_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "ticket submit failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
    v8 = 0;
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("wifitd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("wifiet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "ticket submit completed successfully", (uint8_t *)&v10, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelRequestId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 19, CFSTR("GEOWiFiQualityService"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("wifireqid");
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("message");
  v8[1] = CFSTR("userInfo");
  v9[0] = CFSTR("wifiqualsvc.cancel");
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOXPCConnection defaultXPCServerConnectionQueue](GEOXPCConnection, "defaultXPCServerConnectionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendDictionary:withReply:handler:", v6, v7, &__block_literal_global_35);
}

void __52__GEOWiFiQualityServiceRemoteProxy_cancelRequestId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOWiFiQualityService");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "ticket cancellation request failed with error: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

@end
