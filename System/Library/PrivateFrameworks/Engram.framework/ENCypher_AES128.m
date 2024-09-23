@implementation ENCypher_AES128

- (ENCypher_AES128)initWithRandomKey
{
  void *v3;
  ENCypher_AES128 *v4;

  objc_msgSend((id)objc_opt_class(), "_randomDataWithLength:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ENCypher_AES128 initWithKey:](self, "initWithKey:", v3);

  return v4;
}

- (ENCypher_AES128)initWithKey:(id)a3
{
  id v5;
  ENCypher_AES128 *v6;
  ENCypher_AES128 *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENCypher_AES128;
  v6 = -[ENCypher_AES128 init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_key, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENCypher_AES128 key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ENCypher_AES128 key](self, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENCypher_AES128)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ENCypher_AES128 *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ENCypher_AES128KeyKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ENCypher_AES128 initWithKey:](self, "initWithKey:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ENCypher_AES128 key](self, "key");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ENCypher_AES128KeyKey"));

}

- (NSString)identifier
{
  return (NSString *)CFSTR("AES128");
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v19;

  v10 = a3;
  v11 = a4;
  if (!a5)
    goto LABEL_5;
  v12 = *a5;
  if (!*a5
    || (-[ENCypher_AES128 identifier](self, "identifier"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "isEqualToString:", v13),
        v13,
        v14))
  {
    -[ENCypher_AES128 identifier](self, "identifier");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = (void *)objc_opt_class();
    -[ENCypher_AES128 key](self, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_encryptData:withKey:", v10, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (a6)
  {
    +[ENLog groupContext](ENLog, "groupContext");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      sub_1D4D05A98((uint64_t *)a5, self, v19);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ENCypherErrorDomain"), -1001, 0);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_6:

  return v17;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15
    && (-[ENCypher_AES128 identifier](self, "identifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v15, "isEqualToString:", v16),
        v16,
        !v17))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ENCypherErrorDomain"), -1001, 0);
      v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v18 = (void *)objc_opt_class();
    -[ENCypher_AES128 key](self, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_decryptData:withKey:", v12, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v20;
}

+ (id)_randomDataWithLength:(int64_t)a3
{
  void *v4;
  const __SecRandom *v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
  v5 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v6 = objc_retainAutorelease(v4);
  if (SecRandomCopyBytes(v5, a3, (void *)objc_msgSend(v6, "mutableBytes")))
    v7 = 0;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

+ (id)_encryptData:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  size_t v7;
  void *dataOut;
  id v9;
  const void *v10;
  size_t v12;
  _OWORD key[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(key, 0, sizeof(key));
  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  __memcpy_chk();
  v7 = objc_msgSend(v6, "length");
  dataOut = malloc_type_malloc(v7 + 16, 0x5356A6C0uLL);
  v12 = 0;
  v9 = objc_retainAutorelease(v6);
  v10 = (const void *)objc_msgSend(v9, "bytes");

  if (CCCrypt(0, 0, 3u, key, 0x10uLL, 0, v10, v7, dataOut, v7 + 16, &v12))
  {
    free(dataOut);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", dataOut, v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)_decryptData:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  size_t v7;
  void *dataOut;
  id v9;
  const void *v10;
  size_t v12;
  _OWORD key[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(key, 0, sizeof(key));
  v5 = objc_retainAutorelease(a4);
  v6 = a3;
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  __memcpy_chk();
  v7 = objc_msgSend(v6, "length");
  dataOut = malloc_type_malloc(v7 + 16, 0x763FB6DAuLL);
  v12 = 0;
  v9 = objc_retainAutorelease(v6);
  v10 = (const void *)objc_msgSend(v9, "bytes");

  if (CCCrypt(1u, 0, 3u, key, 0x10uLL, 0, v10, v7, dataOut, v7 + 16, &v12))
  {
    free(dataOut);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", dataOut, v12);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
