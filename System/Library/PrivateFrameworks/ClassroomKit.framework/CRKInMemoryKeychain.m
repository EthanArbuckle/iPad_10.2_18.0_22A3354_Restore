@implementation CRKInMemoryKeychain

- (CRKInMemoryKeychain)init
{
  CRKInMemoryKeychain *v2;
  uint64_t v3;
  NSMutableDictionary *keychainItemsByPersistentID;
  uint64_t v5;
  NSMutableDictionary *passwordDatasByService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKInMemoryKeychain;
  v2 = -[CRKInMemoryKeychain init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keychainItemsByPersistentID = v2->_keychainItemsByPersistentID;
    v2->_keychainItemsByPersistentID = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    passwordDatasByService = v2->_passwordDatasByService;
    v2->_passwordDatasByService = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  -[CRKInMemoryKeychain passwordDatasByService](self, "passwordDatasByService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)certificateWithPersistentID:(id)a3
{
  return -[CRKInMemoryKeychain itemWithPersistentID:expectedProtocol:](self, "itemWithPersistentID:expectedProtocol:", a3, &unk_255033010);
}

- (id)identityWithPersistentID:(id)a3
{
  return -[CRKInMemoryKeychain itemWithPersistentID:expectedProtocol:](self, "itemWithPersistentID:expectedProtocol:", a3, &unk_255030E50);
}

- (id)privateKeyWithPersistentID:(id)a3
{
  return -[CRKInMemoryKeychain itemWithPersistentID:expectedProtocol:](self, "itemWithPersistentID:expectedProtocol:", a3, &unk_2550341D8);
}

- (id)passwordForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKInMemoryKeychain passwordDatasByService](self, "passwordDatasByService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateKeychainUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, unsigned __int8 *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unsigned __int8 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CRKInMemoryKeychain keychainItemsByPersistentID](self, "keychainItemsByPersistentID", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
      -[CRKInMemoryKeychain itemWithPersistentID:expectedProtocol:](self, "itemWithPersistentID:expectedProtocol:", v11, &unk_255017798);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11, v12, &v17);
      LODWORD(v11) = v17;

      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)makeIdentityWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKInMemoryKeychain validityDateIntervalForConfiguration:](self, "validityDateIntervalForConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKInMemoryIdentity identityWithConfiguration:validityDateInterval:](CRKInMemoryIdentity, "identityWithConfiguration:validityDateInterval:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeCertificateWithData:(id)a3
{
  return +[CRKInMemoryCertificate certificateWithData:](CRKInMemoryCertificate, "certificateWithData:", a3);
}

- (void)removeItemWithPersistentID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKInMemoryKeychain keychainItemsByPersistentID](self, "keychainItemsByPersistentID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

}

- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4
{
  id v5;
  id v6;
  CRKInMemoryIdentity *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRKInMemoryIdentity initWithCertificate:privateKey:]([CRKInMemoryIdentity alloc], "initWithCertificate:privateKey:", v6, v5);

  return v7;
}

- (id)makePrivateKeyWithData:(id)a3
{
  id v3;
  CRKInMemoryPrivateKey *v4;

  v3 = a3;
  v4 = -[CRKInMemoryPrivateKey initWithData:]([CRKInMemoryPrivateKey alloc], "initWithData:", v3);

  return v4;
}

- (id)itemWithPersistentID:(id)a3 expectedProtocol:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CRKInMemoryKeychain keychainItemsByPersistentID](self, "keychainItemsByPersistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKInMemoryKeychain delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CRKInMemoryKeychain delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inMemoryKeychain:overriddenItemForPersistentID:originalItem:", self, v6, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  if (v9)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", v7))
      v14 = v9;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (id)validityDateIntervalForConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD1508]);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v5, "initWithStartDate:duration:", v6, 15768000.0 + 15768000.0);

  -[CRKInMemoryKeychain delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CRKInMemoryKeychain delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inMemoryKeychain:validityDateIntervalForNewIdentityWithConfiguration:defaultInterval:", self, v4, v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }

  return v7;
}

- (id)addItem:(id)a3 toAccessGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  -[CRKInMemoryKeychain existingPersistentIDForItem:](self, "existingPersistentIDForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CRKInMemoryKeychain keychainItemsByPersistentID](self, "keychainItemsByPersistentID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

  }
  v10 = v6;

  return v10;
}

- (id)existingPersistentIDForItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CRKInMemoryKeychain_existingPersistentIDForItem___block_invoke;
  v8[3] = &unk_24D9C9AF8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[CRKInMemoryKeychain enumerateKeychainUsingBlock:](self, "enumerateKeychainUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __51__CRKInMemoryKeychain_existingPersistentIDForItem___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (CRKInMemoryKeychainDelegate)delegate
{
  return (CRKInMemoryKeychainDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)keychainItemsByPersistentID
{
  return self->_keychainItemsByPersistentID;
}

- (NSMutableDictionary)passwordDatasByService
{
  return self->_passwordDatasByService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordDatasByService, 0);
  objc_storeStrong((id *)&self->_keychainItemsByPersistentID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
