@implementation HAPNFCAccessDeviceCredentialKeyRequest

- (HAPNFCAccessDeviceCredentialKeyRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessDeviceCredentialKeyRequest;
  return -[HAPNFCAccessDeviceCredentialKeyRequest init](&v3, sel_init);
}

- (HAPNFCAccessDeviceCredentialKeyRequest)initWithType:(id)a3 key:(id)a4 issuerKeyIdentifier:(id)a5 state:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HAPNFCAccessDeviceCredentialKeyRequest *v17;
  HAPNFCAccessDeviceCredentialKeyRequest *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPNFCAccessDeviceCredentialKeyRequest;
  v17 = -[HAPNFCAccessDeviceCredentialKeyRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_key, a4);
    objc_storeStrong((id *)&v18->_issuerKeyIdentifier, a5);
    objc_storeStrong((id *)&v18->_state, a6);
    objc_storeStrong((id *)&v18->_identifier, a7);
  }

  return v18;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40[2];
  uint64_t v41;
  char v42;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v24 = 0;
    v10 = 0;
    v23 = 0;
    v22 = 0;
    v11 = 0;
LABEL_25:
    -[HAPNFCAccessDeviceCredentialKeyRequest setType:](self, "setType:", v11, v28);
    -[HAPNFCAccessDeviceCredentialKeyRequest setKey:](self, "setKey:", v22);
    -[HAPNFCAccessDeviceCredentialKeyRequest setIssuerKeyIdentifier:](self, "setIssuerKeyIdentifier:", v23);
    -[HAPNFCAccessDeviceCredentialKeyRequest setState:](self, "setState:", v10);
    -[HAPNFCAccessDeviceCredentialKeyRequest setIdentifier:](self, "setIdentifier:", v24);
    v9 = 0;
    v25 = 1;
  }
  else
  {
    v28 = a4;
    v29 = 0;
    v9 = 0;
    v10 = 0;
    v30 = 0;
    v31 = 0;
    v11 = 0;
    v12 = v7 + v8;
    while (1)
    {
      v42 = 0;
      v41 = 0;
      v40[0] = 0;
      v40[1] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v41)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v26 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v26;
        if (v26)
          goto LABEL_18;
        goto LABEL_24;
      }
      switch(v42)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v9;
          +[HAPNFCAccessKeyTypeWrapper parsedFromData:error:](HAPNFCAccessKeyTypeWrapper, "parsedFromData:error:", v14, &v39);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v39;

          v17 = v11;
          v11 = (void *)v15;
          break;
        case 2:
          v38 = v9;
          HAPTLVParseContiguousTlvs(2, v7, v12, v40, &v38);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v38;

          if (v16)
            goto LABEL_15;
          v37 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v37);
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = v37;
          v17 = v31;
          v31 = (void *)v18;
          break;
        case 3:
          v36 = v9;
          HAPTLVParseContiguousTlvs(3, v7, v12, v40, &v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v36;

          if (v16)
            goto LABEL_15;
          v35 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v35);
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = v35;
          v17 = v30;
          v30 = (void *)v19;
          break;
        case 4:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v9;
          +[HAPNFCAccessKeyStateWrapper parsedFromData:error:](HAPNFCAccessKeyStateWrapper, "parsedFromData:error:", v14, &v34);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v34;

          v17 = v10;
          v10 = (void *)v20;
          break;
        case 5:
          v33 = v9;
          HAPTLVParseContiguousTlvs(5, v7, v12, v40, &v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v33;

          if (v16)
            goto LABEL_15;
          v32 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v32);
          v21 = objc_claimAutoreleasedReturnValue();
          v16 = v32;
          v17 = v29;
          v29 = (void *)v21;
          break;
        default:
          goto LABEL_16;
      }

LABEL_15:
      v9 = v16;
LABEL_16:
      v7 = v40[0];
      if (v40[0] >= v12)
      {
        if (v9)
        {
LABEL_18:
          v23 = v30;
          v22 = v31;
          v24 = v29;
          if (v28)
          {
            v9 = objc_retainAutorelease(v9);
            v25 = 0;
            *v28 = v9;
          }
          else
          {
            v25 = 0;
          }
          goto LABEL_29;
        }
LABEL_24:
        v23 = v30;
        v22 = v31;
        v24 = v29;
        goto LABEL_25;
      }
    }
    if (v28)
    {
      HMErrorFromOSStatus(Next);
      v25 = 0;
      *v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v23 = v30;
    v22 = v31;
    v24 = v29;
  }
