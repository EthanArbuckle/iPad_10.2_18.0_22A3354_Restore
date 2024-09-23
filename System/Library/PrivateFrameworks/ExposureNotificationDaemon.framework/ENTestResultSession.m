@implementation ENTestResultSession

- (id)_initWithAgencyAPIKey:(id)a3 certificateURL:(id)a4 acceptedReportTypes:(id)a5 healthAuthorityID:(id)a6 maxRetryTime:(unint64_t)a7 nonce:(id)a8 queue:(id)a9 region:(id)a10 uploadURL:(id)a11 URLSession:(id)a12 verificationCode:(id)a13 verifyURL:(id)a14
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  ENTestResultSession *v27;
  uint64_t v28;
  NSString *agencyAPIKey;
  uint64_t v30;
  NSURL *certificateURL;
  uint64_t v32;
  NSString *healthAuthorityID;
  uint64_t v34;
  NSString *nonce;
  ENTestResultPersistentSession *v36;
  ENTestResultPersistentSession *persistentSession;
  uint64_t v38;
  ENRegion *region;
  uint64_t v40;
  NSURL *uploadURL;
  uint64_t v42;
  NSUUID *UUID;
  uint64_t v44;
  NSString *verificationCode;
  uint64_t v46;
  NSURL *verificationURL;
  id obj;
  id v52;
  id v53;
  id v54;
  id v55;
  objc_super v56;

  v55 = a3;
  v18 = a4;
  obj = a5;
  v54 = a5;
  v19 = a6;
  v20 = a8;
  v53 = a9;
  v21 = v18;
  v22 = a10;
  v23 = a11;
  v52 = a12;
  v24 = v22;
  v25 = a13;
  v26 = a14;
  v56.receiver = self;
  v56.super_class = (Class)ENTestResultSession;
  v27 = -[ENTestResultSession init](&v56, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v55, "copy");
    agencyAPIKey = v27->_agencyAPIKey;
    v27->_agencyAPIKey = (NSString *)v28;

    v30 = objc_msgSend(v21, "copy");
    certificateURL = v27->_certificateURL;
    v27->_certificateURL = (NSURL *)v30;

    objc_storeStrong((id *)&v27->_acceptedReportTypes, obj);
    v32 = objc_msgSend(v19, "copy");
    healthAuthorityID = v27->_healthAuthorityID;
    v27->_healthAuthorityID = (NSString *)v32;

    v27->_maxRetryTime = a7;
    if (v20)
    {
      v34 = objc_msgSend(v20, "copy");
      nonce = v27->_nonce;
      v27->_nonce = (NSString *)v34;
    }
    else
    {
      nonce = v27->_nonce;
      v27->_nonce = 0;
    }

    v36 = objc_alloc_init(ENTestResultPersistentSession);
    persistentSession = v27->_persistentSession;
    v27->_persistentSession = v36;

    objc_storeStrong((id *)&v27->_queue, a9);
    v38 = objc_msgSend(v24, "copy");
    region = v27->_region;
    v27->_region = (ENRegion *)v38;

    v27->_state = 0;
    objc_storeStrong((id *)&v27->_URLSession, a12);
    v40 = objc_msgSend(v23, "copy");
    uploadURL = v27->_uploadURL;
    v27->_uploadURL = (NSURL *)v40;

    objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
    v42 = objc_claimAutoreleasedReturnValue();
    UUID = v27->_UUID;
    v27->_UUID = (NSUUID *)v42;

    v44 = objc_msgSend(v25, "copy");
    verificationCode = v27->_verificationCode;
    v27->_verificationCode = (NSString *)v44;

    v46 = objc_msgSend(v26, "copy");
    verificationURL = v27->_verificationURL;
    v27->_verificationURL = (NSURL *)v46;

  }
  return v27;
}

