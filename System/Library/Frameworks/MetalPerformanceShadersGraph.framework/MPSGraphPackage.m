@implementation MPSGraphPackage

- (MPSGraphPackage)initWithSourcePackageURL:(id)a3 error:(id *)a4
{
  id v7;
  MPSGraphPackage *v8;
  uint64_t v9;
  NSFileManager *fileManager;
  id *p_packageURL;
  NSURL *temporaryPackageURL;
  NSFileManager *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *plistRoot;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v28;
  objc_super v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MPSGraphPackage;
  v8 = -[MPSGraphPackage init](&v29, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = objc_claimAutoreleasedReturnValue();
  fileManager = v8->_fileManager;
  v8->_fileManager = (NSFileManager *)v9;

  p_packageURL = (id *)&v8->_packageURL;
  objc_storeStrong((id *)&v8->_packageURL, a3);
  temporaryPackageURL = v8->_temporaryPackageURL;
  v8->_temporaryPackageURL = 0;

  v8->_mlirFileCount = 0;
  v28 = 0;
  v13 = v8->_fileManager;
  -[NSURL path](v8->_packageURL, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = -[NSFileManager fileExistsAtPath:isDirectory:](v13, "fileExistsAtPath:isDirectory:", v14, &v28);

  if (!(_DWORD)v13)
  {
    if (!a4)
      goto LABEL_11;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*p_packageURL, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Error: did not find file at url: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mps"), -19, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    a4 = 0;
    goto LABEL_11;
  }
  if (!v28)
  {
    if (!a4)
      goto LABEL_11;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Error: file is unexpectedly not a directory");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mps"), -19, v26);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(*p_packageURL, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  loadPlistAtURL((uint64_t)v15, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {

    goto LABEL_10;
  }
  v18 = objc_msgSend(v16, "mutableCopy");
  plistRoot = v8->_plistRoot;
  v8->_plistRoot = (NSMutableDictionary *)v18;

  a4 = v8;
LABEL_11:

  return (MPSGraphPackage *)a4;
}

- (MPSGraphPackage)initWithSourcePackageURL:(id)a3
{
  id v4;
  MPSGraphPackage *v5;
  id v6;
  void *v7;
  void *v9;
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphPackage;
  v10 = 0;
  v5 = -[MPSGraphPackage initWithSourcePackageURL:error:](-[MPSGraphPackage init](&v11, sel_init), "initWithSourcePackageURL:error:", v4, &v10);
  v6 = v10;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "localizedDescription");

      if (MTLReportFailureTypeEnabled())
      {
        objc_msgSend(v7, "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        MTLReportFailure();

      }
    }
    else if (MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
    }
  }

  return v5;
}

- (MPSGraphPackage)initWithPackageURL:(id)a3 temporaryPackageURL:(id)a4 append:(BOOL)a5
{
  _BOOL4 v5;
  MPSGraphPackage *v9;
  uint64_t v10;
  NSFileManager *fileManager;
  NSMutableDictionary *v12;
  NSMutableDictionary *plistRoot;
  id v14;
  NSFileManager *v15;
  void *v16;
  NSFileManager *v17;
  void *v18;
  NSFileManager *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSMutableDictionary *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t mlirFileCount;
  NSFileManager *v35;
  BOOL v36;
  id v37;
  id v38;
  NSFileManager *v39;
  void *v40;
  BOOL v41;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  char v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v5 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a4;
  v62.receiver = self;
  v62.super_class = (Class)MPSGraphPackage;
  v9 = -[MPSGraphPackage init](&v62, sel_init);
  objc_storeStrong((id *)&v9->_packageURL, a3);
  objc_storeStrong((id *)&v9->_temporaryPackageURL, a4);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = objc_claimAutoreleasedReturnValue();
  fileManager = v9->_fileManager;
  v9->_fileManager = (NSFileManager *)v10;

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  plistRoot = v9->_plistRoot;
  v9->_plistRoot = v12;

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_plistRoot, "setObject:forKeyedSubscript:", v14, CFSTR("Package Version"));

  v9->_mlirFileCount = 0;
  v61 = 0;
  v15 = v9->_fileManager;
  objc_msgSend(v52, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = -[NSFileManager fileExistsAtPath:isDirectory:](v15, "fileExistsAtPath:isDirectory:", v16, &v61);

  if ((_DWORD)v15)
  {
    if (v61 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    v17 = v9->_fileManager;
    objc_msgSend(v52, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    LOBYTE(v17) = -[NSFileManager removeItemAtPath:error:](v17, "removeItemAtPath:error:", v18, &v60);
    v50 = v60;

    if ((v17 & 1) == 0 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  else
  {
    v50 = 0;
  }
  v19 = v9->_fileManager;
  objc_msgSend(v51, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = -[NSFileManager fileExistsAtPath:isDirectory:](v19, "fileExistsAtPath:isDirectory:", v20, &v61);

  if ((v19 & v5) != 0)
  {
    if (!v61 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    objc_msgSend(v51, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
    v59 = 0;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    loadPlistAtURL((uint64_t)v45, &v59);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v59;
    v48 = v22;
    v49 = v21;
    if (!v21)
    {
      if (v22)
      {
        objc_msgSend(v22, "localizedDescription");

        if (MTLReportFailureTypeEnabled())
        {
          objc_msgSend(v48, "localizedDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = CFSTR("\n");
          MTLReportFailure();

        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }
    v23 = objc_msgSend(v21, "mutableCopy", v44);
    v24 = v9->_plistRoot;
    v9->_plistRoot = (NSMutableDictionary *)v23;

    -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v9->_fileManager, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v51, MEMORY[0x1E0C9AA60], 4, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pathExtension='mpsgraph'"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "filteredArrayUsingPredicate:");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v56 != v27)
            objc_enumerationMutation(v25);
          v29 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v29, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringByDeletingPathExtension");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "substringFromIndex:", 6);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "integerValue");
          mlirFileCount = v9->_mlirFileCount;
          if (v33 > mlirFileCount)
            mlirFileCount = v33;
          v9->_mlirFileCount = mlirFileCount;

        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v26);
    }

    v35 = v9->_fileManager;
    v54 = v48;
    v36 = -[NSFileManager copyItemAtURL:toURL:error:](v35, "copyItemAtURL:toURL:error:", v51, v52, &v54);
    v37 = v54;

    if (!v36 && MTLReportFailureTypeEnabled())
      MTLReportFailure();

    v38 = v50;
  }
  else
  {
    v39 = v9->_fileManager;
    objc_msgSend(v52, "path");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v50;
    v41 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v39, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v40, 1, 0, &v53);
    v38 = v53;

    if (!v41 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }

  return v9;
}

- (id)getPackageKeyForPlatform:(unint64_t)a3 andMinimumDeploymentTarget:(MPSGraphOperatingSystemVersion *)a4
{
  int64_t var0;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSString *v15;
  int64_t var1;
  int64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v25;
  id v26;
  void *v27;
  int64_t var2;
  int64_t v29;
  id obj;
  MPSGraphOperatingSystemVersion v32;
  MPSGraphOperatingSystemVersion v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (qword_1EDC0BEA0 != -1)
    dispatch_once(&qword_1EDC0BEA0, &__block_literal_global_2);
  v6 = (id)_MergedGlobals_3;
  v27 = v6;
  if (a3 >= 4)
  {
    if (MTLReportFailureTypeEnabled())
    {
      v25 = a3;
      MTLReportFailure();
    }
  }
  else
  {
    v29 = qword_18128D790[a3];
    var0 = qword_18128D7B0[a3];
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "allKeys", v25);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v7)
  {
    var2 = 0;
    goto LABEL_40;
  }
  var2 = 0;
  v8 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v35 != v8)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("OS"), v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", CFSTR("OS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v12;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("macOS")) & 1) == 0)
      {
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("iOS")) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_22;
        }
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("tvOS")) & 1) != 0)
        {
          v14 = 2;
          goto LABEL_22;
        }
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("visionOS")) & 1) != 0)
        {
          v14 = 3;
          goto LABEL_22;
        }
        if (MTLReportFailureTypeEnabled())
        {
          v26 = v13;
          MTLReportFailure();
          v14 = 0;
          goto LABEL_22;
        }
      }
      v14 = 0;
