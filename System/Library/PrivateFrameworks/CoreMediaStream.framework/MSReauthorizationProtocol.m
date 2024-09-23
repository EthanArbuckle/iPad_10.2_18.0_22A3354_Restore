@implementation MSReauthorizationProtocol

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSReauthorizationProtocol;
  -[MSStreamsProtocol delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSReauthorizationProtocol;
  -[MSStreamsProtocol setDelegate:](&v3, sel_setDelegate_, a3);
}

- (MSReauthorizationProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSReauthorizationProtocol *v7;
  MSReauthorizationProtocol *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSReauthorizationProtocol;
  v7 = -[MSStreamsProtocol initWithPersonID:baseURL:](&v10, sel_initWithPersonID_baseURL_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish_2422;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication_2423;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate_2424;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion_2425;
  }

  return v8;
}

- (void)dealloc
{
  __MSRPCContext *p_context;
  objc_super v4;

  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSReauthorizationProtocol;
  -[MSReauthorizationProtocol dealloc](&v4, sel_dealloc);
}

- (void)requestReauthorizationForAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *assetsInFlight;
  NSURL *v19;
  const __CFDictionary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v5;
    v28 = 2112;
    v29 = v7;
    v30 = 2048;
    v31 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Reauthorizing %ld items", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (NSArray *)v4;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "fileHash", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "fileHash");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "MSHexString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = v9;

  -[MSStreamsProtocol _refreshAuthTokenForContext:](self, "_refreshAuthTokenForContext:", &self->_context);
  v19 = -[MSStreamsProtocol reauthorizeURL](self, "reauthorizeURL");
  v20 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSRPCReauthorizeAsync(&self->_context._super.owner, (uint64_t)v19, v20, -[MSStreamsProtocol personID](self, "personID"), v8);

}

- (void)abort
{
  NSArray *assetsInFlight;

  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = 0;

}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSArray *assetsInFlight;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  MSReauthorizationProtocol *v34;
  id v35;
  NSArray *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_opt_class();
      v31 = v30;
      -[MSStreamsProtocol personID](self, "personID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "MSVerboseDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v30;
      v53 = 2112;
      v54 = v32;
      v55 = 2114;
      v56 = v33;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization has failed. Error: %{public}@", buf, 0x20u);

    }
    assetsInFlight = self->_assetsInFlight;
    self->_assetsInFlight = 0;
    v9 = assetsInFlight;

    -[MSReauthorizationProtocol delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reauthorizationProtocol:reauthorizedAssets:rejectedAssets:error:", self, 0, v9, v7);
  }
  else
  {
    v10 = (void *)-[NSArray mutableCopy](self->_assetsInFlight, "mutableCopy");
    v11 = self->_assetsInFlight;
    self->_assetsInFlight = 0;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v34 = self;
    -[MSStreamsProtocol personID](self, "personID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v6;
    objc_msgSend(v6, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v13;
    v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v40)
    {
      v38 = v10;
      v39 = *(_QWORD *)v46;
      v37 = v14;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(v14);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
        objc_msgSend(v16, "MSHexData");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          break;
        v18 = (void *)v17;
        objc_msgSend(v14, "objectForKey:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v20 = v10;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v42;
LABEL_13:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v42 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v24);
            objc_msgSend(v25, "fileHash");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToData:", v18);

            if ((v27 & 1) != 0)
              break;
            if (v22 == ++v24)
            {
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v22)
                goto LABEL_13;
              v14 = v37;
              v10 = v38;
              goto LABEL_22;
            }
          }
          v28 = v25;

          v14 = v37;
          v10 = v38;
          if (!v28)
            goto LABEL_23;
          objc_msgSend(v28, "setMMCSAccessHeader:", v19);
          -[NSArray addObject:](v36, "addObject:", v28);
          objc_msgSend(v20, "MSRemoveOneObject:", v28);
          v20 = v28;
        }
LABEL_22:

LABEL_23:
        if (++v15 == v40)
        {
          v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v40)
            goto LABEL_7;
          break;
        }
      }
    }

    -[MSReauthorizationProtocol delegate](v34, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v36;
    objc_msgSend(v29, "reauthorizationProtocol:reauthorizedAssets:rejectedAssets:error:", v34, v36, v10, 0);

    v7 = 0;
    v6 = v35;
  }

}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  id v4;
  NSArray *assetsInFlight;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[MSStreamsProtocol personID](self, "personID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSVerboseDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = 0;

  -[MSReauthorizationProtocol delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reauthorizationProtocol:didReceiveAuthenticationError:", self, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsInFlight, 0);
}

@end
