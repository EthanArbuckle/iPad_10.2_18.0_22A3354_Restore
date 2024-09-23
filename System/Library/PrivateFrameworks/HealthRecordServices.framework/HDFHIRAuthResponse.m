@implementation HDFHIRAuthResponse

- (HDFHIRAuthResponse)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 scope:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDFHIRAuthResponse *v17;
  uint64_t v18;
  NSString *accessToken;
  uint64_t v20;
  NSString *refreshToken;
  uint64_t v22;
  NSString *patientID;
  uint64_t v24;
  NSDate *expiration;
  uint64_t v26;
  NSString *scope;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDFHIRAuthResponse;
  v17 = -[HDFHIRAuthResponse init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    accessToken = v17->_accessToken;
    v17->_accessToken = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    refreshToken = v17->_refreshToken;
    v17->_refreshToken = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    patientID = v17->_patientID;
    v17->_patientID = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    expiration = v17->_expiration;
    v17->_expiration = (NSDate *)v24;

    v26 = objc_msgSend(v16, "copy");
    scope = v17->_scope;
    v17->_scope = (NSString *)v26;

  }
  return v17;
}

+ (id)authResponseFromServerResponseDictionary:(id)a3 baseURL:(id)a4 previousCredential:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  HDFHIRAuthResponse *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRAuthResponse.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseDictionary"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRAuthResponse.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("baseURL"));

