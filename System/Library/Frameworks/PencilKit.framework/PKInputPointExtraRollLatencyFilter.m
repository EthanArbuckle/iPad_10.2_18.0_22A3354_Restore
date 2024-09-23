@implementation PKInputPointExtraRollLatencyFilter

- (void)resetFilter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKInputPointExtraRollLatencyFilter;
  -[PKInputPointBaseFilter resetFilter](&v3, sel_resetFilter);
  std::vector<double>::resize((uint64_t)&self->_inputRolls, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

- (void)addInputPoint:(id *)a3
{
  unint64_t numFramesExtraLatency;
  vector<double, std::allocator<double>> *p_inputRolls;
  double *end;
  double *begin;
  unint64_t v9;
  double *v10;
  int64_t v11;
  double *value;
  double *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  double *v18;
  uint64_t v19;

  if (self)
  {
    ++self->super._numInputPoints;
    numFramesExtraLatency = self->_numFramesExtraLatency;
    if (numFramesExtraLatency)
    {
      p_inputRolls = &self->_inputRolls;
      begin = self->_inputRolls.__begin_;
      end = self->_inputRolls.__end_;
      v9 = end - begin;
      if (v9 > numFramesExtraLatency)
      {
        v10 = self->_inputRolls.__begin_;
        do
        {
          v11 = (char *)end - (char *)(begin + 1);
          if (end != begin + 1)
          {
            memmove(begin, begin + 1, (char *)end - (char *)(begin + 1));
            v10 = p_inputRolls->__begin_;
          }
          end = (double *)((char *)begin + v11);
          self->_inputRolls.__end_ = (double *)((char *)begin + v11);
          v9 = ((char *)begin + v11 - (char *)v10) >> 3;
          begin = v10;
        }
        while (v9 > self->_numFramesExtraLatency);
        begin = v10;
      }
      value = self->_inputRolls.__end_cap_.__value_;
      if (end >= value)
      {
        v14 = v9 + 1;
        if ((v9 + 1) >> 61)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v15 = (char *)value - (char *)begin;
        if (v15 >> 2 > v14)
          v14 = v15 >> 2;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v16 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&self->_inputRolls.__end_cap_, v16);
          begin = p_inputRolls->__begin_;
          end = self->_inputRolls.__end_;
        }
        else
        {
          v17 = 0;
        }
        v18 = (double *)&v17[8 * v9];
        *v18 = a3->var12;
        v13 = v18 + 1;
        while (end != begin)
        {
          v19 = *((_QWORD *)end-- - 1);
          *((_QWORD *)v18-- - 1) = v19;
        }
        p_inputRolls->__begin_ = v18;
        self->_inputRolls.__end_ = v13;
        self->_inputRolls.__end_cap_.__value_ = (double *)&v17[8 * v16];
        if (begin)
        {
          operator delete(begin);
          begin = p_inputRolls->__begin_;
        }
        else
        {
          begin = v18;
        }
      }
      else
      {
        *end = a3->var12;
        v13 = end + 1;
      }
      self->_inputRolls.__end_ = v13;
      a3->var12 = *begin;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

- (void).cxx_destruct
{
  vector<double, std::allocator<double>> *p_inputRolls;
  double *begin;

  p_inputRolls = &self->_inputRolls;
  begin = self->_inputRolls.__begin_;
  if (begin)
  {
    p_inputRolls->__end_ = begin;
    operator delete(begin);
  }
}

@end
