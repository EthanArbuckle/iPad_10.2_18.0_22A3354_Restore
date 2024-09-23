@implementation HAPMatterFirmwareUpdateStatus

- (HAPMatterFirmwareUpdateStatus)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPMatterFirmwareUpdateStatus;
  return -[HAPMatterFirmwareUpdateStatus init](&v3, sel_init);
}

- (HAPMatterFirmwareUpdateStatus)initWithOTAProviderState:(id)a3 downloadedFirmwareVersionNumber:(id)a4 accessoryDownloadProgressPercent:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPMatterFirmwareUpdateStatus *v12;
  HAPMatterFirmwareUpdateStatus *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPMatterFirmwareUpdateStatus;
  v12 = -[HAPMatterFirmwareUpdateStatus init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_OTAProviderState, a3);
    objc_storeStrong((id *)&v13->_downloadedFirmwareVersionNumber, a4);
    objc_storeStrong((id *)&v13->_accessoryDownloadProgressPercent, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t Next;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  HAPMatterFirmwareUpdateStatus *v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 1)
  {
    v22 = self;
    v23 = a4;
    v24 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v31 = 0;
      v29 = 0;
      v30 = 0;
      v28 = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
      {
        if (v23)
        {
          HMErrorFromOSStatus(Next);
          v19 = 0;
          *v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        v6 = v24;
        goto LABEL_25;
      }
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v20 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v20;
        if (v20)
          goto LABEL_14;
        goto LABEL_20;
      }
      if (v31 == 3)
        break;
      if (v31 == 2)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v9;
        v16 = &v26;
        +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v26);
        v17 = v11;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (v31 == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v9;
        v16 = &v27;
        +[HAPOTAProviderStateWrapper parsedFromData:error:](HAPOTAProviderStateWrapper, "parsedFromData:error:", v15, &v27);
        v17 = v12;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v18 = *v16;

        v9 = v18;
      }
      if (v28 >= v13)
      {
        if (v9)
        {
LABEL_14:
          v6 = v24;
          if (v23)
          {
            v9 = objc_retainAutorelease(v9);
            v19 = 0;
            *v23 = v9;
          }
          else
          {
            v19 = 0;
          }
          goto LABEL_25;
        }
LABEL_20:
        v6 = v24;
        self = v22;
        goto LABEL_21;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    v16 = &v25;
    +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v25);
    v17 = v10;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
LABEL_21:
  -[HAPMatterFirmwareUpdateStatus setOTAProviderState:](self, "setOTAProviderState:", v12, v22);
  -[HAPMatterFirmwareUpdateStatus setDownloadedFirmwareVersionNumber:](self, "setDownloadedFirmwareVersionNumber:", v11);
  -[HAPMatterFirmwareUpdateStatus setAccessoryDownloadProgressPercent:](self, "setAccessoryDownloadProgressPercent:", v10);
  v9 = 0;
  v19 = 1;
LABEL_25:

  return v19;
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
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v20;
  id v21;
  id v22;
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
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
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
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  TLV8BufferInit();
  -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "serializeWithError:", &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
    {
LABEL_8:
      v13 = v10;

      goto LABEL_9;
    }

  }
  -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "serializeWithError:", &v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;

    if (v8)
      goto LABEL_15;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_8;

  }
  -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_20;
  -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v16, "serializeWithError:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (v8)
  {
LABEL_15:

    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v8 = v14;
      goto LABEL_17;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_21;
  }
  v18 = objc_retainAutorelease(v7);
  objc_msgSend(v18, "bytes");
  objc_msgSend(v18, "length");
  v13 = TLV8BufferAppend();

  if (!(_DWORD)v13)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_21;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_18;
  }
  HMErrorFromOSStatus(v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_17:
  v17 = 0;
  *a3 = v14;
LABEL_21:
  TLV8BufferFree();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPMatterFirmwareUpdateStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPMatterFirmwareUpdateStatus *v8;

  v4 = +[HAPMatterFirmwareUpdateStatus allocWithZone:](HAPMatterFirmwareUpdateStatus, "allocWithZone:", a3);
  -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPMatterFirmwareUpdateStatus initWithOTAProviderState:downloadedFirmwareVersionNumber:accessoryDownloadProgressPercent:](v4, "initWithOTAProviderState:downloadedFirmwareVersionNumber:accessoryDownloadProgressPercent:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPMatterFirmwareUpdateStatus *v6;
  HAPMatterFirmwareUpdateStatus *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (HAPMatterFirmwareUpdateStatus *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterFirmwareUpdateStatus OTAProviderState](v7, "OTAProviderState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterFirmwareUpdateStatus OTAProviderState](v7, "OTAProviderState");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](v7, "downloadedFirmwareVersionNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](v7, "downloadedFirmwareVersionNumber");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](v7, "accessoryDownloadProgressPercent");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](v7, "accessoryDownloadProgressPercent");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPMatterFirmwareUpdateStatus OTAProviderState](self, "OTAProviderState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterFirmwareUpdateStatus downloadedFirmwareVersionNumber](self, "downloadedFirmwareVersionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMatterFirmwareUpdateStatus accessoryDownloadProgressPercent](self, "accessoryDownloadProgressPercent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPMatterFirmwareUpdateStatus OTAProviderState=%@, downloadedFirmwareVersionNumber=%@, accessoryDownloadProgressPercent=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPOTAProviderStateWrapper)OTAProviderState
{
  return self->_OTAProviderState;
}

- (void)setOTAProviderState:(id)a3
{
  objc_storeStrong((id *)&self->_OTAProviderState, a3);
}

- (HAPTLVUnsignedNumberValue)downloadedFirmwareVersionNumber
{
  return self->_downloadedFirmwareVersionNumber;
}

- (void)setDownloadedFirmwareVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedFirmwareVersionNumber, a3);
}

- (HAPTLVUnsignedNumberValue)accessoryDownloadProgressPercent
{
  return self->_accessoryDownloadProgressPercent;
}

- (void)setAccessoryDownloadProgressPercent:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryDownloadProgressPercent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryDownloadProgressPercent, 0);
  objc_storeStrong((id *)&self->_downloadedFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_OTAProviderState, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPMatterFirmwareUpdateStatus *v6;
  HAPMatterFirmwareUpdateStatus *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPMatterFirmwareUpdateStatus);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPMatterFirmwareUpdateStatus parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
