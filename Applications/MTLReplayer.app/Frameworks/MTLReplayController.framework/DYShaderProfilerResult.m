@implementation DYShaderProfilerResult

- (DYShaderProfilerResult)init
{
  uint64_t v2;
  DYShaderProfilerResult *v3;
  uint64_t v4;
  NSMutableArray *drawCallInfoList;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *programPipelineInfoList;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *encoderInfoList;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *encoderFunctionIndexToEncoderIndexMap;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *programInfoList;
  DYShaderProfilerResult *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DYShaderProfilerResult;
  v3 = -[DYShaderProfilerResult init](&v20, "init");
  if (v3)
  {
    v4 = objc_opt_new(NSMutableArray, v2);
    drawCallInfoList = v3->_drawCallInfoList;
    v3->_drawCallInfoList = (NSMutableArray *)v4;

    v7 = objc_opt_new(NSMutableArray, v6);
    programPipelineInfoList = v3->_programPipelineInfoList;
    v3->_programPipelineInfoList = (NSMutableArray *)v7;

    v10 = objc_opt_new(NSMutableArray, v9);
    encoderInfoList = v3->_encoderInfoList;
    v3->_encoderInfoList = (NSMutableArray *)v10;

    v13 = objc_opt_new(NSMutableDictionary, v12);
    encoderFunctionIndexToEncoderIndexMap = v3->_encoderFunctionIndexToEncoderIndexMap;
    v3->_encoderFunctionIndexToEncoderIndexMap = (NSMutableDictionary *)v13;

    v16 = objc_opt_new(NSMutableArray, v15);
    programInfoList = v3->_programInfoList;
    v3->_programInfoList = (NSMutableArray *)v16;

    v18 = v3;
  }

  return v3;
}

- (void)buildDrawCallIndexMap
{
  unint64_t value;
  uint64_t i;
  NSMutableArray *drawCallInfoList;
  _QWORD v6[5];

  if (self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__deallocate_node((_QWORD *)self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_);
    self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_ = 0;
    value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (i = 0; i != value; ++i)
        self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->_functionIndexToDrawCallIndexMap.__table_.__p2_.__value_ = 0;
  }
  drawCallInfoList = self->_drawCallInfoList;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke;
  v6[3] = &unk_725AE8;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](drawCallInfoList, "enumerateObjectsUsingBlock:", v6);
}

- (NSMutableArray)drawCallInfoList
{
  return self->_drawCallInfoList;
}

- (void)setDrawCallInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_drawCallInfoList, a3);
}

- (NSMutableArray)encoderInfoList
{
  return self->_encoderInfoList;
}

- (NSMutableArray)encoderFunctionIndexList
{
  return self->_encoderFunctionIndexList;
}

- (NSMutableArray)programInfoList
{
  return self->_programInfoList;
}

- (NSMutableArray)programPipelineInfoList
{
  return self->_programPipelineInfoList;
}

- (void)setProgramPipelineInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_programPipelineInfoList, a3);
}

- (NSMutableDictionary)encoderFunctionIndexToEncoderIndexMap
{
  return self->_encoderFunctionIndexToEncoderIndexMap;
}

- (DYShaderProfilerTiming)vertexTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self->_time.max;
  return self;
}

- (void)setVertexTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->_cycle.average;
  v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_vertexTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_vertexTiming._cycle.max = v4;
  *(_OWORD *)&self->_vertexTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)fragmentTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[1]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[1]._time.max;
  return self;
}

- (void)setFragmentTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->_cycle.average;
  v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_fragmentTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_fragmentTiming._cycle.max = v4;
  *(_OWORD *)&self->_fragmentTiming._cycle.average = v3;
}

- (DYShaderProfilerTiming)computeTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[2]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[2]._time.max;
  return self;
}

- (void)setComputeTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->_cycle.average;
  v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_computeTiming._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_computeTiming._cycle.max = v4;
  *(_OWORD *)&self->_computeTiming._cycle.average = v3;
}

