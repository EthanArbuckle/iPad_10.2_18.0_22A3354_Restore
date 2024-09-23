@implementation MPSGraphCompilationDescriptor

- (MPSGraphCompilationDescriptor)init
{
  MPSGraphCompilationDescriptor *v2;
  OS_dispatch_queue *dispatchQueue;
  NSDictionary *callables;
  NSString *entryFunctionName;
  MPSGraphExecutableConstantData *constantData;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPSGraphCompilationDescriptor;
  v2 = -[MPSGraphCompilationDescriptor init](&v12, sel_init);
  v2->_compilerOptions = 1423;
  v2->_aneCompilerSpatialSplitting = 3;
  v2->_optimizationProfile = 0;
  v2->_optimizationLevel = 1;
  v2->_printANEPlacementAnalysis = 0;
  v2->_waitForCompilationCompletion = 0;
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = 0;

  v2->_preferredDevice = 0;
  v2->_allowedComputeDevices = 7;
  v2->_enableANEFWToFWSignal = 0;
  v2->_enableANELateLatch = 0;
  callables = v2->_callables;
  v2->_callables = 0;

  entryFunctionName = v2->_entryFunctionName;
  v2->_entryFunctionName = 0;

  constantData = v2->_constantData;
  v2->_constantData = 0;

  v2->_enableParallelEncode = 0;
  v7 = std::thread::hardware_concurrency();
  v8 = v7 << (v7 > 1);
  if (v8 >= 4)
    v9 = 4;
  else
    v9 = v7 << (v7 > 1);
  if (v8)
    v10 = v9;
  else
    v10 = 1;
  v2->_maximumNumberOfParallelEncodingRegions = v10;
  v2->_minimumNumberOfOpsInParallelRegion = 5;
  v2->_enableMLIRDiagnostics = 0;
  v2->_enableShapeEquivalence = 0;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphCompilationDescriptor *v4;

  v4 = [MPSGraphCompilationDescriptor alloc];
  -[MPSGraphCompilationDescriptor setCompilerOptions:](v4, "setCompilerOptions:", self->_compilerOptions);
  -[MPSGraphCompilationDescriptor setAneCompilerSpatialSplitting:](v4, "setAneCompilerSpatialSplitting:", self->_aneCompilerSpatialSplitting);
  -[MPSGraphCompilationDescriptor setOptimizationProfile:](v4, "setOptimizationProfile:", self->_optimizationProfile);
  -[MPSGraphCompilationDescriptor setOptimizationLevel:](v4, "setOptimizationLevel:", self->_optimizationLevel);
  -[MPSGraphCompilationDescriptor setPrintANEPlacementAnalysis:](v4, "setPrintANEPlacementAnalysis:", self->_printANEPlacementAnalysis);
  -[MPSGraphCompilationDescriptor setWaitForCompilationCompletion:](v4, "setWaitForCompilationCompletion:", self->_waitForCompilationCompletion);
  -[MPSGraphCompilationDescriptor setCompilationCompletionHandler:](v4, "setCompilationCompletionHandler:", self->_compilationCompletionHandler);
  -[MPSGraphCompilationDescriptor setPreferredDevice:](v4, "setPreferredDevice:", self->_preferredDevice);
  -[MPSGraphCompilationDescriptor setAllowedComputeDevices:](v4, "setAllowedComputeDevices:", self->_allowedComputeDevices);
  -[MPSGraphCompilationDescriptor setEnableANEFWToFWSignal:](v4, "setEnableANEFWToFWSignal:", self->_enableANEFWToFWSignal);
  -[MPSGraphCompilationDescriptor setEnableANELateLatch:](v4, "setEnableANELateLatch:", self->_enableANELateLatch);
  -[MPSGraphCompilationDescriptor setCallables:](v4, "setCallables:", self->_callables);
  -[MPSGraphCompilationDescriptor setEntryFunctionName:](v4, "setEntryFunctionName:", self->_entryFunctionName);
  -[MPSGraphCompilationDescriptor setConstantData:](v4, "setConstantData:", self->_constantData);
  -[MPSGraphCompilationDescriptor setEnableParallelEncode:](v4, "setEnableParallelEncode:", self->_enableParallelEncode);
  -[MPSGraphCompilationDescriptor setMaximumNumberOfParallelEncodingRegions:](v4, "setMaximumNumberOfParallelEncodingRegions:", self->_maximumNumberOfParallelEncodingRegions);
  -[MPSGraphCompilationDescriptor setMinimumNumberOfOpsInParallelRegion:](v4, "setMinimumNumberOfOpsInParallelRegion:", self->_minimumNumberOfOpsInParallelRegion);
  -[MPSGraphCompilationDescriptor setEnableMLIRDiagnostics:](v4, "setEnableMLIRDiagnostics:", self->_enableMLIRDiagnostics);
  -[MPSGraphCompilationDescriptor setEnableShapeEquivalence:](v4, "setEnableShapeEquivalence:", self->_enableShapeEquivalence);
  return v4;
}

