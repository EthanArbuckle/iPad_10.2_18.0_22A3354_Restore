@implementation HAPReaderKey

- (HAPReaderKey)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPReaderKey;
  return -[HAPReaderKey init](&v3, sel_init);
}

- (HAPReaderKey)initWithType:(id)a3 key:(id)a4 keyIdentifier:(id)a5 readerIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPReaderKey *v15;
  HAPReaderKey *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPReaderKey;
  v15 = -[HAPReaderKey init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_type, a3);
    objc_storeStrong((id *)&v16->_key, a4);
    objc_storeStrong((id *)&v16->_keyIdentifier, a5);
    objc_storeStrong((id *)&v16->_readerIdentifier, a6);
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
  HAPReaderKey *v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36[2];
  uint64_t v37;
  char v38;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v22 = 0;
    v12 = 0;
LABEL_24:
    -[HAPReaderKey setType:](self, "setType:", v12, v26);
    -[HAPReaderKey setKey:](self, "setKey:", v22);
    -[HAPReaderKey setKeyIdentifier:](self, "setKeyIdentifier:", v11);
    -[HAPReaderKey setReaderIdentifier:](self, "setReaderIdentifier:", v10);
    v9 = 0;
    v23 = 1;
  }
  else
  {
    v26 = self;
    v27 = a4;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v28 = 0;
    v12 = 0;
    v13 = v7 + v8;
    while (1)
    {
      v38 = 0;
      v36[1] = 0;
      v37 = 0;
      v36[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v24 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v24;
        if (v24)
          goto LABEL_17;
        goto LABEL_23;
      }
      switch(v38)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v9;
          +[HAPNFCAccessKeyTypeWrapper parsedFromData:error:](HAPNFCAccessKeyTypeWrapper, "parsedFromData:error:", v15, &v35);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v35;

          v18 = v12;
          v12 = (void *)v16;
          break;
        case 2:
          v34 = v9;
          HAPTLVParseContiguousTlvs(2, v7, v13, v36, &v34);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v34;

          if (v17)
            goto LABEL_14;
          v33 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v33);
          v19 = objc_claimAutoreleasedReturnValue();
          v17 = v33;
          v18 = v28;
          v28 = (void *)v19;
          break;
        case 3:
          v32 = v9;
          HAPTLVParseContiguousTlvs(3, v7, v13, v36, &v32);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v32;

          if (v17)
            goto LABEL_14;
          v31 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v31);
          v20 = objc_claimAutoreleasedReturnValue();
          v17 = v31;
          v18 = v11;
          v11 = (void *)v20;
          break;
        case 4:
          v30 = v9;
          HAPTLVParseContiguousTlvs(4, v7, v13, v36, &v30);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v30;

          if (v17)
            goto LABEL_14;
          v29 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v15, &v29);
          v21 = objc_claimAutoreleasedReturnValue();
          v17 = v29;
          v18 = v10;
          v10 = (void *)v21;
          break;
        default:
          goto LABEL_15;
      }

LABEL_14:
      v9 = v17;
LABEL_15:
      v7 = v36[0];
      if (v36[0] >= v13)
      {
        if (v9)
        {
LABEL_17:
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
          goto LABEL_28;
        }
LABEL_23:
        v22 = v28;
        goto LABEL_24;
      }
    }
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
LABEL_28:

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
  id v25;
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

  v60 = *MEMORY[0x1E0C80C00];
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
  -[HAPReaderKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPReaderKey type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v6, "serializeWithError:", &v38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v38;

    if (v8)
      goto LABEL_24;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if ((_DWORD)v10)
    {
LABEL_27:
      if (a3)
      {
        HMErrorFromOSStatus(v10);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_29;
      }
      v8 = 0;
LABEL_31:
      v26 = 0;
      goto LABEL_32;
    }
  }
  -[HAPReaderKey key](self, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HAPReaderKey key](self, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v12, "serializeWithError:", &v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v37;

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
          goto LABEL_26;
        v14 += v16;
        if (v14 >= v15)
        {

          goto LABEL_13;
        }
      }
    }
  }
  else
  {
LABEL_13:
    -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_22:
      -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v24, "serializeWithError:", &v35);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v35;

        if (v8)
          goto LABEL_24;
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
        v10 = v32;

        if ((_DWORD)v10)
          goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v39);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      goto LABEL_32;
    }
    -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v19, "serializeWithError:", &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;

    if (!v8)
    {
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
LABEL_26:
      v10 = v17;

      goto LABEL_27;
    }
  }
LABEL_24:

  if (!a3)
    goto LABEL_31;
  v25 = objc_retainAutorelease(v8);
  v8 = v25;
LABEL_29:
  v26 = 0;
  *a3 = v25;
LABEL_32:
  TLV8BufferFree();

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPReaderKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPReaderKey *v9;

  v4 = +[HAPReaderKey allocWithZone:](HAPReaderKey, "allocWithZone:", a3);
  -[HAPReaderKey type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPReaderKey initWithType:key:keyIdentifier:readerIdentifier:](v4, "initWithType:key:keyIdentifier:readerIdentifier:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPReaderKey *v5;
  HAPReaderKey *v6;
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

  v5 = (HAPReaderKey *)a3;
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
      -[HAPReaderKey type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPReaderKey type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPReaderKey type](self, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPReaderKey type](v6, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[HAPReaderKey key](self, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPReaderKey key](v6, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPReaderKey key](self, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPReaderKey key](v6, "key");
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
      -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HAPReaderKey keyIdentifier](v6, "keyIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPReaderKey keyIdentifier](v6, "keyIdentifier");
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
      -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPReaderKey readerIdentifier](v6, "readerIdentifier");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPReaderKey readerIdentifier](v6, "readerIdentifier");
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
  -[HAPReaderKey type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey keyIdentifier](self, "keyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPReaderKey readerIdentifier](self, "readerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPReaderKey type=%@, key=%@, keyIdentifier=%@, readerIdentifier=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HAPNFCAccessKeyTypeWrapper)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void)setReaderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_readerIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPReaderKey *v6;
  HAPReaderKey *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPReaderKey);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPReaderKey parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
