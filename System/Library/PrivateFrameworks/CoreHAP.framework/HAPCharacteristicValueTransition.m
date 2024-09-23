@implementation HAPCharacteristicValueTransition

- (HAPCharacteristicValueTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAPCharacteristicValueTransition;
  return -[HAPCharacteristicValueTransition init](&v3, sel_init);
}

- (HAPCharacteristicValueTransition)initWithHAPInstanceID:(id)a3 controllerContext:(id)a4 endBehavior:(id)a5 linearTransition:(id)a6 linearDerivedTransition:(id)a7 valueUpdateTimeInterval:(id)a8 notifyValueChangeThreshold:(id)a9 notifyTimeIntervalThreshold:(id)a10
{
  id v17;
  HAPCharacteristicValueTransition *v18;
  HAPCharacteristicValueTransition *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)HAPCharacteristicValueTransition;
  v18 = -[HAPCharacteristicValueTransition init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_HAPInstanceID, a3);
    objc_storeStrong((id *)&v19->_controllerContext, a4);
    objc_storeStrong((id *)&v19->_endBehavior, a5);
    objc_storeStrong((id *)&v19->_linearTransition, a6);
    objc_storeStrong((id *)&v19->_linearDerivedTransition, a7);
    objc_storeStrong((id *)&v19->_valueUpdateTimeInterval, a8);
    objc_storeStrong((id *)&v19->_notifyValueChangeThreshold, a9);
    objc_storeStrong((id *)&v19->_notifyTimeIntervalThreshold, a10);
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
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  unint64_t v57[2];
  uint64_t v58;
  char v59;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  if (v7 < 1)
  {
    v25 = 0;
    v26 = 0;
    v9 = 0;
    v10 = 0;
    v28 = 0;
    v11 = 0;
    v29 = 0;
    v30 = 0;
LABEL_29:
    -[HAPCharacteristicValueTransition setHAPInstanceID:](self, "setHAPInstanceID:", v25, v38);
    -[HAPCharacteristicValueTransition setControllerContext:](self, "setControllerContext:", v26);
    -[HAPCharacteristicValueTransition setEndBehavior:](self, "setEndBehavior:", v9);
    -[HAPCharacteristicValueTransition setLinearTransition:](self, "setLinearTransition:", v30);
    -[HAPCharacteristicValueTransition setLinearDerivedTransition:](self, "setLinearDerivedTransition:", v29);
    -[HAPCharacteristicValueTransition setValueUpdateTimeInterval:](self, "setValueUpdateTimeInterval:", v11);
    -[HAPCharacteristicValueTransition setNotifyValueChangeThreshold:](self, "setNotifyValueChangeThreshold:", v28);
    -[HAPCharacteristicValueTransition setNotifyTimeIntervalThreshold:](self, "setNotifyTimeIntervalThreshold:", v10);
    v32 = v29;
    v33 = v10;
    v34 = v9;
    v35 = v28;
    v8 = 0;
    v36 = v30;
    v27 = 1;
  }
  else
  {
    v38 = v5;
    v8 = 0;
    v43 = 0;
    v44 = 0;
    v9 = 0;
    v10 = 0;
    v40 = 0;
    v41 = 0;
    v11 = 0;
    v42 = 0;
    v12 = v6 + v7;
    while (1)
    {
      v59 = 0;
      v57[1] = 0;
      v58 = 0;
      v57[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
        break;
      if (!v58)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
        v31 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v31;
        if (v31)
          goto LABEL_22;
        goto LABEL_28;
      }
      switch(v59)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v56);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v56;

          v17 = v44;
          v44 = (void *)v15;
          break;
        case 2:
          v55 = v8;
          HAPTLVParseContiguousTlvs(2, v6, v12, v57, &v55);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v55;

          if (v16)
            goto LABEL_19;
          v54 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v54);
          v18 = objc_claimAutoreleasedReturnValue();
          v16 = v54;
          v17 = v43;
          v43 = (void *)v18;
          break;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v8;
          +[HAPCharacteristicValueTransitionEndBehaviorWrapper parsedFromData:error:](HAPCharacteristicValueTransitionEndBehaviorWrapper, "parsedFromData:error:", v14, &v53);
          v19 = objc_claimAutoreleasedReturnValue();
          v16 = v53;

          v17 = v9;
          v9 = (void *)v19;
          break;
        case 4:
          v52 = v8;
          HAPTLVParseContiguousTlvs(4, v6, v12, v57, &v52);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v52;

          if (v16)
            goto LABEL_19;
          v51 = 0;
          +[HAPCharacteristicValueLinearTransition parsedFromData:error:](HAPCharacteristicValueLinearTransition, "parsedFromData:error:", v14, &v51);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v51;
          v17 = v42;
          v42 = (void *)v20;
          break;
        case 5:
          v50 = v8;
          HAPTLVParseContiguousTlvs(5, v6, v12, v57, &v50);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v50;

          if (v16)
            goto LABEL_19;
          v49 = 0;
          +[HAPCharacteristicValueLinearDerivedTransition parsedFromData:error:](HAPCharacteristicValueLinearDerivedTransition, "parsedFromData:error:", v14, &v49);
          v21 = objc_claimAutoreleasedReturnValue();
          v16 = v49;
          v17 = v41;
          v41 = (void *)v21;
          break;
        case 6:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v48);
          v22 = objc_claimAutoreleasedReturnValue();
          v16 = v48;

          v17 = v11;
          v11 = (void *)v22;
          break;
        case 7:
          v47 = v8;
          HAPTLVParseContiguousTlvs(7, v6, v12, v57, &v47);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v47;

          if (v16)
            goto LABEL_19;
          v46 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v46);
          v23 = objc_claimAutoreleasedReturnValue();
          v16 = v46;
          v17 = v40;
          v40 = (void *)v23;
          break;
        case 8:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v8;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v45);
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v45;

          v17 = v10;
          v10 = (void *)v24;
          break;
        default:
          goto LABEL_20;
      }

