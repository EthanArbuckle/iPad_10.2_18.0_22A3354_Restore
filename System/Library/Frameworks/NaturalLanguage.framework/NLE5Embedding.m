@implementation NLE5Embedding

- (NLE5Embedding)initWithProgramLibrary:()unique_ptr<E5RT:(std:(void *)a4 :default_delete<E5RT::ProgramLibrary>>)a3 :ProgramLibrary andSubwordVocab:
{
  NLE5Embedding *v6;
  NLE5Embedding *v7;
  ProgramLibrary *v8;
  ProgramLibrary *value;
  NSArray *adapters;
  NSString *loadedFunction;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NLE5Embedding;
  v6 = -[NLE5Embedding init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numInputs = 3;
    v6->_subwordVocabRef = a4;
    v8 = *(ProgramLibrary **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    value = v6->_programLibrary.__ptr_.__value_;
    v7->_programLibrary.__ptr_.__value_ = v8;
    if (value)
      (*(void (**)(ProgramLibrary *))(*(_QWORD *)value + 8))(value);
    adapters = v7->_adapters;
    v7->_adapters = (NSArray *)MEMORY[0x1E0C9AA60];

    loadedFunction = v7->_loadedFunction;
    v7->_loadedFunction = 0;

  }
  return v7;
}

- (void)dealloc
{
  void *subwordVocabRef;
  objc_super v4;

  subwordVocabRef = self->_subwordVocabRef;
  if (subwordVocabRef)
    CFRelease(subwordVocabRef);
  v4.receiver = self;
  v4.super_class = (Class)NLE5Embedding;
  -[NLE5Embedding dealloc](&v4, sel_dealloc);
}

+ (id)embeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NLE5Embedding *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  _BYTE __p[12];
  __int16 v47;
  void *v48;
  char v49;
  uint64_t v50;

  v6 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("mil"));

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v8, "stringByDeletingLastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("sp.dat"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v13, 0);

      if ((v15 & 1) != 0)
      {
        v16 = NLEmbeddingSubwordVocabCreate();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
          compileModel((uint64_t)__p, v6, v9);
          if (v49 < 0)
            operator delete(*(void **)__p);
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v17);
          v20 = v19;

          v21 = (void *)MEMORY[0x1A8592E0C]();
          NLGetLogCategory(a1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "internal");
          v23 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            NLGetLogIdentifier(a1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent on compilation"), v20 * 1000.0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__p = 138543618;
            *(_QWORD *)&__p[4] = v24;
            v47 = 2114;
            v48 = v25;
            _os_log_impl(&dword_1A36A7000, v23, OS_LOG_TYPE_INFO, "%{public}@%{public}@", __p, 0x16u);

          }
          objc_autoreleasePoolPop(v21);
          v44 = v45;
          v45 = 0;
          v26 = -[NLE5Embedding initWithProgramLibrary:andSubwordVocab:]([NLE5Embedding alloc], "initWithProgramLibrary:andSubwordVocab:", &v44, v16);
          v27 = v44;
          v44 = 0;
          if (v27)
            (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
          if (objc_msgSend(v9, "count"))
          {
            v28 = (void *)objc_msgSend(v9, "copy");
            -[NLE5Embedding setAdapters:](v26, "setAdapters:", v28);

          }
          v29 = v45;
          v45 = 0;
          if (v29)
            (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);

          goto LABEL_25;
        }
        v35 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "internal");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load sentence piece model for embedding from: %@"), v13);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__p = 138543618;
          *(_QWORD *)&__p[4] = v41;
          v47 = 2114;
          v48 = v42;
          _os_log_impl(&dword_1A36A7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

        }
      }
      else
      {
        v35 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "internal");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing sentence piece model for embedding at: %@"), v13);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__p = 138543618;
          *(_QWORD *)&__p[4] = v38;
          v47 = 2114;
          v48 = v39;
          _os_log_impl(&dword_1A36A7000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

        }
      }

      objc_autoreleasePoolPop(v35);
      v26 = 0;
LABEL_25:

      goto LABEL_26;
    }
  }
  v30 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "internal");
  v32 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    NLGetLogIdentifier(0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path for MIL model: %@"), v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__p = 138543618;
    *(_QWORD *)&__p[4] = v33;
    v47 = 2114;
    v48 = v34;
    _os_log_impl(&dword_1A36A7000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

  }
  objc_autoreleasePoolPop(v30);
  v26 = 0;
LABEL_26:

  return v26;
}

