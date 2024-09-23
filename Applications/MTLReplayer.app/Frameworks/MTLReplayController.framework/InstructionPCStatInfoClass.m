@implementation InstructionPCStatInfoClass

- (InstructionPCStatInfoClass)init
{
  InstructionPCStatInfoClass *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InstructionPCStatInfoClass;
  result = -[InstructionPCStatInfoClass init](&v3, "init");
  if (result)
    result->_instructionPCStatInfo.shaderBinaryStats = 0;
  return result;
}

- (InstructionPCStatInfo)instructionPCStatInfo
{
  __int128 v4;
  DYMTLShaderProfilerGRCProcessedUSCSample *end;
  DYMTLShaderProfilerGRCProcessedUSCSample *value;
  int64_t v7;
  DYMTLShaderProfilerGRCProcessedUSCSample *v8;
  uint64_t v9;

  v4 = *(_OWORD *)&self->costFactor;
  *(_OWORD *)&retstr->shaderBinaryStats = *(_OWORD *)&self->limiterIndex;
  *((_OWORD *)retstr + 1) = v4;
  end = self->samples.__end_;
  *(_QWORD *)&retstr->cost = self->samples.__begin_;
  retstr->samples.__begin_ = 0;
  retstr->samples.__end_ = 0;
  retstr->samples.__end_cap_.__value_ = 0;
  value = self->samples.__end_cap_.__value_;
  v7 = value - end;
  if (value != end)
  {
    if (value - end < 0)
      abort();
    v8 = (DYMTLShaderProfilerGRCProcessedUSCSample *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<ASVDataSourceFilterTokenType,NSString * {__strong}>>>(v7 >> 4);
    retstr->samples.__begin_ = v8;
    retstr->samples.__end_cap_.__value_ = (DYMTLShaderProfilerGRCProcessedUSCSample *)((char *)v8 + 16 * v9);
    self = (InstructionPCStatInfo *)memmove(v8, end, v7);
    retstr->samples.__end_ = (DYMTLShaderProfilerGRCProcessedUSCSample *)((char *)v8 + v7);
  }
  return self;
}

- (void).cxx_destruct
{
  DYMTLShaderProfilerGRCProcessedUSCSample *begin;

  begin = self->_instructionPCStatInfo.samples.__begin_;
  if (begin)
  {
    self->_instructionPCStatInfo.samples.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
