@implementation MPSGraphExecutable

- (void)initializeMLIR
{
  char *v2;
  void *v3;
  mlir::MLIRContextImpl **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;

  v2 = (char *)self + 16;
  if (!*((_QWORD *)self + 2))
  {
    v3 = operator new(0x20uLL);
    *((_QWORD *)v3 + 2) = 0;
    *(_QWORD *)v3 = &unk_1E0E51DD8;
    *((_QWORD *)v3 + 1) = 0;
    v4 = mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v3 + 3, 0);
    v5 = (std::__shared_weak_count *)*((_QWORD *)v2 + 1);
    *(_QWORD *)v2 = v4;
    *((_QWORD *)v2 + 1) = v3;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  loadCommonMPSDialectsInContext(*(mlir::MLIRContext **)v2);
  if (mpsgraph_mlir_onceToken != -1)
    dispatch_once(&mpsgraph_mlir_onceToken, &__block_literal_global_7);
}

void __36__MPSGraphExecutable_initializeMLIR__block_invoke(mlir *a1)
{
  mlir::registerAsmPrinterCLOptions(a1);
  ParseEnvironmentOptions("main", "MPSGRAPH_MLIR_CL", ");
}

- (void)commonPreInitWithDescriptor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  dispatch_queue_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char v48;
  _QWORD block[5];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd_HH_mm_ss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)self + 67);
  *((_QWORD *)self + 67) = v7;

  *((_QWORD *)self + 66) = arc4random();
  *((_QWORD *)self + 68) = 0;
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 79) = -2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)self + 74);
  *((_QWORD *)self + 74) = v9;

  *((_QWORD *)self + 70) = 0;
  objc_msgSend(v4, "compilationDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(v4, "compilationDescriptor"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "dispatchQueue"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v11,
        v13))
  {
    objc_msgSend(v4, "compilationDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)self + 46);
    *((_QWORD *)self + 46) = v15;

    if (!v4)
    {
LABEL_4:
      v17 = objc_opt_new();
      v18 = (void *)*((_QWORD *)self + 17);
      *((_QWORD *)self + 17) = v17;
      goto LABEL_8;
    }
  }
  else
  {
    v19 = dispatch_queue_create("MPSGraphExecutable_queue", 0);
    v20 = (void *)*((_QWORD *)self + 46);
    *((_QWORD *)self + 46) = v19;

    if (!v4)
      goto LABEL_4;
  }
  objc_msgSend(v4, "compilationDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
    __assert_rtn("-[MPSGraphExecutable commonPreInitWithDescriptor:]", "MPSGraphExecutable.mm", 603, "executableDescriptor.compilationDescriptor");

  objc_msgSend(v4, "compilationDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "copy");
  v23 = (void *)*((_QWORD *)self + 17);
  *((_QWORD *)self + 17) = v22;

LABEL_8:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MPSGraphExecutable_commonPreInitWithDescriptor___block_invoke;
  block[3] = &unk_1E0E76F10;
  block[4] = self;
  if (-[MPSGraphExecutable commonPreInitWithDescriptor:]::onceToken == -1)
  {
    if (!evOptions)
      goto LABEL_11;
    goto LABEL_10;
  }
  dispatch_once(&-[MPSGraphExecutable commonPreInitWithDescriptor:]::onceToken, block);
  if (evOptions)
LABEL_10:
    *((_QWORD *)self + 81) |= 2uLL;
LABEL_11:
  overrideCompilationDescriptorWithEV(*((MPSGraphCompilationDescriptor **)self + 17));
  *((_QWORD *)self + 69) = qword_1EDC0A160;
  objc_storeStrong((id *)self + 71, (id)qword_1EDC0A168);
  objc_storeStrong((id *)self + 73, (id)qword_1EDC0A170);
  *((_BYTE *)self + 600) = byte_1EDC0A178;
  if (byte_1EDC0A18D)
    v24 = byte_1EDC0A18C;
  else
    v24 = objc_msgSend(*((id *)self + 17), "compilerOptions") & 0x80;
  *((_BYTE *)self + 605) = v24 != 0;
  *((_BYTE *)self + 606) = byte_1EDC0A18E;
  *((_BYTE *)self + 607) = byte_1EDC0A18F;
  *((_QWORD *)self + 78) = dword_1EDC0A194;
  *((_BYTE *)self + 608) = byte_1EDC0A190;
  if (byte_1EDC0A19C)
    v25 = 1;
  else
    v25 = objc_msgSend(*((id *)self + 17), "printANEPlacementAnalysis");
  *((_BYTE *)self + 609) = v25;
  *((_BYTE *)self + 610) = byte_1EDC0A1B0;
  *((_BYTE *)self + 611) = byte_1EDC0A1B1;
  *((_BYTE *)self + 612) = byte_1EDC0A1B3;
  *((_BYTE *)self + 613) = byte_1EDC0A1B4;
  *((_BYTE *)self + 614) = byte_1EDC0A1B5;
  if (HIBYTE(word_1EDC0A159) && !(_BYTE)word_1EDC0A159 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (byte_1EDC0A179 && !(_BYTE)word_1EDC0A159 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (byte_1EDC0A188 && !(_BYTE)word_1EDC0A159 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (byte_1EDC0A18A && !(_BYTE)word_1EDC0A159 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  NSTemporaryDirectory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
    v27 = (__CFString *)v26;
  else
    v27 = CFSTR("/tmp/");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@/mpsgraph-%d-%@-%lu"), v27, v29, getpid(), *((_QWORD *)self + 67), *((_QWORD *)self + 66));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)*((_QWORD *)self + 72);
  *((_QWORD *)self + 72) = v30;

  v48 = 0;
  if ((objc_msgSend(*((id *)self + 74), "fileExistsAtPath:isDirectory:", *((_QWORD *)self + 72), &v48) & 1) != 0)
  {
    if (!v48 && MTLReportFailureTypeEnabled())
    {
      v41 = *((_QWORD *)self + 72);
      objc_msgSend(0, "localizedFailureReason");
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v42 = objc_msgSend(v40, "cStringUsingEncoding:", 4);
      objc_msgSend(0, "localizedDescription");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v45 = v42;
      v46 = objc_msgSend(v43, "cStringUsingEncoding:", 4);
      v44 = v41;
      MTLReportFailure();

      v32 = 0;
      goto LABEL_33;
    }
    v32 = 0;
  }
  else
  {
    v33 = (void *)*((_QWORD *)self + 74);
    v34 = *((_QWORD *)self + 72);
    v47 = 0;
    v35 = objc_msgSend(v33, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v34, 1, 0, &v47);
    v36 = v47;
    v32 = v36;
    if ((v35 & 1) == 0)
    {
      objc_msgSend(v36, "localizedFailureReason");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v38 = objc_msgSend(v37, "cStringUsingEncoding:", 4);
      objc_msgSend(v32, "localizedDescription");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      NSLog(CFSTR("Error creating directory \n %s %s"), v38, objc_msgSend(v39, "cStringUsingEncoding:", 4));

      v40 = (id)*((_QWORD *)self + 72);
      *((_QWORD *)self + 72) = 0;
LABEL_33:

    }
  }
  -[MPSGraphExecutable initializeMLIR](self, "initializeMLIR", v44, v45, v46);

}

char *__50__MPSGraphExecutable_commonPreInitWithDescriptor___block_invoke(uint64_t a1)
{
  char *v2;
  int v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *result;

  if (getenv("MPSGRAPH_LOG_INFO"))
  {
    evOptions = 1;
    puts("MPSGRAPH_LOG_INFO EV is set.");
  }
  v2 = getenv("MPSGRAPH_COMPILER_STITCHING");
  if (v2)
  {
    word_1EDC0A159 = 257;
    v3 = atoi(v2);
    if (!v3)
      byte_1EDC0A15B = 1;
    printf("MPSGRAPH_COMPILER_STITCHING EV is set to %d.\n", v3);
  }
  v4 = getenv("MPSGRAPH_COMPILER_FILEBACKED");
  if (v4)
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A15D = 1;
    byte_1EDC0A15E = atoi(v4) != 0;
    puts("MPSGRAPH_COMPILER_FILEBACKED EV is set.");
  }
  v5 = getenv("MPSGRAPH_DISABLE_TYPE_INFERENCE");
  if (v5)
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A15C = atoi(v5) != 0;
    puts("MPSGRAPH_DISABLE_TYPE_INFERENCE EV is set.");
  }
  if (getenv("MPSGRAPH_USE_COMMON_CANONICALIZATION_PASS"))
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A19A = 1;
    puts("MPSGRAPH_USE_COMMON_CANONICALIZATION_PASS EV is set.");
  }
  if (getenv("MPSGRAPH_RUN_F32_TO_F16_PASS"))
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A19B = 1;
    puts("MPSGRAPH_RUN_F32_TO_F16_PASS EV is set.");
  }
  v6 = getenv("MPSGRAPH_ANE_SPATIAL_SPLITTING");
  if (v6)
  {
    byte_1EDC0A179 = 1;
    LOBYTE(word_1EDC0A159) = 1;
    qword_1EDC0A180 = atoll(v6);
    printf("MPSGRAPH_ANE_SPATIAL_SPLITTING EV is set to %llu.\n", qword_1EDC0A180);
  }
  if (getenv("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL"))
  {
    LOBYTE(word_1EDC0A159) = 1;
    *(_WORD *)&byte_1EDC0A188 = 257;
    puts("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL"))
  {
    LOBYTE(word_1EDC0A159) = 1;
    *(_WORD *)&byte_1EDC0A188 = 1;
    puts("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_ANE_LATE_LATCH"))
  {
    LOBYTE(word_1EDC0A159) = 1;
    *(_WORD *)&byte_1EDC0A18A = 257;
    puts("MPSGRAPH_ENABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_ANE_LATE_LATCH"))
  {
    LOBYTE(word_1EDC0A159) = 1;
    *(_WORD *)&byte_1EDC0A18A = 1;
    puts("MPSGRAPH_DISABLE_ANE_FW_TO_FW_SIGNAL EV is set.");
  }
  v7 = getenv("MPSGRAPH_DUMP_MODULE");
  if (v7)
  {
    qword_1EDC0A160 = atoll(v7);
    puts("MPSGRAPH_DUMP_MODULE EV is set.");
  }
  v8 = getenv("MPSGRAPH_DUMP_MODULE_FILE_PATH");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)qword_1EDC0A168;
    qword_1EDC0A168 = v10;

    printf("MPSGRAPH_DUMP_MODULE_FILE_PATH EV is set to %s.\n", v9);
  }
  v12 = getenv("MPSGRAPH_DUMP_COMPILED_PRODUCTS_PATH");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)qword_1EDC0A170;
    qword_1EDC0A170 = v14;

    printf("MPSGRAPH_DUMP_COMPILED_PRODUCTS_PATH EV is set to %s.\n", v13);
  }
  if (getenv("MPSGRAPH_DISABLE_CC"))
  {
    byte_1EDC0A178 = 0;
    puts("MPSGRAPH_DISABLE_CC EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PROFILING_OP_NAMES"))
  {
    byte_1EDC0A198 = 1;
    puts("MPSGRAPH_ENABLE_PROFILING_OP_NAMES EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_ENCODER_BREAKUP"))
  {
    byte_1EDC0A199 = 1;
    puts("MPSGRAPH_ENABLE_ENCODER_BREAKUP EV is set.");
  }
  v16 = getenv("MPSGRAPH_PLACEMENT_PASS");
  if (v16)
  {
    byte_1EDC0A18C = atoi(v16) != 0;
    byte_1EDC0A18D = 1;
    printf("MPSGRAPH_PLACEMENT_PASS EV is set to %d.\n", byte_1EDC0A18C);
  }
  v17 = getenv("MPSGRAPH_USE_COST_MODEL");
  if (v17)
  {
    byte_1EDC0A18E = atoi(v17) != 0;
    printf("MPSGRAPH_USE_COST_MODEL EV is set to %d.\n", byte_1EDC0A18E);
  }
  if (getenv("MPSGRAPH_USE_OLD_COST_MODEL_PASS"))
  {
    byte_1EDC0A18F = 1;
    puts("MPSGRAPH_USE_OLD_COST_MODEL_PASS EV is set.");
  }
  v18 = getenv("MPSGRAPH_FORCE_DEVICE_PLACEMENT");
  if (v18)
  {
    dword_1EDC0A194 = atoi(v18);
    printf("MPSGRAPH_FORCE_DEVICE_PLACEMENT EV is set to %d.\n", dword_1EDC0A194);
  }
  if (getenv("MPSGRAPH_PRINT_COST_MODEL"))
  {
    byte_1EDC0A190 = 1;
    puts("MPSGRAPH_PRINT_COST_MODEL EV is set.");
  }
  if (getenv("MPSGRAPH_PRINT_ANE_PLACEMENT_ANALYSIS"))
  {
    byte_1EDC0A19C = 1;
    LOBYTE(word_1EDC0A159) = 1;
    puts("MPSGRAPH_PRINT_ANE_PLACEMENT_ANALYSIS EV is set.");
  }
  v19 = getenv("MPSGRAPH_ANE_LIVEIO_LIMIT");
  if (v19)
  {
    *(_QWORD *)&xmmword_1EDC0A1A0 = atoi(v19);
    printf("MPSGRAPH_ANE_LIVEIO_LIMIT EV is set to %lu.\n", (_QWORD)xmmword_1EDC0A1A0);
  }
  v20 = getenv("MPSGRAPH_ANE_REGION_OP_LIMIT");
  if (v20)
  {
    *((_QWORD *)&xmmword_1EDC0A1A0 + 1) = atoi(v20);
    printf("MPSGRAPH_ANE_REGION_OP_LIMIT EV is set to %lu.\n", *((_QWORD *)&xmmword_1EDC0A1A0 + 1));
  }
  if (getenv("MPSGRAPH_LEGACY_ANE_QUANTIZATION"))
  {
    byte_1EDC0A1B0 = 1;
    puts("MPSGRAPH_LEGACY_ANE_QUANTIZATION EV is set.");
  }
  if (getenv("MPSGRAPH_KEEP_ANEC_UNIT_NAME_ATTRS"))
  {
    byte_1EDC0A1B1 = 1;
    puts("MPSGRAPH_KEEP_ANEC_UNIT_NAME_ATTRS EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_GPU_QUANT_OPS"))
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A1B2 = 1;
    puts("MPSGRAPH_DISABLE_GPU_QUANT_OPS EV is set.");
  }
  v21 = getenv("MPSGRAPH_SPECIALIZATION_COUNT_MAX");
  if (v21)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632) = atoi(v21);
    printf("MPSGRAPH_SPECIALIZATION_COUNT_MAX EV is set to %lu.\n", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 632));
  }
  if (getenv("MPSGRAPH_DISABLE_PRE_ENCODE_TI"))
  {
    byte_1EDC0A1B3 = 1;
    puts("MPSGRAPH_DISABLE_PRE_ENCODE_TI EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PRE_ENCODE_TI_READ_INPUTS"))
  {
    byte_1EDC0A1B4 = 1;
    puts("MPSGRAPH_ENABLE_PRE_ENCODE_TI_READ_INPUTS EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_RUNTIME_TI_VERIFIERS"))
  {
    byte_1EDC0A1B5 = 1;
    puts("MPSGRAPH_ENABLE_RUNTIME_TI_VERIFIERS EV is set.");
  }
  if (getenv("MPSGRAPH_DISABLE_SDPA_GQA"))
  {
    byte_1EDC0A1B6 = 0;
    puts("MPSGRAPH_DISABLE_SDPA_GQA EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_GPU_REGIONS"))
  {
    byte_1EDC0A1B7 = 1;
    puts("MPSGRAPH_ENABLE_GPU_REGIONS EV is set.");
  }
  if (getenv("MPSGRAPH_ENABLE_PARALLEL_ENCODE"))
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A1B8 = 1;
    puts("MPSGRAPH_ENABLE_PARALLEL_ENCODE EV is set.");
  }
  v22 = getenv("MPSGRAPH_MIN_NUM_OPS_PER_PARALLEL_REGION");
  if (v22)
  {
    byte_1EDC0A1B9 = 1;
    LOBYTE(word_1EDC0A159) = 1;
    qword_1EDC0A1C0 = atoi(v22);
    printf("MPSGRAPH_MIN_NUM_OPS_PER_PARALLEL_REGION EV is set to %llu.\n", qword_1EDC0A1C0);
  }
  v23 = getenv("MPSGRAPH_MAX_NUM_PARALLEL_REGIONS");
  if (v23)
  {
    byte_1EDC0A1C8 = 1;
    LOBYTE(word_1EDC0A159) = 1;
    qword_1EDC0A1D0 = atoi(v23);
    printf("MPSGRAPH_MAX_NUM_PARALLEL_REGIONS EV is set to %llu.\n", qword_1EDC0A1D0);
  }
  if (getenv("MPSGRAPH_ENABLE_MLIR_DIAGNOSTICS"))
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A1D8 = 1;
    puts("MPSGRAPH_ENABLE_MLIR_DIAGNOSTICS EV is set.");
  }
  result = getenv("MPSGRAPH_ENABLE_SHAPE_EQUIVALENCE");
  if (result)
  {
    word_1EDC0A159 = 257;
    byte_1EDC0A1D9 = atoi(result) != 0;
    return (char *)printf("MPSGRAPH_ENABLE_SHAPE_EQUIVALENCE EV is set to %d.\n", byte_1EDC0A1D9);
  }
  return result;
}

- (void)commonPostInit:(void *)a3
{
  LazyLoadableModuleRef *v3;
  mlir::MLIRContext *v4;
  unsigned int *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  mlir::GenericProgramPoint *v11;
  mlir::GenericProgramPoint *v12;
  mlir::GenericProgramPoint *v13;
  mlir::ForwardIterator *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  int v26;
  const char *v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  mlir *v40;
  MPSGraphExecutable *v41;
  _QWORD *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = self;
  v3 = (LazyLoadableModuleRef *)LazyLoadableModuleRef::operator=((uint64_t)self + 40, (uint64_t *)a3);
  v5 = (unsigned int *)LazyLoadableModuleRef::get(v3, v4);
  v40 = (mlir *)v5;
  v39 = (id)objc_opt_new();
  v38 = (id)objc_opt_new();
  v6 = v5[11];
  if ((v6 & 0x7FFFFF) != 0)
  {
    v7 = (unint64_t)&v5[4 * ((v6 >> 23) & 1) + 16] + ((v6 >> 21) & 0x7F8);
    if (v7 > 0xFFFFFFFFFFFFFFF8)
    {
      v25 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
      v26 = 191;
      v27 = "Alignment.h";
      v28 = "alignAddr";
    }
    else
    {
      v8 = (_QWORD *)(((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v5[10]);
      if ((_QWORD *)*v8 != v8)
      {
        v9 = v8[1];
        if (v9)
          v10 = v9 - 8;
        else
          v10 = 0;
        v37[0] = &v41;
        v37[1] = &v38;
        v37[2] = &v40;
        v37[3] = &v39;
        v11 = (mlir::GenericProgramPoint *)(v10 + 32);
        v12 = *(mlir::GenericProgramPoint **)(v10 + 40);
        if (v12 != (mlir::GenericProgramPoint *)(v10 + 32))
        {
          do
          {
            v13 = (mlir::GenericProgramPoint *)*((_QWORD *)v12 + 1);
            mlir::GenericProgramPoint::~GenericProgramPoint(v12);
            v42 = v37;
            mlir::detail::walk<mlir::ForwardIterator>(v14, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ37__MPSGraphExecutable_commonPostInit__E3__1NS1_3mps6CallOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v42, 1);
            v12 = v13;
          }
          while (v13 != v11);
        }
        v15 = (void *)objc_opt_new();
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v16 = v39;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v34;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("default"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19++));
            }
            while (v17 != v19);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          }
          while (v17);
        }

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v20 = v38;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v30;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v30 != v22)
                objc_enumerationMutation(v20);
              objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("dynamic"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23++), (_QWORD)v29);
            }
            while (v21 != v23);
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
          }
          while (v21);
        }

        v24 = (void *)*((_QWORD *)v41 + 18);
        *((_QWORD *)v41 + 18) = v15;

        mlir::verify(v40, (mlir::Operation *)1);
      }
      v25 = "!region.empty() && \"unexpected empty region\";
      v26 = 895;
      v27 = "OpDefinition.h";
      v28 = "getBody";
    }
  }
  else
  {
    v25 = "index < numRegions && \"invalid region index\";
    v26 = 666;
    v27 = "Operation.h";
    v28 = "getRegion";
  }
  __assert_rtn(v28, v27, v26, v25);
}

- (MPSGraphExecutable)initWithGraph:(id)a3 device:(id)a4 feeds:(id)a5 targetTensors:(id)a6 targetOperations:(id)a7 executableDescriptor:(id)a8
{
  char *v14;
  char *v15;
  id v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _QWORD *v25;
  mlir::MLIRContext *v26;
  char moduleURL;
  void *ptr;
  uint64_t v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  _QWORD *v34;
  _QWORD *i;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  unint64_t j;
  MPSGraphShapedType *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  MPSGraphShapedType *v52;
  mlir::MLIRContext *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  unint64_t *v57;
  unint64_t v58;
  void *v59;
  void *v60;
  char *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  mlir::MLIRContext **v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD *obj;
  void *v73;
  mlir::MLIRContext *v74[2];
  mlir::Operation *v75;
  _QWORD v76[4];
  id *v77;
  LazyLoadableModuleRef *v78;
  _BYTE v79[72];
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  std::__shared_weak_count *v86;
  objc_super v87;
  LazyLoadableModuleRef v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v68 = a4;
  v67 = a5;
  v69 = a6;
  v70 = a7;
  v71 = a8;
  v87.receiver = self;
  v87.super_class = (Class)MPSGraphExecutable;
  v14 = -[MPSGraphExecutable init](&v87, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_45;
  v16 = objc_storeWeak((id *)v14 + 1, obj);
  *((_QWORD *)v15 + 81) = objc_msgSend(obj, "options");

  v17 = obj[5];
  v85 = v17;
  v18 = (std::__shared_weak_count *)obj[6];
  v86 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    v22 = (std::__shared_weak_count *)*((_QWORD *)v15 + 3);
    *((_QWORD *)v15 + 2) = v17;
    *((_QWORD *)v15 + 3) = v18;
    v66 = (mlir::MLIRContext **)(v15 + 16);
    if (!v22)
      goto LABEL_13;
LABEL_9:
    v23 = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    goto LABEL_13;
  }
  v22 = (std::__shared_weak_count *)*((_QWORD *)v15 + 3);
  *((_QWORD *)v15 + 2) = v17;
  *((_QWORD *)v15 + 3) = 0;
  v66 = (mlir::MLIRContext **)(v15 + 16);
  if (v22)
    goto LABEL_9;
LABEL_13:
  objc_msgSend(v15, "commonPreInitWithDescriptor:", v71);
  v80 = 0x2B2B07DC2B2B07D8;
  v81 = obj;
  v82 = objc_msgSend(v71, "compilerOptions");
  v83 = 0;
  v84 = 0;
  kdebug_trace();
  v25 = (_QWORD *)operator new();
  *v25 = v85;
  v25[1] = 0;
  v25[2] = 0;
  v25[3] = 0;
  *((_QWORD *)v15 + 4) = v25;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v79);
  v26 = *v66;
  memset(&v88, 0, 32);
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)&v88._modelFileArchivePath.var0, (uint64_t)v79, (uint64_t)v26, (__int128 *)&v88);
  moduleURL = (char)v88._moduleURL;
  if (v88._moduleURL >= (NSURL *)8)
  {
    if (((uint64_t)v88._moduleURL & 4) != 0)
    {
      if (((uint64_t)v88._moduleURL & 2) != 0)
        ptr = &v88;
      else
        ptr = v88._ctx.__ptr_;
      (*(void (**)(void *))(((unint64_t)v88._moduleURL & 0xFFFFFFFFFFFFFFF8) + 16))(ptr);
    }
    if ((moduleURL & 2) == 0)
      llvm::deallocate_buffer((llvm *)v88._ctx.__ptr_, v88._ctx.__cntrl_);
  }
  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v67, 1);
  v30 = (void *)*((_QWORD *)v15 + 65);
  *((_QWORD *)v15 + 65) = v29;

  objc_msgSend(*((id *)v15 + 65), "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88._ctx.__ptr_ = 0;
  v88._ctx.__cntrl_ = (__shared_weak_count *)&v88;
  v88._originalModule.op.state = (Operation *)0x4812000000;
  v88._moduleURL = (NSURL *)__Block_byref_object_copy__4;
  v88._resourceLoader.__ptr_ = (ModuleResourcesLoader *)__Block_byref_object_dispose__4;
  v88._resourceLoader.__cntrl_ = (__shared_weak_count *)"";
  memset(&v88._needsPlistRestored, 0, 24);
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __101__MPSGraphExecutable_initWithGraph_device_feeds_targetTensors_targetOperations_executableDescriptor___block_invoke;
  v76[3] = &unk_1E0E76F88;
  v32 = obj;
  v77 = v32;
  v78 = &v88;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v76);
  std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  v33 = (void *)objc_opt_new();
  v34 = (_QWORD *)*((_QWORD *)v88._ctx.__cntrl_ + 6);
  for (i = (_QWORD *)*((_QWORD *)v88._ctx.__cntrl_ + 7); v34 != i; ++v34)
  {
    objc_msgSend(v32[2], "objectAtIndexedSubscript:", *v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v36);

  }
  v37 = (void *)*((_QWORD *)v15 + 64);
  *((_QWORD *)v15 + 64) = v33;

  _Block_object_dispose(&v88, 8);
  if (*(_QWORD *)&v88._needsPlistRestored)
  {
    v88._modelFileArchivePath.__r_.__value_.var0.__l.__data_ = *(char **)&v88._needsPlistRestored;
    operator delete(*(void **)&v88._needsPlistRestored);
  }

  v38 = objc_msgSend(v69, "copyWithZone:", 0);
  v39 = (void *)*((_QWORD *)v15 + 62);
  *((_QWORD *)v15 + 62) = v38;

  v40 = objc_msgSend(v70, "copyWithZone:", 0);
  v41 = (void *)*((_QWORD *)v15 + 63);
  *((_QWORD *)v15 + 63) = v40;

  v42 = operator new();
  *(_QWORD *)v42 = 0;
  *(_QWORD *)(v42 + 8) = 0;
  *(_QWORD *)(v42 + 16) = 0x2000000000;
  *(_OWORD *)(v42 + 24) = 0u;
  *(_OWORD *)(v42 + 40) = 0u;
  *(_DWORD *)(v42 + 56) = 1065353216;
  *((_QWORD *)v15 + 16) = v42;
  llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)(v15 + 152));
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)(v15 + 176));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j < objc_msgSend(*((id *)v15 + 64), "count"); ++j)
  {
    v44 = [MPSGraphShapedType alloc];
    v45 = (void *)*((_QWORD *)v15 + 65);
    objc_msgSend(*((id *)v15 + 64), "objectAtIndexedSubscript:", j);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "shape");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)*((_QWORD *)v15 + 65);
    objc_msgSend(*((id *)v15 + 64), "objectAtIndexedSubscript:", j);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[MPSGraphShapedType initWithShape:dataType:](v44, "initWithShape:dataType:", v48, objc_msgSend(v51, "dataType"));

    objc_msgSend(v73, "addObject:", v52);
  }
  objc_msgSend(v15, "cloneForFeeds:targetTensors:targetOperations:", *((_QWORD *)v15 + 64), v69, v70);
  v74[0] = *v66;
  v53 = v66[1];
  v74[1] = v53;
  if (v53)
  {
    v54 = (unint64_t *)((char *)v53 + 8);
    do
      v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }
  LazyLoadableModuleRef::LazyLoadableModuleRef((uint64_t)&v88, v74, &v75);
  objc_msgSend(v15, "commonPostInit:", &v88);
  LazyLoadableModuleRef::~LazyLoadableModuleRef(&v88);
  v56 = v71;
  if (v53)
  {
    v57 = (unint64_t *)((char *)v53 + 8);
    do
      v58 = __ldaxr(v57);
    while (__stlxr(v58 - 1, v57));
    if (!v58)
    {
      (*(void (**)(mlir::MLIRContext *))(*(_QWORD *)v53 + 16))(v53);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v53);
      v56 = v71;
    }
  }
  objc_msgSend(v56, "compilationDescriptor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "specializeWithDevice:inputTypes:compilationDescriptor:", 0, v73, v59);

  if (v68)
  {
    objc_msgSend(v71, "compilationDescriptor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "specializeWithDevice:inputTypes:compilationDescriptor:", v68, v73, v60);

  }
  v61 = v15;
  if (v75)
    mlir::Operation::erase(v75);

  mlir::SourceMgrDiagnosticHandler::~SourceMgrDiagnosticHandler((mlir::SourceMgrDiagnosticHandler *)&v88._modelFileArchivePath.var0);
  llvm::SourceMgr::~SourceMgr((llvm::SourceMgr *)v79);
  kdebug_trace();
  v62 = v86;
  if (v86)
  {
    v63 = (unint64_t *)&v86->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
LABEL_45:

  return (MPSGraphExecutable *)v15;
}

void __101__MPSGraphExecutable_initWithGraph_device_feeds_targetTensors_targetOperations_executableDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t *v14;
  char *v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "indexOfObject:");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL && MTLReportFailureTypeEnabled())
  {
    objc_msgSend(v28, "operation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MTLReportFailure();

  }
  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v6 = (uint64_t *)v4[7];
  v5 = v4[8];
  if ((unint64_t)v6 < v5)
  {
    *v6 = v3;
    v7 = (uint64_t)(v6 + 1);
    goto LABEL_23;
  }
  v8 = (uint64_t *)v4[6];
  v9 = v6 - v8;
  v10 = v9 + 1;
  if ((unint64_t)(v9 + 1) >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v11 = v5 - (_QWORD)v8;
  if (v11 >> 2 > v10)
    v10 = v11 >> 2;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
    v12 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v12 = v10;
  if (v12)
  {
    if (v12 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v13 = operator new(8 * v12);
    v14 = (uint64_t *)&v13[8 * v9];
    v15 = &v13[8 * v12];
    *v14 = v3;
    v7 = (uint64_t)(v14 + 1);
    v16 = (char *)v6 - (char *)v8;
    if (v6 == v8)
      goto LABEL_21;
    goto LABEL_15;
  }
  v13 = 0;
  v14 = (uint64_t *)(8 * v9);
  v15 = 0;
  *(_QWORD *)(8 * v9) = v3;
  v7 = 8 * v9 + 8;
  v16 = (char *)v6 - (char *)v8;
  if (v6 != v8)
  {
LABEL_15:
    v17 = v16 - 8;
    if (v17 < 0x58)
      goto LABEL_30;
    if ((unint64_t)((char *)v8 - v13) < 0x20)
      goto LABEL_30;
    v18 = (v17 >> 3) + 1;
    v19 = 8 * (v18 & 0x3FFFFFFFFFFFFFFCLL);
    v20 = &v6[v19 / 0xFFFFFFFFFFFFFFF8];
    v14 = (uint64_t *)((char *)v14 - v19);
    v21 = &v13[8 * v9 - 16];
    v22 = v6 - 2;
    v23 = v18 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v24 = *(_OWORD *)v22;
      *(v21 - 1) = *((_OWORD *)v22 - 1);
      *v21 = v24;
      v21 -= 2;
      v22 -= 4;
      v23 -= 4;
    }
    while (v23);
    v6 = v20;
    if (v18 != (v18 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_30:
      do
      {
        v25 = *--v6;
        *--v14 = v25;
      }
      while (v6 != v8);
    }
  }
LABEL_21:
  v4[6] = v14;
  v4[7] = v7;
  v4[8] = v15;
  if (v8)
    operator delete(v8);
LABEL_23:
  v4[7] = v7;

}

- (MPSGraphExecutable)initWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4
{
  id v6;
  MPSGraphExecutable *v7;
  MPSGraphExecutable *v8;
  MPSGraphExecutable *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphExecutable;
  v7 = -[MPSGraphExecutable init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MPSGraphExecutable initializeWithMLIRModule:executableDescriptor:](v7, "initializeWithMLIRModule:executableDescriptor:", a3.state, v6);
    v9 = (MPSGraphExecutable *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lazyInitWithModuleURL:(id)a3 executableDescriptor:(id)a4 callablesDescription:(id)a5 moduleResourcesLoader:(shared_ptr<ModuleResourcesLoader>)a6
{
  ModuleResourcesLoader *ptr;
  id v10;
  uint64_t v11;
  char moduleURL;
  void *v13;
  void *v14;
  MPSGraphExecutable *v15;
  void *v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  const char *v21;
  size_t v22;
  size_t v23;
  __int128 *p_dst;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  BOOL v43;
  __CFString *v44;
  _BOOL4 v45;
  const __CFString *v46;
  int v47;
  void *v48;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 __dst;
  unint64_t v59;
  __int128 v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  _BYTE v63[72];
  _BYTE v64[128];
  LazyLoadableModuleRef v65;
  _BYTE v66[80];
  uint64_t v67;

  ptr = a6.__ptr_;
  v67 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v10 = a4;
  v52 = a5;
  objc_storeWeak((id *)self + 1, 0);
  *((_QWORD *)self + 81) = 1;
  v51 = v10;
  -[MPSGraphExecutable commonPreInitWithDescriptor:](self, "commonPreInitWithDescriptor:", v10);
  *((_QWORD *)self + 4) = 0;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v63);
  v11 = *((_QWORD *)self + 2);
  memset(&v65, 0, 32);
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)v66, (uint64_t)v63, v11, (__int128 *)&v65);
  moduleURL = (char)v65._moduleURL;
  if (v65._moduleURL >= (NSURL *)8)
  {
    if (((uint64_t)v65._moduleURL & 4) != 0)
    {
      if (((uint64_t)v65._moduleURL & 2) != 0)
        v13 = &v65;
      else
        v13 = v65._ctx.__ptr_;
      (*(void (**)(void *))(((unint64_t)v65._moduleURL & 0xFFFFFFFFFFFFFFF8) + 16))(v13);
    }
    if ((moduleURL & 2) == 0)
      llvm::deallocate_buffer((llvm *)v65._ctx.__ptr_, v65._ctx.__cntrl_);
  }
  *((_QWORD *)self + 16) = 0;
  llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)((char *)self + 152));
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)self + 176);
  v14 = (void *)*((_QWORD *)self + 62);
  v15 = self;
  *((_QWORD *)self + 62) = 0;

  v16 = (void *)*((_QWORD *)self + 63);
  *((_QWORD *)self + 63) = 0;

  v17 = (void *)*((_QWORD *)self + 65);
  *((_QWORD *)self + 65) = 0;

  v18 = (std::__shared_weak_count *)*((_QWORD *)self + 3);
  v61 = *((_QWORD *)self + 2);
  v62 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
  }
  v60 = *(_OWORD *)ptr;
  *(_QWORD *)ptr = 0;
  *((_QWORD *)ptr + 1) = 0;
  v21 = (const char *)objc_msgSend(*((id *)self + 72), "UTF8String");
  v22 = strlen(v21);
  if (v22 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v23 = v22;
  if (v22 >= 0x17)
  {
    v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17)
      v25 = v22 | 7;
    v26 = v25 + 1;
    p_dst = (__int128 *)operator new(v25 + 1);
    *((_QWORD *)&__dst + 1) = v23;
    v59 = v26 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_19;
  }
  HIBYTE(v59) = v22;
  p_dst = &__dst;
  if (v22)
LABEL_19:
    memmove(p_dst, v21, v23);
  *((_BYTE *)p_dst + v23) = 0;
  LazyLoadableModuleRef::LazyLoadableModuleRef((uint64_t)&v65, &v61, v53, &v60, &__dst, *((_BYTE *)self + 611));
  LazyLoadableModuleRef::operator=((uint64_t)self + 40, (uint64_t *)&v65);
  LazyLoadableModuleRef::~LazyLoadableModuleRef(&v65);
  if (SHIBYTE(v59) < 0)
    operator delete((void *)__dst);
  v27 = (std::__shared_weak_count *)*((_QWORD *)&v60 + 1);
  if (*((_QWORD *)&v60 + 1))
  {
    v28 = (unint64_t *)(*((_QWORD *)&v60 + 1) + 8);
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  v30 = v62;
  if (v62)
  {
    v31 = (unint64_t *)&v62->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  atomic_store(1u, (unsigned __int8 *)self + 492);
  v33 = (void *)*((_QWORD *)self + 18);
  v50 = 144;
  *((_QWORD *)self + 18) = 0;

  v34 = v52;
  if (v52)
  {
    v35 = (void *)objc_msgSend(v52, "mutableCopy");
    objc_msgSend(v35, "allKeys");
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v55 != v38)
            objc_enumerationMutation(v36);
          v40 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(*((id *)v15 + 17), "callables", v50);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42 == 0;

          if (v43)
          {
            v46 = CFSTR("default");
          }
          else
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", v40);

            objc_msgSend(v35, "objectForKeyedSubscript:", v40);
            v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v45 = v44 == CFSTR("inline");

            v46 = CFSTR("dynamic");
            if (v45)
            {
              v47 = MTLReportFailureTypeEnabled();
              v46 = CFSTR("dynamic");
              if (v47)
              {
                MTLReportFailure();
                v46 = CFSTR("dynamic");
              }
            }
          }
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v46, v40);
        }
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v37);
    }

    v48 = *(void **)((char *)v15 + v50);
    *(_QWORD *)((char *)v15 + v50) = v35;

    v34 = v52;
  }
  mlir::SourceMgrDiagnosticHandler::~SourceMgrDiagnosticHandler((mlir::SourceMgrDiagnosticHandler *)v66);
  llvm::SourceMgr::~SourceMgr((llvm::SourceMgr *)v63);

  return v15;
}

- (id)initializeWithMLIRModule:(ModuleOp)a3 executableDescriptor:(id)a4
{
  id v5;
  uint64_t v6;
  char moduleURL;
  void *ptr;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[72];
  Operation *state;
  LazyLoadableModuleRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  state = a3.state;
  v5 = a4;
  objc_storeWeak((id *)self + 1, 0);
  *((_QWORD *)self + 81) = 1;
  -[MPSGraphExecutable commonPreInitWithDescriptor:](self, "commonPreInitWithDescriptor:", v5);
  *((_QWORD *)self + 4) = 0;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v13);
  v6 = *((_QWORD *)self + 2);
  memset(&v15, 0, 32);
  mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)&v15._modelFileArchivePath.var0, (uint64_t)v13, v6, (__int128 *)&v15);
  moduleURL = (char)v15._moduleURL;
  if (v15._moduleURL >= (NSURL *)8)
  {
    if (((uint64_t)v15._moduleURL & 4) != 0)
    {
      if (((uint64_t)v15._moduleURL & 2) != 0)
        ptr = &v15;
      else
        ptr = v15._ctx.__ptr_;
      (*(void (**)(void *))(((unint64_t)v15._moduleURL & 0xFFFFFFFFFFFFFFF8) + 16))(ptr);
    }
    if ((moduleURL & 2) == 0)
      llvm::deallocate_buffer((llvm *)v15._ctx.__ptr_, v15._ctx.__cntrl_);
  }
  *((_QWORD *)self + 16) = 0;
  llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)((char *)self + 152));
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)self + 176);
  v9 = (void *)*((_QWORD *)self + 62);
  *((_QWORD *)self + 62) = 0;

  v10 = (void *)*((_QWORD *)self + 63);
  *((_QWORD *)self + 63) = 0;

  v11 = (void *)*((_QWORD *)self + 65);
  *((_QWORD *)self + 65) = 0;

  mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)&state);
}