+ (BOOL)isCompiledEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  id v10;
  int IsNewCompileRequired;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[64];
  _BYTE __p[12];
  __int16 v24;
  void *v25;
  char v26;
  uint64_t v27;

  v7 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  MEMORY[0x1A859292C](v22);
  std::string::basic_string[abi:ne180100]<0>(__p, "/private/var/db/com.apple.naturallanguaged");
  E5RT::E5CompilerConfigOptions::SetBundleCacheLocation();
  if (v26 < 0)
    operator delete(*(void **)__p);
  E5RT::E5Compiler::MakeCompiler();
  v10 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  createE5CompilerOptions(v7, v9);
  if (v26 < 0)
    operator delete(*(void **)__p);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  IsNewCompileRequired = E5RT::E5Compiler::IsNewCompileRequired();
  if (v26 < 0)
    operator delete(*(void **)__p);
  v12 = (void *)MEMORY[0x1A8592E0C]();
  v13 = IsNewCompileRequired ^ 1;
  NLGetLogCategory(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "internal");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NLGetLogIdentifier(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = "no";
    if (IsNewCompileRequired)
      v17 = "yes";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Is new compile required: %s"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__p = 138543618;
    *(_QWORD *)&__p[4] = v16;
    v24 = 2114;
    v25 = v18;
    _os_log_impl(&dword_1A36A7000, v15, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@", __p, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  if (v20)
    (*(void (**)())(*(_QWORD *)v20 + 8))();
  if (v21)
    (*(void (**)())(*(_QWORD *)v21 + 8))();
  MEMORY[0x1A8592938](v22);

  return v13;
}

+ (BOOL)compileEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  void *v21;
  char v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internal");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NLGetLogIdentifier(0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" / "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Compiling '%@' with adapters: %@"), v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    v20 = 2114;
    v21 = v15;
    _os_log_impl(&dword_1A36A7000, v11, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v16 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v16, "UTF8String"));
  compileModel((uint64_t)buf, v6, v8);
  if (v18)
    (*(void (**)())(*(_QWORD *)v18 + 8))();
  if (v22 < 0)
    operator delete(*(void **)buf);

  return 1;
}

- (BOOL)_loadFunction:(const char *)a3
{
  uint64_t ExportedFunctions;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  NSString *v14;
  NSString *loadedFunction;
  E5RT::ExecutionStreamOperation **p_main_esop;
  uint64_t v17;
  unsigned __int8 *v18;
  E5RT::OperandDescriptor *v19;
  E5RT::TensorDescriptor *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _QWORD *v33;
  uint64_t v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;
  unsigned __int8 *i;
  E5RT::OperandDescriptor *PortDescriptorRef;
  E5RT::TensorDescriptor *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *TensorShape;
  uint64_t v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  ExecutionStream *v56;
  ExecutionStream *value;
  uint64_t v58;
  __shared_weak_count *cntrl;
  unint64_t *v60;
  unint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  BOOL v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  std::__shared_weak_count *v97;
  std::__shared_weak_count *v98;
  std::__shared_weak_count *v99;
  std::__shared_weak_count *v100;
  uint64_t v101;
  _QWORD v102[5];
  _BYTE __p[12];
  __int16 v104;
  void *v105;
  char v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  ExportedFunctions = E5RT::ProgramLibrary::GetExportedFunctions((E5RT::ProgramLibrary *)self->_programLibrary.__ptr_.__value_);
  std::unordered_map<std::string,std::shared_ptr<E5RT::ProgramFunction>>::unordered_map((uint64_t)v102, ExportedFunctions);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  v6 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(v102, __p);
  v7 = v6;
  if ((v106 & 0x80000000) == 0)
  {
    if (v6)
      goto LABEL_3;
LABEL_85:
    v65 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "internal");
    v67 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loaded mil library is missing %s function"), a3);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 138543618;
      *(_QWORD *)&__p[4] = v68;
      v104 = 2114;
      v105 = v69;
      _os_log_impl(&dword_1A36A7000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

    }
    objc_autoreleasePoolPop(v65);
    v64 = 0;
    goto LABEL_111;
  }
  operator delete(*(void **)__p);
  if (!v7)
    goto LABEL_85;
