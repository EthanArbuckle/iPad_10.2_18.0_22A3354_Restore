@implementation MIOModel

- (MIOModel)init
{
  return -[MIOModel initWithModeling:error:](self, "initWithModeling:error:", 0, 0);
}

- (MIOModel)initWithContentsOfURL:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  int isValid;
  __objc2_class **v12;
  void *v13;
  void *v14;
  void *v15;
  void *__p[2];
  char v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "fileSystemRepresentation"));
    isValid = MPL::ModelPackage::isValid((char *)__p);
    if (v18 < 0)
      operator delete(__p[0]);
    v12 = off_1E9555170;
    if (!isValid)
      v12 = off_1E9555188;
    v13 = (void *)objc_msgSend(objc_alloc(*v12), "initWithContentsOfURL:error:", v10, p_isa);
    if (v13)
    {
      self = -[MIOModel initWithModeling:error:](self, "initWithModeling:error:", v13, p_isa);
      p_isa = (id *)&self->super.isa;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    p_isa = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MIOModel initWithContentsOfURL:error:].cold.1();
  if (p_isa)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MIOModel instance must be initialized with an existing model file or package."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v15);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_14:

  return (MIOModel *)p_isa;
}

- (MIOModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5
{
  id v8;
  MIOSpecificationModel *v9;
  MIOModel *v10;

  v8 = a4;
  v9 = -[MIOSpecificationModel initWithMessageStream:parserContext:error:]([MIOSpecificationModel alloc], "initWithMessageStream:parserContext:error:", a3, v8, a5);
  if (v9)
  {
    self = -[MIOModel initWithModeling:error:](self, "initWithModeling:error:", v9, a5);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MIOModel)initWithModeling:(id)a3 error:(id *)a4
{
  id v7;
  MIOModel *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MIOModel;
  v8 = -[MIOModel init](&v18, sel_init);
  if (!v8)
    goto LABEL_8;
  objc_msgSend(v7, "specificationVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "majorVersion") > 9;

  if (!v10)
  {
    objc_storeStrong((id *)&v8->_modelImpl, a3);
LABEL_8:
    a4 = v8;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "specificationVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIOModel initWithModeling:error:].cold.1(buf, objc_msgSend(v11, "majorVersion"), v11);
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "specificationVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("The model specification version (%zd) is greater than the maximum supported version (%d)"), objc_msgSend(v14, "majorVersion"), 9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 1, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return (MIOModel *)a4;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:](MIOModelUtils, "URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MIOModel modelImpl](self, "modelImpl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v11, "writeToURL:error:", v10, a4);

    if ((v9 & 1) != 0)
      v12 = objc_msgSend(v8, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v10, 0, 0, 0, a4);
    else
      v12 = 0;
    objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MIOVersionInfo)specificationVersion
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specificationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOVersionInfo *)v3;
}

- (NSString)modelTypeName
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MIOModelDescription)modelDescription
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOModelDescription *)v3;
}

- (void)setModelDescription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIOModel modelImpl](self, "modelImpl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModelDescription:", v5);

}

- (NSArray)layers
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)subModels
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOModel modelImpl](self, "modelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "neuralNetworkLayerHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOModel modelImpl](self, "modelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "programOperationHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)layerHistogram
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *context;
  void *v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8251C08](self, a2);
  -[MIOModel neuralNetworkLayerHistogramForFunctionNamed:](self, "neuralNetworkLayerHistogramForFunctionNamed:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOModel programOperationHistogramForFunctionNamed:](self, "programOperationHistogramForFunctionNamed:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = v4;
  if (v15)
    objc_msgSend(v4, "addObject:", v15);
  if (v3)
    objc_msgSend(v5, "addObject:", v3);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __26__MIOModel_layerHistogram__block_invoke;
        v16[3] = &unk_1E9568AF8;
        v17 = v6;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(context);
  return v6;
}

void __26__MIOModel_layerHistogram__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v5, "integerValue") + objc_msgSend(v7, "integerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOModel modelImpl](self, "modelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOModel modelImpl](self, "modelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storagePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)irProgram
{
  void *v2;
  void *v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "irProgram");

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MIOModel modelTypeName](self, "modelTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("MIOModel<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MIOModel *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MIOModel *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIOModel modelImpl](self, "modelImpl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOModel modelImpl](v4, "modelImpl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MIOModel modelImpl](self, "modelImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MIOMutableModel *v4;
  void *v5;
  void *v6;
  MIOMutableModel *v7;

  v4 = [MIOMutableModel alloc];
  -[MIOModel modelImpl](self, "modelImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MIOModel initWithModeling:error:](v4, "initWithModeling:error:", v6, 0);

  return v7;
}

- (MIOModeling)modelImpl
{
  return self->_modelImpl;
}

- (void)setModelImpl:(id)a3
{
  objc_storeStrong((id *)&self->_modelImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelImpl, 0);
}

- (void)initWithContentsOfURL:error:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "MIOModel instance must be initialized with an existing model file or package.", v0, 2u);
}

- (void)initWithModeling:(void *)a3 error:.cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 9;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The model specification version (%zd) is greater than the maximum supported version (%d)", buf, 0x12u);

}

@end
