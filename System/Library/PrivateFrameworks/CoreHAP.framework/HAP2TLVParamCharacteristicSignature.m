@implementation HAP2TLVParamCharacteristicSignature

- (HAP2TLVParamCharacteristicSignature)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HAP2TLVParamCharacteristicSignature;
  return -[HAP2TLVParamCharacteristicSignature init](&v3, sel_init);
}

- (HAP2TLVParamCharacteristicSignature)initWithInstanceID:(id)a3 characteristicType:(id)a4 characteristicProperties:(id)a5 userDescription:(id)a6 bluetoothFormat:(id)a7 validRange:(id)a8 stepValue:(id)a9 validValues:(id)a10 validValuesRange:(id)a11
{
  id v18;
  HAP2TLVParamCharacteristicSignature *v19;
  HAP2TLVParamCharacteristicSignature *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HAP2TLVParamCharacteristicSignature;
  v19 = -[HAP2TLVParamCharacteristicSignature init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_instanceID, a3);
    objc_storeStrong((id *)&v20->_characteristicType, a4);
    objc_storeStrong((id *)&v20->_characteristicProperties, a5);
    objc_storeStrong((id *)&v20->_userDescription, a6);
    objc_storeStrong((id *)&v20->_bluetoothFormat, a7);
    objc_storeStrong((id *)&v20->_validRange, a8);
    objc_storeStrong((id *)&v20->_stepValue, a9);
    objc_storeStrong((id *)&v20->_validValues, a10);
    objc_storeStrong((id *)&v20->_validValuesRange, a11);
  }

  return v20;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t Next;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  unint64_t v65[2];
  uint64_t v66;
  char v67;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  v48 = v6;
  if (v8 < 1)
  {
    v10 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
LABEL_34:
    -[HAP2TLVParamCharacteristicSignature setInstanceID:](self, "setInstanceID:", v10, v40);
    -[HAP2TLVParamCharacteristicSignature setCharacteristicType:](self, "setCharacteristicType:", v26);
    -[HAP2TLVParamCharacteristicSignature setCharacteristicProperties:](self, "setCharacteristicProperties:", v27);
    -[HAP2TLVParamCharacteristicSignature setUserDescription:](self, "setUserDescription:", v28);
    -[HAP2TLVParamCharacteristicSignature setBluetoothFormat:](self, "setBluetoothFormat:", v33);
    -[HAP2TLVParamCharacteristicSignature setValidRange:](self, "setValidRange:", v32);
    -[HAP2TLVParamCharacteristicSignature setStepValue:](self, "setStepValue:", v31);
    -[HAP2TLVParamCharacteristicSignature setValidValues:](self, "setValidValues:", v30);
    -[HAP2TLVParamCharacteristicSignature setValidValuesRange:](self, "setValidValuesRange:", v29);
    v37 = v29;
    v36 = v10;
    v38 = v30;
    v9 = 0;
    v34 = 1;
  }
  else
  {
    v40 = a4;
    v41 = 0;
    v9 = 0;
    v10 = 0;
    v46 = 0;
    v47 = 0;
    v11 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v12 = v7 + v8;
    while (1)
    {
      v67 = 0;
      v65[1] = 0;
      v66 = 0;
      v65[0] = 0;
      Next = TLV8GetNext();
      if ((_DWORD)Next)
      {
        if (v40)
        {
          HMErrorFromOSStatus(Next);
          v34 = 0;
          *v40 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = 0;
        }
        v28 = v46;
        v26 = v47;
        v32 = v44;
        v33 = v45;
        v31 = v43;
        v27 = v11;
        v36 = v10;
        goto LABEL_38;
      }
      if (!v66)
        break;
      switch(v67)
      {
        case 4:
          v63 = v9;
          HAPTLVParseContiguousTlvs(4, v7, v12, v65, &v63);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v63;

          if (v15)
            goto LABEL_23;
          v62 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v62);
          v16 = objc_claimAutoreleasedReturnValue();
          v15 = v62;
          v17 = v47;
          v47 = (void *)v16;
          break;
        case 5:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v9;
          +[HAPTLVUnsignedNumberValue parsedFromData:error:](HAPTLVUnsignedNumberValue, "parsedFromData:error:", v14, &v64);
          v18 = objc_claimAutoreleasedReturnValue();
          v15 = v64;

          v17 = v10;
          v10 = (void *)v18;
          break;
        case 10:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v9;
          +[HAP2TLVCharacteristicPropertiesWrapper parsedFromData:error:](HAP2TLVCharacteristicPropertiesWrapper, "parsedFromData:error:", v14, &v61);
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v61;

          v17 = v11;
          v11 = (void *)v19;
          break;
        case 11:
          v60 = v9;
          HAPTLVParseContiguousTlvs(11, v7, v12, v65, &v60);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v60;

          if (v15)
            goto LABEL_23;
          v59 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "parsedFromData:error:", v14, &v59);
          v20 = objc_claimAutoreleasedReturnValue();
          v15 = v59;
          v17 = v46;
          v46 = (void *)v20;
          break;
        case 12:
          v58 = v9;
          HAPTLVParseContiguousTlvs(12, v7, v12, v65, &v58);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v58;

          if (v15)
            goto LABEL_23;
          v57 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v57);
          v21 = objc_claimAutoreleasedReturnValue();
          v15 = v57;
          v17 = v45;
          v45 = (void *)v21;
          break;
        case 13:
          v56 = v9;
          HAPTLVParseContiguousTlvs(13, v7, v12, v65, &v56);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v56;

          if (v15)
            goto LABEL_23;
          v55 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v55);
          v22 = objc_claimAutoreleasedReturnValue();
          v15 = v55;
          v17 = v44;
          v44 = (void *)v22;
          break;
        case 14:
          v54 = v9;
          HAPTLVParseContiguousTlvs(14, v7, v12, v65, &v54);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v54;

          if (v15)
            goto LABEL_23;
          v53 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v53);
          v23 = objc_claimAutoreleasedReturnValue();
          v15 = v53;
          v17 = v43;
          v43 = (void *)v23;
          break;
        case 17:
          v52 = v9;
          HAPTLVParseContiguousTlvs(17, v7, v12, v65, &v52);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v52;

          if (v15)
            goto LABEL_23;
          v51 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v51);
          v24 = objc_claimAutoreleasedReturnValue();
          v15 = v51;
          v17 = v42;
          v42 = (void *)v24;
          break;
        case 18:
          v50 = v9;
          HAPTLVParseContiguousTlvs(18, v7, v12, v65, &v50);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v50;

          if (v15)
            goto LABEL_23;
          v49 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "parsedFromData:error:", v14, &v49);
          v25 = objc_claimAutoreleasedReturnValue();
          v15 = v49;
          v17 = v41;
          v41 = (void *)v25;
          break;
        default:
          goto LABEL_24;
      }