LABEL_3:
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  v8 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(v102, __p);
  if (!v8)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v9 = (std::__shared_weak_count *)*((_QWORD *)v8 + 6);
  v100 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  E5RT::PrecompiledComputeOpCreateOptions::Create();
  if (v100)
  {
    v12 = (unint64_t *)&v100->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
      std::__shared_weak_count::__release_weak(v100);
    }
  }
  if (v106 < 0)
    operator delete(*(void **)__p);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  loadedFunction = self->_loadedFunction;
  self->_loadedFunction = v14;

  E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp();
  p_main_esop = (E5RT::ExecutionStreamOperation **)&self->_main_esop;
  std::shared_ptr<E5RT::ExecutionStreamOperation>::operator=[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>(&self->_main_esop.__ptr_, (uint64_t *)__p);
  v17 = *(_QWORD *)__p;
  *(_QWORD *)__p = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  v18 = *(unsigned __int8 **)(E5RT::ExecutionStreamOperation::GetInputPorts(*p_main_esop) + 16);
  if (!v18)
  {
LABEL_42:
    std::string::basic_string[abi:ne180100]<0>(__p, "mlm_input");
    v35 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(&self->_buffers.__table_.__bucket_list_.__ptr_.__value_, __p);
    v36 = v35;
    if (v106 < 0)
    {
      operator delete(*(void **)__p);
      if (v36)
      {
LABEL_44:
        for (i = *(unsigned __int8 **)(E5RT::ExecutionStreamOperation::GetOutputPorts(*p_main_esop) + 16);
              i;
              i = *(unsigned __int8 **)i)
        {
          PortDescriptorRef = (E5RT::OperandDescriptor *)E5RT::IOPort::GetPortDescriptorRef(*((E5RT::IOPort **)i + 5));
          v39 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(PortDescriptorRef);
          E5RT::TensorDescriptor::AllocateMemory();
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>((uint64_t)&self->_buffers, i + 16, (__int128 *)i + 1, (uint64_t *)__p);
          v40 = *(_QWORD *)__p;
          *(_QWORD *)__p = 0;
          if (v40)
            (*(void (**)(uint64_t))(*(_QWORD *)v40 + 8))(v40);
          *(_QWORD *)__p = i + 16;
          v41 = (std::__shared_weak_count *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_buffers, i + 16, (uint64_t)&std::piecewise_construct, (__int128 **)__p)+ 6);
          v98 = v41;
          if (v41)
          {
            v42 = (unint64_t *)&v41->__shared_owners_;
            do
              v43 = __ldxr(v42);
            while (__stxr(v43 + 1, v42));
          }
          E5RT::IOPort::BindMemoryObject();
          if (v98)
          {
            v44 = (unint64_t *)&v98->__shared_owners_;
            do
              v45 = __ldaxr(v44);
            while (__stlxr(v45 - 1, v44));
            if (!v45)
            {
              ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
              std::__shared_weak_count::__release_weak(v98);
            }
          }
          v46 = i[39];
          v47 = (char)v46;
          if ((v46 & 0x80u) != 0)
            v46 = *((_QWORD *)i + 3);
          if (v46 == 14)
          {
            v48 = v47 >= 0 ? (uint64_t *)(i + 16) : (uint64_t *)*((_QWORD *)i + 2);
            v49 = *v48;
            v50 = *(uint64_t *)((char *)v48 + 6);
            if (v49 == 0x65626D655F6D6C6DLL && v50 == 0x73676E6964646562)
            {
              TensorShape = (_QWORD *)E5RT::TensorDescriptor::GetTensorShape(v39);
              if (TensorShape[1] - *TensorShape != 32)
              {
                v70 = (void *)MEMORY[0x1A8592E0C]();
                NLGetLogCategory(self);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "internal");
                v72 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  NLGetLogIdentifier(self);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected output rank"));
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)__p = 138543618;
                  *(_QWORD *)&__p[4] = v88;
                  v104 = 2114;
                  v105 = v89;
                  _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

                }
                goto LABEL_108;
              }
              E5RT::TensorDescriptor::GetTensorDataTypeRef(v39);
              if ((E5RT::TensorDataType::IsType<float>() & 1) == 0)
              {
                v70 = (void *)MEMORY[0x1A8592E0C]();
                NLGetLogCategory(self);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "internal");
                v72 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  NLGetLogIdentifier(self);
                  v91 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected output type"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)__p = 138543618;
                  *(_QWORD *)&__p[4] = v91;
                  v104 = 2114;
                  v105 = v92;
                  _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

                }
                goto LABEL_108;
              }
              v53 = *TensorShape;
              self->_dimension = *(int *)(*TensorShape + 24);
              if (self->_maximumSequenceLength != *(_DWORD *)(v53 + 8))
              {
                v70 = (void *)MEMORY[0x1A8592E0C]();
                NLGetLogCategory(self);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "internal");
                v72 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  NLGetLogIdentifier(self);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Max sequence length not matching in input/output"));
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)__p = 138543618;
                  *(_QWORD *)&__p[4] = v94;
                  v104 = 2114;
                  v105 = v95;
                  _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

                }
                goto LABEL_108;
              }
            }
          }
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "mlm_embeddings");
        v54 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(&self->_buffers.__table_.__bucket_list_.__ptr_.__value_, __p);
        v55 = v54;
        if (v106 < 0)
        {
          operator delete(*(void **)__p);
          if (v55)
          {
LABEL_72:
            E5RT::ExecutionStream::CreateExecutionStream((E5RT::ExecutionStream *)v54);
            v56 = *(ExecutionStream **)__p;
            *(_QWORD *)__p = 0;
            value = self->_stream.__ptr_.__value_;
            self->_stream.__ptr_.__value_ = v56;
            if (value)
            {
              (*(void (**)(ExecutionStream *))(*(_QWORD *)value + 8))(value);
              v58 = *(_QWORD *)__p;
              *(_QWORD *)__p = 0;
              if (v58)
                (*(void (**)(uint64_t))(*(_QWORD *)v58 + 8))(v58);
            }
            cntrl = self->_main_esop.__cntrl_;
            v97 = (std::__shared_weak_count *)cntrl;
            if (cntrl)
            {
              v60 = (unint64_t *)((char *)cntrl + 8);
              do
                v61 = __ldxr(v60);
              while (__stxr(v61 + 1, v60));
            }
            E5RT::ExecutionStream::EncodeOperation();
            if (v97)
            {
              v62 = (unint64_t *)&v97->__shared_owners_;
              do
                v63 = __ldaxr(v62);
              while (__stlxr(v63 - 1, v62));
              if (!v63)
              {
                ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
                std::__shared_weak_count::__release_weak(v97);
              }
            }
            v64 = 1;
            goto LABEL_109;
          }
        }
        else if (v54)
        {
          goto LABEL_72;
        }
        v70 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(self);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "internal");
        v72 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(self);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s output is missing"), "mlm_embeddings");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__p = 138543618;
          *(_QWORD *)&__p[4] = v76;
          v104 = 2114;
          v105 = v77;
          _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

        }
        goto LABEL_108;
      }
    }
    else if (v35)
    {
      goto LABEL_44;
    }
    v70 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "internal");
    v72 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s input is missing"), "mlm_input");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__p = 138543618;
      *(_QWORD *)&__p[4] = v73;
      v104 = 2114;
      v105 = v74;
      _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

    }
    goto LABEL_108;
  }
  while (1)
  {
    v19 = (E5RT::OperandDescriptor *)E5RT::IOPort::GetPortDescriptorRef(*((E5RT::IOPort **)v18 + 5));
    v20 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(v19);
    E5RT::TensorDescriptor::AllocateMemory();
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>((uint64_t)&self->_buffers, v18 + 16, (__int128 *)v18 + 1, (uint64_t *)__p);
    v21 = *(_QWORD *)__p;
    *(_QWORD *)__p = 0;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    *(_QWORD *)__p = v18 + 16;
    v22 = (std::__shared_weak_count *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_buffers, v18 + 16, (uint64_t)&std::piecewise_construct, (__int128 **)__p)+ 6);
    v99 = v22;
    if (v22)
    {
      v23 = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    E5RT::IOPort::BindMemoryObject();
    if (v99)
    {
      v25 = (unint64_t *)&v99->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
        std::__shared_weak_count::__release_weak(v99);
      }
    }
    v27 = v18[39];
    v28 = (char)v27;
    if ((v27 & 0x80u) != 0)
      v27 = *((_QWORD *)v18 + 3);
    if (v27 != 9)
      goto LABEL_41;
    v29 = v28 >= 0 ? (uint64_t)(v18 + 16) : *((_QWORD *)v18 + 2);
    v30 = *(_QWORD *)v29;
    v31 = *(unsigned __int8 *)(v29 + 8);
    if (v30 != 0x75706E695F6D6C6DLL || v31 != 116)
      goto LABEL_41;
    v33 = (_QWORD *)E5RT::TensorDescriptor::GetTensorShape(v20);
    if (v33[1] - *v33 != 32)
      break;
    E5RT::TensorDescriptor::GetTensorDataTypeRef(v20);
    if ((E5RT::TensorDataType::IsType<int>() & 1) == 0)
    {
      v70 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "internal");
      v72 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected input type"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__p = 138543618;
        *(_QWORD *)&__p[4] = v82;
        v104 = 2114;
        v105 = v83;
        _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

      }
      goto LABEL_108;
    }
    v34 = *v33;
    self->_maximumSequenceLength = *(int *)(*v33 + 8);
    if (self->_numInputs != *(_DWORD *)(v34 + 24))
    {
      v70 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "internal");
      v72 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected input tensor shape"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__p = 138543618;
        *(_QWORD *)&__p[4] = v85;
        v104 = 2114;
        v105 = v86;
        _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

      }
      goto LABEL_108;
    }
