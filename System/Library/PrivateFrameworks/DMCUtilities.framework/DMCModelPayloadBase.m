@implementation DMCModelPayloadBase

- (void)mergeUnknownKeysFrom:(id)a3 parentKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  DMCModelPayloadBase *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "unknownPayloadKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v21 = self;
    v10 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v6, "unknownPayloadKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "unknownPayloadKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    -[DMCModelPayloadBase unknownPayloadKeys](v21, "unknownPayloadKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setByAddingObjectsFromSet:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCModelPayloadBase setUnknownPayloadKeys:](v21, "setUnknownPayloadKeys:", v20);

  }
}

- (id)createNestedObjectWithClass:(Class)a3 serializationType:(signed __int16)a4 parentKey:(id)a5 payload:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v9 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  -[objc_class load:serializationType:error:](a3, "load:serializationType:error:", a6, v9, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[DMCModelPayloadBase mergeUnknownKeysFrom:parentKey:](self, "mergeUnknownKeysFrom:parentKey:", v13, v12);
    v14 = v13;
  }
  else if (a7)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong nested item, key: %@"), v12, *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)load:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  LODWORD(a5) = objc_msgSend(v8, "loadFromDictionary:serializationType:error:", v7, v6, a5);

  if ((_DWORD)a5)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)loadData:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v6 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a5);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!(_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, a5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a1, "load:serializationType:error:", v10, v6, a5);
      a5 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a5)
    {
      if (!*a5)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D50];
        v18 = CFSTR("Root item is not a dictionary object");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v12);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      a5 = 0;
    }
    goto LABEL_15;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported serialization type: %d"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
  v10 = 0;
LABEL_15:

  return a5;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)serializeAsDataWithType:(signed __int16)a3 error:(id *)a4
{
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v8 = (void *)MEMORY[0x1E0CB36D8];
    -[DMCModelPayloadBase serializeWithType:](self, "serializeWithType:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithJSONObject:options:error:", v6, 1, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0CB38B0];
    -[DMCModelPayloadBase serializeWithType:](self, "serializeWithType:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 200, 0, v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v7;

    return v9;
  }
  if (a4)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported serialization type: %d"), a3, *MEMORY[0x1E0CB2D50]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v13);
    *v4 = (id)objc_claimAutoreleasedReturnValue();

    v4 = 0;
  }
  return v4;
}

- (BOOL)_loadObjectOfClass:(Class)a3 fromDictionary:(id)a4 usingKey:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 payloadValue:(id *)a8 error:(id *)a9
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v11 = a6;
  v28[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a7;
  objc_msgSend(a4, "objectForKey:", v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    if (v11)
    {
      if (a9)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing required key: %@"), v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v20);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v17 = 0;
      *a8 = 0;
      goto LABEL_11;
    }
    v15 = v14;
    if (!v15)
      goto LABEL_3;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_3:
    v16 = objc_retainAutorelease(v15);
    *a8 = v16;

    v17 = 1;
    goto LABEL_11;
  }
  if (a9)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong type, key: %@"), v13, *MEMORY[0x1E0CB2D50]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v23);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  *a8 = 0;

  v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)loadStringFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v23;

  v10 = a6;
  v14 = a5;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v23 = 0;
  v18 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v17, v16, v10, v15, &v23, a8);

  v19 = v23;
  v20 = v19;
  if (v18 && v19 != 0)
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v19, v14);

  return v18;
}

- (BOOL)loadIntegerFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v22;
  id v24;

  v10 = a6;
  v14 = a5;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v24 = 0;
  v18 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v17, v16, v10, v15, &v24, a8);

  v19 = v24;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "integerValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v22, v14);

  }
  return v18;
}

- (BOOL)loadFloatFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v22;
  void *v23;
  id v25;

  v10 = a6;
  v14 = a5;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v25 = 0;
  v18 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v17, v16, v10, v15, &v25, a8);

  v19 = v25;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v19, "floatValue");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v23, v14);

  }
  return v18;
}

