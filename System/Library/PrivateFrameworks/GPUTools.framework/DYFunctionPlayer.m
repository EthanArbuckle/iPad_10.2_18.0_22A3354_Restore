@implementation DYFunctionPlayer

- (DYFunctionPlayer)init
{
  -[DYFunctionPlayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYFunctionPlayer)initWithCaptureStore:(id)a3
{
  DYFunctionPlayer *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  objc_super v11;

  if (!a3)
    __assert_rtn("-[DYFunctionPlayer initWithCaptureStore:]", ", 0, "captureStore");
  v11.receiver = self;
  v11.super_class = (Class)DYFunctionPlayer;
  v4 = -[DYFunctionPlayer init](&v11, sel_init);
  if (v4)
  {
    v4->_captureStore = (DYCaptureStore *)a3;
    v4->_skipOptionalFunctions = 1;
    v4->_executePlatformSEL = sel_executePlatformFunction;
    v5 = -[DYFunctionPlayer methodForSelector:](v4, "methodForSelector:");
    v4->_executePlatform = (void *)v5;
    if (v5)
    {
      v4->_executeGraphicsSEL = sel_executeGraphicsFunction;
      v6 = -[DYFunctionPlayer methodForSelector:](v4, "methodForSelector:");
      v4->_executeGraphics = (void *)v6;
      if (v6)
      {
        v4->_shouldExecuteGraphicsSEL = sel_shouldExecuteGraphicsFunction;
        v7 = -[DYFunctionPlayer methodForSelector:](v4, "methodForSelector:");
        v4->_shouldExecuteGraphics = (void *)v7;
        if (v7)
        {
          v4->_isFrameBoundarySEL = sel_isFrameBoundary;
          v8 = -[DYFunctionPlayer methodForSelector:](v4, "methodForSelector:");
          v4->_isFrameBoundary = (void *)v8;
          if (v8)
          {
            v4->_retval_buffer = malloc_type_malloc(0x80uLL, 0x495FC8D5uLL);
            v4->_variables = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 1282, 0);
            return v4;
          }
          v10 = "_isFrameBoundary";
        }
        else
        {
          v10 = "_shouldExecuteGraphics";
        }
      }
      else
      {
        v10 = "_executeGraphics";
      }
    }
    else
    {
      v10 = "_executePlatform";
    }
    __assert_rtn("-[DYFunctionPlayer initWithCaptureStore:]", ", 0, v10);
  }
  return v4;
}

- (void)dealloc
{
  void *retval_buffer;
  objc_super v4;

  retval_buffer = self->_retval_buffer;
  if (retval_buffer)
    free(retval_buffer);

  v4.receiver = self;
  v4.super_class = (Class)DYFunctionPlayer;
  -[DYFunctionPlayer dealloc](&v4, sel_dealloc);
}

- (void)prepareForNonCaptureExecution
{
  self->_mainExecutionMode = 0;
  self->_currentExecutionModeFunctionIndex = 0;
}

- (void)prepareForCaptureExecution
{
  self->_mainExecutionMode = 1;
  self->_currentExecutionModeFunctionIndex = 0;
  self->_frameCounter = 0;
  self->_lastCommandWasFrameBoundary = 1;
  if (-[DYPlaybackEngine loopCount](-[DYFunctionPlayer engine](self, "engine"), "loopCount") >= 3)
    GPUTools::Playback::MemoryManager::Begin(&self->_memoryManager._state);
}

- (void)performNewExecutionFileActions
{
  self->_currentFileFunctionIndex = 0;
}

- (BOOL)isFrameBoundary
{
  -[DYFunctionPlayer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4
{
  -[DYFunctionPlayer executeFunctions:count:subCommandIndex:](self, "executeFunctions:count:subCommandIndex:", a3, a4, 0);
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5
{
  CoreFunction *v6;
  MemoryManager *p_memoryManager;
  int32x2_t *p_currentExecutionModeFunctionIndex;
  void *v9;
  uint64_t v10;
  int v11;
  CoreFunction *v12;
  uint64_t v13;
  uint64_t v14;
  CoreFunction *v15;

  self->_function = a3;
  if (a4)
  {
    v6 = &a3[a4];
    p_memoryManager = &self->_memoryManager;
    p_currentExecutionModeFunctionIndex = (int32x2_t *)&self->_currentExecutionModeFunctionIndex;
    do
    {
      v9 = (void *)MEMORY[0x2426225CC]();
      if (((_BYTE)-[DYFunctionPlayer function](self, "function")[4] & 2) == 0
        && (!-[DYFunctionPlayer skipOptionalFunctions](self, "skipOptionalFunctions")
         || ((_BYTE)-[DYFunctionPlayer function](self, "function")[5] & 1) == 0))
      {
        v10 = (uint64_t)-[DYFunctionPlayer function](self, "function")[16];
        if (v10 != -[DYFunctionPlayer ctxID](self, "ctxID"))
          -[DYFunctionPlayer setCurrentContext:](self, "setCurrentContext:", (_QWORD)-[DYFunctionPlayer function](self, "function")[16]);
        if (-[DYFunctionPlayer mainExecutionMode](self, "mainExecutionMode") && self->_lastCommandWasFrameBoundary)
        {
          self->_lastCommandWasFrameBoundary = 0;
          -[DYFunctionPlayer performNewFrameActions](self, "performNewFrameActions");
        }
        v11 = ((uint64_t (*)(DYFunctionPlayer *, SEL))self->_isFrameBoundary)(self, self->_isFrameBoundarySEL);
        if (-[DYFunctionPlayer mainExecutionMode](self, "mainExecutionMode") && v11)
        {
          -[DYFunctionPlayer setFrameCounter:](self, "setFrameCounter:", -[DYFunctionPlayer frameCounter](self, "frameCounter") + 1);
          -[DYFunctionPlayer performPreDispatchFrameBoundaryActions](self, "performPreDispatchFrameBoundaryActions");
        }
        v12 = -[DYFunctionPlayer function](self, "function");
        if (v12->fenum <= 0xFFFFCFFF)
          v13 = 24;
        else
          v13 = 8;
        if (v12->fenum <= 0xFFFFCFFF)
          v14 = 32;
        else
          v14 = 16;
        (*(void (**)(DYFunctionPlayer *, _QWORD))((char *)&self->super.isa + v13))(self, *(Class *)((char *)&self->super.isa + v14));
        if ((-[DYFunctionPlayer mainExecutionMode](self, "mainExecutionMode") & v11) == 1)
        {
          -[DYFunctionPlayer performPostDispatchFrameBoundaryActions](self, "performPostDispatchFrameBoundaryActions");
          self->_lastCommandWasFrameBoundary = 1;
        }
        GPUTools::Playback::MemoryManager::AllocClear((GPUTools::Playback::MemoryManager *)p_memoryManager);
        -[DYFunctionPlayer releaseArguments](self, "releaseArguments");
      }
      objc_autoreleasePoolPop(v9);
      v15 = self->_function + 1;
      self->_function = v15;
      *p_currentExecutionModeFunctionIndex = vadd_s32(*p_currentExecutionModeFunctionIndex, (int32x2_t)0x100000001);
    }
    while (v15 != v6);
  }
}

- (void)copyDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4
{
  void *v7;
  DYCaptureStore *v8;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (a4)
    *a4 = 0;
  v12 = 0;
  if ((-[DYCaptureStore getInfo:forFilenameBuffer:error:](-[DYFunctionPlayer captureStore](self, "captureStore"), "getInfo:forFilenameBuffer:error:", &v10, a3, &v12) & 1) == 0|| (v7 = (void *)GPUTools::Playback::MemoryManager::Alloc((GPUTools::Playback::MemoryManager *)&self->_memoryManager, v11), v8 = -[DYFunctionPlayer captureStore](self, "captureStore"), -[DYCaptureStore readDataForFilePosition:buffer:size:error:](v8, "readDataForFilePosition:buffer:size:error:", v10, v7, v11, &v12) == -1))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    _DYOLog();
    return 0;
  }
  else if (a4)
  {
    *a4 = v11;
  }
  return v7;
}

- (void)releaseDataForPosition:(unint64_t)a3
{
  -[DYCaptureStore releaseBytesForFilePosition:](-[DYFunctionPlayer captureStore](self, "captureStore"), "releaseBytesForFilePosition:", a3);
}

- (void)requestDataForPosition:(unint64_t)a3 dataSize:(unint64_t *)a4
{
  void *v5;
  uint64_t v6;

  if (a4)
    *a4 = 0;
  v5 = 0;
  v6 = 0;
  if ((-[DYCaptureStore requestDataForFilePosition:buffer:size:error:](-[DYFunctionPlayer captureStore](self, "captureStore"), "requestDataForFilePosition:buffer:size:error:", a3, &v5, a4, &v6) & 1) != 0)return v5;
  _DYOLog();
  return 0;
}

- (void)requestDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4 position:(unint64_t *)a5
{
  unint64_t v9[4];
  uint64_t v10;

  if (a4)
    *a4 = 0;
  v10 = 0;
  if ((-[DYCaptureStore getInfo:forFilenameBuffer:error:](-[DYFunctionPlayer captureStore](self, "captureStore"), "getInfo:forFilenameBuffer:error:", v9, a3, &v10) & 1) != 0)
  {
    *a5 = v9[0];
    return -[DYFunctionPlayer requestDataForPosition:dataSize:](self, "requestDataForPosition:dataSize:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    _DYOLog();
    return 0;
  }
}

- (void)addPointerDataSizeMap:(void *)a3
{
  std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__move_assign((uint64_t)&self->_dataSizeMap, (uint64_t *)a3);
}

- (void)releaseDataForArgument:(int)a3
{
  char *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t *v8;

  v3 = (char *)self + 24 * a3;
  v4 = v3 + 984;
  v5 = *((_QWORD *)v3 + 123);
  if (v5 != *((_QWORD *)v3 + 122))
  {
    v7 = 0;
    v8 = (uint64_t *)(v3 + 976);
    v5 = *((_QWORD *)v3 + 122);
    do
    {
      -[DYFunctionPlayer releaseDataForPosition:](self, "releaseDataForPosition:", *(_QWORD *)(v5 + 8 * v7++));
      v5 = *v8;
    }
    while (v7 < (*v4 - *v8) >> 3);
  }
  *v4 = v5;
}

- (void)releaseArguments
{
  CoreFunction *function;
  uint64_t v4;
  Argument *arguments;
  vector<unsigned long long, std::allocator<unsigned long long>> *argumentStorePositions;
  uint64_t v7;

  function = self->_function;
  if (function->argument_count)
  {
    v4 = 0;
    arguments = function->arguments;
    argumentStorePositions = self->_argumentStorePositions;
    v7 = 24 * function->argument_count;
    do
    {
      if (arguments->value)
      {
        if (argumentStorePositions[v4].__begin_ != argumentStorePositions[v4].__end_)
          -[DYFunctionPlayer releaseDataForArgument:](self, "releaseDataForArgument:", v4);
        ++v4;
      }
      ++arguments;
      v7 -= 24;
    }
    while (v7);
  }
}

- (void)processArguments
{
  CoreFunction *function;
  uint64_t v3;
  Argument *arguments;
  uint64_t v5;
  void **pointers;
  uint64_t *v7;
  vector<unsigned long long, std::allocator<unsigned long long>> *v8;
  char **p_end;
  unsigned __int16 flags;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  vector<unsigned long long, std::allocator<unsigned long long>> *v15;
  unint64_t v16;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  vector<unsigned long long, std::allocator<unsigned long long>> *v24;
  unint64_t v25;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *p_end_cap;
  unint64_t value;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *v33;
  uint64_t *v34;
  __compressed_pair<std::pair<std::string, BOOL> *, std::allocator<std::pair<std::string, BOOL>>> *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *v54;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *v55;
  void **v56;
  __compressed_pair<std::pair<std::string, BOOL> *, std::allocator<std::pair<std::string, BOOL>>> *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t length;
  _QWORD *v94;
  unsigned int v95;
  char *v96;
  uint64_t v97;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *v98;
  _QWORD *v99;
  void **v100;
  _QWORD *end;
  _QWORD *v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *v114;
  _BYTE *v115;
  _BYTE *v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  GPUTools::Playback::MemoryManager *p_memoryManager;
  void **v121;
  uint64_t v122;
  void **argumentPointers;
  vector<unsigned long long, std::allocator<unsigned long long>> *argumentStorePositions;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *argumentURLs;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *v126;
  _QWORD *v127;
  uint64_t *v128;
  uint64_t *v129;
  unordered_map<void *, unsigned long, std::hash<void *>, std::equal_to<void *>, std::allocator<std::pair<void *const, unsigned long>>> *p_dataSizeMap;
  void **p_begin;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t *v136;
  _QWORD *v137;
  uint64_t *v138;
  __compressed_pair<std::pair<std::string, BOOL> *, std::allocator<std::pair<std::string, BOOL>>> *v139;

  function = self->_function;
  if (function->argument_count)
  {
    v3 = 0;
    arguments = function->arguments;
    v5 = (uint64_t)&function->arguments[function->argument_count];
    argumentStorePositions = self->_argumentStorePositions;
    argumentURLs = self->_argumentURLs;
    v119 = v5;
    p_memoryManager = (GPUTools::Playback::MemoryManager *)&self->_memoryManager;
    p_dataSizeMap = &self->_dataSizeMap;
    pointers = self->_pointers;
    argumentPointers = self->_argumentPointers;
    v121 = self->_pointers;
    while (1)
    {
      v7 = (uint64_t *)&argumentURLs[v3];
      std::vector<std::pair<std::string,BOOL>>::__clear[abi:ne180100](v7);
      v8 = &argumentStorePositions[v3];
      p_begin = (void **)&v8->__begin_;
      v8->__end_ = v8->__begin_;
      p_end = (char **)&v8->__end_;
      flags = arguments->flags;
      if ((flags & 8) != 0)
        break;
      if ((flags & 0x20) != 0)
      {
        if ((flags & 1) == 0)
        {
          v20 = *(_QWORD *)arguments->value;
          v134 = 0;
          v21 = (uint64_t *)&pointers[v3];
          *v21 = (uint64_t)-[DYFunctionPlayer requestDataForPosition:dataSize:](self, "requestDataForPosition:dataSize:", v20, &v134);
          v22 = v134;
          v135 = v21;
          std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v21, (uint64_t)&std::piecewise_construct, &v135)[3] = v22;
          argumentPointers[v3] = v21;
          v23 = *p_end;
          v24 = &argumentStorePositions[v3];
          value = (unint64_t)v24->__end_cap_.__value_;
          p_end_cap = &v24->__end_cap_;
          v25 = value;
          if ((unint64_t)*p_end >= value)
          {
            v79 = (char *)*p_begin;
            v80 = (v23 - (_BYTE *)*p_begin) >> 3;
            v81 = v80 + 1;
            if ((unint64_t)(v80 + 1) >> 61)
              goto LABEL_139;
            v82 = v25 - (_QWORD)v79;
            if (v82 >> 2 > v81)
              v81 = v82 >> 2;
            if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
              v83 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v83 = v81;
            if (v83)
            {
              v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)p_end_cap, v83);
              v23 = *p_end;
              v79 = (char *)*p_begin;
            }
            else
            {
              v84 = 0;
            }
            v96 = &v84[8 * v80];
            *(_QWORD *)v96 = v20;
            v28 = v96 + 8;
            while (v23 != v79)
            {
              v97 = *((_QWORD *)v23 - 1);
              v23 -= 8;
              *((_QWORD *)v96 - 1) = v97;
              v96 -= 8;
            }
            *p_begin = v96;
            *p_end = v28;
            p_end_cap->__value_ = (unint64_t *)&v84[8 * v83];
            if (v79)
              operator delete(v79);
          }
          else
          {
            *(_QWORD *)v23 = v20;
            v28 = v23 + 8;
          }
          *p_end = v28;
          v98 = &argumentURLs[v3];
          end = v98->__end_;
          v100 = &v98->__end_;
          v99 = end;
          v102 = v100[1];
          if (end >= v102)
          {
            v104 = ((uint64_t)v99 - *v7) >> 5;
            v105 = v104 + 1;
            if ((unint64_t)(v104 + 1) >> 59)
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            v106 = (uint64_t)v102 - *v7;
            if (v106 >> 4 > v105)
              v105 = v106 >> 4;
            if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFE0)
              v107 = 0x7FFFFFFFFFFFFFFLL;
            else
              v107 = v105;
            v139 = (__compressed_pair<std::pair<std::string, BOOL> *, std::allocator<std::pair<std::string, BOOL>>> *)(v100 + 1);
            v108 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>((uint64_t)(v100 + 1), v107);
            v109 = &v108[4 * v104];
            v135 = v108;
            v136 = v109;
            v138 = &v108[4 * v110];
            *v109 = 0;
            v109[1] = 0;
            v109[2] = 0;
            *((_BYTE *)v109 + 24) = 1;
            v137 = v109 + 4;
            std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(v7, &v135);
            v103 = *v100;
            std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)&v135);
          }
          else
          {
            *v99 = 0;
            v99[1] = 0;
            v99[2] = 0;
            *((_BYTE *)v99 + 24) = 1;
            v103 = v99 + 4;
            *v100 = v99 + 4;
          }
          *v100 = v103;
          goto LABEL_137;
        }
        v129 = (uint64_t *)&argumentURLs[v3];
        v122 = v3;
        v29 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
        if (arguments->length)
        {
          v53 = 0;
          v127 = arguments->value;
          v54 = &argumentStorePositions[v122].__end_cap_;
          v55 = &argumentURLs[v122];
          v56 = &v55->__end_;
          v57 = &v55->__end_cap_;
          do
          {
            v58 = v127[v53];
            if (v58 == -1)
            {
              *(_QWORD *)(v29 + 8 * v53) = 0;
            }
            else
            {
              v134 = 0;
              *(_QWORD *)(v29 + 8 * v53) = -[DYFunctionPlayer requestDataForPosition:dataSize:](self, "requestDataForPosition:dataSize:", v58, &v134);
              v59 = *p_end;
              if ((unint64_t *)*p_end >= v54->__value_)
              {
                v61 = (char *)*p_begin;
                v62 = (v59 - (_BYTE *)*p_begin) >> 3;
                v63 = v62 + 1;
                if ((unint64_t)(v62 + 1) >> 61)
                  goto LABEL_139;
                v64 = (char *)v54->__value_ - v61;
                if (v64 >> 2 > v63)
                  v63 = v64 >> 2;
                if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8)
                  v65 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v65 = v63;
                if (v65)
                {
                  v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v54, v65);
                  v59 = *p_end;
                  v61 = (char *)*p_begin;
                }
                else
                {
                  v66 = 0;
                }
                v67 = &v66[8 * v62];
                *(_QWORD *)v67 = v58;
                v60 = v67 + 8;
                while (v59 != v61)
                {
                  v68 = *((_QWORD *)v59 - 1);
                  v59 -= 8;
                  *((_QWORD *)v67 - 1) = v68;
                  v67 -= 8;
                }
                *p_begin = v67;
                *p_end = v60;
                v54->__value_ = (unint64_t *)&v66[8 * v65];
                if (v61)
                  operator delete(v61);
              }
              else
              {
                *(_QWORD *)v59 = v58;
                v60 = v59 + 8;
              }
              *p_end = v60;
              v69 = v134;
              v135 = (uint64_t *)(v29 + 8 * v53);
              std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v69;
            }
            v70 = *v56;
            if (*v56 >= v57->__value_)
            {
              v72 = ((uint64_t)v70 - *v129) >> 5;
              v73 = v72 + 1;
              if ((unint64_t)(v72 + 1) >> 59)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              v74 = (uint64_t)v57->__value_ - *v129;
              if (v74 >> 4 > v73)
                v73 = v74 >> 4;
              if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFE0)
                v75 = 0x7FFFFFFFFFFFFFFLL;
              else
                v75 = v73;
              v139 = v57;
              v76 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>((uint64_t)v57, v75);
              v77 = &v76[4 * v72];
              v135 = v76;
              v136 = v77;
              v138 = &v76[4 * v78];
              v77[1] = 0;
              v77[2] = 0;
              *v77 = 0;
              *((_BYTE *)v77 + 24) = 1;
              v137 = v77 + 4;
              std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(v129, &v135);
              v71 = *v56;
              std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)&v135);
            }
            else
            {
              *v70 = 0;
              v70[1] = 0;
              v70[2] = 0;
              *((_BYTE *)v70 + 24) = 1;
              v71 = v70 + 4;
              *v56 = v70 + 4;
            }
            *v56 = v71;
            ++v53;
          }
          while (v53 < arguments->length);
        }
        goto LABEL_84;
      }
      if ((flags & 0x10) != 0)
      {
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", arguments->value, strlen((const char *)arguments->value), 1, 0);
        pointers[v3] = NSMapGet(self->_variables, v52);
        argumentPointers[v3] = &pointers[v3];

      }
      else
      {
        if ((flags & 2) != 0)
          goto LABEL_104;
        if ((flags & 1) != 0)
        {
          if ((flags & 0x40) != 0)
          {
LABEL_104:
            v91 = (const char *)arguments->value;
            v92 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
            length = arguments->length;
            if (arguments->length)
            {
              v94 = (_QWORD *)v92;
              do
              {
                v95 = *(_DWORD *)v91;
                v91 += 4;
                *v94++ = (char *)arguments->value + v95;
                --length;
              }
              while (length);
            }
            v11 = (char *)&pointers[v3];
            *(_QWORD *)v11 = v92;
            goto LABEL_108;
          }
        }
        else if (arguments->core_type != 13)
        {
          v11 = (char *)arguments->value;
LABEL_108:
          argumentPointers[v3] = v11;
          goto LABEL_137;
        }
        pointers[v3] = arguments->value;
        argumentPointers[v3] = &pointers[v3];
      }
