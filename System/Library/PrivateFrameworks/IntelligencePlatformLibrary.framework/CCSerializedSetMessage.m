@implementation CCSerializedSetMessage

- (CCSerializedSetMessage)initWithItemType:(id)a3 accountIdentifier:(id)a4 descriptors:(id)a5 sharedItemCount:(id)a6 localItemInstanceCount:(id)a7 devices:(id)a8 items:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int IsInstanceOfExpectedClass;
  id v24;
  void *v25;
  id *v26;
  id v27;
  int v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  CCSerializedSetMessage *v36;
  id *v37;
  int v38;
  id v39;
  int v40;
  int v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  int v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  void *v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  uint64_t v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v68 = a8;
  v20 = a9;
  v21 = (void *)objc_opt_new();
  v66 = v15;
  if (v15)
  {
    v22 = v16;
    objc_opt_class();
    v87 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v24 = 0;
    v25 = v15;
    v15 = v24;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v36 = 0;
      goto LABEL_58;
    }
    v26 = a10;
    objc_msgSend(v25, "unsignedIntValue");
    CCPBDataWriterWriteUint32Field();
    v16 = v22;
    if (!v22)
    {
LABEL_4:
      v65 = v16;
      v27 = v15;
      goto LABEL_8;
    }
  }
  else
  {
    v26 = a10;
    if (!v16)
      goto LABEL_4;
  }
  objc_opt_class();
  v86 = v15;
  v28 = CCValidateIsInstanceOfExpectedClass();
  v27 = v15;

  if (v28)
  {
    v65 = v16;
    CCPBDataWriterWriteStringField();
LABEL_8:
    v64 = v20;
    if (v17)
    {
      objc_opt_class();
      v85 = v27;
      v29 = CCValidateArrayValues();
      v15 = v27;

      if (!v29)
      {
        CCSetError();
        v36 = 0;
LABEL_57:
        v22 = v65;
        goto LABEL_58;
      }
      v59 = v18;
      v60 = v19;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v63 = v17;
      v30 = v17;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v82 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "data", v59);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            CCPBDataWriterWriteDataField();

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        }
        while (v32);
      }

      v18 = v59;
      v19 = v60;
    }
    else
    {
      v63 = 0;
      v15 = v27;
    }
    v37 = v26;
    if (v18)
    {
      objc_opt_class();
      v80 = v15;
      v38 = CCValidateIsInstanceOfExpectedClass();
      v39 = v15;

      if (!v38)
      {
        CCSetError();
        v36 = 0;
        v15 = v39;
        goto LABEL_55;
      }
      objc_msgSend(v18, "unsignedIntValue");
      CCPBDataWriterWriteUint32Field();
      if (!v19)
        goto LABEL_24;
    }
    else
    {
      v39 = v15;
      if (!v19)
      {
LABEL_24:
        v15 = v39;
LABEL_29:
        if (v68)
        {
          objc_opt_class();
          v78 = v15;
          v41 = CCValidateArrayValues();
          v42 = v15;

          if (!v41)
          {
            CCSetError();
            v36 = 0;
            v15 = v42;
            goto LABEL_55;
          }
          v61 = v19;
          v43 = v18;
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v44 = v68;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v75;
            do
            {
              for (j = 0; j != v46; ++j)
              {
                if (*(_QWORD *)v75 != v47)
                  objc_enumerationMutation(v44);
                objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * j), "data", v59);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
            }
            while (v46);
          }

          v18 = v43;
          v19 = v61;
        }
        else
        {
          v42 = v15;
        }
        if (v64)
        {
          objc_opt_class();
          v73 = v42;
          v50 = CCValidateArrayValues();
          v15 = v42;

          if (!v50)
          {
            CCSetError();
            v36 = 0;
            v20 = v64;
            goto LABEL_56;
          }
          v59 = v18;
          v62 = v19;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v51 = v64;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v70;
            do
            {
              for (k = 0; k != v53; ++k)
              {
                if (*(_QWORD *)v70 != v54)
                  objc_enumerationMutation(v51);
                objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * k), "data", v59);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                CCPBDataWriterWriteDataField();

              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v88, 16);
            }
            while (v53);
          }

          v18 = v59;
          v19 = v62;
        }
        else
        {
          v15 = v42;
        }
        objc_msgSend(v21, "immutableData", v59);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v57, v37);

        self = v36;
