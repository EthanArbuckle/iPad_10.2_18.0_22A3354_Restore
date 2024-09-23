@implementation CBOR

+ (id)encodeMajorType2or3:(uint64_t)a1
{
  id v2;
  id v3;
  char v4;
  void *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  char v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 96;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (id)objc_opt_new();
      goto LABEL_17;
    }
    v3 = v2;
    v4 = 64;
  }
  objc_msgSend(v3, "length");
  if ((unint64_t)objc_msgSend(v3, "length") >> 32)
  {
    v11 = v4 | 0x1B;
    v12[0] = bswap64(objc_msgSend(v3, "length"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length") + 9);
    objc_msgSend(v5, "appendBytes:length:", &v11, 1);
    v6 = (char *)v12;
    v7 = v5;
    v8 = 8;
  }
  else if ((unint64_t)objc_msgSend(v3, "length") < 0x10000)
  {
    if ((unint64_t)objc_msgSend(v3, "length") < 0x100)
    {
      if ((unint64_t)objc_msgSend(v3, "length") < 0x18)
      {
        v11 = v4 + objc_msgSend(v3, "length");
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length") + 1);
        v5 = v7;
        v6 = &v11;
      }
      else
      {
        v11 = v4 | 0x18;
        LOBYTE(v12[0]) = objc_msgSend(v3, "length");
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length") + 2);
        objc_msgSend(v5, "appendBytes:length:", &v11, 1);
        v6 = (char *)v12;
        v7 = v5;
      }
      v8 = 1;
    }
    else
    {
      v11 = v4 | 0x19;
      LOWORD(v12[0]) = bswap32(objc_msgSend(v3, "length")) >> 16;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length") + 3);
      objc_msgSend(v5, "appendBytes:length:", &v11, 1);
      v6 = (char *)v12;
      v7 = v5;
      v8 = 2;
    }
  }
  else
  {
    v11 = v4 | 0x1A;
    LODWORD(v12[0]) = bswap32(objc_msgSend(v3, "length"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v3, "length") + 5);
    objc_msgSend(v5, "appendBytes:length:", &v11, 1);
    v6 = (char *)v12;
    v7 = v5;
    v8 = 4;
  }
  objc_msgSend(v7, "appendBytes:length:", v6, v8);
  objc_msgSend(v5, "appendData:", v3);
  v9 = v5;

LABEL_17:
  return v9;
}

uint64_t __51__CBOR_Encoder__encodeMajorType5_encodingKeyOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  unsigned __int8 *v16;
  id v17;
  unsigned __int8 *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v32;
  unint64_t v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  unsigned int v36;
  unsigned int v37;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = objc_msgSend(v7, "length");
  v11 = objc_msgSend(v8, "length");
  if (v9)
  {
    if (v10 < v11)
    {
LABEL_3:
      v12 = -1;
      goto LABEL_17;
    }
    v25 = objc_msgSend(v7, "length");
    if (v25 <= objc_msgSend(v8, "length"))
    {
      v26 = objc_msgSend(v7, "length");
      v27 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
      v28 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
      if (!v26)
        goto LABEL_3;
      v29 = *v27;
      v30 = *v28;
      if (v29 <= v30)
      {
        v34 = v27 + 1;
        v35 = v28 + 1;
        v12 = 1;
        while (v29 >= v30)
        {
          v36 = *v34++;
          v29 = v36;
          v37 = *v35++;
          v30 = v37;
          if (v29 > v37)
            goto LABEL_17;
        }
        goto LABEL_3;
      }
    }
LABEL_16:
    v12 = 1;
    goto LABEL_17;
  }
  if (v10 <= v11)
    v13 = v8;
  else
    v13 = v7;
  v14 = objc_msgSend(v13, "length");
  v15 = objc_retainAutorelease(v7);
  v16 = (unsigned __int8 *)objc_msgSend(v15, "bytes");
  v17 = objc_retainAutorelease(v8);
  v18 = (unsigned __int8 *)objc_msgSend(v17, "bytes");
  if (v14)
  {
    v19 = *v16;
    v20 = *v18;
    if (v19 <= v20)
    {
      v21 = v16 + 1;
      v22 = v18 + 1;
      v12 = 1;
      while (v19 >= v20)
      {
        v23 = *v21++;
        v19 = v23;
        v24 = *v22++;
        v20 = v24;
        if (v19 > v24)
          goto LABEL_17;
      }
      goto LABEL_3;
    }
    goto LABEL_16;
  }
  v32 = objc_msgSend(v15, "length");
  if (v32 == objc_msgSend(v17, "length"))
  {
    v12 = 0;
  }
  else
  {
    v33 = objc_msgSend(v15, "length");
    if (v33 > objc_msgSend(v17, "length"))
      v12 = 1;
    else
      v12 = -1;
  }
LABEL_17:

  return v12;
}

+ (id)encodeMajorType7Undefined
{
  char v1;

  objc_opt_self();
  v1 = -9;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v1, 1);
}

+ (id)encodeMajorType7Bool:(uint64_t)a1
{
  char v3;
  char v5;

  objc_opt_self();
  if (a2)
    v3 = -11;
  else
    v3 = -12;
  v5 = v3;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v5, 1);
}

+ (id)decodeFromData:(id)a3
{
  return (id)objc_msgSend(a1, "decodeFromData:keepKeyOrdering:noCopy:", a3, 1, 0);
}

+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4
{
  return (id)objc_msgSend(a1, "decodeFromData:keepKeyOrdering:noCopy:", a3, a4, 0);
}

