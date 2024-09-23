@implementation MIOModelPackage

+ (id)upgradeModelSpecificationAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByDeletingPathExtension");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("mlpackage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "fileExistsAtPath:", v17);

    if (!v18)
    {
      +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:](MIOModelUtils, "URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:", v9, a5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "URLByAppendingPathComponent:isDirectory:", v14, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "URLByAppendingPathExtension:", CFSTR("mlpackage"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(a1, "_upgradeModelSpecificationAtURL:packageURL:error:", v8, v32, a5) & 1) != 0
          && (objc_msgSend(v10, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v16, v32, 0, 0, 0, a5) & 1) != 0)
        {
          objc_msgSend(v10, "removeItemAtURL:error:", v30, 0);
          a5 = v16;
        }
        else
        {
          objc_msgSend(v10, "removeItemAtURL:error:", v30, 0);
          a5 = 0;
        }

      }
      else
      {
        a5 = 0;
      }

      goto LABEL_20;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "path");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      +[MIOModelPackage upgradeModelSpecificationAtURL:toURL:error:].cold.1(objc_msgSend(v19, "UTF8String"), (uint64_t)v38, v19);
    }
    if (!a5)
    {
LABEL_20:

      goto LABEL_21;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "path");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Model package already exists at %s"), objc_msgSend(v22, "UTF8String"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v24);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    a5 = 0;
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "path");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    +[MIOModelPackage upgradeModelSpecificationAtURL:toURL:error:].cold.2(objc_msgSend(v25, "UTF8String"), (uint64_t)v38, v25);
  }
  if (a5)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "path");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Model does not exists at %s"), objc_msgSend(v14, "UTF8String"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 1, v28);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_21:

  return a5;
}

+ (BOOL)_upgradeModelSpecificationAtURL:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  MIOModel *v14;
  MIOModel *v15;
  BOOL v16;
  void *v18[2];
  char v19;
  void *v20[2];
  char v21;
  void *v22[2];
  char v23;
  void *v24;
  char v25;
  void *__p[2];
  char v27;
  MPL::detail::ModelPackageImpl *v28[5];

  v28[4] = *(MPL::detail::ModelPackageImpl **)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8251C08]();
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "fileSystemRepresentation"));
  MPL::ModelPackage::ModelPackage(v28, (char *)__p, 1u, 0);
  if (v27 < 0)
    operator delete(__p[0]);
  objc_msgSend(v7, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v12, "UTF8String"));
  v13 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)objc_msgSend(v13, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v20, (char *)objc_msgSend(CFSTR("com.apple.CoreML"), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(v18, "CoreML Model Specification");
  MPL::ModelPackage::setRootModel(v28, (char *)__p, (char *)v22, (uint64_t)v20, (uint64_t)v18, (const void **)&v24);
  if (v25 < 0)
    operator delete(v24);
  if (v19 < 0)
    operator delete(v18[0]);
  if (v21 < 0)
    operator delete(v20[0]);
  if (v23 < 0)
    operator delete(v22[0]);
  if (v27 < 0)
    operator delete(__p[0]);

  MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v28);
  objc_autoreleasePoolPop(v9);
  v14 = -[MIOModel initWithContentsOfURL:error:]([MIOModel alloc], "initWithContentsOfURL:error:", v11, a5);
  v15 = v14;
  if (v14)
    v16 = -[MIOModel writeToURL:error:](v14, "writeToURL:error:", v11, a5);
  else
    v16 = 0;

  return v16;
}

- (MIOModelPackage)initWithModelPackageAtURL:(id)a3 error:(id *)p_isa
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  MIOModelPackage *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSURL *specificationURL;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  MPL::detail::ModelPackageImpl *v28[2];
  objc_super v29;
  void *__p;
  std::__shared_weak_count *v31;
  char v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v29.receiver = self;
    v29.super_class = (Class)MIOModelPackage;
    v10 = -[MIOModelPackage init](&v29, sel_init);
    if (v10)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"));
      MPL::ModelPackage::ModelPackage(v28, (char *)&__p, 0, 1);
      if (v32 < 0)
        operator delete(__p);
      v11 = (void *)MEMORY[0x1E0C99E98];
      v12 = (void *)MEMORY[0x1E0CB3940];
      MPL::ModelPackage::getRootModel(v28, &__p);
      v13 = MPL::ModelPackageItemInfo::path((MPL::ModelPackageItemInfo *)__p);
      if (*(char *)(v13 + 23) >= 0)
        v14 = v13;
      else
        v14 = *(_QWORD *)v13;
      objc_msgSend(v12, "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fileURLWithPath:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      specificationURL = v10->_specificationURL;
      v10->_specificationURL = (NSURL *)v16;

      v18 = v31;
      if (v31)
      {
        p_shared_owners = (unint64_t *)&v31->__shared_owners_;
        do
          v20 = __ldaxr(p_shared_owners);
        while (__stlxr(v20 - 1, p_shared_owners));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      MPL::ModelPackageItemInfo::~ModelPackageItemInfo((MPL::ModelPackageItemInfo *)v28);
    }
    self = v10;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[MIOModelPackage initWithModelPackageAtURL:error:].cold.2(objc_msgSend(v21, "UTF8String"), (uint64_t)&__p, v21);
    }
    if (p_isa)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "path");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Model package does not exists at %s"), objc_msgSend(v24, "UTF8String"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 1, v26);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      p_isa = 0;
    }
  }

  return (MIOModelPackage *)p_isa;
}

- (NSURL)specificationURL
{
  return self->_specificationURL;
}

- (void)setSpecificationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationURL, 0);
}

+ (void)upgradeModelSpecificationAtURL:(uint64_t)a1 toURL:(uint64_t)a2 error:(void *)a3 .cold.1(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D3AC6000, MEMORY[0x1E0C81028], (uint64_t)a3, "Model package already exists at %s", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

+ (void)upgradeModelSpecificationAtURL:(uint64_t)a1 toURL:(uint64_t)a2 error:(void *)a3 .cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D3AC6000, MEMORY[0x1E0C81028], (uint64_t)a3, "Model does not exists at %s", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_upgradeModelSpecificationAtURL:(uint64_t)a1 packageURL:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v3 = 136315138;
  v4 = v1;
  OUTLINED_FUNCTION_0_2(&dword_1D3AC6000, MEMORY[0x1E0C81028], v2, "Failed to create model package. Error: %s", (uint8_t *)&v3);
}

- (void)initWithModelPackageAtURL:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
  v4 = 138412546;
  v5 = a1;
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to extract root model from model package at %@. Error: %s", (uint8_t *)&v4, 0x16u);
}

- (void)initWithModelPackageAtURL:(void *)a3 error:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D3AC6000, MEMORY[0x1E0C81028], (uint64_t)a3, "Model package does not exists at %s", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_1();
}

@end
