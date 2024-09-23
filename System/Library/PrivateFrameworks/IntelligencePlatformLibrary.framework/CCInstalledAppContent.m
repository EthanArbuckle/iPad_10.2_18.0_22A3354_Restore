@implementation CCInstalledAppContent

- (CCInstalledAppContent)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 displayAppName:(id)a5 spokenName:(id)a6 alternativeAppNames:(id)a7 carPlayAlternativeDisplayName:(id)a8 spotlightName:(id)a9 providerName:(id)a10 error:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int IsInstanceOfExpectedClass;
  id v24;
  int v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CCInstalledAppContent *v32;
  CCInstalledAppContent *v33;
  void *v34;
  int v35;
  int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  int v42;
  id v43;
  void *v44;
  int v45;
  CCInstalledAppContent *v47;
  int v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v55 = a8;
  v21 = a9;
  v54 = a10;
  v22 = (void *)objc_opt_new();
  v52 = v16;
  if (v16)
  {
    objc_opt_class();
    v64 = 0;
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v24 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      v28 = v17;
      v29 = v18;
      v30 = v19;
      v31 = v20;
      goto LABEL_15;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    v24 = 0;
  }
  v51 = v21;
  if (v17)
  {
    objc_opt_class();
    v63 = v24;
    v25 = CCValidateIsInstanceOfExpectedClass();
    v26 = v24;

    if (!v25)
    {
LABEL_12:
      v28 = v17;
      v29 = v18;
      v30 = v19;
      v31 = v20;
LABEL_13:
      CCSetError();
      v32 = 0;
      v24 = v26;
LABEL_37:
      v33 = self;
      v34 = v55;
LABEL_38:
      v21 = v51;
      goto LABEL_39;
    }
    CCPBDataWriterWriteStringField();
    if (!v18)
    {
LABEL_8:
      v24 = v26;
      if (v19)
        goto LABEL_9;
LABEL_20:
      v26 = v24;
      if (!v20)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else
  {
    v26 = v24;
    if (!v18)
      goto LABEL_8;
  }
  objc_opt_class();
  v62 = v26;
  v35 = CCValidateIsInstanceOfExpectedClass();
  v24 = v26;

  if (!v35)
    goto LABEL_36;
  CCPBDataWriterWriteStringField();
  if (!v19)
    goto LABEL_20;
LABEL_9:
  objc_opt_class();
  v61 = v24;
  v27 = CCValidateIsInstanceOfExpectedClass();
  v26 = v24;

  if (!v27)
    goto LABEL_12;
  CCPBDataWriterWriteStringField();
  if (v20)
  {
LABEL_21:
    objc_opt_class();
    v60 = v26;
    v36 = CCValidateArrayValues();
    v24 = v26;

    if (v36)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v50 = v20;
      v37 = v20;
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v57 != v40)
              objc_enumerationMutation(v37);
            CCPBDataWriterWriteStringField();
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v39);
      }

      v20 = v50;
      goto LABEL_30;
    }
LABEL_36:
    v28 = v17;
    v29 = v18;
    v30 = v19;
    v31 = v20;
    CCSetError();
    v32 = 0;
    goto LABEL_37;
  }
LABEL_11:
  v24 = v26;
