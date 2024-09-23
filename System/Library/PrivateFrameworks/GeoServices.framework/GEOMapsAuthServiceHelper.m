@implementation GEOMapsAuthServiceHelper

- (void)checkNetworkError:(id)a3 sendingGeoDErrorIfApplicable:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *global_queue;
  _QWORD block[5];
  id v13;
  int64_t v14;

  v6 = a3;
  if (v6)
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInternalInstall");

    if (v8)
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB32E8]))
      {
        v10 = objc_msgSend(v6, "code");

        if (v10 == -1003)
        {
          global_queue = geo_get_global_queue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke;
          block[3] = &unk_1E1C01420;
          block[4] = self;
          v13 = v6;
          v14 = a4;
          dispatch_async(global_queue, block);

        }
      }
      else
      {

      }
    }
  }

}

+ (GEOMapsAuthServiceHelper)sharedAuthHelper
{
  if (qword_1ECDBCCA0 != -1)
    dispatch_once(&qword_1ECDBCCA0, &__block_literal_global_40_2);
  return (GEOMapsAuthServiceHelper *)(id)qword_1ECDBCC98;
}

void __44__GEOMapsAuthServiceHelper_sharedAuthHelper__block_invoke()
{
  GEOMapsAuthServiceHelper *v0;
  void *v1;

  v0 = objc_alloc_init(GEOMapsAuthServiceHelper);
  v1 = (void *)qword_1ECDBCC98;
  qword_1ECDBCC98 = (uint64_t)v0;

}

- (GEOMapsAuthServiceHelper)init
{
  GEOMapsAuthServiceHelper *v2;
  GEOMapsAuthServiceHelper *v3;
  uint64_t v4;
  geo_isolater *currentEnvironmentStateIsolater;
  void *v6;
  void *global_queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOMapsAuthServiceHelper;
  v2 = -[GEOMapsAuthServiceHelper init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentEnvironmentState = 0;
    v4 = geo_isolater_create();
    currentEnvironmentStateIsolater = v3->_currentEnvironmentStateIsolater;
    v3->_currentEnvironmentStateIsolater = (geo_isolater *)v4;

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    global_queue = (void *)geo_get_global_queue();
    objc_msgSend(v6, "addTileGroupObserver:queue:", v3, global_queue);

  }
  return v3;
}

- (void)addMapsAuthDidFinishObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_mapsAuthTokenRequestDidFinish_, CFSTR("MapsAuthDidFinishNotification"), 0);

}

- (void)addMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_mapsAuthTokenRequestDidFinish_, CFSTR("MapsAuthDidFinishNotification"), v6);

}

- (void)removeMapsAuthDidFinishObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", v4, CFSTR("MapsAuthDidFinishNotification"), 0);

}

- (void)removeMapsAuthDidFinishObserver:(id)a3 forRequestType:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v7, CFSTR("MapsAuthDidFinishNotification"), v6);

}

- (void)sendProxyAuthNotification:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__GEOMapsAuthServiceHelper_sendProxyAuthNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___GEOUserNotificationProvider__8l;
  v3[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "geo_withMapsNotificationProviderDaemon:errorHandler:", v3, &__block_literal_global_49_0);
}

uint64_t __54__GEOMapsAuthServiceHelper_sendProxyAuthNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proxyAuthFailed:", *(_QWORD *)(a1 + 32));
}

- (void)renewMapsAuthProxyToken:(unint64_t)a3 fromToken:(id)a4 authProxyURL:(id)a5 suppressNotification:(BOOL)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  atomic_flag *p_isRenewing;
  unsigned __int8 v14;
  NSString *currentToken;
  void (**v16)(_QWORD, _QWORD);
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[6];
  BOOL v32;
  _QWORD v33[5];
  __CFString *v34;
  const __CFString *v35;
  id v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (__CFString *)a5;
  if (a3)
    v12 = CFSTR("mrt");
  else
    v12 = CFSTR("actoken");
  p_isRenewing = &self->_isRenewing;
  do
    v14 = __ldaxr((unsigned __int8 *)p_isRenewing);
  while (__stlxr(1u, (unsigned __int8 *)p_isRenewing));
  if ((v14 & 1) == 0)
  {
    currentToken = self->_currentToken;
    self->_currentToken = &v12->isa;

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke;
    v33[3] = &unk_1E1C216C0;
    v33[4] = self;
    v34 = v12;
    v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D765024](v33);
    GEOGetMapsProxyAuthLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v12;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_DEBUG, "renewing token %@", buf, 0xCu);
    }

    if (a3 != 1 || v10)
    {
      if (a3 || !v10)
      {
LABEL_30:

        goto LABEL_31;
      }
      _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1EDF4CDB8, 0, 0, 0);
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v37 = CFSTR("actoken");
      v38 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _buildRequest(v11, CFSTR("v2/actoken"), v25, 0);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v10 = (id)v24;
    }
    else
    {
      _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 1, 0, 0, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        if (!a6)
        {
          GEOGetMapsProxyAuthLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, "sending proxy notificaiton for bad mrt because mrt is nil", buf, 2u);
          }

          -[GEOMapsAuthServiceHelper sendProxyAuthNotification:](self, "sendProxyAuthNotification:", 2);
        }
        v16[2](v16, 2);
        v10 = 0;
        goto LABEL_30;
      }
      v10 = (id)v18;
      _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1EDF4CDB8, 0, 0, 0);
      v35 = CFSTR("mrt");
      v36 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _buildRequest(v11, CFSTR("v2/mrt"), v19, 0);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    if (v20)
    {
      _defaultURLSession();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke_54;
      v31[3] = &unk_1E1C216E8;
      v31[4] = self;
      v31[5] = a3;
      v32 = a6;
      objc_msgSend(v26, "dataTaskWithRequest:completionHandler:", v20, v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        GEOGetMapsProxyAuthLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v20;
          _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "token exhange task is nil, request was %@", buf, 0xCu);
        }

        v16[2](v16, 0);
      }
      objc_msgSend(v27, "resume");

    }
    else
    {
      GEOGetMapsProxyAuthLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v11;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "Unable to build request for URL: %@", buf, 0xCu);
      }

      v16[2](v16, 5);
    }

    goto LABEL_30;
  }
  GEOGetMapsProxyAuthLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = self->_currentToken;
    *(_DWORD *)buf = 138412546;
    v42 = (__CFString *)v22;
    v43 = 2112;
    v44 = v12;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "already renewing token %@, will not renew %@", buf, 0x16u);
  }

  if ((-[NSString isEqual:](self->_currentToken, "isEqual:", v12) & 1) == 0)
  {
    v39 = CFSTR("failReason");
    v40 = &unk_1E1E81EF8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:]((uint64_t)self, 0, v12, v23, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);

  }
