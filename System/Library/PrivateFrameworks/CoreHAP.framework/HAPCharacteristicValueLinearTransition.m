@implementation HAPCharacteristicValueLinearTransition

- (HAPCharacteristicValueLinearTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearTransition;
  return -[HAPCharacteristicValueLinearTransition init](&v3, sel_init);
}

- (HAPCharacteristicValueLinearTransition)initWithTransitionPoints:(id)a3 startBehavior:(id)a4
{
  id v6;
  id v7;
  HAPCharacteristicValueLinearTransition *v8;
  uint64_t v9;
  NSMutableArray *transitionPoints;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPCharacteristicValueLinearTransition;
  v8 = -[HAPCharacteristicValueLinearTransition init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "mutableCopy");
    transitionPoints = v8->_transitionPoints;
    v8->_transitionPoints = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_startBehavior, a4);
  }

  return v8;
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
  void *v16;
  uint64_t v17;
  BOOL v18;
  id *v19;
  id v20;
  uint64_t v21;
  id *v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27[2];
  uint64_t v28;
  char v29;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 < 1)
  {
    v11 = 0;
LABEL_17:
    -[HAPCharacteristicValueLinearTransition setTransitionPoints:](self, "setTransitionPoints:", v9, v23);
    -[HAPCharacteristicValueLinearTransition setStartBehavior:](self, "setStartBehavior:", v11);
    v10 = 0;
    v18 = 1;
    goto LABEL_25;
  }
  v23 = a4;
  v10 = 0;
  v11 = 0;
  v12 = v7 + v8;
  while (1)
  {
    v29 = 0;
    v27[1] = 0;
    v28 = 0;
    v27[0] = 0;
    Next = TLV8GetNext();
    if ((_DWORD)Next)
      break;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v21;
      if (!v21)
        goto LABEL_17;
LABEL_21:
      v19 = v23;
      if (v23)
      {
        v20 = objc_retainAutorelease(v10);
        v10 = v20;
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    if (v29 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      +[HAPCharacteristicValueTransitionLinearStartConditionWrapper parsedFromData:error:](HAPCharacteristicValueTransitionLinearStartConditionWrapper, "parsedFromData:error:", v14, &v24);
      v17 = objc_claimAutoreleasedReturnValue();
      v15 = v24;

      v16 = v11;
      v11 = (void *)v17;
      goto LABEL_11;
    }
    if (v29 == 1)
    {
      v26 = v10;
      HAPTLVParseContiguousTlvs(1, v7, v12, v27, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;

      if (!v15)
      {
        v25 = 0;
        +[HAPCharacteristicValueTransitionPoint parsedFromData:error:](HAPCharacteristicValueTransitionPoint, "parsedFromData:error:", v14, &v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v25;
        if (!v15)
          objc_msgSend(v9, "addObject:", v16);
LABEL_11:

      }
      v10 = v15;
    }
    v7 = v27[0];
    if (v27[0] >= v12)
    {
      if (!v10)
        goto LABEL_17;
      goto LABEL_21;
    }
  }
  v19 = v23;
  if (v23)
  {
    HMErrorFromOSStatus(Next);
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v18 = 0;
    *v19 = v20;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id *v28;
  HAPCharacteristicValueLinearTransition *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
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
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  TLV8BufferInit();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = self;
  -[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v9 = 1;
    v28 = a3;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        v12 = TLV8BufferAppend();
        if ((_DWORD)v12)
          break;
      }
      v31 = 0;
      objc_msgSend(v11, "serializeWithError:", &v31, v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v31;
      if (v14)
      {
        v22 = v14;

        a3 = v28;
        goto LABEL_19;
      }
      v15 = objc_retainAutorelease(v13);
      v16 = objc_msgSend(v15, "bytes");
      v17 = v16 + objc_msgSend(v15, "length");
      do
      {
        if ((uint64_t)(v17 - v16) >= 255)
          v18 = 255;
        else
          v18 = v17 - v16;
        v19 = TLV8BufferAppend();
        if ((_DWORD)v19)
        {
          v24 = v19;

          goto LABEL_22;
        }
        v16 += v18;
      }
      while (v16 < v17);

      v9 = 0;
      if (++v10 != v7)
        goto LABEL_4;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v9 = 0;
      a3 = v28;
      if (!v7)
        goto LABEL_17;
    }
    v24 = v12;
LABEL_22:

    a3 = v28;
    goto LABEL_23;
  }
LABEL_17:

  -[HAPCharacteristicValueLinearTransition startBehavior](v29, "startBehavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v37);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    goto LABEL_30;
  }
  -[HAPCharacteristicValueLinearTransition startBehavior](v29, "startBehavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v21, "serializeWithError:", &v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v30;

  if (!v22)
  {
    v26 = objc_retainAutorelease(v5);
    objc_msgSend(v26, "bytes");
    objc_msgSend(v26, "length");
    v24 = TLV8BufferAppend();

    if ((_DWORD)v24)
    {
LABEL_23:
      if (a3)
      {
        HMErrorFromOSStatus(v24);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        goto LABEL_25;
      }
      v22 = 0;
LABEL_27:
      v25 = 0;
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_19:

  if (!a3)
    goto LABEL_27;
  v23 = objc_retainAutorelease(v22);
  v22 = v23;
LABEL_25:
  v25 = 0;
  *a3 = v23;
LABEL_30:
  TLV8BufferFree();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueLinearTransition *v4;
  void *v5;
  void *v6;
  HAPCharacteristicValueLinearTransition *v7;

  v4 = +[HAPCharacteristicValueLinearTransition allocWithZone:](HAPCharacteristicValueLinearTransition, "allocWithZone:", a3);
  -[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPCharacteristicValueLinearTransition initWithTransitionPoints:startBehavior:](v4, "initWithTransitionPoints:startBehavior:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPCharacteristicValueLinearTransition *v5;
  HAPCharacteristicValueLinearTransition *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HAPCharacteristicValueLinearTransition *)a3;
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
      -[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearTransition transitionPoints](v6, "transitionPoints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearTransition transitionPoints](v6, "transitionPoints");
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
      -[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearTransition startBehavior](v6, "startBehavior");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearTransition startBehavior](v6, "startBehavior");
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
  -[HAPCharacteristicValueLinearTransition transitionPoints](self, "transitionPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearTransition startBehavior](self, "startBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPCharacteristicValueLinearTransition transitionPoints=%@, startBehavior=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPoints, a3);
}

- (HAPCharacteristicValueTransitionLinearStartConditionWrapper)startBehavior
{
  return self->_startBehavior;
}

- (void)setStartBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_startBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startBehavior, 0);
  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueLinearTransition *v6;
  HAPCharacteristicValueLinearTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueLinearTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
