@implementation DYPlaybackEngine

- (DYPlaybackEngine)init
{
  -[DYPlaybackEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYPlaybackEngine)initWithCaptureStore:(id)a3
{
  DYPlaybackEngine *v4;
  DYPlaybackEngine *v5;
  const char *v6;
  objc_super v8;

  if (!a3)
    __assert_rtn("-[DYPlaybackEngine initWithCaptureStore:]", ", 0, "captureStore");
  v8.receiver = self;
  v8.super_class = (Class)DYPlaybackEngine;
  v4 = -[DYPlaybackEngine init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v4)), v4), "UTF8String");
    v5->_playbackQueue = (OS_dispatch_queue *)dispatch_queue_create(v6, 0);
    v5->_captureStore = (DYCaptureStore *)a3;
  }
  return v5;
}

- (void)dealloc
{
  GPUTools::Playback::PlaybackEngineDecodeCache *cache;
  NSObject *playbackQueue;
  objc_super v5;

  cache = (GPUTools::Playback::PlaybackEngineDecodeCache *)self->_cache;
  if (cache)
  {
    GPUTools::Playback::PlaybackEngineDecodeCache::~PlaybackEngineDecodeCache(cache);
    MEMORY[0x24262211C]();
  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue)
  {
    dispatch_release(playbackQueue);
    self->_playbackQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DYPlaybackEngine;
  -[DYPlaybackEngine dealloc](&v5, sel_dealloc);
}

- (id)newFunctionPlayer
{
  -[DYPlaybackEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setWireframeLineWidth:(float)a3
{
  -[DYPlaybackEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (DYFunctionPlayer)player
{
  os_unfair_lock_s *p_playerLock;
  DYFunctionPlayer *v5;

  p_playerLock = &self->_playerLock;
  os_unfair_lock_lock(&self->_playerLock);
  if (!self->_player)
  {
    v5 = -[DYPlaybackEngine newFunctionPlayer](self, "newFunctionPlayer");
    self->_player = v5;
    -[DYFunctionPlayer setEngine:](v5, "setEngine:", self);
  }
  os_unfair_lock_unlock(p_playerLock);
  return self->_player;
}

- (void)_allocateAndFillDataCache
{
  host_t v3;
  mach_error_t v4;
  uint64_t v5;
  DYCaptureStore *captureStore;
  _QWORD *v7;
  int64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  GPUTools::Playback::PlaybackEngineDecodeCache *v15;
  GPUTools::Playback::PlaybackEngineDecodeCache *v16;
  unint64_t v17;
  _QWORD *v18;
  _BYTE *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27[3];
  char *v28;
  char *v29;
  char *v30;
  mach_msg_type_number_t host_info_outCnt[2];
  _BYTE *v32;
  uint64_t v33;
  integer_t host_info_out[5];
  unsigned int v35;
  int v36;

  host_info_outCnt[0] = 38;
  v3 = MEMORY[0x242622500](self, a2);
  v4 = host_statistics(v3, 2, host_info_out, host_info_outCnt);
  if (v4)
  {
    mach_error_string(v4);
    dy_abort();
LABEL_30:
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*MEMORY[0x24BDB03C8] >> 1) * host_info_out[0];
  captureStore = self->_captureStore;
  if (!captureStore)
  {
    *(_QWORD *)host_info_outCnt = 0;
    v32 = 0;
    v33 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_13;
  }
  -[DYCaptureStore getSortedFilePositionsForDataCaching](captureStore, "getSortedFilePositionsForDataCaching");
  v7 = *(_QWORD **)host_info_outCnt;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v8 = (int64_t)&v32[-*(_QWORD *)host_info_outCnt];
  if (v32 == *(_BYTE **)host_info_outCnt)
  {
LABEL_13:
    v9 = 0;
    v11 = 0;
    v12 = (unint64_t)(7 * v5) >> 3;
    goto LABEL_14;
  }
  if (v8 < 0)
    goto LABEL_30;
  v9 = (char *)operator new((size_t)&v32[-*(_QWORD *)host_info_outCnt]);
  v28 = v9;
  v30 = &v9[8 * (v8 >> 3)];
  bzero(v9, v8);
  v10 = 0;
  v11 = 0;
  v29 = &v9[v8];
  v12 = (unint64_t)(7 * v5) >> 3;
  do
  {
    while (1)
    {
      if ((-[DYCaptureStore getInfo:forFilePosition:error:](self->_captureStore, "getInfo:forFilePosition:error:", host_info_out, v7[v10], 0) & 1) == 0)__assert_rtn("-[DYPlaybackEngine _allocateAndFillDataCache]", ", 0, "ok");
      if (v36)
      {
        v14 = ((v35 + 15) & 0x1FFFFFFF0) + v11;
        if (v14 <= v12)
          break;
      }
      v7 = *(_QWORD **)host_info_outCnt;
      v13 = 8 * v10;
      *(_QWORD *)(*(_QWORD *)host_info_outCnt + v13) = -1;
      *(_QWORD *)&v9[v13] = -1;
      if (++v10 >= (v32 - (_BYTE *)v7) >> 3)
        goto LABEL_14;
    }
    *(_QWORD *)&v9[8 * v10] = v35;
    v7 = *(_QWORD **)host_info_outCnt;
    v11 = v14;
    ++v10;
  }
  while (v10 < (uint64_t)&v32[-*(_QWORD *)host_info_outCnt] >> 3);
LABEL_14:
  v15 = (GPUTools::Playback::PlaybackEngineDecodeCache *)operator new();
  v16 = v15;
  if (v11 >= v12)
    v17 = v12;
  else
    v17 = v11;
  GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(v15, v5 - v17);
  self->_cache = v16;
  v18 = *(_QWORD **)host_info_outCnt;
  v19 = v32;
  if (v32 == *(_BYTE **)host_info_outCnt)
  {
    v18 = v32;
  }
  else
  {
    v20 = 0;
    do
    {
      v23 = v18[v20];
      if (v23 != -1)
      {
        v24 = *(_QWORD *)&v9[8 * v20];
        v25 = -[DYCaptureStore readDataForFilePosition:buffer:size:error:](self->_captureStore, "readDataForFilePosition:buffer:size:error:", v23, *((_QWORD *)v16 + 13) + *((_QWORD *)v16 + 9), v24, 0);
        v26 = *((_QWORD *)v16 + 13) + *((_QWORD *)v16 + 9);
        v27[0] = *(_QWORD *)(*(_QWORD *)host_info_outCnt + 8 * v20);
        v27[1] = v26;
        v27[2] = v25;
        std::__hash_table<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::tuple<void *,unsigned long>>>((uint64_t)v16 + 120, v27, (uint64_t)v27);
        v21 = *((_QWORD *)v16 + 13);
        v22 = *((_QWORD *)v16 + 14);
        *((_QWORD *)v16 + 12) = v21;
        *((_QWORD *)v16 + 13) = ((((v24 + 15) & 0xFFFFFFFFFFFFFFF0) + v22 - 1) & -v22) + v21;
        v18 = *(_QWORD **)host_info_outCnt;
        v19 = v32;
      }
      ++v20;
    }
    while (v20 < (v19 - (_BYTE *)v18) >> 3);
  }
  if (v9)
  {
    v29 = v9;
    operator delete(v9);
    v18 = *(_QWORD **)host_info_outCnt;
  }
  if (v18)
  {
    v32 = v18;
    operator delete(v18);
  }
}

- (void)_addPointerDataSizeMapToPlayer
{
  _QWORD *i;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8[2];
  void *__p[2];
  int v10;
  _QWORD *v11;

  *(_OWORD *)v8 = 0u;
  *(_OWORD *)__p = 0u;
  v10 = 1065353216;
  for (i = (_QWORD *)*((_QWORD *)self->_cache + 17); i; i = (_QWORD *)*i)
  {
    v4 = i[4];
    v11 = i + 3;
    std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)v8, i + 3, (uint64_t)&std::piecewise_construct, &v11)[3] = v4;
  }
  -[DYFunctionPlayer addPointerDataSizeMap:](self->_player, "addPointerDataSizeMap:", v8);
  v5 = __p[0];
  if (__p[0])
  {
    do
    {
      v6 = (_QWORD *)*v5;
      operator delete(v5);
      v5 = v6;
    }
    while (v6);
  }
  v7 = v8[0];
  v8[0] = 0;
  if (v7)
    operator delete(v7);
}

- (BOOL)_executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4
{
  _QWORD *cache;
  void *i;
  uint64_t functionBatchOffset;
  uint64_t currentFunctionIndex;
  unint64_t targetFunctionIndex;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!a4)
    return 0;
  cache = self->_cache;
  i = self->_fseIterator.__i_;
  if ((unint64_t)i < cache[3] || (unint64_t)i >= cache[4])
  {
    v13 = 0;
    v12 = a4;
  }
  else
  {
    functionBatchOffset = self->_functionBatchOffset;
    currentFunctionIndex = self->_currentFunctionIndex;
    targetFunctionIndex = self->_targetFunctionIndex;
    if (a4 - functionBatchOffset + currentFunctionIndex > targetFunctionIndex
      && targetFunctionIndex > currentFunctionIndex)
    {
      v12 = (targetFunctionIndex - currentFunctionIndex);
    }
    else
    {
      v12 = a4 - functionBatchOffset;
    }
    self->_currentFunctionIndex = currentFunctionIndex + v12;
    v13 = 1;
    if (!v12)
      goto LABEL_14;
    a3 += functionBatchOffset;
  }
  -[DYFunctionPlayer executeFunctions:count:subCommandIndex:](self->_player, "executeFunctions:count:subCommandIndex:", a3, v12, self->_targetSubCommandIndex);
  functionBatchOffset = self->_functionBatchOffset;
LABEL_14:
  v14 = v12 + functionBatchOffset;
  if (v14 == a4)
  {
    self->_functionBatchOffset = 0;
    return self->_currentFunctionIndex == self->_targetFunctionIndex && v13;
  }
  else
  {
    self->_functionBatchOffset = v14;
    return 1;
  }
}

- (BOOL)_executeDFS:(void *)a3
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v8;
  BOOL result;

  v3 = *(_QWORD *)a3;
  v4 = *(_QWORD **)(*(_QWORD *)a3 + 504);
  v5 = *(_QWORD **)(*(_QWORD *)a3 + 520);
  if (v5 == v4)
  {
LABEL_4:
    result = 0;
    *(_QWORD *)(v3 + 520) = *(_QWORD *)(v3 + 496);
  }
  else
  {
    while (1)
    {
      v8 = (*(uint64_t (**)(_QWORD, SEL))(*(_QWORD *)*v5 + 16))(*v5, a2);
      if (-[DYPlaybackEngine _executeFunctions:count:](self, "_executeFunctions:count:", v8, (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v5 + 24))(*v5)))
      {
        break;
      }
      *(_QWORD *)(*(_QWORD *)a3 + 520) += 8;
      v3 = *(_QWORD *)a3;
      v5 = *(_QWORD **)(*(_QWORD *)a3 + 520);
      if (v5 == v4)
        goto LABEL_4;
    }
    if (!self->_functionBatchOffset)
      *(_QWORD *)(*(_QWORD *)a3 + 520) += 8;
    return 1;
  }
  return result;
}

- (BOOL)_executeFunctionStream:(void *)a3
{
  _QWORD *cache;
  uint64_t *v6;
  _BOOL4 v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  unint64_t v21;
  __int16 v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  uint64_t v31;
  BOOL result;
  _BYTE v33[456];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _BYTE v39[456];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  cache = self->_cache;
  v6 = cache + 5;
  if (cache[5])
  {
    if (!cache[6])
      goto LABEL_10;
  }
  else
  {
    v8 = (_OWORD *)operator new[]();
    v9 = 0;
    *v8 = xmmword_23C6C1C40;
    do
    {
      GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)((char *)v8 + v9 + 16));
      v9 += 456;
    }
    while (v9 != 523944);
    std::unique_ptr<GPUTools::FD::CoreFunction []>::reset[abi:ne180100]<GPUTools::FD::CoreFunction*,0>(v6, (uint64_t)(v8 + 1));
    cache = self->_cache;
    if (!cache[6])
      goto LABEL_10;
  }
  if (-[DYPlaybackEngine _executeFunctions:count:](self, "_executeFunctions:count:", cache[5]))
  {
    if (!self->_functionBatchOffset)
      *((_QWORD *)self->_cache + 6) = 0;
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_10:
  v10 = *((_QWORD *)a3 + 63);
  v11 = *(_QWORD *)(v10 + 24);
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v39);
  v40 = v11;
  v41 = v11;
  v42 = *(_QWORD *)(v10 + 24);
  v43 = *(_QWORD *)(v10 + 8);
  v44 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v43 + 16))(v43);
  while (1)
  {
    v12 = *((_QWORD *)a3 + 58);
    if (v12 != v40)
      break;
    v13 = 0;
LABEL_32:
    v23 = self->_cache;
    v23[6] = v13;
    v7 = -[DYPlaybackEngine _executeFunctions:count:](self, "_executeFunctions:count:", v23[5], v13);
    if (v7)
    {
      if (!self->_functionBatchOffset)
        goto LABEL_40;
      goto LABEL_41;
    }
    if (!v13)
    {
      v24 = *(_QWORD *)a3;
      if (*(_QWORD *)a3)
      {
        GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v33);
        v25 = *(_QWORD *)(v24 + 456);
        v26 = *(_QWORD *)(v24 + 464);
        v34 = v25;
        v35 = v26;
        v27 = *(_QWORD *)(v24 + 472);
        v28 = *(_QWORD *)(v24 + 480);
        v36 = v27;
        v37 = v28;
        v29 = *(_BYTE *)(v24 + 488);
        v38 = v29;
      }
      else
      {
        v30 = (_QWORD *)*((_QWORD *)a3 + 63);
        v31 = v30[2];
        GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v33);
        v34 = v31;
        v35 = v31;
        v36 = v30[3];
        v37 = v30[1];
        v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 16))(v37);
        v38 = v29;
        v25 = v34;
        v26 = v35;
        v27 = v36;
        v28 = v37;
      }
      *((_QWORD *)a3 + 58) = v25;
      *((_QWORD *)a3 + 59) = v26;
      *((_QWORD *)a3 + 60) = v27;
      *((_QWORD *)a3 + 61) = v28;
      *((_BYTE *)a3 + 496) = v29;
      GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v33);
