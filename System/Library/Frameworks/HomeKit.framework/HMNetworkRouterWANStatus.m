@implementation HMNetworkRouterWANStatus

- (HMNetworkRouterWANStatus)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMNetworkRouterWANStatus;
  return -[HMNetworkRouterWANStatus init](&v3, sel_init);
}

- (HMNetworkRouterWANStatus)initWithIdentifier:(id)a3 status:(id)a4
{
  id v7;
  id v8;
  HMNetworkRouterWANStatus *v9;
  HMNetworkRouterWANStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMNetworkRouterWANStatus;
  v9 = -[HMNetworkRouterWANStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_status, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t Next;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id HAPTLVUnsignedNumberValueClass;
  id v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  HMNetworkRouterWANStatus *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (!v9)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_26;
  }
  v25 = self;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v8 + v9;
  do
  {
    v32 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next || (Next = TLV8GetOrCopyCoalesced(), (_DWORD)Next))
    {
      if (a4)
      {
        _HMErrorFromOSStatus(Next);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      v22 = 0;
      goto LABEL_27;
    }
    if (!v31)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v23;
      if (!v23)
        goto LABEL_25;
LABEL_17:
      if (a4)
      {
        v21 = objc_retainAutorelease(v12);
        v12 = v21;
LABEL_22:
        v22 = 0;
        *a4 = v21;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v32 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HAPTLVUnsignedNumberValueClass = getHAPTLVUnsignedNumberValueClass();
      v26 = v12;
      v17 = &v26;
      objc_msgSend(HAPTLVUnsignedNumberValueClass, "parsedFromData:error:", v15, &v26);
      v18 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v32 != 1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = getHAPTLVUnsignedNumberValueClass();
      v27 = v12;
      v17 = &v27;
      objc_msgSend(v16, "parsedFromData:error:", v15, &v27);
      v18 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = *v17;

    v12 = v20;
LABEL_13:
    if (v30)
      free(v30);
  }
  while (v28 != v13);
  if (v12)
    goto LABEL_17;
LABEL_25:
  self = v25;
LABEL_26:
  -[HMNetworkRouterWANStatus setIdentifier:](self, "setIdentifier:", v11, v25);
  -[HMNetworkRouterWANStatus setStatus:](self, "setStatus:", v10);
  v12 = 0;
  v22 = 1;
LABEL_27:

  return v22;
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
  id v14;
  void *v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  TLV8BufferInit();
  -[HMNetworkRouterWANStatus identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMNetworkRouterWANStatus identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "serializeWithError:", &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v8)
      goto LABEL_6;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
    {
LABEL_9:
      if (a3)
      {
        _HMErrorFromOSStatus(v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_11;
      }
      v8 = 0;
LABEL_14:
      v15 = 0;
      goto LABEL_15;
    }
  }
  -[HMNetworkRouterWANStatus status](self, "status");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMNetworkRouterWANStatus status](self, "status");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v12, "serializeWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (!v8)
  {
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_6:

  if (!a3)
    goto LABEL_14;
  v13 = objc_retainAutorelease(v8);
  v8 = v13;
LABEL_11:
  v15 = 0;
  *a3 = v13;
LABEL_15:
  TLV8BufferFree();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMNetworkRouterWANStatus *v4;
  void *v5;
  void *v6;
  HMNetworkRouterWANStatus *v7;

  v4 = +[HMNetworkRouterWANStatus allocWithZone:](HMNetworkRouterWANStatus, "allocWithZone:", a3);
  -[HMNetworkRouterWANStatus identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMNetworkRouterWANStatus status](self, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMNetworkRouterWANStatus initWithIdentifier:status:](v4, "initWithIdentifier:status:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMNetworkRouterWANStatus *v5;
  HMNetworkRouterWANStatus *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMNetworkRouterWANStatus *)a3;
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
      -[HMNetworkRouterWANStatus identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMNetworkRouterWANStatus identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMNetworkRouterWANStatus identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMNetworkRouterWANStatus identifier](v6, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[HMNetworkRouterWANStatus status](self, "status");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMNetworkRouterWANStatus status](v6, "status");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMNetworkRouterWANStatus status](self, "status");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMNetworkRouterWANStatus status](v6, "status");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMNetworkRouterWANStatus identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMNetworkRouterWANStatus status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMNetworkRouterWANStatus identifier=%@, status=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HAPTLVUnsignedNumberValue)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (HAPTLVUnsignedNumberValue)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMNetworkRouterWANStatus *v6;
  HMNetworkRouterWANStatus *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMNetworkRouterWANStatus);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMNetworkRouterWANStatus parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
