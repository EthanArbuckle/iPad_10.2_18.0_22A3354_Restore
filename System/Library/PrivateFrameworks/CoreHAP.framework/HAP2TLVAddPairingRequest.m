@implementation HAP2TLVAddPairingRequest

- (HAP2TLVAddPairingRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVAddPairingRequest;
  return -[HAP2TLVAddPairingRequest init](&v3, sel_init);
}

- (HAP2TLVAddPairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5 publicKey:(id)a6 permissions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HAP2TLVAddPairingRequest *v17;
  HAP2TLVAddPairingRequest *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAP2TLVAddPairingRequest;
  v17 = -[HAP2TLVAddPairingRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_state, a3);
    objc_storeStrong((id *)&v18->_method, a4);
    objc_storeStrong((id *)&v18->_identifier, a5);
    objc_storeStrong((id *)&v18->_publicKey, a6);
    objc_storeStrong((id *)&v18->_permissions, a7);
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
  void *v12;
  unint64_t v13;
  uint64_t Next;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38[2];
  uint64_t v39;
  char v40;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v23 = 0;
    v24 = 0;
    v11 = 0;
    v12 = 0;
LABEL_24:
    -[HAP2TLVAddPairingRequest setState:](self, "setState:", v12);
    -[HAP2TLVAddPairingRequest setMethod:](self, "setMethod:", v11);
    -[HAP2TLVAddPairingRequest setIdentifier:](self, "setIdentifier:", v24);
    -[HAP2TLVAddPairingRequest setPublicKey:](self, "setPublicKey:", v23);
    -[HAP2TLVAddPairingRequest setPermissions:](self, "setPermissions:", v10);
    v9 = 0;
    v25 = 1;
  }
  else
  {
    v28 = a4;
    v9 = 0;
    v10 = 0;
    v29 = 0;
    v30 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v40 = 0;
      v39 = 0;
      v38[0] = 0;
      v38[1] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v39)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v26 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v26;
        if (v26)
          goto LABEL_17;
        goto LABEL_23;
      }
      switch(v40)
      {
        case 0:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v9;
          +[HAP2TLVPairingMethodWrapper parsedFromData:error:](HAP2TLVPairingMethodWrapper, "parsedFromData:error:", v15, &v36);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v36;

          v18 = v11;
          v11 = (void *)v16;
          break;
        case 1:
          v35 = v9;
          HAPTLVParseContiguousTlvs(1, v7, v13, v38, &v35);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v35;

          if (v17)
            goto LABEL_14;
          v34 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v15, &v34);
          v19 = objc_claimAutoreleasedReturnValue();
          v17 = v34;
          v18 = v30;
          v30 = (void *)v19;
          break;
        case 3:
          v33 = v9;
          HAPTLVParseContiguousTlvs(3, v7, v13, v38, &v33);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v33;

          if (v17)
            goto LABEL_14;
          v32 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v32);
          v20 = objc_claimAutoreleasedReturnValue();
          v17 = v32;
          v18 = v29;
          v29 = (void *)v20;
          break;
        case 6:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v9;
          +[HAP2TLVPairingStateWrapper parsedFromData:error:](HAP2TLVPairingStateWrapper, "parsedFromData:error:", v15, &v37);
          v21 = objc_claimAutoreleasedReturnValue();
          v17 = v37;

          v18 = v12;
          v12 = (void *)v21;
          break;
        case 11:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v9;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v31);
          v22 = objc_claimAutoreleasedReturnValue();
          v17 = v31;

          v18 = v10;
          v10 = (void *)v22;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      v9 = v17;
LABEL_15:
      v7 = v38[0];
      if (v38[0] >= v13)
      {
        if (v9)
        {
LABEL_17:
          v23 = v29;
          v24 = v30;
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
          goto LABEL_28;
        }
LABEL_23:
        v23 = v29;
        v24 = v30;
        goto LABEL_24;
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
    v23 = v29;
    v24 = v30;
  }