LABEL_41:
    v18 = *(unsigned __int8 **)v18;
    if (!v18)
      goto LABEL_42;
  }
  v70 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(self);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "internal");
  v72 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    NLGetLogIdentifier(self);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected input rank"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__p = 138543618;
    *(_QWORD *)&__p[4] = v79;
    v104 = 2114;
    v105 = v80;
    _os_log_impl(&dword_1A36A7000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);

  }
LABEL_108:

  objc_autoreleasePoolPop(v70);
  v64 = 0;
LABEL_109:
  if (v101)
    (*(void (**)())(*(_QWORD *)v101 + 8))();
LABEL_111:
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)v102);
  return v64;
}

- (void)_setInputFragments:(int *)a3 count:(unint64_t)a4
{
  unordered_map<std::string, std::shared_ptr<E5RT::BufferObject>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::shared_ptr<E5RT::BufferObject>>>> *p_buffers;
  unsigned __int8 *v8;
  uint64_t DataSpan;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t maximumSequenceLength;
  uint64_t i;
  void *__p[2];
  char v16;
  void **v17;

  p_buffers = &self->_buffers;
  std::string::basic_string[abi:ne180100]<0>(__p, "mlm_input");
  v17 = __p;
  v8 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_buffers, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v17);
  DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v8 + 5));
  v11 = v10 & 0xFFFFFFFFFFFFFFFCLL;
  if (v10 >= 4)
    v12 = (void *)DataSpan;
  else
    v12 = 0;
  if (v16 < 0)
    operator delete(__p[0]);
  bzero(v12, v11);
  maximumSequenceLength = self->_maximumSequenceLength;
  if (maximumSequenceLength >= a4)
    maximumSequenceLength = a4;
  if (maximumSequenceLength)
  {
    for (i = 0; i != maximumSequenceLength; ++i)
    {
      *((_DWORD *)v12 + self->_numInputs * (int)i) = a3[i];
      *((_DWORD *)v12 + self->_numInputs * (int)i + 1) = i;
      *((_DWORD *)v12 + self->_numInputs * (int)i + 2) = 0;
    }
  }
}

