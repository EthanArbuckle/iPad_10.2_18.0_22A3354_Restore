@implementation TKClientTokenAdvertisedItem

- (TKClientTokenAdvertisedItem)initWithSession:(id)a3 keychainAttributes:(id)a4 secRef:(id)a5
{
  id v9;
  id v10;
  id v11;
  TKClientTokenAdvertisedItem *v12;
  TKClientTokenAdvertisedItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TKClientTokenAdvertisedItem;
  v12 = -[TKClientTokenAdvertisedItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_keychainAttributes, a4);
    objc_storeStrong(&v13->_secRef, a5);
  }

  return v13;
}

- (NSData)objectID
{
  void *v2;
  void *v3;

  -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6BB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keychainClass
{
  void *v2;
  void *v3;

  -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)keyUsage
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("keyUsage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (__SecKey)keyRef
{
  void *v3;
  int v4;
  __SecKey *result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFData *v12;
  SecKeyRef v13;
  id secRef;
  NSObject *v15;
  CFErrorRef error;

  -[TKClientTokenAdvertisedItem keychainClass](self, "keychainClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CD6CC0]);

  if (!v4)
    return 0;
  result = (__SecKey *)self->_secRef;
  if (!result)
  {
    -[TKClientTokenAdvertisedItem session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    error = 0;
    -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    -[TKClientTokenAdvertisedItem session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("u_TokenSession"));

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v13 = SecKeyCreateWithData(v12, (CFDictionaryRef)v10, &error);
    secRef = self->_secRef;
    self->_secRef = v13;

    if (!self->_secRef)
    {
      TK_LOG_client_0();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TKClientTokenAdvertisedItem keyRef].cold.1();

    }
    return (__SecKey *)self->_secRef;
  }
  return result;
}

- (__SecCertificate)certificateRef
{
  void *v3;
  int v4;
  __SecCertificate *result;
  void *v6;
  const __CFData *v7;
  SecCertificateRef v8;
  id secRef;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  -[TKClientTokenAdvertisedItem keychainClass](self, "keychainClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CD6CA0]);

  if (!v4)
    return 0;
  result = (__SecCertificate *)self->_secRef;
  if (!result)
  {
    -[TKClientTokenAdvertisedItem keychainAttributes](self, "keychainAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v7 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    v8 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
    secRef = self->_secRef;
    self->_secRef = v8;

    if (!self->_secRef)
    {
      -[TKClientTokenAdvertisedItem session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "token");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tokenID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      TK_LOG_client_0();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[TKClientTokenAdvertisedItem certificateRef].cold.1((uint64_t)v12, (uint64_t)v7, v13);

    }
    return (__SecCertificate *)self->_secRef;
  }
  return result;
}

- (__SecIdentity)identityRef
{
  void *v3;
  int v4;

  -[TKClientTokenAdvertisedItem keychainClass](self, "keychainClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CD6CB0]);

  if (v4)
    return (__SecIdentity *)self->_secRef;
  else
    return 0;
}

- (TKClientTokenSession)session
{
  return self->_session;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAttributes, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_secRef, 0);
}

- (void)keyRef
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_1(&dword_1B9768000, v0, v1, "Failed to create key from advertised item of token %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_4();
}

- (void)certificateRef
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1B9768000, a2, a3, "Failed to create certificate from advertised item of token %{public}@, data: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_4();
}

@end
