@implementation NGMFullDeviceIdentity

- (BOOL)requiresMigration
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyStore");

  if (v4 == 3)
    return 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__requiresMigration__block_invoke;
  v8[3] = &unk_24C4BEE50;
  v8[4] = &v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  v5 = *((_BYTE *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __75__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__requiresMigration__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "dhKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keyStore");

  if (v7 == 3)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)deleteKeyWithTag:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const __CFDictionary *v7;
  OSStatus v8;
  int v9;
  NSObject *v11;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9230];
  v4 = *MEMORY[0x24BDE9128];
  v14[0] = *MEMORY[0x24BDE9220];
  v14[1] = v4;
  v15[0] = v3;
  v15[1] = CFSTR("com.apple.messageprotection");
  v14[2] = *MEMORY[0x24BDE8FA8];
  v15[2] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  v7 = (const __CFDictionary *)objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, v14, 3);

  v8 = SecItemDelete(v7);
  v9 = v8;
  if (v8 != -25300 && v8 != 0)
  {
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[NGMFullDeviceIdentity(MigrationToModernizedKeyStorage) deleteKeyWithTag:].cold.1(v9, v11);

  }
  return !v9 || v9 == -25300;
}

- (void)postMigrationKeychainCleanup
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyStore");

  if (v4 == 3)
  {
    -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NGMFullDeviceIdentity deleteKeyWithTag:](self, "deleteKeyWithTag:", v6);
    if (*((_BYTE *)v14 + 24))
      v8 = v7;
    else
      v8 = 0;
    *((_BYTE *)v14 + 24) = v8;

  }
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__postMigrationKeychainCleanup__block_invoke;
  v12[3] = &unk_24C4BEE78;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  if (*((_BYTE *)v14 + 24))
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20BABB000, v10, OS_LOG_TYPE_INFO, "Migration to CTKOID key storage done.", v11, 2u);
    }
  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NGMFullDeviceIdentity(MigrationToModernizedKeyStorage) postMigrationKeychainCleanup].cold.1(v10);
  }

  _Block_object_dispose(&v13, 8);
}

void __86__NGMFullDeviceIdentity_MigrationToModernizedKeyStorage__postMigrationKeychainCleanup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  char v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "dhKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyStore");

  if (v4 == 3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v11, "dhKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "deleteKeyWithTag:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v9 + 24))
      v10 = v8;
    else
      v10 = 0;
    *(_BYTE *)(v9 + 24) = v10;

  }
}

- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  MessageProtectionLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v17 = a4;
    _os_log_impl(&dword_20BABB000, v9, OS_LOG_TYPE_INFO, "Signing with Identity Key for message type: %li", buf, 0xCu);
  }

  if ((unint64_t)a4 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request to sign with unknown signature type: %li"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 4001;
LABEL_8:
    MPLogAndAssignError(v14, a5, v11);
    v13 = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend(objc_alloc(*off_24C4BEE98[a4]), "initWithApplicationData:", v8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request to sign but no signature formatter for type: %li"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 4002;
    goto LABEL_8;
  }
  v11 = (void *)v10;
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signDataWithFormatter:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[NGMFullDeviceIdentity sign:forType:error:](self, "sign:forType:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), a4, a5, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15 || *a5)
        {

          v17 = 0;
          goto LABEL_12;
        }
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }

  v17 = v9;
LABEL_12:

  return v17;
}

- (NGMFullDeviceIdentity)initWithSigningKey:(id)a3 devicePrekeys:(id)a4
{
  id v6;
  id v7;
  NGMFullDeviceIdentity *v8;
  NGMFullDeviceIdentity *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NGMFullDeviceIdentity;
  v8 = -[NGMFullDeviceIdentity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NGMFullDeviceIdentity setDeviceSigningKey:](v8, "setDeviceSigningKey:", v6);
    -[NGMFullDeviceIdentity setDevicePrekeys:](v9, "setDevicePrekeys:", v7);
  }

  return v9;
}

