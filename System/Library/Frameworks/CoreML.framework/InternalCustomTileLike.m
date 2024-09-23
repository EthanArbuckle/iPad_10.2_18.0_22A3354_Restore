@implementation InternalCustomTileLike

- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  float *v14;
  unint64_t inputRank;
  _QWORD *v16;
  uint64_t v17;
  float v18;
  unint64_t *begin;
  __int128 v21;
  unint64_t *v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "mutableBytes");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (float *)objc_msgSend(v13, "bytes");

  inputRank = self->_inputRank;
  v22 = 0;
  v21 = 0uLL;
  if (inputRank)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](&v21, inputRank);
    v16 = (_QWORD *)*((_QWORD *)&v21 + 1);
    v17 = 4 * inputRank;
    do
    {
      v18 = *v14++;
      *v16++ = (unint64_t)v18;
      v17 -= 4;
    }
    while (v17);
    *((_QWORD *)&v21 + 1) = v16;
  }
  begin = self->_multiples.__begin_;
  if (begin)
  {
    self->_multiples.__end_ = begin;
    operator delete(begin);
    self->_multiples.__begin_ = 0;
    self->_multiples.__end_ = 0;
    self->_multiples.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_multiples.__begin_ = v21;
  self->_multiples.__end_cap_.__value_ = v22;
  BrickLayers::Tile((uint64_t)&self->_multiples, v10, (uint64_t **)&self->_inputShape, v12, (uint64_t *)&self->_outputShape);

  return 1;
}

- (InternalCustomTileLike)initWithParameterDictionary:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InternalCustomTileLike;
  return -[InternalCustomTileLike init](&v5, sel_init, a3, a4);
}

- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inputRank = objc_msgSend(v6, "count");

  std::vector<unsigned long>::resize(&self->_inputShape.__begin_, self->_inputRank);
  std::vector<unsigned long>::resize(&self->_outputShape.__begin_, self->_inputRank);
  if (self->_inputRank)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self->_inputShape.__begin_[v7] = objc_msgSend(v9, "integerValue");

      ++v7;
    }
    while (v7 < self->_inputRank);
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setWeightData:(id)a3 error:(id *)a4
{
  return 1;
}

- (unint64_t)inputRank
{
  return self->_inputRank;
}

- (vector<unsigned)multiples
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_multiples.__begin_, (uint64_t)self->_multiples.__end_, self->_multiples.__end_ - self->_multiples.__begin_);
}

- (vector<unsigned)inputShape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_inputShape.__begin_, (uint64_t)self->_inputShape.__end_, self->_inputShape.__end_ - self->_inputShape.__begin_);
}

- (vector<unsigned)outputShape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_outputShape.__begin_, (uint64_t)self->_outputShape.__end_, self->_outputShape.__end_- self->_outputShape.__begin_);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  unint64_t *v5;

  begin = self->_outputShape.__begin_;
  if (begin)
  {
    self->_outputShape.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_inputShape.__begin_;
  if (v4)
  {
    self->_inputShape.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_multiples.__begin_;
  if (v5)
  {
    self->_multiples.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
