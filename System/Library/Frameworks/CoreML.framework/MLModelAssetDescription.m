@implementation MLModelAssetDescription

- (MLModelAssetDescription)initWithModelDescriptionsByFunctionName:(id)a3 functionNames:(id)a4 defaultFunctionName:(id)a5
{
  id v9;
  id v10;
  id v11;
  MLModelAssetDescription *v12;
  MLModelAssetDescription *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MLModelAssetDescription;
  v12 = -[MLModelAssetDescription init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelDescriptionsByFunctionName, a3);
    objc_storeStrong((id *)&v13->_functionNames, a4);
    objc_storeStrong((id *)&v13->_defaultFunctionName, a5);
  }

  return v13;
}

- (MLModelAssetDescription)initWithRawModelDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __CFString *v25;
  MLModelAssetDescription *v26;
  MLModelAssetDescription *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = self;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "functionDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "modelDescriptionBySettingMetadata:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "functionName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

  if (!objc_msgSend(v7, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, &stru_1E3D68DC8);

  v15 = v4;
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v15, "functionDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v15, "functionDescriptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "functionName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v23);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

  objc_msgSend(v15, "defaultFunctionName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v15, "defaultFunctionName");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = &stru_1E3D68DC8;
  }

  v26 = -[MLModelAssetDescription initWithModelDescriptionsByFunctionName:functionNames:defaultFunctionName:](v28, "initWithModelDescriptionsByFunctionName:functionNames:defaultFunctionName:", v7, v18, v25);
  return v26;
}

- (MLModelAssetDescription)initWithModelDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  MLModelAssetDescription *v8;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(v4, "functionDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
    }

  }
  v8 = -[MLModelAssetDescription initWithRawModelDescription:](self, "initWithRawModelDescription:", v4);

  return v8;
}

- (MLModelAssetDescription)initWithCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  id v5;
  MLModelAssetDescription *v6;

  v5 = -[MLModelDescription initFromRawCompiledModelArchive:error:]([MLModelDescription alloc], "initFromRawCompiledModelArchive:error:", a3, a4);
  if (v5)
  {
    self = -[MLModelAssetDescription initWithRawModelDescription:](self, "initWithRawModelDescription:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initFromModelSpecification:(_MLModelSpecification *)a3
{
  id v4;
  MLModelAssetDescription *v5;

  v4 = -[MLModelDescription initFromRawModelSpecification:]([MLModelDescription alloc], "initFromRawModelSpecification:", a3);
  if (v4)
  {
    self = -[MLModelAssetDescription initWithRawModelDescription:](self, "initWithRawModelDescription:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initFromModelDescriptionSpecification:(_MLModelDescriptionSpecification *)a3
{
  id v4;
  MLModelAssetDescription *v5;

  v4 = -[MLModelDescription initFromRawModelDescriptionSpecification:]([MLModelDescription alloc], "initFromRawModelDescriptionSpecification:", a3);
  if (v4)
  {
    self = -[MLModelAssetDescription initWithRawModelDescription:](self, "initWithRawModelDescription:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)usesMultiFunctionSyntax
{
  void *v2;
  BOOL v3;

  -[MLModelAssetDescription functionNames](self, "functionNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (MLModelDescription)defaultModelDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[MLModelAssetDescription defaultFunctionName](self, "defaultFunctionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAssetDescription modelDescriptionsByFunctionName](self, "modelDescriptionsByFunctionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLModelDescription *)v5;
}

- (id)modelDescriptionOfFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLModelAssetDescription functionNames](self, "functionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[MLModelAssetDescription functionNames](self, "functionNames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v15;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "The specified function name: %@ is not among the available function names: [%@].", buf, 0x16u);

    }
    v8 = (void *)MEMORY[0x1E0C99DA0];
    -[MLModelAssetDescription functionNames](self, "functionNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The specified function name: %@ is not among the available function names: [%@]."), v4, v10);

  }
  -[MLModelAssetDescription modelDescriptionsByFunctionName](self, "modelDescriptionsByFunctionName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)assetDescriptionBySettingClassLabels:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MLModelAssetDescription defaultFunctionName](self, "defaultFunctionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAssetDescription assetDescriptionBySettingClassLabels:functionName:](self, "assetDescriptionBySettingClassLabels:functionName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assetDescriptionBySettingClassLabels:(id)a3 functionName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MLModelAssetDescription *v12;
  void *v13;
  void *v14;
  MLModelAssetDescription *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[MLModelAssetDescription modelDescriptionsByFunctionName](self, "modelDescriptionsByFunctionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDictionary:copyItems:", v9, 1);

  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClassLabels:", v6);
  v12 = [MLModelAssetDescription alloc];
  -[MLModelAssetDescription functionNames](self, "functionNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAssetDescription defaultFunctionName](self, "defaultFunctionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MLModelAssetDescription initWithModelDescriptionsByFunctionName:functionNames:defaultFunctionName:](v12, "initWithModelDescriptionsByFunctionName:functionNames:defaultFunctionName:", v10, v13, v14);

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLModelAssetDescription functionNames](self, "functionNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MLModelAssetDescription defaultFunctionName](self, "defaultFunctionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Multi-function model (default function: %@)\n"), v6);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[MLModelAssetDescription functionNames](self, "functionNames");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[MLModelAssetDescription modelDescriptionOfFunctionNamed:](self, "modelDescriptionOfFunctionNamed:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("Function: %@:\n"), v10);
          objc_msgSend(v11, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v13);

          objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    -[MLModelAssetDescription defaultModelDescription](self, "defaultModelDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v15);

  }
  return v3;
}

- (NSArray)functionNames
{
  return self->_functionNames;
}

- (NSDictionary)modelDescriptionsByFunctionName
{
  return self->_modelDescriptionsByFunctionName;
}

- (NSString)defaultFunctionName
{
  return self->_defaultFunctionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFunctionName, 0);
  objc_storeStrong((id *)&self->_modelDescriptionsByFunctionName, 0);
  objc_storeStrong((id *)&self->_functionNames, 0);
}

@end
