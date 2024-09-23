@implementation HAP2TLVRemovePairingRequest

- (HAP2TLVRemovePairingRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVRemovePairingRequest;
  return -[HAP2TLVRemovePairingRequest init](&v3, sel_init);
}

- (HAP2TLVRemovePairingRequest)initWithState:(id)a3 method:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAP2TLVRemovePairingRequest *v12;
  HAP2TLVRemovePairingRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAP2TLVRemovePairingRequest;
  v12 = -[HAP2TLVRemovePairingRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_method, a4);
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
LABEL_18:
    -[HAP2TLVRemovePairingRequest setState:](self, "setState:", v12);
    -[HAP2TLVRemovePairingRequest setMethod:](self, "setMethod:", v11);
    -[HAP2TLVRemovePairingRequest setIdentifier:](self, "setIdentifier:", v10);
    v9 = 0;
    v21 = 1;
    goto LABEL_26;
  }
  v26 = a4;
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
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
      if (!v24)
        goto LABEL_18;
LABEL_22:
      v22 = v26;
      if (v26)
      {
        v23 = objc_retainAutorelease(v9);
        v9 = v23;
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    switch(v33)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v9;
        +[HAP2TLVPairingMethodWrapper parsedFromData:error:](HAP2TLVPairingMethodWrapper, "parsedFromData:error:", v15, &v29);
        v19 = objc_claimAutoreleasedReturnValue();
        v17 = v29;

        v18 = v11;
        v11 = (void *)v19;
        goto LABEL_12;
      case 1:
        v28 = v9;
        HAPTLVParseContiguousTlvs(1, v7, v13, v31, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v28;

        if (!v17)
        {
          v27 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v15, &v27);
          v20 = objc_claimAutoreleasedReturnValue();
          v17 = v27;
          v18 = v10;
          v10 = (void *)v20;
LABEL_12:

        }
        v9 = v17;
        break;
      case 6:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v9;
        +[HAP2TLVPairingStateWrapper parsedFromData:error:](HAP2TLVPairingStateWrapper, "parsedFromData:error:", v15, &v30);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v30;

        v18 = v12;
        v12 = (void *)v16;
        goto LABEL_12;
    }
    v7 = v31[0];
    if (v31[0] >= v13)
    {
      if (!v9)
        goto LABEL_18;
      goto LABEL_22;
    }
  }
  v22 = v26;
  if (v26)
  {
    HMErrorFromOSStatus(Next);
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
    v21 = 0;
    *v22 = v23;
    goto LABEL_26;
  }
LABEL_25:
  v21 = 0;
LABEL_26:

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
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
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
  -[HAP2TLVRemovePairingRequest state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAP2TLVRemovePairingRequest state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v6, "serializeWithError:", &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;

    if (v8)
      goto LABEL_15;
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
  -[HAP2TLVRemovePairingRequest method](self, "method");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HAP2TLVRemovePairingRequest method](self, "method");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v12, "serializeWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_8;

  }
  -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_32;
  -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v16, "serializeWithError:", &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;

  if (v8)
  {
LABEL_15:

    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v8 = v14;
      goto LABEL_17;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_33;
  }
  v18 = objc_retainAutorelease(v7);
  v19 = objc_msgSend(v18, "bytes");
  v20 = v19 + objc_msgSend(v18, "length");
  do
  {
    if ((uint64_t)(v20 - v19) >= 255)
      v21 = 255;
    else
      v21 = v20 - v19;
    v22 = TLV8BufferAppend();
    if ((_DWORD)v22)
      v23 = 0;
    else
      v23 = v21;
    v19 += v23;
    if ((_DWORD)v22)
      v24 = 1;
    else
      v24 = v19 >= v20;
  }
  while (!v24);
  v13 = v22;

  if (!(_DWORD)v13)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_33;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  HMErrorFromOSStatus(v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_17:
  v17 = 0;
  *a3 = v14;
LABEL_33:
  TLV8BufferFree();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVRemovePairingRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  HAP2TLVRemovePairingRequest *v8;

  v4 = +[HAP2TLVRemovePairingRequest allocWithZone:](HAP2TLVRemovePairingRequest, "allocWithZone:", a3);
  -[HAP2TLVRemovePairingRequest state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVRemovePairingRequest method](self, "method");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAP2TLVRemovePairingRequest initWithState:method:identifier:](v4, "initWithState:method:identifier:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAP2TLVRemovePairingRequest *v6;
  HAP2TLVRemovePairingRequest *v7;
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

  v6 = (HAP2TLVRemovePairingRequest *)a3;
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
      -[HAP2TLVRemovePairingRequest state](self, "state");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVRemovePairingRequest state](v7, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAP2TLVRemovePairingRequest state](self, "state");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVRemovePairingRequest state](v7, "state");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAP2TLVRemovePairingRequest method](self, "method");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVRemovePairingRequest method](v7, "method");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAP2TLVRemovePairingRequest method](self, "method");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVRemovePairingRequest method](v7, "method");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVRemovePairingRequest identifier](v7, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVRemovePairingRequest identifier](v7, "identifier");
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
  -[HAP2TLVRemovePairingRequest state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVRemovePairingRequest method](self, "method");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVRemovePairingRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAP2TLVRemovePairingRequest state=%@, method=%@, identifier=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVRemovePairingRequest *v6;
  HAP2TLVRemovePairingRequest *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVRemovePairingRequest);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVRemovePairingRequest parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