+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4 noCopy:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v5 = a5;
  v6 = a4;
  v8 = objc_retainAutorelease(a3);
  v12 = objc_msgSend(v8, "bytes");
  v9 = objc_msgSend(v8, "length");

  v11 = v9;
  objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v12, &v11, 0, v6, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asJSON
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (-[CBOR type](self, "type") == 4)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[CBOR array](self, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[CBOR array](self, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "asJSON");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v11, "asJSON");
          else
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v8);
    }

  }
  else if (-[CBOR type](self, "type") == 5)
  {
    v14 = objc_alloc(MEMORY[0x24BDBCED8]);
    -[CBOR dictionary](self, "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CBOR dictionary](self, "dictionary", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          -[CBOR dictionary](self, "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "asJSON");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "asJSON");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v24)
          {
            if (v25)
            {
              objc_msgSend(v5, "setObject:forKey:", v25, v24);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v27, v24);

            }
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v18);
    }

  }
  else
  {
    -[CBOR value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

+ (id)decodeFromBytes:(const char *)a3 length:(unint64_t *)a4 recursionLevel:(int)a5 keepKeyOrdering:(BOOL)a6 noCopy:(BOOL)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  __int16 v22;
  uint8_t buf[2];
  __int16 v24;

  if (!a4 || !*a4)
    return 0;
  if (!a3 || !*a3)
  {
    *a4 = 0;
    return 0;
  }
  v9 = a7;
  v10 = a6;
  v11 = *(_QWORD *)&a5;
  v12 = 0;
  v13 = 0;
  while (1)
  {
    v14 = *(unsigned __int8 *)*a3;
    if (v14 <= 0x3F)
    {
      +[CBOR decodeMajorType0And1FromBuffer:length:tag:](CBOR, "decodeMajorType0And1FromBuffer:length:tag:", a3, a4, v12);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if ((v14 & 0x80) == 0)
    {
      +[CBOR decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:](CBOR, "decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:", a3, a4, v12, 16, v9);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v14 <= 0x9F)
    {
      if ((int)v11 > 4999)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          goto LABEL_32;
        v24 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Max CBOR decoding level reached";
        v21 = (uint8_t *)&v24;
        goto LABEL_36;
      }
      +[CBOR decodeMajorType4FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:](CBOR, "decodeMajorType4FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:", a3, a4, v12, v11, v10, v9);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v16 = (void *)v18;
      goto LABEL_33;
    }
    if (v14 <= 0xBF)
    {
      if ((int)v11 <= 4999)
      {
        +[CBOR decodeMajorType5FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:](CBOR, "decodeMajorType5FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:", a3, a4, v12, v11, v10, v9);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x24BDACB70];
      v20 = "Max CBOR decoding level reached";
      v21 = buf;
LABEL_36:
      _os_log_fault_impl(&dword_20D850000, v19, OS_LOG_TYPE_FAULT, v20, v21, 2u);
      goto LABEL_32;
    }
    if (v14 > 0xDF)
    {
      +[CBOR decodeMajorType7FromBuffer:length:tag:](CBOR, "decodeMajorType7FromBuffer:length:tag:", a3, a4, v12);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v13 == 100)
      break;
    +[CBOR decodeMajorType6FromBuffer:length:tag:](CBOR, "decodeMajorType6FromBuffer:length:tag:", a3, a4, v12);
    v15 = objc_claimAutoreleasedReturnValue();

    if (v15)
      ++v13;
    else
      v13 = 0;
    v12 = (void *)v15;
    if (!*a4)
    {
      v16 = 0;
      v12 = (void *)v15;
      goto LABEL_33;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v22 = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "Max CBOR recursive tagging level reached";
    v21 = (uint8_t *)&v22;
    goto LABEL_36;
  }
LABEL_32:
  v16 = 0;
LABEL_33:

  return v16;
}

+ (id)decodeMajorType0And1FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7;
  unint64_t v8;
  const char *v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  CBOR *v14;
  void *v15;
  CBOR *v16;
  unint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v7 = a5;
  v8 = *a4;
  if (*a4)
  {
    v9 = *a3;
    v10 = *(unsigned __int8 *)*a3;
    v11 = v10 & 0xFFFFFFDF;
    v12 = (v10 >> 5) & 1;
    if ((v10 & 0xFFFFFFDF) > 0x17)
    {
      switch(v11)
      {
        case 0x18u:
          if (v8 == 1)
            goto LABEL_27;
          v20 = *((unsigned __int8 *)v9 + 1);
          if ((v10 & 0x20) != 0)
            v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", (char)~(_BYTE)v20);
          else
            v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", v20);
          v29 = (void *)v21;
          v16 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", v12, v21, 1, v7);

          v17 = v8 - 2;
          v18 = 2;
          break;
        case 0x19u:
          v17 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_27;
          v22 = *(unsigned __int16 *)(v9 + 1);
          if ((v10 & 0x20) != 0)
            v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", ((int)bswap32(~v22) >> 16));
          else
            v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedShort:", __rev16(v22));
          v30 = (void *)v23;
          v16 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", v12, v23, 2, v7);

          v18 = 3;
          break;
        case 0x1Au:
          v17 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL)
            goto LABEL_27;
          v24 = *(_DWORD *)(v9 + 1);
          if ((v10 & 0x20) != 0)
            v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", bswap32(~v24));
          else
            v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", bswap32(v24));
          v31 = (void *)v25;
          v16 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", v12, v25, 4, v7);

          v18 = 5;
          break;
        case 0x1Bu:
          v17 = v8 - 9;
          if (v8 - 9 > 0xFFFFFFFFFFFFFFF7)
          {
LABEL_27:
            v17 = 0;
            v16 = 0;
            goto LABEL_28;
          }
          v26 = *(_QWORD *)(v9 + 1);
          if ((v10 & 0x20) != 0)
            v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", bswap64(~v26));
          else
            v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", bswap64(v26));
          v32 = (void *)v27;
          v16 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", v12, v27, 8, v7);

          v18 = 9;
          break;
        default:
          v17 = 0;
          v19 = *a3;
          goto LABEL_15;
      }
    }
    else
    {
      if ((v10 & 0x20) != 0)
        v13 = ~v11;
      else
        v13 = v11;
      v14 = [CBOR alloc];
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v13);
      v16 = -[CBOR initWithType:value:valueSize:tag:](v14, "initWithType:value:valueSize:tag:", v12, v15, 0, v7);

      v17 = v8 - 1;
      v18 = 1;
    }
    v19 = &v9[v18];
    if (!v16)
LABEL_15:
      v16 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 16, 0, 0, v7);
    if (&v19[v17] > &v9[v8])
      __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType0And1FromBuffer:length:tag:]", "CBOR+decoder.m", 277, "buffer + bufferSize <= endOfBuffer");
    *a3 = v19;