- (BOOL)isBackboneLoaded
{
  NSString *loadedFunction;
  void *v3;
  BOOL v4;

  if (!self->_stream.__ptr_.__value_)
    return 0;
  loadedFunction = self->_loadedFunction;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSString isEqualToString:](loadedFunction, "isEqualToString:", v3);

  return v4;
}

- (BOOL)loadBackbone
{
  BOOL v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  ExecutionStream *value;
  ExecutionStream *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NLE5Embedding isBackboneLoaded](self, "isBackboneLoaded"))
    return 1;
  v4 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NLGetLogIdentifier(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading backbone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1A36A7000, v6, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  value = self->_stream.__ptr_.__value_;
  if (value)
  {
    E5RT::ExecutionStream::ResetStream((E5RT::ExecutionStream *)value);
    v10 = self->_stream.__ptr_.__value_;
    self->_stream.__ptr_.__value_ = 0;
    if (v10)
      (*(void (**)(ExecutionStream *))(*(_QWORD *)v10 + 8))(v10);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NLE5Embedding _loadFunction:](self, "_loadFunction:", "main");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v11);
  v14 = v13;

  v15 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internal");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NLGetLogIdentifier(self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent creating Execution Stream and allocating buffers"), v14 * 1000.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v18;
    v23 = 2114;
    v24 = v19;
    _os_log_impl(&dword_1A36A7000, v17, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);

  return v3;
}

