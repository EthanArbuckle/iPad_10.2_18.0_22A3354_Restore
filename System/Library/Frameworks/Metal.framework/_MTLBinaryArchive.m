@implementation _MTLBinaryArchive

- (id)getBinaryDataForKey:(id)a3 reflectionType:(char)a4
{
  void *v4;
  NSObject *queue;
  _QWORD v7[7];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v4 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  if ((self->_options & 2) != 0)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82___MTLBinaryArchive_MTLBinaryArchiveInternal__getBinaryDataForKey_reflectionType___block_invoke;
    v7[3] = &unk_1E0FE2D30;
    v7[5] = a3;
    v7[6] = &v9;
    v7[4] = self;
    v8 = a4;
    dispatch_sync(queue, v7);
    v4 = (void *)v10[5];
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)supportsAIRNT
{
  return !self->_isLegacy;
}

- (id)materializeAIRNTBlockForKey:(id)a3 reflectionType:(char)a4
{
  int v4;
  _BOOL4 alwaysReturnDriverReflection;
  MTLHashKey *v8;
  _QWORD *v9;
  _QWORD *v10;
  char v11;
  char v12;
  size_t v13;
  size_t v14;
  NSObject *subrange;
  NSObject *v16;
  int v17;
  _QWORD *v18;
  size_t v19;
  size_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  MTLBinaryEntry *v24;
  _QWORD *v25;
  uint64_t v26;
  size_t offset;
  size_t v29;
  uint64_t v30[5];

  v4 = a4;
  v30[4] = *MEMORY[0x1E0C80C00];
  alwaysReturnDriverReflection = self->_alwaysReturnDriverReflection;
  v8 = (MTLHashKey *)objc_msgSend(a3, "getFunctionId");
  v9 = std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::find<MTLHashKey>(&self->_executableFileIndex.__table_.__bucket_list_.__ptr_.__value_, v8);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = v4 | 2;
  if (!alwaysReturnDriverReflection)
    v11 = v4;
  if (v4)
    v12 = v11;
  else
    v12 = 0;
  v13 = v9[12];
  v14 = v9[14];
  offset = v9[15];
  v29 = v9[13];
  subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v29, v13);
  if ((v12 & 4) == 0)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_14;
  }
  -[_MTLBinaryArchive reflectionHashWithFunctionId:binaryPos:](self, "reflectionHashWithFunctionId:binaryPos:", v8, v29);
  v18 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v30);
  if (!v18)
    goto LABEL_24;
  v19 = v18[8];
  if (v18[6] == v19)
  {
    v16 = 0;
    v17 = 1;
    goto LABEL_14;
  }
  v20 = v18[9];
  if (!v20)
  {
LABEL_24:
    v16 = subrange;
    if (!subrange)
      return 0;
LABEL_25:
    dispatch_release(v16);
    return 0;
  }
  v16 = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v19, v20);
  v17 = 0;
LABEL_14:
  if ((v12 & 2) == 0)
  {
    v21 = 0;
    goto LABEL_19;
  }
  if (!v14)
  {
    if (subrange)
      dispatch_release(subrange);
    if (!v16)
      return 0;
    goto LABEL_25;
  }
  v22 = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), offset, v14);
  v21 = v22;
  if (v17)
  {
    dispatch_retain(v22);
    v16 = v21;
  }
LABEL_19:
  if (subrange)
  {
    v23 = MTLNewReflectionBlock(0, v21, v16);
    v24 = -[MTLBinaryEntry initWithData:reflectionBlock:binaryPosition:]([MTLBinaryEntry alloc], "initWithData:reflectionBlock:binaryPosition:", subrange, v23, v29);
    dispatch_release(subrange);
    if (v23)
      dispatch_release(v23);
    v25 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_airntOffsetToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v29);
    if (v25)
      v26 = v25[3];
    else
      v26 = -1;
    -[MTLBinaryEntry setIndex:](v24, "setIndex:", v26);
    -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", v24, a3);

    std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::remove(&self->_executableFileIndex.__table_.__bucket_list_.__ptr_.__value_, v10, (uint64_t)v30);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,void *>>>>::reset[abi:ne180100](v30, 0);
    if (!v21)
      goto LABEL_32;
    goto LABEL_31;
  }
  v24 = 0;
  if (v21)
LABEL_31:
    dispatch_release(v21);
LABEL_32:
  if (v16)
    dispatch_release(v16);
  return v24;
}

- (BOOL)updateReflectionForEntry:(id)a3 binaryKey:(id)a4 requiredReflection:(char)a5
{
  char v9;
  uint64_t v10;
  size_t *v11;
  dispatch_data_t subrange;
  char v13;
  dispatch_data_t v14;
  unint64_t v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (!a5 || (~objc_msgSend(a3, "reflectionFlags") & 6) == 0)
    goto LABEL_14;
  if (self->_alwaysReturnDriverReflection)
    v9 = a5 | 2;
  else
    v9 = a5;
  v10 = objc_msgSend(a4, "getFunctionId");
  if ((objc_msgSend(a3, "reflectionFlags") & 2) == 0 && (v9 & 2) != 0)
  {
    -[_MTLBinaryArchive reflectionHashWithFunctionId:binaryPos:](self, "reflectionHashWithFunctionId:binaryPos:", v10, objc_msgSend(a3, "binaryPosition"));
    v11 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, v16);
    if (!v11)
      return (char)v11;
    subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v11[6], v11[7]);
    objc_msgSend(a3, "addReflectionWithData:flag:", subrange, 2);

  }
  v13 = objc_msgSend(a3, "reflectionFlags");
  LOBYTE(v11) = 1;
  if ((v9 & 4) != 0 && (v13 & 4) == 0)
  {
    -[_MTLBinaryArchive reflectionHashWithFunctionId:binaryPos:](self, "reflectionHashWithFunctionId:binaryPos:", v10, objc_msgSend(a3, "binaryPosition"));
    v11 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_reflectionsIndex.__table_.__bucket_list_.__ptr_.__value_, v16);
    if (v11)
    {
      v14 = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v11[8], v11[9]);
      objc_msgSend(a3, "addReflectionWithData:flag:", v14, 4);

LABEL_14:
      LOBYTE(v11) = 1;
    }
  }
  return (char)v11;
}

- (_MTLBinaryArchive)initWithDevice:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  if (a4)
    return -[_MTLBinaryArchive initWithOptions:device:url:error:](self, "initWithOptions:device:url:error:", objc_msgSend(a4, "options"), a3, objc_msgSend(a4, "url"), a5);
  if (a5)
    *a5 = newErrorWithMessage(CFSTR("MTLBinaryArchive descriptor must not be nil."), MTLBinaryArchiveErrorUnexpectedElement);

  return 0;
}

- (void).cxx_destruct
{
  functionIdExtended *begin;
  MTLPipelineNTObject **v4;
  MTLAirNTObject **v5;
  MTLAirNTObject **v6;

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_variantMap);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_recompilationArchiveFileIndex, (_QWORD *)self->_recompilationArchiveFileIndex.__tree_.__pair1_.__value_.__left_);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacySpecializedFunctionArchiveFileIndex, (_QWORD *)self->_legacySpecializedFunctionArchiveFileIndex.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_legacySpecializedFunctions);
  std::shared_ptr<MultiLevelAirntBinaryCache>::~shared_ptr[abi:ne180100]((uint64_t)&self->_uniqueBitcodeList);
  std::unique_ptr<MTLMetalScriptBuilder>::reset[abi:ne180100](&self->_mtlScriptBuilder.__ptr_.__value_, 0);
  std::unique_ptr<MTLPipelineCollection>::reset[abi:ne180100](&self->_pipelineCollection.__ptr_.__value_, 0);
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::~__hash_table((uint64_t)&self->_gpuArchiverIDMap);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_stitchedFunctionByHash);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_specializedFunctionByHash);
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&self->_extLibCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_stitchedLibraryCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_specializedLibraryCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_libCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_airntOffsetToIndexMap);
  begin = self->_airntExtraBinaryEntries.__begin_;
  if (begin)
  {
    self->_airntExtraBinaryEntries.__end_ = begin;
    operator delete(begin);
  }
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacyPipelineFileIndex, (_QWORD *)self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_);
  v4 = self->_airntPipelineList.__begin_;
  if (v4)
  {
    self->_airntPipelineList.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_airntFromDescriptorFunctionList.__begin_;
  if (v5)
  {
    self->_airntFromDescriptorFunctionList.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_airntObjectList.__begin_;
  if (v6)
  {
    self->_airntObjectList.__end_ = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<MTLHashKey>>>>::~__hash_table((uint64_t)&self->_airntBinaryList);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&self->_reflectionsIndex);
  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::~__hash_table((uint64_t)&self->_executableFileIndex);
}

- (_MTLBinaryArchive)initWithOptions:(unint64_t)a3 device:(id)a4 url:(id)a5 error:(id *)a6
{
  _MTLBinaryArchive *v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t options;
  MTLPipelineCollection *v17;
  MTLMetalScriptBuilder *v18;
  BOOL v19;
  id v20;
  __int128 v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_MTLBinaryArchive;
  v10 = -[_MTLObjectWithLabel init](&v23, sel_init);
  if (v10)
  {
    if (a6)
    {
      *a6 = 0;
      if (!a3)
      {
        *a6 = newErrorWithMessage(CFSTR("At least one option must be set."), MTLBinaryArchiveErrorUnexpectedElement);
LABEL_29:

        return 0;
      }
    }
    else if (!a3)
    {
      goto LABEL_29;
    }
    v10->_device = (MTLDevice *)a4;
    v10->_options = a3;
    v10->_internalArchiverId = 0;
    v10->_newBinary = 0;
    atomic_store(0, (unsigned __int8 *)&v10->_serializing);
    v10->_archiveIDInt = 0;
    v10->_absoluteOpenPath = 0;
    v10->_metalScript = 0;
    v10->_alwaysReturnDriverReflection = objc_msgSend((id)objc_msgSend(a4, "targetDeviceArchitecture"), "cpuType") == 16777235;
    v10->_hasBuiltins = 0;
    v11 = (char *)operator new(0x40uLL);
    *((_QWORD *)v11 + 1) = 0;
    *((_QWORD *)v11 + 2) = 0;
    *(_QWORD *)v11 = &off_1E0FDF428;
    *(_OWORD *)(v11 + 40) = 0u;
    *((_DWORD *)v11 + 14) = 1065353216;
    *((_QWORD *)&v22 + 1) = v11;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_QWORD *)&v22 = v11 + 24;
    std::shared_ptr<std::unordered_map<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,NSObject  {objcproto16OS_dispatch_data}*>>>>::operator=[abi:ne180100]((uint64_t)&v10->_uniqueBitcodeList, &v22);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v22 + 1);
    if (*((_QWORD *)&v22 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v22 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = _MTLUseAIRNTBinaryArchive(a4);
    options = v10->_options;
    if (v15)
    {
      options |= 8uLL;
      v10->_options = options;
    }
    v10->_isLegacy = (options & 8) == 0;
    if ((options & 1) != 0)
    {
      v17 = (MTLPipelineCollection *)operator new();
      MTLPipelineCollection::MTLPipelineCollection(v17, 2uLL);
      std::unique_ptr<MTLPipelineCollection>::reset[abi:ne180100](&v10->_pipelineCollection.__ptr_.__value_, v17);
      options = v10->_options;
    }
    if ((options & 2) != 0)
    {
      v10->_entries = (NSMutableDictionary *)objc_opt_new();
      v10->_asynEntries = (NSMutableDictionary *)objc_opt_new();
    }
    if ((a3 & 6) != 0)
    {
      v10->_queue = (OS_dispatch_queue *)dispatch_queue_create("MTLBinaryArchive", 0);
      v10->_serializeQueue = (OS_dispatch_queue *)dispatch_queue_create("MTLBinaryArchive_Serialize", 0);
      if (!v10->_queue)
        goto LABEL_29;
    }
    if (!v10->_isLegacy)
    {
      v18 = (MTLMetalScriptBuilder *)operator new();
      MTLMetalScriptBuilder::MTLMetalScriptBuilder(v18);
      std::unique_ptr<MTLMetalScriptBuilder>::reset[abi:ne180100](&v10->_mtlScriptBuilder.__ptr_.__value_, v18);
    }
    if (a5)
    {
      -[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL = _os_feature_enabled_impl();
      if (-[_MTLBinaryArchive initWithOptions:device:url:error:]::onceToken != -1)
        dispatch_once(&-[_MTLBinaryArchive initWithOptions:device:url:error:]::onceToken, &__block_literal_global_3);
      v10->_absoluteOpenPath = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", objc_msgSend(a5, "absoluteString"));
      v19 = -[_MTLBinaryArchive loadFromURL:error:](v10, "loadFromURL:error:", a5, a6);
      if (-[_MTLBinaryArchive initWithOptions:device:url:error:]::shouldPrintBinaryArchiveLoadFromURL
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[_MTLBinaryArchive initWithOptions:device:url:error:].cold.1(a5);
        if (!a6)
        {
LABEL_28:
          if (!v19)
            goto LABEL_29;
          return v10;
        }
      }
      else if (!a6)
      {
        goto LABEL_28;
      }
      v20 = *a6;
      goto LABEL_28;
    }
  }
  return v10;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  char v11;
  id v12;
  id v13;
  MTLLoadedFile *v14;
  MTLLoadedFileContentsWrapper *v15;
  _BOOL4 v16;
  int v17;
  _BOOL8 v18;
  int v19;
  unint64_t options;
  unint64_t v21;
  BOOL v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t *v26;
  _MTLBinaryArchive *v27;
  _BOOL8 v28;
  int v29;
  int v30;
  unint64_t v31;
  id v32;
  id v33;
  __int128 v35;
  int v36;
  _QWORD v37[6];
  __int128 v38;
  int v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v7 = (void *)MEMORY[0x186DAC640](self, a2);
  if (a3
    && objc_msgSend(a3, "isFileURL")
    && (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4) & 1) != 0)
  {
    if (-[_MTLBinaryArchive archiveSkipsAIRValidation](self, "archiveSkipsAIRValidation")
      || (v8 = -[MTLDevice lookupRecompiledBinaryArchive:](self->_device, "lookupRecompiledBinaryArchive:", a3)) == 0)
    {
      v10 = 0;
    }
    else
    {
      v9 = (void *)v8;
      -[MTLDevice recordBinaryArchiveUsage:](self->_device, "recordBinaryArchiveUsage:", a3);
      a3 = v9;
      v10 = 1;
    }
    v14 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:](*((_QWORD *)self->_device + 59), (NSURL *)a3, (NSError **)a4, CFSTR("MTLBinaryArchiveDomain"), 1);
    self->_fileMapping = v14;
    if (v14)
    {
      v15 = -[MTLLoadedFileContentsWrapper initWithData:]([MTLLoadedFileContentsWrapper alloc], "initWithData:", -[MTLLoadedFile contents](self->_fileMapping, "contents"));
      self->_fileData = v15;
      self->_internalArchiverId = 0;
      if (v15)
      {
        v49 = 0;
        v48 = 0;
        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v16 = +[_MTLBinaryArchive deserializeBinaryArchiveHeader:fileData:device:](_MTLBinaryArchive, "deserializeBinaryArchiveHeader:fileData:device:", &v41, self->_fileData, self->_device);
        v40 = 0;
        v40 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, self->_device, &v49, &v48);
        v17 = BYTE8(v46);
        self->_isLegacy = BYTE8(v46) ^ 1;
        if (!v17)
        {
          options = self->_options;
          LODWORD(v21) = options & 0xCF;
          self->_options = options & 0xFFFFFFFFFFFFFFCFLL;
          if (!(BYTE1(v41) | BYTE8(v42) | v45))
            v16 = 0;
          if ((options & 2) != 0 && (_BYTE)v41)
          {
            if (v16)
            {
              v16 = -[_MTLBinaryArchive loadFileIndex:expectedSliceId:expectedVersion:sliceOffset:](self, "loadFileIndex:expectedSliceId:expectedVersion:sliceOffset:", &self->_legacyPipelineFileIndex, &v40, v49, *((_QWORD *)&v41 + 1));
              v21 = self->_options;
            }
            LOBYTE(v41) = v16;
          }
          if ((v21 & 1) != 0)
          {
            if (BYTE8(v42))
            {
              v22 = v16
                 && +[_MTLBinaryArchive deserializeBinaryArchiveDescriptorMachO:fileData:](_MTLBinaryArchive, "deserializeBinaryArchiveDescriptorMachO:fileData:", &v41, self->_fileData);
              BYTE8(v42) = v22;
            }
            if ((_QWORD)v44)
              -[MTLLoadedFileContentsWrapper bytes](self->_fileData, "bytes");
          }
          if ((self->_options & 4) != 0)
          {
            if ((_BYTE)v45)
            {
              v31 = v46;
              self->_specializedFunctionArchiveOffset = *((_QWORD *)&v45 + 1);
              self->_specializedFunctionArchiveBytes = v31;
              if (v16)
              {
                *(_QWORD *)&v38 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:](_MTLBinaryArchive, "sliceIDForSpecializedFunctionsForLLVMVersion:", _MTLGetMTLCompilerLLVMVersionForDevice(self->_device));
                v16 = -[_MTLBinaryArchive loadFileIndex:expectedSliceId:expectedVersion:sliceOffset:](self, "loadFileIndex:expectedSliceId:expectedVersion:sliceOffset:", &self->_legacySpecializedFunctionArchiveFileIndex, &v38, 1, self->_specializedFunctionArchiveOffset);
              }
            }
          }
LABEL_59:
          if (v16)
          {
LABEL_60:
            LOBYTE(a4) = 1;
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        v18 = -[_MTLBinaryArchive archiveSkipsAIRValidation](self, "archiveSkipsAIRValidation");
        if (!(_BYTE)v41 && !HIDWORD(v46))
        {
          v19 = 1;
          v16 = 1;
          goto LABEL_47;
        }
        v38 = 0uLL;
        v39 = 0;
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __39___MTLBinaryArchive_loadFromURL_error___block_invoke;
        v37[3] = &unk_1E0FE2958;
        v37[4] = self;
        v37[5] = *((_QWORD *)&v41 + 1);
        v23 = +[MTLLoader deserializeAIRNTToolsVersionForSlice:sliceOffset:version:reader:]((uint64_t)MTLLoader, (uint64_t)&v40, *((uint64_t *)&v41 + 1), (uint64_t)&v38, (uint64_t)v37);

        v24 = 0;
        if (v23
          && (v35 = v38,
              v36 = v39,
              v24 = +[_MTLBinaryArchive archiveVersionCompatible:isMatchingSlice:device:](_MTLBinaryArchive, "archiveVersionCompatible:isMatchingSlice:device:", &v35, v41, self->_device), v24 == 2))
        {
          v25 = *((_QWORD *)&v41 + 1);
          v26 = &v40;
          v27 = self;
          v28 = v18;
        }
        else
        {
          v29 = (HIDWORD(v46) != 0) & (LOBYTE(self->_options) >> 4);
          if (!v24)
            v29 = 0;
          if ((v29 & v23) != 1)
          {
            v19 = v29 ^ 1;
            v30 = v29 ^ 1;
            goto LABEL_37;
          }
          v26 = (unint64_t *)((char *)&v46 + 12);
          v25 = *((_QWORD *)&v41 + 1);
          v27 = self;
          v28 = 0;
        }
        v30 = -[_MTLBinaryArchive loadAirntBlocksForSlice:sliceOffset:skipAIRValidation:](v27, "loadAirntBlocksForSlice:sliceOffset:skipAIRValidation:", v26, v25, v28);
        v19 = 0;
LABEL_37:
        if ((_BYTE)v45)
          v16 = 0;
        else
          v16 = v30;
        if ((_BYTE)v45 && v30)
          v16 = -[_MTLBinaryArchive loadAirSliceAtOffset:sliceLength:](self, "loadAirSliceAtOffset:sliceLength:", *((_QWORD *)&v45 + 1), (_QWORD)v46);
        if (!(v10 | v18) && !self->_hasBuiltins && v16)
          -[MTLDevice recordBinaryArchiveUsage:](self->_device, "recordBinaryArchiveUsage:", a3);
LABEL_47:
        if (v19 && v16)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[_MTLBinaryArchive loadFromURL:error:].cold.1(a3);
          goto LABEL_60;
        }
        goto LABEL_59;
      }
    }
    else
    {
      self->_fileData = 0;
      self->_internalArchiverId = 0;
    }
LABEL_62:
    if (a4)
    {
      v32 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The file %@ has an invalid format."), a3), MTLBinaryArchiveErrorInvalidFile);
      *a4 = v32;
      v33 = v32;
      LOBYTE(a4) = 0;
    }
    v11 = 0;
    goto LABEL_65;
  }
  if (!a4)
  {
LABEL_61:
    v11 = 1;
    goto LABEL_65;
  }
  v11 = 1;
  v12 = newErrorWithMessage(CFSTR("Invalid URL"), MTLBinaryArchiveErrorInvalidFile);
  *a4 = v12;
  v13 = v12;
  LOBYTE(a4) = 0;
LABEL_65:
  objc_autoreleasePoolPop(v7);
  return a4 & v11;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *serializeQueue;
  NSObject *metalScript;
  _QWORD *i;
  MTLProgramObject *v7;
  objc_super v8;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  serializeQueue = self->_serializeQueue;
  if (serializeQueue)
    dispatch_release(serializeQueue);
  -[_MTLBinaryArchive deallocContainers](self, "deallocContainers");
  metalScript = self->_metalScript;
  if (metalScript)
    dispatch_release(metalScript);
  self->_metalScript = 0;
  for (i = self->_variantMap.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v7 = (MTLProgramObject *)i[6];
    if (v7)
    {
      MTLProgramObject::~MTLProgramObject(v7);
      MEMORY[0x186DABFBC]();
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_variantMap.__table_.__bucket_list_.__ptr_.__value_);

  v8.receiver = self;
  v8.super_class = (Class)_MTLBinaryArchive;
  -[_MTLObjectWithLabel dealloc](&v8, sel_dealloc);
}

- (void)deallocContainers
{
  _QWORD *i;
  NSObject *v4;
  MTLLoadedFile *fileMapping;
  NSMutableDictionary *entries;
  NSMutableDictionary *asynEntries;
  MTLAirNTObject **end;
  MTLAirNTObject **begin;
  unint64_t v10;
  MTLAirNTObject *v11;
  functionIdExtended *v12;
  functionIdExtended *v13;
  uint64_t v14;
  unint64_t v15;
  MTLHashKey *v16;
  id *j;
  MTLPipelineNTObject **v18;
  MTLPipelineNTObject **v19;
  unint64_t v20;
  MTLPipelineNTObject *v21;
  char *archiveIDInt;
  _QWORD *ptr;
  uint64_t **v24;

  std::__hash_table<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,std::__unordered_map_hasher<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::__unordered_map_equal<MTLHashKey,std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>,CompareFunctionIdHash,CompareFunctionIdHash,true>,std::allocator<std::__hash_value_type<MTLHashKey,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>>::clear((uint64_t)&self->_executableFileIndex);
  for (i = self->_legacySpecializedFunctions.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v4 = i[6];
    if (v4)
      dispatch_release(v4);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_legacySpecializedFunctions.__table_.__bucket_list_.__ptr_.__value_);
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)&self->_legacyPipelineFileIndex, (_QWORD *)self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_);
  self->_legacyPipelineFileIndex.__tree_.__begin_node_ = &self->_legacyPipelineFileIndex.__tree_.__pair1_;
  self->_legacyPipelineFileIndex.__tree_.__pair3_.__value_ = 0;
  self->_legacyPipelineFileIndex.__tree_.__pair1_.__value_.__left_ = 0;
  fileMapping = self->_fileMapping;
  if (fileMapping)
    -[MTLLoader releaseLoadedFile:](*((_QWORD *)self->_device + 59), fileMapping);
  self->_fileMapping = 0;

  self->_fileData = 0;
  entries = self->_entries;
  if (entries)

  asynEntries = self->_asynEntries;
  if (asynEntries)

  self->_entries = 0;
  self->_asynEntries = 0;
  begin = self->_airntObjectList.__begin_;
  end = self->_airntObjectList.__end_;
  if (end != begin)
  {
    v10 = 0;
    do
    {
      v11 = begin[v10];
      if (v11)
      {
        MTLAirNTObject::~MTLAirNTObject(v11);
        MEMORY[0x186DABFBC]();
        begin = self->_airntObjectList.__begin_;
        end = self->_airntObjectList.__end_;
      }
      ++v10;
    }
    while (v10 < end - begin);
  }
  v13 = self->_airntExtraBinaryEntries.__begin_;
  v12 = self->_airntExtraBinaryEntries.__end_;
  if (v12 != v13)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = *(MTLHashKey **)((char *)v13 + v14);
      if (v16)
      {
        MTLHashKey::~MTLHashKey(v16);
        MEMORY[0x186DABFBC]();
        v13 = self->_airntExtraBinaryEntries.__begin_;
        v12 = self->_airntExtraBinaryEntries.__end_;
      }
      ++v15;
      v14 += 16;
    }
    while (v15 < (v12 - v13) >> 4);
  }
  for (j = (id *)self->_stitchedFunctionByHash.__table_.__p1_.__value_.__next_; j; j = (id *)*j)

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  self->_airntExtraBinaryEntries.__end_ = self->_airntExtraBinaryEntries.__begin_;
  self->_airntObjectList.__end_ = self->_airntObjectList.__begin_;
  self->_airntFromDescriptorFunctionList.__end_ = self->_airntFromDescriptorFunctionList.__begin_;
  v19 = self->_airntPipelineList.__begin_;
  v18 = self->_airntPipelineList.__end_;
  if (v18 == v19)
  {
    v19 = self->_airntPipelineList.__end_;
  }
  else
  {
    v20 = 0;
    do
    {
      v21 = v19[v20];
      if (v21)
      {
        MEMORY[0x186DABFBC](v21, 0x1022C405FDF33A9);
        v19 = self->_airntPipelineList.__begin_;
        v18 = self->_airntPipelineList.__end_;
      }
      ++v20;
    }
    while (v20 < v18 - v19);
  }
  self->_airntPipelineList.__end_ = v19;
  archiveIDInt = self->_archiveIDInt;
  if (archiveIDInt)
    free(archiveIDInt);
  ptr = self->_uniqueBitcodeList.__ptr_;
  if (ptr)
  {
    v24 = (uint64_t **)ptr[2];
    if (v24)
    {
      do
      {

        v24 = (uint64_t **)*v24;
      }
      while (v24);
      ptr = self->_uniqueBitcodeList.__ptr_;
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(ptr);
  }
  -[_MTLBinaryArchive clearLibCache](self, "clearLibCache");
}

- (void)clearLibCache
{
  unordered_map<unsigned long long, id<MTLLibrarySPI>, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, id<MTLLibrarySPI>>>> *p_libCache;
  id *i;
  const std::string::value_type *j;
  std::string __p;
  id v7;

  p_libCache = &self->_libCache;
  for (i = (id *)self->_libCache.__table_.__p1_.__value_.__next_; i; i = (id *)*i)

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(p_libCache);
  for (j = (const std::string::value_type *)self->_extLibCache.__table_.__p1_.__value_.__next_;
        j;
        j = *(const std::string::value_type **)j)
  {
    if (j[39] < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)j + 2), *((_QWORD *)j + 3));
    else
      __p = *(std::string *)(j + 16);
    v7 = (id)*((_QWORD *)j + 5);

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__hash_table<std::__hash_value_type<std::string,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::clear((uint64_t)&self->_extLibCache);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_specializedLibraryCache.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&self->_stitchedLibraryCache.__table_.__bucket_list_.__ptr_.__value_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 37) = 0;
  *((_QWORD *)self + 36) = (char *)self + 296;
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_DWORD *)self + 92) = 1065353216;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_DWORD *)self + 108) = 1065353216;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *((_DWORD *)self + 118) = 1065353216;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_DWORD *)self + 128) = 1065353216;
  *(_OWORD *)((char *)self + 520) = 0u;
  *(_OWORD *)((char *)self + 536) = 0u;
  *((_DWORD *)self + 138) = 1065353216;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 1065353216;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 616) = 0u;
  *((_DWORD *)self + 158) = 1065353216;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 664) = 0u;
  *((_DWORD *)self + 170) = 1065353216;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 87) = 0;
  *((_QWORD *)self + 88) = 0;
  *((_QWORD *)self + 89) = 0;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((_DWORD *)self + 190) = 1065353216;
  *((_QWORD *)self + 98) = 0;
  *((_QWORD *)self + 97) = 0;
  *((_QWORD *)self + 96) = (char *)self + 776;
  *((_QWORD *)self + 103) = 0;
  *((_QWORD *)self + 102) = 0;
  *((_QWORD *)self + 101) = (char *)self + 816;
  *((_OWORD *)self + 53) = 0u;
  *((_OWORD *)self + 54) = 0u;
  *((_DWORD *)self + 220) = 1065353216;
  return self;
}

+ (unsigned)archiveVersionCompatible:(MachOToolsVersion *)a3 isMatchingSlice:(BOOL)a4 device:(id)a5
{
  _BOOL4 v6;
  int active_platform;
  void *v9;

  v6 = a4;
  active_platform = dyld_get_active_platform();
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  if (v9)
    objc_msgSend(v9, "operatingSystemVersion");
  if (active_platform != a3->var1)
    return 5;
  if (a3->var0)
    return 6;
  if ((objc_msgSend(a5, "isVendorSliceCompatibleWithDeploymentTarget:platform:sdkVersion:compilerPluginVersion:") & v6) != 0)return 2;
  return 3;
}

+ (unsigned)archiveTypeAtURL:(id)a3 device:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  MTLLoadedFile *v10;
  BOOL v11;
  unsigned int v12;
  MTLLoadedFile *v13;
  MTLLoadedFileContentsWrapper *v14;
  unsigned __int8 v15;
  id v16;
  __int128 v18;
  int v19;
  _QWORD v20[6];
  __int128 v21;
  int v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  _OWORD v26[5];
  __int128 v27;
  uint64_t v28;

  if (a5)
    *a5 = 0;
  v8 = (void *)MEMORY[0x186DAC640](a1, a2);
  v9 = (void *)objc_opt_new();
  v10 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v9, (NSURL *)a3, (NSError **)a5, CFSTR("MTLBinaryArchiveDomain"), 1);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v13 = v10;
    v14 = -[MTLLoadedFileContentsWrapper initWithData:]([MTLLoadedFileContentsWrapper alloc], "initWithData:", -[MTLLoadedFile contents](v10, "contents"));
    v28 = 0;
    v27 = 0u;
    memset(v26, 0, sizeof(v26));
    if (+[_MTLBinaryArchive deserializeBinaryArchiveHeader:fileData:device:](_MTLBinaryArchive, "deserializeBinaryArchiveHeader:fileData:device:", v26, v14, a4))
    {
      v25 = 0;
      v24 = 0;
      v23 = +[MTLLoader sliceIDForDevice:legacyDriverVersion:airntDriverVersion:]((uint64_t)MTLLoader, a4, &v25, &v24);
      if (!BYTE8(v27))
      {
        v12 = 1;
        goto LABEL_20;
      }
      if (!LOBYTE(v26[0]) && !HIDWORD(v27))
      {
        v12 = 4;
LABEL_20:

        -[MTLLoader releaseLoadedFile:]((uint64_t)v9, v13);
        goto LABEL_21;
      }
      v21 = 0uLL;
      v22 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __51___MTLBinaryArchive_archiveTypeAtURL_device_error___block_invoke;
      v20[3] = &unk_1E0FE2958;
      v20[4] = v14;
      v20[5] = *((_QWORD *)&v26[0] + 1);
      v15 = +[MTLLoader deserializeAIRNTToolsVersionForSlice:sliceOffset:version:reader:]((uint64_t)MTLLoader, (uint64_t)&v23, *((uint64_t *)&v26[0] + 1), (uint64_t)&v21, (uint64_t)v20);

      if ((v15 & 1) != 0)
      {
        v18 = v21;
        v19 = v22;
        v12 = +[_MTLBinaryArchive archiveVersionCompatible:isMatchingSlice:device:](_MTLBinaryArchive, "archiveVersionCompatible:isMatchingSlice:device:", &v18, LOBYTE(v26[0]), a4);
        goto LABEL_20;
      }
      if (a5)
      {
        v12 = 0;
        *a5 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The file %@ has an invalid format."), a3), MTLBinaryArchiveErrorInvalidFile);
        goto LABEL_20;
      }
    }
    v12 = 0;
    goto LABEL_20;
  }
  v12 = 0;
LABEL_21:

  if (a5 && *a5)
    v16 = *a5;
  objc_autoreleasePoolPop(v8);
  return v12;
}

- (BOOL)loadAirSliceAtOffset:(unint64_t)a3 sliceLength:(unint64_t)a4
{
  NSObject *subrange;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _MTLLibrary *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  unordered_map<MTLUINT256_t, id<MTLLibrarySPI>, UnorderedContainerHash, UnorderedContainerHash, std::allocator<std::pair<const MTLUINT256_t, id<MTLLibrarySPI>>>> *p_stitchedLibraryCache;
  uint64_t v20;
  uint64_t j;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t *v28;
  unint64_t v29[4];
  _QWORD *v30[18];

  v30[16] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v23 = a3;
  subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), a3, a4);
  v10 = MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, subrange, 0, v6, v7, v8, v9);
  if (v10)
  {
    v30[0] = &v23;
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_libCache, &v23, (uint64_t)&std::piecewise_construct, v30)[3] = v10;
    v11 = -[_MTLLibrary specializedFunctionHashes](v10, "specializedFunctionHashes");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "getValue:", v29);
          v28 = v29;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_specializedLibraryCache, v29, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v10;
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v13);
    }
    v16 = -[_MTLLibrary stitchingFunctionHashes](v10, "stitchingFunctionHashes");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v17)
    {
      v18 = v17;
      p_stitchedLibraryCache = &self->_stitchedLibraryCache;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "getValue:", v29);
          v28 = v29;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)p_stitchedLibraryCache, v29, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v10;
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v18);
    }
  }
  dispatch_release(subrange);
  return v10 != 0;
}

- (BOOL)archiveSkipsAIRValidation
{
  __CFBundle *MainBundle;

  if ((self->_options & 0x20) != 0)
  {
    LOBYTE(MainBundle) = 1;
  }
  else
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      MainBundle = (__CFBundle *)CFBundleGetIdentifier(MainBundle);
      if (MainBundle)
        LOBYTE(MainBundle) = CFStringHasPrefix((CFStringRef)MainBundle, CFSTR("com.apple.")) == 1;
    }
  }
  return (char)MainBundle;
}

- (id)materializeFromFileOffset:(unint64_t)a3 hash:(id *)a4
{
  size_t v5;
  dispatch_data_t subrange;
  NSObject *v7;
  MTLBinaryEntry *v8;
  MTLBinaryEntry *v9;
  _QWORD v11[6];
  _QWORD v12[10];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke;
  v12[3] = &unk_1E0FE2980;
  v12[4] = &v29;
  v12[5] = &v25;
  v12[8] = a3;
  v12[9] = a4;
  v12[6] = &v19;
  v12[7] = &v13;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52___MTLBinaryArchive_materializeFromFileOffset_hash___block_invoke_2;
  v11[3] = &unk_1E0FE2958;
  v11[4] = self;
  v11[5] = a3;
  if (+[MTLLoader deserializeMachOWrapperWithType:payloadHandler:reader:]((uint64_t)MTLLoader, 0, (uint64_t)v12, (uint64_t)v11)&& (v5 = v26[3]) != 0&& (subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v30[3], v5)) != 0)
  {
    v7 = subrange;
    v8 = [MTLBinaryEntry alloc];
    v9 = -[MTLBinaryEntry initWithData:importedSymbols:importedLibraries:](v8, "initWithData:importedSymbols:importedLibraries:", v7, v14[5], v20[5]);
    dispatch_release(v7);
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v9;
}

- (void)materializeAllAIRNTLegacy
{
  char *i;
  __int128 v4;
  MTLBinaryKey *v5;
  MTLHashKey v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  for (i = (char *)self->_executableFileIndex.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    MTLHashKey::MTLHashKey(&v6, (const MTLHashKey *)(i + 16));
    v4 = *((_OWORD *)i + 7);
    v7 = *((_OWORD *)i + 6);
    v8 = v4;
    v5 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &v6);
    if (!-[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v5))
      -[_MTLBinaryArchive materializeAIRNTBlockForKey:reflectionType:](self, "materializeAIRNTBlockForKey:reflectionType:", v5, 0);

    MTLHashKey::~MTLHashKey(&v6);
  }
}

