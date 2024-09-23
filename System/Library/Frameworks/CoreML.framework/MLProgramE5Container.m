@implementation MLProgramE5Container

- (MLProgramE5Container)initWithCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 error:(id *)a6
{
  MLProgramE5Container *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  MLModelAssetDescription *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  MLModelAssetDescription *v30;
  uint64_t v31;
  MLNeuralNetworkFunctionInfo *v32;
  MLNeuralNetworkFunctionInfo *v33;
  void *v34;
  MLModelAssetDescription *v35;
  id v36;
  char v37;
  MLNeuralNetworkFunctionInfo *v38;
  void *v39;
  uint64_t v40;
  NSArray *v41;
  NSArray *v42;
  int v43;
  MLProgramE5Container *v44;
  void *v45;
  void *v46;
  MLCompilerNeuralNetworkOutput *v47;
  MLProgramE5Container *v48;
  MLCompilerNeuralNetworkOutput *compilerOutput;
  _QWORD *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  NSURL *URLOfMILText;
  NSArray *functionInfoArray;
  void *v60;
  MLNeuralNetworkFunctionInfo *obj;
  id v63;
  id v64;
  id v65;
  MLModelAssetDescription *v66;
  id v67;
  MLProgramE5Container *v68;
  id v69;
  objc_super v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  void *__p[2];
  char v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v69 = a4;
  v63 = a5;
  v67 = a5;
  v70.receiver = self;
  v70.super_class = (Class)MLProgramE5Container;
  v10 = -[MLProgramE5Container init](&v70, sel_init);
  v68 = v10;
  if (!v10)
  {
LABEL_49:
    v48 = v10;
    goto LABEL_50;
  }
  v11 = v69;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 9, 0, 0, CFSTR("generic"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "majorVersion");
  v14 = objc_msgSend(v11, "majorVersion");
  v15 = v14;
  if (a6 && v13 < v14)
  {
    objc_msgSend(v11, "versionNumberString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "versionNumberString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("The specification version for compiled model is %@ and is more recent than the supported version %@."), v16, v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v13 >= v15)
  {
    v18 = v67;
    +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 9, 0, 0, CFSTR("generic"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "majorVersion");
    v21 = objc_msgSend(v18, "majorVersion");
    v22 = v21;
    if (a6 && v20 < v21)
    {
      objc_msgSend(v18, "versionNumberString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "versionNumberString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("The compiler version for compiled model is %@ and is more recent than this framework major version %@."), v23, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v20 >= v22)
    {
      v65 = v18;
      v25 = -[MLModelAssetDescription initWithCompiledModelArchive:error:]([MLModelAssetDescription alloc], "initWithCompiledModelArchive:error:", a3, a6);
      if (!v25)
      {
        v35 = 0;
        v36 = 0;
        v37 = 0;
LABEL_28:

        v66 = v35;
        v41 = (NSArray *)v36;
        v42 = v41;
        if ((v37 & 1) != 0)
        {
          objc_storeStrong((id *)&v68->_modelAssetDescription, v35);
          v43 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a3 + 56))(*(_QWORD *)a3);
          v44 = v68;
          if (v43 == 1)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "CompiledObject");
            (*(void (**)(_QWORD, void **))(**(_QWORD **)a3 + 40))(*(_QWORD *)a3, __p);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (v76 < 0)
              operator delete(__p[0]);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v46 = v45;
            else
              v46 = 0;
            v47 = v46;

            v44 = v68;
          }
          else
          {
            v47 = 0;
          }
          compilerOutput = v44->_compilerOutput;
          v44->_compilerOutput = v47;

          std::string::basic_string[abi:ne180100]<0>(__p, (char *)kModelMILFileName);
          IArchive::blob(&v71, *(_QWORD *)a3, (uint64_t)__p);
          if (v76 < 0)
            operator delete(__p[0]);
          v50 = (_QWORD *)(v71 + 8);
          if (*(char *)(v71 + 31) < 0)
            v50 = (_QWORD *)*v50;
          v51 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "fileURLWithPath:isDirectory:", v52, 0);
          v53 = objc_claimAutoreleasedReturnValue();

          v54 = (std::__shared_weak_count *)*((_QWORD *)&v71 + 1);
          if (*((_QWORD *)&v71 + 1))
          {
            v55 = (unint64_t *)(*((_QWORD *)&v71 + 1) + 8);
            do
              v56 = __ldaxr(v55);
            while (__stlxr(v56 - 1, v55));
            if (!v56)
            {
              ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
              std::__shared_weak_count::__release_weak(v54);
            }
          }
          URLOfMILText = v68->_URLOfMILText;
          v68->_URLOfMILText = (NSURL *)v53;

          objc_storeStrong((id *)&v68->_compilerVersionInfo, v63);
          objc_storeStrong((id *)&v68->_modelVersionInfo, a4);
          functionInfoArray = v68->_functionInfoArray;
          v68->_functionInfoArray = v42;

          v10 = v68;
          goto LABEL_49;
        }

        goto LABEL_37;
      }
      v64 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      -[MLModelAssetDescription functionNames](v25, "functionNames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v26;
      if (objc_msgSend(v26, "count"))
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v26;
        v27 = -[MLNeuralNetworkFunctionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, __p, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v72;
          while (2)
          {
            v29 = 0;
            v30 = v25;
            do
            {
              if (*(_QWORD *)v72 != v28)
                objc_enumerationMutation(obj);
              v31 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v29);
              v32 = -[MLNeuralNetworkFunctionInfo initWithCompiledModelArchive:compilerVersionInfo:error:]([MLNeuralNetworkFunctionInfo alloc], "initWithCompiledModelArchive:compilerVersionInfo:error:", a3, v65, a6);
              v33 = v32;
              if (!v32)
              {

                v35 = 0;
                v36 = 0;
                v37 = 0;
                v25 = v30;
                goto LABEL_27;
              }
              -[MLNeuralNetworkFunctionInfo classLabels](v32, "classLabels");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[MLModelAssetDescription assetDescriptionBySettingClassLabels:functionName:](v30, "assetDescriptionBySettingClassLabels:functionName:", v34, v31);
              v25 = (MLModelAssetDescription *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v64, "addObject:", v33);
              ++v29;
              v30 = v25;
            }
            while (v27 != v29);
            v27 = -[MLNeuralNetworkFunctionInfo countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, __p, 16);
            if (v27)
              continue;
            break;
          }
        }
      }
      else
      {
        v38 = -[MLNeuralNetworkFunctionInfo initWithCompiledModelArchive:compilerVersionInfo:error:]([MLNeuralNetworkFunctionInfo alloc], "initWithCompiledModelArchive:compilerVersionInfo:error:", a3, v65, a6);
        if (!v38)
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          goto LABEL_27;
        }
        obj = v38;
        -[MLNeuralNetworkFunctionInfo classLabels](v38, "classLabels");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLModelAssetDescription assetDescriptionBySettingClassLabels:](v25, "assetDescriptionBySettingClassLabels:", v39);
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "addObject:", obj);
        v25 = (MLModelAssetDescription *)v40;
      }

      v35 = objc_retainAutorelease(v25);
      v36 = objc_retainAutorelease(v64);
      v37 = 1;
      v25 = v35;