- (BOOL)isAdapterLoaded:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = self->_stream.__ptr_.__value_ && -[NSString isEqualToString:](self->_loadedFunction, "isEqualToString:", v4);

  return v5;
}

- (BOOL)loadAdapter:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  ExecutionStream *value;
  ExecutionStream *v14;
  NSString *loadedFunction;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NLE5Embedding isAdapterLoaded:](self, "isAdapterLoaded:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[NLE5Embedding adapters](self, "adapters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    v8 = (void *)MEMORY[0x1A8592E0C]();
    if ((v7 & 1) != 0)
    {
      NLGetLogCategory(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "internal");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NLGetLogIdentifier(self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Loading adapter '%@'"), v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v11;
        v32 = 2114;
        v33 = v12;
        _os_log_impl(&dword_1A36A7000, v10, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      value = self->_stream.__ptr_.__value_;
      if (value)
      {
        E5RT::ExecutionStream::ResetStream((E5RT::ExecutionStream *)value);
        v14 = self->_stream.__ptr_.__value_;
        self->_stream.__ptr_.__value_ = 0;
        if (v14)
          (*(void (**)(ExecutionStream *))(*(_QWORD *)v14 + 8))(v14);
        loadedFunction = self->_loadedFunction;
        self->_loadedFunction = 0;

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[NLE5Embedding _loadFunction:](self, "_loadFunction:", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v16);
      v19 = v18;

      v20 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "internal");
      v22 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NLGetLogIdentifier(self);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent creating Execution Stream and allocating buffers"), v19 * 1000.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2114;
        v33 = v24;
        _os_log_impl(&dword_1A36A7000, v22, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);

    }
    else
    {
      NLGetLogCategory(self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "internal");
      v26 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("E5 bundle is missing requested adapter '%@'"), v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        v32 = 2114;
        v33 = v28;
        _os_log_impl(&dword_1A36A7000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v5 = 0;
    }
  }

  return v5;
}

- (id)embeddingDataForTokenizedBatch:(id)a3 withOutputProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  std::vector<int>::pointer end;
  int *v13;
  std::vector<int>::pointer begin;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  char *v19;
  int *v20;
  int v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  std::vector<int>::pointer v26;
  std::vector<int>::pointer v27;
  std::vector<int>::pointer v28;
  std::vector<int>::pointer v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  NSObject *v40;
  int *v41;
  int *v42;
  unsigned __int8 *v43;
  uint64_t DataSpan;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  int *v49;
  int *v50;
  void *exception;
  void *v53;
  void *v54;
  id v55;
  id v56;
  unint64_t i;
  id v58;
  CFTypeRef cf;
  std::vector<int> buf;
  std::vector<int> __p;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v6 = a4;
  v58 = v6;
  if (self->_stream.__ptr_.__value_)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v56, "count"); ++i)
    {
      objc_msgSend(v56, "objectAtIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&__p, 0, sizeof(__p));
      -[NLE5Embedding _tokenIDsForText:addBOS:](self, "_tokenIDsForText:addBOS:", &stru_1E4A3BA10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      end = __p.__end_;
      if (__p.__end_ >= __p.__end_cap_.__value_)
      {
        begin = __p.__begin_;
        v15 = __p.__end_ - __p.__begin_;
        v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 62)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v17 = (char *)__p.__end_cap_.__value_ - (char *)__p.__begin_;
        if (((char *)__p.__end_cap_.__value_ - (char *)__p.__begin_) >> 1 > v16)
          v16 = v17 >> 1;
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
          v18 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v18 = v16;
        if (v18)
        {
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&__p.__end_cap_, v18);
          begin = __p.__begin_;
          end = __p.__end_;
        }
        else
        {
          v19 = 0;
        }
        v20 = (int *)&v19[4 * v15];
        *v20 = v11;
        v13 = v20 + 1;
        while (end != begin)
        {
          v21 = *--end;
          *--v20 = v21;
        }
        __p.__begin_ = v20;
        __p.__end_ = v13;
        __p.__end_cap_.__value_ = (int *)&v19[4 * v18];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *__p.__end_ = v11;
        v13 = end + 1;
      }
      v22 = 0;
      __p.__end_ = v13;
      while (objc_msgSend(v7, "count") > v22)
      {
        objc_msgSend(v7, "objectAtIndex:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLE5Embedding _tokenIDsForText:addBOS:](self, "_tokenIDsForText:addBOS:", v23, 0);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
          CFRetain(v24);
        applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v25);

        if (!cf)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1A8592A4C](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
        }
        applesauce::CF::convert_to<std::vector<int>,0>(cf, &buf);
        v27 = __p.__begin_;
        v26 = __p.__end_;
        v29 = buf.__begin_;
        v28 = buf.__end_;
        v30 = -[NLE5Embedding maximumSequenceLength](self, "maximumSequenceLength");
        v31 = v28 - v29 + v26 - v27;
        v6 = v58;
        if (v31 <= v30)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", __p.__end_ - __p.__begin_, buf.__end_ - buf.__begin_);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v32);

          std::vector<int>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(&__p, (uint64_t)__p.__end_, (char *)buf.__begin_, (char *)buf.__end_, buf.__end_ - buf.__begin_);
        }
        if (buf.__begin_)
        {
          buf.__end_ = buf.__begin_;
          operator delete(buf.__begin_);
        }
        if (cf)
          CFRelease(cf);
        if (v31 > v30)
          break;
        ++v22;
      }
      while (objc_msgSend(v7, "count") > v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v33);

        ++v22;
      }
      -[NLE5Embedding _setInputFragments:count:](self, "_setInputFragments:count:");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", v34);
      v37 = v36;

      v38 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "internal");
      v40 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        NLGetLogIdentifier(self);
        v41 = (int *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent running inference"), v37 * 1000.0);
        v42 = (int *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.__begin_) = 138543618;
        *(std::vector<int>::pointer *)((char *)&buf.__begin_ + 4) = v41;
        WORD2(buf.__end_) = 2114;
        *(std::vector<int>::pointer *)((char *)&buf.__end_ + 6) = v42;
        _os_log_impl(&dword_1A36A7000, v40, OS_LOG_TYPE_INFO, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      std::string::basic_string[abi:ne180100]<0>(&buf, "mlm_embeddings");
      cf = &buf;
      v43 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_buffers, (unsigned __int8 *)&buf, (uint64_t)&std::piecewise_construct, (__int128 **)&cf);
      DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v43 + 5));
      objc_msgSend(v55, "appendBytes:length:", DataSpan, 4 * self->_dimension * ((unint64_t)((char *)__p.__end_ - (char *)__p.__begin_) >> 2));
      if (SHIBYTE(buf.__end_cap_.__value_) < 0)
        operator delete(buf.__begin_);
      objc_msgSend(v54, "addObject:", v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", __p.__end_ - __p.__begin_);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v45);

      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D174B8]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D174C0]);

  }
  else
  {
    v46 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "internal");
    v48 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v49 = (int *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Execution stream hasn't been created"));
      v50 = (int *)objc_claimAutoreleasedReturnValue();
      LODWORD(__p.__begin_) = 138543618;
      *(std::vector<int>::pointer *)((char *)&__p.__begin_ + 4) = v49;
      WORD2(__p.__end_) = 2114;
      *(std::vector<int>::pointer *)((char *)&__p.__end_ + 6) = v50;
      _os_log_impl(&dword_1A36A7000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&__p, 0x16u);

    }
    objc_autoreleasePoolPop(v46);
    v55 = 0;
  }

  return v55;
}

