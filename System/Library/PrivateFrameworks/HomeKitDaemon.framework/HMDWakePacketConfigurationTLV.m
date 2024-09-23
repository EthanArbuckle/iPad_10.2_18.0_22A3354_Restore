@implementation HMDWakePacketConfigurationTLV

- (HMDWakePacketConfigurationTLV)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDWakePacketConfigurationTLV;
  return -[HMDWakePacketConfigurationTLV init](&v3, sel_init);
}

- (HMDWakePacketConfigurationTLV)initWithWakePacketType:(id)a3 wakeDestinationPort:(id)a4 wakeDestinationAddress:(id)a5 wakeType:(id)a6 wakePattern:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDWakePacketConfigurationTLV *v17;
  HMDWakePacketConfigurationTLV *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDWakePacketConfigurationTLV;
  v17 = -[HMDWakePacketConfigurationTLV init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_wakePacketType, a3);
    objc_storeStrong((id *)&v18->_wakeDestinationPort, a4);
    objc_storeStrong((id *)&v18->_wakeDestinationAddress, a5);
    objc_storeStrong((id *)&v18->_wakeType, a6);
    objc_storeStrong((id *)&v18->_wakePattern, a7);
  }

  return v18;
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
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  id *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v22 = 0;
    v10 = 0;
    v23 = 0;
    v11 = 0;
    v12 = 0;
LABEL_24:
    -[HMDWakePacketConfigurationTLV setWakePacketType:](self, "setWakePacketType:", v12);
    -[HMDWakePacketConfigurationTLV setWakeDestinationPort:](self, "setWakeDestinationPort:", v11);
    -[HMDWakePacketConfigurationTLV setWakeDestinationAddress:](self, "setWakeDestinationAddress:", v23);
    -[HMDWakePacketConfigurationTLV setWakeType:](self, "setWakeType:", v10);
    -[HMDWakePacketConfigurationTLV setWakePattern:](self, "setWakePattern:", v22);
    v9 = 0;
    v24 = 1;
  }
  else
  {
    v27 = a4;
    v9 = 0;
    v28 = 0;
    v29 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v40 = 0;
      v39 = 0;
      v37 = 0;
      v38 = 0;
      if (TLV8GetNext())
        break;
      if (!v39)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
        v25 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v25;
        if (v25)
          goto LABEL_17;
        goto LABEL_23;
      }
      switch(v40)
      {
        case 1:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v9;
          +[HMDSleepConfigurationWakePacketTypeWrapper parsedFromData:error:](HMDSleepConfigurationWakePacketTypeWrapper, "parsedFromData:error:", v14, &v36);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v36;

          v17 = v12;
          v12 = (void *)v15;
          break;
        case 2:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v9;
          objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v14, &v35);
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = v35;

          v17 = v11;
          v11 = (void *)v18;
          break;
        case 3:
          v34 = v9;
          HAPTLVParseContiguousTlvs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;

          if (v16)
            goto LABEL_14;
          v33 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v33);
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = v33;
          v17 = v29;
          v29 = (void *)v19;
          break;
        case 4:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v9;
          +[HMDSleepConfigurationWakeUpTypeWrapper parsedFromData:error:](HMDSleepConfigurationWakeUpTypeWrapper, "parsedFromData:error:", v14, &v32);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v32;

          v17 = v10;
          v10 = (void *)v20;
          break;
        case 5:
          v31 = v9;
          HAPTLVParseContiguousTlvs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v31;

          if (v16)
            goto LABEL_14;
          v30 = 0;
          objc_msgSend(MEMORY[0x24BDBCE50], "parsedFromData:error:", v14, &v30);
          v21 = objc_claimAutoreleasedReturnValue();
          v16 = v30;
          v17 = v28;
          v28 = (void *)v21;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      v9 = v16;
LABEL_15:
      if (v37 >= v13)
      {
        if (v9)
        {
LABEL_17:
          v22 = v28;
          v23 = v29;
          if (v27)
          {
            v9 = objc_retainAutorelease(v9);
            v24 = 0;
            *v27 = v9;
          }
          else
          {
            v24 = 0;
          }
          goto LABEL_28;
        }
LABEL_23:
        v22 = v28;
        v23 = v29;
        goto LABEL_24;
      }
    }
    if (v27)
    {
      HMErrorFromOSStatus();
      v24 = 0;
      *v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v22 = v28;
    v23 = v29;
  }
LABEL_28:

  return v24;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
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
  v43 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  TLV8BufferInit();
  -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v6, "serializeWithError:", &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    if (v8)
      goto LABEL_28;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
    {
LABEL_8:

      goto LABEL_9;
    }

  }
  -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v11, "serializeWithError:", &v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v35;

    if (v8)
      goto LABEL_28;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_8;

  }
  -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v14, "serializeWithError:", &v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v34;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v15 = objc_msgSend(v9, "bytes");
      v16 = v15 + objc_msgSend(v9, "length");
      while (1)
      {
        v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        if (TLV8BufferAppend())
          goto LABEL_8;
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_22;
        }
      }
    }
