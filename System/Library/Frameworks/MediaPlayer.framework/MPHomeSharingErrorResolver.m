@implementation MPHomeSharingErrorResolver

- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5
{
  return -[MPHomeSharingErrorResolver initWithKeybagURL:accountID:accountTokenData:downloaderAccountID:downloaderAccountTokenData:familyAccountID:](self, "initWithKeybagURL:accountID:accountTokenData:downloaderAccountID:downloaderAccountTokenData:familyAccountID:", a3, a4, a5, 0, 0, 0);
}

- (MPHomeSharingErrorResolver)initWithKeybagURL:(id)a3 accountID:(unint64_t)a4 accountTokenData:(id)a5 downloaderAccountID:(unint64_t)a6 downloaderAccountTokenData:(id)a7 familyAccountID:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  MPHomeSharingErrorResolver *v17;
  uint64_t v18;
  NSURL *keybagURL;
  uint64_t v20;
  NSMutableArray *requests;
  objc_super v23;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  if (!a4 || !objc_msgSend(v15, "length"))
    goto LABEL_9;
  if (a6)
  {
    if (!a8)
      goto LABEL_10;
    if (!objc_msgSend(v16, "length"))
    {
LABEL_9:
      a8 = 0;
      goto LABEL_10;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)MPHomeSharingErrorResolver;
  v17 = -[MPHomeSharingErrorResolver init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    keybagURL = v17->_keybagURL;
    v17->_keybagURL = (NSURL *)v18;

    v17->_accountID = a4;
    objc_storeStrong((id *)&v17->_accountTokenData, a5);
    v17->_downloaderAccountID = a6;
    objc_storeStrong((id *)&v17->_downloaderAccountTokenData, a7);
    v17->_familyAccountID = a8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v20 = objc_claimAutoreleasedReturnValue();
    requests = v17->_requests;
    v17->_requests = (NSMutableArray *)v20;

  }
  self = v17;
  a8 = (unint64_t)self;
LABEL_10:

  return (MPHomeSharingErrorResolver *)a8;
}

- (void)dealloc
{
  objc_super v3;

  -[SSAuthorizationRequest cancel](self->_activeRequest, "cancel");
  -[SSAuthorizationRequest setDelegate:](self->_activeRequest, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPHomeSharingErrorResolver;
  -[MPHomeSharingErrorResolver dealloc](&v3, sel_dealloc);
}

- (void)resolveError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MPHomeSharingErrorResolver _errorIsFairPlayError:](self, "_errorIsFairPlayError:", v5))
  {
    objc_storeStrong((id *)&self->_error, a3);
    -[MPHomeSharingErrorResolver _performMachineAuthorization](self, "_performMachineAuthorization");
  }
  else if (objc_msgSend(v7, "code") == -16550)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Reconnecting to HomeSharing Library for error: %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_error, a3);
    -[MPHomeSharingML3DataProvider homeSharingLibrary](self->_dataProvider, "homeSharingLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__MPHomeSharingErrorResolver_resolveError___block_invoke;
    v10[3] = &unk_1E31637D0;
    v10[4] = self;
    objc_msgSend(v9, "connectWithCompletionHandler:", v10);

  }
  else
  {
    -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", v5, 0);
  }

}

