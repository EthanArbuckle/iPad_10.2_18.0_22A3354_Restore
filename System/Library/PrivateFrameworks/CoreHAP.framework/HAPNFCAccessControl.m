@implementation HAPNFCAccessControl

- (HAPNFCAccessControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPNFCAccessControl;
  return -[HAPNFCAccessControl init](&v3, sel_init);
}

- (HAPNFCAccessControl)initWithOperationType:(id)a3 issuerKeyRequest:(id)a4 issuerKeyResponse:(id)a5 deviceCredentialKeyRequest:(id)a6 deviceCredentialKeyResponse:(id)a7 readerKeyRequest:(id)a8 readerKeyResponse:(id)a9
{
  id v16;
  id v17;
  HAPNFCAccessControl *v18;
  HAPNFCAccessControl *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HAPNFCAccessControl;
  v18 = -[HAPNFCAccessControl init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_operationType, a3);
    objc_storeStrong((id *)&v19->_issuerKeyRequest, a4);
    objc_storeStrong((id *)&v19->_issuerKeyResponse, a5);
    objc_storeStrong((id *)&v19->_deviceCredentialKeyRequest, a6);
    objc_storeStrong((id *)&v19->_deviceCredentialKeyResponse, a7);
    objc_storeStrong((id *)&v19->_readerKeyRequest, a8);
    objc_storeStrong((id *)&v19->_readerKeyResponse, a9);
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
  unint64_t v11;
  uint64_t Next;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51[2];
  uint64_t v52;
  char v53;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v7 < 1)
  {
    v9 = 0;
    v23 = 0;
    v10 = 0;
    v28 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
LABEL_30:
    -[HAPNFCAccessControl setOperationType:](self, "setOperationType:", v9, a4);
    -[HAPNFCAccessControl setIssuerKeyRequest:](self, "setIssuerKeyRequest:", v23);
    -[HAPNFCAccessControl setIssuerKeyResponse:](self, "setIssuerKeyResponse:", v24);
    -[HAPNFCAccessControl setDeviceCredentialKeyRequest:](self, "setDeviceCredentialKeyRequest:", v25);
    -[HAPNFCAccessControl setDeviceCredentialKeyResponse:](self, "setDeviceCredentialKeyResponse:", v26);
    -[HAPNFCAccessControl setReaderKeyRequest:](self, "setReaderKeyRequest:", v28);
    -[HAPNFCAccessControl setReaderKeyResponse:](self, "setReaderKeyResponse:", v10);
    v8 = 0;
    v30 = v28;
    v27 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v36 = 0;
    v37 = 0;
    v10 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v11 = v6 + v7;
    while (1)
    {
      v53 = 0;
      v51[1] = 0;
      v52 = 0;
      v51[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v52)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v29 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v29;
        if (v29)
          goto LABEL_23;
        goto LABEL_29;
      }
      switch(v53)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v8;
          +[HAPNFCAccessOperationTypeWrapper parsedFromData:error:](HAPNFCAccessOperationTypeWrapper, "parsedFromData:error:", v13, &v50);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v50;

          v16 = v9;
          v9 = (void *)v14;
          break;
        case 2:
          v49 = v8;
          HAPTLVParseContiguousTlvs(2, v6, v11, v51, &v49);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v49;

          if (v15)
            goto LABEL_20;
          v48 = 0;
          +[HAPNFCAccessIssuerKeyRequest parsedFromData:error:](HAPNFCAccessIssuerKeyRequest, "parsedFromData:error:", v13, &v48);
          v17 = objc_claimAutoreleasedReturnValue();
          v15 = v48;
          v16 = v37;
          v37 = (void *)v17;
          break;
        case 3:
          v47 = v8;
          HAPTLVParseContiguousTlvs(3, v6, v11, v51, &v47);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v47;

          if (v15)
            goto LABEL_20;
          v46 = 0;
          +[HAPNFCAccessIssuerKeyResponse parsedFromData:error:](HAPNFCAccessIssuerKeyResponse, "parsedFromData:error:", v13, &v46);
          v18 = objc_claimAutoreleasedReturnValue();
          v15 = v46;
          v16 = v36;
          v36 = (void *)v18;
          break;
        case 4:
          v45 = v8;
          HAPTLVParseContiguousTlvs(4, v6, v11, v51, &v45);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v45;

          if (v15)
            goto LABEL_20;
          v44 = 0;
          +[HAPNFCAccessDeviceCredentialKeyRequest parsedFromData:error:](HAPNFCAccessDeviceCredentialKeyRequest, "parsedFromData:error:", v13, &v44);
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v44;
          v16 = v35;
          v35 = (void *)v19;
          break;
        case 5:
          v43 = v8;
          HAPTLVParseContiguousTlvs(5, v6, v11, v51, &v43);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v43;

          if (v15)
            goto LABEL_20;
          v42 = 0;
          +[HAPNFCAccessDeviceCredentialKeyResponse parsedFromData:error:](HAPNFCAccessDeviceCredentialKeyResponse, "parsedFromData:error:", v13, &v42);
          v20 = objc_claimAutoreleasedReturnValue();
          v15 = v42;
          v16 = v34;
          v34 = (void *)v20;
          break;
        case 6:
          v41 = v8;
          HAPTLVParseContiguousTlvs(6, v6, v11, v51, &v41);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v41;

          if (v15)
            goto LABEL_20;
          v40 = 0;
          +[HAPNFCAccessReaderKeyRequest parsedFromData:error:](HAPNFCAccessReaderKeyRequest, "parsedFromData:error:", v13, &v40);
          v21 = objc_claimAutoreleasedReturnValue();
          v15 = v40;
          v16 = v33;
          v33 = (void *)v21;
          break;
        case 7:
          v39 = v8;
          HAPTLVParseContiguousTlvs(7, v6, v11, v51, &v39);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v39;

          if (v15)
            goto LABEL_20;
          v38 = 0;
          +[HAPNFCAccessReaderKeyResponse parsedFromData:error:](HAPNFCAccessReaderKeyResponse, "parsedFromData:error:", v13, &v38);
          v22 = objc_claimAutoreleasedReturnValue();
          v15 = v38;
          v16 = v10;
          v10 = (void *)v22;
          break;
        default:
          goto LABEL_21;
      }