- (MPSGraphExecutable)initWithCoreMLPackage:(id)a3 executableDescriptor:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  id v9;
  id v10;
  NSObject *v11;
  MPSGraphExecutable *v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__358;
  v25 = __Block_byref_object_dispose__359;
  v26 = 0;
  v8 = dispatch_semaphore_create(0);
  if (qword_1EDC0BF30 == -1)
  {
    v9 = objc_retainAutorelease((id)qword_1EDC0BF38);
    if (qword_1EDC0BF30 == -1)
      goto LABEL_3;
LABEL_8:
    dispatch_once(&qword_1EDC0BF30, &__block_literal_global_765);
    if (objc_retainAutorelease((id)qword_1EDC0BF38))
      goto LABEL_4;
    goto LABEL_9;
  }
  dispatch_once(&qword_1EDC0BF30, &__block_literal_global_765);
  v14 = objc_retainAutorelease((id)qword_1EDC0BF38);
  if (qword_1EDC0BF30 != -1)
    goto LABEL_8;
LABEL_3:
  if (objc_retainAutorelease((id)qword_1EDC0BF38))
    goto LABEL_4;
LABEL_9:
  if (MTLReportFailureTypeEnabled())
    MTLReportFailure();
LABEL_4:
  if (qword_1EDC0BF30 != -1)
    dispatch_once(&qword_1EDC0BF30, &__block_literal_global_765);
  v10 = objc_retainAutorelease((id)qword_1EDC0BF38);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __65__MPSGraphExecutable_initWithCoreMLPackage_executableDescriptor___block_invoke;
  v18 = &unk_1E0E76F38;
  v20 = &v21;
  v11 = v8;
  v19 = v11;
  objc_msgSend(v10, "compileModelAtURL:completionHandler:", v6, &v15);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = -[MPSGraphExecutable initWithMILProgramWithURL:executableDescriptor:](self, "initWithMILProgramWithURL:executableDescriptor:", v22[5], v7, v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __65__MPSGraphExecutable_initWithCoreMLPackage_executableDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (qword_1EDC0BF50 == -1)
    {
      v7 = objc_retainAutorelease((id)qword_1EDC0BF58);
      if (qword_1EDC0BF50 == -1)
        goto LABEL_4;
    }
    else
    {
      dispatch_once(&qword_1EDC0BF50, &__block_literal_global_769);
      v16 = objc_retainAutorelease((id)qword_1EDC0BF58);
      if (qword_1EDC0BF50 == -1)
      {
LABEL_4:
        if (objc_retainAutorelease((id)qword_1EDC0BF58))
        {
LABEL_5:
          if (qword_1EDC0BF50 != -1)
            dispatch_once(&qword_1EDC0BF50, &__block_literal_global_769);
          if (objc_msgSend(objc_retainAutorelease((id)qword_1EDC0BF58), "canAddMLProgramToCompiledModelAtURL:", v5))
          {
            if (qword_1EDC0BF50 != -1)
              dispatch_once(&qword_1EDC0BF50, &__block_literal_global_769);
            v19 = 0;
            objc_msgSend(objc_retainAutorelease((id)qword_1EDC0BF58), "addMLProgramToCompiledModelAtURL:error:", v5, &v19);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v19;
            if (v6 && MTLReportFailureTypeEnabled())
            {
              objc_msgSend(v6, "description");
              v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v18 = objc_msgSend(v17, "UTF8String");
              MTLReportFailure();

            }
          }
          else
          {
            v6 = 0;
          }
          v9 = (void *)MEMORY[0x1E0C99E98];
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "path", v18);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/model.mil"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fileURLWithPath:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v15 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v13;

          goto LABEL_14;
        }
LABEL_20:
        if (MTLReportFailureTypeEnabled())
          MTLReportFailure();
        goto LABEL_5;
      }
    }
    dispatch_once(&qword_1EDC0BF50, &__block_literal_global_769);
    if (objc_retainAutorelease((id)qword_1EDC0BF58))
      goto LABEL_5;
    goto LABEL_20;
  }
  if (!MTLReportFailureTypeEnabled())
    goto LABEL_15;
  objc_msgSend(v6, "description");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  MTLReportFailure();
LABEL_14:

LABEL_15:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (MPSGraphExecutable)initWithCoreMLPackageAtURL:(id)a3 compilationDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MPSGraphExecutable *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setCompilationDescriptor:", v7);
  v9 = -[MPSGraphExecutable initWithCoreMLPackage:executableDescriptor:](self, "initWithCoreMLPackage:executableDescriptor:", v6, v8);

  return v9;
}

- (MPSGraphExecutable)initWithMILProgramWithURL:(id)a3 executableDescriptor:(id)a4
{
  id v6;
  std::string::size_type v7;
  std::__shared_weak_count *v8;
  std::string::size_type v9;
  void *v10;
  const char *v11;
  size_t v12;
  std::string::size_type v13;
  std::string *p_dst;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  id v24;
  const char *v25;
  size_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  MPSGraphExecutable *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  MPSGraphExecutable *v47;
  void *v48;
  id v49;
  MIL::MILContext *v50;
  id v51;
  uint64_t v52;
  std::string v53;
  std::string::size_type v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  void *__p[2];
  unint64_t v58;
  char v59;
  std::string __dst;
  id v61;
  std::string::size_type v62;
  std::__shared_weak_count *v63;

  v6 = a3;
  v50 = (MIL::MILContext *)a4;
  MIL::MILContext::Make(v50);
  v7 = __dst.__r_.__value_.__r.__words[0];
  v62 = __dst.__r_.__value_.__r.__words[0];
  if (__dst.__r_.__value_.__r.__words[0])
  {
    v8 = (std::__shared_weak_count *)operator new();
    v9 = __dst.__r_.__value_.__r.__words[0];
    v8->__vftable = (std::__shared_weak_count_vtbl *)&off_1E0E52190;
    v8->__shared_owners_ = 0;
    v8->__shared_weak_owners_ = 0;
    v8[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  }
  else
  {
    v8 = 0;
  }
  v63 = v8;
  MEMORY[0x186DA0F90](v7);
  MEMORY[0x186DA0F9C](v7);
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v6, 4, &v61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v61;
  v46 = v10;
  if (v51 && MTLReportFailureTypeEnabled())
  {
    objc_msgSend(v6, "absoluteString");
    v42 = v6;
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v43, "UTF8String");
    objc_msgSend(v51, "localizedFailureReason");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "cStringUsingEncoding:", 4);
    objc_msgSend(v51, "localizedDescription");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v45, "cStringUsingEncoding:", 4);
    MTLReportFailure();

    v6 = v42;
    v10 = v46;
  }
  v49 = objc_retainAutorelease(v10);
  v11 = (const char *)objc_msgSend(v49, "UTF8String");
  v12 = strlen(v11);
  if (v12 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v13 = v12;
  if (v12 >= 0x17)
  {
    v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17)
      v15 = v12 | 7;
    v16 = v15 + 1;
    p_dst = (std::string *)operator new(v15 + 1);
    __dst.__r_.__value_.__l.__size_ = v13;
    __dst.__r_.__value_.__r.__words[2] = v16 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v12;
    p_dst = &__dst;
    if (!v12)
      goto LABEL_13;
  }
  v12 = (size_t)memmove(p_dst, v11, v13);
LABEL_13:
  p_dst->__r_.__value_.__s.__data_[v13] = 0;
  MIL::ParserOptions::Make((MIL::ParserOptions *)v12);
  v48 = v6;
  objc_msgSend(v6, "pathComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "subarrayWithRange:", 0, objc_msgSend(v17, "count") - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = self;
  objc_msgSend(v18, "pathWithComponents:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "fileExistsAtPath:isDirectory:", v20, &v59);
  if (objc_msgSend(v20, "length"))
  {
    v23 = v59 ? v22 : 0;
    if ((v23 & 1) == 0)
      __assert_rtn("-[MPSGraphExecutable initWithMILProgramWithURL:executableDescriptor:]", "MPSGraphExecutable.mm", 1213, "isDirectory && isPath");
  }
  v24 = objc_retainAutorelease(v20);
  v25 = (const char *)objc_msgSend(v24, "UTF8String");
  v26 = strlen(v25);
  if (v26 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v27 = (void *)v26;
  if (v26 >= 0x17)
  {
    v29 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17)
      v29 = v26 | 7;
    v30 = v29 + 1;
    v28 = operator new(v29 + 1);
    __p[1] = v27;
    v58 = v30 | 0x8000000000000000;
    __p[0] = v28;
    goto LABEL_25;
  }
  HIBYTE(v58) = v26;
  v28 = __p;
  if (v26)
LABEL_25:
    memmove(v28, v25, (size_t)v27);
  *((_BYTE *)v27 + (_QWORD)v28) = 0;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v52 + 48))(v52, __p);
  if (SHIBYTE(v58) < 0)
    operator delete(__p[0]);
  v54 = v62;
  v55 = v63;
  if (v63)
  {
    p_shared_owners = (unint64_t *)&v63->__shared_owners_;
    do
      v32 = __ldxr(p_shared_owners);
    while (__stxr(v32 + 1, p_shared_owners));
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v53, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v53 = __dst;
  MIL::Text::ParseProgram();
  v33 = v56;
  v56 = 0;
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  v34 = v55;
  if (v55)
  {
    v35 = (unint64_t *)&v55->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

  if (v52)
    (*(void (**)())(*(_QWORD *)v52 + 8))();
  v37 = -[MPSGraphExecutable initWithMILProgram:executableDescriptor:]([MPSGraphExecutable alloc], "initWithMILProgram:executableDescriptor:", v33, v50);
  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);

  v38 = v63;
  if (v63)
  {
    v39 = (unint64_t *)&v63->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  return v37;
}

- (MPSGraphExecutable)initWithMILProgram:(void *)a3 executableDescriptor:(id)a4
{
  id v6;
  MPSGraphExecutable *v7;
  uint64_t v8;
  char moduleURL;
  void *ptr;
  void *v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  MPSGraphExecutable *v19;
  mlir::MLIRContext *v21;
  std::__shared_weak_count *v22;
  _BYTE v23[72];
  mlir::Operation *v24;
  LazyLoadableModuleRef v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[MPSGraphExecutable init](self, "init");
  *((_QWORD *)v7 + 81) = 1;
  -[MPSGraphExecutable commonPreInitWithDescriptor:](v7, "commonPreInitWithDescriptor:", v6);
  v8 = *((_QWORD *)v7 + 2);
  lowerMILProgram((mlir::MLIRContext *)a3, v8, (objc_msgSend(v6, "compilerOptions") & 0x40) != 0, &v24);
  if (v24)
  {
    *((_QWORD *)v7 + 4) = 0;
    llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)v23);
    memset(&v25, 0, 32);
    mlir::SourceMgrDiagnosticHandler::SourceMgrDiagnosticHandler((llvm *)&v25._modelFileArchivePath.var0, (uint64_t)v23, v8, (__int128 *)&v25);
    moduleURL = (char)v25._moduleURL;
    if (v25._moduleURL >= (NSURL *)8)
    {
      if (((uint64_t)v25._moduleURL & 4) != 0)
      {
        if (((uint64_t)v25._moduleURL & 2) != 0)
          ptr = &v25;
        else
          ptr = v25._ctx.__ptr_;
        (*(void (**)(void *))(((unint64_t)v25._moduleURL & 0xFFFFFFFFFFFFFFF8) + 16))(ptr);
      }
      if ((moduleURL & 2) == 0)
        llvm::deallocate_buffer((llvm *)v25._ctx.__ptr_, v25._ctx.__cntrl_);
    }
    *((_QWORD *)v7 + 16) = 0;
    llvm::DenseMapBase<llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>,void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::clear((llvm *)((char *)v7 + 152));
    llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)v7 + 176);
    v11 = (void *)*((_QWORD *)v7 + 62);
    *((_QWORD *)v7 + 62) = 0;

    v12 = (void *)*((_QWORD *)v7 + 63);
    *((_QWORD *)v7 + 63) = 0;

    v13 = (void *)*((_QWORD *)v7 + 65);
    *((_QWORD *)v7 + 65) = 0;

    v21 = (mlir::MLIRContext *)*((_QWORD *)v7 + 2);
    v14 = (std::__shared_weak_count *)*((_QWORD *)v7 + 3);
    v22 = v14;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    LazyLoadableModuleRef::LazyLoadableModuleRef((uint64_t)&v25, &v21, &v24);
    -[MPSGraphExecutable commonPostInit:](v7, "commonPostInit:", &v25, v21, v22);
    LazyLoadableModuleRef::~LazyLoadableModuleRef(&v25);
    if (v14)
    {
      v17 = (unint64_t *)&v14->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v19 = v7;
    mlir::SourceMgrDiagnosticHandler::~SourceMgrDiagnosticHandler((mlir::SourceMgrDiagnosticHandler *)&v25._modelFileArchivePath.var0);
    llvm::SourceMgr::~SourceMgr((llvm::SourceMgr *)v23);
    if (v24)
      mlir::Operation::erase(v24);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (__CFDictionary)validateNetworkWithParams:(__CFDictionary *)a3 apiVersion:(unint64_t)a4
{
  return validateMILProgram(a3);
}

+ (unint64_t)getValidateNetworkSupportedVersion
{
  return 0;
}

- (MPSGraphExecutable)initWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4
{
  id v6;
  void *v7;
  id v8;
  MPSGraphExecutable *v9;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", a3, 4, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v8 && MTLReportFailureTypeEnabled())
  {
    objc_msgSend(v8, "localizedFailureReason");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "cStringUsingEncoding:", 4);
    objc_msgSend(v8, "localizedDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = v12;
    v15 = objc_msgSend(v13, "cStringUsingEncoding:", 4);
    MTLReportFailure();

  }
  v9 = -[MPSGraphExecutable initWithMLIRSource:executableDescriptor:](self, "initWithMLIRSource:executableDescriptor:", v7, v6, v14, v15);

  return v9;
}

- (MPSGraphExecutable)initWithMLIRCommon:()unique_ptr<llvm:(std:(id)a4 :(id *)a5 default_delete<llvm::MemoryBuffer>>)a3 :MemoryBuffer executableDescriptor:error:
{
  id v8;
  char *v9;
  uint64_t **v10;
  unint64_t v11;
  unint64_t v12;
  __n128 *v13;
  mlir::Operation *v14;
  void *v15;
  void *v16;
  mlir::Operation *v17;
  uint64_t **v18[2];
  uint64_t v19;
  const __CFString *v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[MPSGraphExecutable initializeMLIR](self, "initializeMLIR");
  v9 = (char *)operator new(0x60uLL);
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = &unk_1E0E51D68;
  *((_QWORD *)v9 + 1) = 0;
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)(v9 + 24));
  v18[0] = v10;
  v18[1] = (uint64_t **)v9;
  v11 = *(_QWORD *)a3.var0.var0;
  *(_QWORD *)a3.var0.var0 = 0;
  v22 = 0;
  v21 = (__n128)v11;
  v12 = *((_QWORD *)v9 + 4);
  if (v12 >= *((_QWORD *)v9 + 5))
  {
    v13 = std::vector<llvm::SourceMgr::SrcBuffer>::__push_back_slow_path<llvm::SourceMgr::SrcBuffer>((__n128 **)v10, &v21);
  }
  else
  {
    llvm::SourceMgr::SrcBuffer::SrcBuffer(*((__n128 **)v9 + 4), &v21);
    v13 = (__n128 *)(v12 + 24);
    *((_QWORD *)v9 + 4) = v12 + 24;
  }
  *((_QWORD *)v9 + 4) = v13;
  llvm::SourceMgr::SrcBuffer::~SrcBuffer((llvm::SourceMgr::SrcBuffer *)&v21);
  mlir::ParserConfig::ParserConfig((mlir::ParserConfig *)&v21, *((mlir::MLIRContext **)self + 2), 1, 0);
  mlir::mps::importMPSModule(v18, (mlir::StringAttr **)&v21, &v17);
  if (v17)
  {
    -[MPSGraphExecutable initializeWithMLIRModule:executableDescriptor:](self, "initializeWithMLIRModule:executableDescriptor:", v17, v8);
    objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (!v17)
      goto LABEL_10;
  }
  else
  {
    if (!a5)
      goto LABEL_10;
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Error importing MLIR module.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mps"), -19, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v17;
    if (!v17)
LABEL_10:
      mlir::ParserConfig::~ParserConfig((mlir::ParserConfig *)&v21);
  }
  mlir::Operation::erase(v14);
  goto LABEL_10;
}

- (MPSGraphExecutable)initWithMLIRSource:(id)a3 executableDescriptor:(id)a4
{
  id v6;
  id v7;
  MPSGraphExecutable *v8;
  const char *v9;
  uint64_t v10;
  size_t v11;
  MPSGraphExecutable *v12;
  id v13;
  char *v14;
  char *v15;
  void *v17;
  id v18;
  char *v19;
  char *v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MPSGraphExecutable;
  v8 = -[MPSGraphExecutable init](&v21, sel_init);
  if (v8)
  {
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    v10 = (uint64_t)v9;
    if (v9)
      v11 = strlen(v9);
    else
      v11 = 0;
    llvm::MemoryBuffer::getMemBuffer(v10, v11, (uint64_t)"", 0, &v20);
    v19 = v20;
    v20 = 0;
    v18 = 0;
    v12 = -[MPSGraphExecutable initWithMLIRCommon:executableDescriptor:error:](v8, "initWithMLIRCommon:executableDescriptor:error:", &v19, v7, &v18);
    v13 = v18;
    v14 = v19;
    v19 = 0;
    if (v14)
      (*(void (**)(char *))(*(_QWORD *)v14 + 8))(v14);
    if (!v12)
    {
      if (v13)
      {
        objc_msgSend(v13, "localizedDescription");

        if (MTLReportFailureTypeEnabled())
        {
          objc_msgSend(v13, "localizedDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MTLReportFailure();

        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }

    v15 = v20;
    v20 = 0;
    if (v15)
      (*(void (**)(char *))(*(_QWORD *)v15 + 8))(v15);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MPSGraphExecutable)initWithMLIRBytecode:(id)a3 executableDescriptor:(id)a4
{
  id v6;
  id v7;
  MPSGraphExecutable *v8;
  id v9;
  MPSGraphExecutable *v10;
  id v11;
  char *v12;
  char *v13;
  void *v15;
  id v16;
  char *v17;
  char *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MPSGraphExecutable;
  v8 = -[MPSGraphExecutable init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_retainAutorelease(v6);
    llvm::MemoryBuffer::getMemBuffer(objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (uint64_t)", 0, &v18);
    v17 = v18;
    v18 = 0;
    v16 = 0;
    v10 = -[MPSGraphExecutable initWithMLIRCommon:executableDescriptor:error:](v8, "initWithMLIRCommon:executableDescriptor:error:", &v17, v7, &v16);
    v11 = v16;
    v12 = v17;
    v17 = 0;
    if (v12)
      (*(void (**)(char *))(*(_QWORD *)v12 + 8))(v12);
    if (!v10)
    {
      if (v11)
      {
        objc_msgSend(v11, "localizedDescription");

        if (MTLReportFailureTypeEnabled())
        {
          objc_msgSend(v11, "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          MTLReportFailure();

        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }

    v13 = v18;
    v18 = 0;
    if (v13)
      (*(void (**)(char *))(*(_QWORD *)v13 + 8))(v13);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (MPSGraphExecutable)executableWithMLIRSourceFromURL:(id)a3 executableDescriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  size_t v14;
  MPSGraphExecutable *v15;
  MPSGraphExecutable *v16;
  char *v17;
  char *v18;
  char *v20;
  char *v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v7, 4, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v11 = v10;
  if (v9)
  {
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v13 = (uint64_t)v12;
    if (v12)
      v14 = strlen(v12);
    else
      v14 = 0;
    llvm::MemoryBuffer::getMemBuffer(v13, v14, (uint64_t)"", 0, &v21);
    v16 = [MPSGraphExecutable alloc];
    v20 = v21;
    v21 = 0;
    v15 = -[MPSGraphExecutable initWithMLIRCommon:executableDescriptor:error:](v16, "initWithMLIRCommon:executableDescriptor:error:", &v20, v8, a5);
    v17 = v20;
    v20 = 0;
    if (v17)
      (*(void (**)(char *))(*(_QWORD *)v17 + 8))(v17);
    v18 = v21;
    v21 = 0;
    if (v18)
      (*(void (**)(char *))(*(_QWORD *)v18 + 8))(v18);
  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v15;
}

- (MPSGraphExecutable)initWithMPSGraphPackageAtURLCommon:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5
{
  MPSGraphPackage *v7;
  void *v8;
  uint64_t v9;
  mlir::MLIRContext *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  const char *v25;
  size_t v26;
  size_t v27;
  __int128 *p_dst;
  uint64_t v29;
  uint64_t v30;
  int8x16_t *v31;
  const unsigned __int8 *v32;
  size_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  __int128 *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t *v74;
  unint64_t v75;
  size_t v76;
  size_t v77;
  __int128 *v78;
  uint64_t v79;
  uint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *p_shared_owners;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  LazyLoadableModuleRef *v87;
  LazyLoadableModuleRef *v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  uint64_t *v92;
  char *v93;
  uint64_t v94;
  uint64_t n;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  const char *v100;
  const char *v101;
  size_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  unint64_t *v107;
  unint64_t v108;
  unint64_t *v109;
  unint64_t v110;
  const char *v111;
  size_t v112;
  std::string::size_type v113;
  std::string *v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  id v118;
  unint64_t *v119;
  unint64_t v120;
  id v121;
  unint64_t *v122;
  unint64_t v123;
  void *v124;
  void *v125;
  uint64_t *v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t *v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint8x8_t v135;
  void **v136;
  char *v137;
  void *v138;
  void **v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  mlir::Operation *v144;
  mlir::Operation *v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  float v150;
  float v151;
  uint64_t v152;
  _QWORD *v153;
  _BOOL8 v154;
  unint64_t v155;
  unint64_t v156;
  size_t prime;
  unint64_t v158;
  uint8x8_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  __int128 v163;
  unint64_t *v164;
  unint64_t v165;
  std::__shared_weak_count *v166;
  unint64_t *v167;
  unint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t *v171;
  unint64_t v172;
  std::__shared_weak_count *v173;
  unint64_t *v174;
  unint64_t v175;
  std::__shared_weak_count *v176;
  unint64_t *v177;
  unint64_t v178;
  std::__shared_weak_count *v179;
  unint64_t *v180;
  unint64_t v181;
  std::__shared_weak_count *v182;
  unint64_t *v183;
  unint64_t v184;
  std::__shared_weak_count *v185;
  unint64_t *v186;
  unint64_t v187;
  std::__shared_weak_count *v188;
  unint64_t *v189;
  unint64_t v190;
  MPSGraphExecutable *v191;
  void *v192;
  char *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  MPSGraphPackage *v205;
  id v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  id v210;
  id v211;
  std::string *v212;
  void *v213;
  uint64_t v214;
  id v215;
  id v216;
  id v217;
  uint64_t m;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  id v223;
  _QWORD *v224;
  void *Manager;
  void *v226;
  id obj;
  id v228;
  MPSGraphExecutable *v229;
  std::string v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  void *__p[2];
  int64_t v238;
  LazyLoadableModuleRef *v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  objc_super v258;
  __int128 v259;
  _BYTE v260[128];
  __int128 __dst;
  mlir::Operation *v262;
  id v263;
  __int128 v264;
  char v265;
  std::string v266;
  id v267;
  uint64_t v268;
  LazyLoadableModuleRef *v269;
  void *v270;
  char *v271;
  char v272;
  id v273;
  id v274;
  id v275;
  uint64_t v276;
  _BYTE v277[128];
  uint64_t v278;
  const __CFString *v279;
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  uint64_t v283;
  _QWORD v284[4];

  v284[1] = *MEMORY[0x1E0C80C00];
  v228 = a3;
  v206 = a4;
  v258.receiver = self;
  v258.super_class = (Class)MPSGraphExecutable;
  v229 = -[MPSGraphExecutable init](&v258, sel_init);

  -[MPSGraphExecutable initializeMLIR](v229, "initializeMLIR");
  v7 = -[MPSGraphPackage initWithSourcePackageURL:error:]([MPSGraphPackage alloc], "initWithSourcePackageURL:error:", v228, a5);
  v205 = v7;
  if (v7)
  {
    -[MPSGraphPackage getMLIRLibrary](v7, "getMLIRLibrary");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "getDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = v8;
    v203 = (void *)objc_opt_new();
    objc_msgSend(v203, "setCompilationDescriptor:", v206);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Original"));
    v9 = objc_claimAutoreleasedReturnValue();
    v200 = (void *)v9;
    if (v9)
    {
      objc_msgSend(v228, "URLByAppendingPathComponent:", v9);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "getCallablesDescription");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v220 = objc_msgSend(v204, "getResourceStorageMode");
      if (v220 == 1)
      {
        Manager = mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)v229 + 2), v10);
        v11 = (void *)objc_opt_new();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Original Resources Used"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v12);

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Optimized Resources Used"));
        v256 = 0u;
        v257 = 0u;
        v254 = 0u;
        v255 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v254, v282, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v255;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v255 != v14)
                objc_enumerationMutation(obj);
              objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v254 + 1) + 8 * i));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObjectsFromArray:", v16);

            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v254, v282, 16);
          }
          while (v13);
        }

        objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Optimized No Device Resources Used"));
        v252 = 0u;
        v253 = 0u;
        v250 = 0u;
        v251 = 0u;
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v250, v281, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v251;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v251 != v19)
                objc_enumerationMutation(v17);
              objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * j));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObjectsFromArray:", v21);

            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v250, v281, 16);
          }
          while (v18);
        }

        v248 = 0u;
        v249 = 0u;
        v246 = 0u;
        v247 = 0u;
        v215 = v11;
        v22 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v246, v280, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v247;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v247 != v23)
                objc_enumerationMutation(v215);
              v25 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v246 + 1) + 8 * k)), "UTF8String");
              v26 = strlen(v25);
              if (v26 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              v27 = v26;
              if (v26 >= 0x17)
              {
                v29 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v26 | 7) != 0x17)
                  v29 = v26 | 7;
                v30 = v29 + 1;
                p_dst = (__int128 *)operator new(v29 + 1);
                v262 = (mlir::Operation *)(v30 | 0x8000000000000000);
                *(_QWORD *)&__dst = p_dst;
                *((_QWORD *)&__dst + 1) = v27;
LABEL_31:
                memmove(p_dst, v25, v27);
                goto LABEL_32;
              }
              HIBYTE(v262) = v26;
              p_dst = &__dst;
              if (v26)
                goto LABEL_31;
LABEL_32:
              *((_BYTE *)p_dst + v27) = 0;
              if (SHIBYTE(v262) >= 0)
                v31 = (int8x16_t *)&__dst;
              else
                v31 = (int8x16_t *)__dst;
              if (SHIBYTE(v262) >= 0)
                v32 = (const unsigned __int8 *)HIBYTE(v262);
              else
                v32 = (const unsigned __int8 *)*((_QWORD *)&__dst + 1);
              mlir::mps::MPSResourceBlobManagerInterface::insertUndefinedEntry((uint64_t)Manager, v31, v32, (uint64_t *)&v270);
              v33 = *((_QWORD *)v270 + 1);
              v34 = SHIBYTE(v262);
              v35 = *((_QWORD *)&__dst + 1);
              v36 = (void *)__dst;
              if (SHIBYTE(v262) >= 0)
                v37 = &__dst;
              else
                v37 = (__int128 *)__dst;
              if (SHIBYTE(v262) >= 0)
                v35 = HIBYTE(v262);
              if (v33 != v35 || v33 && memcmp(*(const void **)v270, v37, v33))
              {
                if (a5)
                {
                  v196 = (void *)MEMORY[0x1E0CB35C8];
                  v278 = *MEMORY[0x1E0CB2D50];
                  v279 = CFSTR("Could not create correct resource name");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v196, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mps"), -19, v197);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  LOBYTE(v34) = HIBYTE(v262);
                }
                if ((v34 & 0x80) != 0)
                  operator delete((void *)__dst);
                v191 = 0;
                v192 = v215;
                v211 = v215;
LABEL_339:

LABEL_340:
                goto LABEL_341;
              }
              if (v34 < 0)
                operator delete(v36);
            }
            v22 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v246, v280, 16);
          }
          while (v22);
        }

        objc_msgSend(v203, "compilationDescriptor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constantData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
          objc_msgSend(v39, "loadIntoResourceManager:", Manager);

        v8 = v221;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Original Resources Used"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      getModuleResourcesLoader(&__dst, v228, v220, v40, v41);

      v245 = __dst;
      __dst = 0uLL;
      v42 = -[MPSGraphExecutable lazyInitWithModuleURL:executableDescriptor:callablesDescription:moduleResourcesLoader:](v229, "lazyInitWithModuleURL:executableDescriptor:callablesDescription:moduleResourcesLoader:", v202, v203, v201, &v245);
      v43 = (std::__shared_weak_count *)*((_QWORD *)&v245 + 1);
      if (*((_QWORD *)&v245 + 1))
      {
        v44 = (unint64_t *)(*((_QWORD *)&v245 + 1) + 8);
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 - 1, v44));
        if (!v45)
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
      }
      v46 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
      if (*((_QWORD *)&__dst + 1))
      {
        v47 = (unint64_t *)(*((_QWORD *)&__dst + 1) + 8);
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
      }
      llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::clear((uint64_t)v229 + 176);
      objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Optimized"));
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Optimized Resources Used"));
      v49 = objc_claimAutoreleasedReturnValue();
      v243 = 0u;
      v244 = 0u;
      v241 = 0u;
      v242 = 0u;
      v211 = v199;
      obj = (id)v49;
      v209 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v241, v277, 16);
      if (v209)
      {
        v207 = *(_QWORD *)v242;
        do
        {
          for (m = 0; m != v209; ++m)
          {
            if (*(_QWORD *)v242 != v207)
              objc_enumerationMutation(v211);
            v50 = *(void **)(*((_QWORD *)&v241 + 1) + 8 * m);
            objc_msgSend(v211, "objectForKeyedSubscript:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v228, "URLByAppendingPathComponent:", v51);
            v213 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*((id *)v229 + 17), "entryFunctionName");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v50;
            v223 = v52;
            *(_QWORD *)&__dst = &v262;
            *((_QWORD *)&__dst + 1) = 0x600000000;
            v54 = (void *)MEMORY[0x1E0CB36D8];
            v216 = v53;
            objc_msgSend(v53, "dataUsingEncoding:", 4);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "JSONObjectWithData:options:error:", v55, 4, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v57 = v56;
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("inputShapes"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("compilationDescriptor"));
              v212 = (std::string *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("callablesDescriptor"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("deviceRegistry"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = objc_msgSend(v60, "unsignedIntegerValue");

              +[MPSGraphCompilationDescriptor descriptorWithDictionary:](MPSGraphCompilationDescriptor, "descriptorWithDictionary:", v212);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v58, "count");
              v64 = v63;
              v65 = DWORD2(__dst);
              if (v63 != DWORD2(__dst))
              {
                if (v63 >= DWORD2(__dst))
                {
                  if (v63 > HIDWORD(__dst))
                  {
                    llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&__dst, &v262, v63, 8);
                    v65 = DWORD2(__dst);
                  }
                  if (v64 != v65)
                    bzero((void *)(__dst + 8 * v65), 8 * (v64 - v65));
                  if (v64 > HIDWORD(__dst))
LABEL_344:
                    __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
                }
                else if (v63 > HIDWORD(__dst))
                {
                  goto LABEL_344;
                }
                DWORD2(__dst) = v64;
                LODWORD(v65) = v64;
              }
              if ((_DWORD)v65)
              {
                v66 = 0;
                do
                {
                  objc_msgSend(v58, "objectAtIndexedSubscript:", v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v68 = objc_msgSend(v67, "integerValue");
                  if (v66 >= DWORD2(__dst))
                    __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
                  *(_QWORD *)(__dst + 8 * v66) = v68;

                  ++v66;
                }
                while (v66 < DWORD2(__dst));
              }

            }
            else
            {
              v61 = 0;
              v59 = 0;
              v62 = 0;
            }
            MPSGraphModuleKey::MPSGraphModuleKey(&v270, (uint64_t)&__dst, v62, v59, v223, v61);

            if ((mlir::Operation **)__dst != &v262)
              free((void *)__dst);

            objc_msgSend(obj, "objectForKeyedSubscript:", v216);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            getModuleResourcesLoader(&v240, v228, v220, v69, v70);

            v71 = (const char *)objc_msgSend(*((id *)v229 + 72), "UTF8String");
            v72 = operator new();
            __p[0] = *((void **)v229 + 2);
            v73 = (unint64_t *)*((_QWORD *)v229 + 3);
            __p[1] = v73;
            if (v73)
            {
              v74 = v73 + 1;
              do
                v75 = __ldxr(v74);
              while (__stxr(v75 + 1, v74));
            }
            v259 = v240;
            v240 = 0uLL;
            v76 = strlen(v71);
            if (v76 > 0x7FFFFFFFFFFFFFF7)
              std::string::__throw_length_error[abi:ne180100]();
            v77 = v76;
            if (v76 >= 0x17)
            {
              v79 = (v76 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v76 | 7) != 0x17)
                v79 = v76 | 7;
              v80 = v79 + 1;
              v78 = (__int128 *)operator new(v79 + 1);
              v262 = (mlir::Operation *)(v80 | 0x8000000000000000);
              *(_QWORD *)&__dst = v78;
              *((_QWORD *)&__dst + 1) = v77;
LABEL_96:
              memmove(v78, v71, v77);
              goto LABEL_97;
            }
            HIBYTE(v262) = v76;
            v78 = &__dst;
            if (v76)
              goto LABEL_96;
LABEL_97:
            *((_BYTE *)v78 + v77) = 0;
            LazyLoadableModuleRef::LazyLoadableModuleRef(v72, __p, v213, &v259, &__dst, *((_BYTE *)v229 + 611));
            v239 = (LazyLoadableModuleRef *)v72;
            if (SHIBYTE(v262) < 0)
            {
              operator delete((void *)__dst);
              v81 = (std::__shared_weak_count *)*((_QWORD *)&v259 + 1);
              if (!*((_QWORD *)&v259 + 1))
                goto LABEL_104;
            }
            else
            {
              v81 = (std::__shared_weak_count *)*((_QWORD *)&v259 + 1);
              if (!*((_QWORD *)&v259 + 1))
                goto LABEL_104;
            }
            p_shared_owners = (unint64_t *)&v81->__shared_owners_;
            do
              v83 = __ldaxr(p_shared_owners);
            while (__stlxr(v83 - 1, p_shared_owners));
            if (!v83)
            {
              ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
              std::__shared_weak_count::__release_weak(v81);
              v84 = (std::__shared_weak_count *)__p[1];
              if (!__p[1])
                goto LABEL_110;
              goto LABEL_105;
            }
LABEL_104:
            v84 = (std::__shared_weak_count *)__p[1];
            if (!__p[1])
              goto LABEL_110;
LABEL_105:
            v85 = (unint64_t *)&v84->__shared_owners_;
            do
              v86 = __ldaxr(v85);
            while (__stlxr(v86 - 1, v85));
            if (!v86)
            {
              ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
              std::__shared_weak_count::__release_weak(v84);
            }
LABEL_110:
            *(_QWORD *)&__dst = &v262;
            *((_QWORD *)&__dst + 1) = 0x600000000;
            if ((_DWORD)v271)
              llvm::SmallVectorImpl<long long>::operator=((uint64_t)&__dst, (uint64_t)&v270);
            v266.__r_.__value_.__l.__size_ = (std::string::size_type)v273;
            v266.__r_.__value_.__r.__words[2] = (std::string::size_type)v274;
            v267 = v275;
            v268 = v276;
            v87 = v239;
            v239 = 0;
            v269 = v87;
            llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::try_emplace<std::unique_ptr<LazyLoadableModuleRef>>((uint64_t)__p, (uint64_t)v229 + 176, (uint64_t)&__dst, (const void **)&v269);
            v88 = v269;
            v269 = 0;
            if (v88)
            {
              LazyLoadableModuleRef::~LazyLoadableModuleRef(v88);
              MEMORY[0x186DA1680]();
            }

            if ((mlir::Operation **)__dst != &v262)
              free((void *)__dst);
            v89 = (std::__shared_weak_count *)*((_QWORD *)&v240 + 1);
            if (*((_QWORD *)&v240 + 1))
            {
              v90 = (unint64_t *)(*((_QWORD *)&v240 + 1) + 8);
              do
                v91 = __ldaxr(v90);
              while (__stlxr(v91 - 1, v90));
              if (!v91)
              {
                ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
                std::__shared_weak_count::__release_weak(v89);
              }
            }

            if (v270 != &v272)
              free(v270);

          }
          v209 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v241, v277, 16);
        }
        while (v209);
      }

      v92 = (uint64_t *)((char *)v229 + 200);
      if (*((_QWORD *)v229 + 28))
      {
        v93 = (char *)*((_QWORD *)v229 + 27);
        if (v93)
        {
          do
          {
            v193 = *(char **)v93;
            LazyLoadableModuleRef::~LazyLoadableModuleRef((LazyLoadableModuleRef *)(v93 + 40));
            if (v93[39] < 0)
              operator delete(*((void **)v93 + 2));
            operator delete(v93);
            v93 = v193;
          }
          while (v193);
        }
        *((_QWORD *)v229 + 27) = 0;
        v94 = *((_QWORD *)v229 + 26);
        if (v94)
        {
          for (n = 0; n != v94; ++n)
            *(_QWORD *)(*v92 + 8 * n) = 0;
        }
        *((_QWORD *)v229 + 28) = 0;
      }
      objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Optimized No Device"));
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Optimized No Device Resources Used"));
      v96 = objc_claimAutoreleasedReturnValue();
      v235 = 0u;
      v236 = 0u;
      v233 = 0u;
      v234 = 0u;
      v17 = v208;
      v217 = (id)v96;
      v97 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v233, v260, 16);
      if (!v97)
      {
LABEL_326:

        v191 = v229;
        v192 = v217;
        goto LABEL_339;
      }
      v214 = *(_QWORD *)v234;
      v224 = (_QWORD *)((char *)v229 + 216);
      v210 = v17;