LABEL_29:

  return v25;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  TLV8BufferInit();
  -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v6, "serializeWithError:", &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v40;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
    {
LABEL_4:
      v11 = v10;

      goto LABEL_5;
    }

  }
  -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v14, "serializeWithError:", &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v15 = objc_msgSend(v9, "bytes");
      v16 = v15 + objc_msgSend(v9, "length");
      while (1)
      {
        v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_18;
        }
      }
    }
    goto LABEL_33;
  }
LABEL_18:
  -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v19, "serializeWithError:", &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v20 = objc_msgSend(v9, "bytes");
      v21 = v20 + objc_msgSend(v9, "length");
      while (1)
      {
        v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v20 += v22;
        if (v20 >= v21)
        {

          goto LABEL_27;
        }
      }
    }
LABEL_33:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_35;
    }
LABEL_36:
    v27 = 0;
    goto LABEL_37;
  }
LABEL_27:
  -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v24, "serializeWithError:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_51;
  -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v26, "serializeWithError:", &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;

  if (v8)
    goto LABEL_33;
  v29 = objc_retainAutorelease(v7);
  v30 = objc_msgSend(v29, "bytes");
  v31 = v30 + objc_msgSend(v29, "length");
  do
  {
    if ((uint64_t)(v31 - v30) >= 255)
      v32 = 255;
    else
      v32 = v31 - v30;
    v33 = TLV8BufferAppend();
    if ((_DWORD)v33)
      v34 = 0;
    else
      v34 = v32;
    v30 += v34;
    if ((_DWORD)v33)
      v35 = 1;
    else
      v35 = v30 >= v31;
  }
  while (!v35);
  v11 = v33;

  if (!(_DWORD)v11)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_37;
  }
LABEL_5:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  HMErrorFromOSStatus(v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_35:
  v27 = 0;
  *a3 = v12;
LABEL_37:
  TLV8BufferFree();

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPNFCAccessDeviceCredentialKeyRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPNFCAccessDeviceCredentialKeyRequest *v10;

  v4 = +[HAPNFCAccessDeviceCredentialKeyRequest allocWithZone:](HAPNFCAccessDeviceCredentialKeyRequest, "allocWithZone:", a3);
  -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAPNFCAccessDeviceCredentialKeyRequest initWithType:key:issuerKeyIdentifier:state:identifier:](v4, "initWithType:key:issuerKeyIdentifier:state:identifier:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPNFCAccessDeviceCredentialKeyRequest *v5;
  HAPNFCAccessDeviceCredentialKeyRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (HAPNFCAccessDeviceCredentialKeyRequest *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyRequest type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyRequest type](v6, "type");
        v39 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyRequest key](v6, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyRequest key](v6, "key");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](v6, "issuerKeyIdentifier");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      if (v13 != v36)
      {
        -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](v6, "issuerKeyIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyRequest state](v6, "state");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyRequest state](v6, "state");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessDeviceCredentialKeyRequest identifier](v6, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

        v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
        v27 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessDeviceCredentialKeyRequest identifier](v6, "identifier");
        v28 = v11;
        v24 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v23, "isEqual:", v25);

        v18 = v24;
        v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    v10 = 0;
  }
LABEL_31:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPNFCAccessDeviceCredentialKeyRequest type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest issuerKeyIdentifier](self, "issuerKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessDeviceCredentialKeyRequest identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPNFCAccessDeviceCredentialKeyRequest type=%@, key=%@, issuerKeyIdentifier=%@, state=%@, identifier=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
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

- (NSData)issuerKeyIdentifier
{
  return self->_issuerKeyIdentifier;
}

- (void)setIssuerKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, a3);
}

- (HAPNFCAccessKeyStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
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
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_issuerKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPNFCAccessDeviceCredentialKeyRequest *v6;
  HAPNFCAccessDeviceCredentialKeyRequest *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPNFCAccessDeviceCredentialKeyRequest);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPNFCAccessDeviceCredentialKeyRequest parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