LABEL_40:
      *((_QWORD *)self->_cache + 6) = 0;
LABEL_41:
      GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v39);
      return v7;
    }
  }
  v13 = 0;
  v14 = *((_QWORD *)a3 + 59);
  while (1)
  {
    if (*((_DWORD *)a3 + 2) == -1 || v14 == v12)
    {
      if (((*(uint64_t (**)(_QWORD, uint64_t, uint64_t, char *))(**((_QWORD **)a3 + 61) + 64))(*((_QWORD *)a3 + 61), v12, *((_QWORD *)a3 + 60) - v12, (char *)a3 + 8) & 1) == 0)goto LABEL_43;
      v16 = *((unsigned int *)a3 + 110) + *((_QWORD *)a3 + 58);
      *((_QWORD *)a3 + 59) = v16;
      v17 = *((_DWORD *)a3 + 3);
      if ((v17 & 0x1000) != 0 && (v17 & 0x2000) == 0)
        break;
    }
LABEL_20:
    GPUTools::FD::CoreFunction::operator=();
    v18 = *((_QWORD *)a3 + 59);
    if (v18 == *((_QWORD *)a3 + 58))
    {
      if (*((_BYTE *)a3 + 496))
      {
        v19 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 61) + 56))(*((_QWORD *)a3 + 61), v18, *((_QWORD *)a3 + 60) - v18);
        v20 = *((_QWORD *)a3 + 58);
        *((_QWORD *)a3 + 59) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)a3 + 61) + 48))(*((_QWORD *)a3 + 61), v20, *((_QWORD *)a3 + 60) - v20)+ v20;
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated((uint64_t)a3 + 8, v19);
      }
      else
      {
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode((uint64_t)a3 + 8);
      }
    }
    v14 = *((_QWORD *)a3 + 59);
    *((_QWORD *)a3 + 58) = v14;
    ++v13;
    if (v14 != v40)
    {
      v12 = v14;
      if (v13 != 1149)
        continue;
    }
    goto LABEL_32;
  }
  while (1)
  {
    v21 = *((_QWORD *)a3 + 60);
    if (v16 >= v21)
      break;
    v22 = (*(uint64_t (**)(_QWORD, unint64_t, unint64_t))(**((_QWORD **)a3 + 61) + 56))(*((_QWORD *)a3 + 61), v16, v21 - v16);
    v16 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)a3 + 61) + 48))(*((_QWORD *)a3 + 61), *((_QWORD *)a3 + 59), *((_QWORD *)a3 + 60) - *((_QWORD *)a3 + 59))+ *((_QWORD *)a3 + 59);
    *((_QWORD *)a3 + 59) = v16;
    if ((v22 & 0x2000) != 0)
      goto LABEL_20;
  }
