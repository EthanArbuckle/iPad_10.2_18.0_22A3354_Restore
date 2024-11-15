@implementation MTLToolsPerfCounterMailbox

- (void)insertData:(id)a3 andNumSamples:(unint64_t)a4 forRequester:(void *)a5
{
  id v7;
  char *value;
  char *end;
  void *v10;
  _BYTE *begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;

  self->_requester = a5;
  v7 = a3;
  value = (char *)self->_data.__end_cap_.__value_;
  end = (char *)self->_data.__end_;
  if (end >= value)
  {
    begin = self->_data.__begin_;
    v12 = (end - begin) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v14 = value - begin;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSData *,unsigned long>>>((uint64_t)&self->_data.__end_cap_, v15);
    v17 = &v16[16 * v12];
    v19 = &v16[16 * v18];
    *(_QWORD *)v17 = v7;
    *((_QWORD *)v17 + 1) = a4;
    v10 = v17 + 16;
    v21 = (char *)self->_data.__begin_;
    v20 = (char *)self->_data.__end_;
    if (v20 != v21)
    {
      do
      {
        *((_OWORD *)v17 - 1) = *((_OWORD *)v20 - 1);
        v17 -= 16;
        v20 -= 16;
      }
      while (v20 != v21);
      v20 = (char *)self->_data.__begin_;
    }
    self->_data.__begin_ = v17;
    self->_data.__end_ = v10;
    self->_data.__end_cap_.__value_ = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(_QWORD *)end = v7;
    *((_QWORD *)end + 1) = a4;
    v10 = end + 16;
  }
  self->_data.__end_ = v10;
  self->_iterator.__i_ = self->_data.__begin_;
}

- (id)extractDataAndNumSamples:(unint64_t *)a3 forRequester:(void *)a4 isLast:(BOOL *)a5
{
  char *i;
  id result;
  unint64_t v8;

  i = (char *)self->_iterator.__i_;
  result = *(id *)i;
  v8 = *((_QWORD *)i + 1);
  i += 16;
  *a3 = v8;
  self->_iterator.__i_ = i;
  if (i == self->_data.__end_)
  {
    *a5 = 1;
    self->_data.__end_ = self->_data.__begin_;
    self->_requester = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_data.__begin_;
  if (begin)
  {
    self->_data.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
