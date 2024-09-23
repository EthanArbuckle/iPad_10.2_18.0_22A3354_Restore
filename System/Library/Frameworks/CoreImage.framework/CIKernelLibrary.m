@implementation CIKernelLibrary

+ (id)internalLibraryWithName:(id)a3 device:(id)a4
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", a3, CFSTR("metallib"));
  if (result)
    return (id)objc_msgSend(a4, "newLibraryWithURL:error:", result, 0);
  return result;
}

+ (id)libraryWithData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:error:", a3, a4);
}

+ (id)libraryWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:error:", a3, a4);
}

+ (id)cache
{
  if (+[CIKernelLibrary cache]::onceToken != -1)
    dispatch_once(&+[CIKernelLibrary cache]::onceToken, &__block_literal_global_91);
  return (id)+[CIKernelLibrary cache]::cache;
}

id __24__CIKernelLibrary_cache__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[CIKernelLibrary cache]::cache = (uint64_t)result;
  return result;
}

+ (void)clearCache
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "cache");
  objc_sync_enter(v2);
  objc_msgSend(v2, "removeAllObjects");
  objc_sync_exit(v2);
}

+ (id)cachedLibraryWithURL:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id result;
  char isKindOfClass;
  void *v15;

  v7 = (void *)objc_msgSend(a1, "cache");
  v8 = objc_msgSend(a3, "absoluteString");
  objc_sync_enter(v7);
  v9 = (void *)objc_msgSend(v7, "objectForKey:", v8);
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v15 = 0;
    v12 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithURL:error:", a3, &v15);
    if (v12)
      v10 = v12;
    else
      v10 = v15;
    if (!v10)
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_msgSend(v7, "setObject:forKey:", v10, v8);
  }
  objc_sync_exit(v7);
  if (v10 == (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v10;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  result = 0;
  if (a4)
  {
    if ((isKindOfClass & 1) != 0)
    {
      result = 0;
      *a4 = v10;
    }
  }
  return result;
}

+ (id)libraryWithSource:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSource:error:", a3, a4);
}

- (CIKernelLibrary)initWithSource:(id)a3 error:(id *)a4
{
  CIKernelLibrary *v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  objc_super v22;
  uint64_t v23;
  int64x2_t v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CIKernelLibrary;
  v6 = -[CIKernelLibrary init](&v22, sel_init);
  v6->_harvest_for_this_library = 1;
  v6->_mtl_source = (NSString *)a3;
  v7 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v7, v8))
  {
    v23 = 0;
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setLibraryType:", 0);
    objc_msgSend(v9, "setCompileTimeStatisticsEnabled:", 1);
    objc_msgSend(v9, "setLanguageVersion:", 196608);
    objc_msgSend(v9, "setAdditionalCompilerArguments:", CFSTR("-w -D__CIKERNEL_METAL_VERSION__=300 -D_BUILDING_CORE_IMAGE_LIB_ -D__BUILDING_RUNTIME_COMPILE_HEADER__"));
    if (newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::onceToken != -1)
      dispatch_once(&newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::onceToken, &__block_literal_global_96_0);
    v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\\\\\n"), 0, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", a3, 0, 0, objc_msgSend(a3, "length"), &stru_1E2ECD1B0);
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("#[ \\t]*(include|import)[ \\t]+(<|\")CoreImage/\\w+.h(\"|>)"), 0, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), &stru_1E2ECD1B0);
    v12 = objc_msgSend(v7, "newLibraryWithSource:options:error:", objc_msgSend((id)newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::_runtime_header, "stringByAppendingString:", v11), v9, &v23);

    if (v12)
    {
      v6->_library = (MTLLibrary *)v12;
      -[CIKernelLibrary initFunctionNames](v6, "initFunctionNames");
      goto LABEL_19;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = (uint64_t *)MEMORY[0x1E0CB3388];
    if (v23)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v31[0] = CFSTR("CINonLocalizedDescriptionKey");
      v31[1] = v16;
      v24[0].i64[0] = (uint64_t)CFSTR("Failed compiling provided Metal source, could not initialize kernel library");
      v24[0].i64[1] = v23;
      v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v31, 2);
    }
    else
    {
      v29 = CFSTR("CINonLocalizedDescriptionKey");
      v30 = CFSTR("Failed compiling provided Metal source, could not initialize kernel library");
      v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    }
    v18 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 3, v17);
    v19 = ci_logger_compile();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_1921E4000, v19, OS_LOG_TYPE_INFO, "Could not initialize kernel library with Metal source: %{public}@", buf, 0xCu);
    }
    v6->_library = 0;
    if (a4 && v18)
    {
      v20 = *v15;
      v25[0] = CFSTR("CINonLocalizedDescriptionKey");
      v25[1] = v20;
      v26[0] = CFSTR("Could not initialize kernel library.");
      v26[1] = v18;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    }
    else
    {
      if (!a4)
        goto LABEL_19;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D828);
    }
  }
  else
  {
    if (!a4)
      goto LABEL_19;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D850);
  }
  *a4 = v13;
