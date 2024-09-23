@implementation HMDWakeConfigurationParameters

- (HMDWakeConfigurationParameters)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDWakeConfigurationParameters;
  return -[HMDWakeConfigurationParameters init](&v3, sel_init);
}

- (HMDWakeConfigurationParameters)initWithDelimiter:(id)a3 primaryIdentifier:(id)a4 secondaryIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDWakeConfigurationParameters *v12;
  HMDWakeConfigurationParameters *v13;
  uint64_t v14;
  NSMutableArray *secondaryIdentifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDWakeConfigurationParameters;
  v12 = -[HMDWakeConfigurationParameters init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delimiter, a3);
    objc_storeStrong((id *)&v13->_primaryIdentifier, a4);
    v14 = objc_msgSend(v11, "mutableCopy");
    secondaryIdentifier = v13->_secondaryIdentifier;
    v13->_secondaryIdentifier = (NSMutableArray *)v14;

  }
  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  void *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 < 1)
  {
    v11 = 0;
    v12 = 0;
LABEL_27:
    -[HMDWakeConfigurationParameters setDelimiter:](self, "setDelimiter:", v12, v24);
    -[HMDWakeConfigurationParameters setPrimaryIdentifier:](self, "setPrimaryIdentifier:", v11);
    -[HMDWakeConfigurationParameters setSecondaryIdentifier:](self, "setSecondaryIdentifier:", v9);
    v10 = 0;
    v21 = 1;
    goto LABEL_30;
  }
  v24 = (void *)v8;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v6 + v7;
  while (1)
  {
    v35 = 0;
    v33 = 0;
    v34 = 0;
    v32 = 0;
    if (TLV8GetNext())
      break;
    if (!v34)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v22;
      if (!v22)
        goto LABEL_26;
LABEL_19:
      v19 = a4;
      if (a4)
      {
        v20 = objc_retainAutorelease(v10);
        v10 = v20;
LABEL_24:
        v21 = 0;
        *v19 = v20;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    switch(v35)
    {
      case 2:
        v27 = v10;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v27;

        if (!v15)
        {
          v26 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v26;
          if (!v15)
            objc_msgSend(v24, "addObject:", v17);
LABEL_15:

        }
LABEL_16:

        v10 = v15;
        break;
      case 1:
        v29 = v10;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v29;

        if (!v15)
        {
          v28 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v28);
          v18 = objc_claimAutoreleasedReturnValue();
          v15 = v28;
          v17 = v11;
          v11 = (void *)v18;
          goto LABEL_15;
        }
        goto LABEL_16;
      case 0:
        v31 = v10;
        HAPTLVParseContiguousTlvs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v31;

        if (!v15)
        {
          v30 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v30);
          v16 = objc_claimAutoreleasedReturnValue();
          v15 = v30;
          v17 = v12;
          v12 = (void *)v16;
          goto LABEL_15;
        }
        goto LABEL_16;
    }
    if (v32 >= v13)
    {
      if (v10)
        goto LABEL_19;
LABEL_26:
      v9 = v24;
      goto LABEL_27;
    }
  }
  v19 = a4;
  if (a4)
  {
    HMErrorFromOSStatus();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_28:
  v21 = 0;
LABEL_29:
  v9 = v24;
LABEL_30:

  return v21;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  _BYTE v38[128];
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
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
  v39 = 0u;
  TLV8BufferInit();
  -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v6, "serializeWithError:", &v37);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v37;

    if (!v8)
    {
      v7 = objc_retainAutorelease(v7);
      v9 = objc_msgSend(v7, "bytes");
      v10 = v9 + objc_msgSend(v7, "length");
      while (1)
      {
        v11 = (uint64_t)(v10 - v9) >= 255 ? 255 : v10 - v9;
        if (TLV8BufferAppend())
          goto LABEL_40;
        v9 += v11;
        if (v9 >= v10)
        {

          goto LABEL_10;
        }
      }
    }
LABEL_12:

    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v8 = v14;
LABEL_42:
      v28 = 0;
      *a3 = v14;
      goto LABEL_45;
    }