- (void)materializeAll
{
  map<MTLUINT256_t, std::pair<unsigned int, unsigned long long>, CompareHash, std::allocator<std::pair<const MTLUINT256_t, std::pair<unsigned int, unsigned long long>>>> *p_legacyPipelineFileIndex;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *begin_node;
  id v6;
  MTLBinaryKey *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *v9;
  BOOL v10;
  MTLHashKey v11;
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_legacyPipelineFileIndex = &self->_legacyPipelineFileIndex;
  p_pair1 = &self->_legacyPipelineFileIndex.__tree_.__pair1_;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)self->_legacyPipelineFileIndex.__tree_.__begin_node_;
  if (begin_node != &self->_legacyPipelineFileIndex.__tree_.__pair1_)
  {
    do
    {
      v6 = -[_MTLBinaryArchive materializeFromFileOffset:hash:](self, "materializeFromFileOffset:hash:", begin_node[9].__value_.__left_, v12);
      if (v6)
      {
        MTLHashKey::MTLHashKey((uint64_t)&v11, (uint64_t)v12);
        v7 = -[MTLBinaryKey initWithHash:]([MTLBinaryKey alloc], "initWithHash:", &v11);
        if (!-[NSMutableDictionary objectForKey:](self->_entries, "objectForKey:", v7))
          -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", v6, v7);

        MTLHashKey::~MTLHashKey(&v11);
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v9 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<MTLUINT256_t, std::pair<unsigned int, unsigned long long>>, void *>>> *)begin_node[2].__value_.__left_;
          v10 = v9->__value_.__left_ == begin_node;
          begin_node = v9;
        }
        while (!v10);
      }
      begin_node = v9;
    }
    while (v9 != p_pair1);
  }
  std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)p_legacyPipelineFileIndex, (_QWORD *)p_legacyPipelineFileIndex->__tree_.__pair1_.__value_.__left_);
  p_legacyPipelineFileIndex->__tree_.__pair1_.__value_.__left_ = 0;
  p_legacyPipelineFileIndex->__tree_.__pair3_.__value_ = 0;
  p_legacyPipelineFileIndex->__tree_.__begin_node_ = p_pair1;
}

- (id)materializeFromHash:(id *)a3 fileIndex:(void *)a4
{
  unsigned int *v7;
  uint64_t *v8;
  id v10;

  v7 = (unsigned int *)std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::lower_bound[abi:ne180100]<MTLUINT256_t>((uint64_t)a4, (unint64_t *)a3->var0);
  if ((char *)a4 + 8 == (char *)v7)
    return 0;
  v8 = (uint64_t *)v7;
  if (memcmp(v7 + 8, a3, v7[16]))
    return 0;
  v10 = -[_MTLBinaryArchive materializeFromFileOffset:hash:](self, "materializeFromFileOffset:hash:", v8[9], a3);
  std::__tree<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,std::__map_value_compare<MTLUINT256_t,std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>,CompareHash,true>,std::allocator<std::__value_type<MTLUINT256_t,std::pair<unsigned int,unsigned long long>>>>::__remove_node_pointer((uint64_t **)a4, v8);
  operator delete(v8);
  return v10;
}

- (id)formattedDescription:(unint64_t)a3
{
  NSObject *queue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___MTLBinaryArchive_formattedDescription___block_invoke;
  block[3] = &unk_1E0FE29A8;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  queue = self->_queue;
  if (queue)
    dispatch_sync(queue, block);
  else
    __42___MTLBinaryArchive_formattedDescription___block_invoke((uint64_t)block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[_MTLBinaryArchive formattedDescription:](self, "formattedDescription:", 0);
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MTLLibraryData *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addComputePipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLComputePipelineDescriptor *)a3), self->_isLegacy))
  {
    if ((self->_options & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = (void *)objc_msgSend(a3, "preloadedLibraries", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      v10 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "computeFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v10);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "computeFunction"), (uint64_t)v10, 0);
      MTLPipelineCollection::addComputePipeline(self->_pipelineCollection.__ptr_.__value_, (MTLComputePipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MTLLibraryData *v25;
  MTLLibraryData *v26;
  MTLLibraryData *v27;
  MTLLibraryData *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addRenderPipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLRenderPipelineDescriptor *)a3), self->_isLegacy))
  {
    if ((self->_options & 1) != 0)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v5 = (void *)objc_msgSend(a3, "vertexPreloadedLibraries");
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v43;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v43 != v8)
              objc_enumerationMutation(v5);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v7);
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v10 = (void *)objc_msgSend(a3, "fragmentPreloadedLibraries");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v39;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v39 != v13)
              objc_enumerationMutation(v10);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        }
        while (v12);
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v15 = (void *)objc_msgSend(a3, "objectPreloadedLibraries");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        }
        while (v17);
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = (void *)objc_msgSend(a3, "meshPreloadedLibraries", 0);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v20);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        }
        while (v22);
      }
      v25 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "vertexFunction"), "libraryData");
      v26 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v25);
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v26);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "vertexFunction"), (uint64_t)v25, 0);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "fragmentFunction"), (uint64_t)v26, 0);
      v27 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "libraryData");
      v28 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v27);
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v28);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "objectFunction"), (uint64_t)v27, 0);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "meshFunction"), (uint64_t)v28, 0);
      MTLPipelineCollection::addRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLRenderPipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  MTLLibraryData *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isLegacy
    || a3
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addTileRenderPipelineWithDescriptor(self->_mtlScriptBuilder.__ptr_.__value_, (MTLTileRenderPipelineDescriptor *)a3), self->_isLegacy))
  {
    if ((self->_options & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = (void *)objc_msgSend(a3, "preloadedLibraries", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v5);
            MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      v10 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "libraryData");
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v10);
      MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "tileFunction"), (uint64_t)v10, 0);
      MTLPipelineCollection::addTileRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLTileRenderPipelineDescriptor *)a3);
    }
  }
  return 1;
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  MTLLibraryData *v20;
  MTLLibraryData *v21;
  MTLLibraryData *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((self->_options & 1) != 0)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = (void *)objc_msgSend(a3, "objectPreloadedLibraries");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v5);
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v7);
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (void *)objc_msgSend(a3, "meshPreloadedLibraries");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v12);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = (void *)objc_msgSend(a3, "fragmentPreloadedLibraries", 0);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          MTLPipelineCollection::addDynamicLibraryData((uint64_t)self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v17);
    }
    v20 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "libraryData");
    v21 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "libraryData");
    v22 = (MTLLibraryData *)objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "libraryData");
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v20);
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v21);
    MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, v22);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "objectFunction"), (uint64_t)v20, 0);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "meshFunction"), (uint64_t)v21, 0);
    MTLPipelineCollection::addFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, objc_msgSend(a3, "fragmentFunction"), (uint64_t)v22, 0);
    MTLPipelineCollection::addMeshRenderPipeline(self->_pipelineCollection.__ptr_.__value_, (MTLMeshRenderPipelineDescriptor *)a3);
  }
  return 1;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
    return -[_MTLBinaryArchive addComputePipelineFunctionsWithDescriptor:options:error:](self, "addComputePipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
  if (a4)
    *a4 = newErrorWithMessage(CFSTR("compute pipeline descriptor must not be nil."), MTLBinaryArchiveErrorUnexpectedElement);
  return 0;
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeComputePipelineDescriptor:](self, "storeComputePipelineDescriptor:");
  if ((self->_options & 2) != 0)
    return objc_msgSend((id)-[MTLDevice compiler](self->_device, "compiler"), "addComputePipelineStateWithDescriptor:destinationBinaryArchive:options:error:", a3, self, a4, a5);
  else
    return 1;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
    return -[_MTLBinaryArchive addRenderPipelineFunctionsWithDescriptor:options:error:](self, "addRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
  if (a4)
    *a4 = newErrorWithMessage(CFSTR("render pipeline descriptor must not be nil."), MTLBinaryArchiveErrorUnexpectedElement);
  return 0;
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeRenderPipelineDescriptor:](self, "storeRenderPipelineDescriptor:");
  if ((self->_options & 2) != 0)
    return objc_msgSend((id)-[MTLDevice compiler](self->_device, "compiler"), "addRenderPipelineStateWithDescriptor:destinationBinaryArchive:options:error:", a3, self, a4, a5);
  else
    return 1;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
    return -[_MTLBinaryArchive addTileRenderPipelineFunctionsWithDescriptor:options:error:](self, "addTileRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
  if (a4)
    *a4 = newErrorWithMessage(CFSTR("tile pipeline descriptor must not be nil."), MTLBinaryArchiveErrorUnexpectedElement);
  return 0;
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeTileRenderPipelineDescriptor:](self, "storeTileRenderPipelineDescriptor:");
  if ((self->_options & 2) != 0)
    return objc_msgSend((id)-[MTLDevice compiler](self->_device, "compiler"), "addTileRenderPipelineStateWithDescriptor:destinationBinaryArchive:options:error:", a3, self, a4, a5);
  else
    return 1;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  if (a3)
    return -[_MTLBinaryArchive addMeshRenderPipelineFunctionsWithDescriptor:options:error:](self, "addMeshRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
  if (a4)
    *a4 = newErrorWithMessage(CFSTR("mesh pipeline descriptor must not be nil."), MTLBinaryArchiveErrorUnexpectedElement);
  return 0;
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  -[_MTLBinaryArchive storeMeshRenderPipelineDescriptor:](self, "storeMeshRenderPipelineDescriptor:");
  if ((self->_options & 2) != 0)
    return objc_msgSend((id)-[MTLDevice compiler](self->_device, "compiler"), "addMeshRenderPipelineStateWithDescriptor:destinationBinaryArchive:options:error:", a3, self, a4, a5);
  else
    return 1;
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  unint64_t options;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  if (self->_isLegacy && (options = self->_options, (options & 6) == 0))
  {
    if ((options & 1) == 0)
      return 1;
    v10 = objc_msgSend(a4, "newFunctionWithDescriptor:error:", a3, a5);
  }
  else
  {
    v10 = objc_msgSend(a4, "newFunctionWithDescriptor:destinationArchive:error:", a3, self, a5);
  }
  v11 = (void *)v10;
  if (!v10)
    return 0;
  if (self->_isLegacy
    || (v14 = 1, a3)
    && (self->_options & 0x40) == 0
    && (MTLMetalScriptBuilder::addFunctionWithDescriptor((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v10, (uint64_t)a4, (uint64_t)a3), self->_isLegacy))
  {
    if ((self->_options & 1) != 0)
    {
      v12 = (void *)objc_msgSend(a4, "newFunctionWithName:", objc_msgSend(a3, "name"));
      if (!v12)
      {
        v14 = 0;
        if (a5)
          *a5 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("library does not contain base function '%@'"), objc_msgSend(a3, "name")), MTLBinaryArchiveErrorUnexpectedElement);
        goto LABEL_10;
      }
      v13 = v12;
      MTLPipelineCollection::addLibraryData(self->_pipelineCollection.__ptr_.__value_, self->_collectArchives, !self->_collectArchives, (MTLLibraryData *)objc_msgSend(v12, "libraryData"));
      MTLPipelineCollection::addSpecializedFunction((uint64_t)self->_pipelineCollection.__ptr_.__value_, (uint64_t)v13, (uint64_t)v11, (uint64_t)a4, (uint64_t)a3);

    }
    v14 = 1;
  }
LABEL_10:

  return v14;
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;

  if (!self->_isLegacy || (self->_options & 4) != 0)
  {
    v6 = -[MTLDevice newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:](self->_device, "newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:", a3, self, a4);
    if (v6)
    {
      v7 = (void *)v6;
      if (!self->_isLegacy && a3 && (self->_options & 0x40) == 0)
        MTLMetalScriptBuilder::addLibraryWithDescriptor((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v6, (uint64_t)a3);

      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)removeComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return -[_MTLBinaryArchive serializeToURL:options:error:](self, "serializeToURL:options:error:", a3, 87, a4);
}

- (BOOL)getSpecializedFunctionArchivesToSerialize:(void *)a3
{
  void *next;
  char v6;
  __int128 v7;
  char v8;
  char v9;
  _QWORD v11[5];
  _OWORD v12[2];
  dispatch_object_t object;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  next = self->_legacySpecializedFunctions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v6 = 1;
    do
    {
      v7 = *((_OWORD *)next + 2);
      v12[0] = *((_OWORD *)next + 1);
      v12[1] = v7;
      object = (dispatch_object_t)*((_QWORD *)next + 6);
      if (object)
      {
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::pair<MTLUINT256_t const,NSObject  {objcproto16OS_dispatch_data}*> const&>((uint64_t)a3, (unint64_t *)v12, (uint64_t)v12);
        v9 = v8;
        if ((v8 & 1) != 0)
          dispatch_retain(object);
        v6 &= v9;
      }
      next = *(void **)next;
    }
    while (next);
    if ((v6 & 1) == 0)
      return 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___MTLBinaryArchive_getSpecializedFunctionArchivesToSerialize___block_invoke;
  v11[3] = &__block_descriptor_40_e49_B24__0r_____32C__8__NSObject_OS_dispatch_data__16l;
  v11[4] = a3;
  return -[_MTLBinaryArchive enumerateSpecializedFunctionArchivesFromBackingFile:](self, "enumerateSpecializedFunctionArchivesFromBackingFile:", v11);
}

- (const)mapFileToMemoryWithPath:(const char *)a3 fileSize:(unint64_t *)a4
{
  int v5;
  int v6;
  const char *v7;
  off_t st_size;
  stat v10;

  *a4 = 0;
  v5 = open(a3, 0);
  v6 = v5;
  if (v5 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:].cold.1();
    goto LABEL_7;
  }
  if (fstat(v5, &v10))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:].cold.3();
LABEL_7:
    close(v6);
    return 0;
  }
  st_size = v10.st_size;
  *a4 = v10.st_size;
  v7 = (const char *)mmap(0, st_size, 1, 2, v6, 0);
  close(v6);
  if (v7 != (const char *)-1)
    return v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:].cold.2();
  return 0;
}

- (id)mapFileToMemoryWithPath:(const char *)a3
{
  const char *v4;
  size_t size;

  size = 0;
  v4 = -[_MTLBinaryArchive mapFileToMemoryWithPath:fileSize:](self, "mapFileToMemoryWithPath:fileSize:", a3, &size);
  return dispatch_data_create(v4, size, (dispatch_queue_t)self->_queue, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);
}

- (id)flatBufferFromJSON:(id)a3 schema:(const char *)a4 schemaSize:(unint64_t)a5
{
  NSObject *v6;
  const void *v7;
  size_t v8;
  dispatch_data_t v9;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  _BYTE v17[336];
  void *v18;
  char v19;
  __int128 v20;
  __int128 buffer;
  size_t size_ptr;
  void *buffer_ptr;

  size_ptr = 0;
  buffer_ptr = 0;
  v6 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (!size_ptr)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[_MTLBinaryArchive flatBufferFromJSON:schema:schemaSize:].cold.1();
      if (!v6)
        return 0;
    }
    else if (!v6)
    {
      return 0;
    }
    dispatch_release(v6);
    return 0;
  }
  flatbuffers::IDLOptions::IDLOptions((flatbuffers::IDLOptions *)&v11);
  flatbuffers::Parser::Parser((flatbuffers::Parser *)v17, (const flatbuffers::IDLOptions *)&v11);
  flatbuffers::IDLOptions::~IDLOptions(&v11);
  if ((flatbuffers::Parser::Deserialize((flatbuffers::Parser *)v17, (const unsigned __int8 *)a4) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_MTLBinaryArchive flatBufferFromJSON:schema:schemaSize:].cold.3();
    goto LABEL_14;
  }
  if ((flatbuffers::Parser::Parse((flatbuffers::Parser *)v17, (const char *)buffer_ptr, 0, 0) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_MTLBinaryArchive flatBufferFromJSON:schema:schemaSize:].cold.2();
LABEL_14:
    dispatch_release(v6);
    flatbuffers::Parser::~Parser((flatbuffers::Parser *)v17);
    return 0;
  }
  v7 = (const void *)buffer;
  v8 = (v20 + DWORD2(v20) - buffer);
  v11 = v18;
  v12 = v19;
  v13 = *((_QWORD *)&v20 + 1);
  v14 = v20;
  v15 = buffer;
  v16 = v8;
  if (v19)
  {
    v18 = 0;
    v19 = 0;
  }
  v20 = 0u;
  buffer = 0u;
  v9 = dispatch_data_create(v7, v8, 0, 0);
  flatbuffers::DetachedBuffer::~DetachedBuffer((flatbuffers::DetachedBuffer *)&v11);
  flatbuffers::Parser::~Parser((flatbuffers::Parser *)v17);
  dispatch_release(v6);
  return v9;
}

- (id)materializeAirScript:(void *)a3
{
  size_t v5;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  _MTLBinaryArchive *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;

  v5 = *((_QWORD *)a3 + 4);
  if (v5)
    return dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), *((_QWORD *)a3 + 7) + *((_QWORD *)a3 + 3), v5);
  v7 = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:", *((_QWORD *)a3 + 11));
  if (v7)
  {
    v8 = v7;
    v9 = (const char *)*((_QWORD *)a3 + 11);
    if (hasFileExtension(v9, ".airp-json"))
    {
      v10 = &Air::PipelineScriptBinarySchema::data(void)::bfbsData;
      v11 = self;
      v12 = v8;
      v13 = 33416;
    }
    else if (hasFileExtension(v9, ".aird-json"))
    {
      v10 = &Air::DylibScriptBinarySchema::data(void)::bfbsData;
      v11 = self;
      v12 = v8;
      v13 = 712;
    }
    else
    {
      if (!hasFileExtension(v9, ".airf-json"))
      {
        v14 = 0;
        goto LABEL_12;
      }
      v10 = &Air::ConstantsSpecializationScriptBinarySchema::data(void)::bfbsData;
      v11 = self;
      v12 = v8;
      v13 = 12584;
    }
    v14 = -[_MTLBinaryArchive flatBufferFromJSON:schema:schemaSize:](v11, "flatBufferFromJSON:schema:schemaSize:", v12, v10, v13);
LABEL_12:
    dispatch_release(v8);
    return v14;
  }
  return 0;
}

- (id)getLibraryInArchiveAtPos:(void *)a3 atIndex:(unsigned int)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _MTLLibrary *v11;
  unsigned __int8 *v12;
  NSObject *subrange;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSArray *v22;
  uint64_t v23;
  unordered_map<MTLUINT256_t, id<MTLLibrarySPI>, UnorderedContainerHash, UnorderedContainerHash, std::allocator<std::pair<const MTLUINT256_t, id<MTLLibrarySPI>>>> *p_stitchedLibraryCache;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  size_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t *v38;
  unint64_t v39[4];
  void *__p[2];
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)a3 + 8 * a4);
  if (*(_QWORD *)(v9 + 8))
  {
    v33 = *((_QWORD *)a3 + 7) + *(_QWORD *)v9;
    v10 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_libCache.__table_.__bucket_list_.__ptr_.__value_, &v33);
    if (v10)
      return (id)v10[3];
    subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v33, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 8 * v8) + 8));
    v11 = MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, subrange, a5, v14, v15, v16, v17);
    __p[0] = &v33;
    std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_libCache, &v33, (uint64_t)&std::piecewise_construct, (_QWORD **)__p)[3] = v11;
    v18 = -[_MTLLibrary specializedFunctionHashes](v11, "specializedFunctionHashes");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, __p, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "getValue:", v39);
          v38 = v39;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_specializedLibraryCache, v39, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v11;
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, __p, 16);
      }
      while (v19);
    }
    v22 = -[_MTLLibrary stitchingFunctionHashes](v11, "stitchingFunctionHashes");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, __p, 16);
    if (v23)
    {
      p_stitchedLibraryCache = &self->_stitchedLibraryCache;
      v25 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "getValue:", v39);
          v38 = v39;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,UnorderedContainerHash,std::__unordered_map_hasher,true>,std::__unordered_map_equal<MTLUINT256_t,objc_object  {objcproto13MTLLibrarySPI}*,std::__unordered_map_hasher,std::__unordered_map_hasher,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::piecewise_construct_t const&<>>((uint64_t)p_stitchedLibraryCache, v39, (uint64_t)&std::piecewise_construct, (_OWORD **)&v38)[6] = v11;
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, __p, 16);
      }
      while (v23);
    }
    dispatch_release(subrange);
    return v11;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(v9 + 16));
  v12 = std::__hash_table<std::__hash_value_type<std::string,DataBlock>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,DataBlock>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,DataBlock>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,DataBlock>>>::find<std::string>(&self->_extLibCache.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v12)
  {
    v11 = (_MTLLibrary *)*((_QWORD *)v12 + 5);
    goto LABEL_23;
  }
  v31 = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 8 * v8) + 16));
  if (v31)
  {
    v11 = MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, v31, a5, v27, v28, v29, v30);
    *(_QWORD *)&v34 = __p;
    *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,objc_object  {objcproto13MTLLibrarySPI}*>,std::__unordered_map_hasher<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,objc_object  {objcproto13MTLLibrarySPI}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto13MTLLibrarySPI}*>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->_extLibCache, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v34)+ 5) = v11;
    dispatch_release(v31);
LABEL_23:
    if (v41 < 0)
      operator delete(__p[0]);
    return v11;
  }
  if (a5)
    *a5 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to map library at path: %s"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 8 * v8) + 16)), MTLBinaryArchiveErrorInvalidFile);
  if (v41 < 0)
    operator delete(__p[0]);
  return 0;
}

- (void)preloadLibrariesInAirntObject:(void *)a3 error:(id *)a4
{
  unint64_t v7;

  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v7 = 0;
    do
    {
      -[_MTLBinaryArchive getLibraryInArchiveAtPos:atIndex:error:](self, "getLibraryInArchiveAtPos:atIndex:error:", a3, v7, a4);
      if (a4 && *a4)
        break;
      v7 = (v7 + 1);
    }
    while (v7 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  }
}

- (id)materializeBitCode:(void *)a3 atIndex:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v9;

  v9 = 0;
  v6 = -[_MTLBinaryArchive getLibraryInArchiveAtPos:atIndex:error:](self, "getLibraryInArchiveAtPos:atIndex:error:", a3, *(_QWORD *)&a4, &v9);
  v7 = v9;
  if (v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_MTLBinaryArchive materializeBitCode:atIndex:].cold.1(v7);
  return (id)objc_msgSend(v6, "bitCodeWithHash:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 8 * a4) + 24));
}

- (id)materializeReflectionBlock:(void *)a3
{
  dispatch_data_t subrange;
  dispatch_data_t v7;
  dispatch_data_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_data_t v11;
  void *v12;

  if ((*((_BYTE *)a3 + 80) & 0x20) != 0)
    return (id)MTLNewReflectionBlock(0, 0, 0);
  if (*((_QWORD *)a3 + 12))
    subrange = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:");
  else
    subrange = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), *((_QWORD *)a3 + 7) + *((unsigned int *)a3 + 16), *((unsigned int *)a3 + 17));
  v7 = subrange;
  if (*((_QWORD *)a3 + 13))
  {
    v8 = -[_MTLBinaryArchive mapFileToMemoryWithPath:](self, "mapFileToMemoryWithPath:");
  }
  else
  {
    v9 = *((_QWORD *)a3 + 7);
    v10 = *((unsigned int *)a3 + 18);
    v8 = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), v9 + v10, *((unsigned int *)a3 + 19));
  }
  v11 = v8;
  v12 = (void *)MTLNewReflectionBlock(0, v7, v8);

  return v12;
}

- (void)materializeAirNTFromOnlineForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4
{
  _MTLBinaryArchive *v4;
  vector<functionIdExtended, std::allocator<functionIdExtended>> *p_airntExtraBinaryEntries;
  uint64_t v6;
  unsigned int v7;
  MTLBinaryKey *v8;
  uint64_t v9;
  MTLBinaryKey *v10;
  void *v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  NSObject *v21;
  MTLHashKey *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char **v26;
  unsigned int v27;
  uint64_t i;
  void *v29;
  unint64_t *Hash;
  unint64_t *v31;
  _OWORD *v32;
  unint64_t v33;
  __int128 v34;
  _OWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  __int128 v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  id v47;
  uint64_t ptr;
  MTLHashKey *v49;
  uint64_t *j;
  __int128 v51;
  __int128 v52;
  uint64_t *v53;
  unint64_t v54;
  unint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  id v62;
  _MTLDevice *device;
  _MTLDevice **libraryBuilder;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _MTLLibrary *v70;
  id v71;
  NSObject *v72;
  _QWORD *v73;
  uint64_t *v74;
  unint64_t v75;
  unint64_t *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  void *v83;
  NSObject *v84;
  _MTLDevice *v85;
  _MTLDevice **v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _MTLLibrary *v92;
  NSObject *v93;
  int *v94;
  unsigned __int16 *v95;
  uint64_t v96;
  int *v97;
  unsigned __int16 *v98;
  uint64_t v99;
  int *v100;
  unsigned int *v101;
  id v102;
  void **v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  char **v108;
  uint64_t k;
  _OWORD *v110;
  unint64_t v111;
  __int128 v112;
  _OWORD *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  __int128 v120;
  char *v121;
  char *v122;
  char *v123;
  __int128 v124;
  uint64_t v125;
  _MTLLibrary *v126;
  unsigned int v127;
  id v128;
  MTLBinaryKey *v129;
  void *v130;
  void *v132;
  uint64_t **var0;
  _QWORD *v134;
  _MTLBinaryArchive *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  size_t size_ptr;
  void *buffer_ptr;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[16];
  _QWORD *v147;
  _BYTE v148[16];
  uint64_t *v149;
  void *v150;
  _BYTE *v151;
  uint64_t v152;
  _BYTE v153[128];
  void *__p[2];
  __int128 v155;
  id v156;
  _BYTE v157[128];
  __int128 v158;
  __int128 v159;
  uint64_t v160;
  uint64_t v161;

  var0 = (uint64_t **)a4.var0;
  v4 = self;
  v161 = *MEMORY[0x1E0C80C00];
  p_airntExtraBinaryEntries = &self->_airntExtraBinaryEntries;
  v151 = 0;
  v152 = 0;
  v150 = 0;
  std::vector<functionIdExtended>::__init_with_size[abi:ne180100]<functionIdExtended*,functionIdExtended*>(&v150, self->_airntExtraBinaryEntries.__begin_, (uint64_t)self->_airntExtraBinaryEntries.__end_, (self->_airntExtraBinaryEntries.__end_ - self->_airntExtraBinaryEntries.__begin_) >> 4);
  std::unordered_map<MTLUINT256_t,MTLAirEntry *,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,MTLAirEntry *>>>::unordered_map((uint64_t)v148, (uint64_t)&v4->_specializedFunctionByHash);
  std::unordered_map<MTLUINT256_t,MTLAirEntry *,UnorderedContainerHash,UnorderedContainerHash,std::allocator<std::pair<MTLUINT256_t const,MTLAirEntry *>>>::unordered_map((uint64_t)v146, (uint64_t)&v4->_stitchedFunctionByHash);
  p_airntExtraBinaryEntries->__end_ = p_airntExtraBinaryEntries->__begin_;
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v4->_specializedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v4->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_);
  v135 = v4;
  if (v151 != v150)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = [MTLBinaryKey alloc];
      v9 = 16 * v6;
      v10 = -[MTLBinaryKey initWithHash:](v8, "initWithHash:", *((_QWORD *)v150 + 2 * v6));
      v11 = (void *)-[NSMutableDictionary objectForKey:](v4->_entries, "objectForKey:", v10);
      if (v11)
      {
        v12 = *var0;
        v13 = (*var0)[1];
        v14 = (unint64_t *)(*var0 + 2);
        v129 = v10;
        if (v13 >= *v14)
        {
          v16 = 0x8E38E38E38E38E39 * ((uint64_t)(v13 - *v12) >> 3);
          v17 = v16 + 1;
          if (v16 + 1 > 0x38E38E38E38E38ELL)
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          if (0x1C71C71C71C71C72 * ((uint64_t)(*v14 - *v12) >> 3) > v17)
            v17 = 0x1C71C71C71C71C72 * ((uint64_t)(*v14 - *v12) >> 3);
          if (0x8E38E38E38E38E39 * ((uint64_t)(*v14 - *v12) >> 3) >= 0x1C71C71C71C71C7)
            v18 = 0x38E38E38E38E38ELL;
          else
            v18 = v17;
          v160 = (uint64_t)(*var0 + 2);
          if (v18)
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v14, v18);
          else
            v19 = 0;
          v20 = &v19[72 * v16];
          *(_QWORD *)&v158 = v19;
          *((_QWORD *)&v158 + 1) = v20;
          *((_QWORD *)&v159 + 1) = &v19[72 * v18];
          *(_OWORD *)v20 = 0u;
          *((_OWORD *)v20 + 1) = 0u;
          *((_OWORD *)v20 + 2) = 0u;
          *((_OWORD *)v20 + 3) = 0u;
          *((_QWORD *)v20 + 8) = 0;
          *(_QWORD *)&v159 = v20 + 72;
          std::vector<machOEntry>::__swap_out_circular_buffer(v12, &v158);
          v15 = v12[1];
          std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v158);
        }
        else
        {
          *(_QWORD *)(v13 + 64) = 0;
          *(_OWORD *)(v13 + 32) = 0u;
          *(_OWORD *)(v13 + 48) = 0u;
          *(_OWORD *)v13 = 0u;
          *(_OWORD *)(v13 + 16) = 0u;
          v15 = v13 + 72;
          v12[1] = v13 + 72;
        }
        v12[1] = v15;
        *(_QWORD *)(v15 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
        v21 = objc_msgSend(v11, "data");
        *(_QWORD *)(v15 - 40) = v21;
        dispatch_retain(v21);
        v22 = (MTLHashKey *)operator new();
        MTLHashKey::MTLHashKey(v22, *(const MTLHashKey **)((char *)v150 + v9));
        *(_QWORD *)(v15 - 64) = v22;
        *(_QWORD *)(v15 - 48) = objc_msgSend(v11, "bitcode");
        *(_QWORD *)(v15 - 56) = objc_msgSend(v11, "airScript");
        *(_QWORD *)(v15 - 32) = objc_msgSend(v11, "reflectionBlock");
        dispatch_retain(*(dispatch_object_t *)(v15 - 48));
        dispatch_retain(*(dispatch_object_t *)(v15 - 56));
        dispatch_retain(*(dispatch_object_t *)(v15 - 32));
        v125 = v9;
        v127 = v7;
        if (objc_msgSend((id)objc_msgSend(v11, "linkedBitcodes"), "count"))
        {
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v23 = (void *)objc_msgSend(v11, "linkedBitcodes");
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v143;
            v26 = (char **)(v15 - 24);
            v27 = 1;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v143 != v25)
                  objc_enumerationMutation(v23);
                v29 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * i);
                Hash = (unint64_t *)MTLHashKey::getHash(*(_QWORD *)(v15 - 64), 0, v27);
                v31 = Hash;
                v32 = *(_OWORD **)(v15 - 16);
                v33 = *(_QWORD *)(v15 - 8);
                if ((unint64_t)v32 >= v33)
                {
                  v36 = ((char *)v32 - *v26) >> 5;
                  v37 = v36 + 1;
                  if ((unint64_t)(v36 + 1) >> 59)
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  v38 = v33 - (_QWORD)*v26;
                  if (v38 >> 4 > v37)
                    v37 = v38 >> 4;
                  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0)
                    v39 = 0x7FFFFFFFFFFFFFFLL;
                  else
                    v39 = v37;
                  if (v39)
                    v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(v15 - 8, v39);
                  else
                    v40 = 0;
                  v41 = &v40[32 * v36];
                  v42 = *((_OWORD *)v31 + 1);
                  *(_OWORD *)v41 = *(_OWORD *)v31;
                  *((_OWORD *)v41 + 1) = v42;
                  v44 = *(char **)(v15 - 24);
                  v43 = *(char **)(v15 - 16);
                  v45 = v41;
                  if (v43 != v44)
                  {
                    do
                    {
                      v46 = *((_OWORD *)v43 - 1);
                      *((_OWORD *)v45 - 2) = *((_OWORD *)v43 - 2);
                      *((_OWORD *)v45 - 1) = v46;
                      v45 -= 32;
                      v43 -= 32;
                    }
                    while (v43 != v44);
                    v43 = *v26;
                  }
                  v35 = v41 + 32;
                  *(_QWORD *)(v15 - 24) = v45;
                  *(_QWORD *)(v15 - 16) = v41 + 32;
                  *(_QWORD *)(v15 - 8) = &v40[32 * v39];
                  if (v43)
                    operator delete(v43);
                }
                else
                {
                  v34 = *((_OWORD *)Hash + 1);
                  *v32 = *(_OWORD *)Hash;
                  v32[1] = v34;
                  v35 = v32 + 2;
                }
                *(_QWORD *)(v15 - 16) = v35;
                if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)v135->_uniqueBitcodeList.__ptr_, v31))
                {
                  v47 = v29;
                  ptr = (uint64_t)v135->_uniqueBitcodeList.__ptr_;
                  *(_QWORD *)&v158 = v31;
                  std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>(ptr, v31, (uint64_t)&std::piecewise_construct, (_OWORD **)&v158)[6] = v47;
                }
                ++v27;
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v142, v157, 16);
            }
            while (v24);
          }
        }

        v7 = v127;
        v49 = *(MTLHashKey **)((char *)v150 + v125);
        v4 = v135;
        if (v49)
        {
          MTLHashKey::~MTLHashKey(v49);
          MEMORY[0x186DABFBC]();
        }
      }
      else
      {

      }
      v6 = ++v7;
    }
    while (v7 < (unint64_t)((v151 - (_BYTE *)v150) >> 4));
  }
  for (j = v149; j; j = (uint64_t *)*j)
  {
    v51 = *((_OWORD *)j + 1);
    v52 = *((_OWORD *)j + 2);
    v156 = (id)j[6];
    *(_OWORD *)__p = v51;
    v155 = v52;
    v53 = *var0;
    v54 = (*var0)[1];
    v55 = (unint64_t *)(*var0 + 2);
    if (v54 >= *v55)
    {
      v57 = 0x8E38E38E38E38E39 * ((uint64_t)(v54 - *v53) >> 3);
      v58 = v57 + 1;
      if (v57 + 1 > 0x38E38E38E38E38ELL)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      if (0x1C71C71C71C71C72 * ((uint64_t)(*v55 - *v53) >> 3) > v58)
        v58 = 0x1C71C71C71C71C72 * ((uint64_t)(*v55 - *v53) >> 3);
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v55 - *v53) >> 3) >= 0x1C71C71C71C71C7)
        v59 = 0x38E38E38E38E38ELL;
      else
        v59 = v58;
      v160 = (uint64_t)(*var0 + 2);
      if (v59)
        v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v55, v59);
      else
        v60 = 0;
      v61 = &v60[72 * v57];
      *(_QWORD *)&v158 = v60;
      *((_QWORD *)&v158 + 1) = v61;
      *((_QWORD *)&v159 + 1) = &v60[72 * v59];
      *(_OWORD *)v61 = 0u;
      *((_OWORD *)v61 + 1) = 0u;
      *((_OWORD *)v61 + 2) = 0u;
      *((_OWORD *)v61 + 3) = 0u;
      *((_QWORD *)v61 + 8) = 0;
      *(_QWORD *)&v159 = v61 + 72;
      std::vector<machOEntry>::__swap_out_circular_buffer(v53, &v158);
      v56 = v53[1];
      std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v158);
    }
    else
    {
      *(_QWORD *)(v54 + 64) = 0;
      *(_OWORD *)(v54 + 32) = 0u;
      *(_OWORD *)(v54 + 48) = 0u;
      *(_OWORD *)v54 = 0u;
      *(_OWORD *)(v54 + 16) = 0u;
      v56 = v54 + 72;
      v53[1] = v54 + 72;
    }
    v53[1] = v56;
    *(_QWORD *)(v56 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
    v62 = v156;
    device = (_MTLDevice *)v4->_device;
    libraryBuilder = (_MTLDevice **)device->_libraryBuilder;
    v65 = objc_msgSend(v156, "data");
    v70 = MTLLibraryBuilder::newLibraryWithData(libraryBuilder, device, v65, 0, v66, v67, v68, v69);
    v4 = v135;
    v71 = -[_MTLLibrary newSpecializedFunctionWithHash:](v70, "newSpecializedFunctionWithHash:", __p);
    if (!v71)
      v71 = -[_MTLLibrary newFunctionWithName:](v70, "newFunctionWithName:", -[NSArray objectAtIndex:](-[_MTLLibrary functionNames](v70, "functionNames"), "objectAtIndex:", 0));
    *(_QWORD *)(v56 - 48) = objc_msgSend(v62, "bitcode");
    *(_QWORD *)(v56 - 40) = objc_msgSend(v71, "bitcodeDataInternal");
    v72 = objc_msgSend(v62, "airScript");
    *(_QWORD *)(v56 - 56) = v72;
    dispatch_retain(v72);
    dispatch_retain(*(dispatch_object_t *)(v56 - 48));

  }
  v73 = v147;
  if (v147)
  {
    do
    {
      v74 = *var0;
      v75 = (*var0)[1];
      v76 = (unint64_t *)(*var0 + 2);
      if (v75 >= *v76)
      {
        v78 = 0x8E38E38E38E38E39 * ((uint64_t)(v75 - *v74) >> 3);
        v79 = v78 + 1;
        if (v78 + 1 > 0x38E38E38E38E38ELL)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v76 - *v74) >> 3) > v79)
          v79 = 0x1C71C71C71C71C72 * ((uint64_t)(*v76 - *v74) >> 3);
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v76 - *v74) >> 3) >= 0x1C71C71C71C71C7)
          v80 = 0x38E38E38E38E38ELL;
        else
          v80 = v79;
        v160 = (uint64_t)(*var0 + 2);
        if (v80)
          v81 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v76, v80);
        else
          v81 = 0;
        v82 = &v81[72 * v78];
        *(_QWORD *)&v158 = v81;
        *((_QWORD *)&v158 + 1) = v82;
        *((_QWORD *)&v159 + 1) = &v81[72 * v80];
        *(_OWORD *)v82 = 0u;
        *((_OWORD *)v82 + 1) = 0u;
        *((_OWORD *)v82 + 2) = 0u;
        *((_OWORD *)v82 + 3) = 0u;
        *((_QWORD *)v82 + 8) = 0;
        *(_QWORD *)&v159 = v82 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v74, &v158);
        v77 = v74[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v158);
      }
      else
      {
        *(_QWORD *)(v75 + 64) = 0;
        *(_OWORD *)(v75 + 32) = 0u;
        *(_OWORD *)(v75 + 48) = 0u;
        *(_OWORD *)v75 = 0u;
        *(_OWORD *)(v75 + 16) = 0u;
        v77 = v75 + 72;
        v74[1] = v75 + 72;
      }
      v74[1] = v77;
      *(_QWORD *)(v77 - 72) = 0;
      v83 = (void *)v73[6];
      v84 = objc_msgSend(v83, "airScript");
      *(_QWORD *)(v77 - 56) = v84;
      dispatch_retain(v84);
      v85 = (_MTLDevice *)v135->_device;
      v86 = (_MTLDevice **)v85->_libraryBuilder;
      v87 = objc_msgSend(v83, "data");
      v92 = MTLLibraryBuilder::newLibraryWithData(v86, v85, v87, 0, v88, v89, v90, v91);
      size_ptr = 0;
      buffer_ptr = 0;
      v93 = dispatch_data_create_map((dispatch_data_t)objc_msgSend(v83, "airScript"), (const void **)&buffer_ptr, &size_ptr);
      v94 = (int *)((char *)buffer_ptr + *(unsigned int *)buffer_ptr);
      v95 = (unsigned __int16 *)((char *)v94 - *v94);
      if (*v95 >= 9u && (v96 = v95[4]) != 0)
        v97 = (int *)((char *)v94 + v96 + *(unsigned int *)((char *)v94 + v96));
      else
        v97 = 0;
      v98 = (unsigned __int16 *)((char *)v97 - *v97);
      if (*v98 >= 7u && (v99 = v98[3]) != 0)
        v100 = (int *)((char *)v97 + v99 + *(unsigned int *)((char *)v97 + v99));
      else
        v100 = 0;
      v101 = (unsigned int *)((char *)v100 + *(unsigned __int16 *)((char *)v100 - *v100 + 4));
      std::string::basic_string[abi:ne180100](__p, (char *)v101 + *v101 + 4, *(unsigned int *)((char *)v101 + *v101));
      v102 = objc_alloc(MEMORY[0x1E0CB3940]);
      if ((SBYTE7(v155) & 0x80u) == 0)
        v103 = __p;
      else
        v103 = (void **)__p[0];
      v104 = objc_msgSend(v102, "initWithUTF8String:", v103);
      v126 = v92;
      v128 = -[_MTLLibrary newFunctionWithName:](v92, "newFunctionWithName:", v104);
      v130 = (void *)v104;
      v134 = v73;
      *(_QWORD *)(v77 - 40) = objc_msgSend(v128, "bitcodeDataInternal");
      dispatch_release(v93);
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v132 = v83;
      v105 = (void *)objc_msgSend(v83, "linkedBitcodes");
      v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
      if (v106)
      {
        v107 = *(_QWORD *)v137;
        v108 = (char **)(v77 - 24);
        do
        {
          for (k = 0; k != v106; ++k)
          {
            if (*(_QWORD *)v137 != v107)
              objc_enumerationMutation(v105);
            objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * k), "getValue:", &v158);
            v110 = *(_OWORD **)(v77 - 16);
            v111 = *(_QWORD *)(v77 - 8);
            if ((unint64_t)v110 >= v111)
            {
              v114 = ((char *)v110 - *v108) >> 5;
              v115 = v114 + 1;
              if ((unint64_t)(v114 + 1) >> 59)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v116 = v111 - (_QWORD)*v108;
              if (v116 >> 4 > v115)
                v115 = v116 >> 4;
              if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFE0)
                v117 = 0x7FFFFFFFFFFFFFFLL;
              else
                v117 = v115;
              if (v117)
                v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(v77 - 8, v117);
              else
                v118 = 0;
              v119 = &v118[32 * v114];
              v120 = v159;
              *(_OWORD *)v119 = v158;
              *((_OWORD *)v119 + 1) = v120;
              v122 = *(char **)(v77 - 24);
              v121 = *(char **)(v77 - 16);
              v123 = v119;
              if (v121 != v122)
              {
                do
                {
                  v124 = *((_OWORD *)v121 - 1);
                  *((_OWORD *)v123 - 2) = *((_OWORD *)v121 - 2);
                  *((_OWORD *)v123 - 1) = v124;
                  v123 -= 32;
                  v121 -= 32;
                }
                while (v121 != v122);
                v121 = *v108;
              }
              v113 = v119 + 32;
              *(_QWORD *)(v77 - 24) = v123;
              *(_QWORD *)(v77 - 16) = v119 + 32;
              *(_QWORD *)(v77 - 8) = &v118[32 * v117];
              if (v121)
                operator delete(v121);
            }
            else
            {
              v112 = v159;
              *v110 = v158;
              v110[1] = v112;
              v113 = v110 + 2;
            }
            *(_QWORD *)(v77 - 16) = v113;
          }
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
        }
        while (v106);
      }

      if (SBYTE7(v155) < 0)
        operator delete(__p[0]);
      v73 = (_QWORD *)*v134;
    }
    while (*v134);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v146);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v148);
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }
}

