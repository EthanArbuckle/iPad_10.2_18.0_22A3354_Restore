@implementation _LAKeyStoreGenericPassword

+ (id)buildWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a3;
  v6 = *MEMORY[0x1E0CD6A90];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v5, "objectForKeyedSubscript:", v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v10 = objc_opt_isKindOfClass(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CD69B0];
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD69B0]);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13
      && (v14 = (void *)v13,
          objc_msgSend(v5, "objectForKeyedSubscript:", v12),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v16 = objc_opt_isKindOfClass(),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CD70D8];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19
        && (v20 = (void *)v19,
            objc_msgSend(v5, "objectForKeyedSubscript:", v18),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v21,
            v20,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[_LAKeyStoreGenericPassword initWithIdentifier:publicKeyHash:wrappedData:]((id *)[_LAKeyStoreGenericPassword alloc], v11, v17, v23);

      }
      else
      {
        +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'r_Data'"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0;
        if (a4 && v27)
        {
          +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'r_Data'"));
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'gena'"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      if (a4 && v26)
      {
        +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'gena'"));
        v24 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'labl'"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    if (a4 && v25)
    {
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Failed to build 'genp' due to missing 'labl'"));
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v24;
}

- (id)initWithIdentifier:(void *)a3 publicKeyHash:(void *)a4 wrappedData:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_LAKeyStoreGenericPassword;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 2, a4);
    }
  }

  return a1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)fetchDataWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cryptor);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_cryptor);
    objc_msgSend(v8, "decryptData:publicKeyHash:context:completion:", self->_wrappedData, self->_publicKeyHash, v9, v6);
  }
  else
  {
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", CFSTR("Could not load secret"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
  }

}

- (_LAKeyStoreGenericPasswordCryptor)cryptor
{
  return (_LAKeyStoreGenericPasswordCryptor *)objc_loadWeakRetained((id *)&self->_cryptor);
}

- (void)setCryptor:(id)a3
{
  objc_storeWeak((id *)&self->_cryptor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cryptor);
  objc_storeStrong((id *)&self->_wrapperKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_wrappedData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