LABEL_31:

}

void __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v10 = CFSTR("failReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:](v7, 0, v6, v9, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);

}

void __96__GEOMapsAuthServiceHelper_renewMapsAuthProxyToken_fromToken_authProxyURL_suppressNotification___block_invoke_54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  _BYTE v48[48];
  __int128 buf;
  void (*v50)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v51;
  void *v52;
  __CFString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a2;
  GEOGetMapsProxyAuthLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    _responseDescription(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "auth response: %@", (uint8_t *)&buf, 0xCu);

  }
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(unsigned __int8 *)(a1 + 48);
  v15 = v7;
  v16 = v9;
  v17 = v8;
  if (v12)
  {
    v18 = _httpStatusCodeSafe(v15);
    v50 = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke;
    v51 = &unk_1E1C21710;
    v19 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    if (v13)
      v20 = CFSTR("mrt");
    else
      v20 = CFSTR("actoken");
    v52 = v12;
    v53 = (__CFString *)v20;
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D765024](&buf);
    if (!v17 && (unint64_t)(v18 - 200) <= 0x63)
    {
      v45 = v16;
      v47 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, &v47);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v47;
      if (v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        GEOGetMapsProxyAuthLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v15);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v48 = 138413058;
          *(_QWORD *)&v48[4] = v20;
          *(_WORD *)&v48[12] = 2112;
          *(_QWORD *)&v48[14] = v22;
          *(_WORD *)&v48[22] = 2112;
          *(_QWORD *)&v48[24] = v23;
          *(_WORD *)&v48[32] = 2112;
          *(_QWORD *)&v48[34] = v38;
          _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_ERROR, "Response for %@ was not a json dict: %@ / %@ (response: %@)", v48, 0x2Au);

        }
        v21[2](v21, 0, 0, GEOConfigKey_Invalid, *(_QWORD *)algn_1EDF51968, 0);
        goto LABEL_40;
      }
      objc_msgSend(v22, "objectForKey:", CFSTR("mapsRefreshToken"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("mapsAccessToken"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        GEOGetMapsProxyAuthLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v15);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v48 = 138412802;
          *(_QWORD *)&v48[4] = v24;
          *(_WORD *)&v48[12] = 2112;
          *(_QWORD *)&v48[14] = v44;
          *(_WORD *)&v48[22] = 2112;
          *(_QWORD *)&v48[24] = v41;
          _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_ERROR, "Response included an invalid type for mrt/mat: %@/%@  (response: %@)", v48, 0x20u);

        }
        goto LABEL_57;
      }
      if (!v13)
        goto LABEL_61;
      if (v13 != 1)
      {
LABEL_19:
        GEOGetMapsProxyAuthLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v48 = 138412290;
          *(_QWORD *)&v48[4] = v20;
          _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "newTokenResponse succeeded for %@", v48, 0xCu);
        }

        v26 = objc_msgSend(v44, "length");
        if (v26)
          v27 = &GeoServicesConfig_MapsAuthToken;
        else
          v27 = &GeoServicesConfig_MapsRefreshToken;
        v28 = *v27;
        v29 = (uint64_t *)&off_1EDF4CDC8;
        if (v26)
          v29 = (uint64_t *)&off_1EDF4CDB8;
        v30 = *v29;
        *(_QWORD *)v48 = v19;
        *(_QWORD *)&v48[8] = 3221225472;
        *(_QWORD *)&v48[16] = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_59;
        *(_QWORD *)&v48[24] = &unk_1E1C00738;
        *(_QWORD *)&v48[32] = v24;
        *(_QWORD *)&v48[40] = v44;
        ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *))v21)[2](v21, 1, -1, v28, v30, v48);

        goto LABEL_58;
      }
      if (!objc_msgSend(v44, "length"))
      {
        GEOGetMapsProxyAuthLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v15);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v48 = 138412802;
          *(_QWORD *)&v48[4] = v20;
          *(_WORD *)&v48[12] = 2112;
          *(_QWORD *)&v48[14] = v22;
          *(_WORD *)&v48[22] = 2112;
          *(_QWORD *)&v48[24] = v42;
          v43 = "Response for %@ did not include an mat: %@ (response: %@)";
          goto LABEL_56;
        }
      }
      else
      {
LABEL_61:
        if (objc_msgSend(v24, "length"))
          goto LABEL_19;
        GEOGetMapsProxyAuthLog();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v15);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v48 = 138412802;
          *(_QWORD *)&v48[4] = v20;
          *(_WORD *)&v48[12] = 2112;
          *(_QWORD *)&v48[14] = v22;
          *(_WORD *)&v48[22] = 2112;
          *(_QWORD *)&v48[24] = v42;
          v43 = "Response for %@ did not include an mrt: %@ (response: %@)";
LABEL_56:
          _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_ERROR, v43, v48, 0x20u);

        }
      }
LABEL_57:

      v21[2](v21, 0, 0, GEOConfigKey_Invalid, *(_QWORD *)algn_1EDF51968, 0);
LABEL_58:

LABEL_40:
      v16 = v45;