- (id)embeddingDataForString:(id)a3 sequenceSize:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  std::vector<int>::pointer end;
  std::vector<int>::pointer begin;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 *v30;
  uint64_t DataSpan;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int *v36;
  int *v37;
  void *exception;
  CFTypeRef cf;
  __int128 *v41;
  _BYTE buf[12];
  __int16 v43;
  void *v44;
  char v45;
  uint64_t v46;
  const __CFString *v47;
  std::vector<int> v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_stream.__ptr_.__value_)
  {
    -[NLE5Embedding _tokenIDsForText:addBOS:](self, "_tokenIDsForText:addBOS:", v8, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      CFRetain(v9);
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v10);

    if (!cf)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A8592A4C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    applesauce::CF::convert_to<std::vector<int>,0>(cf, &v48);
    begin = v48.__begin_;
    end = v48.__end_;
    if (-[NLE5Embedding maximumSequenceLength](self, "maximumSequenceLength") < end - begin)
    {
      v13 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internal");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(self);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input string length exceeds max sequence length supported by the model"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v16;
        v43 = 2114;
        v44 = v17;
        _os_log_impl(&dword_1A36A7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      if (a5)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v47 = CFSTR("Input trimmed up to max sequence length");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 4, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      std::vector<int>::resize(&v48, -[NLE5Embedding maximumSequenceLength](self, "maximumSequenceLength"));
    }
    -[NLE5Embedding _setInputFragments:count:](self, "_setInputFragments:count:");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v20);
    v23 = v22;

    v24 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "internal");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      NLGetLogIdentifier(self);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f ms spent running inference"), v23 * 1000.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      v43 = 2114;
      v44 = v28;
      _os_log_impl(&dword_1A36A7000, v26, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    v29 = (void *)MEMORY[0x1E0C99D50];
    std::string::basic_string[abi:ne180100]<0>(buf, "mlm_embeddings");
    v41 = (__int128 *)buf;
    v30 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_buffers, buf, (uint64_t)&std::piecewise_construct, &v41);
    DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v30 + 5));
    objc_msgSend(v29, "dataWithBytes:length:", DataSpan, 4 * self->_dimension * ((unint64_t)((char *)v48.__end_ - (char *)v48.__begin_) >> 2));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 < 0)
      operator delete(*(void **)buf);
    if (a4)
      *a4 = v48.__end_ - v48.__begin_;

    if (v48.__begin_)
    {
      v48.__end_ = v48.__begin_;
      operator delete(v48.__begin_);
    }
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v33 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "internal");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v36 = (int *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Execution stream hasn't been created"));
      v37 = (int *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48.__begin_) = 138543618;
      *(std::vector<int>::pointer *)((char *)&v48.__begin_ + 4) = v36;
      WORD2(v48.__end_) = 2114;
      *(std::vector<int>::pointer *)((char *)&v48.__end_ + 6) = v37;
      _os_log_impl(&dword_1A36A7000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v48, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v32 = 0;
  }

  return v32;
}

