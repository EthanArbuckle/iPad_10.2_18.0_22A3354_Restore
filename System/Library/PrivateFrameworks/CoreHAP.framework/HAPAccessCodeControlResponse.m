@implementation HAPAccessCodeControlResponse

- (HAPAccessCodeControlResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPAccessCodeControlResponse;
  return -[HAPAccessCodeControlResponse init](&v3, sel_init);
}

- (HAPAccessCodeControlResponse)initWithIdentifier:(id)a3 accessCode:(id)a4 flags:(id)a5 statusCode:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPAccessCodeControlResponse *v15;
  HAPAccessCodeControlResponse *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPAccessCodeControlResponse;
  v15 = -[HAPAccessCodeControlResponse init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_accessCode, a4);
    objc_storeStrong((id *)&v16->_flags, a5);
    objc_storeStrong((id *)&v16->_statusCode, a6);
  }

  return v16;
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
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  HAPAccessCodeControlResponse *v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34[2];
  uint64_t v35;
  char v36;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v22 = 0;
    v12 = 0;
LABEL_22:
    -[HAPAccessCodeControlResponse setIdentifier:](self, "setIdentifier:", v12, v26);
    -[HAPAccessCodeControlResponse setAccessCode:](self, "setAccessCode:", v22);
    -[HAPAccessCodeControlResponse setFlags:](self, "setFlags:", v11);
    -[HAPAccessCodeControlResponse setStatusCode:](self, "setStatusCode:", v10);
    v9 = 0;
    v23 = 1;
    goto LABEL_26;
  }
  v26 = self;
  v27 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v28 = 0;
  v12 = 0;
  v13 = v7 + v8;
  while (2)
  {
    v36 = 0;
    v34[1] = 0;
    v35 = 0;
    v34[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
    {
      if (v27)
      {
        HMErrorFromOSStatus(Next);
        v23 = 0;
        *v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v22 = v28;
    }
    else
    {
      if (v35)
      {
        switch(v36)
        {
          case 1:
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v9;
            +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v15, &v33);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v33;

            v18 = v12;
            v12 = (void *)v16;
            goto LABEL_11;
          case 2:
            v32 = v9;
            HAPTLVParseContiguousTlvs(2, v7, v13, v34, &v32);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v32;

            if (v17)
              goto LABEL_12;
            v31 = 0;
            objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v15, &v31);
            v19 = objc_claimAutoreleasedReturnValue();
            v17 = v31;
            v18 = v28;
            v28 = (void *)v19;
LABEL_11:

LABEL_12:
            v9 = v17;
LABEL_13:
            v7 = v34[0];
            if (v34[0] < v13)
              continue;
            if (v9)
              goto LABEL_15;
            goto LABEL_21;
          case 3:
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v9;
            +[HAPAccessCodeFlagsWrapper parsedFromData:error:](HAPAccessCodeFlagsWrapper, "parsedFromData:error:", v15, &v30);
            v20 = objc_claimAutoreleasedReturnValue();
            v17 = v30;

            v18 = v11;
            v11 = (void *)v20;
            goto LABEL_11;
          case 4:
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v9;
            +[HAPAccessCodeResponseStatusWrapper parsedFromData:error:](HAPAccessCodeResponseStatusWrapper, "parsedFromData:error:", v15, &v29);
            v21 = objc_claimAutoreleasedReturnValue();
            v17 = v29;

            v18 = v10;
            v10 = (void *)v21;
            goto LABEL_11;
          default:
            goto LABEL_13;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v24;
      if (!v24)
      {
LABEL_21:
        v22 = v28;
        goto LABEL_22;
      }
LABEL_15:
      v22 = v28;
      if (v27)
      {
        v9 = objc_retainAutorelease(v9);
        v23 = 0;
        *v27 = v9;
      }
      else
      {
        v23 = 0;
      }
    }
    break;
  }
LABEL_26:

  return v23;
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
  void *v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
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
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
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
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  TLV8BufferInit();
  -[HAPAccessCodeControlResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPAccessCodeControlResponse identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v6, "serializeWithError:", &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;

    if (v8)
      goto LABEL_24;
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
  -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v14, "serializeWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;

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
LABEL_24:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_26;
    }
LABEL_27:
    v22 = 0;
    goto LABEL_28;
  }
LABEL_18:
  -[HAPAccessCodeControlResponse flags](self, "flags");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAPAccessCodeControlResponse flags](self, "flags");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v19, "serializeWithError:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v8)
      goto LABEL_24;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_30;
  -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v21, "serializeWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
    goto LABEL_24;
  v24 = objc_retainAutorelease(v7);
  objc_msgSend(v24, "bytes");
  objc_msgSend(v24, "length");
  v11 = TLV8BufferAppend();

  if (!(_DWORD)v11)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_28;
  }
LABEL_5:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_27;
  }
  HMErrorFromOSStatus(v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_26:
  v22 = 0;
  *a3 = v12;
LABEL_28:
  TLV8BufferFree();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPAccessCodeControlResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPAccessCodeControlResponse *v9;

  v4 = +[HAPAccessCodeControlResponse allocWithZone:](HAPAccessCodeControlResponse, "allocWithZone:", a3);
  -[HAPAccessCodeControlResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse flags](self, "flags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPAccessCodeControlResponse initWithIdentifier:accessCode:flags:statusCode:](v4, "initWithIdentifier:accessCode:flags:statusCode:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPAccessCodeControlResponse *v5;
  HAPAccessCodeControlResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (HAPAccessCodeControlResponse *)a3;
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
      -[HAPAccessCodeControlResponse identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControlResponse identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPAccessCodeControlResponse identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControlResponse identifier](v6, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControlResponse accessCode](v6, "accessCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControlResponse accessCode](v6, "accessCode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      -[HAPAccessCodeControlResponse flags](self, "flags");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControlResponse flags](v6, "flags");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[HAPAccessCodeControlResponse flags](self, "flags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControlResponse flags](v6, "flags");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessCodeControlResponse statusCode](v6, "statusCode");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPAccessCodeControlResponse statusCode](v6, "statusCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "isEqual:", v21);

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v10 = 0;
  }
LABEL_27:

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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPAccessCodeControlResponse identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse accessCode](self, "accessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse flags](self, "flags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessCodeControlResponse statusCode](self, "statusCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPAccessCodeControlResponse identifier=%@, accessCode=%@, flags=%@, statusCode=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HAPTLVUnsignedNumberValue)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)accessCode
{
  return self->_accessCode;
}

- (void)setAccessCode:(id)a3
{
  objc_storeStrong((id *)&self->_accessCode, a3);
}

- (HAPAccessCodeFlagsWrapper)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (HAPAccessCodeResponseStatusWrapper)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPAccessCodeControlResponse *v6;
  HAPAccessCodeControlResponse *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPAccessCodeControlResponse);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPAccessCodeControlResponse parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
