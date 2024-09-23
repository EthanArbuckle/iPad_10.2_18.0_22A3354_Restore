@implementation HAPWiFiConfigurationControl

- (HAPWiFiConfigurationControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPWiFiConfigurationControl;
  return -[HAPWiFiConfigurationControl init](&v3, sel_init);
}

- (HAPWiFiConfigurationControl)initWithOperationType:(id)a3 cookie:(id)a4 updateStatus:(id)a5 operationTimeout:(id)a6 countryCodeConfiguration:(id)a7 stationConfiguration:(id)a8
{
  id v15;
  id v16;
  id v17;
  HAPWiFiConfigurationControl *v18;
  HAPWiFiConfigurationControl *v19;
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
  v24.super_class = (Class)HAPWiFiConfigurationControl;
  v18 = -[HAPWiFiConfigurationControl init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationType, a3);
    objc_storeStrong((id *)&v19->_cookie, a4);
    objc_storeStrong((id *)&v19->_updateStatus, a5);
    objc_storeStrong((id *)&v19->_operationTimeout, a6);
    objc_storeStrong((id *)&v19->_countryCodeConfiguration, a7);
    objc_storeStrong((id *)&v19->_stationConfiguration, a8);
  }

  return v19;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41[2];
  uint64_t v42;
  char v43;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v7 < 1)
  {
    v23 = 0;
    v25 = 0;
    v24 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
LABEL_25:
    -[HAPWiFiConfigurationControl setOperationType:](self, "setOperationType:", v23);
    -[HAPWiFiConfigurationControl setCookie:](self, "setCookie:", v11);
    -[HAPWiFiConfigurationControl setUpdateStatus:](self, "setUpdateStatus:", v10);
    -[HAPWiFiConfigurationControl setOperationTimeout:](self, "setOperationTimeout:", v9);
    -[HAPWiFiConfigurationControl setCountryCodeConfiguration:](self, "setCountryCodeConfiguration:", v24);
    -[HAPWiFiConfigurationControl setStationConfiguration:](self, "setStationConfiguration:", v25);
    v8 = 0;
    v26 = 1;
  }
  else
  {
    v8 = 0;
    v31 = 0;
    v32 = 0;
    v30 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = v6 + v7;
    while (1)
    {
      v43 = 0;
      v41[1] = 0;
      v42 = 0;
      v41[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v42)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v27 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v27;
        if (v27)
          goto LABEL_18;
        goto LABEL_24;
      }
      switch(v43)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v8;
          +[HAPWiFiConfigurationOperationTypeWrapper parsedFromData:error:](HAPWiFiConfigurationOperationTypeWrapper, "parsedFromData:error:", v14, &v40);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v40;

          v17 = v32;
          v32 = (void *)v15;
          break;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v39);
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = v39;

          v17 = v11;
          v11 = (void *)v18;
          break;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v8;
          +[HAPWiFiConfigurationUpdateStatusWrapper parsedFromData:error:](HAPWiFiConfigurationUpdateStatusWrapper, "parsedFromData:error:", v14, &v38);
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = v38;

          v17 = v10;
          v10 = (void *)v19;
          break;
        case 4:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v37);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v37;

          v17 = v9;
          v9 = (void *)v20;
          break;
        case 10:
          v36 = v8;
          HAPTLVParseContiguousTlvs(10, v6, v12, v41, &v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v36;

          if (v16)
            goto LABEL_15;
          v35 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v14, &v35);
          v21 = objc_claimAutoreleasedReturnValue();
          v16 = v35;
          v17 = v31;
          v31 = (void *)v21;
          break;
        case 11:
          v34 = v8;
          HAPTLVParseContiguousTlvs(11, v6, v12, v41, &v34);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v34;

          if (v16)
            goto LABEL_15;
          v33 = 0;
          +[HAPWiFiStationConfiguration parsedFromData:error:](HAPWiFiStationConfiguration, "parsedFromData:error:", v14, &v33);
          v22 = objc_claimAutoreleasedReturnValue();
          v16 = v33;
          v17 = v30;
          v30 = (void *)v22;
          break;
        default:
          goto LABEL_16;
      }

LABEL_15:
      v8 = v16;
LABEL_16:
      v6 = v41[0];
      if (v41[0] >= v12)
      {
        if (v8)
        {
LABEL_18:
          v24 = v31;
          v23 = v32;
          v25 = v30;
          if (a4)
          {
            v8 = objc_retainAutorelease(v8);
            v26 = 0;
            *a4 = v8;
          }
          else
          {
            v26 = 0;
          }
          goto LABEL_29;
        }
LABEL_24:
        v24 = v31;
        v23 = v32;
        v25 = v30;
        goto LABEL_25;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    v24 = v31;
    v23 = v32;
    v25 = v30;
  }
LABEL_29:

  return v26;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
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
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  v61 = 0u;
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
  v41 = 0u;
  TLV8BufferInit();
  -[HAPWiFiConfigurationControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPWiFiConfigurationControl operationType](self, "operationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v6, "serializeWithError:", &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v40;

    if (v8)
      goto LABEL_32;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_16;

  }
  -[HAPWiFiConfigurationControl cookie](self, "cookie");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HAPWiFiConfigurationControl cookie](self, "cookie");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v12, "serializeWithError:", &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    if (v8)
      goto LABEL_32;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_16;

  }
  -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_13;
  -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v14, "serializeWithError:", &v38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v38;

  if (v8)
    goto LABEL_32;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = TLV8BufferAppend();
  if ((_DWORD)v10)
  {
LABEL_16:
    v17 = v10;

    goto LABEL_17;
  }