LABEL_19:
      v8 = v16;
LABEL_20:
      v6 = v57[0];
      if (v57[0] >= v12)
      {
        if (v8)
        {
LABEL_22:
          v26 = v43;
          v25 = v44;
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
          goto LABEL_33;
        }
LABEL_28:
        v26 = v43;
        v25 = v44;
        v29 = v41;
        v30 = v42;
        v28 = v40;
        goto LABEL_29;
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
    v26 = v43;
    v25 = v44;
LABEL_33:
    v32 = v41;
    v36 = v42;
    v33 = v10;
    v34 = v9;
    v35 = v40;
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
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
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
  -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v6, "serializeWithError:", &v49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v49;

    if (v8)
      goto LABEL_55;
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
  -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v14, "serializeWithError:", &v48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v48;

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
    goto LABEL_55;
  }
LABEL_18:
  -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v19, "serializeWithError:", &v47);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v47;

    if (v8)
      goto LABEL_55;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v21, "serializeWithError:", &v46);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v46;

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
    goto LABEL_55;
  }
LABEL_31:
  -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v26, "serializeWithError:", &v45);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v45;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v27 = objc_msgSend(v9, "bytes");
      v28 = v27 + objc_msgSend(v9, "length");
      while (1)
      {
        v29 = (uint64_t)(v28 - v27) >= 255 ? 255 : v28 - v27;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v27 += v29;
        if (v27 >= v28)
        {

          goto LABEL_40;
        }
      }
    }
    goto LABEL_55;
  }
LABEL_40:
  -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v31, "serializeWithError:", &v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v44;

    if (v8)
      goto LABEL_55;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v33, "serializeWithError:", &v43);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v43;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v34 = objc_msgSend(v9, "bytes");
      v35 = v34 + objc_msgSend(v9, "length");
      while (1)
      {
        v36 = (uint64_t)(v35 - v34) >= 255 ? 255 : v35 - v34;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v34 += v36;
        if (v34 >= v35)
        {

          goto LABEL_53;
        }
      }
    }
LABEL_55:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_57;
    }
LABEL_58:
    v39 = 0;
    goto LABEL_59;
  }
LABEL_53:
  -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
    goto LABEL_61;
  -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v38, "serializeWithError:", &v42);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v42;

  if (v8)
    goto LABEL_55;
  v41 = objc_retainAutorelease(v7);
  objc_msgSend(v41, "bytes");
  objc_msgSend(v41, "length");
  v11 = TLV8BufferAppend();

  if (!(_DWORD)v11)
  {
LABEL_61:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_59;
  }