- (BOOL)loadBooleanFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v22;
  id v24;

  v10 = a6;
  v14 = a5;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v24 = 0;
  v18 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v17, v16, v10, v15, &v24, a8);

  v19 = v24;
  v20 = v19;
  if (v18 && v19 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v19, "BOOLValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v22, v14);

  }
  return v18;
}

- (BOOL)loadDateFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9
{
  int v9;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void **v31;
  uint64_t *v32;
  void *v33;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v9 = a8;
  v11 = a6;
  v41[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = v15;
  v20 = v19;
  v21 = v19;
  if (v9 == 1)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v22)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "rmmodel_sharedRFC3339DateFormatter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dateFromString:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v36 = v16;
        v37 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
      if (a9)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot decode date, key: %@"), v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v29;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v39;
        v32 = &v38;
        goto LABEL_16;
      }
    }
    else if (a9)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong type, key: %@"), v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v29;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = (void **)v41;
      v32 = &v40;
LABEL_16:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v33);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(v25) = 0;
    v21 = v20;
    goto LABEL_18;
  }
LABEL_7:
  v35 = 0;
  v25 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v21, v16, v11, v18, &v35, a9);
  v26 = v35;
  v22 = v26;
  if (v25 && v26 != 0)
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v26, v17);
LABEL_18:

  return v25;
}

- (BOOL)loadDataFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 error:(id *)a9
{
  int v9;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void **v31;
  uint64_t *v32;
  void *v33;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v9 = a8;
  v11 = a6;
  v41[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = v15;
  v20 = v19;
  v21 = v19;
  if (v9 == 1)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v22)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
      if (v23)
      {
        v24 = (void *)v23;
        v36 = v16;
        v37 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
      if (a9)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot decode base64, key: %@"), v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v29;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v39;
        v32 = &v38;
        goto LABEL_16;
      }
    }
    else if (a9)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong type, key: %@"), v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v29;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = (void **)v41;
      v32 = &v40;
LABEL_16:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v33);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(v25) = 0;
    v21 = v20;
    goto LABEL_18;
  }
LABEL_7:
  v35 = 0;
  v25 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v21, v16, v11, v18, &v35, a9);
  v26 = v35;
  v22 = v26;
  if (v25 && v26 != 0)
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v26, v17);
LABEL_18:

  return v25;
}

- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 validator:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 error:(id *)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  uint64_t (**v18)(id, _QWORD, id *);
  id v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  char v30;
  id v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v10 = a7;
  v50 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (uint64_t (**)(id, _QWORD, id *))a6;
  v19 = a8;
  v46 = 0;
  v20 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v15, v16, v10, v19, &v46, a9);
  v21 = v46;
  v22 = v21;
  if (v20)
  {
    v37 = v21;
    v39 = v15;
    v40 = v17;
    v38 = v16;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v23);
          if (v18)
          {
            v29 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            v41 = v26;
            v30 = v18[2](v18, v29, &v41);
            v31 = v41;

            if ((v30 & 1) == 0)
            {
              v16 = v38;
              v15 = v39;
              v17 = v40;
              v22 = v37;
              if (a9)
              {
                if (v31)
                {
                  *a9 = objc_retainAutorelease(v31);
                }
                else
                {
                  v36 = (void *)MEMORY[0x1E0CB35C8];
                  v47 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong array item type, key: %@"), v38);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v34);
                  *a9 = (id)objc_claimAutoreleasedReturnValue();

                  v17 = v40;
                }
              }

              v32 = 0;
              goto LABEL_24;
            }
            v26 = v31;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (v25)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }

    if (v23)
    {
      v17 = v40;
      -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v23, v40);
      v32 = 1;
      v31 = v26;
      v16 = v38;
      v15 = v39;
    }
    else
    {
      v32 = 1;
      v31 = v26;
      v16 = v38;
      v15 = v39;
      v17 = v40;
    }
    v22 = v37;