LABEL_19:

  if (v6->_library)
  {
    XXH64_reset(v24, 0);
    CI::XXHashHelper::addstr((uint64_t)v24, (char *)objc_msgSend(a3, "UTF8String"));
    v6->_digest = XXH64_digest((uint64_t)v24);
  }
  else
  {

    return 0;
  }
  return v6;
}

- (CIKernelLibrary)initWithData:(id)a3 error:(id *)a4
{
  CIKernelLibrary *v6;
  id v7;
  const void *v8;
  size_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  size_t v16;
  int64x2_t v18[5];
  _QWORD destructor[5];
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)CIKernelLibrary;
  v6 = -[CIKernelLibrary init](&v20, sel_init);
  v6->_harvest_for_this_library = 1;
  v7 = a3;
  v8 = (const void *)objc_msgSend(a3, "bytes");
  v9 = objc_msgSend(a3, "length");
  destructor[0] = MEMORY[0x1E0C809B0];
  destructor[1] = 3221225472;
  destructor[2] = __38__CIKernelLibrary_initWithData_error___block_invoke;
  destructor[3] = &unk_1E2EC3CC8;
  destructor[4] = a3;
  v6->_data = (OS_dispatch_data *)dispatch_data_create(v8, v9, 0, destructor);
  v10 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v10, v11))
  {
    v18[0].i64[0] = 0;
    v12 = objc_msgSend(v10, "newLibraryWithData:error:", v6->_data, v18);
    v6->_library = (MTLLibrary *)v12;
    if (v12)
    {
      -[CIKernelLibrary initFunctionNames](v6, "initFunctionNames");
      goto LABEL_12;
    }
    if (a4 && v18[0].i64[0])
    {
      v14 = *MEMORY[0x1E0CB3388];
      v21[0] = CFSTR("CINonLocalizedDescriptionKey");
      v21[1] = v14;
      v22[0] = CFSTR("Could not initialize kernel library.");
      v22[1] = v18[0].i64[0];
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    }
    else
    {
      if (!a4)
        goto LABEL_12;
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D878);
    }
  }
  else
  {
    if (!a4)
      goto LABEL_12;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D8A0);
  }
  *a4 = v13;
LABEL_12:

  if (v6->_library)
  {
    XXH64_reset(v18, 0);
    v15 = (char *)objc_msgSend(a3, "bytes");
    v16 = objc_msgSend(a3, "length");
    if (v15 && v16)
      XXH64_update((uint64_t)v18, v15, v16);
    v6->_digest = XXH64_digest((uint64_t)v18);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __38__CIKernelLibrary_initWithData_error___block_invoke(uint64_t a1)
{

}

- (CIKernelLibrary)initWithURL:(id)a3 error:(id *)a4
{
  CIKernelLibrary *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int64x2_t v16[5];
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CIKernelLibrary;
  v6 = -[CIKernelLibrary init](&v17, sel_init);
  v6->_harvest_for_this_library = 1;
  v6->_url = (NSURL *)a3;
  v7 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v7, v8))
  {
    v16[0].i64[0] = 0;
    v9 = objc_msgSend(v7, "newLibraryWithURL:error:", a3, v16);
    v6->_library = (MTLLibrary *)v9;
    if (v9)
    {
      -[CIKernelLibrary initFunctionNames](v6, "initFunctionNames");
      goto LABEL_12;
    }
    if (a4 && v16[0].i64[0])
    {
      v11 = *MEMORY[0x1E0CB3388];
      v18[0] = CFSTR("CINonLocalizedDescriptionKey");
      v18[1] = v11;
      v19[0] = CFSTR("Could not initialize kernel library.");
      v19[1] = v16[0].i64[0];
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    }
    else
    {
      if (!a4)
        goto LABEL_12;
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D8C8);
    }
  }
  else
  {
    if (!a4)
      goto LABEL_12;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernelLibrary"), 1, &unk_1E2F1D8F0);
  }
  *a4 = v10;