LABEL_20:
      v8 = v15;
LABEL_21:
      v6 = v51[0];
      if (v51[0] >= v11)
      {
        if (v8)
        {
LABEL_23:
          v24 = v36;
          v23 = v37;
          v26 = v34;
          v25 = v35;
          if (a4)
          {
            v8 = objc_retainAutorelease(v8);
            v27 = 0;
            *a4 = v8;
          }
          else
          {
            v27 = 0;
          }
          goto LABEL_34;
        }
LABEL_29:
        v24 = v36;
        v23 = v37;
        v26 = v34;
        v25 = v35;
        v28 = v33;
        goto LABEL_30;
      }
    }
    if (a4)
    {
      HMErrorFromOSStatus(Next);
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v24 = v36;
    v23 = v37;
    v26 = v34;
    v25 = v35;
LABEL_34:
    v30 = v33;
  }

  return v27;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  TLV8BufferInit();
  -[HAPNFCAccessControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPNFCAccessControl operationType](self, "operationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v6, "serializeWithError:", &v56);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v56;

    if (v8)
      goto LABEL_51;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
    {
LABEL_54:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        v40 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_56;
      }
      v8 = 0;
LABEL_58:
      v41 = 0;
      goto LABEL_59;
    }
  }
  -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_13:
    -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      objc_msgSend(v19, "serializeWithError:", &v54);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v54;

      if (v8)
        goto LABEL_51;
      v13 = objc_retainAutorelease(v7);
      v20 = objc_msgSend(v13, "bytes");
      v21 = v20 + objc_msgSend(v13, "length");
      while (1)
      {
        v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
        v17 = TLV8BufferAppend();
        if ((_DWORD)v17)
          break;
        v20 += v22;
        if (v20 >= v21)
        {

          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        objc_msgSend(v24, "serializeWithError:", &v53);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v53;

        if (v8)
          goto LABEL_51;
        v13 = objc_retainAutorelease(v7);
        v25 = objc_msgSend(v13, "bytes");
        v26 = v25 + objc_msgSend(v13, "length");
        while (1)
        {
          v27 = (uint64_t)(v26 - v25) >= 255 ? 255 : v26 - v25;
          v17 = TLV8BufferAppend();
          if ((_DWORD)v17)
            break;
          v25 += v27;
          if (v25 >= v26)
          {

            goto LABEL_31;
          }
        }
      }
      else
      {
LABEL_31:
        -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0;
          objc_msgSend(v29, "serializeWithError:", &v52);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v52;

          if (v8)
            goto LABEL_51;
          v13 = objc_retainAutorelease(v7);
          v30 = objc_msgSend(v13, "bytes");
          v31 = v30 + objc_msgSend(v13, "length");
          while (1)
          {
            v32 = (uint64_t)(v31 - v30) >= 255 ? 255 : v31 - v30;
            v17 = TLV8BufferAppend();
            if ((_DWORD)v17)
              break;
            v30 += v32;
            if (v30 >= v31)
            {

              goto LABEL_40;
            }
          }
        }
        else
        {
LABEL_40:
          -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
LABEL_49:
            -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = 0;
              objc_msgSend(v39, "serializeWithError:", &v50);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v50;

              if (v8)
                goto LABEL_51;
              v43 = objc_retainAutorelease(v7);
              v44 = objc_msgSend(v43, "bytes");
              v45 = v44 + objc_msgSend(v43, "length");
              do
              {
                if ((uint64_t)(v45 - v44) >= 255)
                  v46 = 255;
                else
                  v46 = v45 - v44;
                v47 = TLV8BufferAppend();
                if ((_DWORD)v47)
                  v48 = 0;
                else
                  v48 = v46;
                v44 += v48;
                if ((_DWORD)v47)
                  v49 = 1;
                else
                  v49 = v44 >= v45;
              }
              while (!v49);
              v10 = v47;

              if ((_DWORD)v10)
                goto LABEL_54;
            }
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v57);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 0;
            goto LABEL_59;
          }
          -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          objc_msgSend(v34, "serializeWithError:", &v51);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v51;

          if (v8)
            goto LABEL_51;
          v13 = objc_retainAutorelease(v7);
          v35 = objc_msgSend(v13, "bytes");
          v36 = v35 + objc_msgSend(v13, "length");
          while (1)
          {
            v37 = (uint64_t)(v36 - v35) >= 255 ? 255 : v36 - v35;
            v17 = TLV8BufferAppend();
            if ((_DWORD)v17)
              break;
            v35 += v37;
            if (v35 >= v36)
            {

              goto LABEL_49;
            }
          }
        }
      }
    }
