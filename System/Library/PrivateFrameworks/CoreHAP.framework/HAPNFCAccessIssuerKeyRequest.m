@implementation HAPNFCAccessIssuerKeyRequest

- (HAPNFCAccessIssuerKeyRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessIssuerKeyRequest;
  return -[HAPNFCAccessIssuerKeyRequest init](&v3, sel_init);
}

- (HAPNFCAccessIssuerKeyRequest)initWithType:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPNFCAccessIssuerKeyRequest *v12;
  HAPNFCAccessIssuerKeyRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPNFCAccessIssuerKeyRequest;
  v12 = -[HAPNFCAccessIssuerKeyRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
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
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  id *v22;
  id v23;
  uint64_t v24;
  id *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32[2];
  uint64_t v33;
  char v34;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_19:
    -[HAPNFCAccessIssuerKeyRequest setType:](self, "setType:", v12, v26);
    -[HAPNFCAccessIssuerKeyRequest setKey:](self, "setKey:", v11);
    -[HAPNFCAccessIssuerKeyRequest setIdentifier:](self, "setIdentifier:", v10);
    v9 = 0;
    v21 = 1;
    goto LABEL_27;
  }
  v26 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v7 + v8;
  while (1)
  {
    v34 = 0;
    v32[1] = 0;
    v33 = 0;
    v32[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
      if (!v24)
        goto LABEL_19;
LABEL_23:
      v22 = v26;
      if (v26)
      {
        v23 = objc_retainAutorelease(v9);
        v9 = v23;
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    switch(v34)
    {
      case 3:
        v28 = v9;
        HAPTLVParseContiguousTlvs(3, v7, v13, v32, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;

        if (!v17)
        {
          v27 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v27);
          v19 = objc_claimAutoreleasedReturnValue();
          v17 = v27;
          v18 = v10;
          v10 = (void *)v19;
          goto LABEL_13;
        }
LABEL_14:

        v9 = v17;
        break;
      case 2:
        v30 = v9;
        HAPTLVParseContiguousTlvs(2, v7, v13, v32, &v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v30;

        if (!v17)
        {
          v29 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v29);
          v20 = objc_claimAutoreleasedReturnValue();
          v17 = v29;
          v18 = v11;
          v11 = (void *)v20;
LABEL_13:

        }
        goto LABEL_14;
      case 1:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v9;
        +[HAPNFCAccessKeyTypeWrapper parsedFromData:error:](HAPNFCAccessKeyTypeWrapper, "parsedFromData:error:", v15, &v31);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v31;

        v18 = v12;
        v12 = (void *)v16;
        goto LABEL_13;
    }
    v7 = v32[0];
    if (v32[0] >= v13)
    {
      if (!v9)
        goto LABEL_19;
      goto LABEL_23;
    }
  }
  v22 = v26;
  if (v26)
  {
    HMErrorFromOSStatus(Next);
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v21 = 0;
    *v22 = v23;
    goto LABEL_27;
  }
LABEL_26:
  v21 = 0;
LABEL_27:

  return v21;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
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
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
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
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  TLV8BufferInit();
  -[HAPNFCAccessIssuerKeyRequest type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPNFCAccessIssuerKeyRequest type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v6, "serializeWithError:", &v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v32;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
      goto LABEL_31;
  }
  -[HAPNFCAccessIssuerKeyRequest key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_13:
    -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_34;
    -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v19, "serializeWithError:", &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;

    if (v8)
      goto LABEL_15;
    v21 = objc_retainAutorelease(v7);
    v22 = objc_msgSend(v21, "bytes");
    v23 = v22 + objc_msgSend(v21, "length");
    do
    {
      if ((uint64_t)(v23 - v22) >= 255)
        v24 = 255;
      else
        v24 = v23 - v22;
      v25 = TLV8BufferAppend();
      if ((_DWORD)v25)
        v26 = 0;
      else
        v26 = v24;
      v22 += v26;
      if ((_DWORD)v25)
        v27 = 1;
      else
        v27 = v22 >= v23;
    }
    while (!v27);
    v10 = v25;

    if (!(_DWORD)v10)
    {
LABEL_34:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_37;
    }
LABEL_31:
    if (a3)
    {
      HMErrorFromOSStatus(v10);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_33;
    }
    v8 = 0;
LABEL_36:
    v28 = 0;
    goto LABEL_37;
  }
  -[HAPNFCAccessIssuerKeyRequest key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v12, "serializeWithError:", &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;

  if (!v8)
  {
    v13 = objc_retainAutorelease(v7);
    v14 = objc_msgSend(v13, "bytes");
    v15 = v14 + objc_msgSend(v13, "length");
    while (1)
    {
      v16 = (uint64_t)(v15 - v14) >= 255 ? 255 : v15 - v14;
      v17 = TLV8BufferAppend();
      if ((_DWORD)v17)
        break;
      v14 += v16;
      if (v14 >= v15)
      {

        goto LABEL_13;
      }
    }
    v10 = v17;

    goto LABEL_31;
  }
LABEL_15:

  if (!a3)
    goto LABEL_36;
  v20 = objc_retainAutorelease(v8);
  v8 = v20;
LABEL_33:
  v28 = 0;
  *a3 = v20;
LABEL_37:
  TLV8BufferFree();

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPNFCAccessIssuerKeyRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPNFCAccessIssuerKeyRequest *v8;

  v4 = +[HAPNFCAccessIssuerKeyRequest allocWithZone:](HAPNFCAccessIssuerKeyRequest, "allocWithZone:", a3);
  -[HAPNFCAccessIssuerKeyRequest type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessIssuerKeyRequest key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPNFCAccessIssuerKeyRequest initWithType:key:identifier:](v4, "initWithType:key:identifier:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPNFCAccessIssuerKeyRequest *v6;
  HAPNFCAccessIssuerKeyRequest *v7;
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

  v6 = (HAPNFCAccessIssuerKeyRequest *)a3;
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
      -[HAPNFCAccessIssuerKeyRequest type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessIssuerKeyRequest type](v7, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPNFCAccessIssuerKeyRequest type](self, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessIssuerKeyRequest type](v7, "type");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPNFCAccessIssuerKeyRequest key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessIssuerKeyRequest key](v7, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPNFCAccessIssuerKeyRequest key](self, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessIssuerKeyRequest key](v7, "key");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessIssuerKeyRequest identifier](v7, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessIssuerKeyRequest identifier](v7, "identifier");
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
  -[HAPNFCAccessIssuerKeyRequest type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessIssuerKeyRequest key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessIssuerKeyRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPNFCAccessIssuerKeyRequest type=%@, key=%@, identifier=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPNFCAccessKeyTypeWrapper)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPNFCAccessIssuerKeyRequest *v6;
  HAPNFCAccessIssuerKeyRequest *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPNFCAccessIssuerKeyRequest);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPNFCAccessIssuerKeyRequest parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