LABEL_28:

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
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
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
  v41 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  TLV8BufferInit();
  -[HAP2TLVAddPairingRequest state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAP2TLVAddPairingRequest state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v6, "serializeWithError:", &v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
    {
LABEL_8:
      v13 = v10;

      goto LABEL_9;
    }

  }
  -[HAP2TLVAddPairingRequest method](self, "method");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HAP2TLVAddPairingRequest method](self, "method");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v12, "serializeWithError:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_8;

  }
  -[HAP2TLVAddPairingRequest identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HAP2TLVAddPairingRequest identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v16, "serializeWithError:", &v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v32;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v17 = objc_msgSend(v9, "bytes");
      v18 = v17 + objc_msgSend(v9, "length");
      while (1)
      {
        v19 = (uint64_t)(v18 - v17) >= 255 ? 255 : v18 - v17;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_8;
        v17 += v19;
        if (v17 >= v18)
        {

          goto LABEL_22;
        }
      }
    }
    goto LABEL_33;
  }
LABEL_22:
  -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v21, "serializeWithError:", &v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v31;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v22 = objc_msgSend(v9, "bytes");
      v23 = v22 + objc_msgSend(v9, "length");
      while (1)
      {
        v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_8;
        v22 += v24;
        if (v22 >= v23)
        {

          goto LABEL_31;
        }
      }
    }
LABEL_33:

    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v8 = v14;
      goto LABEL_35;
    }
LABEL_36:
    v27 = 0;
    goto LABEL_37;
  }
LABEL_31:
  -[HAP2TLVAddPairingRequest permissions](self, "permissions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_39;
  -[HAP2TLVAddPairingRequest permissions](self, "permissions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v26, "serializeWithError:", &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;

  if (v8)
    goto LABEL_33;
  v29 = objc_retainAutorelease(v7);
  objc_msgSend(v29, "bytes");
  objc_msgSend(v29, "length");
  v13 = TLV8BufferAppend();

  if (!(_DWORD)v13)
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_37;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  HMErrorFromOSStatus(v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_35:
  v27 = 0;
  *a3 = v14;
LABEL_37:
  TLV8BufferFree();

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVAddPairingRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAP2TLVAddPairingRequest *v10;

  v4 = +[HAP2TLVAddPairingRequest allocWithZone:](HAP2TLVAddPairingRequest, "allocWithZone:", a3);
  -[HAP2TLVAddPairingRequest state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest method](self, "method");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest permissions](self, "permissions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAP2TLVAddPairingRequest initWithState:method:identifier:publicKey:permissions:](v4, "initWithState:method:identifier:publicKey:permissions:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAP2TLVAddPairingRequest *v5;
  HAP2TLVAddPairingRequest *v6;
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

  v5 = (HAP2TLVAddPairingRequest *)a3;
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
      -[HAP2TLVAddPairingRequest state](self, "state");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVAddPairingRequest state](v6, "state");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAP2TLVAddPairingRequest state](self, "state");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVAddPairingRequest state](v6, "state");
        v39 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[HAP2TLVAddPairingRequest method](self, "method");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVAddPairingRequest method](v6, "method");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAP2TLVAddPairingRequest method](self, "method");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVAddPairingRequest method](v6, "method");
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
      -[HAP2TLVAddPairingRequest identifier](self, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVAddPairingRequest identifier](v6, "identifier");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      if (v13 != v36)
      {
        -[HAP2TLVAddPairingRequest identifier](self, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVAddPairingRequest identifier](v6, "identifier");
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
      -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVAddPairingRequest publicKey](v6, "publicKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVAddPairingRequest publicKey](v6, "publicKey");
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
      -[HAP2TLVAddPairingRequest permissions](self, "permissions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVAddPairingRequest permissions](v6, "permissions");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

        v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        -[HAP2TLVAddPairingRequest permissions](self, "permissions");
        v27 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVAddPairingRequest permissions](v6, "permissions");
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
  -[HAP2TLVAddPairingRequest state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest method](self, "method");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVAddPairingRequest permissions](self, "permissions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAP2TLVAddPairingRequest state=%@, method=%@, identifier=%@, publicKey=%@, permissions=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HAP2TLVPairingStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (HAP2TLVPairingMethodWrapper)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_storeStrong((id *)&self->_method, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (HAPTLVUnsignedNumberValue)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVAddPairingRequest *v6;
  HAP2TLVAddPairingRequest *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVAddPairingRequest);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVAddPairingRequest parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