- (NSMutableArray)effectiveKickTimes
{
  return self->_effectiveKickTimes;
}

- (void)setEffectiveKickTimes:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveKickTimes, a3);
}

- (NSMutableArray)effectivePerEncoderDrawKickTimes
{
  return self->_effectivePerEncoderDrawKickTimes;
}

- (void)setEffectivePerEncoderDrawKickTimes:(id)a3
{
  objc_storeStrong((id *)&self->_effectivePerEncoderDrawKickTimes, a3);
}

- (NSMutableArray)averagePerDrawKickDurations
{
  return self->_averagePerDrawKickDurations;
}

- (void)setAveragePerDrawKickDurations:(id)a3
{
  objc_storeStrong((id *)&self->_averagePerDrawKickDurations, a3);
}

- (NSMutableArray)loadActionTimes
{
  return self->_loadActionTimes;
}

- (void)setLoadActionTimes:(id)a3
{
  objc_storeStrong((id *)&self->_loadActionTimes, a3);
}

- (NSMutableArray)storeActionTimes
{
  return self->_storeActionTimes;
}

- (void)setStoreActionTimes:(id)a3
{
  objc_storeStrong((id *)&self->_storeActionTimes, a3);
}

- (unsigned)commandBufferCount
{
  return self->_commandBufferCount;
}

- (void)setCommandBufferCount:(unsigned int)a3
{
  self->_commandBufferCount = a3;
}

- (NSMutableArray)perCommandBufferEncoderCount
{
  return self->_perCommandBufferEncoderCount;
}

- (void)setPerCommandBufferEncoderCount:(id)a3
{
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, a3);
}

- (NSDictionary)encoderIndexToLabelMap
{
  return self->_encoderIndexToLabelMap;
}

- (void)setEncoderIndexToLabelMap:(id)a3
{
  objc_storeStrong((id *)&self->_encoderIndexToLabelMap, a3);
}

- (NSDictionary)derivedCountersData
{
  return self->_derivedCountersData;
}

- (void)setDerivedCountersData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCountersData, a3);
}

- (unint64_t)frameTime
{
  return self->_frameTime;
}

- (void)setFrameTime:(unint64_t)a3
{
  self->_frameTime = a3;
}

- (unsigned)deviceUtilization
{
  return self->_deviceUtilization;
}

- (void)setDeviceUtilization:(unsigned int)a3
{
  self->_deviceUtilization = a3;
}

- (double)gpuTime
{
  return self->_gpuTime;
}

- (void)setGpuTime:(double)a3
{
  self->_gpuTime = a3;
}

- (unsigned)encoderCount
{
  return self->_encoderCount;
}

- (void)setEncoderCount:(unsigned int)a3
{
  self->_encoderCount = a3;
}

- (NSArray)blitTimeData
{
  return self->_blitTimeData;
}

- (void)setBlitTimeData:(id)a3
{
  objc_storeStrong((id *)&self->_blitTimeData, a3);
}

- (NSMutableDictionary)blitEncoderTimeInfo
{
  return self->_blitEncoderTimeInfo;
}

- (void)setBlitEncoderTimeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_blitEncoderTimeInfo, a3);
}

- (DYShaderProfilerTiming)timing
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3]._time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[3]._cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[3]._time.max;
  return self;
}

- (void)setTiming:(DYShaderProfilerTiming *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->_cycle.average;
  v4 = *(_OWORD *)&a3->_cycle.max;
  *(_OWORD *)&self->_timing._time.min = *(_OWORD *)&a3->_time.min;
  *(_OWORD *)&self->_timing._cycle.max = v4;
  *(_OWORD *)&self->_timing._cycle.average = v3;
}

- (NSMutableArray)shaderProfilingFrameTimes
{
  return self->_shaderProfilingFrameTimes;
}

