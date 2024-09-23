@implementation HMNetworkRouterWANStatusList

- (HMNetworkRouterWANStatusList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMNetworkRouterWANStatusList;
  return -[HMNetworkRouterWANStatusList init](&v3, sel_init);
}

- (HMNetworkRouterWANStatusList)initWithStatuses:(id)a3
{
  id v5;
  HMNetworkRouterWANStatusList *v6;
  HMNetworkRouterWANStatusList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMNetworkRouterWANStatusList;
  v6 = -[HMNetworkRouterWANStatusList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statuses, a3);

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
  uint64_t Next;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;

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
      v27 = 0;
      v25 = 0;
      v26 = 0;
      v23 = 0;
      v24 = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      Next = TLV8GetOrCopyCoalesced();
      if ((_DWORD)Next)
        break;
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v18;
LABEL_19:
        if (!v11)
          goto LABEL_23;
        if (a4)
        {
          v17 = objc_retainAutorelease(v11);
          v11 = v17;
          goto LABEL_22;
        }
        goto LABEL_27;
      }
      if (v27 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v11;
        +[HMNetworkRouterWANStatus parsedFromData:error:](HMNetworkRouterWANStatus, "parsedFromData:error:", v14, &v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v22;

        if (!v16)
          objc_msgSend(v10, "addObject:", v15);

        v11 = v16;
      }
      if (v25)
        free(v25);
      if (v23 == v12)
        goto LABEL_19;
    }
    if (a4)
    {
      _HMErrorFromOSStatus(Next);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v19 = 0;
      *a4 = v17;
      goto LABEL_28;
    }
LABEL_27:
    v19 = 0;
  }
  else
  {
LABEL_23:
    if (objc_msgSend(v10, "count"))
      v20 = v10;
    else
      v20 = 0;
    -[HMNetworkRouterWANStatusList setStatuses:](self, "setStatuses:", v20);
    v11 = 0;
    v19 = 1;
  }
LABEL_28:

  return v19;
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
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
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
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMNetworkRouterWANStatusList statuses](self, "statuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v23;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      if ((v8 & 1) != 0)
      {
        v12 = TLV8BufferAppend();
        if ((_DWORD)v12)
        {
          v16 = v12;
LABEL_16:

          if (a3)
          {
            _HMErrorFromOSStatus(v16);
            v19 = (id)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            goto LABEL_18;
          }
          v18 = 0;
LABEL_20:
          v17 = 0;
          goto LABEL_21;
        }
      }
      v21 = 0;
      objc_msgSend(v11, "serializeWithError:", &v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;
      if (v14)
      {
        v18 = v14;

        if (a3)
        {
          v19 = objc_retainAutorelease(v18);
          v18 = v19;
LABEL_18:
          v17 = 0;
          *a3 = v19;
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      v15 = objc_retainAutorelease(v13);
      objc_msgSend(v15, "bytes");
      objc_msgSend(v15, "length");
      v16 = TLV8BufferAppend();

      if ((_DWORD)v16)
        goto LABEL_16;
      ++v10;
      v8 = 1;
    }
    while (v7 != v10);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
      continue;
    break;
  }
LABEL_12:

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
LABEL_21:
  TLV8BufferFree();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMNetworkRouterWANStatusList *v4;
  void *v5;
  HMNetworkRouterWANStatusList *v6;

  v4 = +[HMNetworkRouterWANStatusList allocWithZone:](HMNetworkRouterWANStatusList, "allocWithZone:", a3);
  -[HMNetworkRouterWANStatusList statuses](self, "statuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMNetworkRouterWANStatusList initWithStatuses:](v4, "initWithStatuses:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMNetworkRouterWANStatusList *v4;
  HMNetworkRouterWANStatusList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMNetworkRouterWANStatusList *)a3;
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
      -[HMNetworkRouterWANStatusList statuses](self, "statuses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMNetworkRouterWANStatusList statuses](v5, "statuses");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HMNetworkRouterWANStatusList statuses](self, "statuses");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMNetworkRouterWANStatusList statuses](v5, "statuses");
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

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMNetworkRouterWANStatusList statuses](self, "statuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMNetworkRouterWANStatusList statuses=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)statuses
{
  return self->_statuses;
}

- (void)setStatuses:(id)a3
{
  objc_storeStrong((id *)&self->_statuses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statuses, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMNetworkRouterWANStatusList *v6;
  HMNetworkRouterWANStatusList *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMNetworkRouterWANStatusList);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMNetworkRouterWANStatusList parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