- (void)authorizationRequest:(id)a3 didReceiveResponse:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  os_log_t v19;
  int v20;
  int v21;
  NSObject *v22;
  id v23;
  int v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  unint64_t accountID;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint8_t v33[4];
  unint64_t v34;
  __int128 buf;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "bodyData", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Token response: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("keybag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v8, "length");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Got keybag data of length: %lu", (uint8_t *)&buf, 0xCu);
    }

    if (objc_msgSend(v8, "length"))
    {
      buf = 0uLL;
      v36 = 0;
      if (ICFairPlayGetHardwareInfo())
      {
        -[MPHomeSharingML3DataProvider uniqueIdentifier](self->_dataProvider, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        HSLibraryCacheDirectoryForIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Tokens"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v33 = 138543362;
          v34 = (unint64_t)v13;
          _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Key storage directory: %{public}@", v33, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "fileExistsAtPath:", v13);

        if ((v16 & 1) == 0)
        {
          v17 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_193B9B000, v17, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Creating key storage directory...", v33, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0);

        }
        v32 = 0;
        v19 = objc_retainAutorelease(v13);
        v20 = XtCqEf5X(0, (uint64_t)&buf, -[NSObject UTF8String](v19, "UTF8String"), (uint64_t)&v32);
        if (v20)
        {
          v21 = v20;
          v22 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v33 = 67109120;
            LODWORD(v34) = v21;
            _os_log_impl(&dword_193B9B000, v22, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to create fp context: %d", v33, 8u);
          }

        }
        else
        {
          if (objc_msgSend(v8, "length"))
          {
            v23 = objc_retainAutorelease(v8);
            objc_msgSend(v23, "bytes");
            objc_msgSend(v23, "length");
            lCUad();
            v25 = v24;
            v26 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
            v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25)
            {
              if (v27)
              {
                *(_DWORD *)v33 = 67109120;
                LODWORD(v34) = v25;
                _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to import keybag: %d", v33, 8u);
              }

            }
            else
            {
              if (v27)
              {
                accountID = self->_accountID;
                *(_DWORD *)v33 = 134217984;
                v34 = accountID;
                _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Keybag and token for account ID %llu imported.", v33, 0xCu);
              }

              self->_atLeastOneAuthorizationRequestSuccessful = 1;
            }
          }
          VLxCLgDpiF(v32);
        }
      }
      else
      {
        v19 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Unable to get hw info", v33, 2u);
        }
      }

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("token"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v29, "length");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_193B9B000, v30, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingErrorResolver] Got token data of length: %lu", (uint8_t *)&buf, 0xCu);
    }

    if (objc_msgSend(v29, "length"))
      -[MPHomeSharingML3DataProvider setTokenData:forAuthorizedDSID:](self->_dataProvider, "setTokenData:forAuthorizedDSID:", v29, self->_accountID);

  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  SSAuthorizationRequest *activeRequest;
  NSError *error;

  -[SSAuthorizationRequest setDelegate:](self->_activeRequest, "setDelegate:", 0, a4);
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", self->_error, 0);
  error = self->_error;
  self->_error = 0;

}

- (void)requestDidFinish:(id)a3
{
  SSAuthorizationRequest *activeRequest;

  -[SSAuthorizationRequest setDelegate:](self->_activeRequest, "setDelegate:", 0);
  activeRequest = self->_activeRequest;
  self->_activeRequest = 0;

  -[MPHomeSharingErrorResolver _processNextAuthorizationRequest](self, "_processNextAuthorizationRequest");
}

- (BOOL)_errorIsFairPlayError:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = v4 + 49999;
  v6 = v4 + 12169;
  if (v4 == -11835)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A2F8]);

  }
  else
  {
    v8 = 0;
  }
  if (v5 >> 6 < 0x7D || v6 <= 0x13)
  {
    objc_msgSend(v3, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 |= objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2F90]);

  }
  return v8;
}

- (void)_performMachineAuthorization
{
  id v3;
  NSData *accountTokenData;
  void *v5;
  void *v6;
  id v7;
  NSData *downloaderAccountTokenData;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc((Class)getSSAuthorizationRequestClass());
  accountTokenData = self->_accountTokenData;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_accountID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "initWithAuthorizationToken:accountIdentifier:", accountTokenData, v5);

  -[NSURL path](self->_keybagURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeybagPath:", v6);

  -[NSMutableArray addObject:](self->_requests, "addObject:", v12);
  if (self->_downloaderAccountID)
  {
    objc_msgSend(v12, "setReason:", CFSTR("family"));
    v7 = objc_alloc((Class)getSSAuthorizationRequestClass());
    downloaderAccountTokenData = self->_downloaderAccountTokenData;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloaderAccountID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithAuthorizationToken:accountIdentifier:", downloaderAccountTokenData, v9);

    -[NSURL path](self->_keybagURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeybagPath:", v11);

    -[NSMutableArray addObject:](self->_requests, "addObject:", v10);
  }
  -[MPHomeSharingErrorResolver _processNextAuthorizationRequest](self, "_processNextAuthorizationRequest");

}

- (void)_processNextAuthorizationRequest
{
  void *v3;
  void *activeRequest;

  if (-[NSMutableArray count](self->_requests, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_requests, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "start");
    activeRequest = self->_activeRequest;
    self->_activeRequest = (SSAuthorizationRequest *)v3;
  }
  else
  {
    -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", self->_error, 2 * self->_atLeastOneAuthorizationRequestSuccessful);
    activeRequest = self->_error;
    self->_error = 0;
  }

}

- (MPHomeSharingML3DataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloaderAccountTokenData, 0);
  objc_storeStrong((id *)&self->_accountTokenData, 0);
  objc_storeStrong((id *)&self->_keybagURL, 0);
}

void __43__MPHomeSharingErrorResolver_resolveError___block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (a2)
    v4 = 2;
  else
    v4 = 0;
  objc_msgSend(v3, "sendDidResolveError:withResolution:", v3[8], v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = 0;

}

@end