LABEL_48:

      goto LABEL_49;
    }
    v46 = v17;
    v31 = v16;
    GEOGetMapsProxyAuthLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      _responseDescription(v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v48 = 138413058;
      *(_QWORD *)&v48[4] = v20;
      *(_WORD *)&v48[12] = 1024;
      *(_DWORD *)&v48[14] = v18;
      *(_WORD *)&v48[18] = 2112;
      *(_QWORD *)&v48[20] = v46;
      *(_WORD *)&v48[28] = 2112;
      *(_QWORD *)&v48[30] = v33;
      _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_ERROR, "Response for %@ received status code %d and error %@ (response: %@)", v48, 0x26u);

    }
    if (v13 == 1)
    {
      v36 = 2;
      v16 = v31;
      if (!v14)
        goto LABEL_44;
    }
    else
    {
      v16 = v31;
      if (!v13)
      {
        if (_GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8))
        {
          GEOGetMapsProxyAuthLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            _responseDescription(v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v48 = 138412290;
            *(_QWORD *)&v48[4] = v35;
            _os_log_impl(&dword_1885A9000, v34, OS_LOG_TYPE_ERROR, "Removing old mrt as ACToken received an error (response: %@)", v48, 0xCu);

            v16 = v31;
          }

          _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 0, 0, 0);
        }
        v36 = 3;
        if (v14)
          goto LABEL_47;
        goto LABEL_44;
      }
      v36 = 0;
      if (!v14)
      {
LABEL_44:
        GEOGetMapsProxyAuthLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v36;
          _os_log_impl(&dword_1885A9000, v39, OS_LOG_TYPE_DEBUG, "sending proxy notificaiton for reason: %d", v48, 8u);
        }

        objc_msgSend(v12, "sendProxyAuthNotification:", v36);
        v16 = v31;
      }
    }
LABEL_47:
    v21[2](v21, 0, v36, GEOConfigKey_Invalid, *(_QWORD *)algn_1EDF51968, 0);
    v17 = v46;
    goto LABEL_48;
  }
LABEL_49:

}

void __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v18 = CFSTR("failReason");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = a6;
  objc_msgSend(v13, "numberWithInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_2;
  v17[3] = &unk_1E1BFF6F8;
  v17[4] = *(_QWORD *)(a1 + 32);
  -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:](v11, a2, v12, v16, a4, a5, v14, v17);

}

void __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)_postNotificationSuccess:(void *)a3 requestType:(void *)a4 extraInfo:(uint64_t)a5 waitForKey:(uint64_t)a6 updateKeys:(void *)a7 completion:(void *)a8
{
  uint64_t (*v14)(uint64_t, uint64_t);
  void (**v15)(_QWORD);
  id v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  id v32;
  _QWORD block[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  id v38;
  void (**v39)(_QWORD);
  _BYTE *v40;
  char v41;
  _QWORD v42[5];
  id v43;
  id v44;
  char v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[2];
  _QWORD v51[5];

  v51[2] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = v16;
  if (a1)
  {
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke;
    v42[3] = &unk_1E1C217B0;
    v44 = v16;
    v42[4] = a1;
    v45 = a2;
    v18 = v32;
    v43 = v18;
    v19 = (void (**)(_QWORD))MEMORY[0x18D765024](v42);
    GEOGetMapsProxyAuthLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = "failure";
      *(_DWORD *)buf = 136315650;
      if ((_DWORD)a2)
        v21 = "success";
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v47 = v14;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "Enqueuing %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
    }

    v50[0] = CFSTR("success");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = CFSTR("requestType");
    v51[0] = v22;
    v51[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count") + 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addEntriesFromDictionary:", v14);
      objc_msgSend(v24, "addEntriesFromDictionary:", v23);
      v25 = objc_msgSend(v24, "copy");

      v23 = (void *)v25;
    }
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("MapsAuthDidFinishNotification"), v18, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a2 && (_DWORD)a5 && a6)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v47 = __Block_byref_object_copy__103;
      v48 = __Block_byref_object_dispose__103;
      v49 = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_93;
      v35[3] = &unk_1E1C217D8;
      v40 = buf;
      v39 = v19;
      v41 = a2;
      v36 = v18;
      v37 = v14;
      v38 = v26;
      _GEOConfigAddBlockListenerForKey(a5, a6, MEMORY[0x1E0C80D38], v35);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v27;

      if (v15)
        v15[2](v15);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (v15)
        v15[2](v15);
      v19[2](v19);
      GEOGetMapsProxyAuthLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = "failure";
        *(_DWORD *)buf = 136315650;
        if ((_DWORD)a2)
          v30 = "success";
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v47 = v14;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "Posting %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_96;
      block[3] = &unk_1E1BFF6F8;
      v34 = v26;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

uint64_t __87__GEOMapsAuthServiceHelper__processResponse_data_tokenType_error_suppressNotification___block_invoke_59(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, *(void **)(a1 + 32), 1, 0);
  if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v2 = *(void **)(a1 + 40);
    v3 = GeoServicesConfig_MapsAuthToken;
    v4 = off_1EDF4CDB8;
    v5 = 1;
  }
  else
  {
    v3 = GeoServicesConfig_MapsAuthToken;
    v4 = off_1EDF4CDB8;
    v2 = 0;
    v5 = 0;
  }
  return _setValue(v3, (uint64_t)v4, v2, v5, 0);
}

- (void)requestFeatureFlagsWithURL:(id)a3 suppressNotification:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOGetMapsProxyAuthLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "requesting client feature flags", buf, 2u);
  }

  if (!v6)
  {
    GEOGetURLWithSource(51, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 1, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (objc_msgSend(v8, "length"))
    {
      v22 = CFSTR("mrt");
      v23 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _buildRequest(v6, CFSTR("v2/clientfeatureflags"), v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      _defaultURLSession();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __76__GEOMapsAuthServiceHelper_requestFeatureFlagsWithURL_suppressNotification___block_invoke;
      v17[3] = &unk_1E1C14C80;
      v17[4] = self;
      objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v11, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        GEOGetMapsProxyAuthLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = CFSTR("clientfeatureflags");
          v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "%@ task is nil for request: %@", buf, 0x16u);
        }

      }
      objc_msgSend(v13, "resume");

      goto LABEL_28;
    }
    GEOGetMapsProxyAuthLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "mrt is nil requesting client feature flags";
      goto LABEL_16;
    }
  }
  else
  {
    GEOGetMapsProxyAuthLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "affURL is nil";
LABEL_16:
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    }
  }

  if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8))
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, 0, 0, 0);
  if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08))
    _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, 0, 0, 0);
  _setValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1EDF4DE58, 0, 0, 0);
  v11 = 0;
  if (!v6)
  {
    v24 = CFSTR("failReason");
    v25[0] = &unk_1E1E81F10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self)
    -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:]((uint64_t)self, 0, CFSTR("clientfeatureflags"), v11, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);
  if (v6 && !a4)
    -[GEOMapsAuthServiceHelper sendProxyAuthNotification:](self, "sendProxyAuthNotification:", 2);
