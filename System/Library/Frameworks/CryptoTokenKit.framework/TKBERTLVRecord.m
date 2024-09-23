@implementation TKBERTLVRecord

- (id)propertyList
{
  uint64_t v3;
  void *v4;
  id v5;
  _BYTE *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  BOOL v23;
  void *v24;
  unint64_t v25;
  id result;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  unsigned __int8 *v43;
  uint64_t j;
  id v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  unsigned int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = -[TKTLVRecord tag](self, "tag");
  v4 = 0;
  if (v3 > 23)
  {
    switch(v3)
    {
      case 24:
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[TKTLVRecord value](self, "value");
        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v34 = objc_msgSend(v33, "bytes");
        -[TKTLVRecord value](self, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v32, "initWithBytes:length:encoding:", v34, objc_msgSend(v35, "length"), 4);

        if (!v9)
        {
          v4 = 0;
          goto LABEL_46;
        }
        objc_msgSend((id)objc_opt_class(), "zuluDateFormatter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "dateFromString:", v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 48:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        -[TKTLVRecord value](self, "value");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[TKTLVRecord sequenceOfRecordsFromData:](TKBERTLVRecord, "sequenceOfRecordsFromData:", v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        if (!v38)
        {
LABEL_37:

          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        }
        v39 = v38;
        v40 = *(_QWORD *)v55;
LABEL_31:
        v41 = 0;
        while (1)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v41), "propertyList");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v4)
            break;
          objc_msgSend(v9, "addObject:", v4);

          if (v39 == ++v41)
          {
            v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
            if (v39)
              goto LABEL_31;
            goto LABEL_37;
          }
        }
        break;
      case 49:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        -[TKTLVRecord value](self, "value", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[TKTLVRecord sequenceOfRecordsFromData:](TKBERTLVRecord, "sequenceOfRecordsFromData:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v51;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v51 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[TKTLVRecord sequenceOfRecordsFromData:](TKBERTLVRecord, "sequenceOfRecordsFromData:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "propertyList");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "propertyList");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
                v23 = v22 == 0;
              else
                v23 = 1;
              if (v23)
              {

                v4 = 0;
                goto LABEL_39;
              }
              objc_msgSend(v9, "addObject:", v20);
              objc_msgSend(v10, "addObject:", v22);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            if (v14)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v10, v9);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

LABEL_46:
        return v4;
      default:
        return v4;
    }

    goto LABEL_46;
  }
  switch(v3)
  {
    case 1:
      -[TKTLVRecord value](self, "value");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = (_BYTE *)objc_msgSend(v5, "bytes");

      v7 = (id *)MEMORY[0x1E0C9AE50];
      if (!*v6)
        v7 = (id *)MEMORY[0x1E0C9AE40];
      v8 = *v7;
      goto LABEL_44;
    case 2:
      -[TKTLVRecord value](self, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "length");

      if (v25 <= 8)
      {
        -[TKTLVRecord value](self, "value");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v43 = (unsigned __int8 *)objc_msgSend(v42, "bytes");

        for (j = (uint64_t)(char)*v43 >> 7; ; j = v49 | (unint64_t)(j << 8))
        {
          -[TKTLVRecord value](self, "value");
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v46 = objc_msgSend(v45, "bytes");
          -[TKTLVRecord value](self, "value");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v46 + objc_msgSend(v47, "length");

          if ((unint64_t)v43 >= v48)
            break;
          v49 = *v43++;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", j);
        v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
        result = v8;
      }
      else
      {
        result = 0;
      }
      break;
    case 4:
      -[TKTLVRecord value](self, "value");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 12:
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[TKTLVRecord value](self, "value");
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "bytes");
      -[TKTLVRecord value](self, "value");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v27, "initWithBytes:length:encoding:", v29, objc_msgSend(v30, "length"), 4);

      return v31;
    default:
      return v4;
  }
  return result;
}

