@implementation HAPDeviceCredentialKey

- (HAPDeviceCredentialKey)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDeviceCredentialKey;
  return -[HAPDeviceCredentialKey init](&v3, sel_init);
}

- (HAPDeviceCredentialKey)initWithType:(id)a3 key:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPDeviceCredentialKey *v12;
  HAPDeviceCredentialKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPDeviceCredentialKey;
  v12 = -[HAPDeviceCredentialKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v13->_key, a4);
    objc_storeStrong((id *)&v13->_state, a5);
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
  id *v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  HAPDeviceCredentialKey *v26;
  id *v27;
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
    goto LABEL_24;
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
    v34 = 0;
    v32[1] = 0;
    v33 = 0;
    v32[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
    {
      v21 = v27;
      if (v27)
      {
        HMErrorFromOSStatus(Next);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_25:
      v23 = 0;
      goto LABEL_26;
    }
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
      if (!v24)
        goto LABEL_23;
LABEL_16:
      v21 = v27;
      if (v27)
      {
        v22 = objc_retainAutorelease(v9);
        v9 = v22;
LABEL_21:
        v23 = 0;
        *v21 = v22;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    if (v34 == 3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v9;
      +[HAPNFCAccessKeyStateWrapper parsedFromData:error:](HAPNFCAccessKeyStateWrapper, "parsedFromData:error:", v15, &v28);
      v19 = objc_claimAutoreleasedReturnValue();
      v17 = v28;

      v18 = v10;
      v10 = (void *)v19;
LABEL_12:

      goto LABEL_13;
    }
    if (v34 != 2)
    {
      if (v34 != 1)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v9;
      +[HAPNFCAccessKeyTypeWrapper parsedFromData:error:](HAPNFCAccessKeyTypeWrapper, "parsedFromData:error:", v15, &v31);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v31;

      v18 = v12;
      v12 = (void *)v16;
      goto LABEL_12;
    }
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
      goto LABEL_12;
    }
LABEL_13:

    v9 = v17;
LABEL_14:
    v7 = v32[0];
  }
  while (v32[0] < v13);
  if (v9)
    goto LABEL_16;
LABEL_23:
  self = v26;
LABEL_24:
  -[HAPDeviceCredentialKey setType:](self, "setType:", v12, v26);
  -[HAPDeviceCredentialKey setKey:](self, "setKey:", v11);
  -[HAPDeviceCredentialKey setState:](self, "setState:", v10);
  v9 = 0;
  v23 = 1;
LABEL_26:

  return v23;
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
  void *v22;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
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
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
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
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  TLV8BufferInit();
  -[HAPDeviceCredentialKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPDeviceCredentialKey type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v6, "serializeWithError:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
      goto LABEL_19;
  }
  -[HAPDeviceCredentialKey key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_13:
    -[HAPDeviceCredentialKey state](self, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_22;
    -[HAPDeviceCredentialKey state](self, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v19, "serializeWithError:", &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (v8)
      goto LABEL_15;
    v21 = objc_retainAutorelease(v7);
    objc_msgSend(v21, "bytes");
    objc_msgSend(v21, "length");
    v10 = TLV8BufferAppend();

    if (!(_DWORD)v10)
    {
LABEL_22:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_25;
    }
LABEL_19:
    if (a3)
    {
      HMErrorFromOSStatus(v10);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_21;
    }
    v8 = 0;
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  -[HAPDeviceCredentialKey key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v12, "serializeWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

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

    goto LABEL_19;
  }
LABEL_15:

  if (!a3)
    goto LABEL_24;
  v20 = objc_retainAutorelease(v8);
  v8 = v20;
LABEL_21:
  v22 = 0;
  *a3 = v20;
LABEL_25:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPDeviceCredentialKey *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPDeviceCredentialKey *v8;

  v4 = +[HAPDeviceCredentialKey allocWithZone:](HAPDeviceCredentialKey, "allocWithZone:", a3);
  -[HAPDeviceCredentialKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDeviceCredentialKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDeviceCredentialKey state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPDeviceCredentialKey initWithType:key:state:](v4, "initWithType:key:state:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPDeviceCredentialKey *v6;
  HAPDeviceCredentialKey *v7;
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

  v6 = (HAPDeviceCredentialKey *)a3;
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
      -[HAPDeviceCredentialKey type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDeviceCredentialKey type](v7, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPDeviceCredentialKey type](self, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDeviceCredentialKey type](v7, "type");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPDeviceCredentialKey key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDeviceCredentialKey key](v7, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPDeviceCredentialKey key](self, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDeviceCredentialKey key](v7, "key");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPDeviceCredentialKey state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDeviceCredentialKey state](v7, "state");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPDeviceCredentialKey state](self, "state");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDeviceCredentialKey state](v7, "state");
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
  -[HAPDeviceCredentialKey type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDeviceCredentialKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDeviceCredentialKey state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPDeviceCredentialKey type=%@, key=%@, state=%@>"), v4, v5, v6);
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

- (HAPNFCAccessKeyStateWrapper)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDeviceCredentialKey *v6;
  HAPDeviceCredentialKey *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDeviceCredentialKey);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDeviceCredentialKey parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
