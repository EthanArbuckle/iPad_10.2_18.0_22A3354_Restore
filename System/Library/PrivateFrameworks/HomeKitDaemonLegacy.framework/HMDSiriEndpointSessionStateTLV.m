@implementation HMDSiriEndpointSessionStateTLV

- (HMDSiriEndpointSessionStateTLV)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSiriEndpointSessionStateTLV;
  return -[HMDSiriEndpointSessionStateTLV init](&v3, sel_init);
}

- (HMDSiriEndpointSessionStateTLV)initWithSessionState:(id)a3 hubIdentifier:(id)a4
{
  id v7;
  id v8;
  HMDSiriEndpointSessionStateTLV *v9;
  HMDSiriEndpointSessionStateTLV *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSiriEndpointSessionStateTLV;
  v9 = -[HMDSiriEndpointSessionStateTLV init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionState, a3);
    objc_storeStrong((id *)&v10->_hubIdentifier, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id *v19;
  id v20;
  uint64_t v21;
  id *v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_16:
    -[HMDSiriEndpointSessionStateTLV setSessionState:](self, "setSessionState:", v10, v23);
    -[HMDSiriEndpointSessionStateTLV setHubIdentifier:](self, "setHubIdentifier:", v9);
    v11 = 0;
    v18 = 1;
    goto LABEL_24;
  }
  v23 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v7 + v8;
  while (1)
  {
    v30 = 0;
    v28 = 0;
    v29 = 0;
    v27 = 0;
    if (TLV8GetNext())
      break;
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v21;
      if (!v21)
        goto LABEL_16;
LABEL_20:
      v19 = v23;
      if (v23)
      {
        v20 = objc_retainAutorelease(v11);
        v11 = v20;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      v25 = v11;
      HAPTLVParseContiguousTlvs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

      if (!v15)
      {
        v24 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v13, &v24);
        v17 = objc_claimAutoreleasedReturnValue();
        v15 = v24;
        v16 = v9;
        v9 = (void *)v17;
LABEL_10:

      }
      v11 = v15;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      +[HMDSiriEndpointSessionStateTypeWrapper parsedFromData:error:](HMDSiriEndpointSessionStateTypeWrapper, "parsedFromData:error:", v13, &v26);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v26;

      v16 = v10;
      v10 = (void *)v14;
      goto LABEL_10;
    }
LABEL_12:
    if (v27 >= v12)
    {
      if (!v11)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus();
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v18 = 0;
    *v19 = v20;
    goto LABEL_24;
  }
LABEL_23:
  v18 = 0;
LABEL_24:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  void *v22;
  id v24;
  id v25;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  TLV8BufferInit();
  -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v6, "serializeWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;

    if (v8)
      goto LABEL_6;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_21:
      if (a3)
      {
        HMErrorFromOSStatus();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_23;
      }
      v8 = 0;
LABEL_26:
      v22 = 0;
      goto LABEL_27;
    }
  }
  -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_27;
  }
  -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v12, "serializeWithError:", &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;

  if (!v8)
  {
    v14 = objc_retainAutorelease(v7);
    v15 = objc_msgSend(v14, "bytes");
    v16 = v15 + objc_msgSend(v14, "length");
    do
    {
      if ((uint64_t)(v16 - v15) >= 255)
        v17 = 255;
      else
        v17 = v16 - v15;
      v18 = TLV8BufferAppend();
      if (v18)
        v19 = 0;
      else
        v19 = v17;
      v15 += v19;
      if (v18)
        v20 = 1;
      else
        v20 = v15 >= v16;
    }
    while (!v20);
    v21 = v18;

    if (v21)
      goto LABEL_21;
    goto LABEL_24;
  }
LABEL_6:

  if (!a3)
    goto LABEL_26;
  v13 = objc_retainAutorelease(v8);
  v8 = v13;
LABEL_23:
  v22 = 0;
  *a3 = v13;
LABEL_27:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDSiriEndpointSessionStateTLV *v4;
  void *v5;
  void *v6;
  HMDSiriEndpointSessionStateTLV *v7;

  v4 = +[HMDSiriEndpointSessionStateTLV allocWithZone:](HMDSiriEndpointSessionStateTLV, "allocWithZone:", a3);
  -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDSiriEndpointSessionStateTLV initWithSessionState:hubIdentifier:](v4, "initWithSessionState:hubIdentifier:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDSiriEndpointSessionStateTLV *v5;
  HMDSiriEndpointSessionStateTLV *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDSiriEndpointSessionStateTLV *)a3;
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
      -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointSessionStateTLV sessionState](v6, "sessionState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointSessionStateTLV sessionState](v6, "sessionState");
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
      -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointSessionStateTLV hubIdentifier](v6, "hubIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSiriEndpointSessionStateTLV hubIdentifier](v6, "hubIdentifier");
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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSiriEndpointSessionStateTLV sessionState](self, "sessionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDSiriEndpointSessionStateTLV sessionState=%@, hubIdentifier=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HMDSiriEndpointSessionStateTypeWrapper)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (NSData)hubIdentifier
{
  return self->_hubIdentifier;
}

- (void)setHubIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hubIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hubIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDSiriEndpointSessionStateTLV *v6;
  HMDSiriEndpointSessionStateTLV *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSiriEndpointSessionStateTLV);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSiriEndpointSessionStateTLV parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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

- (NSUUID)hubUUID
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  char v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v8[1] = 0;
  -[HMDSiriEndpointSessionStateTLV hubIdentifier](self, "hubIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getBytes:length:", v8, 16);

  v3 = 0;
  for (i = 15; i > v3; --i)
  {
    v5 = *((_BYTE *)v8 + v3);
    *((_BYTE *)v8 + v3) = *((_BYTE *)v8 + i);
    *((_BYTE *)v8 + i) = v5;
    ++v3;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSUUID *)v6;
}

@end
