@implementation MFCastleEmailAliasUpdater

- (MFCastleEmailAliasUpdater)initWithAccountID:(id)a3 aliasSupport:(id)a4
{
  id v7;
  id v8;
  MFCastleEmailAliasUpdater *v9;
  MFCastleEmailAliasUpdater *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFCastleEmailAliasUpdater;
  v9 = -[MFCastleEmailAliasUpdater init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountID, a3);
    objc_storeStrong((id *)&v10->_aliasSupport, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.message.icloud.alias-update", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (void)getEmailAddressAndAliasesWithLastSyncDate:(id)a3 entityTag:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  dispatch_block_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__MFCastleEmailAliasUpdater_getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke;
  v17[3] = &unk_1E4E8BD18;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = queue;
  v16 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v17);
  dispatch_async(v15, v16);

}

void __89__MFCastleEmailAliasUpdater_getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke(uint64_t a1)
{
  -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithLastSyncDate:entityTag:handler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_getEmailAddressAndAliasesWithLastSyncDate:(void *)a3 entityTag:(void *)a4 handler:
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  CastleEmailAliasUpdateResult *v13;
  _QWORD v14[5];
  void (**v15)(id, _QWORD);
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(_BYTE *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0D1EC98], "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 16);
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateEmailAddressAndAliases: Update already running.", buf, 0xCu);
      }

      v9[2](v9, 0);
    }
    else
    {
      *(_BYTE *)(a1 + 8) = 1;
      ++*(_DWORD *)(a1 + 12);
      -[MFCastleEmailAliasUpdater createRequestWithLastSyncDate:entityTag:](a1, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __90__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke;
        v14[3] = &unk_1E4E8BD40;
        v14[4] = a1;
        v15 = v9;
        -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithRequest:handler:](a1, v12, v14);

      }
      else
      {
        v13 = objc_alloc_init(CastleEmailAliasUpdateResult);
        ((void (**)(id, CastleEmailAliasUpdateResult *))v9)[2](v9, v13);

        *(_BYTE *)(a1 + 8) = 0;
      }

    }
  }

}

- (id)createRequestWithLastSyncDate:(void *)a3 entityTag:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_14;
  }
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isNetworkUp");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EC98], "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 16);
      v16 = *(_DWORD *)(a1 + 12);
      v18 = 138543618;
      v19 = v15;
      v20 = 1024;
      v21 = v16;
      _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Network is not up.", (uint8_t *)&v18, 0x12u);
    }

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 24), "aliasLookupURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(*(id *)(a1 + 24), "aliasAuthorizationHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", v11, CFSTR("Authorization"));

    objc_msgSend(*(id *)(a1 + 24), "aliasUserAgent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", v12, *MEMORY[0x1E0D1E608]);

    objc_msgSend(v10, "ak_addDeviceUDIDHeader");
    objc_msgSend(v10, "ak_addClientInfoHeader");
    if (v5)
    {
      -[MFCastleEmailAliasUpdater _headerStringFromDate:](a1, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forHTTPHeaderField:", v13, CFSTR("If-Modified-Since"));

    }
    if (v6)
      objc_msgSend(v10, "setValue:forKey:", v6, CFSTR("If-None-Match"));
  }
  else
  {
    v10 = 0;
  }

LABEL_14:
  return v10;
}

void __90__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(NSObject **)(v3 + 32);
  else
    v4 = 0;
  dispatch_assert_queue_V2(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    *(_BYTE *)(v5 + 8) = 0;

}

- (void)_getEmailAddressAndAliasesWithRequest:(void *)a3 handler:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[MFCastleEmailAliasUpdater _createURLSession]((_QWORD *)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithRequest_handler___block_invoke;
    v14[3] = &unk_1E4E8BD68;
    v14[4] = a1;
    v16 = v6;
    v8 = v7;
    v15 = v8;
    objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v5, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EC98], "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(id *)(a1 + 16);
      v12 = *(_DWORD *)(a1 + 12);
      v13 = objc_msgSend(v9, "taskIdentifier");
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 1024;
      v20 = v12;
      v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] Starting URL session task %llu", buf, 0x1Cu);

    }
    objc_msgSend(v9, "resume");

  }
}

