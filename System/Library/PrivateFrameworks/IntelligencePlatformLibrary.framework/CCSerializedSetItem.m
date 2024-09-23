@implementation CCSerializedSetItem

- (CCSerializedSetItem)initWithSharedItem:(id)a3 deviceIndexes:(id)a4 localInstances:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int IsInstanceOfExpectedClass;
  id v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CCSerializedSetItem *v25;
  int v26;
  void *v27;
  id *v29;
  CCSerializedSetItem *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    v37 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v15 = 0;
    if (!IsInstanceOfExpectedClass)
      goto LABEL_14;
    objc_msgSend(v10, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CCPBDataWriterWriteDataField();

    if (!v11)
    {
LABEL_4:
      v17 = v15;
      if (v12)
        goto LABEL_5;
LABEL_18:
      v15 = v17;
LABEL_19:
      objc_msgSend(v13, "immutableData", v29, v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v27, a6);

      v25 = self;
      goto LABEL_21;
    }
  }
  else
  {
    v15 = 0;
    if (!v11)
      goto LABEL_4;
  }
  objc_opt_class();
  v36 = v15;
  v26 = CCValidateIsInstanceOfExpectedClass();
  v17 = v15;

  if (!v26)
  {
    CCSetError();
    v25 = 0;
    v15 = v17;
    goto LABEL_21;
  }
  CCPBDataWriterWriteRepeatedUInt32Field();
  if (!v12)
    goto LABEL_18;
LABEL_5:
  objc_opt_class();
  v35 = v17;
  v18 = CCValidateArrayValues();
  v15 = v17;

  if (v18)
  {
    v29 = a6;
    v30 = self;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v23), "data", v29, v30, (_QWORD)v31);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          CCPBDataWriterWriteDataField();

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v21);
    }

    a6 = v29;
    self = v30;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  v25 = 0;
LABEL_21:

  return v25;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  char *v5;
  int *v6;
  int *v7;
  void *v8;
  id v9;
  int *v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v20;
  CCSerializedSetSharedItem *v21;
  void *v22;
  CCSerializedSetSharedItem *v23;
  CCSerializedSetSharedItem *sharedItem;
  CCSerializedSetItemInstance *v25;
  CCSerializedSetItemInstance *v26;
  objc_class *v27;
  void *v28;
  CCRepeatedUInt32 *v29;
  CCRepeatedUInt32 *deviceIndexes;
  NSArray *v31;
  NSArray *localInstances;
  objc_class *v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v38;
  void *v39;
  id v40;
  id v41;

  v38 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v38);
  v6 = (int *)MEMORY[0x24BE15728];
  v7 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v5[*MEMORY[0x24BE15728]] < *(_QWORD *)&v5[*MEMORY[0x24BE15720]])
  {
    v39 = 0;
    v8 = 0;
    v9 = 0;
    v10 = (int *)MEMORY[0x24BE15718];
    v11 = (int *)MEMORY[0x24BE15710];
    while (1)
    {
      if (*(_QWORD *)&v5[*v10])
        v12 = 0;
      else
        v12 = v9 == 0;
      if (!v12)
        goto LABEL_39;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v6;
        v17 = *(_QWORD *)&v5[v16];
        if (v17 == -1 || v17 >= *(_QWORD *)&v5[*v7])
          break;
        v18 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v17);
        *(_QWORD *)&v5[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0)
          goto LABEL_17;
        v13 += 7;
        if (v14++ >= 9)
        {
          v15 = 0;
          if (*(_QWORD *)&v5[*v10])
            goto LABEL_38;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_38;
LABEL_18:
      v20 = v15 >> 3;
      if ((v15 >> 3) == 3)
      {
        CCPBReaderReadDataNoCopy();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
          v39 = (void *)objc_opt_new();
        v25 = [CCSerializedSetItemInstance alloc];
        v40 = 0;
        v26 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", v22, &v40);
        v9 = v40;
        if (!v9 && v26)
          objc_msgSend(v39, "addObject:", v26);

      }
      else
      {
        if ((_DWORD)v20 == 2)
        {
          if (!v8)
            v8 = (void *)objc_opt_new();
          CCPBReaderAppendRepeatedUInt32FieldValues();
LABEL_33:
          v9 = 0;
          goto LABEL_35;
        }
        if ((_DWORD)v20 != 1)
        {
          if ((CCPBReaderSkipValueWithTag() & 1) == 0)
          {
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            CCSkipFieldErrorForMessage();
            v9 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_35;
          }
          goto LABEL_33;
        }
        v21 = [CCSerializedSetSharedItem alloc];
        CCPBReaderReadDataNoCopy();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v23 = -[CCItemMessage initWithData:error:](v21, "initWithData:error:", v22, &v41);
        v9 = v41;
        sharedItem = self->_sharedItem;
        self->_sharedItem = v23;

      }
LABEL_35:
      if (*(_QWORD *)&v5[*v6] >= *(_QWORD *)&v5[*v7])
        goto LABEL_39;
    }
  }
  v8 = 0;
  v39 = 0;
LABEL_38:
  v9 = 0;
LABEL_39:
  v29 = (CCRepeatedUInt32 *)objc_msgSend(v8, "copy");
  deviceIndexes = self->_deviceIndexes;
  self->_deviceIndexes = v29;

  v31 = (NSArray *)objc_msgSend(v39, "copy");
  localInstances = self->_localInstances;
  self->_localInstances = v31;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v36 = 1;
      goto LABEL_44;
    }
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v36 = 0;
LABEL_44:

  return v36;
}