LABEL_28:

}

void __76__GEOMapsAuthServiceHelper_requestFeatureFlagsWithURL_suppressNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  unint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  unint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void (**v67)(_QWORD, _QWORD, _QWORD);
  id v68;
  id v69;
  void *v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[5];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[2];
  _QWORD v87[2];
  uint8_t v88[4];
  void *v89;
  uint8_t buf[4];
  _BYTE v91[28];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a2;
  GEOGetMapsProxyAuthLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    _responseDescription(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v91 = v11;
    _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "ff response: %@", buf, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v7;
  v15 = v8;
  if (v12)
  {
    v16 = _httpStatusCodeSafe(v14);
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke;
    v79[3] = &unk_1E1C21738;
    v79[4] = v12;
    v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x18D765024](v79);
    if (v15 || (unint64_t)(v16 - 200) > 0x63)
    {
      GEOGetMapsProxyAuthLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        _responseDescription(v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v91 = v16;
        *(_WORD *)&v91[4] = 2112;
        *(_QWORD *)&v91[6] = v15;
        *(_WORD *)&v91[14] = 2112;
        *(_QWORD *)&v91[16] = v26;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_ERROR, "Feature Flag received status code %d and error %@ (response: %@)", buf, 0x1Cu);

      }
      v17[2](v17, 0, 0);
    }
    else
    {
      v78 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v78);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v78;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || v19)
      {
        GEOGetMapsProxyAuthLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v14);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v91 = v18;
          *(_WORD *)&v91[8] = 2112;
          *(_QWORD *)&v91[10] = v19;
          *(_WORD *)&v91[18] = 2112;
          *(_QWORD *)&v91[20] = v28;
          _os_log_impl(&dword_1885A9000, v27, OS_LOG_TYPE_ERROR, "Feature Flag response was not json format: %@ %@ (response: %@)", buf, 0x20u);

        }
        v17[2](v17, 0, 0);
      }
      else
      {
        objc_msgSend(v18, "objectForKey:", CFSTR("clientFeatureFlags"));
        v20 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v70 = (void *)v20;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v18;
          _getValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, 1, 0, 0, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
          {
            v24 = objc_msgSend(v22, "mutableCopy");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v24 = objc_claimAutoreleasedReturnValue();
          }
          v31 = (void *)v24;
          v64 = v23;
          v65 = v21;
          v66 = v18;
          v67 = v17;
          v68 = v14;
          v69 = v13;
          v32 = v21;
          if (!v21)
          {
            _getValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, 1, 0, 0, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v32;
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("clientFeatureFlags"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          obj = v33;
          v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, buf, 16);
          if (v73)
          {
            v72 = *(_QWORD *)v81;
            v34 = CFSTR("isDefaultOn");
            v35 = CFSTR("userOn");
            v36 = 0x1E0CB3000uLL;
            while (2)
            {
              for (i = 0; i != v73; ++i)
              {
                if (*(_QWORD *)v81 != v72)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("name"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  GEOGetMapsProxyAuthLog();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v88 = 138412290;
                    v89 = v39;
                    _os_log_impl(&dword_1885A9000, v57, OS_LOG_TYPE_ERROR, "featureName %@ is not NSString", v88, 0xCu);
                  }

                  goto LABEL_43;
                }
                objc_msgSend(v74, "addObject:", v39);
                objc_msgSend(v38, "objectForKeyedSubscript:", v34);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v77 = v40;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = objc_msgSend(v40, "BOOLValue");
                }
                else
                {
                  GEOGetMapsProxyAuthLog();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v88 = 138412290;
                    v89 = v40;
                    _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_ERROR, "isDefaultOn %@ is not NSNumber", v88, 0xCu);
                  }

                  v41 = 0;
                }
                objc_msgSend(v31, "objectForKeyedSubscript:", v39);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v35);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (v44)
                {
                  v46 = objc_msgSend(v44, "BOOLValue");
                  v84[0] = v35;
                  objc_msgSend(*(id *)(v36 + 2024), "numberWithBool:", v46);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v85[0] = v76;
                  v84[1] = v34;
                  objc_msgSend(*(id *)(v36 + 2024), "numberWithBool:", v41);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v85[1] = v47;
                  v84[2] = CFSTR("active");
                  objc_msgSend(*(id *)(v36 + 2024), "numberWithBool:", v46);
                  v75 = v45;
                  v48 = i;
                  v49 = v39;
                  v50 = v43;
                  v51 = v36;
                  v52 = v35;
                  v53 = v34;
                  v54 = v31;
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v85[2] = v55;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();

                  v31 = v54;
                  v34 = v53;
                  v35 = v52;
                  v36 = v51;
                  v43 = v50;
                  v39 = v49;
                  i = v48;
                  v45 = v75;
                }
                else
                {
                  v86[0] = v34;
                  objc_msgSend(*(id *)(v36 + 2024), "numberWithBool:", v41);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  v86[1] = CFSTR("active");
                  v87[0] = v76;
                  objc_msgSend(*(id *)(v36 + 2024), "numberWithBool:", v41);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v87[1] = v47;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                }

                objc_msgSend(v31, "setObject:forKeyedSubscript:", v56, v39);
              }
              v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, buf, 16);
              if (v73)
                continue;
              break;
            }
          }