LABEL_137:
      ++v3;
      if (++arguments == (Argument *)v5)
        return;
    }
    v128 = (uint64_t *)&argumentURLs[v3];
    if ((flags & 1) == 0)
    {
      if (arguments->value)
        v12 = (char *)arguments->value;
      else
        v12 = "";
      if (*v12)
      {
        v133 = 0;
        v134 = 0;
        pointers[v3] = -[DYFunctionPlayer requestDataForFilename:dataSize:position:](self, "requestDataForFilename:dataSize:position:", v12, &v134, &v133);
        v13 = v133;
        if (v133 != -1)
        {
          v14 = *p_end;
          v15 = &argumentStorePositions[v3];
          v18 = (unint64_t)v15->__end_cap_.__value_;
          v17 = &v15->__end_cap_;
          v16 = v18;
          if ((unint64_t)*p_end >= v18)
          {
            v85 = (char *)*p_begin;
            v86 = (v14 - (_BYTE *)*p_begin) >> 3;
            v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 61)
LABEL_139:
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            v88 = v16 - (_QWORD)v85;
            if (v88 >> 2 > v87)
              v87 = v88 >> 2;
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8)
              v89 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v89 = v87;
            if (v89)
            {
              v90 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v17, v89);
              v14 = *p_end;
              v85 = (char *)*p_begin;
              v13 = v133;
            }
            else
            {
              v90 = 0;
            }
            v111 = &v90[8 * v86];
            *(_QWORD *)v111 = v13;
            v19 = v111 + 8;
            while (v14 != v85)
            {
              v112 = *((_QWORD *)v14 - 1);
              v14 -= 8;
              *((_QWORD *)v111 - 1) = v112;
              v111 -= 8;
            }
            *p_begin = v111;
            *p_end = v19;
            v17->__value_ = (unint64_t *)&v90[8 * v89];
            if (v85)
              operator delete(v85);
          }
          else
          {
            *(_QWORD *)v14 = v133;
            v19 = v14 + 8;
          }
          *p_end = v19;
        }
        v113 = v134;
        v135 = (uint64_t *)&pointers[v3];
        std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v113;
      }
      else
      {
        pointers[v3] = 0;
      }
      argumentPointers[v3] = &pointers[v3];
      v135 = (uint64_t *)v12;
      v136 = 0;
      v114 = &argumentURLs[v3];
      v116 = v114->__end_;
      v115 = v114->__end_cap_.__value_;
      v117 = (uint64_t *)&v114->__end_;
      if (v116 >= v115)
      {
        v118 = std::vector<std::pair<std::string,BOOL>>::__emplace_back_slow_path<std::pair<char const*,BOOL>>(v128, (uint64_t)&v135);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v116, v12);
        v116[24] = (_BYTE)v136;
        v118 = (uint64_t)(v116 + 32);
        *v117 = (uint64_t)(v116 + 32);
      }
      *v117 = v118;
      pointers = v121;
      goto LABEL_137;
    }
    v122 = v3;
    v29 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
    v30 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)arguments);
    if (arguments->length)
    {
      v31 = v30;
      v32 = 0;
      v126 = &argumentStorePositions[v3].__end_cap_;
      v33 = &argumentURLs[v3];
      v34 = (uint64_t *)&v33->__end_;
      v35 = &v33->__end_cap_;
      do
      {
        v36 = *(_QWORD *)v31;
        if ((*(_WORD *)(v31 + 22) & 0x40) != 0)
          v37 = (uint64_t *)(*(unsigned int *)(v36 + 4 * v32) + v36);
        else
          v37 = *(uint64_t **)(v36 + 8 * v32);
        if (*(_BYTE *)v37)
        {
          v133 = 0;
          v134 = 0;
          *(_QWORD *)(v29 + 8 * v32) = -[DYFunctionPlayer requestDataForFilename:dataSize:position:](self, "requestDataForFilename:dataSize:position:", v37, &v134, &v133);
          v38 = v133;
          if (v133 != -1)
          {
            v39 = *p_end;
            if ((unint64_t *)*p_end >= v126->__value_)
            {
              v41 = (char *)*p_begin;
              v42 = (v39 - (_BYTE *)*p_begin) >> 3;
              v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 61)
                goto LABEL_139;
              v44 = (char *)v126->__value_ - v41;
              if (v44 >> 2 > v43)
                v43 = v44 >> 2;
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8)
                v45 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v45 = v43;
              if (v45)
              {
                v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v126, v45);
                v39 = *p_end;
                v41 = (char *)*p_begin;
                v38 = v133;
              }
              else
              {
                v46 = 0;
              }
              v47 = &v46[8 * v42];
              *(_QWORD *)v47 = v38;
              v40 = v47 + 8;
              while (v39 != v41)
              {
                v48 = *((_QWORD *)v39 - 1);
                v39 -= 8;
                *((_QWORD *)v47 - 1) = v48;
                v47 -= 8;
              }
              *p_begin = v47;
              *p_end = v40;
              v126->__value_ = (unint64_t *)&v46[8 * v45];
              if (v41)
                operator delete(v41);
            }
            else
            {
              *(_QWORD *)v39 = v133;
              v40 = v39 + 8;
            }
            *p_end = v40;
          }
          v49 = v134;
          v135 = (uint64_t *)(v29 + 8 * v32);
          std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v49;
        }
        else
        {
          *(_QWORD *)(v29 + 8 * v32) = 0;
        }
        v135 = v37;
        v136 = 0;
        v50 = *v34;
        if ((void *)*v34 >= v35->__value_)
        {
          v51 = std::vector<std::pair<std::string,BOOL>>::__emplace_back_slow_path<std::pair<char const*,BOOL>>(v128, (uint64_t)&v135);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>((_QWORD *)*v34, (char *)v37);
          *(_BYTE *)(v50 + 24) = (_BYTE)v136;
          v51 = v50 + 32;
          *v34 = v50 + 32;
        }
        *v34 = v51;
        ++v32;
      }
      while (v32 < arguments->length);
    }
