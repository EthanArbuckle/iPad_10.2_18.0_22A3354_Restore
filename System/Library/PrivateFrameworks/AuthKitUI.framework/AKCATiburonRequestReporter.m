@implementation AKCATiburonRequestReporter

- (AKCATiburonRequestReporter)initWithRequestContext:(id)a3
{
  id v4;
  AKCATiburonRequestReporter *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKCATiburonRequestReporter;
  v5 = -[AKCAReporter initWithEvent:](&v26, sel_initWithEvent_, CFSTR("com.apple.AuthKit.TiburonRequest"));
  if (v5)
  {
    objc_msgSend(v4, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, CFSTR("requestID"));

    objc_msgSend(v4, "authorizationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C9AAB0];
    v10 = MEMORY[0x1E0C9AAA0];
    if (v8)
      v11 = MEMORY[0x1E0C9AAB0];
    else
      v11 = MEMORY[0x1E0C9AAA0];
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("includesAuthorizationRequest"));

    objc_msgSend(v4, "passwordRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v9;
    else
      v13 = v10;
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("includesPasswordRequest"));

    if ((objc_msgSend(v4, "_isRapportLogin") & 1) != 0)
    {
      v14 = CFSTR("tv");
    }
    else if (objc_msgSend(v4, "_isFirstPartyLogin") && (objc_msgSend(v4, "_isWebLogin") & 1) != 0)
    {
      v14 = CFSTR("appleweb");
    }
    else if ((objc_msgSend(v4, "_isWebLogin") & 1) != 0)
    {
      v14 = CFSTR("web");
    }
    else if (objc_msgSend(v4, "_isFirstPartyLogin"))
    {
      v14 = CFSTR("apple");
    }
    else
    {
      v14 = CFSTR("app");
    }
    -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, CFSTR("originClientType"));
    objc_msgSend(v4, "authorizationRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "authorizationRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "clientID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("clientID"));

      objc_msgSend(v4, "_proxiedClientAppID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, CFSTR("appID"));

      objc_msgSend(v4, "authorizationRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "teamID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("teamID"));

      objc_msgSend(v4, "authorizationRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "existingStatus") != 1;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("isFirstTimeAuth"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "_isEligibleForUpgradeFromPassword"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCAReporter setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("isUpgradeFromPassword"));

    }
  }

  return v5;
}

- (void)didCompleteWithAuthorization:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int isKindOfClass;
  void *v10;
  int v11;
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
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "authorizedRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v7, "authorizedRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isKindOfClass & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v12, CFSTR("authorizationRequestSuccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 & 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v13, CFSTR("passwordRequestSuccess"));

  objc_msgSend(v6, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v14, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v15, CFSTR("errorCode"));

  AKErrorUnderlyingError();
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v22)
  {
    objc_msgSend(v22, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v17, CFSTR("underlyingErrorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, CFSTR("underlyingErrorCode"));

    v16 = v22;
  }
  if (((isKindOfClass | v11) & 1) != 0)
  {
    -[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("clientID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("<akredacted>"), CFSTR("clientID"));
    -[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("appID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("<akredacted>"), CFSTR("appID"));
    -[AKCAReporter objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("teamID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v22;
    if (v21)
    {
      -[AKCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", CFSTR("<akredacted>"), CFSTR("teamID"));
      v16 = v22;
    }
  }

}

@end
