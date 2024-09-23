@implementation CRKConcreteKeychain

+ (CRKConcreteKeychain)defaultKeychain
{
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDE9538];
  v7[0] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseQueryAttributes:", v3);

  return (CRKConcreteKeychain *)v4;
}

- (CRKConcreteKeychain)initWithBaseQueryAttributes:(id)a3
{
  id v4;
  CRKConcreteKeychain *v5;
  uint64_t v6;
  NSDictionary *baseQueryAttributes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteKeychain;
  v5 = -[CRKConcreteKeychain init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    baseQueryAttributes = v5->_baseQueryAttributes;
    v5->_baseQueryAttributes = (NSDictionary *)v6;

  }
  return v5;
}

- (id)addCertificate:(id)a3 toAccessGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", objc_msgSend(v6, "underlyingCertificate"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addIdentity:(id)a3 toAccessGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", objc_msgSend(v6, "underlyingIdentity"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)addPrivateKey:(id)a3 toAccessGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", objc_msgSend(v6, "underlyingPrivateKey"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CRKConcreteKeychain makePasswordFacade](self, "makePasswordFacade");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPassword:forService:accessGroup:", v10, v9, v8);

}

- (id)certificateWithPersistentID:(id)a3
{
  return -[CRKConcreteKeychain makeItemWithPersistentID:itemClass:creationBlock:](self, "makeItemWithPersistentID:itemClass:creationBlock:", a3, *MEMORY[0x24BDE9228], &__block_literal_global_25);
}

CRKConcreteCertificate *__51__CRKConcreteKeychain_certificateWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[CRKConcreteCertificate initWithCertificate:]([CRKConcreteCertificate alloc], "initWithCertificate:", a2);
}

- (id)identityWithPersistentID:(id)a3
{
  return -[CRKConcreteKeychain makeItemWithPersistentID:itemClass:creationBlock:](self, "makeItemWithPersistentID:itemClass:creationBlock:", a3, *MEMORY[0x24BDE9238], &__block_literal_global_2_2);
}

CRKConcreteIdentity *__48__CRKConcreteKeychain_identityWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[CRKConcreteIdentity initWithIdentity:]([CRKConcreteIdentity alloc], "initWithIdentity:", a2);
}

- (id)privateKeyWithPersistentID:(id)a3
{
  return -[CRKConcreteKeychain makeItemWithPersistentID:itemClass:creationBlock:](self, "makeItemWithPersistentID:itemClass:creationBlock:", a3, *MEMORY[0x24BDE9248], &__block_literal_global_4_0);
}

CRKConcretePrivateKey *__50__CRKConcreteKeychain_privateKeyWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[CRKConcretePrivateKey initWithPrivateKey:]([CRKConcretePrivateKey alloc], "initWithPrivateKey:", a2);
}

- (id)passwordForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKConcreteKeychain makePasswordFacade](self, "makePasswordFacade");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4
{
  return +[CRKConcreteIdentity identityWithCertificate:privateKey:](CRKConcreteIdentity, "identityWithCertificate:privateKey:", a3, a4);
}

- (id)makeIdentityWithConfiguration:(id)a3
{
  return +[CRKConcreteIdentity identityWithConfiguration:](CRKConcreteIdentity, "identityWithConfiguration:", a3);
}

- (id)makeCertificateWithData:(id)a3
{
  return +[CRKConcreteCertificate certificateWithData:](CRKConcreteCertificate, "certificateWithData:", a3);
}

- (id)makePrivateKeyWithData:(id)a3
{
  return +[CRKConcretePrivateKey privateKeyWithData:](CRKConcretePrivateKey, "privateKeyWithData:", a3);
}

- (void)removeItemWithPersistentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OSStatus v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKConcreteKeychain baseQueryAttributes](self, "baseQueryAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v11 = *MEMORY[0x24BDE9558];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  v8 = SecItemDelete((CFDictionaryRef)v6);
  if (v8 != -25300 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CRKLogGeneral_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CRKConcreteKeychain removeItemWithPersistentID:].cold.1((uint64_t)v4, v9);

  }
}

