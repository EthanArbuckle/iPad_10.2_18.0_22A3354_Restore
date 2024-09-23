@implementation _EARLazyDoubleArray

- (id)_initWithDoubleVector:(const void *)a3
{
  _EARLazyDoubleArray *v4;
  _EARLazyDoubleArray *v5;
  char *p_vec;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EARLazyDoubleArray;
  v4 = -[_EARLazyDoubleArray init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    p_vec = (char *)&v4->_vec;
    if (&v5->_vec != a3)
      std::vector<kaldi::CuWorkspace *>::__assign_with_size[abi:ne180100]<kaldi::CuWorkspace **,kaldi::CuWorkspace **>(p_vec, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  }
  return v5;
}

- (unint64_t)count
{
  return self->_vec.__end_ - self->_vec.__begin_;
}

- (id)objectAtIndex:(unint64_t)a3
{
  vector<double, std::allocator<double>> *p_vec;
  double *begin;
  unint64_t v6;

  p_vec = &self->_vec;
  begin = self->_vec.__begin_;
  v6 = self->_vec.__end_ - begin;
  if (v6 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Requested index %zu out of bounds %zu"), a3, v6);
    begin = p_vec->__begin_;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", begin[a3]);
}

- (void).cxx_destruct
{
  vector<double, std::allocator<double>> *p_vec;
  double *begin;

  p_vec = &self->_vec;
  begin = self->_vec.__begin_;
  if (begin)
  {
    p_vec->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