LABEL_27:

      goto LABEL_28;
    }
  }
LABEL_37:
  v48 = 0;
LABEL_50:

  return v48;
}

- (id)findPrecompiledE5BundleAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MLProgramE5Container URLOfMILText](self, "URLOfMILText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model.specialization.bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    a3 = v7;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Failed to find precompiled E5 bundle at %@", buf, 0xCu);
    }

    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find precompiled E5 bundle at %@"), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 3, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
    }
  }

  return a3;
}

- (id)classScoreVectorNameOfFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLProgramE5Container modelAssetDescription](self, "modelAssetDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesMultiFunctionSyntax");

  if (v6)
  {
    -[MLProgramE5Container modelAssetDescription](self, "modelAssetDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "functionNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v4);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
      }

      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v9 = 0;
  }
  -[MLProgramE5Container functionInfoArray](self, "functionInfoArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "classScoreVectorName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)optionalInputDefaultValuesForFunctionNamed:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[MLProgramE5Container modelAssetDescription](self, "modelAssetDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesMultiFunctionSyntax");

  -[MLProgramE5Container modelAssetDescription](self, "modelAssetDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "modelDescriptionOfFunctionNamed:", v20);
  else
    objc_msgSend(v6, "defaultModelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v7, "inputDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_msgSend(v7, "inputDescriptionsByName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isOptional") & 1) != 0)
        {
          objc_msgSend(v15, "multiArrayConstraint");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "defaultOptionalValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v13);

          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v8;
}

