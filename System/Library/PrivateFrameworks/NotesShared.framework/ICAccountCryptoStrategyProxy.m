@implementation ICAccountCryptoStrategyProxy

- (int64_t)intrinsicNotesVersion
{
  return 0;
}

- (ICAccountCryptoStrategy)customPasswordStrategy
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__ICAccountCryptoStrategyProxy_customPasswordStrategy__block_invoke;
  v4[3] = &unk_1E76CB0B0;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICAccountCryptoStrategy *)v2;
}

void __54__ICAccountCryptoStrategyProxy_customPasswordStrategy__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "accountData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsV1Neo") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPassphraseSet");

  if (!v5)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "v1Strategy");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)currentStrategy
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ICAccountCryptoStrategyProxy_currentStrategy__block_invoke;
  v4[3] = &unk_1E76CB0D8;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__ICAccountCryptoStrategyProxy_currentStrategy__block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(a2, "resolvedLockedNotesMode");
  if (v3 >= 2)
  {
    if (v3 != 2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "devicePasswordStrategy");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "customPasswordStrategy");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (ICAccountCryptoStrategyProxy)initWithCloudSyncingObject:(id)a3
{
  id v4;
  ICAccountCryptoStrategyProxy *v5;
  ICAccountCryptoStrategyV1 *v6;
  ICAccountCryptoStrategyV1 *v1Strategy;
  ICAccountCryptoStrategyV1Neo *v8;
  ICAccountCryptoStrategyV1Neo *v1NeoStrategy;
  ICAccountCryptoStrategyV2 *v10;
  ICAccountCryptoStrategyV2 *v2Strategy;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAccountCryptoStrategyProxy;
  v5 = -[ICCryptoStrategyBase initWithCloudSyncingObject:](&v13, sel_initWithCloudSyncingObject_, v4);
  if (v5)
  {
    v6 = -[ICCryptoStrategyBase initWithCloudSyncingObject:]([ICAccountCryptoStrategyV1 alloc], "initWithCloudSyncingObject:", v4);
    v1Strategy = v5->_v1Strategy;
    v5->_v1Strategy = v6;

    if (ICInternalSettingsIsLockedNotesV1NeoEnabled())
    {
      v8 = -[ICCryptoStrategyBase initWithCloudSyncingObject:]([ICAccountCryptoStrategyV1Neo alloc], "initWithCloudSyncingObject:", v4);
      v1NeoStrategy = v5->_v1NeoStrategy;
      v5->_v1NeoStrategy = v8;

    }
    v10 = -[ICCryptoStrategyBase initWithCloudSyncingObject:]([ICAccountCryptoStrategyV2 alloc], "initWithCloudSyncingObject:", v4);
    v2Strategy = v5->_v2Strategy;
    v5->_v2Strategy = v10;

  }
  return v5;
}

- (void)initializeCryptoPropertiesFromObject:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy initializeCryptoPropertiesFromObject:]", 1, 0, CFSTR("Cannot initialize account crypto properties from another object"));
}

- (BOOL)canAuthenticate
{
  void *v2;
  char v3;

  -[ICAccountCryptoStrategyProxy currentStrategy](self, "currentStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canAuthenticate");

  return v3;
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[ICAccountCryptoStrategyProxy currentStrategy](self, "currentStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICAccountCryptoStrategyProxy v1Strategy](self, "v1Strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasSameKeyAsObject:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[ICAccountCryptoStrategyProxy v1NeoStrategy](self, "v1NeoStrategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasSameKeyAsObject:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[ICAccountCryptoStrategyProxy v2Strategy](self, "v2Strategy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "hasSameKeyAsObject:", v4);

    }
  }

  return v6;
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy encryptFileFromURL:toURL:]", 1, 0, CFSTR("Account strategy proxy cannot encrypt files"));
  return 0;
}

- (id)encryptSidecarData:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy encryptSidecarData:]", 1, 0, CFSTR("Account strategy proxy cannot encrypt sidecar data"));
  return 0;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy encryptSidecarFileFromURL:toURL:]", 1, 0, CFSTR("Account strategy proxy cannot encrypt sidecar files"));
  return 0;
}

