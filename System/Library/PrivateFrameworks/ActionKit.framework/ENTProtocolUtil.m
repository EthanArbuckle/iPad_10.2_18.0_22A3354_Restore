@implementation ENTProtocolUtil

+ (void)skipType:(int)a3 onProtocol:(id)a4
{
  id v6;
  void *v7;
  id v8;
  int i;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 2:
      objc_msgSend(v6, "readBool");
      break;
    case 3:
      objc_msgSend(v6, "readByte");
      break;
    case 4:
      objc_msgSend(v6, "readDouble");
      break;
    case 6:
      objc_msgSend(v6, "readI16");
      break;
    case 8:
      objc_msgSend(v6, "readI32");
      break;
    case 10:
      objc_msgSend(v6, "readI64");
      break;
    case 11:
      v8 = (id)objc_msgSend(v6, "readString");
      break;
    case 12:
      objc_msgSend(v6, "readStructBeginReturningName:", 0);
      while (1)
      {
        HIDWORD(v13) = 0;
        objc_msgSend(v7, "readFieldBeginReturningName:type:fieldID:", 0, (char *)&v13 + 4, 0);
        if (!HIDWORD(v13))
          break;
        objc_msgSend(a1, "skipType:onProtocol:");
        objc_msgSend(v7, "readFieldEnd");
      }
      objc_msgSend(v7, "readStructEnd");
      break;
    case 13:
      v13 = 0;
      v12 = 0;
      objc_msgSend(v6, "readMapBeginReturningKeyType:valueType:size:", (char *)&v13 + 4, &v13, &v12);
      if (v12 >= 1)
      {
        for (i = 0; i < v12; ++i)
        {
          objc_msgSend(a1, "skipType:onProtocol:", HIDWORD(v13), v7);
          objc_msgSend(a1, "skipType:onProtocol:", v13, v7);
        }
      }
      objc_msgSend(v7, "readMapEnd");
      break;
    case 14:
      v13 = 0;
      objc_msgSend(v6, "readSetBeginReturningElementType:size:", (char *)&v13 + 4, &v13);
      if ((int)v13 >= 1)
      {
        v10 = 0;
        do
        {
          objc_msgSend(a1, "skipType:onProtocol:", HIDWORD(v13), v7);
          ++v10;
        }
        while (v10 < (int)v13);
      }
      objc_msgSend(v7, "readSetEnd");
      break;
    case 15:
      v13 = 0;
      objc_msgSend(v6, "readListBeginReturningElementType:size:", (char *)&v13 + 4, &v13);
      if ((int)v13 >= 1)
      {
        v11 = 0;
        do
        {
          objc_msgSend(a1, "skipType:onProtocol:", HIDWORD(v13), v7);
          ++v11;
        }
        while (v11 < (int)v13);
      }
      objc_msgSend(v7, "readListEnd");
      break;
    default:
      break;
  }

}