LABEL_28:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_30;
    }
LABEL_31:
    v22 = 0;
    goto LABEL_32;
  }
LABEL_22:
  -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v19, "serializeWithError:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;

    if (v8)
      goto LABEL_28;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_8;

  }
  -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_46;
  -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v21, "serializeWithError:", &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;

  if (v8)
    goto LABEL_28;
  v24 = objc_retainAutorelease(v7);
  v25 = objc_msgSend(v24, "bytes");
  v26 = v25 + objc_msgSend(v24, "length");
  do
  {
    if ((uint64_t)(v26 - v25) >= 255)
      v27 = 255;
    else
      v27 = v26 - v25;
    v28 = TLV8BufferAppend();
    if (v28)
      v29 = 0;
    else
      v29 = v27;
    v25 += v29;
    if (v28)
      v30 = 1;
    else
      v30 = v25 >= v26;
  }
  while (!v30);
  v31 = v28;

  if (!v31)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_32;
  }
LABEL_9:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_31;
  }
  HMErrorFromOSStatus();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_30:
  v22 = 0;
  *a3 = v12;
LABEL_32:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDWakePacketConfigurationTLV *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDWakePacketConfigurationTLV *v10;

  v4 = +[HMDWakePacketConfigurationTLV allocWithZone:](HMDWakePacketConfigurationTLV, "allocWithZone:", a3);
  -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDWakePacketConfigurationTLV initWithWakePacketType:wakeDestinationPort:wakeDestinationAddress:wakeType:wakePattern:](v4, "initWithWakePacketType:wakeDestinationPort:wakeDestinationAddress:wakeType:wakePattern:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDWakePacketConfigurationTLV *v5;
  HMDWakePacketConfigurationTLV *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (HMDWakePacketConfigurationTLV *)a3;
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
      -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakePacketConfigurationTLV wakePacketType](v6, "wakePacketType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakePacketConfigurationTLV wakePacketType](v6, "wakePacketType");
        v39 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakePacketConfigurationTLV wakeDestinationPort](v6, "wakeDestinationPort");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakePacketConfigurationTLV wakeDestinationPort](v6, "wakeDestinationPort");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HMDWakePacketConfigurationTLV wakeDestinationAddress](v6, "wakeDestinationAddress");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      if (v13 != v36)
      {
        -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakePacketConfigurationTLV wakeDestinationAddress](v6, "wakeDestinationAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakePacketConfigurationTLV wakeType](v6, "wakeType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakePacketConfigurationTLV wakeType](v6, "wakeType");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDWakePacketConfigurationTLV wakePattern](v6, "wakePattern");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

        v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
        v27 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDWakePacketConfigurationTLV wakePattern](v6, "wakePattern");
        v28 = v11;
        v24 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v23, "isEqual:", v25);

        v18 = v24;
        v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    v10 = 0;
  }
LABEL_31:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDWakePacketConfigurationTLV wakePacketType](self, "wakePacketType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeDestinationPort](self, "wakeDestinationPort");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeDestinationAddress](self, "wakeDestinationAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakeType](self, "wakeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWakePacketConfigurationTLV wakePattern](self, "wakePattern");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDWakePacketConfigurationTLV wakePacketType=%@, wakeDestinationPort=%@, wakeDestinationAddress=%@, wakeType=%@, wakePattern=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HMDSleepConfigurationWakePacketTypeWrapper)wakePacketType
{
  return self->_wakePacketType;
}

- (void)setWakePacketType:(id)a3
{
  objc_storeStrong((id *)&self->_wakePacketType, a3);
}

- (HAPTLVUnsignedNumberValue)wakeDestinationPort
{
  return self->_wakeDestinationPort;
}

- (void)setWakeDestinationPort:(id)a3
{
  objc_storeStrong((id *)&self->_wakeDestinationPort, a3);
}

- (NSData)wakeDestinationAddress
{
  return self->_wakeDestinationAddress;
}

- (void)setWakeDestinationAddress:(id)a3
{
  objc_storeStrong((id *)&self->_wakeDestinationAddress, a3);
}

- (HMDSleepConfigurationWakeUpTypeWrapper)wakeType
{
  return self->_wakeType;
}

- (void)setWakeType:(id)a3
{
  objc_storeStrong((id *)&self->_wakeType, a3);
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void)setWakePattern:(id)a3
{
  objc_storeStrong((id *)&self->_wakePattern, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeType, 0);
  objc_storeStrong((id *)&self->_wakeDestinationAddress, 0);
  objc_storeStrong((id *)&self->_wakeDestinationPort, 0);
  objc_storeStrong((id *)&self->_wakePacketType, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDWakePacketConfigurationTLV *v6;
  HMDWakePacketConfigurationTLV *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDWakePacketConfigurationTLV);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDWakePacketConfigurationTLV parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