LABEL_22:

      if (v14 == a3)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v33, v15);

        if (v33.var0 > var0 || v33.var0 == var0 && (v33.var1 > v29 || v33.var1 == v29 && v33.var2 > var2))
        {
          if (v33.var0 < a4->var0)
          {
            var1 = v33.var1;
LABEL_26:
            var2 = v33.var2;
            v29 = var1;
            var0 = v33.var0;
            goto LABEL_36;
          }
          if (v33.var0 == a4->var0)
          {
            var1 = v33.var1;
            v17 = a4->var1;
            if (v33.var1 < v17 || v33.var1 == v17 && v33.var2 <= a4->var2)
              goto LABEL_26;
          }
        }
      }
LABEL_36:

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v7);
LABEL_40:

  v32.var0 = var0;
  v32.var1 = v29;
  v32.var2 = var2;
  v18 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v19 = v18;
  if (a3 >= 4)
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
  }
  else
  {
    objc_msgSend(v18, "stringByAppendingString:", off_1E0E76B28[a3]);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  MPSGraphOperatingSystemVersion::asString(&v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "objectForKey:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23 && MTLReportFailureTypeEnabled())
    MTLReportFailure();

  return v23;
}

- (void)createVersionedBytecodeFromMlirModule:(ModuleOp)a3 packageKey:(id)a4 fileHandle:(id)a5 resourceStorageMode:(unint64_t)a6 downgradedModuleCallback:(function_ref<void)(mlir::mps::serialization::ModuleOp
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  size_t v17;
  size_t v18;
  _QWORD *p_dst;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  std::string::size_type v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *p_p;
  id v29;
  void *v30;
  void *v31;
  llvm::ToolOutputFile::CleanupInstaller *v32;
  void *__p;
  uint64_t v34;
  uint64_t v35;
  _QWORD *__dst;
  size_t v37;
  int64_t v38;
  Operation *state;

  state = a3.state;
  v9 = a4;
  v10 = a5;
  if (qword_1EDC0BEB0 != -1)
    dispatch_once(&qword_1EDC0BEB0, &__block_literal_global_79);
  objc_msgSend((id)qword_1EDC0BEA8, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 && MTLReportFailureTypeEnabled())
  {
    v29 = v9;
    MTLReportFailure();
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("kMPSDialect"), v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "count");
  if (objc_msgSend(v13, "count") != 3 && MTLReportFailureTypeEnabled())
  {
    v30 = v12;
    MTLReportFailure();
  }
  -[NSURL URLByAppendingPathComponent:](self->_temporaryPackageURL, "URLByAppendingPathComponent:", v10, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const char *)objc_msgSend(v15, "cStringUsingEncoding:", 4);
  v17 = strlen(v16);
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    p_dst = operator new(v20 + 1);
    v37 = v18;
    v38 = v21 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v38) = v17;
    p_dst = &__dst;
    if (!v17)
    {
LABEL_13:
      *((_BYTE *)p_dst + v18) = 0;

      __p = 0;
      v34 = 0;
      v35 = 0;
      if (v38 >= 0)
        v22 = &__dst;
      else
        v22 = __dst;
      if (v38 >= 0)
        v23 = HIBYTE(v38);
      else
        v23 = v37;
      mlir::openOutputFile(v22, v23, (uint64_t)&__p, &v32);
      v24 = HIBYTE(v35);
      if (v35 < 0)
        v24 = v34;
      if (v24 && MTLReportFailureTypeEnabled())
      {
        if (v35 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", p_p, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        MTLReportFailure();

      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "intValue");

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "intValue");

      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "intValue");

      mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)&state);
    }
  }
  memmove(p_dst, v16, v18);
  goto LABEL_13;
}

