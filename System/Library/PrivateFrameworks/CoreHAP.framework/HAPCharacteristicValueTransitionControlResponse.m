@implementation HAPCharacteristicValueTransitionControlResponse

- (HAPCharacteristicValueTransitionControlResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransitionControlResponse;
  return -[HAPCharacteristicValueTransitionControlResponse init](&v3, sel_init);
}

- (HAPCharacteristicValueTransitionControlResponse)initWithValueTransition:(id)a3 transitionState:(id)a4
{
  id v7;
  id v8;
  HAPCharacteristicValueTransitionControlResponse *v9;
  HAPCharacteristicValueTransitionControlResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueTransitionControlResponse;
  v9 = -[HAPCharacteristicValueTransitionControlResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueTransition, a3);
    objc_storeStrong((id *)&v10->_transitionState, a4);
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
  id *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  unint64_t v26[2];
  uint64_t v27;
  char v28;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v9 = 0;
    v10 = 0;
LABEL_17:
    -[HAPCharacteristicValueTransitionControlResponse setValueTransition:](self, "setValueTransition:", v10);
    -[HAPCharacteristicValueTransitionControlResponse setTransitionState:](self, "setTransitionState:", v9);
    v11 = 0;
    v18 = 1;
    goto LABEL_25;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = v7 + v8;
  while (1)
  {
    v28 = 0;
    v26[1] = 0;
    v27 = 0;
    v26[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v20;
      if (!v20)
        goto LABEL_17;
LABEL_21:
      if (a4)
      {
        v19 = objc_retainAutorelease(v11);
        v11 = v19;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v28 == 2)
    {
      v23 = v11;
      HAPTLVParseContiguousTlvs(2, v7, v12, v26, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;

      if (!v15)
      {
        v22 = 0;
        v16 = (id *)&v22;
        +[HAPCharacteristicValueTransitionState parsedFromData:error:](HAPCharacteristicValueTransitionState, "parsedFromData:error:", v14, &v22);
        v17 = v9;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v15 = *v16;

      }
LABEL_12:

      v11 = v15;
      goto LABEL_13;
    }
    if (v28 == 1)
    {
      v25 = v11;
      HAPTLVParseContiguousTlvs(1, v7, v12, v26, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

      if (!v15)
      {
        v24 = 0;
        v16 = (id *)&v24;
        +[HAPCharacteristicValueTransition parsedFromData:error:](HAPCharacteristicValueTransition, "parsedFromData:error:", v14, &v24);
        v17 = v10;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_13:
    v7 = v26[0];
    if (v26[0] >= v12)
    {
      if (!v11)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  if (a4)
  {
    HMErrorFromOSStatus(Next);
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v18 = 0;
    *a4 = v19;
    goto LABEL_25;
  }
LABEL_24:
  v18 = 0;
LABEL_25:

  return v18;
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
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
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
  -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v15, "serializeWithError:", &v27);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v27;

      if (v8)
        goto LABEL_12;
      v18 = objc_retainAutorelease(v7);
      v19 = objc_msgSend(v18, "bytes");
      v20 = v19 + objc_msgSend(v18, "length");
      do
      {
        if ((uint64_t)(v20 - v19) >= 255)
          v21 = 255;
        else
          v21 = v20 - v19;
        v22 = TLV8BufferAppend();
        if ((_DWORD)v22)
          v23 = 0;
        else
          v23 = v21;
        v19 += v23;
        if ((_DWORD)v22)
          v24 = 1;
        else
          v24 = v19 >= v20;
      }
      while (!v24);
      v17 = v22;

      if ((_DWORD)v17)
      {
LABEL_28:
        if (a3)
        {
          HMErrorFromOSStatus(v17);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v8 = 0;
          goto LABEL_30;
        }
        v8 = 0;
LABEL_33:
        v25 = 0;
        goto LABEL_34;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_34;
  }
  -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "serializeWithError:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

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

    goto LABEL_28;
  }
LABEL_12:

  if (!a3)
    goto LABEL_33;
  v16 = objc_retainAutorelease(v8);
  v8 = v16;
LABEL_30:
  v25 = 0;
  *a3 = v16;
LABEL_34:
  TLV8BufferFree();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueTransitionControlResponse *v4;
  void *v5;
  void *v6;
  HAPCharacteristicValueTransitionControlResponse *v7;

  v4 = +[HAPCharacteristicValueTransitionControlResponse allocWithZone:](HAPCharacteristicValueTransitionControlResponse, "allocWithZone:", a3);
  -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPCharacteristicValueTransitionControlResponse initWithValueTransition:transitionState:](v4, "initWithValueTransition:transitionState:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPCharacteristicValueTransitionControlResponse *v5;
  HAPCharacteristicValueTransitionControlResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HAPCharacteristicValueTransitionControlResponse *)a3;
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
      -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransitionControlResponse valueTransition](v6, "valueTransition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransitionControlResponse valueTransition](v6, "valueTransition");
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
      -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransitionControlResponse transitionState](v6, "transitionState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransitionControlResponse transitionState](v6, "transitionState");
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
  -[HAPCharacteristicValueTransitionControlResponse valueTransition](self, "valueTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransitionControlResponse transitionState](self, "transitionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransitionControlResponse valueTransition=%@, transitionState=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HAPCharacteristicValueTransition)valueTransition
{
  return self->_valueTransition;
}

- (void)setValueTransition:(id)a3
{
  objc_storeStrong((id *)&self->_valueTransition, a3);
}

- (HAPCharacteristicValueTransitionState)transitionState
{
  return self->_transitionState;
}

- (void)setTransitionState:(id)a3
{
  objc_storeStrong((id *)&self->_transitionState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionState, 0);
  objc_storeStrong((id *)&self->_valueTransition, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransitionControlResponse *v6;
  HAPCharacteristicValueTransitionControlResponse *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransitionControlResponse);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransitionControlResponse parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