LABEL_3:
  objc_msgSend(v11, "hk_safeStringForKeyPath:error:", CFSTR("access_token"), a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", CFSTR("token_type"), a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v19 = 0;
LABEL_53:

      goto LABEL_54;
    }
    v49 = 0;
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", CFSTR("patient"), &v49);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v49;
    if (!v16)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("patient"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = v17;
        v18 = v21;
        if (v21)
        {
          if (a6)
          {
            v18 = objc_retainAutorelease(v21);
            v19 = 0;
            *a6 = v18;
            v17 = v18;
LABEL_52:

            goto LABEL_53;
          }
          _HKLogDroppedError();
        }
        v19 = 0;
        v17 = v18;
        goto LABEL_52;
      }
    }
    if (objc_msgSend(v16, "length"))
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v13, "patientID");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "length"))
      {
        v19 = 0;
        goto LABEL_52;
      }
    }
    v48 = v17;
    objc_msgSend(v11, "hk_safeNumberForKeyPath:error:", CFSTR("expires_in"), &v48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v48;

    v45 = v22;
    if (v22)
    {
      v43 = v18;
      v44 = v13;
      objc_msgSend(v22, "doubleValue");
      +[HKOAuth2Credential expirationFromTimeInterval:](HKOAuth2Credential, "expirationFromTimeInterval:");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("expires_in"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = v23;
        if (v29)
        {
          if (a6)
          {
            v30 = objc_retainAutorelease(v29);
            v19 = 0;
            *a6 = v30;
            v27 = v30;
            v17 = v30;
          }
          else
          {
            v27 = v29;
            _HKLogDroppedError();
            v19 = 0;
            v17 = v27;
          }
        }
        else
        {
          v19 = 0;
          v17 = 0;
          v27 = 0;
        }
        goto LABEL_51;
      }
      v42 = 0;
      v43 = v18;
      v44 = v13;
    }
    v47 = v23;
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", CFSTR("refresh_token"), &v47);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v47;

    if (!v24)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("refresh_token"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v32 = v25;
        v24 = v32;
        if (v32)
        {
          v18 = v43;
          if (a6)
          {
            v24 = objc_retainAutorelease(v32);
            v19 = 0;
            *a6 = v24;
          }
          else
          {
            _HKLogDroppedError();
            v19 = 0;
          }
          v17 = v24;
          v27 = (id)v42;
        }
        else
        {
          v19 = 0;
          v17 = 0;
          v27 = (id)v42;
          v18 = v43;
        }
        goto LABEL_50;
      }
      objc_msgSend(v44, "refreshToken");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        _HKInitializeLogging();
        v35 = (void *)*MEMORY[0x24BDD2FF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
        {
          v36 = v35;
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v51 = v38;
          _os_log_impl(&dword_2163C4000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ No refresh_token returned and no refreshToken found in previousCredential", buf, 0xCu);

        }
        v24 = 0;
      }
    }
    v46 = v25;
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", CFSTR("scope"), &v46);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v46;

    v18 = v43;
    if (v26)
      goto LABEL_19;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("scope"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(v44, "scopeString");
      v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v27 = (id)v42;
      v19 = -[HDFHIRAuthResponse initWithAccessToken:refreshToken:patientID:expiration:scope:]([HDFHIRAuthResponse alloc], "initWithAccessToken:refreshToken:patientID:expiration:scope:", v14, v24, v43, v42, v26);
LABEL_49:

LABEL_50:
      v13 = v44;
LABEL_51:

      goto LABEL_52;
    }
    v34 = v17;
    v26 = v34;
    if (v34)
    {
      if (a6)
      {
        v26 = objc_retainAutorelease(v34);
        v19 = 0;
        *a6 = v26;
LABEL_48:
        v27 = (id)v42;
        goto LABEL_49;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_48;
  }
  v19 = 0;
LABEL_54:

  return v19;
}

- (id)descriptionForAccountEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HDFHIRAuthResponse refreshToken](self, "refreshToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRAuthResponse patientID](self, "patientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRAuthResponse expiration](self, "expiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRAuthResponse scope](self, "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> Refresh token: %@, Patient Id: %@, Expiration: %@, Scope: %@"), v4, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEquivalentToAuthResponse:(id)a3
{
  void *v3;
  HDFHIRAuthResponse *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *accessToken;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *refreshToken;
  NSString *v19;
  NSString *v20;
  void *v21;
  NSString *patientID;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  void *v28;
  BOOL v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (HDFHIRAuthResponse *)a3;
  if (self == v5)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    if (-[HDFHIRAuthResponse isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = self->_scope != 0;
      -[HDFHIRAuthResponse scope](v5, "scope");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

      if (v6 != v8)
      {
        if (!self->_scope)
          goto LABEL_6;
        +[HKOAuth2ScopeSet scopesFromScopeString:](HKOAuth2ScopeSet, "scopesFromScopeString:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDFHIRAuthResponse scope](v5, "scope");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKOAuth2ScopeSet scopesFromScopeString:](HKOAuth2ScopeSet, "scopesFromScopeString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v10) = objc_msgSend(v9, "isEqualToSet:", v11);
        if ((_DWORD)v10)
        {
LABEL_6:
          accessToken = self->_accessToken;
          -[HDFHIRAuthResponse accessToken](v5, "accessToken");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (accessToken != v13)
          {
            -[HDFHIRAuthResponse accessToken](v5, "accessToken");
            v14 = objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              LOBYTE(v17) = 0;
              goto LABEL_35;
            }
            v3 = (void *)v14;
            v15 = self->_accessToken;
            -[HDFHIRAuthResponse accessToken](v5, "accessToken");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NSString isEqualToString:](v15, "isEqualToString:", v16))
            {
              LOBYTE(v17) = 0;
LABEL_34:

              goto LABEL_35;
            }
            v34 = v16;
          }
          refreshToken = self->_refreshToken;
          -[HDFHIRAuthResponse refreshToken](v5, "refreshToken");
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (refreshToken != v19)
          {
            -[HDFHIRAuthResponse refreshToken](v5, "refreshToken");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_27;
            v20 = self->_refreshToken;
            -[HDFHIRAuthResponse refreshToken](v5, "refreshToken");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NSString isEqualToString:](v20, "isEqualToString:", v21))
            {

              LOBYTE(v17) = 0;
              goto LABEL_30;
            }
            v32 = v21;
            v33 = v17;
          }
          patientID = self->_patientID;
          -[HDFHIRAuthResponse patientID](v5, "patientID");
          v23 = objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = patientID == (NSString *)v23;
          if (patientID == (NSString *)v23)
          {

          }
          else
          {
            v24 = (void *)v23;
            -[HDFHIRAuthResponse patientID](v5, "patientID");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              v31 = v3;
              v27 = self->_patientID;
              -[HDFHIRAuthResponse patientID](v5, "patientID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = -[NSString isEqualToString:](v27, "isEqualToString:", v28);

              if (refreshToken == v19)
              {

              }
              else
              {

              }
              v29 = accessToken == v13;
              v3 = v31;
LABEL_33:
              v16 = v34;
              if (!v29)
                goto LABEL_34;
LABEL_35:

              goto LABEL_36;
            }

          }
          if (refreshToken != v19)
          {

LABEL_27:
            v16 = v34;

            if (accessToken == v13)
              goto LABEL_35;
            goto LABEL_34;
          }

LABEL_30:
          v29 = accessToken == v13;
          goto LABEL_33;
        }
      }
    }
    LOBYTE(v17) = 0;
  }
