@implementation BCInternalAuthenticationManager

- (BCInternalAuthenticationManager)initWithAuthenticationRequest:(id)a3
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  BCInternalAuthenticationManager *v12;
  objc_super v14;

  v5 = (objc_class *)MEMORY[0x24BDB4398];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v8;
  v11 = v7;
  if (self)
  {
    v14.receiver = self;
    v14.super_class = (Class)BCInternalAuthenticationManager;
    v12 = -[BCInternalAuthenticationManager init](&v14, sel_init);
    self = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_accountStore, v7);
      objc_storeStrong((id *)&self->_account, v8);
      objc_storeStrong((id *)&self->_authenticationRequest, a3);
    }
  }

  return self;
}

- (void)fetchCredentials:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE0ACD8]);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:", v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke;
  v10[3] = &unk_24E064FC8;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "appleIDHeadersForRequest:completion:", 0, v10);

}

void __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[16];
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v30 = objc_alloc(MEMORY[0x24BDD1540]);
      v53 = *MEMORY[0x24BDD0FC8];
      v54[0] = CFSTR("Unable to access credentials");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("com.apple.icloud.messages.business.internalAuthentication"), 0, v31);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_54;
  }
  v8 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "authenticationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retrieve");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v8, "setObject:forKey:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "containsObject:", CFSTR("X-MMe-Client-Info")))
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "ak_clientInfoHeader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("X-MMe-Client-Info"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("X-MMe-Client-Info"));

  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("X-Mme-Device-Id")))
  {
    objc_msgSend(MEMORY[0x24BDD16B0], "ak_deviceUDIDHeader");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("X-Mme-Device-Id"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v8, "setObject:forKey:", v21, CFSTR("X-Mme-Device-Id"));

  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("person-identifier")))
  {
    v22 = *(_QWORD *)(a1 + 32);
    if (v22)
    {
      objc_msgSend(*(id *)(v22 + 16), "aa_personID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("person-identifier"));
    }
    else
    {
      v23 = 0;
    }

  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("alt-person-identifier")))
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
    {
      objc_msgSend(*(id *)(v24 + 16), "aida_alternateDSID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(v8, "setObject:forKey:", v25, CFSTR("alt-person-identifier"));
    }
    else
    {
      v25 = 0;
    }

  }
  if (objc_msgSend(v11, "containsObject:", CFSTR("serial-number")))
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      v29 = 0;
      goto LABEL_42;
    }
    *(_DWORD *)buf = 0;
    v26 = (void *)MGCopyAnswerWithError();
    v27 = v26;
    if (*(_DWORD *)buf)
    {
      LogCategory_Daemon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v49 = 0;
        _os_log_error_impl(&dword_21C655000, v28, OS_LOG_TYPE_ERROR, "BCInternalAuthenticationManager: Error fetching serial number", v49, 2u);
      }

      v29 = CFSTR("Unknown");
    }
    else
    {
      v29 = v26;

      if (!v29)
      {
LABEL_42:

        goto LABEL_43;
      }
    }
    objc_msgSend(v8, "setObject:forKey:", v29, CFSTR("serial-number"));
    goto LABEL_42;
  }
LABEL_43:
  if (objc_msgSend(v11, "containsObject:", CFSTR("X-Apple-GS-Token")))
  {
    v32 = *(_QWORD *)(a1 + 32);
    if (v32)
    {
      v33 = *(_QWORD *)(v32 + 16);
      v34 = *(id *)(v32 + 24);
      objc_msgSend(v34, "aida_accountForiCloudAccount:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "aida_tokenForService:", CFSTR("com.apple.gs.global.auth"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        objc_msgSend(v8, "setObject:forKey:", v36, CFSTR("X-Apple-GS-Token"));
    }
    else
    {
      v36 = 0;
    }

  }
  LogCategory_Daemon();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v8;
    _os_log_debug_impl(&dword_21C655000, v37, OS_LOG_TYPE_DEBUG, "BCInternalAuthenticationManager: Retrieved credentials %@", buf, 0xCu);
  }

  v44 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v8, 1, &v44);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v44;
  if (v39)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationRequest");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "responseEncryptionKey");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke_23;
    v42[3] = &unk_24E064FA0;
    v43 = *(id *)(a1 + 40);
    +[BCCryptor encryptData:key:completion:](BCCryptor, "encryptData:key:completion:", v38, v41, v42);

  }
