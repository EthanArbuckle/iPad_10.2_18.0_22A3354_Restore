@implementation HAPCharacteristicValueLinearDerivedTransition

- (HAPCharacteristicValueLinearDerivedTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  return -[HAPCharacteristicValueLinearDerivedTransition init](&v3, sel_init);
}

- (HAPCharacteristicValueLinearDerivedTransition)initWithTransitionPoints:(id)a3 sourceHAPInstanceID:(id)a4 sourceValueRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPCharacteristicValueLinearDerivedTransition *v11;
  uint64_t v12;
  NSMutableArray *transitionPoints;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HAPCharacteristicValueLinearDerivedTransition;
  v11 = -[HAPCharacteristicValueLinearDerivedTransition init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "mutableCopy");
    transitionPoints = v11->_transitionPoints;
    v11->_transitionPoints = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v11->_sourceHAPInstanceID, a4);
    objc_storeStrong((id *)&v11->_sourceValueRange, a5);
  }

  return v11;
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
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30[2];
  uint64_t v31;
  char v32;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 1)
  {
    v10 = 0;
    v11 = 0;
LABEL_20:
    -[HAPCharacteristicValueLinearDerivedTransition setTransitionPoints:](self, "setTransitionPoints:", v8, a4);
    -[HAPCharacteristicValueLinearDerivedTransition setSourceHAPInstanceID:](self, "setSourceHAPInstanceID:", v11);
    -[HAPCharacteristicValueLinearDerivedTransition setSourceValueRange:](self, "setSourceValueRange:", v10);
    v9 = 0;
    v19 = 1;
    goto LABEL_28;
  }
  v9 = 0;
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

      v9 = (void *)v22;
      if (!v22)
        goto LABEL_20;
LABEL_24:
      v20 = a4;
      if (a4)
      {
        v21 = objc_retainAutorelease(v9);
        v9 = v21;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    switch(v32)
    {
      case 3:
        v26 = v9;
        HAPTLVParseContiguousTlvs(3, v6, v12, v30, &v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v26;

        if (!v15)
        {
          v25 = 0;
          +[HAPCharacteristicValueRange parsedFromData:error:](HAPCharacteristicValueRange, "parsedFromData:error:", v14, &v25);
          v17 = objc_claimAutoreleasedReturnValue();
          v15 = v25;
          v16 = v10;
          v10 = (void *)v17;
          goto LABEL_14;
        }
LABEL_15:

        v9 = v15;
        break;
      case 2:
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v9;
        +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v27);
        v18 = objc_claimAutoreleasedReturnValue();
        v15 = v27;

        v16 = v11;
        v11 = (void *)v18;
        goto LABEL_14;
      case 1:
        v29 = v9;
        HAPTLVParseContiguousTlvs(1, v6, v12, v30, &v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v29;

        if (v15)
          goto LABEL_15;
        v28 = 0;
        +[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:error:](HAPCharacteristicValueLinearDerivedTransitionPoint, "parsedFromData:error:", v14, &v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v28;
        if (!v15)
          objc_msgSend(v8, "addObject:", v16);
LABEL_14:

        goto LABEL_15;
    }
    v6 = v30[0];
    if (v30[0] >= v12)
    {
      if (!v9)
        goto LABEL_20;
      goto LABEL_24;
    }
  }
  v20 = a4;
  if (a4)
  {
    HMErrorFromOSStatus(Next);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    v19 = 0;
    *v20 = v21;
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
LABEL_28:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  id v5;
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
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  id *v38;
  HAPCharacteristicValueLinearDerivedTransition *v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
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
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  TLV8BufferInit();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v39 = self;
  -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    v9 = 1;
    v38 = a3;
    while (1)
    {
      v10 = 0;
LABEL_4:
      if (*(_QWORD *)v44 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
      if ((v9 & 1) == 0)
      {
        v12 = TLV8BufferAppend();
        if ((_DWORD)v12)
          break;
      }
      v42 = 0;
      objc_msgSend(v11, "serializeWithError:", &v42);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v42;
      if (v14)
      {
        v22 = v14;

        a3 = v38;
        goto LABEL_31;
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
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v9 = 0;
      a3 = v38;
      if (!v7)
        goto LABEL_17;
    }
    v24 = v12;
LABEL_22:
    a3 = v38;
    goto LABEL_23;
  }
LABEL_17:

  -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v39, "sourceHAPInstanceID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v39, "sourceHAPInstanceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    objc_msgSend(v21, "serializeWithError:", &v41);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v41;

    if (v22)
      goto LABEL_31;
    v5 = objc_retainAutorelease(v5);
    objc_msgSend(v5, "bytes");
    objc_msgSend(v5, "length");
    v23 = TLV8BufferAppend();
    if ((_DWORD)v23)
    {
      v24 = v23;
LABEL_23:

      goto LABEL_24;
    }

  }
  -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v39, "sourceValueRange");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    goto LABEL_49;
  -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v39, "sourceValueRange");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v27, "serializeWithError:", &v40);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v22 = v40;

  if (v22)
  {
LABEL_31:

    if (a3)
    {
      v25 = objc_retainAutorelease(v22);
      v22 = v25;
      goto LABEL_33;
    }
LABEL_34:
    v28 = 0;
    goto LABEL_35;
  }
  v30 = a3;
  v31 = objc_retainAutorelease(v5);
  v32 = objc_msgSend(v31, "bytes");
  v33 = v32 + objc_msgSend(v31, "length");
  do
  {
    if ((uint64_t)(v33 - v32) >= 255)
      v34 = 255;
    else
      v34 = v33 - v32;
    v35 = TLV8BufferAppend();
    if ((_DWORD)v35)
      v36 = 0;
    else
      v36 = v34;
    v32 += v36;
    if ((_DWORD)v35)
      v37 = 1;
    else
      v37 = v32 >= v33;
  }
  while (!v37);
  v24 = v35;

  a3 = v30;
  if (!(_DWORD)v24)
  {
LABEL_49:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v48);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    goto LABEL_35;
  }