- (BOOL)saveEncryptedJSON
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy saveEncryptedJSON]", 1, 0, CFSTR("Account strategy proxy cannot save encrypted JSON"));
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cipherVersion");

  if (v6 == 2)
  {
    -[ICAccountCryptoStrategyProxy v1NeoStrategy](self, "v1NeoStrategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 1)
  {
    -[ICAccountCryptoStrategyProxy v2Strategy](self, "v2Strategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v9 = 0;
      goto LABEL_9;
    }
    -[ICAccountCryptoStrategyProxy v1Strategy](self, "v1Strategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "mainKeyDecryptsPrimaryData:", v4);

LABEL_9:
  return v9;
}

- (id)decryptSidecarData:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy decryptSidecarData:]", 1, 0, CFSTR("Account strategy proxy cannot decrypt sidecar data"));
  return 0;
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy loadDecryptedValuesIfNecessary]", 1, 0, CFSTR("Account strategy proxy cannot load decrypted values"));
  return 0;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[ICAccountCryptoStrategyProxy v1Strategy](self, "v1Strategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mergeEncryptedDataFromRecord:", v4))
  {
    -[ICAccountCryptoStrategyProxy v1NeoStrategy](self, "v1NeoStrategy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "mergeEncryptedDataFromRecord:", v4))
    {
      -[ICAccountCryptoStrategyProxy v2Strategy](self, "v2Strategy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mergeEncryptedDataFromRecord:", v4);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy encryptedData:rewrappedWithMainKey:]", 1, 0, CFSTR("Account strategy proxy cannot rewrap data"));
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy rewrapDataAtURL:withMainKey:]", 1, 0, CFSTR("Account strategy proxy cannot rewrap data at URL"));
  return 0;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy rewrapWithMainKey:]", 1, 0, CFSTR("Account strategy proxy cannot rewrap object"));
  return 0;
}

- (BOOL)hasPassphraseSet
{
  void *v2;
  char v3;

  -[ICAccountCryptoStrategyProxy customPasswordStrategy](self, "customPasswordStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPassphraseSet");

  return v3;
}

- (NSString)passphraseHint
{
  void *v2;
  void *v3;

  -[ICAccountCryptoStrategyProxy customPasswordStrategy](self, "customPasswordStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passphraseHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__ICAccountCryptoStrategyProxy_setPassphrase_hint___block_invoke;
  v11[3] = &unk_1E76CB100;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __51__ICAccountCryptoStrategyProxy_setPassphrase_hint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "v1Strategy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "setPassphrase:hint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "accountDataCreateIfNecessary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSupportsV1Neo:", 0);
    objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "setPassphrase:hint:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v8)
      v10 = *(_BYTE *)(v9 + 24) != 0;
    else
      v10 = 0;
    *(_BYTE *)(v9 + 24) = v10;

  }
}

- (void)removePassphrase
{
  void *v3;
  id v4;

  -[ICAccountCryptoStrategyProxy v1Strategy](self, "v1Strategy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePassphrase");

  -[ICAccountCryptoStrategyProxy v1NeoStrategy](self, "v1NeoStrategy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePassphrase");

}

- (id)mainKeyForPassphrase:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy mainKeyForPassphrase:]", 1, 0, CFSTR("Account strategy proxy cannot create main key for passphrase"));
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICAccountCryptoStrategyProxy customPasswordStrategy](self, "customPasswordStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPassphraseCorrect:", v4);

  return v6;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICAccountCryptoStrategyProxy_authenticateWithPassphrase___block_invoke;
  v7[3] = &unk_1E76CB128;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __59__ICAccountCryptoStrategyProxy_authenticateWithPassphrase___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  objc_msgSend(*(id *)(a1 + 32), "v1Strategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "authenticateWithPassphrase:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPassphraseSet");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "v1Strategy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passphraseHint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPassphrase:hint:", v7, v9);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "v1NeoStrategy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "authenticateWithPassphrase:", *(_QWORD *)(a1 + 40));

  if (v11)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountCryptoStrategyProxy recordHasChangedPassphrase:]", 1, 0, CFSTR("Account strategy proxy cannot determine if record has changed passphrase"));
  return 0;
}

- (ICAccountCryptoStrategyV1)v1Strategy
{
  return self->_v1Strategy;
}

- (ICAccountCryptoStrategyV1Neo)v1NeoStrategy
{
  return self->_v1NeoStrategy;
}

- (ICAccountCryptoStrategyV2)v2Strategy
{
  return self->_v2Strategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v2Strategy, 0);
  objc_storeStrong((id *)&self->_v1NeoStrategy, 0);
  objc_storeStrong((id *)&self->_v1Strategy, 0);
}

@end
