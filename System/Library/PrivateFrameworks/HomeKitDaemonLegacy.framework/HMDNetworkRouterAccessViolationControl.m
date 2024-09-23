@implementation HMDNetworkRouterAccessViolationControl

- (HMDNetworkRouterAccessViolationControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAccessViolationControl;
  return -[HMDNetworkRouterAccessViolationControl init](&v3, sel_init);
}

- (HMDNetworkRouterAccessViolationControl)initWithOperation:(id)a3 clientIdentifierList:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterAccessViolationControl *v9;
  HMDNetworkRouterAccessViolationControl *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterAccessViolationControl;
  v9 = -[HMDNetworkRouterAccessViolationControl init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operation, a3);
    objc_storeStrong((id *)&v10->_clientIdentifierList, a4);
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
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  HMDNetworkRouterAccessViolationControl *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;

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
  v22 = self;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v8 + v9;
  do
  {
    v29 = 0;
    v27 = 0;
    v28 = 0;
    v25 = 0;
    v26 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      v19 = 0;
      goto LABEL_27;
    }
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v20;
      if (!v20)
        goto LABEL_25;
LABEL_17:
      if (a4)
      {
        v18 = objc_retainAutorelease(v12);
        v12 = v18;
LABEL_22:
        v19 = 0;
        *a4 = v18;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v29 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v15 = &v23;
      +[HMDNetworkRouterClientIdentifierList parsedFromData:error:](HMDNetworkRouterClientIdentifierList, "parsedFromData:error:", v14, &v23);
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v29 != 1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      v15 = &v24;
      +[HMDNetworkRouterAccessViolationControlOperation parsedFromData:error:](HMDNetworkRouterAccessViolationControlOperation, "parsedFromData:error:", v14, &v24);
      v16 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = *v15;

    v12 = v17;
LABEL_13:
    if (v27)
      free(v27);
  }
  while (v25 != v13);
  if (v12)
    goto LABEL_17;
LABEL_25:
  self = v22;
LABEL_26:
  -[HMDNetworkRouterAccessViolationControl setOperation:](self, "setOperation:", v11, v22);
  -[HMDNetworkRouterAccessViolationControl setClientIdentifierList:](self, "setClientIdentifierList:", v10);
  v12 = 0;
  v19 = 1;
LABEL_27:

  return v19;
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
  -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
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
  -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
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
  HMDNetworkRouterAccessViolationControl *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterAccessViolationControl *v7;

  v4 = +[HMDNetworkRouterAccessViolationControl allocWithZone:](HMDNetworkRouterAccessViolationControl, "allocWithZone:", a3);
  -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterAccessViolationControl initWithOperation:clientIdentifierList:](v4, "initWithOperation:clientIdentifierList:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterAccessViolationControl *v5;
  HMDNetworkRouterAccessViolationControl *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterAccessViolationControl *)a3;
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
      -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterAccessViolationControl operation](v6, "operation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterAccessViolationControl operation](v6, "operation");
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
      -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterAccessViolationControl clientIdentifierList](v6, "clientIdentifierList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterAccessViolationControl clientIdentifierList](v6, "clientIdentifierList");
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
  -[HMDNetworkRouterAccessViolationControl operation](self, "operation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterAccessViolationControl clientIdentifierList](self, "clientIdentifierList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterAccessViolationControl operation=%@, clientIdentifierList=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HMDNetworkRouterAccessViolationControlOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

- (HMDNetworkRouterClientIdentifierList)clientIdentifierList
{
  return self->_clientIdentifierList;
}

- (void)setClientIdentifierList:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifierList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifierList, 0);
  objc_storeStrong((id *)&self->_operation, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterAccessViolationControl *v6;
  HMDNetworkRouterAccessViolationControl *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterAccessViolationControl);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterAccessViolationControl parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