LABEL_23:
      v9 = v15;
LABEL_24:
      v7 = v65[0];
      if (v65[0] >= v12)
        goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
    v35 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v35;
LABEL_30:
    v27 = v11;
    if (!v9)
    {
      v28 = v46;
      v26 = v47;
      v32 = v44;
      v33 = v45;
      v30 = v42;
      v31 = v43;
      v29 = v41;
      goto LABEL_34;
    }
    v36 = v10;
    v28 = v46;
    v26 = v47;
    v32 = v44;
    v33 = v45;
    v31 = v43;
    if (v40)
    {
      v9 = objc_retainAutorelease(v9);
      v34 = 0;
      *v40 = v9;
    }
    else
    {
      v34 = 0;
    }
LABEL_38:
    v37 = v41;
    v38 = v42;
  }

  return v34;
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
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v69 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  TLV8BufferInit();
  -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v6, "serializeWithError:", &v64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v64;

    if (v8)
      goto LABEL_69;
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
  -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    objc_msgSend(v14, "serializeWithError:", &v63);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v63;

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
    goto LABEL_69;
  }
LABEL_18:
  -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(v19, "serializeWithError:", &v62);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v62;

    if (v8)
      goto LABEL_69;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();
    if ((_DWORD)v10)
      goto LABEL_4;

  }
  -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v21, "serializeWithError:", &v61);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v61;

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
    goto LABEL_69;
  }
LABEL_31:
  -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v26, "serializeWithError:", &v60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v60;

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
    goto LABEL_69;
  }
LABEL_40:
  -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v31, "serializeWithError:", &v59);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v59;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v32 = objc_msgSend(v9, "bytes");
      v33 = v32 + objc_msgSend(v9, "length");
      while (1)
      {
        v34 = (uint64_t)(v33 - v32) >= 255 ? 255 : v33 - v32;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v32 += v34;
        if (v32 >= v33)
        {

          goto LABEL_49;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_49:
  -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v36, "serializeWithError:", &v58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v58;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v37 = objc_msgSend(v9, "bytes");
      v38 = v37 + objc_msgSend(v9, "length");
      while (1)
      {
        v39 = (uint64_t)(v38 - v37) >= 255 ? 255 : v38 - v37;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v37 += v39;
        if (v37 >= v38)
        {

          goto LABEL_58;
        }
      }
    }
    goto LABEL_69;
  }