LABEL_55:
        v20 = v64;
LABEL_56:
        v17 = v63;
        goto LABEL_57;
      }
    }
    objc_opt_class();
    v79 = v39;
    v40 = CCValidateIsInstanceOfExpectedClass();
    v15 = v39;

    if (!v40)
    {
      CCSetError();
      v36 = 0;
      goto LABEL_55;
    }
    objc_msgSend(v19, "unsignedIntValue");
    CCPBDataWriterWriteUint32Field();
    goto LABEL_29;
  }
  CCSetError();
  v36 = 0;
  v15 = v27;
  v22 = v16;
LABEL_58:

  return v36;
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
  BOOL v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  objc_class *v26;
  void *v27;
  NSString *v28;
  NSString *accountIdentifier;
  void *v30;
  CCSerializedSetDescriptor *v31;
  CCSerializedSetDescriptor *v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  CCSerializedSetDevice *v46;
  CCSerializedSetItem *v47;
  uint64_t v48;
  NSArray *v49;
  NSArray *descriptors;
  NSArray *v51;
  NSArray *devices;
  NSArray *v53;
  NSArray *items;
  objc_class *v55;
  void *v56;
  void *v57;
  BOOL v58;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;

  v60 = a3;
  v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v60);
  v6 = (int *)MEMORY[0x24BE15728];
  v7 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v5[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v5[*MEMORY[0x24BE15720]])
  {
    v61 = 0;
    v62 = 0;
    v8 = 0;
LABEL_77:
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v61 = 0;
    v62 = 0;
    v9 = 0;
    v10 = (int *)MEMORY[0x24BE15718];
    v11 = (int *)MEMORY[0x24BE15710];
    do
    {
      if (*(_QWORD *)&v5[*v10])
        v12 = 0;
      else
        v12 = v9 == 0;
      if (!v12)
        break;
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
        v19 = v14++ >= 9;
        if (v19)
        {
          v15 = 0;
          if (*(_QWORD *)&v5[*v10])
            goto LABEL_77;
          goto LABEL_18;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_17:
      if (*(_QWORD *)&v5[*v10])
        goto LABEL_77;
LABEL_18:
      switch((v15 >> 3))
      {
        case 1u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v5[v23];
            if (v24 == -1 || v24 >= *(_QWORD *)&v5[*v7])
              break;
            v25 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v24);
            *(_QWORD *)&v5[v23] = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if ((v25 & 0x80) == 0)
              goto LABEL_62;
            v20 += 7;
            v19 = v21++ >= 9;
            if (v19)
            {
              LODWORD(v22) = 0;
              goto LABEL_64;
            }
          }
          *(_QWORD *)&v5[*v10] = 1;
LABEL_62:
          if (*(_QWORD *)&v5[*v10])
            LODWORD(v22) = 0;
LABEL_64:
          v9 = 0;
          self->_itemType = v22;
          v48 = 16;
          goto LABEL_73;
        case 2u:
          CCPBReaderReadStringNoCopy();
          v28 = (NSString *)objc_claimAutoreleasedReturnValue();
          accountIdentifier = self->_accountIdentifier;
          self->_accountIdentifier = v28;

          goto LABEL_29;
        case 3u:
          CCPBReaderReadDataNoCopy();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v62)
            v62 = (void *)objc_opt_new();
          v31 = [CCSerializedSetDescriptor alloc];
          v65 = 0;
          v32 = -[CCItemMessage initWithData:error:](v31, "initWithData:error:", v30, &v65);
          v9 = v65;
          if (v9 || !v32)
            goto LABEL_60;
          v33 = v62;
          goto LABEL_59;
        case 4u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v5[v37];
            if (v38 == -1 || v38 >= *(_QWORD *)&v5[*v7])
            {
              *(_QWORD *)&v5[*v10] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v38);
              *(_QWORD *)&v5[v37] = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v19 = v35++ >= 9;
                if (v19)
                {
                  LODWORD(v36) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(_QWORD *)&v5[*v10])
            LODWORD(v36) = 0;
LABEL_68:
          v9 = 0;
          self->_sharedItemCount = v36;
          v48 = 17;
          goto LABEL_73;
        case 5u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          break;
        case 6u:
          CCPBReaderReadDataNoCopy();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v61)
            v61 = (void *)objc_opt_new();
          v46 = [CCSerializedSetDevice alloc];
          v64 = 0;
          v32 = -[CCItemMessage initWithData:error:](v46, "initWithData:error:", v30, &v64);
          v9 = v64;
          if (v9 || !v32)
            goto LABEL_60;
          v33 = v61;
          goto LABEL_59;
        case 7u:
          CCPBReaderReadDataNoCopy();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
            v8 = (void *)objc_opt_new();
          v47 = [CCSerializedSetItem alloc];
          v63 = 0;
          v32 = -[CCItemMessage initWithData:error:](v47, "initWithData:error:", v30, &v63);
          v9 = v63;
          if (v9 || !v32)
            goto LABEL_60;
          v33 = v8;