LABEL_24:

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (BOOL)loadArrayFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 nested:(BOOL)a7 isRequired:(BOOL)a8 defaultValue:(id)a9 serializationType:(signed __int16)a10 error:(id *)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  id obja;
  void *v44;
  _BOOL4 v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;

  v19 = a8;
  v45 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v55 = 0;
  v46 = v16;
  LODWORD(v19) = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v15, v16, v19, v18, &v55, a11);
  v20 = v55;
  v21 = v20;
  if ((_DWORD)v19)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v21;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v39)
    {
      v22 = a10;
      v40 = *(_QWORD *)v52;
      v37 = v17;
      v38 = v15;
      v35 = v21;
      v36 = v18;
      while (2)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v52 != v40)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v23);
          v41 = v23;
          if (v45)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a11)
              {
                v34 = (void *)MEMORY[0x1E0CB35C8];
                v57 = *MEMORY[0x1E0CB2D50];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wrong array item type, key: %@"), v46);
                v19 = objc_claimAutoreleasedReturnValue();
                v58 = v19;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
                v25 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("error"), 1, v25);
                *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

              }
              LOBYTE(v19) = 0;
LABEL_27:

              goto LABEL_28;
            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
            v19 = objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v25 = v24;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v48;
              while (2)
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v48 != v28)
                    objc_enumerationMutation(v25);
                  -[DMCModelPayloadBase createNestedObjectWithClass:serializationType:parentKey:payload:error:](self, "createNestedObjectWithClass:serializationType:parentKey:payload:error:", a6, v22, v46, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), a11);
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (!v30)
                  {
                    v17 = v37;
                    v15 = v38;
                    v21 = v35;
                    v18 = v36;
                    goto LABEL_25;
                  }
                  v31 = (void *)v30;
                  objc_msgSend((id)v19, "addObject:", v30);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
                if (v27)
                  continue;
                break;
              }
            }

            v32 = (void *)objc_msgSend((id)v19, "copy");
            objc_msgSend(v44, "addObject:", v32);

            v17 = v37;
            v15 = v38;
            v21 = v35;
            v18 = v36;
          }
          else
          {
            -[DMCModelPayloadBase createNestedObjectWithClass:serializationType:parentKey:payload:error:](self, "createNestedObjectWithClass:serializationType:parentKey:payload:error:", a6, v22, v46, v24, a11);
            v19 = objc_claimAutoreleasedReturnValue();
            if (!v19)
              goto LABEL_27;
            objc_msgSend(v44, "addObject:", v19);
          }

          v23 = v41 + 1;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v39)
          continue;
        break;
      }
    }

    if (obj)
    {
      obja = (id)objc_msgSend(v44, "copy");
      -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:");
      LOBYTE(v19) = 1;

    }
    else
    {
      LOBYTE(v19) = 1;
    }
LABEL_28:

  }
  return v19;
}

- (BOOL)loadDictionaryFromDictionary:(id)a3 usingKey:(id)a4 forKeyPath:(id)a5 classType:(Class)a6 isRequired:(BOOL)a7 defaultValue:(id)a8 serializationType:(signed __int16)a9 error:(id *)a10
{
  _BOOL8 v11;
  id v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v22;

  v11 = a7;
  v16 = a5;
  v22 = 0;
  v17 = -[DMCModelPayloadBase getModelObjectFromDictionary:usingKey:classType:isRequired:defaultValue:serializationType:payloadValue:error:](self, "getModelObjectFromDictionary:usingKey:classType:isRequired:defaultValue:serializationType:payloadValue:error:", a3, a4, a6, v11, a8, a9, &v22, a10);
  v18 = v22;
  v19 = v18;
  if (v17 && v18 != 0)
    -[DMCModelPayloadBase setValue:forKey:](self, "setValue:forKey:", v18, v16);

  return v17;
}