LABEL_5:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_58;
  }
  HMErrorFromOSStatus(v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_57:
  v39 = 0;
  *a3 = v12;
LABEL_59:
  TLV8BufferFree();

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPCharacteristicValueTransition *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HAPCharacteristicValueTransition *v13;

  v4 = +[HAPCharacteristicValueTransition allocWithZone:](HAPCharacteristicValueTransition, "allocWithZone:", a3);
  -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HAPCharacteristicValueTransition initWithHAPInstanceID:controllerContext:endBehavior:linearTransition:linearDerivedTransition:valueUpdateTimeInterval:notifyValueChangeThreshold:notifyTimeIntervalThreshold:](v4, "initWithHAPInstanceID:controllerContext:endBehavior:linearTransition:linearDerivedTransition:valueUpdateTimeInterval:notifyValueChangeThreshold:notifyTimeIntervalThreshold:", v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HAPCharacteristicValueTransition *v5;
  HAPCharacteristicValueTransition *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v5 = (HAPCharacteristicValueTransition *)a3;
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
      -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition HAPInstanceID](v6, "HAPInstanceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition HAPInstanceID](v6, "HAPInstanceID");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_43;
        }
      }
      -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition controllerContext](v6, "controllerContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition controllerContext](v6, "controllerContext");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
LABEL_41:

LABEL_42:
          if (v7 == v8)
          {
LABEL_44:

            goto LABEL_45;
          }
LABEL_43:

          goto LABEL_44;
        }
        v63 = v13;
      }
      -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition endBehavior](v6, "endBehavior");
      v15 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)v14;
      v16 = v14 == v15;
      v17 = (void *)v15;
      if (!v16)
      {
        -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition endBehavior](v6, "endBehavior");
        v61 = v18;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v10 = 0;
          v19 = v17;
          v20 = v64;
LABEL_39:

LABEL_40:
          v13 = v63;
          if (v11 == v12)
            goto LABEL_42;
          goto LABEL_41;
        }
      }
      -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
      v21 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition linearTransition](v6, "linearTransition");
      v59 = (void *)v21;
      v62 = v3;
      v58 = objc_claimAutoreleasedReturnValue();
      if (v21 != v58)
      {
        -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition linearTransition](v6, "linearTransition");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v22;
        if (!objc_msgSend(v22, "isEqual:"))
        {
          v19 = v17;
          v10 = 0;
          v23 = (void *)v58;
          v24 = v59;
LABEL_37:

LABEL_38:
          v20 = v64;
          v3 = v62;
          if (v64 == v19)
            goto LABEL_40;
          goto LABEL_39;
        }
      }
      -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
      v25 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition linearDerivedTransition](v6, "linearDerivedTransition");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v25;
      if (v25 != v54)
      {
        -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition linearDerivedTransition](v6, "linearDerivedTransition");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v26;
        if (!objc_msgSend(v26, "isEqual:"))
        {
          v19 = v17;
          v10 = 0;
          v28 = (void *)v54;
          v27 = v55;
LABEL_35:

LABEL_36:
          v23 = (void *)v58;
          v24 = v59;
          if (v59 == (void *)v58)
            goto LABEL_38;
          goto LABEL_37;
        }
      }
      -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
      v29 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition valueUpdateTimeInterval](v6, "valueUpdateTimeInterval");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v29;
      if (v29 != v52)
      {
        -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition valueUpdateTimeInterval](v6, "valueUpdateTimeInterval");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
          v19 = v17;
          v10 = 0;
          v31 = (void *)v52;
LABEL_33:

