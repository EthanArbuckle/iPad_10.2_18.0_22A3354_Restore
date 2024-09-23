@implementation _ETBufferDataSource

- (unint64_t)numberOfDataPoints
{
  return self->_number_of_data_points;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  char *v16;
  __int128 v17;
  const void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ETDataTensor *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  id v38;
  void *v39;
  void *__p[2];
  __int128 v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 *v46;
  _QWORD v47[5];
  _QWORD v48[7];

  v35 = a3;
  v4 = (uint64_t *)self;
  v48[5] = *MEMORY[0x1E0C80C00];
  v38 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_dataStorage.__table_.__p2_.__value_);
  v5 = v4[8];
  if (v5)
  {
    v36 = (uint64_t)(v4 + 11);
    v37 = v4;
    do
    {
      v6 = (_QWORD *)(v5 + 16);
      v7 = v4[4];
      if (std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(v4[3], v7, (unsigned __int8 **)(v5 + 16)) == v7)
      {
        objc_msgSend(v4, "blobShapes");
        v46 = (__int128 *)(v5 + 16);
        v12 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)(v5 + 16), &v46);
        v13 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v12 + 40));
        v14 = v37[2];
        std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((_QWORD *)v41);
        v15 = __p[0];
        __p[0] = 0;
        if (v15)
          operator delete(v15);
        v9 = v13 / v14;
        v11 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 16) + 4 * v13 / v14 * v35;
      }
      else
      {
        objc_msgSend(v4, "blobShapes");
        v46 = (__int128 *)(v5 + 16);
        v8 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)(v5 + 16), &v46);
        v9 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v8 + 40));
        std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((_QWORD *)v41);
        v10 = __p[0];
        __p[0] = 0;
        if (v10)
          operator delete(v10);
        v11 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 16);
      }
      v46 = (__int128 *)(v5 + 16);
      v16 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v36, (unsigned __int8 *)(v5 + 16), &v46);
      v17 = *(_OWORD *)(v16 + 56);
      *(_OWORD *)__p = *(_OWORD *)(v16 + 40);
      v41 = v17;
      v18 = (const void *)*((_QWORD *)v16 + 10);
      v42 = *((_QWORD *)v16 + 9);
      v44 = 0;
      v45 = 0;
      v43 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v43, v18, *((_QWORD *)v16 + 11), (uint64_t)(*((_QWORD *)v16 + 11) - (_QWORD)v18) >> 2);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v19;
      v48[1] = &unk_1E2DEDC70;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(__p[1]));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(__p[0]));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v48[3] = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(__p[0]));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48[4] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (LODWORD(__p[1]) * v41 * HIDWORD(__p[0]) * LODWORD(__p[0])));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v23;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (HIDWORD(__p[0]) * LODWORD(__p[1]) * LODWORD(__p[0])));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (LODWORD(__p[0]) * HIDWORD(__p[0])));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(__p[0]));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v26;
      v47[4] = &unk_1E2DEDC70;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = -[ETDataTensor initWithData:type:shape:strides:]([ETDataTensor alloc], "initWithData:type:shape:strides:", v11, 2, v39, v27);
      v29 = (_QWORD *)(v5 + 16);
      if (*(char *)(v5 + 39) < 0)
        v29 = (_QWORD *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v29, v35);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v28, v30);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(char *)(v5 + 39) < 0)
        v6 = (_QWORD *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setMaxNumberOfElements:", v31);

      if (v43)
      {
        v44 = v43;
        operator delete(v43);
      }
      v5 = *(_QWORD *)v5;
      v4 = v37;
    }
    while (v5);
  }
  return v38;
}

- (_ETBufferDataSource)initWithBlobShapes:(const void *)a3 numberOfDataPoints:(unint64_t)a4 batchSize:(unint64_t)a5 error:(id *)a6
{
  _ETBufferDataSource *v9;
  _ETBufferDataSource *v10;
  unordered_map<std::string, Espresso::layer_shape, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, Espresso::layer_shape>>> *p_blobShapes;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::string *end;
  std::string *v20;
  int v21;
  char *v22;
  unint64_t *v23;
  __int128 v25;
  objc_super v26;
  __int128 *v27;

  v26.receiver = self;
  v26.super_class = (Class)_ETBufferDataSource;
  v9 = -[_ETBufferDataSource init](&v26, sel_init, a3, a4, a5, a6);
  v10 = v9;
  if (v9)
  {
    v9->_batchSize = a5;
    p_blobShapes = &v9->_blobShapes;
    if (&v10->_blobShapes != a3)
    {
      v10->_blobShapes.__table_.__p3_.__value_ = *((float *)a3 + 8);
      std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,Espresso::layer_shape>,void *> *>>(p_blobShapes, *((__int128 **)a3 + 2));
    }
    v10->_number_of_data_points = a4;
    v12 = (uint64_t *)*((_QWORD *)a3 + 2);
    if (v12)
    {
      while (1)
      {
        v13 = *((int *)v12 + 13);
        if (v13 != a5)
          break;
        v14 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v12 + 5));
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>(&v25, LODWORD(v10->_number_of_data_points) * (v14 / a5), 1, 1, 1);
        v27 = (__int128 *)(v12 + 2);
        v15 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v10->_dataStorage, (unsigned __int8 *)v12 + 16, &v27);
        std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v15 + 40), &v25);
        v16 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
        if (*((_QWORD *)&v25 + 1))
        {
          v17 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
          do
            v18 = __ldaxr(v17);
          while (__stlxr(v18 - 1, v17));
LABEL_17:
          if (!v18)
          {
            ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
            std::__shared_weak_count::__release_weak(v16);
          }
        }
