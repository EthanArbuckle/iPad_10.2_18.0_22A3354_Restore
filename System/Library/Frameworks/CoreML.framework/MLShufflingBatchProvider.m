@implementation MLShufflingBatchProvider

- (MLShufflingBatchProvider)initWithBatchProvider:(id)a3 seed:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t i;
  unint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;
  objc_super v44;
  unint64_t v45;
  int v46;
  unsigned int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MLShufflingBatchProvider;
  v8 = -[MLShufflingBatchProvider init](&v44, sel_init);
  if (v8)
  {
    for (i = 0; i < objc_msgSend(v6, "count"); ++i)
    {
      v11 = (uint64_t *)*((_QWORD *)v8 + 2);
      v10 = *((_QWORD *)v8 + 3);
      if ((unint64_t)v11 >= v10)
      {
        v13 = (uint64_t *)*((_QWORD *)v8 + 1);
        v14 = v11 - v13;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v16 = v10 - (_QWORD)v13;
        if (v16 >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v17);
          v13 = (uint64_t *)*((_QWORD *)v8 + 1);
          v11 = (uint64_t *)*((_QWORD *)v8 + 2);
        }
        else
        {
          v18 = 0;
        }
        v19 = (uint64_t *)(v17 + 8 * v14);
        *v19 = i;
        v12 = v19 + 1;
        while (v11 != v13)
        {
          v20 = *--v11;
          *--v19 = v20;
        }
        *((_QWORD *)v8 + 1) = v19;
        *((_QWORD *)v8 + 2) = v12;
        *((_QWORD *)v8 + 3) = v17 + 8 * v18;
        if (v13)
          operator delete(v13);
      }
      else
      {
        *v11 = i;
        v12 = v11 + 1;
      }
      *((_QWORD *)v8 + 2) = v12;
    }
    objc_msgSend(v8, "setBatchProvider:", v6);
    *((_DWORD *)v8 + 8) = 1;
    if (v7)
    {
      v21 = objc_msgSend(v7, "unsignedIntegerValue");
      v22 = std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(1uLL);
      v23 = 0;
      v24 = 0;
      *v22 = v21;
      v46 = -582287778;
      v47 = -1953789045;
      v45 = 0xDD4AFE5D51BF72D3;
      v25 = 3;
      v26 = 1;
      v27 = 2;
      do
      {
        if (v24 == 3)
          v24 = 0;
        else
          ++v24;
        if (v25 == 3)
          v25 = 0;
        else
          ++v25;
        if (v26 == 3)
          v26 = 0;
        else
          ++v26;
        v28 = *((_DWORD *)&v45 + v26);
        v29 = *((_DWORD *)&v45 + v24) ^ *((_DWORD *)&v45 + v25) ^ v28;
        v30 = 1664525 * (v29 ^ (v29 >> 27));
        *((_DWORD *)&v45 + v26) = v30 + v28;
        if (v27 == 3)
          v27 = 0;
        else
          ++v27;
        v31 = v22[v23] + v24 + v30;
        *((_DWORD *)&v45 + v27) += v31;
        *((_DWORD *)&v45 + v24) = v31;
        ++v23;
      }
      while (v23 != 1);
      v32 = 2;
      do
      {
        if (v24 == 3)
          v24 = 0;
        else
          ++v24;
        if (v25 == 3)
          v25 = 0;
        else
          ++v25;
        if (v26 == 3)
          v26 = 0;
        else
          ++v26;
        if (v27 == 3)
          v27 = 0;
        else
          ++v27;
        v33 = *((_DWORD *)&v45 + v26);
        v34 = *((_DWORD *)&v45 + v24) ^ *((_DWORD *)&v45 + v25) ^ v33;
        v35 = 1664525 * (v34 ^ (v34 >> 27));
        *((_DWORD *)&v45 + v26) = v35 + v33;
        v36 = v35 + v24;
        *((_DWORD *)&v45 + v27) += v36;
        *((_DWORD *)&v45 + v24) = v36;
        --v32;
      }
      while (v32);
      v37 = 4;
      do
      {
        if (v24 == 3)
          v24 = 0;
        else
          ++v24;
        if (v25 == 3)
          v25 = 0;
        else
          ++v25;
        if (v26 == 3)
          v26 = 0;
        else
          ++v26;
        if (v27 == 3)
          v27 = 0;
        else
          ++v27;
        v38 = *((_DWORD *)&v45 + v26);
        v39 = v38 + *((_DWORD *)&v45 + v24) + *((_DWORD *)&v45 + v25);
        v40 = 1566083941 * (v39 ^ (v39 >> 27));
        *((_DWORD *)&v45 + v26) = v40 ^ v38;
        v41 = v40 - v24;
        *((_DWORD *)&v45 + v27) ^= v41;
        *((_DWORD *)&v45 + v24) = v41;
        --v37;
      }
      while (v37);
      v42 = v47 + ((v47 / 0x7FFFFFFF) | ((v47 / 0x7FFFFFFF) << 31));
      if (v42 <= 1)
        v42 = 1;
      *((_DWORD *)v8 + 8) = v42;
      operator delete(v22);
    }
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<long *>,std::__wrap_iter<long *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u> &>(*((_QWORD *)v8 + 1), *((_QWORD *)v8 + 2), (uint64_t)v8 + 32);
  }

  return (MLShufflingBatchProvider *)v8;
}

- (void)shuffle
{
  std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<long *>,std::__wrap_iter<long *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u> &>((unint64_t)self->indices.__begin_, (uint64_t)self->indices.__end_, (uint64_t)&self->randomNumberGenerator);
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[MLShufflingBatchProvider batchProvider](self, "batchProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = self->indices.__begin_[a3];
  -[MLShufflingBatchProvider batchProvider](self, "batchProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featuresAtIndex:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MLBatchProvider)batchProvider
{
  return (MLBatchProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBatchProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  int64_t *begin;

  objc_storeStrong((id *)&self->_batchProvider, 0);
  begin = self->indices.__begin_;
  if (begin)
  {
    self->indices.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 1;
  return self;
}

@end