+ (id)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "identityWithAccess:error:", a3, a5);
}

+ (id)identityWithAccess:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NGMFullPrekey *v11;
  void *v12;
  NGMFullPrekey *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE8FA0]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDE8F70]) & 1) != 0)
  {
    +[FullKey generateNewKeyWithAccess:error:](SigningKey, "generateNewKeyWithAccess:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc((Class)a1);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithSigningKey:devicePrekeys:", v7, v9);

      v11 = [NGMFullPrekey alloc];
      objc_msgSend(v10, "deviceSigningKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NGMFullPrekey initWithPrekeySignedBy:error:](v11, "initWithPrekeySignedBy:error:", v12, a4);

      if (v13)
      {
        objc_msgSend(v10, "devicePrekeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

        v15 = v10;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      MessageProtectionLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[NGMFullDeviceIdentity identityWithAccess:error:].cold.1(a4, v16);

      v15 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A NGMFullDeviceIdentity Key generation was requested,                                                                                      but failed because it was requested with access: %@"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(501, a4, v17);

    v15 = 0;
  }

  return v15;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  NGMPBFullDeviceIdentity *v7;
  SigningKey *v8;
  void *v9;
  SigningKey *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NGMFullPrekey *v19;
  void *v20;
  NGMFullPrekey *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id *v27;
  objc_class *v28;
  NGMPBFullDeviceIdentity *v29;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[NGMPBFullDeviceIdentity initWithData:]([NGMPBFullDeviceIdentity alloc], "initWithData:", v6);
  if (v7)
  {
    v28 = (objc_class *)a1;
    v30 = v6;
    v8 = [SigningKey alloc];
    -[NGMPBFullDeviceIdentity signingKey](v7, "signingKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a4;
    v10 = -[FullKey initWithProtobufferData:error:](v8, "initWithProtobufferData:error:", v9, a4);

    v11 = (void *)MEMORY[0x24BDBCEB8];
    -[NGMPBFullDeviceIdentity prekeys](v7, "prekeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v7;
    -[NGMPBFullDeviceIdentity prekeys](v7, "prekeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17);
          v19 = [NGMFullPrekey alloc];
          -[SigningKey publicKey](v10, "publicKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v21 = -[NGMFullPrekey initWithPBPrekey:verifySignedBy:error:](v19, "initWithPBPrekey:verifySignedBy:error:", v18, v20, &v32);
          v22 = v32;

          if (v21)
          {
            objc_msgSend(v31, "addObject:", v21);
          }
          else
          {
            MessageProtectionLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              +[NGMFullDeviceIdentity identityWithDataRepresentation:error:].cold.1(v37, v22, &v38, v23);

          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v15);
    }

    if (v10)
    {
      v24 = v31;
      v25 = (void *)objc_msgSend([v28 alloc], "initWithSigningKey:devicePrekeys:", v10, v31);
      v6 = v30;
    }
    else
    {
      MPLogAndAssignError(200, v27, CFSTR("Failed to initialize signing keys from NGMFullDeviceIdentity data."));
      v25 = 0;
      v6 = v30;
      v24 = v31;
    }

    v7 = v29;
  }
  else
  {
    MPLogAndAssignError(303, a4, CFSTR("The deserialization of the NGMFullDeviceIdentity failed."));
    v25 = 0;
  }

  return v25;
}

- (id)dataRepresentationWithError:(id *)a3
{
  _BOOL4 v4;
  NSObject *v5;
  NGMPBFullDeviceIdentity *v6;
  void *v7;
  void *v8;
  void *v9;
  NGMPBFullDeviceIdentity *v10;
  void *v11;
  _QWORD v13[4];
  NGMPBFullDeviceIdentity *v14;
  uint8_t buf[16];

  v4 = -[NGMFullDeviceIdentity requiresMigration](self, "requiresMigration", a3);
  if (v4)
  {
    MessageProtectionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20BABB000, v5, OS_LOG_TYPE_INFO, "Starting key migration to CTKOID.", buf, 2u);
    }

  }
  v6 = objc_alloc_init(NGMPBFullDeviceIdentity);
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "protobuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBFullDeviceIdentity setSigningKey:](v6, "setSigningKey:", v8);

  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__NGMFullDeviceIdentity_dataRepresentationWithError___block_invoke;
  v13[3] = &unk_24C4BEED8;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  -[NGMPBFullDeviceIdentity data](v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NGMFullDeviceIdentity postMigrationKeychainCleanup](self, "postMigrationKeychainCleanup");

  return v11;
}

void __53__NGMFullDeviceIdentity_dataRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pbDevicePrekey");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPrekeys:", v3);

}

- (id)publicDeviceIdentityWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NGMPublicDeviceIdentity *v13;
  void *v14;
  void *v15;
  NGMPublicDeviceIdentity *v16;

  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publicPrekey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tetraPrivateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tetraRegistration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = [NGMPublicDeviceIdentity alloc];
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "publicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NGMPublicDeviceIdentity initWithEchnidaRegistration:tetraRegistration:signingKey:](v13, "initWithEchnidaRegistration:tetraRegistration:signingKey:", v6, v12, v15);

  return v16;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_error___block_invoke;
  v13[3] = &unk_24C4BEF00;
  v13[4] = &v20;
  v13[5] = &v14;
  -[NGMFullDeviceIdentity unsealMessage:signedByPublicIdentity:decryptionBlock:](self, "unsealMessage:signedByPublicIdentity:decryptionBlock:", v8, v9, v13);
  v10 = (void *)v21[5];
  if (v10)
  {
    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v11 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __68__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD *);
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v11 + 40);
    ((void (**)(id, void **))v10)[2](v10, &v14);
    v12 = v14;
    v13 = (id *)(v11 + 40);
  }
  else
  {
    v13 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v12 = a3;
  }
  objc_storeStrong(v13, v12);

}

- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_decryptionBlock___block_invoke;
  v10[3] = &unk_24C4BEF28;
  v11 = v8;
  v9 = v8;
  -[NGMFullDeviceIdentity unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:](self, "unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:", a3, a4, v10);

}

uint64_t __78__NGMFullDeviceIdentity_unsealMessage_signedByPublicIdentity_decryptionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(CFSTR("noPushToken"), "dataUsingEncoding:", 4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("noPushToken"), "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMFullDeviceIdentity unsealMessageAndAttributes:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:](self, "unsealMessageAndAttributes:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:", v13, v12, CFSTR("noURI"), v15, CFSTR("noURI"), v14, v11, v10);

}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 signedByPublicIdentity:(id)a9 decryptionBlock:(id)a10
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v17 = (void *)MEMORY[0x24BDBCE50];
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  objc_msgSend(v17, "data");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[NGMFullDeviceIdentity unsealMessageAndAttributes:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:](self, "unsealMessageAndAttributes:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:", v25, v26, 0, v24, v23, v22, v21, v20, v19, v18);

}

- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12
{
  void (**v17)(id, uint64_t, _QWORD, void *, uint64_t);
  NSObject *v18;
  void *v19;
  NGMPBOuterMessage *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  uint64_t *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD aBlock[6];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t *v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD *v82;
  _BYTE *v83;
  uint64_t *v84;
  uint64_t *v85;
  _QWORD v86[5];
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void *(*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  _QWORD v106[5];
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  void *(*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint8_t v120[4];
  id v121;
  _BYTE buf[24];
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v68 = a3;
  v61 = a4;
  v67 = a6;
  v62 = a7;
  v63 = a8;
  v64 = a9;
  v65 = a10;
  v66 = a11;
  v17 = (void (**)(id, uint64_t, _QWORD, void *, uint64_t))a12;
  MessageProtectionLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v67;
    _os_log_impl(&dword_20BABB000, v18, OS_LOG_TYPE_INFO, "Unsealing message with GUID: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[NGMPBOuterMessage initWithData:]([NGMPBOuterMessage alloc], "initWithData:", v68);
  -[NGMPBOuterMessage ephemeralPubKey](v20, "ephemeralPubKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[NGMPBOuterMessage encryptedPayload](v20, "encryptedPayload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 != 0;

  }
  else
  {
    v23 = 0;
  }

  v24 = -[NGMPBOuterMessage hasTetraMessage](v20, "hasTetraMessage");
  MessageProtectionLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v67;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v23;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v24;
    _os_log_impl(&dword_20BABB000, v25, OS_LOG_TYPE_INFO, "Message with GUID: %@ hasEchnidaPayload=%d hasSecondaryPayload=%d", buf, 0x18u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v123 = __Block_byref_object_copy_;
  v124 = __Block_byref_object_dispose_;
  v125 = 0;
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = __Block_byref_object_copy_;
  v118 = __Block_byref_object_dispose_;
  v119 = 0;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__21;
  v112 = __Block_byref_object_dispose__22;
  v113 = 0;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = __Block_byref_object_copy_;
  v106[4] = __Block_byref_object_dispose_;
  v107 = 0;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy_;
  v104 = __Block_byref_object_dispose_;
  v105 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy_;
  v98 = __Block_byref_object_dispose_;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__21;
  v92 = __Block_byref_object_dispose__22;
  v93 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy_;
  v86[4] = __Block_byref_object_dispose_;
  v87 = 0;
  if (v23)
  {
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke;
    v80[3] = &unk_24C4BEF50;
    v82 = v106;
    v81 = v19;
    v83 = buf;
    v84 = &v114;
    v85 = &v108;
    -[NGMFullDeviceIdentity unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:](self, "unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:", v68, v66, v80);

    if (!v24)
    {
      v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
LABEL_31:
      v51 = v115 + 5;
      v52 = v109;
      goto LABEL_32;
    }
  }
  else if (!v24)
  {
    v36 = v101;
    goto LABEL_21;
  }
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "publicKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dataRepresentation");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v66, "isTetraCompatibleWithFullKey:", self) & 1) != 0)
  {
    if (v60)
    {
      MessageProtectionLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v120 = 138412290;
        v121 = v67;
        _os_log_impl(&dword_20BABB000, v29, OS_LOG_TYPE_INFO, "Starting Tetra decryption of GUID: %@", v120, 0xCu);
      }

      -[NGMPBOuterMessage tetraMessage](v20, "tetraMessage");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "signingKey");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "tetraWrapped");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "tetraRegistration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "tetraVersion");
      -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_30;
      v71[3] = &unk_24C4BEF78;
      v72 = v67;
      v74 = v86;
      v73 = v19;
      v75 = &v100;
      v76 = &v94;
      v77 = &v88;
      LODWORD(v53) = v33;
      +[TetraAPI openWithMessage:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedBy:tetraVersion:ourPrekeys:ourSigningPublicKeyCompactRepresentation:decryptionBlock:](_TtC17MessageProtection8TetraAPI, "openWithMessage:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedBy:tetraVersion:ourPrekeys:ourSigningPublicKeyCompactRepresentation:decryptionBlock:", v58, v61, v72, v62, v63, v64, v65, v31, v53, v34, v60, v71);

      v35 = v72;
    }
    else
    {
      v78 = 0;
      v38 = (void *)MEMORY[0x24BDD17C8];
      -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "description");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "publicKey");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "description");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "publicKey");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "dataRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "description");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("Unable to serialize the device public signing key (%@ %@ %@)."), v55, v54, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      MPLogAndAssignError(3, &v78, v43);
      v35 = v78;

      objc_msgSend(v19, "setObject:forKey:", v35, &unk_24C4C9198);
    }
  }
  else
  {
    v79 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received a Tetra message (%@), but the sender identity version is not compatible with ours."), v67);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(3001, &v79, v37);
    v35 = v79;

    objc_msgSend(v19, "setObject:forKey:", v35, &unk_24C4C9198);
  }

  v36 = v101;
  if (!v23)
  {
    v26 = v101[5];
    v51 = v95 + 5;
    v52 = v89;
LABEL_32:
    v17[2](v17, v26, *v51, v19, v52[5]);
    goto LABEL_33;
  }