LABEL_34:
          v28 = (void *)v54;
          v27 = v55;
          if (v55 == (void *)v54)
            goto LABEL_36;
          goto LABEL_35;
        }
      }
      -[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold");
      v32 = objc_claimAutoreleasedReturnValue();
      -[HAPCharacteristicValueTransition notifyValueChangeThreshold](v6, "notifyValueChangeThreshold");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v32;
      v49 = v11;
      if (v32 == v45
        || (-[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HAPCharacteristicValueTransition notifyValueChangeThreshold](v6, "notifyValueChangeThreshold"),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = v33,
            objc_msgSend(v33, "isEqual:")))
      {
        -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold", v17);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](v6, "notifyTimeIntervalThreshold");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v34 == (void *)v35)
        {

          v10 = 1;
        }
        else
        {
          v36 = (void *)v35;
          -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](v6, "notifyTimeIntervalThreshold");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v37, "isEqual:", v38);

        }
        v39 = (void *)v45;
        v40 = v46;
        v19 = v42;
        if (v46 == (void *)v45)
        {
LABEL_32:

          v31 = (void *)v52;
          v11 = v49;
          if (v53 == (void *)v52)
            goto LABEL_34;
          goto LABEL_33;
        }
      }
      else
      {
        v19 = v17;
        v10 = 0;
        v39 = (void *)v45;
        v40 = v46;
      }

      goto LABEL_32;
    }
    v10 = 0;
  }
LABEL_45:

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
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPCharacteristicValueTransition HAPInstanceID](self, "HAPInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition controllerContext](self, "controllerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition endBehavior](self, "endBehavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition linearTransition](self, "linearTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition linearDerivedTransition](self, "linearDerivedTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition valueUpdateTimeInterval](self, "valueUpdateTimeInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition notifyValueChangeThreshold](self, "notifyValueChangeThreshold");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPCharacteristicValueTransition notifyTimeIntervalThreshold](self, "notifyTimeIntervalThreshold");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAPCharacteristicValueTransition HAPInstanceID=%@, controllerContext=%@, endBehavior=%@, linearTransition=%@, linearDerivedTransition=%@, valueUpdateTimeInterval=%@, notifyValueChangeThreshold=%@, notifyTimeIntervalThreshold=%@>"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (HAPTLVUnsignedNumberValue)HAPInstanceID
{
  return self->_HAPInstanceID;
}

- (void)setHAPInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_HAPInstanceID, a3);
}

- (NSData)controllerContext
{
  return self->_controllerContext;
}

- (void)setControllerContext:(id)a3
{
  objc_storeStrong((id *)&self->_controllerContext, a3);
}

- (HAPCharacteristicValueTransitionEndBehaviorWrapper)endBehavior
{
  return self->_endBehavior;
}

- (void)setEndBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_endBehavior, a3);
}

- (HAPCharacteristicValueLinearTransition)linearTransition
{
  return self->_linearTransition;
}

- (void)setLinearTransition:(id)a3
{
  objc_storeStrong((id *)&self->_linearTransition, a3);
}

- (HAPCharacteristicValueLinearDerivedTransition)linearDerivedTransition
{
  return self->_linearDerivedTransition;
}

- (void)setLinearDerivedTransition:(id)a3
{
  objc_storeStrong((id *)&self->_linearDerivedTransition, a3);
}

- (HAPTLVUnsignedNumberValue)valueUpdateTimeInterval
{
  return self->_valueUpdateTimeInterval;
}

- (void)setValueUpdateTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_valueUpdateTimeInterval, a3);
}

- (NSData)notifyValueChangeThreshold
{
  return self->_notifyValueChangeThreshold;
}

- (void)setNotifyValueChangeThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_notifyValueChangeThreshold, a3);
}

- (HAPTLVUnsignedNumberValue)notifyTimeIntervalThreshold
{
  return self->_notifyTimeIntervalThreshold;
}

- (void)setNotifyTimeIntervalThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_notifyTimeIntervalThreshold, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_notifyValueChangeThreshold, 0);
  objc_storeStrong((id *)&self->_valueUpdateTimeInterval, 0);
  objc_storeStrong((id *)&self->_linearDerivedTransition, 0);
  objc_storeStrong((id *)&self->_linearTransition, 0);
  objc_storeStrong((id *)&self->_endBehavior, 0);
  objc_storeStrong((id *)&self->_controllerContext, 0);
  objc_storeStrong((id *)&self->_HAPInstanceID, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAPCharacteristicValueTransition *v6;
  HAPCharacteristicValueTransition *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAPCharacteristicValueTransition);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAPCharacteristicValueTransition parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
