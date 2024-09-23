@implementation GradientBuffer

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.speech.speechmodeltraining", "GradientBuffer");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

- (GradientBuffer)initWithTensorBefore:(id)a3 tensorAfter:(id)a4 withScale:(float)a5 shouldSparsify:(BOOL)a6 error:(id *)a7
{
  id v12;
  GradientBuffer *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void **p_begin;
  float v28;
  float *value;
  float *end;
  float *v31;
  float *begin;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  float *v38;
  int v39;
  GradientBuffer *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  int *v59;
  _BYTE v60[128];
  uint64_t v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v52 = a4;
  v58.receiver = self;
  v58.super_class = (Class)GradientBuffer;
  v13 = -[GradientBuffer init](&v58, sel_init);
  if (!v13)
  {
LABEL_33:
    v40 = v13;
    v15 = v52;
    goto LABEL_37;
  }
  objc_msgSend(v12, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v52;
  objc_msgSend(v52, "shape");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqual:", v16);

  if ((v17 & 1) != 0)
  {
    v13->_isSparse = a6;
    v13->_size = 1;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v12, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v55 != v20)
            objc_enumerationMutation(v18);
          v22 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
          v13->_size *= (int)objc_msgSend(v22, "intValue");

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v19);
    }

    v23 = objc_msgSend(v12, "dataPointer");
    v24 = objc_msgSend(v52, "dataPointer");
    if (v13->_size)
    {
      v25 = v24;
      v26 = 0;
      p_begin = (void **)&v13->_data.__begin_;
      do
      {
        v28 = (float)(*(float *)(v25 + 4 * v26) - *(float *)(v23 + 4 * v26)) * a5;
        if (v13->_isSparse)
        {
          if (v28 != 0.0)
          {
            v53 = v26;
            v59 = &v53;
            *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>((uint64_t)&v13->_sparseData, &v53, (uint64_t)&std::piecewise_construct, &v59)+ 5) = v28;
          }
        }
        else
        {
          end = v13->_data.__end_;
          value = v13->_data.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (float *)*p_begin;
            v33 = ((char *)end - (_BYTE *)*p_begin) >> 2;
            v34 = v33 + 1;
            if ((unint64_t)(v33 + 1) >> 62)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v35 = (char *)value - (char *)begin;
            if (v35 >> 1 > v34)
              v34 = v35 >> 1;
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL)
              v36 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v36 = v34;
            if (v36)
            {
              v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v13->_data.__end_cap_, v36);
              begin = v13->_data.__begin_;
              end = v13->_data.__end_;
            }
            else
            {
              v37 = 0;
            }
            v38 = (float *)&v37[4 * v33];
            *v38 = v28;
            v31 = v38 + 1;
            while (end != begin)
            {
              v39 = *((_DWORD *)end-- - 1);
              *((_DWORD *)v38-- - 1) = v39;
            }
            v13->_data.__begin_ = v38;
            v13->_data.__end_ = v31;
            v13->_data.__end_cap_.__value_ = (float *)&v37[4 * v36];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *end = v28;
            v31 = end + 1;
          }
          v13->_data.__end_ = v31;
        }
        ++v26;
      }
      while (v26 < v13->_size);
    }
    goto LABEL_33;
  }
  v41 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
    -[GradientBuffer initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);
  v49 = (void *)MEMORY[0x1E0CB35C8];
  v61 = *MEMORY[0x1E0CB2D50];
  v62[0] = CFSTR("unable to compute difference between two tensors of different shapes");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v50);
  *a7 = (id)objc_claimAutoreleasedReturnValue();

  v40 = 0;
LABEL_37:

  return v40;
}

- (void)accumulateDifferenceBetweenTensorBefore:(id)a3 andTensorAfter:(id)a4 withScale:(float)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t size;
  uint64_t v35;
  unint64_t j;
  float v37;
  uint64_t *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD *v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int *v55;
  uint64_t v56;
  const __CFString *v57;
  _BYTE v58[128];
  uint64_t v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    v21 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[GradientBuffer initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v59 = *MEMORY[0x1E0CB2D50];
    v60[0] = CFSTR("unable to compute difference between two tensors of different shapes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1, a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v9, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v52;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v14);
        v19 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "intValue");

        v17 *= v20;
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 1;
  }

  if (v17 != self->_size)
  {
    v39 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[GradientBuffer accumulateDifferenceBetweenTensorBefore:andTensorAfter:withScale:error:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D50];
    v57 = CFSTR("unable to accumulate difference of mismatch size");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1, a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    *v49 = v31;

    goto LABEL_31;
  }
  v32 = objc_msgSend(v9, "dataPointer", a6);
  v33 = objc_msgSend(v10, "dataPointer");
  size = self->_size;
  if (size)
  {
    v35 = v33;
    for (j = 0; j < size; ++j)
    {
      v37 = (float)(*(float *)(v35 + 4 * j) - *(float *)(v32 + 4 * j)) * a5;
      if (self->_isSparse)
      {
        if (v37 != 0.0)
        {
          v50 = j;
          v38 = std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, &v50);
          if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, &v50)&& (v37 = v37 + *((float *)v38 + 5), v37 == 0.0))
          {
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_, v38);
          }
          else
          {
            v55 = &v50;
            *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int &&>,std::tuple<>>((uint64_t)&self->_sparseData, &v50, (uint64_t)&std::piecewise_construct, &v55)+ 5) = v37;
          }
          size = self->_size;
        }
      }
      else
      {
        self->_data.__begin_[j] = v37 + self->_data.__begin_[j];
      }
    }
  }
LABEL_31:

}

