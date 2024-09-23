@implementation TKTokenAccessRequest

- (TKTokenAccessRequest)initWithClientBundleID:(id)a3 clientName:(id)a4 clientConnection:(id)a5 clientHasAccessTokenEntitlement:(BOOL)a6 tokenID:(id)a7 providerBundleID:(id)a8 providerName:(id)a9 correlationID:(id)a10
{
  id v16;
  id v17;
  TKTokenAccessRequest *v18;
  TKTokenAccessRequest *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a7;
  v22 = a8;
  v16 = a9;
  v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)TKTokenAccessRequest;
  v18 = -[TKTokenAccessRequest init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientBundleID, a3);
    objc_storeStrong((id *)&v19->_clientName, a4);
    objc_storeStrong((id *)&v19->_clientConnection, a5);
    v19->_clientHasAccessTokenEntitlement = a6;
    objc_storeStrong((id *)&v19->_tokenID, a7);
    objc_storeStrong((id *)&v19->_providerBundleID, a8);
    objc_storeStrong((id *)&v19->_providerName, a9);
    objc_storeStrong((id *)&v19->_correlationID, a10);
  }

  return v19;
}

- (TKTokenAccessRequest)initWithCaller:(id)a3 tokenID:(id)a4 extension:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  TKApplicationProxy *v16;
  TKTokenAccessRequest *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  TKTokenAccessRequest *v26;
  void *v28;
  TKTokenAccessRequest *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "auditToken");
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v11 = (void *)getBSAuditTokenClass_softClass;
  v40 = getBSAuditTokenClass_softClass;
  if (!getBSAuditTokenClass_softClass)
  {
    *(_QWORD *)&v34 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v34 + 1) = 3221225472;
    *(_QWORD *)&v35 = __getBSAuditTokenClass_block_invoke;
    *((_QWORD *)&v35 + 1) = &unk_1E7089260;
    v36 = &v37;
    __getBSAuditTokenClass_block_invoke((uint64_t)&v34);
    v11 = (void *)v38[3];
  }
  v28 = v9;
  v29 = self;
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v37, 8);
  v34 = v32;
  v35 = v33;
  objc_msgSend(v12, "tokenFromAuditToken:", &v34);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v14;
  v16 = objc_alloc_init(TKApplicationProxy);
  -[TKApplicationProxy displayNameForBundleID:](v16, "displayNameForBundleID:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [TKTokenAccessRequest alloc];
  objc_msgSend(v8, "valueForEntitlement:", CFSTR("com.apple.private.ctk.token-access.allow"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");
  objc_msgSend(v10, "_extensionBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v10;
  objc_msgSend(v10, "_localizedShortName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  v24 = v22;
  if (!v22)
  {
    objc_msgSend(v30, "_localizedShortName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v26 = -[TKTokenAccessRequest initWithClientBundleID:clientName:clientConnection:clientHasAccessTokenEntitlement:tokenID:providerBundleID:providerName:correlationID:](v17, "initWithClientBundleID:clientName:clientConnection:clientHasAccessTokenEntitlement:tokenID:providerBundleID:providerName:correlationID:", v15, v31, v23, v19, v28, v21, v24, v25);

  if (!v22)
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!v5)
      goto LABEL_15;
    -[TKTokenAccessRequest correlationID](self, "correlationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "correlationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (!v8)
      goto LABEL_15;
    -[TKTokenAccessRequest clientBundleID](self, "clientBundleID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[TKTokenAccessRequest clientBundleID](self, "clientBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_15;
    }
    -[TKTokenAccessRequest clientName](self, "clientName");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[TKTokenAccessRequest clientName](self, "clientName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_15;
    }
    v19 = -[TKTokenAccessRequest clientHasAccessTokenEntitlement](self, "clientHasAccessTokenEntitlement");
    if (v19 != objc_msgSend(v5, "clientHasAccessTokenEntitlement"))
      goto LABEL_15;
    -[TKTokenAccessRequest tokenID](self, "tokenID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_15;
    -[TKTokenAccessRequest providerBundleID](self, "providerBundleID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_12;
    v24 = (void *)v23;
    -[TKTokenAccessRequest providerBundleID](self, "providerBundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerBundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (v27)
    {
LABEL_12:
      -[TKTokenAccessRequest providerName](self, "providerName");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        -[TKTokenAccessRequest providerName](self, "providerName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "providerName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqual:", v31);

      }
      else
      {
        v32 = 1;
      }
    }
    else
    {
LABEL_15:
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)clientHasAccessTokenEntitlement
{
  return self->_clientHasAccessTokenEntitlement;
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (NSString)providerBundleID
{
  return self->_providerBundleID;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSUUID)correlationID
{
  return self->_correlationID;
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_providerBundleID, 0);
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end