- (void)dealloc
{
  objc_super v3;

  -[ENTestResultSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ENTestResultSession;
  -[ENTestResultSession dealloc](&v3, sel_dealloc);
}

+ (id)sessionWithVerificationCode:(id)a3 configuration:(id)a4 maxRetryTime:(unint64_t)a5 nonce:(id)a6 URLSession:(id)a7 queue:(id)a8 error:(id *)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  id v31;

  v31 = a3;
  v15 = a4;
  v28 = a6;
  v30 = a7;
  v29 = a8;
  objc_msgSend(v15, "testVerificationAPIKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "testVerificationCertificateURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v15, "healthAuthorityID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v15, "testVerificationURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v15, "tekUploadURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v15, "acceptedReportTypes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc((Class)a1);
            objc_msgSend(v15, "region");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v22;
            v25 = v28;
            v26 = (void *)objc_msgSend(v24, "_initWithAgencyAPIKey:certificateURL:acceptedReportTypes:healthAuthorityID:maxRetryTime:nonce:queue:region:uploadURL:URLSession:verificationCode:verifyURL:", v16, v17, v21, v18, a5, v28, v29, v23, v20, v30, v31, v19);

          }
          else
          {
            if (a9)
            {
              ENTestResultErrorF(10);
              v26 = 0;
              *a9 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v26 = 0;
            }
            v25 = v28;
          }

        }
        else
        {
          if (a9)
          {
            ENTestResultErrorF(10);
            v26 = 0;
            *a9 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
          v25 = v28;
        }

      }
      else
      {
        v25 = v28;
        if (a9)
        {
          ENTestResultErrorF(10);
          v26 = 0;
          *a9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
      }

    }
    else
    {
      if (a9)
      {
        ENTestResultErrorF(10);
        v26 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
      v25 = v28;
    }

  }
  else
  {
    if (a9)
    {
      ENTestResultErrorF(10);
      v26 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v25 = v28;
  }

  return v26;
}

- (void)invalidate
{
  ENTestResultNetworkRequest *networkRequest;
  id v4;

  if (self->_state <= 5)
  {
    self->_state = 6;
    -[ENTestResultPersistentSession setFetchedMetadata:](self->_persistentSession, "setFetchedMetadata:", 0);
    -[ENTestResultNetworkRequest invalidate](self->_networkRequest, "invalidate");
    networkRequest = self->_networkRequest;
    self->_networkRequest = 0;

    ENTestResultErrorF(5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ENTestResultSession _flushVerificationCompletionsWithError:](self, "_flushVerificationCompletionsWithError:", v4);

  }
}

- (void)verifyCodeWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  BOOL v6;
  id v7;
  void *v8;
  int64_t state;
  void *v10;
  int v11;
  BOOL v12;
  id v13;
  NSMutableArray *verificationCompletions;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__ENTestResultSession_verifyCodeWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E87DBE98;
  v21[4] = self;
  v22 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A7E5C](v21);
  v20 = 0;
  v6 = -[ENTestResultSession _checkInvalidatedAndReturnError:](self, "_checkInvalidatedAndReturnError:", &v20);
  v7 = v20;
  v8 = v7;
  if (v6)
  {
    state = self->_state;
    if (state <= 0)
    {
      v19 = v7;
      v12 = -[ENTestResultSession _performVerificationRequestWithError:](self, "_performVerificationRequestWithError:", &v19);
      v13 = v19;

      if (!v12)
      {
        ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v13);
        v8 = v13;
        goto LABEL_16;
      }
      v8 = v13;
    }
    else
    {
      if (state != 1)
      {
        -[ENTestResultPersistentSession verificationError](self->_persistentSession, "verificationError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, BOOL, void *))v5)[2](v5, v17 == 0, v17);
LABEL_15:

        goto LABEL_16;
      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

      if (v11
        && gLogCategory_ENTestResultSession <= 50
        && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
      {
        -[NSUUID UUIDString](self->_UUID, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    verificationCompletions = self->_verificationCompletions;
    if (!verificationCompletions)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE0]);
      v16 = self->_verificationCompletions;
      self->_verificationCompletions = v15;

      verificationCompletions = self->_verificationCompletions;
    }
    v17 = (void *)MEMORY[0x1D17A7E5C](v5);
    -[NSMutableArray addObject:](verificationCompletions, "addObject:", v17);
    goto LABEL_15;
  }
  ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v7);
LABEL_16:

}