- (void)materializeAirNTStitchedFunctions:(shared_ptr<std::vector<machOEntry>>)a3
{
  _OWORD *i;
  __int128 v5;
  __int128 v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  void *ptr;
  uint64_t **var0;
  void *__p;
  __int128 *v27;
  __int128 *v28;
  _OWORD v29[2];
  id v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  var0 = (uint64_t **)a3.var0;
  v34 = *MEMORY[0x1E0C80C00];
  for (i = self->_stitchedLibraryCache.__table_.__p1_.__value_.__next_; i; i = *(_OWORD **)i)
  {
    v5 = i[1];
    v6 = i[2];
    v30 = (id)*((_QWORD *)i + 6);
    v29[0] = v5;
    v29[1] = v6;
    v7 = *var0;
    v8 = (*var0)[1];
    v9 = (unint64_t *)(*var0 + 2);
    if (v8 >= *v9)
    {
      v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - *v7) >> 3);
      v12 = v11 + 1;
      if (v11 + 1 > 0x38E38E38E38E38ELL)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      if (0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3) > v12)
        v12 = 0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3);
      if (0x8E38E38E38E38E39 * ((uint64_t)(*v9 - *v7) >> 3) >= 0x1C71C71C71C71C7)
        v13 = 0x38E38E38E38E38ELL;
      else
        v13 = v12;
      v33 = (uint64_t)(*var0 + 2);
      if (v13)
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v9, v13);
      else
        v14 = 0;
      v15 = &v14[72 * v11];
      *(_QWORD *)&v31 = v14;
      *((_QWORD *)&v31 + 1) = v15;
      *((_QWORD *)&v32 + 1) = &v14[72 * v13];
      *(_OWORD *)v15 = 0u;
      *((_OWORD *)v15 + 1) = 0u;
      *((_OWORD *)v15 + 2) = 0u;
      *((_OWORD *)v15 + 3) = 0u;
      *((_QWORD *)v15 + 8) = 0;
      *(_QWORD *)&v32 = v15 + 72;
      std::vector<machOEntry>::__swap_out_circular_buffer(v7, &v31);
      v10 = v7[1];
      std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v31);
    }
    else
    {
      *(_QWORD *)(v8 + 64) = 0;
      *(_OWORD *)(v8 + 32) = 0u;
      *(_OWORD *)(v8 + 48) = 0u;
      *(_OWORD *)v8 = 0u;
      *(_OWORD *)(v8 + 16) = 0u;
      v10 = v8 + 72;
      v7[1] = v8 + 72;
    }
    v7[1] = v10;
    *(_QWORD *)(v10 - 72) = 0;
    v16 = v30;
    v17 = (void *)objc_msgSend(v30, "newStitchedFunctionWithHash:", v29, a3.var1, var0);
    *(_QWORD *)(v10 - 40) = objc_msgSend(v17, "bitcodeDataInternal");
    v18 = objc_msgSend(v17, "libraryData");
    (*(void (**)(void **__return_ptr, uint64_t, _OWORD *))(*(_QWORD *)v18 + 272))(&__p, v18, v29);
    *(_QWORD *)(v10 - 56) = (id)objc_msgSend(v17, "stitchingAirScript");
    if ((void **)(v10 - 24) != &__p)
      std::vector<MTLUINT256_t>::__assign_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(v10 - 24), (char *)__p, (uint64_t)v27, ((char *)v27 - (_BYTE *)__p) >> 5);
    v20 = (__int128 *)__p;
    v19 = v27;
    if (__p != v27)
    {
      do
      {
        v21 = v20[1];
        v31 = *v20;
        v32 = v21;
        if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)&v31))
        {
          v22 = (void *)objc_msgSend(v16, "newFunctionWithHash:", &v31);
          v23 = objc_msgSend(v22, "bitcodeDataInternal");
          ptr = self->_uniqueBitcodeList.__ptr_;
          v28 = &v31;
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, (unint64_t *)&v31, (uint64_t)&std::piecewise_construct, &v28)[6] = v23;

        }
        v20 += 2;
      }
      while (v20 != v19);
    }

    if (__p)
    {
      v27 = (__int128 *)__p;
      operator delete(__p);
    }
  }
}

- (void)materializeAirNTSpecializedFunctions:(shared_ptr<std::vector<machOEntry>>)a3
{
  _OWORD *next;
  uint64_t **var0;
  __int128 v5;
  __int128 v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  next = self->_specializedLibraryCache.__table_.__p1_.__value_.__next_;
  if (next)
  {
    var0 = (uint64_t **)a3.var0;
    do
    {
      v5 = next[1];
      v6 = next[2];
      v23 = (id)*((_QWORD *)next + 6);
      v21 = v5;
      v22 = v6;
      v7 = *var0;
      v8 = (*var0)[1];
      v9 = (unint64_t *)(*var0 + 2);
      if (v8 >= *v9)
      {
        v11 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - *v7) >> 3);
        v12 = v11 + 1;
        if (v11 + 1 > 0x38E38E38E38E38ELL)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3) > v12)
          v12 = 0x1C71C71C71C71C72 * ((uint64_t)(*v9 - *v7) >> 3);
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v9 - *v7) >> 3) >= 0x1C71C71C71C71C7)
          v13 = 0x38E38E38E38E38ELL;
        else
          v13 = v12;
        v26 = (uint64_t)(*var0 + 2);
        if (v13)
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v9, v13);
        else
          v14 = 0;
        v15 = &v14[72 * v11];
        *(_QWORD *)&v24 = v14;
        *((_QWORD *)&v24 + 1) = v15;
        *((_QWORD *)&v25 + 1) = &v14[72 * v13];
        *(_OWORD *)v15 = 0u;
        *((_OWORD *)v15 + 1) = 0u;
        *((_OWORD *)v15 + 2) = 0u;
        *((_OWORD *)v15 + 3) = 0u;
        *((_QWORD *)v15 + 8) = 0;
        *(_QWORD *)&v25 = v15 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v7, &v24);
        v10 = v7[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v24);
      }
      else
      {
        *(_QWORD *)(v8 + 64) = 0;
        *(_OWORD *)(v8 + 32) = 0u;
        *(_OWORD *)(v8 + 48) = 0u;
        *(_OWORD *)v8 = 0u;
        *(_OWORD *)(v8 + 16) = 0u;
        v10 = v8 + 72;
        v7[1] = v8 + 72;
      }
      v7[1] = v10;
      *(_QWORD *)(v10 - 72) = 0;
      v16 = v23;
      v17 = (void *)objc_msgSend(v23, "newSpecializedFunctionWithHash:", &v21, a3.var1);
      v18 = v17;
      v24 = 0u;
      v25 = 0u;
      if (v17)
        objc_msgSend(v17, "baseFunctionHash", v21, v22);
      v19 = (void *)objc_msgSend(v16, "newFunctionWithHash:", &v24, v21, v22);
      *(_QWORD *)(v10 - 48) = objc_msgSend(v19, "bitcodeDataInternal");
      *(_QWORD *)(v10 - 40) = objc_msgSend(v18, "bitcodeDataInternal");
      v20 = objc_msgSend(v18, "specializationAirScript");
      *(_QWORD *)(v10 - 56) = v20;
      dispatch_retain(v20);

      next = *(_OWORD **)next;
    }
    while (next);
  }
}

- (void)materializeLinkedBitcodes:(void *)a3 hashList:(void *)a4
{
  uint64_t v4;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  unint64_t v13;
  __int128 v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;
  id v27;
  void *ptr;
  _OWORD *v29;

  v4 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 >= 0x10uLL)
  {
    v8 = (char *)a4 + 16;
    v9 = 1;
    do
    {
      v10 = *(_QWORD *)(v4 + 8 * v9);
      if (*(_BYTE *)(v10 + 32))
        break;
      v11 = *(_OWORD **)(v10 + 24);
      v12 = (_OWORD *)*((_QWORD *)a4 + 1);
      v13 = *((_QWORD *)a4 + 2);
      if ((unint64_t)v12 >= v13)
      {
        v16 = ((uint64_t)v12 - *(_QWORD *)a4) >> 5;
        v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 59)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        v18 = v13 - *(_QWORD *)a4;
        if (v18 >> 4 > v17)
          v17 = v18 >> 4;
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0)
          v19 = 0x7FFFFFFFFFFFFFFLL;
        else
          v19 = v17;
        if (v19)
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>((uint64_t)v8, v19);
        else
          v20 = 0;
        v21 = &v20[32 * v16];
        v22 = v11[1];
        *(_OWORD *)v21 = *v11;
        *((_OWORD *)v21 + 1) = v22;
        v24 = *(char **)a4;
        v23 = (char *)*((_QWORD *)a4 + 1);
        v25 = v21;
        if (v23 != *(char **)a4)
        {
          do
          {
            v26 = *((_OWORD *)v23 - 1);
            *((_OWORD *)v25 - 2) = *((_OWORD *)v23 - 2);
            *((_OWORD *)v25 - 1) = v26;
            v25 -= 32;
            v23 -= 32;
          }
          while (v23 != v24);
          v23 = *(char **)a4;
        }
        v15 = v21 + 32;
        *(_QWORD *)a4 = v25;
        *((_QWORD *)a4 + 1) = v21 + 32;
        *((_QWORD *)a4 + 2) = &v20[32 * v19];
        if (v23)
          operator delete(v23);
      }
      else
      {
        v14 = v11[1];
        *v12 = *v11;
        v12[1] = v14;
        v15 = v12 + 2;
      }
      *((_QWORD *)a4 + 1) = v15;
      if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)v11))
      {
        v27 = -[_MTLBinaryArchive materializeBitCode:atIndex:](self, "materializeBitCode:atIndex:", a3, v9);
        ptr = self->_uniqueBitcodeList.__ptr_;
        v29 = v11;
        std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, (unint64_t *)v11, (uint64_t)&std::piecewise_construct, &v29)[6] = v27;
      }
      v9 = (v9 + 1);
      v4 = *(_QWORD *)a3;
    }
    while (v9 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  }
}

- (void)materializeAirNTAllForSlice:(const MTLLoaderSliceIdentifier *)a3 entryList:(shared_ptr<std::vector<machOEntry>>)a4
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  vector<MTLAirNTObject *, std::allocator<MTLAirNTObject *>> *p_airntObjectList;
  MTLAirNTObject **end;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  MTLAirNTObject *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  _OWORD *v40;
  __int128 v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  __int128 v48;
  char *v49;
  char *v50;
  __int128 v51;
  char *v52;
  void *v53;
  uint64_t *v54;
  _BOOL4 v55;
  MTLHashKey *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  MTLAirNTObject *v60;
  uint64_t v61;
  uint64_t i;
  _QWORD *v63;
  uint64_t **var0;
  uint64_t v66;
  void *v68;
  void *v69;
  uint64_t v70;
  void *__p;
  char *v72;
  char *v73;
  uint64_t *v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  char v78;
  MTLHashKey v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = (std::__shared_weak_count *)*((_QWORD *)a4.var0 + 1);
  var0 = (uint64_t **)a4.var0;
  v76 = *(_QWORD *)a4.var0;
  v77 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  -[_MTLBinaryArchive materializeAirNTSpecializedFunctions:](self, "materializeAirNTSpecializedFunctions:", &v76);
  v7 = v77;
  if (v77)
  {
    v8 = (unint64_t *)&v77->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = (std::__shared_weak_count *)var0[1];
  v74 = *var0;
  v75 = v10;
  if (v10)
  {
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  -[_MTLBinaryArchive materializeAirNTStitchedFunctions:](self, "materializeAirNTStitchedFunctions:", &v74);
  v13 = v75;
  if (v75)
  {
    v14 = (unint64_t *)&v75->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  p_airntObjectList = &self->_airntObjectList;
  end = self->_airntObjectList.__end_;
  if (end != self->_airntObjectList.__begin_)
  {
    v18 = 0;
    do
    {
      v19 = *var0;
      v20 = (*var0)[1];
      v21 = (unint64_t *)(*var0 + 2);
      if (v20 >= *v21)
      {
        v23 = 0x8E38E38E38E38E39 * ((uint64_t)(v20 - *v19) >> 3);
        v24 = v23 + 1;
        if (v23 + 1 > 0x38E38E38E38E38ELL)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        if (0x1C71C71C71C71C72 * ((uint64_t)(*v21 - *v19) >> 3) > v24)
          v24 = 0x1C71C71C71C71C72 * ((uint64_t)(*v21 - *v19) >> 3);
        if (0x8E38E38E38E38E39 * ((uint64_t)(*v21 - *v19) >> 3) >= 0x1C71C71C71C71C7)
          v25 = 0x38E38E38E38E38ELL;
        else
          v25 = v24;
        *(_QWORD *)&v79.var1.var0[8] = *var0 + 2;
        if (v25)
          v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<machOEntry>>((uint64_t)v21, v25);
        else
          v26 = 0;
        v27 = (unint64_t)&v26[72 * v23];
        v79.var0.var0 = (unint64_t)v26;
        v79.var0.var1 = v27;
        *(_QWORD *)v79.var1.var0 = &v26[72 * v25];
        *(_OWORD *)v27 = 0u;
        *(_OWORD *)(v27 + 16) = 0u;
        *(_OWORD *)(v27 + 32) = 0u;
        *(_OWORD *)(v27 + 48) = 0u;
        *(_QWORD *)(v27 + 64) = 0;
        *(_QWORD *)&v79.var0.var2 = v27 + 72;
        std::vector<machOEntry>::__swap_out_circular_buffer(v19, &v79);
        v22 = v19[1];
        std::__split_buffer<machOEntry>::~__split_buffer((uint64_t)&v79);
      }
      else
      {
        *(_QWORD *)(v20 + 64) = 0;
        *(_OWORD *)(v20 + 32) = 0u;
        *(_OWORD *)(v20 + 48) = 0u;
        *(_OWORD *)v20 = 0u;
        *(_OWORD *)(v20 + 16) = 0u;
        v22 = v20 + 72;
        v19[1] = v20 + 72;
      }
      v19[1] = v22;
      v66 = v22;
      *(_QWORD *)(v22 - 72) = a3->var1 | ((unint64_t)a3->var0 << 32);
      *(_QWORD *)(v22 - 56) = -[_MTLBinaryArchive materializeAirScript:](self, "materializeAirScript:", p_airntObjectList->__begin_[v18], v63);
      *(_QWORD *)(v22 - 48) = -[_MTLBinaryArchive materializeBitCode:atIndex:](self, "materializeBitCode:atIndex:", p_airntObjectList->__begin_[v18], 0);
      -[_MTLBinaryArchive materializeLinkedBitcodes:hashList:](self, "materializeLinkedBitcodes:hashList:", p_airntObjectList->__begin_[v18], v22 - 24);
      *(_QWORD *)(v22 - 32) = -[_MTLBinaryArchive materializeReflectionBlock:](self, "materializeReflectionBlock:", p_airntObjectList->__begin_[v18]);
      v28 = p_airntObjectList->__begin_[v18];
      *(_QWORD *)(v22 - 40) = dispatch_data_create_subrange((dispatch_data_t)-[MTLLoadedFileContentsWrapper dispatchData](self->_fileData, "dispatchData"), *((_QWORD *)v28 + 7) + *((_QWORD *)v28 + 5), *((_QWORD *)v28 + 6));
      v79.var0.var0 = *((_QWORD *)p_airntObjectList->__begin_[v18] + 7)
                    + *((_QWORD *)p_airntObjectList->__begin_[v18] + 5);
      v29 = std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::find<unsigned long>(&self->_airntBinaryList.__table_.__bucket_list_.__ptr_.__value_, &v79.var0.var0);
      v30 = v29;
      if (v29)
      {
        v31 = v29[3];
        v63 = v29 + 3;
        v32 = v29[4] - v31;
        if (v32)
        {
          v33 = 0xCCCCCCCCCCCCCCCDLL * (v32 >> 4);
          v34 = v33 - 1;
          if (v33 < v33 - 1)
LABEL_80:
            std::vector<MTLHashKey>::__throw_out_of_range[abi:ne180100]();
          while (1)
          {
            v35 = v34;
            MTLHashKey::MTLHashKey(&v79, (const MTLHashKey *)(v31 + 80 * v34));
            __p = 0;
            v72 = 0;
            v73 = 0;
            v36 = *(_QWORD *)p_airntObjectList->__begin_[v18];
            if ((unint64_t)(*((_QWORD *)p_airntObjectList->__begin_[v18] + 1) - v36) < 9)
            {
              v37 = 0;
              v53 = 0;
            }
            else
            {
              v37 = 0;
              v38 = 1;
              do
              {
                v39 = *(_QWORD *)(v36 + 8 * v38);
                if (*(_BYTE *)(v39 + 32))
                  break;
                v40 = *(_OWORD **)(v39 + 24);
                if (v37 >= v73)
                {
                  v42 = (char *)__p;
                  v43 = (v37 - (_BYTE *)__p) >> 5;
                  v44 = v43 + 1;
                  if ((unint64_t)(v43 + 1) >> 59)
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  v45 = v73 - (_BYTE *)__p;
                  if ((v73 - (_BYTE *)__p) >> 4 > v44)
                    v44 = v45 >> 4;
                  if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFE0)
                    v46 = 0x7FFFFFFFFFFFFFFLL;
                  else
                    v46 = v44;
                  if (v46)
                  {
                    v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>((uint64_t)&v73, v46);
                    v42 = (char *)__p;
                    v37 = v72;
                  }
                  else
                  {
                    v47 = 0;
                  }
                  v48 = v40[1];
                  v49 = &v47[32 * v43];
                  *(_OWORD *)v49 = *v40;
                  *((_OWORD *)v49 + 1) = v48;
                  if (v37 == v42)
                  {
                    v52 = &v47[32 * v43];
                  }
                  else
                  {
                    v50 = &v47[32 * v43];
                    do
                    {
                      v51 = *((_OWORD *)v37 - 1);
                      v52 = v50 - 32;
                      *((_OWORD *)v50 - 2) = *((_OWORD *)v37 - 2);
                      *((_OWORD *)v50 - 1) = v51;
                      v37 -= 32;
                      v50 -= 32;
                    }
                    while (v37 != v42);
                  }
                  v37 = v49 + 32;
                  __p = v52;
                  v72 = v49 + 32;
                  v73 = &v47[32 * v46];
                  if (v42)
                    operator delete(v42);
                }
                else
                {
                  v41 = v40[1];
                  *(_OWORD *)v37 = *v40;
                  *((_OWORD *)v37 + 1) = v41;
                  v37 += 32;
                }
                v72 = v37;
                v38 = (v38 + 1);
                v36 = *(_QWORD *)p_airntObjectList->__begin_[v18];
              }
              while (v38 < (*((_QWORD *)p_airntObjectList->__begin_[v18] + 1) - v36) >> 3);
              v53 = __p;
            }
            v54 = *(uint64_t **)(*(_QWORD *)v36 + 24);
            v69 = 0;
            v70 = 0;
            v68 = 0;
            std::vector<MTLUINT256_t>::__init_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>(&v68, v53, (uint64_t)v37, (v37 - (_BYTE *)v53) >> 5);
            v55 = MTLHashKey::areBitcodesEqual((uint64_t)&v79, v54, (uint64_t)&v68);
            if (v68)
            {
              v69 = v68;
              operator delete(v68);
            }
            if (v55)
              break;
            if (__p)
            {
              v72 = (char *)__p;
              operator delete(__p);
            }
            MTLHashKey::~MTLHashKey(&v79);
            if (!v35)
              goto LABEL_71;
            v31 = v30[3];
            v34 = v35 - 1;
            v33 = v35;
            if (0xCCCCCCCCCCCCCCCDLL * ((v30[4] - v31) >> 4) <= v35 - 1)
              goto LABEL_80;
          }
          v56 = (MTLHashKey *)operator new();
          MTLHashKey::MTLHashKey(v56, &v79);
          *(_QWORD *)(v66 - 64) = v56;
          v58 = v30[3];
          v57 = v30[4];
          if (v33 == 0xCCCCCCCCCCCCCCCDLL * ((v57 - v58) >> 4))
          {
            v59 = v57 - 80;
            MTLHashKey::~MTLHashKey((MTLHashKey *)(v57 - 80));
          }
          else
          {
            std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<MTLHashKey *,MTLHashKey *,MTLHashKey *>((uint64_t)&v78, v58 + 80 * v33, v57, v58 + 80 * v35);
            v59 = v61;
            for (i = v30[4]; i != v59; MTLHashKey::~MTLHashKey((MTLHashKey *)(i - 80)))
              ;
          }
          v30[4] = v59;
          if (__p)
          {
            v72 = (char *)__p;
            operator delete(__p);
          }
          MTLHashKey::~MTLHashKey(&v79);
        }
      }
LABEL_71:
      end = p_airntObjectList->__begin_;
      v60 = p_airntObjectList->__begin_[v18];
      if (v60)
      {
        MTLAirNTObject::~MTLAirNTObject(v60);
        MEMORY[0x186DABFBC]();
        end = p_airntObjectList->__begin_;
      }
      ++v18;
    }
    while (v18 < self->_airntObjectList.__end_ - end);
  }
  self->_airntObjectList.__end_ = end;
  self->_airntFromDescriptorFunctionList.__end_ = self->_airntFromDescriptorFunctionList.__begin_;
}

- (BOOL)airntSerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6;
  void *v8;
  NSObject *serializeQueue;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[9];
  stat v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  if (a5)
    *a5 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v17[5] = 0;
  if (!objc_msgSend(a3, "path", a3, a4) || !objc_msgSend(v6, "filePathURL"))
  {
    if (a5)
    {
      v12 = newErrorWithMessage(CFSTR("Invalid URL"), MTLBinaryArchiveErrorInvalidFile);
LABEL_14:
      LOBYTE(v6) = 0;
      *a5 = v12;
      goto LABEL_24;
    }
LABEL_17:
    LOBYTE(v6) = 0;
    goto LABEL_24;
  }
  if (stat((const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "URLByDeletingLastPathComponent"), "path"), "UTF8String"), &v16) == -1)
  {
    if (a5)
    {
      v12 = newErrorWithMessage(CFSTR("Invalid URL"), MTLBinaryArchiveErrorInvalidFile);
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  v8 = (void *)MEMORY[0x186DAC640]();
  atomic_store(1u, (unsigned __int8 *)&self->_serializing);
  serializeQueue = self->_serializeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___MTLBinaryArchive_airntSerializeToURL_options_error___block_invoke;
  block[3] = &unk_1E0FE2A18;
  block[4] = self;
  block[5] = v6;
  block[6] = v17;
  block[7] = &v24;
  block[8] = &v18;
  dispatch_sync(serializeQueue, block);
  atomic_store(0, (unsigned __int8 *)&self->_serializing);
  v10 = (void *)v19[5];
  if (v10)
  {
    if (a5)
      *a5 = v10;
    if (!*((_BYTE *)v25 + 24) && *a5)
      v11 = *a5;
  }
  else
  {
    LOBYTE(v6) = *((_BYTE *)v25 + 24) != 0;
  }
  objc_autoreleasePoolPop(v8);
  if (v10)
  {
    if (a5 && *a5)
      v13 = *a5;
    LOBYTE(v6) = *((_BYTE *)v25 + 24) != 0;
  }
LABEL_24:
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6 & 1;
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (self->_isLegacy)
    return -[_MTLBinaryArchive legacySerializeToURL:options:error:](self, "legacySerializeToURL:options:error:", a3, a4, a5);
  else
    return -[_MTLBinaryArchive airntSerializeToURL:options:error:](self, "airntSerializeToURL:options:error:", a3, a4, a5);
}

- (void)setMTLLinkedFunctions:(id)a3 LFS:(const LinkedFunctions *)a4 obj:(void *)a5 destinationArchive:(id)a6 error:(id *)a7
{
  uint64_t v7;
  uint64_t v8;
  const LinkedFunctions *v9;
  uint64_t v10;
  const LinkedFunctions *v11;
  uint64_t v12;
  uint64_t v13;
  const LinkedFunctions *v14;
  int v15;
  void **v16;
  uint64_t v17;
  char *p_p;
  char *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v25;
  char *v26;
  int v27;
  unint64_t v28;
  void **v29;
  char *v30;
  const LinkedFunctions *v31;
  uint64_t v32;
  uint64_t v33;
  const LinkedFunctions *v34;
  int v35;
  void **v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t v45;
  char *v46;
  int v47;
  unint64_t v48;
  void **v49;
  char *v50;
  const LinkedFunctions *v51;
  uint64_t v52;
  const LinkedFunctions *v53;
  uint64_t v54;
  const LinkedFunctions *v55;
  unsigned int v56;
  const LinkedFunctions *v57;
  const LinkedFunctions *v58;
  unsigned int v59;
  const LinkedFunctions *v60;
  uint64_t v61;
  uint64_t v62;
  const LinkedFunctions *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int *v66;
  int v67;
  void **v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  void *v73;
  char *v74;
  uint64_t v77;
  char *v78;
  int v79;
  unint64_t v80;
  void **v81;
  char *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  unint64_t v87;
  id v88;
  unsigned __int8 *v89;
  unsigned __int8 *v90;
  unsigned __int8 *v91;
  _QWORD *v92;
  uint64_t v93;
  unsigned int *v95;
  const LinkedFunctions *v99;
  const LinkedFunctions *v100;
  const LinkedFunctions *v101;
  unsigned int *var0;
  unsigned int *v104;
  unsigned int *v105;
  __int128 v106;
  void *__p;
  uint64_t v108;
  unsigned __int8 v109;
  _OWORD v110[2];
  int v111;
  _OWORD v112[2];
  int v113;
  _QWORD v114[4];
  int v115;

  if (a4)
  {
    memset(v114, 0, sizeof(v114));
    v115 = 1065353216;
    memset(v112, 0, sizeof(v112));
    v113 = 1065353216;
    memset(v110, 0, sizeof(v110));
    v111 = 1065353216;
    v7 = *(int *)a4->var0;
    v8 = -v7;
    v9 = &a4[-v7];
    if (*(unsigned __int16 *)v9->var0 >= 5u)
    {
      v10 = *(unsigned __int16 *)v9[4].var0;
      if (v10)
      {
        v11 = &a4[v10];
        v12 = *(unsigned int *)v11->var0;
        v14 = &v11[v12 + 4];
        v13 = *(unsigned int *)v11[v12].var0;
        if ((_DWORD)v13)
        {
          v99 = a4;
          var0 = (unsigned int *)v14[4 * v13].var0;
          do
          {
            std::string::basic_string[abi:ne180100](&__p, (void *)&v14[*(unsigned int *)v14->var0 + 4], *(unsigned int *)v14[*(unsigned int *)v14->var0].var0);
            v15 = (char)v109;
            v16 = (void **)__p;
            if ((v109 & 0x80u) == 0)
              v17 = v109;
            else
              v17 = v108;
            if ((v109 & 0x80u) == 0)
              p_p = (char *)&__p;
            else
              p_p = (char *)__p;
            if (v17 >= 18)
            {
              v19 = &p_p[v17];
              v20 = v17;
              v21 = p_p;
              do
              {
                v22 = (char *)memchr(v21, 95, v20 - 17);
                if (!v22)
                  break;
                if (*(_QWORD *)v22 == 0x65725F7269615F5FLL
                  && *((_QWORD *)v22 + 1) == 0x5F5F6465766C6F73
                  && *((_WORD *)v22 + 8) == 14906)
                {
                  if (v22 != v19 && v22 == p_p)
                  {
                    v25 = 0;
                    v26 = p_p - 1;
                    while (v17 != v25)
                    {
                      v27 = v26[v17];
                      ++v25;
                      --v26;
                      if (v27 == 95)
                      {
                        v28 = v17 - v25 - 18;
                        v29 = &__p;
                        if (v15 < 0)
                          v29 = v16;
                        v30 = (char *)v29 + 18;
                        if (v17 - 18 < v28)
                          v28 = v17 - 18;
                        if (v17 + 1 != v25)
                        {
                          p_p = v30;
                          v17 = v28;
                        }
                        break;
                      }
                    }
                    MEMORY[0x186DABE3C](&__p, p_p, v17);
                  }
                  break;
                }
                v21 = v22 + 1;
                v20 = v19 - (_BYTE *)v21;
              }
              while (v19 - (_BYTE *)v21 >= 18);
            }
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v114, (unsigned __int8 *)&__p, (uint64_t)&__p);
            if ((char)v109 < 0)
              operator delete(__p);
            v14 += 4;
          }
          while (v14 != (const LinkedFunctions *)var0);
          a4 = v99;
          v8 = -(uint64_t)*(int *)v99->var0;
        }
      }
    }
    if (*(unsigned __int16 *)a4[v8].var0 >= 7u)
    {
      if (*(_WORD *)a4[v8 + 6].var0)
      {
        v31 = &a4[*(unsigned __int16 *)a4[v8 + 6].var0];
        v32 = *(unsigned int *)v31->var0;
        v34 = &v31[v32 + 4];
        v33 = *(unsigned int *)v31[v32].var0;
        if ((_DWORD)v33)
        {
          v100 = a4;
          v104 = (unsigned int *)v34[4 * v33].var0;
          do
          {
            std::string::basic_string[abi:ne180100](&__p, (void *)&v34[*(unsigned int *)v34->var0 + 4], *(unsigned int *)v34[*(unsigned int *)v34->var0].var0);
            v35 = (char)v109;
            v36 = (void **)__p;
            if ((v109 & 0x80u) == 0)
              v37 = v109;
            else
              v37 = v108;
            if ((v109 & 0x80u) == 0)
              v38 = (char *)&__p;
            else
              v38 = (char *)__p;
            if (v37 >= 18)
            {
              v39 = &v38[v37];
              v40 = v37;
              v41 = v38;
              do
              {
                v42 = (char *)memchr(v41, 95, v40 - 17);
                if (!v42)
                  break;
                if (*(_QWORD *)v42 == 0x65725F7269615F5FLL
                  && *((_QWORD *)v42 + 1) == 0x5F5F6465766C6F73
                  && *((_WORD *)v42 + 8) == 14906)
                {
                  if (v42 != v39 && v42 == v38)
                  {
                    v45 = 0;
                    v46 = v38 - 1;
                    while (v37 != v45)
                    {
                      v47 = v46[v37];
                      ++v45;
                      --v46;
                      if (v47 == 95)
                      {
                        v48 = v37 - v45 - 18;
                        v49 = &__p;
                        if (v35 < 0)
                          v49 = v36;
                        v50 = (char *)v49 + 18;
                        if (v37 - 18 < v48)
                          v48 = v37 - 18;
                        if (v37 + 1 != v45)
                        {
                          v38 = v50;
                          v37 = v48;
                        }
                        break;
                      }
                    }
                    MEMORY[0x186DABE3C](&__p, v38, v37);
                  }
                  break;
                }
                v41 = v42 + 1;
                v40 = v39 - (_BYTE *)v41;
              }
              while (v39 - (_BYTE *)v41 >= 18);
            }
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v112, (unsigned __int8 *)&__p, (uint64_t)&__p);
            if ((char)v109 < 0)
              operator delete(__p);
            v34 += 4;
          }
          while (v34 != (const LinkedFunctions *)v104);
          a4 = v100;
          v8 = -(uint64_t)*(int *)v100->var0;
        }
      }
    }
    v51 = &a4[v8];
    if (*(unsigned __int16 *)v51->var0 >= 9u)
    {
      v52 = *(unsigned __int16 *)v51[8].var0;
      if (v52)
      {
        v53 = &a4[v52 + *(unsigned int *)a4[v52].var0];
        v56 = *(_DWORD *)v53->var0;
        v55 = v53 + 4;
        v54 = v56;
        if (v56)
        {
          v95 = (unsigned int *)v55[4 * v54].var0;
          do
          {
            v101 = v55;
            v57 = &v55[*(unsigned int *)v55->var0];
            v58 = &v57[-*(int *)v57->var0];
            v59 = *(unsigned __int16 *)v58->var0;
            v60 = &v57[*(unsigned __int16 *)v58[4].var0 + *(unsigned int *)v57[*(unsigned __int16 *)v58[4].var0].var0];
            v61 = *(unsigned int *)v60->var0;
            *(_QWORD *)&v106 = v60 + 4;
            *((_QWORD *)&v106 + 1) = v61;
            if (v59 >= 7)
            {
              v62 = *(unsigned __int16 *)v58[6].var0;
              if (v62)
              {
                v63 = &v57[v62];
                v64 = *(unsigned int *)v63->var0;
                v66 = (unsigned int *)v63[v64 + 4].var0;
                v65 = *(unsigned int *)v63[v64].var0;
                if ((_DWORD)v65)
                {
                  v105 = &v66[v65];
                  do
                  {
                    std::string::basic_string[abi:ne180100](&__p, (char *)v66 + *v66 + 4, *(unsigned int *)((char *)v66 + *v66));
                    v67 = (char)v109;
                    v68 = (void **)__p;
                    if ((v109 & 0x80u) == 0)
                      v69 = v109;
                    else
                      v69 = v108;
                    if ((v109 & 0x80u) == 0)
                      v70 = (char *)&__p;
                    else
                      v70 = (char *)__p;
                    if (v69 >= 18)
                    {
                      v71 = &v70[v69];
                      v72 = v69;
                      v73 = v70;
                      do
                      {
                        v74 = (char *)memchr(v73, 95, v72 - 17);
                        if (!v74)
                          break;
                        if (*(_QWORD *)v74 == 0x65725F7269615F5FLL
                          && *((_QWORD *)v74 + 1) == 0x5F5F6465766C6F73
                          && *((_WORD *)v74 + 8) == 14906)
                        {
                          if (v74 != v71 && v74 == v70)
                          {
                            v77 = 0;
                            v78 = v70 - 1;
                            while (v69 != v77)
                            {
                              v79 = v78[v69];
                              ++v77;
                              --v78;
                              if (v79 == 95)
                              {
                                v80 = v69 - v77 - 18;
                                v81 = &__p;
                                if (v67 < 0)
                                  v81 = v68;
                                v82 = (char *)v81 + 18;
                                if (v69 - 18 < v80)
                                  v80 = v69 - 18;
                                if (v69 + 1 != v77)
                                {
                                  v70 = v82;
                                  v69 = v80;
                                }
                                break;
                              }
                            }
                            MEMORY[0x186DABE3C](&__p, v70, v69);
                          }
                          break;
                        }
                        v73 = v74 + 1;
                        v72 = v71 - (_BYTE *)v73;
                      }
                      while (v71 - (_BYTE *)v73 >= 18);
                    }
                    std::__hash_table<std::__hash_value_type<std::string,std::string_view>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string_view>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string_view>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string_view>>>::__emplace_multi<std::string&,std::string_view&>(v110, (uint64_t)&__p, &v106);
                    if ((char)v109 < 0)
                      operator delete(__p);
                    ++v66;
                  }
                  while (v66 != v105);
                }
              }
            }
            v55 = v101 + 4;
          }
          while (&v101[4] != (const LinkedFunctions *)v95);
        }
      }
    }
    v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v86 = *(_QWORD *)a5;
    if (*((_QWORD *)a5 + 1) - *(_QWORD *)a5 >= 9uLL)
    {
      v87 = 1;
      do
      {
        if (*(_BYTE *)(*(_QWORD *)(v86 + 8 * v87) + 32))
          break;
        v88 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:index:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:index:destinationArchive:error:", a5, v87, a6, a7);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend((id)objc_msgSend(v88, "name"), "UTF8String"));
        if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v114, (unsigned __int8 *)&__p))
        {
          objc_msgSend(v83, "addObject:", v88);
        }
        if (std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v112, (unsigned __int8 *)&__p))
        {
          objc_msgSend(v84, "addObject:", v88);
        }
        v89 = std::__hash_table<std::__hash_value_type<std::string,std::string_view>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string_view>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string_view>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string_view>>>::__equal_range_multi<std::string>(v110, (unsigned __int8 *)&__p);
        v91 = v90;
        while (v89 != v91)
        {
          v92 = v89 + 16;
          if ((char)v89[39] < 0)
            v92 = (_QWORD *)*v92;
          v93 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:", v92);
          if (!objc_msgSend(v85, "objectForKeyedSubscript:", v93))
            objc_msgSend(v85, "setObject:forKeyedSubscript:", objc_alloc_init(MEMORY[0x1E0C99DE8]), v93);
          objc_msgSend((id)objc_msgSend(v85, "objectForKeyedSubscript:", v93), "addObject:", v88);
          v89 = *(unsigned __int8 **)v89;
        }
        if ((char)v109 < 0)
          operator delete(__p);
        ++v87;
        v86 = *(_QWORD *)a5;
      }
      while (v87 < (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 3);
    }
    objc_msgSend(a3, "setFunctions:", v83);
    objc_msgSend(a3, "setPrivateFunctions:", v84);
    objc_msgSend(a3, "setGroups:", v85);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v110);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v112);
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)v114);
  }
}