- (BOOL)isEqualForModuleTo:(id)a3
{
  id v4;
  unint64_t compilerOptions;
  unint64_t aneCompilerSpatialSplitting;
  unint64_t optimizationProfile;
  unint64_t optimizationLevel;
  int printANEPlacementAnalysis;
  unint64_t preferredDevice;
  unint64_t allowedComputeDevices;
  int enableANEFWToFWSignal;
  int enableANELateLatch;
  int enableParallelEncode;
  unint64_t maximumNumberOfParallelEncodingRegions;
  unint64_t minimumNumberOfOpsInParallelRegion;

  v4 = a3;
  compilerOptions = self->_compilerOptions;
  if (compilerOptions != objc_msgSend(v4, "compilerOptions"))
    goto LABEL_13;
  aneCompilerSpatialSplitting = self->_aneCompilerSpatialSplitting;
  if (aneCompilerSpatialSplitting != objc_msgSend(v4, "aneCompilerSpatialSplitting"))
    goto LABEL_13;
  optimizationProfile = self->_optimizationProfile;
  if (optimizationProfile != objc_msgSend(v4, "optimizationProfile"))
    goto LABEL_13;
  optimizationLevel = self->_optimizationLevel;
  if (optimizationLevel != objc_msgSend(v4, "optimizationLevel"))
    goto LABEL_13;
  printANEPlacementAnalysis = self->_printANEPlacementAnalysis;
  if (printANEPlacementAnalysis == objc_msgSend(v4, "printANEPlacementAnalysis")
    && (preferredDevice = self->_preferredDevice, preferredDevice == objc_msgSend(v4, "preferredDevice"))
    && (allowedComputeDevices = self->_allowedComputeDevices,
        allowedComputeDevices == objc_msgSend(v4, "allowedComputeDevices"))
    && (enableANEFWToFWSignal = self->_enableANEFWToFWSignal,
        enableANEFWToFWSignal == objc_msgSend(v4, "enableANEFWToFWSignal"))
    && (enableANELateLatch = self->_enableANELateLatch,
        enableANELateLatch == objc_msgSend(v4, "enableANELateLatch"))
    && (enableParallelEncode = self->_enableParallelEncode,
        enableParallelEncode == objc_msgSend(v4, "enableParallelEncode"))
    && (maximumNumberOfParallelEncodingRegions = self->_maximumNumberOfParallelEncodingRegions,
        maximumNumberOfParallelEncodingRegions == objc_msgSend(v4, "maximumNumberOfParallelEncodingRegions")))
  {
    minimumNumberOfOpsInParallelRegion = self->_minimumNumberOfOpsInParallelRegion;
    LOBYTE(minimumNumberOfOpsInParallelRegion) = minimumNumberOfOpsInParallelRegion == objc_msgSend(v4, "minimumNumberOfOpsInParallelRegion");

    return minimumNumberOfOpsInParallelRegion;
  }
  else
  {
LABEL_13:

    return 0;
  }
}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  int waitForCompilationCompletion;
  id compilationCompletionHandler;
  id v7;
  NSDictionary *callables;
  NSDictionary *v9;
  MPSGraphExecutableConstantData *constantData;
  MPSGraphExecutableConstantData *v11;
  int enableMLIRDiagnostics;
  int enableShapeEquivalence;
  _BOOL4 v14;
  NSString *entryFunctionName;
  NSString *v16;
  BOOL v17;
  char v18;
  NSString *v19;
  void *v20;

  v4 = a3;
  if (!-[MPSGraphCompilationDescriptor isEqualForModuleTo:](self, "isEqualForModuleTo:", v4))
    goto LABEL_8;
  waitForCompilationCompletion = self->_waitForCompilationCompletion;
  if (waitForCompilationCompletion != objc_msgSend(v4, "waitForCompilationCompletion"))
    goto LABEL_8;
  compilationCompletionHandler = self->_compilationCompletionHandler;
  objc_msgSend(v4, "compilationCompletionHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (compilationCompletionHandler != v7)
    goto LABEL_8;
  callables = self->_callables;
  objc_msgSend(v4, "callables");
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (callables != v9)
    goto LABEL_8;
  constantData = self->_constantData;
  objc_msgSend(v4, "constantData");
  v11 = (MPSGraphExecutableConstantData *)objc_claimAutoreleasedReturnValue();

  if (constantData == v11
    && (enableMLIRDiagnostics = self->_enableMLIRDiagnostics,
        enableMLIRDiagnostics == objc_msgSend(v4, "enableMLIRDiagnostics")))
  {
    enableShapeEquivalence = self->_enableShapeEquivalence;
    v14 = enableShapeEquivalence == objc_msgSend(v4, "enableShapeEquivalence");
  }
  else
  {
LABEL_8:
    v14 = 0;
  }
  entryFunctionName = self->_entryFunctionName;
  objc_msgSend(v4, "entryFunctionName");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  v17 = entryFunctionName == v16;
  v18 = entryFunctionName == v16 && v14;
  if (!v17 && v14)
  {
    v19 = self->_entryFunctionName;
    objc_msgSend(v4, "entryFunctionName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](v19, "isEqual:", v20);

  }
  return v18;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *entryFunctionName;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[15];
  _QWORD v22[17];

  v22[15] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("compilerOptions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_compilerOptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("aneCompilerSpatialSplitting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_aneCompilerSpatialSplitting);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  v21[2] = CFSTR("optimizationProfile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_optimizationProfile);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  v21[3] = CFSTR("optimizationLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_optimizationLevel);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("printANEPlacementAnalysis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_printANEPlacementAnalysis);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  v21[5] = CFSTR("preferredDevice");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_preferredDevice);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v3;
  v21[6] = CFSTR("allowedComputeDevices");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allowedComputeDevices);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v4;
  v21[7] = CFSTR("enableANEFWToFWSignal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableANEFWToFWSignal);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v5;
  v21[8] = CFSTR("enableANELateLatch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableANELateLatch);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  entryFunctionName = (const __CFString *)self->_entryFunctionName;
  if (!entryFunctionName)
    entryFunctionName = &stru_1E0E7A578;
  v22[8] = v6;
  v22[9] = entryFunctionName;
  v21[9] = CFSTR("entryFunctionName");
  v21[10] = CFSTR("enableParallelEncode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableParallelEncode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v9;
  v21[11] = CFSTR("maximumNumberOfParallelEncodingRegions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumNumberOfParallelEncodingRegions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v10;
  v21[12] = CFSTR("minimumNumberOfOpsInParallelRegion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumNumberOfOpsInParallelRegion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v11;
  v21[13] = CFSTR("enableMLIRDiagnostics");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableMLIRDiagnostics);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v12;
  v21[14] = CFSTR("enableShapeEquivalence");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableShapeEquivalence);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (MPSGraphCompilationDescriptor)descriptorWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("compilerOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 56) = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("aneCompilerSpatialSplitting"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 64) = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("optimizationProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 40) = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("optimizationLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 16) = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("printANEPlacementAnalysis"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 11) = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("preferredDevice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 72) = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allowedComputeDevices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 80) = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enableANEFWToFWSignal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 9) = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enableANELateLatch"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 10) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("entryFunctionName"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enableParallelEncode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 12) = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maximumNumberOfParallelEncodingRegions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 104) = objc_msgSend(v17, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minimumNumberOfOpsInParallelRegion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 112) = objc_msgSend(v18, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enableMLIRDiagnostics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 13) = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("enableShapeEquivalence"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(v4 + 14) = objc_msgSend(v20, "BOOLValue");

  return (MPSGraphCompilationDescriptor *)(id)v4;
}

- (unint64_t)hash
{
  unint64_t compilerOptions;
  unint64_t aneCompilerSpatialSplitting;
  unint64_t optimizationProfile;
  unint64_t optimizationLevel;
  unint64_t preferredDevice;
  unint64_t allowedComputeDevices;
  uint64_t enableANEFWToFWSignal;
  uint64_t enableANELateLatch;
  NSUInteger v10;
  unsigned __int8 v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v16;
  int v17;
  unint64_t v18;
  NSUInteger v19;

  compilerOptions = self->_compilerOptions;
  aneCompilerSpatialSplitting = self->_aneCompilerSpatialSplitting;
  optimizationProfile = self->_optimizationProfile;
  optimizationLevel = self->_optimizationLevel;
  preferredDevice = self->_preferredDevice;
  allowedComputeDevices = self->_allowedComputeDevices;
  enableANEFWToFWSignal = self->_enableANEFWToFWSignal;
  enableANELateLatch = self->_enableANELateLatch;
  v10 = -[NSString hash](self->_entryFunctionName, "hash");
  v12 = &mlir::detail::TypeIDResolver<std::complex<int>,void>::resolveTypeID(void)::id;
  if ((v11 & 1) == 0)
  {
    v19 = v10;
    v12 = &mlir::detail::TypeIDResolver<std::complex<int>,void>::resolveTypeID(void)::id;
    v17 = v16;
    v10 = v19;
    if (v17)
    {
      v18 = llvm::hashing::detail::fixed_seed_override;
      if (!llvm::hashing::detail::fixed_seed_override)
        v18 = 0xFF51AFD7ED558CCDLL;
      llvm::hashing::detail::get_execution_seed(void)::seed = v18;
      v12 = &mlir::detail::TypeIDResolver<std::complex<int>,void>::resolveTypeID(void)::id;
      v10 = v19;
    }
  }
  v13 = __ROR8__(v10 + 16, 16);
  v14 = (compilerOptions | (aneCompilerSpatialSplitting << 32) | (optimizationProfile << 38) | (optimizationLevel << 40) | (preferredDevice << 42) | (allowedComputeDevices << 48) | (enableANEFWToFWSignal << 57) | (enableANELateLatch << 58)) ^ v12[19] ^ v13;
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69 * (v13 ^ ((0x9DDFEA08EB382D69 * v14) >> 47) ^ (0x9DDFEA08EB382D69 * v14))) ^ ((0x9DDFEA08EB382D69 * (v13 ^ ((0x9DDFEA08EB382D69 * v14) >> 47) ^ (0x9DDFEA08EB382D69 * v14))) >> 47))) ^ v10;
}

