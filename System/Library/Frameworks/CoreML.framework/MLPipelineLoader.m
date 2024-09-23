@implementation MLPipelineLoader

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;

  v11 = a4;
  v12 = a6;
  if (+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:archive:error:](MLModelIOUtils, "serializeMetadataAndInterfaceFromSpecification:archive:error:", a3, a5, a7))
  {
    if (v11)
      +[MLPipeline compileSpecification:blobMapping:toArchive:options:error:](MLPipeline, "compileSpecification:blobMapping:toArchive:options:error:", a3, v11, a5, v12, a7);
    else
      +[MLPipeline compileSpecification:toArchive:options:error:](MLPipeline, "compileSpecification:toArchive:options:error:", a3, a5, v12, a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    operator<<((uint64_t)a5, *(unsigned int *)(*(_QWORD *)a3 + 44));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLPipeline compiledVersionForSpecification:options:error:](MLPipeline, "compiledVersionForSpecification:options:error:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)ensureFrameworkSupportsCompilerVersion:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 1, CFSTR("generic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "majorVersion");
  v8 = objc_msgSend(v5, "majorVersion");
  if (v7 < v8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "versionNumberString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "versionNumberString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "compiler major version for compiled model is %@ and is more recent than this framework major version %@.", buf, 0x16u);

    }
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "versionNumberString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "versionNumberString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7 >= v8;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend(a1, "ensureFrameworkSupportsCompilerVersion:error:", v13, a7) & 1) != 0)
  {
    v15 = -[MLModelDescription initFromSingleFunctionCompiledModelArchive:error:]([MLModelDescription alloc], "initFromSingleFunctionCompiledModelArchive:error:", a3, a7);
    if (v15)
    {
      v16 = -[MLPipeline initModelFromMetadataAndArchive:versionInfo:description:configuration:error:]([MLPipeline alloc], "initModelFromMetadataAndArchive:versionInfo:description:configuration:error:", a3, v12, v15, v14, a7);
      if (v16)
      {
        operator>>((uint64_t)a3);
        if (a7)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Invalid model type found in compiled pipeline model."));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

    }
  }

  return 0;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((objc_msgSend(a1, "ensureFrameworkSupportsCompilerVersion:error:", v13, a7) & 1) != 0)
  {
    +[MLPipeline loadModelAssetDescriptionFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLPipeline, "loadModelAssetDescriptionFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
