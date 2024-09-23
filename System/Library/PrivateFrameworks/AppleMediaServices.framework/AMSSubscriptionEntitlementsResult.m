@implementation AMSSubscriptionEntitlementsResult

- (id)exportObject
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSSubscriptionEntitlementsResult appAdamId](self, "appAdamId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = &unk_1E25AFA10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appAdamId"));

  -[AMSSubscriptionEntitlementsResult appVersion](self, "appVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &unk_1E25AFA10;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appVersion"));

  -[AMSSubscriptionEntitlementsResult serverResponse](self, "serverResponse");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("serverResponse"));

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSSubscriptionEntitlementsResult entitlements](self, "entitlements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__AMSSubscriptionEntitlementsResult_exportObject__block_invoke;
  v17[3] = &unk_1E2546010;
  v18 = v13;
  v15 = v13;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("entitlements"));
  return v3;
}

void __49__AMSSubscriptionEntitlementsResult_exportObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "exportObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AMSSubscriptionEntitlementsResult *v8;
  AMSSubscriptionEntitlementsResult *v9;
  AMSSubscriptionEntitlementsResult *v10;
  AMSSubscriptionEntitlementsResult *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;

  v8 = (AMSSubscriptionEntitlementsResult *)a3;
  v9 = v8;
  if (self != v8)
  {
    v10 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      v12 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v11 = v10;

    if (!v11)
    {
      v12 = 0;
LABEL_50:

      goto LABEL_51;
    }
    -[AMSSubscriptionEntitlementsResult appAdamId](self, "appAdamId");
    v10 = (AMSSubscriptionEntitlementsResult *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (-[AMSSubscriptionEntitlementsResult appAdamId](v11, "appAdamId"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[AMSSubscriptionEntitlementsResult appAdamId](self, "appAdamId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSubscriptionEntitlementsResult appAdamId](v11, "appAdamId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
      {

        v12 = 0;
        goto LABEL_47;
      }
      v40 = 1;
    }
    else
    {
      v40 = 0;
    }
    -[AMSSubscriptionEntitlementsResult appVersion](self, "appVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      || (-[AMSSubscriptionEntitlementsResult appVersion](v11, "appVersion"),
          (v39 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = v3;
      -[AMSSubscriptionEntitlementsResult appVersion](self, "appVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSubscriptionEntitlementsResult appVersion](v11, "appVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
      {

        if (v13)
        else

        v12 = 0;
        v3 = v14;
        if ((v40 & 1) == 0)
          goto LABEL_47;
        goto LABEL_46;
      }
      v33 = v15;
      v38 = 1;
      v3 = v14;
      v6 = v16;
    }
    else
    {
      v39 = 0;
      v38 = 0;
    }
    -[AMSSubscriptionEntitlementsResult entitlements](self, "entitlements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      || (-[AMSSubscriptionEntitlementsResult entitlements](v11, "entitlements"),
          (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v36 = v13;
      v18 = v5;
      v19 = v4;
      v20 = v6;
      -[AMSSubscriptionEntitlementsResult entitlements](self, "entitlements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSubscriptionEntitlementsResult entitlements](v11, "entitlements");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v21;
      if (!objc_msgSend(v21, "isEqual:", v34))
      {
        v12 = 0;
        v6 = v20;
        v4 = v19;
        v5 = v18;
        v13 = v36;
LABEL_38:

LABEL_39:
        if (!v17)

        if (v38)
        {

        }
        if (!v13)

        if (!v40)
          goto LABEL_47;
LABEL_46:

LABEL_47:
        if (!v10)

        goto LABEL_49;
      }
      v32 = v17;
      v31 = 1;
      v6 = v20;
      v4 = v19;
      v5 = v18;
      v13 = v36;
    }
    else
    {
      v32 = 0;
      v29 = 0;
      v31 = 0;
    }
    -[AMSSubscriptionEntitlementsResult serverResponse](self, "serverResponse");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22
      || (-[AMSSubscriptionEntitlementsResult serverResponse](v11, "serverResponse"),
          (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v30 = v6;
      v37 = v3;
      -[AMSSubscriptionEntitlementsResult serverResponse](self, "serverResponse", v27, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSubscriptionEntitlementsResult serverResponse](v11, "serverResponse");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v23, "isEqual:", v24);

      if (v22)
      {

        v6 = v30;
        if (!v31)
        {
          v3 = v37;
          v17 = v32;
          goto LABEL_39;
        }
        v3 = v37;
        v17 = v32;
        goto LABEL_38;
      }
      v3 = v37;
      v6 = v30;
      v25 = v28;
    }
    else
    {
      v25 = 0;
      v12 = 1;
    }

    v17 = v32;
    if ((v31 & 1) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
  v12 = 1;
LABEL_51:

  return v12;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamId, a3);
}

- (NSNumber)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_serverResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end