LABEL_19:
        v12 = (uint64_t *)*v12;
        if (!v12)
          return v10;
      }
      if ((_DWORD)v13 != 1)
        goto LABEL_19;
      end = (std::string *)v10->_nonBatchBlobNames.__end_;
      if (end >= v10->_nonBatchBlobNames.__end_cap_.__value_)
      {
        v20 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)&v10->_nonBatchBlobNames, (uint64_t)(v12 + 2));
      }
      else
      {
        std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)&v10->_nonBatchBlobNames, (__int128 *)v12 + 1);
        v20 = end + 1;
      }
      v10->_nonBatchBlobNames.__end_ = v20;
      v21 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v12 + 5));
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>(&v25, v21, 1, 1, 1);
      v27 = (__int128 *)(v12 + 2);
      v22 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v10->_dataStorage, (unsigned __int8 *)v12 + 16, &v27);
      std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v22 + 40), &v25);
      v16 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
      if (!*((_QWORD *)&v25 + 1))
        goto LABEL_19;
      v23 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
      do
        v18 = __ldaxr(v23);
      while (__stlxr(v18 - 1, v23));
      goto LABEL_17;
    }
  }
  return v10;
}

- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4
{
  char *v7;
  void *end;
  uint64_t v9;
  float *v10;
  char *v11;
  unint64_t v12;
  void *v13;
  void *__p[5];
  __int128 *v16;

  __p[0] = (void *)a4;
  v7 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,1>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_dataStorage, (unsigned __int8 *)a4, (__int128 **)__p);
  end = self->_nonBatchBlobNames.__end_;
  v9 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>((uint64_t)self->_nonBatchBlobNames.__begin_, (uint64_t)end, (unsigned __int8 **)a4);
  v10 = *(float **)(*((_QWORD *)v7 + 5) + 16);
  if ((void *)v9 == end)
  {
    -[_ETBufferDataSource blobShapes](self, "blobShapes");
    v16 = (__int128 *)a4;
    v11 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)__p, (unsigned __int8 *)a4, &v16);
    v12 = Espresso::layer_shape::total_dim((Espresso::layer_shape *)(v11 + 40));
    v10 += v12 / -[_ETBufferDataSource batchSize](self, "batchSize") * a3;
    std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__deallocate_node((_QWORD *)__p[2]);
    v13 = __p[0];
    __p[0] = 0;
    if (v13)
      operator delete(v13);
  }
  return v10;
}

- (unordered_map<std::string,)dataStorage
{
  unordered_map<std::string, std::shared_ptr<Espresso::blob<float, 1>>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::shared_ptr<Espresso::blob<float, 1>>>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_dataStorage, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__18199);
  return result;
}

- (void)setDataStorage:()unordered_map<std:()std:()1>> :()std:()std:(std:()std:(1>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string
{
  objc_copyCppObjectAtomic(&self->_dataStorage, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__18198);
}

- (unordered_map<std::string,)blobShapes
{
  unordered_map<std::string, Espresso::layer_shape, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, Espresso::layer_shape>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_blobShapes, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__5);
  return result;
}

- (void)setBlobShapes:()unordered_map<std:()Espresso:()std:()std:(std:(Espresso::layer_shape>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :layer_shape :string
{
  objc_copyCppObjectAtomic(&self->_blobShapes, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__6);
}

- (unint64_t)number_of_data_points
{
  return self->_number_of_data_points;
}

- (void)setNumber_of_data_points:(unint64_t)a3
{
  self->_number_of_data_points = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (vector<std::string,)nonBatchBlobNames
{
  vector<std::string, std::allocator<std::string>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_nonBatchBlobNames, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__7);
  return result;
}

- (void)setNonBatchBlobNames:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  objc_copyCppObjectAtomic(&self->_nonBatchBlobNames, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__8);
}

- (void).cxx_destruct
{
  vector<std::string, std::allocator<std::string>> *p_nonBatchBlobNames;

  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)&self->_blobShapes);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::~__hash_table((uint64_t)&self->_dataStorage);
  p_nonBatchBlobNames = &self->_nonBatchBlobNames;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_nonBatchBlobNames);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end
