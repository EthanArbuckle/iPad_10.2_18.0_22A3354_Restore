@implementation HMDNetworkRouterClientStatus

- (HMDNetworkRouterClientStatus)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientStatus;
  return -[HMDNetworkRouterClientStatus init](&v3, sel_init);
}

- (HMDNetworkRouterClientStatus)initWithClientIdentifier:(id)a3 macAddress:(id)a4 ipAddressList:(id)a5 lanIdentifier:(id)a6 name:(id)a7 rssi:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDNetworkRouterClientStatus *v18;
  HMDNetworkRouterClientStatus *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterClientStatus;
  v18 = -[HMDNetworkRouterClientStatus init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientIdentifier, a3);
    objc_storeStrong((id *)&v19->_macAddress, a4);
    objc_storeStrong((id *)&v19->_ipAddressList, a5);
    objc_storeStrong((id *)&v19->_lanIdentifier, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    objc_storeStrong((id *)&v19->_rssi, a8);
  }

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v25 = v7;
    v26 = 0;
    v10 = 0;
    v28 = 0;
    v29 = 0;
    v11 = 0;
    v12 = 0;
    v27 = 0;
    v13 = v8 + v9;
    while (1)
    {
      v40 = 0;
      v39 = 0;
      v37 = 0;
      v38 = 0;
      v36 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        v19 = (void *)v29;
        if (a4)
        {
          HMErrorFromOSStatus();
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        goto LABEL_31;
      }
      if (!v39)
        break;
      switch(v40)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v10;
          v15 = &v35;
          objc_msgSend(MEMORY[0x1E0D16610], "parsedFromData:error:", v14, &v35);
          v16 = (void *)v29;
          v29 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v10;
          v15 = &v34;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v34);
          v16 = (void *)v28;
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v10;
          v15 = &v33;
          +[HMDNetworkRouterIPAddressList parsedFromData:error:](HMDNetworkRouterIPAddressList, "parsedFromData:error:", v14, &v33);
          v16 = (void *)v27;
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 5:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v10;
          v15 = &v32;
          objc_msgSend(MEMORY[0x1E0D16610], "parsedFromData:error:", v14, &v32);
          v16 = (void *)v26;
          v26 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 6:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v10;
          v15 = &v31;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v14, &v31);
          v16 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 7:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v10;
          v15 = &v30;
          objc_msgSend(MEMORY[0x1E0D16608], "parsedFromData:error:", v14, &v30);
          v16 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v17 = *v15;

          v10 = v17;
          break;
        default:
          break;
      }
      if (v38)
        free(v38);
      if (v36 == v13)
      {
        if (v10)
          goto LABEL_20;
LABEL_26:
        v20 = (void *)v26;
        v22 = (void *)v28;
        v19 = (void *)v29;
        v21 = (void *)v27;
        goto LABEL_27;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v23;
    if (!v23)
      goto LABEL_26;
LABEL_20:
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v18 = 0;
      *a4 = v10;
    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)v29;
LABEL_31:
    v21 = (void *)v27;
    v22 = (void *)v28;
    v20 = (void *)v26;
  }
  else
  {
    v19 = 0;
    v11 = 0;
    v12 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
LABEL_27:
    -[HMDNetworkRouterClientStatus setClientIdentifier:](self, "setClientIdentifier:", v19, v25);
    -[HMDNetworkRouterClientStatus setMacAddress:](self, "setMacAddress:", v22);
    -[HMDNetworkRouterClientStatus setIpAddressList:](self, "setIpAddressList:", v21);
    -[HMDNetworkRouterClientStatus setLanIdentifier:](self, "setLanIdentifier:", v20);
    -[HMDNetworkRouterClientStatus setName:](self, "setName:", v12);
    -[HMDNetworkRouterClientStatus setRssi:](self, "setRssi:", v11);
    v10 = 0;
    v18 = 1;
  }

  return v18;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
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
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
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
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v6, "serializeWithError:", &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v11, "serializeWithError:", &v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v29;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v13, "serializeWithError:", &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_17;
  -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v15, "serializeWithError:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v8)
    goto LABEL_27;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (TLV8BufferAppend())
  {
LABEL_20:

    goto LABEL_21;
  }

