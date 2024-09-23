@implementation DYShaderProfilerProgramInfo

- (DYShaderProfilerProgramInfo)init
{
  uint64_t v2;
  DYShaderProfilerProgramInfo *v3;
  uint64_t v4;
  NSMutableArray *drawCallInfoList;
  DYShaderProfilerProgramInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DYShaderProfilerProgramInfo;
  v3 = -[DYShaderProfilerProgramInfo init](&v8, "init");
  if (v3)
  {
    v4 = objc_opt_new(NSMutableArray, v2);
    drawCallInfoList = v3->_drawCallInfoList;
    v3->_drawCallInfoList = (NSMutableArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (unsigned)programPipelineIndex
{
  return self->_programPipelineIndex;
}

- (unint64_t)pipelineStateId
{
  return self->_pipelineStateId;
}

- (unint64_t)pipelineStateFunctionIndex
{
  return self->_pipelineStateFunctionIndex;
}

- (void)setPipelineStateFunctionIndex:(unint64_t)a3
{
  self->_pipelineStateFunctionIndex = a3;
}

- (NSMutableArray)drawCallInfoList
{
  return self->_drawCallInfoList;
}

- (DYShaderProfilerTiming)vertexTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[1]._time.average;
  return self;
}

- (DYShaderProfilerTiming)fragmentTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[1]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[2]._time.average;
  return self;
}

- (DYShaderProfilerTiming)computeTiming
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[2]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[3]._time.average;
  return self;
}

- (DYShaderProfilerTiming)timing
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[3]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[4]._time.average;
  return self;
}

- (NSArray)allShaderKeys
{
  return self->_allShaderKeys;
}

- (unsigned)programIndex
{
  return self->_programIndex;
}

- (void)setProgramIndex:(unsigned int)a3
{
  self->_programIndex = a3;
}

- (unint64_t)programId
{
  return self->_programId;
}

- (void)setProgramId:(unint64_t)a3
{
  self->_programId = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawCallInfoList, 0);
  objc_storeStrong((id *)&self->_allShaderKeys, 0);
  objc_storeStrong((id *)&self->_computeKernelKey, 0);
  objc_storeStrong((id *)&self->_fragmentShaderKey, 0);
  objc_storeStrong((id *)&self->_vertexShaderKey, 0);
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
  return self;
}

@end