LABEL_84:
    pointers = v121;
    v3 = v122;
    v121[v122] = (void *)v29;
    argumentPointers[v122] = &v121[v122];
    v5 = v119;
    goto LABEL_137;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  return 1;
}

- (void)setCurrentContext:(unint64_t)a3
{
  self->_ctxID = a3;
}

+ (CGSize)shrinkSourceSize:(CGSize)a3 toDestSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a4.width / a3.width;
  v5 = a4.height / a3.height;
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (v5 < 1.0 || v4 < 1.0)
    v8 = v6;
  else
    v8 = 1.0;
  v9 = a3.width * v8;
  v10 = a3.height * v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (DYCaptureStore)captureStore
{
  return self->_captureStore;
}

- (unint64_t)ctxID
{
  return self->_ctxID;
}

- (CoreFunction)function
{
  return self->_function;
}

- (DYPlaybackEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  self->_engine = (DYPlaybackEngine *)a3;
}

- (BOOL)skipOptionalFunctions
{
  return self->_skipOptionalFunctions;
}

- (void)setSkipOptionalFunctions:(BOOL)a3
{
  self->_skipOptionalFunctions = a3;
}

- (unsigned)frameCounter
{
  return self->_frameCounter;
}

- (void)setFrameCounter:(unsigned int)a3
{
  self->_frameCounter = a3;
}