- (vector<mlir::NamedAttribute,)getNamedAttrArray:(MPSGraphCompilationDescriptor *)self device:(SEL)a3
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NamedAttribute *var0;
  NamedAttribute *var1;
  NamedAttribute *v14;
  NamedAttribute *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  NamedAttribute *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NamedAttribute *v25;
  NamedAttribute *v26;
  NamedAttribute *v27;
  NamedAttribute *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  NamedAttribute *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NamedAttribute *v38;
  NamedAttribute *v39;
  NamedAttribute *v40;
  NamedAttribute *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  NamedAttribute *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NamedAttribute *v51;
  NamedAttribute *v52;
  NamedAttribute *v53;
  NamedAttribute *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  NamedAttribute *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NamedAttribute *v64;
  NamedAttribute *v65;
  NamedAttribute *v66;
  NamedAttribute *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  NamedAttribute *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NamedAttribute *v77;
  NamedAttribute *v78;
  NamedAttribute *v79;
  NamedAttribute *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  NamedAttribute *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t active_platform;
  unsigned int program_sdk_version;
  uint64_t v91;
  NamedAttribute *v92;
  NamedAttribute *v93;
  NamedAttribute *v94;
  NamedAttribute *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  NamedAttribute *v101;
  uint64_t v102;
  void *v103;
  id v104;
  _BYTE *v105;
  char v106;
  uint64_t v107;
  NamedAttribute *v108;
  NamedAttribute *v109;
  NamedAttribute *v110;
  NamedAttribute *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  NamedAttribute *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NamedAttribute *v121;
  NamedAttribute *v122;
  NamedAttribute *v123;
  NamedAttribute *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  NamedAttribute *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NamedAttribute *v134;
  NamedAttribute *v135;
  NamedAttribute *v136;
  NamedAttribute *v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char *v142;
  NamedAttribute *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NamedAttribute *v147;
  NamedAttribute *v148;
  NamedAttribute *v149;
  NamedAttribute *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  char *v155;
  NamedAttribute *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NamedAttribute *v160;
  NamedAttribute *v161;
  NamedAttribute *v162;
  NamedAttribute *v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  char *v168;
  NamedAttribute *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  NamedAttribute *v173;
  NamedAttribute *v174;
  NamedAttribute *v175;
  NamedAttribute *v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char *v181;
  NamedAttribute *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  NamedAttribute *v186;
  NamedAttribute *v187;
  NamedAttribute *v188;
  NamedAttribute *v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  unint64_t v193;
  char *v194;
  NamedAttribute *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  NamedAttribute *v199;
  NamedAttribute *v200;
  NamedAttribute *v201;
  NamedAttribute *v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  char *v207;
  NamedAttribute *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  NamedAttribute *v212;
  NamedAttribute *v213;
  NamedAttribute *v214;
  NamedAttribute *v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  char *v220;
  NamedAttribute *v221;
  uint64_t v222;
  const char *v223;
  char v224;
  uint64_t v225;
  NamedAttribute *v226;
  NamedAttribute *v227;
  NamedAttribute *v228;
  NamedAttribute *v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  unint64_t v233;
  char *v234;
  NamedAttribute *v235;
  vector<mlir::NamedAttribute, std::allocator<mlir::NamedAttribute>> *result;
  _OWORD v237[2];
  __int16 v238;
  __int128 v239;
  _QWORD v240[4];
  __int16 v241;

  v8 = a5;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v240[0] = "mps.compilerOptions";
  v241 = 259;
  v9 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v10 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v11 = mlir::IntegerAttr::get(v10, self->_compilerOptions);
  mlir::NamedAttribute::NamedAttribute(v237, v9, v11);
  var1 = retstr->var1;
  var0 = retstr->var2.var0;
  if (var1 >= var0)
  {
    v15 = retstr->var0;
    v16 = (var1 - retstr->var0) >> 4;
    v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v18 = var0 - v15;
    if (v18 >> 3 > v17)
      v17 = v18 >> 3;
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
      v19 = 0xFFFFFFFFFFFFFFFLL;
    else
      v19 = v17;
    if (v19)
    {
      if (v19 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v20 = (char *)operator new(16 * v19);
    }
    else
    {
      v20 = 0;
    }
    v21 = (NamedAttribute *)&v20[16 * v16];
    *(_OWORD *)v21 = v237[0];
    v14 = (NamedAttribute *)((char *)v21 + 16);
    if (var1 != v15)
    {
      do
      {
        *((_OWORD *)v21 - 1) = *((_OWORD *)var1 - 1);
        v21 = (NamedAttribute *)((char *)v21 - 16);
        var1 = (NamedAttribute *)((char *)var1 - 16);
      }
      while (var1 != v15);
      var1 = retstr->var0;
    }
    retstr->var0 = v21;
    retstr->var1 = v14;
    retstr->var2.var0 = (NamedAttribute *)&v20[16 * v19];
    if (var1)
      operator delete(var1);
  }
  else
  {
    *(_OWORD *)var1 = v237[0];
    v14 = (NamedAttribute *)((char *)var1 + 16);
  }
  retstr->var1 = v14;
  v240[0] = "mps.aneCompilerSpatialSplitting";
  v241 = 259;
  v22 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v23 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v24 = mlir::IntegerAttr::get(v23, self->_aneCompilerSpatialSplitting);
  mlir::NamedAttribute::NamedAttribute(v237, v22, v24);
  v26 = retstr->var1;
  v25 = retstr->var2.var0;
  if (v26 >= v25)
  {
    v28 = retstr->var0;
    v29 = (v26 - retstr->var0) >> 4;
    v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v31 = v25 - v28;
    if (v31 >> 3 > v30)
      v30 = v31 >> 3;
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
      v32 = 0xFFFFFFFFFFFFFFFLL;
    else
      v32 = v30;
    if (v32)
    {
      if (v32 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v33 = (char *)operator new(16 * v32);
    }
    else
    {
      v33 = 0;
    }
    v34 = (NamedAttribute *)&v33[16 * v29];
    *(_OWORD *)v34 = v237[0];
    v27 = (NamedAttribute *)((char *)v34 + 16);
    if (v26 != v28)
    {
      do
      {
        *((_OWORD *)v34 - 1) = *((_OWORD *)v26 - 1);
        v34 = (NamedAttribute *)((char *)v34 - 16);
        v26 = (NamedAttribute *)((char *)v26 - 16);
      }
      while (v26 != v28);
      v26 = retstr->var0;
    }
    retstr->var0 = v34;
    retstr->var1 = v27;
    retstr->var2.var0 = (NamedAttribute *)&v33[16 * v32];
    if (v26)
      operator delete(v26);
  }
  else
  {
    *(_OWORD *)v26 = v237[0];
    v27 = (NamedAttribute *)((char *)v26 + 16);
  }
  retstr->var1 = v27;
  v240[0] = "mps.optimizationLevel";
  v241 = 259;
  v35 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v36 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v37 = mlir::IntegerAttr::get(v36, self->_optimizationLevel);
  mlir::NamedAttribute::NamedAttribute(v237, v35, v37);
  v39 = retstr->var1;
  v38 = retstr->var2.var0;
  if (v39 >= v38)
  {
    v41 = retstr->var0;
    v42 = (v39 - retstr->var0) >> 4;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v44 = v38 - v41;
    if (v44 >> 3 > v43)
      v43 = v44 >> 3;
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0)
      v45 = 0xFFFFFFFFFFFFFFFLL;
    else
      v45 = v43;
    if (v45)
    {
      if (v45 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v46 = (char *)operator new(16 * v45);
    }
    else
    {
      v46 = 0;
    }
    v47 = (NamedAttribute *)&v46[16 * v42];
    *(_OWORD *)v47 = v237[0];
    v40 = (NamedAttribute *)((char *)v47 + 16);
    if (v39 != v41)
    {
      do
      {
        *((_OWORD *)v47 - 1) = *((_OWORD *)v39 - 1);
        v47 = (NamedAttribute *)((char *)v47 - 16);
        v39 = (NamedAttribute *)((char *)v39 - 16);
      }
      while (v39 != v41);
      v39 = retstr->var0;
    }
    retstr->var0 = v47;
    retstr->var1 = v40;
    retstr->var2.var0 = (NamedAttribute *)&v46[16 * v45];
    if (v39)
      operator delete(v39);
  }
  else
  {
    *(_OWORD *)v39 = v237[0];
    v40 = (NamedAttribute *)((char *)v39 + 16);
  }
  retstr->var1 = v40;
  v240[0] = "mps.optimizationProfile";
  v241 = 259;
  v48 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v49 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v50 = mlir::IntegerAttr::get(v49, self->_optimizationProfile);
  mlir::NamedAttribute::NamedAttribute(v237, v48, v50);
  v52 = retstr->var1;
  v51 = retstr->var2.var0;
  if (v52 >= v51)
  {
    v54 = retstr->var0;
    v55 = (v52 - retstr->var0) >> 4;
    v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v57 = v51 - v54;
    if (v57 >> 3 > v56)
      v56 = v57 >> 3;
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0)
      v58 = 0xFFFFFFFFFFFFFFFLL;
    else
      v58 = v56;
    if (v58)
    {
      if (v58 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v59 = (char *)operator new(16 * v58);
    }
    else
    {
      v59 = 0;
    }
    v60 = (NamedAttribute *)&v59[16 * v55];
    *(_OWORD *)v60 = v237[0];
    v53 = (NamedAttribute *)((char *)v60 + 16);
    if (v52 != v54)
    {
      do
      {
        *((_OWORD *)v60 - 1) = *((_OWORD *)v52 - 1);
        v60 = (NamedAttribute *)((char *)v60 - 16);
        v52 = (NamedAttribute *)((char *)v52 - 16);
      }
      while (v52 != v54);
      v52 = retstr->var0;
    }
    retstr->var0 = v60;
    retstr->var1 = v53;
    retstr->var2.var0 = (NamedAttribute *)&v59[16 * v58];
    if (v52)
      operator delete(v52);
  }
  else
  {
    *(_OWORD *)v52 = v237[0];
    v53 = (NamedAttribute *)((char *)v52 + 16);
  }
  retstr->var1 = v53;
  v240[0] = "mps.allowedComputeDevices";
  v241 = 259;
  v61 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v62 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v63 = mlir::IntegerAttr::get(v62, self->_allowedComputeDevices);
  mlir::NamedAttribute::NamedAttribute(v237, v61, v63);
  v65 = retstr->var1;
  v64 = retstr->var2.var0;
  if (v65 >= v64)
  {
    v67 = retstr->var0;
    v68 = (v65 - retstr->var0) >> 4;
    v69 = v68 + 1;
    if ((unint64_t)(v68 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v70 = v64 - v67;
    if (v70 >> 3 > v69)
      v69 = v70 >> 3;
    if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF0)
      v71 = 0xFFFFFFFFFFFFFFFLL;
    else
      v71 = v69;
    if (v71)
    {
      if (v71 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v72 = (char *)operator new(16 * v71);
    }
    else
    {
      v72 = 0;
    }
    v73 = (NamedAttribute *)&v72[16 * v68];
    *(_OWORD *)v73 = v237[0];
    v66 = (NamedAttribute *)((char *)v73 + 16);
    if (v65 != v67)
    {
      do
      {
        *((_OWORD *)v73 - 1) = *((_OWORD *)v65 - 1);
        v73 = (NamedAttribute *)((char *)v73 - 16);
        v65 = (NamedAttribute *)((char *)v65 - 16);
      }
      while (v65 != v67);
      v65 = retstr->var0;
    }
    retstr->var0 = v73;
    retstr->var1 = v66;
    retstr->var2.var0 = (NamedAttribute *)&v72[16 * v71];
    if (v65)
      operator delete(v65);
  }
  else
  {
    *(_OWORD *)v65 = v237[0];
    v66 = (NamedAttribute *)((char *)v65 + 16);
  }
  retstr->var1 = v66;
  v240[0] = "mps.preferredDevice";
  v241 = 259;
  v74 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v75 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v76 = mlir::IntegerAttr::get(v75, self->_preferredDevice);
  mlir::NamedAttribute::NamedAttribute(v237, v74, v76);
  v78 = retstr->var1;
  v77 = retstr->var2.var0;
  if (v78 >= v77)
  {
    v80 = retstr->var0;
    v81 = (v78 - retstr->var0) >> 4;
    v82 = v81 + 1;
    if ((unint64_t)(v81 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v83 = v77 - v80;
    if (v83 >> 3 > v82)
      v82 = v83 >> 3;
    if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF0)
      v84 = 0xFFFFFFFFFFFFFFFLL;
    else
      v84 = v82;
    if (v84)
    {
      if (v84 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v85 = (char *)operator new(16 * v84);
    }
    else
    {
      v85 = 0;
    }
    v86 = (NamedAttribute *)&v85[16 * v81];
    *(_OWORD *)v86 = v237[0];
    v79 = (NamedAttribute *)((char *)v86 + 16);
    if (v78 != v80)
    {
      do
      {
        *((_OWORD *)v86 - 1) = *((_OWORD *)v78 - 1);
        v86 = (NamedAttribute *)((char *)v86 - 16);
        v78 = (NamedAttribute *)((char *)v78 - 16);
      }
      while (v78 != v80);
      v78 = retstr->var0;
    }
    retstr->var0 = v86;
    retstr->var1 = v79;
    retstr->var2.var0 = (NamedAttribute *)&v85[16 * v84];
    if (v78)
      operator delete(v78);
  }
  else
  {
    *(_OWORD *)v78 = v237[0];
    v79 = (NamedAttribute *)((char *)v78 + 16);
  }
  retstr->var1 = v79;
  v240[0] = "mps.sdkInfo";
  v241 = 259;
  v87 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v88 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  active_platform = dyld_get_active_platform();
  program_sdk_version = dyld_get_program_sdk_version();
  v91 = mlir::IntegerAttr::get(v88, program_sdk_version | (unint64_t)(active_platform << 32));
  mlir::NamedAttribute::NamedAttribute(v237, v87, v91);
  v93 = retstr->var1;
  v92 = retstr->var2.var0;
  if (v93 >= v92)
  {
    v95 = retstr->var0;
    v96 = (v93 - retstr->var0) >> 4;
    v97 = v96 + 1;
    if ((unint64_t)(v96 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v98 = v92 - v95;
    if (v98 >> 3 > v97)
      v97 = v98 >> 3;
    if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0)
      v99 = 0xFFFFFFFFFFFFFFFLL;
    else
      v99 = v97;
    if (v99)
    {
      if (v99 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v100 = (char *)operator new(16 * v99);
    }
    else
    {
      v100 = 0;
    }
    v101 = (NamedAttribute *)&v100[16 * v96];
    *(_OWORD *)v101 = v237[0];
    v94 = (NamedAttribute *)((char *)v101 + 16);
    if (v93 != v95)
    {
      do
      {
        *((_OWORD *)v101 - 1) = *((_OWORD *)v93 - 1);
        v101 = (NamedAttribute *)((char *)v101 - 16);
        v93 = (NamedAttribute *)((char *)v93 - 16);
      }
      while (v93 != v95);
      v93 = retstr->var0;
    }
    retstr->var0 = v101;
    retstr->var1 = v94;
    retstr->var2.var0 = (NamedAttribute *)&v100[16 * v99];
    if (v93)
      operator delete(v93);
  }
  else
  {
    *(_OWORD *)v93 = v237[0];
    v94 = (NamedAttribute *)((char *)v93 + 16);
  }
  retstr->var1 = v94;
  if (v8)
  {
    v240[0] = "mps.device";
    v241 = 259;
    v102 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
    objc_msgSend(v8, "metalDevice");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "name");
    v104 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v105 = (_BYTE *)objc_msgSend(v104, "UTF8String");
    v238 = 257;
    if (*v105)
    {
      *(_QWORD *)&v237[0] = v105;
      v106 = 3;
    }
    else
    {
      v106 = 1;
    }
    LOBYTE(v238) = v106;
    v107 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v237);
    mlir::NamedAttribute::NamedAttribute(&v239, v102, v107);
    v109 = retstr->var1;
    v108 = retstr->var2.var0;
    if (v109 >= v108)
    {
      v111 = retstr->var0;
      v112 = (v109 - retstr->var0) >> 4;
      v113 = v112 + 1;
      if ((unint64_t)(v112 + 1) >> 60)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v114 = v108 - v111;
      if (v114 >> 3 > v113)
        v113 = v114 >> 3;
      if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF0)
        v115 = 0xFFFFFFFFFFFFFFFLL;
      else
        v115 = v113;
      if (v115)
      {
        if (v115 >> 60)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v116 = (char *)operator new(16 * v115);
      }
      else
      {
        v116 = 0;
      }
      v117 = (NamedAttribute *)&v116[16 * v112];
      *(_OWORD *)v117 = v239;
      v110 = (NamedAttribute *)((char *)v117 + 16);
      if (v109 != v111)
      {
        do
        {
          *((_OWORD *)v117 - 1) = *((_OWORD *)v109 - 1);
          v117 = (NamedAttribute *)((char *)v117 - 16);
          v109 = (NamedAttribute *)((char *)v109 - 16);
        }
        while (v109 != v111);
        v109 = retstr->var0;
      }
      retstr->var0 = v117;
      retstr->var1 = v110;
      retstr->var2.var0 = (NamedAttribute *)&v116[16 * v115];
      if (v109)
        operator delete(v109);
    }
    else
    {
      *(_OWORD *)v109 = v239;
      v110 = (NamedAttribute *)((char *)v109 + 16);
    }
    retstr->var1 = v110;

    v240[0] = "mps.deviceType";
    v241 = 259;
    v118 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
    v119 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
    v120 = mlir::IntegerAttr::get(v119, objc_msgSend(v8, "type"));
    mlir::NamedAttribute::NamedAttribute(v237, v118, v120);
    v122 = retstr->var1;
    v121 = retstr->var2.var0;
    if (v122 >= v121)
    {
      v124 = retstr->var0;
      v125 = (v122 - retstr->var0) >> 4;
      v126 = v125 + 1;
      if ((unint64_t)(v125 + 1) >> 60)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v127 = v121 - v124;
      if (v127 >> 3 > v126)
        v126 = v127 >> 3;
      if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF0)
        v128 = 0xFFFFFFFFFFFFFFFLL;
      else
        v128 = v126;
      if (v128)
      {
        if (v128 >> 60)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v129 = (char *)operator new(16 * v128);
      }
      else
      {
        v129 = 0;
      }
      v130 = (NamedAttribute *)&v129[16 * v125];
      *(_OWORD *)v130 = v237[0];
      v123 = (NamedAttribute *)((char *)v130 + 16);
      if (v122 != v124)
      {
        do
        {
          *((_OWORD *)v130 - 1) = *((_OWORD *)v122 - 1);
          v130 = (NamedAttribute *)((char *)v130 - 16);
          v122 = (NamedAttribute *)((char *)v122 - 16);
        }
        while (v122 != v124);
        v122 = retstr->var0;
      }
      retstr->var0 = v130;
      retstr->var1 = v123;
      retstr->var2.var0 = (NamedAttribute *)&v129[16 * v128];
      if (v122)
        operator delete(v122);
    }
    else
    {
      *(_OWORD *)v122 = v237[0];
      v123 = (NamedAttribute *)((char *)v122 + 16);
    }
    retstr->var1 = v123;
  }
  v240[0] = "mps.enableANEFWToFWSignal";
  v241 = 259;
  v131 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v132 = mlir::IntegerType::get((uint64_t)a4, 1u, 0);
  v133 = mlir::IntegerAttr::get(v132, self->_enableANEFWToFWSignal);
  mlir::NamedAttribute::NamedAttribute(v237, v131, v133);
  v135 = retstr->var1;
  v134 = retstr->var2.var0;
  if (v135 >= v134)
  {
    v137 = retstr->var0;
    v138 = (v135 - retstr->var0) >> 4;
    v139 = v138 + 1;
    if ((unint64_t)(v138 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v140 = v134 - v137;
    if (v140 >> 3 > v139)
      v139 = v140 >> 3;
    if ((unint64_t)v140 >= 0x7FFFFFFFFFFFFFF0)
      v141 = 0xFFFFFFFFFFFFFFFLL;
    else
      v141 = v139;
    if (v141)
    {
      if (v141 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v142 = (char *)operator new(16 * v141);
    }
    else
    {
      v142 = 0;
    }
    v143 = (NamedAttribute *)&v142[16 * v138];
    *(_OWORD *)v143 = v237[0];
    v136 = (NamedAttribute *)((char *)v143 + 16);
    if (v135 != v137)
    {
      do
      {
        *((_OWORD *)v143 - 1) = *((_OWORD *)v135 - 1);
        v143 = (NamedAttribute *)((char *)v143 - 16);
        v135 = (NamedAttribute *)((char *)v135 - 16);
      }
      while (v135 != v137);
      v135 = retstr->var0;
    }
    retstr->var0 = v143;
    retstr->var1 = v136;
    retstr->var2.var0 = (NamedAttribute *)&v142[16 * v141];
    if (v135)
      operator delete(v135);
  }
  else
  {
    *(_OWORD *)v135 = v237[0];
    v136 = (NamedAttribute *)((char *)v135 + 16);
  }
  retstr->var1 = v136;
  v240[0] = "mps.enableANELateLatch";
  v241 = 259;
  v144 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v145 = mlir::IntegerType::get((uint64_t)a4, 1u, 0);
  v146 = mlir::IntegerAttr::get(v145, self->_enableANELateLatch);
  mlir::NamedAttribute::NamedAttribute(v237, v144, v146);
  v148 = retstr->var1;
  v147 = retstr->var2.var0;
  if (v148 >= v147)
  {
    v150 = retstr->var0;
    v151 = (v148 - retstr->var0) >> 4;
    v152 = v151 + 1;
    if ((unint64_t)(v151 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v153 = v147 - v150;
    if (v153 >> 3 > v152)
      v152 = v153 >> 3;
    if ((unint64_t)v153 >= 0x7FFFFFFFFFFFFFF0)
      v154 = 0xFFFFFFFFFFFFFFFLL;
    else
      v154 = v152;
    if (v154)
    {
      if (v154 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v155 = (char *)operator new(16 * v154);
    }
    else
    {
      v155 = 0;
    }
    v156 = (NamedAttribute *)&v155[16 * v151];
    *(_OWORD *)v156 = v237[0];
    v149 = (NamedAttribute *)((char *)v156 + 16);
    if (v148 != v150)
    {
      do
      {
        *((_OWORD *)v156 - 1) = *((_OWORD *)v148 - 1);
        v156 = (NamedAttribute *)((char *)v156 - 16);
        v148 = (NamedAttribute *)((char *)v148 - 16);
      }
      while (v148 != v150);
      v148 = retstr->var0;
    }
    retstr->var0 = v156;
    retstr->var1 = v149;
    retstr->var2.var0 = (NamedAttribute *)&v155[16 * v154];
    if (v148)
      operator delete(v148);
  }
  else
  {
    *(_OWORD *)v148 = v237[0];
    v149 = (NamedAttribute *)((char *)v148 + 16);
  }
  retstr->var1 = v149;
  v240[0] = "mps.enableParallelEncode";
  v241 = 259;
  v157 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v158 = mlir::IntegerType::get((uint64_t)a4, 1u, 0);
  v159 = mlir::IntegerAttr::get(v158, self->_enableParallelEncode);
  mlir::NamedAttribute::NamedAttribute(v237, v157, v159);
  v161 = retstr->var1;
  v160 = retstr->var2.var0;
  if (v161 >= v160)
  {
    v163 = retstr->var0;
    v164 = (v161 - retstr->var0) >> 4;
    v165 = v164 + 1;
    if ((unint64_t)(v164 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v166 = v160 - v163;
    if (v166 >> 3 > v165)
      v165 = v166 >> 3;
    if ((unint64_t)v166 >= 0x7FFFFFFFFFFFFFF0)
      v167 = 0xFFFFFFFFFFFFFFFLL;
    else
      v167 = v165;
    if (v167)
    {
      if (v167 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v168 = (char *)operator new(16 * v167);
    }
    else
    {
      v168 = 0;
    }
    v169 = (NamedAttribute *)&v168[16 * v164];
    *(_OWORD *)v169 = v237[0];
    v162 = (NamedAttribute *)((char *)v169 + 16);
    if (v161 != v163)
    {
      do
      {
        *((_OWORD *)v169 - 1) = *((_OWORD *)v161 - 1);
        v169 = (NamedAttribute *)((char *)v169 - 16);
        v161 = (NamedAttribute *)((char *)v161 - 16);
      }
      while (v161 != v163);
      v161 = retstr->var0;
    }
    retstr->var0 = v169;
    retstr->var1 = v162;
    retstr->var2.var0 = (NamedAttribute *)&v168[16 * v167];
    if (v161)
      operator delete(v161);
  }
  else
  {
    *(_OWORD *)v161 = v237[0];
    v162 = (NamedAttribute *)((char *)v161 + 16);
  }
  retstr->var1 = v162;
  v240[0] = "mps.maximumNumberOfParallelEncodingRegions";
  v241 = 259;
  v170 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v171 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v172 = mlir::IntegerAttr::get(v171, self->_maximumNumberOfParallelEncodingRegions);
  mlir::NamedAttribute::NamedAttribute(v237, v170, v172);
  v174 = retstr->var1;
  v173 = retstr->var2.var0;
  if (v174 >= v173)
  {
    v176 = retstr->var0;
    v177 = (v174 - retstr->var0) >> 4;
    v178 = v177 + 1;
    if ((unint64_t)(v177 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v179 = v173 - v176;
    if (v179 >> 3 > v178)
      v178 = v179 >> 3;
    if ((unint64_t)v179 >= 0x7FFFFFFFFFFFFFF0)
      v180 = 0xFFFFFFFFFFFFFFFLL;
    else
      v180 = v178;
    if (v180)
    {
      if (v180 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v181 = (char *)operator new(16 * v180);
    }
    else
    {
      v181 = 0;
    }
    v182 = (NamedAttribute *)&v181[16 * v177];
    *(_OWORD *)v182 = v237[0];
    v175 = (NamedAttribute *)((char *)v182 + 16);
    if (v174 != v176)
    {
      do
      {
        *((_OWORD *)v182 - 1) = *((_OWORD *)v174 - 1);
        v182 = (NamedAttribute *)((char *)v182 - 16);
        v174 = (NamedAttribute *)((char *)v174 - 16);
      }
      while (v174 != v176);
      v174 = retstr->var0;
    }
    retstr->var0 = v182;
    retstr->var1 = v175;
    retstr->var2.var0 = (NamedAttribute *)&v181[16 * v180];
    if (v174)
      operator delete(v174);
  }
  else
  {
    *(_OWORD *)v174 = v237[0];
    v175 = (NamedAttribute *)((char *)v174 + 16);
  }
  retstr->var1 = v175;
  v240[0] = "mps.minimumNumberOfOpsInParallelRegion";
  v241 = 259;
  v183 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v184 = mlir::IntegerType::get((uint64_t)a4, 0x40u, 2u);
  v185 = mlir::IntegerAttr::get(v184, self->_minimumNumberOfOpsInParallelRegion);
  mlir::NamedAttribute::NamedAttribute(v237, v183, v185);
  v187 = retstr->var1;
  v186 = retstr->var2.var0;
  if (v187 >= v186)
  {
    v189 = retstr->var0;
    v190 = (v187 - retstr->var0) >> 4;
    v191 = v190 + 1;
    if ((unint64_t)(v190 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v192 = v186 - v189;
    if (v192 >> 3 > v191)
      v191 = v192 >> 3;
    if ((unint64_t)v192 >= 0x7FFFFFFFFFFFFFF0)
      v193 = 0xFFFFFFFFFFFFFFFLL;
    else
      v193 = v191;
    if (v193)
    {
      if (v193 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v194 = (char *)operator new(16 * v193);
    }
    else
    {
      v194 = 0;
    }
    v195 = (NamedAttribute *)&v194[16 * v190];
    *(_OWORD *)v195 = v237[0];
    v188 = (NamedAttribute *)((char *)v195 + 16);
    if (v187 != v189)
    {
      do
      {
        *((_OWORD *)v195 - 1) = *((_OWORD *)v187 - 1);
        v195 = (NamedAttribute *)((char *)v195 - 16);
        v187 = (NamedAttribute *)((char *)v187 - 16);
      }
      while (v187 != v189);
      v187 = retstr->var0;
    }
    retstr->var0 = v195;
    retstr->var1 = v188;
    retstr->var2.var0 = (NamedAttribute *)&v194[16 * v193];
    if (v187)
      operator delete(v187);
  }
  else
  {
    *(_OWORD *)v187 = v237[0];
    v188 = (NamedAttribute *)((char *)v187 + 16);
  }
  retstr->var1 = v188;
  v240[0] = "mps.enableMLIRDiagnostics";
  v241 = 259;
  v196 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v197 = mlir::IntegerType::get((uint64_t)a4, 1u, 0);
  v198 = mlir::IntegerAttr::get(v197, self->_enableMLIRDiagnostics);
  mlir::NamedAttribute::NamedAttribute(v237, v196, v198);
  v200 = retstr->var1;
  v199 = retstr->var2.var0;
  if (v200 >= v199)
  {
    v202 = retstr->var0;
    v203 = (v200 - retstr->var0) >> 4;
    v204 = v203 + 1;
    if ((unint64_t)(v203 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v205 = v199 - v202;
    if (v205 >> 3 > v204)
      v204 = v205 >> 3;
    if ((unint64_t)v205 >= 0x7FFFFFFFFFFFFFF0)
      v206 = 0xFFFFFFFFFFFFFFFLL;
    else
      v206 = v204;
    if (v206)
    {
      if (v206 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v207 = (char *)operator new(16 * v206);
    }
    else
    {
      v207 = 0;
    }
    v208 = (NamedAttribute *)&v207[16 * v203];
    *(_OWORD *)v208 = v237[0];
    v201 = (NamedAttribute *)((char *)v208 + 16);
    if (v200 != v202)
    {
      do
      {
        *((_OWORD *)v208 - 1) = *((_OWORD *)v200 - 1);
        v208 = (NamedAttribute *)((char *)v208 - 16);
        v200 = (NamedAttribute *)((char *)v200 - 16);
      }
      while (v200 != v202);
      v200 = retstr->var0;
    }
    retstr->var0 = v208;
    retstr->var1 = v201;
    retstr->var2.var0 = (NamedAttribute *)&v207[16 * v206];
    if (v200)
      operator delete(v200);
  }
  else
  {
    *(_OWORD *)v200 = v237[0];
    v201 = (NamedAttribute *)((char *)v200 + 16);
  }
  retstr->var1 = v201;
  v240[0] = "mps.enableShapeEquivalence";
  v241 = 259;
  v209 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
  v210 = mlir::IntegerType::get((uint64_t)a4, 1u, 0);
  v211 = mlir::IntegerAttr::get(v210, self->_enableShapeEquivalence);
  mlir::NamedAttribute::NamedAttribute(v237, v209, v211);
  v213 = retstr->var1;
  v212 = retstr->var2.var0;
  if (v213 >= v212)
  {
    v215 = retstr->var0;
    v216 = (v213 - retstr->var0) >> 4;
    v217 = v216 + 1;
    if ((unint64_t)(v216 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v218 = v212 - v215;
    if (v218 >> 3 > v217)
      v217 = v218 >> 3;
    if ((unint64_t)v218 >= 0x7FFFFFFFFFFFFFF0)
      v219 = 0xFFFFFFFFFFFFFFFLL;
    else
      v219 = v217;
    if (v219)
    {
      if (v219 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v220 = (char *)operator new(16 * v219);
    }
    else
    {
      v220 = 0;
    }
    v221 = (NamedAttribute *)&v220[16 * v216];
    *(_OWORD *)v221 = v237[0];
    v214 = (NamedAttribute *)((char *)v221 + 16);
    if (v213 != v215)
    {
      do
      {
        *((_OWORD *)v221 - 1) = *((_OWORD *)v213 - 1);
        v221 = (NamedAttribute *)((char *)v221 - 16);
        v213 = (NamedAttribute *)((char *)v213 - 16);
      }
      while (v213 != v215);
      v213 = retstr->var0;
    }
    retstr->var0 = v221;
    retstr->var1 = v214;
    retstr->var2.var0 = (NamedAttribute *)&v220[16 * v219];
    if (v213)
      operator delete(v213);
  }
  else
  {
    *(_OWORD *)v213 = v237[0];
    v214 = (NamedAttribute *)((char *)v213 + 16);
  }
  retstr->var1 = v214;
  if (self->_entryFunctionName)
  {
    v240[0] = "mps.entryFunctionName";
    v241 = 259;
    v222 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v240);
    v223 = -[NSString UTF8String](self->_entryFunctionName, "UTF8String");
    v224 = 1;
    HIBYTE(v238) = 1;
    if (*v223)
    {
      *(_QWORD *)&v237[0] = v223;
      v224 = 3;
    }
    LOBYTE(v238) = v224;
    v225 = mlir::StringAttr::get((mlir::StringAttr *)a4, (mlir::MLIRContext *)v237);
    mlir::NamedAttribute::NamedAttribute(&v239, v222, v225);
    v227 = retstr->var1;
    v226 = retstr->var2.var0;
    if (v227 >= v226)
    {
      v229 = retstr->var0;
      v230 = (v227 - retstr->var0) >> 4;
      v231 = v230 + 1;
      if ((unint64_t)(v230 + 1) >> 60)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v232 = v226 - v229;
      if (v232 >> 3 > v231)
        v231 = v232 >> 3;
      if ((unint64_t)v232 >= 0x7FFFFFFFFFFFFFF0)
        v233 = 0xFFFFFFFFFFFFFFFLL;
      else
        v233 = v231;
      if (v233)
      {
        if (v233 >> 60)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v234 = (char *)operator new(16 * v233);
      }
      else
      {
        v234 = 0;
      }
      v235 = (NamedAttribute *)&v234[16 * v230];
      *(_OWORD *)v235 = v239;
      v228 = (NamedAttribute *)((char *)v235 + 16);
      if (v227 != v229)
      {
        do
        {
          *((_OWORD *)v235 - 1) = *((_OWORD *)v227 - 1);
          v235 = (NamedAttribute *)((char *)v235 - 16);
          v227 = (NamedAttribute *)((char *)v227 - 16);
        }
        while (v227 != v229);
        v227 = retstr->var0;
      }
      retstr->var0 = v235;
      retstr->var1 = v228;
      retstr->var2.var0 = (NamedAttribute *)&v234[16 * v233];
      if (v227)
        operator delete(v227);
    }
    else
    {
      *(_OWORD *)v227 = v239;
      v228 = (NamedAttribute *)((char *)v227 + 16);
    }
    retstr->var1 = v228;
  }

  return result;
}

- (void)disableTypeInference
{
  self->_compilerOptions &= ~1uLL;
}

- (void)enableGPUQuantOps
{
  self->_compilerOptions |= 0x400uLL;
}

- (void)disableGPUQuantOps
{
  self->_compilerOptions &= ~0x400uLL;
}

- (void)enableDevicePlacement
{
  self->_compilerOptions |= 0x80uLL;
}

- (void)setOptimizationLevel:(MPSGraphOptimization)optimizationLevel
{
  unint64_t v3;

  self->_optimizationLevel = optimizationLevel;
  if (optimizationLevel == MPSGraphOptimizationLevel1)
  {
    v3 = self->_compilerOptions | 0x80;
  }
  else
  {
    if (optimizationLevel)
      return;
    v3 = self->_compilerOptions & 0xFFFFFFFFFFFFFF7FLL;
  }
  self->_compilerOptions = v3;
}

- (void)setEnableParallelEncode:(BOOL)a3
{
  uint64_t v3;

  self->_enableParallelEncode = a3;
  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_compilerOptions = self->_compilerOptions & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (void)setEnableMLIRDiagnostics:(BOOL)a3
{
  uint64_t v3;

  self->_enableMLIRDiagnostics = a3;
  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_compilerOptions = self->_compilerOptions & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (void)setEnableShapeEquivalence:(BOOL)a3
{
  uint64_t v3;

  self->_enableShapeEquivalence = a3;
  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_compilerOptions = self->_compilerOptions & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (void)setOptimizationProfile:(MPSGraphOptimizationProfile)optimizationProfile
{
  self->_optimizationProfile = optimizationProfile;
  if (optimizationProfile == MPSGraphOptimizationProfilePowerEfficiency)
  {
    self->_preferredDevice = 2;
    self->_allowedComputeDevices |= 2uLL;
  }
  else if (optimizationProfile == MPSGraphOptimizationProfilePerformance)
  {
    self->_preferredDevice = 0;
  }
}

- (void)setAllowedComputeDevices:(unint64_t)a3
{
  unint64_t v3;

  switch(a3)
  {
    case 0uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_3;
      return;
    case 1uLL:
      v3 = 1;
      goto LABEL_12;
    case 2uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_3;
      return;
    case 3uLL:
      v3 = 3;
      goto LABEL_12;
    case 4uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_3;
      return;
    case 5uLL:
      v3 = 5;
      goto LABEL_12;
    case 6uLL:
      if (MTLReportFailureTypeEnabled())
LABEL_3:
        MTLReportFailure();
      break;
    case 7uLL:
      v3 = 7;
LABEL_12:
      self->_allowedComputeDevices = v3;
      break;
    default:
      return;
  }
}

- (void)setPreferredDevice:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      self->_preferredDevice = 0;
      break;
    case 1uLL:
      self->_preferredDevice = 1;
      break;
    case 2uLL:
      self->_preferredDevice = 2;
      break;
    case 3uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_6;
      break;
    case 4uLL:
      self->_preferredDevice = 4;
      break;
    case 5uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_6;
      break;
    case 6uLL:
      if (MTLReportFailureTypeEnabled())
        goto LABEL_6;
      break;
    case 7uLL:
      if (MTLReportFailureTypeEnabled())
LABEL_6:
        MTLReportFailure();
      break;
    default:
      return;
  }
}

- (MPSGraphOptimization)optimizationLevel
{
  return self->_optimizationLevel;
}

- (BOOL)waitForCompilationCompletion
{
  return self->_waitForCompilationCompletion;
}

- (void)setWaitForCompilationCompletion:(BOOL)waitForCompilationCompletion
{
  self->_waitForCompilationCompletion = waitForCompilationCompletion;
}

- (MPSGraphCompilationCompletionHandler)compilationCompletionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompilationCompletionHandler:(MPSGraphCompilationCompletionHandler)compilationCompletionHandler
{
  objc_setProperty_atomic_copy(self, a2, compilationCompletionHandler, 24);
}

- (dispatch_queue_t)dispatchQueue
{
  return (dispatch_queue_t)objc_getProperty(self, a2, 32, 1);
}

- (void)setDispatchQueue:(dispatch_queue_t)dispatchQueue
{
  objc_setProperty_atomic(self, a2, dispatchQueue, 32);
}

- (MPSGraphOptimizationProfile)optimizationProfile
{
  return self->_optimizationProfile;
}

- (NSDictionary)callables
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCallables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)compilerOptions
{
  return self->_compilerOptions;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  self->_compilerOptions = a3;
}

- (unint64_t)aneCompilerSpatialSplitting
{
  return self->_aneCompilerSpatialSplitting;
}

- (void)setAneCompilerSpatialSplitting:(unint64_t)a3
{
  self->_aneCompilerSpatialSplitting = a3;
}

- (BOOL)enableANEFWToFWSignal
{
  return self->_enableANEFWToFWSignal;
}

- (void)setEnableANEFWToFWSignal:(BOOL)a3
{
  self->_enableANEFWToFWSignal = a3;
}

- (BOOL)enableANELateLatch
{
  return self->_enableANELateLatch;
}

- (void)setEnableANELateLatch:(BOOL)a3
{
  self->_enableANELateLatch = a3;
}

- (BOOL)printANEPlacementAnalysis
{
  return self->_printANEPlacementAnalysis;
}

- (void)setPrintANEPlacementAnalysis:(BOOL)a3
{
  self->_printANEPlacementAnalysis = a3;
}

- (unint64_t)preferredDevice
{
  return self->_preferredDevice;
}

- (unint64_t)allowedComputeDevices
{
  return self->_allowedComputeDevices;
}

- (NSString)entryFunctionName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEntryFunctionName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (MPSGraphExecutableConstantData)constantData
{
  return (MPSGraphExecutableConstantData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConstantData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)enableParallelEncode
{
  return self->_enableParallelEncode;
}

- (unint64_t)maximumNumberOfParallelEncodingRegions
{
  return self->_maximumNumberOfParallelEncodingRegions;
}

- (void)setMaximumNumberOfParallelEncodingRegions:(unint64_t)a3
{
  self->_maximumNumberOfParallelEncodingRegions = a3;
}

- (unint64_t)minimumNumberOfOpsInParallelRegion
{
  return self->_minimumNumberOfOpsInParallelRegion;
}

- (void)setMinimumNumberOfOpsInParallelRegion:(unint64_t)a3
{
  self->_minimumNumberOfOpsInParallelRegion = a3;
}

- (BOOL)enableMLIRDiagnostics
{
  return self->_enableMLIRDiagnostics;
}

- (BOOL)enableShapeEquivalence
{
  return self->_enableShapeEquivalence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constantData, 0);
  objc_storeStrong((id *)&self->_entryFunctionName, 0);
  objc_storeStrong((id *)&self->_callables, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_compilationCompletionHandler, 0);
}

@end