LABEL_43:
  result = dy_abort();
  __break(1u);
  return result;
}

- (BOOL)_executeFSE:(void *)a3
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[456];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _BYTE v19[456];
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char v23;

  self->_currentFile = (DYCaptureFile *)*((_QWORD *)a3 + 65);
  -[DYFunctionPlayer performNewExecutionFileActions](self->_player, "performNewExecutionFileActions");
  if (!*(_QWORD *)a3)
    goto LABEL_6;
  if (-[DYPlaybackEngine _executeDFS:](self, "_executeDFS:", a3))
    return 1;
  v6 = *(_QWORD *)a3;
  if (*(_QWORD *)a3)
  {
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v19);
    v20 = *(_QWORD *)(v6 + 456);
    v21 = *(_OWORD *)(v6 + 464);
    v22 = *(_QWORD *)(v6 + 480);
    v23 = *(_BYTE *)(v6 + 488);
  }
  else
  {
LABEL_6:
    v7 = (_QWORD *)*((_QWORD *)a3 + 63);
    v8 = v7[2];
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v19);
    v20 = v8;
    *(_QWORD *)&v21 = v8;
    *((_QWORD *)&v21 + 1) = v7[3];
    v22 = v7[1];
    v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v22 + 16))(v22);
  }
  v9 = *((_QWORD *)a3 + 63);
  v10 = *(_QWORD *)(v9 + 24);
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v13);
  v14 = v10;
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  v17 = *(_QWORD *)(v9 + 8);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
  v11 = v20;
  v12 = v14;
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v13);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v19);
  return v11 != v12 && -[DYPlaybackEngine _executeFunctionStream:](self, "_executeFunctionStream:", a3);
}