LABEL_133:
      v98 = 0;
      v219 = v97;
LABEL_134:
      if (*(_QWORD *)v234 != v214)
        objc_enumerationMutation(v17);
      v99 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v233 + 1) + 8 * v98));
      v100 = (const char *)objc_msgSend(v99, "UTF8String");
      v101 = v100;
      if (v100)
        v102 = strlen(v100);
      else
        v102 = 0;
      objc_msgSend(v17, "objectForKeyedSubscript:", v99);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "URLByAppendingPathComponent:", v103);
      v226 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v217, "objectForKeyedSubscript:", v99);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "objectForKeyedSubscript:", CFSTR("Resource Offsets"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      getModuleResourcesLoader(&v259, v228, v220, v104, v105);

      *(_QWORD *)&v232 = *((_QWORD *)v229 + 2);
      v106 = *((_QWORD *)v229 + 3);
      *((_QWORD *)&v232 + 1) = v106;
      if (v106)
      {
        v107 = (unint64_t *)(v106 + 8);
        do
          v108 = __ldxr(v107);
        while (__stxr(v108 + 1, v107));
      }
      v231 = v259;
      if (*((_QWORD *)&v259 + 1))
      {
        v109 = (unint64_t *)(*((_QWORD *)&v259 + 1) + 8);
        do
          v110 = __ldxr(v109);
        while (__stxr(v110 + 1, v109));
      }
      v111 = (const char *)objc_msgSend(*((id *)v229 + 72), "UTF8String");
      v112 = strlen(v111);
      if (v112 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v113 = v112;
      if (v112 >= 0x17)
      {
        v115 = (v112 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v112 | 7) != 0x17)
          v115 = v112 | 7;
        v116 = v115 + 1;
        v114 = (std::string *)operator new(v115 + 1);
        v230.__r_.__value_.__l.__size_ = v113;
        v230.__r_.__value_.__r.__words[2] = v116 | 0x8000000000000000;
        v230.__r_.__value_.__r.__words[0] = (std::string::size_type)v114;
      }
      else
      {
        *((_BYTE *)&v230.__r_.__value_.__s + 23) = v112;
        v114 = &v230;
        if (!v112)
        {
LABEL_153:
          v114->__r_.__value_.__s.__data_[v113] = 0;
          v117 = *((_BYTE *)v229 + 611);
          v118 = v226;
          __dst = v232;
          if (*((_QWORD *)&v232 + 1))
          {
            v119 = (unint64_t *)(*((_QWORD *)&v232 + 1) + 8);
            do
              v120 = __ldxr(v119);
            while (__stxr(v120 + 1, v119));
          }
          v262 = 0;
          v121 = v118;
          v263 = v121;
          v264 = v231;
          if (*((_QWORD *)&v231 + 1))
          {
            v122 = (unint64_t *)(*((_QWORD *)&v231 + 1) + 8);
            do
              v123 = __ldxr(v122);
            while (__stxr(v123 + 1, v122));
          }
          v265 = 1;
          if (SHIBYTE(v230.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v266, v230.__r_.__value_.__l.__data_, v230.__r_.__value_.__l.__size_);
          else
            v266 = v230;
          LOBYTE(v267) = v117;

          if (!v101)
          {
            v125 = 0;
            v126 = 0;
            v127 = 0;
            __p[0] = 0;
            __p[1] = 0;
            v238 = 0;
            goto LABEL_173;
          }
          if (v102 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v102 >= 0x17)
          {
            v128 = (v102 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v102 | 7) != 0x17)
              v128 = v102 | 7;
            v129 = v128 + 1;
            v124 = operator new(v128 + 1);
            __p[1] = (void *)v102;
            v238 = v129 | 0x8000000000000000;
            __p[0] = v124;
          }
          else
          {
            HIBYTE(v238) = v102;
            v124 = __p;
            if (!v102)
              goto LABEL_172;
          }
          memmove(v124, v101, v102);
LABEL_172:
          *((_BYTE *)v124 + v102) = 0;
          v127 = HIBYTE(v238);
          v126 = (uint64_t *)__p[0];
          v125 = __p[1];
LABEL_173:
          if ((v127 & 0x80u) == 0)
            v130 = (uint64_t *)__p;
          else
            v130 = v126;
          if ((v127 & 0x80u) == 0)
            v131 = v127;
          else
            v131 = (unint64_t)v125;
          v132 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v270, v130, v131);
          v133 = v132;
          v134 = *((_QWORD *)v229 + 26);
          if (!v134)
            goto LABEL_230;
          v135 = (uint8x8_t)vcnt_s8((int8x8_t)v134);
          v135.i16[0] = vaddlv_u8(v135);
          if (v135.u32[0] > 1uLL)
          {
            v111 = (const char *)v132;
            if (v132 >= v134)
              v111 = (const char *)(v132 % v134);
          }
          else
          {
            v111 = (const char *)((v134 - 1) & v132);
          }
          v136 = *(void ***)(*v92 + 8 * (_QWORD)v111);
          if (!v136 || (v137 = (char *)*v136) == 0)
          {
LABEL_230:
            v137 = (char *)operator new(0x80uLL);
            v270 = v137;
            v271 = (char *)v229 + 216;
            *(_QWORD *)v137 = 0;
            *((_QWORD *)v137 + 1) = v133;
            *((_OWORD *)v137 + 1) = *(_OWORD *)__p;
            *((_QWORD *)v137 + 4) = v238;
            __p[0] = 0;
            __p[1] = 0;
            v238 = 0;
            *(_OWORD *)(v137 + 40) = 0u;
            *(_OWORD *)(v137 + 56) = 0u;
            *(_OWORD *)(v137 + 72) = 0u;
            *(_OWORD *)(v137 + 88) = 0u;
            *(_OWORD *)(v137 + 104) = 0u;
            *((_QWORD *)v137 + 15) = 0;
            v272 = 1;
            v150 = (float)(unint64_t)(*((_QWORD *)v229 + 28) + 1);
            v151 = *((float *)v229 + 58);
            if (v134 && (float)(v151 * (float)v134) >= v150)
            {
              v152 = *v92;
              v153 = *(_QWORD **)(*v92 + 8 * (_QWORD)v111);
              if (v153)
                goto LABEL_233;
LABEL_258:
              *(_QWORD *)v137 = *v224;
              *v224 = v137;
              *(_QWORD *)(v152 + 8 * (_QWORD)v111) = v224;
              if (*(_QWORD *)v137)
              {
                v162 = *(_QWORD *)(*(_QWORD *)v137 + 8);
                if ((v134 & (v134 - 1)) != 0)
                {
                  if (v162 >= v134)
                    v162 %= v134;
                }
                else
                {
                  v162 &= v134 - 1;
                }
                v153 = (_QWORD *)(*v92 + 8 * v162);
                goto LABEL_269;
              }
            }
            else
            {
              v154 = v134 < 3 || (v134 & (v134 - 1)) != 0;
              v155 = v154 | (2 * v134);
              v156 = vcvtps_u32_f32(v150 / v151);
              if (v155 <= v156)
                prime = v156;
              else
                prime = v155;
              if (prime == 1)
              {
                prime = 2;
              }
              else if ((prime & (prime - 1)) != 0)
              {
                prime = std::__next_prime(prime);
                v134 = *((_QWORD *)v229 + 26);
              }
              if (prime > v134)
                goto LABEL_245;
              if (prime < v134)
              {
                v158 = vcvtps_u32_f32((float)*((unint64_t *)v229 + 28) / *((float *)v229 + 58));
                if (v134 < 3
                  || (v159 = (uint8x8_t)vcnt_s8((int8x8_t)v134), v159.i16[0] = vaddlv_u8(v159), v159.u32[0] > 1uLL))
                {
                  v158 = std::__next_prime(v158);
                }
                else
                {
                  v160 = 1 << -(char)__clz(v158 - 1);
                  if (v158 >= 2)
                    v158 = v160;
                }
                if (prime <= v158)
                  prime = v158;
                if (prime < v134)
LABEL_245:
                  std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::__do_rehash<true>((uint64_t)v92, prime);
              }
              v134 = *((_QWORD *)v229 + 26);
              v161 = v134 - 1;
              if ((v134 & (v134 - 1)) != 0)
              {
                if (v133 >= v134)
                {
                  v111 = (const char *)(v133 % v134);
                  v152 = *v92;
                  v153 = *(_QWORD **)(*v92 + 8 * (v133 % v134));
                  if (!v153)
                    goto LABEL_258;
                }
                else
                {
                  v111 = (const char *)v133;
                  v152 = *v92;
                  v153 = *(_QWORD **)(*v92 + 8 * v133);
                  if (!v153)
                    goto LABEL_258;
                }
              }
              else
              {
                v111 = (const char *)(v161 & v133);
                v152 = *v92;
                v153 = *(_QWORD **)(*v92 + 8 * (v161 & v133));
                if (!v153)
                  goto LABEL_258;
              }
LABEL_233:
              *(_QWORD *)v137 = *v153;
LABEL_269:
              *v153 = v137;
            }
            ++*((_QWORD *)v229 + 28);
            v144 = v262;
            v262 = 0;
            v270 = v144;
            v145 = (mlir::Operation *)*((_QWORD *)v137 + 7);
            if (!v145)
              goto LABEL_272;
            goto LABEL_271;
          }
          if (v238 >= 0)
            v138 = (void *)HIBYTE(v238);
          else
            v138 = __p[1];
          if (v238 >= 0)
            v139 = __p;
          else
            v139 = (void **)__p[0];
          if (v135.u32[0] >= 2uLL)
          {
            while (1)
            {
              v140 = *((_QWORD *)v137 + 1);
              if (v140 == v133)
              {
                v141 = v137[39];
                if ((v141 & 0x80u) == 0)
                  v142 = v137[39];
                else
                  v142 = *((_QWORD *)v137 + 3);
                if ((void *)v142 == v138)
                {
                  if ((v141 & 0x80) != 0)
                  {
                    if (!memcmp(*((const void **)v137 + 2), v139, *((_QWORD *)v137 + 3)))
                    {
LABEL_210:
                      v17 = v210;
                      v144 = v262;
                      v262 = 0;
                      v270 = v144;
                      v145 = (mlir::Operation *)*((_QWORD *)v137 + 7);
                      if (!v145)
                        goto LABEL_272;
LABEL_271:
                      mlir::Operation::erase(v145);
                      goto LABEL_272;
                    }
                  }
                  else
                  {
                    if (!v137[39])
                      goto LABEL_210;
                    v143 = 0;
                    while (v137[v143 + 16] == *((_BYTE *)v139 + v143))
                    {
                      if (v141 == ++v143)
                        goto LABEL_210;
                    }
                  }
                }
              }
              else
              {
                if (v140 >= v134)
                  v140 %= v134;
                if ((const char *)v140 != v111)
                {
LABEL_228:
                  v17 = v210;
                  goto LABEL_230;
                }
              }
              v137 = *(char **)v137;
              if (!v137)
                goto LABEL_228;
            }
          }
          while (1)
          {
            v146 = *((_QWORD *)v137 + 1);
            if (v146 == v133)
            {
              v147 = v137[39];
              if ((v147 & 0x80u) == 0)
                v148 = v137[39];
              else
                v148 = *((_QWORD *)v137 + 3);
              if ((void *)v148 == v138)
              {
                if ((v147 & 0x80) != 0)
                {
                  if (!memcmp(*((const void **)v137 + 2), v139, *((_QWORD *)v137 + 3)))
                  {
LABEL_226:
                    v17 = v210;
                    v144 = v262;
                    v262 = 0;
                    v270 = v144;
                    v145 = (mlir::Operation *)*((_QWORD *)v137 + 7);
                    if (v145)
                      goto LABEL_271;
LABEL_272:
                    *((_QWORD *)v137 + 7) = v144;
                    objc_storeStrong((id *)v137 + 8, v263);
                    v163 = v264;
                    if (*((_QWORD *)&v264 + 1))
                    {
                      v164 = (unint64_t *)(*((_QWORD *)&v264 + 1) + 8);
                      do
                        v165 = __ldxr(v164);
                      while (__stxr(v165 + 1, v164));
                    }
                    v166 = (std::__shared_weak_count *)*((_QWORD *)v137 + 10);
                    *(_OWORD *)(v137 + 72) = v163;
                    if (!v166)
                      goto LABEL_279;
                    v167 = (unint64_t *)&v166->__shared_owners_;
                    do
                      v168 = __ldaxr(v167);
                    while (__stlxr(v168 - 1, v167));
                    if (!v168)
                    {
                      ((void (*)(std::__shared_weak_count *))v166->__on_zero_shared)(v166);
                      std::__shared_weak_count::__release_weak(v166);
                      v169 = *((_QWORD *)&__dst + 1);
                      v170 = __dst;
                      if (*((_QWORD *)&__dst + 1))
                        goto LABEL_280;
                    }
                    else
                    {
LABEL_279:
                      v169 = *((_QWORD *)&__dst + 1);
                      v170 = __dst;
                      if (*((_QWORD *)&__dst + 1))
                      {
LABEL_280:
                        v171 = (unint64_t *)(v169 + 8);
                        do
                          v172 = __ldxr(v171);
                        while (__stxr(v172 + 1, v171));
                      }
                    }
                    v173 = (std::__shared_weak_count *)*((_QWORD *)v137 + 6);
                    *((_QWORD *)v137 + 5) = v170;
                    *((_QWORD *)v137 + 6) = v169;
                    if (!v173)
                      goto LABEL_286;
                    v174 = (unint64_t *)&v173->__shared_owners_;
                    do
                      v175 = __ldaxr(v174);
                    while (__stlxr(v175 - 1, v174));
                    if (v175)
                    {
LABEL_286:
                      if ((SHIBYTE(v238) & 0x80000000) == 0)
                        goto LABEL_287;
LABEL_293:
                      operator delete(__p[0]);
                      if (SHIBYTE(v266.__r_.__value_.__r.__words[2]) < 0)
                        goto LABEL_294;
LABEL_288:
                      v176 = (std::__shared_weak_count *)*((_QWORD *)&v264 + 1);
                      if (!*((_QWORD *)&v264 + 1))
                        goto LABEL_299;
LABEL_295:
                      v177 = (unint64_t *)&v176->__shared_owners_;
                      do
                        v178 = __ldaxr(v177);
                      while (__stlxr(v178 - 1, v177));
                      if (!v178)
                      {
                        ((void (*)(std::__shared_weak_count *))v176->__on_zero_shared)(v176);
                        std::__shared_weak_count::__release_weak(v176);
                      }
                      goto LABEL_299;
                    }
                    ((void (*)(std::__shared_weak_count *))v173->__on_zero_shared)(v173);
                    std::__shared_weak_count::__release_weak(v173);
                    if (SHIBYTE(v238) < 0)
                      goto LABEL_293;
LABEL_287:
                    if ((SHIBYTE(v266.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      goto LABEL_288;
LABEL_294:
                    operator delete(v266.__r_.__value_.__l.__data_);
                    v176 = (std::__shared_weak_count *)*((_QWORD *)&v264 + 1);
                    if (*((_QWORD *)&v264 + 1))
                      goto LABEL_295;
LABEL_299:

                    if (v262)
                      mlir::Operation::erase(v262);
                    v179 = (std::__shared_weak_count *)*((_QWORD *)&__dst + 1);
                    if (!*((_QWORD *)&__dst + 1))
                      goto LABEL_305;
                    v180 = (unint64_t *)(*((_QWORD *)&__dst + 1) + 8);
                    do
                      v181 = __ldaxr(v180);
                    while (__stlxr(v181 - 1, v180));
                    if (!v181)
                    {
                      ((void (*)(std::__shared_weak_count *))v179->__on_zero_shared)(v179);
                      std::__shared_weak_count::__release_weak(v179);
                      if (SHIBYTE(v230.__r_.__value_.__r.__words[2]) < 0)
                        goto LABEL_309;
LABEL_306:
                      v182 = (std::__shared_weak_count *)*((_QWORD *)&v231 + 1);
                      if (!*((_QWORD *)&v231 + 1))
                        goto LABEL_313;
LABEL_310:
                      v183 = (unint64_t *)&v182->__shared_owners_;
                      do
                        v184 = __ldaxr(v183);
                      while (__stlxr(v184 - 1, v183));
                      if (v184)
                        goto LABEL_313;
                      ((void (*)(std::__shared_weak_count *))v182->__on_zero_shared)(v182);
                      std::__shared_weak_count::__release_weak(v182);
                      v185 = (std::__shared_weak_count *)*((_QWORD *)&v232 + 1);
                      if (*((_QWORD *)&v232 + 1))
                      {
LABEL_314:
                        v186 = (unint64_t *)&v185->__shared_owners_;
                        do
                          v187 = __ldaxr(v186);
                        while (__stlxr(v187 - 1, v186));
                        if (!v187)
                        {
                          ((void (*)(std::__shared_weak_count *))v185->__on_zero_shared)(v185);
                          std::__shared_weak_count::__release_weak(v185);
                        }
                      }
                    }
                    else
                    {
LABEL_305:
                      if ((SHIBYTE(v230.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                        goto LABEL_306;
LABEL_309:
                      operator delete(v230.__r_.__value_.__l.__data_);
                      v182 = (std::__shared_weak_count *)*((_QWORD *)&v231 + 1);
                      if (*((_QWORD *)&v231 + 1))
                        goto LABEL_310;
LABEL_313:
                      v185 = (std::__shared_weak_count *)*((_QWORD *)&v232 + 1);
                      if (*((_QWORD *)&v232 + 1))
                        goto LABEL_314;
                    }
                    v188 = (std::__shared_weak_count *)*((_QWORD *)&v259 + 1);
                    if (*((_QWORD *)&v259 + 1))
                    {
                      v189 = (unint64_t *)(*((_QWORD *)&v259 + 1) + 8);
                      do
                        v190 = __ldaxr(v189);
                      while (__stlxr(v190 - 1, v189));
                      if (!v190)
                      {
                        ((void (*)(std::__shared_weak_count *))v188->__on_zero_shared)(v188);
                        std::__shared_weak_count::__release_weak(v188);
                      }
                    }

                    if (++v98 == v219)
                    {
                      v97 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v233, v260, 16);
                      if (!v97)
                        goto LABEL_326;
                      goto LABEL_133;
                    }
                    goto LABEL_134;
                  }
                }
                else
                {
                  if (!v137[39])
                    goto LABEL_226;
                  v149 = 0;
                  while (v137[v149 + 16] == *((_BYTE *)v139 + v149))
                  {
                    if (v147 == ++v149)
                      goto LABEL_226;
                  }
                }
              }
            }
            else if ((const char *)(v146 & (v134 - 1)) != v111)
            {
              goto LABEL_229;
            }
            v137 = *(char **)v137;
            if (!v137)
            {
LABEL_229:
              v17 = v210;
              goto LABEL_230;
            }
          }
        }
      }
      memmove(v114, v111, v113);
      goto LABEL_153;
    }
    if (a5)
    {
      v194 = (void *)MEMORY[0x1E0CB35C8];
      v283 = *MEMORY[0x1E0CB2D50];
      v195 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v228, "absoluteString", 0);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      getMPSGraphPackageVersionString();
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "stringWithFormat:", CFSTR("Error: No valid MPSGraph Package Version found in .mpsgraphpackage with URL: %@ \nThis OS supports MPSGraph Package Version up to %@"), v202, v201);
      v211 = (id)objc_claimAutoreleasedReturnValue();
      v284[0] = v211;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v284, &v283, 1);
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mps"), -20);
      v191 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_340;
    }
    v191 = 0;
LABEL_341:

  }
  else
  {
    v191 = 0;
  }

  return v191;
}

- (MPSGraphExecutable)initWithMPSGraphPackageAtURL:(NSURL *)mpsgraphPackageURL compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  NSURL *v6;
  MPSGraphCompilationDescriptor *v7;
  MPSGraphExecutable *v8;
  MPSGraphExecutable *v9;
  id v10;
  void *v11;
  void *v13;
  id v14;
  objc_super v15;

  v6 = mpsgraphPackageURL;
  v7 = compilationDescriptor;
  v15.receiver = self;
  v15.super_class = (Class)MPSGraphExecutable;
  v8 = -[MPSGraphExecutable init](&v15, sel_init);
  if (v8)
  {
    v14 = 0;
    v9 = -[MPSGraphExecutable initWithMPSGraphPackageAtURLCommon:compilationDescriptor:error:](v8, "initWithMPSGraphPackageAtURLCommon:compilationDescriptor:error:", v6, v7, &v14);
    v10 = v14;
    v11 = v10;
    if (!v9)
    {
      if (v10)
      {
        objc_msgSend(v10, "localizedDescription");

        if (MTLReportFailureTypeEnabled())
        {
          objc_msgSend(v11, "localizedDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          MTLReportFailure();

        }
      }
      else if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (MPSGraphExecutable)executableWithMPSGraphPackageAtURL:(id)a3 compilationDescriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MPSGraphExecutable *v9;

  v7 = a3;
  v8 = a4;
  v9 = -[MPSGraphExecutable initWithMPSGraphPackageAtURLCommon:compilationDescriptor:error:]([MPSGraphExecutable alloc], "initWithMPSGraphPackageAtURLCommon:compilationDescriptor:error:", v7, v8, a5);

  return v9;
}

- (ReturnOp)returnOpForFunctionInModule:(ModuleOp)a3
{
  FuncOp v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  mlir::GenericProgramPoint **v7;
  uint64_t v8;
  uint64_t v9;

  v3.var0 = (Operation *)-[MPSGraphExecutable getEntryFuncOpForModule:](self, "getEntryFuncOpForModule:", a3.state);
  if (!v3.var0 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v4 = *((unsigned int *)v3.var0 + 11);
  if ((v4 & 0x7FFFFF) == 0)
    __assert_rtn("getRegion", "Operation.h", 666, "index < numRegions && \"invalid region index\");
  v5 = (unint64_t)v3.var0 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 >= 0xFFFFFFFFFFFFFFF9)
    __assert_rtn("alignAddr", "Alignment.h", 191, "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\");
  v6 = *(_QWORD *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *((unsigned int *)v3.var0 + 10) + 8);
  if (v6)
    v7 = (mlir::GenericProgramPoint **)(v6 - 8);
  else
    v7 = 0;
  mlir::Block::getTerminator(v7);
  if (!v8
    || (v9 = llvm::DefaultDoCastIfPossible<mlir::func::ReturnOp,mlir::Operation *,llvm::CastInfo<mlir::func::ReturnOp,mlir::Operation *,void>>::doCastIfPossible(v8)) == 0)
  {
    if (MTLReportFailureTypeEnabled())
      MTLReportFailure();
    return (ReturnOp)0;
  }
  return (ReturnOp)v9;
}

+ (id)executablesWithMLIRSourceForMultipleModules:(id)a3 executableDescriptor:(id)a4 regionNames:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  char *v12;
  __n128 *v13;
  __n128 *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  mlir::GenericProgramPoint *v21;
  mlir::GenericProgramPoint *v22;
  mlir::GenericProgramPoint *v23;
  mlir::ForwardIterator *v24;
  id v25;
  const char *v26;
  int v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  mlir::Operation *v31;
  uint64_t *v32;
  __n128 *v33;
  unint64_t v34;
  mlir::MLIRContext *v35[2];
  char *v36;
  id v37;
  id v38;
  id v39;
  __int128 *v40;
  __n128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  id *v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39 = a4;
  v38 = a5;
  v37 = (id)objc_opt_new();
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  v9 = (uint64_t)v8;
  if (v8)
    v10 = strlen(v8);
  else
    v10 = 0;
  llvm::MemoryBuffer::getMemBuffer(v9, v10, (uint64_t)"", 0, &v36);
  v11 = operator new(0x20uLL);
  *((_QWORD *)v11 + 2) = 0;
  *(_QWORD *)v11 = &unk_1E0E51DD8;
  *((_QWORD *)v11 + 1) = 0;
  v35[0] = (mlir::MLIRContext *)mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v11 + 3, 0);
  v35[1] = (mlir::MLIRContext *)v11;
  loadCommonMPSDialectsInContext(v35[0]);
  mlir::MLIRContext::allowUnregisteredDialects((uint64_t)v35[0], 1);
  llvm::SourceMgr::SourceMgr((llvm::SourceMgr *)&v32);
  v12 = v36;
  v36 = 0;
  v42 = 0;
  v41 = (__n128)(unint64_t)v12;
  v13 = v33;
  if ((unint64_t)v33 >= v34)
  {
    v14 = std::vector<llvm::SourceMgr::SrcBuffer>::__push_back_slow_path<llvm::SourceMgr::SrcBuffer>((__n128 **)&v32, &v41);
  }
  else
  {
    llvm::SourceMgr::SrcBuffer::SrcBuffer(v33, &v41);
    v14 = (__n128 *)((char *)v13 + 24);
  }
  v33 = v14;
  llvm::SourceMgr::SrcBuffer::~SrcBuffer((llvm::SourceMgr::SrcBuffer *)&v41);
  mlir::ParserConfig::ParserConfig((mlir::ParserConfig *)&v41, v35[0], 1, 0);
  v40 = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = (id *)&v45;
  v46 = (id *)&v45;
  v48 = 0;
  v49 = 0;
  v47 = 0;
  if (mlir::parseSourceFile(&v32, (uint64_t)&v43, (uint64_t ***)&v41, (uint64_t *)&v40))
  {
    if (!v40)
      __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
    mlir::detail::constructContainerOpForParserIfNecessary<mlir::ModuleOp>((uint64_t)&v43, (mlir::StringAttr *)v41.n128_u64[0], (uint64_t)v40, &v31);
  }
  else
  {
    v31 = 0;
  }
  mlir::Block::~Block((mlir::Block *)&v43);
  v15 = operator new();
  *(mlir::MLIRContext **)v15 = v35[0];
  *(_QWORD *)(v15 + 8) = 0;
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  v30 = v15;
  v16 = *((unsigned int *)v31 + 11);
  if ((v16 & 0x7FFFFF) != 0)
  {
    v17 = (char *)v31 + 16 * ((v16 >> 23) & 1) + ((v16 >> 21) & 0x7F8) + 64;
    if ((unint64_t)v17 > 0xFFFFFFFFFFFFFFF8)
    {
      v26 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
      v27 = 191;
      v28 = "Alignment.h";
      v29 = "alignAddr";
    }
    else
    {
      v18 = (_QWORD *)(((unint64_t)(v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *((unsigned int *)v31 + 10));
      if ((_QWORD *)*v18 != v18)
      {
        v19 = v18[1];
        if (v19)
          v20 = v19 - 8;
        else
          v20 = 0;
        *(_QWORD *)&v43 = &v30;
        *((_QWORD *)&v43 + 1) = &v31;
        *(_QWORD *)&v44 = &v38;
        *((_QWORD *)&v44 + 1) = v35;
        v45 = &v39;
        v46 = &v37;
        v21 = (mlir::GenericProgramPoint *)(v20 + 32);
        v22 = *(mlir::GenericProgramPoint **)(v20 + 40);
        if (v22 == v21)
          goto LABEL_20;
        do
        {
          v23 = (mlir::GenericProgramPoint *)*((_QWORD *)v22 + 1);
          mlir::GenericProgramPoint::~GenericProgramPoint(v22);
          v40 = &v43;
          mlir::detail::walk<mlir::ForwardIterator>(v24, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ99__MPSGraphExecutable_executablesWithMLIRSourceForMultipleModules_executableDescriptor_regionNames__E3__2NS1_4mpsx5GPUOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v40, 1);
          v22 = v23;
        }
        while (v23 != v21);
        if (v30)
LABEL_20:
          MEMORY[0x186DA1680]();
        v25 = v37;
        if (v31)
          mlir::Operation::erase(v31);
        mlir::ParserConfig::~ParserConfig((mlir::ParserConfig *)&v41);
      }
      v26 = "!region.empty() && \"unexpected empty region\";
      v27 = 895;
      v28 = "OpDefinition.h";
      v29 = "getBody";
    }
  }
  else
  {
    v26 = "index < numRegions && \"invalid region index\";
    v27 = 666;
    v28 = "Operation.h";
    v29 = "getRegion";
  }
  __assert_rtn(v29, v28, v27, v26);
}

- (void)setSpecializationCountMax:(unint64_t)a3
{
  *((_QWORD *)self + 79) = a3;
}

- (BOOL)isExecutableForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5 compilationDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  char v22;
  int v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  char v28;
  int v29;
  int v30;
  char v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  char v41;
  uint64_t v42;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v12, "count");
  if (v14 == objc_msgSend(*((id *)self + 63), "count"))
  {
    v15 = objc_msgSend(v11, "count");
    if (v15 == objc_msgSend(*((id *)self + 62), "count"))
    {
      v16 = objc_msgSend(v10, "count");
      if (v16 == objc_msgSend(*((id *)self + 65), "count"))
      {
        v53 = 0;
        v54 = &v53;
        v55 = 0x2020000000;
        v17 = (void *)*((_QWORD *)self + 63);
        v18 = MEMORY[0x1E0C809B0];
        v56 = 1;
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke;
        v50[3] = &unk_1E0E76F60;
        v52 = &v53;
        v51 = v12;
        objc_msgSend(v17, "enumerateObjectsUsingBlock:", v50);
        v19 = (void *)*((_QWORD *)self + 62);
        v47[0] = v18;
        v47[1] = 3221225472;
        v47[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_2;
        v47[3] = &unk_1E0E76F88;
        v49 = &v53;
        v48 = v11;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v47);
        v20 = (void *)*((_QWORD *)self + 65);
        v44[0] = v18;
        v44[1] = 3221225472;
        v44[2] = __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_3;
        v44[3] = &unk_1E0E76FB0;
        v45 = v10;
        v46 = &v53;
        objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v44);
        if ((_BYTE)word_1EDC0A159)
        {
          v21 = v54;
          if (*((_BYTE *)v54 + 24))
          {
            v22 = objc_msgSend(*((id *)self + 17), "isEqualTo:", v13);
LABEL_7:
            v21 = v54;
LABEL_52:
            *((_BYTE *)v21 + 24) = v22;

            _Block_object_dispose(&v53, 8);
            goto LABEL_9;
          }
          goto LABEL_45;
        }
        v21 = v54;
        v24 = *((unsigned __int8 *)v54 + 24);
        if (!HIBYTE(word_1EDC0A159))
        {
          if (*((_BYTE *)v54 + 24))
          {
            v25 = objc_msgSend(v13, "compilerOptions");
            v24 = v25 == objc_msgSend(*((id *)self + 17), "compilerOptions");
            v21 = v54;
          }
          *((_BYTE *)v21 + 24) = v24;
        }
        if (v24)
        {
          v26 = objc_msgSend(v13, "aneCompilerSpatialSplitting");
          v27 = v26 != objc_msgSend(*((id *)self + 17), "aneCompilerSpatialSplitting") && byte_1EDC0A179 == 0;
          v28 = !v27;
          v21 = v54;
          *((_BYTE *)v54 + 24) = v28;
          if (!v27)
          {
            v29 = objc_msgSend(v13, "enableANEFWToFWSignal");
            v30 = v29 ^ objc_msgSend(*((id *)self + 17), "enableANEFWToFWSignal") ^ 1;
            if (byte_1EDC0A188)
              v31 = 1;
            else
              v31 = v30;
            v21 = v54;
            *((_BYTE *)v54 + 24) = v31;
            if ((v31 & 1) != 0)
            {
              v32 = objc_msgSend(v13, "enableANELateLatch");
              v33 = v32 ^ objc_msgSend(*((id *)self + 17), "enableANELateLatch") ^ 1;
              if (byte_1EDC0A18A)
                v34 = 1;
              else
                v34 = v33;
              v21 = v54;
              *((_BYTE *)v54 + 24) = v34;
              if (v34 == 1)
              {
                objc_msgSend(v13, "entryFunctionName");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*((id *)self + 17), "entryFunctionName");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *((_BYTE *)v54 + 24) = v35 == v36;

                v21 = v54;
                if (*((_BYTE *)v54 + 24))
                {
                  objc_msgSend(v13, "callables");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*((id *)self + 17), "callables");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *((_BYTE *)v54 + 24) = v37 == v38;

                  v21 = v54;
                  if (*((_BYTE *)v54 + 24))
                  {
                    v39 = objc_msgSend(v13, "minimumNumberOfOpsInParallelRegion");
                    v40 = v39 != objc_msgSend(*((id *)self + 17), "minimumNumberOfOpsInParallelRegion")
                       && byte_1EDC0A1B9 == 0;
                    v41 = !v40;
                    v21 = v54;
                    *((_BYTE *)v54 + 24) = v41;
                    if (!v40)
                    {
                      v42 = objc_msgSend(v13, "maximumNumberOfParallelEncodingRegions");
                      v22 = v42 == objc_msgSend(*((id *)self + 17), "maximumNumberOfParallelEncodingRegions")
                         || byte_1EDC0A1C8 != 0;
                      goto LABEL_7;
                    }
LABEL_45:
                    v22 = 0;
                    goto LABEL_52;
                  }
LABEL_51:
                  v22 = 0;
                  *((_BYTE *)v21 + 24) = 0;
                  goto LABEL_52;
                }
LABEL_50:
                *((_BYTE *)v21 + 24) = 0;
                goto LABEL_51;
              }
LABEL_49:
              *((_BYTE *)v21 + 24) = 0;
              goto LABEL_50;
            }
LABEL_48:
            *((_BYTE *)v21 + 24) = 0;
            goto LABEL_49;
          }
        }
        else
        {
          *((_BYTE *)v21 + 24) = 0;
        }
        *((_BYTE *)v21 + 24) = 0;
        goto LABEL_48;
      }
    }
  }
  v22 = 0;
LABEL_9:

  return v22;
}

void __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v6 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v3 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 0;
  }

}

void __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v6 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
    v3 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 0;
  }

}

void __96__MPSGraphExecutable_isExecutableForFeeds_targetTensors_targetOperations_compilationDescriptor___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    v9 = objc_msgSend(v6, "isEqualTo:", v5);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v9 = 0;
  }
  *(_BYTE *)(v8 + 24) = v9;

}

