@implementation SGMailClientUtil

- (id)_init
{
  SGMailClientUtil *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SGMailClientUtil;
  v2 = -[SGMailClientUtil init](&v4, sel_init);
  if (v2)
  {
    if (_init__pasOnceToken10 != -1)
      dispatch_once(&_init__pasOnceToken10, &__block_literal_global_5_31351);
    objc_storeStrong((id *)&v2->_emailDaemon, (id)_init__pasExprOnceResult);
  }
  return v2;
}

- (id)allVIPEmailAddresses
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[EMDaemonInterface vipManager](self->_emailDaemon, "vipManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF93F378))
  {
    v3 = (id)objc_msgSend(v2, "allVIPWaitForResult");
  }
  else
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_fault_impl(&dword_1C3607000, v4, OS_LOG_TYPE_FAULT, "[vipManager conformsToProtocol:@protocol(EMVIPReader_Private)] was false (class: %@) -- the VIP set might be empty even if the user has VIP’s", (uint8_t *)&v9, 0xCu);

    }
    v3 = (id)_PASEvaluateLogFaultAndProbCrashCriteria();
    if ((_DWORD)v3)
      abort();
  }
  v5 = (void *)MEMORY[0x1C3BD4F6C](v3);
  objc_msgSend(v2, "allVIPEmailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)messageWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  -[SGMailClientUtil emailDaemon](self, "emailDaemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageRepository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = objc_alloc(MEMORY[0x1E0C99E98]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("message:%@"), v11);
  v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

  if (v14)
  {
    v23 = v6;
    objc_msgSend(v8, "messageObjectIDForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v15, "resultWithTimeout:error:", &v25, 0.3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;
    v18 = v17;
    if (v16)
    {
      objc_msgSend(v8, "messageForObjectID:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v18;
      objc_msgSend(v19, "resultWithTimeout:error:", &v24, 0.1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;

      if (a4 && !v20)
        *a4 = objc_retainAutorelease(v21);

    }
    else if (a4)
    {
      v21 = objc_retainAutorelease(v17);
      v20 = 0;
      *a4 = v21;
    }
    else
    {
      v20 = 0;
      v21 = v17;
    }

    v6 = v23;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGMailClientUtilErrorDomain"), 101, 0);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)isMessageAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  -[SGMailClientUtil emailDaemon](self, "emailDaemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageRepository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "messageObjectIDForURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v7, "resultWithTimeout:error:", &v10, 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v8 != 0;

  return (char)v4;
}

- (id)dataForMessageWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id obj;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__31331;
  v30 = __Block_byref_object_dispose__31332;
  v31 = 0;
  obj = 0;
  -[SGMailClientUtil messageWithIdentifier:error:](self, "messageWithIdentifier:error:", v6, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v31, obj);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:", *MEMORY[0x1E0D1DBF0], 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__31331;
    v23 = __Block_byref_object_dispose__31332;
    v24 = 0;
    v9 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__SGMailClientUtil_dataForMessageWithIdentifier_error___block_invoke;
    v15[3] = &unk_1E7DB6528;
    v17 = &v26;
    v10 = v9;
    v16 = v10;
    v18 = &v19;
    v11 = (id)objc_msgSend(v7, "requestRepresentationWithOptions:completionHandler:", v8, v15);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
    {
      v12 = (void *)v27[5];
      if (v12)
        *a4 = objc_retainAutorelease(v12);
    }
    v13 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v27[5]);
  }

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (int64_t)verifyDKIMSignatureForPipelineEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  objc_msgSend(v6, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "entityType");

  if (v8 == 5)
  {
    objc_msgSend(v6, "duplicateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entityKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[SGMailClientUtil verifyDKIMSignatureForMailWithIdentifier:error:](self, "verifyDKIMSignatureForMailWithIdentifier:error:", v11, a4);
  }
  else
  {
    v12 = 2;
  }

  return v12;
}

- (int64_t)verifyDKIMSignatureForStorageEvent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  v6 = a3;
  objc_msgSend(v6, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "entityType");

  if (v9 == 5)
  {
    objc_msgSend(v6, "duplicateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "parentKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entityKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[SGMailClientUtil verifyDKIMSignatureForMailWithIdentifier:error:](self, "verifyDKIMSignatureForMailWithIdentifier:error:", v13, a4);
  }
  else
  {
    v14 = 2;
  }

  return v14;
}

- (int64_t)verifyDKIMSignatureForMailWithIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  int64_t v7;

  -[SGMailClientUtil dataForMessageWithIdentifier:error:](self, "dataForMessageWithIdentifier:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[SGMailClientUtil verifyDKIMSignatureForMailWithData:error:](self, "verifyDKIMSignatureForMailWithData:error:", v6, a4);
  else
    v7 = 1;

  return v7;
}

- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 error:(id *)a4
{
  return -[SGMailClientUtil verifyDKIMSignatureForMailWithData:options:error:](self, "verifyDKIMSignatureForMailWithData:options:error:", a3, 3, a4);
}

- (id)signaturesToRemoveForDKIMVerificationContext:(id)a3 withFromHeaderDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v29;
  void *v30;
  id obj;
  id v32;
  uint8_t buf[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = v5;
  objc_msgSend(v5, "dkimSignatureHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  v29 = v6;
  objc_msgSend(v6, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  v32 = (id)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v14, "signatureExpiration");
        if (v16 <= 0.0
          || (v17 = v16,
              objc_msgSend(MEMORY[0x1E0C99D68], "date"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v18, "timeIntervalSince1970"),
              v20 = v19,
              v18,
              v17 >= v20))
        {
          objc_msgSend(v14, "signingDomainIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lowercaseString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend(v23, "isEqualToString:", v9);
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(".%@"), v9);
          v26 = objc_msgSend(v23, "hasSuffix:", v25);

          if ((v24 & 1) == 0 && (v26 & 1) == 0)
          {
            sgDeveloperLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v27, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature because the signing domain identifier is not the same as or a subdomain of the domain used in the From: header.", buf, 2u);
            }

            objc_msgSend(v32, "addObject:", v14);
          }

        }
        else
        {
          sgDeveloperLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring DKIM signature because it has expired.", buf, 2u);
          }

          objc_msgSend(v32, "addObject:", v14);
        }
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v11);
  }

  return v32;
}