- (_QWORD)_createURLSession
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTimeoutIntervalForResource:", 300.0);
    -[MFCastleEmailAliasUpdater _sourceApplicationBundleIdentifier]((uint64_t)v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", v3);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v3);
    }
    else
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("maild"));
    }
    objc_msgSend(v2, "set_appleIDContext:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v5, "setUnderlyingQueue:", v1[4]);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v2, 0, v5);
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __75__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithRequest_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(NSObject **)(v9 + 32);
  else
    v10 = 0;
  dispatch_assert_queue_V2(v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v7;
  else
    v11 = 0;
  v12 = v11;
  -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithResponse:responseData:error:handler:](*(_QWORD *)(a1 + 32), v12, v13, v8, *(void **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "invalidateAndCancel");

}

- (void)_getEmailAddressAndAliasesWithResponse:(void *)a3 responseData:(void *)a4 error:(void *)a5 handler:
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, CastleEmailAliasUpdateResult *);
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  CastleEmailAliasUpdateResult *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CastleEmailAliasUpdateResult *v23;
  void *v24;
  NSObject *v25;
  id v26;
  int v27;
  int v28;
  int v29;
  CastleEmailAliasUpdateResult *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  char v34;
  uint64_t v35;
  int v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  int v42;
  void *v43;
  id v44;
  int v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  int v56;
  __int16 v57;
  __int128 v58;
  __int16 v59;
  CastleEmailAliasUpdateResult *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (!v9 || v11)
    {
      objc_msgSend(MEMORY[0x1E0D1EC98], "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v41 = *(id *)(a1 + 16);
        v42 = *(_DWORD *)(a1 + 12);
        objc_msgSend(v11, "ef_publicDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v41;
        v55 = 1024;
        v56 = v42;
        v57 = 2114;
        *(_QWORD *)&v58 = v43;
        _os_log_error_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias request failed: %{public}@", buf, 0x1Cu);

      }
      v17 = objc_alloc_init(CastleEmailAliasUpdateResult);
      v12[2](v12, v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1EC98], "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v52 = *(id *)(a1 + 16);
        v36 = *(_DWORD *)(a1 + 12);
        v50 = objc_msgSend(v9, "statusCode");
        v37 = objc_alloc(MEMORY[0x1E0CB3940]);
        v38 = (uint64_t)v10;
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v38 = objc_claimAutoreleasedReturnValue();
        }
        v48 = (void *)v38;
        v39 = (void *)objc_msgSend(v37, "initWithData:encoding:", v38, 4);
        *(_DWORD *)buf = 138544130;
        v40 = v52;
        v54 = v52;
        v55 = 1024;
        v56 = v36;
        v57 = 1024;
        LODWORD(v58) = v50;
        WORD2(v58) = 2112;
        *(_QWORD *)((char *)&v58 + 6) = v39;
        _os_log_debug_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ #%u] updateEmailAddressAndAliases: Received (status=%d) '%@'", buf, 0x22u);
        if (!v10)
        {

          v40 = v52;
        }

      }
      if (objc_msgSend(v9, "statusCode") == 304)
      {
        objc_msgSend(MEMORY[0x1E0D1EC98], "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void **)(a1 + 16);
          v16 = *(_DWORD *)(a1 + 12);
          *(_DWORD *)buf = 138543618;
          v54 = v15;
          v55 = 1024;
          v56 = v16;
          _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Not Modified.", buf, 0x12u);
        }

        LOBYTE(v47) = 0;
        v17 = -[CastleEmailAliasUpdateResult initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:]([CastleEmailAliasUpdateResult alloc], "initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:", 0, 0, 0, 0, 1, 1, v47);
        v12[2](v12, v17);
      }
      else
      {
        v19 = objc_msgSend(v9, "statusCode");
        if (v10 && v19 == 200)
        {
          objc_msgSend(v9, "valueForHTTPHeaderField:", CFSTR("ETag"));
          v17 = (CastleEmailAliasUpdateResult *)objc_claimAutoreleasedReturnValue();
          -[MFCastleEmailAliasUpdater _aliasesFromData:](a1, v10);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = (void *)MEMORY[0x1E0C9AA70];
          if (v20)
            v22 = (void *)v20;
          v23 = v22;

          -[MFCastleEmailAliasUpdater _emailsFromData:](a1, v10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFCastleEmailAliasUpdater _defaultEmailAddressFromData:](a1, v10);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D1EC98], "log");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v49 = v24;
            v26 = *(id *)(a1 + 16);
            v27 = *(_DWORD *)(a1 + 12);
            v28 = -[CastleEmailAliasUpdateResult count](v23, "count");
            v29 = objc_msgSend(v49, "count");
            *(_DWORD *)buf = 138544642;
            v54 = v26;
            v55 = 1024;
            v56 = v27;
            v57 = 1024;
            LODWORD(v58) = v28;
            WORD2(v58) = 1024;
            *(_DWORD *)((char *)&v58 + 6) = v29;
            WORD5(v58) = 1024;
            HIDWORD(v58) = v51 != 0;
            v59 = 2114;
            v60 = v17;
            _os_log_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Got response. aliases: %d, emails: %d, defaultEmail: %{BOOL}d, entityTag: %{public}@", buf, 0x2Eu);

            v24 = v49;
          }

          LOBYTE(v47) = 0;
          v30 = -[CastleEmailAliasUpdateResult initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:]([CastleEmailAliasUpdateResult alloc], "initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:", v23, v24, v51, v17, 1, 0, v47);
          v12[2](v12, v30);

        }
        else
        {
          objc_msgSend(v9, "URL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "host");
          v17 = (CastleEmailAliasUpdateResult *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D1EC98], "log");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v44 = *(id *)(a1 + 16);
            v45 = *(_DWORD *)(a1 + 12);
            v46 = objc_msgSend(v9, "statusCode");
            *(_DWORD *)buf = 138544130;
            v54 = v44;
            v55 = 1024;
            v56 = v45;
            v57 = 2112;
            *(_QWORD *)&v58 = v17;
            WORD4(v58) = 1024;
            *(_DWORD *)((char *)&v58 + 10) = v46;
            _os_log_error_impl(&dword_1A4F90000, v32, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias request to [%@] failed with status code [%d]", buf, 0x22u);

          }
          if ((objc_msgSend(v9, "statusCode") == 404 || (v35 = objc_msgSend(v9, "statusCode"), !v10) || v35 == 405)
            && -[CastleEmailAliasUpdateResult hasPrefix:](v17, "hasPrefix:", CFSTR("p99-")))
          {
            objc_msgSend(MEMORY[0x1E0D1EC98], "log");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithResponse:responseData:error:handler:].cold.1(a1, (uint64_t)v17, v33);

            v34 = 1;
          }
          else
          {
            v34 = 0;
          }
          LOBYTE(v47) = v34;
          v23 = -[CastleEmailAliasUpdateResult initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:]([CastleEmailAliasUpdateResult alloc], "initWithReceiveEmailAliasAddresses:emailAddresses:defaultEmailAddress:entityTag:isSuccess:notModified:accountNeedsToUpdateProperties:", 0, 0, 0, 0, 0, 0, v47);
          v12[2](v12, v23);
        }

      }
    }

  }
}