LABEL_28:
    *a4 = v17;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)decodeMajorType2And3FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 indefiniteLenContainerType:(unint64_t)a6 noCopy:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  const char *v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  CBOR *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  _BOOL8 v27;
  int v28;
  _BOOL4 v29;
  int v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  int v37;
  const char **v38;
  int v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CBOR *v49;
  uint64_t v50;
  void *v51;
  CBOR *v52;
  void *v53;
  CBOR *v54;
  uint64_t v55;
  unint64_t v56;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  CBOR *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  unint64_t v70;
  unsigned __int8 *v71;

  v7 = a7;
  v11 = a5;
  v12 = *a3;
  v13 = *a4;
  v70 = v13;
  v71 = (unsigned __int8 *)v12;
  if (!v13)
  {
    v16 = 0;
    goto LABEL_90;
  }
  v14 = *(unsigned __int8 *)v12;
  if ((v14 & 0x20) != 0)
    v15 = 3;
  else
    v15 = 2;
  if (a6 == 16 || v15 == a6)
  {
    v67 = v7;
    v17 = v13;
    if ((v14 & 0xFFFFFFDF) > 0x57)
    {
      v21 = 0;
      v18 = 0;
      v19 = 1;
      v69 = 0;
      v20 = 0;
      switch(v14 & 0xFFFFFFDF)
      {
        case 'X':
          v21 = v13 - 1;
          v70 = v13 - 1;
          v71 = (unsigned __int8 *)(v12 + 1);
          if (v13 == 1)
          {
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v69 = 0;
            goto LABEL_34;
          }
          v19 = 0;
          v22 = *((unsigned __int8 *)v12 + 1);
          v17 = v13 - 2;
          v69 = 0;
          v70 = v13 - 2;
          v71 = (unsigned __int8 *)(v12 + 2);
          v21 = v13 - 2 < v22;
          v20 = v13 - 2 >= v22;
          if (v13 - 2 >= v22)
            v18 = v22;
          else
            v18 = 0;
          goto LABEL_59;
        case 'Y':
          v17 = v13 - 1;
          v70 = v13 - 1;
          v71 = (unsigned __int8 *)(v12 + 1);
          if (v13 - 1 < 2)
            goto LABEL_33;
          v19 = 0;
          v23 = bswap32(*(unsigned __int16 *)(v12 + 1)) >> 16;
          v17 = v13 - 3;
          v69 = 0;
          v70 = v13 - 3;
          v71 = (unsigned __int8 *)(v12 + 3);
          v21 = v13 - 3 < v23;
          if (v13 - 3 >= v23)
            v18 = v23;
          else
            v18 = 0;
          v20 = 2 * (v13 - 3 >= v23);
          goto LABEL_59;
        case 'Z':
          v17 = v13 - 1;
          v70 = v13 - 1;
          v71 = (unsigned __int8 *)(v12 + 1);
          if (v13 - 1 < 4)
            goto LABEL_33;
          v19 = 0;
          v24 = bswap32(*(_DWORD *)(v12 + 1));
          v17 = v13 - 5;
          v69 = 0;
          v70 = v13 - 5;
          v71 = (unsigned __int8 *)(v12 + 5);
          v21 = v13 - 5 < v24;
          if (v13 - 5 >= v24)
            v18 = v24;
          else
            v18 = 0;
          v20 = 4 * (v13 - 5 >= v24);
          goto LABEL_59;
        case '[':
          v17 = v13 - 1;
          v70 = v13 - 1;
          v71 = (unsigned __int8 *)(v12 + 1);
          if (v13 - 1 < 8)
          {
LABEL_33:
            v18 = 0;
            v19 = 0;
            v69 = 0;
            v21 = 0;
LABEL_34:
            v20 = 0;
          }
          else
          {
            v19 = 0;
            v25 = bswap64(*(_QWORD *)(v12 + 1));
            v17 = v13 - 9;
            v69 = 0;
            v70 = v13 - 9;
            v71 = (unsigned __int8 *)(v12 + 9);
            v21 = v13 - 9 < v25;
            if (v13 - 9 >= v25)
              v18 = v25;
            else
              v18 = 0;
            v20 = 8 * (v13 - 9 >= v25);
          }
          goto LABEL_59;
        case '\\':
        case ']':
        case '^':
          goto LABEL_59;
        case '_':
          if (a6 != 16)
            goto LABEL_7;
          v17 = v13 - 1;
          v70 = v13 - 1;
          v71 = (unsigned __int8 *)(v12 + 1);
          v26 = (void *)objc_opt_new();
          if (v13 == 1)
            goto LABEL_54;
          v65 = 0;
          v27 = v67;
          break;
        default:
          v69 = 0;
          v20 = 0;
          goto LABEL_59;
      }
      while (1)
      {
        v28 = *v71;
        if (v28 == 255)
          break;
        v29 = (v14 & 0x20) == 0;
        if ((v28 & 0xE0) != 0x40)
          v29 = 1;
        v30 = (v14 >> 5) & 1;
        if ((v28 & 0xE0) != 0x60)
          v30 = 1;
        v31 = !v29 || v30 == 0;
        if (v31 || (v28 | 0x20) == 0x7F)
          goto LABEL_55;
        +[CBOR decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:](CBOR, "decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:", &v71, &v70, 0, v15, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32 && objc_msgSend(v32, "type") == v15)
        {
          objc_msgSend(v33, "data");
          v34 = v26;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "appendData:", v35);

          v26 = v34;
        }
        else
        {

          v26 = 0;
          v70 = 0;
          v65 = 1;
        }

        v17 = v70;
        v27 = v67;
        if (!v70)
        {
          v36 = v65;
          if ((v65 & 1) != 0)
          {
            v17 = 0;
          }
          else
          {
LABEL_54:
            v17 = 0;
LABEL_55:
            v36 = 1;
          }
LABEL_56:
          v69 = v26;
          v37 = v36 & 1;
          goto LABEL_57;
        }
      }
      v36 = v65;
      if ((v65 & 1) != 0)
        goto LABEL_56;
      v37 = 0;
      --v17;
      v69 = v26;
      v70 = v17;
      ++v71;
LABEL_57:
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = v37 != 0;
    }
    else
    {
      v18 = v14 & 0x1F;
      if (v13 >= v18)
      {
        v19 = 0;
        v21 = 0;
        v20 = 0;
        v17 = v13 - 1;
        v69 = 0;
        v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
      }
      else
      {
        v18 = 0;
        v19 = 0;
        v69 = 0;
        v20 = 0;
        v21 = 1;
      }
    }
LABEL_59:
    v38 = a3;
    v39 = v19;
    if (v18 > v17)
      v40 = 1;
    else
      v40 = v21;
    objc_msgSend(v11, "numeric", v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v41;
    if (v41)
    {
      if (objc_msgSend(v41, "unsignedIntValue") == 24)
        v42 = (v14 >> 5) & 1;
      else
        v42 = 0;
      if (((v42 | v40) & 1) != 0)
        goto LABEL_67;
    }
    else if (v40)
    {
LABEL_67:
      v16 = 0;
      *a4 = 0;
      v43 = v69;
LABEL_89:

      goto LABEL_90;
    }
    v43 = v69;
    if (v69)
    {
      if ((v14 & 0x20) != 0)
      {
        if (objc_msgSend(v69, "length"))
        {
          v44 = objc_alloc(MEMORY[0x24BDD17C8]);
          v45 = objc_retainAutorelease(v69);
          v46 = objc_msgSend(v45, "bytes");
          v47 = objc_msgSend(v45, "length");
          if (v67)
            v48 = objc_msgSend(v44, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v46, v47, 4, 0);
          else
            v48 = objc_msgSend(v44, "initWithBytes:length:encoding:", v46, v47, 4);
          v53 = (void *)v48;
          v43 = v69;
          goto LABEL_85;
        }
LABEL_84:
        v53 = (void *)objc_opt_new();
LABEL_85:
        v54 = [CBOR alloc];
        v55 = 3;
LABEL_86:
        v52 = -[CBOR initWithType:value:valueSize:tag:](v54, "initWithType:value:valueSize:tag:", v55, v53, 0, v11);

        goto LABEL_87;
      }
      v49 = [CBOR alloc];
      v50 = 2;
      v51 = v69;
    }
    else
    {
      if (!v39)
      {
        if (!v18)
        {
          if ((v14 & 0x20) == 0)
          {
            v53 = (void *)objc_opt_new();
            v54 = [CBOR alloc];
            v55 = 2;
            goto LABEL_86;
          }
          goto LABEL_84;
        }
        if (v18 > v70)
        {
          v16 = 0;
          *a4 = 0;
          goto LABEL_89;
        }
        if ((v14 & 0x20) != 0)
        {
          v58 = objc_alloc(MEMORY[0x24BDD17C8]);
          if (v67)
            v59 = objc_msgSend(v58, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v71, v18, 4, 0);
          else
            v59 = objc_msgSend(v58, "initWithBytes:length:encoding:", v71, v18, 4);
          v62 = (void *)v59;
          v63 = [CBOR alloc];
          v64 = 3;
        }
        else
        {
          v60 = objc_alloc(MEMORY[0x24BDBCE50]);
          if (v67)
            v61 = objc_msgSend(v60, "initWithBytesNoCopy:length:freeWhenDone:", v71, v18, 0);
          else
            v61 = objc_msgSend(v60, "initWithBytes:length:", v71, v18);
          v62 = (void *)v61;
          v63 = [CBOR alloc];
          v64 = 2;
        }
        v52 = -[CBOR initWithType:value:valueSize:tag:](v63, "initWithType:value:valueSize:tag:", v64, v62, v66, v11);

        v43 = 0;
        v70 -= v18;
        v71 += v18;
LABEL_87:
        v56 = v70;
        if (&v71[v70] > (unsigned __int8 *)&v12[v13])
          __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:]", "CBOR+decoder.m", 541, "buffer + bufferSize <= endOfBuffer");
        *v38 = (const char *)v71;
        *a4 = v56;
        v16 = v52;
        goto LABEL_89;
      }
      v49 = [CBOR alloc];
      v50 = 16;
      v51 = 0;
    }
    v52 = -[CBOR initWithType:value:valueSize:tag:](v49, "initWithType:value:valueSize:tag:", v50, v51, 0, v11);
    goto LABEL_87;
  }
LABEL_7:
  v16 = 0;
  *a4 = 0;
LABEL_90:

  return v16;
}