- (void)setShaderProfilingFrameTimes:(id)a3
{
  objc_storeStrong((id *)&self->_shaderProfilingFrameTimes, a3);
}

- (double)shaderProfilingTime
{
  return self->_shaderProfilingTime;
}

- (void)setShaderProfilingTime:(double)a3
{
  self->_shaderProfilingTime = a3;
}

- (void).cxx_destruct
{
  void **value;

  objc_storeStrong((id *)&self->_shaderProfilingFrameTimes, 0);
  objc_storeStrong((id *)&self->_blitEncoderTimeInfo, 0);
  objc_storeStrong((id *)&self->_blitTimeData, 0);
  objc_storeStrong((id *)&self->_derivedCountersData, 0);
  objc_storeStrong((id *)&self->_encoderIndexToLabelMap, 0);
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, 0);
  objc_storeStrong((id *)&self->_storeActionTimes, 0);
  objc_storeStrong((id *)&self->_loadActionTimes, 0);
  objc_storeStrong((id *)&self->_averagePerDrawKickDurations, 0);
  objc_storeStrong((id *)&self->_effectivePerEncoderDrawKickTimes, 0);
  objc_storeStrong((id *)&self->_effectiveKickTimes, 0);
  objc_storeStrong((id *)&self->_encoderFunctionIndexToEncoderIndexMap, 0);
  objc_storeStrong((id *)&self->_programPipelineInfoList, 0);
  objc_storeStrong((id *)&self->_programInfoList, 0);
  objc_storeStrong((id *)&self->_encoderFunctionIndexList, 0);
  objc_storeStrong((id *)&self->_encoderInfoList, 0);
  objc_storeStrong((id *)&self->_drawCallInfoList, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__deallocate_node((_QWORD *)self->_functionIndexToDrawCallIndexMap.__table_.__p1_.__value_.__next_);
  value = self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_functionIndexToDrawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_perContextDrawCallCounterDY);
  objc_storeStrong((id *)&self->_allShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_computeKernelBinaryInfo, 0);
  objc_storeStrong((id *)&self->_fragmentShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_vertexShaderBinaryInfo, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->_drawCallInfoIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 58) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_DWORD *)self + 86) = 1065353216;
  return self;
}