- (int64_t)verifyDKIMSignatureForMailWithData:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  id v8;
  ECDKIMVerifier *dkimVerifier;
  ECDKIMVerifier *v10;
  ECDKIMVerifier *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  ECDKIMVerifier *v27;
  int v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  int64_t v32;
  NSObject *v33;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dkimVerifier = self->_dkimVerifier;
  if (!dkimVerifier)
  {
    v10 = (ECDKIMVerifier *)objc_opt_new();
    v11 = self->_dkimVerifier;
    self->_dkimVerifier = v10;

    dkimVerifier = self->_dkimVerifier;
  }
  v39 = 0;
  -[ECDKIMVerifier verificationContextForMessageData:error:](dkimVerifier, "verificationContextForMessageData:error:", v8, &v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v39;
  if (v12)
  {
    objc_msgSend(v12, "headers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstHeaderForKey:", *MEMORY[0x1E0D1E568]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && (objc_msgSend(v15, "body"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      objc_msgSend(v15, "body");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject ef_trimLeadingCharactersInSet:](v18, "ef_trimLeadingCharactersInSet:", v19);

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject ef_trimTrailingCharactersInSet:](v18, "ef_trimTrailingCharactersInSet:", v20);

      -[NSObject ef_rfc5322Unfold](v18, "ef_rfc5322Unfold");
      -[NSObject sg_decodeEncodedWords](v18, "sg_decodeEncodedWords");
      v38 = 0;
      v21 = objc_msgSend(MEMORY[0x1E0D1E6D0], "parseEmailAddressString:displayName:localPart:domain:groupList:", v18, 0, 0, &v38, 0);
      v22 = v38;
      v23 = v22;
      if (v21 && v22)
      {
        v35 = v22;
        -[SGMailClientUtil signaturesToRemoveForDKIMVerificationContext:withFromHeaderDomain:](self, "signaturesToRemoveForDKIMVerificationContext:withFromHeaderDomain:", v12, v22);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v12, "removeDKIMSignatureHeaders:", v24);
        v36 = v24;
        objc_msgSend(v12, "dkimSignatureHeaders");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26)
        {
          objc_msgSend(v12, "setRequireFullBodySignature:", 1);
          v27 = self->_dkimVerifier;
          v37 = 0;
          v28 = -[ECDKIMVerifier verifyMessageWithContext:options:error:](v27, "verifyMessageWithContext:options:error:", v12, a4, &v37);
          v29 = v37;

          if (v28)
          {
            sgDeveloperLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = v36;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Successfully verified DKIM signature.", buf, 2u);
            }
            v32 = 0;
            v13 = v29;
            v23 = v35;
          }
          else
          {
            v23 = v35;
            v31 = v36;
            if (!v29)
              goto LABEL_32;
            if (a5)
              *a5 = objc_retainAutorelease(v29);
            if (!objc_msgSend(v29, "code"))
            {
              sgDeveloperLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – A temporary error occured while verifying the DKIM signature(s).", buf, 2u);
              }
              v32 = 1;
            }
            else
            {
LABEL_32:
              sgDeveloperLogHandle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v32 = 2;
                _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – A permanent error occured while verifying the DKIM signature(s).", buf, 2u);
              }
              else
              {
                v32 = 2;
              }
            }
            v13 = v29;
          }
        }
        else
        {
          sgDeveloperLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v32 = 2;
            _os_log_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – No valid DKIM signature found.", buf, 2u);
          }
          else
          {
            v32 = 2;
          }
          v23 = v35;
          v31 = v36;
        }

      }
      else
      {
        sgDeveloperLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v32 = 2;
          _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – Could not parse domain in From: header.", buf, 2u);
        }
        else
        {
          v32 = 2;
        }
      }

    }
    else
    {
      sgDeveloperLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = 2;
        _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – No From: header found.", buf, 2u);
      }
      else
      {
        v32 = 2;
      }
    }

  }
  else
  {
    sgEventsLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v13;
      _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "Could not create DKIM verification context %@", buf, 0xCu);
    }

    if (a5)
    {
      v13 = objc_retainAutorelease(v13);
      *a5 = v13;
    }
    v32 = 2;
  }

  return v32;
}

