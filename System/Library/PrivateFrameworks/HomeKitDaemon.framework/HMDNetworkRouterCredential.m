@implementation HMDNetworkRouterCredential

- (HMDNetworkRouterCredential)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterCredential;
  return -[HMDNetworkRouterCredential init](&v3, sel_init);
}

- (HMDNetworkRouterCredential)initWithMacAddress:(id)a3 psk:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterCredential *v9;
  HMDNetworkRouterCredential *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterCredential;
  v9 = -[HMDNetworkRouterCredential init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_macAddress, a3);
    objc_storeStrong((id *)&v10->_psk, a4);
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
    -[HMDNetworkRouterCredential setMacAddress:](self, "setMacAddress:", v11, v21);
    -[HMDNetworkRouterCredential setPsk:](self, "setPsk:", v10);
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
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v12;
      v15 = &v22;
      objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v22);
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (v28 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v15 = &v23;
      objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v23);
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
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
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

  v41 = *MEMORY[0x24BDAC8D0];
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
  -[HMDNetworkRouterCredential macAddress](self, "macAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterCredential macAddress](self, "macAddress");
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
  -[HMDNetworkRouterCredential psk](self, "psk");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMDNetworkRouterCredential psk](self, "psk");
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
  HMDNetworkRouterCredential *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterCredential *v7;

  v4 = +[HMDNetworkRouterCredential allocWithZone:](HMDNetworkRouterCredential, "allocWithZone:", a3);
  -[HMDNetworkRouterCredential macAddress](self, "macAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterCredential psk](self, "psk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterCredential initWithMacAddress:psk:](v4, "initWithMacAddress:psk:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterCredential *v5;
  HMDNetworkRouterCredential *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterCredential *)a3;
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
      -[HMDNetworkRouterCredential macAddress](self, "macAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterCredential macAddress](v6, "macAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterCredential macAddress](self, "macAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterCredential macAddress](v6, "macAddress");
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
      -[HMDNetworkRouterCredential psk](self, "psk");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterCredential psk](v6, "psk");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterCredential psk](self, "psk");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterCredential psk](v6, "psk");
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDNetworkRouterCredential macAddress](self, "macAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterCredential psk](self, "psk");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterCredential macAddress=%@, psk=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (NSData)psk
{
  return self->_psk;
}

- (void)setPsk:(id)a3
{
  objc_storeStrong((id *)&self->_psk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterCredential *v6;
  HMDNetworkRouterCredential *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterCredential);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterCredential parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