+ (id)decodeMajorType4FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  void *v15;
  const char *v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  CBOR *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CBOR *v36;
  void *v37;
  const char **v39;
  uint64_t v40;
  unint64_t *v41;
  id v42;
  uint8_t buf[16];
  unint64_t v44;
  const char *v45;

  v8 = a8;
  v9 = a7;
  v14 = a5;
  v15 = v14;
  v16 = *a3;
  v45 = *a3;
  v17 = *a4;
  if (!*a4)
    goto LABEL_41;
  v18 = *(unsigned __int8 *)v16;
  v42 = v14;
  if (v18 > 0x97)
  {
    switch(*v16)
    {
      case 0x98:
        v44 = v17 - 1;
        v45 = v16 + 1;
        if (v17 == 1)
          goto LABEL_17;
        v20 = *((unsigned __int8 *)v16 + 1);
        v21 = v17 - 2;
        v44 = v17 - 2;
        v45 = v16 + 2;
        v19 = 1;
        goto LABEL_4;
      case 0x99:
        v44 = v17 - 1;
        v45 = v16 + 1;
        if (v17 - 1 < 2)
          goto LABEL_17;
        v20 = bswap32(*(unsigned __int16 *)(v16 + 1)) >> 16;
        v21 = v17 - 3;
        v44 = v17 - 3;
        v45 = v16 + 3;
        v19 = 2;
        goto LABEL_4;
      case 0x9A:
        v44 = v17 - 1;
        v45 = v16 + 1;
        if (v17 - 1 < 4)
          goto LABEL_17;
        v20 = bswap32(*(_DWORD *)(v16 + 1));
        v21 = v17 - 5;
        v44 = v17 - 5;
        v45 = v16 + 5;
        v19 = 4;
        goto LABEL_4;
      case 0x9B:
        v44 = v17 - 1;
        v45 = v16 + 1;
        if (v17 - 1 >= 8)
        {
          v20 = bswap64(*(_QWORD *)(v16 + 1));
          v21 = v17 - 9;
          v44 = v17 - 9;
          v45 = v16 + 9;
          v19 = 8;
          goto LABEL_4;
        }
LABEL_17:
        v20 = 0;
        v19 = 0;
        goto LABEL_18;
      case 0x9F:
        v39 = a3;
        v41 = a4;
        v44 = v17 - 1;
        v45 = v16 + 1;
        v23 = (void *)objc_opt_new();
        v31 = (a6 + 1);
        break;
      default:
        v22 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 16, 0, 0, v14);
        v29 = 0;
        v44 = 0;
        v30 = v16;
        goto LABEL_43;
    }
    while (1)
    {
      v32 = (void *)MEMORY[0x212BAA510]();
      objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v45, &v44, v31, v9, v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
        break;
      v34 = v33;
      if (objc_msgSend(v33, "type") != 15)
        objc_msgSend(v23, "addObject:", v34);
      v35 = objc_msgSend(v34, "type", v39);

      objc_autoreleasePoolPop(v32);
      if (v35 == 15)
      {
        v40 = 0;
        goto LABEL_35;
      }
    }
    objc_autoreleasePoolPop(v32);
    v40 = 0;
LABEL_37:
    v28 = 1;
    goto LABEL_38;
  }
  v19 = 0;
  v20 = v18 & 0x1F;
  v21 = v17 - 1;
  v44 = v17 - 1;
  v45 = v16 + 1;
LABEL_4:
  if (v21 < v20)
  {
    v15 = v14;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20D850000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
    }
    v22 = 0;
    *a4 = 0;
    goto LABEL_45;
  }
LABEL_18:
  v39 = a3;
  v40 = v19;
  v41 = a4;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v20);
  if (!v20)
  {
LABEL_35:
    v28 = 0;
LABEL_38:
    v15 = v42;
    goto LABEL_39;
  }
  v24 = (a6 + 1);
  while (v44 >= v20)
  {
    v25 = (void *)MEMORY[0x212BAA510]();
    objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v45, &v44, v24, v9, v8);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      objc_autoreleasePoolPop(v25);
      goto LABEL_37;
    }
    v27 = (void *)v26;
    objc_msgSend(v23, "addObject:", v26);

    objc_autoreleasePoolPop(v25);
    if (!--v20)
      goto LABEL_35;
  }
  v15 = v42;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_20D850000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
  }
  v28 = 1;
LABEL_39:
  v36 = [CBOR alloc];
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v23, 0);
  v22 = -[CBOR initWithType:value:valueSize:tag:](v36, "initWithType:value:valueSize:tag:", 4, v37, v40, v15);

  if ((v28 & 1) != 0)
  {
    *v41 = 0;

LABEL_41:
    v22 = 0;
    goto LABEL_45;
  }
  v29 = v44;
  v30 = v45;
  a4 = v41;
  a3 = v39;
LABEL_43:
  if (&v30[v29] > &v16[v17])
    __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType4FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:]", "CBOR+decoder.m", 697, "buffer + bufferSize <= endOfBuffer");
  *a3 = v30;
  *a4 = v29;
LABEL_45:

  return v22;
}

+ (id)decodeMajorType5FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  const char *v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  CBOR *v29;
  unint64_t v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  CBOR *v38;
  void *v39;
  void *v40;
  unint64_t *v42;
  id v43;
  uint64_t v44;
  const char *v45;
  const char **v46;
  unint64_t v47;
  void *v48;
  uint8_t buf[16];
  unint64_t v50;
  const char *v51;

  v8 = a8;
  v9 = a7;
  v14 = a5;
  v15 = *a3;
  v51 = *a3;
  v16 = *a4;
  if (!*a4)
  {
LABEL_49:
    v29 = 0;
    goto LABEL_50;
  }
  v17 = *(unsigned __int8 *)v15;
  if (v17 > 0xB7)
  {
    switch(*v15)
    {
      case 0xB8:
        v20 = v16 - 1;
        v50 = v16 - 1;
        v51 = v15 + 1;
        if (v16 == 1)
          goto LABEL_14;
        v19 = *((unsigned __int8 *)v15 + 1);
        v20 = v16 - 2;
        v50 = v16 - 2;
        v51 = v15 + 2;
        v18 = 1;
        goto LABEL_15;
      case 0xB9:
        v20 = v16 - 1;
        v50 = v16 - 1;
        v51 = v15 + 1;
        if (v16 - 1 < 2)
          goto LABEL_14;
        v19 = bswap32(*(unsigned __int16 *)(v15 + 1)) >> 16;
        v20 = v16 - 3;
        v50 = v16 - 3;
        v51 = v15 + 3;
        v18 = 2;
        goto LABEL_15;
      case 0xBA:
        v20 = v16 - 1;
        v50 = v16 - 1;
        v51 = v15 + 1;
        if (v16 - 1 < 4)
          goto LABEL_14;
        v19 = bswap32(*(_DWORD *)(v15 + 1));
        v20 = v16 - 5;
        v50 = v16 - 5;
        v51 = v15 + 5;
        v18 = 4;
        goto LABEL_15;
      case 0xBB:
        v20 = v16 - 1;
        v50 = v16 - 1;
        v51 = v15 + 1;
        if (v16 - 1 <= 7)
        {
LABEL_14:
          v18 = 0;
          v19 = 0;
          goto LABEL_15;
        }
        v19 = bswap64(*(_QWORD *)(v15 + 1));
        v20 = v16 - 9;
        v50 = v16 - 9;
        v51 = v15 + 9;
        if ((v19 & 0x8000000000000000) == 0)
        {
          v18 = 8;
          goto LABEL_15;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_20D850000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
        }
        goto LABEL_49;
      case 0xBF:
        v46 = a3;
        v47 = *a4;
        v45 = v15;
        v50 = v16 - 1;
        v51 = v15 + 1;
        v21 = (void *)objc_opt_new();
        v48 = (void *)objc_opt_new();
        v32 = (void *)MEMORY[0x212BAA510]();
        v33 = (a6 + 1);
        objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v51, &v50, v33, v9, v8);
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_44;
        v35 = (void *)v34;
        break;
      default:
        v47 = *a4;
        v29 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 16, 0, 0, v14);
        v30 = 0;
        v50 = 0;
        v31 = v15;
        goto LABEL_41;
    }
    while (1)
    {
      if (objc_msgSend(v35, "type") == 15)
      {

        objc_autoreleasePoolPop(v32);
        v44 = 0;
        goto LABEL_38;
      }
      objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v51, &v50, v33, v9, v8);
      v36 = objc_claimAutoreleasedReturnValue();
      if (!v36)
        break;
      v37 = (void *)v36;
      objc_msgSend(v21, "addObject:", v35);
      objc_msgSend(v48, "addObject:", v37);

      objc_autoreleasePoolPop(v32);
      v32 = (void *)MEMORY[0x212BAA510]();
      objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v51, &v50, v33, v9, v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_44;
    }