LABEL_54:

}

uint64_t __52__BCInternalAuthenticationManager_fetchCredentials___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)username
{
  if (self)
    self = (BCInternalAuthenticationManager *)self->_account;
  return -[BCInternalAuthenticationManager username](self, "username");
}

- (NSString)firstName
{
  if (self)
    self = (BCInternalAuthenticationManager *)self->_account;
  return (NSString *)-[BCInternalAuthenticationManager aa_firstName](self, "aa_firstName");
}

- (NSString)middleName
{
  if (self)
    self = (BCInternalAuthenticationManager *)self->_account;
  return (NSString *)-[BCInternalAuthenticationManager aa_middleName](self, "aa_middleName");
}

- (NSString)lastName
{
  if (self)
    self = (BCInternalAuthenticationManager *)self->_account;
  return (NSString *)-[BCInternalAuthenticationManager aa_lastName](self, "aa_lastName");
}

- (BOOL)isUserSignedIn
{
  void *v2;
  BOOL v3;

  if (self)
    self = (BCInternalAuthenticationManager *)self->_account;
  -[BCInternalAuthenticationManager username](self, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[BCInternalAuthenticationManager authenticationRequest](self, "authenticationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCInternalAuthenticationManager labelCategory](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BCInternalAuthenticationManager state](self, "state");
  if (v7 == 3)
  {
    objc_msgSend(v6, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[BCShared classBundle]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("SIGN_IN_REQUIRED");
      goto LABEL_10;
    }
  }
  else
  {
    if (v7 != 2)
    {
      +[BCShared classBundle]();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_24E0651E8, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v6, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[BCShared classBundle]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("CONFIRM_TITLE");
LABEL_10:
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24E0651E8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      goto LABEL_11;
    }
  }
  v12 = (void *)v8;
  objc_msgSend(v6, "title");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = (void *)v13;
LABEL_11:

  return (NSString *)v14;
}

- (id)labelCategory
{
  uint64_t v1;
  id *v2;
  __CFString **v3;

  if (a1)
  {
    v1 = objc_msgSend(a1, "state");
    v2 = (id *)BCLabelCategoryAuthenticate;
    v3 = BCLabelCategorySignIn;
    if (v1 != 3)
      v3 = BCLabelCategoryFailure;
    if (v1 != 2)
      v2 = (id *)v3;
    a1 = *v2;
  }
  return a1;
}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[BCInternalAuthenticationManager authenticationRequest](self, "authenticationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCInternalAuthenticationManager labelCategory](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BCInternalAuthenticationManager state](self, "state");
  if (v7 == 3)
  {
    objc_msgSend(v6, "subtitle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[BCShared classBundle]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_MESSAGE"), &stru_24E0651E8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_6:
    v14 = (void *)v8;
    objc_msgSend(v6, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  if (v7 == 2)
  {
    objc_msgSend(v6, "subtitle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONFIRM_SUBTITLE"), &stru_24E0651E8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCInternalAuthenticationManager username](self, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      v14 = 0;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v13 = 0;
LABEL_11:

  return (NSString *)v13;
}

- (NSString)action
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[BCInternalAuthenticationManager authenticationRequest](self, "authenticationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCInternalAuthenticationManager labelCategory](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BCInternalAuthenticationManager state](self, "state");
  if (v7 == 3)
  {
    objc_msgSend(v6, "action");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[BCShared classBundle]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("SIGN_IN_BUTTON");
      goto LABEL_9;
    }
LABEL_6:
    v12 = (void *)v8;
    objc_msgSend(v6, "action");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  if (v7 == 2)
  {
    objc_msgSend(v6, "action");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[BCShared classBundle]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("CONFIRM_BUTTON");
LABEL_9:
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24E0651E8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v13 = 0;
LABEL_11:

  return (NSString *)v13;
}

- (int64_t)state
{
  if (-[BCInternalAuthenticationManager isUserSignedIn](self, "isUserSignedIn"))
    return 2;
  else
    return 3;
}

- (BCInternalAuthenticationRequest)authenticationRequest
{
  return self->_authenticationRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authenticationRequest, 0);
}

@end
