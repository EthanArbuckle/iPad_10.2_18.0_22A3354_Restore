@implementation HAP2TLVOldServiceList

- (HAP2TLVOldServiceList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVOldServiceList;
  return -[HAP2TLVOldServiceList init](&v3, sel_init);
}

- (HAP2TLVOldServiceList)initWithServiceList:(id)a3
{
  id v5;
  HAP2TLVOldServiceList *v6;
  HAP2TLVOldServiceList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2TLVOldServiceList;
  v6 = -[HAP2TLVOldServiceList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceList, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t Next;
  void *v13;
  id v14;
  uint64_t v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  id v20;
  id v21;
  unint64_t v22[2];
  uint64_t v23;
  char v24;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
LABEL_13:
    -[HAP2TLVOldServiceList setServiceList:](self, "setServiceList:", v9);
    v10 = 0;
    v16 = 1;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = v7 + v8;
    while (1)
    {
      v24 = 0;
      v22[1] = 0;
      v23 = 0;
      v22[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v18 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v18;
        if (!v18)
          goto LABEL_13;
LABEL_17:
        if (a4)
        {
          v17 = objc_retainAutorelease(v10);
          v10 = v17;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      if (v24 == 22)
      {
        v21 = v10;
        HAPTLVParseContiguousTlvs(22, v7, v11, v22, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (!v14)
        {
          v20 = 0;
          +[HAP2TLVParamServiceList parsedFromData:error:](HAP2TLVParamServiceList, "parsedFromData:error:", v13, &v20);
          v15 = objc_claimAutoreleasedReturnValue();
          v14 = v20;

          v9 = (void *)v15;
        }

        v10 = v14;
      }
      v7 = v22[0];
      if (v22[0] >= v11)
      {
        if (!v10)
          goto LABEL_13;
        goto LABEL_17;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v16 = 0;
      *a4 = v17;
      goto LABEL_21;
    }
LABEL_20:
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v20;
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
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
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
  v29 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  TLV8BufferInit();
  -[HAP2TLVOldServiceList serviceList](self, "serviceList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_21;
  -[HAP2TLVOldServiceList serviceList](self, "serviceList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v6, "serializeWithError:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (!v8)
  {
    v10 = objc_retainAutorelease(v7);
    v11 = objc_msgSend(v10, "bytes");
    v12 = v11 + objc_msgSend(v10, "length");
    do
    {
      if ((uint64_t)(v12 - v11) >= 255)
        v13 = 255;
      else
        v13 = v12 - v11;
      v14 = TLV8BufferAppend();
      if ((_DWORD)v14)
        v15 = 0;
      else
        v15 = v13;
      v11 += v15;
      if ((_DWORD)v14)
        v16 = 1;
      else
        v16 = v11 >= v12;
    }
    while (!v16);
    v17 = v14;

    if ((_DWORD)v17)
    {
      if (a3)
      {
        HMErrorFromOSStatus(v17);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_20;
      }
      v8 = 0;
LABEL_23:
      v18 = 0;
      goto LABEL_24;
    }
LABEL_21:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_24;
  }

  if (!a3)
    goto LABEL_23;
  v9 = objc_retainAutorelease(v8);
  v8 = v9;
LABEL_20:
  v18 = 0;
  *a3 = v9;
LABEL_24:
  TLV8BufferFree();

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVOldServiceList *v4;
  void *v5;
  HAP2TLVOldServiceList *v6;

  v4 = +[HAP2TLVOldServiceList allocWithZone:](HAP2TLVOldServiceList, "allocWithZone:", a3);
  -[HAP2TLVOldServiceList serviceList](self, "serviceList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAP2TLVOldServiceList initWithServiceList:](v4, "initWithServiceList:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAP2TLVOldServiceList *v4;
  HAP2TLVOldServiceList *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HAP2TLVOldServiceList *)a3;
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
      -[HAP2TLVOldServiceList serviceList](self, "serviceList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVOldServiceList serviceList](v5, "serviceList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HAP2TLVOldServiceList serviceList](self, "serviceList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVOldServiceList serviceList](v5, "serviceList");
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
  -[HAP2TLVOldServiceList serviceList](self, "serviceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAP2TLVOldServiceList serviceList=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HAP2TLVParamServiceList)serviceList
{
  return self->_serviceList;
}

- (void)setServiceList:(id)a3
{
  objc_storeStrong((id *)&self->_serviceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceList, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVOldServiceList *v6;
  HAP2TLVOldServiceList *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVOldServiceList);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVOldServiceList parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