- (id)getOperationsToVisitForOperation:(id)a3 visitedOperations:(id)a4
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5[5];
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = *(void **)(v8 + 8);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke;
    v26[3] = &unk_1E0E76FD8;
    v27 = v6;
    v28 = v7;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v26);

  }
  objc_msgSend(v5, "inputTensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_2;
  v23[3] = &unk_1E0E76E20;
  v12 = v6;
  v24 = v12;
  v13 = v7;
  v25 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v23);

  objc_msgSend(v5, "controlDependencies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_3;
  v20[3] = &unk_1E0E77000;
  v15 = v12;
  v21 = v15;
  v16 = v13;
  v22 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);

  v17 = v22;
  v18 = v16;

  return v18;
}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v4 = *(id *)(a2 + 8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "operation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __73__MPSGraphExecutable_getOperationsToVisitForOperation_visitedOperations___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (OwningOpRef<mlir::ModuleOp>)cloneForFeeds:(id)a3 targetTensors:(id)a4 targetOperations:(id)a5
{
  mlir::ForwardIterator **v5;
  id v9;
  MPSGraphExecutable *v10;
  uint64_t **v11;
  mlir::Operation **WeakRetained;
  mlir::GenericProgramPoint *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  uint64_t i;
  void *v19;
  mlir::MLIRContext **v20;
  void *v21;
  mlir::MLIRContext *v22;
  id v23;
  mlir::MLIRContext *v24;
  id v25;
  uint64_t MLIRElementType;
  uint64_t **MLIRType;
  char *v28;
  int64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _BYTE *v34;
  uint64_t ***v35;
  uint64_t v36;
  int64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t **v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD *v44;
  char *v45;
  uint64_t v46;
  __int128 v47;
  unsigned int *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  mlir::Block *v52;
  mlir::StringAttr **v53;
  uint64_t StringAttr;
  uint64_t v55;
  MPSGraphExecutable *v56;
  unint64_t v57;
  char *v58;
  void *v59;
  int v60;
  int v61;
  uint64_t v62;
  _BYTE *v63;
  _BYTE *v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _BYTE *v70;
  char *v71;
  int64_t v72;
  unint64_t v73;
  _QWORD *v74;
  char *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  __int128 *v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t j;
  void *v89;
  void *v90;
  uint64_t *v91;
  int v92;
  int v93;
  uint64_t *v94;
  BOOL v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  unint64_t *v101;
  unint64_t *v102;
  unint64_t v103;
  unint64_t *v104;
  int64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  _BYTE *v110;
  unint64_t *v111;
  int64_t v112;
  unint64_t v113;
  unint64_t *v114;
  unint64_t v115;
  unint64_t *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _OWORD *v120;
  unint64_t *v121;
  uint64_t v122;
  __int128 v123;
  mlir::MLIRContext **v124;
  unint64_t ArgumentTypes;
  unint64_t v126;
  uint64_t FunctionType;
  mlir::mps *v128;
  uint64_t InterfaceFor;
  const char *v130;
  int v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
  id *v135;
  void *v136;
  void *v137;
  unint64_t v138;
  unint64_t k;
  void *v140;
  _QWORD *v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint8x8_t v149;
  _QWORD *v150;
  _QWORD *v151;
  unint64_t v152;
  uint64_t v153;
  _QWORD *v154;
  float v155;
  uint64_t v156;
  _QWORD *v157;
  _BOOL8 v158;
  unint64_t v159;
  unint64_t v160;
  size_t prime;
  void *v162;
  void *v163;
  uint64_t v164;
  _QWORD **v165;
  size_t v166;
  size_t v167;
  size_t v168;
  _QWORD *n;
  size_t v170;
  uint64_t v171;
  unint64_t v172;
  uint8x8_t v173;
  uint64_t v174;
  _QWORD *v175;
  void *v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  size_t v180;
  void *v181;
  id *v182;
  unint64_t v183;
  unint64_t v184;
  char *v185;
  id *v186;
  unint64_t v187;
  unint64_t v188;
  char *v189;
  _QWORD *v190;
  mlir::ForwardIterator *v191;
  mlir::Operation *v192;
  void *v193;
  void *v194;
  unint64_t v195;
  unint64_t v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t *v199;
  uint64_t **v200;
  uint64_t **v201;
  unint64_t v202;
  uint64_t *v203;
  unint64_t m;
  unint64_t v205;
  unint64_t v206;
  unint64_t v207;
  unint64_t v208;
  uint8x8_t v209;
  unint64_t v210;
  _QWORD *v211;
  _QWORD *v212;
  unint64_t v213;
  uint64_t v214;
  _QWORD *v215;
  _QWORD *v216;
  void *v217;
  const char *v218;
  int v219;
  const char *v220;
  const char *v221;
  _QWORD *AttrData;
  uint64_t v223;
  mlir::ForwardIterator **v225;
  mlir::ForwardIterator *v226;
  id *location;
  id v228;
  id v229;
  id obj;
  uint64_t v231;
  uint64_t v232;
  MPSGraphExecutable *v233;
  void ***v234;
  uint64_t *v235;
  uint64_t v236;
  void **v237;
  void *v238;
  unint64_t v239;
  char *v240;
  void *v241;
  unint64_t v242;
  char *v243;
  _QWORD **v244;
  _QWORD *v245[2];
  void *v246;
  unint64_t *v247;
  unint64_t *v248;
  mlir::mps *v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  llvm *v254[2];
  unsigned int v255;
  llvm *v256;
  uint64_t v257;
  int v258;
  llvm *v259;
  uint64_t v260;
  unsigned int v261;
  void *v262;
  char *v263;
  char *v264;
  __int16 v265;
  void *__p;
  char *v267;
  const char *v268;
  uint64_t v269;
  __int16 v270;
  unint64_t v271[2];
  unint64_t v272[2];
  _BYTE v273[128];
  __int128 v274;
  __int128 v275;
  float v276;
  uint64_t v277;

  v225 = v5;
  v277 = *MEMORY[0x1E0C80C00];
  a3;
  v9 = a4;
  v10 = self;
  v229 = v9;
  v228 = a5;
  v254[0] = 0;
  v254[1] = 0;
  v255 = 0;
  v256 = 0;
  v257 = 0;
  v258 = 0;
  v259 = 0;
  v260 = 0;
  v261 = 0;
  v11 = (uint64_t **)*((_QWORD *)self + 4);
  location = (id *)((char *)self + 8);
  WeakRetained = (mlir::Operation **)objc_loadWeakRetained((id *)self + 1);
  v13 = mlir::OpBuilder::clone(v11, WeakRetained[8], (mlir::IRMapping *)v254);
  v14 = *((_QWORD *)v13 + 6);
  v15 = *(void **)(v14 + 16);
  if (v15 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    *(_QWORD *)&v274 = *(_QWORD *)(v14 + 8);
    AttrData = (_QWORD *)mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&v274);
    if (v223 == 14 && *AttrData == 0x2E6E69746C697562 && *(_QWORD *)((char *)AttrData + 6) == 0x656C75646F6D2E6ELL)
    {
      v270 = 1283;
      __p = "classof on '";
      v268 = "builtin.module";
      v269 = 14;
      v262 = "' failed due to the operation not being registered";
      v265 = 259;
      llvm::operator+((uint64_t *)&__p, (uint64_t *)&v262, (uint64_t)&v274);
      llvm::report_fatal_error((llvm::Twine *)&v274, 1);
    }
  }
  else
  {
    v226 = v13;
    if (v15 == &mlir::detail::TypeIDResolver<mlir::ModuleOp,void>::id)
    {

      __p = 0;
      v267 = 0;
      v268 = 0;
      v250 = 0u;
      v251 = 0u;
      v252 = 0u;
      v253 = 0u;
      obj = *((id *)self + 64);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v250, v273, 16);
      v233 = self;
      if (!v16)
        goto LABEL_38;
      v17 = 0;
      v231 = *(_QWORD *)v251;
      while (1)
      {
        v232 = v16;
        for (i = 0; i != v232; ++i)
        {
          if (*(_QWORD *)v251 != v231)
            objc_enumerationMutation(obj);
          objc_msgSend(*((id *)v10 + 65), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v250 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (mlir::MLIRContext **)*((_QWORD *)v10 + 4);
          objc_msgSend(v19, "shape");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (mlir::MLIRContext *)objc_msgSend(v19, "dataType");
          v23 = v21;
          v24 = *v20;
          v25 = v23;
          MLIRElementType = getMLIRElementType(v24, v22);
          MLIRType = getMLIRType(v25, MLIRElementType);

          v10 = v233;
          if (v17 < v268)
          {
            *(_QWORD *)v17 = MLIRType;
            v17 += 8;
            goto LABEL_25;
          }
          v28 = (char *)__p;
          v29 = v17 - (_BYTE *)__p;
          v30 = (v17 - (_BYTE *)__p) >> 3;
          v31 = v30 + 1;
          if ((unint64_t)(v30 + 1) >> 61)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v32 = v268 - (_BYTE *)__p;
          if ((v268 - (_BYTE *)__p) >> 2 > v31)
            v31 = v32 >> 2;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8)
            v33 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v33 = v31;
          if (v33)
          {
            if (v33 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v34 = operator new(8 * v33);
            v35 = (uint64_t ***)&v34[8 * v30];
            *v35 = MLIRType;
            v36 = (uint64_t)(v35 + 1);
            v37 = v17 - v28;
            if (v17 == v28)
            {
LABEL_28:
              v10 = v233;
              __p = v35;
              v267 = (char *)v36;
              v268 = &v34[8 * v33];
              if (!v17)
                goto LABEL_24;
LABEL_23:
              operator delete(v17);
              goto LABEL_24;
            }
          }
          else
          {
            v34 = 0;
            v35 = (uint64_t ***)(8 * v30);
            *(_QWORD *)(8 * v30) = MLIRType;
            v36 = 8 * v30 + 8;
            v37 = v17 - v28;
            if (v17 == v28)
              goto LABEL_28;
          }
          v38 = v37 - 8;
          if (v38 < 0x168
            || (v41 = (v17 - 8 - v28) & 0xFFFFFFFFFFFFFFF8, &v34[v29 - 8 - v41] > &v34[v29 - 8])
            || &v17[-v41 - 8] > v17 - 8
            || (unint64_t)(v17 - v34 - v29) < 0x20)
          {
            v39 = v17;
            v10 = v233;
            do
            {
LABEL_21:
              v40 = (uint64_t **)*((_QWORD *)v39 - 1);
              v39 -= 8;
              *--v35 = v40;
            }
            while (v39 != v28);
            goto LABEL_22;
          }
          v42 = (v38 >> 3) + 1;
          v43 = 8 * (v42 & 0x3FFFFFFFFFFFFFFCLL);
          v39 = &v17[-v43];
          v35 = (uint64_t ***)((char *)v35 - v43);
          v44 = &v34[v29 - 16];
          v45 = v17 - 16;
          v46 = v42 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v47 = *(_OWORD *)v45;
            *(v44 - 1) = *((_OWORD *)v45 - 1);
            *v44 = v47;
            v44 -= 2;
            v45 -= 32;
            v46 -= 4;
          }
          while (v46);
          v10 = v233;
          if (v42 != (v42 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_21;
LABEL_22:
          v17 = (char *)__p;
          __p = v35;
          v267 = (char *)v36;
          v268 = &v34[8 * v33];
          if (v17)
            goto LABEL_23;
LABEL_24:
          v17 = (char *)v36;
LABEL_25:
          v267 = v17;

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v250, v273, 16);
        if (!v16)
        {
LABEL_38:

          v48 = -[MPSGraphExecutable getEntryFuncOpForModule:](v10, "getEntryFuncOpForModule:", v226);
          v249 = (mlir::mps *)v48;
          if (!v48)
            __assert_rtn("-[MPSGraphExecutable cloneForFeeds:targetTensors:targetOperations:]", "MPSGraphExecutable.mm", 1884, "function");
          v49 = v48[11];
          if ((v49 & 0x7FFFFF) != 0)
          {
            v50 = (unint64_t)&v48[4 * ((v49 >> 23) & 1) + 16] + ((v49 >> 21) & 0x7F8);
            if (v50 < 0xFFFFFFFFFFFFFFF9)
            {
              v51 = *(_QWORD *)(((v50 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v48[10] + 8);
              if (v51)
                v52 = (mlir::Block *)(v51 - 8);
              else
                v52 = 0;
              v53 = (mlir::StringAttr **)*((_QWORD *)v10 + 4);
              mpsFileLoc("-[MPSGraphExecutable cloneForFeeds:targetTensors:targetOperations:]", "/Library/Caches/com.apple.xbs/Sources/MetalPerformanceShadersGraph/mpsgraph/MetalPerformanceShadersGraph/Core/Files/MPSGraphExecutable.mm", &v262);
              LOWORD(v276) = 260;
              *(_QWORD *)&v274 = &v262;
              StringAttr = mlir::Builder::getStringAttr(v53, (mlir::MLIRContext *)&v274);
              v55 = mlir::FileLineColLoc::get(StringAttr, 0x760u, 0);
              v56 = v233;
              if (!v55)
                __assert_rtn("Location", "Location.h", 66, "loc && \"location should never be null.\");
              if (SHIBYTE(v264) < 0)
                operator delete(v262);
              v57 = 0;
              v262 = 0;
              v263 = 0;
              v264 = 0;
              while (2)
              {
                if (v57 < objc_msgSend(v229, "count"))
                {
                  objc_msgSend(v229, "objectAtIndexedSubscript:", v57);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v246 = (void *)objc_msgSend(v59, "value");
                  *(_QWORD *)&v274 = 0;
                  v60 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v254, (unint64_t *)&v246, &v274);
                  if ((llvm *)v274 == (llvm *)((char *)v254[0] + 16 * v255))
                    v61 = 0;
                  else
                    v61 = v60;
                  if (v61 == 1)
                    v62 = *(_QWORD *)(v274 + 8);
                  else
                    v62 = 0;
                  v56 = v233;

                  v63 = v263;
                  if (v263 < v264)
                  {
                    *(_QWORD *)v263 = v62;
                    v58 = v63 + 8;
                    goto LABEL_49;
                  }
                  v64 = v262;
                  v65 = v263 - (_BYTE *)v262;
                  v66 = (v263 - (_BYTE *)v262) >> 3;
                  v67 = v66 + 1;
                  if ((unint64_t)(v66 + 1) >> 61)
                    std::vector<long>::__throw_length_error[abi:ne180100]();
                  v68 = v264 - (_BYTE *)v262;
                  if ((v264 - (_BYTE *)v262) >> 2 > v67)
                    v67 = v68 >> 2;
                  if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8)
                    v69 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v69 = v67;
                  if (v69)
                  {
                    if (v69 >> 61)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v70 = operator new(8 * v69);
                    v71 = &v70[8 * v66];
                    *(_QWORD *)v71 = v62;
                    v58 = v71 + 8;
                    v72 = v63 - v64;
                    if (v63 != v64)
                    {
LABEL_67:
                      v73 = v72 - 8;
                      if (v73 < 0x58)
                      {
                        v56 = v233;
                        goto LABEL_76;
                      }
                      v75 = &v70[v65];
                      v76 = v63 - &v70[v65];
                      v56 = v233;
                      if (v76 < 0x20)
                        goto LABEL_341;
                      v77 = (v73 >> 3) + 1;
                      v78 = 8 * (v77 & 0x3FFFFFFFFFFFFFFCLL);
                      v79 = &v63[-v78];
                      v71 -= v78;
                      v80 = v75 - 16;
                      v81 = (__int128 *)(v63 - 16);
                      v82 = v77 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        v83 = *v81;
                        *((_OWORD *)v80 - 1) = *(v81 - 1);
                        *(_OWORD *)v80 = v83;
                        v80 -= 32;
                        v81 -= 2;
                        v82 -= 4;
                      }
                      while (v82);
                      v63 = v79;
                      if (v77 != (v77 & 0x3FFFFFFFFFFFFFFCLL))
                      {
LABEL_341:
                        do
                        {
LABEL_76:
                          v84 = *((_QWORD *)v63 - 1);
                          v63 -= 8;
                          *((_QWORD *)v71 - 1) = v84;
                          v71 -= 8;
                        }
                        while (v63 != v64);
                      }
                      v63 = v262;
                      v262 = v71;
                      v263 = v58;
                      v264 = &v70[8 * v69];
                      if (v63)
LABEL_78:
                        operator delete(v63);
LABEL_49:
                      v263 = v58;
                      ++v57;
                      continue;
                    }
                  }
                  else
                  {
                    v70 = 0;
                    v71 = (char *)(8 * v66);
                    v74 = (_QWORD *)(8 * v66);
                    *v74 = v62;
                    v58 = (char *)(v74 + 1);
                    v72 = v63 - v64;
                    if (v63 != v64)
                      goto LABEL_67;
                  }
                  v56 = v233;
                  v262 = v71;
                  v263 = v58;
                  v264 = &v70[8 * v69];
                  if (v63)
                    goto LABEL_78;
                  goto LABEL_49;
                }
                break;
              }
              v85 = *((_QWORD *)v56 + 4);
              v86 = *(_QWORD *)(mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v249) + 8);
              if (v86)
                v87 = v86 - 8;
              else
                v87 = 0;
              *(_QWORD *)(v85 + 16) = v87;
              *(_QWORD *)(v85 + 24) = v87 + 32;
              mlir::OpBuilder::create<mlir::func::ReturnOp,std::vector<mlir::Value> &>(*((mlir::OpBuilder **)v56 + 4), v55, (uint64_t *)&v262);
              for (j = 0; j < objc_msgSend(*((id *)v56 + 64), "count"); ++j)
              {
                objc_msgSend(*((id *)v56 + 64), "objectAtIndexedSubscript:", j);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = (void *)objc_msgSend(v89, "value");
                v91 = mlir::Block::addArgument(v52, *(_QWORD *)(objc_msgSend(v89, "value") + 8) & 0xFFFFFFFFFFFFFFF8, v55);
                v246 = v90;
                *(_QWORD *)&v274 = 0;
                v92 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v254, (unint64_t *)&v246, &v274);
                if ((llvm *)v274 == (llvm *)((char *)v254[0] + 16 * v255))
                  v93 = 0;
                else
                  v93 = v92;
                if (v93 == 1)
                {
                  v94 = *(uint64_t **)(v274 + 8);
                  if (v91)
                    v95 = v94 == v91;
                  else
                    v95 = 0;
                  if (v95)
                    __assert_rtn("replaceAllUsesWith", "UseDefLists.h", 213, "(!newValue || this != OperandType::getUseList(newValue)) && \"cannot RAUW a value with itself\");
                }
                else
                {
                  v94 = 0;
                }
                while (1)
                {
                  v96 = (_QWORD *)*v94;
                  if (!*v94)
                    break;
                  v97 = (_QWORD *)v96[1];
                  if (v97)
                  {
                    *v97 = *v96;
                    if (*v96)
                      *(_QWORD *)(*v96 + 8) = v96[1];
                  }
                  v96[3] = v91;
                  v96[1] = v91;
                  v98 = *v91;
                  *v96 = *v91;
                  if (v98)
                    *(_QWORD *)(v98 + 8) = v96;
                  *v91 = (uint64_t)v96;
                }

              }
              v246 = 0;
              v247 = 0;
              v248 = 0;
              v99 = (char *)v262;
              v100 = v263;
              if (v262 != v263)
              {
                v101 = 0;
                while (1)
                {
                  while (1)
                  {
                    v103 = *(_QWORD *)(*(_QWORD *)v99 + 8) & 0xFFFFFFFFFFFFFFF8;
                    if (v101 >= v248)
                      break;
                    *v101++ = v103;
                    v102 = v101;
                    v247 = v101;
                    v99 += 8;
                    if (v99 == v100)
                      goto LABEL_137;
                  }
                  v104 = (unint64_t *)v246;
                  v105 = (char *)v101 - (_BYTE *)v246;
                  v106 = ((char *)v101 - (_BYTE *)v246) >> 3;
                  v107 = v106 + 1;
                  if ((unint64_t)(v106 + 1) >> 61)
                    std::vector<int>::__throw_length_error[abi:ne180100]();
                  v108 = (char *)v248 - (_BYTE *)v246;
                  if (((char *)v248 - (_BYTE *)v246) >> 2 > v107)
                    v107 = v108 >> 2;
                  if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8)
                    v109 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v109 = v107;
                  if (v109)
                  {
                    if (v109 >> 61)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v110 = operator new(8 * v109);
                    v111 = (unint64_t *)&v110[8 * v106];
                    *v111 = v103;
                    v102 = v111 + 1;
                    v112 = (char *)v101 - (char *)v104;
                    if (v101 != v104)
                    {
LABEL_116:
                      v113 = v112 - 8;
                      if (v113 < 0x168)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      v117 = ((char *)(v101 - 1) - (char *)v104) & 0xFFFFFFFFFFFFFFF8;
                      if (&v110[v105 - 8 - v117] > &v110[v105 - 8])
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      if ((unint64_t *)((char *)v101 - v117 - 8) > v101 - 1)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      if ((unint64_t)((char *)v101 - v110 - v105) < 0x20)
                      {
                        v114 = v101;
                        goto LABEL_118;
                      }
                      v118 = (v113 >> 3) + 1;
                      v119 = 8 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
                      v114 = &v101[v119 / 0xFFFFFFFFFFFFFFF8];
                      v111 = (unint64_t *)((char *)v111 - v119);
                      v120 = &v110[v105 - 16];
                      v121 = v101 - 2;
                      v122 = v118 & 0x3FFFFFFFFFFFFFFCLL;
                      do
                      {
                        v123 = *(_OWORD *)v121;
                        *(v120 - 1) = *((_OWORD *)v121 - 1);
                        *v120 = v123;
                        v120 -= 2;
                        v121 -= 4;
                        v122 -= 4;
                      }
                      while (v122);
                      if (v118 != (v118 & 0x3FFFFFFFFFFFFFFCLL))
                      {
                        do
                        {
LABEL_118:
                          v115 = *--v114;
                          *--v111 = v115;
                        }
                        while (v114 != v104);
                      }
                      v101 = (unint64_t *)v246;
                      v246 = v111;
                      v247 = v102;
                      v248 = (unint64_t *)&v110[8 * v109];
                      if (!v101)
                        goto LABEL_124;
LABEL_123:
                      operator delete(v101);
                      goto LABEL_124;
                    }
                  }
                  else
                  {
                    v110 = 0;
                    v111 = (unint64_t *)(8 * v106);
                    v116 = (unint64_t *)(8 * v106);
                    *v116 = v103;
                    v102 = v116 + 1;
                    v112 = (char *)v101 - (char *)v104;
                    if (v101 != v104)
                      goto LABEL_116;
                  }
                  v246 = v111;
                  v247 = v102;
                  v248 = (unint64_t *)&v110[8 * v109];
                  if (v101)
                    goto LABEL_123;
LABEL_124:
                  v247 = v102;
                  v99 += 8;
                  v101 = v102;
                  if (v99 == v100)
                    goto LABEL_137;
                }
              }
              v102 = 0;
LABEL_137:
              v124 = (mlir::MLIRContext **)*((_QWORD *)v233 + 4);
              ArgumentTypes = mlir::Block::getArgumentTypes(v52);
              if (ArgumentTypes > v126)
              {
                v130 = "begin <= end";
                v131 = 83;
                v132 = "ArrayRef.h";
                v133 = "ArrayRef";
LABEL_316:
                __assert_rtn(v133, v132, v131, v130);
              }
              mlir::ValueRange::ValueRange((unint64_t *)&v274, ArgumentTypes, (uint64_t)(v126 - ArgumentTypes) >> 3);
              mlir::TypeRange::TypeRange(v272, v274, *((unint64_t *)&v274 + 1));
              mlir::ValueRange::ValueRange(v271, (uint64_t)v246, ((char *)v102 - (_BYTE *)v246) >> 3);
              FunctionType = mlir::Builder::getFunctionType(v124, v272[0], v272[1], v271[0], v271[1]);
              v128 = v249;
              if (v249)
              {
                InterfaceFor = mlir::OpInterface<mlir::FunctionOpInterface,mlir::detail::FunctionOpInterfaceInterfaceTraits>::getInterfaceFor((uint64_t)v249);
                if (!InterfaceFor)
                {
                  v130 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
                  v131 = 110;
                  v132 = "InterfaceSupport.h";
                  v133 = "Interface";
                  goto LABEL_316;
                }
              }
              else
              {
                InterfaceFor = 0;
              }
              mlir::function_interface_impl::setFunctionType((uint64_t)v128, InterfaceFor, FunctionType);
              v245[0] = 0;
              v245[1] = 0;
              v244 = v245;
              v134 = MEMORY[0x1E0C99DE8];
              v135 = (id *)objc_loadWeakRetained(location);
              objc_msgSend((id)v134, "arrayWithCapacity:", objc_msgSend(v135[10], "count"));
              v136 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = 0;
              v274 = 0u;
              v275 = 0u;
              v276 = 1.0;
              while (v138 < objc_msgSend(v228, "count"))
              {
                objc_msgSend(v228, "objectAtIndexedSubscript:", v138);
                v134 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v136, "addObject:", v134);

                ++v138;
              }
              for (k = 0; k < objc_msgSend(v229, "count"); ++k)
              {
                objc_msgSend(v229, "objectAtIndexedSubscript:", k);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "operation");
                v134 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v136, "addObject:", v134);
              }
              while (2)
              {
                if (!objc_msgSend(v136, "count"))
                {
                  v241 = 0;
                  v242 = 0;
                  v243 = 0;
                  v182 = (id *)objc_loadWeakRetained(location);
                  v183 = objc_msgSend(v182[10], "count");
                  v184 = v183;
                  if (v183)
                  {
                    if (v183 >> 61)
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    v185 = (char *)operator new(8 * v183);
                    v241 = &v185[v242 & 0xFFFFFFFFFFFFFFF8];
                    v242 = (unint64_t)v241;
                    v243 = &v185[8 * v184];
                  }

                  v238 = 0;
                  v239 = 0;
                  v240 = 0;
                  v186 = (id *)objc_loadWeakRetained(location);
                  v187 = objc_msgSend(v186[10], "count");
                  v188 = v187;
                  if (v187)
                  {
                    if (v187 >> 61)
                      std::vector<int>::__throw_length_error[abi:ne180100]();
                    v189 = (char *)operator new(8 * v187);
                    v238 = &v189[v239 & 0xFFFFFFFFFFFFFFF8];
                    v239 = (unint64_t)v238;
                    v240 = &v189[8 * v188];
                  }

                  v190 = objc_loadWeakRetained(location);
                  v237 = &v241;
                  v191 = (mlir::ForwardIterator *)v190[8];
                  v234 = &v237;
                  mlir::detail::walk<mlir::ForwardIterator>(v191, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorEZ67__MPSGraphExecutable_cloneForFeeds_targetTensors_targetOperations__E3__3NS1_3mps16AssignVariableOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESL_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v234, 1);

                  v237 = &v238;
                  v234 = &v237;
                  mlir::detail::walk<mlir::ForwardIterator>(v226, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorEZ67__MPSGraphExecutable_cloneForFeeds_targetTensors_targetOperations__E3__4NS1_3mps16AssignVariableOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESL_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v234, 1);
                  v194 = v241;
                  v193 = (void *)v242;
                  v195 = (uint64_t)(v242 - (_QWORD)v241) >> 3;
                  if (v195 != (uint64_t)(v239 - (_QWORD)v238) >> 3 && MTLReportFailureTypeEnabled())
                    MTLReportFailure();
                  v235 = 0;
                  v236 = 0;
                  v234 = (void ***)&v235;
                  if (v193 != v194)
                  {
                    v196 = 0;
                    if (v195 <= 1)
                      v195 = 1;
                    do
                    {
                      if (v196 >= (uint64_t)(v242 - (_QWORD)v241) >> 3 || v196 >= (uint64_t)(v239 - (_QWORD)v238) >> 3)
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      v197 = *((_QWORD *)v241 + v196);
                      v198 = *((_QWORD *)v238 + v196);
                      v199 = v235;
                      v200 = &v235;
                      v201 = &v235;
                      if (v235)
                      {
                        do
                        {
                          while (1)
                          {
                            v201 = (uint64_t **)v199;
                            v202 = v199[4];
                            if (v197 >= v202)
                              break;
                            v199 = *v201;
                            v200 = v201;
                            if (!*v201)
                              goto LABEL_267;
                          }
                          if (v202 >= v197)
                            goto LABEL_257;
                          v199 = v201[1];
                        }
                        while (v199);
                        v200 = v201 + 1;
                      }
LABEL_267:
                      v203 = (uint64_t *)operator new(0x30uLL);
                      v203[4] = v197;
                      v203[5] = v198;
                      *v203 = 0;
                      v203[1] = 0;
                      v203[2] = (uint64_t)v201;
                      *v200 = v203;
                      if (*v234)
                      {
                        v234 = (void ***)*v234;
                        v203 = *v200;
                      }
                      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v235, v203);
                      ++v236;
LABEL_257:
                      ++v196;
                    }
                    while (v196 != v195);
                    for (m = 0; m != v195; ++m)
                    {
                      if (m >= (uint64_t)(v239 - (_QWORD)v238) >> 3)
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      if (m >= (uint64_t)(v242 - (_QWORD)v241) >> 3)
                        std::vector<mlir::Value>::__throw_out_of_range[abi:ne180100]();
                      if (*((_QWORD *)&v274 + 1))
                      {
                        v205 = *((_QWORD *)v241 + m);
                        v206 = 0x9DDFEA08EB382D69 * (((8 * v205) + 8) ^ HIDWORD(v205));
                        v207 = 0x9DDFEA08EB382D69 * (HIDWORD(v205) ^ (v206 >> 47) ^ v206);
                        v208 = 0x9DDFEA08EB382D69 * (v207 ^ (v207 >> 47));
                        v209 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v274 + 8));
                        v209.i16[0] = vaddlv_u8(v209);
                        if (v209.u32[0] > 1uLL)
                        {
                          v210 = v208;
                          if (v208 >= *((_QWORD *)&v274 + 1))
                            v210 = v208 % *((_QWORD *)&v274 + 1);
                        }
                        else
                        {
                          v210 = v208 & (*((_QWORD *)&v274 + 1) - 1);
                        }
                        v211 = *(_QWORD **)(v274 + 8 * v210);
                        if (v211)
                        {
                          v212 = (_QWORD *)*v211;
                          if (v212)
                          {
                            if (v209.u32[0] < 2uLL)
                            {
                              while (1)
                              {
                                v214 = v212[1];
                                if (v214 == v208)
                                {
                                  if (v212[2] == v205)
                                    goto LABEL_293;
                                }
                                else if ((v214 & (*((_QWORD *)&v274 + 1) - 1)) != v210)
                                {
                                  goto LABEL_292;
                                }
                                v212 = (_QWORD *)*v212;
                                if (!v212)
                                  goto LABEL_292;
                              }
                            }
                            do
                            {
                              v213 = v212[1];
                              if (v213 == v208)
                              {
                                if (v212[2] == v205)
                                  goto LABEL_293;
                              }
                              else
                              {
                                if (v213 >= *((_QWORD *)&v274 + 1))
                                  v213 %= *((_QWORD *)&v274 + 1);
                                if (v213 != v210)
                                  break;
                              }
                              v212 = (_QWORD *)*v212;
                            }
                            while (v212);
                          }
                        }
                      }
LABEL_292:
                      mlir::Operation::erase(*((mlir::Operation **)v238 + m));
LABEL_293:
                      ;
                    }
                  }
                  mlir::mps::inferTypes(v249, v192);
                  *v225 = v226;
                  std::__tree<void *>::destroy(v235);
                  if (v238)
                  {
                    v239 = (unint64_t)v238;
                    operator delete(v238);
                  }
                  if (v241)
                  {
                    v242 = (unint64_t)v241;
                    operator delete(v241);
                  }
                  v215 = (_QWORD *)v275;
                  if ((_QWORD)v275)
                  {
                    do
                    {
                      v216 = (_QWORD *)*v215;
                      operator delete(v215);
                      v215 = v216;
                    }
                    while (v216);
                  }
                  v217 = (void *)v274;
                  *(_QWORD *)&v274 = 0;
                  if (v217)
                    operator delete(v217);

                  std::__tree<MPSGraphTensor * {__strong}>::destroy((uint64_t)&v244, v245[0]);
                  if (v246)
                    operator delete(v246);
                  if (v262)
                  {
                    v263 = (char *)v262;
                    operator delete(v262);
                  }
                  if (__p)
                    operator delete(__p);
                  llvm::deallocate_buffer(v259, (void *)(16 * v261));
                }
                objc_msgSend(v136, "objectAtIndexedSubscript:", 0);
                v141 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                v142 = v141[8];
                if (!v142)
                  __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
                if (!llvm::DefaultDoCastIfPossible<mlir::mps::AssignVariableOp,mlir::Operation *,llvm::CastInfo<mlir::mps::AssignVariableOp,mlir::Operation *,void>>::doCastIfPossible(v142))
                  goto LABEL_244;
                v143 = v141[8];
                v144 = 0x9DDFEA08EB382D69 * (((8 * v143) + 8) ^ HIDWORD(v143));
                v145 = 0x9DDFEA08EB382D69 * (HIDWORD(v143) ^ (v144 >> 47) ^ v144);
                v146 = v145 ^ (v145 >> 47);
                v147 = 0x9DDFEA08EB382D69 * v146;
                v148 = *((_QWORD *)&v274 + 1);
                if (*((_QWORD *)&v274 + 1))
                {
                  v149 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v274 + 8));
                  v149.i16[0] = vaddlv_u8(v149);
                  if (v149.u32[0] > 1uLL)
                  {
                    v134 = 0x9DDFEA08EB382D69 * v146;
                    if (v147 >= *((_QWORD *)&v274 + 1))
                      v134 = v147 % *((_QWORD *)&v274 + 1);
                  }
                  else
                  {
                    v134 = v147 & (*((_QWORD *)&v274 + 1) - 1);
                  }
                  v150 = *(_QWORD **)(v274 + 8 * v134);
                  if (v150)
                  {
                    v151 = (_QWORD *)*v150;
                    if (v151)
                    {
                      if (v149.u32[0] < 2uLL)
                      {
                        while (1)
                        {
                          v153 = v151[1];
                          if (v153 == v147)
                          {
                            if (v151[2] == v143)
                              goto LABEL_244;
                          }
                          else if ((v153 & (*((_QWORD *)&v274 + 1) - 1)) != v134)
                          {
                            goto LABEL_171;
                          }
                          v151 = (_QWORD *)*v151;
                          if (!v151)
                            goto LABEL_171;
                        }
                      }
                      do
                      {
                        v152 = v151[1];
                        if (v152 == v147)
                        {
                          if (v151[2] == v143)
                            goto LABEL_244;
                        }
                        else
                        {
                          if (v152 >= *((_QWORD *)&v274 + 1))
                            v152 %= *((_QWORD *)&v274 + 1);
                          if (v152 != v134)
                            break;
                        }
                        v151 = (_QWORD *)*v151;
                      }
                      while (v151);
                    }
                  }
                }
LABEL_171:
                v154 = operator new(0x20uLL);
                *v154 = 0;
                v154[1] = v147;
                v154[2] = v143;
                v154[3] = v143;
                v155 = (float)(unint64_t)(*((_QWORD *)&v275 + 1) + 1);
                if (v148 && (float)(v276 * (float)v148) >= v155)
                {
                  v156 = v274;
                  v157 = *(_QWORD **)(v274 + 8 * v134);
                  if (v157)
                    goto LABEL_174;
LABEL_223:
                  *v154 = v275;
                  *(_QWORD *)&v275 = v154;
                  *(_QWORD *)(v156 + 8 * v134) = &v275;
                  if (*v154)
                  {
                    v178 = *(_QWORD *)(*v154 + 8);
                    if ((v148 & (v148 - 1)) != 0)
                    {
                      if (v178 >= v148)
                        v178 %= v148;
                    }
                    else
                    {
                      v178 &= v148 - 1;
                    }
                    v157 = (_QWORD *)(v274 + 8 * v178);
LABEL_242:
                    *v157 = v154;
                  }
                  ++*((_QWORD *)&v275 + 1);
LABEL_244:
                  objc_msgSend(v137, "setObject:forKey:", v141, v141);
                  -[MPSGraphExecutable getOperationsToVisitForOperation:visitedOperations:](v233, "getOperationsToVisitForOperation:visitedOperations:", v141, v137);
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v136, "removeObjectAtIndex:", 0);
                  objc_msgSend(v136, "addObjectsFromArray:", v181);

                  continue;
                }
                break;
              }
              v158 = (v148 & (v148 - 1)) != 0;
              if (v148 < 3)
                v158 = 1;
              v159 = v158 | (2 * v148);
              v160 = vcvtps_u32_f32(v155 / v276);
              if (v159 <= v160)
                prime = v160;
              else
                prime = v159;
              if (prime == 1)
              {
                prime = 2;
              }
              else if ((prime & (prime - 1)) != 0)
              {
                prime = std::__next_prime(prime);
                v148 = *((_QWORD *)&v274 + 1);
              }
              if (prime <= v148)
              {
                if (prime >= v148)
                  goto LABEL_221;
                v172 = vcvtps_u32_f32((float)*((unint64_t *)&v275 + 1) / v276);
                if (v148 < 3
                  || (v173 = (uint8x8_t)vcnt_s8((int8x8_t)v148), v173.i16[0] = vaddlv_u8(v173), v173.u32[0] > 1uLL))
                {
                  v172 = std::__next_prime(v172);
                }
                else
                {
                  v174 = 1 << -(char)__clz(v172 - 1);
                  if (v172 >= 2)
                    v172 = v174;
                }
                if (prime <= v172)
                  prime = v172;
                if (prime < v148)
                {
                  if (prime)
                    goto LABEL_185;
                  v176 = (void *)v274;
                  *(_QWORD *)&v274 = 0;
                  if (v176)
                    operator delete(v176);
                  v148 = 0;
                  *((_QWORD *)&v274 + 1) = 0;
                  v177 = -1;
                  goto LABEL_222;
                }
                v148 = *((_QWORD *)&v274 + 1);
                v177 = *((_QWORD *)&v274 + 1) - 1;
                if ((*((_QWORD *)&v274 + 1) & (*((_QWORD *)&v274 + 1) - 1)) == 0)
                  goto LABEL_222;
                goto LABEL_234;
              }
LABEL_185:
              if (prime >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v162 = operator new(8 * prime);
              v163 = (void *)v274;
              *(_QWORD *)&v274 = v162;
              if (v163)
                operator delete(v163);
              v164 = 0;
              *((_QWORD *)&v274 + 1) = prime;
              do
                *(_QWORD *)(v274 + 8 * v164++) = 0;
              while (prime != v164);
              v165 = (_QWORD **)v275;
              if (!(_QWORD)v275)
              {
LABEL_233:
                v148 = prime;
                v177 = prime - 1;
                if ((prime & (prime - 1)) == 0)
                  goto LABEL_222;
                goto LABEL_234;
              }
              v166 = *(_QWORD *)(v275 + 8);
              v167 = prime - 1;
              if ((prime & (prime - 1)) == 0)
              {
                v168 = v166 & v167;
                *(_QWORD *)(v274 + 8 * v168) = &v275;
                for (n = *v165; *v165; n = *v165)
                {
                  v170 = n[1] & v167;
                  if (v170 == v168)
                  {
                    v165 = (_QWORD **)n;
                  }
                  else if (*(_QWORD *)(v274 + 8 * v170))
                  {
                    *v165 = (_QWORD *)*n;
                    v171 = 8 * v170;
                    *n = **(_QWORD **)(v274 + v171);
                    **(_QWORD **)(v274 + v171) = n;
                  }
                  else
                  {
                    *(_QWORD *)(v274 + 8 * v170) = v165;
                    v165 = (_QWORD **)n;
                    v168 = v170;
                  }
                }
                goto LABEL_233;
              }
              if (v166 < prime)
              {
                *(_QWORD *)(v274 + 8 * v166) = &v275;
                v175 = *v165;
                if (*v165)
                  goto LABEL_228;
LABEL_220:
                v148 = prime;
LABEL_221:
                v177 = v148 - 1;
                if ((v148 & (v148 - 1)) == 0)
                {
LABEL_222:
                  v134 = v177 & v147;
                  v156 = v274;
                  v157 = *(_QWORD **)(v274 + 8 * (v177 & v147));
                  if (!v157)
                    goto LABEL_223;
LABEL_174:
                  *v154 = *v157;
                  goto LABEL_242;
                }
LABEL_234:
                if (v147 >= v148)
                {
                  v134 = v147 % v148;
                  v156 = v274;
                  v157 = *(_QWORD **)(v274 + 8 * (v147 % v148));
                  if (!v157)
                    goto LABEL_223;
                }
                else
                {
                  v134 = v147;
                  v156 = v274;
                  v157 = *(_QWORD **)(v274 + 8 * v147);
                  if (!v157)
                    goto LABEL_223;
                }
                goto LABEL_174;
              }
              v166 %= prime;
              *(_QWORD *)(v274 + 8 * v166) = &v275;
              v175 = *v165;
              if (!*v165)
                goto LABEL_220;
              while (1)
              {
LABEL_228:
                v180 = v175[1];
                if (v180 >= prime)
                  v180 %= prime;
                if (v180 == v166)
                  goto LABEL_227;
                if (*(_QWORD *)(v274 + 8 * v180))
                  break;
                *(_QWORD *)(v274 + 8 * v180) = v165;
                v165 = (_QWORD **)v175;
                v175 = (_QWORD *)*v175;
                v166 = v180;
                if (!v175)
                  goto LABEL_233;
              }
              *v165 = (_QWORD *)*v175;
              v179 = 8 * v180;
              *v175 = **(_QWORD **)(v274 + v179);
              **(_QWORD **)(v274 + v179) = v175;
              v175 = v165;
LABEL_227:
              v165 = (_QWORD **)v175;
              v175 = (_QWORD *)*v175;
              if (!v175)
                goto LABEL_233;
              goto LABEL_228;
            }
            v218 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
            v219 = 191;
            v220 = "Alignment.h";
            v221 = "alignAddr";
          }
          else
          {
            v218 = "index < numRegions && \"invalid region index\";
            v219 = 666;
            v220 = "Operation.h";
            v221 = "getRegion";
          }
          __assert_rtn(v221, v220, v219, v218);
        }
      }
    }
  }
  __assert_rtn("cast", "Casting.h", 578, "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\");
}