LABEL_43:

          v58 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v31, "allKeys");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setWithArray:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "minusSet:", v74);
          objc_msgSend(v60, "allObjects");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObjectsForKeys:", v61);

          if (v64 && (objc_msgSend(v64, "isEqual:", v31) & 1) != 0)
            v62 = 0;
          else
            v62 = v31;
          v14 = v68;
          v13 = v69;
          v17 = v67;
          v15 = 0;
          v19 = 0;
          v18 = v66;

          ((void (**)(_QWORD, id, id))v17)[2](v17, v65, v62);
        }
        else
        {
          GEOGetMapsProxyAuthLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            _responseDescription(v14);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v91 = v70;
            *(_WORD *)&v91[8] = 2112;
            *(_QWORD *)&v91[10] = v30;
            _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "featuresInfo is not an array: %@ (response: %@)", buf, 0x16u);

          }
          v17[2](v17, 0, 0);
        }

      }
    }

  }
}

void __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  _BOOL4 v8;
  uint64_t v9;
  BOOL v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = v5 != 0;
  v8 = v6 != 0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = !v7 || !v8;
  if (v7 && v8)
    v11 = &GeoServicesConfig_ClientAuthFeatureFlagsStateInfo;
  else
    v11 = &GEOConfigKey_Invalid;
  v12 = *v11;
  v13 = (uint64_t *)&off_1EDF4DE08;
  if (v10)
    v13 = (uint64_t *)algn_1EDF51968;
  v14 = *v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke_2;
  v17[3] = &unk_1E1C00738;
  v18 = v5;
  v19 = v6;
  v15 = v6;
  v16 = v5;
  -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:](v9, v7, CFSTR("clientfeatureflags"), 0, v12, v14, v17, 0);

}

void __74__GEOMapsAuthServiceHelper__handleFeatureFlagResponseData_response_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, v2, 1, 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _setValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1EDF4DE58, v3, 1, 0);

  }
  else
  {
    _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, 0, 0, 0);
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
    _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, v4, 1, 0);
}

- (void)doEnvironmentSwitchCheck:(id)a3 authProxyURL:(id)a4 suppressNotification:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 1, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v26 = CFSTR("mrt");
      v27 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("environment");
      v25 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _buildRequest(v9, CFSTR("v2/environmentswitch"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        _defaultURLSession();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke;
        v17[3] = &unk_1E1C21760;
        v19 = a5;
        v17[4] = self;
        v18 = v8;
        objc_msgSend(v14, "dataTaskWithRequest:completionHandler:", v13, v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          GEOGetMapsProxyAuthLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v13;
            _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "token exhange task is nil for request: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v15, "resume");

      }
      else
      {
        v22[0] = CFSTR("failReason");
        v22[1] = CFSTR("environment");
        v23[0] = &unk_1E1E81F10;
        v23[1] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (self)
          -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:]((uint64_t)self, 0, CFSTR("environmentswitch"), v14, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);
      }

    }
    else
    {
      v28[0] = CFSTR("failReason");
      v28[1] = CFSTR("environment");
      v29[0] = &unk_1E1E81F40;
      v29[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:]((uint64_t)self, 0, CFSTR("environmentswitch"), v13, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);
    }

  }
  else
  {
    v30[0] = CFSTR("failReason");
    v30[1] = CFSTR("environment");
    v31[0] = &unk_1E1E81F28;
    v31[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:]((uint64_t)self, 0, CFSTR("environmentswitch"), v10, GEOConfigKey_Invalid, *(uint64_t *)algn_1EDF51968, 0, 0);
  }

}

void __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  unsigned int v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  const __CFString *v48;
  __int16 v49;
  _BYTE v50[28];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v40 = a2;
  v7 = a3;
  v8 = a4;
  GEOGetMapsProxyAuthLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    _responseDescription(v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v10;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "env response: %@", buf, 0xCu);

  }
  v11 = _httpStatusCodeSafe(v7);
  v12 = v11;
  v13 = GEOConfigKey_Invalid;
  v14 = *(void **)algn_1EDF51968;
  if (v8 || (unint64_t)(v11 - 200) > 0x63)
  {
    v39 = 0;
    v16 = 0;
    v21 = 2;
    if ((unint64_t)(v11 - 400) < 2 || v11 == 407)
      goto LABEL_33;
    if (v11 != 423)
    {
      GEOGetMapsProxyAuthLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        _responseDescription(v7);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v48 = CFSTR("environmentswitch");
        v49 = 1024;
        *(_DWORD *)v50 = v12;
        *(_WORD *)&v50[4] = 2112;
        *(_QWORD *)&v50[6] = v8;
        *(_WORD *)&v50[14] = 2112;
        *(_QWORD *)&v50[16] = v25;
        _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "Response for %@ received status code %d and error %@ (response: %@)", buf, 0x26u);

      }
      v16 = 0;
      v39 = 0;
      goto LABEL_32;
    }
    v16 = 0;
    v39 = 0;
    v21 = 4;
