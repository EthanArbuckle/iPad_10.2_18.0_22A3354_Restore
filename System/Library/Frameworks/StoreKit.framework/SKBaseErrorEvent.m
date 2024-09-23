@implementation SKBaseErrorEvent

- (BOOL)canCreatePayload
{
  void *v2;
  BOOL v3;

  -[SKBaseErrorEvent primaryError](self, "primaryError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)createPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  if (-[SKBaseErrorEvent canCreatePayload](self, "canCreatePayload"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sk_SHA1Hash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, 0x1E5B2EA40);

    -[SKBaseErrorEvent inAppPurchaseID](self, "inAppPurchaseID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sk_SHA1Hash");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, 0x1E5B2EAA0);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKBaseErrorEvent userAction](self, "userAction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, 0x1E5B2EC00);

    -[SKBaseErrorEvent primaryError](self, "primaryError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SKBaseErrorEvent primaryError](self, "primaryError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", 0x1E5B2E9E0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, 0x1E5B2EC20);

      -[SKBaseErrorEvent primaryError](self, "primaryError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", 0x1E5B2EA00);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, 0x1E5B2EA80);

      -[SKBaseErrorEvent primaryError](self, "primaryError");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", 0x1E5B2EA20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, 0x1E5B2EBE0);

      v20 = (void *)MEMORY[0x1E0CB37E8];
      -[SKBaseErrorEvent primaryError](self, "primaryError");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "code"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, 0x1E5B2EB20);

      -[SKBaseErrorEvent primaryError](self, "primaryError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, 0x1E5B2EB40);

    }
    -[SKBaseErrorEvent primaryError](self, "primaryError");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "underlyingErrors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v27, "code"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, 0x1E5B2EB60);

      objc_msgSend(v27, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, 0x1E5B2EB80);

    }
    objc_msgSend(v27, "underlyingErrors");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v31, "code"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, 0x1E5B2EBA0);

      objc_msgSend(v31, "domain");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, 0x1E5B2EBC0);

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSError)primaryError
{
  return self->_primaryError;
}

- (void)setPrimaryError:(id)a3
{
  objc_storeStrong((id *)&self->_primaryError, a3);
}

- (NSError)mappedError
{
  return self->_mappedError;
}

- (void)setMappedError:(id)a3
{
  objc_storeStrong((id *)&self->_mappedError, a3);
}

- (NSString)inAppPurchaseID
{
  return self->_inAppPurchaseID;
}

- (void)setInAppPurchaseID:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPurchaseID, a3);
}

- (NSString)serverCorrelationID
{
  return self->_serverCorrelationID;
}

- (void)setServerCorrelationID:(id)a3
{
  objc_storeStrong((id *)&self->_serverCorrelationID, a3);
}

- (NSString)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (int64_t)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(int64_t)a3
{
  self->_userAction = a3;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_serverCorrelationID, 0);
  objc_storeStrong((id *)&self->_inAppPurchaseID, 0);
  objc_storeStrong((id *)&self->_mappedError, 0);
  objc_storeStrong((id *)&self->_primaryError, 0);
}

@end
