@implementation ACAccount(AppleIDAuthentication)

- (id)aida_tokenForService:()AppleIDAuthentication
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialForAccount:serviceID:", a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "token");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)aida_tokenWithExpiryCheckForService:()AppleIDAuthentication
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialForAccount:serviceID:", a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_expirationCheckedTokenForCredential:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)aida_tokenForService:()AppleIDAuthentication completionHandler:
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, void *, _QWORD);

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "aida_tokenWithExpiryCheckForService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      v7[2](v7, v8, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__ACAccount_AppleIDAuthentication__aida_tokenForService_completionHandler___block_invoke;
    v9[3] = &unk_1E985B538;
    v11 = v7;
    v10 = v6;
    objc_msgSend(a1, "_performSilentReauthForAccount:completionHandler:", a1, v9);

  }
}

- (id)aida_tokenWithExpirationCheck
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_expirationCheckedTokenForCredential:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)aida_alternateDSID
{
  void *v2;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("altDSID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "accountPropertyForKey:", CFSTR("adsid"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)aida_dsid
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "accountPropertyForKey:", CFSTR("dsid"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "stringValue");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (id)aida_deviceProvisioningInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "aida_dsid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3900];
  objc_msgSend(a1, "aida_dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scannerWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(v5, "scanUnsignedLongLong:", &v23);
  v21 = 0;
  v22 = 0;
  v20 = 0;
  qi864985u0(v23, (uint64_t)&v22, (uint64_t)&v20 + 4, (uint64_t)&v21, (uint64_t)&v20);
  if (v6)
  {
    v7 = v6;
    if (v6 == -45061)
    {
      _AIDALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Account not provisioned";
        v10 = v8;
        v11 = 2;
LABEL_14:
        _os_log_impl(&dword_1D4C1F000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      _AIDALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v7;
        v9 = "ADIOTPRequest failed. ERROR: %d";
        v10 = v8;
        v11 = 8;
        goto LABEL_14;
      }
    }
    v18 = 0;
    goto LABEL_16;
  }
  v12 = objc_alloc(MEMORY[0x1E0C99D50]);
  v8 = objc_msgSend(v12, "initWithBytesNoCopy:length:freeWhenDone:", v22, HIDWORD(v20), 0);
  v13 = objc_alloc(MEMORY[0x1E0C99D50]);
  v14 = (void *)objc_msgSend(v13, "initWithBytesNoCopy:length:freeWhenDone:", v21, v20, 0);
  -[NSObject base64EncodedStringWithOptions:](v8, "base64EncodedStringWithOptions:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _AIDALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1D4C1F000, v17, OS_LOG_TYPE_DEFAULT, "Provisioning Info: mid - %@ otp - %@", buf, 0x16u);
  }

  v24[0] = CFSTR("mid");
  v24[1] = CFSTR("otp");
  v25[0] = v15;
  v25[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    jk24uiwqrg(v22);
  if (v21)
    jk24uiwqrg(v21);

LABEL_16:
  return v18;
}

- (id)_expirationCheckedTokenForCredential:()AppleIDAuthentication
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenExpiryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "compare:", v4) != 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_performSilentReauthForAccount:()AppleIDAuthentication completionHandler:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D00128];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setAuthenticationType:", 1);
  objc_msgSend(v8, "setIsUsernameEditable:", 0);
  objc_msgSend(v8, "setServiceType:", 1);
  objc_msgSend(v8, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v7, "aida_alternateDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "length"))
    objc_msgSend(v8, "setAltDSID:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__ACAccount_AppleIDAuthentication___performSilentReauthForAccount_completionHandler___block_invoke;
  v12[3] = &unk_1E985B560;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "authenticateWithContext:completion:", v8, v12);

}

@end