- (id)newComputePipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  int *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  int *v13;
  void *v14;
  void *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  _BOOL8 v24;
  unsigned __int16 *v25;
  uint64_t v26;
  _BOOL8 v27;
  unsigned __int16 *v28;
  uint64_t v29;
  _BOOL8 v30;
  unsigned __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int16 *v39;
  uint64_t v40;
  _DWORD *v41;
  unsigned int *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int16 *v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  unsigned __int16 *v52;
  uint64_t v53;
  char *v54;
  unsigned __int16 *v55;
  unsigned int v56;
  _DWORD *v57;
  uint64_t v58;
  _DWORD *v59;
  uint64_t v60;
  unint64_t v61;
  _DWORD *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  _DWORD *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;

  v10 = (int *)Air::PipelineScript::pipeline_as_compute((Air::PipelineScript *)a3);
  v11 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v11 >= 7u && (v12 = v11[3]) != 0)
    v13 = (int *)((char *)v10 + v12 + *(unsigned int *)((char *)v10 + v12));
  else
    v13 = 0;
  v14 = (void *)objc_opt_new();
  v15 = v14;
  v16 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v16 >= 9u && (v17 = v16[4]) != 0)
    v18 = *(_QWORD *)((char *)v13 + v17);
  else
    v18 = 1;
  objc_msgSend(v14, "setMaxCallStackDepth:", v18);
  v19 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v19 >= 7u && (v20 = v19[3]) != 0)
    v21 = *(_QWORD *)((char *)v13 + v20);
  else
    v21 = 0;
  objc_msgSend(v15, "setMaxTotalThreadsPerThreadgroup:", v21);
  v22 = (unsigned __int16 *)((char *)v13 - *v13);
  v24 = *v22 >= 0x15u && (v23 = v22[10]) != 0 && *((unsigned __int8 *)v13 + v23) != 0;
  objc_msgSend(v15, "setNeedsCustomBorderColorSamplers:", v24);
  v25 = (unsigned __int16 *)((char *)v13 - *v13);
  v27 = *v25 >= 0x11u && (v26 = v25[8]) != 0 && *((unsigned __int8 *)v13 + v26) != 0;
  objc_msgSend(v15, "setSupportAddingBinaryFunctions:", v27);
  v28 = (unsigned __int16 *)((char *)v13 - *v13);
  v30 = *v28 >= 0xFu && (v29 = v28[7]) != 0 && *((unsigned __int8 *)v13 + v29) != 0;
  objc_msgSend(v15, "setSupportIndirectCommandBuffers:", v30);
  v31 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v31 >= 0x13u && (v32 = v31[9]) != 0)
    v33 = *((unsigned __int8 *)v13 + v32);
  else
    v33 = 0;
  objc_msgSend(v15, "setTextureWriteRoundingMode:", v33);
  v34 = (unsigned __int16 *)((char *)v13 - *v13);
  v36 = *v34 >= 5u && (v35 = v34[2]) != 0 && *((unsigned __int8 *)v13 + v35) != 0;
  objc_msgSend(v15, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", v36);
  v37 = *v13;
  v38 = -v37;
  v39 = (unsigned __int16 *)((char *)v13 - v37);
  if (*v39 >= 0xDu)
  {
    v40 = v39[6];
    if (v40)
    {
      v41 = (int *)((char *)v13 + v40 + *(unsigned int *)((char *)v13 + v40));
      v42 = v41 + 1;
      if (*v41)
      {
        v43 = 0;
        do
        {
          v44 = *v42;
          v45 = v44 - *(int *)((char *)v42 + v44);
          if (*(unsigned __int16 *)((char *)v42 + v45) >= 5u
            && (v46 = *(unsigned __int16 *)((char *)v42 + v45 + 4)) != 0)
          {
            v47 = *((unsigned __int8 *)v42 + v44 + v46);
          }
          else
          {
            v47 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "buffers"), "objectAtIndexedSubscript:", v43++), "setMutability:", v47);
          ++v42;
        }
        while (v43 < *v41);
      }
      v38 = -(uint64_t)*v13;
    }
  }
  v48 = (unsigned __int16 *)((char *)v13 + v38);
  if (*v48 >= 0xBu && (v49 = v48[5]) != 0)
    v50 = (int *)((char *)v13 + v49 + *(unsigned int *)((char *)v13 + v49));
  else
    v50 = 0;
  v51 = objc_msgSend(v15, "linkedFunctions");
  v52 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v52 >= 0x17u && (v53 = v52[11]) != 0)
    v54 = (char *)v13 + v53 + *(unsigned int *)((char *)v13 + v53);
  else
    v54 = 0;
  -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v51, v54, a4, a5, a6);
  if (v50)
  {
    v55 = (unsigned __int16 *)((char *)v50 - *v50);
    v56 = *v55;
    if (v56 >= 5)
    {
      if (v55[2])
        v57 = (int *)((char *)v50 + v55[2] + *(unsigned int *)((char *)v50 + v55[2]));
      else
        v57 = 0;
      if (v56 >= 7 && (v58 = v55[3]) != 0)
      {
        v59 = (int *)((char *)v50 + v58 + *(unsigned int *)((char *)v50 + v58));
        if (!v57)
          goto LABEL_76;
      }
      else
      {
        v59 = 0;
        if (!v57)
        {
LABEL_76:
          if (v59 && *v59)
          {
            v75 = 0;
            v76 = 0;
            do
            {
              v77 = &v59[v75];
              v78 = v59[v75 + 1];
              v79 = (char *)&v59[v75] + v78 - *(int *)((char *)&v59[v75 + 1] + v78);
              if (*((unsigned __int16 *)v79 + 2) >= 5u && (v80 = *((unsigned __int16 *)v79 + 4)) != 0)
                v81 = *((unsigned __int8 *)&v59[v75 + 1] + v78 + v80);
              else
                v81 = 1;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76), "setStepFunction:", v81);
              v82 = v77[1];
              v83 = v82 - *(int *)((char *)v77 + v82 + 4);
              if (*(unsigned __int16 *)((char *)v77 + v83 + 4) >= 7u
                && (v84 = *(unsigned __int16 *)((char *)&v59[v75 + 2] + v83 + 2)) != 0)
              {
                v85 = *(_QWORD *)((char *)&v59[v75 + 1] + v82 + v84);
              }
              else
              {
                v85 = 1;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76), "setStepRate:", v85);
              v86 = v77[1];
              v87 = (char *)&v59[v75] + v86 - *(int *)((char *)&v59[v75 + 1] + v86);
              if (*((unsigned __int16 *)v87 + 2) >= 9u && (v88 = *((unsigned __int16 *)v87 + 6)) != 0)
                v89 = *(_QWORD *)((char *)&v59[v75 + 1] + v86 + v88);
              else
                v89 = 0;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "layouts"), "objectAtIndexedSubscript:", v76++), "setStride:", v89);
              ++v75;
            }
            while (v76 < *v59);
          }
          return v15;
        }
      }
      if (*v57)
      {
        v60 = 0;
        v61 = 0;
        do
        {
          v62 = &v57[v60];
          v63 = v57[v60 + 1];
          v64 = (char *)&v57[v60] + v63 - *(int *)((char *)&v57[v60 + 1] + v63);
          if (*((unsigned __int16 *)v64 + 2) >= 9u && (v65 = *((unsigned __int16 *)v64 + 6)) != 0)
            v66 = *(unsigned int *)((char *)&v57[v60 + 1] + v63 + v65);
          else
            v66 = 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61), "setBufferIndex:", v66);
          v67 = v62[1];
          v68 = v67 - *(int *)((char *)v62 + v67 + 4);
          if (*(unsigned __int16 *)((char *)v62 + v68 + 4) >= 7u
            && (v69 = *(unsigned __int16 *)((char *)&v57[v60 + 2] + v68 + 2)) != 0)
          {
            v70 = *(_QWORD *)((char *)&v57[v60 + 1] + v67 + v69);
          }
          else
          {
            v70 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61), "setOffset:", v70);
          v71 = v62[1];
          v72 = (char *)&v57[v60] + v71 - *(int *)((char *)&v57[v60 + 1] + v71);
          if (*((unsigned __int16 *)v72 + 2) >= 5u && (v73 = *((unsigned __int16 *)v72 + 4)) != 0)
            v74 = *((unsigned __int8 *)&v57[v60 + 1] + v71 + v73);
          else
            v74 = 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "stageInputDescriptor"), "attributes"), "objectAtIndexedSubscript:", v61++), "setFormat:", v74);
          ++v60;
        }
        while (v61 < *v57);
      }
      goto LABEL_76;
    }
  }
  return v15;
}

- (id)newRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  void *v8;
  int *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  int *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  _BOOL8 v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  _BOOL8 v36;
  unsigned __int16 *v37;
  uint64_t v38;
  _BOOL8 v39;
  unsigned __int16 *v40;
  uint64_t v41;
  _BOOL8 v42;
  unsigned __int16 *v43;
  uint64_t v44;
  _BOOL8 v45;
  unsigned __int16 *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int16 *v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int16 *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int16 *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int16 *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned __int16 *v69;
  uint64_t v70;
  _DWORD *v71;
  unsigned int *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned __int16 *v78;
  uint64_t v79;
  int *v80;
  unsigned __int16 *v81;
  unsigned int v82;
  _DWORD *v83;
  uint64_t v84;
  _DWORD *v85;
  uint64_t v86;
  unint64_t v87;
  _DWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  _DWORD *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unsigned __int16 *v117;
  uint64_t v118;
  char *v119;
  int *v120;
  unsigned __int16 *v121;
  uint64_t v122;
  int *v123;
  unsigned __int16 *v124;
  uint64_t v125;
  _BOOL8 v126;
  unsigned __int16 *v127;
  uint64_t v128;
  uint64_t v129;
  unsigned __int16 *v130;
  uint64_t v131;
  _BOOL8 v132;
  unsigned __int16 *v133;
  uint64_t v134;
  _BOOL8 v135;
  unsigned __int16 *v136;
  uint64_t v137;
  uint64_t v138;
  unsigned __int16 *v139;
  uint64_t v140;
  uint64_t v141;
  unsigned __int16 *v142;
  uint64_t v143;
  uint64_t v144;
  unsigned __int16 *v145;
  uint64_t v146;
  _BOOL8 v147;
  unsigned __int16 *v148;
  uint64_t v149;
  uint64_t v150;
  unsigned __int16 *v151;
  uint64_t v152;
  _BOOL8 v153;
  unsigned __int16 *v154;
  uint64_t v155;
  uint64_t v156;
  unsigned __int16 *v157;
  uint64_t v158;
  _BOOL8 v159;
  unsigned __int16 *v160;
  uint64_t v161;
  _BOOL8 v162;
  unsigned __int16 *v163;
  uint64_t v164;
  _BOOL8 v165;
  unsigned __int16 *v166;
  uint64_t v167;
  uint64_t v168;
  unsigned __int16 *v169;
  double v170;
  uint64_t v171;
  unsigned __int16 *v172;
  uint64_t v173;
  _BOOL8 v174;
  unsigned __int16 *v175;
  uint64_t v176;
  uint64_t v177;
  unsigned __int16 *v178;
  uint64_t v179;
  uint64_t v180;
  unsigned __int16 *v181;
  uint64_t v182;
  _BOOL8 v183;
  unsigned __int16 *v184;
  unsigned int v185;
  _DWORD *v186;
  uint64_t v187;
  _DWORD *v188;
  unsigned int *v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  _DWORD *v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  _BOOL8 v205;
  uint64_t v206;
  _DWORD *v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  _DWORD *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _DWORD *v225;
  char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  unsigned __int16 *v234;
  uint64_t v235;
  char *v236;

  v8 = (void *)objc_opt_new();
  v9 = (int *)Air::PipelineScript::pipeline_as_render((Air::PipelineScript *)a3);
  v10 = (unsigned __int16 *)((char *)v9 - *v9);
  if (*v10 >= 9u && (v11 = v10[4]) != 0)
    v12 = (int *)((char *)v9 + v11 + *(unsigned int *)((char *)v9 + v11));
  else
    v12 = 0;
  v13 = (unsigned __int16 *)((char *)v12 - *v12);
  v15 = *v13 < 9u || (v14 = v13[4]) == 0 || *((unsigned __int8 *)v12 + v14) != 0;
  objc_msgSend(v8, "setRasterizationEnabled:", v15);
  v16 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v16 >= 0x27u && (v17 = v16[19]) != 0)
    v18 = *((unsigned __int8 *)v12 + v17);
  else
    v18 = 255;
  objc_msgSend(v8, "setClipDistanceEnableMask:", v18);
  v19 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v19 >= 0x29u && (v20 = v19[20]) != 0)
    v21 = *(unsigned int *)((char *)v12 + v20);
  else
    v21 = 0;
  objc_msgSend(v8, "setVertexDepthCompareClampMask:", v21);
  v22 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v22 >= 5u && (v23 = v22[2]) != 0)
    v24 = *(_QWORD *)((char *)v12 + v23);
  else
    v24 = 1;
  objc_msgSend(v8, "setMaxVertexCallStackDepth:", v24);
  v25 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v25 >= 0xDu && (v26 = v25[6]) != 0)
    v27 = *(_QWORD *)((char *)v12 + v26);
  else
    v27 = 16;
  objc_msgSend(v8, "setMaxTessellationFactor:", v27);
  v28 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v28 >= 0x1Bu && (v29 = v28[13]) != 0)
    v30 = *(_QWORD *)((char *)v12 + v29);
  else
    v30 = 1;
  objc_msgSend(v8, "setMaxVertexAmplificationCount:", v30);
  v31 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v31 >= 0x1Du && (v32 = v31[14]) != 0)
    v33 = *((unsigned __int8 *)v12 + v32);
  else
    v33 = 0;
  objc_msgSend(v8, "setVertexAmplificationMode:", v33);
  v34 = (unsigned __int16 *)((char *)v12 - *v12);
  v36 = *v34 >= 0x2Bu && (v35 = v34[21]) != 0 && *((unsigned __int8 *)v12 + v35) != 0;
  objc_msgSend(v8, "setNeedsCustomBorderColorSamplers:", v36);
  v37 = (unsigned __int16 *)((char *)v12 - *v12);
  v39 = *v37 >= 0x23u && (v38 = v37[17]) != 0 && *((unsigned __int8 *)v12 + v38) != 0;
  objc_msgSend(v8, "setSupportAddingVertexBinaryFunctions:", v39);
  v40 = (unsigned __int16 *)((char *)v12 - *v12);
  v42 = *v40 >= 0x21u && (v41 = v40[16]) != 0 && *((unsigned __int8 *)v12 + v41) != 0;
  objc_msgSend(v8, "setSupportIndirectCommandBuffers:", v42);
  v43 = (unsigned __int16 *)((char *)v12 - *v12);
  v45 = *v43 >= 0xFu && (v44 = v43[7]) != 0 && *((unsigned __int8 *)v12 + v44) != 0;
  objc_msgSend(v8, "setTessellationFactorScaleEnabled:", v45);
  v46 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v46 >= 0x13u && (v47 = v46[9]) != 0)
    v48 = *((unsigned __int8 *)v12 + v47);
  else
    v48 = 0;
  objc_msgSend(v8, "setTessellationControlPointIndexType:", v48);
  v49 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v49 >= 0x11u && (v50 = v49[8]) != 0)
    v51 = *((unsigned __int8 *)v12 + v50);
  else
    v51 = 0;
  objc_msgSend(v8, "setTessellationFactorFormat:", v51);
  v52 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v52 >= 0x19u && (v53 = v52[12]) != 0)
    v54 = *((unsigned __int8 *)v12 + v53);
  else
    v54 = 0;
  objc_msgSend(v8, "setTessellationPartitionMode:", v54);
  v55 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v55 >= 0x15u && (v56 = v55[10]) != 0)
    v57 = *((unsigned __int8 *)v12 + v56);
  else
    v57 = 0;
  objc_msgSend(v8, "setTessellationFactorStepFunction:", v57);
  v58 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v58 >= 0x17u && (v59 = v58[11]) != 0)
    v60 = *((unsigned __int8 *)v12 + v59);
  else
    v60 = 0;
  objc_msgSend(v8, "setTessellationOutputWindingOrder:", v60);
  v61 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v61 >= 0xBu && (v62 = v61[5]) != 0)
    v63 = *((unsigned __int8 *)v12 + v62);
  else
    v63 = 0;
  objc_msgSend(v8, "setInputPrimitiveTopology:", v63);
  v64 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v64 >= 0x25u && (v65 = v64[18]) != 0)
    v66 = *((unsigned __int8 *)v12 + v65);
  else
    v66 = 0;
  objc_msgSend(v8, "setTextureWriteRoundingMode:", v66);
  v67 = *v12;
  v68 = -v67;
  v69 = (unsigned __int16 *)((char *)v12 - v67);
  if (*v69 >= 0x1Fu)
  {
    v70 = v69[15];
    if (v70)
    {
      v71 = (int *)((char *)v12 + v70 + *(unsigned int *)((char *)v12 + v70));
      v72 = v71 + 1;
      if (*v71)
      {
        v73 = 0;
        do
        {
          v74 = *v72;
          v75 = v74 - *(int *)((char *)v72 + v74);
          if (*(unsigned __int16 *)((char *)v72 + v75) >= 5u
            && (v76 = *(unsigned __int16 *)((char *)v72 + v75 + 4)) != 0)
          {
            v77 = *((unsigned __int8 *)v72 + v74 + v76);
          }
          else
          {
            v77 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexBuffers"), "objectAtIndexedSubscript:", v73++), "setMutability:", v77);
          ++v72;
        }
        while (v73 < *v71);
      }
      v68 = -(uint64_t)*v12;
    }
  }
  v78 = (unsigned __int16 *)((char *)v12 + v68);
  if (*v78 >= 7u)
  {
    v79 = v78[3];
    if (v79)
    {
      v80 = (int *)((char *)v12 + v79 + *(unsigned int *)((char *)v12 + v79));
      v81 = (unsigned __int16 *)((char *)v80 - *v80);
      v82 = *v81;
      if (v82 > 4)
      {
        if (v81[2])
          v83 = (int *)((char *)v80 + v81[2] + *(unsigned int *)((char *)v80 + v81[2]));
        else
          v83 = 0;
        if (v82 >= 7 && (v84 = v81[3]) != 0)
          v85 = (int *)((char *)v80 + v84 + *(unsigned int *)((char *)v80 + v84));
        else
          v85 = 0;
        if (v83 && *v83)
        {
          v86 = 0;
          v87 = 0;
          do
          {
            v88 = &v83[v86];
            v89 = v83[v86 + 1];
            v90 = (char *)&v83[v86] + v89 - *(int *)((char *)&v83[v86 + 1] + v89);
            if (*((unsigned __int16 *)v90 + 2) >= 9u && (v91 = *((unsigned __int16 *)v90 + 6)) != 0)
              v92 = *(unsigned int *)((char *)&v83[v86 + 1] + v89 + v91);
            else
              v92 = 0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87), "setBufferIndex:", v92);
            v93 = v88[1];
            v94 = v93 - *(int *)((char *)v88 + v93 + 4);
            if (*(unsigned __int16 *)((char *)v88 + v94 + 4) >= 7u
              && (v95 = *(unsigned __int16 *)((char *)&v83[v86 + 2] + v94 + 2)) != 0)
            {
              v96 = *(_QWORD *)((char *)&v83[v86 + 1] + v93 + v95);
            }
            else
            {
              v96 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87), "setOffset:", v96);
            v97 = v88[1];
            v98 = (char *)&v83[v86] + v97 - *(int *)((char *)&v83[v86 + 1] + v97);
            if (*((unsigned __int16 *)v98 + 2) >= 5u && (v99 = *((unsigned __int16 *)v98 + 4)) != 0)
              v100 = *((unsigned __int8 *)&v83[v86 + 1] + v97 + v99);
            else
              v100 = 0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v87++), "setFormat:", v100);
            ++v86;
          }
          while (v87 < *v83);
        }
        if (v85 && *v85)
        {
          v101 = 0;
          v102 = 0;
          do
          {
            v103 = &v85[v101];
            v104 = v85[v101 + 1];
            v105 = (char *)&v85[v101] + v104 - *(int *)((char *)&v85[v101 + 1] + v104);
            if (*((unsigned __int16 *)v105 + 2) >= 5u && (v106 = *((unsigned __int16 *)v105 + 4)) != 0)
              v107 = *((unsigned __int8 *)&v85[v101 + 1] + v104 + v106);
            else
              v107 = 1;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102), "setStepFunction:", v107);
            v108 = v103[1];
            v109 = v108 - *(int *)((char *)v103 + v108 + 4);
            if (*(unsigned __int16 *)((char *)v103 + v109 + 4) >= 7u
              && (v110 = *(unsigned __int16 *)((char *)&v85[v101 + 2] + v109 + 2)) != 0)
            {
              v111 = *(_QWORD *)((char *)&v85[v101 + 1] + v108 + v110);
            }
            else
            {
              v111 = 1;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102), "setStepRate:", v111);
            v112 = v103[1];
            v113 = (char *)&v85[v101] + v112 - *(int *)((char *)&v85[v101 + 1] + v112);
            if (*((unsigned __int16 *)v113 + 2) >= 9u && (v114 = *((unsigned __int16 *)v113 + 6)) != 0)
              v115 = *(_QWORD *)((char *)&v85[v101 + 1] + v112 + v114);
            else
              v115 = 0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "vertexDescriptor"), "layouts"), "objectAtIndexedSubscript:", v102++), "setStride:", v115);
            ++v101;
          }
          while (v102 < *v85);
        }
      }
    }
  }
  v116 = objc_msgSend(v8, "vertexLinkedFunctions");
  v117 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v117 >= 0x2Du && (v118 = v117[22]) != 0)
    v119 = (char *)v12 + v118 + *(unsigned int *)((char *)v12 + v118);
  else
    v119 = 0;
  -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v116, v119, a4, a5, a6);
  v120 = (int *)Air::PipelineScript::pipeline_as_render((Air::PipelineScript *)a3);
  v121 = (unsigned __int16 *)((char *)v120 - *v120);
  if (*v121 >= 0xBu && (v122 = v121[5]) != 0)
    v123 = (int *)((char *)v120 + v122 + *(unsigned int *)((char *)v120 + v122));
  else
    v123 = 0;
  v124 = (unsigned __int16 *)((char *)v123 - *v123);
  v126 = *v124 >= 0x29u && (v125 = v124[20]) != 0 && *((unsigned __int8 *)v123 + v125) != 0;
  objc_msgSend(v8, "setAlphaTestEnabled:", v126);
  v127 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v127 >= 0x2Bu && (v128 = v127[21]) != 0)
    v129 = *((unsigned __int8 *)v123 + v128);
  else
    v129 = 0;
  objc_msgSend(v8, "setAlphaTestFunction:", v129);
  v130 = (unsigned __int16 *)((char *)v123 - *v123);
  v132 = *v130 >= 9u && (v131 = v130[4]) != 0 && *((unsigned __int8 *)v123 + v131) != 0;
  objc_msgSend(v8, "setAlphaToCoverageEnabled:", v132);
  v133 = (unsigned __int16 *)((char *)v123 - *v123);
  v135 = *v133 >= 0xBu && (v134 = v133[5]) != 0 && *((unsigned __int8 *)v123 + v134) != 0;
  objc_msgSend(v8, "setAlphaToOneEnabled:", v135);
  v136 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v136 >= 0xFu && (v137 = v136[7]) != 0)
    v138 = *(_QWORD *)((char *)v123 + v137);
  else
    v138 = 0;
  objc_msgSend(v8, "setColorSampleCount:", v138);
  v139 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v139 >= 0x19u && (v140 = v139[12]) != 0)
    v141 = *(unsigned __int16 *)((char *)v123 + v140);
  else
    v141 = 0;
  objc_msgSend(v8, "setDepthAttachmentPixelFormat:", v141);
  v142 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v142 >= 0x35u && (v143 = v142[26]) != 0)
    v144 = *(unsigned int *)((char *)v123 + v143);
  else
    v144 = 0;
  objc_msgSend(v8, "setVertexDepthCompareClampMask:", v144);
  v145 = (unsigned __int16 *)((char *)v123 - *v123);
  v147 = *v145 >= 0x2Fu && (v146 = v145[23]) != 0 && *((unsigned __int8 *)v123 + v146) != 0;
  objc_msgSend(v8, "setDepthStencilWriteDisabled:", v147);
  v148 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v148 >= 0x27u && (v149 = v148[19]) != 0)
    v150 = *((unsigned __int8 *)v123 + v149);
  else
    v150 = 0;
  objc_msgSend(v8, "setLogicOperation:", v150);
  v151 = (unsigned __int16 *)((char *)v123 - *v123);
  v153 = *v151 >= 0x25u && (v152 = v151[18]) != 0 && *((unsigned __int8 *)v123 + v152) != 0;
  objc_msgSend(v8, "setLogicOperationEnabled:", v153);
  v154 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v154 >= 5u && (v155 = v154[2]) != 0)
    v156 = *(_QWORD *)((char *)v123 + v155);
  else
    v156 = 1;
  objc_msgSend(v8, "setMaxFragmentCallStackDepth:", v156);
  v157 = (unsigned __int16 *)((char *)v123 - *v123);
  v159 = *v157 >= 0x33u && (v158 = v157[25]) != 0 && *((unsigned __int8 *)v123 + v158) != 0;
  objc_msgSend(v8, "setNeedsCustomBorderColorSamplers:", v159);
  v160 = (unsigned __int16 *)((char *)v123 - *v123);
  v162 = *v160 >= 0x31u && (v161 = v160[24]) != 0 && *((unsigned __int8 *)v123 + v161) != 0;
  objc_msgSend(v8, "setOpenGLModeEnabled:", v162);
  v163 = (unsigned __int16 *)((char *)v123 - *v123);
  v165 = *v163 >= 0x2Du && (v164 = v163[22]) != 0 && *((unsigned __int8 *)v123 + v164) != 0;
  objc_msgSend(v8, "setPointSmoothEnabled:", v165);
  v166 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v166 >= 0xDu && (v167 = v166[6]) != 0)
    v168 = *(_QWORD *)((char *)v123 + v167);
  else
    v168 = 1;
  objc_msgSend(v8, "setRasterSampleCount:", v168);
  v169 = (unsigned __int16 *)((char *)v123 - *v123);
  LODWORD(v170) = 1.0;
  if (*v169 >= 0x13u)
  {
    v171 = v169[9];
    if (v171)
      LODWORD(v170) = *(int *)((char *)v123 + v171);
  }
  objc_msgSend(v8, "setSampleCoverage:", v170);
  v172 = (unsigned __int16 *)((char *)v123 - *v123);
  v174 = *v172 >= 0x15u && (v173 = v172[10]) != 0 && *((unsigned __int8 *)v123 + v173) != 0;
  objc_msgSend(v8, "setSampleCoverageInvert:", v174);
  v175 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v175 >= 0x11u && (v176 = v175[8]) != 0)
    v177 = *(_QWORD *)((char *)v123 + v176);
  else
    v177 = -1;
  objc_msgSend(v8, "setSampleMask:", v177);
  v178 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v178 >= 0x1Bu && (v179 = v178[13]) != 0)
    v180 = *(unsigned __int16 *)((char *)v123 + v179);
  else
    v180 = 0;
  objc_msgSend(v8, "setStencilAttachmentPixelFormat:", v180);
  v181 = (unsigned __int16 *)((char *)v123 - *v123);
  v183 = *v181 >= 0x21u && (v182 = v181[16]) != 0 && *((unsigned __int8 *)v123 + v182) != 0;
  objc_msgSend(v8, "setSupportAddingFragmentBinaryFunctions:", v183);
  v184 = (unsigned __int16 *)((char *)v123 - *v123);
  v185 = *v184;
  if (v185 >= 0x17)
  {
    if (v184[11])
      v186 = (int *)((char *)v123 + v184[11] + *(unsigned int *)((char *)v123 + v184[11]));
    else
      v186 = 0;
    if (v185 >= 0x1D)
    {
      v187 = v184[14];
      if (v187)
      {
        v188 = (int *)((char *)v123 + v187 + *(unsigned int *)((char *)v123 + v187));
        v189 = v188 + 1;
        if (*v188)
        {
          v190 = 0;
          do
          {
            v191 = *v189;
            v192 = v191 - *(int *)((char *)v189 + v191);
            if (*(unsigned __int16 *)((char *)v189 + v192) >= 5u
              && (v193 = *(unsigned __int16 *)((char *)v189 + v192 + 4)) != 0)
            {
              v194 = *((unsigned __int8 *)v189 + v191 + v193);
            }
            else
            {
              v194 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "fragmentBuffers"), "objectAtIndexedSubscript:", v190++), "setMutability:", v194);
            ++v189;
          }
          while (v190 < *v188);
        }
      }
    }
    if (v186 && *v186)
    {
      v195 = 0;
      v196 = 0;
      do
      {
        v197 = &v186[v195];
        v198 = v186[v195 + 1];
        v199 = (char *)&v186[v195] + v198 - *(int *)((char *)&v186[v195 + 1] + v198);
        if (*((unsigned __int16 *)v199 + 2) >= 0xBu && (v200 = *((unsigned __int16 *)v199 + 7)) != 0)
          v201 = *((unsigned __int8 *)&v186[v195 + 1] + v198 + v200);
        else
          v201 = 0;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setAlphaBlendOperation:", v201);
        v202 = v197[1];
        v203 = v202 - *(int *)((char *)v197 + v202 + 4);
        v205 = *(unsigned __int16 *)((char *)v197 + v203 + 4) >= 9u
            && (v204 = *(unsigned __int16 *)((char *)&v186[v195 + 3] + v203)) != 0
            && *((unsigned __int8 *)&v186[v195 + 1] + v202 + v204) != 0;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setBlendingEnabled:", v205);
        v206 = v197[1];
        v207 = &v186[v195];
        v208 = (char *)&v186[v195] + v206 - *(int *)((char *)&v186[v195 + 1] + v206);
        if (*((unsigned __int16 *)v208 + 2) >= 0xFu && (v209 = *((unsigned __int16 *)v208 + 9)) != 0)
          v210 = *((unsigned __int8 *)&v186[v195 + 1] + v206 + v209);
        else
          v210 = 0;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setDestinationAlphaBlendFactor:", v210);
        v211 = v197[1];
        v212 = v211 - *(int *)((char *)v207 + v211 + 4);
        if (*(unsigned __int16 *)((char *)v207 + v212 + 4) >= 0x11u
          && (v213 = *(unsigned __int16 *)((char *)&v186[v195 + 5] + v212)) != 0)
        {
          v214 = *((unsigned __int8 *)&v186[v195 + 1] + v211 + v213);
        }
        else
        {
          v214 = 0;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setDestinationRGBBlendFactor:", v214);
        v215 = v197[1];
        v216 = &v186[v195];
        v217 = (char *)&v186[v195] + v215 - *(int *)((char *)&v186[v195 + 1] + v215);
        if (*((unsigned __int16 *)v217 + 2) >= 5u && (v218 = *((unsigned __int16 *)v217 + 4)) != 0)
          v219 = *(unsigned __int16 *)((char *)&v186[v195 + 1] + v215 + v218);
        else
          v219 = 0;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setPixelFormat:", v219);
        v220 = v197[1];
        v221 = v220 - *(int *)((char *)v216 + v220 + 4);
        if (*(unsigned __int16 *)((char *)v216 + v221 + 4) >= 0x15u
          && (v222 = *(unsigned __int16 *)((char *)&v186[v195 + 6] + v221)) != 0)
        {
          v223 = *((unsigned __int8 *)&v186[v195 + 1] + v220 + v222);
        }
        else
        {
          v223 = 1;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setSourceRGBBlendFactor:", v223);
        v224 = v197[1];
        v225 = &v186[v195];
        v226 = (char *)&v186[v195] + v224 - *(int *)((char *)&v186[v195 + 1] + v224);
        if (*((unsigned __int16 *)v226 + 2) >= 0x13u && (v227 = *((unsigned __int16 *)v226 + 11)) != 0)
          v228 = *((unsigned __int8 *)&v186[v195 + 1] + v224 + v227);
        else
          v228 = 1;
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196), "setSourceAlphaBlendFactor:", v228);
        v229 = v197[1];
        v230 = v229 - *(int *)((char *)v225 + v229 + 4);
        if (*(unsigned __int16 *)((char *)v225 + v230 + 4) >= 7u
          && (v231 = *(unsigned __int16 *)((char *)&v186[v195 + 2] + v230 + 2)) != 0)
        {
          v232 = *((unsigned __int8 *)&v186[v195 + 1] + v229 + v231);
        }
        else
        {
          v232 = 15;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "colorAttachments"), "objectAtIndexedSubscript:", v196++), "setWriteMask:", v232);
        ++v195;
      }
      while (v196 < *v186);
    }
  }
  v233 = objc_msgSend(v8, "fragmentLinkedFunctions");
  v234 = (unsigned __int16 *)((char *)v123 - *v123);
  if (*v234 >= 0x37u && (v235 = v234[27]) != 0)
    v236 = (char *)v123 + v235 + *(unsigned int *)((char *)v123 + v235);
  else
    v236 = 0;
  -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v233, v236, a4, a5, a6);
  return v8;
}

