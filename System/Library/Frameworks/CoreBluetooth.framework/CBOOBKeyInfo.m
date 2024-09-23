@implementation CBOOBKeyInfo

- (CBOOBKeyInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBOOBKeyInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  CBOOBKeyInfo *v17;
  int v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = -[CBOOBKeyInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_13;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v27);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_13;
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_btAddressType = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_13;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_btAddressType = 0;
  }
  else if (v15 == 5)
  {
    v16 = CUXPCDecodeUInt64RangedEx();
    if (v16 == 6)
    {
      v7->_addressType = 0;
    }
    else if (v16 == 5)
    {
      goto LABEL_13;
    }
  }
  if (!CUXPCDecodeNSData())
    goto LABEL_13;
  v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_keyType = 0;
    goto LABEL_18;
  }
  if (v18 == 5)
  {
LABEL_13:
    v17 = 0;
    goto LABEL_22;
  }
LABEL_18:
  if (-[NSData length](v7->_btAddressData, "length") == 7 && !(v7->_addressType | v7->_btAddressType))
    v7->_addressType = *(_BYTE *)-[NSData bytes](v7->_btAddressData, "bytes");
  v17 = v7;
LABEL_22:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSData *btAddressData;
  NSData *v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  unsigned int btAddressType;
  NSData *irkData;
  NSData *v12;
  id v13;
  NSData *v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  void *v18;
  xpc_object_t xdict;

  v4 = a3;
  btAddressData = self->_btAddressData;
  xdict = v4;
  if (btAddressData)
  {
    v6 = objc_retainAutorelease(btAddressData);
    v7 = -[NSData bytes](v6, "bytes");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    v9 = -[NSData length](v6, "length");

    xpc_dictionary_set_data(xdict, "btAd", v8, v9);
  }
  if (self->_btAddressType
    && (xpc_dictionary_set_uint64(xdict, "btAT", self->_btAddressType), (btAddressType = self->_btAddressType) != 0)
    || (btAddressType = self->_addressType) != 0)
  {
    xpc_dictionary_set_uint64(xdict, "btAT", btAddressType);
  }
  irkData = self->_irkData;
  if (irkData)
  {
    v12 = objc_retainAutorelease(irkData);
    v13 = xdict;
    v14 = v12;
    v15 = -[NSData bytes](v14, "bytes");
    if (v15)
      v16 = (const char *)v15;
    else
      v16 = "";
    v17 = -[NSData length](v14, "length");

    xpc_dictionary_set_data(v13, "irkD", v16, v17);
  }
  v18 = xdict;
  if (self->_keyType)
  {
    xpc_dictionary_set_uint64(xdict, "irkT", self->_keyType);
    v18 = xdict;
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[CBOOBKeyInfo btAddressData](self, "btAddressData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[CBOOBKeyInfo btAddressData](self, "btAddressData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 7)
  {
    objc_msgSend(v5, "subdataWithRange:", 1, 6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  CUPrintNSDataAddress();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_addressType | self->_btAddressType;
  -[CBOOBKeyInfo irkData](self, "irkData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSObjectMasked();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Addr %@, AddrType: %x, IRK %@, keyUsage: %@"), v9, v10, v12, v13);

  return v14;
}

- (unint64_t)hash
{
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (-[CBOOBKeyInfo keyType](self, "keyType"))
    return -[CBOOBKeyInfo proxyHash](self, "proxyHash");
  -[CBOOBKeyInfo btAddressData](self, "btAddressData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[CBOOBKeyInfo irkData](self, "irkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (unint64_t)proxyHash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[CBOOBKeyInfo irkData](self, "irkData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[CBOOBKeyInfo keyType](self, "keyType");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CBOOBKeyInfo *v4;
  CBOOBKeyInfo *v5;
  CBOOBKeyInfo *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  BOOL v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  int v21;

  v4 = (CBOOBKeyInfo *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v14 = 1;
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[CBOOBKeyInfo addressType](self, "addressType");
      if (v7 != -[CBOOBKeyInfo addressType](v6, "addressType"))
        goto LABEL_18;
      -[CBOOBKeyInfo btAddressData](self, "btAddressData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBOOBKeyInfo btAddressData](v6, "btAddressData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      if (v10 == v11)
      {

      }
      else
      {
        v12 = v11;
        if ((v10 == 0) == (v11 != 0))
          goto LABEL_17;
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) == 0)
          goto LABEL_18;
      }
      v15 = -[CBOOBKeyInfo btAddressType](self, "btAddressType");
      if (v15 != -[CBOOBKeyInfo btAddressType](v6, "btAddressType"))
        goto LABEL_18;
      -[CBOOBKeyInfo irkData](self, "irkData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBOOBKeyInfo irkData](v6, "irkData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v18 = v17;
      if (v10 == v18)
      {

LABEL_22:
        v21 = -[CBOOBKeyInfo keyType](self, "keyType");
        v14 = v21 == -[CBOOBKeyInfo keyType](v6, "keyType");
        goto LABEL_19;
      }
      v12 = v18;
      if ((v10 == 0) != (v18 != 0))
      {
        v19 = objc_msgSend(v10, "isEqual:", v18);

        if ((v19 & 1) != 0)
          goto LABEL_22;
LABEL_18:
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (NSData)btAddressData
{
  return self->_btAddressData;
}

- (void)setBtAddressData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)btAddressType
{
  return self->_btAddressType;
}

- (void)setBtAddressType:(unsigned __int8)a3
{
  self->_btAddressType = a3;
}

- (unsigned)addressType
{
  return self->_addressType;
}

- (void)setAddressType:(unsigned __int8)a3
{
  self->_addressType = a3;
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(unsigned __int8)a3
{
  self->_keyType = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int16)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_btAddressData, 0);
}

@end
