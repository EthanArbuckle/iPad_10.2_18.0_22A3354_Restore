@implementation GTSubmeshData

- (void)addIndex:(unsigned int)a3
{
  __compressed_pair<unsigned int *, std::allocator<unsigned int>> *p_end_cap;
  unsigned int *value;
  unsigned int *end;
  unsigned int *v8;
  unsigned int *begin;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unsigned int *v15;
  unsigned int *v16;
  unsigned int v17;

  p_end_cap = &self->_indexVector.__end_cap_;
  value = self->_indexVector.__end_cap_.__value_;
  end = self->_indexVector.__end_;
  if (end >= value)
  {
    begin = self->_indexVector.__begin_;
    v10 = end - begin;
    if ((unint64_t)(v10 + 1) >> 62)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v11 = (char *)value - (char *)begin;
    v12 = ((char *)value - (char *)begin) >> 1;
    if (v12 <= v10 + 1)
      v12 = v10 + 1;
    if (v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, v13);
      begin = self->_indexVector.__begin_;
      end = self->_indexVector.__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = (unsigned int *)&v14[4 * v10];
    v16 = (unsigned int *)&v14[4 * v13];
    *v15 = a3;
    v8 = v15 + 1;
    while (end != begin)
    {
      v17 = *--end;
      *--v15 = v17;
    }
    self->_indexVector.__begin_ = v15;
    self->_indexVector.__end_ = v8;
    self->_indexVector.__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v8 = end + 1;
  }
  self->_indexVector.__end_ = v8;
}

- (unsigned)indexData
{
  return self->_indexVector.__begin_;
}

- (unint64_t)indexCount
{
  return self->_indexVector.__end_ - self->_indexVector.__begin_;
}

- (void).cxx_destruct
{
  unsigned int *begin;

  begin = self->_indexVector.__begin_;
  if (begin)
  {
    self->_indexVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
