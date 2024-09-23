@implementation HAPAccessCodeControl

- (HAPAccessCodeControl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPAccessCodeControl;
  return -[HAPAccessCodeControl init](&v3, sel_init);
}

- (HAPAccessCodeControl)initWithOperationType:(id)a3 accessCodeControlRequest:(id)a4 accessCodeControlResponse:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPAccessCodeControl *v12;
  HAPAccessCodeControl *v13;
  uint64_t v14;
  NSMutableArray *accessCodeControlRequest;
  uint64_t v16;
  NSMutableArray *accessCodeControlResponse;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPAccessCodeControl;
  v12 = -[HAPAccessCodeControl init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operationType, a3);
    v14 = objc_msgSend(v10, "mutableCopy");
    accessCodeControlRequest = v13->_accessCodeControlRequest;
    v13->_accessCodeControlRequest = (NSMutableArray *)v14;

    v16 = objc_msgSend(v11, "mutableCopy");
    accessCodeControlResponse = v13->_accessCodeControlResponse;
    v13->_accessCodeControlResponse = (NSMutableArray *)v16;

  }
  return v13;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  id *v20;
  id v21;
  uint64_t v22;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30[2];
  uint64_t v31;
  char v32;

  v24 = a4;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 1)
  {
    v11 = 0;
LABEL_22:
    -[HAPAccessCodeControl setOperationType:](self, "setOperationType:", v11, v24);
    -[HAPAccessCodeControl setAccessCodeControlRequest:](self, "setAccessCodeControlRequest:", v8);
    -[HAPAccessCodeControl setAccessCodeControlResponse:](self, "setAccessCodeControlResponse:", v9);
    v10 = 0;
    v19 = 1;
    goto LABEL_30;
  }
  v10 = 0;
  v11 = 0;
  v12 = v6 + v7;
  while (1)
  {
    v32 = 0;
    v30[1] = 0;
    v31 = 0;
    v30[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v31)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v22;
      if (!v22)
        goto LABEL_22;
LABEL_26:
      v20 = v24;
      if (v24)
      {
        v21 = objc_retainAutorelease(v10);
        v10 = v21;
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    switch(v32)
    {
      case 3:
        v26 = v10;
        HAPTLVParseContiguousTlvs(3, v6, v12, v30, &v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v26;

        if (!v16)
        {
          v25 = 0;
          +[HAPAccessCodeControlResponse parsedFromData:error:](HAPAccessCodeControlResponse, "parsedFromData:error:", v14, &v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v25;
          if (!v16)
          {
            v18 = v9;
            goto LABEL_15;
          }
LABEL_16:

        }
LABEL_17:

        v10 = v16;
        break;
      case 2:
        v28 = v10;
        HAPTLVParseContiguousTlvs(2, v6, v12, v30, &v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v28;

        if (!v16)
        {
          v27 = 0;
          +[HAPAccessCodeControlRequest parsedFromData:error:](HAPAccessCodeControlRequest, "parsedFromData:error:", v14, &v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v27;
          if (!v16)
          {
            v18 = v8;
LABEL_15:
            objc_msgSend(v18, "addObject:", v17, v24);
          }
          goto LABEL_16;
        }
        goto LABEL_17;
      case 1:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v10;
        +[HAPAccessCodeOperationTypeWrapper parsedFromData:error:](HAPAccessCodeOperationTypeWrapper, "parsedFromData:error:", v14, &v29);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v29;

        v17 = v11;
        v11 = (void *)v15;
        goto LABEL_16;
    }
    v6 = v30[0];
    if (v30[0] >= v12)
    {
      if (!v10)
        goto LABEL_22;
      goto LABEL_26;
    }
  }
  v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
    v19 = 0;
    *v20 = v21;
    goto LABEL_30;
  }
LABEL_29:
  v19 = 0;
LABEL_30:

  return v19;
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
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  id *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  TLV8BufferInit();
  -[HAPAccessCodeControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPAccessCodeControl operationType](self, "operationType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v6, "serializeWithError:", &v47);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v47;

    if (v8)
      goto LABEL_3;
    v7 = objc_retainAutorelease(v7);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
    {
      v11 = v10;
LABEL_43:

      if (a3)
      {
        HMErrorFromOSStatus(v11);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_45;
      }
      v8 = 0;
LABEL_47:
      v33 = 0;
      goto LABEL_48;
    }

  }
  v46 = 0u;
  v44 = 0u;
  v45 = 0u;
  v43 = 0u;
  -[HAPAccessCodeControl accessCodeControlRequest](self, "accessCodeControlRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v35)
  {
    v12 = *(_QWORD *)v44;
    v13 = 1;
    v36 = a3;
LABEL_10:
    v14 = 0;
LABEL_11:
    if (*(_QWORD *)v44 != v12)
      objc_enumerationMutation(v7);
    v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
    if ((v13 & 1) != 0 || (v16 = TLV8BufferAppend(), !(_DWORD)v16))
    {
      v42 = 0;
      objc_msgSend(v15, "serializeWithError:", &v42);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v42;
      if (!v18)
      {
        v19 = objc_retainAutorelease(v17);
        v20 = objc_msgSend(v19, "bytes");
        v21 = v20 + objc_msgSend(v19, "length");
        while (1)
        {
          v22 = (uint64_t)(v21 - v20) >= 255 ? 255 : v21 - v20;
          v23 = TLV8BufferAppend();
          if ((_DWORD)v23)
            goto LABEL_41;
          v20 += v22;
          if (v20 >= v21)
          {

            v13 = 0;
            if (++v14 != v35)
              goto LABEL_11;
            v13 = 0;
            a3 = v36;
            v35 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
            if (v35)
              goto LABEL_10;
            goto LABEL_24;
          }
        }
      }
      goto LABEL_49;
    }
    goto LABEL_50;
  }
LABEL_24:

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HAPAccessCodeControl accessCodeControlResponse](self, "accessCodeControlResponse");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    v27 = 1;
    v36 = a3;
LABEL_26:
    v28 = 0;
LABEL_27:
    if (*(_QWORD *)v39 != v26)
      objc_enumerationMutation(v7);
    v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v28);
    if ((v27 & 1) != 0 || (v16 = TLV8BufferAppend(), !(_DWORD)v16))
    {
      v37 = 0;
      objc_msgSend(v29, "serializeWithError:", &v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v37;
      if (!v18)
      {
        v19 = objc_retainAutorelease(v17);
        v30 = objc_msgSend(v19, "bytes");
        v31 = v30 + objc_msgSend(v19, "length");
        while (1)
        {
          v32 = (uint64_t)(v31 - v30) >= 255 ? 255 : v31 - v30;
          v23 = TLV8BufferAppend();
          if ((_DWORD)v23)
            break;
          v30 += v32;
          if (v30 >= v31)
          {

            v27 = 0;
            if (++v28 != v25)
              goto LABEL_27;
            v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
            v27 = 0;
            if (v25)
              goto LABEL_26;
            goto LABEL_40;
          }
        }
LABEL_41:
        v11 = v23;

LABEL_42:
        a3 = v36;
        goto LABEL_43;
      }
LABEL_49:
      v8 = v18;
      a3 = v36;

LABEL_3:
      if (a3)
      {
        v9 = objc_retainAutorelease(v8);
        v8 = v9;
LABEL_45:
        v33 = 0;
        *a3 = v9;
        goto LABEL_48;
      }
      goto LABEL_47;
    }
LABEL_50:
    v11 = v16;
    goto LABEL_42;
  }
LABEL_40:

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v50);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_48:
  TLV8BufferFree();

  return v33;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPAccessCodeControl *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPAccessCodeControl *v8;

  v4 = +[HAPAccessCodeControl allocWithZone:](HAPAccessCodeControl, "allocWithZone:", a3);
  -[HAPAccessCodeControl operationType](self, "operationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControl accessCodeControlRequest](self, "accessCodeControlRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControl accessCodeControlResponse](self, "accessCodeControlResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPAccessCodeControl initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:](v4, "initWithOperationType:accessCodeControlRequest:accessCodeControlResponse:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPAccessCodeControl *v6;
  HAPAccessCodeControl *v7;
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

  v6 = (HAPAccessCodeControl *)a3;
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
      -[HAPAccessCodeControl operationType](self, "operationType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControl operationType](v7, "operationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPAccessCodeControl operationType](self, "operationType");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControl operationType](v7, "operationType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPAccessCodeControl accessCodeControlRequest](self, "accessCodeControlRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControl accessCodeControlRequest](v7, "accessCodeControlRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPAccessCodeControl accessCodeControlRequest](self, "accessCodeControlRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControl accessCodeControlRequest](v7, "accessCodeControlRequest");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPAccessCodeControl accessCodeControlResponse](self, "accessCodeControlResponse");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControl accessCodeControlResponse](v7, "accessCodeControlResponse");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPAccessCodeControl accessCodeControlResponse](self, "accessCodeControlResponse");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControl accessCodeControlResponse](v7, "accessCodeControlResponse");
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
  -[HAPAccessCodeControl operationType](self, "operationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControl accessCodeControlRequest](self, "accessCodeControlRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControl accessCodeControlResponse](self, "accessCodeControlResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPAccessCodeControl operationType=%@, accessCodeControlRequest=%@, accessCodeControlResponse=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPAccessCodeOperationTypeWrapper)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (NSMutableArray)accessCodeControlRequest
{
  return self->_accessCodeControlRequest;
}

- (void)setAccessCodeControlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_accessCodeControlRequest, a3);
}

- (NSMutableArray)accessCodeControlResponse
{
  return self->_accessCodeControlResponse;
}

- (void)setAccessCodeControlResponse:(id)a3
{
  objc_storeStrong((id *)&self->_accessCodeControlResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessCodeControlResponse, 0);
  objc_storeStrong((id *)&self->_accessCodeControlRequest, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPAccessCodeControl *v6;
  HAPAccessCodeControl *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPAccessCodeControl);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPAccessCodeControl parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