+ (id)parseFromDataSource:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  if (!objc_msgSend(v4, "bytesSafeToRead:", 1))
    goto LABEL_17;
  v5 = objc_msgSend(v4, "ptr");
  v6 = objc_msgSend(v4, "fetchByte");
  v7 = v6;
  if ((~v6 & 0x1FLL) == 0)
  {
    while (!HIBYTE(v7) && objc_msgSend(v4, "bytesSafeToRead:", 1))
    {
      v8 = objc_msgSend(v4, "fetchByte");
      v7 = v8 | (v7 << 8);
      if ((v8 & 0x80) == 0)
        goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_6:
  if (!objc_msgSend(v4, "bytesSafeToRead:", 1))
    goto LABEL_17;
  v9 = objc_msgSend(v4, "fetchByte");
  v10 = v9;
  if ((v9 & 0x80) != 0)
  {
    v14 = 0;
    if (v9 == 128 || v9 > 0x88)
      goto LABEL_18;
    v15 = v9 & 0x7F;
    if (!v15)
    {
      v10 = 0;
      goto LABEL_8;
    }
    v10 = 0;
    while (objc_msgSend(v4, "bytesSafeToRead:", 1))
    {
      --v15;
      v10 = objc_msgSend(v4, "fetchByte") | (unint64_t)(v10 << 8);
      if (!v15)
        goto LABEL_8;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
LABEL_8:
  objc_msgSend(v4, "fetchDataWithLength:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___TKBERTLVRecord;
    v12 = objc_msgSendSuper2(&v17, sel_alloc);
    objc_msgSend(v4, "dataFromPtr:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithTag:value:data:", v7, v11, v13);

  }
  else
  {
    v14 = 0;
  }

LABEL_18:
  return v14;
}

- (TKBERTLVRecord)initWithPropertyList:(id)a3
{
  id v4;
  TKBERTLVRecord *v6;
  void *v7;
  TKBERTLVRecord *v8;
  id v9;
  TKBERTLVRecord *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  TKBERTLVRecord *v25;
  uint64_t v26;
  TKBERTLVRecord *v27;
  TKBERTLVRecord *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  TKBERTLVRecord *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  TKBERTLVRecord *v42;
  id v43;
  uint64_t v44;
  TKBERTLVRecord *v45;
  TKBERTLVRecord *v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((id)*MEMORY[0x1E0C9AE50] != v4 && *MEMORY[0x1E0C9AE40] != (_QWORD)v4)
    {
      v11 = objc_msgSend(v4, "longLongValue");
      v12 = v11;
      v13 = -9;
      v14 = 56;
      do
      {
        v15 = v11 >> v14;
        ++v13;
        if (!v14)
          break;
        v14 -= 8;
      }
      while (v15 - 1 > 0xFD);
      v16 = ((v15 >> 7) & 1 ^ ((unint64_t)v11 >> 63)) - v13;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        v18 = 0;
        v19 = 8 * v16 - 8;
        do
        {
          *(_BYTE *)(objc_msgSend(objc_retainAutorelease(v17), "mutableBytes") + v18++) = v12 >> v19;
          v19 -= 8;
        }
        while (v16 != v18);
      }
      v10 = -[TKBERTLVRecord initWithTag:value:]([TKBERTLVRecord alloc], "initWithTag:value:", 2, v17);

      goto LABEL_16;
    }
    LOBYTE(v48) = objc_msgSend(v4, "BOOLValue");
    v6 = [TKBERTLVRecord alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v48, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TKBERTLVRecord initWithTag:value:](v6, "initWithTag:value:", 1, v7);

LABEL_22:
    self = v8;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v4;
    v10 = -[TKBERTLVRecord initWithTag:value:]([TKBERTLVRecord alloc], "initWithTag:value:", 4, v9);

LABEL_16:
    self = v10;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)MEMORY[0x1E0C99D50];
    v21 = objc_retainAutorelease(v4);
    v22 = objc_msgSend(v21, "UTF8String");
    v23 = objc_msgSend(v21, "lengthOfBytesUsingEncoding:", 4);

    objc_msgSend(v20, "dataWithBytes:length:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [TKBERTLVRecord alloc];
    v26 = 12;
LABEL_21:
    v8 = -[TKBERTLVRecord initWithTag:value:](v25, "initWithTag:value:", v26, v24);

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [TKBERTLVRecord alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v27;
    v26 = 5;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "zuluDateFormatter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringFromDate:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0C99D50];
    v33 = objc_retainAutorelease(v31);
    objc_msgSend(v32, "dataWithBytes:length:", objc_msgSend(v33, "UTF8String"), objc_msgSend(v33, "lengthOfBytesUsingEncoding:", 4));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TKBERTLVRecord initWithTag:value:]([TKBERTLVRecord alloc], "initWithTag:value:", 24, v34);

LABEL_27:
    self = v35;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v38 = v36;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(v38);
          v42 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
          if (!v42)
          {

            goto LABEL_44;
          }
          objc_msgSend(v37, "addObject:", v42);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v39)
          continue;
        break;
      }
    }

    v35 = -[TKBERTLVRecord initWithTag:records:]([TKBERTLVRecord alloc], "initWithTag:records:", 48, v37);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_44;
  v43 = v4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke;
  v47[3] = &unk_1E70891C0;
  v47[4] = &v48;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v47);
  v44 = v49[5];
  if (v44)
  {
    v45 = [TKBERTLVRecord alloc];
    v46 = -[TKBERTLVRecord initWithTag:records:](v45, "initWithTag:records:", 49, v49[5]);

    self = v46;
  }
  _Block_object_dispose(&v48, 8);

  if (!v44)
  {
LABEL_44:
    v28 = 0;
    goto LABEL_24;
  }