void __55__ENTestResultSession_verifyCodeWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

  if ((_DWORD)a2)
  {
    if (v6
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (v6
         && gLogCategory_ENTestResultSession <= 90
         && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_9;
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);

}

- (id)getMetadataAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;

  if (!-[ENTestResultSession _checkInvalidatedAndReturnError:](self, "_checkInvalidatedAndReturnError:"))
    goto LABEL_9;
  if (self->_state <= 1)
  {
    if (a3)
    {
      ENErrorF();
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
LABEL_9:
    v6 = 0;
    return v6;
  }
  -[ENTestResultPersistentSession fetchedMetadata](self->_persistentSession, "fetchedMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (a3)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)getUploadingTemporaryExposureKeys
{
  return -[ENTestResultPersistentSession teks](self->_persistentSession, "teks");
}

- (void)uploadTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 userMetadata:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  ENTestResultSession *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke;
  v48[3] = &unk_1E87DBEC0;
  v48[4] = self;
  v49 = v13;
  v36 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17A7E5C](v48);
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

  if (v15
    && gLogCategory_ENTestResultSession <= 50
    && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    -[NSUUID UUIDString](self->_UUID, "UUIDString");
    v33 = (uint64_t)v12;
    v34 = v11;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v10, "count");
    LogPrintF_safe();

  }
  v35 = self;
  v37 = v12;
  v38 = v11;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v31, v32, v33, v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isRPILoggingAllowed");

        if (v23
          && gLogCategory_ENTestResultSession <= 30
          && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v21, "keyData");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v21, "rollingStartNumber");
          v33 = objc_msgSend(v21, "rollingPeriod");
          v31 = v24;
          LogPrintF_safe();

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v18);
  }

  -[ENTestResultPersistentSession verificationToken](v35->_persistentSession, "verificationToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke_2;
    v39[3] = &unk_1E87DBEE8;
    v39[4] = v35;
    v40 = v16;
    v26 = v38;
    v41 = v38;
    v27 = v37;
    v42 = v37;
    v28 = v36;
    v43 = v36;
    -[ENTestResultSession _performCertificateRequestWithToken:temporaryExposureKeys:completionHandler:](v35, "_performCertificateRequestWithToken:temporaryExposureKeys:completionHandler:", v25, v40, v39);

  }
  else
  {
    -[ENTestResultPersistentSession verificationError](v35->_persistentSession, "verificationError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v37;
    v26 = v38;
    v28 = v36;
    if (v29)
    {
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v36)[2](v36, 0, 0, v29);
    }
    else
    {
      ENTestResultErrorF(1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v36)[2](v36, 0, 0, v30);

    }
  }

}

void __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSensitiveLoggingAllowed");

  if ((_DWORD)a2)
  {
    if (v9
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (v9
         && gLogCategory_ENTestResultSession <= 90
         && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_9;
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);

}

uint64_t __96__ENTestResultSession_uploadTemporaryExposureKeys_revisionToken_userMetadata_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
    return objc_msgSend(*(id *)(a1 + 32), "_performUploadRequestWithTemporaryExposureKeys:revisionToken:certificate:HMACKey:userMetadata:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (BOOL)_performVerificationRequestWithError:(id *)a3
{
  ENTestResultNetworkRequest *v4;
  ENTestResultNetworkRequest *networkRequest;
  ENTestResultNetworkRequest *v6;
  ENTestResultNetworkRequest *v7;
  _QWORD v9[5];

  +[ENTestResultVerificationRequest verificationRequestWithCode:acceptedReportTypes:APIKey:nonce:requestURL:URLSession:queue:error:](ENTestResultVerificationRequest, "verificationRequestWithCode:acceptedReportTypes:APIKey:nonce:requestURL:URLSession:queue:error:", self->_verificationCode, self->_acceptedReportTypes, self->_agencyAPIKey, self->_nonce, self->_verificationURL, self->_URLSession, self->_queue, a3);
  v4 = (ENTestResultNetworkRequest *)objc_claimAutoreleasedReturnValue();
  networkRequest = self->_networkRequest;
  self->_networkRequest = v4;

  v6 = self->_networkRequest;
  if (v6)
  {
    -[ENTestResultNetworkRequest setMaxRetryTime:](self->_networkRequest, "setMaxRetryTime:", self->_maxRetryTime);
    v7 = self->_networkRequest;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__ENTestResultSession__performVerificationRequestWithError___block_invoke;
    v9[3] = &unk_1E87DBF10;
    v9[4] = self;
    -[ENTestResultNetworkRequest resumeWithCompletionHandler:](v7, "resumeWithCompletionHandler:", v9);
    self->_state = 1;
  }
  return v6 != 0;
}

void __60__ENTestResultSession__performVerificationRequestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(v23, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1 + 32;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFetchedMetadata:", v8);

    objc_msgSend(v23, "token");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setVerificationToken:", v10);

    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

    if (v12
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)v9 + 72), "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "token");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "metadata");
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v13;
      LogPrintF_safe();

    }
    v19 = 2;
    goto LABEL_19;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

  if (v7
    && gLogCategory_ENTestResultSession <= 90
    && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    LogPrintF_safe();

  }
  objc_msgSend(v5, "domain", v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CAA2D0]);

  if (v16)
  {
    v17 = objc_msgSend(v5, "code");
    if (v17 <= 0xB && ((1 << v17) & 0x9D6) != 0)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
  v9 = a1 + 32;
  v18 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v18 + 16))
  {
    objc_msgSend(*(id *)(v18 + 32), "setVerificationError:", v5);
    v19 = 5;
LABEL_19:
    *(_QWORD *)(*(_QWORD *)v9 + 16) = v19;
  }
  objc_msgSend(*(id *)(a1 + 32), "_flushVerificationCompletionsWithError:", v5, v20, v21, v22);

}

