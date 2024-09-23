@implementation HAPNFCAccessDeviceCredentialKeyResponse

- (HAPNFCAccessDeviceCredentialKeyResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessDeviceCredentialKeyResponse;
  return -[HAPNFCAccessDeviceCredentialKeyResponse init](&v3, sel_init);
}

- (HAPNFCAccessDeviceCredentialKeyResponse)initWithIdentifier:(id)a3 issuerKeyIdentifier:(id)a4 statusCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPNFCAccessDeviceCredentialKeyResponse *v12;
  HAPNFCAccessDeviceCredentialKeyResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPNFCAccessDeviceCredentialKeyResponse;
  v12 = -[HAPNFCAccessDeviceCredentialKeyResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_issuerKeyIdentifier, a4);
    objc_storeStrong((id *)&v13->_statusCode, a5);
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  HAPNFCAccessDeviceCredentialKeyResponse *v26;
  id *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33[2];
  uint64_t v34;
  char v35;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_25;
  }
  v26 = self;
  v27 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v7 + v8;
  do
  {
    v35 = 0;
    v33[1] = 0;
    v34 = 0;
    v33[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
    {
      v21 = v27;
      if (v27)
      {
        HMErrorFromOSStatus(Next);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_26:
      v23 = 0;
      goto LABEL_27;
    }
    if (!v34)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
      if (!v24)
        goto LABEL_24;
LABEL_17:
      v21 = v27;
      if (v27)
      {
        v22 = objc_retainAutorelease(v9);
        v9 = v22;
LABEL_22:
        v23 = 0;
        *v21 = v22;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    switch(v35)
    {
      case 3:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v9;
        +[HAPNFCAccessResponseStatusWrapper parsedFromData:error:](HAPNFCAccessResponseStatusWrapper, "parsedFromData:error:", v15, &v28);
        v19 = objc_claimAutoreleasedReturnValue();
        v16 = v28;

        v18 = v10;
        v10 = (void *)v19;
        goto LABEL_13;
      case 2:
        v30 = v9;
        HAPTLVParseContiguousTlvs(2, v7, v13, v33, &v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v30;

        if (!v16)
        {
          v29 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v29);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v29;
          v18 = v11;
          v11 = (void *)v20;
          goto LABEL_13;
        }
        break;
      case 1:
        v32 = v9;
        HAPTLVParseContiguousTlvs(1, v7, v13, v33, &v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v32;

        if (!v16)
        {
          v31 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v31);
          v17 = objc_claimAutoreleasedReturnValue();
          v16 = v31;
          v18 = v12;
          v12 = (void *)v17;
LABEL_13:

        }
        break;
      default:
        goto LABEL_15;
    }

    v9 = v16;
LABEL_15:
    v7 = v33[0];
  }
  while (v33[0] < v13);
  if (v9)
    goto LABEL_17;
LABEL_24:
  self = v26;
LABEL_25:
  -[HAPNFCAccessDeviceCredentialKeyResponse setIdentifier:](self, "setIdentifier:", v12);
  -[HAPNFCAccessDeviceCredentialKeyResponse setIssuerKeyIdentifier:](self, "setIssuerKeyIdentifier:", v11);
  -[HAPNFCAccessDeviceCredentialKeyResponse setStatusCode:](self, "setStatusCode:", v10);
  v9 = 0;
  v23 = 1;
LABEL_27:

  return v23;
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
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
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
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  TLV8BufferInit();
  -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v6, "serializeWithError:", &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;

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
    -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_19:
      -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(v20, "serializeWithError:", &v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v26;

        if (v8)
          goto LABEL_21;
        v24 = objc_retainAutorelease(v7);
        objc_msgSend(v24, "bytes");
        objc_msgSend(v24, "length");
        v22 = TLV8BufferAppend();

        if ((_DWORD)v22)
          goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_31;
    }
    -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v15, "serializeWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;

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
      goto LABEL_31;
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
LABEL_31:
  TLV8BufferFree();

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPNFCAccessDeviceCredentialKeyResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPNFCAccessDeviceCredentialKeyResponse *v8;

  v4 = +[HAPNFCAccessDeviceCredentialKeyResponse allocWithZone:](HAPNFCAccessDeviceCredentialKeyResponse, "allocWithZone:", a3);
  -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPNFCAccessDeviceCredentialKeyResponse initWithIdentifier:issuerKeyIdentifier:statusCode:](v4, "initWithIdentifier:issuerKeyIdentifier:statusCode:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPNFCAccessDeviceCredentialKeyResponse *v6;
  HAPNFCAccessDeviceCredentialKeyResponse *v7;
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

  v6 = (HAPNFCAccessDeviceCredentialKeyResponse *)a3;
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
      -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyResponse identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyResponse identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](v7, "issuerKeyIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](v7, "issuerKeyIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](v7, "statusCode");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](v7, "statusCode");
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
  -[HAPNFCAccessDeviceCredentialKeyResponse identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyResponse issuerKeyIdentifier](self, "issuerKeyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyResponse statusCode](self, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPNFCAccessDeviceCredentialKeyResponse identifier=%@, issuerKeyIdentifier=%@, statusCode=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)issuerKeyIdentifier
{
  return self->_issuerKeyIdentifier;
}

- (void)setIssuerKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, a3);
}

- (HAPNFCAccessResponseStatusWrapper)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPNFCAccessDeviceCredentialKeyResponse *v6;
  HAPNFCAccessDeviceCredentialKeyResponse *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPNFCAccessDeviceCredentialKeyResponse);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPNFCAccessDeviceCredentialKeyResponse parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