LABEL_44:
    objc_autoreleasePoolPop(v32);
    goto LABEL_45;
  }
  v18 = 0;
  v19 = v17 & 0x1F;
  v20 = v16 - 1;
  v50 = v16 - 1;
  v51 = v15 + 1;
LABEL_15:
  if (v20 < 2 * v19)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20D850000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
    }
    goto LABEL_46;
  }
  v44 = v18;
  v45 = v15;
  v46 = a3;
  v47 = v16;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
  if (v19)
  {
    v42 = a4;
    v43 = v14;
    v22 = (a6 + 1);
    v23 = 2 * v19 + 2;
    while (1)
    {
      v23 -= 2;
      if (v50 < v23)
        break;
      v24 = (void *)MEMORY[0x212BAA510]();
      objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v51, &v50, v22, v9, v8);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_36;
      v26 = (void *)v25;
      objc_msgSend(a1, "decodeFromBytes:length:recursionLevel:keepKeyOrdering:noCopy:", &v51, &v50, v22, v9, v8);
      v27 = objc_claimAutoreleasedReturnValue();
      if (!v27)
      {

LABEL_36:
        objc_autoreleasePoolPop(v24);
        a4 = v42;
        v14 = v43;
        goto LABEL_45;
      }
      v28 = (void *)v27;
      --v19;
      objc_msgSend(v21, "addObject:", v26);
      objc_msgSend(v48, "addObject:", v28);

      objc_autoreleasePoolPop(v24);
      if (!v19)
      {
        a4 = v42;
        v14 = v43;
        goto LABEL_38;
      }
    }
    a4 = v42;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_20D850000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
    }
    v14 = v43;
LABEL_45:

LABEL_46:
    v29 = 0;
    *a4 = 0;
    goto LABEL_50;
  }
LABEL_38:
  v38 = [CBOR alloc];
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v48, v21);
  v29 = -[CBOR initWithType:value:valueSize:tag:](v38, "initWithType:value:valueSize:tag:", 5, v39, v44, v14);

  if (v9)
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v21, 0);
    -[CBOR setOrderedKeys:](v29, "setOrderedKeys:", v40);

  }
  v30 = v50;
  v31 = v51;
  v15 = v45;
  a3 = v46;
LABEL_41:
  if (&v31[v30] > &v15[v47])
    __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType5FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:]", "CBOR+decoder.m", 896, "buffer + bufferSize <= endOfBuffer");
  *a3 = v31;
  *a4 = v30;
LABEL_50:

  return v29;
}

+ (id)decodeMajorType6FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CBOR *v12;
  unint64_t v13;
  uint64_t v14;
  const char *v15;

  v7 = a5;
  v8 = *a4;
  if (*a4)
  {
    v9 = *a3;
    v10 = **a3 & 0x3F;
    if (v10 > 0x17)
    {
      switch(**a3 & 0x3F)
      {
        case 0x18:
          if (v8 == 1)
            goto LABEL_18;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v9[1]);
          v12 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, v11, 1, v7);
          v13 = v8 - 2;
          v14 = 2;
          goto LABEL_4;
        case 0x19:
          v13 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_18;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithShort:", ((int)bswap32(*(unsigned __int16 *)(v9 + 1)) >> 16));
          v12 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, v11, 2, v7);
          v14 = 3;
          goto LABEL_4;
        case 0x1A:
          v13 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL)
            goto LABEL_18;
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", bswap32(*(_DWORD *)(v9 + 1)));
          v12 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, v11, 4, v7);
          v14 = 5;
          goto LABEL_4;
        case 0x1B:
          v13 = v8 - 9;
          if (v8 - 9 <= 0xFFFFFFFFFFFFFFF7)
          {
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", bswap64(*(_QWORD *)(v9 + 1)));
            v12 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, v11, 8, v7);
            v14 = 9;
            goto LABEL_4;
          }
LABEL_18:
          v13 = 0;
          v12 = 0;
          break;
        default:
          v12 = 0;
          v13 = 0;
          v15 = *a3;
          goto LABEL_5;
      }
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v10);
      v12 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, v11, 0, v7);
      v13 = v8 - 1;
      v14 = 1;
LABEL_4:
      v15 = &v9[v14];

LABEL_5:
      if (&v15[v13] > &v9[v8])
        __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType6FromBuffer:length:tag:]", "CBOR+decoder.m", 1003, "buffer + bufferSize <= endOfBuffer");
      *a3 = v15;
    }
    *a4 = v13;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)decodeMajorType7FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CBOR *v12;
  uint64_t v13;
  CBOR *v14;
  const char *v15;
  unint64_t v16;
  void *v17;
  CBOR *v18;
  CBOR *v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  int v25;
  unsigned int v26;
  id v27;
  double v28;
  double v29;
  id v30;
  double v31;

  v7 = a5;
  v8 = *a4;
  if (*a4)
  {
    v9 = *a3;
    v10 = **a3 & 0x1F;
    if (v10 > 0x17)
    {
      v15 = *a3;
      v14 = 0;
      v16 = *a4;
      switch(**a3 & 0x1F)
      {
        case 0x18:
          if (v8 == 1)
            goto LABEL_22;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *((unsigned __int8 *)v9 + 1));
          v14 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 13, v17, 1, v7);
          v16 = v8 - 2;
          v15 = v9 + 2;
          goto LABEL_32;
        case 0x19:
          v16 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_22;
          v20 = *((unsigned __int8 *)v9 + 1);
          v21 = (char)v20;
          v22 = (v20 >> 2) & 0x1F;
          v23 = *((unsigned __int8 *)v9 + 2) | ((v20 & 3) << 8);
          if (v22 == 31)
          {
            if (v23)
              v29 = NAN;
            else
              v29 = INFINITY;
          }
          else
          {
            if (v22)
            {
              v24 = (double)(v23 | 0x400);
              v25 = v22 - 25;
            }
            else
            {
              v24 = (double)v23;
              v25 = -24;
            }
            v29 = ldexp(v24, v25);
          }
          v30 = objc_alloc(MEMORY[0x24BDD16E0]);
          v31 = -v29;
          if (v21 >= 0)
            v31 = v29;
          v17 = (void *)objc_msgSend(v30, "initWithDouble:", v31);
          v14 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 6, v17, 2, v7);
          v15 = v9 + 3;
          goto LABEL_32;
        case 0x1A:
          v16 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL)
            goto LABEL_22;
          v26 = bswap32(*(_DWORD *)(v9 + 1));
          v27 = objc_alloc(MEMORY[0x24BDD16E0]);
          LODWORD(v28) = v26;
          v17 = (void *)objc_msgSend(v27, "initWithFloat:", v28);
          v14 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 7, v17, 4, v7);
          v15 = v9 + 5;
          goto LABEL_32;
        case 0x1B:
          v16 = v8 - 9;
          if (v8 - 9 > 0xFFFFFFFFFFFFFFF7)
          {
LABEL_22:
            v16 = 0;
            v14 = 0;
            goto LABEL_35;
          }
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", COERCE_DOUBLE(bswap64(*(_QWORD *)(v9 + 1))));
          v14 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 8, v17, 8, v7);
          v15 = v9 + 9;