- (id)makePasswordFacade
{
  CRKKeychainPasswordFacade *v3;
  void *v4;
  CRKKeychainPasswordFacade *v5;

  v3 = [CRKKeychainPasswordFacade alloc];
  -[CRKConcreteKeychain baseQueryAttributes](self, "baseQueryAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKKeychainPasswordFacade initWithBaseQueryAttributes:](v3, "initWithBaseQueryAttributes:", v4);

  return v5;
}

- (void)copyItemWithPersistentID:(id)a3 itemClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  OSStatus v13;
  void *v14;
  NSObject *v15;
  CFTypeRef v16;
  CFTypeRef v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CRKConcreteKeychain baseQueryAttributes](self, "baseQueryAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = *MEMORY[0x24BDE94D8];
  v19[0] = *MEMORY[0x24BDE9558];
  v19[1] = v10;
  v11 = *MEMORY[0x24BDBD270];
  v20[0] = v6;
  v20[1] = v11;
  v19[2] = *MEMORY[0x24BDE9220];
  v20[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v12);

  v18 = 0;
  v13 = SecItemCopyMatching((CFDictionaryRef)v9, &v18);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CRKLogGeneral_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CRKConcreteKeychain copyItemWithPersistentID:itemClass:].cold.1((uint64_t)v6, v14);

    v16 = 0;
  }
  else
  {
    v16 = v18;
  }

  return (void *)v16;
}

- (id)makeItemWithPersistentID:(id)a3 itemClass:(id)a4 creationBlock:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  const void *v10;
  void *v11;

  v8 = (void (**)(id, void *))a5;
  v9 = -[CRKConcreteKeychain copyItemWithPersistentID:itemClass:](self, "copyItemWithPersistentID:itemClass:", a3, a4);
  if (v9)
  {
    v10 = v9;
    v8[2](v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)addItem:(void *)a3 toAccessGroup:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CFTypeRef v15;
  NSObject *v16;
  void *v18;
  CFTypeRef result;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[CRKConcreteKeychain baseQueryAttributes](self, "baseQueryAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = *MEMORY[0x24BDE94D0];
  v26[0] = *MEMORY[0x24BDE9560];
  v26[1] = v9;
  v10 = *MEMORY[0x24BDBD270];
  v27[0] = a3;
  v27[1] = v10;
  v26[2] = *MEMORY[0x24BDE8F60];
  v27[2] = *MEMORY[0x24BDE8F78];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v11);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDE8F50]);
  result = 0;
  v12 = SecItemAdd((CFDictionaryRef)v8, &result);
  v13 = (void *)result;
  if ((_DWORD)v12 == -25299)
  {
    v14 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
    v15 = result;

    v13 = (void *)v15;
    if (!(_DWORD)v14)
      goto LABEL_8;
  }
  else
  {
    v14 = v12;
    if (!(_DWORD)v12)
      goto LABEL_8;
  }
  _CRKLogGeneral_1();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = a3;
    v22 = 2114;
    v23 = v6;
    v24 = 2114;
    v25 = v18;
    _os_log_error_impl(&dword_218C99000, v16, OS_LOG_TYPE_ERROR, "Could not add item %{public}@ to group %{public}@: %{public}@", buf, 0x20u);

  }
LABEL_8:

  return v13;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKConcreteKeychain baseQueryAttributes](self, "baseQueryAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { baseQueryAtrributes = %@ }>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDictionary)baseQueryAttributes
{
  return self->_baseQueryAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseQueryAttributes, 0);
}

- (void)removeItemWithPersistentID:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v3, v4, "Could not remove keychain item with persistentID %@. Error (ignored): %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)copyItemWithPersistentID:(uint64_t)a1 itemClass:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "verboseDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(&dword_218C99000, v3, v4, "Cannot retrieve item with persistentID %@: Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

@end