LABEL_21:
  v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v44 = (void *)v36[5];
  if (v26)
  {
    if (!v44)
      goto LABEL_31;
    if ((objc_msgSend(v44, "isEqualToData:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)) & 1) == 0)
    {
      v45 = (void *)MEMORY[0x24BDD17C8];
      v46 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "length");
      objc_msgSend(v45, "stringWithFormat:", CFSTR("Non-matching double-encryption payloads (Echnida: %lu, Tetra: %lu)"), v46, objc_msgSend((id)v101[5], "length"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      MPLogAndAssignError(3002, &v70, v47);
      v48 = v70;
      objc_msgSend(v19, "setObject:forKey:", v48, &unk_24C4C9198);
      MessageProtectionLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        -[NGMFullDeviceIdentity unsealMessageAndAttributes:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:].cold.1((uint64_t)v47, v49);

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_33;
    aBlock[3] = &unk_24C4BEFA0;
    aBlock[4] = &v108;
    aBlock[5] = &v88;
    v50 = _Block_copy(aBlock);
    v17[2](v17, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v115[5], v19, (uint64_t)v50);

  }
  else
  {
    if (!v44)
      goto LABEL_31;
    v17[2](v17, (uint64_t)v44, v95[5], v19, v89[5]);
  }
LABEL_33:
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(buf, 8);
}

void __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  v13 = *(void **)(a1 + 32);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, &unk_24C4C9180);
  }
  else
  {
    NoError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, &unk_24C4C9180);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    v15 = _Block_copy(v12);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

void __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  MessageProtectionLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v21 = 138412290;
    v22 = v15;
    _os_log_impl(&dword_20BABB000, v14, OS_LOG_TYPE_INFO, "Finished Tetra decryption of GUID: %@", (uint8_t *)&v21, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  v16 = *(void **)(a1 + 40);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, &unk_24C4C9198);
  }
  else
  {
    NoError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, &unk_24C4C9198);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
    v18 = _Block_copy(v13);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

uint64_t __186__NGMFullDeviceIdentity_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock___block_invoke_33(uint64_t a1)
{
  int v2;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
  return v2 & (*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NGMPBOuterMessage *v11;
  NGMPBOuterMessage *v12;
  void *v13;
  DHPublicKey *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NGMPBOuterMessage *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NGMMessageSignatureFormatter *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  BOOL v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NGMPBInnerMessage *v52;
  NGMPBInnerMessage *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id obj;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NGMPBInnerMessage *v83;
  NGMMessageSignatureFormatter *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  id v102;
  id v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  v78 = v8;
  v10 = a5;
  v11 = -[NGMPBOuterMessage initWithData:]([NGMPBOuterMessage alloc], "initWithData:", v7);
  v12 = v11;
  if (!v11)
  {
    v103 = 0;
    MPLogAndAssignError(301, &v103, CFSTR("The outer structure of the message is malformed."));
    v17 = v103;
LABEL_20:
    (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v10 + 2))(v10, 0, 0, v17, 0);
    goto LABEL_56;
  }
  v69 = v10;
  -[NGMPBOuterMessage ephemeralPubKey](v11, "ephemeralPubKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v102 = 0;
    MPLogAndAssignError(304, &v102, CFSTR("The outer structure of the message is missing the ephemeral DH key."));
    v17 = v102;
    v10 = v69;
    goto LABEL_20;
  }
  v68 = v7;
  v14 = [DHPublicKey alloc];
  -[NGMPBOuterMessage ephemeralPubKey](v12, "ephemeralPubKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v16 = -[PublicKey initWithData:error:](v14, "initWithData:error:", v15, &v101);
  v17 = v101;

  v79 = (void *)v16;
  if (!v16)
  {
LABEL_36:
    v10 = v69;
    (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v17, 0);
    goto LABEL_37;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reverseObjectEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v19;
  v76 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
  if (!v76)
    goto LABEL_16;
  v74 = *(_QWORD *)v98;
  while (2)
  {
    for (i = 0; i != v76; ++i)
    {
      if (*(_QWORD *)v98 != v74)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
      objc_msgSend(v21, "dhKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v17;
      objc_msgSend(v22, "keyAgreementWithPublicKey:error:", v79, &v96);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v96;

      if (v23)
      {
        v84 = [NGMMessageSignatureFormatter alloc];
        v70 = v21;
        objc_msgSend(v21, "publicPrekey");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "dhKey");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "dataRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NGMPBOuterMessage ephemeralPubKey](v12, "ephemeralPubKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "publicKey");
        v28 = v12;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dataRepresentation");
        v30 = v24;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NGMPBOuterMessage encryptedPayload](v28, "encryptedPayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v84;
        v85 = (void *)v23;
        v34 = -[NGMMessageSignatureFormatter initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:](v33, "initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:", v23, v25, v26, v31, v32);

        v35 = v30;
        v12 = v28;
        v36 = (void *)v34;

        -[NGMPBOuterMessage signature](v12, "signature");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v78, "verifySignature:formatter:", v37, v36);

        if (v35)
        {
          v10 = v69;
          (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v35, 0);
          v9 = v68;
          v42 = v85;
LABEL_54:

          v17 = v35;
          goto LABEL_55;
        }
        if (!v38)
        {

          v17 = 0;
          continue;
        }
        objc_msgSend(CFSTR("LastPawn-MessageKeys"), "dataUsingEncoding:", 4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v85;
        +[HKDF deriveKeyWith:salt:outputSize:](_TtC17MessageProtection4HKDF, "deriveKeyWith:salt:outputSize:", v85, v43, 48);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          v10 = v69;
          (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v69 + 2))(v69, 0, 0, 0, 0);
          v35 = 0;
          v9 = v68;
LABEL_53:

          goto LABEL_54;
        }
        objc_msgSend(v44, "subdataWithRange:", 0, 32);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "subdataWithRange:", 32, 16);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[NGMPBOuterMessage encryptedPayload](v12, "encryptedPayload");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        +[MP_AES_CTR decrypt:key:IV:](MP_AES_CTR, "decrypt:key:IV:", v47, v45, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v69;
        if (v48)
        {
          v94 = 0;
          +[NGMPadding unpadMessage:error:](NGMPadding, "unpadMessage:error:", v48, &v94);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v94;

          if (v49)
          {
            v81 = v45;
            v51 = v50;
            v52 = -[NGMPBInnerMessage initWithData:]([NGMPBInnerMessage alloc], "initWithData:", v49);
            v9 = v68;
            v83 = v52;
            if (v52)
            {
              v53 = v52;
              if (-[NGMPBInnerMessage hasCounter](v52, "hasCounter"))
              {
                v77 = v49;
                +[NGMReplayManager sharedManager](NGMReplayManager, "sharedManager");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = v54;
                if (v54)
                {
                  v90 = v51;
                  objc_msgSend(v54, "validateIncomingCounter:prekey:publicIdentity:error:", -[NGMPBInnerMessage counter](v53, "counter"), v70, v78, &v90);
                  v55 = objc_claimAutoreleasedReturnValue();
                  v56 = v90;

                  if (!v55)
                  {
                    v45 = v81;
                    if (v56)
                    {
                      v89 = v56;
                      v63 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend(v56, "description");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "stringWithFormat:", CFSTR("An error occured while validating the counter: %@"), v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      MPLogAndAssignError(6, &v89, v65);
                      v73 = v46;
                      v66 = v89;

                      (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v66, 0);
                      v56 = v66;
                      v46 = v73;
                    }
                    else
                    {
                      v88 = 0;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The message was rejected because of a detected replay."));
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      MPLogAndAssignError(5, &v88, v67);
                      v56 = v88;

                      (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v56, 0);
                    }
                    v9 = v68;
                    goto LABEL_50;
                  }
                  -[NGMPBInnerMessage message](v53, "message");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NGMPBInnerMessage attributes](v53, "attributes");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, void *, void *, _QWORD, NSObject *))v69 + 2))(v69, v57, v58, 0, v55);

                  v9 = v68;
                }
                else
                {
                  v91 = v51;
                  MPLogAndAssignError(604, &v91, CFSTR("Failed to initialize replay counter database."));
                  v56 = v91;

                  (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v56, 0);
                  MessageProtectionLog();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
                    -[NGMFullDeviceIdentity unsealMessageAndAttributes:signedByPublicIdentity:decryptionBlock:].cold.1(v55);
                }
                v45 = v81;
LABEL_50:

                v49 = v77;
                goto LABEL_51;
              }
              v92 = v51;
              MPLogAndAssignError(602, &v92, CFSTR("No Replay Counter Found."));
              v62 = v92;
            }
            else
            {
              v93 = v50;
              MPLogAndAssignError(300, &v93, CFSTR("Inside of the incoming payload could not be parsed."));
              v62 = v93;
            }
            v56 = v62;

            (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v56, 0);
            v45 = v81;
LABEL_51:

            v35 = v56;
            v10 = v69;
            goto LABEL_52;
          }
          (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v50, 0);
          v9 = v68;
          v35 = v50;
        }
        else
        {
          v95 = 0;
          MPLogAndAssignError(400, &v95, CFSTR("An error occured while decrypting the message, after a valid signature check."));
          v35 = v95;
          (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v35, 0);
          v9 = v68;
        }
