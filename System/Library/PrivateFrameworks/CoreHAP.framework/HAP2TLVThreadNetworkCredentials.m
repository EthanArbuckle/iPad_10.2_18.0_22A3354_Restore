@implementation HAP2TLVThreadNetworkCredentials

- (HAP2TLVThreadNetworkCredentials)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVThreadNetworkCredentials;
  return -[HAP2TLVThreadNetworkCredentials init](&v3, sel_init);
}

- (HAP2TLVThreadNetworkCredentials)initWithNetworkName:(id)a3 channel:(id)a4 panID:(id)a5 extendedPanID:(id)a6 masterKey:(id)a7 reattachPeriod:(id)a8
{
  id v15;
  id v16;
  id v17;
  HAP2TLVThreadNetworkCredentials *v18;
  HAP2TLVThreadNetworkCredentials *v19;
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
  v24.super_class = (Class)HAP2TLVThreadNetworkCredentials;
  v18 = -[HAP2TLVThreadNetworkCredentials init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_networkName, a3);
    objc_storeStrong((id *)&v19->_channel, a4);
    objc_storeStrong((id *)&v19->_panID, a5);
    objc_storeStrong((id *)&v19->_extendedPanID, a6);
    objc_storeStrong((id *)&v19->_masterKey, a7);
    objc_storeStrong((id *)&v19->_reattachPeriod, a8);
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
  id v15;
  uint64_t v16;
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
  id v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43[2];
  uint64_t v44;
  char v45;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v7 < 1)
  {
    v23 = 0;
    v9 = 0;
    v25 = 0;
    v24 = 0;
    v10 = 0;
    v11 = 0;
LABEL_26:
    -[HAP2TLVThreadNetworkCredentials setNetworkName:](self, "setNetworkName:", v23, v29);
    -[HAP2TLVThreadNetworkCredentials setChannel:](self, "setChannel:", v11);
    -[HAP2TLVThreadNetworkCredentials setPanID:](self, "setPanID:", v10);
    -[HAP2TLVThreadNetworkCredentials setExtendedPanID:](self, "setExtendedPanID:", v24);
    -[HAP2TLVThreadNetworkCredentials setMasterKey:](self, "setMasterKey:", v25);
    -[HAP2TLVThreadNetworkCredentials setReattachPeriod:](self, "setReattachPeriod:", v9);
    v8 = 0;
    v26 = 1;
  }
  else
  {
    v29 = v5;
    v8 = 0;
    v32 = 0;
    v33 = 0;
    v9 = 0;
    v31 = 0;
    v10 = 0;
    v11 = 0;
    v12 = v6 + v7;
    while (1)
    {
      v45 = 0;
      v43[1] = 0;
      v44 = 0;
      v43[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v27 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v27;
        if (v27)
          goto LABEL_19;
        goto LABEL_25;
      }
      switch(v45)
      {
        case 1:
          v42 = v8;
          HAPTLVParseContiguousTlvs(1, v6, v12, v43, &v42);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v42;

          if (v15)
            goto LABEL_16;
          v41 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v14, &v41);
          v16 = objc_claimAutoreleasedReturnValue();
          v15 = v41;
          v17 = v33;
          v33 = (void *)v16;
          break;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v40);
          v18 = objc_claimAutoreleasedReturnValue();
          v15 = v40;

          v17 = v11;
          v11 = (void *)v18;
          break;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v39);
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v39;

          v17 = v10;
          v10 = (void *)v19;
          break;
        case 4:
          v38 = v8;
          HAPTLVParseContiguousTlvs(4, v6, v12, v43, &v38);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v38;

          if (v15)
            goto LABEL_16;
          v37 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v37);
          v20 = objc_claimAutoreleasedReturnValue();
          v15 = v37;
          v17 = v32;
          v32 = (void *)v20;
          break;
        case 5:
          v36 = v8;
          HAPTLVParseContiguousTlvs(5, v6, v12, v43, &v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v36;

          if (v15)
            goto LABEL_16;
          v35 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v35);
          v21 = objc_claimAutoreleasedReturnValue();
          v15 = v35;
          v17 = v31;
          v31 = (void *)v21;
          break;
        case 6:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v34);
          v22 = objc_claimAutoreleasedReturnValue();
          v15 = v34;

          v17 = v9;
          v9 = (void *)v22;
          break;
        default:
          goto LABEL_17;
      }

LABEL_16:
      v8 = v15;
LABEL_17:
      v6 = v43[0];
      if (v43[0] >= v12)
      {
        if (v8)
        {
LABEL_19:
          v24 = v32;
          v23 = v33;
          v25 = v31;
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
          goto LABEL_30;
        }
LABEL_25:
        v24 = v32;
        v23 = v33;
        v25 = v31;
        goto LABEL_26;
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
    v24 = v32;
    v23 = v33;
    v25 = v31;
  }
LABEL_30:

  return v26;
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
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
  -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v6, "serializeWithError:", &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v40;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v10 = objc_msgSend(v9, "bytes");
      v11 = v10 + objc_msgSend(v9, "length");
      while (1)
      {
        v12 = (uint64_t)(v11 - v10) >= 255 ? 255 : v11 - v10;
        v13 = TLV8BufferAppend();
        if ((_DWORD)v13)
          goto LABEL_17;
        v10 += v12;
        if (v10 >= v11)
        {

          goto LABEL_10;
        }
      }
    }
