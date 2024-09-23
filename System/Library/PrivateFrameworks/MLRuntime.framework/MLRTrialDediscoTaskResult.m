@implementation MLRTrialDediscoTaskResult

+ (id)baseKeyFromFormat:(id)a3 variables:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("format cannot be nil"), 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("{}$"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
LABEL_21:
    v30 = v8;
    goto LABEL_34;
  }
  v10 = 0;
  v11 = CFSTR("%c");
  while (1)
  {
    v12 = objc_msgSend(v5, "characterAtIndex:", v10);
    if ((_DWORD)v12 == 36)
      break;
    v13 = v12;
    if ((_DWORD)v12 != 92)
    {
      v14 = v10 + 1;
LABEL_19:
      objc_msgSend(v8, "appendFormat:", v11, v13);
      v10 = v14;
      goto LABEL_20;
    }
    v14 = v10 + 1;
    if (v10 + 1 >= objc_msgSend(v5, "length") || objc_msgSend(v5, "characterAtIndex:", v10 + 1) != 36)
      goto LABEL_19;
    objc_msgSend(v8, "appendString:", CFSTR("$"));
    v10 += 2;
LABEL_20:
    if (v10 >= objc_msgSend(v5, "length"))
      goto LABEL_21;
  }
  v15 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v9, 0, v10 + 1, objc_msgSend(v5, "length") + ~v10);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.1();
    goto LABEL_32;
  }
  v17 = v15;
  v18 = v16;
  if (objc_msgSend(v5, "characterAtIndex:", v15) != 123)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_25:
    +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.5();
    goto LABEL_32;
  }
  v19 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v9, 0, v17 + 1, objc_msgSend(v5, "length") - (v17 + v18));
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.2();
    goto LABEL_32;
  }
  v21 = v19;
  v22 = v20;
  if (objc_msgSend(v5, "characterAtIndex:", v19) != 125)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    goto LABEL_25;
  }
  if (v17 + 1 == v21)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.3();
    goto LABEL_32;
  }
  objc_msgSend(v5, "substringWithRange:", v17 + 1, v21 + ~v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v23;
    _os_log_debug_impl(&dword_2112F5000, v24, OS_LOG_TYPE_DEBUG, "Expanding var=%@", buf, 0xCu);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "objectForKeyedSubscript:", v23);
    v27 = v11;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v29);

    v11 = v27;
    v10 = v21 + v22;

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    +[MLRTrialDediscoTaskResult baseKeyFromFormat:variables:].cold.4();

LABEL_33:
  v30 = 0;
LABEL_34:

  return v30;
}

- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 namespaceName:(id)a4 factorName:(id)a5 additionalKeyVariables:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MLRTrialDediscoTaskResult *v15;
  uint64_t v16;
  NSString *namespaceName;
  uint64_t v18;
  NSString *recipeFactorName;
  uint64_t v20;
  NSDictionary *additionalKeyVariables;
  MLRTrialDediscoTaskResult *v22;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  id v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    v24 = (void *)MEMORY[0x24BDBCE88];
    v25 = *MEMORY[0x24BDBCAB8];
    v26 = CFSTR("JSONResult cannot be nil");
    goto LABEL_10;
  }
  if (!v11)
  {
    v24 = (void *)MEMORY[0x24BDBCE88];
    v25 = *MEMORY[0x24BDBCAB8];
    v26 = CFSTR("namespaceName cannot be nil");
    goto LABEL_10;
  }
  if (!v12)
  {
    v24 = (void *)MEMORY[0x24BDBCE88];
    v25 = *MEMORY[0x24BDBCAB8];
    v26 = CFSTR("factorName cannot be nil");
LABEL_10:
    objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v26, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v14 = v13;
  v28.receiver = self;
  v28.super_class = (Class)MLRTrialDediscoTaskResult;
  v15 = -[MLRTrialTaskResult initWithJSONResult:](&v28, sel_initWithJSONResult_, v10);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    namespaceName = v15->_namespaceName;
    v15->_namespaceName = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    recipeFactorName = v15->_recipeFactorName;
    v15->_recipeFactorName = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    additionalKeyVariables = v15->_additionalKeyVariables;
    v15->_additionalKeyVariables = (NSDictionary *)v20;

    v22 = v15;
  }

  return v15;
}