LABEL_33:
    if (!*(_BYTE *)(a1 + 48))
    {
      GEOGetMapsProxyAuthLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "sending proxy notificaiton", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "sendProxyAuthNotification:", v21);
    }
    GEOGetMapsProxyAuthLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = v16;
      v32 = v13;
      if (v39)
        v33 = "succeeded";
      else
        v33 = "failed";
      v38 = v8;
      v34 = *(_QWORD *)(a1 + 40);
      _responseDescription(v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v48 = CFSTR("environmentswitch");
      v49 = 2080;
      *(_QWORD *)v50 = v33;
      v13 = v32;
      v16 = v31;
      *(_WORD *)&v50[8] = 2112;
      *(_QWORD *)&v50[10] = v34;
      v8 = v38;
      *(_WORD *)&v50[18] = 2112;
      *(_QWORD *)&v50[20] = v35;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEBUG, "%@ %s for %@ (response: %@)", buf, 0x2Au);

    }
    v36 = *(_QWORD *)(a1 + 32);
    v45[0] = CFSTR("failReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v45[1] = CFSTR("environment");
    v46[0] = v15;
    v46[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
    v22 = objc_claimAutoreleasedReturnValue();
    -[GEOMapsAuthServiceHelper _postNotificationSuccess:requestType:extraInfo:waitForKey:updateKeys:completion:](v36, v39, CFSTR("environmentswitch"), v22, v13, (uint64_t)v14, v16, 0);
    goto LABEL_43;
  }
  if (!objc_msgSend(v40, "length"))
  {
    v16 = 0;
    v21 = 0;
    v39 = 1;
    goto LABEL_33;
  }
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v40, 0, &v44);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v44;
  if (!v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFString objectForKey:](v15, "objectForKey:", CFSTR("mapsRefreshToken"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKey:](v15, "objectForKey:", CFSTR("mapsAccessToken"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v37 = v18;
        v26 = v17;
        GEOGetMapsProxyAuthLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v7);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v19 = (__CFString *)v26;
          v48 = v26;
          v49 = 2112;
          v18 = v37;
          *(_QWORD *)v50 = v37;
          *(_WORD *)&v50[8] = 2112;
          *(_QWORD *)&v50[10] = v27;
          v28 = "Response included an invalid type for mrt/mat: %@/%@ (response: %@)";
LABEL_29:
          _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, v28, buf, 0x20u);

          v16 = 0;
          v39 = 0;
          goto LABEL_31;
        }
      }
      else
      {
        if (-[__CFString length](v17, "length") && objc_msgSend(v18, "length"))
        {
          v13 = GeoServicesConfig_MapsAuthToken;
          v14 = off_1EDF4CDB8;
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke_68;
          v41[3] = &unk_1E1C00738;
          v42 = v17;
          v43 = v18;
          v19 = v17;
          v16 = (id)MEMORY[0x18D765024](v41);

          v39 = 1;
          v20 = v42;
LABEL_31:

LABEL_32:
          v21 = 0;
          goto LABEL_33;
        }
        v37 = v18;
        v26 = v17;
        GEOGetMapsProxyAuthLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          _responseDescription(v7);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v19 = (__CFString *)v26;
          v48 = v26;
          v49 = 2112;
          v18 = v37;
          *(_QWORD *)v50 = v37;
          *(_WORD *)&v50[8] = 2112;
          *(_QWORD *)&v50[10] = v27;
          v28 = "Response for environtment switch returned invalid mrt/mat: %@/%@ (response: %@)";
          goto LABEL_29;
        }
      }
      v16 = 0;
      v39 = 0;
      v19 = (__CFString *)v26;
      v18 = v37;
      goto LABEL_31;
    }
  }
  GEOGetMapsProxyAuthLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    _responseDescription(v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v48 = v15;
    v49 = 2112;
    *(_QWORD *)v50 = v16;
    *(_WORD *)&v50[8] = 2112;
    *(_QWORD *)&v50[10] = v23;
    _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Response for environment check was not a json dict: %@ / %@ (response: %@)", buf, 0x20u);

  }
LABEL_43:

}

uint64_t __87__GEOMapsAuthServiceHelper_doEnvironmentSwitchCheck_authProxyURL_suppressNotification___block_invoke_68(uint64_t a1)
{
  _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, *(void **)(a1 + 32), 1, 0);
  return _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1EDF4CDB8, *(void **)(a1 + 40), 1, 0);
}

- (void)setConnectionProxyDictionary:(id)a3 url:(id)a4 proxyURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
  {
    GEOGetURLWithSource(39, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (GEOAuthProxyURLIsValid(v9))
  {
    objc_msgSend(v8, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("https"));

    if (v11)
    {
      v25[0] = *MEMORY[0x1E0C93238];
      objc_msgSend(v9, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v12;
      v25[1] = *MEMORY[0x1E0C93240];
      objc_msgSend(v9, "port");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setConnectionProxyDictionary:", v14);

      objc_msgSend(v7, "set_requiresSecureHTTPSProxyConnection:", 1);
    }
    else
    {
      GEOGetMapsProxyAuthLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = 138412290;
        v22 = v8;
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "url.scheme is not https when attempting to set proxy %@", (uint8_t *)&v21, 0xCu);
      }

    }
    objc_msgSend(v8, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) == 0)
    {
      GEOGetMapsProxyAuthLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 138412546;
        v22 = v9;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "proxyURL %@ scheme does not match URL %@ scheme", (uint8_t *)&v21, 0x16u);
      }

    }
    objc_msgSend(v7, "set_preventsSystemHTTPProxyAuthentication:", 1);
  }
  else
  {
    GEOGetMapsProxyAuthLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v9;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "aborting setting connectionProxyDictionary because proxyURL, proxyURL.host, or proxyURL.port is nil. proxyURL is %@", (uint8_t *)&v21, 0xCu);
    }

  }
}

- (void)addProxyAuthHeaderOrReAuth:(id)a3 authProxyURL:(id)a4
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = GeoServicesConfig_MapsAuthToken;
  v5 = off_1EDF4CDB8;
  v6 = a3;
  _getValue(v4, (uint64_t)v5, 1, 0, 0, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mat:%@"), v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Basic %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Proxy-Authorization"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("X-Env-Sec-Mat"));

}

- (void)handleSecureProxyChallenge:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  objc_msgSend(a3, "failureResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("X-Proxy-Missing-Group-Access"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  GEOGetMapsProxyAuthLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Missing group access challenge", buf, 2u);
    }

    -[GEOMapsAuthServiceHelper sendProxyAuthNotification:](self, "sendProxyAuthNotification:", 4);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Non-missing group access challenge - no valid mat, attempting to renew mrt and mat", v9, 2u);
    }

    -[GEOMapsAuthServiceHelper renewMapsAuthProxyToken:fromToken:authProxyURL:suppressNotification:](self, "renewMapsAuthProxyToken:fromToken:authProxyURL:suppressNotification:", 1, 0, 0, 0);
  }

}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  _QWORD v5[4];
  id v6;
  char v7;
  BOOL v8;
  BOOL v9;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = -[GEOMapsAuthServiceHelper _hasMRT](*(_QWORD *)(a1 + 32));
  v4 = -[GEOMapsAuthServiceHelper _hasMAT](*(_QWORD *)(a1 + 32));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_2;
  v5[3] = &unk_1E1C21788;
  v7 = *(_BYTE *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  geoAnalyticsSendEventLazy(CFSTR("com.apple.GeoServices.AuthResult"), v5);

}