LABEL_36:

  return (char)v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDFHIRAuthResponse *v5;
  HDFHIRAuthResponse *v6;
  NSString *accessToken;
  NSString *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  char v13;
  NSString *refreshToken;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  NSString *patientID;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  NSString *v22;
  uint64_t v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  NSDate *expiration;
  uint64_t v28;
  NSDate *v29;
  uint64_t v30;
  NSDate *v31;
  uint64_t v32;
  NSDate *v33;
  void *v34;
  NSString *scope;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  NSString *v43;
  void *v45;
  void *v46;
  void *v47;
  NSDate *v48;
  NSString *v49;
  NSDate *v50;
  void *v51;
  void *v52;
  NSString *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;

  v5 = (HDFHIRAuthResponse *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (-[HDFHIRAuthResponse isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      accessToken = self->_accessToken;
      -[HDFHIRAuthResponse accessToken](v6, "accessToken");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (accessToken != v8)
      {
        -[HDFHIRAuthResponse accessToken](v6, "accessToken");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        v11 = self->_accessToken;
        -[HDFHIRAuthResponse accessToken](v6, "accessToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v11, "isEqualToString:", v12))
        {
          v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v57 = v10;
        v56 = v12;
      }
      refreshToken = self->_refreshToken;
      -[HDFHIRAuthResponse refreshToken](v6, "refreshToken");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (refreshToken != v15)
      {
        -[HDFHIRAuthResponse refreshToken](v6, "refreshToken");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
LABEL_32:

LABEL_33:
          v13 = 0;
          goto LABEL_50;
        }
        v55 = (void *)v16;
        v17 = self->_refreshToken;
        -[HDFHIRAuthResponse refreshToken](v6, "refreshToken");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v17, "isEqualToString:", v3))
        {
LABEL_31:

          goto LABEL_32;
        }
      }
      patientID = self->_patientID;
      -[HDFHIRAuthResponse patientID](v6, "patientID");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v54 = patientID;
      if (patientID == v19)
      {
        v53 = refreshToken;
        v26 = v15;
      }
      else
      {
        -[HDFHIRAuthResponse patientID](v6, "patientID");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v52 = v3;
          v13 = 0;
          goto LABEL_47;
        }
        v51 = (void *)v20;
        v53 = refreshToken;
        v21 = v19;
        v22 = self->_patientID;
        -[HDFHIRAuthResponse patientID](v6, "patientID");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v22;
        v25 = (void *)v23;
        if (!-[NSString isEqualToString:](v24, "isEqualToString:", v23))
        {

          if (refreshToken == v15)
          {

            goto LABEL_33;
          }
          goto LABEL_31;
        }
        v26 = v15;
        v47 = v25;
        v19 = v21;
      }
      expiration = self->_expiration;
      -[HDFHIRAuthResponse expiration](v6, "expiration");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (NSDate *)v28;
      v50 = expiration;
      v52 = v3;
      if (expiration == (NSDate *)v28)
      {
        v48 = (NSDate *)v28;
        v49 = v19;
        v15 = v26;
      }
      else
      {
        -[HDFHIRAuthResponse expiration](v6, "expiration");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30)
        {
          v13 = 0;
          v15 = v26;
          refreshToken = v53;
          v42 = v54;
          goto LABEL_37;
        }
        v46 = (void *)v30;
        v49 = v19;
        v31 = self->_expiration;
        -[HDFHIRAuthResponse expiration](v6, "expiration");
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v34 = (void *)v32;
        v15 = v26;
        if (!-[NSDate isEqualToDate:](v33, "isEqualToDate:", v32))
        {

          v13 = 0;
          v19 = v49;
          refreshToken = v53;
          v43 = v54;
          goto LABEL_45;
        }
        v45 = v34;
        v48 = v29;
      }
      scope = self->_scope;
      -[HDFHIRAuthResponse scope](v6, "scope");
      v36 = objc_claimAutoreleasedReturnValue();
      v13 = scope == (NSString *)v36;
      if (scope == (NSString *)v36)
      {

        v29 = v48;
        refreshToken = v53;
        if (v50 == v48)
          goto LABEL_41;
      }
      else
      {
        v37 = (void *)v36;
        -[HDFHIRAuthResponse scope](v6, "scope");
        v38 = objc_claimAutoreleasedReturnValue();
        refreshToken = v53;
        if (v38)
        {
          v39 = (void *)v38;
          v40 = self->_scope;
          -[HDFHIRAuthResponse scope](v6, "scope");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSString isEqualToString:](v40, "isEqualToString:", v41);

          if (v50 == v48)
          {

          }
          else
          {

          }
          goto LABEL_44;
        }

        v29 = v48;
        if (v50 == v48)
        {
LABEL_41:

LABEL_44:
          v19 = v49;
          v43 = v54;
LABEL_45:
          if (v43 != v19)
          {
LABEL_46:

          }
LABEL_47:

          if (refreshToken != v15)
          {

          }
LABEL_50:
          v12 = v56;
          v10 = v57;
          if (accessToken != v8)
            goto LABEL_51;
LABEL_52:

          goto LABEL_53;
        }
      }

      v19 = v49;
      v42 = v54;
LABEL_37:

      if (v42 == v19)
        goto LABEL_47;
      goto LABEL_46;
    }
    v13 = 0;
  }
LABEL_53:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_accessToken, "hash");
  v4 = -[NSString hash](self->_refreshToken, "hash") ^ v3;
  v5 = -[NSString hash](self->_patientID, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_expiration, "hash");
  return v6 ^ -[NSString hash](self->_scope, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HDFHIRAuthResponse accessToken](self, "accessToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessToken"));

  -[HDFHIRAuthResponse refreshToken](self, "refreshToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("refreshToken"));

  -[HDFHIRAuthResponse patientID](self, "patientID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("patientID"));

  -[HDFHIRAuthResponse expiration](self, "expiration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("expiration"));

  -[HDFHIRAuthResponse scope](self, "scope");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("scope"));

}

- (HDFHIRAuthResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDFHIRAuthResponse *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshToken"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patientID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v7)
  {
    self = -[HDFHIRAuthResponse initWithAccessToken:refreshToken:patientID:expiration:scope:](self, "initWithAccessToken:refreshToken:patientID:expiration:scope:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)patientID
{
  return self->_patientID;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSString)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_patientID, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end
