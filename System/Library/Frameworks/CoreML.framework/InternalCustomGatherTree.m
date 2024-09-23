@implementation InternalCustomGatherTree

- (BOOL)evaluateOnCPUWithInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  float v16;
  id v17;
  uint64_t v18;
  int *begin;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  float v24;
  float *v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  BOOL v38;
  int v39;
  uint64_t v40;
  void *exception;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "bytes");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = objc_msgSend(v11, "bytes");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "bytes");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = *(float *)objc_msgSend(v15, "bytes");

  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "mutableBytes");

  begin = self->_shape.__begin_;
  v20 = *begin;
  v21 = begin[1];
  v22 = begin[2];
  v23 = (v21 * v20 * v22);
  v24 = (float)(int)v16;
  if ((int)v23 >= 1)
  {
    v25 = (float *)v18;
    do
    {
      *v25++ = v24;
      --v23;
    }
    while (v23);
  }
  if ((int)v21 >= 1)
  {
    v26 = 0;
    v27 = 0;
    v28 = v21 * v22;
    do
    {
      if (v22 >= 1)
      {
        v29 = 0;
        v30 = v26;
        do
        {
          if ((int)v20 >= (int)*(float *)(v14 + 4 * v27))
            v31 = (int)*(float *)(v14 + 4 * v27);
          else
            v31 = v20;
          if (v31 >= 1)
          {
            v32 = v29 + (v27 + (v31 - 1) * v21) * v22;
            *(_DWORD *)(v18 + 4 * v32) = *(_DWORD *)(v10 + 4 * v32);
            v33 = (int)*(float *)(v12 + 4 * v32);
            if (v33 < 0 || v22 < v33)
              goto LABEL_27;
            if (v31 > 1)
            {
              v34 = (v31 - 2);
              v35 = v34 + 1;
              v36 = v22 * (v27 + v21 * v34);
              while (1)
              {
                v37 = v33 + v36;
                *(float *)(v18 + 4 * (v29 + v36)) = (float)(int)*(float *)(v10 + 4 * v37);
                v33 = (int)*(float *)(v12 + 4 * v37);
                if (v33 < 0 || v22 < v33)
                  break;
                --v35;
                v36 -= v28;
                if (v35 < 1)
                  goto LABEL_19;
              }
LABEL_27:
              exception = __cxa_allocate_exception(0x10uLL);
              MEMORY[0x1A1AD5E28](exception, "Gather tree layer: Parent out of bound.");
              __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
LABEL_19:
            v38 = 0;
            v39 = v30;
            v40 = v20;
            do
            {
              if (v38)
              {
                *(float *)(v18 + 4 * v39) = v24;
                v38 = 1;
              }
              else
              {
                v38 = *(int *)(v18 + 4 * v39) == SLODWORD(v16);
              }
              v39 += v28;
              --v40;
            }
            while (v40);
          }
          ++v29;
          ++v30;
        }
        while (v29 != v22);
      }
      ++v27;
      v26 += v22;
    }
    while (v27 != v21);
  }

  return 1;
}

- (InternalCustomGatherTree)initWithParameterDictionary:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InternalCustomGatherTree;
  return -[InternalCustomGatherTree init](&v5, sel_init, a3, a4);
}

- (id)outputShapesForInputShapes:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int v10;
  int v11;
  int *value;
  int *end;
  int *v14;
  int *begin;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_shape.__end_ = self->_shape.__begin_;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "intValue");
        v11 = v10;
        end = self->_shape.__end_;
        value = self->_shape.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_shape.__begin_;
          v16 = end - begin;
          v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 62)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          v18 = (char *)value - (char *)begin;
          if (v18 >> 1 > v17)
            v17 = v18 >> 1;
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
            v19 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v19 = v17;
          if (v19)
          {
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v19);
            begin = self->_shape.__begin_;
            end = self->_shape.__end_;
          }
          else
          {
            v20 = 0;
          }
          v21 = (int *)(v19 + 4 * v16);
          *v21 = v11;
          v14 = v21 + 1;
          while (end != begin)
          {
            v22 = *--end;
            *--v21 = v22;
          }
          self->_shape.__begin_ = v21;
          self->_shape.__end_ = v14;
          self->_shape.__end_cap_.__value_ = (int *)(v19 + 4 * v20);
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = v10;
          v14 = end + 1;
        }
        self->_shape.__end_ = v14;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)setWeightData:(id)a3 error:(id *)a4
{
  return 1;
}

- (vector<int,)shape
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<int, std::allocator<int>> *)std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(retstr, self->_shape.__begin_, (uint64_t)self->_shape.__end_, self->_shape.__end_ - self->_shape.__begin_);
}

- (void).cxx_destruct
{
  int *begin;

  begin = self->_shape.__begin_;
  if (begin)
  {
    self->_shape.__end_ = begin;
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