LABEL_24:
  if (!a3)
  {
    v22 = 0;
    goto LABEL_34;
  }
  HMErrorFromOSStatus(v24);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
LABEL_33:
  v28 = 0;
  *a3 = v25;
LABEL_35:
  TLV8BufferFree();

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueLinearDerivedTransition *v4;
  void *v5;
  void *v6;
  void *v7;
  HAPCharacteristicValueLinearDerivedTransition *v8;

  v4 = +[HAPCharacteristicValueLinearDerivedTransition allocWithZone:](HAPCharacteristicValueLinearDerivedTransition, "allocWithZone:", a3);
  -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HAPCharacteristicValueLinearDerivedTransition initWithTransitionPoints:sourceHAPInstanceID:sourceValueRange:](v4, "initWithTransitionPoints:sourceHAPInstanceID:sourceValueRange:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HAPCharacteristicValueLinearDerivedTransition *v6;
  HAPCharacteristicValueLinearDerivedTransition *v7;
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

  v6 = (HAPCharacteristicValueLinearDerivedTransition *)a3;
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
      -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](v7, "transitionPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](v7, "transitionPoints");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v7, "sourceHAPInstanceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](v7, "sourceHAPInstanceID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v7, "sourceValueRange");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](v7, "sourceValueRange");
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
  -[HAPCharacteristicValueLinearDerivedTransition transitionPoints](self, "transitionPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransition sourceHAPInstanceID](self, "sourceHAPInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransition sourceValueRange](self, "sourceValueRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPCharacteristicValueLinearDerivedTransition transitionPoints=%@, sourceHAPInstanceID=%@, sourceValueRange=%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSMutableArray)transitionPoints
{
  return self->_transitionPoints;
}

- (void)setTransitionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_transitionPoints, a3);
}

- (HAPTLVUnsignedNumberValue)sourceHAPInstanceID
{
  return self->_sourceHAPInstanceID;
}

- (void)setSourceHAPInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, a3);
}

- (HAPCharacteristicValueRange)sourceValueRange
{
  return self->_sourceValueRange;
}

- (void)setSourceValueRange:(id)a3
{
  objc_storeStrong((id *)&self->_sourceValueRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceValueRange, 0);
  objc_storeStrong((id *)&self->_sourceHAPInstanceID, 0);
  objc_storeStrong((id *)&self->_transitionPoints, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueLinearDerivedTransition *v6;
  HAPCharacteristicValueLinearDerivedTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearDerivedTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueLinearDerivedTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