LABEL_59:
          objc_msgSend(v33, "addObject:", v32);
LABEL_60:

          continue;
        default:
          if ((CCPBReaderSkipValueWithTag() & 1) != 0)
          {
LABEL_29:
            v9 = 0;
          }
          else
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            CCSkipFieldErrorForMessage();
            v9 = (id)objc_claimAutoreleasedReturnValue();

          }
          continue;
      }
      while (1)
      {
        v43 = *v6;
        v44 = *(_QWORD *)&v5[v43];
        if (v44 == -1 || v44 >= *(_QWORD *)&v5[*v7])
          break;
        v45 = *(_BYTE *)(*(_QWORD *)&v5[*v11] + v44);
        *(_QWORD *)&v5[v43] = v44 + 1;
        v42 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0)
          goto LABEL_70;
        v40 += 7;
        v19 = v41++ >= 9;
        if (v19)
        {
          LODWORD(v42) = 0;
          goto LABEL_72;
        }
      }
      *(_QWORD *)&v5[*v10] = 1;
LABEL_70:
      if (*(_QWORD *)&v5[*v10])
        LODWORD(v42) = 0;
LABEL_72:
      v9 = 0;
      self->_localItemInstanceCount = v42;
      v48 = 18;
LABEL_73:
      *((_BYTE *)&self->super.super.isa + v48) = 1;
    }
    while (*(_QWORD *)&v5[*v6] < *(_QWORD *)&v5[*v7]);
  }
  v49 = (NSArray *)objc_msgSend(v62, "copy");
  descriptors = self->_descriptors;
  self->_descriptors = v49;

  v51 = (NSArray *)objc_msgSend(v61, "copy");
  devices = self->_devices;
  self->_devices = v51;

  v53 = (NSArray *)objc_msgSend(v8, "copy");
  items = self->_items;
  self->_items = v53;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v5[*MEMORY[0x24BE15718]])
    {
      v58 = 1;
      goto LABEL_83;
    }
    v55 = (objc_class *)objc_opt_class();
    NSStringFromClass(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v58 = 0;
LABEL_83:

  return v58;
}

- (NSString)accountIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_accountIdentifier, "copy");
}

- (NSArray)descriptors
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_descriptors, 1);
}

- (NSArray)devices
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_devices, 1);
}