- (CCSerializedSetSharedItem)sharedItem
{
  return (CCSerializedSetSharedItem *)(id)-[CCSerializedSetSharedItem copy](self->_sharedItem, "copy");
}

- (NSArray)localInstances
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_localInstances, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  unsigned __int16 *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x24BE15620];
  if (self->_sharedItem)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", (unsigned __int16)*MEMORY[0x24BE15620], self->_sharedItem);
    v9[2](v9, v6);

  }
  if (self->_deviceIndexes)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedUInt32Value:", *v5, self->_deviceIndexes);
    v9[2](v9, v7);

  }
  if (self->_localInstances)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", *v5, self->_localInstances);
    v9[2](v9, v8);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_sharedItem)
  {
    -[CCSerializedSetItem sharedItem](self, "sharedItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sharedItem"));

  }
  if (self->_deviceIndexes)
  {
    v6 = (void *)objc_opt_new();
    -[CCSerializedSetItem deviceIndexes](self, "deviceIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __37__CCSerializedSetItem_jsonDictionary__block_invoke;
    v22[3] = &unk_251030AB8;
    v23 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateUInt32ValuesWithBlock:", v22);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceIndexes"));
  }
  v9 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CCSerializedSetItem localInstances](self, "localInstances", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "jsonDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("localInstances"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (CCSerializedSetItem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  CCSerializedSetSharedItem *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  CCSerializedSetItem *v25;
  uint64_t v26;
  id v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  CCSerializedSetItemInstance *v36;
  CCSerializedSetItemInstance *v37;
  id v38;
  BOOL v39;
  void *v40;
  id v42;
  id *v43;
  void *v44;
  CCSerializedSetItem *v45;
  CCSerializedSetItem *v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61[2];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v61[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v61[0] = 0;
      v10 = -[CCSerializedSetSharedItem initWithJSONDictionary:error:]([CCSerializedSetSharedItem alloc], "initWithJSONDictionary:error:", v9, v61);
      v11 = v61[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();

        v25 = 0;
        goto LABEL_41;
      }

      v9 = v10;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceIndexes"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v12 = 0;
      goto LABEL_20;
    }
    v14 = (void *)v13;
    objc_opt_class();
    v60 = v8;
    v15 = CCValidateIsInstanceOfExpectedClass();
    v16 = v8;

    if ((v15 & 1) != 0)
    {
      v43 = a4;
      v45 = self;
      v47 = v6;
      v12 = (void *)objc_opt_new();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v57;
        while (2)
        {
          v21 = 0;
          v22 = v16;
          do
          {
            if (*(_QWORD *)v57 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v21);
            objc_opt_class();
            v55 = v22;
            v24 = CCValidateIsInstanceOfExpectedClass();
            v16 = v22;

            if (!v24)
            {
              CCSetError();

              v25 = 0;
              v12 = v17;
              v8 = v16;
              self = v45;
              v6 = v47;
              goto LABEL_41;
            }
            objc_msgSend(v12, "appendUInt32Value:", objc_msgSend(v23, "unsignedIntValue"));
            ++v21;
            v22 = v16;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          if (v19)
            continue;
          break;
        }
      }

      v8 = v16;
      self = v45;
      v6 = v47;
      a4 = v43;
LABEL_20:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localInstances"));
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (id)v26;
        objc_opt_class();
        v54 = v8;
        v28 = CCValidateIsInstanceOfExpectedClass();
        v29 = v8;

        if ((v28 & 1) == 0)
        {
          CCSetError();
          v25 = 0;
          goto LABEL_40;
        }
        v42 = v29;
        v44 = v9;
        v46 = self;
        v48 = v6;
        v30 = (void *)objc_opt_new();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v27 = v27;
        v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v51 != v33)
                objc_enumerationMutation(v27);
              v35 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
              v36 = [CCSerializedSetItemInstance alloc];
              v49 = 0;
              v37 = -[CCSerializedSetItemInstance initWithJSONDictionary:error:](v36, "initWithJSONDictionary:error:", v35, &v49);
              v38 = v49;
              if (v37)
                v39 = v38 == 0;
              else
                v39 = 0;
              if (!v39)
              {
                v40 = v38;
                CCSetError();

                v25 = 0;
                self = v46;
                v6 = v48;
                v9 = v44;
                v29 = v42;
                goto LABEL_40;
              }
              objc_msgSend(v30, "addObject:", v37);

            }
            v32 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          }
          while (v32);
        }

        v9 = v44;
        self = v46;
      }
      else
      {
        v48 = v6;
        v30 = 0;
        v29 = v8;
      }
      v25 = -[CCSerializedSetItem initWithSharedItem:deviceIndexes:localInstances:error:]([CCSerializedSetItem alloc], "initWithSharedItem:deviceIndexes:localInstances:error:", v9, v12, v30, a4);
      v27 = v30;
      v6 = v48;
LABEL_40:

      v8 = v29;
      goto LABEL_41;
    }
    CCSetError();
    v25 = 0;
    v12 = v14;
    v8 = v16;
LABEL_41:

    goto LABEL_42;
  }
  CCSetError();
  v25 = 0;
LABEL_42:

  return v25;
}

- (CCRepeatedUInt32)deviceIndexes
{
  return self->_deviceIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localInstances, 0);
  objc_storeStrong((id *)&self->_deviceIndexes, 0);
  objc_storeStrong((id *)&self->_sharedItem, 0);
}

void __37__CCSerializedSetItem_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (unsigned)itemType
{
  return *MEMORY[0x24BE15620];
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (Class)contentMessageClass
{
  return 0;
}

@end
