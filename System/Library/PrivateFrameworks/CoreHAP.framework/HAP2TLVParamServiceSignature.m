@implementation HAP2TLVParamServiceSignature

- (HAP2TLVParamServiceSignature)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVParamServiceSignature;
  return -[HAP2TLVParamServiceSignature init](&v3, sel_init);
}

- (HAP2TLVParamServiceSignature)initWithInstanceID:(id)a3 serviceType:(id)a4 properties:(id)a5 linkedServices:(id)a6 characteristicList:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HAP2TLVParamServiceSignature *v17;
  HAP2TLVParamServiceSignature *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAP2TLVParamServiceSignature;
  v17 = -[HAP2TLVParamServiceSignature init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_instanceID, a3);
    objc_storeStrong((id *)&v18->_serviceType, a4);
    objc_storeStrong((id *)&v18->_properties, a5);
    objc_storeStrong((id *)&v18->_linkedServices, a6);
    objc_storeStrong((id *)&v18->_characteristicList, a7);
  }

  return v18;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t Next;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39[2];
  uint64_t v40;
  unsigned __int8 v41;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 >= 1)
  {
    v28 = a4;
    v29 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v30 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v41 = 0;
      v40 = 0;
      v39[0] = 0;
      v39[1] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
      {
        if (v28)
        {
          HMErrorFromOSStatus(Next);
          v25 = 0;
          *v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }
        v24 = v29;
        v23 = v30;
        goto LABEL_34;
      }
      if (!v40)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v26 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v26;
        if (v26)
          goto LABEL_23;
        goto LABEL_29;
      }
      if (v41 <= 0xEu)
      {
        if (v41 == 6)
        {
          v37 = v9;
          HAPTLVParseContiguousTlvs(6, v7, v13, v39, &v37);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v37;

          if (!v16)
          {
            v36 = 0;
            objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v36);
            v22 = objc_claimAutoreleasedReturnValue();
            v16 = v36;
            v18 = v30;
            v30 = (void *)v22;
LABEL_19:

          }
LABEL_20:

          v9 = v16;
          goto LABEL_21;
        }
        if (v41 == 7)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v9;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v38);
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = v38;

          v18 = v12;
          v12 = (void *)v19;
          goto LABEL_19;
        }
      }
      else
      {
        switch(v41)
        {
          case 0xFu:
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v9;
            +[HAP2TLVServicePropertiesWrapper parsedFromData:error:](HAP2TLVServicePropertiesWrapper, "parsedFromData:error:", v15, &v35);
            v20 = objc_claimAutoreleasedReturnValue();
            v16 = v35;

            v18 = v11;
            v11 = (void *)v20;
            goto LABEL_19;
          case 0x10u:
            v34 = v9;
            HAPTLVParseContiguousTlvs(16, v7, v13, v39, &v34);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v34;

            if (!v16)
            {
              v33 = 0;
              objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v33);
              v21 = objc_claimAutoreleasedReturnValue();
              v16 = v33;
              v18 = v29;
              v29 = (void *)v21;
              goto LABEL_19;
            }
            goto LABEL_20;
          case 0x14u:
            v32 = v9;
            HAPTLVParseContiguousTlvs(20, v7, v13, v39, &v32);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v32;

            if (!v16)
            {
              v31 = 0;
              +[HAP2TLVParamCharacteristicList parsedFromData:error:](HAP2TLVParamCharacteristicList, "parsedFromData:error:", v15, &v31);
              v17 = objc_claimAutoreleasedReturnValue();
              v16 = v31;
              v18 = v10;
              v10 = (void *)v17;
              goto LABEL_19;
            }
            goto LABEL_20;
        }
      }
LABEL_21:
      v7 = v39[0];
      if (v39[0] >= v13)
      {
        if (v9)
        {
LABEL_23:
          v24 = v29;
          v23 = v30;
          if (v28)
          {
            v9 = objc_retainAutorelease(v9);
            v25 = 0;
            *v28 = v9;
          }
          else
          {
            v25 = 0;
          }
          goto LABEL_34;
        }
LABEL_29:
        v24 = v29;
        v23 = v30;
        goto LABEL_30;
      }
    }
  }
  v10 = 0;
  v24 = 0;
  v11 = 0;
  v23 = 0;
  v12 = 0;
LABEL_30:
  -[HAP2TLVParamServiceSignature setInstanceID:](self, "setInstanceID:", v12);
  -[HAP2TLVParamServiceSignature setServiceType:](self, "setServiceType:", v23);
  -[HAP2TLVParamServiceSignature setProperties:](self, "setProperties:", v11);
  -[HAP2TLVParamServiceSignature setLinkedServices:](self, "setLinkedServices:", v24);
  -[HAP2TLVParamServiceSignature setCharacteristicList:](self, "setCharacteristicList:", v10);
  v9 = 0;
  v25 = 1;