- (EMDaemonInterface)emailDaemon
{
  return self->_emailDaemon;
}

- (ECDKIMVerifier)dkimVerifier
{
  return self->_dkimVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkimVerifier, 0);
  objc_storeStrong((id *)&self->_emailDaemon, 0);
}

void __55__SGMailClientUtil_dataForMessageWithIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(v5, "contentURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v9 = (void *)objc_msgSend(v7, "initWithContentsOfURL:options:error:", v8, 1, &v18);
    v10 = v18;

    if (v9)
    {
      +[SGMailClientUtil convertLineEndingsToNetwork:](SGMailClientUtil, "convertLineEndingsToNetwork:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      sgEventsLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "contentURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "Read error %@ loading message content from URL: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGMailClientUtilErrorDomain"), 100, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
    }
    v16 = *(_QWORD *)(v12 + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v11;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "Could not get message content: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __25__SGMailClientUtil__init__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)_init__pasExprOnceResult;
  _init__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

+ (SGMailClientUtil)sharedInstance
{
  if (sharedInstance__pasOnceToken9_31363 != -1)
    dispatch_once(&sharedInstance__pasOnceToken9_31363, &__block_literal_global_31364);
  return (SGMailClientUtil *)objc_msgSend((id)sharedInstance__pasExprOnceResult_31365, "result");
}

+ (id)convertLineEndingsToNetwork:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  _QWORD v12[7];
  _QWORD v13[4];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke;
  v14[3] = &unk_1E7DB6550;
  v14[4] = &v15;
  v14[5] = &v19;
  objc_msgSend(v3, "enumerateByteRangesUsingBlock:", v14);
  if (v20[3])
  {
    v5 = objc_msgSend(v3, "length");
    v6 = v20[3] + v5;
    v7 = malloc_type_malloc(v6, 0xC29342E1uLL);
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = v7;
    *((_BYTE *)v16 + 24) = 0;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke_2;
    v12[3] = &unk_1E7DB6578;
    v12[4] = &v15;
    v12[5] = &v19;
    v12[6] = v13;
    objc_msgSend(v3, "enumerateByteRangesUsingBlock:", v12);
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8, v6, 1);
    _Block_object_dispose(v13, 8);
  }
  else
  {
    v9 = v3;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v6;

  for (; a4; --a4)
  {
    v5 = *a2++;
    v4 = v5;
    v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if (v5 == 10 && !*(_BYTE *)(v6 + 24))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
    else
      *(_BYTE *)(v6 + 24) = v4 == 13;
  }
  return result;
}

_QWORD *__48__SGMailClientUtil_convertLineEndingsToNetwork___block_invoke_2(_QWORD *result, char *a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;

  for (; a4; --a4)
  {
    v4 = *a2;
    v5 = *(_QWORD *)(result[4] + 8);
    if (v4 == 10 && !*(_BYTE *)(v5 + 24))
    {
      v9 = *(_QWORD *)(result[5] + 8);
      v10 = *(_QWORD *)(v9 + 24);
      if (!v10)
        __assert_rtn("+[SGMailClientUtil convertLineEndingsToNetwork:]_block_invoke_2", "SGMailClientUtil.m", 360, "insertionsNeeded");
      *(_QWORD *)(v9 + 24) = v10 - 1;
      v11 = *(_QWORD *)(result[6] + 8);
      v12 = *(_BYTE **)(v11 + 24);
      *(_QWORD *)(v11 + 24) = v12 + 1;
      *v12 = 13;
    }
    else
    {
      *(_BYTE *)(v5 + 24) = v4 == 13;
    }
    v6 = *a2++;
    v7 = *(_QWORD *)(result[6] + 8);
    v8 = *(_BYTE **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v8 + 1;
    *v8 = v6;
  }
  return result;
}

void __34__SGMailClientUtil_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:", &__block_literal_global_3_31367);
  v2 = (void *)sharedInstance__pasExprOnceResult_31365;
  sharedInstance__pasExprOnceResult_31365 = v1;

  objc_autoreleasePoolPop(v0);
}

id __34__SGMailClientUtil_sharedInstance__block_invoke_2()
{
  return -[SGMailClientUtil _init]([SGMailClientUtil alloc], "_init");
}

@end