- (void)_executeDeltaFSEs
{
  void *cache;
  _QWORD *i;
  _QWORD *v5;

  -[DYFunctionPlayer prepareForNonCaptureExecution](self->_player, "prepareForNonCaptureExecution");
  cache = self->_cache;
  i = self->_fseIterator.__i_;
  v5 = (_QWORD *)*((_QWORD *)cache + 1);
  if (i != v5)
  {
    do
    {
      -[DYPlaybackEngine _executeFSE:](self, "_executeFSE:", *i);
      i = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = i;
    }
    while (i != v5);
    cache = self->_cache;
  }
  self->_currentFunctionIndex = 0;
  self->_fseIterator.__i_ = (void *)*((_QWORD *)cache + 3);
}

- (void)_executeFunctionStreamEntriesPerformingLoopIterationActions:(BOOL)a3 iteration:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v7;
  const __CFString *v8;
  _QWORD *i;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v15;
  unsigned int targetFunctionIndex;
  const __CFString *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = (void *)MEMORY[0x2426225CC](self, a2);
  v8 = CFSTR("NO");
  if (v5)
    v8 = CFSTR("YES");
  v18 = v8;
  v19 = v4;
  _DYOCondLog();
  i = self->_fseIterator.__i_;
  v10 = (_QWORD *)*((_QWORD *)self->_cache + 4);
  if (v10 != i)
  {
    v11 = self->_fseIterator.__i_;
    v12 = v11;
    if (i < v10)
      goto LABEL_5;
LABEL_28:
    __assert_rtn("-[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:]", ", 0, "_fseIterator < _cache->delta_fse_iter");
  }
  -[DYPlaybackEngine _executeDeltaFSEs](self, "_executeDeltaFSEs", v18, v4);
  v11 = self->_fseIterator.__i_;
  v10 = (_QWORD *)*((_QWORD *)self->_cache + 4);
  v12 = v11;
  if (v11 >= v10)
    goto LABEL_28;
LABEL_5:
  if (v5)
  {
    while (1)
    {
      v13 = (_QWORD *)*((_QWORD *)self->_cache + 3);
      if (v11 == v13 && i != v13)
      {
        -[DYFunctionPlayer prepareForCaptureExecution](self->_player, "prepareForCaptureExecution");
        -[DYPlaybackEngine performPlaybackLoopIterationPreCaptureActions:](self, "performPlaybackLoopIterationPreCaptureActions:", v4);
        v11 = self->_fseIterator.__i_;
        i = v12;
      }
      if (-[DYPlaybackEngine _executeFSE:](self, "_executeFSE:", *v11, v18, v19))
        break;
      v11 = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = v11;
      v12 = v11;
      if (v11 == v10)
        goto LABEL_21;
    }
  }
  else
  {
    while (1)
    {
      v15 = (_QWORD *)*((_QWORD *)self->_cache + 3);
      if (v11 == v15 && i != v15)
      {
        -[DYFunctionPlayer prepareForCaptureExecution](self->_player, "prepareForCaptureExecution");
        v11 = self->_fseIterator.__i_;
        i = v12;
      }
      if (-[DYPlaybackEngine _executeFSE:](self, "_executeFSE:", *v11, v18, v19))
        break;
      v11 = (char *)self->_fseIterator.__i_ + 8;
      self->_fseIterator.__i_ = v11;
      v12 = v11;
      if (v11 == v10)
      {
LABEL_21:
        if (v10 != *((_QWORD **)self->_cache + 4))
          __assert_rtn("-[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:]", ", 0, "_fseIterator == _cache->delta_fse_iter");
        if (v5)
          -[DYPlaybackEngine performPlaybackLoopIterationPostCaptureActions:](self, "performPlaybackLoopIterationPostCaptureActions:", v4);
        targetFunctionIndex = self->_targetFunctionIndex;
        if (targetFunctionIndex >= self->_currentFunctionIndex)
        {
          self->_targetFunctionIndex = 0;
        }
        else if (targetFunctionIndex)
        {
          -[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:](self, "_executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:", v5, v4);
          break;
        }
        self->_currentFunctionIndex = 0;
        break;
      }
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void)_performPlaybackRequest:(unsigned int)a3
{
  uint64_t v5;

  -[DYPlaybackEngine onPlaybackRequestStart](self, "onPlaybackRequestStart");
  if (!self->_player)
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_player");
  if (!self->_cache)
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_cache");
  if (a3 && self->_targetFunctionIndex == self->_currentFunctionIndex)
    goto LABEL_7;
  -[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:](self, "_executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:", 0, 0);
  if (self->_currentFunctionIndex != self->_targetFunctionIndex)
LABEL_14:
    __assert_rtn("-[DYPlaybackEngine _performPlaybackRequest:]", ", 0, "_currentFunctionIndex == _targetFunctionIndex");
  if (a3)
  {
LABEL_7:
    v5 = 0;
    do
    {
      if (!-[DYPlaybackEngine shouldPerformPlaybackLoopIteration:](self, "shouldPerformPlaybackLoopIteration:", v5))
        break;
      -[DYPlaybackEngine _executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:](self, "_executeFunctionStreamEntriesPerformingLoopIterationActions:iteration:", 1, v5);
      if (self->_currentFunctionIndex != self->_targetFunctionIndex)
        goto LABEL_14;
      if (self->_waitUntilCompleteAfterEveryFrame)
        -[DYPlaybackEngine waitUntilCompleted](self, "waitUntilCompleted");
      v5 = (v5 + 1);
    }
    while (a3 != (_DWORD)v5);
  }
  -[DYPlaybackEngine onPlaybackRequestCompleted](self, "onPlaybackRequestCompleted");
}

- (void)playbackToFunction:(unsigned int)a3 withLoops:(unsigned int)a4
{
  -[DYPlaybackEngine playbackToFunction:subCommandIndex:withLoops:](self, "playbackToFunction:subCommandIndex:withLoops:", *(_QWORD *)&a3, 0, *(_QWORD *)&a4);
}

- (void)playbackToFunction:(unsigned int)a3 subCommandIndex:(int)a4 withLoops:(unsigned int)a5
{
  uint64_t v5;
  DYPlaybackEngineFSEBuilder *v7;

  v5 = *(_QWORD *)&a5;
  self->_active = 1;
  self->_targetFunctionIndex = a3;
  self->_targetSubCommandIndex = a4;
  if (!self->_cache)
  {
    -[DYPlaybackEngine _allocateAndFillDataCache](self, "_allocateAndFillDataCache");
    v7 = -[DYPlaybackEngineFSEBuilder initWithPlaybackEngineCache:]([DYPlaybackEngineFSEBuilder alloc], "initWithPlaybackEngineCache:", self->_cache);
    -[DYCaptureStore acceptCaptureVisitor:](self->_captureStore, "acceptCaptureVisitor:", v7);

    self->_fseIterator.__i_ = *(void **)self->_cache;
    -[DYFunctionPlayer prepareForNonCaptureExecution](-[DYPlaybackEngine player](self, "player"), "prepareForNonCaptureExecution");
    -[DYPlaybackEngine _addPointerDataSizeMapToPlayer](self, "_addPointerDataSizeMapToPlayer");
  }
  -[DYPlaybackEngine _performPlaybackRequest:](self, "_performPlaybackRequest:", v5);
  self->_active = 0;
}

- (id)playbackToFunction:(unsigned int)a3
{
  void *v5;
  unsigned int loopCount;
  NSObject *playbackQueue;
  _QWORD block[6];
  unsigned int v10;
  unsigned int v11;

  v5 = (void *)objc_opt_new();
  loopCount = self->_loopCount;
  playbackQueue = self->_playbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__DYPlaybackEngine_playbackToFunction___block_invoke;
  block[3] = &unk_250D58B40;
  v10 = a3;
  v11 = loopCount;
  block[4] = self;
  block[5] = v5;
  dispatch_async(playbackQueue, block);
  return v5;
}

uint64_t __39__DYPlaybackEngine_playbackToFunction___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "playbackToFunction:withLoops:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1));
}

- (id)playback
{
  return -[DYPlaybackEngine playbackToFunction:](self, "playbackToFunction:", self->_targetFunctionIndex);
}

- (BOOL)shouldPerformPlaybackLoopIteration:(unsigned int)a3
{
  return 1;
}

- (DYCaptureStore)captureStore
{
  return self->_captureStore;
}

- (DYCaptureFile)currentFile
{
  return self->_currentFile;
}

- (unsigned)targetFunctionIndex
{
  return self->_targetFunctionIndex;
}

- (void)setTargetFunctionIndex:(unsigned int)a3
{
  self->_targetFunctionIndex = a3;
}

- (unsigned)targetSubCommandIndex
{
  return self->_targetSubCommandIndex;
}

- (void)setTargetSubCommandIndex:(unsigned int)a3
{
  self->_targetSubCommandIndex = a3;
}

- (unsigned)loopCount
{
  return self->_loopCount;
}

- (void)setLoopCount:(unsigned int)a3
{
  self->_loopCount = a3;
}

- (unsigned)currentFunctionIndex
{
  return self->_currentFunctionIndex;
}

- (BOOL)waitUntilCompleteAfterEveryFrame
{
  return self->_waitUntilCompleteAfterEveryFrame;
}

- (void)setWaitUntilCompleteAfterEveryFrame:(BOOL)a3
{
  self->_waitUntilCompleteAfterEveryFrame = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