LABEL_32:

          break;
        case 0x1F:
          v16 = v8 - 1;
          v15 = v9 + 1;
          v14 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 15, 0, 0, v7);
          break;
        default:
          break;
      }
    }
    else
    {
      switch(**a3 & 0x1F)
      {
        case 0x14:
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 0);
          v12 = [CBOR alloc];
          v13 = 9;
          break;
        case 0x15:
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 1);
          v12 = [CBOR alloc];
          v13 = 10;
          break;
        case 0x16:
          v18 = [CBOR alloc];
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v18;
          v13 = 11;
          break;
        case 0x17:
          v19 = [CBOR alloc];
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v19;
          v13 = 12;
          break;
        default:
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v10);
          v12 = [CBOR alloc];
          v13 = 13;
          break;
      }
      v14 = -[CBOR initWithType:value:valueSize:tag:](v12, "initWithType:value:valueSize:tag:", v13, v11, 0, v7);

      v16 = v8 - 1;
      v15 = v9 + 1;
    }
    if (&v15[v16] > &v9[v8])
      __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType7FromBuffer:length:tag:]", "CBOR+decoder.m", 1137, "buffer + bufferSize <= endOfBuffer");
    *a3 = v15;
LABEL_35:
    *a4 = v16;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", self->_type, self->_value, self->_valueSize, self->_tag);
}

- (CBOR)initWithType:(unint64_t)a3 value:(id)a4 valueSize:(int64_t)a5 tag:(id)a6
{
  id v11;
  id v12;
  CBOR *v13;
  CBOR *v14;
  id *p_value;
  id *p_tag;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CBOR;
  v13 = -[CBOR init](&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    p_value = &v13->_value;
    objc_storeStrong(&v13->_value, a4);
    v14->_valueSize = a5;
    p_tag = (id *)&v14->_tag;
    objc_storeStrong((id *)&v14->_tag, a6);
    v17 = v14->_valueSize ^ v14->_type;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v11;
      v18 = v14->_value;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v35 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "hash") ^ v17;
            v17 = v25 ^ objc_msgSend(v24, "hash");

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v20);
      }

      v11 = v32;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v26 = *p_value;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v35 != v29)
                objc_enumerationMutation(v26);
              v17 ^= objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "hash");
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v28);
        }

      }
      else if (*p_value && objc_msgSend(*p_value, "conformsToProtocol:", &unk_2549CBAE8))
      {
        v17 ^= objc_msgSend(*p_value, "hash");
      }
    }
    if (*p_tag)
      v17 ^= objc_msgSend(*p_tag, "hash");
    v14->_cachedHash = v17;
  }

  return v14;
}

- (CBOR)initWithCbor:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  CBOR *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "type");
  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "valueSize");

  v11 = -[CBOR initWithType:value:valueSize:tag:](self, "initWithType:value:valueSize:tag:", v8, v9, v10, v6);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CBOR *v4;
  CBOR *v5;
  CBOR *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (CBOR *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (-[CBOR type](v6, "type") == self->_type)
    {
      v7 = -[CBOR hash](self, "hash");
      v8 = v7 == -[CBOR hash](v6, "hash");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)longLongValue
{
  unint64_t type;
  BOOL v3;

  type = self->_type;
  v3 = type == 13 || type == 1;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return objc_msgSend(self->_value, "longLongValue");
  else
    return 0;
}

- (unint64_t)unsignedLongLongValue
{
  unint64_t type;
  BOOL v3;
  uint64_t v4;

  type = self->_type;
  v3 = type > 0xE;
  v4 = (1 << type) & 0x6001;
  if (v3 || v4 == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  else
    return objc_msgSend(self->_value, "unsignedLongLongValue");
}

- (double)doubleValue
{
  double result;

  if (self->_type - 6 > 2)
    return 0.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0.0;
  objc_msgSend(self->_value, "doubleValue");
  return result;
}

- (NSNumber)numeric
{
  unint64_t type;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  id v7;

  type = self->_type;
  v3 = type > 0xE;
  v4 = (1 << type) & 0x61C3;
  v5 = v3 || v4 == 0;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v7 = &unk_24C7D6390;
  else
    v7 = self->_value;
  return (NSNumber *)v7;
}

- (BOOL)BOOLValue
{
  unint64_t type;

  type = self->_type;
  if (type == 10)
    return 1;
  if (type == 9)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  return objc_msgSend(self->_value, "BOOLValue");
}

- (NSString)string
{
  unint64_t type;
  id v4;
  id value;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  type = self->_type;
  if (type == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = self->_value;
      return (NSString *)v4;
    }
    type = self->_type;
  }
  if (type == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    value = self->_value;
    v6 = (objc_class *)MEMORY[0x24BDD17C8];
    v7 = value;
    v8 = [v6 alloc];
    v9 = objc_retainAutorelease(v7);
    v10 = objc_msgSend(v9, "bytes");
    v11 = objc_msgSend(v9, "length");

    v4 = (id)objc_msgSend(v8, "initWithBytes:length:encoding:", v10, v11, 4);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSData)data
{
  unint64_t type;
  id v4;

  type = self->_type;
  if (type == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(self->_value, "dataUsingEncoding:", 4);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      return (NSData *)v4;
    }
    type = self->_type;
  }
  if (type == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = self->_value;
  else
    v4 = 0;
  return (NSData *)v4;
}

- (NSArray)array
{
  id v3;

  if (self->_type == 4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_value;
  else
    v3 = 0;
  return (NSArray *)v3;
}

- (NSDictionary)dictionary
{
  id v3;

  if (self->_type == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_value;
  else
    v3 = 0;
  return (NSDictionary *)v3;
}

- (NSDate)date
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  unsigned int v11;
  char *v12;
  int v13;
  double v14;
  const char *v15;
  char *v16;
  id v17;
  time_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  id v24;
  time_t v25;
  uint64_t v26;
  int v27;
  unint64_t v29;
  char *v30;
  double v31;
  int v32;
  tm v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (self->_type == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CBOR numeric](self->_tag, "numeric");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "intValue");

      if (v4 == 1004)
      {
        _getRFC3339DateFormatter(0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dateFromString:", self->_value);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSDate *)v9;
      }
      if (!v4)
      {
        v5 = objc_retainAutorelease(self->_value);
        v6 = objc_msgSend(v5, "cStringUsingEncoding:", 4);
        if (!v6)
          goto LABEL_46;
        v7 = v6;
        v8 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4);
        if ((unint64_t)v8 < 0x14 || *(_BYTE *)(v7 + 10) != 84)
          goto LABEL_46;
        v9 = 0;
        v10 = (char *)(v7 + v8);
        memset(&v33, 0, sizeof(v33));
        v12 = (char *)(v7 + 19);
        v11 = *(unsigned __int8 *)(v7 + 19);
        if (v11 > 0x2D)
        {
          if (v11 != 46)
          {
            if (v11 == 90)
            {
              if (v8 > 20 || !strptime_l((const char *)v7, "%Y-%m-%dT%H:%M:%S", &v33, 0))
                goto LABEL_46;
              v24 = objc_alloc(MEMORY[0x24BDBCE60]);
              v25 = timegm(&v33);
              v9 = (void *)objc_msgSend(v24, "initWithTimeIntervalSince1970:", (double)v25, *(_OWORD *)&v33.tm_sec, *(_OWORD *)&v33.tm_mon, *(_OWORD *)&v33.tm_isdst, v33.tm_zone);
            }
LABEL_47:

            return (NSDate *)v9;
          }
          if (v8 < 21)
            goto LABEL_46;
          v26 = 20;
          do
          {
            v27 = *(unsigned __int8 *)(v7 + v26);
            if ((v27 - 43) <= 0x2F && ((1 << (v27 - 43)) & 0x800000000005) != 0)
            {
              v29 = v26 - 20;
              v30 = (char *)(v7 + v26);
              goto LABEL_35;
            }
            if (((char)v27 - 48) > 9)
              goto LABEL_46;
            ++v26;
            v30 = (char *)(v7 + v26);
          }
          while (v7 + v26 < (unint64_t)v10);
          v29 = v26 - 20;
LABEL_35:
          v9 = 0;
          if (v30 == v10 || !v29 || v29 > 3)
            goto LABEL_47;
          v34 = &v12[v29];
          v31 = strtod((const char *)(v7 + 19), &v34);
          if (v34 == v12)
            goto LABEL_46;
          v14 = v31;
          v32 = *(v10 - 1);
          if (*v30 == 90 && v32 != 90)
            goto LABEL_46;
          v34 = 0;
          v35 = 0;
          v37 = 0;
          v36 = 0;
          __strlcpy_chk();
          if (v32 == 90)
          {
LABEL_12:
            v15 = "%Y-%m-%dT%H:%M:%S";
LABEL_13:
            v16 = strptime_l((const char *)&v34, v15, &v33, 0);
            if (v16 && !*v16)
            {
              v17 = objc_alloc(MEMORY[0x24BDBCE60]);
              v18 = mktime(&v33);
              v19 = (void *)objc_msgSend(v17, "initWithTimeIntervalSince1970:", (double)v18, *(_OWORD *)&v33.tm_sec, *(_OWORD *)&v33.tm_mon, *(_OWORD *)&v33.tm_isdst, v33.tm_zone);
              v20 = v19;
              if (v14 <= 0.0)
              {
                v21 = v19;
              }
              else
              {
                objc_msgSend(v19, "dateByAddingTimeInterval:", v14);
                v21 = (id)objc_claimAutoreleasedReturnValue();
              }
              v9 = v21;

              goto LABEL_47;
            }
            goto LABEL_46;
          }
          v12 = v30;
        }
        else
        {
          if (v11 != 43 && v11 != 45)
            goto LABEL_47;
          v13 = *(v10 - 1);
          v34 = 0;
          v35 = 0;
          v37 = 0;
          v36 = 0;
          __strlcpy_chk();
          v14 = -1.0;
          if (v13 == 90)
            goto LABEL_12;
        }
        if (v10 - v12 == 6 && v12[3] == 58)
        {
          __strlcpy_chk();
          __strlcpy_chk();
          v15 = "%Y-%m-%dT%H:%M:%S%z";
          goto LABEL_13;
        }
LABEL_46:
        v9 = 0;
        goto LABEL_47;
      }
    }
  }
  v9 = 0;
  return (NSDate *)v9;
}