LABEL_44:
    v28 = 0;
    goto LABEL_45;
  }
LABEL_10:
  -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v13, "serializeWithError:", &v36);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    if (v8)
      goto LABEL_12;
    v7 = objc_retainAutorelease(v7);
    v15 = objc_msgSend(v7, "bytes");
    v16 = v15 + objc_msgSend(v7, "length");
    while (1)
    {
      v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
      if (TLV8BufferAppend())
        break;
      v15 += v17;
      if (v15 >= v16)
      {

        goto LABEL_21;
      }
    }
LABEL_40:

    if (a3)
    {
      HMErrorFromOSStatus();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_42;
    }
    v8 = 0;
    goto LABEL_44;
  }
LABEL_21:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMDWakeConfigurationParameters secondaryIdentifier](self, "secondaryIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v30)
  {
    v18 = *(_QWORD *)v33;
    v19 = 1;
    do
    {
      v20 = 0;
      while (2)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v7);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
        if ((v19 & 1) == 0)
        {
          if (TLV8BufferAppend())
            goto LABEL_40;
        }
        v31 = 0;
        objc_msgSend(v21, "serializeWithError:", &v31, v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v31;
        if (v23)
        {
          v8 = v23;

          goto LABEL_12;
        }
        v24 = objc_retainAutorelease(v22);
        v25 = objc_msgSend(v24, "bytes");
        v26 = v25 + objc_msgSend(v24, "length");
        do
        {
          if ((uint64_t)(v26 - v25) >= 255)
            v27 = 255;
          else
            v27 = v26 - v25;
          if (TLV8BufferAppend())
          {

            goto LABEL_40;
          }
          v25 += v27;
        }
        while (v25 < v26);

        v19 = 0;
        if (++v20 != v30)
          continue;
        break;
      }
      v19 = 0;
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_45:
  TLV8BufferFree();

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDWakeConfigurationParameters *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDWakeConfigurationParameters *v8;

  v4 = +[HMDWakeConfigurationParameters allocWithZone:](HMDWakeConfigurationParameters, "allocWithZone:", a3);
  -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfigurationParameters secondaryIdentifier](self, "secondaryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDWakeConfigurationParameters initWithDelimiter:primaryIdentifier:secondaryIdentifier:](v4, "initWithDelimiter:primaryIdentifier:secondaryIdentifier:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HMDWakeConfigurationParameters *v6;
  HMDWakeConfigurationParameters *v7;
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

  v6 = (HMDWakeConfigurationParameters *)a3;
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
      -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfigurationParameters delimiter](v7, "delimiter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfigurationParameters delimiter](v7, "delimiter");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfigurationParameters primaryIdentifier](v7, "primaryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfigurationParameters primaryIdentifier](v7, "primaryIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HMDWakeConfigurationParameters secondaryIdentifier](self, "secondaryIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakeConfigurationParameters secondaryIdentifier](v7, "secondaryIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HMDWakeConfigurationParameters secondaryIdentifier](self, "secondaryIdentifier");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakeConfigurationParameters secondaryIdentifier](v7, "secondaryIdentifier");
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
  -[HMDWakeConfigurationParameters delimiter](self, "delimiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfigurationParameters primaryIdentifier](self, "primaryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakeConfigurationParameters secondaryIdentifier](self, "secondaryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDWakeConfigurationParameters delimiter=%@, primaryIdentifier=%@, secondaryIdentifier=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSData)delimiter
{
  return self->_delimiter;
}

- (void)setDelimiter:(id)a3
{
  objc_storeStrong((id *)&self->_delimiter, a3);
}

- (NSData)primaryIdentifier
{
  return self->_primaryIdentifier;
}

- (void)setPrimaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryIdentifier, a3);
}

- (NSMutableArray)secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (void)setSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryIdentifier, 0);
  objc_storeStrong((id *)&self->_delimiter, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDWakeConfigurationParameters *v6;
  HMDWakeConfigurationParameters *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDWakeConfigurationParameters);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDWakeConfigurationParameters parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
