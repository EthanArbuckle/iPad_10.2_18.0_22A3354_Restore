@implementation HMDWakeConfiguration

- (HMDWakeConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDWakeConfiguration;
  return -[HMDWakeConfiguration init](&v3, sel_init);
}

- (HMDWakeConfiguration)initWithReserved:(id)a3 custom1:(id)a4 custom2:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDWakeConfiguration *v12;
  HMDWakeConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDWakeConfiguration;
  v12 = -[HMDWakeConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_reserved, a3);
    objc_storeStrong((id *)&v13->_custom1, a4);
    objc_storeStrong((id *)&v13->_custom2, a5);
  }

  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  BOOL v18;
  id *v19;
  id v20;
  uint64_t v21;
  id *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
LABEL_20:
    -[HMDWakeConfiguration setReserved:](self, "setReserved:", v12);
    -[HMDWakeConfiguration setCustom1:](self, "setCustom1:", v11);
    -[HMDWakeConfiguration setCustom2:](self, "setCustom2:", v10);
    v9 = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v23 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v7 + v8;
  while (1)
  {
    v33 = 0;
    v31 = 0;
    v32 = 0;
    v30 = 0;
    if (TLV8GetNext())
      break;
    if (!v32)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v21;
      if (!v21)
        goto LABEL_20;
LABEL_24:
      v19 = v23;
      if (v23)
      {
        v20 = objc_retainAutorelease(v9);
        v9 = v20;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v33)
    {
      case 2:
        v25 = v9;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v25;

        if (!v15)
        {
          v24 = 0;
          v16 = (id *)&v24;
          +[HMDWakeConfigurationParameters parsedFromData:error:](HMDWakeConfigurationParameters, "parsedFromData:error:", v14, &v24);
          v17 = v10;
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
LABEL_15:

        v9 = v15;
        break;
      case 1:
        v27 = v9;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v27;

        if (!v15)
        {
          v26 = 0;
          v16 = (id *)&v26;
          +[HMDWakeConfigurationParameters parsedFromData:error:](HMDWakeConfigurationParameters, "parsedFromData:error:", v14, &v26);
          v17 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v15 = *v16;

        }
        goto LABEL_15;
      case 0:
        v29 = v9;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v29;

        if (!v15)
        {
          v28 = 0;
          v16 = (id *)&v28;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v28);
          v17 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        goto LABEL_15;
    }
    if (v30 >= v13)
    {
      if (!v9)
        goto LABEL_20;
      goto LABEL_24;
    }
  }
  v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus();
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    v18 = 0;
    *v19 = v20;
    goto LABEL_28;
  }
LABEL_27:
  v18 = 0;
LABEL_28:

  return v18;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  id v31;
  id v32;
  id v33;
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
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
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
  v34 = 0u;
  TLV8BufferInit();
  -[HMDWakeConfiguration reserved](self, "reserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDWakeConfiguration reserved](self, "reserved");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v6, "serializeWithError:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v10 = objc_msgSend(v9, "bytes");
      v11 = v10 + objc_msgSend(v9, "length");
      while (1)
      {
        v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        if (TLV8BufferAppend())
          goto LABEL_23;
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
    }
  }
  else
  {
LABEL_10:
    -[HMDWakeConfiguration custom1](self, "custom1");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_19:
      -[HMDWakeConfiguration custom2](self, "custom2");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[HMDWakeConfiguration custom2](self, "custom2");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(v19, "serializeWithError:", &v31);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v31;

        if (v8)
          goto LABEL_21;
        v22 = objc_retainAutorelease(v7);
        v23 = objc_msgSend(v22, "bytes");
        v24 = v23 + objc_msgSend(v22, "length");
        do
        {
          if ((uint64_t)(v24 - v23) >= 255)
            v25 = 255;
          else
            v25 = v24 - v23;
          v26 = TLV8BufferAppend();
          if (v26)
            v27 = 0;
          else
            v27 = v25;
          v23 += v27;
          if (v26)
            v28 = 1;
          else
            v28 = v23 >= v24;
        }
        while (!v28);
        v29 = v26;

        if (v29)
          goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_43;
    }
    -[HMDWakeConfiguration custom1](self, "custom1");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v14, "serializeWithError:", &v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v32;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v15 = objc_msgSend(v9, "bytes");
      v16 = v15 + objc_msgSend(v9, "length");
      while (1)
      {
        v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        if (TLV8BufferAppend())
          break;
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_19;
        }
      }
LABEL_23:

LABEL_24:
      if (a3)
      {
        HMErrorFromOSStatus();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_26;
      }
      v8 = 0;
LABEL_28:
      v21 = 0;
      goto LABEL_43;
    }
  }
LABEL_21:

  if (!a3)
    goto LABEL_28;
  v20 = objc_retainAutorelease(v8);
  v8 = v20;
LABEL_26:
  v21 = 0;
  *a3 = v20;
LABEL_43:
  TLV8BufferFree();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDWakeConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDWakeConfiguration *v8;

  v4 = +[HMDWakeConfiguration allocWithZone:](HMDWakeConfiguration, "allocWithZone:", a3);
  -[HMDWakeConfiguration reserved](self, "reserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfiguration custom1](self, "custom1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfiguration custom2](self, "custom2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDWakeConfiguration initWithReserved:custom1:custom2:](v4, "initWithReserved:custom1:custom2:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HMDWakeConfiguration *v6;
  HMDWakeConfiguration *v7;
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

  v6 = (HMDWakeConfiguration *)a3;
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
      -[HMDWakeConfiguration reserved](self, "reserved");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfiguration reserved](v7, "reserved");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HMDWakeConfiguration reserved](self, "reserved");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfiguration reserved](v7, "reserved");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HMDWakeConfiguration custom1](self, "custom1");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfiguration custom1](v7, "custom1");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HMDWakeConfiguration custom1](self, "custom1");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfiguration custom1](v7, "custom1");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HMDWakeConfiguration custom2](self, "custom2");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfiguration custom2](v7, "custom2");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HMDWakeConfiguration custom2](self, "custom2");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfiguration custom2](v7, "custom2");
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDWakeConfiguration reserved](self, "reserved");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfiguration custom1](self, "custom1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfiguration custom2](self, "custom2");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDWakeConfiguration reserved=%@, custom1=%@, custom2=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSData)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  objc_storeStrong((id *)&self->_reserved, a3);
}

- (HMDWakeConfigurationParameters)custom1
{
  return self->_custom1;
}

- (void)setCustom1:(id)a3
{
  objc_storeStrong((id *)&self->_custom1, a3);
}

- (HMDWakeConfigurationParameters)custom2
{
  return self->_custom2;
}

- (void)setCustom2:(id)a3
{
  objc_storeStrong((id *)&self->_custom2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom2, 0);
  objc_storeStrong((id *)&self->_custom1, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDWakeConfiguration *v6;
  HMDWakeConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDWakeConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDWakeConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