LABEL_58:
  -[HAP2TLVParamCharacteristicSignature validValues](self, "validValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[HAP2TLVParamCharacteristicSignature validValues](self, "validValues");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v41, "serializeWithError:", &v57);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v57;

    if (!v8)
    {
      v9 = objc_retainAutorelease(v7);
      v42 = objc_msgSend(v9, "bytes");
      v43 = v42 + objc_msgSend(v9, "length");
      while (1)
      {
        v44 = (uint64_t)(v43 - v42) >= 255 ? 255 : v43 - v42;
        v10 = TLV8BufferAppend();
        if ((_DWORD)v10)
          goto LABEL_4;
        v42 += v44;
        if (v42 >= v43)
        {

          goto LABEL_67;
        }
      }
    }
LABEL_69:

    if (a3)
    {
      v12 = objc_retainAutorelease(v8);
      v8 = v12;
      goto LABEL_71;
    }
LABEL_72:
    v47 = 0;
    goto LABEL_73;
  }
LABEL_67:
  -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_87;
  -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v46, "serializeWithError:", &v56);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v56;

  if (v8)
    goto LABEL_69;
  v49 = objc_retainAutorelease(v7);
  v50 = objc_msgSend(v49, "bytes");
  v51 = v50 + objc_msgSend(v49, "length");
  do
  {
    if ((uint64_t)(v51 - v50) >= 255)
      v52 = 255;
    else
      v52 = v51 - v50;
    v53 = TLV8BufferAppend();
    if ((_DWORD)v53)
      v54 = 0;
    else
      v54 = v52;
    v50 += v54;
    if ((_DWORD)v53)
      v55 = 1;
    else
      v55 = v50 >= v51;
  }
  while (!v55);
  v11 = v53;

  if (!(_DWORD)v11)
  {
LABEL_87:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v65);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_73;
  }
LABEL_5:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_72;
  }
  HMErrorFromOSStatus(v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_71:
  v47 = 0;
  *a3 = v12;
LABEL_73:
  TLV8BufferFree();

  return v47;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAP2TLVParamCharacteristicSignature *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAP2TLVParamCharacteristicSignature *v14;

  v4 = +[HAP2TLVParamCharacteristicSignature allocWithZone:](HAP2TLVParamCharacteristicSignature, "allocWithZone:", a3);
  -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validValues](self, "validValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HAP2TLVParamCharacteristicSignature initWithInstanceID:characteristicType:characteristicProperties:userDescription:bluetoothFormat:validRange:stepValue:validValues:validValuesRange:](v4, "initWithInstanceID:characteristicType:characteristicProperties:userDescription:bluetoothFormat:validRange:stepValue:validValues:validValuesRange:", v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  HAP2TLVParamCharacteristicSignature *v4;
  HAP2TLVParamCharacteristicSignature *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v4 = (HAP2TLVParamCharacteristicSignature *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature instanceID](v5, "instanceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature instanceID](v5, "instanceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v8;
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = 0;
          goto LABEL_51;
        }
        v69 = v9;
      }
      -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature characteristicType](v5, "characteristicType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature characteristicType](v5, "characteristicType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v10 = 0;
LABEL_49:

LABEL_50:
          v9 = v69;
          if (v6 == v7)
          {
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:

          goto LABEL_52;
        }
        v66 = v14;
        v67 = v13;
      }
      -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature characteristicProperties](v5, "characteristicProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v11;
      if (v15 != v16)
      {
        -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature characteristicProperties](v5, "characteristicProperties");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v17;
        if (!objc_msgSend(v17, "isEqual:", v63))
        {
          v10 = 0;
          v11 = v68;
LABEL_47:

LABEL_48:
          v14 = v66;
          v13 = v67;
          if (v11 == v12)
            goto LABEL_50;
          goto LABEL_49;
        }
      }
      -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature userDescription](v5, "userDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)v18;
      v65 = v15;
      if ((void *)v18 != v19)
      {
        -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature userDescription](v5, "userDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v20;
        if (!objc_msgSend(v20, "isEqual:"))
        {
          v10 = 0;
          v21 = v62;
LABEL_45:

LABEL_46:
          v15 = v65;
          v11 = v68;
          if (v65 == v16)
            goto LABEL_48;
          goto LABEL_47;
        }
      }
      -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
      v22 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature bluetoothFormat](v5, "bluetoothFormat");
      v61 = (void *)v22;
      v58 = objc_claimAutoreleasedReturnValue();
      if (v22 != v58)
      {
        -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature bluetoothFormat](v5, "bluetoothFormat");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v10 = 0;
          v24 = (void *)v58;
LABEL_43:

LABEL_44:
          v21 = v62;
          if (v62 == v19)
            goto LABEL_46;
          goto LABEL_45;
        }
      }
      v25 = v19;
      -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
      v26 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature validRange](v5, "validRange");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v26;
      if (v26 == v54)
      {
        v19 = v25;
      }
      else
      {
        -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature validRange](v5, "validRange");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v27;
        v28 = objc_msgSend(v27, "isEqual:");
        v19 = v25;
        if (!v28)
        {
          v10 = 0;
          v30 = (void *)v54;
          v29 = v55;
LABEL_41:

LABEL_42:
          v24 = (void *)v58;
          if (v61 == (void *)v58)
            goto LABEL_44;
          goto LABEL_43;
        }
      }
      -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
      v31 = objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature stepValue](v5, "stepValue");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v31;
      v49 = v19;
      if (v31 != v52)
      {
        -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature stepValue](v5, "stepValue");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v32;
        if (!objc_msgSend(v32, "isEqual:"))
        {
          v10 = 0;
          v33 = (void *)v52;
          goto LABEL_38;
        }
      }
      -[HAP2TLVParamCharacteristicSignature validValues](self, "validValues");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2TLVParamCharacteristicSignature validValues](v5, "validValues");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v34 == (void *)v46
        || (-[HAP2TLVParamCharacteristicSignature validValues](self, "validValues"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HAP2TLVParamCharacteristicSignature validValues](v5, "validValues"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v45 = v35,
            objc_msgSend(v35, "isEqual:")))
      {
        -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2TLVParamCharacteristicSignature validValuesRange](v5, "validValuesRange");
        v37 = objc_claimAutoreleasedReturnValue();
        v43 = v36;
        if (v36 == (void *)v37)
        {

          v10 = 1;
        }
        else
        {
          v42 = (void *)v37;
          -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HAP2TLVParamCharacteristicSignature validValuesRange](v5, "validValuesRange");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v41, "isEqual:", v38);

        }
        v39 = (void *)v46;
        if (v34 == (void *)v46)
        {
LABEL_37:

          v33 = (void *)v52;
          if (v53 == (void *)v52)
          {
            v19 = v49;
LABEL_40:

            v30 = (void *)v54;
            v29 = v55;
            if (v55 == (void *)v54)
              goto LABEL_42;
            goto LABEL_41;
          }
LABEL_38:
          v19 = v49;

          goto LABEL_40;
        }
      }
      else
      {
        v10 = 0;
        v39 = (void *)v46;
      }

      goto LABEL_37;
    }
    v10 = 0;
  }
LABEL_53:

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
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAP2TLVParamCharacteristicSignature instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature characteristicType](self, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature characteristicProperties](self, "characteristicProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature userDescription](self, "userDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature bluetoothFormat](self, "bluetoothFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validRange](self, "validRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature stepValue](self, "stepValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validValues](self, "validValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2TLVParamCharacteristicSignature validValuesRange](self, "validValuesRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HAP2TLVParamCharacteristicSignature instanceID=%@, characteristicType=%@, characteristicProperties=%@, userDescription=%@, bluetoothFormat=%@, validRange=%@, stepValue=%@, validValues=%@, validValuesRange=%@>"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (HAPTLVUnsignedNumberValue)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceID, a3);
}

- (NSData)characteristicType
{
  return self->_characteristicType;
}

- (void)setCharacteristicType:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicType, a3);
}

- (HAP2TLVCharacteristicPropertiesWrapper)characteristicProperties
{
  return self->_characteristicProperties;
}

- (void)setCharacteristicProperties:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicProperties, a3);
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setUserDescription:(id)a3
{
  objc_storeStrong((id *)&self->_userDescription, a3);
}

- (NSData)bluetoothFormat
{
  return self->_bluetoothFormat;
}

- (void)setBluetoothFormat:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothFormat, a3);
}

- (NSData)validRange
{
  return self->_validRange;
}

- (void)setValidRange:(id)a3
{
  objc_storeStrong((id *)&self->_validRange, a3);
}

- (NSData)stepValue
{
  return self->_stepValue;
}

- (void)setStepValue:(id)a3
{
  objc_storeStrong((id *)&self->_stepValue, a3);
}

- (NSData)validValues
{
  return self->_validValues;
}

- (void)setValidValues:(id)a3
{
  objc_storeStrong((id *)&self->_validValues, a3);
}

- (NSData)validValuesRange
{
  return self->_validValuesRange;
}

- (void)setValidValuesRange:(id)a3
{
  objc_storeStrong((id *)&self->_validValuesRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValuesRange, 0);
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_validRange, 0);
  objc_storeStrong((id *)&self->_bluetoothFormat, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_characteristicProperties, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HAP2TLVParamCharacteristicSignature *v6;
  HAP2TLVParamCharacteristicSignature *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HAP2TLVParamCharacteristicSignature);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HAP2TLVParamCharacteristicSignature parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