- (id)newTileRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  void *v11;
  int *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  _BOOL8 v30;
  unsigned __int16 *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  unsigned __int16 *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int16 *v43;
  uint64_t v44;
  _DWORD *v45;
  unsigned int *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 *v52;
  uint64_t v53;
  _DWORD *v54;
  unsigned int *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v11 = (void *)objc_opt_new();
  v12 = (int *)Air::PipelineScript::pipeline_as_tile_render((Air::PipelineScript *)a3);
  v13 = (unsigned __int16 *)((char *)v12 - *v12);
  if (*v13 >= 7u && (v14 = v13[3]) != 0)
    v15 = (int *)((char *)v12 + v14 + *(unsigned int *)((char *)v12 + v14));
  else
    v15 = 0;
  v16 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v16 >= 0xDu && (v17 = v16[6]) != 0)
    v18 = *(_QWORD *)((char *)v15 + v17);
  else
    v18 = 0;
  objc_msgSend(v11, "setColorSampleCount:", v18);
  v19 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v19 >= 9u && (v20 = v19[4]) != 0)
    v21 = *(_QWORD *)((char *)v15 + v20);
  else
    v21 = 1;
  objc_msgSend(v11, "setMaxCallStackDepth:", v21);
  v22 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v22 >= 7u && (v23 = v22[3]) != 0)
    v24 = *(_QWORD *)((char *)v15 + v23);
  else
    v24 = 0;
  objc_msgSend(v11, "setMaxTotalThreadsPerThreadgroup:", v24);
  v25 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v25 >= 0xBu && (v26 = v25[5]) != 0)
    v27 = *(_QWORD *)((char *)v15 + v26);
  else
    v27 = 1;
  objc_msgSend(v11, "setRasterSampleCount:", v27);
  v28 = (unsigned __int16 *)((char *)v15 - *v15);
  v30 = *v28 >= 0x13u && (v29 = v28[9]) != 0 && *((unsigned __int8 *)v15 + v29) != 0;
  objc_msgSend(v11, "setSupportAddingBinaryFunctions:", v30);
  v31 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v31 >= 0x15u && (v32 = v31[10]) != 0)
    v33 = *((unsigned __int8 *)v15 + v32);
  else
    v33 = 0;
  objc_msgSend(v11, "setTextureWriteRoundingMode:", v33);
  v34 = (unsigned __int16 *)((char *)v15 - *v15);
  v36 = *v34 >= 5u && (v35 = v34[2]) != 0 && *((unsigned __int8 *)v15 + v35) != 0;
  objc_msgSend(v11, "setThreadgroupSizeMatchesTileSize:", v36);
  v37 = objc_msgSend(v11, "linkedFunctions");
  v38 = (unsigned __int16 *)((char *)v15 - *v15);
  if (*v38 >= 0x17u && (v39 = v38[11]) != 0)
    v40 = (char *)v15 + v39 + *(unsigned int *)((char *)v15 + v39);
  else
    v40 = 0;
  -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v37, v40, a4, a5, a6);
  v41 = *v15;
  v42 = -v41;
  v43 = (unsigned __int16 *)((char *)v15 - v41);
  if (*v43 >= 0x11u)
  {
    v44 = v43[8];
    if (v44)
    {
      v45 = (int *)((char *)v15 + v44 + *(unsigned int *)((char *)v15 + v44));
      v46 = v45 + 1;
      if (*v45)
      {
        v47 = 0;
        do
        {
          v48 = *v46;
          v49 = v48 - *(int *)((char *)v46 + v48);
          if (*(unsigned __int16 *)((char *)v46 + v49) >= 5u
            && (v50 = *(unsigned __int16 *)((char *)v46 + v49 + 4)) != 0)
          {
            v51 = *((unsigned __int8 *)v46 + v48 + v50);
          }
          else
          {
            v51 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "tileBuffers"), "objectAtIndexedSubscript:", v47++), "setMutability:", v51);
          ++v46;
        }
        while (v47 < *v45);
      }
      v42 = -(uint64_t)*v15;
    }
  }
  v52 = (unsigned __int16 *)((char *)v15 + v42);
  if (*v52 >= 0xFu)
  {
    v53 = v52[7];
    if (v53)
    {
      v54 = (int *)((char *)v15 + v53 + *(unsigned int *)((char *)v15 + v53));
      v55 = v54 + 1;
      if (*v54)
      {
        v56 = 0;
        do
        {
          v57 = *v55;
          v58 = v57 - *(int *)((char *)v55 + v57);
          if (*(unsigned __int16 *)((char *)v55 + v58) >= 5u
            && (v59 = *(unsigned __int16 *)((char *)v55 + v58 + 4)) != 0)
          {
            v60 = *(unsigned __int16 *)((char *)v55 + v57 + v59);
          }
          else
          {
            v60 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "colorAttachments"), "objectAtIndexedSubscript:", v56++), "setPixelFormat:", v60);
          ++v55;
        }
        while (v56 < *v54);
      }
    }
  }
  return v11;
}

- (id)newMeshRenderPipelineDescriptorWithScript:(const PipelineScript *)a3 obj:(void *)a4 destinationArchive:(id)a5 error:(id *)a6
{
  void *v10;
  int *v11;
  uint64_t v12;
  _WORD *v13;
  unsigned int v14;
  int *v15;
  BOOL v16;
  id v17;
  id *v18;
  int *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int16 *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int16 *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 *v32;
  uint64_t v33;
  _BOOL8 v34;
  unsigned __int16 *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int16 *v38;
  uint64_t v39;
  _BOOL8 v40;
  unsigned __int16 *v41;
  uint64_t v42;
  _BOOL8 v43;
  unsigned __int16 *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int16 *v47;
  uint64_t v48;
  _BOOL8 v49;
  unsigned __int16 *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int16 *v53;
  uint64_t v54;
  _DWORD *v55;
  unsigned int *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int16 *v63;
  uint64_t v64;
  char *v65;
  unsigned __int16 *v66;
  uint64_t v67;
  int *v68;
  unsigned __int16 *v69;
  uint64_t v70;
  uint64_t v71;
  unsigned __int16 *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int16 *v75;
  uint64_t v76;
  uint64_t v77;
  unsigned __int16 *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int16 *v81;
  uint64_t v82;
  _BOOL8 v83;
  unsigned __int16 *v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int16 *v87;
  uint64_t v88;
  _BOOL8 v89;
  unsigned __int16 *v90;
  uint64_t v91;
  _BOOL8 v92;
  unsigned __int16 *v93;
  uint64_t v94;
  _BOOL8 v95;
  unsigned __int16 *v96;
  uint64_t v97;
  uint64_t v98;
  unsigned __int16 *v99;
  uint64_t v100;
  _BOOL8 v101;
  unsigned __int16 *v102;
  uint64_t v103;
  uint64_t v104;
  unsigned __int16 *v105;
  uint64_t v106;
  _DWORD *v107;
  unsigned int *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unsigned __int16 *v115;
  uint64_t v116;
  char *v117;
  unsigned __int16 *v118;
  uint64_t v119;
  int *v120;
  unsigned __int16 *v121;
  uint64_t v122;
  _BOOL8 v123;
  unsigned __int16 *v124;
  uint64_t v125;
  uint64_t v126;
  unsigned __int16 *v127;
  uint64_t v128;
  _BOOL8 v129;
  unsigned __int16 *v130;
  uint64_t v131;
  _BOOL8 v132;
  unsigned __int16 *v133;
  uint64_t v134;
  uint64_t v135;
  unsigned __int16 *v136;
  uint64_t v137;
  uint64_t v138;
  unsigned __int16 *v139;
  uint64_t v140;
  uint64_t v141;
  unsigned __int16 *v142;
  uint64_t v143;
  _BOOL8 v144;
  unsigned __int16 *v145;
  uint64_t v146;
  uint64_t v147;
  unsigned __int16 *v148;
  uint64_t v149;
  _BOOL8 v150;
  unsigned __int16 *v151;
  uint64_t v152;
  uint64_t v153;
  unsigned __int16 *v154;
  uint64_t v155;
  _BOOL8 v156;
  unsigned __int16 *v157;
  uint64_t v158;
  _BOOL8 v159;
  unsigned __int16 *v160;
  uint64_t v161;
  _BOOL8 v162;
  unsigned __int16 *v163;
  uint64_t v164;
  uint64_t v165;
  unsigned __int16 *v166;
  double v167;
  uint64_t v168;
  unsigned __int16 *v169;
  uint64_t v170;
  _BOOL8 v171;
  unsigned __int16 *v172;
  uint64_t v173;
  uint64_t v174;
  unsigned __int16 *v175;
  uint64_t v176;
  uint64_t v177;
  unsigned __int16 *v178;
  uint64_t v179;
  _BOOL8 v180;
  unsigned __int16 *v181;
  unsigned int v182;
  _DWORD *v183;
  uint64_t v184;
  _DWORD *v185;
  unsigned int *v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  _DWORD *v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  _BOOL8 v202;
  uint64_t v203;
  _DWORD *v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  _DWORD *v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  _DWORD *v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unsigned __int16 *v231;
  uint64_t v232;
  char *v233;
  uint64_t v235;
  void *v236;
  char v237;

  v10 = (void *)objc_opt_new();
  v11 = (int *)Air::PipelineScript::pipeline_as_mesh_render((Air::PipelineScript *)a3);
  v12 = *v11;
  v13 = (_WORD *)((char *)v11 - v12);
  v14 = *(unsigned __int16 *)((char *)v11 - v12);
  if (v14 < 5)
    return v10;
  v15 = v11;
  if (v14 < 7)
  {
    if (!v13[2])
      return v10;
    v236 = a4;
    v17 = a5;
    v18 = a6;
    v19 = 0;
    v16 = 1;
    v237 = 1;
    goto LABEL_15;
  }
  v16 = v13[3] == 0;
  if (v14 > 8 && v13[4])
  {
    v237 = 0;
    if (!v13[2])
      goto LABEL_6;
    goto LABEL_11;
  }
  v237 = 1;
  if (v13[2])
  {
LABEL_11:
    v236 = a4;
    if (v14 >= 0xB && v13[5])
    {
      v17 = a5;
      v18 = a6;
      v19 = (int *)((char *)v11 + (unsigned __int16)v13[5] + *(unsigned int *)((char *)v11 + (unsigned __int16)v13[5]));
    }
    else
    {
      v17 = a5;
      v18 = a6;
      v19 = 0;
    }
LABEL_15:
    v20 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v20 >= 7u && (v21 = v20[3]) != 0)
      v22 = *(_QWORD *)((char *)v19 + v21);
    else
      v22 = 0;
    objc_msgSend(v10, "setMaxTotalThreadsPerObjectThreadgroup:", v22);
    v23 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v23 >= 0xDu && (v24 = v23[6]) != 0)
      v25 = *(_QWORD *)((char *)v19 + v24);
    else
      v25 = 1;
    objc_msgSend(v10, "setMaxObjectCallStackDepth:", v25);
    v26 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v26 >= 0xBu && (v27 = v26[5]) != 0)
      v28 = *(_QWORD *)((char *)v19 + v27);
    else
      v28 = 0;
    objc_msgSend(v10, "setMaxTotalThreadgroupsPerMeshGrid:", v28);
    v29 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v29 >= 0xFu && (v30 = v29[7]) != 0)
      v31 = *(_QWORD *)((char *)v19 + v30);
    else
      v31 = 1;
    objc_msgSend(v10, "setMaxVertexAmplificationCount:", v31);
    v32 = (unsigned __int16 *)((char *)v19 - *v19);
    v34 = *v32 >= 0x1Bu && (v33 = v32[13]) != 0 && *((unsigned __int8 *)v19 + v33) != 0;
    objc_msgSend(v10, "setNeedsCustomBorderColorSamplers:", v34);
    v35 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v35 >= 9u && (v36 = v35[4]) != 0)
      v37 = *(_QWORD *)((char *)v19 + v36);
    else
      v37 = 0;
    objc_msgSend(v10, "setPayloadMemoryLength:", v37);
    v38 = (unsigned __int16 *)((char *)v19 - *v19);
    v40 = *v38 >= 0x17u && (v39 = v38[11]) != 0 && *((unsigned __int8 *)v19 + v39) != 0;
    objc_msgSend(v10, "setSupportAddingObjectBinaryFunctions:", v40);
    v41 = (unsigned __int16 *)((char *)v19 - *v19);
    v43 = *v41 >= 0x15u && (v42 = v41[10]) != 0 && *((unsigned __int8 *)v19 + v42) != 0;
    objc_msgSend(v10, "setSupportIndirectCommandBuffers:", v43);
    v44 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v44 >= 0x19u && (v45 = v44[12]) != 0)
      v46 = *((unsigned __int8 *)v19 + v45);
    else
      v46 = 0;
    objc_msgSend(v10, "setTextureWriteRoundingMode:", v46);
    v47 = (unsigned __int16 *)((char *)v19 - *v19);
    v49 = *v47 >= 5u && (v48 = v47[2]) != 0 && *((unsigned __int8 *)v19 + v48) != 0;
    objc_msgSend(v10, "setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:", v49);
    v50 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v50 >= 0x11u && (v51 = v50[8]) != 0)
      v52 = *((unsigned __int8 *)v19 + v51);
    else
      v52 = 0;
    objc_msgSend(v10, "setVertexAmplificationMode:", v52);
    v53 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v53 >= 0x13u)
    {
      v54 = v53[9];
      if (v54)
      {
        v55 = (int *)((char *)v19 + v54 + *(unsigned int *)((char *)v19 + v54));
        v56 = v55 + 1;
        if (*v55)
        {
          v57 = 0;
          do
          {
            v58 = *v56;
            v59 = v58 - *(int *)((char *)v56 + v58);
            if (*(unsigned __int16 *)((char *)v56 + v59) >= 5u
              && (v60 = *(unsigned __int16 *)((char *)v56 + v59 + 4)) != 0)
            {
              v61 = *((unsigned __int8 *)v56 + v58 + v60);
            }
            else
            {
              v61 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectBuffers"), "objectAtIndexedSubscript:", v57++), "setMutability:", v61);
            ++v56;
          }
          while (v57 < *v55);
        }
      }
    }
    v62 = objc_msgSend(v10, "objectLinkedFunctions");
    v63 = (unsigned __int16 *)((char *)v19 - *v19);
    if (*v63 >= 0x1Du && (v64 = v63[14]) != 0)
      v65 = (char *)v19 + v64 + *(unsigned int *)((char *)v19 + v64);
    else
      v65 = 0;
    a6 = v18;
    a5 = v17;
    a4 = v236;
    -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v62, v65, v236, a5, a6);
    if (v16)
      goto LABEL_140;
    v12 = *v15;
    goto LABEL_74;
  }
LABEL_6:
  if (v13[3])
  {
LABEL_74:
    v66 = (unsigned __int16 *)((char *)v15 - v12);
    if (*v66 >= 0xDu && (v67 = v66[6]) != 0)
      v68 = (int *)((char *)v15 + v67 + *(unsigned int *)((char *)v15 + v67));
    else
      v68 = 0;
    v69 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v69 >= 7u && (v70 = v69[3]) != 0)
      v71 = *(_QWORD *)((char *)v68 + v70);
    else
      v71 = 0;
    objc_msgSend(v10, "setMaxTotalThreadgroupsPerMeshGrid:", v71);
    v72 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v72 >= 0x1Bu && (v73 = v72[13]) != 0)
      v74 = *((unsigned __int8 *)v68 + v73);
    else
      v74 = 255;
    objc_msgSend(v10, "setClipDistanceEnableMask:", v74);
    v75 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v75 >= 0xBu && (v76 = v75[5]) != 0)
      v77 = *(_QWORD *)((char *)v68 + v76);
    else
      v77 = 1;
    objc_msgSend(v10, "setMaxMeshCallStackDepth:", v77);
    v78 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v78 >= 0xFu && (v79 = v78[7]) != 0)
      v80 = *(_QWORD *)((char *)v68 + v79);
    else
      v80 = 1;
    objc_msgSend(v10, "setMaxVertexAmplificationCount:", v80);
    v81 = (unsigned __int16 *)((char *)v68 - *v68);
    v83 = *v81 >= 0x1Du && (v82 = v81[14]) != 0 && *((unsigned __int8 *)v68 + v82) != 0;
    objc_msgSend(v10, "setNeedsCustomBorderColorSamplers:", v83);
    v84 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v84 >= 9u && (v85 = v84[4]) != 0)
      v86 = *(_QWORD *)((char *)v68 + v85);
    else
      v86 = 0;
    objc_msgSend(v10, "setPayloadMemoryLength:", v86);
    v87 = (unsigned __int16 *)((char *)v68 - *v68);
    v89 = *v87 < 0xDu || (v88 = v87[6]) == 0 || *((unsigned __int8 *)v68 + v88) != 0;
    objc_msgSend(v10, "setRasterizationEnabled:", v89);
    v90 = (unsigned __int16 *)((char *)v68 - *v68);
    v92 = *v90 >= 0x17u && (v91 = v90[11]) != 0 && *((unsigned __int8 *)v68 + v91) != 0;
    objc_msgSend(v10, "setSupportAddingMeshBinaryFunctions:", v92);
    v93 = (unsigned __int16 *)((char *)v68 - *v68);
    v95 = *v93 >= 0x15u && (v94 = v93[10]) != 0 && *((unsigned __int8 *)v68 + v94) != 0;
    objc_msgSend(v10, "setSupportIndirectCommandBuffers:", v95);
    v96 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v96 >= 0x19u && (v97 = v96[12]) != 0)
      v98 = *((unsigned __int8 *)v68 + v97);
    else
      v98 = 0;
    objc_msgSend(v10, "setTextureWriteRoundingMode:", v98);
    v99 = (unsigned __int16 *)((char *)v68 - *v68);
    v101 = *v99 >= 5u && (v100 = v99[2]) != 0 && *((unsigned __int8 *)v68 + v100) != 0;
    objc_msgSend(v10, "setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:", v101);
    v102 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v102 >= 0x11u && (v103 = v102[8]) != 0)
      v104 = *((unsigned __int8 *)v68 + v103);
    else
      v104 = 0;
    objc_msgSend(v10, "setVertexAmplificationMode:", v104);
    v105 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v105 >= 0x13u)
    {
      v106 = v105[9];
      if (v106)
      {
        v107 = (int *)((char *)v68 + v106 + *(unsigned int *)((char *)v68 + v106));
        v108 = v107 + 1;
        if (*v107)
        {
          v109 = 0;
          do
          {
            v110 = *v108;
            v111 = v110 - *(int *)((char *)v108 + v110);
            if (*(unsigned __int16 *)((char *)v108 + v111) >= 5u
              && (v112 = *(unsigned __int16 *)((char *)v108 + v111 + 4)) != 0)
            {
              v113 = *((unsigned __int8 *)v108 + v110 + v112);
            }
            else
            {
              v113 = 0;
            }
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "meshBuffers"), "objectAtIndexedSubscript:", v109++), "setMutability:", v113);
            ++v108;
          }
          while (v109 < *v107);
        }
      }
    }
    v114 = objc_msgSend(v10, "meshLinkedFunctions");
    v115 = (unsigned __int16 *)((char *)v68 - *v68);
    if (*v115 >= 0x1Fu && (v116 = v115[15]) != 0)
      v117 = (char *)v68 + v116 + *(unsigned int *)((char *)v68 + v116);
    else
      v117 = 0;
    -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v114, v117, a4, a5, a6);
  }
LABEL_140:
  if ((v237 & 1) == 0)
  {
    v118 = (unsigned __int16 *)((char *)v15 - *v15);
    if (*v118 >= 0xFu && (v119 = v118[7]) != 0)
      v120 = (int *)((char *)v15 + v119 + *(unsigned int *)((char *)v15 + v119));
    else
      v120 = 0;
    v121 = (unsigned __int16 *)((char *)v120 - *v120);
    v123 = *v121 >= 0x29u && (v122 = v121[20]) != 0 && *((unsigned __int8 *)v120 + v122) != 0;
    objc_msgSend(v10, "setAlphaTestEnabled:", v123);
    v124 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v124 >= 0x2Bu && (v125 = v124[21]) != 0)
      v126 = *((unsigned __int8 *)v120 + v125);
    else
      v126 = 0;
    objc_msgSend(v10, "setAlphaTestFunction:", v126);
    v127 = (unsigned __int16 *)((char *)v120 - *v120);
    v129 = *v127 >= 9u && (v128 = v127[4]) != 0 && *((unsigned __int8 *)v120 + v128) != 0;
    objc_msgSend(v10, "setAlphaToCoverageEnabled:", v129);
    v130 = (unsigned __int16 *)((char *)v120 - *v120);
    v132 = *v130 >= 0xBu && (v131 = v130[5]) != 0 && *((unsigned __int8 *)v120 + v131) != 0;
    objc_msgSend(v10, "setAlphaToOneEnabled:", v132);
    v133 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v133 >= 0xFu && (v134 = v133[7]) != 0)
      v135 = *(_QWORD *)((char *)v120 + v134);
    else
      v135 = 0;
    objc_msgSend(v10, "setColorSampleCount:", v135);
    v136 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v136 >= 0x19u && (v137 = v136[12]) != 0)
      v138 = *(unsigned __int16 *)((char *)v120 + v137);
    else
      v138 = 0;
    objc_msgSend(v10, "setDepthAttachmentPixelFormat:", v138);
    v139 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v139 >= 0x35u && (v140 = v139[26]) != 0)
      v141 = *(unsigned int *)((char *)v120 + v140);
    else
      v141 = 0;
    objc_msgSend(v10, "setFragmentDepthCompareClampMask:", v141);
    v142 = (unsigned __int16 *)((char *)v120 - *v120);
    v144 = *v142 >= 0x2Fu && (v143 = v142[23]) != 0 && *((unsigned __int8 *)v120 + v143) != 0;
    objc_msgSend(v10, "setDepthStencilWriteDisabled:", v144);
    v145 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v145 >= 0x27u && (v146 = v145[19]) != 0)
      v147 = *((unsigned __int8 *)v120 + v146);
    else
      v147 = 0;
    objc_msgSend(v10, "setLogicOperation:", v147);
    v148 = (unsigned __int16 *)((char *)v120 - *v120);
    v150 = *v148 >= 0x25u && (v149 = v148[18]) != 0 && *((unsigned __int8 *)v120 + v149) != 0;
    objc_msgSend(v10, "setLogicOperationEnabled:", v150);
    v151 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v151 >= 5u && (v152 = v151[2]) != 0)
      v153 = *(_QWORD *)((char *)v120 + v152);
    else
      v153 = 1;
    objc_msgSend(v10, "setMaxFragmentCallStackDepth:", v153);
    v154 = (unsigned __int16 *)((char *)v120 - *v120);
    v156 = *v154 >= 0x33u && (v155 = v154[25]) != 0 && *((unsigned __int8 *)v120 + v155) != 0;
    objc_msgSend(v10, "setNeedsCustomBorderColorSamplers:", v156);
    v157 = (unsigned __int16 *)((char *)v120 - *v120);
    v159 = *v157 >= 0x31u && (v158 = v157[24]) != 0 && *((unsigned __int8 *)v120 + v158) != 0;
    objc_msgSend(v10, "setOpenGLModeEnabled:", v159);
    v160 = (unsigned __int16 *)((char *)v120 - *v120);
    v162 = *v160 >= 0x2Du && (v161 = v160[22]) != 0 && *((unsigned __int8 *)v120 + v161) != 0;
    objc_msgSend(v10, "setPointSmoothEnabled:", v162);
    v163 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v163 >= 0xDu && (v164 = v163[6]) != 0)
      v165 = *(_QWORD *)((char *)v120 + v164);
    else
      v165 = 1;
    objc_msgSend(v10, "setRasterSampleCount:", v165);
    v166 = (unsigned __int16 *)((char *)v120 - *v120);
    LODWORD(v167) = 1.0;
    if (*v166 >= 0x13u)
    {
      v168 = v166[9];
      if (v168)
        LODWORD(v167) = *(int *)((char *)v120 + v168);
    }
    objc_msgSend(v10, "setSampleCoverage:", v167);
    v169 = (unsigned __int16 *)((char *)v120 - *v120);
    v171 = *v169 >= 0x15u && (v170 = v169[10]) != 0 && *((unsigned __int8 *)v120 + v170) != 0;
    objc_msgSend(v10, "setSampleCoverageInvert:", v171);
    v172 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v172 >= 0x11u && (v173 = v172[8]) != 0)
      v174 = *(_QWORD *)((char *)v120 + v173);
    else
      v174 = -1;
    objc_msgSend(v10, "setSampleMask:", v174);
    v175 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v175 >= 0x1Bu && (v176 = v175[13]) != 0)
      v177 = *(unsigned __int16 *)((char *)v120 + v176);
    else
      v177 = 0;
    objc_msgSend(v10, "setStencilAttachmentPixelFormat:", v177);
    v178 = (unsigned __int16 *)((char *)v120 - *v120);
    v180 = *v178 >= 0x21u && (v179 = v178[16]) != 0 && *((unsigned __int8 *)v120 + v179) != 0;
    objc_msgSend(v10, "setSupportAddingFragmentBinaryFunctions:", v180, a6);
    v181 = (unsigned __int16 *)((char *)v120 - *v120);
    v182 = *v181;
    if (v182 >= 0x17)
    {
      if (v181[11])
        v183 = (int *)((char *)v120 + v181[11] + *(unsigned int *)((char *)v120 + v181[11]));
      else
        v183 = 0;
      if (v182 >= 0x1D)
      {
        v184 = v181[14];
        if (v184)
        {
          v185 = (int *)((char *)v120 + v184 + *(unsigned int *)((char *)v120 + v184));
          v186 = v185 + 1;
          if (*v185)
          {
            v187 = 0;
            do
            {
              v188 = *v186;
              v189 = v188 - *(int *)((char *)v186 + v188);
              if (*(unsigned __int16 *)((char *)v186 + v189) >= 5u
                && (v190 = *(unsigned __int16 *)((char *)v186 + v189 + 4)) != 0)
              {
                v191 = *((unsigned __int8 *)v186 + v188 + v190);
              }
              else
              {
                v191 = 0;
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "fragmentBuffers"), "objectAtIndexedSubscript:", v187++), "setMutability:", v191);
              ++v186;
            }
            while (v187 < *v185);
          }
        }
      }
      if (v183 && *v183)
      {
        v192 = 0;
        v193 = 0;
        do
        {
          v194 = &v183[v192];
          v195 = v183[v192 + 1];
          v196 = (char *)&v183[v192] + v195 - *(int *)((char *)&v183[v192 + 1] + v195);
          if (*((unsigned __int16 *)v196 + 2) >= 0xBu && (v197 = *((unsigned __int16 *)v196 + 7)) != 0)
            v198 = *((unsigned __int8 *)&v183[v192 + 1] + v195 + v197);
          else
            v198 = 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setAlphaBlendOperation:", v198);
          v199 = v194[1];
          v200 = v199 - *(int *)((char *)v194 + v199 + 4);
          v202 = *(unsigned __int16 *)((char *)v194 + v200 + 4) >= 9u
              && (v201 = *(unsigned __int16 *)((char *)&v183[v192 + 3] + v200)) != 0
              && *((unsigned __int8 *)&v183[v192 + 1] + v199 + v201) != 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setBlendingEnabled:", v202);
          v203 = v194[1];
          v204 = &v183[v192];
          v205 = (char *)&v183[v192] + v203 - *(int *)((char *)&v183[v192 + 1] + v203);
          if (*((unsigned __int16 *)v205 + 2) >= 0xFu && (v206 = *((unsigned __int16 *)v205 + 9)) != 0)
            v207 = *((unsigned __int8 *)&v183[v192 + 1] + v203 + v206);
          else
            v207 = 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setDestinationAlphaBlendFactor:", v207);
          v208 = v194[1];
          v209 = v208 - *(int *)((char *)v204 + v208 + 4);
          if (*(unsigned __int16 *)((char *)v204 + v209 + 4) >= 0x11u
            && (v210 = *(unsigned __int16 *)((char *)&v183[v192 + 5] + v209)) != 0)
          {
            v211 = *((unsigned __int8 *)&v183[v192 + 1] + v208 + v210);
          }
          else
          {
            v211 = 0;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setDestinationRGBBlendFactor:", v211);
          v212 = v194[1];
          v213 = &v183[v192];
          v214 = (char *)&v183[v192] + v212 - *(int *)((char *)&v183[v192 + 1] + v212);
          if (*((unsigned __int16 *)v214 + 2) >= 5u && (v215 = *((unsigned __int16 *)v214 + 4)) != 0)
            v216 = *(unsigned __int16 *)((char *)&v183[v192 + 1] + v212 + v215);
          else
            v216 = 0;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setPixelFormat:", v216);
          v217 = v194[1];
          v218 = v217 - *(int *)((char *)v213 + v217 + 4);
          if (*(unsigned __int16 *)((char *)v213 + v218 + 4) >= 0x15u
            && (v219 = *(unsigned __int16 *)((char *)&v183[v192 + 6] + v218)) != 0)
          {
            v220 = *((unsigned __int8 *)&v183[v192 + 1] + v217 + v219);
          }
          else
          {
            v220 = 1;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setSourceRGBBlendFactor:", v220);
          v221 = v194[1];
          v222 = &v183[v192];
          v223 = (char *)&v183[v192] + v221 - *(int *)((char *)&v183[v192 + 1] + v221);
          if (*((unsigned __int16 *)v223 + 2) >= 0x13u && (v224 = *((unsigned __int16 *)v223 + 11)) != 0)
            v225 = *((unsigned __int8 *)&v183[v192 + 1] + v221 + v224);
          else
            v225 = 1;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193), "setSourceAlphaBlendFactor:", v225);
          v226 = v194[1];
          v227 = v226 - *(int *)((char *)v222 + v226 + 4);
          if (*(unsigned __int16 *)((char *)v222 + v227 + 4) >= 7u
            && (v228 = *(unsigned __int16 *)((char *)&v183[v192 + 2] + v227 + 2)) != 0)
          {
            v229 = *((unsigned __int8 *)&v183[v192 + 1] + v226 + v228);
          }
          else
          {
            v229 = 15;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "colorAttachments"), "objectAtIndexedSubscript:", v193++), "setWriteMask:", v229);
          ++v192;
        }
        while (v193 < *v183);
      }
    }
    v230 = objc_msgSend(v10, "fragmentLinkedFunctions");
    v231 = (unsigned __int16 *)((char *)v120 - *v120);
    if (*v231 >= 0x37u && (v232 = v231[27]) != 0)
      v233 = (char *)v120 + v232 + *(unsigned int *)((char *)v120 + v232);
    else
      v233 = 0;
    -[_MTLBinaryArchive setMTLLinkedFunctions:LFS:obj:destinationArchive:error:](self, "setMTLLinkedFunctions:LFS:obj:destinationArchive:error:", v230, v233, a4, a5, v235);
  }
  return v10;
}

- (id)archiveFunctionIds
{
  void *v3;
  _QWORD *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = self->_airntBinaryList.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    std::vector<MTLHashKey>::__init_with_size[abi:ne180100]<MTLHashKey*,MTLHashKey*>(&v9, i[3], i[4], 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(i[4] - i[3]) >> 4));
    v5 = v9;
    if (v10 != v9)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5 + v6));
        ++v7;
        v5 = v9;
        v6 += 80;
      }
      while (v7 < 0xCCCCCCCCCCCCCCCDLL * ((v10 - v9) >> 4));
    }
    v12 = (void **)&v9;
    std::vector<MTLHashKey>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  return v3;
}

- (id)newFunctionDescriptorWithAirScript:(const ConstantsSpecializationScript *)a3
{
  const ConstantsSpecializationScript *v3;
  uint64_t v4;
  const ConstantsSpecializationScript *v5;
  MTLFunctionDescriptor *v6;
  uint64_t v7;
  uint64_t v8;
  const ConstantsSpecializationScript *v9;
  uint64_t v10;
  const ConstantsSpecializationScript *v11;
  uint64_t v12;
  const ConstantsSpecializationScript *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const ConstantsSpecializationScript *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = &a3[-*(int *)a3->var0];
  if (*(unsigned __int16 *)v3->var0 < 9u)
    return 0;
  v4 = *(unsigned __int16 *)v3[8].var0;
  if (!v4)
    return 0;
  v5 = &a3[v4 + *(unsigned int *)a3[v4].var0];
  v6 = objc_alloc_init(MTLFunctionDescriptor);
  v7 = *(int *)v5->var0;
  v8 = -v7;
  v9 = &v5[-v7];
  if (*(unsigned __int16 *)v9->var0 >= 5u)
  {
    v10 = *(unsigned __int16 *)v9[4].var0;
    if (v10)
    {
      -[MTLFunctionDescriptor setName:](v6, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v5[v10 + 4 + *(unsigned int *)v5[v10].var0]));
      v8 = -(uint64_t)*(int *)v5->var0;
    }
  }
  if (*(unsigned __int16 *)v5[v8].var0 >= 7u && *(_WORD *)v5[v8 + 6].var0)
  {
    -[MTLFunctionDescriptor setSpecializedName:](v6, "setSpecializedName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v5[*(unsigned __int16 *)v5[v8 + 6].var0 + 4 + *(unsigned int *)v5[*(unsigned __int16 *)v5[v8 + 6].var0].var0]));
    v8 = -(uint64_t)*(int *)v5->var0;
  }
  v11 = &v5[v8];
  if (*(unsigned __int16 *)v11->var0 >= 9u && (v12 = *(unsigned __int16 *)v11[8].var0) != 0)
    v13 = &v5[v12 + *(unsigned int *)v5[v12].var0];
  else
    v13 = 0;
  v14 = (void *)objc_opt_new();
  if (*(_DWORD *)v13->var0)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = *(unsigned int *)v13[v15 + 4].var0;
      v18 = v17 - *(int *)v13[v15 + 4 + v17].var0;
      v19 = &v13[v15 + v18];
      v20 = *(unsigned __int16 *)v19[4].var0;
      if (v20 >= 5)
      {
        v21 = *(unsigned __int16 *)v19[8].var0;
        v22 = v21 ? *(unsigned __int16 *)v13[v15 + 4 + v17 + v21].var0 : 0;
        if (v20 >= 7)
        {
          if (*(_WORD *)v13[v15 + 10 + v18].var0)
            v23 = v13[v15 + 4 + v17 + *(unsigned __int16 *)v13[v15 + 10 + v18].var0].var0[0];
          else
            v23 = 0;
          if (v20 >= 9 && (v24 = *(unsigned __int16 *)v13[v15 + 12 + v18].var0) != 0)
            v25 = (uint64_t)&v13[v15 + 4 + v17 + v24 + *(unsigned int *)v13[v15 + 4 + v17 + v24].var0];
          else
            v25 = 0;
          v26 = v23;
          switch(v23)
          {
            case 3u:
              v26 = 3;
              goto LABEL_72;
            case 4u:
              v26 = 4;
              goto LABEL_72;
            case 5u:
              v26 = 5;
              goto LABEL_72;
            case 6u:
              v26 = 6;
              goto LABEL_72;
            case 0x10u:
              v26 = 16;
              goto LABEL_72;
            case 0x11u:
              v26 = 17;
              goto LABEL_72;
            case 0x12u:
              v26 = 18;
              goto LABEL_72;
            case 0x13u:
              v26 = 19;
              goto LABEL_72;
            case 0x1Du:
              v26 = 29;
              goto LABEL_72;
            case 0x1Eu:
              v26 = 30;
              goto LABEL_72;
            case 0x1Fu:
              v26 = 31;
              goto LABEL_72;
            case 0x20u:
              v26 = 32;
              goto LABEL_72;
            case 0x21u:
              v26 = 33;
              goto LABEL_72;
            case 0x22u:
              v26 = 34;
              goto LABEL_72;
            case 0x23u:
              v26 = 35;
              goto LABEL_72;
            case 0x24u:
              v26 = 36;
              goto LABEL_72;
            case 0x25u:
              v26 = 37;
              goto LABEL_72;
            case 0x26u:
              v26 = 38;
              goto LABEL_72;
            case 0x27u:
              v26 = 39;
              goto LABEL_72;
            case 0x28u:
              v26 = 40;
              goto LABEL_72;
            case 0x29u:
              v26 = 41;
              goto LABEL_72;
            case 0x2Au:
              v26 = 42;
              goto LABEL_72;
            case 0x2Bu:
              v26 = 43;
              goto LABEL_72;
            case 0x2Cu:
              v26 = 44;
              goto LABEL_72;
            case 0x2Du:
              v26 = 45;
              goto LABEL_72;
            case 0x2Eu:
              v26 = 46;
              goto LABEL_72;
            case 0x2Fu:
              v26 = 47;
              goto LABEL_72;
            case 0x30u:
              v26 = 48;
              goto LABEL_72;
            case 0x31u:
              v26 = 49;
              goto LABEL_72;
            case 0x32u:
              v26 = 50;
              goto LABEL_72;
            case 0x33u:
              v26 = 51;
              goto LABEL_72;
            case 0x34u:
              v26 = 52;
              goto LABEL_72;
            case 0x35u:
              goto LABEL_72;
            case 0x36u:
              v26 = 54;
              goto LABEL_72;
            case 0x37u:
              v26 = 55;
              goto LABEL_72;
            case 0x38u:
              v26 = 56;
              goto LABEL_72;
            case 0x51u:
              v26 = 81;
              goto LABEL_72;
            case 0x52u:
              v26 = 82;
              goto LABEL_72;
            case 0x53u:
              v26 = 83;
              goto LABEL_72;
            case 0x54u:
              v26 = 84;
              goto LABEL_72;
            case 0x55u:
              v26 = 85;
              goto LABEL_72;
            case 0x56u:
              v26 = 86;
              goto LABEL_72;
            case 0x57u:
              v26 = 87;
              goto LABEL_72;
            case 0x58u:
              v26 = 88;
LABEL_72:
              objc_msgSend(v14, "setConstantValue:type:atIndex:", v25, v26, v22);
              break;
            default:
              break;
          }
        }
      }
      ++v16;
      v15 += 4;
    }
    while (v16 < *(unsigned int *)v13->var0);
  }
  -[MTLFunctionDescriptor setConstantValues:](v6, "setConstantValues:", v14);

  return v6;
}

- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 index:(unint64_t)a4 destinationArchive:(id)a5 error:(id *)a6
{
  NSObject *queue;
  void *v7;
  _QWORD v9[10];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89___MTLBinaryArchive_newRecompiledFunctionWithAIRNTObject_index_destinationArchive_error___block_invoke;
  v9[3] = &unk_1E0FE2A40;
  v9[8] = a4;
  v9[9] = a6;
  v9[6] = &v10;
  v9[7] = a3;
  v9[4] = self;
  v9[5] = a5;
  dispatch_sync(queue, v9);
  v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)newRecompiledFunctionWithAIRNTObject:(void *)a3 destinationArchive:(id)a4 error:(id *)a5
{
  return -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:index:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:index:destinationArchive:error:", a3, 0, a4, a5);
}

- (id)getMetalScript
{
  return self->_metalScript;
}

- (void)initMetalScriptWithArchive:(id)a3
{
  NSObject *v4;

  v4 = objc_msgSend(a3, "getMetalScript");
  if (v4)
    MTLMetalScriptBuilder::initFromScript((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v4);
}

- (id)getLibraryDescriptorWithAirScrpt:(const StitchingScript *)a3
{
  id v4;
  const StitchingScript *v5;
  int *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  int *v9;
  id v10;
  id v11;
  unsigned int *v12;
  void **p_dst;
  unsigned __int16 *v14;
  uint64_t v15;
  _DWORD *v16;
  unint64_t i;
  int *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  int v21;
  MTLFunctionStitchingAttributeKernel *v22;
  MTLFunctionStitchingAttributeKernel **v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  MTLFunctionStitchingAttributeKernel **v28;
  uint64_t v29;
  unint64_t v30;
  MTLFunctionStitchingAttributeKernel **v31;
  void **v32;
  void **v33;
  MTLFunctionStitchingAttributeKernel *v34;
  void **v35;
  MTLFunctionStitchingAttributeKernel *v36;
  unint64_t v37;
  unint64_t v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int *v41;
  AirReflection::Node *v42;
  unsigned __int16 *v43;
  uint64_t v44;
  MTLFunctionStitchingInputNode *v45;
  int *v46;
  unsigned __int16 *v47;
  uint64_t v48;
  uint64_t v49;
  int *v50;
  MTLFunctionStitchingInputBufferAddress *v51;
  unsigned __int16 *v52;
  unsigned int v53;
  int *v54;
  int *v55;
  unsigned __int16 *v56;
  uint64_t v57;
  int v58;
  MTLFunctionStitchingInputImageblock *v59;
  MTLFunctionStitchingInputImageblock **v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  MTLFunctionStitchingInputBuffer *v65;
  int *v66;
  unsigned __int16 *v67;
  uint64_t v68;
  uint64_t v69;
  int *v70;
  MTLFunctionStitchingInputBufferAddress *v71;
  unsigned __int16 *v72;
  unsigned int v73;
  int *v74;
  int *v75;
  MTLFunctionStitchingInputThreadgroup *v76;
  unsigned __int16 *v77;
  uint64_t v78;
  uint64_t v79;
  int *v80;
  int *v81;
  unsigned __int16 *v82;
  unsigned int v83;
  _DWORD *v84;
  int *v85;
  MTLFunctionStitchingInputTexture *v86;
  unsigned __int16 *v87;
  uint64_t v88;
  uint64_t v89;
  int *v90;
  MTLFunctionStitchingInputSampler *v91;
  unsigned __int16 *v92;
  uint64_t v93;
  uint64_t v94;
  int *v95;
  int *v96;
  unsigned __int16 *v97;
  uint64_t v98;
  _DWORD *v99;
  char *v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  id v113;
  MTLFunctionStitchingEarlyReturnNode *v114;
  MTLFunctionStitchingEarlyReturnNode *v115;
  MTLFunctionStitchingEarlyReturnNode *v116;
  MTLFunctionStitchingFunctionNode **v117;
  MTLFunctionStitchingFunctionNode **v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  _DWORD *v130;
  unsigned __int16 *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  unsigned __int16 *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  MTLFunctionStitchingFunctionNode **v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  char *v149;
  char *v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  char *v159;
  uint64_t v160;
  unint64_t v161;
  char *v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  unint64_t v166;
  unint64_t v167;
  char *v168;
  char *v169;
  char *v170;
  char *v171;
  uint64_t v172;
  id v173;
  id v174;
  id v175;
  unsigned int *v176;
  void **v177;
  id v178;
  MTLFunctionStitchingFunctionNode *v179;
  MTLFunctionStitchingFunctionNode *v180;
  MTLFunctionStitchingFunctionNode **v181;
  MTLFunctionStitchingFunctionNode **v182;
  uint64_t v183;
  unint64_t v184;
  unint64_t v185;
  char *v186;
  MTLFunctionStitchingInputImageblock **v187;
  char *v188;
  char *v189;
  MTLFunctionStitchingInputImageblock *v190;
  char *v191;
  MTLFunctionStitchingInputImageblock *v192;
  char *v193;
  MTLFunctionStitchingInputImageblock *v194;
  char *v195;
  MTLFunctionStitchingInputImageblock *v196;
  char *v197;
  MTLFunctionStitchingInputImageblock *v198;
  char *v199;
  MTLFunctionStitchingInputImageblock *v200;
  char *v201;
  MTLFunctionStitchingInputImageblock *v202;
  char *v203;
  MTLFunctionStitchingInputImageblock *v204;
  MTLFunctionStitchingEarlyReturnNode **v205;
  char *v206;
  char *v207;
  MTLFunctionStitchingEarlyReturnNode *v208;
  MTLFunctionStitchingFunctionNode **v209;
  char *v210;
  char *v211;
  MTLFunctionStitchingFunctionNode *v212;
  char *v213;
  MTLFunctionStitchingInputImageblock *v214;
  uint64_t v215;
  unint64_t v216;
  char *v217;
  MTLFunctionStitchingInputImageblock *v218;
  id v219;
  MTLFunctionStitchingFunctionNode **v220;
  MTLFunctionStitchingFunctionNode **v221;
  uint64_t v222;
  int *v224;
  void *v225;
  id v226;
  void *__p[2];
  char v228;
  void *v229;
  char *v230;
  char *v231;
  void *v232;
  char *v233;
  char *v234;
  void *v235;
  MTLFunctionStitchingFunctionNode **v236;
  char *v237;
  void **__dst;
  MTLFunctionStitchingAttributeKernel **v239;
  char *v240;
  _QWORD v241[3];

  v241[1] = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_opt_new();
  v5 = &a3[-*(int *)a3->var0];
  if (*(unsigned __int16 *)v5->var0 < 9u)
  {
    v6 = 0;
  }
  else
  {
    v6 = (int *)*(unsigned __int16 *)v5[8].var0;
    if (v6)
      v6 = (int *)((char *)v6 + (_QWORD)a3 + *(unsigned int *)((char *)v6 + (_QWORD)a3));
  }
  v7 = (unsigned __int16 *)((char *)v6 - *v6);
  if (*v7 >= 7u && (v8 = v7[3]) != 0)
    v9 = (int *)((char *)v6 + v8 + *(unsigned int *)((char *)v6 + v8));
  else
    v9 = 0;
  v10 = (id)objc_opt_new();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 4));
  std::string::basic_string[abi:ne180100](&__dst, (char *)v12 + *v12 + 4, *(unsigned int *)((char *)v12 + *v12));
  if (SHIBYTE(v240) >= 0)
    p_dst = (void **)&__dst;
  else
    p_dst = __dst;
  objc_msgSend(v10, "setFunctionName:", (id)objc_msgSend(v11, "initWithUTF8String:", p_dst));
  if (SHIBYTE(v240) < 0)
    operator delete(__dst);
  v225 = v4;
  v226 = v10;
  __dst = 0;
  v239 = 0;
  v240 = 0;
  v14 = (unsigned __int16 *)((char *)v9 - *v9);
  if (*v14 < 0xBu)
    goto LABEL_55;
  v15 = v14[5];
  if (!v15)
    goto LABEL_55;
  v16 = (int *)((char *)v9 + v15 + *(unsigned int *)((char *)v9 + v15));
  if (!*v16)
    goto LABEL_55;
  for (i = 0; i < v37; ++i)
  {
    v18 = (_DWORD *)((char *)&v16[i + 1] + v16[i + 1]);
    v19 = (unsigned __int16 *)((char *)v18 - *v18);
    if (*v19 >= 5u)
    {
      v20 = v19[2];
      if (v20)
      {
        v21 = *((unsigned __int8 *)v18 + v20);
        if (v21 == 2)
        {
          v22 = [MTLFunctionStitchingAttributeKernel alloc];
          v23 = v239;
          if (v239 >= (MTLFunctionStitchingAttributeKernel **)v240)
          {
            v29 = ((char *)v239 - (char *)__dst) >> 3;
            if ((unint64_t)(v29 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v30 = (v240 - (char *)__dst) >> 2;
            if (v30 <= v29 + 1)
              v30 = v29 + 1;
            if ((unint64_t)(v240 - (char *)__dst) >= 0x7FFFFFFFFFFFFFF8)
              v26 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v26 = v30;
            if (v26)
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v240, v26);
            else
              v27 = 0;
            v31 = (MTLFunctionStitchingAttributeKernel **)&v27[8 * v29];
            *v31 = v22;
            v28 = v31 + 1;
            v35 = __dst;
            v32 = (void **)v239;
            if (v239 == (MTLFunctionStitchingAttributeKernel **)__dst)
              goto LABEL_49;
            do
            {
              v36 = (MTLFunctionStitchingAttributeKernel *)*--v32;
              *--v31 = v36;
            }
            while (v32 != v35);
            goto LABEL_48;
          }
        }
        else
        {
          if (v21 != 1)
            goto LABEL_52;
          v22 = [MTLFunctionStitchingAttributeAlwaysInline alloc];
          v23 = v239;
          if (v239 >= (MTLFunctionStitchingAttributeKernel **)v240)
          {
            v24 = ((char *)v239 - (char *)__dst) >> 3;
            if ((unint64_t)(v24 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v25 = (v240 - (char *)__dst) >> 2;
            if (v25 <= v24 + 1)
              v25 = v24 + 1;
            if ((unint64_t)(v240 - (char *)__dst) >= 0x7FFFFFFFFFFFFFF8)
              v26 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v26 = v25;
            if (v26)
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v240, v26);
            else
              v27 = 0;
            v31 = (MTLFunctionStitchingAttributeKernel **)&v27[8 * v24];
            *v31 = v22;
            v28 = v31 + 1;
            v33 = __dst;
            v32 = (void **)v239;
            if (v239 == (MTLFunctionStitchingAttributeKernel **)__dst)
              goto LABEL_49;
            do
            {
              v34 = (MTLFunctionStitchingAttributeKernel *)*--v32;
              *--v31 = v34;
            }
            while (v32 != v33);
LABEL_48:
            v32 = __dst;
LABEL_49:
            __dst = (void **)v31;
            v239 = v28;
            v240 = &v27[8 * v26];
            if (v32)
              operator delete(v32);
            goto LABEL_51;
          }
        }
        *v23 = v22;
        v28 = v23 + 1;
LABEL_51:
        v239 = v28;
      }
    }
LABEL_52:
    v37 = *v16;
  }
  if ((_DWORD)v37)
    objc_msgSend(v10, "setAttributes:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:"));
LABEL_55:
  v38 = 0;
  v235 = 0;
  v236 = 0;
  v237 = 0;
  v224 = v9;
  v39 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 6));
  v40 = (unsigned int *)((char *)v39 + *v39);
  do
  {
    v41 = &v40[v38 + 1];
    v42 = (AirReflection::Node *)((char *)v41 + *v41);
    v43 = (unsigned __int16 *)((char *)v42 - *(int *)v42);
    if (*v43 >= 5u)
    {
      v44 = v43[2];
      if (v44)
      {
        switch(*(_DWORD *)((char *)v42 + v44))
        {
          case 1:
            v45 = [MTLFunctionStitchingInputNode alloc];
            v46 = (int *)AirReflection::Node::node_as_FragmentFunction((AirReflection::Node *)((char *)v41 + *v41));
            v47 = (unsigned __int16 *)((char *)v46 - *v46);
            if (*v47 >= 5u && (v48 = v47[2]) != 0)
              v49 = *(unsigned int *)((char *)v46 + v48);
            else
              v49 = 0;
            v59 = -[MTLFunctionStitchingInputNode initWithArgumentIndex:](v45, "initWithArgumentIndex:", v49, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v123 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v123 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v124 = (v237 - (_BYTE *)v235) >> 2;
            if (v124 <= v123 + 1)
              v124 = v123 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v124;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v123];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v199 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v200 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v200;
            }
            while (v188 != v199);
            goto LABEL_339;
          case 2:
            v80 = (int *)AirReflection::Node::node_as_KernelFunction(v42);
            v81 = v80;
            v82 = (unsigned __int16 *)((char *)v80 - *v80);
            v83 = *v82;
            if (v83 < 9)
            {
              if (v83 <= 6)
              {
                v232 = 0;
                v233 = 0;
                v234 = 0;
                v229 = 0;
                v230 = 0;
                v231 = 0;
                goto LABEL_272;
              }
            }
            else if (v82[4])
            {
              v84 = (int *)((char *)v80 + v82[4] + *(unsigned int *)((char *)v80 + v82[4]));
              goto LABEL_182;
            }
            v84 = 0;
LABEL_182:
            v129 = v82[3];
            if (v129)
              v130 = (int *)((char *)v80 + v129 + *(unsigned int *)((char *)v80 + v129));
            else
              v130 = 0;
            v232 = 0;
            v233 = 0;
            v234 = 0;
            v229 = 0;
            v230 = 0;
            v231 = 0;
            if (v84 && *v84)
            {
              v150 = 0;
              v151 = 0;
              do
              {
                v152 = *((_QWORD *)v235 + v84[v151 + 1]);
                if (v150 >= v234)
                {
                  v153 = (v150 - (_BYTE *)v232) >> 3;
                  if ((unint64_t)(v153 + 1) >> 61)
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  v154 = (v234 - (_BYTE *)v232) >> 2;
                  if (v154 <= v153 + 1)
                    v154 = v153 + 1;
                  if ((unint64_t)(v234 - (_BYTE *)v232) >= 0x7FFFFFFFFFFFFFF8)
                    v155 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v155 = v154;
                  if (v155)
                    v156 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v234, v155);
                  else
                    v156 = 0;
                  v157 = &v156[8 * v153];
                  *(_QWORD *)v157 = v152;
                  v150 = v157 + 8;
                  v159 = (char *)v232;
                  v158 = v233;
                  if (v233 != v232)
                  {
                    do
                    {
                      v160 = *((_QWORD *)v158 - 1);
                      v158 -= 8;
                      *((_QWORD *)v157 - 1) = v160;
                      v157 -= 8;
                    }
                    while (v158 != v159);
                    v158 = (char *)v232;
                  }
                  v232 = v157;
                  v233 = v150;
                  v234 = &v156[8 * v155];
                  if (v158)
                    operator delete(v158);
                }
                else
                {
                  *(_QWORD *)v150 = v152;
                  v150 += 8;
                }
                v233 = v150;
                ++v151;
              }
              while (v151 < *v84);
            }
            if (v130 && *v130)
            {
              v161 = 0;
              v162 = v230;
              do
              {
                v163 = v130[v161 + 1];
                v164 = v235;
                if (v162 >= v231)
                {
                  v165 = (v162 - (_BYTE *)v229) >> 3;
                  if ((unint64_t)(v165 + 1) >> 61)
                    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                  v166 = (v231 - (_BYTE *)v229) >> 2;
                  if (v166 <= v165 + 1)
                    v166 = v165 + 1;
                  if ((unint64_t)(v231 - (_BYTE *)v229) >= 0x7FFFFFFFFFFFFFF8)
                    v167 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v167 = v166;
                  if (v167)
                    v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v231, v167);
                  else
                    v168 = 0;
                  v169 = &v168[8 * v165];
                  *(_QWORD *)v169 = v164[v163];
                  v162 = v169 + 8;
                  v171 = (char *)v229;
                  v170 = v230;
                  if (v230 != v229)
                  {
                    do
                    {
                      v172 = *((_QWORD *)v170 - 1);
                      v170 -= 8;
                      *((_QWORD *)v169 - 1) = v172;
                      v169 -= 8;
                    }
                    while (v170 != v171);
                    v170 = (char *)v229;
                  }
                  v229 = v169;
                  v230 = v162;
                  v231 = &v168[8 * v167];
                  if (v170)
                    operator delete(v170);
                }
                else
                {
                  *(_QWORD *)v162 = *((_QWORD *)v235 + v163);
                  v162 += 8;
                }
                v230 = v162;
                ++v161;
              }
              while (v161 < *v130);
            }
LABEL_272:
            v173 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:");
            v174 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:");
            v175 = objc_alloc(MEMORY[0x1E0CB3940]);
            v176 = (unsigned int *)((char *)v81 + *(unsigned __int16 *)((char *)v81 - *v81 + 4));
            std::string::basic_string[abi:ne180100](__p, (char *)v176 + *v176 + 4, *(unsigned int *)((char *)v176 + *v176));
            if (v228 >= 0)
              v177 = __p;
            else
              v177 = (void **)__p[0];
            v178 = (id)objc_msgSend(v175, "initWithUTF8String:", v177, v224);
            v10 = v226;
            if (v228 < 0)
              operator delete(__p[0]);
            v179 = -[MTLFunctionStitchingFunctionNode initWithName:arguments:controlDependencies:]([MTLFunctionStitchingFunctionNode alloc], "initWithName:arguments:controlDependencies:", v178, v174, v173);
            v180 = v179;
            v181 = v236;
            if (v236 >= (MTLFunctionStitchingFunctionNode **)v237)
            {
              v183 = ((char *)v236 - (_BYTE *)v235) >> 3;
              if ((unint64_t)(v183 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v184 = (v237 - (_BYTE *)v235) >> 2;
              if (v184 <= v183 + 1)
                v184 = v183 + 1;
              if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
                v185 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v185 = v184;
              if (v185)
                v186 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v185);
              else
                v186 = 0;
              v209 = (MTLFunctionStitchingFunctionNode **)&v186[8 * v183];
              *v209 = v180;
              v182 = v209 + 1;
              v211 = (char *)v235;
              v210 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  v212 = (MTLFunctionStitchingFunctionNode *)*((_QWORD *)v210 - 1);
                  v210 -= 8;
                  *--v209 = v212;
                }
                while (v210 != v211);
                v210 = (char *)v235;
              }
              v235 = v209;
              v236 = v182;
              v237 = &v186[8 * v185];
              if (v210)
                operator delete(v210);
            }
            else
            {
              *v236 = v179;
              v182 = v181 + 1;
            }
            v236 = v182;
            if (v229)
            {
              v230 = (char *)v229;
              operator delete(v229);
            }
LABEL_334:
            if (v232)
            {
              v233 = (char *)v232;
              operator delete(v232);
            }
            break;
          case 3:
            v65 = [MTLFunctionStitchingInputBuffer alloc];
            v66 = (int *)AirReflection::Node::node_as_VertexFunction((AirReflection::Node *)((char *)v41 + *v41));
            v67 = (unsigned __int16 *)((char *)v66 - *v66);
            if (*v67 >= 7u && (v68 = v67[3]) != 0)
              v69 = *(unsigned int *)((char *)v66 + v68);
            else
              v69 = 0;
            v59 = -[MTLFunctionStitchingInputBuffer initWithBindIndex:](v65, "initWithBindIndex:", v69, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v119 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v119 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v120 = (v237 - (_BYTE *)v235) >> 2;
            if (v120 <= v119 + 1)
              v120 = v119 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v120;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v119];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v193 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v194 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v194;
            }
            while (v188 != v193);
            goto LABEL_339;
          case 4:
            v70 = (int *)Air::FunctionStitching::Node::node_as_BufferAddressNode(v42);
            v71 = [MTLFunctionStitchingInputBufferAddress alloc];
            v72 = (unsigned __int16 *)((char *)v70 - *v70);
            v73 = *v72;
            if (v73 < 5)
            {
              v74 = 0;
            }
            else
            {
              v74 = (int *)v72[2];
              if (v72[2])
                v74 = (int *)((char *)v74 + (_QWORD)v70 + *(unsigned int *)((char *)v74 + (_QWORD)v70));
            }
            v138 = (unsigned __int16 *)((char *)v74 - *v74);
            if (*v138 >= 7u && (v139 = v138[3]) != 0)
              v140 = *(unsigned int *)((char *)v74 + v139);
            else
              v140 = 0;
            if (v73 >= 7 && (v141 = v72[3]) != 0)
              v142 = *(_QWORD *)((char *)v70 + v141);
            else
              v142 = 0;
            v59 = -[MTLFunctionStitchingInputBufferAddress initWithBindIndex:byteOffset:dereference:](v71, "initWithBindIndex:byteOffset:dereference:", v140, v142, 0, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v144 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v144 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v145 = (v237 - (_BYTE *)v235) >> 2;
            if (v145 <= v144 + 1)
              v145 = v144 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v145;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v144];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v195 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v196 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v196;
            }
            while (v188 != v195);
            goto LABEL_339;
          case 5:
            v50 = (int *)Air::FunctionStitching::Node::node_as_BufferAddressNode(v42);
            v51 = [MTLFunctionStitchingInputBufferAddress alloc];
            v52 = (unsigned __int16 *)((char *)v50 - *v50);
            v53 = *v52;
            if (v53 < 5)
            {
              v54 = 0;
            }
            else
            {
              v54 = (int *)v52[2];
              if (v52[2])
                v54 = (int *)((char *)v54 + (_QWORD)v50 + *(unsigned int *)((char *)v54 + (_QWORD)v50));
            }
            v131 = (unsigned __int16 *)((char *)v54 - *v54);
            if (*v131 >= 7u && (v132 = v131[3]) != 0)
              v133 = *(unsigned int *)((char *)v54 + v132);
            else
              v133 = 0;
            if (v53 >= 7 && (v134 = v52[3]) != 0)
              v135 = *(_QWORD *)((char *)v50 + v134);
            else
              v135 = 0;
            v59 = -[MTLFunctionStitchingInputBufferAddress initWithBindIndex:byteOffset:dereference:](v51, "initWithBindIndex:byteOffset:dereference:", v133, v135, 1, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v136 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v136 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v137 = (v237 - (_BYTE *)v235) >> 2;
            if (v137 <= v136 + 1)
              v137 = v136 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v137;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v136];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v191 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v192 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v192;
            }
            while (v188 != v191);
            goto LABEL_339;
          case 6:
            v85 = (int *)AirReflection::Node::node_as_MeshFunction(v42);
            v86 = [MTLFunctionStitchingInputTexture alloc];
            v87 = (unsigned __int16 *)((char *)v85 - *v85);
            if (*v87 >= 5u && (v88 = v87[2]) != 0)
              v89 = *(unsigned int *)((char *)v85 + v88);
            else
              v89 = 0;
            v59 = -[MTLFunctionStitchingInputTexture initWithBindIndex:](v86, "initWithBindIndex:", v89, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v125 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v125 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v126 = (v237 - (_BYTE *)v235) >> 2;
            if (v126 <= v125 + 1)
              v126 = v125 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v126;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v125];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v201 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v202 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v202;
            }
            while (v188 != v201);
            goto LABEL_339;
          case 7:
            v90 = (int *)AirReflection::Node::node_as_ObjectFunction(v42);
            v91 = [MTLFunctionStitchingInputSampler alloc];
            v92 = (unsigned __int16 *)((char *)v90 - *v90);
            if (*v92 >= 5u && (v93 = v92[2]) != 0)
              v94 = *(unsigned int *)((char *)v90 + v93);
            else
              v94 = 0;
            v59 = -[MTLFunctionStitchingInputSampler initWithBindIndex:](v91, "initWithBindIndex:", v94, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v127 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v127 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v128 = (v237 - (_BYTE *)v235) >> 2;
            if (v128 <= v127 + 1)
              v128 = v127 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v128;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v127];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v203 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v204 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v204;
            }
            while (v188 != v203);
            goto LABEL_339;
          case 8:
            v75 = (int *)Air::FunctionStitching::Node::node_as_ThreadgroupNode(v42);
            v76 = [MTLFunctionStitchingInputThreadgroup alloc];
            v77 = (unsigned __int16 *)((char *)v75 - *v75);
            if (*v77 >= 5u && (v78 = v77[2]) != 0)
              v79 = *(unsigned int *)((char *)v75 + v78);
            else
              v79 = 0;
            v59 = -[MTLFunctionStitchingInputThreadgroup initWithBindIndex:](v76, "initWithBindIndex:", v79, v224);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v121 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v121 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v122 = (v237 - (_BYTE *)v235) >> 2;
            if (v122 <= v121 + 1)
              v122 = v121 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v122;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v121];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v197 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v198 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v198;
            }
            while (v188 != v197);
            goto LABEL_339;
          case 9:
            v59 = -[MTLFunctionStitchingInputImageblock initWithBindIndex:]([MTLFunctionStitchingInputImageblock alloc], "initWithBindIndex:", 0);
            v60 = (MTLFunctionStitchingInputImageblock **)v236;
            if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              goto LABEL_212;
            v111 = ((char *)v236 - (_BYTE *)v235) >> 3;
            if ((unint64_t)(v111 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v112 = (v237 - (_BYTE *)v235) >> 2;
            if (v112 <= v111 + 1)
              v112 = v111 + 1;
            if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
              v63 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v63 = v112;
            if (v63)
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
            else
              v64 = 0;
            v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v111];
            *v187 = v59;
            v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
            v189 = (char *)v235;
            v188 = (char *)v236;
            if (v236 == v235)
              goto LABEL_340;
            do
            {
              v190 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
              v188 -= 8;
              *--v187 = v190;
            }
            while (v188 != v189);
            goto LABEL_339;
          case 0xA:
            v55 = (int *)Air::FunctionStitching::Node::node_as_BuiltinNode(v42);
            v56 = (unsigned __int16 *)((char *)v55 - *v55);
            if (*v56 < 5u)
              goto LABEL_69;
            v57 = v56[2];
            if (!v57)
              goto LABEL_69;
            v58 = *(int *)((char *)v55 + v57);
            if (v58 == 1)
            {
              v59 = objc_alloc_init(MTLFunctionStitchingBuiltinThreadPositionInThreadgroup);
              v60 = (MTLFunctionStitchingInputImageblock **)v236;
              if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
                goto LABEL_212;
              v215 = ((char *)v236 - (_BYTE *)v235) >> 3;
              if ((unint64_t)(v215 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v216 = (v237 - (_BYTE *)v235) >> 2;
              if (v216 <= v215 + 1)
                v216 = v215 + 1;
              if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
                v63 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v63 = v216;
              if (v63)
                v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
              else
                v64 = 0;
              v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v215];
              *v187 = v59;
              v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
              v217 = (char *)v235;
              v188 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  v218 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
                  v188 -= 8;
                  *--v187 = v218;
                }
                while (v188 != v217);
                goto LABEL_339;
              }
            }
            else
            {
              if (v58)
                break;
LABEL_69:
              v59 = objc_alloc_init(MTLFunctionStitchingBuiltinThreadPositionInGrid);
              v60 = (MTLFunctionStitchingInputImageblock **)v236;
              if (v236 < (MTLFunctionStitchingFunctionNode **)v237)
              {
LABEL_212:
                *v60 = v59;
                v143 = (MTLFunctionStitchingFunctionNode **)(v60 + 1);
                goto LABEL_342;
              }
              v61 = ((char *)v236 - (_BYTE *)v235) >> 3;
              if ((unint64_t)(v61 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v62 = (v237 - (_BYTE *)v235) >> 2;
              if (v62 <= v61 + 1)
                v62 = v61 + 1;
              if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
                v63 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v63 = v62;
              if (v63)
                v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v63);
              else
                v64 = 0;
              v187 = (MTLFunctionStitchingInputImageblock **)&v64[8 * v61];
              *v187 = v59;
              v143 = (MTLFunctionStitchingFunctionNode **)(v187 + 1);
              v213 = (char *)v235;
              v188 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  v214 = (MTLFunctionStitchingInputImageblock *)*((_QWORD *)v188 - 1);
                  v188 -= 8;
                  *--v187 = v214;
                }
                while (v188 != v213);
LABEL_339:
                v188 = (char *)v235;
              }
            }
LABEL_340:
            v235 = v187;
            v236 = v143;
            v237 = &v64[8 * v63];
            if (v188)
              operator delete(v188);
LABEL_342:
            v236 = v143;
            break;
          case 0xB:
            v95 = (int *)Air::FunctionStitching::Node::node_as_EarlyReturnNode(v42);
            v96 = v95;
            v97 = (unsigned __int16 *)((char *)v95 - *v95);
            if (*v97 >= 7u && (v98 = v97[3]) != 0)
            {
              v99 = (int *)((char *)v95 + v98 + *(unsigned int *)((char *)v95 + v98));
              v232 = 0;
              v233 = 0;
              v234 = 0;
              if (*v99)
              {
                v100 = 0;
                v101 = 0;
                do
                {
                  v102 = *((_QWORD *)v235 + v99[v101 + 1]);
                  if (v100 >= v234)
                  {
                    v103 = (v100 - (_BYTE *)v232) >> 3;
                    if ((unint64_t)(v103 + 1) >> 61)
                      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
                    v104 = (v234 - (_BYTE *)v232) >> 2;
                    if (v104 <= v103 + 1)
                      v104 = v103 + 1;
                    if ((unint64_t)(v234 - (_BYTE *)v232) >= 0x7FFFFFFFFFFFFFF8)
                      v105 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v105 = v104;
                    if (v105)
                      v106 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v234, v105);
                    else
                      v106 = 0;
                    v107 = &v106[8 * v103];
                    *(_QWORD *)v107 = v102;
                    v100 = v107 + 8;
                    v109 = (char *)v232;
                    v108 = v233;
                    if (v233 != v232)
                    {
                      do
                      {
                        v110 = *((_QWORD *)v108 - 1);
                        v108 -= 8;
                        *((_QWORD *)v107 - 1) = v110;
                        v107 -= 8;
                      }
                      while (v108 != v109);
                      v108 = (char *)v232;
                    }
                    v232 = v107;
                    v233 = v100;
                    v234 = &v106[8 * v105];
                    if (v108)
                      operator delete(v108);
                  }
                  else
                  {
                    *(_QWORD *)v100 = v102;
                    v100 += 8;
                  }
                  v233 = v100;
                  ++v101;
                }
                while (v101 < *v99);
              }
            }
            else
            {
              v232 = 0;
              v233 = 0;
              v234 = 0;
            }
            v113 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:");
            v114 = [MTLFunctionStitchingEarlyReturnNode alloc];
            v10 = v226;
            v115 = -[MTLFunctionStitchingEarlyReturnNode initWithCondition:controlDependencies:](v114, "initWithCondition:controlDependencies:", *((_QWORD *)v235 + *(unsigned int *)((char *)v96 + *(unsigned __int16 *)((char *)v96 - *v96 + 4))), v113);
            v116 = v115;
            v117 = v236;
            if (v236 >= (MTLFunctionStitchingFunctionNode **)v237)
            {
              v146 = ((char *)v236 - (_BYTE *)v235) >> 3;
              if ((unint64_t)(v146 + 1) >> 61)
                std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
              v147 = (v237 - (_BYTE *)v235) >> 2;
              if (v147 <= v146 + 1)
                v147 = v146 + 1;
              if ((unint64_t)(v237 - (_BYTE *)v235) >= 0x7FFFFFFFFFFFFFF8)
                v148 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v148 = v147;
              if (v148)
                v149 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v237, v148);
              else
                v149 = 0;
              v205 = (MTLFunctionStitchingEarlyReturnNode **)&v149[8 * v146];
              *v205 = v116;
              v118 = (MTLFunctionStitchingFunctionNode **)(v205 + 1);
              v207 = (char *)v235;
              v206 = (char *)v236;
              if (v236 != v235)
              {
                do
                {
                  v208 = (MTLFunctionStitchingEarlyReturnNode *)*((_QWORD *)v206 - 1);
                  v206 -= 8;
                  *--v205 = v208;
                }
                while (v206 != v207);
                v206 = (char *)v235;
              }
              v235 = v205;
              v236 = v118;
              v237 = &v149[8 * v148];
              if (v206)
                operator delete(v206);
            }
            else
            {
              *v236 = &v115->super;
              v118 = v117 + 1;
            }
            v236 = v118;
            goto LABEL_334;
          default:
            break;
        }
      }
    }
    ++v38;
  }
  while (v38 < *v40);
  objc_msgSend(v10, "setOutputNode:", *((_QWORD *)v235 + *(unsigned int *)((char *)v224 + *(unsigned __int16 *)((char *)v224 - *v224 + 8))));
  v219 = (id)objc_opt_new();
  v220 = (MTLFunctionStitchingFunctionNode **)v235;
  v221 = v236;
  while (v220 != v221)
  {
    v222 = (uint64_t)*v220;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v219, "addObject:", v222);
    ++v220;
  }
  objc_msgSend(v10, "setNodes:", v219);
  v241[0] = v10;
  objc_msgSend(v225, "setFunctionGraphs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v241, 1));
  if (v235)
  {
    v236 = (MTLFunctionStitchingFunctionNode **)v235;
    operator delete(v235);
  }
  if (__dst)
  {
    v239 = (MTLFunctionStitchingAttributeKernel **)__dst;
    operator delete(__dst);
  }
  return v225;
}