LABEL_52:

        goto LABEL_53;
      }
      v17 = v24;
    }
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
    if (v76)
      continue;
    break;
  }
LABEL_16:

  -[NGMPBOuterMessage keyValidator](v12, "keyValidator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v17;
  v40 = +[NGMKeyValidator isValidKeyValidator:receiversIdentity:sendersIdentity:error:](NGMKeyValidator, "isValidKeyValidator:receiversIdentity:sendersIdentity:error:", v39, self, v78, &v87);
  v41 = v87;

  if (!v40)
  {
    v86 = v41;
    v59 = (void *)MEMORY[0x24BDD17C8];
    if (v41)
    {
      objc_msgSend(v41, "description");
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = CFSTR("None");
    }
    objc_msgSend(v59, "stringWithFormat:", CFSTR("No key could be found to validate the signature, with optional failure: %@."), v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(404, &v86, v61);
    v17 = v86;

    if (v41)
    goto LABEL_36;
  }
  (*((void (**)(id, _QWORD, _QWORD, id, _QWORD))v69 + 2))(v69, 0, 0, v41, 0);
  v17 = v41;
  v10 = v69;
LABEL_37:
  v9 = v68;
LABEL_55:

LABEL_56:
}

- (id)signDataWithFormatter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signDataWithFormatter:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldRollEncryptionIdentity
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  if (!-[NGMFullDeviceIdentity requiresMigration](self, "requiresMigration"))
  {
    -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (MPSecondaryRegistrationDisabled()
        && (objc_msgSend(v5, "tetraRegistration"), v6 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v6,
                                                   v6))
      {
        MessageProtectionLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v16 = 0;
          v8 = "Re-registering with a fresh prekey because Tetra was disabled and we still have a prekey with secondary registration.";
          v9 = (uint8_t *)&v16;
LABEL_17:
          _os_log_impl(&dword_20BABB000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
        }
      }
      else
      {
        objc_msgSend(v5, "tetraRegistration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v5, "tetraRegistration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "tetraVersion");
          v13 = v12 == +[TetraVersions currentTetraVersion](_TtC17MessageProtection13TetraVersions, "currentTetraVersion");

        }
        else
        {
          v13 = 0;
        }
        if ((MPSecondaryRegistrationDisabled() & 1) != 0 || v13)
        {
          v3 = +[NGMTimeBasedEvaluations prekeyShouldBeRolled:](NGMTimeBasedEvaluations, "prekeyShouldBeRolled:", v5);
          goto LABEL_20;
        }
        MessageProtectionLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v15 = 0;
          v8 = "Re-registering because of Tetra update or an enablement.";
          v9 = (uint8_t *)&v15;
          goto LABEL_17;
        }
      }
    }
    else
    {
      MessageProtectionLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v17 = 0;
        v8 = "No device prekey is available, rolling should occur.";
        v9 = (uint8_t *)&v17;
        goto LABEL_17;
      }
    }

    v3 = 1;