- (MLRTrialDediscoTaskResult)initWithJSONResult:(id)a3 identifier:(id)a4
{
  id v6;
  MLRTrialDediscoTaskResult *v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("DediscoUploadPrototype")))
    v7 = -[MLRTrialDediscoTaskResult initWithJSONResult:namespaceName:factorName:additionalKeyVariables:]([MLRTrialDediscoTaskResult alloc], "initWithJSONResult:namespaceName:factorName:additionalKeyVariables:", v6, CFSTR("PPM_DIRECT_UPLOAD"), CFSTR("DediscoUploadPrototype"), 0);
  else
    v7 = 0;

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *namespaceName;
  NSString *recipeFactorName;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  namespaceName = self->_namespaceName;
  recipeFactorName = self->_recipeFactorName;
  -[MLRTrialTaskResult JSONResult](self, "JSONResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n(%@, %@\n\t%@)\n"), v5, namespaceName, recipeFactorName, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)variablesFromTrialClient:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "experimentIdentifiersWithNamespaceName:", self->_namespaceName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10[0] = CFSTR("experimentId");
    objc_msgSend(v3, "experimentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("deploymentId");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("treatmentId");
    objc_msgSend(v4, "treatmentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v8;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "isEqual:", CFSTR("decimal"));

  v16 = (void *)objc_opt_new();
  LOBYTE(a7) = objc_msgSend(v16, "record:data:encodingSchema:metadata:errorOut:", v14, v13, v12, v11, a7);

  return (char)a7;
}

- (BOOL)submitWithTRIClient:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MLRTrialDediscoRecipe *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id *v56;
  id v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Trial Framework is not loaded"), 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v47);
  }
  if (!v6)
  {
    v48 = (void *)MEMORY[0x24BDBCE88];
    v49 = *MEMORY[0x24BDBCAB8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Trial client must not be nil"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "exceptionWithName:reason:userInfo:", v49, v50, 0);
    v51 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v51);
  }
  objc_msgSend(v6, "refresh");
  objc_msgSend(v6, "levelForFactor:withNamespaceName:", self->_recipeFactorName, self->_namespaceName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPath");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v7, "fileValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:isDirectory:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = 0;
    v14 = -[MLRTrialDediscoRecipe initWithAssetURL:configOverride:error:]([MLRTrialDediscoRecipe alloc], "initWithAssetURL:configOverride:error:", v13, 0, &v57);
    v15 = v57;
    if (v14)
    {
      v56 = a4;
      -[MLRTrialDediscoTaskResult variablesFromTrialClient:](self, "variablesFromTrialClient:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLRTrialDediscoTaskResult additionalKeyVariables](self, "additionalKeyVariables");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)objc_msgSend(v16, "mutableCopy");
        -[MLRTrialDediscoTaskResult additionalKeyVariables](self, "additionalKeyVariables");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEntriesFromDictionary:", v19);

        v16 = v18;
      }
      v20 = (void *)objc_opt_class();
      -[MLRTrialDediscoRecipe baseKeyFormat](v14, "baseKeyFormat");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "baseKeyFromFormat:variables:", v21, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v53 = v16;
        v55 = v13;
        objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          -[MLRTrialTaskResult JSONResult](self, "JSONResult");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[MLRTrialDediscoRecipe encodingSchema](v14, "encodingSchema");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v60 = v45;
          v61 = 2112;
          v62 = v22;
          v63 = 2112;
          v64 = v46;
          _os_log_debug_impl(&dword_2112F5000, v23, OS_LOG_TYPE_DEBUG, "Recording data=%@, key=%@, encodingSchema=%@", buf, 0x20u);

        }
        -[MLRTrialTaskResult JSONResult](self, "JSONResult");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v24;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLRTrialDediscoRecipe encodingSchema](v14, "encodingSchema");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLRTrialDediscoRecipe mlrDediscoMetadata](v14, "mlrDediscoMetadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[MLRTrialDediscoTaskResult record:data:encodingSchema:metadata:errorOut:](self, "record:data:encodingSchema:metadata:errorOut:", v22, v25, v26, v27, v56);

        v29 = v53;
        v13 = v55;
      }
      else
      {
        v36 = v13;
        v54 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BE2D188];
        v65 = *MEMORY[0x24BDD0FC8];
        v37 = v16;
        v38 = (void *)MEMORY[0x24BDD17C8];
        -[MLRTrialDediscoRecipe baseKeyFormat](v14, "baseKeyFormat");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v37;
        objc_msgSend(v38, "stringWithFormat:", CFSTR("Fail to compute baseKey with format string=%@, variables=%@"), v39, v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", v52, 5007, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[MLRTrialDediscoTaskResult submitWithTRIClient:error:].cold.2();

        if (v56)
        {
          v15 = objc_retainAutorelease(v42);
          v28 = 0;
          *v56 = v15;
        }
        else
        {
          v28 = 0;
          v15 = v42;
        }
        v13 = v36;
        v22 = 0;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[MLRTrialDediscoTaskResult submitWithTRIClient:error:].cold.1();

      if (a4)
      {
        v15 = objc_retainAutorelease(v15);
        v28 = 0;
        *a4 = v15;
      }
      else
      {
        v28 = 0;
      }
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BE2D188];
    v67 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nil fileValue for TRILevel=%@, namespace=%@, factor=%@"), v7, self->_namespaceName, self->_recipeFactorName);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 5007, v33);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[MLRTrialDediscoTaskResult submitWithTRIClient:error:].cold.2();

    if (a4)
    {
      v15 = objc_retainAutorelease(v15);
      v28 = 0;
      *a4 = v15;
    }
    else
    {
      v28 = 0;
    }
  }

  return v28;
}

- (BOOL)submitForTask:(id)a3 error:(id *)a4
{
  void *v6;

  objc_msgSend(a3, "triClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[MLRTrialDediscoTaskResult submitWithTRIClient:error:](self, "submitWithTRIClient:error:", v6, a4);

  return (char)a4;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (NSString)recipeFactorName
{
  return self->_recipeFactorName;
}

- (NSDictionary)additionalKeyVariables
{
  return self->_additionalKeyVariables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalKeyVariables, 0);
  objc_storeStrong((id *)&self->_recipeFactorName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

+ (void)baseKeyFromFormat:variables:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "No starting mark in format=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)baseKeyFromFormat:variables:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "No matching } in format=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)baseKeyFromFormat:variables:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Empty variable=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)baseKeyFromFormat:variables:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Find unsupported variable=%@, variables=%@");
  OUTLINED_FUNCTION_2();
}

+ (void)baseKeyFromFormat:variables:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "Invalid format=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)submitWithTRIClient:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_2112F5000, v0, v1, "Fail to read configuration from URL=%@, error=%@");
  OUTLINED_FUNCTION_2();
}

- (void)submitWithTRIClient:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_2112F5000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
