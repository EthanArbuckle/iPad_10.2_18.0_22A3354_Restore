@implementation _InMemoryArchiveReader

- (_InMemoryArchiveReader)initWithNetwork:(shared_ptr<Espresso::net>)a3
{
  net *ptr;
  _InMemoryArchiveReader *v4;
  _InMemoryArchiveReader *v5;
  shared_ptr<Espresso::net> *p_network;
  NSArray *v7;
  net *v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  std::string *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  _NNLayerInfo *v29;
  int v30;
  uint64_t v31;
  _NNLayerInfo *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::string::size_type v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  int v40;
  unint64_t *v41;
  unint64_t v42;
  NSArray *layerInfos;
  std::string v45;
  __int128 v46;
  unint64_t v47;
  objc_super v48;

  ptr = a3.__ptr_;
  v48.receiver = self;
  v48.super_class = (Class)_InMemoryArchiveReader;
  v4 = -[_InMemoryArchiveReader init](&v48, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    p_network = &v4->_network;
    std::shared_ptr<unsigned char>::operator=[abi:ne180100](&v4->_network.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)v5->_network.__ptr_ + 5) - *((_QWORD *)v5->_network.__ptr_ + 4)) >> 4);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v8 = p_network->__ptr_;
    v9 = *((_QWORD *)p_network->__ptr_ + 4);
    if (*((_QWORD *)p_network->__ptr_ + 5) != v9)
    {
      v10 = 0;
      while (1)
      {
        v11 = *(_OWORD *)(v9 + 16 * v10);
        v46 = v11;
        if (*((_QWORD *)&v11 + 1))
        {
          v12 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
          do
            v13 = __ldxr(v12);
          while (__stxr(v13 + 1, v12));
          v8 = p_network->__ptr_;
        }
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t *)v8 + 7, v10, &v47);
        memset(&v45, 0, sizeof(v45));
        v16 = v15[3];
        if (v15[4] == v16)
        {
          v23 = &v45;
        }
        else
        {
          v17 = 0;
          v18 = 0;
          do
          {
            if (v18)
            {
              std::string::append(&v45, ",");
              v16 = v15[3];
            }
            v19 = v16 + v17;
            v20 = *(char *)(v19 + 23);
            if (v20 >= 0)
              v21 = (const std::string::value_type *)v19;
            else
              v21 = *(const std::string::value_type **)v19;
            if (v20 >= 0)
              v22 = *(unsigned __int8 *)(v19 + 23);
            else
              v22 = *(_QWORD *)(v19 + 8);
            std::string::append(&v45, v21, v22);
            ++v18;
            v16 = v15[3];
            v17 += 24;
          }
          while (v18 < 0xAAAAAAAAAAAAAAABLL * ((v15[4] - v16) >> 3));
          v23 = (v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &v45
              : (std::string *)v45.__r_.__value_.__r.__words[0];
        }
        objc_msgSend(v14, "stringWithUTF8String:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v45.__r_.__value_.__l.__data_);
        v25 = v46;
        v26 = (_QWORD *)(v46 + 40);
        v27 = (_QWORD *)(v46 + 40);
        if (*(char *)(v46 + 63) < 0)
          v27 = (_QWORD *)*v26;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = [_NNLayerInfo alloc];
        v30 = *(char *)(v25 + 63);
        if (v30 < 0)
        {
          if (*(_QWORD *)(v25 + 48) != 8)
            break;
          v26 = (_QWORD *)*v26;
        }
        else if (v30 != 8)
        {
          break;
        }
        if (*v26 != 0x686372615F6E6E72)
          break;
        v36 = *(_QWORD *)(v25 + 64);
        v37 = *(std::__shared_weak_count **)(v25 + 72);
        v45.__r_.__value_.__r.__words[0] = v36;
        v45.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
        if (v37)
        {
          p_shared_owners = (unint64_t *)&v37->__shared_owners_;
          do
            v39 = __ldxr(p_shared_owners);
          while (__stxr(v39 + 1, p_shared_owners));
        }
        v40 = *(_DWORD *)((*(uint64_t (**)(std::string::size_type))(*(_QWORD *)v36 + 384))(v36) + 148);
        if (!v37)
          goto LABEL_48;
        v41 = (unint64_t *)&v37->__shared_owners_;
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
          if (!v40)
            break;
        }
        else
        {
LABEL_48:
          if (!v40)
            break;
        }
        v31 = 1;
LABEL_34:
        v32 = -[_NNLayerInfo initWithType:concatenatedInputNames:bidirectional:](v29, "initWithType:concatenatedInputNames:bidirectional:", v28, v24, v31);
        -[NSArray addObject:](v7, "addObject:", v32);

        v33 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
        if (*((_QWORD *)&v46 + 1))
        {
          v34 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
        v10 = v47 + 1;
        v47 = v10;
        v8 = p_network->__ptr_;
        v9 = *((_QWORD *)p_network->__ptr_ + 4);
        if (v10 >= (*((_QWORD *)p_network->__ptr_ + 5) - v9) >> 4)
          goto LABEL_52;
      }
      v31 = 0;
      goto LABEL_34;
    }
