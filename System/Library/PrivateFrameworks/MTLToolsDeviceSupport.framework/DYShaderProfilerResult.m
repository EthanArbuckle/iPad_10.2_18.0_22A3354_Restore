@implementation DYShaderProfilerResult

- (DYShaderProfilerResult)init
{
  DYShaderProfilerResult *v2;
  uint64_t v3;
  NSMutableArray *drawCallInfoList;
  uint64_t v5;
  NSMutableArray *programPipelineInfoList;
  uint64_t v7;
  NSMutableArray *encoderInfoList;
  uint64_t v9;
  NSMutableDictionary *encoderFunctionIndexToEncoderIndexMap;
  uint64_t v11;
  NSMutableArray *programInfoList;
  DYShaderProfilerResult *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DYShaderProfilerResult;
  v2 = -[DYShaderProfilerResult init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    drawCallInfoList = v2->_drawCallInfoList;
    v2->_drawCallInfoList = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    programPipelineInfoList = v2->_programPipelineInfoList;
    v2->_programPipelineInfoList = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    encoderInfoList = v2->_encoderInfoList;
    v2->_encoderInfoList = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    encoderFunctionIndexToEncoderIndexMap = v2->_encoderFunctionIndexToEncoderIndexMap;
    v2->_encoderFunctionIndexToEncoderIndexMap = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    programInfoList = v2->_programInfoList;
    v2->_programInfoList = (NSMutableArray *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)buildDrawCallIndexMap
{
  NSMutableArray *drawCallInfoList;
  _QWORD v4[5];

  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::clear((uint64_t)&self->_functionIndexToDrawCallIndexMap);
  drawCallInfoList = self->_drawCallInfoList;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke;
  v4[3] = &unk_251122CA0;
  v4[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](drawCallInfoList, "enumerateObjectsUsingBlock:", v4);
}

void __47__DYShaderProfilerResult_buildDrawCallIndexMap__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  unint64_t v9;
  int *v10;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v5, "functionIndex");
  v10 = (int *)&v9;
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v6 + 312, &v9, (uint64_t)&std::piecewise_construct, (_QWORD **)&v10);
  v8 = objc_msgSend(v5, "subCommandIndex");
  v10 = &v8;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>((uint64_t)(v7 + 3), &v8, (uint64_t)&std::piecewise_construct, &v10)+ 5) = a3;

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
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unordered_map<int,unsigned int>>>>::~__hash_table((uint64_t)&self->_functionIndexToDrawCallIndexMap);
  std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::~__hash_table((uint64_t)&self->_perContextDrawCallCounterDY);
  objc_storeStrong((id *)&self->_allShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_computeKernelBinaryInfo, 0);
  objc_storeStrong((id *)&self->_fragmentShaderBinaryInfo, 0);
  objc_storeStrong((id *)&self->_vertexShaderBinaryInfo, 0);
  std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::~__hash_table((uint64_t)&self->_drawCallInfoIndexMap);
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

@end