LABEL_23:
  self = self;
  v28 = self;
LABEL_24:

  return v28;
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag records:(NSArray *)records
{
  NSArray *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  TKBERTLVRecord *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = records;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "data", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendData:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[TKBERTLVRecord initWithTag:value:](self, "initWithTag:value:", tag, v7);
  return v14;
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag value:(NSData *)value
{
  NSData *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TKBERTLVRecord *v11;
  objc_super v13;
  char v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = value;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &v14, objc_msgSend((id)objc_opt_class(), "encodeNumber:into:", tag, &v14));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSData length](v6, "length");
  if (v8 > 0x7F)
  {
    v10 = objc_msgSend((id)objc_opt_class(), "encodeNumber:into:", v8, v15);
    v9 = v10 + 1;
    LOBYTE(v8) = v10 ^ 0x80;
  }
  else
  {
    v9 = 1;
  }
  v14 = v8;
  objc_msgSend(v7, "appendBytes:length:", &v14, v9);
  objc_msgSend(v7, "appendData:", v6);
  v13.receiver = self;
  v13.super_class = (Class)TKBERTLVRecord;
  v11 = -[TKTLVRecord initWithTag:value:data:](&v13, sel_initWithTag_value_data_, tag, v6, v7);

  return v11;
}

+ (unint64_t)encodeNumber:(unint64_t)a3 into:(char *)a4
{
  unint64_t result;
  int v7;
  uint64_t i;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("BER-TLV tag number must not be 0"));
  result = 0;
  v7 = 0;
  for (i = 56; i != -8; i -= 8)
  {
    v7 |= ((255 << i) & a3) != 0;
    if ((v7 & 1) != 0)
    {
      *a4++ = ((255 << i) & a3) >> i;
      ++result;
    }
  }
  return result;
}

+ (NSData)dataForTag:(TKTLVTag)tag
{
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "encodeNumber:into:", tag, v5);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, v3);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)zuluDateFormatter
{
  if (zuluDateFormatter_onceToken != -1)
    dispatch_once(&zuluDateFormatter_onceToken, &__block_literal_global_0);
  return (id)zuluDateFormatter_formatter;
}

uint64_t __51__TKBERTLVRecord_TKPropertyList__zuluDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)zuluDateFormatter_formatter;
  zuluDateFormatter_formatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)zuluDateFormatter_formatter, "setTimeZone:", v2);

  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)zuluDateFormatter_formatter, "setLocale:", v3);

  return objc_msgSend((id)zuluDateFormatter_formatter, "setDateFormat:", CFSTR("yyyyMMddHHmmss.SSSS'Z'"));
}

void __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  TKBERTLVRecord *v9;
  TKBERTLVRecord *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  TKBERTLVRecord *v14;
  void *v15;
  TKBERTLVRecord *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a2;
  v9 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v8);

  v10 = -[TKBERTLVRecord initWithPropertyList:]([TKBERTLVRecord alloc], "initWithPropertyList:", v7);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

    *a4 = 1;
  }
  else
  {
    v14 = [TKBERTLVRecord alloc];
    v17[0] = v9;
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TKBERTLVRecord initWithTag:records:](v14, "initWithTag:records:", 48, v15);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v16);
  }

}

@end
