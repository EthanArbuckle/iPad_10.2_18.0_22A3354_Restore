@implementation HAPMatterCredential

- (HAPMatterCredential)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPMatterCredential;
  return -[HAPMatterCredential init](&v3, sel_init);
}

- (HAPMatterCredential)initWithIssuerKey:(id)a3 readerKey:(id)a4 deviceCredentialKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPMatterCredential *v12;
  HAPMatterCredential *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPMatterCredential;
  v12 = -[HAPMatterCredential init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_issuerKey, a3);
    objc_storeStrong((id *)&v13->_readerKey, a4);
    objc_storeStrong((id *)&v13->_deviceCredentialKey, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t Next;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  BOOL v19;
  id *v20;
  id v21;
  uint64_t v22;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  unint64_t v31[2];
  uint64_t v32;
  char v33;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_20:
    -[HAPMatterCredential setIssuerKey:](self, "setIssuerKey:", v12);
    -[HAPMatterCredential setReaderKey:](self, "setReaderKey:", v11);
    -[HAPMatterCredential setDeviceCredentialKey:](self, "setDeviceCredentialKey:", v10);
    v9 = 0;
    v19 = 1;
    goto LABEL_28;
  }
  v24 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v7 + v8;
  while (1)
  {
    v33 = 0;
    v31[1] = 0;
    v32 = 0;
    v31[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v22;
      if (!v22)
        goto LABEL_20;
LABEL_24:
      v20 = v24;
      if (v24)
      {
        v21 = objc_retainAutorelease(v9);
        v9 = v21;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v33)
    {
      case 3:
        v26 = v9;
        HAPTLVParseContiguousTlvs(3, v7, v13, v31, &v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v26;

        if (!v16)
        {
          v25 = 0;
          v17 = (id *)&v25;
          +[HAPDeviceCredentialKey parsedFromData:error:](HAPDeviceCredentialKey, "parsedFromData:error:", v15, &v25);
          v18 = v10;
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
LABEL_15:

        v9 = v16;
        break;
      case 2:
        v28 = v9;
        HAPTLVParseContiguousTlvs(2, v7, v13, v31, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v28;

        if (!v16)
        {
          v27 = 0;
          v17 = (id *)&v27;
          +[HAPReaderKey parsedFromData:error:](HAPReaderKey, "parsedFromData:error:", v15, &v27);
          v18 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v16 = *v17;

        }
        goto LABEL_15;
      case 1:
        v30 = v9;
        HAPTLVParseContiguousTlvs(1, v7, v13, v31, &v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v30;

        if (!v16)
        {
          v29 = 0;
          v17 = (id *)&v29;
          +[HAPIssuerKey parsedFromData:error:](HAPIssuerKey, "parsedFromData:error:", v15, &v29);
          v18 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        goto LABEL_15;
    }
    v7 = v31[0];
    if (v31[0] >= v13)
    {
      if (!v9)
        goto LABEL_20;
      goto LABEL_24;
    }
  }
  v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    v19 = 0;
    *v20 = v21;
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
LABEL_28:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  TLV8BufferInit();
  -[HAPMatterCredential issuerKey](self, "issuerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPMatterCredential issuerKey](self, "issuerKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "serializeWithError:", &v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v10 = objc_msgSend(v9, "bytes");
      v11 = v10 + objc_msgSend(v9, "length");
      while (1)
      {
        v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        v13 = TLV8BufferAppend();
        if ((_DWORD)v13)
          goto LABEL_23;
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
    }
  }
  else
  {
LABEL_10:
    -[HAPMatterCredential readerKey](self, "readerKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_19:
      -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        objc_msgSend(v20, "serializeWithError:", &v32);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v32;

        if (v8)
          goto LABEL_21;
        v24 = objc_retainAutorelease(v7);
        v25 = objc_msgSend(v24, "bytes");
        v26 = v25 + objc_msgSend(v24, "length");
        do
        {
          if ((uint64_t)(v26 - v25) >= 255)
            v27 = 255;
          else
            v27 = v26 - v25;
          v28 = TLV8BufferAppend();
          if ((_DWORD)v28)
            v29 = 0;
          else
            v29 = v27;
          v25 += v29;
          if ((_DWORD)v28)
            v30 = 1;
          else
            v30 = v25 >= v26;
        }
        while (!v30);
        v22 = v28;

        if ((_DWORD)v22)
          goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v35);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_43;
    }
    -[HAPMatterCredential readerKey](self, "readerKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v15, "serializeWithError:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v16 = objc_msgSend(v9, "bytes");
      v17 = v16 + objc_msgSend(v9, "length");
      while (1)
      {
        v18 = (uint64_t)(v17 - v16) >= 255 ? 255 : v17 - v16;
        v13 = TLV8BufferAppend();
        if ((_DWORD)v13)
          break;
        v16 += v18;
        if (v16 >= v17)
        {

          goto LABEL_19;
        }
      }
LABEL_23:
      v22 = v13;

LABEL_24:
      if (a3)
      {
        HMErrorFromOSStatus(v22);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_26;
      }
      v8 = 0;
LABEL_28:
      v23 = 0;
      goto LABEL_43;
    }
  }
LABEL_21:

  if (!a3)
    goto LABEL_28;
  v21 = objc_retainAutorelease(v8);
  v8 = v21;
LABEL_26:
  v23 = 0;
  *a3 = v21;
LABEL_43:
  TLV8BufferFree();

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPMatterCredential *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPMatterCredential *v8;

  v4 = +[HAPMatterCredential allocWithZone:](HAPMatterCredential, "allocWithZone:", a3);
  -[HAPMatterCredential issuerKey](self, "issuerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterCredential readerKey](self, "readerKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPMatterCredential initWithIssuerKey:readerKey:deviceCredentialKey:](v4, "initWithIssuerKey:readerKey:deviceCredentialKey:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPMatterCredential *v6;
  HAPMatterCredential *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (HAPMatterCredential *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[HAPMatterCredential issuerKey](self, "issuerKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterCredential issuerKey](v7, "issuerKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPMatterCredential issuerKey](self, "issuerKey");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterCredential issuerKey](v7, "issuerKey");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPMatterCredential readerKey](self, "readerKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterCredential readerKey](v7, "readerKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPMatterCredential readerKey](self, "readerKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterCredential readerKey](v7, "readerKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterCredential deviceCredentialKey](v7, "deviceCredentialKey");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterCredential deviceCredentialKey](v7, "deviceCredentialKey");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMatterCredential issuerKey](self, "issuerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterCredential readerKey](self, "readerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterCredential deviceCredentialKey](self, "deviceCredentialKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPMatterCredential issuerKey=%@, readerKey=%@, deviceCredentialKey=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPIssuerKey)issuerKey
{
  return self->_issuerKey;
}

- (void)setIssuerKey:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKey, a3);
}

- (HAPReaderKey)readerKey
{
  return self->_readerKey;
}

- (void)setReaderKey:(id)a3
{
  objc_storeStrong((id *)&self->_readerKey, a3);
}

- (HAPDeviceCredentialKey)deviceCredentialKey
{
  return self->_deviceCredentialKey;
}

- (void)setDeviceCredentialKey:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCredentialKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCredentialKey, 0);
  objc_storeStrong((id *)&self->_readerKey, 0);
  objc_storeStrong((id *)&self->_issuerKey, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPMatterCredential *v6;
  HAPMatterCredential *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPMatterCredential);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPMatterCredential parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