- (void)createBytecodeFromMlirModule:(ModuleOp)a3 fileHandle:(id)a4 resourceStorageMode:(unint64_t)a5
{
  void *v7;
  id v8;
  const char *v9;
  size_t v10;
  size_t v11;
  _QWORD *p_dst;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  std::string::size_type v16;
  uint64_t v17;
  const mlir::BytecodeWriterConfig *v18;
  void *p_p;
  void *v20;
  uint64_t v21;
  llvm::ToolOutputFile::CleanupInstaller *v22;
  void *__p;
  uint64_t v24;
  uint64_t v25;
  _QWORD *__dst;
  size_t v27;
  int64_t v28;

  -[NSURL URLByAppendingPathComponent:](self->_temporaryPackageURL, "URLByAppendingPathComponent:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);
  v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    p_dst = operator new(v13 + 1);
    v27 = v11;
    v28 = v14 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v28) = v10;
    p_dst = &__dst;
    if (!v10)
    {
LABEL_9:
      *((_BYTE *)p_dst + v11) = 0;

      __p = 0;
      v24 = 0;
      v25 = 0;
      if (v28 >= 0)
        v15 = &__dst;
      else
        v15 = __dst;
      if (v28 >= 0)
        v16 = HIBYTE(v28);
      else
        v16 = v27;
      mlir::openOutputFile(v15, v16, (uint64_t)&__p, &v22);
      v17 = HIBYTE(v25);
      if (v25 < 0)
        v17 = v24;
      if (v17 && MTLReportFailureTypeEnabled())
      {
        if (v25 >= 0)
          p_p = &__p;
        else
          p_p = __p;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", p_p, 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        MTLReportFailure();

      }
      mlir::BytecodeWriterConfig::BytecodeWriterConfig(&v21, (uint64_t)"MLIR18.0.0git", 13);
      if (a5 == 1)
        mlir::BytecodeWriterConfig::setElideResourceDataFlag((uint64_t)&v21, 1);
      mlir::writeBytecodeToFile(a3.state, *((mlir::Operation **)v22 + 17), (llvm::raw_ostream *)&v21, v18);
    }
  }
  memmove(p_dst, v9, v11);
  goto LABEL_9;
}