LABEL_17:
  -[HMDNetworkRouterClientStatus name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMDNetworkRouterClientStatus name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v17, "serializeWithError:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterClientStatus rssi](self, "rssi");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_33;
  -[HMDNetworkRouterClientStatus rssi](self, "rssi");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v20, "serializeWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
  {
LABEL_27:

    if (a3)
    {
      v18 = objc_retainAutorelease(v8);
      v8 = v18;
      goto LABEL_29;
    }
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v23 = objc_retainAutorelease(v7);
  objc_msgSend(v23, "bytes");
  objc_msgSend(v23, "length");
  v24 = TLV8BufferAppend();

  if (!v24)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_31;
  }
LABEL_21:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_30;
  }
  HMErrorFromOSStatus();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_29:
  v21 = 0;
  *a3 = v18;
LABEL_31:
  TLV8BufferFree();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterClientStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterClientStatus *v11;

  v4 = +[HMDNetworkRouterClientStatus allocWithZone:](HMDNetworkRouterClientStatus, "allocWithZone:", a3);
  -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus rssi](self, "rssi");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDNetworkRouterClientStatus initWithClientIdentifier:macAddress:ipAddressList:lanIdentifier:name:rssi:](v4, "initWithClientIdentifier:macAddress:ipAddressList:lanIdentifier:name:rssi:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterClientStatus *v5;
  HMDNetworkRouterClientStatus *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v5 = (HMDNetworkRouterClientStatus *)a3;
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
      -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus clientIdentifier](v6, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus clientIdentifier](v6, "clientIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_36;
        }
      }
      -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus macAddress](v6, "macAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus macAddress](v6, "macAddress");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v10 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus ipAddressList](v6, "ipAddressList");
      v14 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v13;
      v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus ipAddressList](v6, "ipAddressList");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v10 = 0;
          v18 = v46;
LABEL_32:

LABEL_33:
          if (v11 == v12)
            goto LABEL_35;
          goto LABEL_34;
        }
      }
      -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus lanIdentifier](v6, "lanIdentifier");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus lanIdentifier](v6, "lanIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v10 = 0;
          v24 = (void *)v44;
          v3 = v20;
LABEL_30:

LABEL_31:
          v16 = v43;
          v18 = v46;
          if (v46 == v43)
            goto LABEL_33;
          goto LABEL_32;
        }
        v37 = v12;
        v3 = v20;
      }
      -[HMDNetworkRouterClientStatus name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus name](v6, "name");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        -[HMDNetworkRouterClientStatus name](self, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus name](v6, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v10 = 0;
          v12 = v37;
          v30 = (void *)v38;
          goto LABEL_28;
        }
        v33 = v3;
        v34 = v11;
      }
      -[HMDNetworkRouterClientStatus rssi](self, "rssi");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientStatus rssi](v6, "rssi");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[HMDNetworkRouterClientStatus rssi](self, "rssi");
        v32 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientStatus rssi](v6, "rssi");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v28, "isEqual:", v29);

        v22 = v32;
      }
      v12 = v37;
      v30 = (void *)v38;
      v3 = v33;
      v11 = v34;
      if (v22 == (void *)v38)
      {
LABEL_29:

        v24 = (void *)v44;
        if (v45 == (void *)v44)
          goto LABEL_31;
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v10 = 0;
  }
LABEL_38:

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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDNetworkRouterClientStatus clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus macAddress](self, "macAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus ipAddressList](self, "ipAddressList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus lanIdentifier](self, "lanIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientStatus rssi](self, "rssi");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterClientStatus clientIdentifier=%@, macAddress=%@, ipAddressList=%@, lanIdentifier=%@, name=%@, rssi=%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (HAPTLVUnsignedNumberValue)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_storeStrong((id *)&self->_macAddress, a3);
}

- (HMDNetworkRouterIPAddressList)ipAddressList
{
  return self->_ipAddressList;
}

- (void)setIpAddressList:(id)a3
{
  objc_storeStrong((id *)&self->_ipAddressList, a3);
}

- (HAPTLVUnsignedNumberValue)lanIdentifier
{
  return self->_lanIdentifier;
}

- (void)setLanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lanIdentifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (HAPTLVSignedNumberValue)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_storeStrong((id *)&self->_rssi, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lanIdentifier, 0);
  objc_storeStrong((id *)&self->_ipAddressList, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterClientStatus *v6;
  HMDNetworkRouterClientStatus *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterClientStatus);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterClientStatus parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
