@implementation MSDeleteStreamsProtocol

- (MSDeleteStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSDeleteStreamsProtocol *v7;
  MSDeleteStreamsProtocol *v8;
  NSMutableArray *v9;
  NSMutableArray *collectionsInFlight;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDeleteStreamsProtocol;
  v7 = -[MSStreamsProtocol initWithPersonID:baseURL:](&v12, sel_initWithPersonID_baseURL_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish_3027;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication_3028;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion_3030;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate_3029;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    collectionsInFlight = v8->_collectionsInFlight;
    v8->_collectionsInFlight = v9;

  }
  return v8;
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
}

- (void)sendDeletionRequestForAssetCollections:(id)a3
{
  id v4;
  MSDeleteStreamsProtocol *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = self;
    -[NSMutableArray removeAllObjects](self->_collectionsInFlight, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v8)
      goto LABEL_15;
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "masterAssetHash");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[NSMutableArray addObject:](v5->_collectionsInFlight, "addObject:", v12);
          objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("fileHash"));
          objc_msgSend(MEMORY[0x1E0CB3940], "MSMakeUUID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("UUID"));
LABEL_9:

          goto LABEL_11;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          v27 = 2112;
          v28 = v12;
          v15 = v16;
          _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - Asset collection has no master file hash: %@", buf, 0x16u);
          goto LABEL_9;
        }
LABEL_11:
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v9 = v17;
      if (!v17)
      {
LABEL_15:

        -[MSStreamsProtocol _refreshAuthTokenForContext:](v5, "_refreshAuthTokenForContext:", &v5->_context);
        v18 = -[MSStreamsProtocol deleteURL](v5, "deleteURL");
        v19 = (const __CFDictionary *)MSPURLConnectionProperties();
        MSDSPCSendDeletionRequestAsync(&v5->_context._super.owner, v18, v19, (const __CFArray *)v6);

        v4 = v20;
        break;
      }
    }
  }

}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableArray *v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSMutableArray *collectionsInFlight;
  void *v46;
  id v47;
  id v48;
  MSDeleteStreamsProtocol *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  NSMutableArray *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSMutableArray *)a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_opt_class();
      v40 = v39;
      -[MSStreamsProtocol personID](self, "personID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v66 = v39;
      v67 = 2112;
      v68 = v41;
      v69 = 2114;
      v70 = v7;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete request has failed. Error: %{public}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_collectionsInFlight, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v9 = self->_collectionsInFlight;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v11);
    }

    -[MSDeleteStreamsProtocol _resetConnectionVariables](self, "_resetConnectionVariables");
    -[MSStreamsProtocol delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deleteProtocol:didFinishSuccessfulCollections:failedCollections:error:", self, 0, v8, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_collectionsInFlight, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v47 = v6;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v55;
      v49 = self;
      v48 = v15;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v15);
          v20 = *(NSMutableArray **)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[NSMutableArray objectForKey:](v20, "objectForKey:", CFSTR("fileHash"));
          v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[NSMutableArray objectForKey:](v20, "objectForKey:", CFSTR("deleteResult"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              -[NSMutableArray MSDSPAssetCollectionWithMasterFileHash:](self->_collectionsInFlight, "MSDSPAssetCollectionWithMasterFileHash:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                objc_msgSend(v8, "addObject:", v23);
                -[NSMutableArray removeObject:](self->_collectionsInFlight, "removeObject:", v23);
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                v30 = (void *)objc_opt_class();
                v31 = v30;
                -[MSStreamsProtocol personID](self, "personID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v66 = v30;
                v67 = 2112;
                v68 = v32;
                v69 = 2114;
                v70 = v21;
                _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Delete response contains unknown file hash %{public}@", buf, 0x20u);

                self = v49;
                v15 = v48;
              }

            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v27 = (void *)objc_opt_class();
              v28 = v27;
              -[MSStreamsProtocol personID](self, "personID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v66 = v27;
              v15 = v48;
              v67 = 2112;
              v68 = v29;
              v69 = 2114;
              v70 = v20;
              _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete response is missing the delete result. %{public}@", buf, 0x20u);

              self = v49;
            }

          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v24 = (void *)objc_opt_class();
            v25 = v24;
            -[MSStreamsProtocol personID](self, "personID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v66 = v24;
            v15 = v48;
            v67 = 2112;
            v68 = v26;
            v69 = 2114;
            v70 = v20;
            _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete response is missing a hash: %{public}@", buf, 0x20u);

            self = v49;
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v17);
    }

    v14 = v46;
    v7 = 0;
    if (-[NSMutableArray count](self->_collectionsInFlight, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_opt_class();
        v43 = v42;
        -[MSStreamsProtocol personID](self, "personID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        collectionsInFlight = self->_collectionsInFlight;
        *(_DWORD *)buf = 138543874;
        v66 = v42;
        v67 = 2112;
        v68 = v44;
        v69 = 2114;
        v70 = collectionsInFlight;
        _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ These asset collections did not receive a delete response: %{public}@", buf, 0x20u);

      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v33 = self->_collectionsInFlight;
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v51;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v51 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(v46, "addObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
          }
          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        }
        while (v35);
      }

    }
    -[MSDeleteStreamsProtocol _resetConnectionVariables](self, "_resetConnectionVariables");
    -[MSStreamsProtocol delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "deleteProtocol:didFinishSuccessfulCollections:failedCollections:error:", self, v8, v46, 0);

    v6 = v47;
  }

}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MSStreamsProtocol delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteProtocol:didReceiveAuthenticationError:", self, v4);

}

- (void)_resetConnectionVariables
{
  NSMutableArray *collectionsInFlight;

  collectionsInFlight = self->_collectionsInFlight;
  self->_collectionsInFlight = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsInFlight, 0);
}

@end