LABEL_42:

    if (a3)
    {
      v19 = objc_retainAutorelease(v8);
      v8 = v19;
      goto LABEL_44;
    }
LABEL_45:
    v32 = 0;
    goto LABEL_46;
  }
LABEL_10:
  -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v15, "serializeWithError:", &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    if (v8)
      goto LABEL_42;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v13 = TLV8BufferAppend();
    if ((_DWORD)v13)
      goto LABEL_17;

  }
  -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v17, "serializeWithError:", &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;

    if (v8)
      goto LABEL_42;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v13 = TLV8BufferAppend();
    if ((_DWORD)v13)
      goto LABEL_17;

  }
  -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v21, "serializeWithError:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;

    if (v8)
      goto LABEL_42;
    v9 = objc_retainAutorelease(v7);
    v22 = objc_msgSend(v9, "bytes");
    v23 = v22 + objc_msgSend(v9, "length");
    while (1)
    {
      v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
      v13 = TLV8BufferAppend();
      if ((_DWORD)v13)
        goto LABEL_17;
      v22 += v24;
      if (v22 >= v23)
      {

        break;
      }
    }
  }
  -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v26, "serializeWithError:", &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    if (v8)
      goto LABEL_42;
    v9 = objc_retainAutorelease(v7);
    v27 = objc_msgSend(v9, "bytes");
    v28 = v27 + objc_msgSend(v9, "length");
    while (1)
    {
      v29 = (uint64_t)(v28 - v27) >= 255 ? 255 : v28 - v27;
      v13 = TLV8BufferAppend();
      if ((_DWORD)v13)
        break;
      v27 += v29;
      if (v27 >= v28)
      {

        goto LABEL_40;
      }
    }
LABEL_17:
    v18 = v13;

    goto LABEL_18;
  }
LABEL_40:
  -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
    goto LABEL_48;
  -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v31, "serializeWithError:", &v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;

  if (v8)
    goto LABEL_42;
  v34 = objc_retainAutorelease(v7);
  objc_msgSend(v34, "bytes");
  objc_msgSend(v34, "length");
  v18 = TLV8BufferAppend();

  if (!(_DWORD)v18)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_46;
  }
LABEL_18:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_45;
  }
  HMErrorFromOSStatus(v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_44:
  v32 = 0;
  *a3 = v19;
LABEL_46:
  TLV8BufferFree();

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVThreadNetworkCredentials *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAP2TLVThreadNetworkCredentials *v11;

  v4 = +[HAP2TLVThreadNetworkCredentials allocWithZone:](HAP2TLVThreadNetworkCredentials, "allocWithZone:", a3);
  -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HAP2TLVThreadNetworkCredentials initWithNetworkName:channel:panID:extendedPanID:masterKey:reattachPeriod:](v4, "initWithNetworkName:channel:panID:extendedPanID:masterKey:reattachPeriod:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAP2TLVThreadNetworkCredentials *v5;
  HAP2TLVThreadNetworkCredentials *v6;
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

  v5 = (HAP2TLVThreadNetworkCredentials *)a3;
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
      -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials networkName](v6, "networkName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials networkName](v6, "networkName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_36;
        }
      }
      -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials channel](v6, "channel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials channel](v6, "channel");
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
      -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials panID](v6, "panID");
      v14 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v13;
      v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials panID](v6, "panID");
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
      -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
      v19 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials extendedPanID](v6, "extendedPanID");
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
        -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials extendedPanID](v6, "extendedPanID");
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
      -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials masterKey](v6, "masterKey");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials masterKey](v6, "masterKey");
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
      -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVThreadNetworkCredentials reattachPeriod](v6, "reattachPeriod");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
        v32 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVThreadNetworkCredentials reattachPeriod](v6, "reattachPeriod");
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
  -[HAP2TLVThreadNetworkCredentials networkName](self, "networkName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials panID](self, "panID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials extendedPanID](self, "extendedPanID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials masterKey](self, "masterKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVThreadNetworkCredentials reattachPeriod](self, "reattachPeriod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAP2TLVThreadNetworkCredentials networkName=%@, channel=%@, panID=%@, extendedPanID=%@, masterKey=%@, reattachPeriod=%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (HAPTLVUnsignedNumberValue)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (HAPTLVUnsignedNumberValue)panID
{
  return self->_panID;
}

- (void)setPanID:(id)a3
{
  objc_storeStrong((id *)&self->_panID, a3);
}

- (NSData)extendedPanID
{
  return self->_extendedPanID;
}

- (void)setExtendedPanID:(id)a3
{
  objc_storeStrong((id *)&self->_extendedPanID, a3);
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setMasterKey:(id)a3
{
  objc_storeStrong((id *)&self->_masterKey, a3);
}

- (HAPTLVUnsignedNumberValue)reattachPeriod
{
  return self->_reattachPeriod;
}

- (void)setReattachPeriod:(id)a3
{
  objc_storeStrong((id *)&self->_reattachPeriod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reattachPeriod, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPanID, 0);
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVThreadNetworkCredentials *v6;
  HAP2TLVThreadNetworkCredentials *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVThreadNetworkCredentials);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVThreadNetworkCredentials parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