+ (id)_readValueForField:(id)a3 fromProtocol:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  int v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v8 = 0;
  switch(objc_msgSend(v6, "type"))
  {
    case 2u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "readBool"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 3u:
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = objc_msgSend(v7, "readByte");
      goto LABEL_7;
    case 4u:
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v7, "readDouble");
      objc_msgSend(v12, "numberWithDouble:");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 6u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v7, "readI16"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 8u:
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = objc_msgSend(v7, "readI32");
LABEL_7:
      objc_msgSend(v10, "numberWithInt:", v11);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 0xAu:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "readI64"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 0xBu:
      objc_msgSend(v7, "readString");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 0xCu:
      v8 = objc_alloc_init((Class)objc_msgSend(v6, "structClass"));
      objc_msgSend(v8, "read:", v7);
      break;
    case 0xDu:
      v27 = 0;
      v26 = 0;
      objc_msgSend(v7, "readMapBeginReturningKeyType:valueType:size:", &v27, &v26, (char *)&v27 + 4);
      objc_msgSend(v6, "keyField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x24BDBCED8]);
      v8 = (id)objc_msgSend(v15, "initWithCapacity:", SHIDWORD(v27));
      if (SHIDWORD(v27) >= 1)
      {
        v16 = 0;
        do
        {
          objc_msgSend(a1, "_readValueForField:fromProtocol:", v13, v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_readValueForField:fromProtocol:", v14, v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v18, v17);

          ++v16;
        }
        while (v16 < SHIDWORD(v27));
      }
      objc_msgSend(v7, "readMapEnd");

      goto LABEL_27;
    case 0xEu:
      v27 = 0;
      objc_msgSend(v7, "readSetBeginReturningElementType:size:", &v27, (char *)&v27 + 4);
      objc_msgSend(v6, "valueField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x24BDBCEF0]);
      v8 = (id)objc_msgSend(v19, "initWithCapacity:", SHIDWORD(v27));
      if (SHIDWORD(v27) >= 1)
      {
        v20 = 0;
        do
        {
          objc_msgSend(a1, "_readValueForField:fromProtocol:", v13, v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v8, "addObject:", v21);

          ++v20;
        }
        while (v20 < SHIDWORD(v27));
      }
      goto LABEL_26;
    case 0xFu:
      v27 = 0;
      objc_msgSend(v7, "readListBeginReturningElementType:size:", &v27, (char *)&v27 + 4);
      objc_msgSend(v6, "valueField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v8 = (id)objc_msgSend(v22, "initWithCapacity:", SHIDWORD(v27));
      if (SHIDWORD(v27) >= 1)
      {
        v23 = 0;
        do
        {
          objc_msgSend(a1, "_readValueForField:fromProtocol:", v13, v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v8, "addObject:", v24);

          ++v23;
        }
        while (v23 < SHIDWORD(v27));
      }
LABEL_26:
      objc_msgSend(v7, "readListEnd");
LABEL_27:

      break;
    case 0x10u:
      objc_msgSend(v7, "readBinary");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v8 = (id)v9;
      break;
    default:
      break;
  }

  return v8;
}

+ (void)readFromProtocol:(id)a3 ontoObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "readStructBeginReturningName:", 0);
  objc_msgSend((id)objc_opt_class(), "structFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v6, "readFieldBeginReturningName:type:fieldID:", 0, (char *)&v25 + 4, &v25);
  while (HIDWORD(v25))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = objc_msgSend(v14, "index");
        if (v15 == (_DWORD)v25)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v16 = v14;

      if (!v16)
        goto LABEL_19;
      v17 = objc_msgSend(v16, "type");
      if (v17 != HIDWORD(v25) && objc_msgSend(v16, "type") != 16 && HIDWORD(v25) != 11)
      {
        NSLog(CFSTR("Skipping field:%@ due to type mismatch (received:%i)"), v16, HIDWORD(v25));
        goto LABEL_19;
      }
      objc_msgSend(a1, "_readValueForField:fromProtocol:", v16, v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v19, v20);

      objc_msgSend(v6, "readFieldEnd");
    }
    else
    {
LABEL_10:

      v16 = 0;
LABEL_19:
      objc_msgSend(a1, "skipType:onProtocol:", HIDWORD(v25), v6);
    }

    v25 = 0;
    objc_msgSend(v6, "readFieldBeginReturningName:type:fieldID:", 0, (char *)&v25 + 4, &v25);
  }
  objc_msgSend(v6, "readStructEnd");

}

+ (void)_writeValue:(id)a3 forField:(id)a4 toProtocol:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  id v31;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(objc_msgSend(v9, "type"))
  {
    case 2u:
      objc_msgSend(v10, "writeBool:", objc_msgSend(v8, "BOOLValue"));
      break;
    case 3u:
      objc_msgSend(v10, "writeByte:", objc_msgSend(v8, "charValue"));
      break;
    case 4u:
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v10, "writeDouble:");
      break;
    case 6u:
      objc_msgSend(v10, "writeI16:", objc_msgSend(v8, "shortValue"));
      break;
    case 8u:
      objc_msgSend(v10, "writeI32:", objc_msgSend(v8, "intValue"));
      break;
    case 0xAu:
      objc_msgSend(v10, "writeI64:", objc_msgSend(v8, "longLongValue"));
      break;
    case 0xBu:
      objc_msgSend(v10, "writeString:", v8);
      break;
    case 0xCu:
      objc_msgSend(v8, "write:", v10);
      break;
    case 0xDu:
      objc_msgSend(v9, "keyField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeMapBeginWithKeyType:valueType:size:", objc_msgSend(v11, "type"), objc_msgSend(v12, "type"), objc_msgSend(v8, "count"));
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v31 = v8;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(a1, "_writeValue:forField:toProtocol:", v18, v11, v10);
            objc_msgSend(v13, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_writeValue:forField:toProtocol:", v19, v12, v10);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v15);
      }

      objc_msgSend(v10, "writeMapEnd");
      v8 = v31;
      break;
    case 0xEu:
      objc_msgSend(v9, "valueField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeSetBeginWithElementType:size:", objc_msgSend(v20, "type"), objc_msgSend(v8, "count"));
      objc_msgSend(v10, "writeSetEnd");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v21 = v8;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(a1, "_writeValue:forField:toProtocol:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), v20, v10);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v23);
      }

      goto LABEL_34;
    case 0xFu:
      objc_msgSend(v9, "valueField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeListBeginWithElementType:size:", objc_msgSend(v20, "type"), objc_msgSend(v8, "count"));
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v26 = v8;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v33;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(a1, "_writeValue:forField:toProtocol:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k), v20, v10);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
        }
        while (v28);
      }

      objc_msgSend(v10, "writeListEnd");
