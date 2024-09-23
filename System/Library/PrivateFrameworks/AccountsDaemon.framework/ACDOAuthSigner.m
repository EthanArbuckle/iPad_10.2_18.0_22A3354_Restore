@implementation ACDOAuthSigner

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDOAuthSigner)init
{
  -[ACDOAuthSigner doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDOAuthSigner)initWithClient:(id)a3 databaseConnection:(id)a4
{
  id v7;
  id v8;
  ACDOAuthSigner *v9;
  ACDOAuthSigner *v10;
  ACDClientAuthorizationManager *v11;
  ACDClientAuthorizationManager *authorizationManager;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACDOAuthSigner;
  v9 = -[ACDOAuthSigner init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_databaseConnection, a4);
    v10->_shouldIncludeAppIdInRequest = 1;
    v11 = -[ACDClientAuthorizationManager initWithDatabaseConnection:]([ACDClientAuthorizationManager alloc], "initWithDatabaseConnection:", v10->_databaseConnection);
    authorizationManager = v10->_authorizationManager;
    v10->_authorizationManager = v11;

  }
  return v10;
}

- (void)setShouldIncludeAppIdInRequest:(BOOL)a3
{
  self->_shouldIncludeAppIdInRequest = a3;
}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  ACDClient *client;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (-[ACDClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x24BDB4480])
    && (client = self->_client) != 0)
  {
    -[ACDClient setBundleID:](client, "setBundleID:", v9);
    v6[2](v6, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v8);

  }
}

- (id)_signedRequest:(id)a3 withAccountObject:(id)a4 applicationID:(id)a5 timestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  ACDOAuthSigner *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __75__ACDOAuthSigner__signedRequest_withAccountObject_applicationID_timestamp___block_invoke;
  v26 = &unk_24C7E2E60;
  v15 = v11;
  v27 = v15;
  v30 = &v31;
  v16 = v10;
  v28 = v16;
  v29 = self;
  objc_msgSend(v14, "performBlockAndWait:", &v23);

  v17 = objc_alloc(MEMORY[0x24BE6DF78]);
  v18 = (void *)objc_msgSend(v17, "initWithCredential:", v32[5], v23, v24, v25, v26);
  v19 = v18;
  if (self->_shouldIncludeAppIdInRequest)
    v20 = v12;
  else
    v20 = 0;
  objc_msgSend(v18, "signedURLRequestWithRequest:applicationID:timestamp:", v16, v20, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v31, 8);
  return v21;
}

void __75__ACDOAuthSigner__signedRequest_withAccountObject_applicationID_timestamp___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "accountType");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BE6DF70]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 40), "_propertyForKey:", CFSTR("PreferredOAuthConsumerKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_propertyForKey:", CFSTR("PreferredOAuthConsumerSecret"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "ckForAccountType:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setConsumerKey:", v9);

    objc_msgSend(*(id *)(a1 + 48), "csForAccountType:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setConsumerSecret:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setConsumerKey:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setConsumerSecret:", v7);
  }
  +[ACDKeychainManager credentialForManagedAccountObject:](ACDKeychainManager, "credentialForManagedAccountObject:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oauthToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setOauthToken:", v12);

  objc_msgSend(v11, "oauthTokenSecret");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setOauthTokenSecret:", v13);

}

- (void)signURLRequest:(id)a3 withAccount:(id)a4 callingPID:(id)a5 timestamp:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  ACDOAuthSigner *v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__6;
  v58 = __Block_byref_object_dispose__6;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__6;
  v52 = __Block_byref_object_dispose__6;
  v53 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __74__ACDOAuthSigner_signURLRequest_withAccount_callingPID_timestamp_handler___block_invoke;
  v43 = &unk_24C7E2298;
  v46 = &v54;
  v44 = self;
  v18 = v13;
  v45 = v18;
  v47 = &v48;
  objc_msgSend(v17, "performBlockAndWait:", &v40);

  if (!v55[5])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0, v40, v41, v42, v43, v44);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v20);
    goto LABEL_19;
  }
  if (v14 && (int)objc_msgSend(v14, "intValue", v40, v41, v42, v43, v44) >= 1)
  {
    if (!-[ACDClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x24BDB4470]))
    {
      _ACDLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[ACDOAuthSigner signURLRequest:withAccount:callingPID:timestamp:handler:].cold.2(v32, v33, v34, v35, v36, v37, v38, v39);

      v20 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v14, "intValue");
    ACDGetAdamOrDisplayIDForPID();
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACDClient adamOrDisplayID](self->_client, "adamOrDisplayID", v40, v41, v42, v43, v44);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v19;
LABEL_8:
  if (-[ACDClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x24BDB4450])
    || (-[ACDClient bundleID](self->_client, "bundleID"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = -[ACDOAuthSigner _permissionGrantedForBundleID:onAccountType:](self, "_permissionGrantedForBundleID:onAccountType:", v21, v49[5]), v21, v22))
  {
    if (v20 || !self->_shouldIncludeAppIdInRequest)
    {
      -[ACDOAuthSigner _signedRequest:withAccountObject:applicationID:timestamp:](self, "_signedRequest:withAccountObject:applicationID:timestamp:", v12, v55[5], v20, v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v16)[2](v16, v23, 0);
    }
    else
    {
      _ACLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[ACDOAuthSigner signURLRequest:withAccount:callingPID:timestamp:handler:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v23);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v23);
  }