LABEL_30:
  if (v55)
  {
    v28 = v17;
    v29 = v18;
    v30 = v19;
    objc_opt_class();
    v42 = CCValidateIsInstanceOfExpectedClass();
    v34 = v55;
    v43 = v24;

    if (!v42)
    {
      v31 = v20;
      CCSetError();
      v32 = 0;
      v24 = v43;
      v33 = self;
      goto LABEL_38;
    }
    v24 = v43;
    CCPBDataWriterWriteStringField();
    v19 = v30;
    v18 = v29;
    v17 = v28;
  }
  v21 = v51;
  if (!v51)
  {
    v31 = v20;
    goto LABEL_42;
  }
  v31 = v20;
  objc_opt_class();
  v44 = v24;
  v45 = CCValidateIsInstanceOfExpectedClass();
  v24 = v24;

  if (v45)
  {
    CCPBDataWriterWriteStringField();
LABEL_42:
    v47 = self;
    v28 = v17;
    if (!v54)
    {
      v29 = v18;
      v30 = v19;
      goto LABEL_47;
    }
    v29 = v18;
    objc_opt_class();
    v48 = CCValidateIsInstanceOfExpectedClass();
    v26 = v24;

    if (v48)
    {
      v30 = v19;
      CCPBDataWriterWriteStringField();
      v24 = v26;
      v47 = self;
      v21 = v51;
LABEL_47:
      objc_msgSend(v22, "immutableData", v50);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[CCItemMessage initWithData:error:](v47, "initWithData:error:", v49, a11);

      v32 = v33;
      goto LABEL_16;
    }
    v30 = v19;
    goto LABEL_13;
  }
  v28 = v17;
  v29 = v18;
  v30 = v19;
LABEL_15:
  CCSetError();
  v32 = 0;
  v33 = self;
LABEL_16:
  v34 = v55;
LABEL_39:

  return v32;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  int *v8;
  int *v9;
  void *v10;
  int *v11;
  int *v12;
  BOOL v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  NSArray *v25;
  NSArray *alternativeAppNames;
  objc_class *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id *v32;
  void *v33;

  v6 = a3;
  v7 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v6);
  v8 = (int *)MEMORY[0x24BE15728];
  v9 = (int *)MEMORY[0x24BE15720];
  if (*(_QWORD *)&v7[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v7[*MEMORY[0x24BE15720]])
  {
    v33 = 0;
    goto LABEL_39;
  }
  v33 = 0;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15718];
  v12 = (int *)MEMORY[0x24BE15710];
  v32 = a4;
LABEL_3:
  if (*(_QWORD *)&v7[*v11])
    v13 = 0;
  else
    v13 = v10 == 0;
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v8;
      v18 = *(_QWORD *)&v7[v17];
      if (v18 == -1 || v18 >= *(_QWORD *)&v7[*v9])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v7[*v12] + v18);
      *(_QWORD *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0)
        goto LABEL_17;
      v14 += 7;
      if (v15++ >= 9)
      {
        v16 = 0;
        if (*(_QWORD *)&v7[*v11])
          goto LABEL_39;
LABEL_18:
        switch((v16 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 16;
            goto LABEL_33;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 24;
            goto LABEL_33;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 32;
            goto LABEL_33;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 40;
            goto LABEL_33;
          case 5u:
            CCPBReaderReadStringNoCopy();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
              v33 = (void *)objc_opt_new();
            if (v23)
              objc_msgSend(v33, "addObject:", v23);
            v10 = 0;
            goto LABEL_34;
          case 6u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 56;
            goto LABEL_33;
          case 7u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 64;
            goto LABEL_33;
          case 8u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            v22 = 72;
LABEL_33:
            v23 = *(Class *)((char *)&self->super.super.isa + v22);
            *(Class *)((char *)&self->super.super.isa + v22) = v21;
            goto LABEL_34;
          default:
            if ((CCPBReaderSkipValueWithTag() & 1) != 0)
            {
              v10 = 0;
            }
            else
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              CCSkipFieldErrorForMessage();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

            }
            if (*(_QWORD *)&v7[*v8] >= *(_QWORD *)&v7[*v9])
              goto LABEL_40;
            goto LABEL_3;
        }
      }
    }
    *(_QWORD *)&v7[*v11] = 1;
LABEL_17:
    if (!*(_QWORD *)&v7[*v11])
      goto LABEL_18;
LABEL_39:
    v10 = 0;
  }
LABEL_40:
  v25 = (NSArray *)objc_msgSend(v33, "copy", v32);
  alternativeAppNames = self->_alternativeAppNames;
  self->_alternativeAppNames = v25;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(_QWORD *)&v7[*MEMORY[0x24BE15718]])
    {
      v30 = 1;
      goto LABEL_45;
    }
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

  }
  v30 = 0;
LABEL_45:

  return v30;
}

- (NSString)bundleIdentifier
{
  return (NSString *)(id)-[NSString copy](self->_bundleIdentifier, "copy");
}