- (id)recompileFunction:(id)a3 inLibrary:(id)a4 toArchive:(id)a5 toBinary:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  NSObject *v12;
  void *v14;
  MTLFunctionDescriptor *v15;
  id v16;
  NSObject *v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  __int128 *v22;
  __int128 *v23;
  __int128 v24;
  void *v25;
  id v26;
  char *v27;
  char *v28;
  id *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id *i;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _MTLLibrary *v53;
  void *v54;
  NSObject *v56;
  void *__p;
  char *v58;
  char *v59;
  void *v60;
  __int128 *v61;
  void *buffer_ptr;
  size_t size_ptr;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v8 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v12 = objc_msgSend(a3, "airScript");
  if (!v12 && !v8)
    return a3;
  if (!v12 && v8)
  {
    *(_QWORD *)&v64 = 0;
    v60 = 0;
    objc_msgSend(a4, "getFunctionAliasAndNameForHash:functionName:alias:", objc_msgSend(a3, "bitCodeHash"), &v64, &v60);
    if (v60)
      v14 = v60;
    else
      v14 = (void *)v64;
    v15 = objc_alloc_init(MTLFunctionDescriptor);
    -[MTLFunctionDescriptor setName:](v15, "setName:", v14);
    -[MTLFunctionDescriptor setOptions:](v15, "setOptions:", -[MTLFunctionDescriptor options](v15, "options") | 1);
    v16 = (id)objc_msgSend(a4, "newFunctionWithDescriptor:destinationArchive:error:", v15, a5, a7);

    return v16;
  }
  buffer_ptr = 0;
  size_ptr = 0;
  v17 = dispatch_data_create_map(v12, (const void **)&buffer_ptr, &size_ptr);
  v18 = (unsigned int *)buffer_ptr;
  if (!strncmp((const char *)buffer_ptr + 4, "AIRC", 4uLL))
  {
    v42 = -[_MTLBinaryArchive newFunctionDescriptorWithAirScript:](self, "newFunctionDescriptorWithAirScript:", (char *)v18 + *v18);
    v43 = v42;
    if (v8)
      objc_msgSend(v42, "setOptions:", objc_msgSend(v42, "options") | 1);
    dispatch_release(v17);
    objc_msgSend(a3, "bitCodeHash");
    v64 = 0u;
    v65 = 0u;
    if (a3)
      objc_msgSend(a3, "baseFunctionHash");
    v44 = (id)objc_msgSend(a4, "newFunctionWithHash:", &v64);
    v45 = -[_MTLBinaryArchive recompileFunction:inLibrary:toArchive:toBinary:error:](self, "recompileFunction:inLibrary:toArchive:toBinary:error:", v44, a4, a5, 0, a7);
    v46 = v45;
    if (v45)
    {
      if (v45 == v44)
      {
        v60 = 0;
        __p = 0;
        objc_msgSend(a4, "getFunctionAliasAndNameForHash:functionName:alias:", &v64, &v60, &__p);
        if (__p)
          v54 = __p;
        else
          v54 = v60;
        objc_msgSend(v43, "setName:", v54);
        v16 = (id)objc_msgSend(a4, "newFunctionWithDescriptor:destinationArchive:error:", v43, a5, a7);

        if (v60)
        if (__p)

      }
      else
      {

        v47 = objc_msgSend(v46, "libraryData");
        v48 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v47 + 128))(v47);
        v53 = MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, v48, 0, v49, v50, v51, v52);
        objc_msgSend(v43, "setName:", objc_msgSend(v46, "name"));
        v16 = -[_MTLLibrary newFunctionWithDescriptor:destinationArchive:error:](v53, "newFunctionWithDescriptor:destinationArchive:error:", v43, a5, a7);

      }
    }
    else
    {

      return 0;
    }
    return v16;
  }
  v19 = objc_msgSend(a3, "bitCodeHash");
  v20 = objc_msgSend(a3, "libraryData");
  v21 = (*(_QWORD *(**)(void **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v20 + 272))(&v60, v20, v19);
  v56 = v17;
  __p = 0;
  v58 = 0;
  v59 = 0;
  v22 = (__int128 *)v60;
  v23 = v61;
  if (v60 == v61)
  {
LABEL_35:
    v37 = (char *)buffer_ptr;
    v38 = *(unsigned int *)buffer_ptr;
    v39 = (void *)MEMORY[0x186DAC640](v21);
    v40 = -[_MTLBinaryArchive getLibraryDescriptorWithAirScrpt:](self, "getLibraryDescriptorWithAirScrpt:", &v37[v38]);
    dispatch_release(v56);
    objc_msgSend(v40, "setFunctions:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:"));
    v16 = (id)-[MTLDevice newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:](self->_device, "newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:", v40, a5, a7);
    for (i = (id *)__p; i != (id *)v58; ++i)

    if (v16)
      v16 = (id)objc_msgSend(v16, "newFunctionWithName:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "functionGraphs"), "objectAtIndexedSubscript:", 0), "functionName"));
    objc_autoreleasePoolPop(v39);
LABEL_49:
    v29 = (id *)__p;
    if (__p)
      goto LABEL_50;
    goto LABEL_51;
  }
  while (1)
  {
    v24 = v22[1];
    v64 = *v22;
    v65 = v24;
    v25 = (void *)objc_msgSend(a4, "newFunctionWithHash:", &v64);
    v26 = -[_MTLBinaryArchive recompileFunction:inLibrary:toArchive:toBinary:error:](self, "recompileFunction:inLibrary:toArchive:toBinary:error:", v25, a4, a5, 0, a7);
    if (!v26)
      break;

    v27 = v58;
    if (v58 >= v59)
    {
      v30 = (v58 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v30 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v31 = (v59 - (_BYTE *)__p) >> 2;
      if (v31 <= v30 + 1)
        v31 = v30 + 1;
      if ((unint64_t)(v59 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v32 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v32 = v31;
      if (v32)
        v21 = std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v59, v32);
      else
        v21 = 0;
      v33 = (char *)&v21[v30];
      *(_QWORD *)v33 = v26;
      v28 = v33 + 8;
      v35 = (char *)__p;
      v34 = v58;
      if (v58 != __p)
      {
        do
        {
          v36 = *((_QWORD *)v34 - 1);
          v34 -= 8;
          *((_QWORD *)v33 - 1) = v36;
          v33 -= 8;
        }
        while (v34 != v35);
        v34 = (char *)__p;
      }
      __p = v33;
      v58 = v28;
      v59 = (char *)&v21[v32];
      if (v34)
        operator delete(v34);
    }
    else
    {
      *(_QWORD *)v58 = v26;
      v28 = v27 + 8;
    }
    v58 = v28;
LABEL_33:
    if (!v26)
    {
      v16 = 0;
      goto LABEL_49;
    }
    v22 += 2;
    if (v22 == v23)
      goto LABEL_35;
  }

  v29 = (id *)__p;
  if (__p != v58)
  {
    do

    while (v29 != (id *)v58);
    goto LABEL_33;
  }
  v16 = 0;
  if (!__p)
    goto LABEL_51;
LABEL_50:
  v58 = (char *)v29;
  operator delete(v29);
LABEL_51:
  if (v60)
  {
    v61 = (__int128 *)v60;
    operator delete(v60);
  }
  return v16;
}

- (BOOL)recompileStatelessToArchive:(id)a3 error:(id *)a4
{
  MTLAirNTObject **begin;
  MTLAirNTObject **end;
  MTLAirNTObject *v8;
  NSObject *queue;
  void *v10;
  id v11;
  _QWORD block[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  begin = self->_airntFromDescriptorFunctionList.__begin_;
  end = self->_airntFromDescriptorFunctionList.__end_;
  if (begin == end)
    return 1;
  while (1)
  {
    v8 = *begin;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___MTLBinaryArchive_recompileStatelessToArchive_error___block_invoke;
    block[3] = &unk_1E0FE2A68;
    block[4] = self;
    block[5] = &v20;
    block[7] = v8;
    block[8] = a4;
    block[6] = &v14;
    dispatch_sync(queue, block);
    v10 = (void *)v21[5];
    if (v10)
    {
      if (objc_msgSend(v10, "isStub"))
        goto LABEL_10;
      if (v21[5] && v15[5])
        break;
    }
LABEL_8:
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
    if (++begin == end)
      return 1;
  }
  v11 = -[_MTLBinaryArchive recompileFunction:inLibrary:toArchive:toBinary:error:](self, "recompileFunction:inLibrary:toArchive:toBinary:error:");

  if (v11)
  {

    goto LABEL_8;
  }
LABEL_10:
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return 0;
}

- (BOOL)recompilePipelinesToArchive:(id)a3 error:(id *)a4
{
  MTLPipelineNTObject **begin;
  MTLPipelineNTObject **end;
  MTLPipelineNTObject *v9;
  MTLAirNTObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  id v15;
  uint64_t v16;
  MTLAirNTObject *v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  MTLAirNTObject *v24;
  id v25;
  void *v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  MTLAirNTObject *v30;
  id v31;
  BOOL result;
  id v33;
  const __CFString *v34;
  MTLPipelineNTObject **v35;
  NSObject *object;
  size_t size_ptr;
  void *buffer_ptr;

  begin = self->_airntPipelineList.__begin_;
  end = self->_airntPipelineList.__end_;
  if (begin == end)
    return 1;
  v35 = self->_airntPipelineList.__end_;
  while (2)
  {
    v9 = *begin;
    v10 = self->_airntObjectList.__begin_[*((unsigned int *)*begin + 2 * (*(_DWORD *)*begin == 3) + 2)];
    v11 = -[_MTLBinaryArchive materializeAirScript:](self, "materializeAirScript:", v10);
    if (!v11)
    {
      if (!a4)
        return 0;
      v33 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to materialize AirScript for pipeline")), MTLBinaryArchiveErrorInvalidFile);
      result = 0;
      *a4 = v33;
      return result;
    }
    v12 = v11;
    size_ptr = 0;
    buffer_ptr = 0;
    v13 = dispatch_data_create_map(v11, (const void **)&buffer_ptr, &size_ptr);
    object = v13;
    v14 = (char *)buffer_ptr + *(unsigned int *)buffer_ptr;
    switch(*(_DWORD *)v9)
    {
      case 0:
        v15 = -[_MTLBinaryArchive newRenderPipelineDescriptorWithScript:obj:destinationArchive:error:](self, "newRenderPipelineDescriptorWithScript:obj:destinationArchive:error:", v14, v10, a3, a4);
        v16 = *((unsigned int *)v9 + 4);
        if ((_DWORD)v16 == -1)
          v17 = 0;
        else
          v17 = self->_airntObjectList.__begin_[v16];
        v25 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v10, a3, a4);
        v26 = v25;
        if (v25)
          v27 = v17 == 0;
        else
          v27 = 1;
        if (v27)
        {
          if (!v25)
          {

            dispatch_release(object);
            dispatch_release(v12);
            if (a4)
            {
              v34 = CFSTR("Failed to materialize vertex function bitcode for render pipeline");
LABEL_45:
              *a4 = newErrorWithMessage((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v34), MTLBinaryArchiveErrorCompilationFailure);
            }
            return 0;
          }
          v28 = 0;
        }
        else
        {
          v28 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v17, a3, a4);
        }
        objc_msgSend(v15, "setVertexFunction:", v26);
        objc_msgSend(v15, "setFragmentFunction:", v28);
        v18 = objc_msgSend(a3, "addRenderPipelineFunctionsWithDescriptor:error:", v15, a4);

        goto LABEL_33;
      case 1:
        v15 = -[_MTLBinaryArchive newComputePipelineDescriptorWithScript:obj:destinationArchive:error:](self, "newComputePipelineDescriptorWithScript:obj:destinationArchive:error:", v14, v10, a3, a4);
        v19 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v10, a3, a4);
        if (!v19)
        {

          dispatch_release(object);
          dispatch_release(v12);
          if (a4)
          {
            v34 = CFSTR("Failed to materialize function bitcode for compute pipeline");
            goto LABEL_45;
          }
          return 0;
        }
        v20 = v19;
        objc_msgSend(v15, "setComputeFunction:", v19);
        v21 = objc_msgSend(a3, "addComputePipelineFunctionsWithDescriptor:error:", v15, a4);
        goto LABEL_12;
      case 2:
        v15 = -[_MTLBinaryArchive newTileRenderPipelineDescriptorWithScript:obj:destinationArchive:error:](self, "newTileRenderPipelineDescriptorWithScript:obj:destinationArchive:error:", v14, v10, a3, a4);
        v22 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v10, a3, a4);
        if (v22)
        {
          v20 = v22;
          objc_msgSend(v15, "setTileFunction:", v22);
          v21 = objc_msgSend(a3, "addTileRenderPipelineFunctionsWithDescriptor:error:", v15, a4);
LABEL_12:
          v18 = v21;

LABEL_33:
          v13 = object;
LABEL_34:
          dispatch_release(v13);
          dispatch_release(v12);
          if ((v18 & 1) == 0)
            return 0;
          if (++begin == end)
            return 1;
          continue;
        }

        dispatch_release(object);
        dispatch_release(v12);
        if (a4)
        {
          v34 = CFSTR("Failed to materialize function bitcode for tile render pipeline");
          goto LABEL_45;
        }
        return 0;
      case 3:
        v15 = -[_MTLBinaryArchive newMeshRenderPipelineDescriptorWithScript:obj:destinationArchive:error:](self, "newMeshRenderPipelineDescriptorWithScript:obj:destinationArchive:error:", v14, v10, a3, a4);
        v23 = *((unsigned int *)v9 + 6);
        if ((_DWORD)v23 == -1)
          v24 = 0;
        else
          v24 = self->_airntObjectList.__begin_[v23];
        v29 = *((unsigned int *)v9 + 2);
        if ((_DWORD)v29 == -1)
          v30 = 0;
        else
          v30 = self->_airntObjectList.__begin_[v29];
        v31 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v10, a3, a4);
        if (v24)
          v24 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v24, a3, a4);
        if (v30)
          v30 = -[_MTLBinaryArchive newRecompiledFunctionWithAIRNTObject:destinationArchive:error:](self, "newRecompiledFunctionWithAIRNTObject:destinationArchive:error:", v30, a3, a4);
        objc_msgSend(v15, "setMeshFunction:", v31);
        objc_msgSend(v15, "setObjectFunction:", v30);
        objc_msgSend(v15, "setFragmentFunction:", v24);
        v18 = objc_msgSend(a3, "addMeshRenderPipelineFunctionsWithDescriptor:error:", v15, a4);

        end = v35;
        goto LABEL_33;
      default:
        v18 = 1;
        goto LABEL_34;
    }
  }
}

- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  char v9;

  v7 = (void *)objc_opt_new();
  v8 = (void *)-[MTLDevice newBinaryArchiveWithDescriptor:error:](self->_device, "newBinaryArchiveWithDescriptor:error:", v7, a4);

  if (!v8)
    return 0;
  objc_msgSend(v8, "setRecompilationTarget:", 1);
  if (-[_MTLBinaryArchive recompileToArchive:error:](self, "recompileToArchive:error:", v8, a4))
    v9 = objc_msgSend(v8, "serializeToURL:error:", a3, a4);
  else
    v9 = 0;

  return v9;
}

- (BOOL)recompileToArchive:(id)a3 error:(id *)a4
{
  void *v6;
  const __CFString *v7;

  if (self == a3)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = CFSTR("Archive cannot be recompiled in place");
      goto LABEL_10;
    }
    return 0;
  }
  if (self->_isLegacy)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = CFSTR("Legacy archive cannot be recompiled");
LABEL_10:
      *a4 = newErrorWithMessage((NSString *)objc_msgSend(v6, "stringWithFormat:", v7), MTLBinaryArchiveErrorInvalidFile);
      return 0;
    }
    return 0;
  }
  if (self->_hasBuiltins)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = CFSTR("Archive containting builtin objects cannot be recompiled");
      goto LABEL_10;
    }
    return 0;
  }
  if (!self->_airntBinaryList.__table_.__p2_.__value_
    && self->_airntObjectList.__begin_ == self->_airntObjectList.__end_
    && self->_airntFromDescriptorFunctionList.__begin_ == self->_airntFromDescriptorFunctionList.__end_
    && self->_airntPipelineList.__begin_ == self->_airntPipelineList.__end_)
  {
    if (!a4)
      return 0;
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = CFSTR("No recompilable artifacts found");
    goto LABEL_10;
  }
  objc_msgSend(a3, "initMetalScriptWithArchive:", self);
  if (!-[_MTLBinaryArchive recompilePipelinesToArchive:error:](self, "recompilePipelinesToArchive:error:", a3, a4))
    return 0;
  return -[_MTLBinaryArchive recompileStatelessToArchive:error:](self, "recompileStatelessToArchive:error:", a3, a4);
}

- (BOOL)legacySerializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  id v16;
  BOOL v17;
  int v18;
  int v19;
  _BOOL4 v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char v27;
  int v28;
  unint64_t *v29;
  char *v30;
  unint64_t *v31;
  unint64_t *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  unint64_t *v43;
  char *v44;
  unint64_t *v45;
  unint64_t *v46;
  unint64_t v47;
  _BOOL4 v48;
  int v49;
  MTLLoaderSliceIdentifier v50;
  MTLLoaderSliceIdentifier v51;
  unint64_t *v52;
  unint64_t *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  unint64_t *v58;
  char *v59;
  unint64_t *v60;
  unint64_t *v61;
  unint64_t v62;
  _BOOL4 v63;
  id v65;
  void *v66;
  uint64_t v67;
  void **p_cache;
  int v69;
  NSObject *queue;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  dispatch_data_t v75;
  _MTLBinaryArchive *v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t *v93;
  unsigned int v94;
  uint64_t v95;
  __int128 v96;
  char *v97;
  __int128 v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  char *v103;
  __int128 v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  NSObject **v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  uint64_t *i;
  uint64_t v119;
  __int128 v120;
  char *v121;
  __int128 v122;
  char *v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  char *v127;
  __int128 v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  NSObject **v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  NSObject *v142;
  uint64_t v143;
  int v144;
  id *v145;
  int v146;
  id *v147;
  int v148;
  id v149;
  id v150;
  void *v152;
  int v153;
  unsigned int v154;
  id v155;
  id v156;
  char v157;
  uint64_t v158;
  _MTLBinaryArchive *v159;
  void *v160;
  char *v161;
  char *v162;
  _QWORD block[8];
  __int128 v164;
  __int128 v165;
  void (*v166)(uint64_t);
  void *v167;
  void *__p;
  void *v169;
  uint64_t v170;
  _QWORD v171[7];
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t *v176;
  unint64_t *v177;
  unint64_t v178;
  uint64_t v179;
  __int128 v180;
  __int128 v181;
  _QWORD v182[3];
  _QWORD v183[6];

  v183[3] = *MEMORY[0x1E0C80C00];
  if (a5)
    *a5 = 0;
  v9 = (void *)MEMORY[0x186DAC640](self, a2);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = v10;
  v12 = a3;
  if ((a4 & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v10, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, a5);
    v12 = (id)objc_msgSend(v13, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
  }
  if (!v12)
  {
    if (!a5)
    {
      objc_autoreleasePoolPop(v9);
      return 0;
    }
    v16 = newErrorWithMessage(CFSTR("Output URL is invalid."), MTLBinaryArchiveErrorInvalidFile);
    v17 = 0;
    *a5 = v16;
    if (!v16)
      goto LABEL_226;
    goto LABEL_225;
  }
  v158 = objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v12, 0);
  if (!v158)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", objc_msgSend(v12, "path"), 0, 0);
    v158 = objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v12, a5);
    if (!v158)
    {
      v27 = a4;
      v28 = 0;
      if ((v27 & 1) == 0)
        goto LABEL_222;
      goto LABEL_221;
    }
  }
  if ((a4 & 0xC) != 0)
  {
    if ((self->_options & 2) == 0)
    {
      v14 = 0;
      v15 = (a4 & 8) == 0;
      goto LABEL_17;
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  v15 = 1;
LABEL_17:
  v159 = self;
  v155 = v12;
  v156 = a3;
  if ((a4 & 0x30) != 0)
  {
    if ((self->_options & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      v18 = 0;
      if ((a4 & 0x20) != 0)
        v15 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  if ((a4 & 0xC0) == 0)
  {
    v19 = 0;
    if (!a5)
      goto LABEL_35;
    goto LABEL_33;
  }
  if ((v159->_options & 4) != 0)
  {
    v19 = 1;
    if (!a5)
      goto LABEL_35;
    goto LABEL_33;
  }
  v19 = 0;
  if ((a4 & 0x80) != 0)
    v15 = 0;
  if (a5)
  {
LABEL_33:
    if (!v15)
      *a5 = newErrorWithMessage(CFSTR("Serialization options not compatible with this binary archive"), MTLBinaryArchiveErrorUnexpectedElement);
  }
LABEL_35:
  v178 = 0;
  v179 = 0;
  v176 = 0;
  v177 = 0;
  if (v159->_legacyPipelineFileIndex.__tree_.__pair3_.__value_)
    v20 = 1;
  else
    v20 = -[NSMutableDictionary count](v159->_entries, "count") != 0;
  v21 = v14 & v20;
  if (v21 == 1)
  {
    v22 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, v159->_device, &v179);
    v23 = v177 - v176;
    if ((unint64_t)(v23 + 1) >> 61)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v24 = (uint64_t)(v178 - (_QWORD)v176) >> 2;
    if (v24 <= v23 + 1)
      v24 = v23 + 1;
    if (v178 - (unint64_t)v176 >= 0x7FFFFFFFFFFFFFF8)
      v25 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v25 = v24;
    if (v25)
      v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v178, v25);
    else
      v26 = 0;
    v29 = (unint64_t *)&v26[8 * v23];
    v30 = &v26[8 * v25];
    *v29 = v22;
    v31 = v29 + 1;
    v33 = v176;
    v32 = v177;
    if (v177 != v176)
    {
      do
      {
        v34 = *--v32;
        *--v29 = v34;
      }
      while (v32 != v33);
      v32 = v176;
    }
    v176 = v29;
    v177 = v31;
    v178 = (unint64_t)v30;
    if (v32)
      operator delete(v32);
    v177 = v31;
  }
  if (v18)
  {
    v35 = +[MTLLoader sliceIDForDescriptors]();
    v36 = v35;
    v37 = v177;
    if ((unint64_t)v177 >= v178)
    {
      v39 = v177 - v176;
      if ((unint64_t)(v39 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v40 = (uint64_t)(v178 - (_QWORD)v176) >> 2;
      if (v40 <= v39 + 1)
        v40 = v39 + 1;
      if (v178 - (unint64_t)v176 >= 0x7FFFFFFFFFFFFFF8)
        v41 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v41 = v40;
      if (v41)
        v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v178, v41);
      else
        v42 = 0;
      v43 = (unint64_t *)&v42[8 * v39];
      v44 = &v42[8 * v41];
      *v43 = v36;
      v38 = v43 + 1;
      v46 = v176;
      v45 = v177;
      if (v177 != v176)
      {
        do
        {
          v47 = *--v45;
          *--v43 = v47;
        }
        while (v45 != v46);
        v45 = v176;
      }
      v176 = v43;
      v177 = v38;
      v178 = (unint64_t)v44;
      if (v45)
        operator delete(v45);
    }
    else
    {
      *v177 = v35;
      v38 = v37 + 1;
    }
    v177 = v38;
  }
  if (v159->_legacySpecializedFunctions.__table_.__p2_.__value_)
    v48 = 1;
  else
    v48 = v159->_legacySpecializedFunctionArchiveFileIndex.__tree_.__pair3_.__value_ != 0;
  v49 = v19 & v48;
  if ((v19 & v48 & 1) != 0)
  {
    v50 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:](_MTLBinaryArchive, "sliceIDForSpecializedFunctionsForLLVMVersion:", _MTLGetMTLCompilerLLVMVersionForDevice(v159->_device));
    v51 = v50;
    v52 = v177;
    if ((unint64_t)v177 >= v178)
    {
      v54 = v177 - v176;
      if ((unint64_t)(v54 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v55 = (uint64_t)(v178 - (_QWORD)v176) >> 2;
      if (v55 <= v54 + 1)
        v55 = v54 + 1;
      if (v178 - (unint64_t)v176 >= 0x7FFFFFFFFFFFFFF8)
        v56 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v56 = v55;
      if (v56)
        v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v178, v56);
      else
        v57 = 0;
      v58 = (unint64_t *)&v57[8 * v54];
      v59 = &v57[8 * v56];
      *v58 = (unint64_t)v51;
      v53 = v58 + 1;
      v61 = v176;
      v60 = v177;
      if (v177 != v176)
      {
        do
        {
          v62 = *--v60;
          *--v58 = v62;
        }
        while (v60 != v61);
        v60 = v176;
      }
      v176 = v58;
      v177 = v53;
      v178 = (unint64_t)v59;
      if (v60)
        operator delete(v60);
    }
    else
    {
      *v177 = (unint64_t)v50;
      v53 = v52 + 1;
    }
    v177 = v53;
  }
  else
  {
    v53 = v177;
  }
  v63 = v176 != v53 && v15;
  if (v176 != v53 || a5 == 0)
  {
    v66 = (void *)v158;
  }
  else
  {
    v65 = newErrorWithMessage(CFSTR("The binary archive contains no items eligible to be serialized"), MTLBinaryArchiveErrorInvalidFile);
    v66 = (void *)v158;
    v63 = 0;
    *a5 = v65;
  }
  memset(v183, 0, 24);
  memset(v182, 0, sizeof(v182));
  v172 = 0;
  v173 = &v172;
  v174 = 0x2020000000;
  v175 = 0;
  v67 = MEMORY[0x1E0C809B0];
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke;
  v171[3] = &unk_1E0FE2A90;
  v171[4] = v66;
  v171[5] = &v172;
  v171[6] = a5;
  v157 = a4;
  if (!v63)
  {
LABEL_207:
    v144 = 0;
    v145 = 0;
    v143 = 0;
    goto LABEL_213;
  }
  v153 = v49;
  p_cache = &OBJC_METACLASS____MTLLibrary.cache;
  v69 = +[MTLLoader serializeUniversalBinaryHeaderWithSlice:offset:length:count:writer:]((uint64_t)MTLLoader, (uint64_t)v176, 0, 0, (unint64_t)((char *)v177 - (char *)v176) >> 3, (uint64_t)v171);
  if ((v21 & v69) == 1)
  {
    *(_QWORD *)&v164 = 0;
    *((_QWORD *)&v164 + 1) = &v164;
    *(_QWORD *)&v165 = 0x4812000000;
    *((_QWORD *)&v165 + 1) = __Block_byref_object_copy__234;
    v166 = __Block_byref_object_dispose__235;
    v167 = &unk_182827312;
    __p = 0;
    v169 = 0;
    v170 = 0;
    queue = v159->_queue;
    block[0] = v67;
    block[1] = 3221225472;
    block[2] = __56___MTLBinaryArchive_legacySerializeToURL_options_error___block_invoke_237;
    block[3] = &unk_1E0FE2AE0;
    block[4] = v159;
    block[5] = &v164;
    block[6] = v179;
    block[7] = a4;
    dispatch_sync(queue, block);
    v183[0] = v173[3];
    v71 = v183[0];
    v69 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, *v176, *(_QWORD *)(*((_QWORD *)&v164 + 1) + 48), -1227133513* ((*(_QWORD *)(*((_QWORD *)&v164 + 1) + 56) - *(_QWORD *)(*((_QWORD *)&v164 + 1) + 48)) >> 4), v171);
    v72 = v173[3];
    v182[0] = v72 - v71;
    if ((unint64_t)((char *)v177 - (char *)v176) >= 9)
      +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v72, (uint64_t)v171);
    if (a5 && v69 != 1)
      *a5 = newErrorWithMessage(CFSTR("Serialization of binaries to file failed"), MTLBinaryArchiveErrorInvalidFile);
    _Block_object_dispose(&v164, 8);
    if (__p)
    {
      v169 = __p;
      operator delete(__p);
    }
    v154 = 1;
  }
  else
  {
    v154 = 0;
  }
  v152 = v11;
  if ((v18 & v69) == 1)
  {
    v73 = (void *)MTLPipelineCollection::JSONData(v159->_pipelineCollection.__ptr_.__value_);
    v74 = v73;
    if (v73)
      v75 = _MTLNSDataToDispatchData(v73, 0);
    else
      v75 = 0;

    v164 = 0u;
    v165 = 0u;
    LODWORD(v166) = 1065353216;
    v160 = 0;
    v161 = 0;
    v162 = 0;
    std::vector<MTLLoaderMachOPayload>::reserve(&v160, v75 != 0);
    if (v75)
    {
      v78 = v161;
      if (v161 >= v162)
      {
        v80 = 0x6DB6DB6DB6DB6DB7 * ((v161 - (_BYTE *)v160) >> 4);
        v81 = v80 + 1;
        if ((unint64_t)(v80 + 1) > 0x249249249249249)
          std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
        if (0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4) > v81)
          v81 = 0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4);
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v162 - (_BYTE *)v160) >> 4)) >= 0x124924924924924)
          v82 = 0x249249249249249;
        else
          v82 = v81;
        if (v82)
          v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v162, v82);
        else
          v83 = 0;
        v84 = &v83[112 * v80];
        v85 = &v83[112 * v82];
        *(_QWORD *)v84 = v75;
        *(_OWORD *)(v84 + 8) = 0u;
        *(_OWORD *)(v84 + 24) = 0u;
        v84[40] = (a4 & 2) != 0;
        *((_DWORD *)v84 + 11) = 0;
        *(_DWORD *)(v84 + 41) = 0;
        *((_QWORD *)v84 + 6) = 1;
        *(_OWORD *)(v84 + 56) = 0u;
        *(_OWORD *)(v84 + 72) = 0u;
        *(_OWORD *)(v84 + 88) = 0u;
        *((_QWORD *)v84 + 13) = 0;
        v79 = v84 + 112;
        v87 = (char *)v160;
        v86 = v161;
        if (v161 != v160)
        {
          do
          {
            v88 = *((_OWORD *)v86 - 7);
            v89 = *((_OWORD *)v86 - 5);
            *((_OWORD *)v84 - 6) = *((_OWORD *)v86 - 6);
            *((_OWORD *)v84 - 5) = v89;
            *((_OWORD *)v84 - 7) = v88;
            v90 = *((_OWORD *)v86 - 4);
            v91 = *((_OWORD *)v86 - 3);
            v92 = *((_OWORD *)v86 - 1);
            *((_OWORD *)v84 - 2) = *((_OWORD *)v86 - 2);
            *((_OWORD *)v84 - 1) = v92;
            *((_OWORD *)v84 - 4) = v90;
            *((_OWORD *)v84 - 3) = v91;
            v84 -= 112;
            v86 -= 112;
          }
          while (v86 != v87);
          v86 = v87;
        }
        v160 = v84;
        v161 = v79;
        v162 = v85;
        if (v86)
          operator delete(v86);
      }
      else
      {
        *(_QWORD *)v161 = v75;
        *(_OWORD *)(v78 + 8) = 0u;
        *(_OWORD *)(v78 + 24) = 0u;
        v78[40] = (a4 & 2) != 0;
        *(_DWORD *)(v78 + 41) = 0;
        *((_DWORD *)v78 + 11) = 0;
        *((_QWORD *)v78 + 6) = 1;
        *(_OWORD *)(v78 + 56) = 0u;
        *(_OWORD *)(v78 + 72) = 0u;
        *(_OWORD *)(v78 + 88) = 0u;
        v79 = v78 + 112;
        *((_QWORD *)v78 + 13) = 0;
      }
      v161 = v79;
    }
    v93 = (uint64_t *)v165;
    if ((_QWORD)v165)
    {
      v94 = (a4 >> 1) & 1;
      do
      {
        v95 = v93[6];
        if (v95)
        {
          v96 = *((_OWORD *)v93 + 2);
          v180 = *((_OWORD *)v93 + 1);
          v181 = v96;
          v97 = v161;
          if (v161 >= v162)
          {
            v100 = 0x6DB6DB6DB6DB6DB7 * ((v161 - (_BYTE *)v160) >> 4);
            v101 = v100 + 1;
            if ((unint64_t)(v100 + 1) > 0x249249249249249)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            if (0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4) > v101)
              v101 = 0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v162 - (_BYTE *)v160) >> 4)) >= 0x124924924924924)
              v102 = 0x249249249249249;
            else
              v102 = v101;
            if (v102)
              v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v162, v102);
            else
              v103 = 0;
            v104 = v181;
            v105 = &v103[112 * v100];
            *(_OWORD *)(v105 + 8) = v180;
            *(_QWORD *)v105 = v95;
            *(_OWORD *)(v105 + 24) = v104;
            v105[40] = v94;
            *((_DWORD *)v105 + 11) = 0;
            *(_DWORD *)(v105 + 41) = 0;
            *((_QWORD *)v105 + 6) = 1;
            *(_OWORD *)(v105 + 56) = 0u;
            *(_OWORD *)(v105 + 72) = 0u;
            *(_OWORD *)(v105 + 88) = 0u;
            *((_QWORD *)v105 + 13) = 0;
            v107 = (char *)v160;
            v106 = v161;
            v108 = v105;
            if (v161 != v160)
            {
              do
              {
                v109 = *((_OWORD *)v106 - 7);
                v110 = *((_OWORD *)v106 - 5);
                *((_OWORD *)v108 - 6) = *((_OWORD *)v106 - 6);
                *((_OWORD *)v108 - 5) = v110;
                *((_OWORD *)v108 - 7) = v109;
                v111 = *((_OWORD *)v106 - 4);
                v112 = *((_OWORD *)v106 - 3);
                v113 = *((_OWORD *)v106 - 1);
                *((_OWORD *)v108 - 2) = *((_OWORD *)v106 - 2);
                *((_OWORD *)v108 - 1) = v113;
                *((_OWORD *)v108 - 4) = v111;
                *((_OWORD *)v108 - 3) = v112;
                v108 -= 112;
                v106 -= 112;
              }
              while (v106 != v107);
              v106 = v107;
            }
            v99 = v105 + 112;
            v160 = v108;
            v161 = v105 + 112;
            v162 = &v103[112 * v102];
            if (v106)
              operator delete(v106);
          }
          else
          {
            *(_QWORD *)v161 = v95;
            v98 = v181;
            *(_OWORD *)(v97 + 8) = v180;
            *(_OWORD *)(v97 + 24) = v98;
            v97[40] = v94;
            *(_DWORD *)(v97 + 41) = 0;
            *((_DWORD *)v97 + 11) = 0;
            *((_QWORD *)v97 + 6) = 1;
            *(_OWORD *)(v97 + 56) = 0u;
            *(_OWORD *)(v97 + 72) = 0u;
            *(_OWORD *)(v97 + 88) = 0u;
            v99 = v97 + 112;
            *((_QWORD *)v97 + 13) = 0;
          }
          v161 = v99;
        }
        v93 = (uint64_t *)*v93;
      }
      while (v93);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v164);
    v114 = (NSObject **)v160;
    LODWORD(v115) = -1227133513 * ((v161 - (_BYTE *)v160) >> 4);
    if ((_DWORD)v115)
    {
      v116 = v173[3];
      v183[v154] = v116;
      p_cache = &OBJC_METACLASS____MTLLibrary.cache;
      v69 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, v176[v154], (uint64_t)v114, v115, v171);
      v182[v154] = v173[3] - v116;
      v115 = v115;
      do
      {
        v117 = *v114;
        v114 += 14;
        dispatch_release(v117);
        --v115;
      }
      while (v115);
      v77 = v154 + 1;
      if (v77 < v177 - v176)
        +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v173[3], (uint64_t)v171);
      if (a5 && v69 != 1)
        *a5 = newErrorWithMessage(CFSTR("Serialization of archives to file failed"), MTLBinaryArchiveErrorInvalidFile);
    }
    else
    {
      v69 = 1;
      p_cache = &OBJC_METACLASS____MTLLibrary.cache;
      LODWORD(v77) = v154;
    }
    v76 = v159;
    if (v160)
    {
      v161 = (char *)v160;
      operator delete(v160);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v164);
  }
  else
  {
    v76 = v159;
    LODWORD(v77) = v154;
  }
  if ((v153 & v69) == 1)
  {
    v164 = 0u;
    v165 = 0u;
    LODWORD(v166) = 1065353216;
    -[_MTLBinaryArchive getSpecializedFunctionArchivesToSerialize:](v76, "getSpecializedFunctionArchivesToSerialize:", &v164);
    v160 = 0;
    v161 = 0;
    v162 = 0;
    std::vector<MTLLoaderMachOPayload>::reserve(&v160, *((unint64_t *)&v165 + 1));
    for (i = (uint64_t *)v165; i; i = (uint64_t *)*i)
    {
      v119 = i[6];
      if (v119)
      {
        v120 = *((_OWORD *)i + 2);
        v180 = *((_OWORD *)i + 1);
        v181 = v120;
        v121 = v161;
        if (v161 >= v162)
        {
          v124 = 0x6DB6DB6DB6DB6DB7 * ((v161 - (_BYTE *)v160) >> 4);
          v125 = v124 + 1;
          if ((unint64_t)(v124 + 1) > 0x249249249249249)
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4) > v125)
            v125 = 0xDB6DB6DB6DB6DB6ELL * ((v162 - (_BYTE *)v160) >> 4);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v162 - (_BYTE *)v160) >> 4)) >= 0x124924924924924)
            v126 = 0x249249249249249;
          else
            v126 = v125;
          if (v126)
            v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTLLoaderMachOPayload>>((uint64_t)&v162, v126);
          else
            v127 = 0;
          v128 = v181;
          v129 = &v127[112 * v124];
          *(_OWORD *)(v129 + 8) = v180;
          *(_QWORD *)v129 = v119;
          *(_OWORD *)(v129 + 24) = v128;
          v129[40] = (v157 & 2) != 0;
          *((_DWORD *)v129 + 11) = 0;
          *(_DWORD *)(v129 + 41) = 0;
          *((_QWORD *)v129 + 6) = 1;
          *(_OWORD *)(v129 + 56) = 0u;
          *(_OWORD *)(v129 + 72) = 0u;
          *(_OWORD *)(v129 + 88) = 0u;
          *((_QWORD *)v129 + 13) = 0;
          v131 = (char *)v160;
          v130 = v161;
          v132 = v129;
          if (v161 != v160)
          {
            do
            {
              v133 = *((_OWORD *)v130 - 7);
              v134 = *((_OWORD *)v130 - 5);
              *((_OWORD *)v132 - 6) = *((_OWORD *)v130 - 6);
              *((_OWORD *)v132 - 5) = v134;
              *((_OWORD *)v132 - 7) = v133;
              v135 = *((_OWORD *)v130 - 4);
              v136 = *((_OWORD *)v130 - 3);
              v137 = *((_OWORD *)v130 - 1);
              *((_OWORD *)v132 - 2) = *((_OWORD *)v130 - 2);
              *((_OWORD *)v132 - 1) = v137;
              *((_OWORD *)v132 - 4) = v135;
              *((_OWORD *)v132 - 3) = v136;
              v132 -= 112;
              v130 -= 112;
            }
            while (v130 != v131);
            v130 = v131;
          }
          v123 = v129 + 112;
          v160 = v132;
          v161 = v129 + 112;
          v162 = &v127[112 * v126];
          if (v130)
            operator delete(v130);
        }
        else
        {
          *(_QWORD *)v161 = v119;
          v122 = v181;
          *(_OWORD *)(v121 + 8) = v180;
          *(_OWORD *)(v121 + 24) = v122;
          v121[40] = (v157 & 2) != 0;
          *(_DWORD *)(v121 + 41) = 0;
          *((_DWORD *)v121 + 11) = 0;
          *((_QWORD *)v121 + 6) = 1;
          *(_OWORD *)(v121 + 56) = 0u;
          *(_OWORD *)(v121 + 72) = 0u;
          *(_OWORD *)(v121 + 88) = 0u;
          v123 = v121 + 112;
          *((_QWORD *)v121 + 13) = 0;
        }
        v161 = v123;
      }
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(&v164);
    v138 = (NSObject **)v160;
    LODWORD(v139) = -1227133513 * ((v161 - (_BYTE *)v160) >> 4);
    if ((_DWORD)v139)
    {
      v140 = v173[3];
      v183[v77] = v140;
      p_cache = &OBJC_METACLASS____MTLLibrary.cache;
      v66 = (void *)v158;
      v141 = +[MTLLoader serializeMachOContainerWithSlice:payload:count:writer:]((uint64_t)MTLLoader, v176[v77], (uint64_t)v138, v139, v171);
      v182[v77] = v173[3] - v140;
      v139 = v139;
      do
      {
        v142 = *v138;
        v138 += 14;
        dispatch_release(v142);
        --v139;
      }
      while (v139);
      if ((v77 + 1) < (unint64_t)(v177 - v176))
        +[MTLLoader serializePaddingForOffset:writer:]((uint64_t)MTLLoader, v173[3], (uint64_t)v171);
      if (a5 && v141 != 1)
        *a5 = newErrorWithMessage(CFSTR("Serialization of archives to file failed"), MTLBinaryArchiveErrorInvalidFile);
    }
    else
    {
      LOBYTE(v141) = 1;
      v66 = (void *)v158;
      p_cache = (void **)(&OBJC_METACLASS____MTLLibrary + 16);
    }
    if (v160)
    {
      v161 = (char *)v160;
      operator delete(v160);
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v164);
    if ((v141 & 1) == 0)
      goto LABEL_212;
    goto LABEL_204;
  }
  v66 = (void *)v158;
  if (v69)
  {
LABEL_204:
    v11 = v152;
    if (objc_msgSend(v66, "seekToOffset:error:", 0, a5)
      && +[MTLLoader serializeUniversalBinaryHeaderWithSlice:offset:length:count:writer:]((uint64_t)(p_cache + 83), (uint64_t)v176, v183, v182, (unint64_t)((char *)v177 - (char *)v176) >> 3, (uint64_t)v171))
    {
      v143 = v173[3];
      v144 = 1;
      v145 = a5;
      goto LABEL_213;
    }
    goto LABEL_207;
  }
