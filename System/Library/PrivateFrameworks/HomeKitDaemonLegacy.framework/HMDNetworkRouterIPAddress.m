@implementation HMDNetworkRouterIPAddress

+ (id)ipAddressFromNetAddress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  HMDNetworkRouterIPAddress *v13;
  void *v14;
  void *v15;
  HMDNetworkRouterIPAddress *v16;

  v5 = a3;
  objc_msgSend(v5, "dataUsingEncoding:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = objc_msgSend(v5, "addressFamily");
  if (v7 == 2)
  {
    v8 = objc_msgSend(v6, "bytes") + 8;
    v9 = (void *)MEMORY[0x1E0C99D50];
    v10 = 16;
    goto LABEL_7;
  }
  if (v7 != 1)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v6, "bytes") + 4;
  v9 = (void *)MEMORY[0x1E0C99D50];
  v10 = 4;
LABEL_7:
  objc_msgSend(v9, "dataWithBytes:length:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  if (v11)
  {
    v12 = objc_msgSend(v5, "addressFamily");
    if (v12 == 2)
    {
      v13 = [HMDNetworkRouterIPAddress alloc];
      v14 = 0;
      v15 = v11;
      goto LABEL_15;
    }
    if (v12 == 1)
    {
      v13 = [HMDNetworkRouterIPAddress alloc];
      v14 = v11;
      v15 = 0;
LABEL_15:
      v16 = -[HMDNetworkRouterIPAddress initWithV4:v6:](v13, "initWithV4:v6:", v14, v15);
      goto LABEL_17;
    }
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_17:

  return v16;
}

+ (id)ipAddressFromRuleAddress:(id)a3 allowWildcard:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  HMDNetworkRouterIPAddress *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterIPAddress *v12;
  int v14;

  v4 = a4;
  v6 = a3;
  if (v4
    && (+[HMDNetworkRouterFirewallRuleWAN ipAddressAny](HMDNetworkRouterFirewallRuleWAN, "ipAddressAny"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v8))
  {
    v14 = 0;
    v9 = [HMDNetworkRouterIPAddress alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", MEMORY[0x1E0C83920], 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDNetworkRouterIPAddress initWithV4:v6:](v9, "initWithV4:v6:", v10, v11);

  }
  else
  {
    objc_msgSend(a1, "ipAddressFromNetAddress:error:", v6, 0);
    v12 = (HMDNetworkRouterIPAddress *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (HMDNetworkRouterIPAddress)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterIPAddress;
  return -[HMDNetworkRouterIPAddress init](&v3, sel_init);
}

- (HMDNetworkRouterIPAddress)initWithV4:(id)a3 v6:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterIPAddress *v9;
  HMDNetworkRouterIPAddress *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterIPAddress;
  v9 = -[HMDNetworkRouterIPAddress init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v4, a3);
    objc_storeStrong((id *)&v10->_v6, a4);
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
  id v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;

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
LABEL_24:
    -[HMDNetworkRouterIPAddress setV4:](self, "setV4:", v11, v21);
    -[HMDNetworkRouterIPAddress setV6:](self, "setV6:", v10);
    v12 = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v21 = v7;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v8 + v9;
  while (1)
  {
    v28 = 0;
    v26 = 0;
    v27 = 0;
    v24 = 0;
    v25 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      v7 = v21;
      if (a4)
      {
        HMErrorFromOSStatus();
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_28;
    }
    if (!v27)
      break;
    if (v28 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v12;
      v15 = &v22;
      objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v22);
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (v28 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v15 = &v23;
      objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v23);
      v16 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v17 = *v15;

      v12 = v17;
    }
    if (v26)
      free(v26);
    if (v24 == v13)
    {
      if (v12)
        goto LABEL_17;
LABEL_23:
      v7 = v21;
      goto LABEL_24;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
  v19 = objc_claimAutoreleasedReturnValue();

  v12 = (id)v19;
  if (!v19)
    goto LABEL_23;
LABEL_17:
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v18 = 0;
    *a4 = v12;
  }
  else
  {
    v18 = 0;
  }
  v7 = v21;
LABEL_28:

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
  int v15;
  void *v16;
  id v18;
  id v19;
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
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterIPAddress v4](self, "v4");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterIPAddress v4](self, "v4");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v6, "serializeWithError:", &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v8)
      goto LABEL_6;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_11;
      }
      v8 = 0;
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
  }
  -[HMDNetworkRouterIPAddress v6](self, "v6");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMDNetworkRouterIPAddress v6](self, "v6");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v12, "serializeWithError:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (!v8)
  {
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    v15 = TLV8BufferAppend();

    if (v15)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_6:

  if (!a3)
    goto LABEL_14;
  v13 = objc_retainAutorelease(v8);
  v8 = v13;
LABEL_11:
  v16 = 0;
  *a3 = v13;
LABEL_15:
  TLV8BufferFree();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterIPAddress *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterIPAddress *v7;

  v4 = +[HMDNetworkRouterIPAddress allocWithZone:](HMDNetworkRouterIPAddress, "allocWithZone:", a3);
  -[HMDNetworkRouterIPAddress v4](self, "v4");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterIPAddress v6](self, "v6");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterIPAddress initWithV4:v6:](v4, "initWithV4:v6:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterIPAddress *v5;
  HMDNetworkRouterIPAddress *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterIPAddress *)a3;
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
      -[HMDNetworkRouterIPAddress v4](self, "v4");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterIPAddress v4](v6, "v4");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterIPAddress v4](self, "v4");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterIPAddress v4](v6, "v4");
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
      -[HMDNetworkRouterIPAddress v6](self, "v6");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterIPAddress v6](v6, "v6");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterIPAddress v6](self, "v6");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterIPAddress v6](v6, "v6");
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
  -[HMDNetworkRouterIPAddress v4](self, "v4");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterIPAddress v6](self, "v6");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterIPAddress v4=%@, v6=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)v4
{
  return self->_v4;
}

- (void)setV4:(id)a3
{
  objc_storeStrong((id *)&self->_v4, a3);
}

- (NSData)v6
{
  return self->_v6;
}

- (void)setV6:(id)a3
{
  objc_storeStrong((id *)&self->_v6, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v6, 0);
  objc_storeStrong((id *)&self->_v4, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterIPAddress *v6;
  HMDNetworkRouterIPAddress *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterIPAddress);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterIPAddress parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