- (void)fileBackModule:(const void *)a3 withPath:(id)a4
{
  id v6;
  uint64_t Context;
  llvm *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE **v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  const char *v20;
  size_t v21;
  size_t v22;
  __int128 *p_dst;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  size_t v27;
  size_t v28;
  __int128 *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  unint64_t v38;
  void *__p[2];
  unint64_t v40;
  char v41;
  void *v42[2];
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char v48;
  _OWORD v49[2];
  uint64_t v50;
  __int128 __dst;
  __int128 v52;
  uint64_t v53;
  uint64_t v54[8];
  _QWORD v55[3];
  _QWORD *v56;
  _QWORD v57[3];
  _QWORD *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (*((_QWORD *)self + 72) && (objc_msgSend(*((id *)self + 17), "compilerOptions") & 0x10) != 0)
  {
    Context = mlir::Attribute::getContext((mlir::Attribute *)(*(_QWORD *)a3 + 24));
    if ((objc_msgSend(*((id *)self + 17), "compilerOptions", *(double *)mlir::PassManager::PassManager(v54, Context, "any", 3uLL, 1).i64) & 0x20) != 0)mlir::PassManager::enableVerifier((uint64_t)v54, 1);
    if ((-[MPSGraphExecutable options](self, "options") & 2) == 0)
    {
LABEL_17:
      v14 = (_BYTE **)mlir::OpPassManager::nest(v54, "func.func", 9uLL);
      v15 = v6;
      if (!v15)
        goto LABEL_53;
      v48 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), *((_QWORD *)self + 72), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*((id *)self + 74), "fileExistsAtPath:isDirectory:", v16, &v48))
      {
        if (v48 && MTLReportFailureTypeEnabled())
          MTLReportFailure();
        v17 = (void *)*((_QWORD *)self + 74);
        v47 = 0;
        v18 = objc_msgSend(v17, "removeItemAtPath:error:", v16, &v47);
        v19 = v47;
        if ((v18 & 1) == 0 && MTLReportFailureTypeEnabled())
          MTLReportFailure();
      }
      else
      {
        v19 = 0;
      }
      v36 = v19;
      v20 = (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      v21 = strlen(v20);
      if (v21 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v22 = v21;
      if (v21 >= 0x17)
      {
        v24 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v21 | 7) != 0x17)
          v24 = v21 | 7;
        v25 = v24 + 1;
        p_dst = (__int128 *)operator new(v24 + 1);
        *((_QWORD *)&__dst + 1) = v22;
        *(_QWORD *)&v52 = v25 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        BYTE7(v52) = v21;
        p_dst = &__dst;
        if (!v21)
        {
LABEL_32:
          *((_BYTE *)p_dst + v22) = 0;
          *(_OWORD *)v42 = __dst;
          v43 = v52;
          *(_QWORD *)&v52 = 0;
          __dst = 0uLL;
          v44 = 1;
          v26 = (const char *)objc_msgSend(*((id *)self + 72), "UTF8String");
          v27 = strlen(v26);
          if (v27 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v28 = v27;
          if (v27 >= 0x17)
          {
            v31 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17)
              v31 = v27 | 7;
            v32 = v31 + 1;
            v29 = (__int128 *)operator new(v31 + 1);
            *((_QWORD *)&v37 + 1) = v28;
            v38 = v32 | 0x8000000000000000;
            *(_QWORD *)&v37 = v29;
            v30 = v36;
          }
          else
          {
            HIBYTE(v38) = v27;
            v29 = &v37;
            v30 = v36;
            if (!v27)
              goto LABEL_40;
          }
          memmove(v29, v26, v28);
LABEL_40:
          *((_BYTE *)v29 + v28) = 0;
          *(_OWORD *)__p = v37;
          v40 = v38;
          v41 = 1;
          mlir::mps::createStoreConstantsPass((uint64_t)v42, (uint64_t)__p, 0, &v45);
          v33 = v45;
          v45 = 0;
          v46 = v33;
          mlir::OpPassManager::addPass(v14, &v46);
          v34 = v46;
          v46 = 0;
          if (v34)
            (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
          v35 = v45;
          v45 = 0;
          if (v35)
            (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
          if (v41 && SHIBYTE(v40) < 0)
            operator delete(__p[0]);
          if (v44 && SHIBYTE(v43) < 0)
            operator delete(v42[0]);
          if (SBYTE7(v52) < 0)
            operator delete((void *)__dst);

LABEL_53:
          if (!mlir::PassManager::run((mlir::PassManager *)v54, *(mlir::Operation **)a3))
          {
            if (MTLReportFailureTypeEnabled())
              MTLReportFailure();
          }
          mlir::verify(*(mlir **)a3, (mlir::Operation *)1);
        }
      }
      memmove(p_dst, v20, v22);
      goto LABEL_32;
    }
    mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)&__dst);
    mlir::OpPrintingFlags::elideLargeElementsAttrs((uint64_t)&__dst, 256);
    v8 = (llvm *)mlir::OpPrintingFlags::elideLargeResourceString((uint64_t)&__dst, 0);
    v58 = v57;
    v55[0] = &off_1E0E50250;
    v56 = v55;
    v57[0] = &off_1E0E05480;
    v9 = llvm::dbgs(v8);
    v49[0] = __dst;
    v49[1] = v52;
    v50 = v53;
    mlir::PassManager::enableIRPrinting((uint64_t)v54, v57, v55, 0, 0, 0, v9, (uint64_t)v49);
    v10 = v56;
    if (v56 == v55)
    {
      v11 = 4;
      v10 = v55;
    }
    else
    {
      if (!v56)
        goto LABEL_11;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_11:
    v12 = v58;
    if (v58 == v57)
    {
      v13 = 4;
      v12 = v57;
    }
    else
    {
      if (!v58)
      {
LABEL_16:
        mlir::PassManager::enableTiming((mlir::PassManager *)v54);
        goto LABEL_17;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_16;
  }

}

- (FuncOp)getEntryFuncOp
{
  std::recursive_mutex *v3;
  mlir::MLIRContext *v4;
  FuncOp v5;

  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  v5.var0 = (Operation *)-[MPSGraphExecutable getEntryFuncOpForModule:](self, "getEntryFuncOpForModule:", LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v4));
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (FuncOp)getEntryFuncOpForModule:(ModuleOp)a3
{
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  size_t v9;
  mlir::StringAttr *Context;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  __int16 v16;

  objc_msgSend(*((id *)self + 17), "entryFunctionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*((id *)self + 17), "entryFunctionName");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    v8 = v7;
    if (v7)
      v9 = strlen(v7);
    else
      v9 = 0;
    Context = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)((char *)a3.state + 24));
    v16 = 261;
    v15[0] = v8;
    v15[1] = v9;
    v12 = mlir::StringAttr::get(Context, (mlir::MLIRContext *)v15);
    v13 = mlir::SymbolTable::lookupSymbolIn((unsigned int *)a3.state, v12);
    if (v13)
    {
      v14 = llvm::DefaultDoCastIfPossible<mlir::func::FuncOp,mlir::Operation &,llvm::CastInfo<mlir::func::FuncOp,mlir::Operation,void>>::doCastIfPossible(v13);

      if (v14)
        return (FuncOp)v14;
    }
    else
    {

    }
    v14 = 0;
    if (MTLReportFailureTypeEnabled())
    {
      MTLReportFailure();
      return (FuncOp)0;
    }
    return (FuncOp)v14;
  }
  return (FuncOp)getFuncOpInModule((uint64_t)a3.state);
}

- (void)optimizeOriginalModule
{
}

- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  _BYTE *v25;
  _BYTE *v26;
  int64_t v27;
  Type *v28;
  Type *v29;
  vector<mlir::Type, std::allocator<mlir::Type>> *result;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  __n128 (*v35)(__n128 *, __n128 *);
  void (*v36)(uint64_t);
  const char *v37;
  void *__p;
  _BYTE *v39;
  char *v40;

  v6 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x4812000000;
  v35 = __Block_byref_object_copy__421;
  v36 = __Block_byref_object_dispose__422;
  v37 = "";
  __p = 0;
  v39 = 0;
  v40 = 0;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  v9 = __p;
  if (v7 <= (v40 - (_BYTE *)__p) >> 3)
    goto LABEL_13;
  if (v7 >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v10 = v39;
  v11 = (char *)operator new(8 * v7);
  v12 = v10 - v9;
  v13 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
  v14 = v13;
  if (v10 != v9)
  {
    if ((unint64_t)(v12 - 8) < 0x58)
    {
      v14 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_10:
        v23 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v14 - 1) = v23;
        v14 -= 8;
      }
      while (v10 != v9);
      goto LABEL_11;
    }
    v14 = &v11[(v10 - v9) & 0xFFFFFFFFFFFFFFF8];
    if (v10 - v11 - (v12 & 0xFFFFFFFFFFFFFFF8) < 0x20)
      goto LABEL_10;
    v15 = v12 >> 3;
    v16 = ((unint64_t)(v12 - 8) >> 3) + 1;
    v17 = 8 * (v16 & 0x3FFFFFFFFFFFFFFCLL);
    v18 = &v10[-v17];
    v14 = &v13[-v17];
    v19 = &v11[8 * v15 - 16];
    v20 = (__int128 *)(v10 - 16);
    v21 = v16 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v22 = *v20;
      *((_OWORD *)v19 - 1) = *(v20 - 1);
      *(_OWORD *)v19 = v22;
      v19 -= 32;
      v20 -= 2;
      v21 -= 4;
    }
    while (v21);
    v10 = v18;
    if (v16 != (v16 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_10;
  }
LABEL_11:
  __p = v14;
  v39 = v13;
  v40 = &v11[8 * v8];
  if (v9)
    operator delete(v9);
LABEL_13:
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __55__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes___block_invoke;
  v31[3] = &unk_1E0E77028;
  v31[4] = self;
  v31[5] = &v32;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  v24 = v33;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v26 = (_BYTE *)v24[6];
  v25 = (_BYTE *)v24[7];
  v27 = v25 - v26;
  if (v25 != v26)
  {
    if (v27 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v28 = (Type *)operator new(v25 - v26);
    retstr->var0 = v28;
    v29 = (Type *)((char *)v28 + 8 * (v27 >> 3));
    retstr->var2.var0 = v29;
    memcpy(v28, v26, v27);
    retstr->var1 = v29;
  }
  _Block_object_dispose(&v32, 8);
  if (__p)
  {
    v39 = __p;
    operator delete(__p);
  }

  return result;
}

void __55__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  mlir::MLIRContext *v4;
  void *v5;
  mlir::MLIRContext *v6;
  id v7;
  uint64_t MLIRElementType;
  uint64_t **MLIRType;
  _QWORD *v10;
  unint64_t v11;
  uint64_t ***v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t ***v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ***v26;
  char *v27;
  uint64_t ***v28;
  uint64_t v29;
  __int128 v30;
  uint64_t **v31;
  id v32;

  v3 = a2;
  v4 = *(mlir::MLIRContext **)(*(_QWORD *)(a1 + 32) + 16);
  v32 = v3;
  objc_msgSend(v3, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (mlir::MLIRContext *)objc_msgSend(v32, "dataType");
  v7 = v5;
  MLIRElementType = getMLIRElementType(v4, v6);
  MLIRType = getMLIRType(v7, MLIRElementType);

  v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v12 = (uint64_t ***)v10[7];
  v11 = v10[8];
  if ((unint64_t)v12 < v11)
  {
    *v12 = MLIRType;
    v13 = (uint64_t)(v12 + 1);
    goto LABEL_14;
  }
  v14 = (char *)v10[6];
  v15 = ((char *)v12 - v14) >> 3;
  v16 = v15 + 1;
  if ((unint64_t)(v15 + 1) >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v17 = v11 - (_QWORD)v14;
  if (v17 >> 2 > v16)
    v16 = v17 >> 2;
  if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
    v18 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
  {
    if (v18 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v19 = (char *)operator new(8 * v18);
    v20 = (uint64_t ***)&v19[8 * v15];
    v21 = &v19[8 * v18];
    *v20 = MLIRType;
    v13 = (uint64_t)(v20 + 1);
    v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14)
    {
LABEL_12:
      v10[6] = v20;
      v10[7] = v13;
      v10[8] = v21;
      if (!v12)
        goto LABEL_14;
LABEL_13:
      operator delete(v12);
      goto LABEL_14;
    }
  }
  else
  {
    v19 = 0;
    v20 = (uint64_t ***)(8 * v15);
    v21 = 0;
    *(_QWORD *)(8 * v15) = MLIRType;
    v13 = 8 * v15 + 8;
    v22 = (char *)((char *)v12 - v14);
    if (v12 == (uint64_t ***)v14)
      goto LABEL_12;
  }
  v23 = (unint64_t)(v22 - 8);
  if (v23 < 0x58)
    goto LABEL_28;
  if ((unint64_t)(v14 - v19) < 0x20)
    goto LABEL_28;
  v24 = (v23 >> 3) + 1;
  v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
  v26 = &v12[v25 / 0xFFFFFFFFFFFFFFF8];
  v20 = (uint64_t ***)((char *)v20 - v25);
  v27 = &v19[8 * v15 - 16];
  v28 = v12 - 2;
  v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v30 = *(_OWORD *)v28;
    *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
    *(_OWORD *)v27 = v30;
    v27 -= 32;
    v28 -= 4;
    v29 -= 4;
  }
  while (v29);
  v12 = v26;
  if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_28:
    do
    {
      v31 = *--v12;
      *--v20 = v31;
    }
    while (v12 != (uint64_t ***)v14);
  }
  v12 = (uint64_t ***)v10[6];
  v10[6] = v20;
  v10[7] = v13;
  v10[8] = v21;
  if (v12)
    goto LABEL_13;
LABEL_14:
  v10[7] = v13;

}

- (vector<mlir::Type,)convertMPSGraphShapesToMLIRTypes:(MPSGraphExecutable *)self funcOp:(SEL)a3 compilationDescriptor:(id)a4
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  _BYTE *v31;
  _BYTE *v32;
  int64_t v33;
  Type *v34;
  Type *v35;
  vector<mlir::Type, std::allocator<mlir::Type>> *result;
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  uint64_t *v40;
  _QWORD v41[7];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  __n128 (*v45)(__n128 *, __n128 *);
  void (*v46)(uint64_t);
  const char *v47;
  void *__p;
  _BYTE *v49;
  char *v50;

  v10 = a4;
  v11 = a6;
  v42 = 0;
  v43 = &v42;
  v44 = 0x4812000000;
  v45 = __Block_byref_object_copy__421;
  v46 = __Block_byref_object_dispose__422;
  v47 = "";
  __p = 0;
  v49 = 0;
  v50 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3812000000;
  v41[3] = __Block_byref_object_copy__426;
  v41[4] = __Block_byref_object_dispose__427;
  v41[5] = 0;
  v41[6] = a5.var0;
  v12 = objc_msgSend(v10, "count");
  v13 = v12;
  v14 = __p;
  if (v12 <= (v50 - (_BYTE *)__p) >> 3)
    goto LABEL_13;
  if (v12 >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v15 = v49;
  v16 = (char *)operator new(8 * v12);
  v17 = v15 - v14;
  v18 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
  v19 = v18;
  if (v15 != v14)
  {
    if ((unint64_t)(v17 - 8) < 0x58)
    {
      v19 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
      do
      {
LABEL_10:
        v28 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v19 - 1) = v28;
        v19 -= 8;
      }
      while (v15 != v14);
      goto LABEL_11;
    }
    v19 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    if (v15 - v16 - (v17 & 0xFFFFFFFFFFFFFFF8) < 0x20)
      goto LABEL_10;
    v20 = v17 >> 3;
    v21 = ((unint64_t)(v17 - 8) >> 3) + 1;
    v22 = 8 * (v21 & 0x3FFFFFFFFFFFFFFCLL);
    v23 = &v15[-v22];
    v19 = &v18[-v22];
    v24 = &v16[8 * v20 - 16];
    v25 = (__int128 *)(v15 - 16);
    v26 = v21 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v27 = *v25;
      *((_OWORD *)v24 - 1) = *(v25 - 1);
      *(_OWORD *)v24 = v27;
      v24 -= 32;
      v25 -= 2;
      v26 -= 4;
    }
    while (v26);
    v15 = v23;
    if (v21 != (v21 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_10;
  }
LABEL_11:
  __p = v19;
  v49 = v18;
  v50 = &v16[8 * v13];
  if (v14)
    operator delete(v14);
LABEL_13:
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __84__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes_funcOp_compilationDescriptor___block_invoke;
  v37[3] = &unk_1E0E77050;
  v39 = v41;
  v37[4] = self;
  v29 = v11;
  v38 = v29;
  v40 = &v42;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v37);
  v30 = v43;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v32 = (_BYTE *)v30[6];
  v31 = (_BYTE *)v30[7];
  v33 = v31 - v32;
  if (v31 != v32)
  {
    if (v33 < 0)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v34 = (Type *)operator new(v31 - v32);
    retstr->var0 = v34;
    v35 = (Type *)((char *)v34 + 8 * (v33 >> 3));
    retstr->var2.var0 = v35;
    memcpy(v34, v32, v33);
    retstr->var1 = v35;
  }

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }

  return result;
}

void __84__MPSGraphExecutable_convertMPSGraphShapesToMLIRTypes_funcOp_compilationDescriptor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t **v15;
  uint64_t InterfaceFor;
  mlir::MLIRContext *v17;
  void *v18;
  mlir::MLIRContext *v19;
  id v20;
  uint64_t MLIRElementType;
  uint64_t **MLIRType;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v27;
  uint64_t OperandRange;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint64_t ***v40;
  uint64_t ****v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *ArgAttrsAttr;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t **v63;
  unint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t ***v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t ***v77;
  char *v78;
  uint64_t ***v79;
  uint64_t v80;
  __int128 v81;
  uint64_t **v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t ***v92;
  char *v93;
  uint64_t ***v94;
  uint64_t v95;
  __int128 v96;
  uint64_t **v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t ***v101;
  char *v102;
  uint64_t ***v103;
  uint64_t v104;
  __int128 v105;
  uint64_t **v106;
  const char *v107;
  int v108;
  const char *v109;
  const char *v110;
  const char *v111;
  int v112;
  const char *v113;
  const char *v114;
  const char *v115;
  int v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  void **v120;
  uint64_t v121;
  void **v122;
  uint64_t v123;
  uint64_t v124;
  void **v125;
  void **v126;
  void *__p[2];
  char v128;
  void *v129[2];
  char v130;
  uint64_t **v131;
  uint64_t v132;
  uint64_t **v133;
  uint64_t v134;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
  v7 = *(unsigned int *)(v6 + 44);
  if ((v7 & 0x7FFFFF) == 0)
  {
    v107 = "index < numRegions && \"invalid region index\";
    v108 = 666;
    v109 = "Operation.h";
    v110 = "getRegion";
    goto LABEL_104;
  }
  v8 = v6 + 16 * ((v7 >> 23) & 1) + ((v7 >> 21) & 0x7F8) + 64;
  if (v8 > 0xFFFFFFFFFFFFFFF8)
  {
    v107 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
    v108 = 191;
    v109 = "Alignment.h";
    v110 = "alignAddr";
    goto LABEL_104;
  }
  v9 = (_QWORD *)(((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v6 + 40));
  if ((_QWORD *)*v9 == v9)
    goto LABEL_126;
  v10 = v9[1];
  v11 = v10 - 8;
  if (!v10)
    v11 = 0;
  v12 = *(_QWORD *)(v11 + 48);
  if (a3 >= (unint64_t)((*(_QWORD *)(v11 + 56) - v12) >> 3))
  {
LABEL_126:
    v107 = "Index < this->size() && \"Invalid index!\";
    v108 = 443;
    v109 = "ArrayRef.h";
    v110 = "operator[]";
LABEL_104:
    __assert_rtn(v110, v109, v108, v107);
  }
  v13 = *(_QWORD *)(v12 + 8 * a3);
  v14 = *(_QWORD *)(v13 + 8);
  v15 = (uint64_t **)(v14 & 0xFFFFFFFFFFFFFFF8);
  if ((v14 & 0xFFFFFFFFFFFFFFF8) == 0)
  {
    v111 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v112 = 650;
    v113 = "Casting.h";
    v114 = "dyn_cast";
    goto LABEL_112;
  }
  if (mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor((uint64_t **)(v14 & 0xFFFFFFFFFFFFFFF8)))
  {
    InterfaceFor = mlir::TypeInterface<mlir::ShapedType,mlir::detail::ShapedTypeInterfaceTraits>::getInterfaceFor(v15);
    if (InterfaceFor)
    {
      v133 = v15;
      v134 = InterfaceFor;
      if (v15)
        goto LABEL_13;
      goto LABEL_106;
    }
    v111 = "(!t || conceptImpl) && \"expected value to provide interface instance\";
    v112 = 98;
    v113 = "InterfaceSupport.h";
    v114 = "Interface";
LABEL_112:
    __assert_rtn(v114, v113, v112, v111);
  }
  v133 = 0;
  v134 = 0;
LABEL_106:
  if (MTLReportFailureTypeEnabled())
  {
    v123 = a3;
    MTLReportFailure();
  }
LABEL_13:
  v17 = *(mlir::MLIRContext **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v5, "shape", v123);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (mlir::MLIRContext *)objc_msgSend(v5, "dataType");
  v20 = v18;
  MLIRElementType = getMLIRElementType(v17, v19);
  MLIRType = getMLIRType(v20, MLIRElementType);
  v24 = v23;

  v131 = MLIRType;
  v132 = v24;

  v129[0] = (void *)mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
  if (mlir::Type::isIntOrFloat((mlir::Type *)v129))
  {
    __p[0] = (void *)mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    v25 = mlir::Type::getIntOrFloatBitWidth((mlir::Type *)__p) == 1;
  }
  else
  {
    v25 = 0;
  }
  if (objc_msgSend(v5, "dataType") == 536870920 && v25)
  {
    objc_msgSend(v5, "shape");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    OperandRange = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    v131 = getMLIRType(v27, OperandRange);
    v132 = v29;

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "compilerOptions") & 0x200) == 0)
  {
    mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131);
    v30 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
    if (v30 != mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131))
    {
      if (MTLReportFailureTypeEnabled())
      {
        v119 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v133);
        v120 = v129;
        getIRStringForMLIRObject<mlir::Type>(v129, v119);
        if (v130 < 0)
          v120 = (void **)v129[0];
        v121 = mlir::MemoryMapperInterface::getOperandRange((mlir::MemoryMapperInterface *)&v131);
        getIRStringForMLIRObject<mlir::Type>(__p, v121);
        if (v128 >= 0)
          v122 = __p;
        else
          v122 = (void **)__p[0];
        v125 = v120;
        v126 = v122;
        v124 = a3;
        MTLReportFailure();
        if (v128 < 0)
          operator delete(__p[0]);
        if (v130 < 0)
          operator delete(v129[0]);
      }
    }
  }
  v31 = (void *)(*(_QWORD *)(v13 + 8) & 0xFFFFFFFFFFFFFFF8);
  if (!v31)
  {
    v115 = "detail::isPresent(Val) && \"dyn_cast on a non-existent value\";
    v116 = 650;
    v117 = "Casting.h";
    v118 = "dyn_cast";
    goto LABEL_110;
  }
  if (!*(_QWORD *)v31)
  {
    v115 = "abstractType && \"Malformed type storage object.\";
    v116 = 160;
    v117 = "TypeSupport.h";
    v118 = "getAbstractType";
LABEL_110:
    __assert_rtn(v118, v117, v116, v115);
  }
  v32 = *(void **)(*(_QWORD *)v31 + 136);
  if (v32 != &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
    v31 = 0;
  v129[0] = v31;
  if (v32 == &mlir::detail::TypeIDResolver<mlir::RankedTensorType,void>::id)
  {
    if (!mlir::TensorType::hasRank((mlir::TensorType *)v129))
      __assert_rtn("getRank", "BuiltinTypeInterfaces.h.inc", 227, "(*static_cast<const ConcreteType *>(this)).hasRank() && \"cannot query rank of unranked shaped type\");
    mlir::ArrayAttr::getValue((mlir::ArrayAttr *)v129);
    if (!v33)
    {
      objc_msgSend(v5, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count") == 1)
      {
        objc_msgSend(v5, "shape");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "integerValue");

        if (v37 == 1)
        {
          v38 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
          v40 = (uint64_t ***)v38[7];
          v39 = v38[8];
          if ((unint64_t)v40 >= v39)
          {
            v41 = (uint64_t ****)(v38 + 6);
            v42 = (char *)v38[6];
            v43 = ((char *)v40 - v42) >> 3;
            v44 = v43 + 1;
            if ((unint64_t)(v43 + 1) >> 61)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v45 = v39 - (_QWORD)v42;
            if (v45 >> 2 > v44)
              v44 = v45 >> 2;
            if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
              v46 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v46 = v44;
            if (v46)
            {
              if (v46 >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v47 = (char *)operator new(8 * v46);
            }
            else
            {
              v47 = 0;
            }
            v72 = (uint64_t ***)&v47[8 * v43];
            v73 = &v47[8 * v46];
            *v72 = v133;
            v65 = v72 + 1;
            if (v40 == (uint64_t ***)v42)
              goto LABEL_90;
            v98 = (char *)v40 - v42 - 8;
            if (v98 < 0x58)
              goto LABEL_133;
            if ((unint64_t)(v42 - v47) < 0x20)
              goto LABEL_133;
            v99 = (v98 >> 3) + 1;
            v100 = 8 * (v99 & 0x3FFFFFFFFFFFFFFCLL);
            v101 = &v40[v100 / 0xFFFFFFFFFFFFFFF8];
            v72 = (uint64_t ***)((char *)v72 - v100);
            v102 = &v47[8 * v43 - 16];
            v103 = v40 - 2;
            v104 = v99 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v105 = *(_OWORD *)v103;
              *((_OWORD *)v102 - 1) = *((_OWORD *)v103 - 1);
              *(_OWORD *)v102 = v105;
              v102 -= 32;
              v103 -= 4;
              v104 -= 4;
            }
            while (v104);
            v40 = v101;
            if (v99 != (v99 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_133:
              do
              {
                v106 = *--v40;
                *--v72 = v106;
              }
              while (v40 != (uint64_t ***)v42);
            }
            goto LABEL_89;
          }
          goto LABEL_50;
        }
      }
      else
      {

      }
    }
    v48 = *(_QWORD *)(a1 + 32);
    v49 = *(_QWORD *)(v48 + 640);
    v50 = *(_QWORD *)(v48 + 632);
    if (v49 < v50)
    {
      ArgAttrsAttr = (_QWORD *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v133);
      v53 = v52;
      v54 = (_QWORD *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v131);
      mlir::verifyCompatibleShape(ArgAttrsAttr, v53, v54, v55);
      v56 = *(_QWORD *)(a1 + 32);
      v49 = *(_QWORD *)(v56 + 640);
      v50 = *(_QWORD *)(v56 + 632);
    }
    if (v49 < v50)
    {
      v57 = (_QWORD *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v133);
      v59 = v58;
      v60 = (_QWORD *)mlir::CallableOpInterface::getArgAttrsAttr((mlir::CallableOpInterface *)&v131);
      if (!mlir::verifyCompatibleShape(v57, v59, v60, v61))
      {
        if (MTLReportFailureTypeEnabled())
        {
          v124 = a3;
          MTLReportFailure();
        }
      }
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "compilerOptions", v124, v125, v126) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "compilerOptions") & 0x200) != 0)
  {
    v38 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
    v40 = (uint64_t ***)v38[7];
    v64 = v38[8];
    if ((unint64_t)v40 < v64)
    {
      v63 = v131;
      goto LABEL_53;
    }
    v41 = (uint64_t ****)(v38 + 6);
    v66 = (char *)v38[6];
    v67 = ((char *)v40 - v66) >> 3;
    v68 = v67 + 1;
    if (!((unint64_t)(v67 + 1) >> 61))
    {
      v69 = v64 - (_QWORD)v66;
      if (v69 >> 2 > v68)
        v68 = v69 >> 2;
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
        v70 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v70 = v68;
      if (v70)
      {
        if (v70 >> 61)
          goto LABEL_128;
        v71 = (char *)operator new(8 * v70);
      }
      else
      {
        v71 = 0;
      }
      v72 = (uint64_t ***)&v71[8 * v67];
      v73 = &v71[8 * v70];
      *v72 = v131;
      v65 = v72 + 1;
      if (v40 == (uint64_t ***)v66)
        goto LABEL_90;
      v74 = (char *)v40 - v66 - 8;
      if (v74 < 0x58)
        goto LABEL_134;
      if ((unint64_t)(v66 - v71) < 0x20)
        goto LABEL_134;
      v75 = (v74 >> 3) + 1;
      v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
      v77 = &v40[v76 / 0xFFFFFFFFFFFFFFF8];
      v72 = (uint64_t ***)((char *)v72 - v76);
      v78 = &v71[8 * v67 - 16];
      v79 = v40 - 2;
      v80 = v75 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v81 = *(_OWORD *)v79;
        *((_OWORD *)v78 - 1) = *((_OWORD *)v79 - 1);
        *(_OWORD *)v78 = v81;
        v78 -= 32;
        v79 -= 4;
        v80 -= 4;
      }
      while (v80);
      v40 = v77;
      if (v75 != (v75 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_134:
        do
        {
          v82 = *--v40;
          *--v72 = v82;
        }
        while (v40 != (uint64_t ***)v66);
      }
      goto LABEL_89;
    }
LABEL_127:
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  v38 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v40 = (uint64_t ***)v38[7];
  v62 = v38[8];
  if ((unint64_t)v40 < v62)
  {
LABEL_50:
    v63 = v133;
LABEL_53:
    *v40 = v63;
    v65 = v40 + 1;
    goto LABEL_92;
  }
  v41 = (uint64_t ****)(v38 + 6);
  v83 = (char *)v38[6];
  v84 = ((char *)v40 - v83) >> 3;
  v85 = v84 + 1;
  if ((unint64_t)(v84 + 1) >> 61)
    goto LABEL_127;
  v86 = v62 - (_QWORD)v83;
  if (v86 >> 2 > v85)
    v85 = v86 >> 2;
  if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8)
    v87 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v87 = v85;
  if (!v87)
  {
    v88 = 0;
    goto LABEL_82;
  }
  if (v87 >> 61)
LABEL_128:
    std::__throw_bad_array_new_length[abi:ne180100]();
  v88 = (char *)operator new(8 * v87);
LABEL_82:
  v72 = (uint64_t ***)&v88[8 * v84];
  v73 = &v88[8 * v87];
  *v72 = v133;
  v65 = v72 + 1;
  if (v40 == (uint64_t ***)v83)
    goto LABEL_90;
  v89 = (char *)v40 - v83 - 8;
  if (v89 < 0x58)
    goto LABEL_135;
  if ((unint64_t)(v83 - v88) < 0x20)
    goto LABEL_135;
  v90 = (v89 >> 3) + 1;
  v91 = 8 * (v90 & 0x3FFFFFFFFFFFFFFCLL);
  v92 = &v40[v91 / 0xFFFFFFFFFFFFFFF8];
  v72 = (uint64_t ***)((char *)v72 - v91);
  v93 = &v88[8 * v84 - 16];
  v94 = v40 - 2;
  v95 = v90 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v96 = *(_OWORD *)v94;
    *((_OWORD *)v93 - 1) = *((_OWORD *)v94 - 1);
    *(_OWORD *)v93 = v96;
    v93 -= 32;
    v94 -= 4;
    v95 -= 4;
  }
  while (v95);
  v40 = v92;
  if (v90 != (v90 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_135:
    do
    {
      v97 = *--v40;
      *--v72 = v97;
    }
    while (v40 != (uint64_t ***)v83);
  }
LABEL_89:
  v40 = *v41;
LABEL_90:
  v38[6] = v72;
  v38[7] = v65;
  v38[8] = v73;
  if (v40)
    operator delete(v40);
LABEL_92:
  v38[7] = v65;

}

- (vector<mlir::NamedAttribute,)getAttributesFromDescriptors:(MPSGraphExecutable *)self context:(SEL)a3 device:(id)a4
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _BYTE *v14;
  char v15;
  uint64_t v16;
  vector<mlir::NamedAttribute, std::allocator<mlir::NamedAttribute>> *v17;
  NamedAttribute *var0;
  char *var1;
  NamedAttribute *v20;
  NamedAttribute *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  NamedAttribute *v27;
  NamedAttribute *v28;
  void *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  id v34;
  const char *v35;
  const char *v36;
  size_t v37;
  llvm::raw_ostream *v38;
  _WORD *v39;
  id v40;
  const char *v41;
  const char *v42;
  size_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _BYTE *v51;
  uint64_t *v52;
  uint64_t v53;
  int64_t v54;
  unint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _OWORD *v61;
  uint64_t *v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  vector<mlir::NamedAttribute, std::allocator<mlir::NamedAttribute>> *v67;
  NamedAttribute *v68;
  char *v69;
  NamedAttribute *v70;
  NamedAttribute *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  NamedAttribute *v77;
  NamedAttribute *v78;
  vector<mlir::NamedAttribute, std::allocator<mlir::NamedAttribute>> *result;
  void *v80;
  vector<mlir::NamedAttribute, std::allocator<mlir::NamedAttribute>> *v81;
  id obj;
  uint64_t v83;
  uint64_t v85;
  uint64_t *v86;
  uint64_t *v87;
  const char *v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char v93;
  uint64_t v94;
  int v95;
  void **v96;
  void *__p[2];
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _OWORD v103[2];
  __int16 v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v80 = v10;
  v81 = retstr;
  if (v9)
  {
    objc_msgSend(v9, "getNamedAttrArray:device:", a5, v10);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  objc_msgSend(*((id *)self + 17), "entryFunctionName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_25;
  v88 = "mps.entryFunctionName";
  LOWORD(v92) = 259;
  v12 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)&v88);
  objc_msgSend(*((id *)self + 17), "entryFunctionName");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (_BYTE *)objc_msgSend(v13, "UTF8String");
  v104 = 257;
  if (*v14)
  {
    *(_QWORD *)&v103[0] = v14;
    v15 = 3;
  }
  else
  {
    v15 = 1;
  }
  LOBYTE(v104) = v15;
  v16 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)v103);
  mlir::NamedAttribute::NamedAttribute(__p, v12, v16);
  v17 = v81;
  var1 = (char *)v81->var1;
  var0 = v81->var2.var0;
  if (var1 >= (char *)var0)
  {
    v21 = v81->var0;
    v22 = (var1 - (char *)v81->var0) >> 4;
    v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v24 = var0 - v21;
    if (v24 >> 3 > v23)
      v23 = v24 >> 3;
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0)
      v25 = 0xFFFFFFFFFFFFFFFLL;
    else
      v25 = v23;
    if (v25)
    {
      if (v25 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v26 = (char *)operator new(16 * v25);
    }
    else
    {
      v26 = 0;
    }
    v27 = (NamedAttribute *)&v26[16 * v22];
    v28 = (NamedAttribute *)&v26[16 * v25];
    *(_OWORD *)v27 = *(_OWORD *)__p;
    v20 = (NamedAttribute *)((char *)v27 + 16);
    if (var1 == (char *)v21)
    {
      v17 = v81;
      v81->var0 = v27;
      v81->var1 = v20;
      v81->var2.var0 = v28;
      if (!var1)
        goto LABEL_24;
    }
    else
    {
      do
      {
        *((_OWORD *)v27 - 1) = *((_OWORD *)var1 - 1);
        v27 = (NamedAttribute *)((char *)v27 - 16);
        var1 -= 16;
      }
      while (var1 != (char *)v21);
      v17 = v81;
      var1 = (char *)v81->var0;
      v81->var0 = v27;
      v81->var1 = v20;
      v81->var2.var0 = v28;
      if (!var1)
        goto LABEL_24;
    }
    operator delete(var1);
    v17 = v81;
  }
  else
  {
    *(_OWORD *)var1 = *(_OWORD *)__p;
    v20 = (NamedAttribute *)(var1 + 16);
  }
LABEL_24:
  v17->var1 = v20;

LABEL_25:
  v29 = (void *)*((_QWORD *)self + 18);
  if (!v29)
    goto LABEL_100;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v29;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
  v31 = 0;
  if (!v30)
  {
    v87 = 0;
    goto LABEL_80;
  }
  v86 = 0;
  v87 = 0;
  v83 = *(_QWORD *)v100;
  do
  {
    v32 = 0;
    v85 = v30;
    do
    {
      if (*(_QWORD *)v100 != v83)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v32);
      __p[0] = 0;
      __p[1] = 0;
      v98 = 0;
      v89 = 0;
      v93 = 0;
      v94 = 0;
      v95 = 1;
      v91 = 0;
      v92 = 0;
      v90 = 0;
      v88 = (const char *)&unk_1E0E22B10;
      v96 = __p;
      llvm::raw_ostream::SetBufferAndMode((uint64_t)&v88, 0, 0, 0);
      v34 = objc_retainAutorelease(v33);
      v35 = (const char *)objc_msgSend(v34, "UTF8String");
      v36 = v35;
      if (v35)
      {
        v37 = strlen(v35);
        if (v37 > v91 - (uint64_t)v92)
        {
          v38 = llvm::raw_ostream::write((llvm::raw_ostream *)&v88, v36, v37);
          v39 = (_WORD *)*((_QWORD *)v38 + 4);
          if (*((_QWORD *)v38 + 3) - (_QWORD)v39 > 1uLL)
            goto LABEL_36;
          goto LABEL_40;
        }
        if (v37)
        {
          memcpy(v92, v36, v37);
          v92 += v37;
        }
      }
      v38 = (llvm::raw_ostream *)&v88;
      v39 = v92;
      if ((unint64_t)(v91 - (_QWORD)v92) > 1)
      {
LABEL_36:
        *v39 = 8250;
        *((_QWORD *)v38 + 4) += 2;
        goto LABEL_41;
      }
LABEL_40:
      v38 = llvm::raw_ostream::write(v38, ": ", 2uLL);
LABEL_41:
      objc_msgSend(*((id *)self + 18), "objectForKeyedSubscript:", v34);
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v41 = (const char *)objc_msgSend(v40, "UTF8String");
      v42 = v41;
      if (v41)
      {
        v43 = strlen(v41);
        v44 = (void *)*((_QWORD *)v38 + 4);
        if (v43 <= *((_QWORD *)v38 + 3) - (_QWORD)v44)
        {
          if (v43)
          {
            memcpy(v44, v42, v43);
            *((_QWORD *)v38 + 4) += v43;
          }
        }
        else
        {
          llvm::raw_ostream::write(v38, v42, v43);
        }
      }

      v45 = v9;
      v104 = 260;
      *(_QWORD *)&v103[0] = __p;
      v46 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)v103);
      v47 = v46;
      if (v87 < v86)
      {
        *v87++ = v46;
        llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v88);
        if (SHIBYTE(v98) < 0)
          goto LABEL_29;
        goto LABEL_30;
      }
      v48 = v87 - v31;
      v49 = v48 + 1;
      if ((unint64_t)(v48 + 1) >> 61)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      if (((char *)v86 - (char *)v31) >> 2 > v49)
        v49 = ((char *)v86 - (char *)v31) >> 2;
      if ((unint64_t)((char *)v86 - (char *)v31) >= 0x7FFFFFFFFFFFFFF8)
        v50 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v50 = v49;
      if (v50)
      {
        if (v50 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v51 = operator new(8 * v50);
        v52 = (uint64_t *)&v51[8 * v48];
        *v52 = v47;
        v53 = (uint64_t)(v52 + 1);
        v54 = (char *)v87 - (char *)v31;
        if (v87 == v31)
          goto LABEL_63;
      }
      else
      {
        v51 = 0;
        v52 = (uint64_t *)(8 * v48);
        *(_QWORD *)(8 * v48) = v47;
        v53 = 8 * v48 + 8;
        v54 = (char *)v87 - (char *)v31;
        if (v87 == v31)
          goto LABEL_63;
      }
      v55 = v54 - 8;
      if (v55 < 0x168)
      {
        v56 = v87;
        goto LABEL_62;
      }
      v58 = ((char *)(v87 - 1) - (char *)v31) & 0xFFFFFFFFFFFFFFF8;
      if (&v51[(char *)v87 - (char *)v31 - 8 - v58] > &v51[(char *)v87 - (char *)v31 - 8])
      {
        v56 = v87;
        do
        {
LABEL_62:
          v57 = *--v56;
          *--v52 = v57;
        }
        while (v56 != v31);
        goto LABEL_63;
      }
      if ((uint64_t *)((char *)v87 - v58 - 8) > v87 - 1)
      {
        v56 = v87;
        goto LABEL_62;
      }
      if ((unint64_t)((char *)v31 - v51) < 0x20)
      {
        v56 = v87;
        goto LABEL_62;
      }
      v59 = (v55 >> 3) + 1;
      v60 = 8 * (v59 & 0x3FFFFFFFFFFFFFFCLL);
      v56 = &v87[v60 / 0xFFFFFFFFFFFFFFF8];
      v52 = (uint64_t *)((char *)v52 - v60);
      v61 = &v51[8 * v48 - 16];
      v62 = v87 - 2;
      v63 = v59 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v64 = *(_OWORD *)v62;
        *(v61 - 1) = *((_OWORD *)v62 - 1);
        *v61 = v64;
        v61 -= 2;
        v62 -= 4;
        v63 -= 4;
      }
      while (v63);
      if (v59 != (v59 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_62;
LABEL_63:
      v86 = (uint64_t *)&v51[8 * v50];
      if (v31)
        operator delete(v31);
      v31 = v52;
      v87 = (uint64_t *)v53;
      llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v88);
      if (SHIBYTE(v98) < 0)
LABEL_29:
        operator delete(__p[0]);
LABEL_30:
      ++v32;
      v9 = v45;
    }
    while (v32 != v85);
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
  }
  while (v30);
