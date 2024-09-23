@implementation MLNearestNeighborsLinearIndex

- (MLNearestNeighborsLinearIndex)initWithDataset:()vector<float numberOfDimensions:(std:(unint64_t)a4 :allocator<float>> *)a3
{
  MLNearestNeighborsLinearIndex *v6;
  MLNearestNeighborsLinearIndex *v7;
  const float **p_begin;
  unint64_t v9;
  unint64_t numDataPoints;
  vDSP_Length numDimensions;
  float *begin;
  const float *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MLNearestNeighborsLinearIndex;
  v6 = -[MLNearestNeighborsLinearIndex init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    p_begin = (const float **)&v6->vData.__begin_;
    if (&v6->vData != a3)
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)&v6->vData, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
    v9 = a3->__end_ - a3->__begin_;
    v7->_numDataPoints = v9 / a4;
    v7->_numDimensions = a4;
    if (v9 >= a4)
    {
      std::vector<float>::resize((char **)&v7->vDataL2Squared, v9 / a4);
      numDataPoints = v7->_numDataPoints;
      if (numDataPoints)
      {
        numDimensions = v7->_numDimensions;
        begin = v7->vDataL2Squared.__begin_;
        v13 = *p_begin;
        do
        {
          vDSP_svesq(v13, 1, begin++, numDimensions);
          v13 += numDimensions;
          --numDataPoints;
        }
        while (numDataPoints);
      }
    }
  }
  return v7;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5
{
  uint64_t v9;
  vDSP_Length v10;
  vDSP_Length v11;
  const float *v12;
  float *v13;
  float *begin;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  char *v20;
  char *v21;
  float *v22;
  float *v23;
  uint64_t v24;
  unint64_t v25;
  std::string::size_type v26;
  _DWORD *v27;
  int v28;
  unint64_t v29;
  float *v30;
  unint64_t v31;
  unint64_t v32;
  float *v33;
  float *v34;
  float v35;
  float v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  float *v42;
  float *v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  unint64_t v47;
  float *v48;
  float v49;
  uint64_t v50;
  float *v51;
  _OWORD *v53;
  uint64_t v54;
  unint64_t v55;
  float *v56;
  __int128 v57;
  vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *result;
  std::string *v59;
  __int128 v60;
  NSObject *v61;
  std::string *p_p;
  std::logic_error *exception;
  uint64_t v64;
  std::string::size_type v65;
  uint64_t v66;
  __int128 v67;
  std::string __p;
  std::string __C;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (-[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions") != v9 >> 2)
  {
    std::to_string(&__C, (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 2);
    v59 = std::string::insert(&__C, 0, "invalid queryPoint.size()=");
    v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v60;
    v59->__r_.__value_.__l.__size_ = 0;
    v59->__r_.__value_.__r.__words[2] = 0;
    v59->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__C.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__C.__r_.__value_.__l.__data_);
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      LODWORD(__C.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__C.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      _os_log_error_impl(&dword_19C486000, v61, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&__C, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &__p);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
  }
  std::vector<float>::vector(&__p, -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints"));
  v10 = -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions");
  v11 = -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints");
  v12 = *(const float **)a5;
  v13 = (float *)__p.__r_.__value_.__r.__words[0];
  begin = self->vDataL2Squared.__begin_;
  LODWORD(v66) = v11;
  v65 = __p.__r_.__value_.__r.__words[0];
  LODWORD(v64) = v10;
  cblas_sgemm_NEWLAPACK();
  vDSP_vadd(begin, 1, v13, 1, v13, 1, v11);
  LODWORD(__C.__r_.__value_.__l.__data_) = 0;
  vDSP_svesq(v12, 1, (float *)&__C, v10);
  vDSP_vsadd(v13, 1, (const float *)&__C, v13, 1, v11);
  v15 = -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints", v12, v64, v65, v66);
  v16 = v15;
  if (v15)
  {
    if (v15 >> 60)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v15);
    *(_QWORD *)&v19 = v17;
    v20 = v17;
    do
    {
      *(_QWORD *)v20 = 0;
      *((_DWORD *)v20 + 2) = 0;
      v20 += 16;
    }
    while (v20 != &v17[16 * v16]);
    v21 = &v17[16 * v18];
    *((_QWORD *)&v19 + 1) = &v17[16 * v16];
  }
  else
  {
    v21 = 0;
    v19 = 0uLL;
  }
  v22 = (float *)*((_QWORD *)&v19 + 1);
  v67 = v19;
  v23 = (float *)v19;
  if (*((_QWORD *)&v19 + 1) != (_QWORD)v19)
  {
    v24 = 0;
    v25 = (uint64_t)(*((_QWORD *)&v19 + 1) - v19) >> 4;
    v26 = __p.__r_.__value_.__r.__words[0];
    if (v25 <= 1)
      v25 = 1;
    v27 = (_DWORD *)(v19 + 8);
    do
    {
      v28 = *(_DWORD *)(v26 + 4 * v24);
      *((_QWORD *)v27 - 1) = v24;
      *v27 = v28;
      v27 += 4;
      ++v24;
    }
    while (v25 != v24);
  }
  v29 = -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints");
  if (v29 < a4)
    a4 = v29;
  if (a4 >= -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints"))
  {
    *(_OWORD *)&retstr->var0 = v67;
    retstr->var2.var0 = v21;
    goto LABEL_50;
  }
  if (!a4)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    if (!v23)
      goto LABEL_50;
    goto LABEL_49;
  }
  v30 = &v23[4 * a4];
  if ((uint64_t)a4 >= 2)
  {
    v31 = (a4 - 2) >> 1;
    v32 = v31 + 1;
    v33 = &v23[4 * v31];
    do
    {
      std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::__wrap_iter<std::pair<unsigned long,float> *>>((uint64_t)v23, a4, v33);
      v33 -= 4;
      --v32;
    }
    while (v32);
  }
  if (v30 != v22)
  {
    v34 = &v23[4 * a4];
    do
    {
      v35 = v34[2];
      v36 = v23[2];
      if (v35 < v36)
      {
        v37 = *(_QWORD *)v34;
        *(_QWORD *)v34 = *(_QWORD *)v23;
        *(_QWORD *)v23 = v37;
        v34[2] = v36;
        v23[2] = v35;
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::__wrap_iter<std::pair<unsigned long,float> *>>((uint64_t)v23, a4, v23);
      }
      v34 += 4;
    }
    while (v34 != v22);
  }
  if ((uint64_t)a4 >= 2)
  {
    v38 = a4 & 0xFFFFFFFFFFFFFFFLL;
    do
    {
      v39 = 0;
      v40 = *(_QWORD *)v23;
      v41 = *((_DWORD *)v23 + 2);
      v42 = v23;
      do
      {
        v43 = v42;
        v42 += 4 * v39 + 4;
        v44 = 2 * v39;
        v39 = (2 * v39) | 1;
        v45 = v44 + 2;
        if (v45 < v38 && v42[2] < v42[6])
        {
          v42 += 4;
          v39 = v45;
        }
        *(_QWORD *)v43 = *(_QWORD *)v42;
        v43[2] = v42[2];
      }
      while (v39 <= (uint64_t)((unint64_t)(v38 - 2) >> 1));
      if (v42 == v30 - 4)
      {
        *(_QWORD *)v42 = v40;
        *((_DWORD *)v42 + 2) = v41;
      }
      else
      {
        *(_QWORD *)v42 = *((_QWORD *)v30 - 2);
        v42[2] = *(v30 - 2);
        *((_QWORD *)v30 - 2) = v40;
        *((_DWORD *)v30 - 2) = v41;
        v46 = (char *)v42 - (char *)v23 + 16;
        if (v46 >= 17)
        {
          v47 = (unint64_t)((v46 >> 4) - 2) >> 1;
          v48 = &v23[4 * v47];
          v49 = v42[2];
          if (v48[2] < v49)
          {
            v50 = *(_QWORD *)v42;
            do
            {
              v51 = v42;
              v42 = v48;
              *(_QWORD *)v51 = *(_QWORD *)v48;
              v51[2] = v48[2];
              if (!v47)
                break;
              v47 = (v47 - 1) >> 1;
              v48 = &v23[4 * v47];
            }
            while (v48[2] < v49);
            *(_QWORD *)v42 = v50;
            v42[2] = v49;
          }
        }
      }
      v30 -= 4;
    }
    while (v38-- > 2);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (a4 >> 60)
    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
  v53 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(a4);
  retstr->var0 = v53;
  retstr->var1 = v53;
  retstr->var2.var0 = &v53[v54];
  v55 = 16 * a4;
  v56 = v23;
  do
  {
    v57 = *(_OWORD *)v56;
    v56 += 4;
    *v53++ = v57;
    v55 -= 16;
  }
  while (v55);
  retstr->var1 = v53;
  if (v23)
LABEL_49:
    operator delete(v23);
LABEL_50:
  result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)__p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsLinearIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5
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
  if (-[MLNearestNeighborsLinearIndex dataPointCount](self, "dataPointCount") <= a4)
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
  v10 = &begin[-[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions") * a5];
  v11 = -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions");
  memset(&v23, 0, sizeof(v23));
  std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(&v23, v10, (uint64_t)&v10[v11], v11);
  v12 = a4 + 1;
  -[MLNearestNeighborsLinearIndex findNearestNeighbors:toQueryPoint:](self, "findNearestNeighbors:toQueryPoint:", v12, &v23);
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
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  vector<float, std::allocator<float>> *p_vDataL2Squared;
  unint64_t v16;
  float *begin;
  unint64_t v18;
  vDSP_Length v19;
  float *v20;
  const float *v21;
  uint64_t v22;

  v7 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2;
  if (v7 % -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions"))
  {
    if (a4)
    {
      v8 = CFSTR("Unexpected dimensionality of update data");
LABEL_4:
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", v8);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v9;
    }
    return 0;
  }
  v10 = *((_QWORD *)a3 + 1);
  v11 = v10 - *(_QWORD *)a3;
  if (v10 == *(_QWORD *)a3)
  {
    if (a4)
    {
      v8 = CFSTR("Training data is empty");
      goto LABEL_4;
    }
    return 0;
  }
  v12 = -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions");
  v13 = (v11 >> 2) / v12;
  v14 = -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints");
  std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>((void **)&self->vData.__begin_, (char *)self->vData.__end_, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 2);
  -[MLNearestNeighborsLinearIndex setNumDataPoints:](self, "setNumDataPoints:", -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints") + v13);
  p_vDataL2Squared = &self->vDataL2Squared;
  std::vector<float>::resize((char **)&self->vDataL2Squared, -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints"));
  v16 = -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions");
  begin = self->vData.__begin_;
  v18 = -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions");
  if (v12 > v11 >> 2)
    return 1;
  v19 = v18;
  v20 = &p_vDataL2Squared->__begin_[v14];
  v21 = &begin[v16 * v14];
  v22 = 4 * v18;
  do
  {
    v9 = 1;
    vDSP_svesq(v21, 1, v20++, v19);
    v21 = (const float *)((char *)v21 + v22);
    --v13;
  }
  while (v13);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[MLNearestNeighborsLinearIndex numDataPoints](self, "numDataPoints"), CFSTR("kNumDataPoints"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[MLNearestNeighborsLinearIndex numDimensions](self, "numDimensions"), CFSTR("kNumDimensions"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->vData.__begin_, (char *)self->vData.__end_ - (char *)self->vData.__begin_, CFSTR("kVPoints"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->vDataL2Squared.__begin_, (char *)self->vDataL2Squared.__end_ - (char *)self->vDataL2Squared.__begin_, CFSTR("kVPointsL2Squared"));

}

- (MLNearestNeighborsLinearIndex)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  const void *v7;
  char *v8;
  const void *v9;
  char *v10;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MLNearestNeighborsLinearIndex;
  v5 = -[MLNearestNeighborsLinearIndex init](&v19, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 7) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kNumDataPoints"));
    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kNumDimensions"));
    v18 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("kVPoints"), &v18);
    v16 = 0;
    v17 = 0;
    v15 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v15, v7, (uint64_t)v7 + (v18 & 0xFFFFFFFFFFFFFFFCLL), v18 >> 2);
    v8 = v15;
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v5 + 8, v15, v16, (v16 - (uint64_t)v15) >> 2);
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("kVPointsL2Squared")))
    {
      v9 = (const void *)objc_msgSend(objc_retainAutorelease(v6), "decodeBytesForKey:returnedLength:", CFSTR("kVPointsL2Squared"), &v18);
      v13 = 0;
      v14 = 0;
      v12 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v12, v9, (uint64_t)v9 + (v18 & 0xFFFFFFFFFFFFFFFCLL), v18 >> 2);
      v10 = v12;
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v5 + 32, v12, v13, (v13 - (uint64_t)v12) >> 2);
      if (v10)
        operator delete(v10);
    }
    if (v8)
      operator delete(v8);
  }

  return (MLNearestNeighborsLinearIndex *)v5;
}

- (unint64_t)numDataPoints
{
  return self->_numDataPoints;
}

- (void)setNumDataPoints:(unint64_t)a3
{
  self->_numDataPoints = a3;
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (void).cxx_destruct
{
  float *begin;
  float *v4;

  begin = self->vDataL2Squared.__begin_;
  if (begin)
  {
    self->vDataL2Squared.__end_ = begin;
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