- (id)createFileHandle
{
  void *v3;
  unint64_t mlirFileCount;
  void *v5;
  void *v6;
  NSFileManager *fileManager;
  void *v8;
  NSFileManager *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  mlirFileCount = self->_mlirFileCount;
  self->_mlirFileCount = mlirFileCount + 1;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("model_%lu.mpsgraph"), mlirFileCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_packageURL, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fileManager = self->_fileManager;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v8);

  v9 = self->_fileManager;
  objc_msgSend(v6, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = -[NSFileManager fileExistsAtPath:](v9, "fileExistsAtPath:", v10);

  if ((_DWORD)v9 && MTLReportFailureTypeEnabled())
    MTLReportFailure();

  return v5;
}

+ (id)getResourceFileName
{
  return CFSTR("resources.bin");
}

- (id)writeResources:(ArrayRef<mlir::mps::MPSResourceBlobEntry *>)a3
{
  unint64_t var1;
  MPSResourceBlobEntry **var0;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  int v17;
  MPSResourceBlobEntry **v18;
  MPSResourceBlobEntry *v19;
  size_t v20;
  const void *v21;
  uint64_t v22;
  void **p_dst;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  void **v27;
  char *v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  int v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  int v48;
  NSURL *temporaryPackageURL;
  void *v50;
  void *v51;
  id v52;
  const char *v53;
  size_t v54;
  size_t v55;
  void **v56;
  uint64_t v57;
  uint64_t v58;
  void **v59;
  _QWORD *v60;
  char *v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  char *v66;
  size_t *v67;
  unint64_t v68;
  size_t v69;
  void *v70;
  void *p_p;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  size_t *v78;
  BOOL v79;
  id v80;
  uint64_t v81;
  llvm *v82;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  void **v88;
  void *v89;
  void *v90;
  __int128 v91;
  void *__p;
  size_t v93;
  int64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98[2];
  uint64_t v99;
  void **__dst;
  _QWORD *v101;
  int64_t v102;
  __int128 v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  _QWORD v107[62];

  var1 = a3.var1;
  var0 = a3.var0;
  v107[60] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a3.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!var1)
  {
    v16 = v6;
    goto LABEL_128;
  }
  v105 = v107;
  v106 = 0xA00000000;
  if (var1 >= 0xB)
  {
    __dst = 0;
    v8 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, var1, 48, (unint64_t *)&__dst);
    v9 = v8;
    v10 = (char *)v105;
    if ((_DWORD)v106)
    {
      v11 = (char *)v105 + 48 * v106;
      v12 = v8;
      do
      {
        v13 = *(_OWORD *)v10;
        *((_QWORD *)v12 + 2) = *((_QWORD *)v10 + 2);
        *(_OWORD *)v12 = v13;
        *((_QWORD *)v10 + 1) = 0;
        *((_QWORD *)v10 + 2) = 0;
        *(_QWORD *)v10 = 0;
        v14 = *(_OWORD *)(v10 + 24);
        *((_QWORD *)v12 + 5) = *((_QWORD *)v10 + 5);
        *(_OWORD *)(v12 + 24) = v14;
        v10 += 48;
        v12 += 48;
      }
      while (v10 != v11);
      v10 = (char *)v105;
      if ((_DWORD)v106)
      {
        v15 = 48 * v106;
        do
        {
          if (v10[v15 - 25] < 0)
            operator delete(*(void **)&v10[v15 - 48]);
          v15 -= 48;
        }
        while (v15);
        v10 = (char *)v105;
      }
    }
    v17 = (int)__dst;
    if (v10 != (char *)v107)
      free(v10);
    v105 = v9;
    HIDWORD(v106) = v17;
  }
  v90 = v7;
  v18 = &var0[var1];
  do
  {
    v19 = *var0;
    if (!*((_BYTE *)*var0 + 80))
      __assert_rtn("-[MPSGraphPackage writeResources:]", "MPSGraphComputePackage.mm", 589, "blob");
    v20 = *((_QWORD *)v19 + 1);
    if (v20 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    v21 = *(const void **)v19;
    v91 = *((_OWORD *)v19 + 1);
    v22 = *((_QWORD *)v19 + 4);
    if (v20 >= 0x17)
    {
      v24 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v20 | 7) != 0x17)
        v24 = v20 | 7;
      v25 = v24 + 1;
      p_dst = (void **)operator new(v24 + 1);
      v101 = (_QWORD *)v20;
      v102 = v25 | 0x8000000000000000;
      __dst = p_dst;
LABEL_26:
      memmove(p_dst, v21, v20);
      goto LABEL_27;
    }
    HIBYTE(v102) = *((_QWORD *)v19 + 1);
    p_dst = (void **)&__dst;
    if (v20)
      goto LABEL_26;