LABEL_80:

  v88 = "mps.callables";
  LOWORD(v92) = 259;
  v65 = mlir::StringAttr::get((mlir::StringAttr *)a5, (mlir::MLIRContext *)&v88);
  v66 = mlir::ArrayAttr::get((mlir::MLIRContext *)a5, (uint64_t)v31, v87 - v31);
  mlir::NamedAttribute::NamedAttribute(v103, v65, v66);
  v67 = v81;
  v69 = (char *)v81->var1;
  v68 = v81->var2.var0;
  if (v69 < (char *)v68)
  {
    *(_OWORD *)v69 = v103[0];
    v70 = (NamedAttribute *)(v69 + 16);
    goto LABEL_98;
  }
  v71 = v81->var0;
  v72 = (v69 - (char *)v81->var0) >> 4;
  v73 = v72 + 1;
  if ((unint64_t)(v72 + 1) >> 60)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  v74 = v68 - v71;
  if (v74 >> 3 > v73)
    v73 = v74 >> 3;
  if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF0)
    v75 = 0xFFFFFFFFFFFFFFFLL;
  else
    v75 = v73;
  if (v75)
  {
    if (v75 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v76 = (char *)operator new(16 * v75);
  }
  else
  {
    v76 = 0;
  }
  v77 = (NamedAttribute *)&v76[16 * v72];
  v78 = (NamedAttribute *)&v76[16 * v75];
  *(_OWORD *)v77 = v103[0];
  v70 = (NamedAttribute *)((char *)v77 + 16);
  if (v69 == (char *)v71)
  {
    v67 = v81;
    v81->var0 = v77;
    v81->var1 = v70;
    v81->var2.var0 = v78;
    if (!v69)
      goto LABEL_98;
    goto LABEL_97;
  }
  do
  {
    *((_OWORD *)v77 - 1) = *((_OWORD *)v69 - 1);
    v77 = (NamedAttribute *)((char *)v77 - 16);
    v69 -= 16;
  }
  while (v69 != (char *)v71);
  v67 = v81;
  v69 = (char *)v81->var0;
  v81->var0 = v77;
  v81->var1 = v70;
  v81->var2.var0 = v78;
  if (v69)
  {
LABEL_97:
    operator delete(v69);
    v67 = v81;
  }
LABEL_98:
  v67->var1 = v70;
  if (v31)
    operator delete(v31);
LABEL_100:

  return result;
}

- (ModuleOp)specializedModuleWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5 fallingBack:(BOOL)a6 fallbackRuntimeKey:(const void *)a7
{
  MPSGraphDevice *v11;
  id v12;
  void *v13;
  MPSGraphCompilationDescriptor *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  unint64_t i;
  MPSGraphShapedType *v26;
  void *v27;
  MPSGraphShapedType *v28;
  id v29;
  uint64_t DeviceKey;
  void *v31;
  void *v32;
  int v33;
  mlir::MLIRContext *v34;
  int v35;
  void *v36;
  BOOL v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  unsigned __int8 v39;
  mlir::MLIRContext *v40;
  Operation *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  MLIRContext *ptr;
  int v47;
  void *v48;
  BOOL v49;
  mlir::MLIRContext *v50;
  void (**v51)(_QWORD, _QWORD, _QWORD);
  mlir::Operation *v52;
  int v53;
  std::string *p_p;
  std::string::size_type size;
  unint64_t v56;
  mlir::MLIRContext *v57;
  int8x8_t v58;
  unint64_t v59;
  uint8x8_t v60;
  unint64_t v61;
  uint64_t **v62;
  uint64_t *v63;
  std::string::size_type v64;
  std::string *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  mlir::MLIRContext *v75;
  uint64_t Results;
  unint64_t v77;
  uint64_t v78;
  mlir::mps *v79;
  uint64_t InterfaceFor;
  char *v81;
  unsigned int *v82;
  uint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  const char *v86;
  const char *v87;
  unint64_t v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  unint64_t *v100;
  unint64_t v101;
  LazyLoadableModuleRef *v102;
  LazyLoadableModuleRef *v103;
  void *v104;
  BOOL v105;
  void (**v106)(_QWORD, _QWORD, _QWORD);
  MPSGraphDevice *v107;
  void *v108;
  BOOL v109;
  void (**v110)(_QWORD, _QWORD, _QWORD);
  int v112;
  uint64_t v113;
  const void *v114;
  _BOOL4 v115;
  id v116;
  MPSGraphDevice *v117;
  MPSGraphCompilationDescriptor *v118;
  std::recursive_mutex *v119;
  void *v120;
  LazyLoadableModuleRef *v121;
  mlir::Operation *v122;
  mlir::Operation *v123;
  std::string __p;
  void *v125;
  _BYTE *v126;
  std::string v127;
  void *v128;
  _BYTE *v129;
  void *v130;
  _BYTE *v131;
  Operation *v132;
  mlir::mps *v133;
  LazyLoadableModuleRef v134;
  LazyLoadableModuleRef *v135;
  unint64_t v136[2];
  unint64_t v137[2];
  _BYTE *v138;
  int v139;
  _BYTE v140[48];
  id v141;
  id v142;
  id v143;
  int64_t v144;
  const MPSGraphModuleKey *v145[2];
  _QWORD v146[8];

  v115 = a6;
  v146[6] = *MEMORY[0x1E0C80C00];
  v11 = (MPSGraphDevice *)a3;
  v116 = a4;
  v12 = a5;
  v13 = v12;
  if (!v12)
    v13 = (void *)*((_QWORD *)self + 17);
  v14 = v13;

  -[MPSGraphCompilationDescriptor callables](v14, "callables");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v11;
  v118 = v14;
  if (v15)
  {
    -[MPSGraphCompilationDescriptor callables](v14, "callables");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)self + 17), "callables");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v16 == v17;
    v14 = v118;
    if (!v18)
    {
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
    }
  }
  -[MPSGraphCompilationDescriptor entryFunctionName](v14, "entryFunctionName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[MPSGraphCompilationDescriptor entryFunctionName](v14, "entryFunctionName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)self + 17), "entryFunctionName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    v11 = v117;
    v14 = v118;
    if ((v22 & 1) == 0)
    {
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
    }
  }
  v114 = a7;
  v23 = v116;
  v120 = v23;
  if ((-[MPSGraphCompilationDescriptor compilerOptions](v14, "compilerOptions") & 1) == 0)
  {

    v120 = 0;
  }
  v119 = (std::recursive_mutex *)((char *)self + 240);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 240));
  if (*((_QWORD *)self + 80) >= *((_QWORD *)self + 79))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v23, "count"); ++i)
    {
      v26 = [MPSGraphShapedType alloc];
      objc_msgSend(v23, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[MPSGraphShapedType initWithShape:dataType:](v26, "initWithShape:dataType:", 0, objc_msgSend(v27, "dataType"));

      objc_msgSend(v24, "addObject:", v28);
    }
    v29 = v24;

    v120 = v29;
  }
  std::recursive_mutex::unlock(v119);
  std::recursive_mutex::lock(v119);
  getFlatShapes(&v138, v120);
  DeviceKey = getDeviceKey(v11);
  v31 = (void *)*((_QWORD *)self + 18);
  objc_msgSend(*((id *)self + 17), "entryFunctionName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  MPSGraphModuleKey::MPSGraphModuleKey(&v134, (uint64_t)&v138, v14, v31, v32, DeviceKey);

  if (v11)
  {
    v145[0] = 0;
    v33 = llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::LookupBucketFor<MPSGraphModuleKey>(*((_QWORD *)self + 22), *((unsigned int *)self + 48), (const void **)&v134._ctx.__ptr_, v145);
    v35 = v145[0] == (const MPSGraphModuleKey *)(*((_QWORD *)self + 22) + 104 * *((unsigned int *)self + 48))
        ? 0
        : v33;
    if (v35 == 1)
    {
      v132 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v145[0] + 12), v34);
      if (!v132 && MTLReportFailureTypeEnabled())
        MTLReportFailure();
      -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == 0;

      if (!v37)
      {
        -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
        v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, MPSGraphExecutable *, _QWORD))v38)[2](v38, self, 0);

      }
      if ((OwningOpRef<mlir::ModuleOp> *)v134._ctx.__ptr_ != &v134._originalModule)
        free(v134._ctx.__ptr_);
      if (v138 != v140)
        free(v138);
      std::recursive_mutex::unlock(v119);
      goto LABEL_162;
    }
  }

  if ((OwningOpRef<mlir::ModuleOp> *)v134._ctx.__ptr_ != &v134._originalModule)
    free(v134._ctx.__ptr_);
  if (v138 != v140)
    free(v138);
  std::recursive_mutex::unlock(v119);
  if (v14 != *((MPSGraphCompilationDescriptor **)self + 17))
    overrideCompilationDescriptorWithEV(v14);
  -[MPSGraphExecutable optimizeOriginalModule](self, "optimizeOriginalModule");
  v39 = atomic_load((unsigned __int8 *)self + 492);
  if ((v39 & 1) == 0)
    __assert_rtn("-[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]", "MPSGraphExecutable.mm", 2296, "_originalModuleIsOptimized && \"original module should be already optimized\");
  std::recursive_mutex::lock(v119);
  v41 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v40);
  getFlatShapes(v145, v120);
  v42 = getDeviceKey(v11);
  v43 = (void *)*((_QWORD *)self + 18);
  objc_msgSend(*((id *)self + 17), "entryFunctionName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  MPSGraphModuleKey::MPSGraphModuleKey(&v138, (uint64_t)v145, v14, v43, v44, v42);

  if (v11)
  {
    v134._ctx.__ptr_ = 0;
    v45 = llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::LookupBucketFor<MPSGraphModuleKey>(*((_QWORD *)self + 22), *((unsigned int *)self + 48), (const void **)&v138, (const MPSGraphModuleKey **)&v134);
    ptr = v134._ctx.__ptr_;
    v47 = v134._ctx.__ptr_ == (MLIRContext *)(*((_QWORD *)self + 22) + 104 * *((unsigned int *)self + 48)) ? 0 : v45;
    if (v47 == 1)
    {
      -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48 == 0;

      if (!v49)
      {
        -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
        v51 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, MPSGraphExecutable *, _QWORD))v51)[2](v51, self, 0);

      }
      v52 = 0;
      v132 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)ptr + 12), v50);
      v53 = 1;
      goto LABEL_151;
    }
  }
  -[MPSGraphExecutable convertMPSGraphShapesToMLIRTypes:funcOp:compilationDescriptor:](self, "convertMPSGraphShapesToMLIRTypes:funcOp:compilationDescriptor:", v120, -[MPSGraphExecutable getEntryFuncOpForModule:](self, "getEntryFuncOpForModule:", v41), v14);
  -[MPSGraphExecutable getAttributesFromDescriptors:context:device:](self, "getAttributesFromDescriptors:context:device:", v14, mlir::Attribute::getContext((Operation *)((char *)v41 + 24)), v11);
  getSignatureOfModule(&v127, (uint64_t)v41, v128, (v129 - (_BYTE *)v128) >> 4, (uint64_t)&v130);
  -[MPSGraphExecutable getAttributesFromDescriptors:context:device:](self, "getAttributesFromDescriptors:context:device:", v14, mlir::Attribute::getContext((Operation *)((char *)v41 + 24)), 0);
  getSignatureOfModule(&__p, (uint64_t)v41, v125, (v126 - (_BYTE *)v125) >> 4, (uint64_t)&v130);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v56 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v134, (uint64_t *)p_p, size);
  v58 = *(int8x8_t *)((char *)self + 208);
  if (!*(_QWORD *)&v58)
    goto LABEL_99;
  v59 = v56;
  v60 = (uint8x8_t)vcnt_s8(v58);
  v60.i16[0] = vaddlv_u8(v60);
  if (v60.u32[0] > 1uLL)
  {
    v61 = v56;
    if (v56 >= *(_QWORD *)&v58)
      v61 = v56 % *(_QWORD *)&v58;
  }
  else
  {
    v61 = (*(_QWORD *)&v58 - 1) & v56;
  }
  v62 = *(uint64_t ***)(*((_QWORD *)self + 25) + 8 * v61);
  if (!v62 || (v63 = *v62) == 0)
  {
LABEL_99:
    v123 = 0;
    v132 = 0;
    goto LABEL_100;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v64 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v64 = __p.__r_.__value_.__l.__size_;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v65 = &__p;
  else
    v65 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (v60.u32[0] < 2uLL)
  {
    v66 = *(_QWORD *)&v58 - 1;
    while (1)
    {
      v71 = v63[1];
      if (v71 == v59)
      {
        v72 = *((unsigned __int8 *)v63 + 39);
        if ((v72 & 0x80u) == 0)
          v73 = *((unsigned __int8 *)v63 + 39);
        else
          v73 = v63[3];
        if (v73 == v64)
        {
          if ((v72 & 0x80) != 0)
          {
            if (!memcmp((const void *)v63[2], v65, v63[3]))
              goto LABEL_98;
          }
          else
          {
            if (!*((_BYTE *)v63 + 39))
              goto LABEL_98;
            v74 = 0;
            while (*((unsigned __int8 *)v63 + v74 + 16) == v65->__r_.__value_.__s.__data_[v74])
            {
              if (v72 == ++v74)
                goto LABEL_131;
            }
          }
        }
      }
      else if ((v71 & v66) != v61)
      {
        goto LABEL_99;
      }
      v63 = (uint64_t *)*v63;
      if (!v63)
        goto LABEL_99;
    }
  }
  while (1)
  {
    v67 = v63[1];
    if (v67 == v59)
      break;
    if (v67 >= *(_QWORD *)&v58)
      v67 %= *(_QWORD *)&v58;
    if (v67 != v61)
      goto LABEL_99;
LABEL_68:
    v63 = (uint64_t *)*v63;
    if (!v63)
      goto LABEL_99;
  }
  v68 = *((unsigned __int8 *)v63 + 39);
  if ((v68 & 0x80u) == 0)
    v69 = *((unsigned __int8 *)v63 + 39);
  else
    v69 = v63[3];
  if (v69 != v64)
    goto LABEL_68;
  if ((v68 & 0x80) != 0)
  {
    if (!memcmp((const void *)v63[2], v65, v63[3]))
      goto LABEL_98;
    goto LABEL_68;
  }
  if (!*((_BYTE *)v63 + 39))
  {
LABEL_98:
    v123 = 0;
    v132 = 0;
    v11 = v117;
    v14 = v118;
    goto LABEL_132;
  }
  v70 = 0;
  do
  {
    if (*((unsigned __int8 *)v63 + v70 + 16) != v65->__r_.__value_.__s.__data_[v70])
      goto LABEL_68;
    ++v70;
  }
  while (v68 != v70);
LABEL_131:
  v11 = v117;
  v14 = v118;
  v123 = 0;
  v132 = 0;
  if (!v63)
  {
LABEL_100:
    LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v57);
    mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)((char *)self + 56));
  }
LABEL_132:
  v132 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)(v63 + 5), v57);
  if (v11)
  {
    if ((-[MPSGraphCompilationDescriptor compilerOptions](v14, "compilerOptions") & 1) != 0)
    {
      v133 = -[MPSGraphExecutable getEntryFuncOpForModule:](self, "getEntryFuncOpForModule:", v132);
      v75 = (mlir::MLIRContext *)*((_QWORD *)self + 2);
      mlir::ValueRange::ValueRange(v137, (uint64_t)v130, (v131 - (_BYTE *)v130) >> 3);
      v134._ctx.__ptr_ = (MLIRContext *)mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v133);
      Results = mlir::FunctionType::getResults((mlir::FunctionType *)&v134);
      mlir::ValueRange::ValueRange(v136, Results, v77);
      v78 = mlir::FunctionType::get(v75, v137[0], v137[1], v136[0], v136[1]);
      v79 = v133;
      if (v133)
      {
        InterfaceFor = mlir::OpInterface<mlir::FunctionOpInterface,mlir::detail::FunctionOpInterfaceInterfaceTraits>::getInterfaceFor((uint64_t)v133);
        if (!InterfaceFor)
          __assert_rtn("Interface", "InterfaceSupport.h", 110, "(!t || conceptImpl) && \"expected value to provide interface instance\");
      }
      else
      {
        InterfaceFor = 0;
      }
      mlir::function_interface_impl::setFunctionType((uint64_t)v79, InterfaceFor, v78);
      v134._ctx.__ptr_ = (MLIRContext *)mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v133);
      mlir::FunctionType::getInputs((mlir::FunctionType *)&v134);
      v82 = (unsigned int *)v133;
      v83 = v81;
      if ((_DWORD)v81)
      {
        v84 = 0;
        v85 = v130;
        v86 = "index < numRegions && \"invalid region index\";
        v81 = "Operation.h";
        v87 = "getRegion";
        while (1)
        {
          v88 = v82[11];
          if ((v88 & 0x7FFFFF) == 0)
          {
            v112 = 666;
            goto LABEL_166;
          }
          v89 = (unint64_t)&v82[4 * ((v88 >> 23) & 1) + 16] + ((v88 >> 21) & 0x7F8);
          if (v89 > 0xFFFFFFFFFFFFFFF8)
          {
            v112 = 191;
            v87 = "alignAddr";
            v81 = "Alignment.h";
            v86 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
            goto LABEL_166;
          }
          v90 = (_QWORD *)(((v89 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * v82[10]);
          if ((_QWORD *)*v90 == v90)
            break;
          v91 = v90[1];
          v92 = v91 - 8;
          if (!v91)
            v92 = 0;
          v93 = *(_QWORD *)(v92 + 48);
          if (v84 >= (*(_QWORD *)(v92 + 56) - v93) >> 3)
            break;
          v94 = v85[v84];
          if ((v94 & 7) != 0)
          {
            v112 = 203;
            v87 = "updatePointer";
            v81 = "PointerIntPair.h";
            v86 = "(PtrWord & ~PointerBitMask) == 0 && \"Pointer is not sufficiently aligned\";
            goto LABEL_166;
          }
          *(_QWORD *)(*(_QWORD *)(v93 + 8 * v84) + 8) = *(_QWORD *)(*(_QWORD *)(v93 + 8 * v84) + 8) & 7 | v94;
          if (v83 == ++v84)
            goto LABEL_116;
        }
        v112 = 443;
        v87 = "operator[]";
        v81 = "ArrayRef.h";
        v86 = "Index < this->size() && \"Invalid index!\";
LABEL_166:
        __assert_rtn(v87, v81, v112, v86);
      }
LABEL_116:
      mlir::mps::inferTypes((mlir::mps *)v82, (mlir::Operation *)v81);
    }
    -[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:](self, "optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:", v11, &v132, (*((_QWORD *)self + 68))++, v14);
    v52 = v122;
    v95 = operator new();
    v96 = v95;
    v97 = (__shared_weak_count *)*((_QWORD *)self + 3);
    v134._ctx.__ptr_ = (MLIRContext *)*((_QWORD *)self + 2);
    v134._ctx.__cntrl_ = v97;
    if (v97)
    {
      v98 = (unint64_t *)((char *)v97 + 8);
      do
        v99 = __ldxr(v98);
      while (__stxr(v99 + 1, v98));
    }
    LazyLoadableModuleRef::LazyLoadableModuleRef(v95, (mlir::MLIRContext **)&v134, &v122);
    v121 = (LazyLoadableModuleRef *)v96;
    if (v97)
    {
      v100 = (unint64_t *)((char *)v97 + 8);
      do
        v101 = __ldaxr(v100);
      while (__stlxr(v101 - 1, v100));
      if (!v101)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v97 + 16))(v97);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v97);
      }
    }
    v134._ctx.__ptr_ = (MLIRContext *)&v134._originalModule;
    v134._ctx.__cntrl_ = (__shared_weak_count *)0x600000000;
    if (v139)
      llvm::SmallVectorImpl<long long>::operator=((uint64_t)&v134, (uint64_t)&v138);
    v134._modelFileArchivePath.__r_.__value_.var0.__l.__size_ = (unint64_t)v141;
    *((_QWORD *)&v134._modelFileArchivePath.__r_.__value_.var0.__l + 2) = v142;
    *(_QWORD *)&v134._modelFileArchivePath.__r_.var0 = v143;
    v134._modelFileArchivePath.var0 = v144;
    v102 = v121;
    v121 = 0;
    v135 = v102;
    llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::try_emplace<std::unique_ptr<LazyLoadableModuleRef>>((uint64_t)&v133, (uint64_t)self + 176, (uint64_t)&v134, (const void **)&v135);
    v103 = v135;
    v135 = 0;
    if (v103)
    {
      LazyLoadableModuleRef::~LazyLoadableModuleRef(v103);
      MEMORY[0x186DA1680]();
    }

    if ((OwningOpRef<mlir::ModuleOp> *)v134._ctx.__ptr_ != &v134._originalModule)
      free(v134._ctx.__ptr_);
    ++*((_QWORD *)self + 80);
    if (v122)
      mlir::Operation::erase(v122);
    if (v123)
      mlir::Operation::erase(v123);
    v53 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_142:
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v104 == 0;

    if (!v105)
    {
      -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
      v106 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, MPSGraphExecutable *, _QWORD))v106)[2](v106, self, 0);

    }
    v52 = 0;
    v53 = 1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_142;
  }
  if (v125)
  {
    v126 = v125;
    operator delete(v125);
  }
  if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v127.__r_.__value_.__l.__data_);
  if (v128)
  {
    v129 = v128;
    operator delete(v128);
  }
  if (v130)
  {
    v131 = v130;
    operator delete(v130);
  }
LABEL_151:

  if (v138 != v140)
    free(v138);
  if ((_QWORD *)v145[0] != v146)
    free(v145[0]);
  std::recursive_mutex::unlock(v119);
  if (!v53)
  {
    if (!v52 && MTLReportFailureTypeEnabled())
      MTLReportFailure();
    if (v11)
    {
      v107 = v11;

      -[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", v107, v52, v120, v14, v115, v114);
    }
    -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler", v113);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108 == 0;

    if (!v109)
    {
      -[MPSGraphCompilationDescriptor compilationCompletionHandler](v14, "compilationCompletionHandler");
      v110 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, MPSGraphExecutable *, _QWORD))v110)[2](v110, self, 0);

    }
    v132 = v52;
  }
LABEL_162:

  return (ModuleOp)v132;
}

- (void)specializeWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  MPSGraphCompilationDescriptor *v8;
  void *v9;
  MPSGraphDevice *v10;

  v10 = device;
  v8 = compilationDescriptor;
  getShapesFromTypes(inputTypes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphExecutable specializeWithDevice:inputShapes:compilationDescriptor:](self, "specializeWithDevice:inputShapes:compilationDescriptor:", v10, v9, v8);

}

- (void)specializeForMultipleInputTypesWithDevice:(id)a3 multipleInputTypes:(id)a4 compilationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v13[5];
  id v14;
  id v15;
  std::unique_lock<std::mutex> __lk;
  _QWORD v17[4];
  id v18;
  MPSGraphExecutable *v19;
  id v20;
  std::mutex *v21;
  uint64_t *v22;
  std::condition_variable *v23;
  uint64_t v24;
  std::mutex v25;
  std::condition_variable v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "count");
  if (!objc_msgSend(v9, "count") && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (objc_msgSend(v10, "waitForCompilationCompletion"))
  {
    memset(v26.__cv_.__opaque, 0, sizeof(v26.__cv_.__opaque));
    v26.__cv_.__sig = 1018212795;
    memset(v25.__m_.__opaque, 0, sizeof(v25.__m_.__opaque));
    v24 = objc_msgSend(v9, "count");
    v25.__m_.__sig = 850045863;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke;
    v17[3] = &unk_1E0E770A0;
    v18 = v10;
    v19 = self;
    v20 = v8;
    v21 = &v25;
    v22 = &v24;
    v23 = &v26;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
    __lk.__m_ = &v25;
    __lk.__owns_ = 1;
    std::mutex::lock(&v25);
    while (atomic_load((unint64_t *)&v24))
      std::condition_variable::wait(&v26, &__lk);
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);

    std::mutex::~mutex(&v25);
    std::condition_variable::~condition_variable(&v26);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_3;
    v13[3] = &unk_1E0E770C8;
    v13[4] = self;
    v14 = v8;
    v15 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

  }
}

void __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v6 + 368);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_2;
  block[3] = &unk_1E0E77078;
  block[4] = v6;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  dispatch_async(v5, block);
  if (v4)

}

void __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_2(uint64_t a1)
{
  std::mutex *v2;
  unint64_t *v3;
  unint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "specializeWithDevice:inputTypes:compilationDescriptor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(std::mutex **)(a1 + 64);
  std::mutex::lock(v2);
  v3 = *(unint64_t **)(a1 + 72);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  if (!atomic_load(*(unint64_t **)(a1 + 72)))
    std::condition_variable::notify_all(*(std::condition_variable **)(a1 + 80));
  std::mutex::unlock(v2);
}

uint64_t __105__MPSGraphExecutable_specializeForMultipleInputTypesWithDevice_multipleInputTypes_compilationDescriptor___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "specializeWithDevice:inputTypes:compilationDescriptor:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

- (NSArray)getOutputTypesWithDevice:(MPSGraphDevice *)device inputTypes:(NSArray *)inputTypes compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  MPSGraphDevice *v8;
  NSArray *v9;
  MPSGraphCompilationDescriptor *v10;
  void *v11;
  ReturnOp v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v8 = device;
  v9 = inputTypes;
  v10 = compilationDescriptor;
  getShapesFromTypes(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((MPSGraphCompilationDescriptor **)self + 17) != v10)
    overrideCompilationDescriptorWithEV(v10);
  v12.var0 = (Operation *)-[MPSGraphExecutable returnOpForFunctionInModule:](self, "returnOpForFunctionInModule:", -[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", v8, v11, v10, 0, 0));
  if ((*((_BYTE *)v12.var0 + 46) & 0x80) != 0)
    v13 = *((unsigned int *)v12.var0 + 17);
  else
    v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)v12.var0 + 46) & 0x80) != 0)
  {
    v15 = -1;
    v16 = 24;
    do
    {
      if (++v15 >= (unint64_t)*((unsigned int *)v12.var0 + 17))
        break;
      getMPSGraphShapedType((uint64_t **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v12.var0 + 9) + v16) + 8) & 0xFFFFFFFFFFFFFFF8));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v17);
      v16 += 32;

    }
    while ((*((_BYTE *)v12.var0 + 46) & 0x80) != 0);
  }

  return (NSArray *)v14;
}

- (void)specializeWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "waitForCompilationCompletion") & 1) != 0)
  {
    -[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", v8, v9, v10, 0, 0);
  }
  else
  {
    std::mutex::lock((std::mutex *)((char *)self + 376));
    v11 = (unsigned int *)((char *)self + 488);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
    std::mutex::unlock((std::mutex *)((char *)self + 376));
    objc_msgSend(v10, "dispatchQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "dispatchQueue");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = *((_QWORD *)self + 46);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__MPSGraphExecutable_specializeWithDevice_inputShapes_compilationDescriptor___block_invoke;
    v15[3] = &unk_1E0E77118;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    dispatch_async(v14, v15);
    if (v13)

  }
}

void __77__MPSGraphExecutable_specializeWithDevice_inputShapes_compilationDescriptor___block_invoke(uint64_t a1)
{
  std::mutex *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  objc_msgSend(*(id *)(a1 + 32), "specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, 0);
  v2 = (std::mutex *)(*(_QWORD *)(a1 + 32) + 376);
  std::mutex::lock(v2);
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 488);
  do
  {
    v4 = __ldaxr(v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, v3));
  if (!v5)
    std::condition_variable::notify_all((std::condition_variable *)(*(_QWORD *)(a1 + 32) + 440));
  std::mutex::unlock(v2);
}

- (ModuleOp)specializeWithDevice:(id)a3 inputsArray:(id)a4 compilationDescriptor:(id)a5
{
  return (ModuleOp)-[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", a3, a4, a5, 0, 0);
}

- (void)checkCallablesForModule:(void *)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  mlir::GenericProgramPoint *v10;
  mlir::GenericProgramPoint *v11;
  mlir::GenericProgramPoint *v12;
  mlir::ForwardIterator *v13;
  char **v14;
  char **v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t Body;
  uint64_t i;
  uint64_t v21;
  mlir::GenericProgramPoint *v22;
  mlir::GenericProgramPoint *v23;
  mlir::GenericProgramPoint *v24;
  mlir::ForwardIterator *v25;
  char *v26;
  char *v27;
  char *v28;
  unsigned int *v29;
  mlir::StringAttr *Context;
  char *v31;
  char **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t j;
  uint64_t v38;
  mlir::GenericProgramPoint *v39;
  mlir::GenericProgramPoint *v40;
  mlir::GenericProgramPoint *v41;
  mlir::ForwardIterator *v42;
  char *v43;
  char **v44;
  BOOL v45;
  const char *v46;
  int v47;
  const char *v48;
  const char *v49;
  void *v50;
  MPSGraphExecutable *v51;
  char **v53;
  char *v54;
  uint64_t v55;
  _QWORD v56[4];
  __int16 v57;
  int *v58;
  int v59;
  _QWORD *v60;

  v54 = 0;
  v55 = 0;
  v53 = &v54;
  v3 = *(_QWORD *)a3;
  v4 = *(unsigned int *)(*(_QWORD *)a3 + 44);
  if ((v4 & 0x7FFFFF) == 0)
  {
    v46 = "index < numRegions && \"invalid region index\";
    v47 = 666;
    v48 = "Operation.h";
    v49 = "getRegion";
    goto LABEL_62;
  }
  v5 = v3 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 > 0xFFFFFFFFFFFFFFF8)
  {
    v46 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
    v47 = 191;
    v48 = "Alignment.h";
    v49 = "alignAddr";
    goto LABEL_62;
  }
  v6 = (_QWORD *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v3 + 40));
  if ((_QWORD *)*v6 == v6)
  {
    v46 = "!region.empty() && \"unexpected empty region\";
    v47 = 895;
    v48 = "OpDefinition.h";
    v49 = "getBody";
LABEL_62:
    __assert_rtn(v49, v48, v47, v46);
  }
  v8 = v6[1];
  if (v8)
    v9 = v8 - 8;
  else
    v9 = 0;
  v60 = &v53;
  v10 = (mlir::GenericProgramPoint *)(v9 + 32);
  v11 = *(mlir::GenericProgramPoint **)(v9 + 40);
  if (v11 != (mlir::GenericProgramPoint *)(v9 + 32))
  {
    do
    {
      v12 = (mlir::GenericProgramPoint *)*((_QWORD *)v11 + 1);
      mlir::GenericProgramPoint::~GenericProgramPoint(v11);
      v56[0] = &v60;
      mlir::detail::walk<mlir::ForwardIterator>(v13, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ46__MPSGraphExecutable_checkCallablesForModule__E4__10NS1_3mps6CallOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
      v11 = v12;
    }
    while (v12 != v10);
    if (v55)
    {
      v14 = v53;
      if (v53 != &v54)
      {
        v51 = self;
        do
        {
          if (*((char *)v14 + 55) < 0)
            v15 = (char **)v14[4];
          else
            v15 = v14 + 4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15, v50);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)self + 17), "callables");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "optimizeOriginalModule");
            v60 = (_QWORD *)objc_msgSend(v18, "getEntryFuncOp");
            v59 = 0;
            Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v60);
            v58 = &v59;
            for (i = *(_QWORD *)(Body + 8); i != Body; i = *(_QWORD *)(i + 8))
            {
              v21 = i - 8;
              if (!i)
                v21 = 0;
              v22 = (mlir::GenericProgramPoint *)(v21 + 32);
              v23 = *(mlir::GenericProgramPoint **)(v21 + 40);
              if (v23 != (mlir::GenericProgramPoint *)(v21 + 32))
              {
                do
                {
                  v24 = (mlir::GenericProgramPoint *)*((_QWORD *)v23 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v23);
                  v56[0] = &v58;
                  mlir::detail::walk<mlir::ForwardIterator>(v25, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZZ46__MPSGraphExecutable_checkCallablesForModule__ENK4__11clENS1_4func6FuncOpEEUlNS1_3mps6CallOpEE_SF_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESP_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
                  v23 = v24;
                }
                while (v24 != v22);
              }
            }
            if (v59 && MTLReportFailureTypeEnabled())
            {
              v50 = v16;
              MTLReportFailure();
            }
          }
          else
          {
            v26 = (char *)*((unsigned __int8 *)v14 + 55);
            v27 = v14[4];
            v28 = v14[5];
            v29 = *(unsigned int **)a3;
            Context = (mlir::StringAttr *)mlir::Attribute::getContext((mlir::Attribute *)(*(_QWORD *)a3 + 24));
            if ((char)v26 >= 0)
              v31 = v26;
            else
              v31 = v28;
            v57 = 261;
            if ((char)v26 >= 0)
              v32 = v14 + 4;
            else
              v32 = (char **)v27;
            v56[0] = v32;
            v56[1] = v31;
            v33 = mlir::StringAttr::get(Context, (mlir::MLIRContext *)v56);
            v34 = mlir::SymbolTable::lookupSymbolIn(v29, v33);
            if (!v34
              || (v35 = llvm::DefaultDoCastIfPossible<mlir::func::FuncOp,mlir::Operation &,llvm::CastInfo<mlir::func::FuncOp,mlir::Operation,void>>::doCastIfPossible(v34)) == 0)
            {
              if (MTLReportFailureTypeEnabled())
              {
                v50 = v16;
                MTLReportFailure();
              }
              v35 = 0;
            }
            v60 = (_QWORD *)v35;
            v59 = 0;
            v36 = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v60);
            v58 = &v59;
            for (j = *(_QWORD *)(v36 + 8); j != v36; j = *(_QWORD *)(j + 8))
            {
              v38 = j - 8;
              if (!j)
                v38 = 0;
              v39 = (mlir::GenericProgramPoint *)(v38 + 32);
              v40 = *(mlir::GenericProgramPoint **)(v38 + 40);
              if (v40 != (mlir::GenericProgramPoint *)(v38 + 32))
              {
                do
                {
                  v41 = (mlir::GenericProgramPoint *)*((_QWORD *)v40 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v40);
                  v56[0] = &v58;
                  mlir::detail::walk<mlir::ForwardIterator>(v42, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZZ46__MPSGraphExecutable_checkCallablesForModule__ENK4__11clENS1_4func6FuncOpEEUlNS1_3mps6CallOpEE_SF_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESP_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)v56, 1);
                  v40 = v41;
                }
                while (v41 != v39);
              }
            }
            if (v59 && MTLReportFailureTypeEnabled())
            {
              v50 = v16;
              MTLReportFailure();
            }
            self = v51;
          }

          v43 = v14[1];
          if (v43)
          {
            do
            {
              v44 = (char **)v43;
              v43 = *(char **)v43;
            }
            while (v43);
          }
          else
          {
            do
            {
              v44 = (char **)v14[2];
              v45 = *v44 == (char *)v14;
              v14 = v44;
            }
            while (!v45);
          }
          v14 = v44;
        }
        while (v44 != &v54);
      }
    }
  }
  std::__tree<std::string>::destroy((uint64_t)&v53, v54);
}

- (OwningOpRef<mlir::ModuleOp>)optimizationPassesWithDevice:(id)a3 sourceModule:(void *)a4 compilationID:(unint64_t)a5 compilationDescriptor:(id)a6
{
  a3;
  a6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("optimizedModule_%lu"), a5);
  objc_claimAutoreleasedReturnValue();
  mlir::Op<mlir::ModuleOp,mlir::OpTrait::OneRegion,mlir::OpTrait::ZeroResults,mlir::OpTrait::ZeroSuccessors,mlir::OpTrait::ZeroOperands,mlir::OpTrait::NoRegionArguments,mlir::OpTrait::NoTerminator,mlir::OpTrait::SingleBlock,mlir::OpTrait::OpInvariants,mlir::BytecodeOpInterface::Trait,mlir::OpTrait::AffineScope,mlir::OpTrait::IsIsolatedFromAbove,mlir::OpTrait::SymbolTable,mlir::SymbolOpInterface::Trait,mlir::OpAsmOpInterface::Trait,mlir::RegionKindInterface::Trait,mlir::OpTrait::HasOnlyGraphRegion>::clone((mlir::Operation::CloneOptions *)a4);
}

