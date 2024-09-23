@implementation MLNearestNeighborsSingleKdTreeIndex

- (MLNearestNeighborsSingleKdTreeIndex)initWithDataset:(void *)a3 numberOfDimensions:(unint64_t)a4 leafSize:(unint64_t)a5 error:(id *)a6
{
  MLNearestNeighborsSingleKdTreeIndex *v10;
  MLNearestNeighborsSingleKdTreeIndex *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char *p_vData;
  uint64_t v18;
  _KDNode *root;
  objc_super v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)MLNearestNeighborsSingleKdTreeIndex;
  v10 = -[MLNearestNeighborsSingleKdTreeIndex init](&v21, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    a6 = v11;
    goto LABEL_10;
  }
  v12 = *(char **)a3;
  v13 = *((_QWORD *)a3 + 1);
  v14 = (v13 - *(_QWORD *)a3) >> 2;
  if (!(v14 % a4))
  {
    p_vData = (char *)&v10->vData;
    if (&v11->vData != a3)
    {
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(p_vData, v12, v13, v14);
      v12 = *(char **)a3;
      v13 = *((_QWORD *)a3 + 1);
    }
    v11->_numDimensions = a4;
    v11->_leafSize = a5;
    if ((char *)v13 != v12)
    {
      -[MLNearestNeighborsSingleKdTreeIndex constructTree](v11, "constructTree");
      v18 = objc_claimAutoreleasedReturnValue();
      root = v11->_root;
      v11->_root = (_KDNode *)v18;

    }
    goto LABEL_9;
  }
  if (a6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("dataPoints.size() % dimensionality != 0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }
LABEL_10:

  return (MLNearestNeighborsSingleKdTreeIndex *)a6;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *i;
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *result;
  uint64_t v14;
  uint64_t v15;
  char *var0;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v29;
  int v30;
  std::string *v31;
  __int128 v32;
  NSObject *v33;
  std::string *v34;
  std::logic_error *exception;
  std::string v36;
  uint64_t v37;
  std::string v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v10 = *(_QWORD *)a5;
  v9 = *((_QWORD *)a5 + 1);
  if (-[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions") != (v9 - v10) >> 2)
  {
    std::to_string(&v38, (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 2);
    v31 = std::string::insert(&v38, 0, "invalid point.size()=");
    v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v32;
    v31->__r_.__value_.__l.__size_ = 0;
    v31->__r_.__value_.__r.__words[2] = 0;
    v31->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    +[MLLogging coreChannel](MLLogging, "coreChannel", *(_OWORD *)&v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__r.__words[2]);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = &v36;
      if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v34 = (std::string *)v36.__r_.__value_.__r.__words[0];
      LODWORD(v38.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v38.__r_.__value_.__r.__words + 4) = (std::string::size_type)v34;
      _os_log_error_impl(&dword_19C486000, v33, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v38, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v36);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
  }
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = a4;
  v36.__r_.__value_.__r.__words[2] = 0;
  v37 = 0;
  -[MLNearestNeighborsSingleKdTreeIndex root](self, "root", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLNearestNeighborsSingleKdTreeIndex findK:nearestNeighbors:toQueryPoint:inTree:](self, "findK:nearestNeighbors:toQueryPoint:inTree:", a4, &v36, a5, v11);

  for (i = 0; ; i = v17)
  {
    result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v36.__r_.__value_.__r.__words[2];
    if (v36.__r_.__value_.__r.__words[2] == v36.__r_.__value_.__l.__size_)
      break;
    v14 = HIDWORD(*(_QWORD *)v36.__r_.__value_.__l.__size_);
    v15 = (int)*(_QWORD *)v36.__r_.__value_.__l.__size_;
    var0 = (char *)retstr->var2.var0;
    if (i >= var0)
    {
      v18 = (char *)retstr->var0;
      v19 = (i - (char *)retstr->var0) >> 4;
      v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      v21 = var0 - v18;
      if (v21 >> 3 > v20)
        v20 = v21 >> 3;
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
        v22 = 0xFFFFFFFFFFFFFFFLL;
      else
        v22 = v20;
      if (v22)
        v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v22);
      else
        v23 = 0;
      v24 = v22 + 16 * v19;
      *(_QWORD *)v24 = v15;
      *(_DWORD *)(v24 + 8) = v14;
      v25 = (char *)v24;
      if (i != v18)
      {
        do
        {
          *((_OWORD *)v25 - 1) = *((_OWORD *)i - 1);
          v25 -= 16;
          i -= 16;
        }
        while (i != v18);
        i = (char *)retstr->var0;
      }
      v17 = (char *)(v24 + 16);
      retstr->var0 = v25;
      retstr->var1 = (void *)(v24 + 16);
      retstr->var2.var0 = (void *)(v22 + 16 * v23);
      if (i)
        operator delete(i);
    }
    else
    {
      *(_QWORD *)i = v15;
      *((_DWORD *)i + 2) = v14;
      v17 = i + 16;
    }
    retstr->var1 = v17;
    _KDPriorityQueue::pop((_KDPriorityQueue *)&v36);
  }
  v26 = (char *)retstr->var0;
  v27 = i - 16;
  if (retstr->var0 != i && v27 > v26)
  {
    do
    {
      v29 = *(_QWORD *)v26;
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *(_QWORD *)v27 = v29;
      v30 = *((_DWORD *)v26 + 2);
      *((_DWORD *)v26 + 2) = *((_DWORD *)v27 + 2);
      *((_DWORD *)v27 + 2) = v30;
      v26 += 16;
      v27 -= 16;
    }
    while (v26 < v27);
  }
  if (result)
  {
    v36.__r_.__value_.__r.__words[2] = (std::string::size_type)result;
    operator delete(result);
  }
  return result;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5
{
  float *begin;
  float *v10;
  unint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  std::string::size_type size;
  _BYTE *var1;
  _BYTE *var0;
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *result;
  std::string *v18;
  __int128 v19;
  NSObject *v20;
  std::string *v21;
  std::logic_error *exception;
  std::string v23;
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *v24;
  std::string __p;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[MLNearestNeighborsSingleKdTreeIndex dataPointCount](self, "dataPointCount") <= a4)
  {
    std::to_string(&__p, a4);
    v18 = std::string::insert(&__p, 0, "invalid k=");
    v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v23.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    +[MLLogging coreChannel](MLLogging, "coreChannel", *(_OWORD *)&v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__r.__words[2]);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v21 = (std::string *)v23.__r_.__value_.__r.__words[0];
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
      _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&__p, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v23);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
  }
  begin = self->vData.__begin_;
  v10 = &begin[-[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions") * a5];
  v11 = -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions");
  memset(&v23, 0, sizeof(v23));
  std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(&v23, v10, (uint64_t)&v10[v11], v11);
  v12 = a4 + 1;
  -[MLNearestNeighborsSingleKdTreeIndex findNearestNeighbors:toQueryPoint:](self, "findNearestNeighbors:toQueryPoint:", v12, &v23);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  size = __p.__r_.__value_.__l.__size_;
  v13 = (_OWORD *)__p.__r_.__value_.__r.__words[0];
  v24 = retstr;
  if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
  {
    var0 = 0;
    var1 = 0;
  }
  else
  {
    do
    {
      if (*(_QWORD *)v13 != a5)
        std::back_insert_iterator<std::vector<std::pair<unsigned long,float>>>::operator=[abi:ne180100]((void ***)&v24, v13);
      ++v13;
    }
    while (v13 != (_OWORD *)size);
    var0 = retstr->var0;
    var1 = retstr->var1;
  }
  if (v12 == (var1 - var0) >> 4)
    retstr->var1 = var1 - 16;
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v23.__r_.__value_.__r.__words[0];
  if (v23.__r_.__value_.__r.__words[0])
  {
    v23.__r_.__value_.__l.__size_ = v23.__r_.__value_.__r.__words[0];
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return result;
}

- (BOOL)updateWithData:(const void *)a3 error:(id *)a4
{
  unint64_t v7;
  const __CFString *v8;
  id v9;
  BOOL result;
  char *v11;
  unint64_t *begin;
  _KDNode *v13;
  _KDNode *root;

  v7 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2;
  if (v7 % -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions"))
  {
    if (a4)
    {
      v8 = CFSTR("Unexpected dimensionality of update data");
LABEL_4:
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v9;
      return result;
    }
    return 0;
  }
  v11 = (char *)*((_QWORD *)a3 + 1);
  if (v11 == *(char **)a3)
  {
    if (a4)
    {
      v8 = CFSTR("Training data is empty");
      goto LABEL_4;
    }
    return 0;
  }
  std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>((void **)&self->vData.__begin_, (char *)self->vData.__end_, *(char **)a3, v11, (uint64_t)&v11[-*(_QWORD *)a3] >> 2);
  begin = self->vIndices.__begin_;
  if (begin != self->vIndices.__end_)
    self->vIndices.__end_ = begin;
  -[MLNearestNeighborsSingleKdTreeIndex constructTree](self, "constructTree");
  v13 = (_KDNode *)objc_claimAutoreleasedReturnValue();
  root = self->_root;
  self->_root = v13;

  return 1;
}

- (unint64_t)dataPointCount
{
  unint64_t v2;

  v2 = self->vData.__end_ - self->vData.__begin_;
  return v2 / -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions");
}

- (id)constructTree
{
  vector<unsigned long, std::allocator<unsigned long>> *p_vIndices;
  unint64_t *value;
  unint64_t *begin;
  unint64_t *end;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t *v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t *v32;
  float *v33;
  float *v34;
  float *v35;
  float *v36;
  uint64_t v37;
  float v38;
  void *v40;
  void *__p;
  void *v43;
  char *v44;
  uint64_t v45;

  p_vIndices = &self->vIndices;
  std::vector<unsigned long>::reserve((void **)&self->vIndices.__begin_, (self->vData.__end_ - self->vData.__begin_)/ -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions"));
  value = self->vIndices.__end_cap_.__value_;
  begin = self->vIndices.__begin_;
  end = self->vIndices.__end_;
  v7 = (char *)value - (char *)begin;
  if (value != begin)
  {
    v8 = 0;
    v9 = self->vIndices.__end_;
    do
    {
      if (v9 >= value)
      {
        v10 = v9 - begin;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        if (v7 >> 2 > v11)
          v11 = v7 >> 2;
        if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8)
          v12 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        if (v12)
        {
          v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&self->vIndices.__end_cap_, v12);
          begin = self->vIndices.__begin_;
          v9 = self->vIndices.__end_;
        }
        else
        {
          v13 = 0;
        }
        v14 = (unint64_t *)&v13[8 * v10];
        *v14 = v8;
        end = v14 + 1;
        while (v9 != begin)
        {
          v15 = *--v9;
          *--v14 = v15;
        }
        value = (unint64_t *)&v13[8 * v12];
        self->vIndices.__begin_ = v14;
        self->vIndices.__end_ = end;
        self->vIndices.__end_cap_.__value_ = value;
        if (begin)
        {
          operator delete(begin);
          value = self->vIndices.__end_cap_.__value_;
          begin = p_vIndices->__begin_;
        }
        else
        {
          begin = v14;
        }
      }
      else
      {
        *v9 = v8;
        end = v9 + 1;
      }
      self->vIndices.__end_ = end;
      ++v8;
      v7 = (char *)value - (char *)begin;
      v9 = end;
    }
    while (v8 < value - begin);
  }
  v16 = -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions");
  __p = 0;
  v43 = 0;
  v17 = v16;
  v44 = 0;
  v45 = v16;
  if (v16)
  {
    v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v16);
    v19 = 0;
    v21 = &v18[8 * v20];
    __p = v18;
    v43 = v18;
    v44 = v21;
    v22 = v18;
    do
    {
      if (v22 >= v21)
      {
        v24 = (v22 - v18) >> 3;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        if ((v21 - v18) >> 2 > v25)
          v25 = (v21 - v18) >> 2;
        if ((unint64_t)(v21 - v18) >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v25;
        if (v26)
          v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v26);
        else
          v27 = 0;
        v28 = (_QWORD *)(v26 + 8 * v24);
        *v28 = 0xFF8000007F800000;
        v23 = v28 + 1;
        if (v22 != v18)
        {
          do
          {
            v29 = *((_QWORD *)v22 - 1);
            v22 -= 8;
            *--v28 = v29;
          }
          while (v22 != v18);
          v18 = (char *)__p;
        }
        v21 = (char *)(v26 + 8 * v27);
        __p = v28;
        v44 = v21;
        if (v18)
          operator delete(v18);
        v18 = (char *)v28;
      }
      else
      {
        *(_QWORD *)v22 = 0xFF8000007F800000;
        v23 = v22 + 8;
      }
      v43 = v23;
      ++v19;
      v22 = (char *)v23;
    }
    while (v19 != v17);
    v30 = (char *)__p;
  }
  else
  {
    v30 = 0;
  }
  v31 = 0;
  v32 = self->vIndices.__begin_;
  v33 = self->vData.__begin_;
  v34 = (float *)(v30 + 4);
  do
  {
    if (v17)
    {
      v35 = (float *)((char *)v33 + 4 * v17 * v32[v31]);
      v36 = v34;
      v37 = v17;
      do
      {
        v38 = *v35;
        if (*v35 < *(v36 - 1))
        {
          *(v36 - 1) = v38;
          v38 = *v35;
        }
        if (v38 > *v36)
          *v36 = v38;
        v36 += 2;
        ++v35;
        --v37;
      }
      while (v37);
    }
  }
  while (v31++ != ((unint64_t)((char *)end - (char *)begin) >> 3) - 1);
  -[MLNearestNeighborsSingleKdTreeIndex constructTreeForPointsBoundedBy:startingIndex:count:](self, "constructTreeForPointsBoundedBy:startingIndex:count:", &__p, 0, self->vIndices.__end_ - self->vIndices.__begin_);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v43 = __p;
    operator delete(__p);
  }
  return v40;
}

- (id)constructTreeForPointsBoundedBy:(void *)a3 startingIndex:(unint64_t)a4 count:(unint64_t)a5
{
  _KDNode *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  _DWORD *v14;
  void *v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  _DWORD *v21;
  void *v22;
  unsigned int i;
  float32x2_t v24;
  float32x2_t v25;
  _KDBoundingBox v27;
  _KDBoundingBox v28;
  _KDBoundingBox __p;

  if (a5)
  {
    v9 = objc_alloc_init(_KDNode);
    _KDBoundingBox::_KDBoundingBox(&__p, (_KDBoundingBox *)a3);
    -[_KDNode setBoundingBox:](v9, "setBoundingBox:", &__p);
    if (__p._intervals.__begin_)
    {
      __p._intervals.__end_ = __p._intervals.__begin_;
      operator delete(__p._intervals.__begin_);
    }
    -[_KDNode setStartingIndex:](v9, "setStartingIndex:", a4);
    -[_KDNode setCount:](v9, "setCount:", a5);
    if (-[MLNearestNeighborsSingleKdTreeIndex leafSize](self, "leafSize") >= a5)
    {
      -[_KDNode setSplitIndex:](v9, "setSplitIndex:", 0x7FFFFFFFLL);
      -[_KDNode setSplitDimension:](v9, "setSplitDimension:", 0x7FFFFFFFLL);
      -[_KDNode setLeftChild:](v9, "setLeftChild:", 0);
      -[_KDNode setRightChild:](v9, "setRightChild:", 0);
      -[_KDNode setIsLeaf:](v9, "setIsLeaf:", 1);
    }
    else
    {
      -[_KDNode assignSplitsForData:indices:numDimensions:](v9, "assignSplitsForData:indices:numDimensions:", self->vData.__begin_, self->vIndices.__begin_, -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions"));
      _KDBoundingBox::_KDBoundingBox(&v28, (_KDBoundingBox *)a3);
      v10 = -[_KDNode splitDimension](v9, "splitDimension");
      v11 = -[_KDNode splitDimension](v9, "splitDimension");
      v12 = *((_DWORD *)v28._intervals.__begin_ + 2 * v11);
      -[_KDNode splitValue](v9, "splitValue");
      if (v10 < (v28._intervals.__end_ - v28._intervals.__begin_) >> 3)
      {
        v14 = (_DWORD *)((char *)v28._intervals.__begin_ + 8 * v10);
        *v14 = v12;
        v14[1] = v13;
      }
      -[MLNearestNeighborsSingleKdTreeIndex constructTreeForPointsBoundedBy:startingIndex:count:](self, "constructTreeForPointsBoundedBy:startingIndex:count:", &v28, a4, -[_KDNode splitIndex](v9, "splitIndex") - a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KDNode setLeftChild:](v9, "setLeftChild:", v15);

      _KDBoundingBox::_KDBoundingBox(&v27, (_KDBoundingBox *)a3);
      v16 = -[_KDNode splitDimension](v9, "splitDimension");
      -[_KDNode splitValue](v9, "splitValue");
      v18 = v17;
      v19 = -[_KDNode splitDimension](v9, "splitDimension");
      if (v16 < (v27._intervals.__end_ - v27._intervals.__begin_) >> 3)
      {
        v20 = *((_DWORD *)v27._intervals.__begin_ + 2 * v19 + 1);
        v21 = (_DWORD *)((char *)v27._intervals.__begin_ + 8 * v16);
        *v21 = v18;
        v21[1] = v20;
      }
      -[MLNearestNeighborsSingleKdTreeIndex constructTreeForPointsBoundedBy:startingIndex:count:](self, "constructTreeForPointsBoundedBy:startingIndex:count:", &v27, -[_KDNode splitIndex](v9, "splitIndex"), -[_KDNode startingIndex](v9, "startingIndex") + a5 - -[_KDNode splitIndex](v9, "splitIndex"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KDNode setRightChild:](v9, "setRightChild:", v22);

      for (i = 0; -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions") > i; ++i)
      {
        if (i < (unint64_t)((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3))
        {
          v24.i32[0] = *((_QWORD *)v27._intervals.__begin_ + i);
          v24.i32[1] = HIDWORD(*((_QWORD *)v28._intervals.__begin_ + i));
          v25.i32[0] = *((_QWORD *)v28._intervals.__begin_ + i);
          v25.i32[1] = HIDWORD(*((_QWORD *)v27._intervals.__begin_ + i));
          *(int8x8_t *)(*(_QWORD *)a3 + 8 * i) = vbsl_s8((int8x8_t)vcgt_f32(v25, v24), *(int8x8_t *)((char *)v27._intervals.__begin_ + 8 * i), *(int8x8_t *)((char *)v28._intervals.__begin_ + 8 * i));
        }
      }
      if (v27._intervals.__begin_)
      {
        v27._intervals.__end_ = v27._intervals.__begin_;
        operator delete(v27._intervals.__begin_);
      }
      if (v28._intervals.__begin_)
      {
        v28._intervals.__end_ = v28._intervals.__begin_;
        operator delete(v28._intervals.__begin_);
      }
    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (vector<std::pair<unsigned)calculateDistancesForNodesBetweenLeft:(std:(float>>> *__return_ptr)retstr :(vector<std:()float> :(std:(float>>> *)self :(SEL)a3 allocator<std:(unint64_t)a4 :(unint64_t)a5 pair<unsigned)long pair<unsigned)long allocator<std:(const void *)a6 :pair<unsigned)long andRight:toQueryPoint:
{
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *v8;
  unint64_t v10;
  unint64_t v11;
  char *var1;
  uint64_t v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  float *v22;
  float *v23;
  float *v24;
  uint64_t v25;
  float v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *var0;
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  void *v43[3];
  void *v44;
  char *v45;
  uint64_t v46;
  void *__p[3];
  void *v48[3];

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (a5 >= a4)
  {
    v8 = self;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v10 = a5 - a4 + 1;
    std::vector<float>::reserve(&v44, unk_1EE4687C0(self, "numDimensions") * v10);
    v11 = a4;
    do
    {
      var1 = (char *)v8->var1;
      v13 = *((_QWORD *)v8[1].var1 + v11);
      v14 = unk_1EE4687C8(v8, "numDimensions");
      v15 = v45;
      v16 = unk_1EE4687D0(v8, "numDimensions");
      std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>(&v44, v15, &var1[4 * (int)v13 * v14], &var1[4 * (int)v13 * v14 + 4 * v16], v16);
      ++v11;
    }
    while (v11 <= a5);
    v42 = (char *)v44;
    v17 = unk_1EE4687D8(v8, "numDimensions");
    LODWORD(v48[0]) = 0;
    std::vector<float>::vector(v43, (int)v10, v48);
    std::vector<float>::vector(v48, 1uLL);
    std::vector<float>::vector(__p, (int)v10);
    cblas_sdot_NEWLAPACK();
    *(_DWORD *)v48[0] = v18;
    if ((int)v10 > 0)
    {
      v19 = 0;
      v20 = v42;
      do
      {
        cblas_sdot_NEWLAPACK();
        *(_DWORD *)((char *)__p[0] + v19) = v21;
        v19 += 4;
        v20 += 4 * v17;
      }
      while (4 * v10 != v19);
    }
    cblas_sgemm_NEWLAPACK();
    v22 = (float *)__p[0];
    if ((int)v10 >= 1)
    {
      v23 = (float *)v48[0];
      v24 = (float *)v43[0];
      v25 = v10;
      do
      {
        v26 = *v22++;
        *v24 = (float)(*v23 + v26) + *v24;
        ++v24;
        --v25;
      }
      while (v25);
      v22 = (float *)__p[0];
    }
    if (v22)
    {
      __p[1] = v22;
      operator delete(v22);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
    if (v10)
    {
      if (v10 >> 60)
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      v27 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v10);
      retstr->var0 = v27;
      retstr->var1 = v27;
      retstr->var2.var0 = &v27[2 * v28];
    }
    else
    {
      v27 = 0;
    }
    v29 = a4;
    do
    {
      v30 = *((_QWORD *)v8[1].var1 + v29);
      v31 = *((unsigned int *)v43[0] + v29 - a4);
      var0 = retstr->var2.var0;
      if (v27 >= (_QWORD *)var0)
      {
        v34 = retstr->var0;
        v35 = ((char *)v27 - (char *)retstr->var0) >> 4;
        v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 60)
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v37 = var0 - v34;
        if (v37 >> 3 > v36)
          v36 = v37 >> 3;
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
          v38 = 0xFFFFFFFFFFFFFFFLL;
        else
          v38 = v36;
        if (v38)
          v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v38);
        else
          v39 = 0;
        v40 = (char *)(v38 + 16 * v35);
        *(_QWORD *)v40 = v30;
        *((_QWORD *)v40 + 1) = v31;
        v41 = v40;
        if (v27 != (_QWORD *)v34)
        {
          do
          {
            *((_OWORD *)v41 - 1) = *((_OWORD *)v27 - 1);
            v41 -= 16;
            v27 -= 2;
          }
          while (v27 != (_QWORD *)v34);
          v27 = retstr->var0;
        }
        v33 = v40 + 16;
        retstr->var0 = v41;
        retstr->var1 = v40 + 16;
        retstr->var2.var0 = (void *)(v38 + 16 * v39);
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v27 = v30;
        v27[1] = v31;
        v33 = v27 + 2;
      }
      retstr->var1 = v33;
      ++v29;
      v27 = v33;
    }
    while (v29 <= a5);
    if (v43[0])
    {
      v43[1] = v43[0];
      operator delete(v43[0]);
    }
    self = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v44;
    if (v44)
    {
      v45 = (char *)v44;
      operator delete(v44);
    }
  }
  return self;
}

- (void)findK:(unint64_t)a3 nearestNeighbors:(void *)a4 toQueryPoint:(const void *)a5 inTree:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float *v16;
  float v17;
  float v18;
  float *v19;
  float *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  float v38;
  void *v39;
  void *v40;
  float v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  void *v45;
  void *v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;

  v10 = a6;
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isLeaf"))
    {
      -[MLNearestNeighborsSingleKdTreeIndex calculateDistancesForNodesBetweenLeft:andRight:toQueryPoint:](self, "calculateDistancesForNodesBetweenLeft:andRight:toQueryPoint:", objc_msgSend(v11, "startingIndex"), objc_msgSend(v11, "startingIndex") + objc_msgSend(v11, "count") - 1, a5);
      v12 = (uint64_t)(*((_QWORD *)&v52 + 1) - v52) >> 4;
      v13 = 126 - 2 * __clz(v12);
      if (*((_QWORD *)&v52 + 1) == (_QWORD)v52)
        v14 = 0;
      else
        v14 = v13;
      std::__introsort<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::pair<unsigned long,float> *,false>((float *)v52, *((float **)&v52 + 1), v14, 1);
      if (v12 >= a3)
        v12 = a3;
      if (v12)
      {
        v15 = 0;
        while (1)
        {
          v16 = (float *)(v52 + 16 * v15);
          v17 = *v16;
          v18 = v16[2];
          v19 = (float *)*((_QWORD *)a4 + 1);
          v20 = (float *)*((_QWORD *)a4 + 2);
          v21 = ((char *)v20 - (char *)v19) >> 3;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) <= *(_QWORD *)a4)
            break;
          if (v18 < v19[1])
          {
            _KDPriorityQueue::pop((_KDPriorityQueue *)a4);
            v20 = (float *)*((_QWORD *)a4 + 2);
            v23 = *((_QWORD *)a4 + 3);
            if ((unint64_t)v20 >= v23)
            {
              v19 = (float *)*((_QWORD *)a4 + 1);
              v24 = ((char *)v20 - (char *)v19) >> 3;
              v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 61)
                goto LABEL_69;
              v26 = v23 - (_QWORD)v19;
              if (v26 >> 2 > v25)
                v25 = v26 >> 2;
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
                v22 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v22 = v25;
              if (v22)
              {
                v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
                v19 = (float *)*((_QWORD *)a4 + 1);
                v20 = (float *)*((_QWORD *)a4 + 2);
              }
              else
              {
                v27 = 0;
              }
              v31 = v22 + 8 * v24;
              *(float *)v31 = v17;
              *(float *)(v31 + 4) = v18;
              v32 = v31;
              if (v20 != v19)
              {
                do
                {
                  v34 = *((_QWORD *)v20 - 1);
                  v20 -= 2;
                  *(_QWORD *)(v32 - 8) = v34;
                  v32 -= 8;
                }
                while (v20 != v19);
                goto LABEL_37;
              }
              goto LABEL_38;
            }
LABEL_22:
            *v20 = v17;
            v20[1] = v18;
            v29 = (uint64_t)(v20 + 2);
            goto LABEL_40;
          }
LABEL_41:
          if (++v15 == v12)
            goto LABEL_67;
        }
        v28 = *((_QWORD *)a4 + 3);
        if ((unint64_t)v20 < v28)
          goto LABEL_22;
        if (v22 >> 61)
LABEL_69:
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        v30 = v28 - (_QWORD)v19;
        if (v30 >> 2 > v22)
          v22 = v30 >> 2;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
          v22 = 0x1FFFFFFFFFFFFFFFLL;
        if (v22)
        {
          v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
          v19 = (float *)*((_QWORD *)a4 + 1);
          v20 = (float *)*((_QWORD *)a4 + 2);
        }
        else
        {
          v27 = 0;
        }
        v31 = v22 + 8 * v21;
        *(float *)v31 = v17;
        *(float *)(v31 + 4) = v18;
        v32 = v31;
        if (v20 != v19)
        {
          do
          {
            v33 = *((_QWORD *)v20 - 1);
            v20 -= 2;
            *(_QWORD *)(v32 - 8) = v33;
            v32 -= 8;
          }
          while (v20 != v19);
LABEL_37:
          v19 = (float *)*((_QWORD *)a4 + 1);
        }
LABEL_38:
        v29 = v31 + 8;
        *((_QWORD *)a4 + 1) = v32;
        *((_QWORD *)a4 + 2) = v31 + 8;
        *((_QWORD *)a4 + 3) = v22 + 8 * v27;
        if (v19)
          operator delete(v19);
LABEL_40:
        *((_QWORD *)a4 + 2) = v29;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_KDPriorityQueueComparator &,std::__wrap_iter<_KDPriorityQueueElement *>>(*((_QWORD *)a4 + 1), v29, (v29 - *((_QWORD *)a4 + 1)) >> 3);
        goto LABEL_41;
      }
      if ((_QWORD)v52)
LABEL_67:
        operator delete((void *)v52);
    }
    else
    {
      objc_msgSend(v11, "leftChild");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "boundingBox");
        v37 = v52;
        v38 = _KDBoundingBox::computeDistanceFromPoint((_KDBoundingBox *)v52, *((const float **)&v52 + 1), *(float **)a5);
        if ((_QWORD)v52)
        {
          *((_QWORD *)&v52 + 1) = v52;
          operator delete((void *)v37);
        }
      }
      else
      {
        v52 = 0u;
        v38 = _KDBoundingBox::computeDistanceFromPoint(0, 0, *(float **)a5);
      }

      objc_msgSend(v11, "rightChild");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "boundingBox");
        v41 = _KDBoundingBox::computeDistanceFromPoint((_KDBoundingBox *)v52, *((const float **)&v52 + 1), *(float **)a5);
        if ((_QWORD)v52)
          operator delete((void *)v52);
      }
      else
      {
        *(_QWORD *)&v52 = 0;
        v41 = _KDBoundingBox::computeDistanceFromPoint(0, 0, *(float **)a5);
      }

      v42 = *((_QWORD *)a4 + 1);
      if (a3 == (*((_QWORD *)a4 + 2) - v42) >> 3)
        v43 = *(float *)(v42 + 4);
      else
        v43 = INFINITY;
      if (v38 >= v41)
      {
        objc_msgSend(v11, "rightChild");
        v48 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "leftChild");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)v48;
        v47 = v41;
        v41 = v38;
      }
      else
      {
        objc_msgSend(v11, "leftChild");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rightChild");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)v44;
        v47 = v38;
      }
      if (v47 < v43 || (v49 = *((_QWORD *)a4 + 1), v50 = *((_QWORD *)a4 + 2) - v49, a3 > v50 >> 3))
      {
        -[MLNearestNeighborsSingleKdTreeIndex findK:nearestNeighbors:toQueryPoint:inTree:](self, "findK:nearestNeighbors:toQueryPoint:inTree:", a3, a4, a5, v46, (_QWORD)v52);
        v49 = *((_QWORD *)a4 + 1);
        v50 = *((_QWORD *)a4 + 2) - v49;
      }
      v51 = v50 >> 3;
      if (v51 == a3)
        v43 = *(float *)(v49 + 4);
      if (v41 < v43 || v51 < a3)
        -[MLNearestNeighborsSingleKdTreeIndex findK:nearestNeighbors:toQueryPoint:inTree:](self, "findK:nearestNeighbors:toQueryPoint:inTree:", a3, a4, a5, v45, (_QWORD)v52);

    }
  }

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions"), CFSTR("kNumDimensions"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[MLNearestNeighborsSingleKdTreeIndex leafSize](self, "leafSize"), CFSTR("kLeafSize"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->vData.__begin_, (char *)self->vData.__end_ - (char *)self->vData.__begin_, CFSTR("kVData"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->vIndices.__begin_, (char *)self->vIndices.__end_ - (char *)self->vIndices.__begin_, CFSTR("kVIndices"));
  -[MLNearestNeighborsSingleKdTreeIndex root](self, "root");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kRoot"));

}

