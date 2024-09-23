@implementation DYExperimentResultsGenerator

- (DYExperimentResultsGenerator)init
{
  -[DYExperimentResultsGenerator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (DYExperimentResultsGenerator)initWithExperiment:(id)a3
{
  DYExperimentResultsGenerator *v4;
  DYExperimentResultsGenerator *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYExperimentResultsGenerator;
  v4 = -[DYExperimentResultsGenerator init](&v6, sel_init);
  result = 0;
  if (a3)
  {
    if (v4)
    {
      v4->_experiment = (DYExperimentOverrideEnable *)a3;
      v4->_prevFileFunctionIndex = -1;
      return v4;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExperimentResultsGenerator;
  -[DYExperimentResultsGenerator dealloc](&v3, sel_dealloc);
}

- (void)begin
{
  DYDisableBufferSwaps();
}

- (void)end
{
  DYDisableBufferSwaps();
}

- (void)startTiming
{
  unsigned int iteration;

  iteration = self->_iteration;
  if (iteration == -[DYExperiment warmupCount](self->_experiment, "warmupCount"))
    self->_startGlobalTime = self->_frameTimeStart;
}

- (void)stopTiming
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  if (-[DYExperiment enablePerFrameTiming](self->_experiment, "enablePerFrameTiming"))
  {
    if (*MEMORY[0x24BE39258] != *(_DWORD *)(MEMORY[0x24BE39258] + 4))
      __udivti3();
    v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v4 = (id)-[NSMutableDictionary objectForKey:](-[DYExperiment results](self->_experiment, "results"), "objectForKey:", CFSTR("DurationArray"));
    if (!v4)
    {
      v5 = (id)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", v5, CFSTR("DurationArray"));
      v4 = v5;
    }
    v6 = v4;
    objc_msgSend(v4, "addObject:", v3);

  }
}

- (void)beginIteration:(unsigned int)a3
{
  unsigned int iteration;
  unsigned int v5;

  self->_iteration = a3;
  if (!a3)
    -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", DYTimingBenchmark()), CFSTR("TimingCost"));
  self->_frameTimeStart = mach_absolute_time();
  if (-[DYExperiment enablePerFrameTiming](self->_experiment, "enablePerFrameTiming")
    && (iteration = self->_iteration, iteration >= -[DYExperiment warmupCount](self->_experiment, "warmupCount"))
    || !-[DYExperiment enablePerFrameTiming](self->_experiment, "enablePerFrameTiming")
    && (v5 = self->_iteration, v5 == -[DYExperiment warmupCount](self->_experiment, "warmupCount")))
  {
    -[DYExperimentResultsGenerator startTiming](self, "startTiming");
  }
  DYResetGraphicsTiming();
}

- (void)endIteration
{
  uint64_t v3;
  unint64_t v4;
  unsigned int iteration;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v3 = mach_absolute_time();
  self->_frameTimeEnd = v3;
  v4 = v3 - self->_frameTimeStart;
  if (*MEMORY[0x24BE39258] != *(_DWORD *)(MEMORY[0x24BE39258] + 4))
    v4 = __udivti3();
  self->_frameTime = v4;
  if (-[DYExperiment enablePerFrameTiming](self->_experiment, "enablePerFrameTiming")
    && (iteration = self->_iteration, iteration >= -[DYExperiment warmupCount](self->_experiment, "warmupCount"))
    || !-[DYExperiment enablePerFrameTiming](self->_experiment, "enablePerFrameTiming")
    && (v6 = self->_iteration,
        v7 = -[DYExperiment warmupCount](self->_experiment, "warmupCount"),
        v6 == v7 + -[DYExperiment repeatCount](self->_experiment, "repeatCount") - 1))
  {
    -[DYExperimentResultsGenerator stopTiming](self, "stopTiming");
  }
  if ((-[DYExperiment profilingFlags](self->_experiment, "profilingFlags") & 2) != 0)
  {
    v8 = self->_iteration;
    if (v8 >= -[DYExperiment warmupCount](self->_experiment, "warmupCount"))
    {
      v9 = DYGetProfilingData();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = (id)-[NSMutableDictionary objectForKey:](-[DYExperiment results](self->_experiment, "results"), "objectForKey:", CFSTR("GLProfilingDataArray"));
        if (!v11)
        {
          v11 = (id)objc_opt_new();
          -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", v11, CFSTR("GLProfilingDataArray"));
        }
        v12 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v11, "addObject:", v12);

      }
    }
  }
  if (-[DYExperimentResultsGenerator shouldTerminateExperiment](self, "shouldTerminateExperiment"))
    -[DYExperimentResultsGenerator terminateExperiment](self, "terminateExperiment");
}

- (void)onFrameStart
{
  unsigned int iteration;

  iteration = self->_iteration;
  if (iteration >= -[DYExperiment warmupCount](self->_experiment, "warmupCount")
    && (-[DYExperiment profilingFlags](self->_experiment, "profilingFlags") & 0x40) != 0)
  {
    DYGetAllPerFunctionProfilingData();
    self->_prevFileFunctionIndex = -1;
  }
}

- (void)onFrameEnd
{
  unsigned int iteration;
  uint64_t v4;

  iteration = self->_iteration;
  if (iteration >= -[DYExperiment warmupCount](self->_experiment, "warmupCount")
    && (-[DYExperiment profilingFlags](self->_experiment, "profilingFlags") & 0x40) != 0)
  {
    v4 = DYGetAllPerFunctionProfilingData();
    if (v4)
      -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", v4, CFSTR("PerFunctionProfilingData"));
  }
}

- (void)onGraphicsFunctionEnd
{
  if ((-[DYExperiment profilingFlags](self->_experiment, "profilingFlags") & 0x40) != 0)
    self->_prevFileFunctionIndex = -[DYFunctionPlayer currentFileFunctionIndex](self->_functionPlayer, "currentFileFunctionIndex");
}

- (void)onPlatformFunctionEnd
{
  if ((-[DYExperiment profilingFlags](self->_experiment, "profilingFlags") & 0x40) != 0)
    self->_prevFileFunctionIndex = -[DYFunctionPlayer currentFileFunctionIndex](self->_functionPlayer, "currentFileFunctionIndex");
}

- (BOOL)shouldTerminateExperiment
{
  unsigned int iteration;
  _BOOL4 v4;
  unique_ptr<GPUTools::RunningStatistics<unsigned long long>, std::default_delete<GPUTools::RunningStatistics<unsigned long long>>> *p_frameTimeStatistics;
  uint64_t value;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  unsigned int v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double v21;

  iteration = self->_iteration;
  if (iteration < -[DYExperiment warmupCount](self->_experiment, "warmupCount"))
    goto LABEL_2;
  p_frameTimeStatistics = &self->_frameTimeStatistics;
  value = (uint64_t)self->_frameTimeStatistics.__ptr_.__value_;
  if (!value)
  {
    value = operator new();
    GPUTools::RunningStatistics<unsigned long long>::RunningStatistics(value, -[DYExperiment frameTimeArraySize](self->_experiment, "frameTimeArraySize"));
    v7 = (uint64_t)p_frameTimeStatistics->__ptr_.__value_;
    p_frameTimeStatistics->__ptr_.__value_ = (void *)value;
    if (v7)
    {
      std::default_delete<GPUTools::RunningStatistics<unsigned long long>>::operator()[abi:ne180100]((uint64_t)&self->_frameTimeStatistics, v7);
      value = (uint64_t)p_frameTimeStatistics->__ptr_.__value_;
    }
  }
  GPUTools::RunningStatistics<unsigned long long>::AddElement(value, &self->_frameTime);
  v8 = self->_iteration;
  v9 = -[DYExperiment warmupCount](self->_experiment, "warmupCount");
  if (v8 == v9 + -[DYExperiment repeatCount](self->_experiment, "repeatCount") - 1)
    goto LABEL_7;
  v4 = -[DYExperiment allowEarlyTermination](self->_experiment, "allowEarlyTermination");
  if (!v4)
    return v4;
  v11 = *((_DWORD *)p_frameTimeStatistics->__ptr_.__value_ + 6);
  if (*((_DWORD *)p_frameTimeStatistics->__ptr_.__value_ + 56) < v11)
    goto LABEL_2;
  v10 = p_frameTimeStatistics->__ptr_.__value_;
  v12 = (double)(unint64_t)(*(_QWORD *)(v10[19] + 8 * ((*((_DWORD *)v10 + 57) + v11) % v11))
                                 - *(_QWORD *)(v10[13] + 8 * ((*((_DWORD *)v10 + 57) + v11) % v11)))
      / (double)*(unint64_t *)(v10[7] + 8 * ((*((_DWORD *)v10 + 57) + v11) % v11));
  -[DYExperiment frameTimeVariationLimit1](self->_experiment, "frameTimeVariationLimit1");
  if (v12 < v13
    || (v14 = *((_DWORD *)self->_frameTimeStatistics.__ptr_.__value_ + 56),
        v14 >= -[DYExperiment frameTimeVariationArraySize](self->_experiment, "frameTimeVariationArraySize"))
    && (v20 = 0.0,
        v21 = 0.0,
        GPUTools::RunningStatistics<unsigned long long>::IQRtoIQMRatioMinMax((uint64_t)self->_frameTimeStatistics.__ptr_.__value_, -[DYExperiment frameTimeVariationArraySize](self->_experiment, "frameTimeVariationArraySize"), &v21, &v20))&& (v15 = v20, -[DYExperiment frameTimeVariationLimit2](self->_experiment, "frameTimeVariationLimit2"), v15 < v16)&& (v17 = v20 - v21, -[DYExperiment frameTimeVariationRangeMax](self->_experiment, "frameTimeVariationRangeMax"), v17 < v18))
  {
LABEL_7:
    LOBYTE(v4) = 1;
  }
  else
  {
LABEL_2:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)terminateExperiment
{
  void *v3;
  _DWORD *value;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  if (self->_frameTimeStatistics.__ptr_.__value_)
  {
    v3 = (void *)objc_opt_new();
    value = self->_frameTimeStatistics.__ptr_.__value_;
    v5 = value[56];
    if (v5)
    {
      v6 = 0;
      v7 = -1;
      do
      {
        if (v5 >= v5 + v7)
          v5 += v7;
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)value + 8 * ((value[57] - v5 + value[6]) % value[6]))));
        ++v6;
        value = self->_frameTimeStatistics.__ptr_.__value_;
        v5 = value[56];
        --v7;
      }
      while (v6 < v5);
    }
    -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", v3, CFSTR("FrameTime"));

  }
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iteration + 1), CFSTR("IterationDone"));
  v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[DYExperiment results](self->_experiment, "results"), "objectForKey:", CFSTR("TimingCost")), "unsignedLongLongValue");
  v9 = DYTimingBenchmark();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  if (v8)
    v11 = v10;
  else
    v11 = v9;
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11), CFSTR("TimingCost"));
  v12 = (void *)MEMORY[0x24BDD16E0];
  if (*MEMORY[0x24BE39258] != *(_DWORD *)(MEMORY[0x24BE39258] + 4))
    __udivti3();
  -[NSMutableDictionary setObject:forKey:](-[DYExperiment results](self->_experiment, "results"), "setObject:forKey:", objc_msgSend(v12, "numberWithUnsignedLongLong:"), CFSTR("Duration"));
  self->_isDone = 1;
}

- (unsigned)prevFileFunctionIndex
{
  return self->_prevFileFunctionIndex;
}

- (DYExperimentOverrideEnable)experiment
{
  return self->_experiment;
}

- (DYFunctionPlayer)functionPlayer
{
  return self->_functionPlayer;
}

- (void)setFunctionPlayer:(id)a3
{
  self->_functionPlayer = (DYFunctionPlayer *)a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void).cxx_destruct
{
  unique_ptr<GPUTools::RunningStatistics<unsigned long long>, std::default_delete<GPUTools::RunningStatistics<unsigned long long>>> *p_frameTimeStatistics;
  uint64_t v3;
  void *value;

  value = self->_frameTimeStatistics.__ptr_.__value_;
  p_frameTimeStatistics = &self->_frameTimeStatistics;
  v3 = (uint64_t)value;
  p_frameTimeStatistics->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<GPUTools::RunningStatistics<unsigned long long>>::operator()[abi:ne180100]((uint64_t)p_frameTimeStatistics, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