LABEL_53:
    v10 = v17;

    goto LABEL_54;
  }
  -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v12, "serializeWithError:", &v55);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v55;

  if (!v8)
  {
    v13 = objc_retainAutorelease(v7);
    v14 = objc_msgSend(v13, "bytes");
    v15 = v14 + objc_msgSend(v13, "length");
    while (1)
    {
      v16 = (uint64_t)(v15 - v14) >= 255 ? 255 : v15 - v14;
      v17 = TLV8BufferAppend();
      if ((_DWORD)v17)
        goto LABEL_53;
      v14 += v16;
      if (v14 >= v15)
      {

        goto LABEL_13;
      }
    }
  }
LABEL_51:

  if (!a3)
    goto LABEL_58;
  v40 = objc_retainAutorelease(v8);
  v8 = v40;
LABEL_56:
  v41 = 0;
  *a3 = v40;
LABEL_59:
  TLV8BufferFree();

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPNFCAccessControl *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HAPNFCAccessControl *v12;

  v4 = +[HAPNFCAccessControl allocWithZone:](HAPNFCAccessControl, "allocWithZone:", a3);
  -[HAPNFCAccessControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HAPNFCAccessControl initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:](v4, "initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:", v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPNFCAccessControl *v5;
  HAPNFCAccessControl *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v5 = (HAPNFCAccessControl *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HAPNFCAccessControl operationType](self, "operationType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl operationType](v6, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPNFCAccessControl operationType](self, "operationType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl operationType](v6, "operationType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v9;
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
          goto LABEL_45;
        }
        v53 = v10;
      }
      -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl issuerKeyRequest](v6, "issuerKeyRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {
        v51 = v12;
      }
      else
      {
        -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl issuerKeyRequest](v6, "issuerKeyRequest");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v11 = 0;
LABEL_43:

LABEL_44:
          v10 = v53;
          if (v7 == v8)
          {
LABEL_46:

            goto LABEL_47;
          }
LABEL_45:

          goto LABEL_46;
        }
        v51 = v12;
      }
      -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl issuerKeyResponse](v6, "issuerKeyResponse");
      v50 = v14;
      v49 = objc_claimAutoreleasedReturnValue();
      if (v14 != (void *)v49)
      {
        -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl issuerKeyResponse](v6, "issuerKeyResponse");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v15;
        if (!objc_msgSend(v15, "isEqual:"))
        {
          v16 = v3;
          v11 = 0;
          v17 = (void *)v49;
LABEL_41:

LABEL_42:
          v12 = v51;
          v3 = v16;
          if (v51 == v13)
            goto LABEL_44;
          goto LABEL_43;
        }
      }
      -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl deviceCredentialKeyRequest](v6, "deviceCredentialKeyRequest");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v46)
      {
        v42 = v13;
      }
      else
      {
        -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl deviceCredentialKeyRequest](v6, "deviceCredentialKeyRequest");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v16 = v3;
          v11 = 0;
          v22 = (void *)v46;
