@implementation MLMultiArrayBufferLayout

- (MLMultiArrayBufferLayout)initWithShape:(id)a3 strides:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  BOOL v29;
  int64_t *begin;
  uint64_t *v31;
  int v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSArray *shape;
  uint64_t v38;
  NSArray *strides;
  __int128 v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  int64_t *end;
  int64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  int64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  int64_t *v64;
  uint64_t *v65;
  std::logic_error *exception;
  id v68;
  id v69;
  id v70;
  MLMultiArrayBufferLayout *v72;
  id obj;
  __int128 v74;
  int64_t *v75;
  __int128 v76;
  int64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  objc_super v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE buf[120];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v70 = a4;
  v5 = objc_msgSend(v69, "count");
  if (v5 != objc_msgSend(v70, "count"))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v69, "count");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v70, "count");
    }

    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = objc_msgSend(v69, "count");
    v9 = objc_msgSend(v70, "count");
  }
  v80.receiver = self;
  v80.super_class = (Class)MLMultiArrayBufferLayout;
  v72 = -[MLMultiArrayBufferLayout init](&v80, sel_init);
  if (v72)
  {
    CoreML::numericVectorFromObjC<long>((uint64_t)&v78, v69);
    CoreML::numericVectorFromObjC<long>((uint64_t)&v76, v70);
    v75 = 0;
    v74 = 0uLL;
    v68 = v69;
    std::vector<long long>::reserve((void **)&v74, objc_msgSend(v68, "count"));
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v68, "reverseObjectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
    v12 = (char *)v74;
    if (v11)
    {
      v13 = *(_QWORD *)v82;
      v14 = (unint64_t)v75;
      v15 = 1;
      obj = v10;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v82 != v13)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          v18 = (char *)*((_QWORD *)&v74 + 1);
          if (*((_QWORD *)&v74 + 1) >= v14)
          {
            v20 = (uint64_t)(*((_QWORD *)&v74 + 1) - (_QWORD)v12) >> 3;
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 61)
            {
              v75 = (int64_t *)v14;
              *(_QWORD *)&v74 = v12;
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v14 - (_QWORD)v12) >> 2 > v21)
              v21 = (uint64_t)(v14 - (_QWORD)v12) >> 2;
            if (v14 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
              v22 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v22 = v21;
            if (v22)
              v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
            else
              v23 = 0;
            v24 = (uint64_t *)(v22 + 8 * v20);
            *v24 = v15;
            v19 = (char *)(v24 + 1);
            while (v18 != v12)
            {
              v25 = *((_QWORD *)v18 - 1);
              v18 -= 8;
              *--v24 = v25;
            }
            v14 = v22 + 8 * v23;
            *((_QWORD *)&v74 + 1) = v19;
            if (v12)
              operator delete(v12);
            v12 = (char *)v24;
          }
          else
          {
            **((_QWORD **)&v74 + 1) = v15;
            v19 = v18 + 8;
          }
          *((_QWORD *)&v74 + 1) = v19;
          v15 *= objc_msgSend(v17, "integerValue");
        }
        v75 = (int64_t *)v14;
        *(_QWORD *)&v74 = v12;
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, buf, 16);
      }
      while (v11);
    }
    else
    {
      v19 = (char *)*((_QWORD *)&v74 + 1);
    }

    if (v12 != v19)
    {
      v26 = v19 - 8;
      if (v19 - 8 > v12)
      {
        v27 = v12 + 8;
        do
        {
          v28 = *((_QWORD *)v27 - 1);
          *((_QWORD *)v27 - 1) = *(_QWORD *)v26;
          *(_QWORD *)v26 = v28;
          v26 -= 8;
          v29 = v27 >= v26;
          v27 += 8;
        }
        while (!v29);
      }
    }

    begin = v72->_scalarStrides.__begin_;
    if (begin)
    {
      v72->_scalarStrides.__end_ = begin;
      operator delete(begin);
      v72->_scalarStrides.__begin_ = 0;
      v72->_scalarStrides.__end_ = 0;
      v72->_scalarStrides.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v72->_scalarStrides.__begin_ = v74;
    v72->_scalarStrides.__end_cap_.__value_ = v75;
    v31 = v78;
    v32 = 1;
    if (v78 != v79)
    {
      v33 = v78;
      do
      {
        v34 = *v33++;
        v35 = v32 * v34;
        if ((unsigned __int128)(v32 * (__int128)v34) >> 64 == v35 >> 63)
          v32 = v35;
        else
          v32 = -1;
      }
      while (v33 != v79);
    }
    v72->_scalarCount = v32;
    v36 = objc_msgSend(v68, "copy");
    shape = v72->_shape;
    v72->_shape = (NSArray *)v36;

    v38 = objc_msgSend(v70, "copy");
    strides = v72->_strides;
    v72->_strides = (NSArray *)v38;

    v40 = v76;
    v41 = (uint64_t *)v76;
    if ((_QWORD)v76 != *((_QWORD *)&v76 + 1))
    {
      v42 = (uint64_t *)(v76 + 8);
      while (v42 != *((uint64_t **)&v76 + 1))
      {
        v44 = *(v42 - 1);
        v43 = *v42++;
        if (v43 > v44)
        {
          v41 = v42 - 1;
          goto LABEL_51;
        }
      }
      v41 = (uint64_t *)*((_QWORD *)&v76 + 1);
    }
LABEL_51:
    v72->_firstMajorLayout = v41 == *((uint64_t **)&v76 + 1);
    v46 = v72->_scalarStrides.__begin_;
    end = v72->_scalarStrides.__end_;
    v47 = (char *)end - (char *)v46;
    v48 = (char *)end - (char *)v46 == *((_QWORD *)&v40 + 1) - (_QWORD)v40
       && memcmp(v72->_scalarStrides.__begin_, (const void *)v40, (char *)end - (char *)v46) == 0;
    v72->_firstMajorContiguousLayout = v48;
    v72->_contiguousScalarBlockSize = 1;
    if (end != v46)
    {
      v49 = v47 >> 3;
      if ((unint64_t)(v47 >> 3) <= 1)
        v49 = 1;
      v50 = (uint64_t *)((char *)v31 + v47 - 8);
      v51 = (uint64_t *)(v40 + v47 - 8);
      v52 = end - 1;
      do
      {
        v54 = *v52--;
        v53 = v54;
        v55 = *v51--;
        if (v53 != v55)
          break;
        v56 = *v50 * v53;
        if ((unsigned __int128)(*v50 * (__int128)v53) >> 64 != v56 >> 63)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "integer overflow in multiplication.");
          exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
          __cxa_throw(exception, (struct type_info *)off_1E3D427D8, MEMORY[0x1E0DE42E0]);
        }
        v72->_contiguousScalarBlockSize = v56;
        --v50;
        --v49;
      }
      while (v49);
    }
    std::vector<unsigned long>::vector(buf, (uint64_t)(*((_QWORD *)&v40 + 1) - v40) >> 3);
    v57 = v72->_innerToOuterIndices.__begin_;
    if (v57)
    {
      v72->_innerToOuterIndices.__end_ = v57;
      operator delete(v57);
      v72->_innerToOuterIndices.__begin_ = 0;
      v72->_innerToOuterIndices.__end_ = 0;
      v72->_innerToOuterIndices.__end_cap_.__value_ = 0;
    }
    v58 = *(uint64_t **)buf;
    v72->_innerToOuterIndices.__begin_ = *(unint64_t **)buf;
    v59 = *(uint64_t **)&buf[8];
    *(_OWORD *)&v72->_innerToOuterIndices.__end_ = *(_OWORD *)&buf[8];
    if (v58 != v59)
    {
      v60 = 0;
      v61 = v58;
      do
        *v61++ = v60++;
      while (v61 != v59);
    }
    v62 = 126 - 2 * __clz(v59 - v58);
    *(_QWORD *)buf = &v76;
    if (v59 == v58)
      v63 = 0;
    else
      v63 = v62;
    std::__introsort<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *,false>(v58, v59, (uint64_t **)buf, v63, 1);
    v64 = v72->_bufferStrides.__begin_;
    if (v64)
    {
      v72->_bufferStrides.__end_ = v64;
      operator delete(v64);
      v72->_bufferStrides.__begin_ = 0;
      v72->_bufferStrides.__end_ = 0;
      v72->_bufferStrides.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v72->_bufferStrides.__begin_ = v76;
    v65 = v78;
    v72->_bufferStrides.__end_cap_.__value_ = v77;
    if (v65)
      operator delete(v65);
  }

  return v72;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLMultiArrayBufferLayout shape](self, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiArrayBufferLayout strides](self, "strides");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("shape: [%@], strides: [%@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)offsetOfScalarAtIndex:(int64_t)a3 contiguousScalars:(int64_t *)a4
{
  int64_t result;
  id v8;

  if (a3 < 0 || self->_scalarCount <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Index is out-of-range."), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  result = a3;
  if (!self->_firstMajorContiguousLayout)
    result = -[MLMultiArrayBufferLayout _nonTrivialOffsetOfScalarAtIndex:](self, "_nonTrivialOffsetOfScalarAtIndex:", a3);
  if (a4)
    *a4 = self->_contiguousScalarBlockSize
        + a3 / self->_contiguousScalarBlockSize * self->_contiguousScalarBlockSize
        - a3;
  return result;
}

- (int64_t)_nonTrivialOffsetOfScalarAtIndex:(int64_t)a3
{
  int64_t *begin;
  int64_t *end;
  int64_t result;
  int64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;

  begin = self->_scalarStrides.__begin_;
  end = self->_scalarStrides.__end_;
  if (begin == end)
    return 0;
  result = 0;
  v7 = self->_bufferStrides.__begin_;
  do
  {
    v9 = *begin++;
    v8 = v9;
    v10 = a3 / v9;
    v11 = *v7++;
    result += v11 * v10;
    a3 -= v10 * v8;
  }
  while (begin != end);
  return result;
}

- (int64_t)_scalarIndexAtOffset:(int64_t)a3 contiguousScalars:(int64_t *)a4
{
  if (!self->_firstMajorContiguousLayout)
  {
    a3 = -[MLMultiArrayBufferLayout _nonTrivialScalarIndexAtOffset:](self, "_nonTrivialScalarIndexAtOffset:", a3);
    if (!a4)
      return a3;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = self->_contiguousScalarBlockSize
        + a3 / self->_contiguousScalarBlockSize * self->_contiguousScalarBlockSize
        - a3;
  return a3;
}

- (int64_t)_nonTrivialScalarIndexAtOffset:(int64_t)a3
{
  int64_t *end;
  int64_t *begin;
  int64_t v7;
  char *v8;
  char *v9;
  unint64_t *v10;
  unint64_t *v11;
  int64_t *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int v16;
  int64_t *v17;
  char *v18;
  int v19;
  int v20;
  int v21;
  int64_t v22;

  begin = self->_bufferStrides.__begin_;
  end = self->_bufferStrides.__end_;
  v7 = (char *)end - (char *)begin;
  if (end == begin)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    if (v7 < 0)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v7 >> 3);
    bzero(v8, v7);
    v9 = &v8[v7];
  }
  v11 = self->_innerToOuterIndices.__begin_;
  v10 = self->_innerToOuterIndices.__end_;
  if (v10 != v11)
  {
    v12 = self->_bufferStrides.__begin_;
    do
    {
      v13 = *--v10;
      v14 = v12[v13];
      v15 = a3 / v14;
      a3 %= v14;
      *(_QWORD *)&v8[8 * v13] = v15;
    }
    while (v10 != v11);
  }
  if (v8 == v9)
  {
    v22 = 0;
    if (!v8)
      return v22;
    goto LABEL_12;
  }
  v16 = 0;
  v17 = self->_scalarStrides.__begin_;
  v18 = v8;
  do
  {
    v20 = *(_DWORD *)v18;
    v18 += 8;
    v19 = v20;
    v21 = *(_DWORD *)v17++;
    v16 += v21 * v19;
  }
  while (v18 != v9);
  v22 = v16;
  if (v8)
LABEL_12:
    operator delete(v8);
  return v22;
}

- (BOOL)isSubspaceOfBufferLayout:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[MLMultiArrayBufferLayout count](self, "count");
  if (v5 <= objc_msgSend(v4, "count"))
  {
    -[MLMultiArrayBufferLayout _equivalentFirstMajorBufferLayout](self, "_equivalentFirstMajorBufferLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_equivalentFirstMajorBufferLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    do
    {
      v6 = v9 >= v5;
      if (v9 >= v5)
        break;
      v11 = 0;
      v12 = 0;
      objc_msgSend(v8, "_scalarIndexAtOffset:contiguousScalars:", objc_msgSend(v7, "offsetOfScalarAtIndex:contiguousScalars:", v9, &v12), &v11);
      v9 += v12;
    }
    while (v12 <= v11);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_equivalentFirstMajorBufferLayout
{
  MLMultiArrayBufferLayout *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t *begin;
  unint64_t *end;
  unint64_t v10;
  void *v11;
  void *v12;

  if (self->_firstMajorLayout)
  {
    v3 = self;
  }
  else
  {
    -[MLMultiArrayBufferLayout shape](self, "shape");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLMultiArrayBufferLayout strides](self, "strides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    begin = self->_innerToOuterIndices.__begin_;
    end = self->_innerToOuterIndices.__end_;
    while (begin != end)
    {
      v10 = *begin;
      objc_msgSend(v4, "objectAtIndexedSubscript:", *begin);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      ++begin;
    }
    v3 = -[MLMultiArrayBufferLayout initWithShape:strides:]([MLMultiArrayBufferLayout alloc], "initWithShape:strides:", v6, v7);

  }
  return v3;
}

- (int64_t)count
{
  return self->_scalarCount;
}

- (NSArray)shape
{
  return self->_shape;
}

- (NSArray)strides
{
  return self->_strides;
}

- (void).cxx_destruct
{
  unint64_t *begin;
  int64_t *v4;
  int64_t *v5;

  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  begin = self->_innerToOuterIndices.__begin_;
  if (begin)
  {
    self->_innerToOuterIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_bufferStrides.__begin_;
  if (v4)
  {
    self->_bufferStrides.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_scalarStrides.__begin_;
  if (v5)
  {
    self->_scalarStrides.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)initWithShape:(uint64_t *)a3 strides:(uint64_t)a4
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  int64_t v64;
  uint64_t *v65;
  int64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v9 = result;
LABEL_2:
  v10 = a2 - 1;
  v11 = v9;
  while (2)
  {
    v9 = v11;
    v12 = (char *)a2 - (char *)v11;
    v13 = a2 - v11;
    switch(v13)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v45 = *v11;
        if (*(_QWORD *)(**a3 + 8 * *v10) < *(_QWORD *)(**a3 + 8 * *v11))
        {
          *v11 = *v10;
          *v10 = v45;
        }
        return result;
      case 3:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v11, v11 + 1, a2 - 1, **a3);
      case 4:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v11, v11 + 1, v11 + 2, a2 - 1, a3);
      case 5:
        v46 = v11 + 1;
        v47 = v11 + 2;
        v48 = v11 + 3;
        result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v11, v11 + 1, v11 + 2, v11 + 3, a3);
        v49 = v11[3];
        v50 = **a3;
        if (*(_QWORD *)(v50 + 8 * *v10) < *(_QWORD *)(v50 + 8 * v49))
        {
          *v48 = *v10;
          *v10 = v49;
          v51 = *v48;
          v52 = *v47;
          if (*(_QWORD *)(v50 + 8 * *v48) < *(_QWORD *)(v50 + 8 * *v47))
          {
            *v47 = v51;
            *v48 = v52;
            v53 = *v46;
            if (*(_QWORD *)(v50 + 8 * v51) < *(_QWORD *)(v50 + 8 * *v46))
            {
              v11[1] = v51;
              v11[2] = v53;
              v54 = *v11;
              if (*(_QWORD *)(v50 + 8 * v51) < *(_QWORD *)(v50 + 8 * *v11))
              {
                *v11 = v51;
                v11[1] = v54;
              }
            }
          }
        }
        return result;
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
          {
            if (v11 != a2)
            {
              v55 = v11 + 1;
              if (v11 + 1 != a2)
              {
                v56 = **a3;
                v57 = 8;
                v58 = v11;
                do
                {
                  v60 = *v58;
                  v59 = v58[1];
                  v58 = v55;
                  if (*(_QWORD *)(v56 + 8 * v59) < *(_QWORD *)(v56 + 8 * v60))
                  {
                    v61 = v57;
                    while (1)
                    {
                      *(uint64_t *)((char *)v11 + v61) = v60;
                      v62 = v61 - 8;
                      if (v61 == 8)
                        break;
                      v60 = *(uint64_t *)((char *)v11 + v61 - 16);
                      v61 -= 8;
                      if (*(_QWORD *)(v56 + 8 * v59) >= *(_QWORD *)(v56 + 8 * v60))
                      {
                        v63 = (uint64_t *)((char *)v11 + v62);
                        goto LABEL_73;
                      }
                    }
                    v63 = v11;
LABEL_73:
                    *v63 = v59;
                  }
                  v55 = v58 + 1;
                  v57 += 8;
                }
                while (v58 + 1 != a2);
              }
            }
          }
          else if (v11 != a2)
          {
            v95 = v11 + 1;
            if (v11 + 1 != a2)
            {
              v96 = **a3;
              do
              {
                v98 = *v9;
                v97 = v9[1];
                v9 = v95;
                if (*(_QWORD *)(v96 + 8 * v97) < *(_QWORD *)(v96 + 8 * v98))
                {
                  do
                  {
                    *v95 = v98;
                    v98 = *(v95 - 2);
                    --v95;
                  }
                  while (*(_QWORD *)(v96 + 8 * v97) < *(_QWORD *)(v96 + 8 * v98));
                  *v95 = v97;
                }
                v95 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if (v11 != a2)
          {
            v64 = (unint64_t)(v13 - 2) >> 1;
            v65 = *a3;
            v66 = v64;
            do
            {
              v67 = v66;
              if (v64 >= v66)
              {
                v68 = (2 * v66) | 1;
                v69 = &v11[v68];
                v70 = *v69;
                if (2 * v67 + 2 >= v13)
                {
                  v71 = *v65;
                }
                else
                {
                  v71 = *v65;
                  if (*(_QWORD *)(*v65 + 8 * v70) < *(_QWORD *)(*v65 + 8 * v69[1]))
                  {
                    v70 = v69[1];
                    ++v69;
                    v68 = 2 * v67 + 2;
                  }
                }
                v72 = &v11[v67];
                v73 = *v72;
                result = *(uint64_t **)(v71 + 8 * v70);
                if ((uint64_t)result >= *(_QWORD *)(v71 + 8 * *v72))
                {
                  do
                  {
                    result = v69;
                    *v72 = v70;
                    if (v64 < v68)
                      break;
                    v74 = (2 * v68) | 1;
                    v69 = &v11[v74];
                    v75 = 2 * v68 + 2;
                    v70 = *v69;
                    if (v75 < v13 && *(_QWORD *)(v71 + 8 * v70) < *(_QWORD *)(v71 + 8 * v69[1]))
                    {
                      v70 = v69[1];
                      ++v69;
                      v74 = v75;
                    }
                    v72 = result;
                    v68 = v74;
                  }
                  while (*(_QWORD *)(v71 + 8 * v70) >= *(_QWORD *)(v71 + 8 * v73));
                  *result = v73;
                }
              }
              v66 = v67 - 1;
            }
            while (v67);
            v76 = (unint64_t)v12 >> 3;
            do
            {
              v77 = 0;
              v78 = *v11;
              v79 = *a3;
              v80 = v11;
              do
              {
                v81 = &v80[v77];
                v84 = v81[1];
                v82 = v81 + 1;
                v83 = v84;
                v85 = (2 * v77) | 1;
                v86 = 2 * v77 + 2;
                if (v86 < v76)
                {
                  result = (uint64_t *)v82[1];
                  if (*(_QWORD *)(*v79 + 8 * v83) < *(_QWORD *)(*v79 + 8 * (_QWORD)result))
                  {
                    v83 = v82[1];
                    ++v82;
                    v85 = v86;
                  }
                }
                *v80 = v83;
                v80 = v82;
                v77 = v85;
              }
              while (v85 <= (uint64_t)((unint64_t)(v76 - 2) >> 1));
              if (v82 == --a2)
              {
                *v82 = v78;
              }
              else
              {
                *v82 = *a2;
                *a2 = v78;
                v87 = (char *)v82 - (char *)v11 + 8;
                if (v87 >= 9)
                {
                  v88 = (((unint64_t)v87 >> 3) - 2) >> 1;
                  v89 = &v11[v88];
                  v90 = *v89;
                  v91 = *v82;
                  v92 = *v79;
                  if (*(_QWORD *)(v92 + 8 * *v89) < *(_QWORD *)(v92 + 8 * *v82))
                  {
                    do
                    {
                      v93 = v89;
                      *v82 = v90;
                      if (!v88)
                        break;
                      v88 = (v88 - 1) >> 1;
                      v89 = &v11[v88];
                      v90 = *v89;
                      v82 = v93;
                    }
                    while (*(_QWORD *)(v92 + 8 * *v89) < *(_QWORD *)(v92 + 8 * v91));
                    *v93 = v91;
                  }
                }
              }
            }
            while (v76-- > 2);
          }
          return result;
        }
        v14 = (unint64_t)v13 >> 1;
        v15 = &v11[(unint64_t)v13 >> 1];
        v16 = **a3;
        if ((unint64_t)v12 < 0x401)
        {
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v15, v9, a2 - 1, v16);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v9, v15, a2 - 1, v16);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v9 + 1, v15 - 1, a2 - 2, **a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v9 + 2, &v9[v14 + 1], a2 - 3, **a3);
          result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v15 - 1, v15, &v9[v14 + 1], **a3);
          v17 = *v9;
          *v9 = *v15;
          *v15 = v17;
        }
        --a4;
        v18 = *v9;
        v19 = **a3;
        if ((a5 & 1) == 0)
        {
          v20 = *(_QWORD *)(v19 + 8 * v18);
          if (*(_QWORD *)(v19 + 8 * *(v9 - 1)) < v20)
            goto LABEL_12;
          if (v20 >= *(_QWORD *)(v19 + 8 * *v10))
          {
            v36 = v9 + 1;
            do
            {
              v11 = v36;
              if (v36 >= a2)
                break;
              ++v36;
            }
            while (v20 >= *(_QWORD *)(v19 + 8 * *v11));
          }
          else
          {
            v11 = v9;
            do
            {
              v35 = v11[1];
              ++v11;
            }
            while (v20 >= *(_QWORD *)(v19 + 8 * v35));
          }
          v37 = a2;
          if (v11 < a2)
          {
            v37 = a2;
            do
              v38 = *--v37;
            while (v20 < *(_QWORD *)(v19 + 8 * v38));
          }
          if (v11 < v37)
          {
            v39 = *v11;
            v40 = *v37;
            do
            {
              *v11 = v40;
              *v37 = v39;
              v41 = *(_QWORD *)(v19 + 8 * v18);
              do
              {
                v42 = v11[1];
                ++v11;
                v39 = v42;
              }
              while (v41 >= *(_QWORD *)(v19 + 8 * v42));
              do
              {
                v43 = *--v37;
                v40 = v43;
              }
              while (v41 < *(_QWORD *)(v19 + 8 * v43));
            }
            while (v11 < v37);
          }
          v44 = v11 - 1;
          if (v11 - 1 != v9)
            *v9 = *v44;
          a5 = 0;
          *v44 = v18;
          continue;
        }
        v20 = *(_QWORD *)(v19 + 8 * v18);
LABEL_12:
        v21 = v9;
        do
        {
          v22 = v21;
          v24 = v21[1];
          ++v21;
          v23 = v24;
        }
        while (*(_QWORD *)(v19 + 8 * v24) < v20);
        v25 = a2;
        if (v22 == v9)
        {
          v25 = a2;
          do
          {
            if (v21 >= v25)
              break;
            v27 = *--v25;
          }
          while (*(_QWORD *)(v19 + 8 * v27) >= v20);
        }
        else
        {
          do
            v26 = *--v25;
          while (*(_QWORD *)(v19 + 8 * v26) >= v20);
        }
        if (v21 < v25)
        {
          v28 = *v25;
          v29 = v21;
          v30 = v25;
          do
          {
            *v29 = v28;
            *v30 = v23;
            v31 = *(_QWORD *)(v19 + 8 * v18);
            do
            {
              v22 = v29;
              v32 = v29[1];
              ++v29;
              v23 = v32;
            }
            while (*(_QWORD *)(v19 + 8 * v32) < v31);
            do
            {
              v33 = *--v30;
              v28 = v33;
            }
            while (*(_QWORD *)(v19 + 8 * v33) >= v31);
          }
          while (v29 < v30);
        }
        if (v22 != v9)
          *v9 = *v22;
        *v22 = v18;
        if (v21 < v25)
        {
LABEL_31:
          result = (uint64_t *)std::__introsort<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *,false>(v9, v22, a3, a4, a5 & 1);
          a5 = 0;
          v11 = v22 + 1;
          continue;
        }
        v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v9, v22, a3);
        v11 = v22 + 1;
        result = (uint64_t *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v22 + 1, a2, a3);
        if (!(_DWORD)result)
        {
          if (v34)
            continue;
          goto LABEL_31;
        }
        a2 = v22;
        if (!v34)
          goto LABEL_2;
        return result;
    }
  }
}

@end