LABEL_34:

  return v25;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
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
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
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
  v47 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  TLV8BufferInit();
  -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v6, "serializeWithError:", &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v40;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
    {
LABEL_4:
      v11 = v10;

      goto LABEL_5;
    }

  }
  -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v14, "serializeWithError:", &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v15 = objc_msgSend(v9, "bytes");
      v16 = v15 + objc_msgSend(v9, "length");
      while (1)
      {
        v17 = (uint64_t)(v16 - v15) >= 255 ? 255 : v16 - v15;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v15 += v17;
        if (v15 >= v16)
        {

          goto LABEL_18;
        }
      }
    }
    goto LABEL_33;
  }
LABEL_18:
  -[HAP2TLVParamServiceSignature properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAP2TLVParamServiceSignature properties](self, "properties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v19, "serializeWithError:", &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;

    if (v8)
      goto LABEL_33;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v21, "serializeWithError:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v22 = objc_msgSend(v9, "bytes");
      v23 = v22 + objc_msgSend(v9, "length");
      while (1)
      {
        v24 = (uint64_t)(v23 - v22) >= 255 ? 255 : v23 - v22;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v22 += v24;
        if (v22 >= v23)
        {

          goto LABEL_31;
        }
      }
    }
LABEL_33:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_35;
    }
LABEL_36:
    v27 = 0;
    goto LABEL_37;
  }
LABEL_31:
  -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_51;
  -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v26, "serializeWithError:", &v36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v36;

  if (v8)
    goto LABEL_33;
  v29 = objc_retainAutorelease(v7);
  v30 = objc_msgSend(v29, "bytes");
  v31 = v30 + objc_msgSend(v29, "length");
  do
  {
    if ((uint64_t)(v31 - v30) >= 255)
      v32 = 255;
    else
      v32 = v31 - v30;
    v33 = TLV8BufferAppend();
    if ((_DWORD)v33)
      v34 = 0;
    else
      v34 = v32;
    v30 += v34;
    if ((_DWORD)v33)
      v35 = 1;
    else
      v35 = v30 >= v31;
  }
  while (!v35);
  v11 = v33;

  if (!(_DWORD)v11)
  {
LABEL_51:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_37;
  }
LABEL_5:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  HMErrorFromOSStatus(v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_35:
  v27 = 0;
  *a3 = v12;
LABEL_37:
  TLV8BufferFree();

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVParamServiceSignature *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAP2TLVParamServiceSignature *v10;

  v4 = +[HAP2TLVParamServiceSignature allocWithZone:](HAP2TLVParamServiceSignature, "allocWithZone:", a3);
  -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAP2TLVParamServiceSignature initWithInstanceID:serviceType:properties:linkedServices:characteristicList:](v4, "initWithInstanceID:serviceType:properties:linkedServices:characteristicList:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAP2TLVParamServiceSignature *v5;
  HAP2TLVParamServiceSignature *v6;
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

  v5 = (HAP2TLVParamServiceSignature *)a3;
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
      -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamServiceSignature instanceID](v6, "instanceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamServiceSignature instanceID](v6, "instanceID");
        v39 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamServiceSignature serviceType](v6, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamServiceSignature serviceType](v6, "serviceType");
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
      -[HAP2TLVParamServiceSignature properties](self, "properties");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamServiceSignature properties](v6, "properties");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      if (v13 != v36)
      {
        -[HAP2TLVParamServiceSignature properties](self, "properties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamServiceSignature properties](v6, "properties");
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
      -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamServiceSignature linkedServices](v6, "linkedServices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamServiceSignature linkedServices](v6, "linkedServices");
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
      -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamServiceSignature characteristicList](v6, "characteristicList");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

        v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
        v27 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamServiceSignature characteristicList](v6, "characteristicList");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAP2TLVParamServiceSignature instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature serviceType](self, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature linkedServices](self, "linkedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamServiceSignature characteristicList](self, "characteristicList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAP2TLVParamServiceSignature instanceID=%@, serviceType=%@, properties=%@, linkedServices=%@, characteristicList=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HAPTLVUnsignedNumberValue)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceID, a3);
}

- (NSData)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (HAP2TLVServicePropertiesWrapper)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSData)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (HAP2TLVParamCharacteristicList)characteristicList
{
  return self->_characteristicList;
}

- (void)setCharacteristicList:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicList, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVParamServiceSignature *v6;
  HAP2TLVParamServiceSignature *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVParamServiceSignature);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVParamServiceSignature parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