- (MLModelAssetDescription)modelAssetDescription
{
  return self->_modelAssetDescription;
}

- (MLCompilerNeuralNetworkOutput)compilerOutput
{
  return self->_compilerOutput;
}

- (NSURL)URLOfMILText
{
  return self->_URLOfMILText;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (MLVersionInfo)modelVersionInfo
{
  return self->_modelVersionInfo;
}

- (NSArray)functionInfoArray
{
  return self->_functionInfoArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionInfoArray, 0);
  objc_storeStrong((id *)&self->_modelVersionInfo, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_URLOfMILText, 0);
  objc_storeStrong((id *)&self->_compilerOutput, 0);
  objc_storeStrong((id *)&self->_modelAssetDescription, 0);
}

+ (void)_getDefaultFunctionName:(id *)a3 modelDescription:(id *)a4 fromModelAssetDescription:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(v9, "defaultModelDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "functionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  if (a4)
  {
    objc_msgSend(v9, "defaultModelDescription");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

}

+ (BOOL)deduceFunctionNameToCompute:(id *)a3 modelDescription:(id *)a4 fromConfiguration:(id)a5 modelAssetDescription:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  objc_msgSend(v12, "functionNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v11, "functionName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v11, "functionName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
        }

        if (a7)
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          v47 = *MEMORY[0x1E0CB2D50];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v37);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_23;
      }
    }
    v43 = 0;
    v44 = 0;
    objc_msgSend(a1, "_getDefaultFunctionName:modelDescription:fromModelAssetDescription:", &v44, &v43, v12);
    v29 = v44;
    v30 = v43;
LABEL_12:
    v31 = v30;
    if (!a3)
      goto LABEL_16;
LABEL_13:
    *a3 = objc_retainAutorelease(v29);
    if (!a4)
      goto LABEL_18;
    goto LABEL_17;
  }
  objc_msgSend(v11, "functionName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v45 = 0;
    v46 = 0;
    objc_msgSend(a1, "_getDefaultFunctionName:modelDescription:fromModelAssetDescription:", &v46, &v45, v12);
    v29 = v46;
    v30 = v45;
    goto LABEL_12;
  }
  objc_msgSend(v11, "functionName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "indexOfObject:", v15);

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "functionName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "functionNames");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR(","));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v39;
      v53 = 2112;
      v54 = v41;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The specified function (%@) is not found in the asset. The available function names are: [%@]", buf, 0x16u);

    }
    if (a7)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "functionName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "functionNames");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("The specified function (%@) is not found in the asset. The available function names are: [%@]"), v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v24);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_23:
    v31 = 0;
    v29 = 0;
    v33 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v11, "functionName");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "functionName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelDescriptionOfFunctionNamed:", v32);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
    goto LABEL_13;
LABEL_16:
  if (a4)
  {
LABEL_17:
    v31 = objc_retainAutorelease(v31);
    *a4 = v31;
  }
LABEL_18:
  v33 = 1;
LABEL_24:

  return v33;
}

@end
