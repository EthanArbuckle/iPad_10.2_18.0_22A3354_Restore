@implementation HMDNetworkRouterServiceType

- (HMDNetworkRouterServiceType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterServiceType;
  return -[HMDNetworkRouterServiceType init](&v3, sel_init);
}

- (HMDNetworkRouterServiceType)initWithName:(id)a3
{
  id v5;
  HMDNetworkRouterServiceType *v6;
  HMDNetworkRouterServiceType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterServiceType;
  v6 = -[HMDNetworkRouterServiceType init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

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
  uint64_t v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  HMDNetworkRouterServiceType *v20;
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
  if (!v9)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v20 = self;
  v10 = 0;
  v11 = 0;
  v12 = v8 + v9;
  do
  {
    v26 = 0;
    v24 = 0;
    v25 = 0;
    v22 = 0;
    v23 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
LABEL_20:
      v17 = 0;
      goto LABEL_24;
    }
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v18;
      if (!v18)
        goto LABEL_22;
LABEL_14:
      if (a4)
      {
        v16 = objc_retainAutorelease(v11);
        v11 = v16;
LABEL_19:
        v17 = 0;
        *a4 = v16;
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    if (v26 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v11;
      objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v13, &v21);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v21;

      v11 = v15;
      v10 = (void *)v14;
    }
    if (v24)
      free(v24);
  }
  while (v22 != v12);
  if (v11)
    goto LABEL_14;
LABEL_22:
  self = v20;
LABEL_23:
  -[HMDNetworkRouterServiceType setName:](self, "setName:", v10);
  v11 = 0;
  v17 = 1;
LABEL_24:

  return v17;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
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
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
  v23 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterServiceType name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  -[HMDNetworkRouterServiceType name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "serializeWithError:", &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v8)
  {
    v10 = objc_retainAutorelease(v7);
    objc_msgSend(v10, "bytes");
    objc_msgSend(v10, "length");
    v11 = TLV8BufferAppend();

    if (v11)
    {
      if (a3)
      {
        HMErrorFromOSStatus();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_8;
      }
      v8 = 0;
LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_12;
  }

  if (!a3)
    goto LABEL_11;
  v9 = objc_retainAutorelease(v8);
  v8 = v9;
LABEL_8:
  v12 = 0;
  *a3 = v9;
LABEL_12:
  TLV8BufferFree();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterServiceType *v4;
  void *v5;
  HMDNetworkRouterServiceType *v6;

  v4 = +[HMDNetworkRouterServiceType allocWithZone:](HMDNetworkRouterServiceType, "allocWithZone:", a3);
  -[HMDNetworkRouterServiceType name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDNetworkRouterServiceType initWithName:](v4, "initWithName:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterServiceType *v4;
  HMDNetworkRouterServiceType *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDNetworkRouterServiceType *)a3;
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
      -[HMDNetworkRouterServiceType name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterServiceType name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterServiceType name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterServiceType name](v5, "name");
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
  -[HMDNetworkRouterServiceType name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMDNetworkRouterServiceType name=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterServiceType *v6;
  HMDNetworkRouterServiceType *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterServiceType);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterServiceType parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