- (void)_flushVerificationCompletionsWithError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *verificationCompletions;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_verificationCompletions, "count"))
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSensitiveLoggingAllowed");

    if (v6
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      -[NSUUID UUIDString](self->_UUID, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray count](self->_verificationCompletions, "count");
      LogPrintF_safe();

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_verificationCompletions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4 == 0, v4);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  verificationCompletions = self->_verificationCompletions;
  self->_verificationCompletions = 0;

}

- (void)_performCertificateRequestWithToken:(id)a3 temporaryExposureKeys:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  NSString *agencyAPIKey;
  NSURL *certificateURL;
  NSURLSession *URLSession;
  OS_dispatch_queue *queue;
  ENTestResultNetworkRequest *v21;
  id v22;
  ENTestResultNetworkRequest *networkRequest;
  ENTestResultNetworkRequest *v24;
  ENTestResultNetworkRequest *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ENTestResultPersistentSession certificate](self->_persistentSession, "certificate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENTestResultPersistentSession HMACKey](self->_persistentSession, "HMACKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENTestResultPersistentSession teks](self->_persistentSession, "teks");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v11)
    v15 = v12 == 0;
  else
    v15 = 1;
  if (v15 || v13 == 0)
  {
    agencyAPIKey = self->_agencyAPIKey;
    certificateURL = self->_certificateURL;
    URLSession = self->_URLSession;
    queue = self->_queue;
    v29 = 0;
    +[ENTestResultCertificateRequest certificateRequestWithToken:temporaryExposureKeys:APIKey:requestURL:URLSession:queue:error:](ENTestResultCertificateRequest, "certificateRequestWithToken:temporaryExposureKeys:APIKey:requestURL:URLSession:queue:error:", v8, v9, agencyAPIKey, certificateURL, URLSession, queue, &v29);
    v21 = (ENTestResultNetworkRequest *)objc_claimAutoreleasedReturnValue();
    v22 = v29;
    networkRequest = self->_networkRequest;
    self->_networkRequest = v21;

    v24 = self->_networkRequest;
    if (v24)
    {
      -[ENTestResultNetworkRequest setMaxRetryTime:](v24, "setMaxRetryTime:", self->_maxRetryTime);
      v25 = self->_networkRequest;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __99__ENTestResultSession__performCertificateRequestWithToken_temporaryExposureKeys_completionHandler___block_invoke;
      v26[3] = &unk_1E87DBF38;
      v26[4] = self;
      v27 = v9;
      v28 = v10;
      -[ENTestResultNetworkRequest resumeWithCompletionHandler:](v25, "resumeWithCompletionHandler:", v26);
      self->_state = 3;

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v22);
    }

  }
  else
  {
    (*((void (**)(id, void *, void *, _QWORD))v10 + 2))(v10, v11, v12, 0);
  }

}

