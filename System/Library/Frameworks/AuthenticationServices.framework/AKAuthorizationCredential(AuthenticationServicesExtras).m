@implementation AKAuthorizationCredential(AuthenticationServicesExtras)

- (ASAuthorizationAppleIDCredential)authenticationServicesCredential
{
  ASAuthorizationAppleIDCredential *v2;
  void *v3;
  void *v4;
  ASAuthorizationAppleIDCredential *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v2 = [ASAuthorizationAppleIDCredential alloc];
  objc_msgSend(a1, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_credentialScopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASAuthorizationAppleIDCredential initWithUser:authorizedScopes:](v2, "initWithUser:authorizedScopes:", v3, v4);

  objc_msgSend(a1, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationAppleIDCredential setIdentityToken:](v5, "setIdentityToken:", v6);

  objc_msgSend(a1, "authorizationCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationAppleIDCredential setAuthorizationCode:](v5, "setAuthorizationCode:", v7);

  objc_msgSend(a1, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationAppleIDCredential setState:](v5, "setState:", v8);

  objc_msgSend(a1, "userInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "selectedEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationAppleIDCredential setEmail:](v5, "setEmail:", v11);

    v12 = objc_alloc_init(MEMORY[0x24BDD1730]);
    objc_msgSend(v10, "familyName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFamilyName:", v13);

    objc_msgSend(v10, "givenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGivenName:", v14);

    -[ASAuthorizationAppleIDCredential setFullName:](v5, "setFullName:", v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ASAuthorizationAppleIDCredential setUserAgeRange:](v5, "setUserAgeRange:", objc_msgSend(v10, "userAgeRange"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(a1, "isLikelyRealUser"))
      v15 = 2;
    else
      v15 = 1;
    -[ASAuthorizationAppleIDCredential setRealUserStatus:](v5, "setRealUserStatus:", v15);
  }

  return v5;
}

- (id)_credentialScopes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  const __CFString *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "authorizedScopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "authorizedScopes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x24BE0AC00];
    v10 = *MEMORY[0x24BE0ABF8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isEqualToString:", v9);
        v14 = CFSTR("full_name");
        if ((v13 & 1) == 0)
        {
          v15 = objc_msgSend(v12, "isEqualToString:", v10);
          v14 = CFSTR("email");
          if (!v15)
            continue;
        }
        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

@end