LABEL_27:
    *((_BYTE *)p_dst + v20) = 0;
    v103 = v91;
    v104 = v22;
    v26 = v105;
    if (v106 >= HIDWORD(v106))
    {
      v32 = v106 + 1;
      if (v105 <= &__dst && (char *)v105 + 48 * v106 > (char *)&__dst)
      {
        v98[0] = 0;
        v41 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, v32, 48, (unint64_t *)v98);
        v28 = v41;
        v42 = (char *)v105;
        if ((_DWORD)v106)
        {
          v43 = (char *)v105 + 48 * v106;
          v44 = v41;
          do
          {
            v45 = *(_OWORD *)v42;
            *((_QWORD *)v44 + 2) = *((_QWORD *)v42 + 2);
            *(_OWORD *)v44 = v45;
            *((_QWORD *)v42 + 1) = 0;
            *((_QWORD *)v42 + 2) = 0;
            *(_QWORD *)v42 = 0;
            v46 = *(_OWORD *)(v42 + 24);
            *((_QWORD *)v44 + 5) = *((_QWORD *)v42 + 5);
            *(_OWORD *)(v44 + 24) = v46;
            v42 += 48;
            v44 += 48;
          }
          while (v42 != v43);
          v42 = (char *)v105;
          if ((_DWORD)v106)
          {
            v47 = 48 * v106;
            do
            {
              if (v42[v47 - 25] < 0)
                operator delete(*(void **)&v42[v47 - 48]);
              v47 -= 48;
            }
            while (v47);
            v42 = (char *)v105;
          }
        }
        v48 = (int)v98[0];
        if (v42 != (char *)v107)
          free(v42);
        v105 = v28;
        HIDWORD(v106) = v48;
        v27 = (void **)&v28[16 * (((char *)&__dst - v26) >> 4)];
      }
      else
      {
        v98[0] = 0;
        v33 = (char *)llvm::SmallVectorBase<unsigned int>::mallocForGrow((uint64_t)&v105, v107, v32, 48, (unint64_t *)v98);
        v28 = v33;
        v34 = (char *)v105;
        if ((_DWORD)v106)
        {
          v35 = (char *)v105 + 48 * v106;
          v36 = v33;
          do
          {
            v37 = *(_OWORD *)v34;
            *((_QWORD *)v36 + 2) = *((_QWORD *)v34 + 2);
            *(_OWORD *)v36 = v37;
            *((_QWORD *)v34 + 1) = 0;
            *((_QWORD *)v34 + 2) = 0;
            *(_QWORD *)v34 = 0;
            v38 = *(_OWORD *)(v34 + 24);
            *((_QWORD *)v36 + 5) = *((_QWORD *)v34 + 5);
            *(_OWORD *)(v36 + 24) = v38;
            v34 += 48;
            v36 += 48;
          }
          while (v34 != v35);
          v34 = (char *)v105;
          if ((_DWORD)v106)
          {
            v39 = 48 * v106;
            do
            {
              if (v34[v39 - 25] < 0)
                operator delete(*(void **)&v34[v39 - 48]);
              v39 -= 48;
            }
            while (v39);
            v34 = (char *)v105;
          }
        }
        v40 = (int)v98[0];
        if (v34 != (char *)v107)
          free(v34);
        v105 = v28;
        HIDWORD(v106) = v40;
        v27 = (void **)&__dst;
      }
    }
    else
    {
      v27 = (void **)&__dst;
      v28 = (char *)v105;
    }
    v29 = &v28[48 * v106];
    v30 = *(_OWORD *)v27;
    *((_QWORD *)v29 + 2) = v27[2];
    *(_OWORD *)v29 = v30;
    v27[1] = 0;
    v27[2] = 0;
    *v27 = 0;
    v31 = *(_OWORD *)(v27 + 3);
    *((_QWORD *)v29 + 5) = v27[5];
    *(_OWORD *)(v29 + 24) = v31;
    if (v106 >= HIDWORD(v106))
      __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
    LODWORD(v106) = v106 + 1;
    if (SHIBYTE(v102) < 0)
      operator delete(__dst);
    ++var0;
  }
  while (var0 != v18);
  temporaryPackageURL = self->_temporaryPackageURL;
  +[MPSGraphPackage getResourceFileName](MPSGraphPackage, "getResourceFileName");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](temporaryPackageURL, "URLByAppendingPathComponent:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "path");
  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v53 = (const char *)objc_msgSend(v52, "cStringUsingEncoding:", 4);
  v54 = strlen(v53);
  if (v54 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v55 = v54;
  if (v54 >= 0x17)
  {
    v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17)
      v57 = v54 | 7;
    v58 = v57 + 1;
    v56 = (void **)operator new(v57 + 1);
    v101 = (_QWORD *)v55;
    v102 = v58 | 0x8000000000000000;
    __dst = v56;
    goto LABEL_65;
  }
  HIBYTE(v102) = v54;
  v56 = (void **)&__dst;
  if (v54)
LABEL_65:
    memmove(v56, v53, v55);
  v7 = v90;
  *((_BYTE *)v56 + v55) = 0;

  v98[0] = 0;
  v98[1] = 0;
  v99 = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0x1000000000;
  if (v102 >= 0)
    v59 = (void **)&__dst;
  else
    v59 = __dst;
  if (v102 >= 0)
    v60 = (_QWORD *)HIBYTE(v102);
  else
    v60 = v101;
  __p = v105;
  v93 = v106;
  if ((support::ResourceStorage::add(v59, v60, (__int128 **)&__p, (uint64_t)&v95, (uint64_t)v98) & 1) == 0
    && MTLReportFailureTypeEnabled())
  {
    if (v99 >= 0)
      v88 = v98;
    else
      v88 = (void **)v98[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v88, 4);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    MTLReportFailure();

  }
  if ((_DWORD)v96)
  {
    v61 = (char *)v95;
    if (*(_QWORD *)v95)
      v62 = *(_QWORD *)v95 == -8;
    else
      v62 = 1;
    if (v62)
    {
      do
      {
        v64 = *((_QWORD *)v61 + 1);
        v61 += 8;
        v63 = v64;
        if (v64)
          v65 = v63 == -8;
        else
          v65 = 1;
      }
      while (v65);
    }
    v66 = (char *)v95 + 8 * v96;
    if (v61 != v66)
    {
      v67 = *(size_t **)v61;
      v68 = 0x1E0CB3000uLL;
      do
      {
        v69 = *v67;
        if (*v67 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v70 = *(void **)(v68 + 2368);
        if (v69 >= 0x17)
        {
          v72 = v68;
          v73 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v69 | 7) != 0x17)
            v73 = v69 | 7;
          v74 = v73 + 1;
          p_p = operator new(v73 + 1);
          v93 = v69;
          v94 = v74 | 0x8000000000000000;
          __p = p_p;
          v68 = v72;
        }
        else
        {
          HIBYTE(v94) = *v67;
          p_p = &__p;
          if (!v69)
            goto LABEL_95;
        }
        memmove(p_p, v67 + 2, v69);
LABEL_95:
        v7 = v90;
        *((_BYTE *)p_p + v69) = 0;
        if (v94 >= 0)
          v75 = &__p;
        else
          v75 = __p;
        objc_msgSend(v70, "stringWithCString:encoding:", v75, 4, v89);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v94) < 0)
          operator delete(__p);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v67[1]);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setObject:forKeyedSubscript:", v77, v76);

        do
        {
          v78 = (size_t *)*((_QWORD *)v61 + 1);
          v61 += 8;
          v67 = v78;
          if (v78)
            v79 = v67 + 1 == 0;
          else
            v79 = 1;
        }
        while (v79);
      }
      while (v61 != v66);
    }
  }
  v80 = v7;
  if (HIDWORD(v96) && (_DWORD)v96)
  {
    v81 = 0;
    do
    {
      v82 = *(llvm **)((char *)v95 + v81);
      if (v82 != (llvm *)-8 && v82 != 0)
        llvm::deallocate_buffer(v82, (void *)(*(_QWORD *)v82 + 17));
      v81 += 8;
    }
    while (8 * v96 != v81);
  }
  free(v95);
  if ((SHIBYTE(v99) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v102) & 0x80000000) == 0)
      goto LABEL_117;