- (BOOL)isWholeNumber
{
  return (self->_type < 0xE) & (0x2003u >> self->_type);
}

- (BOOL)isFloatNumber
{
  return self->_type - 6 < 3;
}

- (BOOL)isBoolean
{
  return self->_type - 9 < 2;
}

- (BOOL)isDate
{
  CBOR *tag;
  void *v4;
  void *v5;
  BOOL v6;

  if (self->_type != 3)
    return 0;
  tag = self->_tag;
  if (!tag)
    return 0;
  -[CBOR numeric](tag, "numeric");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue"))
  {
    -[CBOR numeric](self->_tag, "numeric");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") == 1004;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEmbeddedCBORData
{
  CBOR *tag;
  void *v3;
  BOOL v4;

  if (self->_type != 2)
    return 0;
  tag = self->_tag;
  if (!tag)
    return 0;
  -[CBOR numeric](tag, "numeric");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == 24;

  return v4;
}

- (id)description
{
  void *v3;
  CBOR *tag;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  unint64_t type;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  tag = self->_tag;
  if (tag)
  {
    -[CBOR description](tag, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("(%@)"), v5);

  }
  switch(self->_type)
  {
    case 0uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("unsigned int<%@>"), self->_value);
      goto LABEL_20;
    case 1uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("negative int<%@>"), self->_value);
      goto LABEL_20;
    case 2uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("byte string<%@>"), self->_value);
      goto LABEL_20;
    case 3uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("UTF8 string<%@>"), self->_value);
      goto LABEL_20;
    case 4uLL:
      v7 = CFSTR("array");
      break;
    case 5uLL:
      v7 = CFSTR("dictionary");
      break;
    case 6uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("half float<%@>"), self->_value);
      goto LABEL_20;
    case 7uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("single float<%@>"), self->_value);
      goto LABEL_20;
    case 8uLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("double float<%@>"), self->_value);
      goto LABEL_20;
    case 9uLL:
      v7 = CFSTR("false");
      break;
    case 0xAuLL:
      v7 = CFSTR("true");
      break;
    case 0xBuLL:
      v7 = CFSTR("null");
      break;
    case 0xCuLL:
      v7 = CFSTR("undefined");
      break;
    case 0xDuLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("simple<%@>"), self->_value);
      goto LABEL_20;
    case 0xEuLL:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("tag<%@>"), self->_value);
LABEL_20:
      v7 = (__CFString *)v6;
      break;
    case 0xFuLL:
      v7 = CFSTR("break");
      break;
    case 0x10uLL:
      v7 = CFSTR("uknown");
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v3, "appendString:", v7);
  type = self->_type;
  if (type == 4)
  {
    v21 = self->_value;
    objc_msgSend(v3, "appendString:", CFSTR("<["));
    v22 = objc_msgSend(v21, "count");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v21;
    v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v31 = v7;
      v25 = *(_QWORD *)v34;
      do
      {
        v26 = 0;
        v27 = v22;
        do
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26), "description");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v28);

          if (v27 >= 2)
            objc_msgSend(v3, "appendString:", CFSTR(", "));
          ++v26;
          --v27;
        }
        while (v24 != v26);
        v22 -= v24;
        v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
      v7 = v31;
    }
    v20 = CFSTR("]>");
    goto LABEL_45;
  }
  if (type == 5)
  {
    v9 = self->_value;
    objc_msgSend(v3, "appendString:", CFSTR("<{"));
    v10 = objc_msgSend(v9, "count");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v30 = v7;
      v14 = *(_QWORD *)v38;
      do
      {
        v15 = 0;
        v32 = v10;
        do
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@"), v18, v19);

          if (v10 >= 2)
            objc_msgSend(v3, "appendString:", CFSTR(", "));

          ++v15;
          --v10;
        }
        while (v13 != v15);
        v10 = v32 - v13;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
      v7 = v30;
    }
    v20 = CFSTR("}>");
