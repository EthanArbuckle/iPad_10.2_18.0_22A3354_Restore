@implementation EFStringHash

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;

  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
    -[EFStringHash debugDescription](self, "debugDescription");
  else
    -[EFStringHash redactedStringValue](self, "redactedStringValue");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)redactedStringValue
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  CC_SHA512_CTX v8;
  int64_t data;
  unsigned __int8 md[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (redactedStringValue_onceToken != -1)
    dispatch_once(&redactedStringValue_onceToken, &__block_literal_global_38);
  data = -[EFStringHash primitiveHash](self, "primitiveHash");
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v8.wbuf[12] = v3;
  *(_OWORD *)&v8.wbuf[14] = v3;
  *(_OWORD *)&v8.wbuf[8] = v3;
  *(_OWORD *)&v8.wbuf[10] = v3;
  *(_OWORD *)&v8.wbuf[4] = v3;
  *(_OWORD *)&v8.wbuf[6] = v3;
  *(_OWORD *)v8.wbuf = v3;
  *(_OWORD *)&v8.wbuf[2] = v3;
  *(_OWORD *)&v8.hash[4] = v3;
  *(_OWORD *)&v8.hash[6] = v3;
  *(_OWORD *)v8.hash = v3;
  *(_OWORD *)&v8.hash[2] = v3;
  *(_OWORD *)v8.count = v3;
  CC_SHA512_Init(&v8);
  CC_SHA512_Update(&v8, &redactedStringValue_deviceSalt, 0x10u);
  CC_SHA512_Update(&v8, &data, 8u);
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12 = v4;
  v13 = v4;
  *(_OWORD *)md = v4;
  v11 = v4;
  CC_SHA512_Final(md, &v8);
  -[EFStringHash _hexStringFromHash:](self, "_hexStringFromHash:", *(_QWORD *)md);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringWithRange:", 2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)primitiveHash
{
  return self->_primitiveHash;
}

- (id)_hexStringFromHash:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), a3);
}

- (EFStringHash)initWithString:(id)a3
{
  id v4;
  void *v5;
  EFStringHash *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "ef_md5Digest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EFStringHash initWithMD5Digest:](self, "initWithMD5Digest:", v5);

  }
  else
  {
    v6 = -[EFStringHash initWithHash:](self, "initWithHash:", 0);
  }

  return v6;
}

- (EFStringHash)initWithMD5Digest:(id)a3
{
  id v4;
  uint64_t v5;
  EFStringHash *v6;
  _QWORD v8[6];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 8)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __hashForDigest_block_invoke;
    v8[3] = &unk_1E62A76E0;
    v8[4] = &v10;
    v8[5] = v9;
    objc_msgSend(v4, "enumerateByteRangesUsingBlock:", v8);
    v5 = v11[3];
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v5 = 0;
  }

  v6 = -[EFStringHash initWithHash:](self, "initWithHash:", v5);
  return v6;
}

- (EFStringHash)initWithHash:(int64_t)a3
{
  EFStringHash *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EFStringHash;
  result = -[EFStringHash init](&v5, sel_init);
  if (result)
    result->_primitiveHash = a3;
  return result;
}

void __35__EFStringHash_redactedStringValue__block_invoke()
{
  void *v0;
  id v1;

  +[EFDevice currentDevice](EFDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  if (v1)
    objc_msgSend(v1, "getUUIDBytes:", &redactedStringValue_deviceSalt);

}

- (EFStringHash)initWithData:(id)a3
{
  id v4;
  void *v5;
  EFStringHash *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "ef_md5Digest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EFStringHash initWithMD5Digest:](self, "initWithMD5Digest:", v5);

  }
  else
  {
    v6 = -[EFStringHash initWithHash:](self, "initWithHash:", 0);
  }

  return v6;
}

- (NSString)hexStringValue
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[EFStringHash _hexStringFromHash:](self, "_hexStringFromHash:", -[EFStringHash primitiveHash](self, "primitiveHash"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E62A84D8;
  v4 = v2;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[EFStringHash int64Value](self, "int64Value") && objc_msgSend(v5, "int64Value"))
    {
      v6 = -[EFStringHash int64Value](self, "int64Value");
      v7 = v6 == objc_msgSend(v5, "int64Value");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)stringValue
{
  void *v2;

  v2 = -[EFStringHash int64Value](self, "int64Value");
  if (v2)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), v2);
  return (NSString *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EFStringHash)initWithCoder:(id)a3
{
  id v4;
  EFStringHash *v5;

  v4 = a3;
  v5 = -[EFStringHash initWithHash:](self, "initWithHash:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("EFPropertyKey_primitiveHash")));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[EFStringHash primitiveHash](self, "primitiveHash"), CFSTR("EFPropertyKey_primitiveHash"));

}

@end