LABEL_125:
    operator delete(__dst);
    v84 = (char *)v105;
    v85 = v106;
    if (!(_DWORD)v106)
      goto LABEL_126;
LABEL_118:
    v86 = 48 * v85;
    do
    {
      if (v84[v86 - 25] < 0)
        operator delete(*(void **)&v84[v86 - 48]);
      v86 -= 48;
    }
    while (v86);
    v84 = (char *)v105;
    if (v105 == v107)
      goto LABEL_128;
LABEL_127:
    free(v84);
    goto LABEL_128;
  }
  operator delete(v98[0]);
  if (SHIBYTE(v102) < 0)
    goto LABEL_125;
LABEL_117:
  v84 = (char *)v105;
  v85 = v106;
  if ((_DWORD)v106)
    goto LABEL_118;
LABEL_126:
  if (v84 != (char *)v107)
    goto LABEL_127;
LABEL_128:

  return v7;
}

+ (void)readResources:(id)a3 fromURL:(id)a4 usingAllocator:(function_ref<char *)(llvm:(unsigned long)long :(unsigned long)long StringRef
{
  id v6;
  const char *v7;
  size_t v8;
  size_t v9;
  void **p_dst;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  int8x16_t *v20;
  const unsigned __int8 *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *buffer;
  const unsigned __int8 **v26;
  char *v27;
  unsigned int v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  void **v34;
  uint64_t *v35;
  uint64_t v36;
  llvm *v37;
  void *v39;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *__p[2];
  uint64_t v54;
  void **__dst;
  uint64_t *v56;
  int64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = a4;
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v42, "path");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
    v8 = strlen(v7);
    if (v8 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v9 = v8;
    if (v8 >= 0x17)
    {
      v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v11 = v8 | 7;
      v12 = v11 + 1;
      p_dst = (void **)operator new(v11 + 1);
      v56 = (uint64_t *)v9;
      v57 = v12 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v57) = v8;
      p_dst = (void **)&__dst;
      if (!v8)
      {
LABEL_10:
        *((_BYTE *)p_dst + v9) = 0;

        __p[0] = 0;
        __p[1] = 0;
        v54 = 0;
        v50 = 0;
        v51 = 0;
        v52 = 0x1000000000;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v13 = v41;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v14)
        {
          v43 = v13;
          v44 = *(_QWORD *)v47;
          do
          {
            v15 = 0;
            v45 = v14;
            do
            {
              if (*(_QWORD *)v47 != v44)
                objc_enumerationMutation(v13);
              v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
              objc_msgSend(v13, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "unsignedLongLongValue");
              v19 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
              v20 = (int8x16_t *)v19;
              if (v19)
                v21 = (const unsigned __int8 *)strlen(v19);
              else
                v21 = 0;
              v22 = llvm::StringMapImpl::LookupBucketFor((uint64_t *)&v50, v20, v21);
              v23 = v50;
              v24 = *((_QWORD *)v50 + v22);
              if (v24 == -8)
              {
                LODWORD(v52) = v52 - 1;
              }
              else if (v24)
              {
                goto LABEL_20;
              }
              buffer = llvm::allocate_buffer((size_t)(v21 + 17), (std::align_val_t)8uLL);
              v26 = (const unsigned __int8 **)buffer;
              v27 = (char *)(buffer + 2);
              if (v21)
                memcpy(buffer + 2, v20, (size_t)v21);
              v21[(_QWORD)v27] = 0;
              *v26 = v21;
              v26[1] = 0;
              v23[v22] = v26;
              ++HIDWORD(v51);
              if ((int)v52 + HIDWORD(v51) > v51)
                __assert_rtn("try_emplace", "StringMap.h", 353, "NumItems + NumTombstones <= NumBuckets");
              v13 = v43;
              v28 = llvm::StringMapImpl::RehashTable((llvm::StringMapImpl *)&v50, v22);
              v29 = (uint64_t *)((char *)v50 + 8 * v28);
              v24 = *v29;
              if (*v29)
                v30 = v24 == -8;
              else
                v30 = 1;
              if (v30)
              {
                do
                {
                  v31 = v29[1];
                  ++v29;
                  v24 = v31;
                  if (v31)
                    v32 = v24 == -8;
                  else
                    v32 = 1;
                }
                while (v32);
              }
LABEL_20:
              *(_QWORD *)(v24 + 8) = v18;

              ++v15;
            }
            while (v15 != v45);
            v33 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            v14 = v33;
          }
          while (v33);
        }

        if (v57 >= 0)
          v34 = (void **)&__dst;
        else
          v34 = __dst;
        if (v57 >= 0)
          v35 = (uint64_t *)HIBYTE(v57);
        else
          v35 = v56;
        if ((support::ResourceStorage::read((uint64_t)v34, v35, (uint64_t)&v50, (uint64_t (*)(uint64_t, uint64_t, uint64_t, size_t, unint64_t))a5.var0, a5.var1, 0) & 1) == 0&& MTLReportFailureTypeEnabled())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", __p, 4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          MTLReportFailure();

        }
        if (HIDWORD(v51) && (_DWORD)v51)
        {
          v36 = 0;
          do
          {
            v37 = *(llvm **)((char *)v50 + v36);
            if (v37 != (llvm *)-8 && v37 != 0)
              llvm::deallocate_buffer(v37, (void *)(*(_QWORD *)v37 + 17));
            v36 += 8;
          }
          while (8 * v51 != v36);
        }
        free(v50);
        if (SHIBYTE(v54) < 0)
        {
          operator delete(__p[0]);
          if ((SHIBYTE(v57) & 0x80000000) == 0)
            goto LABEL_55;
        }
        else if ((SHIBYTE(v57) & 0x80000000) == 0)
        {
          goto LABEL_55;
        }
        operator delete(__dst);
        goto LABEL_55;
      }
    }
    memmove(p_dst, v7, v9);
    goto LABEL_10;
  }
