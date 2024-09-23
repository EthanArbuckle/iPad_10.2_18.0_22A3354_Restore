@implementation CSFMil2bnnsCompilationConfig

- (CSFMil2bnnsCompilationConfig)initWithConfigPath:(id)a3 errOut:(id *)a4
{
  id v6;
  CSFMil2bnnsCompilationConfig *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *funcName;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CSFMil2bnnsCompilationConfig *v29;
  id v31;
  objc_super v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CSFMil2bnnsCompilationConfig;
  v7 = -[CSFMil2bnnsCompilationConfig init](&v32, sel_init);
  if (!v7)
    goto LABEL_29;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "fileExistsAtPath:", v6) & 1) == 0)
  {
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("config file not found for %@"), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2452, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v31;
  if (!v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("funcName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("funcName"));
      v20 = objc_claimAutoreleasedReturnValue();
      funcName = v7->_funcName;
      v7->_funcName = (NSString *)v20;
    }
    else
    {
      funcName = v7->_funcName;
      v7->_funcName = (NSString *)CFSTR("main");
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("debugInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("debugInfo"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_debugInfo = objc_msgSend(v23, "BOOLValue");

    }
    else
    {
      v7->_debugInfo = 0;
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("singleThread"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("singleThread"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_singleThread = objc_msgSend(v25, "BOOLValue");

    }
    else
    {
      v7->_singleThread = 1;
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("optimizeForSize"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("optimizeForSize"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_optimizeForSize = objc_msgSend(v27, "BOOLValue");

    }
    else
    {
      v7->_optimizeForSize = 0;
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("predefinedOptimizations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("predefinedOptimizations"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_predefinedOptimizations = objc_msgSend(v28, "unsignedIntValue");

    }
    else
    {
      v7->_predefinedOptimizations = 0;
    }
    goto LABEL_26;
  }
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[CSFMil2bnnsCompilationConfig initWithConfigPath:errOut:]";
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Cannot parse to mil2bnns model config: %@", buf, 0x16u);
  }
  if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot parse to mil2bnns model config: %@"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2452, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
  }

  if (!v11)
  {
LABEL_29:
    v29 = v7;
    goto LABEL_30;
  }
LABEL_28:
  v29 = 0;
LABEL_30:

  return v29;
}

- (NSString)funcName
{
  return self->_funcName;
}

- (BOOL)singleThread
{
  return self->_singleThread;
}

- (BOOL)debugInfo
{
  return self->_debugInfo;
}

- (unint64_t)predefinedOptimizations
{
  return self->_predefinedOptimizations;
}

- (BOOL)optimizeForSize
{
  return self->_optimizeForSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_funcName, 0);
}

@end