- (void)dumpCompiledProducts
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v2 = *((_QWORD *)self + 73);
  if (v2)
  {
    objc_msgSend(*((id *)self + 74), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);
    v17 = 0;
    v4 = (void *)*((_QWORD *)self + 73);
    objc_msgSend(*((id *)self + 72), "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("/%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*((id *)self + 74), "fileExistsAtPath:isDirectory:", v6, &v17))
    {
      v7 = (void *)*((_QWORD *)self + 74);
      v16 = 0;
      objc_msgSend(v7, "removeItemAtPath:error:", v6, &v16);
      v8 = v16;
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)*((_QWORD *)self + 74);
    v10 = *((_QWORD *)self + 72);
    v15 = v8;
    v11 = objc_msgSend(v9, "copyItemAtPath:toPath:error:", v10, v6, &v15);
    v12 = v15;

    if (v11)
      v13 = CFSTR("Copying compiled products to %@");
    else
      v13 = CFSTR("Copying compiled products failed, %@");
    if (v11)
      v14 = v6;
    else
      v14 = v12;
    NSLog(&v13->isa, v14);

  }
}

- (void)aneRegionOpsHashSet:(void *)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  std::recursive_mutex *v10;
  mlir::GenericProgramPoint *v11;
  mlir::GenericProgramPoint *v12;
  mlir::ForwardIterator *v13;
  _QWORD v14[2];
  MPSGraphExecutable *v15;
  _QWORD *v16;

  v15 = self;
  v3 = *(_QWORD *)a3;
  v4 = *(unsigned int *)(*(_QWORD *)a3 + 44);
  if ((v4 & 0x7FFFFF) == 0)
    __assert_rtn("getRegion", "Operation.h", 666, "index < numRegions && \"invalid region index\");
  v5 = v3 + 16 * ((v4 >> 23) & 1) + ((v4 >> 21) & 0x7F8) + 64;
  if (v5 >= 0xFFFFFFFFFFFFFFF9)
    __assert_rtn("alignAddr", "Alignment.h", 191, "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\");
  v6 = (_QWORD *)(((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *(unsigned int *)(v3 + 40));
  if ((_QWORD *)*v6 == v6)
    __assert_rtn("getBody", "OpDefinition.h", 895, "!region.empty() && \"unexpected empty region\");
  v8 = v6[1];
  if (v8)
    v9 = v8 - 8;
  else
    v9 = 0;
  v10 = (std::recursive_mutex *)((char *)self + 240);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 240));
  v14[0] = a3;
  v14[1] = &v15;
  v11 = *(mlir::GenericProgramPoint **)(v9 + 40);
  if (v11 != (mlir::GenericProgramPoint *)(v9 + 32))
  {
    do
    {
      v12 = (mlir::GenericProgramPoint *)*((_QWORD *)v11 + 1);
      mlir::GenericProgramPoint::~GenericProgramPoint(v11);
      v16 = v14;
      mlir::detail::walk<mlir::ForwardIterator>(v13, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ42__MPSGraphExecutable_aneRegionOpsHashSet__E4__16NS1_4func6FuncOpEvEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESM_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v16, 1);
      v11 = v12;
    }
    while (v12 != (mlir::GenericProgramPoint *)(v9 + 32));
  }
  std::recursive_mutex::unlock(v10);
}

- (id)emitViewerSPI
{
  std::recursive_mutex *v3;
  MPSGraph *WeakRetained;
  mlir::MLIRContext *v5;
  ModuleOp v6;
  void *v7;
  _BYTE v9[272];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  WeakRetained = (MPSGraph *)objc_loadWeakRetained((id *)self + 1);
  v6.state = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v5);
  EmitViewerSPI::EmitViewerSPI((EmitBase *)v9, WeakRetained, self, v6);

  EmitViewerSPI::emitGraph((EmitViewerSPI *)v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v9);
  std::recursive_mutex::unlock(v3);
  return v7;
}

- (id)emitViewerSPIWithDevice:(id)a3 inputShapes:(id)a4 compilationDescriptor:(id)a5
{
  Operation *v6;
  MPSGraph *WeakRetained;
  ModuleOp v8;
  void *v9;
  _BYTE v11[272];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = -[MPSGraphExecutable specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "specializedModuleWithDevice:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", a3, a4, a5, 0, 0);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 240));
  WeakRetained = (MPSGraph *)objc_loadWeakRetained((id *)self + 1);
  v8.state = v6;
  EmitViewerSPI::EmitViewerSPI((EmitBase *)v11, WeakRetained, self, v8);

  EmitViewerSPI::emitGraph((EmitViewerSPI *)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v11);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 240));
  return v9;
}

- (void)emitViewerSPIToURL:(id)a3
{
  id v4;
  MPSGraph *WeakRetained;
  mlir::MLIRContext *v6;
  ModuleOp v7;
  NSString *v8;
  id v9[35];

  v9[34] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  WeakRetained = (MPSGraph *)objc_loadWeakRetained((id *)self + 1);
  v7.state = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v6);
  EmitViewerSPI::EmitViewerSPI((EmitBase *)v9, WeakRetained, self, v7);

  if (v4)
  {
    objc_msgSend(v4, "path");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    EmitViewerSPI::emitJSONDump(v9, v8);

  }
  EmitViewerSPI::~EmitViewerSPI((EmitViewerSPI *)v9);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 304));

}

- (id)emitObjCToURL:(id)a3 test:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  std::recursive_mutex *v7;
  MPSGraph *WeakRetained;
  mlir::MLIRContext *v9;
  ModuleOp v10;
  NSString *v11;
  void *v12;
  __int16 v14;
  const __CFString *v15;
  int v16;
  id v17[41];

  v4 = a4;
  v17[40] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  WeakRetained = (MPSGraph *)objc_loadWeakRetained((id *)self + 1);
  v10.state = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v9);
  v14 = 256;
  v15 = CFSTR("getMPSGraphExecutable");
  v16 = 65537;
  EmitObjC::EmitObjC((uint64_t)v17, WeakRetained, self, v10, (uint64_t)&v14);

  if (v6)
  {
    objc_msgSend(v6, "path");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    EmitObjC::emitObjCDump(v17, v11);

  }
  if (v4)
  {
    EmitObjC::runEmitObjCCompile((EmitObjC *)v17, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  EmitObjC::~EmitObjC(v17);
  std::recursive_mutex::unlock(v7);

  return v12;
}

- (void)emitObjUnitTestToUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPSGraph *WeakRetained;
  mlir::MLIRContext *v10;
  Operation *v11;
  id v12;
  ModuleOp v13;
  __int16 v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18[41];

  v18[40] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("test_%@_buildExecutable"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  WeakRetained = (MPSGraph *)objc_loadWeakRetained((id *)self + 1);
  v11 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v10);
  v14 = 0;
  v12 = v8;
  v15 = v12;
  v16 = 16777472;
  v13.state = v11;
  EmitObjC::EmitObjC((uint64_t)v18, WeakRetained, self, v13, (uint64_t)&v14);

  v17 = 0;
  objc_msgSend(v18[27], "writeToFile:atomically:encoding:error:", v5, 1, 4, &v17);
  EmitObjC::~EmitObjC(v18);
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 304));

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  MPSSymbolTable *v7;
  objc_super v8;
  id v9;
  char v10;

  v10 = 0;
  if (!objc_msgSend(*((id *)self + 74), "fileExistsAtPath:isDirectory:", *((_QWORD *)self + 72), &v10))
  {
    v5 = 0;
    v6 = *((_QWORD *)self + 4);
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = (void *)*((_QWORD *)self + 74);
  v4 = *((_QWORD *)self + 72);
  v9 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", v4, &v9);
  v5 = v9;
  v6 = *((_QWORD *)self + 4);
  if (v6)
LABEL_5:
    MEMORY[0x186DA1680](v6, 0x20C40DC1BFBCFLL);
LABEL_6:
  v7 = (MPSSymbolTable *)*((_QWORD *)self + 16);
  if (v7)
  {
    MPSSymbolTable::~MPSSymbolTable(v7);
    MEMORY[0x186DA1680]();
  }

  v8.receiver = self;
  v8.super_class = (Class)MPSGraphExecutable;
  -[MPSGraphExecutable dealloc](&v8, sel_dealloc);
}

- (void)dump
{
  MPSGraphExecutable *v2;
  std::recursive_mutex *v3;
  mlir::MLIRContext *v4;

  v2 = self;
  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  v2 = (MPSGraphExecutable *)((char *)v2 + 40);
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)v2, v4);
  mlir::Operation::dump(*((mlir::Operation **)v2 + 2));
  std::recursive_mutex::unlock(v3);
}

- (id)getIR
{
  std::recursive_mutex *v3;
  mlir::MLIRContext *v4;
  void *v5;
  void *v6;
  _BYTE v8[40];
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  void **v17;
  void *v18[2];
  uint64_t v19;

  v18[0] = 0;
  v18[1] = 0;
  v19 = 0;
  v10 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 1;
  v12 = 0;
  v13 = 0;
  v11 = 0;
  v9 = &unk_1E0E22B10;
  v17 = v18;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v9, 0, 0, 0);
  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  self = (MPSGraphExecutable *)((char *)self + 40);
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)self, v4);
  mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v8);
  mlir::Operation::print(*((mlir::Operation **)self + 2), (llvm::raw_ostream *)&v9, (const mlir::OpPrintingFlags *)v8);
  v5 = v17;
  if (*((char *)v17 + 23) < 0)
    v5 = *v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  std::recursive_mutex::unlock(v3);
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v9);
  if (SHIBYTE(v19) < 0)
    operator delete(v18[0]);
  return v6;
}

- (id)createMLIRLibraryWithMPSGraphPackage:(id)a3 packageKey:(id)a4 appendOptimizedModules:(BOOL)a5
{
  _BOOL4 v5;
  NSString *v7;
  uint64_t v8;
  _BOOL8 v9;
  unint64_t v10;
  void *v11;
  mlir::MLIRContext *v12;
  Operation *v13;
  uint64_t v14;
  unsigned int v15;
  int64x2_t v16;
  MPSGraphModuleKey *v17;
  MPSGraphModuleKey *v18;
  void *v19;
  void *v20;
  mlir::MLIRContext *v21;
  Operation *v22;
  mlir::MLIRContext *v23;
  id v24;
  unint64_t Body;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  mlir::GenericProgramPoint *v29;
  mlir::GenericProgramPoint *v30;
  mlir::GenericProgramPoint *v31;
  mlir::ForwardIterator *v32;
  void *v33;
  mlir::MLIRContext *v34;
  void *Manager;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  BOOL v43;
  const char *v44;
  int8x16_t *v45;
  const unsigned __int8 *v46;
  uint64_t v47;
  uint64_t v48;
  int var1;
  void *v50;
  id v51;
  id v53;
  NSString *v54;
  MPSGraphModuleKey *v55;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  MPSGraphModuleKey *v62[2];
  id v63;
  uint64_t v64;
  id v65;
  MPSGraphOperatingSystemVersion v66;
  id *v67;
  id v68;
  Operation *v69;
  _BYTE v70[128];
  MPSGraphOperatingSystemVersion v71;
  uint64_t v72;

  v5 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v53 = a4;
  objc_msgSend(v57, "getMLIRLibrary");
  v64 = 0;
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (NSString *)v53;
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v71, v7);
  if (v71.var0 < 4 || v71.var0 == 4 && !v71.var1 && v71.var2 <= 20)
  {
    *(_OWORD *)&v71.var0 = xmmword_18128D780;
    v71.var2 = 21;
  }
  MPSGraphOperatingSystemVersion::MPSGraphOperatingSystemVersion(&v66, v7);
  if (v66.var0 >= 4)
  {
    if (v66.var0 == 4)
    {
      v9 = v66.var2 >= 0;
      if (v66.var1 != 4)
        v9 = 1;
      v8 = v66.var1 >= 4 && v9;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  v54 = v7;

  v64 = v8;
  v10 = 0x1E0C99000uLL;
  v63 = (id)objc_opt_new();
  v66.var0 = (int64_t)&v64;
  v66.var1 = (int64_t)&v63;
  v66.var2 = (int64_t)&v65;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  if ((objc_msgSend(v65, "originalFileExists") & 1) == 0)
  {
    -[MPSGraphExecutable optimizeOriginalModule](self, "optimizeOriginalModule");
    objc_msgSend(v57, "createFileHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v12);
    objc_msgSend(v57, "createVersionedBytecodeFromMlirModule:packageKey:fileHandle:resourceStorageMode:downgradedModuleCallback:", v13, v54, v11, v64, llvm::function_ref<void ()(mlir::mps::serialization::ModuleOp)>::callback_fn<-[MPSGraphExecutable createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:]::$_17>, &v66);
    objc_msgSend(v65, "addOriginalMLIRFile:", v11);

  }
  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 304));
  if (v5)
  {
    v14 = *((_QWORD *)self + 22);
    v15 = *((_DWORD *)self + 48);
    if (*((_DWORD *)self + 46))
    {
      v71.var0 = *((_QWORD *)self + 22);
      v71.var1 = v14 + 104 * v15;
      llvm::DenseMapIterator<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>,false>::AdvancePastEmptyBuckets(&v71.var0);
      v16 = *(int64x2_t *)&v71.var0;
      v14 = *((_QWORD *)self + 22);
      v15 = *((_DWORD *)self + 48);
    }
    else
    {
      v16 = vdupq_n_s64(v14 + 104 * (unint64_t)v15);
    }
    *(int64x2_t *)v62 = v16;
    v17 = (MPSGraphModuleKey *)(v14 + 104 * v15);
    v55 = v17;
    while (1)
    {
      v18 = v62[0];
      if (v62[0] == v17)
        break;
      if (v62[0] == v62[1])
        __assert_rtn("operator*", "DenseMap.h", 1263, "Ptr != End && \"dereferencing end() iterator\");
      MPSGraphModuleKeyToJSONString(v62[0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v65, "optimizedFileExistsWithSignature:", v19) & 1) == 0)
      {
        objc_msgSend(v57, "createFileHandle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v18 + 12), v21);
        objc_msgSend(v57, "createBytecodeFromMlirModule:fileHandle:resourceStorageMode:", v22, v20, v64);
        objc_msgSend(v65, "addOptimizedMLIRFile:withSignature:", v20, v19);
        if (v64 == 1)
        {
          v69 = LazyLoadableModuleRef::get(*((LazyLoadableModuleRef **)v18 + 12), v23);
          v24 = (id)objc_opt_new();
          v68 = v24;
          Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v69);
          v67 = &v68;
          v26 = *(_QWORD *)(Body + 8);
          if (v26 != Body)
          {
            v27 = v10;
            do
            {
              v28 = v26 - 8;
              if (!v26)
                v28 = 0;
              v29 = (mlir::GenericProgramPoint *)(v28 + 32);
              v30 = *(mlir::GenericProgramPoint **)(v28 + 40);
              if (v30 != (mlir::GenericProgramPoint *)(v28 + 32))
              {
                do
                {
                  v31 = (mlir::GenericProgramPoint *)*((_QWORD *)v30 + 1);
                  mlir::GenericProgramPoint::~GenericProgramPoint(v30);
                  v71.var0 = (int64_t)&v67;
                  mlir::detail::walk<mlir::ForwardIterator>(v32, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ32getConstantResourcesUsedInModuleINS1_8ModuleOpEEP7NSArrayIP8NSStringET_EUlNS1_3mps10ConstantOpEE_SK_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESU_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v71, 1);
                  v30 = v31;
                }
                while (v31 != v29);
              }
              v26 = *(_QWORD *)(v26 + 8);
            }
            while (v26 != Body);
            v24 = v68;
            v10 = v27;
            v17 = v55;
          }
          objc_msgSend(v24, "allObjects");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "addObjectsFromArray:", v33);
          objc_msgSend(v65, "addOptimizedResourcesUsed:withSignature:", v33, v19);

        }
      }

      v62[0] = (MPSGraphModuleKey *)((char *)v18 + 104);
      llvm::DenseMapIterator<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>,false>::AdvancePastEmptyBuckets((uint64_t *)v62);
    }
  }
  objc_msgSend(v65, "setCallablesDescription:", *((_QWORD *)self + 18));
  objc_msgSend(v65, "setResourceStorageMode:", v64);
  if (objc_msgSend(v63, "count"))
  {
    Manager = mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)self + 2), v34);
    objc_msgSend(v65, "getResourceOffsetsLibrary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v71.var0 = (int64_t)&v71.var2;
    v71.var1 = 0xA00000000;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v37 = v63;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v59 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v36, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42 == 0;

          if (v43)
          {
            v44 = (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
            v45 = (int8x16_t *)v44;
            if (v44)
              v46 = (const unsigned __int8 *)strlen(v44);
            else
              v46 = 0;
            v47 = mlir::mps::MPSResourceBlobManagerInterface::lookup((uint64_t)Manager, v45, v46);
            v48 = v47;
            if ((!v47 || !*(_BYTE *)(v47 + 96)) && MTLReportFailureTypeEnabled())
              MTLReportFailure();
            if (LODWORD(v71.var1) >= (unint64_t)HIDWORD(v71.var1))
            {
              llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v71, &v71.var2, LODWORD(v71.var1) + 1, 8);
              *(_QWORD *)(v71.var0 + 8 * LODWORD(v71.var1)) = v48;
              var1 = v71.var1;
              if (LODWORD(v71.var1) >= HIDWORD(v71.var1))
LABEL_63:
                __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
            }
            else
            {
              *(_QWORD *)(v71.var0 + 8 * LODWORD(v71.var1)) = v48;
              var1 = v71.var1;
              if (LODWORD(v71.var1) >= HIDWORD(v71.var1))
                goto LABEL_63;
            }
            LODWORD(v71.var1) = var1 + 1;
          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v38);
    }

    objc_msgSend(v57, "writeResources:", v71.var0, LODWORD(v71.var1));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addEntriesFromDictionary:", v50);

    if ((int64_t *)v71.var0 != &v71.var2)
      free((void *)v71.var0);

  }
  v51 = v65;

  return v51;
}

- (void)serializeToMPSGraphPackageAtURL:(NSURL *)url descriptor:(MPSGraphExecutableSerializationDescriptor *)descriptor
{
  MPSGraphExecutableSerializationDescriptor *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  MPSGraphPackage *v11;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int active_platform;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSURL *v35;
  id v36;
  _QWORD v37[3];
  std::unique_lock<std::mutex> __lk;
  id v39;

  v35 = url;
  v6 = descriptor;
  if (!v6)
    v6 = objc_alloc_init(MPSGraphExecutableSerializationDescriptor);
  -[MPSGraphExecutableSerializationDescriptor validateMinimumDeploymentTargetForPlatform](v6, "validateMinimumDeploymentTargetForPlatform");
  v7 = (void *)*((_QWORD *)self + 74);
  v39 = 0;
  objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v35, 0, &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  v34 = v8;
  if (!v8 && MTLReportFailureTypeEnabled())
  {
    -[NSURL absoluteString](v35, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedFailureReason");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v9, "code");
    v26 = v24;
    v27 = v25;
    MTLReportFailure();

  }
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("temporary.mpsgraphpackage"), v26, v27, v28, v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPSGraphPackage initWithPackageURL:temporaryPackageURL:append:]([MPSGraphPackage alloc], "initWithPackageURL:temporaryPackageURL:append:", v35, v10, -[MPSGraphExecutableSerializationDescriptor append](v6, "append"));
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 376);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 376));
  while (atomic_load((unsigned int *)self + 122))
    std::condition_variable::wait((std::condition_variable *)((char *)self + 440), &__lk);
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  v14 = -[MPSGraphExecutableSerializationDescriptor deploymentPlatform](v6, "deploymentPlatform");
  if (v6)
    -[MPSGraphExecutableSerializationDescriptor getDeploymentTargetAsOSVersion](v6, "getDeploymentTargetAsOSVersion");
  else
    memset(v37, 0, sizeof(v37));
  -[MPSGraphPackage getPackageKeyForPlatform:andMinimumDeploymentTarget:](v11, "getPackageKeyForPlatform:andMinimumDeploymentTarget:", v14, v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MPSGraphExecutableSerializationDescriptor deploymentPlatform](v6, "deploymentPlatform");
  active_platform = dyld_get_active_platform();
  v18 = 0;
  switch(active_platform)
  {
    case 1:
      break;
    case 2:
      v18 = 1;
      break;
    case 3:
      v18 = 2;
      break;
    case 11:
      v18 = 3;
      break;
    default:
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v18 = 0;
      break;
  }
  -[MPSGraphExecutable createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:](self, "createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:", v11, v15, v16 == v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphPackage setMLIRLibrary:withPackageKey:](v11, "setMLIRLibrary:withPackageKey:", v19, v15);
  -[MPSGraphPackage getPlistData](v11, "getPlistData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("manifest.plist"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "writeToURL:atomically:", v21, 1);

  v22 = (void *)*((_QWORD *)self + 74);
  v36 = 0;
  LOBYTE(v21) = objc_msgSend(v22, "moveItemAtURL:toURL:error:", v10, v35, &v36);
  v23 = v36;
  if ((v21 & 1) == 0 && MTLReportFailureTypeEnabled())
  {
    -[NSURL absoluteString](v35, "absoluteString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedFailureReason");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "code");
    MTLReportFailure();

  }
}

- (id)debugDescription
{
  uint64_t v3;
  std::recursive_mutex *v4;
  mlir::MLIRContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _OWORD v13[2];
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  int v22;
  void **v23;
  void *v24[2];
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;

  v3 = mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v26);
  mlir::OpPrintingFlags::elideLargeElementsAttrs(v3, 256);
  mlir::OpPrintingFlags::elideLargeResourceString((uint64_t)v26, 0);
  mlir::OpPrintingFlags::enableDebugInfo((uint64_t)v26, 1, 0);
  v24[0] = 0;
  v24[1] = 0;
  v25 = 0;
  v16 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 1;
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v15 = &unk_1E0E22B10;
  v23 = v24;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v15, 0, 0, 0);
  v4 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  LazyLoadableModuleRef::get((LazyLoadableModuleRef *)((char *)self + 40), v5);
  v13[0] = v26[0];
  v13[1] = v26[1];
  v14 = v27;
  mlir::Operation::print(*((mlir::Operation **)self + 7), (llvm::raw_ostream *)&v15, (const mlir::OpPrintingFlags *)v13);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphExecutable;
  -[MPSGraphExecutable debugDescription](&v12, sel_debugDescription);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = v23;
  if (*((char *)v23 + 23) < 0)
    v9 = *v23;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ : \n\nIR: %s \n\n"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  std::recursive_mutex::unlock(v4);
  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v15);
  if (SHIBYTE(v25) < 0)
    operator delete(v24[0]);
  return v10;
}

- (id)getInputShapes
{
  std::recursive_mutex *v3;
  FuncOp v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MPSGraphShapedType *v15;
  void *v16;
  MPSGraphShapedType *v17;
  const char *v19;
  int v20;
  const char *v21;
  const char *v22;

  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  v4.var0 = (Operation *)-[MPSGraphExecutable getEntryFuncOp](self, "getEntryFuncOp");
  if (!v4.var0)
    __assert_rtn("-[MPSGraphExecutable getInputShapes]", "MPSGraphExecutable.mm", 3395, "funcOp");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v6 = *((unsigned int *)v4.var0 + 11);
  if ((v6 & 0x7FFFFF) == 0)
  {
    v19 = "index < numRegions && \"invalid region index\";
    v20 = 666;
    v21 = "Operation.h";
    v22 = "getRegion";
    goto LABEL_15;
  }
  v7 = (unint64_t)v4.var0 + 16 * ((v6 >> 23) & 1) + ((v6 >> 21) & 0x7F8) + 64;
  if (v7 >= 0xFFFFFFFFFFFFFFF9)
  {
    v19 = "static_cast<uintptr_t>(ArithAddr + Alignment.value() - 1) >= ArithAddr && \"Overflow\";
    v20 = 191;
    v21 = "Alignment.h";
    v22 = "alignAddr";
LABEL_15:
    __assert_rtn(v22, v21, v20, v19);
  }
  v8 = (_QWORD *)(((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 32 * *((unsigned int *)v4.var0 + 10));
  if ((_QWORD *)*v8 != v8)
  {
    v9 = v8[1];
    if (v9)
      v10 = v9 - 8;
    else
      v10 = 0;
    v11 = *(uint64_t **)(v10 + 48);
    v12 = *(_QWORD *)(v10 + 56) - (_QWORD)v11;
    if (v12)
    {
      v13 = 8 * (v12 >> 3);
      do
      {
        v14 = *v11;
        v15 = [MPSGraphShapedType alloc];
        getMPSShapeFromMLIR((uint64_t **)(*(_QWORD *)(v14 + 8) & 0xFFFFFFFFFFFFFFF8));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[MPSGraphShapedType initWithShape:dataType:](v15, "initWithShape:dataType:", v16, getMPSDataType((_QWORD *)(*(_QWORD *)(v14 + 8) & 0xFFFFFFFFFFFFFFF8)));
        objc_msgSend(v5, "addObject:", v17);

        ++v11;
        v13 -= 8;
      }
      while (v13);
    }
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (id)getOutputShapes
{
  std::recursive_mutex *v3;
  void *v4;
  uint64_t Results;
  uint64_t v6;
  uint64_t ***v7;
  uint64_t v8;
  uint64_t **v9;
  MPSGraphShapedType *v10;
  void *v11;
  MPSGraphShapedType *v12;
  uint64_t FunctionType;
  FuncOp v15;

  v3 = (std::recursive_mutex *)((char *)self + 304);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 304));
  v15.var0 = (Operation *)-[MPSGraphExecutable getEntryFuncOp](self, "getEntryFuncOp");
  if (!v15.var0)
    __assert_rtn("-[MPSGraphExecutable getOutputShapes]", "MPSGraphExecutable.mm", 3407, "funcOp");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  FunctionType = mlir::func::FuncOp::getFunctionType((mlir::func::FuncOp *)&v15);
  Results = mlir::FunctionType::getResults((mlir::FunctionType *)&FunctionType);
  if (v6)
  {
    v7 = (uint64_t ***)Results;
    v8 = 8 * v6;
    do
    {
      v9 = *v7;
      v10 = [MPSGraphShapedType alloc];
      getMPSShapeFromMLIR(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MPSGraphShapedType initWithShape:dataType:](v10, "initWithShape:dataType:", v11, getMPSDataType(v9));
      objc_msgSend(v4, "addObject:", v12);

      ++v7;
      v8 -= 8;
    }
    while (v8);
  }
  std::recursive_mutex::unlock(v3);
  return v4;
}

- (id)getTargetShapesForDevice:(id)a3 inputsArray:(id)a4
{
  id v6;
  id v7;
  ReturnOp v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8.var0 = (Operation *)-[MPSGraphExecutable returnOpForFunctionInModule:](self, "returnOpForFunctionInModule:", -[MPSGraphExecutable specializeWithDevice:inputsArray:compilationDescriptor:](self, "specializeWithDevice:inputsArray:compilationDescriptor:", v6, v7, 0));
  if ((*((_BYTE *)v8.var0 + 46) & 0x80) != 0)
    v9 = *((unsigned int *)v8.var0 + 17);
  else
    v9 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)v8.var0 + 46) & 0x80) != 0)
  {
    v11 = -1;
    v12 = 24;
    do
    {
      if (++v11 >= (unint64_t)*((unsigned int *)v8.var0 + 17))
        break;
      getMPSGraphShapedType((uint64_t **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v8.var0 + 9) + v12) + 8) & 0xFFFFFFFFFFFFFFF8));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);
      v12 += 32;

    }
    while ((*((_BYTE *)v8.var0 + 46) & 0x80) != 0);
  }

  return v10;
}

- (id)getTensorDataArraysWithDevice:(id)a3 feedsDictionary:(id)a4 resultsDictionary:(id)a5 inputsArray:(id)a6 resultsArray:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)*((_QWORD *)self + 64);
  v18 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke;
  v38[3] = &unk_1E0E76E20;
  v19 = v15;
  v39 = v19;
  v40 = v13;
  v34 = v40;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v38);
  if (v14)
  {
    v20 = v18;
    v21 = v14;
  }
  else
  {
    v33 = v12;
    -[MPSGraphExecutable allocateTensorDataTargetsForDevice:inputsArray:](self, "allocateTensorDataTargetsForDevice:inputsArray:", v12, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(*((id *)self + 62), "count") > i; ++i)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)self + 62), "objectAtIndexedSubscript:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v25, v26);

    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v33;
  }
  v27 = (void *)*((_QWORD *)self + 62);
  v35[0] = v20;
  v35[1] = 3221225472;
  v35[2] = __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke_2;
  v35[3] = &unk_1E0E76E20;
  v28 = v16;
  v36 = v28;
  v29 = v21;
  v37 = v29;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v35);
  v30 = v37;
  v31 = v29;

  return v31;
}

void __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __111__MPSGraphExecutable_getTensorDataArraysWithDevice_feedsDictionary_resultsDictionary_inputsArray_resultsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (id)runWithMTLCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5
{
  -[MPSGraphExecutable runWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:](self, "runWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)runWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = (id)objc_opt_new();
  v16 = v15;
  objc_msgSend(v15, "setWaitUntilCompleted:", 1);
  -[MPSGraphExecutable runAsyncWithDevice:inputsArray:resultsArray:executionDescriptor:](self, "runAsyncWithDevice:inputsArray:resultsArray:executionDescriptor:", v10, v11, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)runAsyncWithDevice:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x186DA1C20]();
  if (!v13)
    v13 = (id)objc_opt_new();
  -[MPSGraphExecutable runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v10, 0, v11, v12, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);

  return v15;
}

- (NSArray)runWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  id v10;
  NSArray *v11;
  NSArray *v12;
  MPSGraphExecutableExecutionDescriptor *v13;
  MPSGraphExecutableExecutionDescriptor *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = commandQueue;
  v11 = inputsArray;
  v12 = resultsArray;
  v13 = executionDescriptor;
  v14 = v13;
  if (v13)
    v15 = (void *)-[MPSGraphExecutableExecutionDescriptor copy](v13, "copy");
  else
    v15 = (void *)objc_opt_new();
  v16 = v15;
  objc_msgSend(v15, "setWaitUntilCompleted:", 1);
  -[MPSGraphExecutable runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:](self, "runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:", v10, v11, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (NSArray)runAsyncWithMTLCommandQueue:(id)commandQueue inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  NSArray *v10;
  NSArray *v11;
  MPSGraphExecutableExecutionDescriptor *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = inputsArray;
  v11 = resultsArray;
  v12 = executionDescriptor;
  v13 = (void *)MEMORY[0x186DA1C20]();
  objc_msgSend(MEMORY[0x1E0CC6DE0], "commandBufferFromCommandQueue:", commandQueue);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = (MPSGraphExecutableExecutionDescriptor *)objc_opt_new();
  objc_msgSend(v14, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraphExecutable runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v16, v14, v10, v11, v12, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v13);
  return (NSArray *)v17;
}

- (id)runAsyncWithCommandQueue:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  -[MPSGraphExecutable runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:](self, "runAsyncWithMTLCommandQueue:inputsArray:resultsArray:executionDescriptor:", a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer inputsArray:(NSArray *)inputsArray resultsArray:(NSArray *)resultsArray executionDescriptor:(MPSGraphExecutableExecutionDescriptor *)executionDescriptor
{
  -[MPSGraphExecutable encodeWithMPSCommandBuffer:inputsArray:resultsArray:executionDescriptor:](self, "encodeWithMPSCommandBuffer:inputsArray:resultsArray:executionDescriptor:", commandBuffer, inputsArray, resultsArray, executionDescriptor);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)encodeWithMPSCommandBuffer:(id)a3 inputsArray:(id)a4 resultsArray:(id)a5 executionDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
    v13 = (id)objc_opt_new();
  objc_msgSend(v10, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPSGraphExecutable runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v15, v10, v11, v12, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputsArray:(id)a5 compilationDescriptor:(id)a6
{
  return -[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:](self, "getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:", a3, a4.state, a5, a6, 0, 0);
}

- (void)getNewRuntimeForDevice:(id)a3 module:(ModuleOp)a4 inputShapes:(id)a5 compilationDescriptor:(id)a6 fallingBack:(BOOL)a7 fallbackRuntimeKey:(const void *)a8
{
  _BOOL4 v9;
  std::unique_lock<std::mutex>::mutex_type *state;
  std::recursive_mutex *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::unique_lock<std::mutex>::mutex_type **v19;
  std::unique_lock<std::mutex>::mutex_type *v20;
  std::unique_lock<std::mutex>::mutex_type **v21;
  std::unique_lock<std::mutex>::mutex_type **v22;
  uint64_t v23;
  const char *v24;
  int v25;
  const char *v26;
  int v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  std::unique_lock<std::mutex>::mutex_type **v32;
  std::unique_lock<std::mutex>::mutex_type *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  std::unique_lock<std::mutex>::mutex_type *v37;
  std::unique_lock<std::mutex>::mutex_type *v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  _QWORD *v42;
  unsigned __int8 v43;
  std::unique_lock<std::mutex>::mutex_type *m;
  uint64_t v45;
  std::unique_lock<std::mutex>::mutex_type *v46;
  _QWORD *v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  void *v51;
  const char *v53;
  int v54;
  std::unique_lock<std::mutex>::mutex_type **v55;
  int v56;
  BOOL v57;
  unsigned int v58;
  std::unique_lock<std::mutex>::mutex_type **v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  std::unique_lock<std::mutex>::mutex_type *v64;
  const char *v65;
  int v66;
  const char *v67;
  std::unique_lock<std::mutex>::mutex_type **v68;
  int v69;
  BOOL v70;
  unsigned int v71;
  BOOL v72;
  char v73;
  char v74;
  uint64_t v75;
  std::unique_lock<std::mutex>::mutex_type *v76;
  BOOL v77;
  id v78;
  id v79;
  id v80;
  MPSGraphExecutable *v81;
  Operation *v82;
  std::unique_lock<std::mutex> __lk;
  _BYTE v84[24];
  _BYTE *v85;
  uint64_t v86;

  v9 = a7;
  state = (std::unique_lock<std::mutex>::mutex_type *)a4.state;
  v86 = *MEMORY[0x1E0C80C00];
  v81 = self;
  v82 = a4.state;
  v80 = a3;
  v79 = a5;
  v78 = a6;
  v77 = v9;
  if (v9)
    state = (std::unique_lock<std::mutex>::mutex_type *)a8;
  v76 = state;
  v14 = (std::recursive_mutex *)((char *)self + 240);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 240));
  v15 = (char *)self + 152;
  v16 = *((_QWORD *)self + 19);
  v17 = *((unsigned int *)self + 42);
  if (!(_DWORD)v17)
  {
LABEL_19:
    v19 = (std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v17);
    v22 = v19;
    goto LABEL_20;
  }
  if (((unint64_t)state | 0x1000) == 0xFFFFFFFFFFFFF000)
  {
    v24 = "!KeyInfoT::isEqual(Val, EmptyKey) && !KeyInfoT::isEqual(Val, TombstoneKey) && \"Empty/Tombstone value shouldn'"
          "t be inserted into map!\";
    v25 = 651;
    v26 = "LookupBucketFor";
    goto LABEL_13;
  }
  LODWORD(v18) = (v17 - 1) & ((state >> 4) ^ (state >> 9));
  v19 = (std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v18);
  v20 = *v19;
  if (*v19 == state)
  {
    v21 = (std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v17);
    v22 = v21;
    if (v19 != v21)
      goto LABEL_7;
    goto LABEL_20;
  }
  v27 = 1;
  do
  {
    if (v20 == (std::unique_lock<std::mutex>::mutex_type *)-4096)
      goto LABEL_19;
    v28 = v18 + v27++;
    v18 = v28 & (v17 - 1);
    v20 = *(std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v18);
  }
  while (v20 != state);
  v19 = (std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v18);
  v21 = (std::unique_lock<std::mutex>::mutex_type **)(v16 + 16 * v17);
  v22 = v21;
  if (v19 == v21)
  {
LABEL_20:
    v29 = operator new();
    v23 = v29;
    *(_QWORD *)v29 = 850045863;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(_OWORD *)(v29 + 40) = 0u;
    *(_QWORD *)(v29 + 56) = 0;
    *(_QWORD *)(v29 + 64) = 1018212795;
    *(_OWORD *)(v29 + 72) = 0u;
    *(_OWORD *)(v29 + 88) = 0u;
    *(_QWORD *)(v29 + 104) = 0;
    *(_BYTE *)(v29 + 112) = 1;
    *(_QWORD *)(v29 + 120) = 0;
    v75 = 0;
    __lk.__m_ = state;
    *(_QWORD *)&__lk.__owns_ = v29;
    v30 = *((_DWORD *)v15 + 4);
    if (!v30)
      goto LABEL_82;
    if (((unint64_t)state | 0x1000) == 0xFFFFFFFFFFFFF000)
    {
LABEL_88:
      v65 = "!KeyInfoT::isEqual(Val, EmptyKey) && !KeyInfoT::isEqual(Val, TombstoneKey) && \"Empty/Tombstone value should"
            "n't be inserted into map!\";
      v66 = 651;
      v67 = "LookupBucketFor";
      goto LABEL_89;
    }
    v31 = (v30 - 1) & ((state >> 4) ^ (state >> 9));
    v32 = (std::unique_lock<std::mutex>::mutex_type **)(*(_QWORD *)v15 + 16 * v31);
    v33 = *v32;
    if (state == *v32)
    {
LABEL_23:
      *(_QWORD *)(v29 + 120) = 0;
      v34 = v29;
      goto LABEL_24;
    }
    v55 = 0;
    v56 = 1;
    while (v33 != (std::unique_lock<std::mutex>::mutex_type *)-4096)
    {
      if (v55)
        v57 = 0;
      else
        v57 = v33 == (std::unique_lock<std::mutex>::mutex_type *)-8192;
      if (v57)
        v55 = v32;
      v58 = v31 + v56++;
      v31 = v58 & (v30 - 1);
      v32 = (std::unique_lock<std::mutex>::mutex_type **)(*(_QWORD *)v15 + 16 * v31);
      v33 = *v32;
      if (state == *v32)
        goto LABEL_23;
    }
    v59 = v55 ? v55 : v32;
    v60 = *((_DWORD *)v15 + 2);
    if (4 * v60 + 4 < 3 * v30)
    {
      if (v30 + ~v60 - *((_DWORD *)v15 + 3) > v30 >> 3)
      {
        if (v59)
          goto LABEL_31;
        goto LABEL_90;
      }
    }
    else
    {
LABEL_82:
      v30 *= 2;
    }
    llvm::DenseMap<void const*,std::unique_ptr<RuntimeCacheEntry>,llvm::DenseMapInfo<void const*,void>,llvm::detail::DenseMapPair<void const*,std::unique_ptr<RuntimeCacheEntry>>>::grow((uint64_t)v15, v30);
    v61 = *((_DWORD *)v15 + 4);
    if (v61)
    {
      if (((unint64_t)state | 0x1000) != 0xFFFFFFFFFFFFF000)
      {
        v62 = v61 - 1;
        v63 = ((state >> 4) ^ (state >> 9)) & (v61 - 1);
        v59 = (std::unique_lock<std::mutex>::mutex_type **)(*(_QWORD *)v15 + 16 * v63);
        v64 = *v59;
        if (state == *v59)
        {
LABEL_86:
          ++*((_DWORD *)v15 + 2);
          if (state == (std::unique_lock<std::mutex>::mutex_type *)-4096)
            goto LABEL_33;
          goto LABEL_32;
        }
        v68 = 0;
        v69 = 1;
        while (v64 != (std::unique_lock<std::mutex>::mutex_type *)-4096)
        {
          if (v68)
            v70 = 0;
          else
            v70 = v64 == (std::unique_lock<std::mutex>::mutex_type *)-8192;
          if (v70)
            v68 = v59;
          v71 = v63 + v69++;
          v63 = v71 & v62;
          v59 = (std::unique_lock<std::mutex>::mutex_type **)(*(_QWORD *)v15 + 16 * (v71 & v62));
          v64 = *v59;
          if (state == *v59)
            goto LABEL_86;
        }
        if (v68)
          v59 = v68;
LABEL_31:
        v37 = *v59;
        ++*((_DWORD *)v15 + 2);
        if (v37 == (std::unique_lock<std::mutex>::mutex_type *)-4096)
        {
LABEL_33:
          *v59 = state;
          v38 = *(std::unique_lock<std::mutex>::mutex_type **)&__lk.__owns_;
          *(_QWORD *)&__lk.__owns_ = 0;
          v59[1] = v38;
          v34 = *(_QWORD *)&__lk.__owns_;
          if (!*(_QWORD *)&__lk.__owns_)
          {
LABEL_36:
            std::recursive_mutex::unlock(v14);
            goto LABEL_37;
          }
          v39 = *(_QWORD *)(*(_QWORD *)&__lk.__owns_ + 120);
          *(_QWORD *)(*(_QWORD *)&__lk.__owns_ + 120) = 0;
          if (v39)
            (*(void (**)(uint64_t))(*(_QWORD *)v39 + 56))(v39);
LABEL_24:
          std::condition_variable::~condition_variable((std::condition_variable *)(v34 + 64));
          std::mutex::~mutex((std::mutex *)v34);
          MEMORY[0x186DA1680]();
          v35 = v75;
          if (v75)
          {
            v36 = *(_QWORD *)(v75 + 120);
            *(_QWORD *)(v75 + 120) = 0;
            if (v36)
              (*(void (**)(uint64_t))(*(_QWORD *)v36 + 56))(v36);
            std::condition_variable::~condition_variable((std::condition_variable *)(v35 + 64));
            std::mutex::~mutex((std::mutex *)v35);
            MEMORY[0x186DA1680]();
          }
          goto LABEL_36;
        }
LABEL_32:
        --*((_DWORD *)v15 + 3);
        goto LABEL_33;
      }
      goto LABEL_88;
    }
LABEL_90:
    v65 = "TheBucket";
    v66 = 616;
    v67 = "InsertIntoBucketImpl";
LABEL_89:
    __assert_rtn(v67, "DenseMap.h", v66, v65);
  }
LABEL_7:
  if (v19 == v21)
  {
    v24 = "Ptr != End && \"dereferencing end() iterator\";
    v25 = 1270;
    v26 = "operator->";
LABEL_13:
    __assert_rtn(v26, "DenseMap.h", v25, v24);
  }
  v23 = (uint64_t)v19[1];
  std::recursive_mutex::unlock(v14);
  if (!v23)
  {
    if (!MTLReportFailureTypeEnabled())
    {
      v23 = 0;
      if (byte_1EDC0A18D)
        goto LABEL_38;
LABEL_40:
      v41 = v78;
      v40 = ((unint64_t)objc_msgSend(v78, "compilerOptions") >> 7) & 1;
      goto LABEL_41;
    }
    MTLReportFailure();
    v23 = 0;
  }
LABEL_37:
  if (!byte_1EDC0A18D)
    goto LABEL_40;
LABEL_38:
  LOBYTE(v40) = byte_1EDC0A18C != 0;
  v41 = v78;
LABEL_41:
  v74 = v40;
  v73 = objc_msgSend(v41, "compilerOptions") & 1;
  v72 = (objc_msgSend(v41, "compilerOptions") & 0x2000) != 0;
  if (v19 != v22 && !v77)
    goto LABEL_58;
  v42 = operator new(0x58uLL);
  *v42 = &off_1E0E50148;
  v42[1] = &v81;
  v42[2] = &v80;
  v42[3] = &v74;
  v42[4] = &v73;
  v42[5] = &v72;
  v42[6] = &v82;
  v42[7] = &v77;
  v42[8] = &v78;
  v42[9] = &v79;
  v42[10] = &v76;
  v85 = v42;
  v43 = atomic_load((unsigned __int8 *)(v23 + 112));
  if ((v43 & 1) == 0)
  {
    v53 = "_initializing";
    v54 = 137;
    goto LABEL_68;
  }
  if (*(_QWORD *)(v23 + 120))
  {
    v53 = "!_runtime";
    v54 = 138;
LABEL_68:
    __assert_rtn("initializeRuntime", "BaseRuntime_Project.h", v54, v53);
  }
  LOBYTE(v75) = 0;
  if (!v85)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(std::unique_lock<std::mutex> *__return_ptr, _BYTE *, uint64_t *))(*(_QWORD *)v85 + 48))(&__lk, v85, &v75);
  if ((_BYTE)v75)
  {
    if (!*(_QWORD *)(v23 + 120))
      __assert_rtn("initializeRuntime", "BaseRuntime_Project.h", 145, "_runtime");
  }
  else
  {
    m = __lk.__m_;
    __lk.__m_ = 0;
    v45 = *(_QWORD *)(v23 + 120);
    *(_QWORD *)(v23 + 120) = m;
    if (v45)
      (*(void (**)(uint64_t))(*(_QWORD *)v45 + 56))(v45);
  }
  std::mutex::lock((std::mutex *)v23);
  atomic_store(0, (unsigned __int8 *)(v23 + 112));
  std::condition_variable::notify_all((std::condition_variable *)(v23 + 64));
  std::mutex::unlock((std::mutex *)v23);
  v46 = __lk.__m_;
  __lk.__m_ = 0;
  if (v46)
    (*(void (**)(std::unique_lock<std::mutex>::mutex_type *))(v46->__m_.__sig + 56))(v46);
  v47 = v85;
  if (v85 == v84)
  {
    v48 = 4;
    v47 = v84;
  }
  else
  {
    if (!v85)
      goto LABEL_58;
    v48 = 5;
  }
  (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_58:
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)v23;
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)v23);
  v49 = atomic_load((unsigned __int8 *)(v23 + 112));
  if ((v49 & 1) != 0)
  {
    do
    {
      std::condition_variable::wait((std::condition_variable *)(v23 + 64), &__lk);
      v50 = atomic_load((unsigned __int8 *)(v23 + 112));
    }
    while ((v50 & 1) != 0);
  }
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  v51 = *(void **)(v23 + 120);
  if (!v51 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  -[MPSGraphExecutable dumpCompiledProducts](v81, "dumpCompiledProducts");

  return v51;
}