LABEL_212:
  v144 = 0;
  v145 = 0;
  v143 = 0;
  v11 = v152;
LABEL_213:
  v146 = v144 & objc_msgSend(v66, "truncateAtOffset:error:", v143, v145);
  if (v146)
    v147 = a5;
  else
    v147 = 0;
  v148 = objc_msgSend(v66, "closeAndReturnError:", v147);
  _Block_object_dispose(&v172, 8);
  if (v176)
  {
    v177 = v176;
    operator delete(v176);
  }
  v28 = v146 & v148;
  v12 = v155;
  if ((v157 & 1) != 0)
  {
    if (v28)
      v28 = objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v156, v155, 0, 0, 0, a5);
LABEL_221:
    objc_msgSend(v11, "removeItemAtURL:error:", v12, 0);
  }
LABEL_222:
  v17 = v28 != 0;
  if (!a5 || v28)
  {
    objc_autoreleasePoolPop(v9);
    if (!a5)
      return v17;
    goto LABEL_228;
  }
  v16 = *a5;
  if (*a5)
LABEL_225:
    v149 = v16;
LABEL_226:
  objc_autoreleasePoolPop(v9);
LABEL_228:
  if (*a5)
    v150 = *a5;
  return v17;
}

- (void)pipelineCollection
{
  return self->_pipelineCollection.__ptr_.__value_;
}

- (BOOL)getScriptsWithAIRNTObject:(void *)a3
{
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  OS_dispatch_data *v8;
  NSObject *metalScript;
  uint64_t v11;

  v11 = 0;
  v4 = -[_MTLBinaryArchive getLibraryInArchiveAtPos:atIndex:error:](self, "getLibraryInArchiveAtPos:atIndex:error:", a3, 0, &v11);
  v5 = objc_msgSend(v4, "isStub");
  if (v4)
    v6 = v5;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(v4, "newMetalScript");
    if (v7)
    {
      v8 = (OS_dispatch_data *)v7;
      metalScript = self->_metalScript;
      if (metalScript)
        dispatch_release(metalScript);
      self->_metalScript = v8;
      MTLMetalScriptBuilder::initFromScript((NSObject ***)self->_mtlScriptBuilder.__ptr_.__value_, v8);
    }
  }
  return v6 ^ 1;
}

- (BOOL)loadAirntBlocksForSlice:(const MTLLoaderSliceIdentifier *)a3 sliceOffset:(unint64_t)a4 skipAIRValidation:(BOOL)a5
{
  BOOL result;
  _QWORD v7[6];
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];
  _QWORD v11[6];
  BOOL v12;
  _QWORD v13[7];

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke;
  v13[3] = &unk_1E0FE2B08;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_2;
  v11[3] = &unk_1E0FE2B30;
  v11[4] = self;
  v11[5] = a4;
  v12 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_3;
  v10[3] = &unk_1E0FE2B58;
  v10[4] = self;
  v7[5] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_4;
  v8[3] = &unk_1E0FE2B80;
  v9 = a5;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75___MTLBinaryArchive_loadAirntBlocksForSlice_sliceOffset_skipAIRValidation___block_invoke_251;
  v7[3] = &unk_1E0FE2958;
  v7[4] = self;
  result = +[MTLLoader deserializeAirntMachOContainerWithHandler:objectHandler:pipelineHandler:errorHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v13, (uint64_t)v11, (uint64_t)v10, (uint64_t)v8, (uint64_t)v7);
  ++self->_internalArchiverId;
  return result;
}

- (BOOL)loadFileIndex:(void *)a3 expectedSliceId:(const MTLLoaderSliceIdentifier *)a4 expectedVersion:(unint64_t)a5 sliceOffset:(unint64_t)a6
{
  char v7;
  _QWORD v9[6];
  _QWORD v10[8];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke;
  v10[3] = &__block_descriptor_64_e61_B52__0_MTLLoaderSliceIdentifier_ii_8Q16r_____32C__24I32Q36Q44l;
  v10[4] = a4;
  v10[5] = a5;
  v10[6] = a3;
  v10[7] = a6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79___MTLBinaryArchive_loadFileIndex_expectedSliceId_expectedVersion_sliceOffset___block_invoke_2;
  v9[3] = &unk_1E0FE2958;
  v9[4] = self;
  v9[5] = a6;
  v7 = +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v10, (uint64_t)v9);
  if ((v7 & 1) == 0)
  {
    std::__tree<unsigned long,flexbuffers::Builder::KeyOffsetCompare,std::allocator<unsigned long>>::destroy((uint64_t)a3, *((_QWORD **)a3 + 1));
    *(_QWORD *)a3 = (char *)a3 + 8;
    *((_QWORD *)a3 + 2) = 0;
    *((_QWORD *)a3 + 1) = 0;
  }
  return v7;
}

- (BOOL)enumerateArchivesFromBackingFileFromSlice:(const MTLLoaderSliceIdentifier *)a3 version:(unint64_t)a4 verifyKey:(id *)a5 offset:(unint64_t)a6 bytes:(unint64_t)a7 enumerator:(id)a8
{
  char v8;
  MTLLoadedFileContentsWrapper *fileData;
  char *v16;
  _QWORD v18[9];
  _QWORD v19[11];
  _QWORD v20[7];
  _QWORD v21[4];

  v8 = 1;
  if (a7)
  {
    fileData = self->_fileData;
    if (fileData)
    {
      v16 = -[MTLLoadedFileContentsWrapper bytes](self->_fileData, "bytes");
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke;
      v20[3] = &unk_1E0FE2BC8;
      v20[4] = v21;
      v20[5] = a7;
      v20[6] = &v16[a6];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_2;
      v19[3] = &unk_1E0FE2BF0;
      v19[8] = a4;
      v19[9] = a5;
      v19[10] = a6;
      v19[6] = v21;
      v19[7] = a3;
      v19[4] = fileData;
      v19[5] = a8;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __105___MTLBinaryArchive_enumerateArchivesFromBackingFileFromSlice_version_verifyKey_offset_bytes_enumerator___block_invoke_3;
      v18[3] = &unk_1E0FE2C18;
      v18[7] = a3;
      v18[8] = a4;
      v18[6] = v21;
      v18[4] = v19;
      v18[5] = v20;
      v8 = +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v18, (uint64_t)v20);
      _Block_object_dispose(v21, 8);
    }
  }
  return v8;
}

- (BOOL)enumerateSpecializedFunctionArchivesFromBackingFile:(id)a3
{
  MTLLoaderSliceIdentifier v6;

  v6 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:](_MTLBinaryArchive, "sliceIDForSpecializedFunctionsForLLVMVersion:", _MTLGetMTLCompilerLLVMVersionForDevice(self->_device));
  return -[_MTLBinaryArchive enumerateArchivesFromBackingFileFromSlice:version:verifyKey:offset:bytes:enumerator:](self, "enumerateArchivesFromBackingFileFromSlice:version:verifyKey:offset:bytes:enumerator:", &v6, 1, 0, self->_specializedFunctionArchiveOffset, self->_specializedFunctionArchiveBytes, a3);
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  uint64_t v6;

  v6 = +[MTLLoader sliceIDForDescriptors]();
  return -[_MTLBinaryArchive enumerateArchivesFromBackingFileFromSlice:version:verifyKey:offset:bytes:enumerator:](self, "enumerateArchivesFromBackingFileFromSlice:version:verifyKey:offset:bytes:enumerator:", &v6, 1, &_MTLBinaryArchiveDescriptorUUID, self->_recompilationArchiveOffset, self->_recompilationArchiveBytes, a3);
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  BOOL result;
  MTLPipelineCollection *value;
  NSObject *v6;
  _QWORD v7[2];
  char v8;
  _QWORD block[6];

  result = 1;
  v8 = 1;
  value = self->_pipelineCollection.__ptr_.__value_;
  if (value)
  {
    v7[0] = &v8;
    v7[1] = a3;
    v6 = *((_QWORD *)value + 36);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZNK21MTLPipelineCollection14visitLibrariesIZ61___MTLBinaryArchive_enumerateArchivesFromPipelineCollection__E3__5EEvOT__block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = value;
    block[5] = v7;
    dispatch_sync(v6, block);
    return v8 != 0;
  }
  return result;
}

- (id)materializeEntryForKey:(id *)a3 fileIndex:(void *)a4 containsEntry:(id)a5 addEntry:(id)a6
{
  __int128 v9;
  id v10;
  void *v11;
  __int128 v12;
  char v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = *(_OWORD *)&a3->var0[16];
  v22 = *(_OWORD *)a3->var0;
  v23 = v9;
  v10 = -[_MTLBinaryArchive materializeFromHash:fileIndex:](self, "materializeFromHash:fileIndex:", &v22, a4);
  if (v10)
  {
    v11 = v10;
    v12 = *(_OWORD *)&a3->var0[16];
    v20 = *(_OWORD *)a3->var0;
    v21 = v12;
    if ((_QWORD)v22 == *(_QWORD *)a3->var0
      && *((_QWORD *)&v22 + 1) == *(_QWORD *)&a3->var0[8]
      && (_QWORD)v23 == *(_QWORD *)&a3->var0[16]
      && *((_QWORD *)&v23 + 1) == *(_QWORD *)&a3->var0[24])
    {
      v17 = v10;
    }
    else
    {
      v20 = v22;
      v21 = v23;
      v16 = (*((uint64_t (**)(id, __int128 *))a5 + 2))(a5, &v20);
      v17 = 0;
      v18 = 0;
      if ((v16 & 1) != 0)
        goto LABEL_17;
    }
    (*((void (**)(id, void *, __int128 *))a6 + 2))(a6, v11, &v20);

    v18 = v17;
LABEL_17:

    return v18;
  }
  return 0;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)reflectionHashWithFunctionId:(SEL)a3 binaryPos:(const void *)a4
{
  const void *Hash;
  CC_SHA256_CTX v9;
  unint64_t data;

  data = a5;
  MTLHashKey::getHash((uint64_t)a4, 0, 0);
  CC_SHA256_Init(&v9);
  Hash = (const void *)MTLHashKey::getHash((uint64_t)a4, 0, 0);
  CC_SHA256_Update(&v9, Hash, 0x20u);
  CC_SHA256_Update(&v9, &data, 8u);
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &v9);
}

- (NSArray)keys
{
  NSArray *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  if ((self->_options & 2) == 0)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25___MTLBinaryArchive_keys__block_invoke;
  v5[3] = &unk_1E0FE2C40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v2 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v2;
}

+ (id)descriptorDataForArchive:(id)a3
{
  void *v4;
  MTLLoadedFile *v5;
  BOOL v6;
  MTLLoadedFile *v7;
  MTLLoadedFileContentsWrapper *v8;
  NSData *v9;
  BOOL v10;
  NSData *v12;
  uint64_t v13;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  NSError *v20;

  v20 = 0;
  v4 = (void *)objc_opt_new();
  v5 = (MTLLoadedFile *)-[MTLLoader loadFileWithURL:error:errorDomain:invalidFileErrorCode:]((uint64_t)v4, (NSURL *)a3, &v20, CFSTR("MTLBinaryArchiveDomain"), 1);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {

  }
  else
  {
    v7 = v5;
    v8 = -[MTLLoadedFileContentsWrapper initWithData:]([MTLLoadedFileContentsWrapper alloc], "initWithData:", -[MTLLoadedFile contents](v5, "contents"));
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    memset(v15, 0, sizeof(v15));
    v9 = 0;
    if (+[_MTLBinaryArchive deserializeBinaryArchiveHeader:fileData:device:](_MTLBinaryArchive, "deserializeBinaryArchiveHeader:fileData:device:", v15, v8, 0))
    {
      if (+[_MTLBinaryArchive deserializeBinaryArchiveDescriptorMachO:fileData:](_MTLBinaryArchive, "deserializeBinaryArchiveDescriptorMachO:fileData:", v15, v8))
      {
        v10 = (_QWORD)v16 == 0;
      }
      else
      {
        v10 = 1;
      }
      if (v10 || *((_QWORD *)&v16 + 1) == 0)
      {
        v9 = 0;
      }
      else
      {
        v12 = -[MTLLoadedFileContentsWrapper sourceContents](v8, "sourceContents");
        v9 = -[NSData subdataWithRange:](v12, "subdataWithRange:", v16);
      }
    }

    -[MTLLoader releaseLoadedFile:]((uint64_t)v4, v7);
    if (v9)
    {
      v13 = -[NSData length](v9, "length");
      *(_QWORD *)&v15[0] = 0;
      *((_QWORD *)&v15[0] + 1) = v13;
      return _MTLNSDataToDispatchData(v9, v15);
    }
  }
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)addBinaryEntryImpl:(id)a3 forKey:(id)a4
{
  unsigned __int8 v7;

  ++self->_newBinary;
  if (!-[_MTLBinaryArchive recompilationTarget](self, "recompilationTarget"))
  {
    objc_msgSend(a3, "setIndex:", -1);
    -[NSMutableDictionary setObject:forKey:](self->_entries, "setObject:forKey:", a3, a4);
    v7 = atomic_load((unsigned __int8 *)&self->_serializing);
    if ((v7 & 1) != 0 && !self->_isLegacy)
      -[NSMutableDictionary setObject:forKey:](self->_asynEntries, "setObject:forKey:", a3, a4);
  }
}

- (void)addArchiveEntryInternal:(id)a3 forKey:(id *)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___MTLBinaryArchive_MTLBinaryArchiveInternal__addArchiveEntryInternal_forKey___block_invoke;
  block[3] = &unk_1E0FE2C68;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)newArchiveDataForKeyInternal:(id *)a3
{
  void *v3;
  NSObject *queue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (self->_isLegacy && (self->_options & 4) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiveDataForKeyInternal___block_invoke;
    block[3] = &unk_1E0FE29A8;
    block[4] = self;
    block[5] = &v7;
    block[6] = a3;
    dispatch_sync(queue, block);
    v3 = (void *)v8[5];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)addBinaryEntryInternal:(id)a3 forKey:(id)a4
{
  id v7;
  NSObject *queue;
  _QWORD block[7];

  if (!self->_isLegacy || (self->_options & 2) != 0)
  {
    v7 = a3;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__addBinaryEntryInternal_forKey___block_invoke;
    block[3] = &unk_1E0FE2CE0;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(queue, block);
  }
}

- (id)getArchiveIDWithErrorInternal:(id *)a3
{
  NSObject *queue;
  id v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77___MTLBinaryArchive_MTLBinaryArchiveInternal__getArchiveIDWithErrorInternal___block_invoke;
  v9[3] = &unk_1E0FE2C40;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v6 = (id)v11[5];
  if (a3)
    *a3 = (id)v11[5];
  if (self->_archiveIDInt)
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)recompilationTarget
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (void)setRecompilationTarget:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_options = self->_options & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (void)findProgramObjectForFunction:(id *)a3
{
  __int128 v3;
  NSObject *queue;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[6];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->var0[16];
  v12 = *(_OWORD *)a3->var0;
  v13 = v3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___MTLBinaryArchive_MTLBinaryArchiveInternal__findProgramObjectForFunction___block_invoke;
  block[3] = &unk_1E0FE2D58;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  v5 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (void)programObjectForFunction:(id *)a3
{
  __int128 v3;
  NSObject *queue;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[6];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->var0[16];
  v12 = *(_OWORD *)a3->var0;
  v13 = v3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___MTLBinaryArchive_MTLBinaryArchiveInternal__programObjectForFunction___block_invoke;
  block[3] = &unk_1E0FE2D58;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  v5 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v5;
}

- (id)getFunctionNameFromAirDescriptor:(const stitchedAirDescriptor *)a3
{
  NSObject *v3;
  int *v4;
  int *v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  int *v9;
  unsigned int *v10;
  id v11;
  void **v12;
  void *v13;
  void *__p[2];
  char v16;
  size_t size_ptr;
  void *buffer_ptr;

  buffer_ptr = 0;
  size_ptr = 0;
  v3 = dispatch_data_create_map((dispatch_data_t)a3->var0, (const void **)&buffer_ptr, &size_ptr);
  v4 = 0;
  v5 = (int *)((char *)buffer_ptr + *(unsigned int *)buffer_ptr);
  v6 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v6 >= 9u)
  {
    v4 = (int *)v6[4];
    if (v6[4])
      v4 = (int *)((char *)v4 + (_QWORD)v5 + *(unsigned int *)((char *)v4 + (_QWORD)v5));
  }
  v7 = (unsigned __int16 *)((char *)v4 - *v4);
  if (*v7 >= 7u && (v8 = v7[3]) != 0)
    v9 = (int *)((char *)v4 + v8 + *(unsigned int *)((char *)v4 + v8));
  else
    v9 = 0;
  v10 = (unsigned int *)((char *)v9 + *(unsigned __int16 *)((char *)v9 - *v9 + 4));
  std::string::basic_string[abi:ne180100](__p, (char *)v10 + *v10 + 4, *(unsigned int *)((char *)v10 + *v10));
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v16 >= 0)
    v12 = __p;
  else
    v12 = (void **)__p[0];
  v13 = (void *)objc_msgSend(v11, "initWithUTF8String:", v12);
  dispatch_release(v3);
  if (v16 < 0)
    operator delete(__p[0]);
  return v13;
}

- (id)localStitchedFunctionLookupWithDescriptor:(const stitchedAirDescriptor *)a3
{
  id result;
  id *v6;
  id v7;
  _MTLDevice *device;
  _MTLDevice **libraryBuilder;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _MTLLibrary *v15;
  id v16;

  result = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_stitchedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var1.var0);
  if (result)
  {
    v6 = (id *)result;
    v7 = -[_MTLBinaryArchive getFunctionNameFromAirDescriptor:](self, "getFunctionNameFromAirDescriptor:", a3);
    device = (_MTLDevice *)self->_device;
    libraryBuilder = (_MTLDevice **)device->_libraryBuilder;
    v10 = objc_msgSend(v6[6], "data");
    v15 = MTLLibraryBuilder::newLibraryWithData(libraryBuilder, device, v10, 0, v11, v12, v13, v14);
    v16 = -[_MTLLibrary newFunctionWithName:](v15, "newFunctionWithName:", v7);

    return v16;
  }
  return result;
}

- (void)addStitchingInputsFunction:(id)a3 toEntry:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *ptr;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  id *v25;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    std::vector<MTLSerializer::ObjectRef>::reserve((void **)&v32, objc_msgSend(a3, "count"));
    v27 = a4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(a3);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::find<MTLUINT256_t>((_QWORD *)self->_uniqueBitcodeList.__ptr_, (unint64_t *)objc_msgSend(v10, "bitCodeHash")))
          {
            v11 = objc_msgSend(v10, "bitcodeDataInternal");
            ptr = self->_uniqueBitcodeList.__ptr_;
            v35 = (unint64_t *)objc_msgSend(v10, "bitCodeHash");
            std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)ptr, v35, (uint64_t)&std::piecewise_construct, (_OWORD **)&v35)[6] = v11;
          }
          v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", objc_msgSend(v10, "bitCodeHash"), "{?=[32C]}");
          v14 = v13;
          v15 = v33;
          if (v33 >= v34)
          {
            v17 = (v33 - v32) >> 3;
            if ((unint64_t)(v17 + 1) >> 61)
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            v18 = (v34 - v32) >> 2;
            if (v18 <= v17 + 1)
              v18 = v17 + 1;
            if ((unint64_t)(v34 - v32) >= 0x7FFFFFFFFFFFFFF8)
              v19 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v19 = v18;
            if (v19)
              v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v34, v19);
            else
              v20 = 0;
            v21 = (uint64_t *)&v20[8 * v17];
            *v21 = v14;
            v16 = (char *)(v21 + 1);
            v23 = v32;
            v22 = v33;
            if (v33 != v32)
            {
              do
              {
                v24 = *((_QWORD *)v22 - 1);
                v22 -= 8;
                *--v21 = v24;
              }
              while (v22 != v23);
              v22 = v32;
            }
            v32 = (char *)v21;
            v33 = v16;
            v34 = &v20[8 * v19];
            if (v22)
              operator delete(v22);
          }
          else
          {
            *(_QWORD *)v33 = v13;
            v16 = v15 + 8;
          }
          v33 = v16;
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v7);
    }
    objc_msgSend(v27, "setLinkedBitcodes:", objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:"));

    v25 = (id *)v32;
    v26 = (id *)v33;
    if (v32 != v33)
    {
      do

      while (v25 != v26);
      v25 = (id *)v32;
    }
    if (v25)
    {
      v33 = (char *)v25;
      operator delete(v25);
    }
  }
}

- (id)newStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *queue;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id *v18;
  id *v19;
  _MTLLibrary *v20;
  uint64_t v21;
  _QWORD block[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  __n128 (*v26)(__n128 *, __n128 *);
  void (*v27)(uint64_t);
  void *v28;
  void *__p[3];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  if (self->_isLegacy)
  {
    v5 = -[_MTLBinaryArchive newArchiveDataForKeyInternal:](self, "newArchiveDataForKeyInternal:", a3, a4);
    if (v5)
      return MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, v5, 0, v6, v7, v8, v9);
    return 0;
  }
  else
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v23 = 0;
    v24 = &v23;
    v25 = 0x4812000000;
    v26 = __Block_byref_object_copy__526;
    v27 = __Block_byref_object_dispose__527;
    v28 = &unk_182827312;
    std::vector<objc_object  {objcproto11MTLFunction}*>::vector(__p, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85___MTLBinaryArchive_MTLBinaryArchiveInternal__newStitchedLibraryWithKey_descriptors___block_invoke;
    block[3] = &unk_1E0FE2D80;
    block[4] = self;
    block[5] = &v23;
    block[6] = &v30;
    block[7] = a4;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v31 + 24))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0);
      v18 = (id *)v24[6];
      v19 = (id *)v24[7];
      while (v18 != v19)

      v20 = MTLLibraryBuilder::newLibraryWithFunctionArray(*((MTLLibraryBuilder **)self->_device + 53), (_MTLDevice *)self->_device, v17, &v21, v13, v14, v15, v16);
    }
    else
    {
      v20 = 0;
    }
    _Block_object_dispose(&v23, 8);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    _Block_object_dispose(&v30, 8);
  }
  return v20;
}

- (void)addStitchedLibraryWithKey:(id *)a3 descriptors:(const void *)a4 inputFunctions:(id)a5 library:(id)a6
{
  uint64_t v10;
  NSObject *queue;
  MTLAirEntry *v12;
  _QWORD block[8];

  v10 = objc_msgSend(a6, "libraryData");
  if (self->_isLegacy && (self->_options & 4) != 0)
  {
    v12 = -[MTLAirEntry initWithData:]([MTLAirEntry alloc], "initWithData:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 128))(v10));
    -[_MTLBinaryArchive addArchiveEntryInternal:forKey:](self, "addArchiveEntryInternal:forKey:", v12, a3);

  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108___MTLBinaryArchive_MTLBinaryArchiveInternal__addStitchedLibraryWithKey_descriptors_inputFunctions_library___block_invoke;
    block[3] = &unk_1E0FE2DA8;
    block[6] = a4;
    block[7] = v10;
    block[4] = self;
    block[5] = a5;
    dispatch_sync(queue, block);
  }
}

- (id)newSpecializedFunctionWithHash:(id *)a3 libraryPath:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _MTLLibrary *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v15;

  if (self->_isLegacy)
  {
    v7 = -[_MTLBinaryArchive newArchiveDataForKeyInternal:](self, "newArchiveDataForKeyInternal:", a3);
    if (v7)
    {
LABEL_3:
      v11 = MTLLibraryBuilder::newLibraryWithData(*((_MTLDevice ***)self->_device + 53), (_MTLDevice *)self->_device, v7, (uint64_t)a4, 0, v8, v9, v10);
      v12 = -[_MTLLibrary newSpecializedFunctionWithHash:libraryPath:](v11, "newSpecializedFunctionWithHash:libraryPath:", a3, a4);
      if (!v12)
        v12 = -[_MTLLibrary newFunctionWithName:](v11, "newFunctionWithName:", -[NSArray objectAtIndex:](-[_MTLLibrary functionNames](v11, "functionNames"), "objectAtIndex:", 0));

      return v12;
    }
  }
  else
  {
    v13 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_specializedLibraryCache.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var0);
    if (v13)
      return (id)objc_msgSend((id)v13[6], "newSpecializedFunctionWithHash:libraryPath:", a3, a4);
    v15 = std::__hash_table<HashKey,KeyHashFunction,std::equal_to<HashKey>,std::allocator<HashKey>>::find<HashKey>(&self->_specializedFunctionByHash.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)a3->var0);
    if (v15)
    {
      v7 = objc_msgSend((id)v15[6], "data");
      goto LABEL_3;
    }
  }
  return 0;
}

- (id)newArchiverIdWithBinaryKey:(id)a3 entry:(id)a4 srcArchiverId:(id)a5 functionType:(unint64_t)a6
{
  uint64_t v11;
  dispatch_data_t v12;
  unsigned int *v13;
  int v14;
  char *v15;
  BOOL v16;
  NSObject *queue;
  char v18;
  void *v19;
  _QWORD v21[13];
  char v22;
  size_t size_ptr;
  void *buffer_ptr;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v11 = objc_msgSend(a3, "getFunctionId");
  size_ptr = 0;
  buffer_ptr = 0;
  v12 = dispatch_data_create_map((dispatch_data_t)objc_msgSend(a4, "airScript"), (const void **)&buffer_ptr, &size_ptr);
  v13 = (unsigned int *)buffer_ptr;
  v14 = strncmp((const char *)buffer_ptr + 4, "AIRP", 4uLL);
  if (v14)
    v15 = 0;
  else
    v15 = (char *)v13 + *v13;
  v16 = v14 == 0;
  queue = self->_queue;
  v18 = v16;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107___MTLBinaryArchive_MTLBinaryArchiveInternal__newArchiverIdWithBinaryKey_entry_srcArchiverId_functionType___block_invoke;
  v21[3] = &unk_1E0FE2DD0;
  v21[4] = a5;
  v21[5] = self;
  v21[6] = a4;
  v21[7] = a3;
  v21[10] = v15;
  v21[11] = v11;
  v22 = v18;
  v21[8] = v12;
  v21[9] = &v25;
  v21[12] = a6;
  dispatch_sync(queue, v21);
  v19 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v19;
}

- (void)updatePipelineWithPipelineArchiverId:(id)a3 key:(id)a4 functionType:(unint64_t)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101___MTLBinaryArchive_MTLBinaryArchiveInternal__updatePipelineWithPipelineArchiverId_key_functionType___block_invoke;
  v6[3] = &unk_1E0FE2DF8;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = self;
  v6[7] = a5;
  dispatch_sync(queue, v6);
}

+ (BOOL)deserializeBinaryArchiveHeader:(id *)a3 fileData:(id)a4 device:(id)a5
{
  unint64_t v8;
  int v9;
  uint64_t v10;
  MTLLoaderSliceIdentifier v11;
  int var0;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  float *v18;
  uint64_t v19;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD v25[6];
  _QWORD v26[9];
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  unsigned int v33[2];
  _QWORD v34[3];
  int v35;
  uint64_t v36;
  float *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, _QWORD *);
  uint64_t (*v40)(uint64_t);
  _BYTE v41[32];
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[6];

  *(_QWORD *)&a3->var13.var1 = 0;
  *(_OWORD *)&a3->var9 = 0u;
  *(_OWORD *)&a3->var11 = 0u;
  *(_OWORD *)&a3->var5 = 0u;
  *(_OWORD *)&a3->var7 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var3 = 0u;
  if (a5)
  {
    v8 = +[MTLLoader sliceIDForDevice:andDriverVersion:]((uint64_t)MTLLoader, a5, 0);
    v9 = v8;
    v23 = HIDWORD(v8);
    v10 = +[MTLLoader sliceIDForDescriptors]();
    v11 = +[_MTLBinaryArchive sliceIDForSpecializedFunctionsForLLVMVersion:](_MTLBinaryArchive, "sliceIDForSpecializedFunctionsForLLVMVersion:", _MTLGetMTLCompilerLLVMVersionForDevice(a5));
    var0 = v11.var0;
    v13 = HIDWORD(*(unint64_t *)&v11);
  }
  else
  {
    v10 = +[MTLLoader sliceIDForDescriptors]();
    v9 = 0;
    LODWORD(v23) = 0;
    var0 = 0;
    LODWORD(v13) = 0;
  }
  v14 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke;
  v50[3] = &unk_1E0FE2E20;
  v50[4] = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  v49 = 0;
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0;
  v37 = (float *)&v36;
  v38 = 0x5812000000;
  v39 = __Block_byref_object_copy__530;
  v40 = __Block_byref_object_dispose__531;
  v21 = &v41[8];
  memset(v41, 0, sizeof(v41));
  v42 = 0;
  v43 = 1065353216;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  *(_QWORD *)v33 = 0;
  v15 = _MTLGetMTLCompilerLLVMVersionForDevice(a5);
  _MTLGetMaxAIRAndLanguageVersions(v15, &v33[1], v33);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_532;
  v26[3] = &unk_1E0FE2E48;
  v27 = v9;
  v28 = v23;
  v29 = v10;
  v30 = var0;
  v31 = v13;
  v32 = v33[1];
  v26[4] = a4;
  v26[5] = v34;
  v26[6] = &v44;
  v26[7] = &v36;
  v26[8] = a3;
  v16 = +[MTLLoader deserializeUniversalBinaryHeaderWithHandler:reader:bytes:]((uint64_t)MTLLoader, (uint64_t)v26, (uint64_t)v50, objc_msgSend(a4, "length"));
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __94___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveHeader_fileData_device___block_invoke_3;
  v25[3] = &unk_1E0FE2958;
  v25[4] = a4;
  v25[5] = a3;
  a3->var12 = +[MTLLoader machOConformsToAIRNTFormat:type:]((uint64_t)MTLLoader, (uint64_t)v25, 0);
  if (a3->var1)
  {
    if (a3->var0)
    {
      a3->var13.var0 = v9;
      a3->var13.var1 = v23;
    }
    else
    {
      v17 = (void *)objc_msgSend(a5, "getMostCompatibleArchitecture:", v45[5], &v41[8]);
      if (objc_msgSend(v17, "cpuType"))
      {
        a3->var13.var0 = objc_msgSend(v17, "cpuType");
        a3->var13.var1 = objc_msgSend(v17, "cpuSubtype");
        v18 = v37;
        v19 = objc_msgSend(v17, "cpuType");
        v24 = (int)objc_msgSend(v17, "cpuSubtype") | (unint64_t)(v19 << 32);
        *(_OWORD *)&a3->var2 = *(_OWORD *)std::unordered_map<unsigned long long,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<std::pair<unsigned long long const,+[_MTLBinaryArchive(MTLBinaryArchiveInternal) deserializeBinaryArchiveHeader:fileData:device:]::archSliceId>>>::operator[](v18 + 12, &v24);
      }
    }
  }
  objc_msgSend((id)v45[5], "removeAllObjects", v21);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v36, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table(v22);
  _Block_object_dispose(&v44, 8);
  return v16;
}

+ (BOOL)deserializeBinaryArchiveDescriptorMachO:(id *)a3 fileData:(id)a4
{
  uint64_t v6;
  _QWORD v8[6];
  _QWORD v9[7];

  a3->var7 = 0;
  a3->var8 = 0;
  if (!a3->var4)
    return 0;
  v6 = +[MTLLoader sliceIDForDescriptors]();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke;
  v9[3] = &unk_1E0FE2EC0;
  v9[5] = a3;
  v9[6] = v6;
  v9[4] = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96___MTLBinaryArchive_MTLBinaryArchiveInternal__deserializeBinaryArchiveDescriptorMachO_fileData___block_invoke_4;
  v8[3] = &unk_1E0FE2958;
  v8[4] = a4;
  v8[5] = a3;
  return +[MTLLoader deserializeMachOContainerWithHandler:reader:]((uint64_t)MTLLoader, (uint64_t)v9, (uint64_t)v8);
}

+ (MTLLoaderSliceIdentifier)sliceIDForSpecializedFunctionsForLLVMVersion:(int)a3
{
  unsigned int v4;
  unsigned int v5;

  v5 = 0;
  v4 = 0;
  _MTLGetMaxAIRAndLanguageVersions(*(uint64_t *)&a3, &v5, &v4);
  return (MTLLoaderSliceIdentifier)+[MTLLoader sliceIDForAIRVersion:]((uint64_t)MTLLoader, v5);
}

- (BOOL)requiresLegacyReflection
{
  return self->_isLegacy;
}

- (BOOL)remoteInsertionBegin
{
  unsigned __int8 v3;

  dispatch_suspend((dispatch_object_t)self->_serializeQueue);
  v3 = atomic_load((unsigned __int8 *)&self->_serializing);
  return (v3 & 1) == 0;
}

- (void)remoteInsertionEnd
{
  dispatch_resume((dispatch_object_t)self->_serializeQueue);
}

- (void)initWithOptions:(void *)a1 device:url:error:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v1, "MTLBinaryArchive - load from URL: '%s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)loadFromURL:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_msgSend(a1, "absoluteString"), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v1, "unable to find a compatible slice for binary archive '%s'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_182636000, MEMORY[0x1E0C81028], v0, "Unable to open mach-O at path: %s  Error:%i", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5_0();
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_182636000, MEMORY[0x1E0C81028], v0, "Mapping of file %s failed with errno %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5_0();
}

- (void)mapFileToMemoryWithPath:fileSize:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_182636000, MEMORY[0x1E0C81028], v0, "fstat failed for file %s with errno %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5_0();
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "unable to map air script", v0, 2u);
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v0, "cannot decode flatbuffert with error %s", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)flatBufferFromJSON:schema:schemaSize:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v0, "cannot load schema with error %s", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)materializeBitCode:(void *)a1 atIndex:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_msgSend(a1, "localizedDescription"), "UTF8String");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v1, "Error loading machO library: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