LABEL_45:

    objc_msgSend(v3, "appendString:", v20);
  }

  return v3;
}

+ (id)cborWithInteger:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  CBOR *v10;

  v3 = a3 ^ (a3 >> 63);
  v4 = 1;
  v5 = 2;
  v6 = 8;
  if (!HIDWORD(v3))
    v6 = 4;
  if (v3 >= 0x10000)
    v5 = v6;
  if (v3 >= 0x100)
    v4 = v5;
  if ((uint64_t)v3 >= 24)
    v7 = v4;
  else
    v7 = 0;
  v8 = (unint64_t)a3 >> 63;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a3);
  v10 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", v8, v9, v7, 0);

  return v10;
}

+ (id)cborWithUnsignedInteger:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CBOR *v8;

  v3 = 1;
  v4 = 2;
  v5 = 8;
  if (!HIDWORD(a3))
    v5 = 4;
  if (a3 >= 0x10000)
    v4 = v5;
  if (a3 >= 0x100)
    v3 = v4;
  if ((uint64_t)a3 >= 24)
    v6 = v3;
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", a3);
  v8 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 0, v7, v6, 0);

  return v8;
}

+ (id)cborWithHalfFloat:(float)a3
{
  id v4;
  double v5;
  void *v6;
  CBOR *v7;

  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v5 = a3;
  v6 = (void *)objc_msgSend(v4, "initWithFloat:", v5);
  v7 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 6, v6, 2, 0);

  return v7;
}

+ (id)cborWithFloat:(float)a3
{
  id v4;
  double v5;
  void *v6;
  CBOR *v7;

  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  *(float *)&v5 = a3;
  v6 = (void *)objc_msgSend(v4, "initWithFloat:", v5);
  v7 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 7, v6, 4, 0);

  return v7;
}

+ (id)cborWithDouble:(double)a3
{
  void *v3;
  CBOR *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", a3);
  v4 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 8, v3, 8, 0);

  return v4;
}

+ (id)cborWithArray:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CBOR *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = 1;
  v6 = 2;
  v7 = 8;
  if (!HIDWORD(v4))
    v7 = 4;
  if (v4 >= 0x10000)
    v6 = v7;
  if (v4 >= 0x100)
    v5 = v6;
  if ((uint64_t)v4 >= 24)
    v8 = v5;
  else
    v8 = 0;
  v9 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 4, v3, v8, 0);

  return v9;
}

+ (id)cborWithDictionary:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CBOR *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = 1;
  v6 = 2;
  v7 = 8;
  if (!HIDWORD(v4))
    v7 = 4;
  if (v4 >= 0x10000)
    v6 = v7;
  if (v4 >= 0x100)
    v5 = v6;
  if ((uint64_t)v4 >= 24)
    v8 = v5;
  else
    v8 = 0;
  v9 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 5, v3, v8, 0);

  return v9;
}

+ (id)cborWithDictionary:(id)a3 keyOrderList:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a4;
  +[CBOR cborWithDictionary:](CBOR, "cborWithDictionary:", a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[6];
  v6[6] = v5;

  return v6;
}

+ (id)cborWithData:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CBOR *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = 1;
  v6 = 2;
  v7 = 8;
  if (!HIDWORD(v4))
    v7 = 4;
  if (v4 >= 0x10000)
    v6 = v7;
  if (v4 >= 0x100)
    v5 = v6;
  if ((uint64_t)v4 >= 24)
    v8 = v5;
  else
    v8 = 0;
  v9 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 2, v3, v8, 0);

  return v9;
}

+ (id)cborWithEncodedTag24Data:(id)a3
{
  id v3;
  unint64_t v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v3, "bytes");
  v8 = objc_msgSend(v3, "length");
  v4 = objc_msgSend(v3, "length");

  if (v4 < 2)
    return 0;
  +[CBOR decodeMajorType6FromBuffer:length:tag:](CBOR, "decodeMajorType6FromBuffer:length:tag:", &v9, &v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v6)
  {
    if (v8)
    {
      +[CBOR decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:](CBOR, "decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:", &v9, &v8, v6, 16, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

+ (id)cborWithUTF8String:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CBOR *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = 1;
  v6 = 2;
  v7 = 8;
  if (!HIDWORD(v4))
    v7 = 4;
  if (v4 >= 0x10000)
    v6 = v7;
  if (v4 >= 0x100)
    v5 = v6;
  if ((uint64_t)v4 >= 24)
    v8 = v5;
  else
    v8 = 0;
  v9 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 3, v3, v8, 0);

  return v9;
}

+ (id)cborWithFullDate:(id)a3
{
  id v3;
  CBOR *v4;
  void *v5;
  void *v6;
  CBOR *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBOR *v13;

  v3 = a3;
  v4 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, &unk_24C7D63A8, 2, 0);
  _getRFC3339DateFormatter(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CBOR alloc];
  v8 = objc_msgSend(v6, "length");
  v9 = 1;
  v10 = 2;
  v11 = 8;
  if (!HIDWORD(v8))
    v11 = 4;
  if (v8 >= 0x10000)
    v10 = v11;
  if (v8 >= 0x100)
    v9 = v10;
  if ((uint64_t)v8 >= 24)
    v12 = v9;
  else
    v12 = 0;
  v13 = -[CBOR initWithType:value:valueSize:tag:](v7, "initWithType:value:valueSize:tag:", 3, v6, v12, v4);

  return v13;
}

+ (id)cborWithDateTime:(id)a3
{
  id v3;
  CBOR *v4;
  void *v5;
  void *v6;
  CBOR *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CBOR *v13;

  v3 = a3;
  v4 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 14, &unk_24C7D63C0, 0, 0);
  _getRFC3339DateFormatter(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CBOR alloc];
  v8 = objc_msgSend(v6, "length");
  v9 = 1;
  v10 = 2;
  v11 = 8;
  if (!HIDWORD(v8))
    v11 = 4;
  if (v8 >= 0x10000)
    v10 = v11;
  if (v8 >= 0x100)
    v9 = v10;
  if ((uint64_t)v8 >= 24)
    v12 = v9;
  else
    v12 = 0;
  v13 = -[CBOR initWithType:value:valueSize:tag:](v7, "initWithType:value:valueSize:tag:", 3, v6, v12, v4);

  return v13;
}

+ (id)cborNil
{
  return -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 11, 0, 0, 0);
}

+ (id)cborTrue
{
  return -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 10, 0, 0, 0);
}

+ (id)cborFalse
{
  return -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 9, 0, 0, 0);
}

+ (id)cborWithEmbeddedCBORData:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CBOR *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = 1;
  v6 = 2;
  v7 = 8;
  if (!HIDWORD(v4))
    v7 = 4;
  if (v4 >= 0x10000)
    v6 = v7;
  if (v4 >= 0x100)
    v5 = v6;
  if ((uint64_t)v4 >= 24)
    v8 = v5;
  else
    v8 = 0;
  +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CBOR initWithType:value:valueSize:tag:]([CBOR alloc], "initWithType:value:valueSize:tag:", 2, v3, v8, v9);

  return v10;
}

- (id)encodeToEmbeddedCBORData
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBOR cborWithEmbeddedCBORData:](CBOR, "cborWithEmbeddedCBORData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (CBOR)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (int64_t)valueSize
{
  return self->_valueSize;
}

- (void)setValueSize:(int64_t)a3
{
  self->_valueSize = a3;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

+ (id)cborWithCOSE:(id)a3
{
  return -[COSE sourceObject]((id *)a3);
}

+ (id)cborWithCOSEKey:(id)a3
{
  return -[COSE sourceObject]((id *)a3);
}

@end