LABEL_39:

LABEL_40:
          v14 = v50;
          v17 = (void *)v49;
          if (v50 == (void *)v49)
            goto LABEL_42;
          goto LABEL_41;
        }
        v42 = v13;
      }
      -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl deviceCredentialKeyResponse](v6, "deviceCredentialKeyResponse");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 != v45)
      {
        -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl deviceCredentialKeyResponse](v6, "deviceCredentialKeyResponse");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v11 = 0;
          goto LABEL_36;
        }
      }
      -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
      v23 = objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl readerKeyRequest](v6, "readerKeyRequest");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v23 == v39)
      {
        v34 = v20;
        v35 = v3;
      }
      else
      {
        -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl readerKeyRequest](v6, "readerKeyRequest");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v24;
        if (!objc_msgSend(v24, "isEqual:"))
        {
          v11 = 0;
          v30 = (void *)v23;
          v31 = (void *)v39;
          goto LABEL_34;
        }
        v34 = v20;
        v35 = v3;
      }
      v38 = v23;
      -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPNFCAccessControl readerKeyResponse](v6, "readerKeyResponse");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v11 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPNFCAccessControl readerKeyResponse](v6, "readerKeyResponse");
        v33 = v18;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v28, "isEqual:", v29);

        v18 = v33;
      }
      v30 = (void *)v23;
      v31 = (void *)v39;
      v20 = v34;
      v3 = v35;
      if (v38 == v39)
      {
LABEL_35:

        if (v20 == v45)
        {
          v16 = v3;
LABEL_38:

          v22 = (void *)v46;
          v13 = v42;
          if (v18 == (void *)v46)
            goto LABEL_40;
          goto LABEL_39;
        }
LABEL_36:
        v16 = v3;

        goto LABEL_38;
      }
LABEL_34:

      goto LABEL_35;
    }
    v11 = 0;
  }
LABEL_47:

  return v11;
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
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPNFCAccessControl operationType](self, "operationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl issuerKeyRequest](self, "issuerKeyRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl issuerKeyResponse](self, "issuerKeyResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl deviceCredentialKeyRequest](self, "deviceCredentialKeyRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl deviceCredentialKeyResponse](self, "deviceCredentialKeyResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl readerKeyRequest](self, "readerKeyRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPNFCAccessControl readerKeyResponse](self, "readerKeyResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPNFCAccessControl operationType=%@, issuerKeyRequest=%@, issuerKeyResponse=%@, deviceCredentialKeyRequest=%@, deviceCredentialKeyResponse=%@, readerKeyRequest=%@, readerKeyResponse=%@>"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (HAPNFCAccessOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (HAPNFCAccessIssuerKeyRequest)issuerKeyRequest
{
  return self->_issuerKeyRequest;
}

- (void)setIssuerKeyRequest:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKeyRequest, a3);
}

- (HAPNFCAccessIssuerKeyResponse)issuerKeyResponse
{
  return self->_issuerKeyResponse;
}

- (void)setIssuerKeyResponse:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKeyResponse, a3);
}

- (HAPNFCAccessDeviceCredentialKeyRequest)deviceCredentialKeyRequest
{
  return self->_deviceCredentialKeyRequest;
}

- (void)setDeviceCredentialKeyRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCredentialKeyRequest, a3);
}

- (HAPNFCAccessDeviceCredentialKeyResponse)deviceCredentialKeyResponse
{
  return self->_deviceCredentialKeyResponse;
}

- (void)setDeviceCredentialKeyResponse:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCredentialKeyResponse, a3);
}

- (HAPNFCAccessReaderKeyRequest)readerKeyRequest
{
  return self->_readerKeyRequest;
}

- (void)setReaderKeyRequest:(id)a3
{
  objc_storeStrong((id *)&self->_readerKeyRequest, a3);
}

- (HAPNFCAccessReaderKeyResponse)readerKeyResponse
{
  return self->_readerKeyResponse;
}

- (void)setReaderKeyResponse:(id)a3
{
  objc_storeStrong((id *)&self->_readerKeyResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerKeyResponse, 0);
  objc_storeStrong((id *)&self->_readerKeyRequest, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKeyResponse, 0);
  objc_storeStrong((id *)&self->_deviceCredentialKeyRequest, 0);
  objc_storeStrong((id *)&self->_issuerKeyResponse, 0);
  objc_storeStrong((id *)&self->_issuerKeyRequest, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPNFCAccessControl *v6;
  HAPNFCAccessControl *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPNFCAccessControl);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPNFCAccessControl parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