LABEL_13:
  -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v16, "serializeWithError:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;

    if (v8)
      goto LABEL_32;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_16;

  }
  -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v20, "serializeWithError:", &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v21 = objc_msgSend(v9, "bytes");
      v22 = v21 + objc_msgSend(v9, "length");
      while (1)
      {
        v23 = (uint64_t)(v22 - v21) >= 255 ? 255 : v22 - v21;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_16;
        v21 += v23;
        if (v21 >= v22)
        {

          goto LABEL_30;
        }
      }
    }
LABEL_32:

    if (a3)
    {
      v18 = objc_retainAutorelease(v8);
      v8 = v18;
      goto LABEL_34;
    }
LABEL_35:
    v26 = 0;
    goto LABEL_36;
  }
LABEL_30:
  -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_50;
  -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v25, "serializeWithError:", &v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;

  if (v8)
    goto LABEL_32;
  v28 = objc_retainAutorelease(v7);
  v29 = objc_msgSend(v28, "bytes");
  v30 = v29 + objc_msgSend(v28, "length");
  do
  {
    if ((uint64_t)(v30 - v29) >= 255)
      v31 = 255;
    else
      v31 = v30 - v29;
    v32 = TLV8BufferAppend();
    if ((_DWORD)v32)
      v33 = 0;
    else
      v33 = v31;
    v29 += v33;
    if ((_DWORD)v32)
      v34 = 1;
    else
      v34 = v29 >= v30;
  }
  while (!v34);
  v17 = v32;

  if (!(_DWORD)v17)
  {
LABEL_50:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_36;
  }
LABEL_17:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  HMErrorFromOSStatus(v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_34:
  v26 = 0;
  *a3 = v18;
LABEL_36:
  TLV8BufferFree();

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPWiFiConfigurationControl *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPWiFiConfigurationControl *v11;

  v4 = +[HAPWiFiConfigurationControl allocWithZone:](HAPWiFiConfigurationControl, "allocWithZone:", a3);
  -[HAPWiFiConfigurationControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl cookie](self, "cookie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HAPWiFiConfigurationControl initWithOperationType:cookie:updateStatus:operationTimeout:countryCodeConfiguration:stationConfiguration:](v4, "initWithOperationType:cookie:updateStatus:operationTimeout:countryCodeConfiguration:stationConfiguration:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPWiFiConfigurationControl *v5;
  HAPWiFiConfigurationControl *v6;
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

  v5 = (HAPWiFiConfigurationControl *)a3;
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
      -[HAPWiFiConfigurationControl operationType](self, "operationType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl operationType](v6, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPWiFiConfigurationControl operationType](self, "operationType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl operationType](v6, "operationType");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_36;
        }
      }
      -[HAPWiFiConfigurationControl cookie](self, "cookie");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl cookie](v6, "cookie");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPWiFiConfigurationControl cookie](self, "cookie");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl cookie](v6, "cookie");
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
      -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl updateStatus](v6, "updateStatus");
      v14 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v13;
      v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl updateStatus](v6, "updateStatus");
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
      -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
      v19 = objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl operationTimeout](v6, "operationTimeout");
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
        -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl operationTimeout](v6, "operationTimeout");
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
      -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl countryCodeConfiguration](v6, "countryCodeConfiguration");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl countryCodeConfiguration](v6, "countryCodeConfiguration");
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
      -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPWiFiConfigurationControl stationConfiguration](v6, "stationConfiguration");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
        v32 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPWiFiConfigurationControl stationConfiguration](v6, "stationConfiguration");
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
  -[HAPWiFiConfigurationControl operationType](self, "operationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl cookie](self, "cookie");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl updateStatus](self, "updateStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl operationTimeout](self, "operationTimeout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl countryCodeConfiguration](self, "countryCodeConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPWiFiConfigurationControl stationConfiguration](self, "stationConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPWiFiConfigurationControl operationType=%@, cookie=%@, updateStatus=%@, operationTimeout=%@, countryCodeConfiguration=%@, stationConfiguration=%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (HAPWiFiConfigurationOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (HAPTLVUnsignedNumberValue)cookie
{
  return self->_cookie;
}

- (void)setCookie:(id)a3
{
  objc_storeStrong((id *)&self->_cookie, a3);
}

- (HAPWiFiConfigurationUpdateStatusWrapper)updateStatus
{
  return self->_updateStatus;
}

- (void)setUpdateStatus:(id)a3
{
  objc_storeStrong((id *)&self->_updateStatus, a3);
}

- (HAPTLVUnsignedNumberValue)operationTimeout
{
  return self->_operationTimeout;
}

- (void)setOperationTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_operationTimeout, a3);
}

- (NSString)countryCodeConfiguration
{
  return self->_countryCodeConfiguration;
}

- (void)setCountryCodeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_countryCodeConfiguration, a3);
}

- (HAPWiFiStationConfiguration)stationConfiguration
{
  return self->_stationConfiguration;
}

- (void)setStationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_stationConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationConfiguration, 0);
  objc_storeStrong((id *)&self->_countryCodeConfiguration, 0);
  objc_storeStrong((id *)&self->_operationTimeout, 0);
  objc_storeStrong((id *)&self->_updateStatus, 0);
  objc_storeStrong((id *)&self->_cookie, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPWiFiConfigurationControl *v6;
  HAPWiFiConfigurationControl *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPWiFiConfigurationControl);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPWiFiConfigurationControl parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
