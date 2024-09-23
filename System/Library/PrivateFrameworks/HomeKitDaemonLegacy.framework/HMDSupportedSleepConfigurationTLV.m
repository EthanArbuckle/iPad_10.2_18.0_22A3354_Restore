@implementation HMDSupportedSleepConfigurationTLV

- (HMDSupportedSleepConfigurationTLV)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDSupportedSleepConfigurationTLV;
  return -[HMDSupportedSleepConfigurationTLV init](&v3, sel_init);
}

- (HMDSupportedSleepConfigurationTLV)initWithVersion:(id)a3 supportedWoLPacketConfigurations:(id)a4
{
  id v7;
  id v8;
  HMDSupportedSleepConfigurationTLV *v9;
  HMDSupportedSleepConfigurationTLV *v10;
  uint64_t v11;
  NSMutableArray *supportedWoLPacketConfigurations;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDSupportedSleepConfigurationTLV;
  v9 = -[HMDSupportedSleepConfigurationTLV init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_version, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    supportedWoLPacketConfigurations = v10->_supportedWoLPacketConfigurations;
    v10->_supportedWoLPacketConfigurations = (NSMutableArray *)v11;

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
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  id *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 < 1)
  {
    v11 = 0;
LABEL_23:
    -[HMDSupportedSleepConfigurationTLV setVersion:](self, "setVersion:", v11, v22);
    -[HMDSupportedSleepConfigurationTLV setSupportedWoLPacketConfigurations:](self, "setSupportedWoLPacketConfigurations:", v9);
    v10 = 0;
    v20 = 1;
    goto LABEL_25;
  }
  v22 = a4;
  v10 = 0;
  v11 = 0;
  v12 = v7 + v8;
  while (1)
  {
    v29 = 0;
    v27 = 0;
    v28 = 0;
    v26 = 0;
    if (TLV8GetNext())
      break;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v19;
LABEL_19:
      if (!v10)
        goto LABEL_23;
      v17 = v22;
      if (v22)
      {
        v18 = objc_retainAutorelease(v10);
        v10 = v18;
        goto LABEL_22;
      }
      goto LABEL_24;
    }
    if (v29 == 2)
    {
      v24 = v10;
      HAPTLVParseContiguousTlvs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v24;

      if (v15)
        goto LABEL_10;
      v23 = 0;
      +[HMDWakePacketConfigurationTLV parsedFromData:error:](HMDWakePacketConfigurationTLV, "parsedFromData:error:", v13, &v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;
      if (!v15)
        objc_msgSend(v9, "addObject:", v16);
LABEL_8:

LABEL_10:
      v10 = v15;
      goto LABEL_11;
    }
    if (v29 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v10;
      objc_msgSend(MEMORY[0x1E0D16610], "parsedFromData:error:", v13, &v25);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v25;

      v16 = v11;
      v11 = (void *)v14;
      goto LABEL_8;
    }
LABEL_11:
    if (v26 >= v12)
      goto LABEL_19;
  }
  v17 = v22;
  if (v22)
  {
    HMErrorFromOSStatus();
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v20 = 0;
    *v17 = v18;
    goto LABEL_25;
  }
LABEL_24:
  v20 = 0;
LABEL_25:

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
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
  -[HMDSupportedSleepConfigurationTLV version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDSupportedSleepConfigurationTLV version](self, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v6, "serializeWithError:", &v31);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v31;

    if (v8)
      goto LABEL_3;
    v7 = objc_retainAutorelease(v7);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    if (TLV8BufferAppend())
    {
LABEL_26:

      if (a3)
      {
        HMErrorFromOSStatus();
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_28;
      }
      v8 = 0;
LABEL_30:
      v23 = 0;
      goto LABEL_31;
    }

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](self, "supportedWoLPacketConfigurations");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v13 = 1;
    v25 = a3;
    while (1)
    {
      v14 = 0;
LABEL_10:
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
      if ((v13 & 1) == 0 && TLV8BufferAppend())
      {
LABEL_25:
        a3 = v25;
        goto LABEL_26;
      }
      v26 = 0;
      objc_msgSend(v15, "serializeWithError:", &v26, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v26;
      if (v17)
        break;
      v18 = v12;
      v19 = objc_retainAutorelease(v16);
      v20 = objc_msgSend(v19, "bytes");
      v21 = v20 + objc_msgSend(v19, "length");
      do
      {
        if ((uint64_t)(v21 - v20) >= 255)
          v22 = 255;
        else
          v22 = v21 - v20;
        if (TLV8BufferAppend())
        {

          goto LABEL_25;
        }
        v20 += v22;
      }
      while (v20 < v21);

      v13 = 0;
      ++v14;
      v12 = v18;
      if (v14 != v11)
        goto LABEL_10;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v13 = 0;
      if (!v11)
        goto LABEL_23;
    }
    v8 = v17;

    a3 = v25;
LABEL_3:

    if (a3)
    {
      v9 = objc_retainAutorelease(v8);
      v8 = v9;
LABEL_28:
      v23 = 0;
      *a3 = v9;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_23:

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_31:
  TLV8BufferFree();

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDSupportedSleepConfigurationTLV *v4;
  void *v5;
  void *v6;
  HMDSupportedSleepConfigurationTLV *v7;

  v4 = +[HMDSupportedSleepConfigurationTLV allocWithZone:](HMDSupportedSleepConfigurationTLV, "allocWithZone:", a3);
  -[HMDSupportedSleepConfigurationTLV version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](self, "supportedWoLPacketConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDSupportedSleepConfigurationTLV initWithVersion:supportedWoLPacketConfigurations:](v4, "initWithVersion:supportedWoLPacketConfigurations:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDSupportedSleepConfigurationTLV *v5;
  HMDSupportedSleepConfigurationTLV *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDSupportedSleepConfigurationTLV *)a3;
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
      -[HMDSupportedSleepConfigurationTLV version](self, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSupportedSleepConfigurationTLV version](v6, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDSupportedSleepConfigurationTLV version](self, "version");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSupportedSleepConfigurationTLV version](v6, "version");
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
      -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](self, "supportedWoLPacketConfigurations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](v6, "supportedWoLPacketConfigurations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](self, "supportedWoLPacketConfigurations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](v6, "supportedWoLPacketConfigurations");
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
  -[HMDSupportedSleepConfigurationTLV version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSupportedSleepConfigurationTLV supportedWoLPacketConfigurations](self, "supportedWoLPacketConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDSupportedSleepConfigurationTLV version=%@, supportedWoLPacketConfigurations=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HAPTLVUnsignedNumberValue)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSMutableArray)supportedWoLPacketConfigurations
{
  return self->_supportedWoLPacketConfigurations;
}

- (void)setSupportedWoLPacketConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_supportedWoLPacketConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedWoLPacketConfigurations, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDSupportedSleepConfigurationTLV *v6;
  HMDSupportedSleepConfigurationTLV *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDSupportedSleepConfigurationTLV);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDSupportedSleepConfigurationTLV parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