- (BOOL)_hasMRT
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  _getValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 1, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)_hasMAT
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  _getValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1EDF4CDB8, 1, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

id __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = CFSTR("requestType");
  v8[2] = CFSTR("hasMRT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("hasMAT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_93(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  GEOConfigRemoveBlockListener(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  GEOGetMapsProxyAuthLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 72))
      v5 = "success";
    else
      v5 = "failure";
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Posting %s notification for action \"%@\" extraInfo: %@", buf, 0x20u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_94;
  block[3] = &unk_1E1BFF6F8;
  v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_94(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", *(_QWORD *)(a1 + 32));

}

void __108__GEOMapsAuthServiceHelper__postNotificationSuccess_requestType_extraInfo_waitForKey_updateKeys_completion___block_invoke_96(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", *(_QWORD *)(a1 + 32));

}

- (id)dictionaryForAuthTokenState
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEOMapsAuthServiceHelper _hasMAT]((uint64_t)self));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Has MAT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEOMapsAuthServiceHelper _hasMRT]((uint64_t)self));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Has MRT"));

  return v3;
}

- (void)invalidateTokens
{
  _setValue(GeoServicesConfig_MapsAuthToken, (uint64_t)off_1EDF4CDB8, 0, 0, 0);
  _setValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, 0, 0, 0);
}

- (BOOL)isCurrentEnvironmentSecure
{
  unint64_t currentEnvironmentState;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  geo_isolater *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = self->_currentEnvironmentStateIsolater;
  _geo_isolate_lock();
  currentEnvironmentState = self->_currentEnvironmentState;
  if (!currentEnvironmentState)
  {
    _GEOGetURLWithSource(39, 0, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
LABEL_19:
      currentEnvironmentState = 1;
LABEL_20:
      self->_currentEnvironmentState = currentEnvironmentState;
      goto LABEL_21;
    }
    currentEnvironmentState = self->_currentEnvironmentState;
    if (!currentEnvironmentState)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "activeTileGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tileSets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v8);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "useAuthProxy"))
            {
              self->_currentEnvironmentState = 2;
              goto LABEL_14;
            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_14:

      currentEnvironmentState = self->_currentEnvironmentState;
      if (!currentEnvironmentState)
      {
        v12 = 0;
        currentEnvironmentState = 2;
        while ((GEOURLRequestsAuthForURLType(v12) & 1) == 0)
        {
          if (++v12 == 66)
          {
            currentEnvironmentState = self->_currentEnvironmentState;
            if (currentEnvironmentState)
              goto LABEL_21;
            goto LABEL_19;
          }
        }
        goto LABEL_20;
      }
    }
  }
LABEL_21:
  _geo_isolate_unlock();

  return currentEnvironmentState == 2;
}

uint64_t __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "isCurrentEnvironmentSecure");
  if ((_DWORD)result)
  {
    GEOGetMapsProxyAuthLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Apple VPN connection appears to be down: %@", buf, 0xCu);
    }

    result = GEOConfigGetBOOL(GeoServicesConfig_InternalNetworkErrorAlertsEnabled, (uint64_t)off_1EDF4E0C8);
    if ((_DWORD)result)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_102;
      v5[3] = &__block_descriptor_40_e39_v16__0___GEOUserNotificationProvider__8l;
      v5[4] = *(_QWORD *)(a1 + 48);
      return objc_msgSend(MEMORY[0x1E0CB3B38], "geo_withMapsNotificationProviderDaemon:errorHandler:", v5, &__block_literal_global_103);
    }
  }
  return result;
}

uint64_t __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_102(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "geoDInternalError:", *(_QWORD *)(a1 + 32));
}

void __75__GEOMapsAuthServiceHelper_checkNetworkError_sendingGeoDErrorIfApplicable___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  GEOGetMapsProxyAuthLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "Unable to push internal geod error notification: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)GeoServicesConfig_MapsRefreshToken && a3.var1 == off_1EDF4CDC8)
    -[GEOMapsAuthServiceHelper _refreshFromTask:force:]((uint64_t)self, 0, 1);
}

- (void)_refreshFromTask:(char)a3 force:
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *global_operation_queue;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD block[5];
  _QWORD v29[5];

  v5 = a2;
  if (a1 && +[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke;
    v29[3] = &unk_1E1BFF6F8;
    v29[4] = a1;
    objc_msgSend(v5, "setCompletion:", v29);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_3;
    block[3] = &unk_1E1BFF6F8;
    block[4] = a1;
    if (qword_1ECDBCCA8 != -1)
      dispatch_once(&qword_1ECDBCCA8, block);
    GEOGetMonotonicTime();
    v8 = v7;
    if ((a3 & 1) != 0)
      goto LABEL_10;
    _getValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1EDF4DE58, 1, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || (objc_msgSend(v9, "timeIntervalSinceNow"), v11 >= -1800.0) || v8 - *(double *)&qword_1ECDBCCB0 <= 1800.0)
    {

      goto LABEL_11;
    }

    +[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isNetworkReachable");

    if (v13)
    {
LABEL_10:
      qword_1ECDBCCB0 = *(_QWORD *)&v8;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__103;
      v26 = __Block_byref_object_dispose__103;
      v27 = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      global_operation_queue = (void *)geo_get_global_operation_queue();
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_4;
      v19[3] = &unk_1E1C21800;
      v19[4] = a1;
      v20 = v5;
      v21 = &v22;
      objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", CFSTR("MapsAuthDidFinishNotification"), CFSTR("clientfeatureflags"), global_operation_queue, v19);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v23[5];
      v23[5] = v16;

      +[GEOMapsAuthServiceHelper sharedAuthHelper](GEOMapsAuthServiceHelper, "sharedAuthHelper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requestFeatureFlagsWithURL:suppressNotification:", 0, 0);

      _Block_object_dispose(&v22, 8);
    }
  }
LABEL_11:

}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v4;
  geo_isolater *v5;

  v4 = a3;
  v5 = self->_currentEnvironmentStateIsolater;
  _geo_isolate_lock();
  self->_currentEnvironmentState = 0;
  _geo_isolate_unlock();

}

