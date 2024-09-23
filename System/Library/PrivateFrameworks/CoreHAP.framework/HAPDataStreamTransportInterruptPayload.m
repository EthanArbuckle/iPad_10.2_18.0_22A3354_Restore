@implementation HAPDataStreamTransportInterruptPayload

- (HAPDataStreamTransportInterruptPayload)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  return -[HAPDataStreamTransportInterruptPayload init](&v3, sel_init);
}

- (HAPDataStreamTransportInterruptPayload)initWithRequestToSendIdentifiers:(id)a3 dataStreamTransportInterruptSequenceNumber:(id)a4
{
  id v7;
  id v8;
  HAPDataStreamTransportInterruptPayload *v9;
  HAPDataStreamTransportInterruptPayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPDataStreamTransportInterruptPayload;
  v9 = -[HAPDataStreamTransportInterruptPayload init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestToSendIdentifiers, a3);
    objc_storeStrong((id *)&v10->_dataStreamTransportInterruptSequenceNumber, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
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
  BOOL v19;
  id *v20;
  id v21;
  uint64_t v22;
  id *v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28[2];
  uint64_t v29;
  char v30;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_16:
    -[HAPDataStreamTransportInterruptPayload setRequestToSendIdentifiers:](self, "setRequestToSendIdentifiers:", v10, v24);
    -[HAPDataStreamTransportInterruptPayload setDataStreamTransportInterruptSequenceNumber:](self, "setDataStreamTransportInterruptSequenceNumber:", v9);
    v11 = 0;
    v19 = 1;
    goto LABEL_24;
  }
  v24 = a4;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v7 + v8;
  while (1)
  {
    v30 = 0;
    v28[1] = 0;
    v29 = 0;
    v28[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v22 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v22;
      if (!v22)
        goto LABEL_16;
LABEL_20:
      v20 = v24;
      if (v24)
      {
        v21 = objc_retainAutorelease(v11);
        v11 = v21;
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v30 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v11;
      +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v15 = v25;

      v17 = v9;
      v9 = (void *)v18;
LABEL_10:

LABEL_11:
      v11 = v15;
      goto LABEL_12;
    }
    if (v30 == 1)
    {
      v27 = v11;
      HAPTLVParseContiguousTlvs(1, v7, v12, v28, &v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v27;

      if (!v15)
      {
        v26 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v26);
        v16 = objc_claimAutoreleasedReturnValue();
        v15 = v26;
        v17 = v10;
        v10 = (void *)v16;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_12:
    v7 = v28[0];
    if (v28[0] >= v12)
    {
      if (!v11)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  v20 = v24;
  if (v24)
  {
    HMErrorFromOSStatus(Next);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v19 = 0;
    *v20 = v21;
    goto LABEL_24;
  }
LABEL_23:
  v19 = 0;
LABEL_24:

  return v19;
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
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
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
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  TLV8BufferInit();
  -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v15, "serializeWithError:", &v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v21;

      if (v8)
        goto LABEL_12;
      v18 = objc_retainAutorelease(v7);
      objc_msgSend(v18, "bytes");
      objc_msgSend(v18, "length");
      v17 = TLV8BufferAppend();

      if ((_DWORD)v17)
      {
LABEL_16:
        if (a3)
        {
          HMErrorFromOSStatus(v17);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v8 = 0;
          goto LABEL_18;
        }
        v8 = 0;
LABEL_21:
        v19 = 0;
        goto LABEL_22;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_22;
  }
  -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v6, "serializeWithError:", &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

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
        break;
      v10 += v12;
      if (v10 >= v11)
      {

        goto LABEL_10;
      }
    }
    v17 = v13;

    goto LABEL_16;
  }
LABEL_12:

  if (!a3)
    goto LABEL_21;
  v16 = objc_retainAutorelease(v8);
  v8 = v16;
LABEL_18:
  v19 = 0;
  *a3 = v16;
LABEL_22:
  TLV8BufferFree();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPDataStreamTransportInterruptPayload *v4;
  void *v5;
  void *v6;
  HAPDataStreamTransportInterruptPayload *v7;

  v4 = +[HAPDataStreamTransportInterruptPayload allocWithZone:](HAPDataStreamTransportInterruptPayload, "allocWithZone:", a3);
  -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPDataStreamTransportInterruptPayload initWithRequestToSendIdentifiers:dataStreamTransportInterruptSequenceNumber:](v4, "initWithRequestToSendIdentifiers:dataStreamTransportInterruptSequenceNumber:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPDataStreamTransportInterruptPayload *v5;
  HAPDataStreamTransportInterruptPayload *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HAPDataStreamTransportInterruptPayload *)a3;
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
      -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](v6, "requestToSendIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](v6, "requestToSendIdentifiers");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](v6, "dataStreamTransportInterruptSequenceNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](v6, "dataStreamTransportInterruptSequenceNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPDataStreamTransportInterruptPayload requestToSendIdentifiers](self, "requestToSendIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPDataStreamTransportInterruptPayload dataStreamTransportInterruptSequenceNumber](self, "dataStreamTransportInterruptSequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPDataStreamTransportInterruptPayload requestToSendIdentifiers=%@, dataStreamTransportInterruptSequenceNumber=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)requestToSendIdentifiers
{
  return self->_requestToSendIdentifiers;
}

- (void)setRequestToSendIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_requestToSendIdentifiers, a3);
}

- (HAPTLVUnsignedNumberValue)dataStreamTransportInterruptSequenceNumber
{
  return self->_dataStreamTransportInterruptSequenceNumber;
}

- (void)setDataStreamTransportInterruptSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStreamTransportInterruptSequenceNumber, 0);
  objc_storeStrong((id *)&self->_requestToSendIdentifiers, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPDataStreamTransportInterruptPayload *v6;
  HAPDataStreamTransportInterruptPayload *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPDataStreamTransportInterruptPayload);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPDataStreamTransportInterruptPayload parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