LABEL_12:

  if (v6->_library)
  {
    XXH64_reset(v16, 0);
    CI::XXHashHelper::add((CI::XXHashHelper *)v16, (CFStringRef)objc_msgSend(a3, "absoluteString"));
    v6->_digest = XXH64_digest((uint64_t)v16);
    if (CI_HARVESTING_SPECIFIC_LIBRARY_LIST())
    {
      v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", CI_HARVESTING_SPECIFIC_LIBRARY_LIST(), 1), "containsString:", -[NSURL lastPathComponent](v6->_url, "lastPathComponent"));
      v13 = CI_HARVEST_BIN_ARCHIVE_PROGRAM_TYPE() == 3 ? v12 : 1;
      if (v13 != 1 || (CI_HARVEST_BIN_ARCHIVE_PROGRAM_TYPE() == 4 ? (v14 = v12) : (v14 = 0), v14 == 1))
        v6->_harvest_for_this_library = 0;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  NSObject *data;
  NSSet *extern_function_names;
  NSSet *stitchable_function_names;
  objc_super v6;

  data = self->_data;
  if (data)
    dispatch_release(data);
  extern_function_names = self->_extern_function_names;
  if (extern_function_names)

  stitchable_function_names = self->_stitchable_function_names;
  if (stitchable_function_names)

  v6.receiver = self;
  v6.super_class = (Class)CIKernelLibrary;
  -[CIKernelLibrary dealloc](&v6, sel_dealloc);
}

- (unint64_t)functionCount
{
  unint64_t result;

  result = objc_msgSend((id)-[MTLLibrary externFunctionNames](self->_library, "externFunctionNames"), "count");
  if (!result)
    return -[NSSet count](self->_stitchable_function_names, "count");
  return result;
}

- (id)functionNames
{
  void *v3;

  v3 = (void *)-[MTLLibrary externFunctionNames](self->_library, "externFunctionNames");
  if (objc_msgSend(v3, "count"))
    return v3;
  else
    return (id)-[MTLLibrary functionNames](self->_library, "functionNames");
}

- (id)functionWithName:(id)a3
{
  _BOOL4 v5;
  MTLLibrary *library;
  void *v7;

  v5 = -[NSSet containsObject:](self->_extern_function_names, "containsObject:");
  library = self->_library;
  if (v5)
    v7 = (void *)-[MTLLibrary newExternFunctionWithName:](library, "newExternFunctionWithName:", a3);
  else
    v7 = (void *)-[MTLLibrary newFunctionWithName:](library, "newFunctionWithName:", a3);
  return v7;
}

- (id)newFunctionWithName:(id)a3
{
  _BOOL4 v5;
  MTLLibrary *library;

  v5 = -[NSSet containsObject:](self->_extern_function_names, "containsObject:");
  library = self->_library;
  if (v5)
    return (id)-[MTLLibrary newExternFunctionWithName:](library, "newExternFunctionWithName:", a3);
  else
    return (id)-[MTLLibrary newFunctionWithName:](library, "newFunctionWithName:", a3);
}

- (id)newSpecializedFunctionWithDescriptor:(id)a3
{
  char *v5;
  uint64_t v6;
  MTLLibrary *library;
  id v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE block[24];
  void *v22;
  id v23;
  uint64_t v24;
  MTLLibrary *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  if (self->_harvest_for_this_library
    && CI_HARVEST_BIN_ARCHIVE() == 2
    && CI_HARVEST_SPECIALIZED_MTL_FUNCTIONS())
  {
    v5 = CI_HARVEST_PROCESS_NAME_LIST();
    v6 = MEMORY[0x1E0C809B0];
    if (!v5)
      goto LABEL_8;
    *(_QWORD *)block = MEMORY[0x1E0C809B0];
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = ___ZL26isHarvestingForThisProcessv_block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0l;
    v23 = v5;
    if (isHarvestingForThisProcess(void)::onceToken != -1)
      dispatch_once(&isHarvestingForThisProcess(void)::onceToken, block);
    if (isHarvestingForThisProcess(void)::isListed)
    {
LABEL_8:
      library = self->_library;
      v8 = CIMetalCopyDefaultDevice();
      if ((CIMetalDeviceIsSupported(v8, v9) & 1) == 0)
        -[CIKernelLibrary newSpecializedFunctionWithDescriptor:].cold.1();
      v10 = (void *)CIGetHarvestingBinaryArchiveDict((uint64_t)v8);
      v11 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bin"));
      v12 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue"));
      *(_QWORD *)block = v6;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = ___ZL37addSpecializedFunctionToBinaryArchiveP21MTLFunctionDescriptorPU21objcproto10MTLLibrary11objc_object_block_invoke;
      v22 = &unk_1E2EC4A38;
      v23 = a3;
      v24 = v11;
      v25 = library;
      dispatch_sync(v12, block);
    }
  }
  if ((CI_LOG_BIN_ARCHIVE_MISS() & 4) != 0)
  {
    objc_msgSend(a3, "setOptions:", 4, 0);
    v13 = (void *)-[MTLLibrary newFunctionWithDescriptor:error:](self->_library, "newFunctionWithDescriptor:error:", a3, &v19);
    objc_msgSend(a3, "setOptions:", 0);
    if (v13)
      return v13;
    v17 = ci_logger_compile();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(a3, "name");
      *(_DWORD *)block = 138543362;
      *(_QWORD *)&block[4] = v18;
      _os_log_impl(&dword_1921E4000, v17, OS_LOG_TYPE_INFO, "Failed finding %{public}@ stitchable function in the archive", block, 0xCu);
    }
  }
  v13 = (void *)-[MTLLibrary newFunctionWithDescriptor:error:](self->_library, "newFunctionWithDescriptor:error:", a3, &v20);
  if (v20)
  {
    v14 = ci_logger_compile();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(a3, "name");
      *(_DWORD *)block = 138543618;
      *(_QWORD *)&block[4] = v15;
      *(_WORD *)&block[12] = 2114;
      *(_QWORD *)&block[14] = v20;
      _os_log_impl(&dword_1921E4000, v14, OS_LOG_TYPE_INFO, "Failed creating %{public}@ function from library %{public}@", block, 0x16u);
    }
  }
  return v13;
}

