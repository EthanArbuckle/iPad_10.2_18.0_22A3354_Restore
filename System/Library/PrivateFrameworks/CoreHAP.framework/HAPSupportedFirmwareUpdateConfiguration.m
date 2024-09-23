@implementation HAPSupportedFirmwareUpdateConfiguration

- (HAPSupportedFirmwareUpdateConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  return -[HAPSupportedFirmwareUpdateConfiguration init](&v3, sel_init);
}

- (HAPSupportedFirmwareUpdateConfiguration)initWithUpdateDuration:(id)a3
{
  id v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;
  HAPSupportedFirmwareUpdateConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPSupportedFirmwareUpdateConfiguration;
  v6 = -[HAPSupportedFirmwareUpdateConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_updateDuration, a3);

  return v7;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t Next;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  HAPSupportedFirmwareUpdateConfiguration *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v20 = self;
  v9 = 0;
  v10 = 0;
  v11 = v7 + v8;
  do
  {
    v25 = 0;
    v23 = 0;
    v24 = 0;
    v22 = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
    {
      if (a4)
      {
        HMErrorFromOSStatus(Next);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_18:
      v17 = 0;
      goto LABEL_19;
    }
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
      if (!v18)
        goto LABEL_16;
LABEL_9:
      if (a4)
      {
        v16 = objc_retainAutorelease(v10);
        v10 = v16;
LABEL_14:
        v17 = 0;
        *a4 = v16;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    if (v25 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v10;
      +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v13, &v21);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v21;

      v10 = v15;
      v9 = (void *)v14;
    }
  }
  while (v22 < v11);
  if (v10)
    goto LABEL_9;
LABEL_16:
  self = v20;
LABEL_17:
  -[HAPSupportedFirmwareUpdateConfiguration setUpdateDuration:](self, "setUpdateDuration:", v9, v20);
  v10 = 0;
  v17 = 1;
LABEL_19:

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
  uint64_t v11;
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
  -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
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

    if ((_DWORD)v11)
    {
      if (a3)
      {
        HMErrorFromOSStatus(v11);
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
  HAPSupportedFirmwareUpdateConfiguration *v4;
  void *v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;

  v4 = +[HAPSupportedFirmwareUpdateConfiguration allocWithZone:](HAPSupportedFirmwareUpdateConfiguration, "allocWithZone:", a3);
  -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HAPSupportedFirmwareUpdateConfiguration initWithUpdateDuration:](v4, "initWithUpdateDuration:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAPSupportedFirmwareUpdateConfiguration *v4;
  HAPSupportedFirmwareUpdateConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HAPSupportedFirmwareUpdateConfiguration *)a3;
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
      -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPSupportedFirmwareUpdateConfiguration updateDuration](v5, "updateDuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPSupportedFirmwareUpdateConfiguration updateDuration](v5, "updateDuration");
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
  -[HAPSupportedFirmwareUpdateConfiguration updateDuration](self, "updateDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HAPSupportedFirmwareUpdateConfiguration updateDuration=%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HAPTLVUnsignedNumberValue)updateDuration
{
  return self->_updateDuration;
}

- (void)setUpdateDuration:(id)a3
{
  objc_storeStrong((id *)&self->_updateDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDuration, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPSupportedFirmwareUpdateConfiguration *v6;
  HAPSupportedFirmwareUpdateConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPSupportedFirmwareUpdateConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPSupportedFirmwareUpdateConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