- (void)applyToTensor:(id)a3 scale:(float)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  int v15;
  uint64_t v16;
  float *v17;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, float>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, float>, void *>>> *p_p1;
  uint64_t next_low;
  float v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  float *begin;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  NSObject *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v8, "shape", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    v12 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "intValue");

        v12 *= v15;
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  if (v12 != self->_size)
  {
    v25 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[GradientBuffer applyToTensor:scale:error:].cold.3(v25, v26, v27, v28, v29, v30, v31, v32);
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("Unable to apply gradient to mismatch tensor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    *a5 = v24;

    goto LABEL_22;
  }
  v16 = objc_msgSend(v8, "dataPointer");
  v17 = (float *)v16;
  if (!self->_isSparse)
  {
    begin = self->_data.__begin_;
    v35 = (char *)self->_data.__end_ - (char *)begin;
    if (!v35)
      goto LABEL_22;
    v36 = 0;
    v37 = v35 >> 2;
    if (v37 <= 1)
      v37 = 1;
    while (1)
    {
      v38 = *v17 + (float)(begin[v36] * a4);
      *v17 = v38;
      if ((LODWORD(v38) & 0x7FFFFFFFu) >= 0x7F800000)
        break;
      ++v36;
      ++v17;
      if (v37 == v36)
        goto LABEL_22;
    }
    v39 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[GradientBuffer applyToTensor:scale:error:].cold.1(v36, v17, v39);
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    v46 = CFSTR("inf/nan found during accumulation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  p_p1 = &self->_sparseData.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<int, float>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<int, float>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    next_low = SLODWORD(p_p1[2].__value_.__next_);
    v20 = *(float *)(v16 + 4 * next_low) + (float)(*((float *)&p_p1[2].__value_.__next_ + 1) * a4);
    *(float *)(v16 + 4 * next_low) = v20;
    if ((LODWORD(v20) & 0x7FFFFFFFu) >= 0x7F800000)
    {
      v21 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[GradientBuffer applyToTensor:scale:error:].cold.2(&v17[next_low], next_low, v21);
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("inf/nan found during accumulation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)reset
{
  float *begin;
  vector<float, std::allocator<float>> *p_data;
  uint64_t v4;
  unint64_t v5;

  if (self->_isSparse)
  {
    std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::clear(&self->_sparseData.__table_.__bucket_list_.__ptr_.__value_);
  }
  else
  {
    p_data = &self->_data;
    begin = self->_data.__begin_;
    v4 = (char *)p_data->__end_ - (char *)begin;
    if (v4)
    {
      v5 = v4 >> 2;
      if (v5 <= 1)
        v5 = 1;
      bzero(begin, 4 * v5);
    }
  }
}

- (float)l2norm
{
  float *next;
  float v3;
  float *begin;
  uint64_t v5;
  unint64_t v6;
  float v7;

  if (self->_isSparse)
  {
    next = (float *)self->_sparseData.__table_.__p1_.__value_.__next_;
    if (next)
    {
      v3 = 0.0;
      do
      {
        v3 = v3 + (float)(next[5] * next[5]);
        next = *(float **)next;
      }
      while (next);
      return sqrtf(v3);
    }
LABEL_12:
    v3 = 0.0;
    return sqrtf(v3);
  }
  begin = self->_data.__begin_;
  v5 = (char *)self->_data.__end_ - (char *)begin;
  if (!v5)
    goto LABEL_12;
  v6 = v5 >> 2;
  if (v6 <= 1)
    v6 = 1;
  v3 = 0.0;
  do
  {
    v7 = *begin++;
    v3 = v3 + (float)(v7 * v7);
    --v6;
  }
  while (v6);
  return sqrtf(v3);
}

- (void)multiply:(float)a3
{
  float *i;
  float *begin;
  uint64_t v5;
  unint64_t v6;

  if (self->_isSparse)
  {
    for (i = (float *)self->_sparseData.__table_.__p1_.__value_.__next_; i; i = *(float **)i)
      i[5] = i[5] * a3;
  }
  else
  {
    begin = self->_data.__begin_;
    v5 = (char *)self->_data.__end_ - (char *)begin;
    if (v5)
    {
      v6 = v5 >> 2;
      if (v6 <= 1)
        v6 = 1;
      do
      {
        *begin = *begin * a3;
        ++begin;
        --v6;
      }
      while (v6);
    }
  }
}

- (id)description
{
  uint64_t v3;

  if (self->_isSparse)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sparse gradient of size %lu with %lu non-zero values"), self->_size, self->_sparseData.__table_.__p2_.__value_);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dense gradient with %lu values"), self->_size, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  float *begin;

  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&self->_sparseData);
  begin = self->_data.__begin_;
  if (begin)
  {
    self->_data.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)initWithTensorBefore:(uint64_t)a3 tensorAfter:(uint64_t)a4 withScale:(uint64_t)a5 shouldSparsify:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AD756000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)accumulateDifferenceBetweenTensorBefore:(uint64_t)a3 andTensorAfter:(uint64_t)a4 withScale:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AD756000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)applyToTensor:(uint64_t)a1 scale:(float *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, float *a2, NSObject *a3)
{
  __int128 v3;

  LOWORD(v3) = 2048;
  *(double *)((char *)&v3 + 2) = *a2;
  OUTLINED_FUNCTION_2_0(&dword_1AD756000, (uint64_t)a2, a3, "ptr[%d] == %f", 67109376, *(double *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)applyToTensor:(float *)a1 scale:(uint64_t)a2 error:(NSObject *)a3 .cold.2(float *a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LOWORD(v3) = 2048;
  *(double *)((char *)&v3 + 2) = *a1;
  OUTLINED_FUNCTION_2_0(&dword_1AD756000, a2, a3, "ptr[%d] == %f", 67109376, *(double *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)applyToTensor:(uint64_t)a3 scale:(uint64_t)a4 error:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AD756000, a1, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