- (void)refresh:(BOOL)a3
{
  -[GEOMapsAuthServiceHelper _refreshFromTask:force:]((uint64_t)self, 0, a3);
}

- (void)refreshFromTask:(id)a3
{
  id v4;
  GEOBGSystemTaskCompleter *v5;

  v4 = a3;
  v5 = -[GEOBGSystemTaskCompleter initWithTask:]([GEOBGSystemTaskCompleter alloc], "initWithTask:", v4);

  -[GEOMapsAuthServiceHelper _refreshFromTask:force:]((uint64_t)self, v5, 0);
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke(uint64_t a1)
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = geo_get_global_queue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_2;
  block[3] = &unk_1E1BFF6F8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(global_queue, block);

}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_2(uint64_t a1)
{
  _BOOL4 HasValue;
  void *v2;
  uint64_t v3;
  void *v4;
  double Double;
  double v6;
  NSObject *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  char v12;
  char v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && BackgroundSystemTasksLibraryCore())
  {
    HasValue = _GEOConfigHasValue(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8);
    objc_msgSend(getBGSystemTaskSchedulerClass(), "sharedScheduler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "taskRequestForIdentifier:", CFSTR("com.apple.geod.EnvironmentSecurity"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (HasValue)
    {
      Double = GEOConfigGetDouble(GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval, (uint64_t)off_1EDF4DE78);
      if (!v4)
      {
        v7 = objc_msgSend(objc_alloc((Class)getBGRepeatingSystemTaskRequestClass()), "initWithIdentifier:", CFSTR("com.apple.geod.EnvironmentSecurity"));
        -[NSObject setInterval:](v7, "setInterval:", Double);
        -[NSObject setMinDurationBetweenInstances:](v7, "setMinDurationBetweenInstances:", Double / 3.0 + Double / 3.0);
        -[NSObject setPriority:](v7, "setPriority:", 2);
        -[NSObject setRequiresExternalPower:](v7, "setRequiresExternalPower:", 0);
        -[NSObject setRequiresUserInactivity:](v7, "setRequiresUserInactivity:", 0);
        -[NSObject setRequiresProtectionClass:](v7, "setRequiresProtectionClass:", 3);
        -[NSObject setRequiresNetworkConnectivity:](v7, "setRequiresNetworkConnectivity:", 1);
        -[NSObject setNetworkDownloadSize:](v7, "setNetworkDownloadSize:", 5120);
        v14 = 0;
        v13 = objc_msgSend(v2, "submitTaskRequest:error:", v7, &v14);
        v9 = v14;
        if ((v13 & 1) == 0)
        {
          GEOGetMapsProxyAuthLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v9;
            v11 = "Error scheduling token update background task: %{public}@";
            goto LABEL_16;
          }
LABEL_17:

        }
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v4, "interval");
      if (v6 != Double)
      {
        v7 = v4;
        -[NSObject setInterval:](v7, "setInterval:", Double);
        -[NSObject setMinDurationBetweenInstances:](v7, "setMinDurationBetweenInstances:", Double / 3.0 + Double / 3.0);
        -[NSObject setPriority:](v7, "setPriority:", 2);
        -[NSObject setRequiresExternalPower:](v7, "setRequiresExternalPower:", 0);
        -[NSObject setRequiresUserInactivity:](v7, "setRequiresUserInactivity:", 0);
        -[NSObject setRequiresProtectionClass:](v7, "setRequiresProtectionClass:", 3);
        -[NSObject setRequiresNetworkConnectivity:](v7, "setRequiresNetworkConnectivity:", 1);
        -[NSObject setNetworkDownloadSize:](v7, "setNetworkDownloadSize:", 5120);
        v14 = 0;
        v8 = objc_msgSend(v2, "updateTaskRequest:error:", v7, &v14);
        v9 = v14;
        if ((v8 & 1) == 0)
        {
          GEOGetMapsProxyAuthLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v16 = v9;
            v11 = "Error updating token update background task: %{public}@";
LABEL_16:
            _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else if (v3)
    {
      v14 = 0;
      v12 = objc_msgSend(v2, "cancelTaskRequestWithIdentifier:error:", CFSTR("com.apple.geod.EnvironmentSecurity"), &v14);
      v7 = v14;
      if ((v12 & 1) != 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      GEOGetMapsProxyAuthLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v7;
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Error canceling token update background task: %{public}@", buf, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_20:

  }
}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_3(uint64_t a1)
{
  id global_queue;

  global_queue = (id)geo_get_global_queue();
  _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_MapsRefreshToken, (uint64_t)off_1EDF4CDC8, global_queue, *(void **)(a1 + 32));

}

void __51__GEOMapsAuthServiceHelper__refreshFromTask_force___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  if (v2)
  {
    _getValue(GeoServicesConfig_MapsAuthClientFeatureFlagsLastUpdated, (uint64_t)off_1EDF4DE58, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4
      || (objc_msgSend(v4, "timeIntervalSinceNow"),
          GEOConfigGetDouble(GeoServicesConfig_MapsAuthClientFeatureFlagsTTL, (uint64_t)off_1EDF4DE68) <= -v6))
    {
      if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8))
        _setValue(GeoServicesConfig_ClientAuthFeatureFlags, (uint64_t)off_1EDF4DDF8, 0, 0, 0);
      if (_GEOConfigHasValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08))
        _setValue(GeoServicesConfig_ClientAuthFeatureFlagsStateInfo, (uint64_t)off_1EDF4DE08, 0, 0, 0);
      objc_msgSend(v3, "complete");
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEnvironmentStateIsolater, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
}

@end