- (NSArray)items
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_items, 1);
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  unsigned __int16 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x24BE15620];
  if (self->_hasItemType)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", (unsigned __int16)*MEMORY[0x24BE15620], self->_itemType);
    v13[2](v13, v6);

  }
  if (self->_accountIdentifier)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", *v5, self->_accountIdentifier);
    v13[2](v13, v7);

  }
  if (self->_descriptors)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", *v5, self->_descriptors);
    v13[2](v13, v8);

  }
  if (self->_hasSharedItemCount)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", *v5, self->_sharedItemCount);
    v13[2](v13, v9);

  }
  if (self->_hasLocalItemInstanceCount)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:uint32Value:", *v5, self->_localItemInstanceCount);
    v13[2](v13, v10);

  }
  if (self->_devices)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", *v5, self->_devices);
    v13[2](v13, v11);

  }
  if (self->_items)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedSubMessageValue:", *v5, self->_items);
    v13[2](v13, v12);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (self->_hasItemType)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSerializedSetMessage itemType](self, "itemType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("itemType"));

  }
  if (self->_accountIdentifier)
  {
    -[CCSerializedSetMessage accountIdentifier](self, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accountIdentifier"));

  }
  v6 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CCSerializedSetMessage descriptors](self, "descriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "jsonDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("descriptors"));
  if (self->_hasSharedItemCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSerializedSetMessage sharedItemCount](self, "sharedItemCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sharedItemCount"));

  }
  if (self->_hasLocalItemInstanceCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[CCSerializedSetMessage localItemInstanceCount](self, "localItemInstanceCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("localItemInstanceCount"));

  }
  v15 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[CCSerializedSetMessage devices](self, "devices");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "jsonDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v18);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("devices"));
  v22 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CCSerializedSetMessage items](self, "items", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "jsonDictionary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v25);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("items"));
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (CCSerializedSetMessage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  CCSerializedSetDescriptor *v22;
  CCSerializedSetDescriptor *v23;
  id v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  CCSerializedSetDevice *v39;
  CCSerializedSetDevice *v40;
  id v41;
  BOOL v42;
  void *v43;
  CCSerializedSetMessage *v44;
  uint64_t v45;
  id v46;
  char v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  CCSerializedSetItem *v55;
  CCSerializedSetItem *v56;
  id v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id *v66;
  id *v67;
  void *v68;
  void *v69;
  void *v70;
  CCSerializedSetMessage *v71;
  CCSerializedSetMessage *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  v94 = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accountIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("descriptors"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      v93 = v8;
      v13 = CCValidateIsInstanceOfExpectedClass();
      v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v44 = 0;
LABEL_57:

        v8 = v14;
        goto LABEL_58;
      }
      v66 = a4;
      v68 = v9;
      v74 = v10;
      v15 = (void *)objc_opt_new();
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v90 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
            v22 = [CCSerializedSetDescriptor alloc];
            v88 = 0;
            v23 = -[CCSerializedSetDescriptor initWithJSONDictionary:error:](v22, "initWithJSONDictionary:error:", v21, &v88);
            v24 = v88;
            if (v23)
              v25 = v24 == 0;
            else
              v25 = 0;
            if (!v25)
            {
              v43 = v24;
              CCSetError();

              v44 = 0;
              v12 = v16;
              v9 = v68;
              v10 = v74;
              goto LABEL_57;
            }
            objc_msgSend(v15, "addObject:", v23);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        }
        while (v18);
      }

      v9 = v68;
      v10 = v74;
      a4 = v66;
    }
    else
    {
      v15 = 0;
      v14 = v8;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharedItemCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("localItemInstanceCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("devices"));
    v28 = objc_claimAutoreleasedReturnValue();
    v73 = v15;
    v75 = v10;
    v65 = v27;
    if (v28)
    {
      v29 = (void *)v28;
      objc_opt_class();
      v87 = v14;
      v30 = CCValidateIsInstanceOfExpectedClass();
      v31 = v14;

      if ((v30 & 1) == 0)
      {
        CCSetError();
        v44 = 0;
        v32 = v29;
        v27 = v65;
        v14 = v31;
LABEL_56:

        v12 = v73;
        v10 = v75;
        goto LABEL_57;
      }
      v62 = v26;
      v64 = v31;
      v69 = v9;
      v71 = self;
      v32 = (void *)objc_opt_new();
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v33 = v29;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v84;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v84 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j);
            v39 = [CCSerializedSetDevice alloc];
            v82 = 0;
            v40 = -[CCSerializedSetDevice initWithJSONDictionary:error:](v39, "initWithJSONDictionary:error:", v38, &v82);
            v41 = v82;
            if (v40)
              v42 = v41 == 0;
            else
              v42 = 0;
            if (!v42)
            {
              v59 = v41;
              CCSetError();

              v44 = 0;
              v32 = v33;
              v9 = v69;
              self = v71;
              v26 = v62;
              v14 = v64;
              v27 = v65;
              goto LABEL_56;
            }
            objc_msgSend(v32, "addObject:", v40);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        }
        while (v35);
      }

      self = v71;
      v27 = v65;
      v26 = v62;
    }
    else
    {
      v32 = 0;
      v64 = v14;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("items"));
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (id)v45;
      objc_opt_class();
      v81 = v64;
      v47 = CCValidateIsInstanceOfExpectedClass();
      v48 = v64;

      if ((v47 & 1) == 0)
      {
        CCSetError();
        v44 = 0;
        v27 = v65;
        v14 = v48;
        goto LABEL_55;
      }
      v63 = v26;
      v67 = a4;
      v70 = v9;
      v72 = self;
      v14 = v48;
      v49 = (void *)objc_opt_new();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v46 = v46;
      v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v78;
        do
        {
          for (k = 0; k != v51; ++k)
          {
            if (*(_QWORD *)v78 != v52)
              objc_enumerationMutation(v46);
            v54 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
            v55 = [CCSerializedSetItem alloc];
            v76 = 0;
            v56 = -[CCSerializedSetItem initWithJSONDictionary:error:](v55, "initWithJSONDictionary:error:", v54, &v76);
            v57 = v76;
            if (v56)
              v58 = v57 == 0;
            else
              v58 = 0;
            if (!v58)
            {
              v60 = v57;
              CCSetError();

              v44 = 0;
              v9 = v70;
              self = v72;
              v26 = v63;
              v27 = v65;
              goto LABEL_55;
            }
            objc_msgSend(v49, "addObject:", v56);

          }
          v51 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
        }
        while (v51);
      }

      self = v72;
      v27 = v65;
      a4 = v67;
      v26 = v63;
    }
    else
    {
      v49 = 0;
      v14 = v64;
    }
    v44 = -[CCSerializedSetMessage initWithItemType:accountIdentifier:descriptors:sharedItemCount:localItemInstanceCount:devices:items:error:]([CCSerializedSetMessage alloc], "initWithItemType:accountIdentifier:descriptors:sharedItemCount:localItemInstanceCount:devices:items:error:", v9, v75, v73, v26, v27, v32, v49, a4);
    v46 = v49;
LABEL_55:

    goto LABEL_56;
  }
  CCSetError();
  v44 = 0;
LABEL_58:

  return v44;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (unsigned)sharedItemCount
{
  return self->_sharedItemCount;
}

- (unsigned)localItemInstanceCount
{
  return self->_localItemInstanceCount;
}

- (BOOL)hasItemType
{
  return self->_hasItemType;
}

- (void)setHasItemType:(BOOL)a3
{
  self->_hasItemType = a3;
}

- (BOOL)hasSharedItemCount
{
  return self->_hasSharedItemCount;
}

- (void)setHasSharedItemCount:(BOOL)a3
{
  self->_hasSharedItemCount = a3;
}

- (BOOL)hasLocalItemInstanceCount
{
  return self->_hasLocalItemInstanceCount;
}

- (void)setHasLocalItemInstanceCount:(BOOL)a3
{
  self->_hasLocalItemInstanceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
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
