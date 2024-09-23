@implementation HAPCharacteristicValueLinearDerivedTransitionPoint

- (HAPCharacteristicValueLinearDerivedTransitionPoint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueLinearDerivedTransitionPoint;
  return -[HAPCharacteristicValueLinearDerivedTransitionPoint init](&v3, sel_init);
}

- (HAPCharacteristicValueLinearDerivedTransitionPoint)initWithScale:(id)a3 offset:(id)a4 targetCompletionDuration:(id)a5 startDelayDuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v15;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HAPCharacteristicValueLinearDerivedTransitionPoint;
  v15 = -[HAPCharacteristicValueLinearDerivedTransitionPoint init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_scale, a3);
    objc_storeStrong((id *)&v16->_offset, a4);
    objc_storeStrong((id *)&v16->_targetCompletionDuration, a5);
    objc_storeStrong((id *)&v16->_startDelayDuration, a6);
  }

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t Next;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v23;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (v8 < 1)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
LABEL_20:
    -[HAPCharacteristicValueLinearDerivedTransitionPoint setScale:](self, "setScale:", v13);
    -[HAPCharacteristicValueLinearDerivedTransitionPoint setOffset:](self, "setOffset:", v12);
    -[HAPCharacteristicValueLinearDerivedTransitionPoint setTargetCompletionDuration:](self, "setTargetCompletionDuration:", v11);
    -[HAPCharacteristicValueLinearDerivedTransitionPoint setStartDelayDuration:](self, "setStartDelayDuration:", v10);
    v9 = 0;
    v20 = 1;
  }
  else
  {
    v23 = self;
    v24 = a4;
    v25 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = v7 + v8;
    while (1)
    {
      v33 = 0;
      v31 = 0;
      v32 = 0;
      v30 = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v21 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v21;
        if (v21)
          goto LABEL_13;
        goto LABEL_19;
      }
      switch(v33)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9;
          v17 = &v29;
          +[HAPTLVFloatNumberValue parsedFromData:error:](HAPTLVFloatNumberValue, "parsedFromData:error:", v16, &v29);
          v18 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v9;
          v17 = &v28;
          +[HAPTLVFloatNumberValue parsedFromData:error:](HAPTLVFloatNumberValue, "parsedFromData:error:", v16, &v28);
          v18 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v9;
          v17 = &v27;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v16, &v27);
          v18 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 4:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v9;
          v17 = &v26;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v16, &v26);
          v18 = v10;
          v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
          v19 = *v17;

          v9 = v19;
          break;
        default:
          break;
      }
      if (v30 >= v14)
      {
        if (v9)
        {
LABEL_13:
          v6 = v25;
          if (v24)
          {
            v9 = objc_retainAutorelease(v9);
            v20 = 0;
            *v24 = v9;
          }
          else
          {
            v20 = 0;
          }
          goto LABEL_24;
        }
LABEL_19:
        v6 = v25;
        self = v23;
        goto LABEL_20;
      }
    }
    if (v24)
    {
      HMErrorFromOSStatus(Next);
      v20 = 0;
      *v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v6 = v25;
  }
LABEL_24:

  return v20;
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
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  TLV8BufferInit();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v6, "serializeWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;

    if (v8)
      goto LABEL_19;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_12;

  }
  -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_9;
  -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v12, "serializeWithError:", &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;

  if (v8)
    goto LABEL_19;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = TLV8BufferAppend();
  if ((_DWORD)v10)
  {
LABEL_12:
    v15 = v10;

    goto LABEL_13;
  }

LABEL_9:
  -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v14, "serializeWithError:", &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;

    if (v8)
      goto LABEL_19;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_12;

  }
  -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_25;
  -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v18, "serializeWithError:", &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;

  if (v8)
  {
LABEL_19:

    if (a3)
    {
      v16 = objc_retainAutorelease(v8);
      v8 = v16;
      goto LABEL_21;
    }
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v21 = objc_retainAutorelease(v7);
  objc_msgSend(v21, "bytes");
  objc_msgSend(v21, "length");
  v15 = TLV8BufferAppend();

  if (!(_DWORD)v15)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_23;
  }
LABEL_13:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_22;
  }
  HMErrorFromOSStatus(v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_21:
  v19 = 0;
  *a3 = v16;
LABEL_23:
  TLV8BufferFree();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueLinearDerivedTransitionPoint *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v9;

  v4 = +[HAPCharacteristicValueLinearDerivedTransitionPoint allocWithZone:](HAPCharacteristicValueLinearDerivedTransitionPoint, "allocWithZone:", a3);
  -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPCharacteristicValueLinearDerivedTransitionPoint initWithScale:offset:targetCompletionDuration:startDelayDuration:](v4, "initWithScale:offset:targetCompletionDuration:startDelayDuration:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v5;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v6;
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

  v5 = (HAPCharacteristicValueLinearDerivedTransitionPoint *)a3;
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
      -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](v6, "scale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](v6, "scale");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](v6, "offset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](v6, "offset");
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
      -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](v6, "targetCompletionDuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](v6, "targetCompletionDuration");
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
      -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](v6, "startDelayDuration");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](v6, "startDelayDuration");
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
  -[HAPCharacteristicValueLinearDerivedTransitionPoint scale](self, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint offset](self, "offset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint targetCompletionDuration](self, "targetCompletionDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueLinearDerivedTransitionPoint startDelayDuration](self, "startDelayDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPCharacteristicValueLinearDerivedTransitionPoint scale=%@, offset=%@, targetCompletionDuration=%@, startDelayDuration=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HAPTLVFloatNumberValue)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->_scale, a3);
}

- (HAPTLVFloatNumberValue)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_storeStrong((id *)&self->_offset, a3);
}

- (HAPTLVUnsignedNumberValue)targetCompletionDuration
{
  return self->_targetCompletionDuration;
}

- (void)setTargetCompletionDuration:(id)a3
{
  objc_storeStrong((id *)&self->_targetCompletionDuration, a3);
}

- (HAPTLVUnsignedNumberValue)startDelayDuration
{
  return self->_startDelayDuration;
}

- (void)setStartDelayDuration:(id)a3
{
  objc_storeStrong((id *)&self->_startDelayDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDelayDuration, 0);
  objc_storeStrong((id *)&self->_targetCompletionDuration, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_scale, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v6;
  HAPCharacteristicValueLinearDerivedTransitionPoint *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueLinearDerivedTransitionPoint);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueLinearDerivedTransitionPoint parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