- (id)textForTokenIDs:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_subwordVocabRef)
  {
    v5 = (__CFString *)NLEmbeddingSubwordVocabCopyTextForTokenIds();
  }
  else
  {
    v6 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sentence piece tokenizer is not set"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A36A7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = &stru_1E4A3BA10;
  }

  return v5;
}

- (id)tokenIDsForText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_subwordVocabRef)
  {
    -[NLE5Embedding _tokenIDsForText:addBOS:](self, "_tokenIDsForText:addBOS:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internal");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sentence piece tokenizer is not set"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A36A7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)_tokenIDsForText:(id)a3 addBOS:(BOOL)a4
{
  return (id)NLEmbeddingSubwordVocabCopyTokenIdsForText();
}

+ (id)logCategory
{
  return +[NLLogCategory categoryWithName:](NLLogCategory, "categoryWithName:", CFSTR("NLE5Embedding"));
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (NSArray)adapters
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAdapters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  ExecutionStream *value;
  ProgramLibrary *v4;

  objc_storeStrong((id *)&self->_adapters, 0);
  objc_storeStrong((id *)&self->_loadedFunction, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)&self->_buffers);
  std::shared_ptr<E5RT::ProgramFunction>::~shared_ptr[abi:ne180100]((uint64_t)&self->_main_esop);
  value = self->_stream.__ptr_.__value_;
  self->_stream.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ExecutionStream *))(*(_QWORD *)value + 8))(value);
  v4 = self->_programLibrary.__ptr_.__value_;
  self->_programLibrary.__ptr_.__value_ = 0;
  if (v4)
    (*(void (**)(ProgramLibrary *))(*(_QWORD *)v4 + 8))(v4);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end