- (BOOL)mainExecutionMode
{
  return self->_mainExecutionMode;
}

- (unsigned)currentFileFunctionIndex
{
  return self->_currentFileFunctionIndex;
}

- (unsigned)currentExecutionModeFunctionIndex
{
  return self->_currentExecutionModeFunctionIndex;
}

- (void).cxx_destruct
{
  unint64_t i;
  unint64_t *begin;
  unint64_t j;
  vector<std::pair<std::string, BOOL>, std::allocator<std::pair<std::string, BOOL>>> *v6;

  for (i = 0; i != -384; i -= 24)
  {
    begin = self->_argumentStorePositions[i / 0x18 + 15].__begin_;
    if (begin)
    {
      self->_argumentStorePositions[i / 0x18 + 15].__end_ = begin;
      operator delete(begin);
    }
  }
  for (j = 0; j != -384; j -= 24)
  {
    v6 = &self->_argumentURLs[j / 0x18 + 15];
    std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  }
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&self->_dataSizeMap);
  GPUTools::Playback::SequenceCache::~SequenceCache((GPUTools::Playback::SequenceCache *)&self->_functionIndexSequence);
  GPUTools::Playback::MemoryManager::~MemoryManager((GPUTools::Playback::MemoryManager *)&self->_memoryManager);
}

- (id).cxx_construct
{
  int8x8_t v2;

  GPUTools::Playback::MemoryManager::MemoryManager((GPUTools::Playback::MemoryManager *)&self->_memoryManager, 16, v2);
  GPUTools::Playback::SequenceCache::SequenceCache((GPUTools::Playback::SequenceCache *)&self->_functionIndexSequence);
  self->_dataSizeMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_dataSizeMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_dataSizeMap.__table_.__p3_.__value_ = 1.0;
  *(_OWORD *)&self->_argumentURLs[0].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[0].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[1].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[2].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[2].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[3].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[4].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[4].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[5].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[6].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[6].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[7].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[8].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[8].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[9].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[10].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[10].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[11].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[12].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[12].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[13].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[14].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[14].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[15].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[15].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[14].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[14].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[13].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[12].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[12].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[11].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[10].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[10].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[9].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[8].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[8].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[7].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[6].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[6].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[5].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[4].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[4].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[3].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[2].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[1].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[2].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[0].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[0].__end_cap_.__value_ = 0u;
  return self;
}

@end
