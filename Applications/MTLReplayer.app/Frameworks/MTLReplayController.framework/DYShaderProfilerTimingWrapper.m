@implementation DYShaderProfilerTimingWrapper

- (DYShaderProfilerTimingWrapper)init
{
  DYShaderProfilerTimingWrapper *v2;
  DYShaderProfilerTimingWrapper *v3;
  DYShaderProfilerTimingWrapper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYShaderProfilerTimingWrapper;
  v2 = -[DYShaderProfilerTimingWrapper init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (DYShaderProfilerTiming)timing
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_time.average;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_cycle.min;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self->_time.max;
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

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
