@implementation NLParameterBundle

+ (id)parameterBundleWithParameters:(id)a3 values:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParameters:values:metadata:", v10, v9, v8);

  return v11;
}

+ (id)parameterBundleWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContentsOfURL:error:", v6, a4);

  return v7;
}

- (NLParameterBundle)initWithParameters:(id)a3 values:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  NLParameterBundle *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  NSArray *parameters;
  NSArray *parameterNames;
  NSArray *v25;
  uint64_t v26;
  NSDictionary *parameterValues;
  uint64_t v28;
  NSDictionary *metadata;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)NLParameterBundle;
  v11 = -[NLParameterBundle init](&v37, sel_init);
  if (v11)
  {
    v31 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v18, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[NSArray containsObject:](v12, "containsObject:", v19);

          if (!v20)
          {
            objc_msgSend(v18, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v12, "addObject:", v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

    v22 = objc_msgSend(v13, "copy");
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v22;

    parameterNames = v11->_parameterNames;
    v11->_parameterNames = v12;
    v25 = v12;

    v9 = v31;
    v26 = objc_msgSend(v31, "copy");
    parameterValues = v11->_parameterValues;
    v11->_parameterValues = (NSDictionary *)v26;

    v28 = objc_msgSend(v10, "copy");
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v28;

    v8 = v32;
  }

  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NLParameterBundle parameters](self, "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "_dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  v19[0] = v3;
  v18[0] = CFSTR("Parameters");
  v18[1] = CFSTR("ParameterValues");
  -[NLParameterBundle parameterValues](self, "parameterValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  v18[2] = CFSTR("Metadata");
  -[NLParameterBundle metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (NLParameterBundle)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  NLParameterBundle *v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  const __CFString *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Parameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("ParameterValues"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v9)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = v8;
                v22 = v9;
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = 0u;
                v24 = 0u;
                v25 = 0u;
                v26 = 0u;
                v11 = v7;
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
                if (v12)
                {
                  v13 = v12;
                  v14 = *(_QWORD *)v24;
                  while (2)
                  {
                    v15 = 0;
                    do
                    {
                      if (*(_QWORD *)v24 != v14)
                        objc_enumerationMutation(v11);
                      v16 = -[NLParameter _initWithDictionaryRepresentation:error:]([NLParameter alloc], "_initWithDictionaryRepresentation:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15), 0);
                      if (!v16)
                      {

                        v8 = v21;
                        v9 = v22;
                        goto LABEL_18;
                      }
                      v17 = v16;
                      objc_msgSend(v10, "addObject:", v16);

                      ++v15;
                    }
                    while (v13 != v15);
                    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
                    if (v13)
                      continue;
                    break;
                  }
                }

                self = -[NLParameterBundle initWithParameters:values:metadata:](self, "initWithParameters:values:metadata:", v10, v21, v22);
                v18 = self;
                goto LABEL_21;
              }
            }
          }
        }
      }
    }
LABEL_18:

  }
  if (!a4)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0CB2D50];
  v28 = CFSTR("Invalid parameter bundle");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v11);
  v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_23:
  return v18;
}

- (NLParameterBundle)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  NLParameterBundle *v9;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, a4),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    self = -[NLParameterBundle initWithDictionaryRepresentation:error:](self, "initWithDictionaryRepresentation:error:", v7, a4);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[NLParameterBundle dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v6, 1, a4);
  else
    v10 = 0;

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NLParameterBundle parameters](self, "parameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "_shortDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLParameterBundle parameterValueForName:](self, "parameterValueForName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ = %@"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v13);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v14 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)NLParameterBundle;
  -[NLParameterBundle description](&v20, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@(%@)"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[NLParameterBundle parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NLParameterBundle parameterValues](self, "parameterValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NLParameterBundle metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NLParameterBundle *v4;
  NLParameterBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = (NLParameterBundle *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_7;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  -[NLParameterBundle parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameterBundle parameters](v5, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqual:", v7))
  {
LABEL_9:

    goto LABEL_10;
  }
  -[NLParameterBundle parameterValues](self, "parameterValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameterBundle parameterValues](v5, "parameterValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqual:", v9))
  {

    goto LABEL_9;
  }
  -[NLParameterBundle metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLParameterBundle metadata](v5, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLParameter requires keyed coding"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  -[NLParameterBundle parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("NLParameters"));

  -[NLParameterBundle parameterValues](self, "parameterValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("NLParameterValues"));

  -[NLParameterBundle metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("NLMetadata"));

}

- (NLParameterBundle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NLParameterBundle *v9;
  id v11;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLParameter requires keyed coding"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("NLParameters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("NLParameterValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("NLMetadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v8 = 0;
    }
  }
  v9 = -[NLParameterBundle initWithParameters:values:metadata:](self, "initWithParameters:values:metadata:", v5, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)parameterForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NLParameterBundle parameters](self, "parameters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)parameterValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NLParameterBundle parameterForName:](self, "parameterForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NLParameterBundle parameterValues](self, "parameterValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)getContinuousParameterValueForName:(id)a3 value:(double *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  -[NLParameterBundle parameterForName:](self, "parameterForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "parameterType"))
  {
    -[NLParameterBundle parameterValueForName:](self, "parameterValueForName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a4)
      {
        objc_msgSend(v10, "doubleValue");
        *(_QWORD *)a4 = v11;
      }
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)getIntegralParameterValueForName:(id)a3 value:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[NLParameterBundle parameterForName:](self, "parameterForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "parameterType") == 1)
  {
    -[NLParameterBundle parameterValueForName:](self, "parameterValueForName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (a4)
        *a4 = objc_msgSend(v9, "integerValue");
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