void __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke(unint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  float **v11;
  float *i;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  float **v34;
  unint64_t v35;
  signed int v36;
  signed int v37;
  unint64_t v38;
  unint64_t v39;
  uint8x8_t v40;
  void **v41;
  _QWORD *v42;
  unint64_t v43;
  float v44;
  float v45;
  _BOOL8 v46;
  unint64_t v47;
  unint64_t v48;
  int8x8_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  uint8x8_t v55;
  unint64_t v56;
  uint8x8_t v57;
  uint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[2];
  char v69;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v67 = v5;
  v7 = objc_msgSend(v5, "functionIndex");
  v8 = v7;
  v9 = *(_QWORD *)(v6 + 320);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      a1 = v7;
      if (v9 <= v7)
        a1 = v7 % v9;
    }
    else
    {
      a1 = ((_DWORD)v9 - 1) & v7;
    }
    v11 = *(float ***)(*(_QWORD *)(v6 + 312) + 8 * a1);
    if (v11)
    {
      for (i = *v11; i; i = *(float **)i)
      {
        v13 = *((_QWORD *)i + 1);
        if (v13 == v7)
        {
          if (*((_QWORD *)i + 2) == v7)
            goto LABEL_74;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != a1)
            break;
        }
      }
    }
  }
  v14 = (char *)operator new(0x40uLL);
  v15 = (_QWORD *)(v6 + 328);
  v68[0] = v14;
  v68[1] = v6 + 328;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v8;
  *((_QWORD *)v14 + 2) = v8;
  *(_OWORD *)(v14 + 24) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  v69 = 1;
  v16 = (float)(unint64_t)(*(_QWORD *)(v6 + 336) + 1);
  v17 = *(float *)(v6 + 344);
  if (v9 && (float)(v17 * (float)v9) >= v16)
  {
    v8 = a1;
    goto LABEL_64;
  }
  v18 = 1;
  if (v9 >= 3)
    v18 = (v9 & (v9 - 1)) != 0;
  v19 = v18 | (2 * v9);
  v20 = vcvtps_u32_f32(v16 / v17);
  if (v19 <= v20)
    prime = (int8x8_t)v20;
  else
    prime = (int8x8_t)v19;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v9 = *(_QWORD *)(v6 + 320);
  }
  if (*(_QWORD *)&prime <= v9)
  {
    if (*(_QWORD *)&prime >= v9)
      goto LABEL_60;
    v28 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 336) / *(float *)(v6 + 344));
    if (v9 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
    {
      v28 = std::__next_prime(v28);
    }
    else
    {
      v30 = 1 << -(char)__clz(v28 - 1);
      if (v28 >= 2)
        v28 = v30;
    }
    if (*(_QWORD *)&prime <= v28)
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime >= v9)
    {
      v9 = *(_QWORD *)(v6 + 320);
      goto LABEL_60;
    }
    if (!*(_QWORD *)&prime)
    {
      v65 = *(void **)(v6 + 312);
      *(_QWORD *)(v6 + 312) = 0;
      if (v65)
        operator delete(v65);
      v9 = 0;
      *(_QWORD *)(v6 + 320) = 0;
      goto LABEL_60;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v22 = operator new(8 * *(_QWORD *)&prime);
  v23 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v22;
  if (v23)
    operator delete(v23);
  v24 = 0;
  *(int8x8_t *)(v6 + 320) = prime;
  do
    *(_QWORD *)(*(_QWORD *)(v6 + 312) + 8 * v24++) = 0;
  while (*(_QWORD *)&prime != v24);
  v25 = (_QWORD *)*v15;
  if (*v15)
  {
    v26 = v25[1];
    v27 = (uint8x8_t)vcnt_s8(prime);
    v27.i16[0] = vaddlv_u8(v27);
    if (v27.u32[0] > 1uLL)
    {
      if (v26 >= *(_QWORD *)&prime)
        v26 %= *(_QWORD *)&prime;
    }
    else
    {
      v26 &= *(_QWORD *)&prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)(v6 + 312) + 8 * v26) = v15;
    v31 = (_QWORD *)*v25;
    if (*v25)
    {
      do
      {
        v32 = v31[1];
        if (v27.u32[0] > 1uLL)
        {
          if (v32 >= *(_QWORD *)&prime)
            v32 %= *(_QWORD *)&prime;
        }
        else
        {
          v32 &= *(_QWORD *)&prime - 1;
        }
        if (v32 != v26)
        {
          v33 = *(_QWORD *)(v6 + 312);
          if (!*(_QWORD *)(v33 + 8 * v32))
          {
            *(_QWORD *)(v33 + 8 * v32) = v25;
            goto LABEL_56;
          }
          *v25 = *v31;
          *v31 = **(_QWORD **)(*(_QWORD *)(v6 + 312) + 8 * v32);
          **(_QWORD **)(*(_QWORD *)(v6 + 312) + 8 * v32) = v31;
          v31 = v25;
        }
        v32 = v26;
LABEL_56:
        v25 = v31;
        v31 = (_QWORD *)*v31;
        v26 = v32;
      }
      while (v31);
    }
  }
  v9 = (unint64_t)prime;
LABEL_60:
  if ((v9 & (v9 - 1)) != 0)
  {
    if (v9 <= v8)
      v8 %= v9;
  }
  else
  {
    v8 = ((_DWORD)v9 - 1) & v8;
  }