- (id)newSpecializedFunctionWithName:(id)a3 constants:(void *)a4
{
  void *v4;
  NSObject *v5;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v4 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](self->_library, "newFunctionWithName:constantValues:error:", a3, a4, &v7);
  if (v7)
  {
    v5 = ci_logger_compile();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1921E4000, v5, OS_LOG_TYPE_INFO, "Failed creating function from library %{public}@", buf, 0xCu);
    }
  }
  return v4;
}

- (void)initFunctionNames
{
  self->_extern_function_names = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", -[MTLLibrary externFunctionNames](self->_library, "externFunctionNames"));
  self->_stitchable_function_names = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", -[MTLLibrary functionNames](self->_library, "functionNames"));
}

- (unint64_t)digest
{
  return self->_digest;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)mtl_source
{
  return self->_mtl_source;
}

+ (id)coreImageDylibWithDevice:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  if (!objc_msgSend(a3, "supportsDynamicLibraries"))
    return 0;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(v5, "temporaryDirectory");
  v7 = objc_msgSend(v6, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("coreimage_%@"), objc_msgSend(a3, "name")));
  if (+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::once_token != -1)
    dispatch_once(&+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::once_token, &__block_literal_global_84);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__24;
  v15 = __Block_byref_object_dispose__24;
  v16 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke_86;
  block[3] = &unk_1E2EC7778;
  block[4] = v5;
  block[5] = v7;
  block[7] = a1;
  block[8] = &v11;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::q, block);

  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

dispatch_queue_t __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("CILoadCIDylibQ", v0);
  +[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::q = (uint64_t)result;
  return result;
}

void __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke_86(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 40), "path")))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 48), "newDynamicLibraryWithURL:error:", *(_QWORD *)(a1 + 40), &v9);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v2 = ci_logger_compile();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = objc_msgSend(*(id *)(a1 + 40), "path");
        *(_DWORD *)buf = 138543618;
        v11 = v3;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_1921E4000, v2, OS_LOG_TYPE_INFO, "Failed loading serialized CoreImage.metallib from %{public}@: %{public}@\n", buf, 0x16u);
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", CFSTR("CoreImage"), CFSTR("metallib"));
    v5 = (void *)v4;
    if (v4)
      v4 = objc_msgSend(*(id *)(a1 + 48), "newDynamicLibraryWithURL:error:", v4, &v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v4;
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (v6)
    {
      objc_msgSend(v6, "serializeToURL:error:", *(_QWORD *)(a1 + 40), &v9);
    }
    else
    {
      v7 = ci_logger_compile();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = objc_msgSend(v5, "path");
        *(_DWORD *)buf = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_1921E4000, v7, OS_LOG_TYPE_INFO, "Failed loading CoreImage.metallib from %{public}@: %{public}@\n", buf, 0x16u);
      }
    }
  }
}

- (void)newSpecializedFunctionWithDescriptor:.cold.1()
{
  __assert_rtn("addSpecializedFunctionToBinaryArchive", "kernel-library.mm", 132, "CIMetalDeviceIsSupported(device)");
}

@end