LABEL_55:

}

- (void)setMLIRLibrary:(id)a3 withPackageKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MPSGraphPackage getMLIRLibrary](self, "getMLIRLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithMLIRLibrary:", v10);
  objc_msgSend(v7, "getDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_plistRoot, "objectForKeyedSubscript:", CFSTR("Package Version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

}

- (id)findLatestPackageKey
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_plistRoot, "objectForKeyedSubscript:", CFSTR("Package Version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__MPSGraphPackage_findLatestPackageKey__block_invoke;
  v5[3] = &unk_1E0E76B08;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MPSGraphPackage_findLatestPackageKey__block_invoke(uint64_t a1, void *a2)
{
  NSString *v4;
  BOOL v5;
  BOOL v6;
  NSString *v7;
  uint64_t v8;
  id *v9;
  NSString *v10;
  NSString *v11;
  int64_t var0;
  int64_t var2;
  int64_t var1;
  MPSGraphOperatingSystemVersion v15;
  MPSGraphOperatingSystemVersion v16;

  v4 = a2;
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v16, v4);
  if (v16.var0 < 4 || (v16.var0 == 4 ? (v5 = v16.var1 == 0) : (v5 = 0), v5 ? (v6 = v16.var2 <= 20) : (v6 = 0), v6))
  {
    *(_OWORD *)&v16.var0 = xmmword_18128D780;
    v16.var2 = 21;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "5.0.24");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v15, v7);
  if (v15.var0 < 4 || *(_OWORD *)&v15.var0 == 4 && v15.var2 <= 20)
  {
    *(_OWORD *)&v15.var0 = xmmword_18128D780;
    v15.var2 = 21;
  }

  if (v16.var0 < v15.var0
    || v16.var0 == v15.var0 && (v16.var1 < v15.var1 || v16.var1 == v15.var1 && v16.var2 <= v15.var2))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(NSString **)(v8 + 40);
    v9 = (id *)(v8 + 40);
    v10 = v11;
    if (!v11)
    {
LABEL_31:
      objc_storeStrong(v9, a2);
      goto LABEL_32;
    }
    MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v15, v10);
    var0 = v15.var0;
    if (v15.var0 < 4 || (var1 = v15.var1, var2 = v15.var2, *(_OWORD *)&v15.var0 == 4) && v15.var2 <= 20)
    {
      var1 = 0;
      var0 = 4;
      var2 = 21;
    }
    if (v16.var0 > var0 || v16.var0 == var0 && (v16.var1 > var1 || v16.var1 == var1 && v16.var2 > var2))
    {
      v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      goto LABEL_31;
    }
  }
LABEL_32:

}

- (id)findLatestPackage
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_plistRoot, "objectForKeyedSubscript:", CFSTR("Package Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MPSGraphPackage findLatestPackageKey](self, "findLatestPackageKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {

    return 0;
  }
}

- (id)getMLIRLibrary
{
  void *v2;
  MPSGraphPackageMLIRLibrary *v3;
  MPSGraphPackageMLIRLibrary *v4;

  -[MPSGraphPackage findLatestPackage](self, "findLatestPackage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[MPSGraphPackageMLIRLibrary initWithMLIRLibraryDict:]([MPSGraphPackageMLIRLibrary alloc], "initWithMLIRLibraryDict:", v2);
  else
    v3 = objc_alloc_init(MPSGraphPackageMLIRLibrary);
  v4 = v3;

  return v4;
}

- (id)getPlistData
{
  NSMutableDictionary *plistRoot;
  void *v3;
  id v4;
  id v6;

  plistRoot = self->_plistRoot;
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", plistRoot, 100, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (!v3 && MTLReportFailureTypeEnabled())
    MTLReportFailure();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistRoot, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_temporaryPackageURL, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
}

@end
