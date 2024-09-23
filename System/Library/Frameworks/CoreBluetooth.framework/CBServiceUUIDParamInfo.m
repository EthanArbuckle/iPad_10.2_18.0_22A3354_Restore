@implementation CBServiceUUIDParamInfo

- (CBServiceUUIDParamInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBServiceUUIDParamInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CBServiceUUIDParamInfo *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = -[CBServiceUUIDParamInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_7;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_7;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData() || !CUXPCDecodeNSData())
    goto LABEL_12;
  v14 = v7;
LABEL_7:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  NSData *serviceUUID;
  NSData *v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  NSData *blobData;
  NSData *v10;
  id v11;
  NSData *v12;
  uint64_t v13;
  const char *v14;
  size_t v15;
  NSData *maskData;
  NSData *v17;
  id v18;
  NSData *v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  xpc_object_t xdict;

  xdict = a3;
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    v5 = objc_retainAutorelease(serviceUUID);
    v6 = -[NSData bytes](v5, "bytes");
    if (v6)
      v7 = (const char *)v6;
    else
      v7 = "";
    v8 = -[NSData length](v5, "length");

    xpc_dictionary_set_data(xdict, "sUID", v7, v8);
  }
  blobData = self->_blobData;
  if (blobData)
  {
    v10 = objc_retainAutorelease(blobData);
    v11 = xdict;
    v12 = v10;
    v13 = -[NSData bytes](v12, "bytes");
    if (v13)
      v14 = (const char *)v13;
    else
      v14 = "";
    v15 = -[NSData length](v12, "length");

    xpc_dictionary_set_data(v11, "uBlb", v14, v15);
  }
  maskData = self->_maskData;
  if (maskData)
  {
    v17 = objc_retainAutorelease(maskData);
    v18 = xdict;
    v19 = v17;
    v20 = -[NSData bytes](v19, "bytes");
    if (v20)
      v21 = (const char *)v20;
    else
      v21 = "";
    v22 = -[NSData length](v19, "length");

    xpc_dictionary_set_data(v18, "uMsk", v21, v22);
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ServiceUUID %@, blob %@, mask: %@"), self->_serviceUUID, self->_blobData, self->_maskData);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CBServiceUUIDParamInfo serviceUUID](self, "serviceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CBServiceUUIDParamInfo blobData](self, "blobData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CBServiceUUIDParamInfo maskData](self, "maskData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CBServiceUUIDParamInfo *v4;
  CBServiceUUIDParamInfo *v5;
  CBServiceUUIDParamInfo *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (CBServiceUUIDParamInfo *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v13 = 1;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[CBServiceUUIDParamInfo serviceUUID](self, "serviceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBServiceUUIDParamInfo serviceUUID](v6, "serviceUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      if (v9 == v10)
      {

      }
      else
      {
        v11 = v10;
        if ((v9 == 0) == (v10 != 0))
          goto LABEL_19;
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_14;
      }
      -[CBServiceUUIDParamInfo blobData](self, "blobData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBServiceUUIDParamInfo blobData](v6, "blobData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      v16 = v15;
      if (v9 == v16)
      {

      }
      else
      {
        v11 = v16;
        if ((v9 == 0) == (v16 != 0))
          goto LABEL_19;
        v17 = objc_msgSend(v9, "isEqual:", v16);

        if ((v17 & 1) == 0)
        {
LABEL_14:
          v13 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      -[CBServiceUUIDParamInfo maskData](self, "maskData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBServiceUUIDParamInfo maskData](v6, "maskData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v18;
      v20 = v19;
      v11 = v20;
      if (v9 == v20)
      {
        v13 = 1;
        goto LABEL_20;
      }
      if ((v9 == 0) != (v20 != 0))
      {
        v13 = objc_msgSend(v9, "isEqual:", v20);
LABEL_20:

        goto LABEL_21;
      }
LABEL_19:
      v13 = 0;
      goto LABEL_20;
    }
  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (NSData)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)blobData
{
  return self->_blobData;
}

- (void)setBlobData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)maskData
{
  return self->_maskData;
}

- (void)setMaskData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskData, 0);
  objc_storeStrong((id *)&self->_blobData, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

@end
