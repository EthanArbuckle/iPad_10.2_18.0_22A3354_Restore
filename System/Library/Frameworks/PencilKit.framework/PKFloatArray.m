@implementation PKFloatArray

- (_QWORD)initWithCapacity:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)PKFloatArray;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[4] = a2;
    std::vector<double>::resize((uint64_t)(v3 + 1), a2);
  }
  return v4;
}

- (uint64_t)setFloat:(double)a3 atIndex:
{
  id v3;

  if (result)
  {
    if (*(_QWORD *)(result + 32) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("index is out of bounds"), 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v3);
    }
    *(double *)(*(_QWORD *)(result + 8) + 8 * a2) = a3;
  }
  return result;
}

- (double)floatAtIndex:(uint64_t)a1
{
  id v3;

  if (!a1)
    return 0.0;
  if (*(_QWORD *)(a1 + 32) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("index is out of bounds"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return *(double *)(*(_QWORD *)(a1 + 8) + 8 * a2);
}

- (double)lastFloat
{
  uint64_t v1;
  id v3;

  if (!a1)
    return 0.0;
  v1 = *(_QWORD *)(a1 + 32);
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("container is empty"), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return -[PKFloatArray floatAtIndex:](a1, v1 - 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  PKFloatArray *v5;
  PKFloatArray *v6;
  BOOL v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (PKFloatArray *)-[PKFloatArray initWithCapacity:](v4, self->_capacity);
  v6 = v5;
  if (v5)
    v7 = v5 == self;
  else
    v7 = 1;
  if (!v7)
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v5->_vfloats, (char *)self->_vfloats.__begin_, (uint64_t)self->_vfloats.__end_, self->_vfloats.__end_ - self->_vfloats.__begin_);
  return v6;
}

- (void).cxx_destruct
{
  double *begin;

  begin = self->_vfloats.__begin_;
  if (begin)
  {
    self->_vfloats.__end_ = begin;
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
