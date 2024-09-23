@implementation HMDNetworkRouterIPAddressList

- (HMDNetworkRouterIPAddressList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterIPAddressList;
  return -[HMDNetworkRouterIPAddressList init](&v3, sel_init);
}

- (HMDNetworkRouterIPAddressList)initWithAddresses:(id)a3
{
  id v5;
  HMDNetworkRouterIPAddressList *v6;
  HMDNetworkRouterIPAddressList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterIPAddressList;
  v6 = -[HMDNetworkRouterIPAddressList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_addresses, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v11 = 0;
    v12 = v8 + v9;
    while (1)
    {
      v26 = 0;
      v24 = 0;
      v25 = 0;
      v22 = 0;
      v23 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
        break;
      if (!v25)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v17 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v17;
LABEL_19:
        if (!v11)
          goto LABEL_23;
        if (a4)
        {
          v16 = objc_retainAutorelease(v11);
          v11 = v16;
          goto LABEL_22;
        }
        goto LABEL_27;
      }
      if (v26 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v11;
        +[HMDNetworkRouterIPAddress parsedFromData:error:](HMDNetworkRouterIPAddress, "parsedFromData:error:", v13, &v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v21;

        if (!v15)
          objc_msgSend(v10, "addObject:", v14);

        v11 = v15;
      }
      if (v24)
        free(v24);
      if (v22 == v12)
        goto LABEL_19;
    }
    if (a4)
    {
      HMErrorFromOSStatus();
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v18 = 0;
      *a4 = v16;
      goto LABEL_28;
    }
LABEL_27:
    v18 = 0;
  }
  else
  {
LABEL_23:
    if (objc_msgSend(v10, "count"))
      v19 = v10;
    else
      v19 = 0;
    -[HMDNetworkRouterIPAddressList setAddresses:](self, "setAddresses:", v19);
    v11 = 0;
    v18 = 1;
  }
LABEL_28:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
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
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDNetworkRouterIPAddressList addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      if ((v8 & 1) != 0 && TLV8BufferAppend())
      {
LABEL_15:

        if (a3)
        {
          HMErrorFromOSStatus();
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          goto LABEL_17;
        }
        v17 = 0;
LABEL_19:
        v16 = 0;
        goto LABEL_20;
      }
      v20 = 0;
      objc_msgSend(v11, "serializeWithError:", &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20;
      if (v13)
      {
        v17 = v13;

        if (a3)
        {
          v18 = objc_retainAutorelease(v17);
          v17 = v18;
LABEL_17:
          v16 = 0;
          *a3 = v18;
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      v14 = objc_retainAutorelease(v12);
      objc_msgSend(v14, "bytes");
      objc_msgSend(v14, "length");
      v15 = TLV8BufferAppend();

      if (v15)
        goto LABEL_15;
      ++v10;
      v8 = 1;
    }
    while (v7 != v10);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
      continue;
    break;
  }
LABEL_12:

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
LABEL_20:
  TLV8BufferFree();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterIPAddressList *v4;
  void *v5;
  HMDNetworkRouterIPAddressList *v6;

  v4 = +[HMDNetworkRouterIPAddressList allocWithZone:](HMDNetworkRouterIPAddressList, "allocWithZone:", a3);
  -[HMDNetworkRouterIPAddressList addresses](self, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDNetworkRouterIPAddressList initWithAddresses:](v4, "initWithAddresses:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterIPAddressList *v4;
  HMDNetworkRouterIPAddressList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDNetworkRouterIPAddressList *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDNetworkRouterIPAddressList addresses](self, "addresses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterIPAddressList addresses](v5, "addresses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterIPAddressList addresses](self, "addresses");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterIPAddressList addresses](v5, "addresses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDNetworkRouterIPAddressList addresses](self, "addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDNetworkRouterIPAddressList addresses=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_addresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterIPAddressList *v6;
  HMDNetworkRouterIPAddressList *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterIPAddressList);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterIPAddressList parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