- (id)allocateTensorDataTargetsForDevice:(id)a3 inputsArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ModuleOp v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9.state = (Operation *)-[MPSGraphExecutable specializeWithDevice:inputsArray:compilationDescriptor:](self, "specializeWithDevice:inputsArray:compilationDescriptor:", v6, v7, 0);
  v10 = -[MPSGraphExecutable getNewRuntimeForDevice:module:inputsArray:compilationDescriptor:](self, "getNewRuntimeForDevice:module:inputsArray:compilationDescriptor:", v6, v9.state, v7, 0);
  (*(void (**)(void *, uint64_t))(*(_QWORD *)v10 + 40))(v10, -[MPSGraphExecutable returnOpForFunctionInModule:](self, "returnOpForFunctionInModule:", v9.state));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feedsDictionary:(id)a5 resultsDictionary:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  MPSGraphExecutable *v47;
  uint64_t v48;
  uint64_t v49;
  MPSGraphExecutable *v50;
  _BYTE v51[128];
  uint64_t v52;

  v8 = a8;
  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v32 = a5;
  v33 = a6;
  v35 = a7;
  v36 = v15;
  v38 = v14;
  v16 = objc_msgSend(v14, "type");
  objc_msgSend(v15, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0x2B2B07EC2B2B07E8;
  v47 = self;
  v48 = v16;
  v49 = objc_msgSend(v18, "registryID");
  v50 = self;
  kdebug_trace();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSGraphExecutable getTensorDataArraysWithDevice:feedsDictionary:resultsDictionary:inputsArray:resultsArray:](self, "getTensorDataArraysWithDevice:feedsDictionary:resultsDictionary:inputsArray:resultsArray:", v14, v32, v33, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "type"))
  {
    if (!v15)
    {
      objc_msgSend(v14, "metalDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "newCommandQueue");

      objc_msgSend(MEMORY[0x1E0CC6DE0], "commandBufferFromCommandQueue:", v20);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 1;
    }
    objc_msgSend(v35, "scheduledGraphHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __149__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feedsDictionary_resultsDictionary_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke;
      v43[3] = &unk_1E0E77140;
      v44 = v35;
      v45 = v31;
      objc_msgSend(v36, "addScheduledHandler:", v43);

    }
  }
  -[MPSGraphExecutable runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:](self, "runInternalWithDevice:commandBuffer:feeds:results:executableExecutionDescriptor:mpsGraphOwnedCommandBuffer:", v14, v36, v37, v34, v35, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = v31;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v24);
        v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(*((id *)self + 62), "indexOfObject:", v28));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v28);

      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v25);
  }

  kdebug_trace();
  return v23;
}

void __149__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feedsDictionary_resultsDictionary_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduledGraphHandler");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v3)[2](v3, v4, v5);

}

- (id)runInternalWithDevice:(id)a3 commandBuffer:(id)a4 feeds:(id)a5 results:(id)a6 executableExecutionDescriptor:(id)a7 mpsGraphOwnedCommandBuffer:(BOOL)a8
{
  id v13;
  id v14;
  MPSGraphInternalCommandBuffer *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  char v21;
  ModuleOp v22;
  _BYTE *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  id v48;
  _BOOL8 v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v77;
  __CFString *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v81;
  id *v82;
  id v83;
  MPSGraphCaptureContext *v84;
  id v85;
  id v86;
  id v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD v90[4];
  _QWORD *v91;
  id v92;
  id v93;
  MPSGraphExecutable *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103;
  _QWORD v104[4];
  _QWORD *v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  std::unique_lock<std::mutex> __lk;
  uint64_t v112;
  id *v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  MPSGraphExecutable *v124;
  uint64_t v125;
  uint64_t v126;
  MPSGraphExecutable *v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v81 = a8;
  v132 = *MEMORY[0x1E0C80C00];
  v83 = a3;
  v13 = a4;
  v86 = a5;
  v14 = a6;
  v88 = a7;
  v80 = v13;
  if (v88[5])
  {
    v15 = -[MPSGraphInternalCommandBuffer initWithMPSCommandBuffer:executableExecutionDescriptor:]([MPSGraphInternalCommandBuffer alloc], "initWithMPSCommandBuffer:executableExecutionDescriptor:", v13, v88);
    if (v15)
    {
LABEL_3:
      -[MPSGraphInternalCommandBuffer mpsCommandBufferDescriptor](v15, "mpsCommandBufferDescriptor");
      v79 = v125;
      goto LABEL_6;
    }
  }
  else
  {
    v15 = (MPSGraphInternalCommandBuffer *)v13;
    if (v15)
      goto LABEL_3;
  }
  v79 = 0;
LABEL_6:
  v16 = objc_msgSend(v83, "type");
  -[MPSCommandBuffer commandBuffer](v15, "commandBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0x2B2B07EC2B2B07E8;
  v124 = self;
  v125 = v16;
  v126 = objc_msgSend(v18, "registryID");
  v127 = self;
  kdebug_trace();

  v19 = objc_msgSend(v88, "enableProfilingOpNames");
  if (byte_1EDC0A198)
    v20 = 1;
  else
    v20 = v19;
  *((_BYTE *)self + 601) = v20;
  *((_BYTE *)self + 602) = objc_msgSend(v88, "briefProfilingOpNames");
  if (*((_BYTE *)self + 609))
    v21 = 1;
  else
    v21 = objc_msgSend(v88, "generateRuntimeExecutionReport");
  *((_BYTE *)self + 609) = v21;
  *((_BYTE *)self + 603) = objc_msgSend(v88, "simulateANECompileFailure");
  *((_BYTE *)self + 604) = objc_msgSend(v88, "simulateANELoadModelFailure");
  *((_BYTE *)self + 615) = objc_msgSend(v88, "disableANECaching");
  *((_BYTE *)self + 616) = objc_msgSend(v88, "disableANEFallback");
  if (v14)
  {
    v87 = v14;
  }
  else
  {
    -[MPSGraphExecutable allocateTensorDataTargetsForDevice:inputsArray:](self, "allocateTensorDataTargetsForDevice:inputsArray:", v83, v86);
    v87 = (id)objc_claimAutoreleasedReturnValue();

    if (!v87)
    {
      if (MTLReportFailureTypeEnabled())
        MTLReportFailure();
      v87 = 0;
    }
  }
  v22.state = (Operation *)-[MPSGraphExecutable specializeWithDevice:inputsArray:compilationDescriptor:](self, "specializeWithDevice:inputsArray:compilationDescriptor:", v83, v86, 0);
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 376);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 376));
  while (atomic_load((unsigned int *)self + 122))
    std::condition_variable::wait((std::condition_variable *)((char *)self + 440), &__lk);
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  v85 = v83;

  v82 = -[MPSGraphExecutable getNewRuntimeForDevice:module:inputsArray:compilationDescriptor:](self, "getNewRuntimeForDevice:module:inputsArray:compilationDescriptor:", v85, v22.state, v86, 0);
  if (qword_1EDC0BF10 == -1)
  {
    v25 = (_BYTE *)qword_1EDC0BF00;
    if (!qword_1EDC0BF00)
    {
LABEL_42:
      v84 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    dispatch_once(&qword_1EDC0BF10, &__block_literal_global_505);
    v25 = (_BYTE *)qword_1EDC0BF00;
    if (!qword_1EDC0BF00)
      goto LABEL_42;
  }
  if (!*v25)
    goto LABEL_42;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EDC0BF08 && *(_BYTE *)qword_1EDC0BF08)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v78 = CFSTR("MPSGraph");
  }
  v84 = -[MPSGraphCaptureContext initWithOutputFolderPath:graphName:]([MPSGraphCaptureContext alloc], "initWithOutputFolderPath:graphName:", v77, v78);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v86, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  -[MPSGraphExecutable feedTensors](self, "feedTensors");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v120 != v29)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v31);

      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
    }
    while (v28);
  }

  -[MPSGraphCaptureContext setFeeds:names:](v84, "setFeeds:names:", v86, v26);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  -[MPSGraphExecutable targetTensors](self, "targetTensors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v116 != v35)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * j), "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v37);

      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
    }
    while (v34);
  }

  -[MPSGraphCaptureContext setResults:names:](v84, "setResults:names:", v14, v32);
  objc_storeStrong(v82 + 26, v84);

LABEL_43:
  if (!objc_msgSend(v85, "type") || *((_BYTE *)self + 605))
  {
    if (!v15)
    {
      v38 = (void *)MEMORY[0x1E0CC6DE0];
      objc_msgSend(v85, "metalDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v39, "newCommandQueue");
      objc_msgSend(v38, "commandBufferFromCommandQueue:", v40);
      v15 = (MPSGraphInternalCommandBuffer *)objc_claimAutoreleasedReturnValue();

      v81 = 1;
    }
    -[MPSCommandBuffer commandBuffer](v15, "commandBuffer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "globalTraceObjectID");
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)0x2B2B07E42B2B07E0;
    *(_QWORD *)&__lk.__owns_ = self;
    v112 = v42;
    v113 = v82;
    v114 = 0;
    kdebug_trace();

    objc_msgSend(v88, "completionGraphHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {

    }
    else
    {
      objc_msgSend(v88, "scheduledGraphHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44 == 0;

      if (v45)
      {
        v48 = 0;
LABEL_51:
        if (objc_msgSend(v88, "enableCommitAndContinue"))
          v49 = *((_BYTE *)self + 600) != 0;
        else
          v49 = 0;
        v50 = objc_msgSend(v88, "breakUpMetalEncoders");
        if (byte_1EDC0A199)
          v51 = 1;
        else
          v51 = v50;
        objc_msgSend(v88, "scheduledGraphHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {

        }
        else
        {
          objc_msgSend(v88, "scheduledHandler");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v53 == 0;

          if (v54)
          {
LABEL_61:
            v103 = 1;
            (*((void (**)(id *, id, id, _QWORD *, MPSGraphInternalCommandBuffer *, _BOOL8, uint64_t, _BOOL4, char *))*v82
             + 9))(v82, v86, v87, v88, v15, v49, v51, v81, &v103);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v87 = v56;
            v57 = v87;
            if ((objc_msgSend(v88, "disableSynchronizeResults") & 1) == 0 && v103 && (*((_QWORD *)self + 81) & 1) != 0)
            {
              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v58 = v87;
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
              if (v59)
              {
                v60 = *(_QWORD *)v100;
                do
                {
                  for (k = 0; k != v59; ++k)
                  {
                    if (*(_QWORD *)v100 != v60)
                      objc_enumerationMutation(v58);
                    objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "mpsndarray");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "synchronizeOnCommandBuffer:", v15);

                  }
                  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
                }
                while (v59);
              }

              v98 = 0u;
              v96 = 0u;
              v97 = 0u;
              v95 = 0u;
              v63 = v58;
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
              if (v64)
              {
                v65 = *(_QWORD *)v96;
                do
                {
                  for (m = 0; m != v64; ++m)
                  {
                    if (*(_QWORD *)v96 != v65)
                      objc_enumerationMutation(v63);
                    objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * m), "mpsndarray");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "synchronizeOnCommandBuffer:", v15);

                  }
                  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v128, 16);
                }
                while (v64);
              }

              v57 = v87;
            }
            -[MPSCommandBuffer commandBuffer](v15, "commandBuffer");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "completionGraphHandler");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69
              || (objc_msgSend(v88, "completionHandler"), (v69 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {

              v57 = v87;
            }
            else if (!v88[4])
            {
              goto LABEL_83;
            }
            v90[0] = MEMORY[0x1E0C809B0];
            v90[1] = 3221225472;
            v90[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_3;
            v90[3] = &unk_1E0E771D0;
            v91 = v88;
            v92 = v48;
            v93 = v57;
            v94 = self;
            -[MPSGraphInternalCommandBuffer addCompletedHandler:](v15, "addCompletedHandler:", v90);
            v103 = 1;

LABEL_83:
            if (v103)
            {
              if (v81)
                -[MPSGraphInternalCommandBuffer commit](v15, "commit");
              if (objc_msgSend(v88, "waitUntilCompleted"))
              {
                if (!v81)
                  -[MPSGraphInternalCommandBuffer commitAndContinue](v15, "commitAndContinue");
                objc_msgSend(v68, "waitUntilCompleted");
              }
            }
            if (v15)
            {
              -[MPSGraphInternalCommandBuffer mpsCommandBufferDescriptor](v15, "mpsCommandBufferDescriptor");
              v70 = v89;
            }
            else
            {
              v70 = 0;
            }
            v88[7] = v70 - v79;

            kdebug_trace();
            v14 = v87;
            goto LABEL_94;
          }
        }
        -[MPSCommandBuffer commandBuffer](v15, "commandBuffer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v104[0] = MEMORY[0x1E0C809B0];
        v104[1] = 3221225472;
        v104[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_2;
        v104[3] = &unk_1E0E771A8;
        v105 = v88;
        v106 = v48;
        v107 = v87;
        objc_msgSend(v55, "addScheduledHandler:", v104);

        goto LABEL_61;
      }
    }
    v46 = (void *)objc_opt_new();
    v47 = (void *)*((_QWORD *)self + 62);
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke;
    v108[3] = &unk_1E0E76E20;
    v48 = v46;
    v109 = v48;
    v110 = v87;
    objc_msgSend(v47, "enumerateObjectsUsingBlock:", v108);

    goto LABEL_51;
  }
  if (objc_msgSend(v85, "type") == 1)
  {
    (*((void (**)(id *, id, id, _QWORD *))*v82 + 2))(v82, v86, v87, v88);
  }
  else if (MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
LABEL_94:
  if (v84)
    -[MPSGraphCaptureContext writejsonFile:](v84, "writejsonFile:", CFSTR("mpsgraph.json"));
  if (qword_1EDC0BF20 == -1)
  {
    if (_MergedGlobals_69 != 1)
      goto LABEL_99;
    goto LABEL_98;
  }
  dispatch_once(&qword_1EDC0BF20, &__block_literal_global_508);
  if (_MergedGlobals_69 == 1)
  {
LABEL_98:
    v71 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", qword_1EDC0BF18);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "URLWithString:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphExecutable emitObjUnitTestToUrl:](self, "emitObjUnitTestToUrl:", v73);

  }
LABEL_99:
  v74 = v87;
  if (v14)
    v74 = v14;
  v75 = v74;

  kdebug_trace();
  return v75;
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scheduledGraphHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduledGraphHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v4)[2](v4, v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "scheduledHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduledHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, v9, v10);

  }
}

void __129__MPSGraphExecutable_runInternalWithDevice_commandBuffer_feeds_results_executableExecutionDescriptor_mpsGraphOwnedCommandBuffer___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completionGraphHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionGraphHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v15, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v4)[2](v4, v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v15, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, v9, v10);

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 32);
  if (v12)
  {
    v13 = *(_QWORD *)(v11 + 40);
    objc_msgSend(v15, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v13, v14);

  }
  kdebug_trace();

}

- (unint64_t)getOptimizedModuleCacheSize
{
  return *((unsigned int *)self + 46);
}

- (unint64_t)getOptimizedNoDeviceModuleCacheSize
{
  return *((_QWORD *)self + 28);
}

- (unint64_t)getResourcesTotalSize
{
  pthread_rwlock_t **Manager;
  pthread_rwlock_t **v3;
  pthread_rwlock_t *v4;
  uint64_t v5;
  pthread_rwlock_t *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  pthread_rwlock_t *v11;
  unint64_t v12;
  uint64_t sig;
  uint64_t v14;
  BOOL v15;

  Manager = (pthread_rwlock_t **)mlir::mps::MPSResourceBlobManagerInterface::getManager(*((mlir::mps::MPSResourceBlobManagerInterface **)self + 2), (mlir::MLIRContext *)a2);
  v3 = Manager + 6;
  llvm::sys::RWMutexImpl::lock(Manager + 6);
  v4 = Manager[3];
  v5 = *((unsigned int *)Manager + 8);
  if ((_DWORD)v5)
  {
    v6 = Manager[3];
    if (v4->__sig)
      v7 = v4->__sig == -8;
    else
      v7 = 1;
    if (v7)
    {
      do
      {
        v9 = *(_QWORD *)v6->__opaque;
        v6 = (pthread_rwlock_t *)((char *)v6 + 8);
        v8 = v9;
        if (v9)
          v10 = v8 == -8;
        else
          v10 = 1;
      }
      while (v10);
    }
    v11 = (pthread_rwlock_t *)((char *)v4 + 8 * v5);
    if (v6 != v11)
      goto LABEL_12;
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v6 = Manager[3];
  v11 = (pthread_rwlock_t *)((char *)v4 + 8 * v5);
  if (v6 == v11)
    goto LABEL_22;
LABEL_12:
  v12 = 0;
  sig = v6->__sig;
  do
  {
    if (*(_BYTE *)(sig + 88))
      v12 += *(_QWORD *)(sig + 32);
    do
    {
      v14 = *(_QWORD *)v6->__opaque;
      v6 = (pthread_rwlock_t *)((char *)v6 + 8);
      sig = v14;
      if (v14)
        v15 = sig == -8;
      else
        v15 = 1;
    }
    while (v15);
  }
  while (v6 != v11);
LABEL_23:
  llvm::sys::RWMutexImpl::unlock_shared(v3);
  return v12;
}

- (NSArray)targetTensors
{
  return (NSArray *)objc_getProperty(self, a2, 496, 1);
}

- (NSArray)feedTensors
{
  return (NSArray *)objc_getProperty(self, a2, 512, 1);
}

- (MPSGraphOptions)options
{
  return *((_QWORD *)self + 81);
}

- (void)setOptions:(MPSGraphOptions)options
{
  *((_QWORD *)self + 81) = options;
}

- (void).cxx_destruct
{
  void **v3;
  char *v4;
  void *v5;
  char *v6;

  objc_storeStrong((id *)self + 74, 0);
  objc_storeStrong((id *)self + 73, 0);
  objc_storeStrong((id *)self + 72, 0);
  objc_storeStrong((id *)self + 71, 0);
  objc_storeStrong((id *)self + 67, 0);
  objc_storeStrong((id *)self + 65, 0);
  objc_storeStrong((id *)self + 64, 0);
  objc_storeStrong((id *)self + 63, 0);
  objc_storeStrong((id *)self + 62, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 440));
  std::mutex::~mutex((std::mutex *)((char *)self + 376));
  objc_storeStrong((id *)self + 46, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 304));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 240));
  v3 = (void **)((char *)self + 200);
  v4 = (char *)*((_QWORD *)self + 27);
  if (v4)
  {
    do
    {
      v6 = *(char **)v4;
      LazyLoadableModuleRef::~LazyLoadableModuleRef((LazyLoadableModuleRef *)(v4 + 40));
      if (v4[39] < 0)
        operator delete(*((void **)v4 + 2));
      operator delete(v4);
      v4 = v6;
    }
    while (v6);
  }
  v5 = *v3;
  *v3 = 0;
  if (v5)
    operator delete(v5);
  llvm::DenseMapBase<llvm::DenseMap<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>,MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>,MPSGraphModuleKeyInfo,llvm::detail::DenseMapPair<MPSGraphModuleKey,std::unique_ptr<LazyLoadableModuleRef>>>::destroyAll((uint64_t *)self + 22);
  llvm::deallocate_buffer(*((llvm **)self + 22), (void *)(104 * *((unsigned int *)self + 48)));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_BYTE *)self + 88) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_BYTE *)self + 120) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_DWORD *)self + 42) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_DWORD *)self + 48) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((_DWORD *)self + 58) = 1065353216;
  MEMORY[0x186DA1428]((char *)self + 240, a2);
  MEMORY[0x186DA1428]((char *)self + 304);
  *((_QWORD *)self + 47) = 850045863;
  *((_OWORD *)self + 24) = 0u;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 55) = 1018212795;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_QWORD *)self + 60) = 0;
  return self;
}

+ (void)executablesWithMLIRSourceForMultipleModules:executableDescriptor:regionNames:
{
  mlir::IRMapping *v4;
  uint64_t Result;
  mlir::IRMapping *v6;
  uint64_t Input;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t Inputs;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  mlir::IRMapping *v19;
  char v20;
  char v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  char *v31;
  int64_t v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _OWORD *v38;
  __int128 *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t AttrData;
  uint64_t v44;
  BOOL v45;
  mlir::Operation *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[4];
  __int16 v51;
  uint64_t v52[4];
  __int16 v53;
  void *__p;
  char *v55;
  char *v56;

  if (!a2)
    __assert_rtn("dyn_cast", "Casting.h", 662, "detail::isPresent(Val) && \"dyn_cast on a non-existent value\");
  v49 = llvm::DefaultDoCastIfPossible<mlir::placement::TensorToMemref,mlir::Operation *,llvm::CastInfo<mlir::placement::TensorToMemref,mlir::Operation *,void>>::doCastIfPossible((uint64_t)a2);
  if (v49)
  {
    v4 = *(mlir::IRMapping **)a1;
    Result = mlir::anec::Broadcast::getResult((mlir::anec::Broadcast *)&v49);
    v6 = *(mlir::IRMapping **)a1;
    Input = mlir::anec::Convolution::getInput((mlir::anec::Convolution *)&v49);
    goto LABEL_6;
  }
  v48 = llvm::DefaultDoCastIfPossible<mlir::placement::MemrefToTensor,mlir::Operation *,llvm::CastInfo<mlir::placement::MemrefToTensor,mlir::Operation *,void>>::doCastIfPossible((uint64_t)a2);
  if (v48)
  {
    v4 = *(mlir::IRMapping **)a1;
    Result = mlir::anec::Broadcast::getResult((mlir::anec::Broadcast *)&v48);
    v6 = *(mlir::IRMapping **)a1;
    Input = mlir::anec::Convolution::getInput((mlir::anec::Convolution *)&v48);
LABEL_6:
    v52[0] = Input;
    __p = 0;
    if (!llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v6, (unint64_t *)v52, &__p)|| __p == (void *)(*(_QWORD *)v6 + 16 * *((unsigned int *)v6 + 4))|| (v8 = *((_QWORD *)__p + 1)) == 0)
    {
      __assert_rtn("lookup", "IRMapping.h", 74, "result && \"expected 'from' to be contained within the map\");
    }
    v52[0] = Result;
    __p = 0;
    v9 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v4, (unint64_t *)v52, &__p);
    v10 = __p;
    if ((v9 & 1) == 0)
    {
      v10 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,mlir::Value,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,mlir::Value>>,mlir::Value,mlir::Value,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,mlir::Value>>::InsertIntoBucketImpl<mlir::Value>((uint64_t)v4, (uint64_t)v52, (unint64_t *)v52, __p);
      *v10 = v52[0];
      v10[1] = 0;
    }
    v10[1] = v8;
    return;
  }
  v11 = *((_QWORD *)a2 + 6);
  v12 = *(void **)(v11 + 16);
  if (v12 == &mlir::detail::TypeIDResolver<void,void>::id)
  {
    __p = *(void **)(v11 + 8);
    AttrData = mlir::OpaqueAttr::getAttrData((mlir::OpaqueAttr *)&__p);
    if (v44 == 18)
    {
      v45 = *(_QWORD *)AttrData == 0x6765722E7873706DLL && *(_QWORD *)(AttrData + 8) == 0x757465725F6E6F69;
      if (v45 && *(_WORD *)(AttrData + 16) == 28274)
      {
        v53 = 1283;
        v52[0] = (uint64_t)"classof on '";
        v52[2] = (uint64_t)"mpsx.region_return";
        v52[3] = 18;
        v50[0] = (uint64_t)"' failed due to the operation not being registered";
        v51 = 259;
        llvm::operator+(v52, v50, (uint64_t)&__p);
        llvm::report_fatal_error((llvm::Twine *)&__p, 1);
      }
    }
    goto LABEL_53;
  }
  if (v12 != &mlir::detail::TypeIDResolver<mlir::mpsx::RegionReturnOp,void>::id)
  {
LABEL_53:
    mlir::OpBuilder::clone(**(uint64_t ****)(a1 + 8), a2, *(mlir::IRMapping **)a1);
    return;
  }
  v47 = a2;
  __p = 0;
  v55 = 0;
  v56 = 0;
  Inputs = mlir::anec::Concat::getInputs((mlir::anec::Concat *)&v47);
  v15 = v14;
  if (v14)
  {
    v16 = Inputs;
    v17 = 0;
    while (1)
    {
      v19 = *(mlir::IRMapping **)a1;
      v50[0] = *(_QWORD *)(v16 + 32 * v17 + 24);
      v52[0] = 0;
      v20 = llvm::DenseMapBase<llvm::DenseMap<mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>,mlir::Value,unsigned int,llvm::DenseMapInfo<mlir::Value,void>,llvm::detail::DenseMapPair<mlir::Value,unsigned int>>::LookupBucketFor<mlir::Value>((uint64_t *)v19, (unint64_t *)v50, v52);
      if (v52[0] == *(_QWORD *)v19 + 16 * *((unsigned int *)v19 + 4))
        v21 = 0;
      else
        v21 = v20;
      if ((v21 & 1) == 0 || (v22 = *(_QWORD *)(v52[0] + 8)) == 0)
        __assert_rtn("lookup", "IRMapping.h", 74, "result && \"expected 'from' to be contained within the map\");
      v23 = v55;
      if (v55 >= v56)
        break;
      *(_QWORD *)v55 = v22;
      v18 = v23 + 8;
LABEL_18:
      v55 = v18;
      if (++v17 == v15)
        goto LABEL_54;
    }
    v24 = __p;
    v25 = v55 - (_BYTE *)__p;
    v26 = (v55 - (_BYTE *)__p) >> 3;
    v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 61)
      std::vector<long>::__throw_length_error[abi:ne180100]();
    v28 = v56 - (_BYTE *)__p;
    if ((v56 - (_BYTE *)__p) >> 2 > v27)
      v27 = v28 >> 2;
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
      v29 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v29 = v27;
    if (v29)
    {
      if (v29 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v30 = operator new(8 * v29);
      v31 = &v30[8 * v26];
      *(_QWORD *)v31 = v22;
      v18 = v31 + 8;
      v32 = v23 - v24;
      if (v23 == v24)
      {
LABEL_34:
        __p = v31;
        v55 = v18;
        v56 = &v30[8 * v29];
        if (!v23)
          goto LABEL_18;
        goto LABEL_44;
      }
    }
    else
    {
      v30 = 0;
      v31 = (char *)(8 * v26);
      v33 = (_QWORD *)(8 * v26);
      *v33 = v22;
      v18 = (char *)(v33 + 1);
      v32 = v23 - v24;
      if (v23 == v24)
        goto LABEL_34;
    }
    v34 = v32 - 8;
    if (v34 < 0x58)
      goto LABEL_64;
    if ((unint64_t)(v23 - v30 - v25) < 0x20)
      goto LABEL_64;
    v35 = (v34 >> 3) + 1;
    v36 = 8 * (v35 & 0x3FFFFFFFFFFFFFFCLL);
    v37 = &v23[-v36];
    v31 -= v36;
    v38 = &v30[v25 - 16];
    v39 = (__int128 *)(v23 - 16);
    v40 = v35 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v41 = *v39;
      *(v38 - 1) = *(v39 - 1);
      *v38 = v41;
      v38 -= 2;
      v39 -= 2;
      v40 -= 4;
    }
    while (v40);
    v23 = v37;
    if (v35 != (v35 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_64:
      do
      {
        v42 = *((_QWORD *)v23 - 1);
        v23 -= 8;
        *((_QWORD *)v31 - 1) = v42;
        v31 -= 8;
      }
      while (v23 != v24);
    }
    v23 = __p;
    __p = v31;
    v55 = v18;
    v56 = &v30[8 * v29];
    if (!v23)
      goto LABEL_18;
LABEL_44:
    operator delete(v23);
    goto LABEL_18;
  }
LABEL_54:
  mlir::OpBuilder::create<mlir::func::ReturnOp,std::vector<mlir::Value> &>(**(mlir::OpBuilder ***)(a1 + 8), *((_QWORD *)v47 + 3), (uint64_t *)&__p);
  if (__p)
  {
    v55 = (char *)__p;
    operator delete(__p);
  }
}

- (void)fileBackModule:withPath:
{
}

- (_QWORD)fileBackModule:withPath:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E0E50250;
  return result;
}

- (uint64_t)fileBackModule:withPath:
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z46-[MPSGraphExecutable fileBackModule:withPath:]E3$_6")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z46-[MPSGraphExecutable fileBackModule:withPath:]E3$_6" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z46-[MPSGraphExecutable fileBackModule:withPath:]E3$_6"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z46-[MPSGraphExecutable fileBackModule:withPath:]E3$_6" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

- (_QWORD)optimizeOriginalModule
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E0E501F8;
  return result;
}

- (uint64_t)optimizeOriginalModule
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_8")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_8" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_8"))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z44-[MPSGraphExecutable optimizeOriginalModule]E3$_8" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

- (void)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:
{
}

- (_QWORD)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E0E500F0;
  return result;
}

- (uint64_t)optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_15")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compila"
                                "tionDescriptor:]E4$_15" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_15"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z100-[MPSGraphExecutable optimizationPassesWithDevice:sourceModule:compilationID:compilationDescriptor:]E4$_15" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

- (void)createMLIRLibraryWithMPSGraphPackage:packageKey:appendOptimizedModules:
{
  id v3;
  unint64_t Body;
  uint64_t v5;
  uint64_t v6;
  mlir::GenericProgramPoint *v7;
  mlir::GenericProgramPoint *v8;
  mlir::GenericProgramPoint *v9;
  mlir::ForwardIterator *v10;
  id v11;
  id *v12;
  id v13;
  uint64_t v14;
  id **v15;

  if (**(_QWORD **)a1 == 1)
  {
    v14 = a2;
    v3 = (id)objc_opt_new();
    v13 = v3;
    Body = mlir::anec::A11Legacy::getBody((mlir::anec::A11Legacy *)&v14);
    v12 = &v13;
    v5 = *(_QWORD *)(Body + 8);
    if (v5 != Body)
    {
      do
      {
        v6 = v5 - 8;
        if (!v5)
          v6 = 0;
        v7 = (mlir::GenericProgramPoint *)(v6 + 32);
        v8 = *(mlir::GenericProgramPoint **)(v6 + 40);
        if (v8 != (mlir::GenericProgramPoint *)(v6 + 32))
        {
          do
          {
            v9 = (mlir::GenericProgramPoint *)*((_QWORD *)v8 + 1);
            mlir::GenericProgramPoint::~GenericProgramPoint(v8);
            v15 = &v12;
            mlir::detail::walk<mlir::ForwardIterator>(v10, (mlir::Operation *)_ZN4llvm12function_refIFvPN4mlir9OperationEEE11callback_fnIZNS1_6detail4walkILNS1_9WalkOrderE1ENS1_15ForwardIteratorERZ32getConstantResourcesUsedInModuleINS1_3mps13serialization8ModuleOpEEP7NSArrayIP8NSStringET_EUlNSC_10ConstantOpEE_SL_vEENSt3__19enable_ifIXaantsr4llvm9is_one_ofIT2_S3_PNS1_6RegionEPNS1_5BlockEEE5valuesr3std7is_sameIT3_vEE5valueESV_E4typeES3_OT1_EUlS3_E_EEvlS3_, (uint64_t)&v15, 1);
            v8 = v9;
          }
          while (v9 != v7);
        }
        v5 = *(_QWORD *)(v5 + 8);
      }
      while (v5 != Body);
      v3 = v13;
    }
    objc_msgSend(v3, "allObjects");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(**(id **)(a1 + 8), "addObjectsFromArray:", v11);
    objc_msgSend(**(id **)(a1 + 16), "addOriginalResourcesUsed:", v11);

  }
}

- (void)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
}

- (__n128)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E0E50148;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 40) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

- (uint64_t)getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBac"
                     "k:fallbackRuntimeKey:]E4$_19")
    return a1 + 8;
  if (((v3 & (unint64_t)"Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor"
                                ":fallingBack:fallbackRuntimeKey:]E4$_19" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]E4$_19"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z117-[MPSGraphExecutable getNewRuntimeForDevice:module:inputShapes:compilationDescriptor:fallingBack:fallbackRuntimeKey:]E4$_19" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

@end