- (id)_aliasesFromData:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "objectForKey:", CFSTR("aliases"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        obj = v19;
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v4)
        {
          v5 = 0;
          v24 = *(_QWORD *)v32;
          v25 = v4;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v32 != v24)
                objc_enumerationMutation(obj);
              v6 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullName"));
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emails"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v29 = 0u;
                    v30 = 0u;
                    v27 = 0u;
                    v28 = 0u;
                    v8 = v23;
                    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                    if (v9)
                    {
                      v10 = *(_QWORD *)v28;
                      do
                      {
                        for (j = 0; j != v9; ++j)
                        {
                          if (*(_QWORD *)v28 != v10)
                            objc_enumerationMutation(v8);
                          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v13 = (void *)MEMORY[0x1E0D1E6C0];
                            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("address"));
                            v14 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v13, "componentsWithString:", v14);
                            v15 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v15, "setDisplayName:", v7);
                            objc_msgSend(v15, "stringValue");
                            v16 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v5)
                            {
                              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                              v5 = (void *)objc_claimAutoreleasedReturnValue();
                            }
                            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("canSendFrom"), v19, v20);
                            v17 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);

                          }
                        }
                        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                      }
                      while (v9);
                    }

                  }
                }

              }
            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          }
          while (v25);
        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_emailsFromData:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = v3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "objectForKey:", CFSTR("account"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "objectForKey:", CFSTR("emails"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v4 = v13;
          v5 = 0;
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v18;
            do
            {
              v8 = 0;
              do
              {
                if (*(_QWORD *)v18 != v7)
                  objc_enumerationMutation(v4);
                v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (!v5)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v5 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("canSendFrom"), v13);
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

                }
                ++v8;
              }
              while (v6 != v8);
              v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            }
            while (v6);
          }

        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_defaultEmailAddressFromData:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultAddress"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_headerStringFromDate:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
    objc_msgSend(v4, "stringFromDate:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_sourceApplicationBundleIdentifier
{
  void *v1;
  void *v2;

  if (a1)
  {
    MFUserAgent();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1, "sourceApplicationBundleIdentifier");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aliasSupport, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)_getEmailAddressAndAliasesWithResponse:(os_log_t)log responseData:error:handler:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_DWORD *)(a1 + 12);
  v5 = 138543874;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias requests configured to use [%@], scheduling reprovision", (uint8_t *)&v5, 0x1Cu);
}

@end
