@implementation HMDNetworkRouterAccessViolation

- (HMDNetworkRouterAccessViolation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAccessViolation;
  return -[HMDNetworkRouterAccessViolation init](&v3, sel_init);
}

- (HMDNetworkRouterAccessViolation)initWithClientIdentifier:(id)a3 lastViolationTimestamp:(id)a4 lastResetTimestamp:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDNetworkRouterAccessViolation *v12;
  HMDNetworkRouterAccessViolation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterAccessViolation;
  v12 = -[HMDNetworkRouterAccessViolation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientIdentifier, a3);
    objc_storeStrong((id *)&v13->_lastViolationTimestamp, a4);
    objc_storeStrong((id *)&v13->_lastResetTimestamp, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  HMDNetworkRouterAccessViolation *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (!v9)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_26:
    -[HMDNetworkRouterAccessViolation setClientIdentifier:](self, "setClientIdentifier:", v13, v22);
    -[HMDNetworkRouterAccessViolation setLastViolationTimestamp:](self, "setLastViolationTimestamp:", v12);
    -[HMDNetworkRouterAccessViolation setLastResetTimestamp:](self, "setLastResetTimestamp:", v11);
    v10 = 0;
    v19 = 1;
    goto LABEL_30;
  }
  v22 = self;
  v23 = v7;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = v8 + v9;
  while (1)
  {
    v31 = 0;
    v29 = 0;
    v30 = 0;
    v27 = 0;
    v28 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      v7 = v23;
      if (a4)
      {
        HMErrorFromOSStatus();
        v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_30;
    }
    if (!v30)
      break;
    switch(v31)
    {
      case 3:
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v10;
        v16 = &v24;
        objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v15, &v24);
        v17 = v11;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v10;
        v16 = &v25;
        objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v15, &v25);
        v17 = v12;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 1:
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v10;
        v16 = &v26;
        objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v15, &v26);
        v17 = v13;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v18 = *v16;

        v10 = v18;
        break;
    }
    if (v29)
      free(v29);
    if (v27 == v14)
    {
      if (v10)
        goto LABEL_19;
LABEL_25:
      self = v22;
      v7 = v23;
      goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
  v20 = objc_claimAutoreleasedReturnValue();

  v10 = (id)v20;
  if (!v20)
    goto LABEL_25;
LABEL_19:
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v19 = 0;
    *a4 = v10;
  }
  else
  {
    v19 = 0;
  }
  v7 = v23;
LABEL_30:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v19;
  id v20;
  id v21;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
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
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v6, "serializeWithError:", &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
    {
LABEL_8:

      goto LABEL_9;
    }

  }
  -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v11, "serializeWithError:", &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_8;

  }
  -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_20;
  -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v14, "serializeWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;

  if (v8)
  {
LABEL_15:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_17;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_21;
  }
  v16 = objc_retainAutorelease(v7);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");
  v17 = TLV8BufferAppend();

  if (!v17)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_21;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  HMErrorFromOSStatus();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_17:
  v15 = 0;
  *a3 = v12;
LABEL_21:
  TLV8BufferFree();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterAccessViolation *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDNetworkRouterAccessViolation *v8;

  v4 = +[HMDNetworkRouterAccessViolation allocWithZone:](HMDNetworkRouterAccessViolation, "allocWithZone:", a3);
  -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDNetworkRouterAccessViolation initWithClientIdentifier:lastViolationTimestamp:lastResetTimestamp:](v4, "initWithClientIdentifier:lastViolationTimestamp:lastResetTimestamp:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HMDNetworkRouterAccessViolation *v6;
  HMDNetworkRouterAccessViolation *v7;
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

  v6 = (HMDNetworkRouterAccessViolation *)a3;
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
      -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterAccessViolation clientIdentifier](v7, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterAccessViolation clientIdentifier](v7, "clientIdentifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterAccessViolation lastViolationTimestamp](v7, "lastViolationTimestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterAccessViolation lastViolationTimestamp](v7, "lastViolationTimestamp");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterAccessViolation lastResetTimestamp](v7, "lastResetTimestamp");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterAccessViolation lastResetTimestamp](v7, "lastResetTimestamp");
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDNetworkRouterAccessViolation clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolation lastViolationTimestamp](self, "lastViolationTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolation lastResetTimestamp](self, "lastResetTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterAccessViolation clientIdentifier=%@, lastViolationTimestamp=%@, lastResetTimestamp=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPTLVUnsignedNumberValue)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (HAPTLVUnsignedNumberValue)lastViolationTimestamp
{
  return self->_lastViolationTimestamp;
}

- (void)setLastViolationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastViolationTimestamp, a3);
}

- (HAPTLVUnsignedNumberValue)lastResetTimestamp
{
  return self->_lastResetTimestamp;
}

- (void)setLastResetTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastResetTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetTimestamp, 0);
  objc_storeStrong((id *)&self->_lastViolationTimestamp, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterAccessViolation *v6;
  HMDNetworkRouterAccessViolation *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterAccessViolation);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterAccessViolation parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
