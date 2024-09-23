@implementation ECAuthScheme

+ (id)allocWithZone:(_NSZone *)a3
{
  id v6;
  objc_super v7;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot directly allocate a %@ object, use +knownSchemes, +schemeWithName:, or +authSchemesForAccount:connection: instead."), a1);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_claimAutoreleasedReturnValue(), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ECAuthScheme;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (NSArray)knownSchemes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  +[ECExternalAuthScheme externalAuthScheme](ECExternalAuthScheme, "externalAuthScheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  +[ECGSSAPIAuthScheme gssapiAuthScheme](ECGSSAPIAuthScheme, "gssapiAuthScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  +[ECAppleTokenAuthScheme appleTokenAuthScheme](ECAppleTokenAuthScheme, "appleTokenAuthScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v3;
  +[ECAppleToken2AuthScheme appleToken2AuthScheme](ECAppleToken2AuthScheme, "appleToken2AuthScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v4;
  +[ECOAuth2AuthScheme oauth2AuthScheme](ECOAuth2AuthScheme, "oauth2AuthScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v5;
  +[ECNTLMAuthScheme ntlmAuthScheme](ECNTLMAuthScheme, "ntlmAuthScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v6;
  +[ECDigestMD5AuthScheme digestMD5AuthScheme](ECDigestMD5AuthScheme, "digestMD5AuthScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v7;
  +[ECCramMD5AuthScheme cramMD5AuthScheme](ECCramMD5AuthScheme, "cramMD5AuthScheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v8;
  +[ECAPOPAuthScheme apopAuthScheme](ECAPOPAuthScheme, "apopAuthScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v9;
  +[ECPlainAuthScheme plainAuthScheme](ECPlainAuthScheme, "plainAuthScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

+ (id)schemeWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEqualToString:", &stru_1E7123500))
  {
    +[ECPlainAuthScheme plainAuthScheme](ECPlainAuthScheme, "plainAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v7 = (id)v6;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("X-APOP")))
  {
    +[ECAPOPAuthScheme apopAuthScheme](ECAPOPAuthScheme, "apopAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CRAM-MD5")))
  {
    +[ECCramMD5AuthScheme cramMD5AuthScheme](ECCramMD5AuthScheme, "cramMD5AuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("DIGEST-MD5")))
  {
    +[ECDigestMD5AuthScheme digestMD5AuthScheme](ECDigestMD5AuthScheme, "digestMD5AuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NTLM")))
  {
    +[ECNTLMAuthScheme ntlmAuthScheme](ECNTLMAuthScheme, "ntlmAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ATOKEN")))
  {
    +[ECAppleTokenAuthScheme appleTokenAuthScheme](ECAppleTokenAuthScheme, "appleTokenAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ATOKEN2")))
  {
    +[ECAppleToken2AuthScheme appleToken2AuthScheme](ECAppleToken2AuthScheme, "appleToken2AuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("XOAUTH2")))
  {
    +[ECOAuth2AuthScheme oauth2AuthScheme](ECOAuth2AuthScheme, "oauth2AuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("GSSAPI")))
  {
    +[ECGSSAPIAuthScheme gssapiAuthScheme](ECGSSAPIAuthScheme, "gssapiAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("EXTERNAL")))
  {
    +[ECExternalAuthScheme externalAuthScheme](ECExternalAuthScheme, "externalAuthScheme");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "knownSchemes", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "supportedSASLMechanisms");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v5);

        if ((v14 & 1) != 0)
        {
          v7 = v12;
          goto LABEL_34;
        }
      }
      v7 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_34:

LABEL_5:
  return v7;
}

+ (id)schemeWithApplescriptScheme:(unsigned int)a3
{
  void *v3;

  v3 = 0;
  if ((int)a3 <= 1635279731)
  {
    switch(a3)
    {
      case 0x6161706Fu:
        +[ECAPOPAuthScheme apopAuthScheme](ECAPOPAuthScheme, "apopAuthScheme");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 0x61746F32u:
        +[ECAppleToken2AuthScheme appleToken2AuthScheme](ECAppleToken2AuthScheme, "appleToken2AuthScheme");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 0x61746F6Bu:
        +[ECAppleTokenAuthScheme appleTokenAuthScheme](ECAppleTokenAuthScheme, "appleTokenAuthScheme");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else if ((int)a3 > 1635282275)
  {
    if (a3 == 1635282276)
    {
      +[ECCramMD5AuthScheme cramMD5AuthScheme](ECCramMD5AuthScheme, "cramMD5AuthScheme");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 1635282548)
    {
      +[ECNTLMAuthScheme ntlmAuthScheme](ECNTLMAuthScheme, "ntlmAuthScheme");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a3 == 1635279732)
  {
    +[ECPlainAuthScheme plainAuthScheme](ECPlainAuthScheme, "plainAuthScheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1635281717)
  {
    +[ECGSSAPIAuthScheme gssapiAuthScheme](ECGSSAPIAuthScheme, "gssapiAuthScheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)requiresUsername
{
  return 1;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (NSSet)supportedSASLMechanisms
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSString)name
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECAuthScheme.m"), 152, CFSTR("Subclass must implement."));

  return (NSString *)&stru_1E7123500;
}

- (NSString)humanReadableName
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECAuthScheme.m"), 157, CFSTR("Subclass must implement."));

  return (NSString *)&stru_1E7123500;
}

- (unsigned)applescriptScheme
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECAuthScheme.m"), 162, CFSTR("Subclass must implement."));

  return 1635284334;
}

@end