LABEL_20:

    return v3;
  }
  return 1;
}

- (BOOL)eraseFromKeyChain:(id *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "delete");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)keyRollingTicketWithError:(id *)a3
{
  NGMKeyRollingTicket *v5;
  void *v6;
  id v7;

  v5 = [NGMKeyRollingTicket alloc];
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NGMKeyRollingTicket initTicketWithSigningKey:error:](v5, "initTicketWithSigningKey:error:", v6, a3);

  return v7;
}

- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (+[NGMTimeBasedEvaluations prekeyCanBeDeleted:](NGMTimeBasedEvaluations, "prekeyCanBeDeleted:", v12))
        {
          objc_msgSend(v12, "delete");
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  +[NGMReplayManager sharedManager](NGMReplayManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteExpiredSendingDestinations");

  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsInArray:", v6);

  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prekey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__NGMFullDeviceIdentity_description__block_invoke;
  v9[3] = &unk_24C4BEE50;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[NGMFullDeviceIdentity deviceSigningKey](self, "deviceSigningKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("NGMFullDeviceIdentity with device signing key: %@ \n Prekeys: %@"), v6, v11[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __36__NGMFullDeviceIdentity_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

- (BOOL)testing_duplicatePrekeyRegistration
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[NGMReplayManager sharedManager](NGMReplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMFullDeviceIdentity devicePrekeys](self, "devicePrekeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "duplicateTagForPrekey:", v5);

  return v6;
}

- (SigningKey)deviceSigningKey
{
  return self->_deviceSigningKey;
}

- (void)setDeviceSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSigningKey, a3);
}

- (NSMutableArray)devicePrekeys
{
  return self->_devicePrekeys;
}

- (void)setDevicePrekeys:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrekeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePrekeys, 0);
  objc_storeStrong((id *)&self->_deviceSigningKey, 0);
}

+ (void)identityWithAccess:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Signing key generation failed: %@", (uint8_t *)&v4, 0xCu);

}

+ (void)identityWithDataRepresentation:(_QWORD *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_20BABB000, a4, OS_LOG_TYPE_ERROR, "Failed to deserialize prekey in NGMFullDeviceIdentity initialization: %@.", a1, 0xCu);

}

- (void)unsealMessageAndAttributes:(uint64_t)a1 authenticatedData:(NSObject *)a2 messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedByPublicIdentity:decryptionBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_20BABB000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)unsealMessageAndAttributes:(os_log_t)log signedByPublicIdentity:decryptionBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20BABB000, log, OS_LOG_TYPE_FAULT, "Failed to initialize replay counter database.", v1, 2u);
}

@end