void __99__ENTestResultSession__performCertificateRequestWithToken_temporaryExposureKeys_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "certificate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "symmetricKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v15;
  if (!v5 && v15 && v7)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "setCertificate:", v15);
    objc_msgSend(*(id *)(a1[4] + 32), "setHMACKey:", v7);
    objc_msgSend(*(id *)(a1[4] + 32), "setTeks:", a1[5]);
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

    if (v10
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1[4] + 72), "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD))(a1[6] + 16))(a1[6]);
  }
  else
  {
    if (!v5)
    {
      ENTestResultErrorF(1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    *(_QWORD *)(a1[4] + 16) = 2;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isSensitiveLoggingAllowed");

    if (v12
      && gLogCategory_ENTestResultSession <= 90
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1[4] + 72), "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], 0);

  }
}

- (void)_performUploadRequestWithTemporaryExposureKeys:(id)a3 revisionToken:(id)a4 certificate:(id)a5 HMACKey:(id)a6 userMetadata:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, uint64_t, void *, _QWORD);
  void *v20;
  NSString *healthAuthorityID;
  NSURL *uploadURL;
  NSURLSession *URLSession;
  OS_dispatch_queue *queue;
  ENTestResultNetworkRequest *v25;
  id v26;
  ENTestResultNetworkRequest *networkRequest;
  ENTestResultNetworkRequest *v28;
  ENTestResultNetworkRequest *v29;
  _QWORD v30[5];
  void (**v31)(id, uint64_t, void *, _QWORD);
  id v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, uint64_t, void *, _QWORD))a8;
  -[ENTestResultPersistentSession revisionToken](self->_persistentSession, "revisionToken");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v19[2](v19, 1, v20, 0);
  }
  else
  {
    healthAuthorityID = self->_healthAuthorityID;
    uploadURL = self->_uploadURL;
    URLSession = self->_URLSession;
    queue = self->_queue;
    v32 = 0;
    +[ENTestResultUploadRequest uploadRequestWithCertificate:healthAuthorityID:revisionToken:symmetricKey:temporaryExposureKeys:userMetadata:requestURL:URLSession:queue:error:](ENTestResultUploadRequest, "uploadRequestWithCertificate:healthAuthorityID:revisionToken:symmetricKey:temporaryExposureKeys:userMetadata:requestURL:URLSession:queue:error:", v16, healthAuthorityID, v15, v17, v14, v18, uploadURL, URLSession, queue, &v32);
    v25 = (ENTestResultNetworkRequest *)objc_claimAutoreleasedReturnValue();
    v26 = v32;
    networkRequest = self->_networkRequest;
    self->_networkRequest = v25;

    v28 = self->_networkRequest;
    if (v28)
    {
      -[ENTestResultNetworkRequest setMaxRetryTime:](v28, "setMaxRetryTime:", self->_maxRetryTime);
      v29 = self->_networkRequest;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __135__ENTestResultSession__performUploadRequestWithTemporaryExposureKeys_revisionToken_certificate_HMACKey_userMetadata_completionHandler___block_invoke;
      v30[3] = &unk_1E87DBF60;
      v30[4] = self;
      v31 = v19;
      -[ENTestResultNetworkRequest resumeWithCompletionHandler:](v29, "resumeWithCompletionHandler:", v30);
      self->_state = 4;

    }
    else
    {
      ((void (**)(id, uint64_t, void *, id))v19)[2](v19, 0, 0, v26);
    }

  }
}

void __135__ENTestResultSession__performUploadRequestWithTemporaryExposureKeys_revisionToken_certificate_HMACKey_userMetadata_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(a2, "responseRevisionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v13 || !v5)
  {
    *(_QWORD *)(v6 + 16) = 2;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isSensitiveLoggingAllowed");

    if (v10
      && gLogCategory_ENTestResultSession <= 90
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(v6 + 32), "setRevisionToken:", v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 5;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

    if (v8
      && gLogCategory_ENTestResultSession <= 30
      && (gLogCategory_ENTestResultSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1);
  }

}

- (BOOL)_checkInvalidatedAndReturnError:(id *)a3
{
  int64_t state;

  state = self->_state;
  if (state >= 6 && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return state < 6;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)agencyAPIKey
{
  return self->_agencyAPIKey;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (NSString)healthAuthorityID
{
  return self->_healthAuthorityID;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (NSArray)acceptedReportTypes
{
  return self->_acceptedReportTypes;
}

- (unint64_t)maxRetryTime
{
  return self->_maxRetryTime;
}

- (void)setMaxRetryTime:(unint64_t)a3
{
  self->_maxRetryTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedReportTypes, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_healthAuthorityID, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_agencyAPIKey, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_verificationCompletions, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_persistentSession, 0);
  objc_storeStrong((id *)&self->_networkRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