- (MLNearestNeighborsSingleKdTreeIndex)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  const void *v7;
  char *v8;
  id v9;
  const void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v15;
  void *__p;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLNearestNeighborsSingleKdTreeIndex;
  v5 = -[MLNearestNeighborsSingleKdTreeIndex init](&v23, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 7) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNumDimensions"));
    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kLeafSize"));
    v22 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("kVData"), &v22);
    v20 = 0;
    v21 = 0;
    v19 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v19, v7, (uint64_t)v7 + (v22 & 0xFFFFFFFFFFFFFFFCLL), v22 >> 2);
    v8 = v19;
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v5 + 8, v19, v20, (v20 - (uint64_t)v19) >> 2);
    v9 = objc_retainAutorelease(v6);
    v10 = (const void *)objc_msgSend(v9, "decodeBytesForKey:returnedLength:", CFSTR("kVIndices"), &v22);
    v17 = 0;
    v18 = 0;
    __p = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v10, (uint64_t)v10 + (v22 & 0xFFFFFFFFFFFFFFF8), v22 >> 3);
    if (v5 + 32 != (char *)&__p)
      std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v5 + 32, (char *)__p, (uint64_t)v17, (v17 - (_BYTE *)__p) >> 3);
    v15 = 0;
    objc_msgSend(v9, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("kRoot"), &v15);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v11;

    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
    if (v8)
      operator delete(v8);

  }
  return (MLNearestNeighborsSingleKdTreeIndex *)v5;
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (unint64_t)leafSize
{
  return self->_leafSize;
}

- (void)setLeafSize:(unint64_t)a3
{
  self->_leafSize = a3;
}

- (_KDNode)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  float *v4;

  objc_storeStrong((id *)&self->_root, 0);
  begin = self->vIndices.__begin_;
  if (begin)
  {
    self->vIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->vData.__begin_;
  if (v4)
  {
    self->vData.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