LABEL_52:
    layerInfos = v5->_layerInfos;
    v5->_layerInfos = v7;

  }
  return v5;
}

- (NSString)modelPath
{
  return (NSString *)&stru_1E3D68DC8;
}

- (id)loadUpdatableParams:(id *)a3
{
  return 0;
}

- (id)transformParams
{
  if (*((_QWORD *)self->_network.__ptr_ + 43))
    return (id)MEMORY[0x1E0C9AA70];
  else
    return 0;
}

- (void)copyLayerShapesToContainer:(id)a3
{
  net *ptr;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unsigned __int8 *v17;
  __int128 v18;
  __int128 v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  net *v22;
  __int128 v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unsigned __int8 *v33;
  __int128 v34;
  __int128 v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  unsigned __int8 *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  id v48;
  uint64_t **v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[2];
  int v56;
  void *__p;
  _BYTE *v58;
  char v59;
  __int128 v60;
  unsigned __int8 *v61;
  void **p_p;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  memset(v55, 0, sizeof(v55));
  v56 = 1065353216;
  ptr = self->_network.__ptr_;
  v5 = *((_QWORD *)ptr + 4);
  if (*((_QWORD *)ptr + 5) != v5)
  {
    v6 = 0;
    do
    {
      v7 = *(_OWORD *)(v5 + 16 * v6);
      v60 = v7;
      v8 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
      if (*((_QWORD *)&v7 + 1))
      {
        v9 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      Espresso::layer_data::shapes((Espresso::layer_data *)&__p, *(uint64_t **)(v7 + 104), *(uint64_t **)(v7 + 112));
      v11 = (char *)__p;
      if (v58 != __p)
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = (_QWORD *)((char *)ptr + 96);
        do
        {
          v16 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::find<unsigned long>(v15, v6);
          if (!v16)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v61 = (unsigned __int8 *)(v16[3] + v12);
          v17 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v55, v61, (__int128 **)&v61);
          v18 = *(_OWORD *)&v11[v13];
          v19 = *(_OWORD *)&v11[v13 + 16];
          *((_QWORD *)v17 + 9) = *(_QWORD *)&v11[v13 + 32];
          *(_OWORD *)(v17 + 56) = v19;
          *(_OWORD *)(v17 + 40) = v18;
          if (&v11[v13] != (char *)(v17 + 40))
            std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v17 + 80, *(char **)&v11[v13 + 40], *(_QWORD *)&v11[v13 + 48], (uint64_t)(*(_QWORD *)&v11[v13 + 48] - *(_QWORD *)&v11[v13 + 40]) >> 2);
          ++v14;
          v11 = (char *)__p;
          v13 += 64;
          v12 += 24;
        }
        while (v14 < (v58 - (_BYTE *)__p) >> 6);
      }
      p_p = &__p;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](&p_p);
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v21 = __ldaxr(p_shared_owners);
        while (__stlxr(v21 - 1, p_shared_owners));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v22 = self->_network.__ptr_;
      v23 = *(_OWORD *)(*((_QWORD *)v22 + 4) + 16 * v6);
      v60 = v23;
      v24 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
      if (*((_QWORD *)&v23 + 1))
      {
        v25 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
        do
          v26 = __ldxr(v25);
        while (__stxr(v26 + 1, v25));
      }
      Espresso::layer_data::shapes((Espresso::layer_data *)&__p, *(uint64_t **)(v23 + 80), *(uint64_t **)(v23 + 88));
      v27 = (char *)__p;
      if (v58 != __p)
      {
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = (_QWORD *)((char *)v22 + 56);
        do
        {
          v32 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::find<unsigned long>(v31, v6);
          if (!v32)
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          v61 = (unsigned __int8 *)(v32[3] + v28);
          v33 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v55, v61, (__int128 **)&v61);
          v34 = *(_OWORD *)&v27[v29];
          v35 = *(_OWORD *)&v27[v29 + 16];
          *((_QWORD *)v33 + 9) = *(_QWORD *)&v27[v29 + 32];
          *(_OWORD *)(v33 + 56) = v35;
          *(_OWORD *)(v33 + 40) = v34;
          if (&v27[v29] != (char *)(v33 + 40))
            std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v33 + 80, *(char **)&v27[v29 + 40], *(_QWORD *)&v27[v29 + 48], (uint64_t)(*(_QWORD *)&v27[v29 + 48] - *(_QWORD *)&v27[v29 + 40]) >> 2);
          ++v30;
          v27 = (char *)__p;
          v29 += 64;
          v28 += 24;
        }
        while (v30 < (v58 - (_BYTE *)__p) >> 6);
      }
      p_p = &__p;
      std::vector<Espresso::layer_shape>::__destroy_vector::operator()[abi:ne180100](&p_p);
      if (v24)
      {
        v36 = (unint64_t *)&v24->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      ++v6;
      ptr = self->_network.__ptr_;
      v5 = *((_QWORD *)ptr + 4);
    }
    while (v6 < (*((_QWORD *)ptr + 5) - v5) >> 4);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v48, "inputLayerNames", v48);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(obj);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i)), "UTF8String"));
        *(_QWORD *)&v60 = &__p;
        v41 = std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v55, (unsigned __int8 *)&__p, (__int128 **)&v60);
        v42 = *((_DWORD *)v41 + 10);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 1, &__p, (__int128 **)&v60)+ 14) = v42;
        v43 = *((_DWORD *)v41 + 11);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 4, &__p, (__int128 **)&v60)+ 14) = v43;
        v44 = *((_DWORD *)v41 + 12);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 7, &__p, (__int128 **)&v60)+ 14) = v44;
        v45 = *((_DWORD *)v41 + 13);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 10, &__p, (__int128 **)&v60)+ 14) = v45;
        v46 = *((_DWORD *)v41 + 14);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 13, &__p, (__int128 **)&v60)+ 14) = v46;
        v47 = *((_DWORD *)v41 + 15);
        *(_QWORD *)&v60 = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v49 + 16, &__p, (__int128 **)&v60)+ 14) = v47;
        if (v59 < 0)
          operator delete(__p);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v38);
  }

  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_shape>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_shape>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_shape>>>::~__hash_table((uint64_t)v55);
}

- (NSArray)layerInfos
{
  return self->_layerInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerInfos, 0);
  std::shared_ptr<nlohmann::detail::output_adapter_protocol<char>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_network);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)readerFromArchiver:(void *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  neuralNetworkOutputFromArchive((_MLModelInputArchiver *)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_13;
  objc_msgSend(v6, "network");
  if (v19)
  {
    p_shared_owners = &v19->__shared_owners_;
    do
      v9 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v9 - 1, (unint64_t *)p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
      if (v18)
        goto LABEL_7;
LABEL_13:
      if (a4)
      {
        +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Error in reading in-memory network."));
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_16;
    }
  }
  if (!v18)
    goto LABEL_13;
LABEL_7:
  v10 = objc_alloc((Class)a1);
  objc_msgSend(v7, "network");
  v11 = (void *)objc_msgSend(v10, "initWithNetwork:", &v16);
  v12 = v17;
  if (v17)
  {
    v13 = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
LABEL_16:

  return v11;
}

+ (id)modelName
{
  return CFSTR("model");
}

@end
