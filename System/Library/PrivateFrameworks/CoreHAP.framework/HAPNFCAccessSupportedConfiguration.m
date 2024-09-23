@implementation HAPNFCAccessSupportedConfiguration

- (HAPNFCAccessSupportedConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessSupportedConfiguration;
  return -[HAPNFCAccessSupportedConfiguration init](&v3, sel_init);
}

- (HAPNFCAccessSupportedConfiguration)initWithMaximumNumberOfIssuerKeys:(id)a3 maximumNumberOfSuspendedDeviceCredentialKeys:(id)a4
{
  id v7;
  id v8;
  HAPNFCAccessSupportedConfiguration *v9;
  HAPNFCAccessSupportedConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPNFCAccessSupportedConfiguration;
  v9 = -[HAPNFCAccessSupportedConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_maximumNumberOfIssuerKeys, a3);
    objc_storeStrong((id *)&v10->_maximumNumberOfSuspendedDeviceCredentialKeys, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  id *v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 1)
  {
    v21 = a4;
    v22 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = v7 + v8;
    while (1)
    {
      v28 = 0;
      v26 = 0;
      v27 = 0;
      v25 = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
      {
        if (v21)
        {
          HMErrorFromOSStatus(Next);
          v18 = 0;
          *v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v6 = v22;
        goto LABEL_23;
      }
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v19 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v19;
        if (v19)
          goto LABEL_12;
        goto LABEL_18;
      }
      if (v28 == 2)
        break;
      if (v28 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v11;
        v15 = &v24;
        +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v24);
        v16 = v10;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v17 = *v15;

        v11 = v17;
      }
      if (v25 >= v12)
      {
        if (v11)
        {
LABEL_12:
          v6 = v22;
          if (v21)
          {
            v11 = objc_retainAutorelease(v11);
            v18 = 0;
            *v21 = v11;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_23;
        }
LABEL_18:
        v6 = v22;
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v11;
    v15 = &v23;
    +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v23);
    v16 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = 0;
  v10 = 0;
LABEL_19:
  -[HAPNFCAccessSupportedConfiguration setMaximumNumberOfIssuerKeys:](self, "setMaximumNumberOfIssuerKeys:", v10, v21);
  -[HAPNFCAccessSupportedConfiguration setMaximumNumberOfSuspendedDeviceCredentialKeys:](self, "setMaximumNumberOfSuspendedDeviceCredentialKeys:", v9);
  v11 = 0;
  v18 = 1;
LABEL_23:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  TLV8BufferInit();
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "serializeWithError:", &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v8)
      goto LABEL_6;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_11;
      }
      v8 = 0;
LABEL_14:
      v15 = 0;
      goto LABEL_15;
    }
  }
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v12, "serializeWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (!v8)
  {
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_6:

  if (!a3)
    goto LABEL_14;
  v13 = objc_retainAutorelease(v8);
  v8 = v13;
LABEL_11:
  v15 = 0;
  *a3 = v13;
LABEL_15:
  TLV8BufferFree();

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPNFCAccessSupportedConfiguration *v4;
  void *v5;
  void *v6;
  HAPNFCAccessSupportedConfiguration *v7;

  v4 = +[HAPNFCAccessSupportedConfiguration allocWithZone:](HAPNFCAccessSupportedConfiguration, "allocWithZone:", a3);
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPNFCAccessSupportedConfiguration initWithMaximumNumberOfIssuerKeys:maximumNumberOfSuspendedDeviceCredentialKeys:](v4, "initWithMaximumNumberOfIssuerKeys:maximumNumberOfSuspendedDeviceCredentialKeys:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPNFCAccessSupportedConfiguration *v5;
  HAPNFCAccessSupportedConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HAPNFCAccessSupportedConfiguration *)a3;
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
      -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](v6, "maximumNumberOfIssuerKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](v6, "maximumNumberOfIssuerKeys");
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
      -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](v6, "maximumNumberOfSuspendedDeviceCredentialKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](v6, "maximumNumberOfSuspendedDeviceCredentialKeys");
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
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys](self, "maximumNumberOfIssuerKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessSupportedConfiguration maximumNumberOfSuspendedDeviceCredentialKeys](self, "maximumNumberOfSuspendedDeviceCredentialKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPNFCAccessSupportedConfiguration maximumNumberOfIssuerKeys=%@, maximumNumberOfSuspendedDeviceCredentialKeys=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HAPTLVUnsignedNumberValue)maximumNumberOfIssuerKeys
{
  return self->_maximumNumberOfIssuerKeys;
}

- (void)setMaximumNumberOfIssuerKeys:(id)a3
{
  objc_storeStrong((id *)&self->_maximumNumberOfIssuerKeys, a3);
}

- (HAPTLVUnsignedNumberValue)maximumNumberOfSuspendedDeviceCredentialKeys
{
  return self->_maximumNumberOfSuspendedDeviceCredentialKeys;
}

- (void)setMaximumNumberOfSuspendedDeviceCredentialKeys:(id)a3
{
  objc_storeStrong((id *)&self->_maximumNumberOfSuspendedDeviceCredentialKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumNumberOfSuspendedDeviceCredentialKeys, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfIssuerKeys, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPNFCAccessSupportedConfiguration *v6;
  HAPNFCAccessSupportedConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPNFCAccessSupportedConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPNFCAccessSupportedConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
