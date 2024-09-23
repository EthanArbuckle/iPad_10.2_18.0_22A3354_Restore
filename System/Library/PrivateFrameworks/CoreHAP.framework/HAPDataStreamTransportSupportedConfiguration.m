@implementation HAPDataStreamTransportSupportedConfiguration

- (NSMutableArray)configurations
{
  return self->_configurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDataStreamTransportSupportedConfiguration *v6;
  HAPDataStreamTransportSupportedConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportSupportedConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDataStreamTransportSupportedConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  id v20;
  id v21;
  unint64_t v22[2];
  uint64_t v23;
  char v24;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= 1)
  {
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
      {
        if (a4)
        {
          HMErrorFromOSStatus(Next);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        goto LABEL_20;
      }
      if (!v23)
        break;
      if (v24 == 1)
      {
        v21 = v10;
        HAPTLVParseContiguousTlvs(1, v7, v11, v22, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (!v14)
        {
          v20 = 0;
          +[HAPDataStreamTransportConfiguration parsedFromData:error:](HAPDataStreamTransportConfiguration, "parsedFromData:error:", v13, &v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v20;
          if (!v14)
            objc_msgSend(v9, "addObject:", v15);

        }
        v10 = v14;
      }
      v7 = v22[0];
      if (v22[0] >= v11)
      {
        if (!v10)
          goto LABEL_19;
LABEL_13:
        if (a4)
        {
          v16 = objc_retainAutorelease(v10);
          v10 = v16;
LABEL_17:
          v17 = 0;
          *a4 = v16;
          goto LABEL_21;
        }
LABEL_20:
        v17 = 0;
        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
    if (v18)
      goto LABEL_13;
  }
LABEL_19:
  -[HAPDataStreamTransportSupportedConfiguration setConfigurations:](self, "setConfigurations:", v9);
  v10 = 0;
  v17 = 1;
LABEL_21:

  return v17;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (HAPDataStreamTransportSupportedConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportSupportedConfiguration;
  return -[HAPDataStreamTransportSupportedConfiguration init](&v3, sel_init);
}

- (HAPDataStreamTransportSupportedConfiguration)initWithConfigurations:(id)a3
{
  id v4;
  HAPDataStreamTransportSupportedConfiguration *v5;
  uint64_t v6;
  NSMutableArray *configurations;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPDataStreamTransportSupportedConfiguration;
  v5 = -[HAPDataStreamTransportSupportedConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    configurations = v5->_configurations;
    v5->_configurations = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *v23;
  id v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
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
  v33 = 0u;
  TLV8BufferInit();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HAPDataStreamTransportSupportedConfiguration configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = 1;
    v26 = a3;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        v12 = TLV8BufferAppend();
        if ((_DWORD)v12)
          break;
      }
      v27 = 0;
      objc_msgSend(v11, "serializeWithError:", &v27, v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      if (v14)
      {
        v21 = v14;

        v23 = v26;
        if (v26)
        {
          v24 = objc_retainAutorelease(v21);
          v21 = v24;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      v15 = objc_retainAutorelease(v13);
      v16 = objc_msgSend(v15, "bytes");
      v17 = v16 + objc_msgSend(v15, "length");
      do
      {
        if ((uint64_t)(v17 - v16) >= 255)
          v18 = 255;
        else
          v18 = v17 - v16;
        v19 = TLV8BufferAppend();
        if ((_DWORD)v19)
        {
          v22 = v19;

          goto LABEL_19;
        }
        v16 += v18;
      }
      while (v16 < v17);

      v9 = 0;
      if (++v10 != v7)
        goto LABEL_4;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v9 = 0;
      if (!v7)
        goto LABEL_17;
    }
    v22 = v12;
LABEL_19:

    v23 = v26;
    if (v26)
    {
      HMErrorFromOSStatus(v22);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
LABEL_21:
      v20 = 0;
      *v23 = v24;
      goto LABEL_24;
    }
    v21 = 0;
LABEL_23:
    v20 = 0;
  }
  else
  {
LABEL_17:

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
  }
LABEL_24:
  TLV8BufferFree();

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPDataStreamTransportSupportedConfiguration *v4;
  void *v5;
  HAPDataStreamTransportSupportedConfiguration *v6;

  v4 = +[HAPDataStreamTransportSupportedConfiguration allocWithZone:](HAPDataStreamTransportSupportedConfiguration, "allocWithZone:", a3);
  -[HAPDataStreamTransportSupportedConfiguration configurations](self, "configurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPDataStreamTransportSupportedConfiguration initWithConfigurations:](v4, "initWithConfigurations:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAPDataStreamTransportSupportedConfiguration *v4;
  HAPDataStreamTransportSupportedConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HAPDataStreamTransportSupportedConfiguration *)a3;
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
      -[HAPDataStreamTransportSupportedConfiguration configurations](self, "configurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDataStreamTransportSupportedConfiguration configurations](v5, "configurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HAPDataStreamTransportSupportedConfiguration configurations](self, "configurations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDataStreamTransportSupportedConfiguration configurations](v5, "configurations");
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
  -[HAPDataStreamTransportSupportedConfiguration configurations](self, "configurations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAPDataStreamTransportSupportedConfiguration configurations=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