LABEL_64:
  v34 = *(float ***)(*(_QWORD *)(v6 + 312) + 8 * v8);
  i = (float *)v68[0];
  if (v34)
  {
    *(_QWORD *)v68[0] = *v34;
LABEL_72:
    *v34 = i;
    goto LABEL_73;
  }
  *(_QWORD *)v68[0] = *(_QWORD *)(v6 + 328);
  *(_QWORD *)(v6 + 328) = i;
  *(_QWORD *)(*(_QWORD *)(v6 + 312) + 8 * v8) = v15;
  if (*(_QWORD *)i)
  {
    v35 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v35 >= v9)
        v35 %= v9;
    }
    else
    {
      v35 &= v9 - 1;
    }
    v34 = (float **)(*(_QWORD *)(v6 + 312) + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  v68[0] = 0;
  ++*(_QWORD *)(v6 + 336);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,void *>>>>::reset[abi:nn180100]((uint64_t)v68);
LABEL_74:
  v36 = objc_msgSend(v67, "subCommandIndex");
  v37 = v36;
  v38 = v36;
  v39 = *((_QWORD *)i + 4);
  if (v39)
  {
    v40 = (uint8x8_t)vcnt_s8((int8x8_t)v39);
    v40.i16[0] = vaddlv_u8(v40);
    if (v40.u32[0] > 1uLL)
    {
      v9 = v36;
      if (v39 <= v36)
        v9 = v36 % v39;
    }
    else
    {
      v9 = (v39 - 1) & v36;
    }
    v41 = *(void ***)(*((_QWORD *)i + 3) + 8 * v9);
    if (v41)
    {
      v42 = *v41;
      if (*v41)
      {
        do
        {
          v43 = v42[1];
          if (v43 == v36)
          {
            if (*((_DWORD *)v42 + 4) == v36)
              goto LABEL_147;
          }
          else
          {
            if (v40.u32[0] > 1uLL)
            {
              if (v43 >= v39)
                v43 %= v39;
            }
            else
            {
              v43 &= v39 - 1;
            }
            if (v43 != v9)
              break;
          }
          v42 = (_QWORD *)*v42;
        }
        while (v42);
      }
    }
  }
  v42 = operator new(0x18uLL);
  *v42 = 0;
  v42[1] = v38;
  *((_DWORD *)v42 + 4) = v37;
  *((_DWORD *)v42 + 5) = 0;
  v44 = (float)(unint64_t)(*((_QWORD *)i + 6) + 1);
  v45 = i[14];
  if (!v39 || (float)(v45 * (float)v39) < v44)
  {
    v46 = 1;
    if (v39 >= 3)
      v46 = (v39 & (v39 - 1)) != 0;
    v47 = v46 | (2 * v39);
    v48 = vcvtps_u32_f32(v44 / v45);
    if (v47 <= v48)
      v49 = (int8x8_t)v48;
    else
      v49 = (int8x8_t)v47;
    if (*(_QWORD *)&v49 == 1)
    {
      v49 = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&v49 & (*(_QWORD *)&v49 - 1)) != 0)
    {
      v49 = (int8x8_t)std::__next_prime(*(_QWORD *)&v49);
    }
    v39 = *((_QWORD *)i + 4);
    if (*(_QWORD *)&v49 > v39)
      goto LABEL_103;
    if (*(_QWORD *)&v49 < v39)
    {
      v56 = vcvtps_u32_f32((float)*((unint64_t *)i + 6) / i[14]);
      if (v39 < 3 || (v57 = (uint8x8_t)vcnt_s8((int8x8_t)v39), v57.i16[0] = vaddlv_u8(v57), v57.u32[0] > 1uLL))
      {
        v56 = std::__next_prime(v56);
      }
      else
      {
        v58 = 1 << -(char)__clz(v56 - 1);
        if (v56 >= 2)
          v56 = v58;
      }
      if (*(_QWORD *)&v49 <= v56)
        v49 = (int8x8_t)v56;
      if (*(_QWORD *)&v49 >= v39)
      {
        v39 = *((_QWORD *)i + 4);
      }
      else
      {
        if (v49)
        {
LABEL_103:
          if (*(_QWORD *)&v49 >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v50 = operator new(8 * *(_QWORD *)&v49);
          v51 = (void *)*((_QWORD *)i + 3);
          *((_QWORD *)i + 3) = v50;
          if (v51)
            operator delete(v51);
          v52 = 0;
          *((int8x8_t *)i + 4) = v49;
          do
            *(_QWORD *)(*((_QWORD *)i + 3) + 8 * v52++) = 0;
          while (*(_QWORD *)&v49 != v52);
          v53 = (_QWORD *)*((_QWORD *)i + 5);
          if (v53)
          {
            v54 = v53[1];
            v55 = (uint8x8_t)vcnt_s8(v49);
            v55.i16[0] = vaddlv_u8(v55);
            if (v55.u32[0] > 1uLL)
            {
              if (v54 >= *(_QWORD *)&v49)
                v54 %= *(_QWORD *)&v49;
            }
            else
            {
              v54 &= *(_QWORD *)&v49 - 1;
            }
            *(_QWORD *)(*((_QWORD *)i + 3) + 8 * v54) = i + 10;
            v59 = (_QWORD *)*v53;
            if (*v53)
            {
              do
              {
                v60 = v59[1];
                if (v55.u32[0] > 1uLL)
                {
                  if (v60 >= *(_QWORD *)&v49)
                    v60 %= *(_QWORD *)&v49;
                }
                else
                {
                  v60 &= *(_QWORD *)&v49 - 1;
                }
                if (v60 != v54)
                {
                  v61 = *((_QWORD *)i + 3);
                  if (!*(_QWORD *)(v61 + 8 * v60))
                  {
                    *(_QWORD *)(v61 + 8 * v60) = v53;
                    goto LABEL_128;
                  }
                  *v53 = *v59;
                  *v59 = **(_QWORD **)(*((_QWORD *)i + 3) + 8 * v60);
                  **(_QWORD **)(*((_QWORD *)i + 3) + 8 * v60) = v59;
                  v59 = v53;
                }
                v60 = v54;
LABEL_128:
                v53 = v59;
                v59 = (_QWORD *)*v59;
                v54 = v60;
              }
              while (v59);
            }
          }
          v39 = (unint64_t)v49;
          goto LABEL_132;
        }
        v66 = (void *)*((_QWORD *)i + 3);
        *((_QWORD *)i + 3) = 0;
        if (v66)
          operator delete(v66);
        v39 = 0;
        *((_QWORD *)i + 4) = 0;
      }
    }
LABEL_132:
    if ((v39 & (v39 - 1)) != 0)
    {
      if (v39 <= v38)
        v9 = v38 % v39;
      else
        v9 = v38;
    }
    else
    {
      v9 = (v39 - 1) & v38;
    }
  }
  v62 = *((_QWORD *)i + 3);
  v63 = *(_QWORD **)(v62 + 8 * v9);
  if (v63)
  {
    *v42 = *v63;
LABEL_145:
    *v63 = v42;
    goto LABEL_146;
  }
  *v42 = *((_QWORD *)i + 5);
  *((_QWORD *)i + 5) = v42;
  *(_QWORD *)(v62 + 8 * v9) = i + 10;
  if (*v42)
  {
    v64 = *(_QWORD *)(*v42 + 8);
    if ((v39 & (v39 - 1)) != 0)
    {
      if (v64 >= v39)
        v64 %= v39;
    }
    else
    {
      v64 &= v39 - 1;
    }
    v63 = (_QWORD *)(*((_QWORD *)i + 3) + 8 * v64);
    goto LABEL_145;
  }
LABEL_146:
  ++*((_QWORD *)i + 6);
LABEL_147:
  *((_DWORD *)v42 + 5) = a3;

}

@end