LABEL_19:
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __74__ACDOAuthSigner_signURLRequest_withAccount_callingPID_timestamp_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = objc_alloc(MEMORY[0x24BDB43A8]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "accountType");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "initWithManagedAccountType:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (id)signedRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  v26 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__ACDOAuthSigner_signedRequest_withAccount_applicationID_timestamp___block_invoke;
  v18[3] = &unk_24C7E1E88;
  v20 = &v21;
  v18[4] = self;
  v15 = v11;
  v19 = v15;
  objc_msgSend(v14, "performBlockAndWait:", v18);

  -[ACDOAuthSigner _signedRequest:withAccountObject:applicationID:timestamp:](self, "_signedRequest:withAccountObject:applicationID:timestamp:", v10, v22[5], v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __68__ACDOAuthSigner_signedRequest_withAccount_applicationID_timestamp___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)signURLRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  ACDOAuthSigner *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__6;
  v49 = __Block_byref_object_dispose__6;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__6;
  v43 = __Block_byref_object_dispose__6;
  v44 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __77__ACDOAuthSigner_signURLRequest_withAccount_applicationID_timestamp_handler___block_invoke;
  v34 = &unk_24C7E2298;
  v37 = &v45;
  v35 = self;
  v18 = v13;
  v36 = v18;
  v38 = &v39;
  objc_msgSend(v17, "performBlockAndWait:", &v31);

  if (!v46[5])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0, v31, v32, v33, v34, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v22);
    goto LABEL_11;
  }
  v19 = -[ACDClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x24BDB4450], v31, v32, v33, v34, v35);
  if (!v14)
  {
    _ACDLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ACDOAuthSigner signURLRequest:withAccount:applicationID:timestamp:handler:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    goto LABEL_10;
  }
  if (!v19)
  {
    -[ACDClient bundleID](self->_client, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ACDOAuthSigner _permissionGrantedForBundleID:onAccountType:](self, "_permissionGrantedForBundleID:onAccountType:", v20, v40[5]);

    if (!v21)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0, v22);
      goto LABEL_11;
    }
  }
  -[ACDOAuthSigner _signedRequest:withAccountObject:applicationID:timestamp:](self, "_signedRequest:withAccountObject:applicationID:timestamp:", v12, v46[5], v14, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v16)[2](v16, v22, 0);
LABEL_11:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

}

void __77__ACDOAuthSigner_signURLRequest_withAccount_applicationID_timestamp_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = objc_alloc(MEMORY[0x24BDB43A8]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "accountType");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "initWithManagedAccountType:", v11);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)_permissionGrantedForBundleID:(id)a3 onAccountType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  +[ACDClient clientWithBundleID:](ACDClient, "clientWithBundleID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager authorizationForClient:accountType:](self->_authorizationManager, "authorizationForClient:accountType:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "isGranted");
  return v9;
}

- (id)ckForAccountType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB4120];
  v13[0] = *MEMORY[0x24BDB4150];
  v13[1] = v3;
  v14[0] = CFSTR("XX[E:QjlmkJZqTBNhLOT:g");
  v14[1] = CFSTR("3878861889");
  v4 = *MEMORY[0x24BDB4058];
  v13[2] = CFSTR("com.apple.linkedin");
  v13[3] = v4;
  v14[2] = CFSTR("lh11ykuiycpw");
  v14[3] = CFSTR("b84f8d61205456:e:416:fd08c7811:4");
  v5 = *MEMORY[0x24BDB4138];
  v13[4] = *MEMORY[0x24BDB4158];
  v13[5] = v5;
  v14[4] = CFSTR("97d4b8:a6350926e2ab4gedefa7432:2:88530f7");
  v14[5] = CFSTR("902265845");
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    decodeString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)csForAccountType:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB4120];
  v13[0] = *MEMORY[0x24BDB4150];
  v13[1] = v3;
  v14[0] = CFSTR("Bav5TVOpCZd0XCrn8DuQrMGZbkHivaFYBnsbz3HUJE");
  v14[1] = CFSTR("9911g0d2c25782d6ebed:a4dbc14762c");
  v4 = *MEMORY[0x24BDB4058];
  v13[2] = CFSTR("com.apple.linkedin");
  v13[3] = v4;
  v14[2] = CFSTR("{Mgj6CGuJT:c{qMb");
  v14[3] = CFSTR("f058gbed57167f91");
  v5 = *MEMORY[0x24BDB4138];
  v13[4] = *MEMORY[0x24BDB4158];
  v13[5] = v5;
  v14[4] = CFSTR("33b67328e3fe8c697325g9d1666c672agbcagc1f");
  v14[5] = CFSTR("49b7ccffdbg14a5b234345cf1acc86c4");
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    decodeString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 callingPID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"No application ID to sign with.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 callingPID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"Calling app passed a pid, but doesn't have com.apple.accounts.applicationidfrompid entitlement.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 applicationID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, a1, a3, "\"No applicationID to sign with\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