- (NSString)bundleName
{
  return (NSString *)(id)-[NSString copy](self->_bundleName, "copy");
}

- (NSString)displayAppName
{
  return (NSString *)(id)-[NSString copy](self->_displayAppName, "copy");
}

- (NSString)spokenName
{
  return (NSString *)(id)-[NSString copy](self->_spokenName, "copy");
}

- (NSArray)alternativeAppNames
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", self->_alternativeAppNames, 1);
}

- (NSString)carPlayAlternativeDisplayName
{
  return (NSString *)(id)-[NSString copy](self->_carPlayAlternativeDisplayName, "copy");
}

- (NSString)spotlightName
{
  return (NSString *)(id)-[NSString copy](self->_spotlightName, "copy");
}

- (NSString)providerName
{
  return (NSString *)(id)-[NSString copy](self->_providerName, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a3;
  if (self->_bundleIdentifier)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36437, self->_bundleIdentifier);
    v13[2](v13, v5);

  }
  if (self->_bundleName)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36438, self->_bundleName);
    v13[2](v13, v6);

  }
  if (self->_displayAppName)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36439, self->_displayAppName);
    v13[2](v13, v7);

  }
  if (self->_spokenName)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36440, self->_spokenName);
    v13[2](v13, v8);

  }
  if (self->_alternativeAppNames)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:repeatedStringValue:", 36441, self->_alternativeAppNames);
    v13[2](v13, v9);

  }
  if (self->_carPlayAlternativeDisplayName)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36442, self->_carPlayAlternativeDisplayName);
    v13[2](v13, v10);

  }
  if (self->_spotlightName)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36443, self->_spotlightName);
    v13[2](v13, v11);

  }
  if (self->_providerName)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:stringValue:", 36444, self->_providerName);
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  if (self->_bundleIdentifier)
  {
    -[CCInstalledAppContent bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("bundleIdentifier"));

  }
  if (self->_bundleName)
  {
    -[CCInstalledAppContent bundleName](self, "bundleName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleName"));

  }
  if (self->_displayAppName)
  {
    -[CCInstalledAppContent displayAppName](self, "displayAppName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("displayAppName"));

  }
  if (self->_spokenName)
  {
    -[CCInstalledAppContent spokenName](self, "spokenName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("spokenName"));

  }
  if (self->_alternativeAppNames)
  {
    -[CCInstalledAppContent alternativeAppNames](self, "alternativeAppNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("alternativeAppNames"));

  }
  if (self->_carPlayAlternativeDisplayName)
  {
    -[CCInstalledAppContent carPlayAlternativeDisplayName](self, "carPlayAlternativeDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("carPlayAlternativeDisplayName"));

  }
  if (self->_spotlightName)
  {
    -[CCInstalledAppContent spotlightName](self, "spotlightName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("spotlightName"));

  }
  if (self->_providerName)
  {
    -[CCInstalledAppContent providerName](self, "providerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("providerName"));

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (CCInstalledAppContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CCInstalledAppContent *v17;
  id v19;
  CCInstalledAppContent *v20;

  v6 = a3;
  objc_opt_class();
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayAppName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spokenName"));
    v19 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("alternativeAppNames"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("carPlayAlternativeDisplayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("spotlightName"));
    v20 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("providerName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CCInstalledAppContent initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:]([CCInstalledAppContent alloc], "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", v9, v10, v11, v12, v13, v14, v15, v16, a4);

    self = v20;
    v8 = v19;

  }
  else
  {
    CCSetError();
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_spotlightName, 0);
  objc_storeStrong((id *)&self->_carPlayAlternativeDisplayName, 0);
  objc_storeStrong((id *)&self->_alternativeAppNames, 0);
  objc_storeStrong((id *)&self->_spokenName, 0);
  objc_storeStrong((id *)&self->_displayAppName, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (unsigned)itemType
{
  return -29102;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 29102) > 0xAu)
    return 0;
  else
    return *(&off_251030430 + (unsigned __int16)(a3 + 29102));
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