- (BOOL)getModelObjectFromDictionary:(id)a3 usingKey:(id)a4 classType:(Class)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8 payloadValue:(id *)a9 error:(id *)a10
{
  uint64_t v10;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v25;
  id v27;

  v10 = a8;
  v12 = a6;
  v16 = a4;
  v17 = a7;
  v18 = a3;
  v27 = 0;
  v19 = -[DMCModelPayloadBase _loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:](self, "_loadObjectOfClass:fromDictionary:usingKey:isRequired:defaultValue:payloadValue:error:", objc_opt_class(), v18, v16, v12, v17, &v27, a10);

  v20 = v27;
  v21 = v20;
  if (v19)
  {
    if (v20)
    {
      -[DMCModelPayloadBase createNestedObjectWithClass:serializationType:parentKey:payload:error:](self, "createNestedObjectWithClass:serializationType:parentKey:payload:error:", a5, v10, v16, v20, a10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = v22 != 0;
      if (v22)
        v25 = objc_retainAutorelease(v22);
      *a9 = v23;

    }
    else
    {
      *a9 = 0;
      v24 = !v12;
    }
  }
  else
  {
    v24 = 0;
    *a9 = 0;
  }

  return v24;
}

- (void)_serializeItemIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 isDefaultValue:(BOOL)a7
{
  BOOL v7;

  v7 = !a7;
  if (!a5)
    v7 = 0;
  if (v7 || a6)
    objc_msgSend(a3, "setObject:forKeyedSubscript:", a5, a4);
}

- (void)serializeStringIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v14, v13, v12, v8, objc_msgSend(v12, "isEqual:", a7));

}

- (void)serializeIntegerIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v16, v12, v15, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeFloatIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a6;
  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v15, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v17, v12, v16, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeBooleanIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v16, v12, v15, v8, objc_msgSend(v13, "isEqual:", v14));

}

- (void)serializeDateIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8
{
  int v8;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a8;
  v10 = a6;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = v15;
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    v19 = v17;
    if (v8 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "rmmodel_sharedRFC3339DateFormatter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringFromDate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v21, v14, v19, v10, objc_msgSend(v18, "isEqual:", v16));

}

- (void)serializeDataIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 isRequired:(BOOL)a6 defaultValue:(id)a7 serializationType:(signed __int16)a8
{
  int v8;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a8;
  v10 = a6;
  v20 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = v15;
  v18 = v17;
  v19 = v17;
  if (v17)
  {
    v19 = v17;
    if (v8 == 1)
    {
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[DMCModelPayloadBase _serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:](self, "_serializeItemIntoDictionary:usingKey:value:isRequired:isDefaultValue:", v20, v14, v19, v10, objc_msgSend(v18, "isEqual:", v16));

}

- (void)serializeArrayIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 itemSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, _QWORD))a6;
  v17 = a8;
  v18 = v17;
  if (v15)
  {
    v27 = v17;
    v28 = a7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v16[2](v16, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

    v18 = v27;
    if (v28)
      goto LABEL_13;
  }
  else
  {
    v19 = 0;
    if (a7)
    {
LABEL_13:
      v26 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v14);

      goto LABEL_14;
    }
  }
  if (v19)
    goto LABEL_13;
LABEL_14:

}

- (void)serializeDictionaryIntoDictionary:(id)a3 usingKey:(id)a4 value:(id)a5 dictSerializer:(id)a6 isRequired:(BOOL)a7 defaultValue:(id)a8
{
  id v13;
  id v14;
  void (**v15)(id, id);
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, id))a6;
  v16 = a8;
  if (v14)
  {
    v15[2](v15, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
      goto LABEL_6;
  }
  else
  {
    v17 = 0;
    if (a7)
    {
LABEL_6:
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v13);
      goto LABEL_7;
    }
  }
  if (v17)
    goto LABEL_6;
LABEL_7:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCModelPayloadBase serializeWithType:](self, "serializeWithType:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

}

- (DMCModelPayloadBase)initWithCoder:(id)a3
{
  id v4;
  DMCModelPayloadBase *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  DMCModelPayloadBase *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMCModelPayloadBase;
  v5 = -[DMCModelPayloadBase init](&v22, sel_init);
  if (!v5)
    goto LABEL_3;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("payload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  LODWORD(v13) = -[DMCModelPayloadBase loadFromDictionary:serializationType:error:](v5, "loadFromDictionary:serializationType:error:", v15, 0, &v21);

  v16 = 0;
  if ((_DWORD)v13)
LABEL_3:
    v16 = v5;

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (NSSet)unknownPayloadKeys
{
  return self->_unknownPayloadKeys;
}

- (void)setUnknownPayloadKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownPayloadKeys, 0);
}

@end