LABEL_34:

      break;
    case 0x10u:
      objc_msgSend(v10, "writeBinary:", v8);
      break;
    default:
      break;
  }

}

+ (id)readMessage:(id)a3 fromProtocol:(id)a4 withResponseTypes:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  int v20;
  BOOL v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
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
  __int128 v62;
  id v63;
  int v64;
  unsigned int v65;
  int v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  v66 = 0;
  objc_msgSend(v9, "readMessageBeginReturningName:type:sequenceID:", 0, &v66, 0);
  if (v66 == 3)
  {
    +[ENTApplicationException read:](ENTApplicationException, "read:", v9);
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "readMessageEnd");
    v40 = (void *)v43;
LABEL_53:
    objc_exception_throw(objc_retainAutorelease(v40));
  }
  v44 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readStructBeginReturningName:", 0);
  v65 = 0;
  v64 = 0;
  v63 = 0;
  objc_msgSend(v9, "readFieldBeginReturningName:type:fieldID:", &v63, &v65, &v64);
  for (i = v63; v65; i = v63)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v12 = v45;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v13)
    {
      v14 = v13;
      v46 = i;
      v15 = 0;
      v16 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v60 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          v19 = objc_msgSend(v18, "index");
          if (v19 == v64)
          {
            v20 = objc_msgSend(v18, "type");
            if (v20 == v65 || (objc_msgSend(v18, "type") != 16 ? (v21 = v65 == 11) : (v21 = 1), v21))
            {
              objc_msgSend(a1, "_readValueForField:fromProtocol:", v18, v9);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
                objc_msgSend(v10, "addObject:", v22);

              v15 = 1;
            }
            else
            {
              NSLog(CFSTR("Skipping field:%@ due to type mismatch (received:%i)"), v18, v65);
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v14);

      i = v46;
      if ((v15 & 1) != 0)
        goto LABEL_24;
    }
    else
    {

    }
    +[ENTProtocolUtil skipType:onProtocol:](ENTProtocolUtil, "skipType:onProtocol:", v65, v9);
LABEL_24:

    v65 = 0;
    v64 = 0;
    v63 = 0;
    objc_msgSend(v9, "readFieldBeginReturningName:type:fieldID:", &v63, &v65, &v64);
  }

  objc_msgSend(v9, "readStructEnd");
  objc_msgSend(v9, "readMessageEnd");
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = v10;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v56;
    while (2)
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v56 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = v28;
          v35 = v23;
          goto LABEL_51;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      if (v25)
        continue;
      break;
    }
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v29 = v23;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = v34;
          goto LABEL_53;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v31);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v35 = v45;
  v36 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v35);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)n), "structClass"), "isSubclassOfClass:", objc_opt_class()))
        {

          objc_msgSend(v44, "stringByAppendingString:", CFSTR(" failed: unknown result"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[ENTApplicationException exceptionWithType:reason:](ENTApplicationException, "exceptionWithType:reason:", 5, v41);
          v42 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v42);
        }
      }
      v36 = (id)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    }
    while (v36);
  }
LABEL_51:

  return v36;
}

+ (void)writeObject:(id)a3 ontoProtocol:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "structName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeStructBeginWithName:", v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)objc_opt_class(), "structFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "valueForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_msgSend(v13, "type");
          if (v16 == 16)
            v17 = 11;
          else
            v17 = v16;
          objc_msgSend(v6, "writeFieldBeginWithName:type:fieldID:", v14, v17, objc_msgSend(v13, "index"));
          objc_msgSend(a1, "_writeValue:forField:toProtocol:", v15, v13, v6);
          objc_msgSend(v6, "writeFieldEnd");
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "writeFieldStop");
  objc_msgSend(v6, "writeStructEnd");

}

+ (void)sendMessage:(id)a3 toProtocol:(id)a4 withArguments:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "writeMessageBeginWithName:type:sequenceID:", v8, 1, 0);
  v22 = v8;
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("_args"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeStructBeginWithName:", v11);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "field");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "writeFieldBeginWithName:type:fieldID:", v20, objc_msgSend(v18, "type"), objc_msgSend(v18, "index"));

        objc_msgSend(a1, "_writeValue:forField:toProtocol:", v19, v18, v9);
        objc_msgSend(v9, "writeFieldEnd");

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  objc_msgSend(v9, "writeFieldStop");
  objc_msgSend(v9, "writeStructEnd");
  objc_msgSend(v9, "writeMessageEnd");
  objc_msgSend(v9, "transport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "flush");

}

@end
