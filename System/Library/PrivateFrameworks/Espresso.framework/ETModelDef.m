@implementation ETModelDef

- (void)transformForTraining:(shared_ptr<Espresso::net>)a3
{
  net *ptr;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  _QWORD *v7;
  std::string::size_type v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *size;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  __int128 *v26;
  std::string **v27;
  __int128 *v28;
  void *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  void *v39;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *begin_node;
  char *left;
  uint64_t v42;
  unint64_t v43;
  ETVariable *v44;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *v45;
  void *v46;
  char *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *v51;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *v52;
  BOOL v53;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *p_pair1;
  uint64_t v55;
  std::__shared_weak_count *v56;
  std::string __p;
  std::string *v58;
  std::string *v59;
  uint64_t v60;
  void *v61;
  __int128 *v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  _QWORD *v65;
  std::__shared_weak_count *v66;
  char v67;
  __int128 *v68[2];

  ptr = a3.__ptr_;
  v67 = 1;
  v5 = (std::__shared_weak_count *)operator new(0x80uLL);
  v6 = v5;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DB9B10;
  v7 = &v5[1].__vftable;
  v8 = *(_QWORD *)ptr;
  v9 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  __p.__r_.__value_.__r.__words[0] = v8;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  Espresso::gradient_builder::gradient_builder((uint64_t)&v5[1], &__p, &v67);
  if (v9)
  {
    v12 = (unint64_t *)&v9->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v65 = v7;
  v66 = v6;
  -[ETModelDef setGb:](self, "setGb:", &v65);
  v14 = v66;
  if (v66)
  {
    v15 = (unint64_t *)&v66->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  -[ETModelDef gb](self, "gb");
  Espresso::gradient_builder::preprocess_network((std::__shared_weak_count **)__p.__r_.__value_.__l.__data_, &v63);
  v17 = v64;
  if (v64)
  {
    v18 = (unint64_t *)&v64->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v21 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  -[ETModelDef gb](self, "gb");
  Espresso::gradient_builder::net_training_transform((Espresso::gradient_builder *)__p.__r_.__value_.__l.__data_, (uint64_t)&v61);
  v23 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v24 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = v62;
  if (v62)
  {
    do
    {
      std::pair<std::string const,Espresso::layer_training_transform_info>::pair[abi:ne180100](&__p, v26 + 1);
      v68[0] = (__int128 *)&__p;
      v27 = (std::string **)(std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->layer_variable_names, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, v68)+ 7);
      if (v27 != &v58)
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)v27, v58, v59, 0xAAAAAAAAAAAAAAABLL * (((char *)v59 - (char *)v58) >> 3));
      v68[0] = (__int128 *)&v60;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v68);
      v68[0] = (__int128 *)&v58;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v68);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v26 = *(__int128 **)v26;
    }
    while (v26);
    v28 = v62;
  }
  else
  {
    v28 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,Espresso::layer_training_transform_info>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,Espresso::layer_training_transform_info>>>::__deallocate_node(v28);
  v29 = v61;
  v61 = 0;
  if (v29)
    operator delete(v29);
  -[ETModelDef gb](self, "gb");
  v30 = *(std::__shared_weak_count **)(__p.__r_.__value_.__r.__words[0] + 8);
  v55 = *(_QWORD *)__p.__r_.__value_.__l.__data_;
  v56 = v30;
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
  }
  -[ETModelDef setNetwork:](self, "setNetwork:", &v55);
  v33 = v56;
  if (v56)
  {
    v34 = (unint64_t *)&v56->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
  if (__p.__r_.__value_.__l.__size_)
  {
    v37 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETModelDef setAll_variables:](self, "setAll_variables:", v39);

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)self->layer_variable_names.__tree_.__begin_node_;
  p_pair1 = &self->layer_variable_names.__tree_.__pair1_;
  if (begin_node != &self->layer_variable_names.__tree_.__pair1_)
  {
    do
    {
      left = (char *)begin_node[7].__value_.__left_;
      if (begin_node[8].__value_.__left_ != left)
      {
        v42 = 0;
        v43 = 0;
        do
        {
          v44 = -[ETVariable initWithModelDef:]([ETVariable alloc], "initWithModelDef:", self);
          v45 = begin_node + 4;
          if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
            v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[4].__value_.__left_;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45, p_pair1, v55);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ETVariable setLayerName:](v44, "setLayerName:", v46);
          v47 = &left[v42];

          if (left[v42 + 23] < 0)
            v47 = *(char **)v47;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[ETVariable setName:](v44, "setName:", v48);

          if (v43 == 1)
          {
            v49 = 2;
          }
          else
          {
            if (v43)
              Espresso::throw_exception_selector<Espresso::not_implemented_error,unsigned long &>(v43);
            v49 = 1;
          }
          -[ETVariable setKind:](v44, "setKind:", v49);
          -[ETVariable setInitializationMode:](v44, "setInitializationMode:", 0);
          -[ETModelDef all_variables](self, "all_variables");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v44);

          ++v43;
          left = (char *)begin_node[7].__value_.__left_;
          v42 += 24;
        }
        while (v43 < 0xAAAAAAAAAAAAAAABLL * (((char *)begin_node[8].__value_.__left_ - (char *)left) >> 3));
      }
      v51 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v51)
      {
        do
        {
          v52 = v51;
          v51 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)v51->__value_.__left_;
        }
        while (v51);
      }
      else
      {
        do
        {
          v52 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<std::string>>, void *>>> *)begin_node[2].__value_.__left_;
          v53 = v52->__value_.__left_ == begin_node;
          begin_node = v52;
        }
        while (!v53);
      }
      begin_node = v52;
    }
    while (v52 != p_pair1);
  }
  -[ETModelDef setupVariablesDef](self, "setupVariablesDef", p_pair1);
}

- (ETModelDef)initWithNetwork:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  _OWORD *v14;
  void *v15;
  __int128 v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  ETModelDef *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::runtime_error *exception;
  uint64_t v46;
  std::__shared_weak_count *v47;
  _QWORD v48[2];
  void *__p;
  uint64_t v50;
  char *v51;
  char **v52;
  char *v53[2];
  _QWORD *v54;
  std::__shared_weak_count *v55;
  uint64_t v56[2];
  uint64_t v57[2];
  int v58;
  std::__shared_weak_count *v59;
  _QWORD *v60[7];
  char v61;
  std::__shared_weak_count *v62;
  std::__shared_weak_count *v63;
  std::__shared_weak_count *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void **p_p;
  char v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58 = 80000;
  Espresso::create_context(&v58, &v66);
  (*(void (**)(uint64_t))(*(_QWORD *)v66 + 96))(v66);
  v5 = (std::__shared_weak_count *)v67;
  v57[0] = v66;
  v57[1] = v67;
  if (v67)
  {
    v6 = (unint64_t *)(v67 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v56[0] = 0;
  v56[1] = 0;
  Espresso::sequential_builder::sequential_builder((uint64_t)&v58, v57, 0, v56);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v10 = objc_retainAutorelease(v4);
  v11 = std::string::basic_string[abi:ne180100]<0>(&v70, (char *)objc_msgSend(v10, "UTF8String"));
  Espresso::load_network((uint64_t)v11, &v66, 0, 0, (uint64_t *)&v54);
  if (SBYTE7(v71) < 0)
    operator delete((void *)v70);
  if (v54)
  {
    if (v54[31] != 1 || v54[34] != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "network should have 1 input and 1 output");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v53[0] = 0;
    v53[1] = 0;
    v52 = v53;
    v12 = v54[29];
    __p = (void *)(v12 + 32);
    v13 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v54 + 17), (unsigned __int8 *)(v12 + 32), (__int128 **)&__p);
    Espresso::abstract_blob_container::shape((char *)&v70, *((_QWORD *)v13 + 5));
    std::string::basic_string[abi:ne180100]<0>(&__p, "data");
    p_p = &__p;
    v14 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v52, &__p, (_OWORD **)&p_p);
    v15 = (void *)*((_QWORD *)v14 + 12);
    v16 = v71;
    *(_OWORD *)((char *)v14 + 56) = v70;
    *(_OWORD *)((char *)v14 + 72) = v16;
    *((_QWORD *)v14 + 11) = v72;
    if (v15)
    {
      *((_QWORD *)v14 + 13) = v15;
      operator delete(v15);
      *((_QWORD *)v14 + 12) = 0;
      *((_QWORD *)v14 + 13) = 0;
      *((_QWORD *)v14 + 14) = 0;
    }
    v14[6] = v73;
    *((_QWORD *)v14 + 14) = v74;
    v74 = 0;
    v73 = 0uLL;
    if (SHIBYTE(v51) < 0)
    {
      operator delete(__p);
      if ((_QWORD)v73)
      {
        *((_QWORD *)&v73 + 1) = v73;
        operator delete((void *)v73);
      }
    }
    v17 = v55;
    v48[0] = v54;
    v48[1] = v55;
    if (v55)
    {
      v18 = (unint64_t *)&v55->__shared_owners_;
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    if (*(char *)(v12 + 55) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v70, *(const std::string::value_type **)(v12 + 32), *(_QWORD *)(v12 + 40));
    }
    else
    {
      v70 = *(_OWORD *)(v12 + 32);
      *(_QWORD *)&v71 = *(_QWORD *)(v12 + 48);
    }
    std::string::basic_string[abi:ne180100]<0>((_QWORD *)&v71 + 1, "data");
    __p = 0;
    v50 = 0;
    v51 = 0;
    p_p = &__p;
    v69 = 0;
    __p = operator new(0x30uLL);
    v50 = (uint64_t)__p;
    v51 = (char *)__p + 48;
    v50 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::pair<std::string,std::string> const*,std::pair<std::string,std::string> const*,std::pair<std::string,std::string>*>((uint64_t)&v51, (uint64_t)&v70, (uint64_t)&v73 + 8, (uint64_t)__p);
    Espresso::sequential_builder::add_network((uint64_t)&v58, v48, (const std::string **)&__p);
    p_p = &__p;
    std::vector<Espresso::profiler_t::compiler_analytics_entry_t>::__destroy_vector::operator()[abi:ne180100](&p_p);
    if (SBYTE7(v73) < 0)
      operator delete(*((void **)&v71 + 1));
    if (SBYTE7(v71) < 0)
      operator delete((void *)v70);
    if (v17)
    {
      v21 = (unint64_t *)&v17->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    Espresso::sequential_builder::build_from_shapes((uint64_t)&v58, (uint64_t)&v52, &v46);
    -[ETModelDef transformForTraining:](self, "transformForTraining:", &v46);
    v23 = v47;
    if (v47)
    {
      v24 = (unint64_t *)&v47->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v20 = self;
    std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v52, v53[0]);
  }
  else
  {
    v20 = 0;
  }
  v26 = v55;
  if (v55)
  {
    v27 = (unint64_t *)&v55->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v65);
  v29 = v64;
  if (v64)
  {
    v30 = (unint64_t *)&v64->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v32 = v63;
  if (v63)
  {
    v33 = (unint64_t *)&v63->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = v62;
  if (v62)
  {
    v36 = (unint64_t *)&v62->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (v61 < 0)
    operator delete(v60[5]);
  std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v60, v60[1]);
  v38 = v59;
  if (v59)
  {
    v39 = (unint64_t *)&v59->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v41 = (std::__shared_weak_count *)v67;
  if (v67)
  {
    v42 = (unint64_t *)(v67 + 8);
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  return v20;
}

- (shared_ptr<std::string>)topNamesForLayerIndex:(int)a3
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  __shared_weak_count *v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  int v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  shared_ptr<std::string> result;

  v6 = v3;
  v7 = operator new(0x30uLL);
  v8 = 0;
  v7[2] = 0;
  *v7 = &unk_1E2DC26D8;
  v7[1] = 0;
  v7[4] = 0;
  v7[5] = 0;
  *(_QWORD *)(v6 + 8) = v7;
  v7[3] = 0;
  *(_QWORD *)v6 = v7 + 3;
  while (1)
  {
    -[ETModelDef network](self, "network");
    v23 = a3;
    v9 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v24 + 96, a3, &v23);
    v12 = v9[3];
    v11 = v9[4];
    v13 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v11 - v12) >> 3) <= v8)
      break;
    if (v8)
      std::string::append(*(std::string **)v6, ",");
    -[ETModelDef network](self, "network");
    v23 = a3;
    v16 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v24 + 96, a3, &v23)[3]+ 24 * v8;
    v17 = *(char *)(v16 + 23);
    if (v17 >= 0)
      v18 = (const std::string::value_type *)v16;
    else
      v18 = *(const std::string::value_type **)v16;
    if (v17 >= 0)
      v19 = *(unsigned __int8 *)(v16 + 23);
    else
      v19 = *(_QWORD *)(v16 + 8);
    std::string::append(*(std::string **)v6, v18, v19);
    v20 = v25;
    if (v25)
    {
      v21 = (unint64_t *)&v25->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    ++v8;
  }
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)layerForName:(id)a3
{
  id v4;
  uint64_t *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  -[ETModelDef network](self, "network");
  v5 = *(uint64_t **)(v13 + 32);
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  while (1)
  {
    -[ETModelDef network](self, "network");
    v9 = *(uint64_t **)(v13 + 40);
    if (v14)
    {
      v10 = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    if (v5 == v9)
      break;
    v8 = *v5;
    if (*v5
      && !std::string::compare((const std::string *)(v8 + 16), (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String")))
    {
      goto LABEL_16;
    }
    v5 += 2;
  }
  v8 = 0;
LABEL_16:

  return (void *)v8;
}

- (shared_ptr<Espresso::blob<float,)weightsForLayer:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  unsigned __int8 *v10;
  Espresso *v11;
  const char *v12;
  uint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  uint64_t v29;
  int v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  void *v39;
  __shared_weak_count *v40;
  uint64_t v41;
  _QWORD v42[3];
  std::__shared_weak_count *v43;
  void *__p;
  std::__shared_weak_count *v45;
  char v46;
  __int128 v47;
  std::string buf;
  uint64_t v49;
  shared_ptr<Espresso::blob<float, 2>> result;

  v5 = v3;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[ETModelDef layerForName:](self, "layerForName:", v6))
  {
    v8 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
    Espresso::get_layer_parameter_name((const void **)&__p, 1, &buf);
    if (v46 < 0)
      operator delete(__p);
    -[ETModelDef network](self, "network");
    v9 = v47;
    -[ETModelDef network](self, "network");
    v10 = (unsigned __int8 *)Espresso::net::loaded_global_name((_QWORD *)v42[2], (uint64_t)&buf);
    Espresso::net::get_global(&__p, v9, v10);
    if (v43)
    {
      p_shared_owners = &v43->__shared_owners_;
      do
        v14 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v14 - 1, (unint64_t *)p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
    if (*((_QWORD *)&v47 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (__p)
    {
      v47 = 0uLL;
      v18 = v45;
      v42[0] = __p;
      v42[1] = v45;
      if (v45)
      {
        v19 = (unint64_t *)&v45->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      Espresso::sync_copy_to_host(v42, &v47);
      if (v18)
      {
        v21 = (unint64_t *)&v18->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v23 = v47;
      v24 = __p;
      v25 = *((_DWORD *)__p + 2);
      v26 = *((_DWORD *)__p + 3);
      v27 = *((_DWORD *)__p + 4);
      v28 = (char *)operator new(0x58uLL);
      *((_QWORD *)v28 + 1) = 0;
      *((_QWORD *)v28 + 2) = 0;
      *(_QWORD *)v28 = &off_1E2DBEC38;
      v29 = *(_QWORD *)(v23 + 24);
      v30 = v24[5];
      *((_QWORD *)v28 + 3) = &off_1E2DA11B0;
      *(_OWORD *)(v28 + 56) = 0u;
      *(_OWORD *)(v28 + 72) = 0u;
      *((_DWORD *)v28 + 8) = v26 * v25 * v27;
      *((_DWORD *)v28 + 9) = v30;
      *((_QWORD *)v28 + 5) = v29;
      *v5 = v28 + 24;
      v5[1] = v28;
      v28[48] = 1;
      *(_BYTE *)(v23 + 32) = 0;
      *(_QWORD *)(v23 + 24) = 0;
      v31 = (std::__shared_weak_count *)*((_QWORD *)&v47 + 1);
      if (*((_QWORD *)&v47 + 1))
      {
        v32 = (unint64_t *)(*((_QWORD *)&v47 + 1) + 8);
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
    }
    else
    {
      Espresso::espresso_os_log_subsystem(v11, v12);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v41 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        LODWORD(v47) = 136315138;
        *(_QWORD *)((char *)&v47 + 4) = v41;
        _os_log_debug_impl(&dword_190DAF000, v35, OS_LOG_TYPE_DEBUG, "weights not found for layer name %s passed to weightForLayer; returning nullptr.",
          (uint8_t *)&v47,
          0xCu);
      }

      *v5 = 0;
      v5[1] = 0;
    }
    v36 = v45;
    if (v45)
    {
      v37 = (unint64_t *)&v45->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    Espresso::espresso_os_log_subsystem(0, v7);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _os_log_debug_impl(&dword_190DAF000, v34, OS_LOG_TYPE_DEBUG, "Invalid layer name %s passed to weightsForLayer; returning nullptr.",
        (uint8_t *)&buf,
        0xCu);
    }

    *v5 = 0;
    v5[1] = 0;
  }

  result.__cntrl_ = v40;
  result.__ptr_ = v39;
  return result;
}

- (shared_ptr<Espresso::blob<float,)biasesForLayer:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  unsigned __int8 *v10;
  Espresso *v11;
  const char *v12;
  uint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  NSObject *v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  __shared_weak_count *v39;
  uint64_t v40;
  _QWORD v41[3];
  std::__shared_weak_count *v42;
  void *__p;
  std::__shared_weak_count *v44;
  char v45;
  __int128 v46;
  std::string buf;
  uint64_t v48;
  shared_ptr<Espresso::blob<float, 1>> result;

  v5 = v3;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[ETModelDef layerForName:](self, "layerForName:", v6))
  {
    v8 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v8, "UTF8String"));
    Espresso::get_layer_parameter_name((const void **)&__p, 2, &buf);
    if (v45 < 0)
      operator delete(__p);
    -[ETModelDef network](self, "network");
    v9 = v46;
    -[ETModelDef network](self, "network");
    v10 = (unsigned __int8 *)Espresso::net::loaded_global_name((_QWORD *)v41[2], (uint64_t)&buf);
    Espresso::net::get_global(&__p, v9, v10);
    if (v42)
    {
      p_shared_owners = &v42->__shared_owners_;
      do
        v14 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v14 - 1, (unint64_t *)p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
    if (*((_QWORD *)&v46 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (__p)
    {
      v46 = 0uLL;
      v18 = v44;
      v41[0] = __p;
      v41[1] = v44;
      if (v44)
      {
        v19 = (unint64_t *)&v44->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      Espresso::sync_copy_to_host(v41, &v46);
      if (v18)
      {
        v21 = (unint64_t *)&v18->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v23 = v46;
      v24 = *((_DWORD *)__p + 2);
      v25 = *((_DWORD *)__p + 3);
      v27 = *((_DWORD *)__p + 4);
      v26 = *((_DWORD *)__p + 5);
      v28 = (char *)operator new(0x58uLL);
      *((_QWORD *)v28 + 1) = 0;
      *((_QWORD *)v28 + 2) = 0;
      *(_QWORD *)v28 = &off_1E2DBEC00;
      v29 = *(_QWORD *)(v23 + 24);
      *((_QWORD *)v28 + 3) = &off_1E2DA1190;
      *(_OWORD *)(v28 + 72) = 0u;
      *(_OWORD *)(v28 + 56) = 0u;
      *((_DWORD *)v28 + 8) = v25 * v24 * v27 * v26;
      *((_QWORD *)v28 + 5) = v29;
      *v5 = v28 + 24;
      v5[1] = v28;
      v28[48] = 1;
      *(_BYTE *)(v23 + 32) = 0;
      *(_QWORD *)(v23 + 24) = 0;
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
      if (*((_QWORD *)&v46 + 1))
      {
        v31 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
    else
    {
      Espresso::espresso_os_log_subsystem(v11, v12);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v40 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        LODWORD(v46) = 136315138;
        *(_QWORD *)((char *)&v46 + 4) = v40;
        _os_log_debug_impl(&dword_190DAF000, v34, OS_LOG_TYPE_DEBUG, "biases not found for layer name %s passed to biasesForLayer; returning nullptr.",
          (uint8_t *)&v46,
          0xCu);
      }

      *v5 = 0;
      v5[1] = 0;
    }
    v35 = v44;
    if (v44)
    {
      v36 = (unint64_t *)&v44->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  else
  {
    Espresso::espresso_os_log_subsystem(0, v7);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      _os_log_debug_impl(&dword_190DAF000, v33, OS_LOG_TYPE_DEBUG, "Invalid layer name %s passed to weightsForLayer; returning nullptr.",
        (uint8_t *)&buf,
        0xCu);
    }

    *v5 = 0;
    v5[1] = 0;
  }

  result.__cntrl_ = v39;
  result.__ptr_ = v38;
  return result;
}

- (void)updateLayer:(id)a3 withWeights:(shared_ptr<float>)a4 length:(unint64_t)a5
{
  __shared_weak_count *var1;
  float *var0;
  void *v7;
  id v8;

  var1 = a4.var1;
  var0 = a4.var0;
  -[ETModelDef variableForLayer:kind:](self, "variableForLayer:kind:", a3, 1, a4.var1, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithData:", v7);

}

- (void)updateLayer:(id)a3 withBiases:(shared_ptr<float>)a4 length:(unint64_t)a5
{
  __shared_weak_count *var1;
  float *var0;
  void *v7;
  id v8;

  var1 = a4.var1;
  var0 = a4.var0;
  -[ETModelDef variableForLayer:kind:](self, "variableForLayer:kind:", a3, 2, a4.var1, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)var0, var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithData:", v7);

}

- (void)randomizeWeightsForLayer:(id)a3 withSeed:(float)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  const void *v9;
  void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  char *v15;
  unsigned int v16;
  unsigned int *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  int v24;
  int v25;
  int v26;
  unint64_t *v27;
  unint64_t v28;
  float v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  unint64_t v38;
  uint64_t i;
  unsigned int v40;
  unsigned int v41;
  BOOL v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  double v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t *v67;
  unint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  void *lpsrc;
  std::__shared_weak_count *v72;
  std::__shared_weak_count *v73;
  std::__shared_weak_count *v74;
  uint64_t v75[2];
  uint64_t v76;
  std::__shared_weak_count *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  std::__shared_weak_count *v81;

  v6 = a3;
  v7 = -[ETModelDef layerForName:](self, "layerForName:", v6);
  v8 = v7;
  if (!v7)
  {
    v80 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    Espresso::throw_exception_selector<Espresso::generic_error,char const*&>("layer with name %s not found", &v80);
  }
  v9 = (const void *)v7[8];
  if (v9)
  {
    if (v10)
    {
      v11 = v10;
      v12 = (std::__shared_weak_count *)v8[9];
      v74 = v12;
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }
      v15 = (char *)operator new(0x20uLL);
      *((_QWORD *)v15 + 1) = 0;
      *((_QWORD *)v15 + 2) = 0;
      *(_QWORD *)v15 = &off_1E2DBBEF0;
      v16 = (int)a4 + (((int)a4 / 0x7FFFFFFFu) | (((int)a4 / 0x7FFFFFFFu) << 31));
      if (v16 <= 1)
        v16 = 1;
      *((_DWORD *)v15 + 6) = v16;
      v17 = (unsigned int *)(v15 + 24);
      v73 = (std::__shared_weak_count *)v15;
      lpsrc = v11;
      v72 = v12;
      if (v12)
      {
        v18 = (unint64_t *)&v12->__shared_owners_;
        do
          v19 = __ldxr(v18);
        while (__stxr(v19 + 1, v18));
      }
      (*(void (**)(uint64_t *__return_ptr, void *, uint64_t))(*(_QWORD *)v11 + 320))(&v80, v11, 1);
      (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v80 + 56))(&v78);
      if (v20)
      {
        v21 = v20;
        v76 = (uint64_t)v20;
        v77 = v12;
        if (v12)
        {
          v22 = (unint64_t *)&v12->__shared_owners_;
          do
            v23 = __ldxr(v22);
          while (__stxr(v23 + 1, v22));
        }
        v24 = *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v20 + 384))(v20) + 48);
        v25 = *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v21 + 384))(v21) + 52);
        v26 = v25 * v24 * *(_DWORD *)((*(uint64_t (**)(void *))(*(_QWORD *)v21 + 384))(v21) + 44);
        if (v12)
        {
          v27 = (unint64_t *)&v12->__shared_owners_;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
        v29 = (float)v26;
        v11 = lpsrc;
      }
      else
      {
        v29 = 1.0;
      }
      if (v30)
      {
        v76 = (uint64_t)v30;
        v77 = v12;
        if (v12)
        {
          v31 = (unint64_t *)&v12->__shared_owners_;
          do
            v32 = __ldxr(v31);
          while (__stxr(v32 + 1, v31));
        }
        v29 = (float)*(unsigned int *)((*(uint64_t (**)(void *))(*(_QWORD *)v30 + 384))(v30) + 4);
        if (v12)
        {
          v33 = (unint64_t *)&v12->__shared_owners_;
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
      }
      printf("[xavier] fan_in=%f %f %f\n", v29, 1.0, 0.0);
      v35 = 0;
      v36 = v78;
      v37 = sqrtf(3.0 / v29);
      while (1)
      {
        v38 = *(int *)(v36 + 8);
        for (i = 12; i != 24; i += 4)
          v38 *= *(int *)(v36 + i);
        if (v38 <= v35)
          break;
        v40 = 48271 * (*v17 % 0xADC8);
        v41 = 3399 * (*v17 / 0xADC8);
        v42 = v40 >= v41;
        v43 = v40 - v41;
        if (v42)
          v44 = 0;
        else
          v44 = 0x7FFFFFFF;
        v45 = v44 + v43;
        *v17 = v45;
        v46 = ((float)((float)((float)(v45 - 1) * 4.6566e-10) + 0.0) + -0.5) * v37;
        *(float *)&v46 = v46 + v46 + 0.0;
        *(_DWORD *)(*(_QWORD *)(v36 + 24) + 4 * v35++) = LODWORD(v46);
      }
      v47 = v80;
      v48 = v81;
      v76 = v80;
      v77 = v81;
      if (v81)
      {
        v49 = (unint64_t *)&v81->__shared_owners_;
        do
          v50 = __ldxr(v49);
        while (__stxr(v50 + 1, v49));
      }
      v51 = (std::__shared_weak_count *)v79;
      v75[0] = v36;
      v75[1] = v79;
      if (v79)
      {
        v52 = (unint64_t *)(v79 + 8);
        do
          v53 = __ldxr(v52);
        while (__stxr(v53 + 1, v52));
      }
      Espresso::sync_copy_from_host(v47, v48, v75);
      if (v51)
      {
        v54 = (unint64_t *)&v51->__shared_owners_;
        do
          v55 = __ldaxr(v54);
        while (__stlxr(v55 - 1, v54));
        if (!v55)
        {
          ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
          std::__shared_weak_count::__release_weak(v51);
        }
      }
      v56 = v77;
      if (v77)
      {
        v57 = (unint64_t *)&v77->__shared_owners_;
        do
          v58 = __ldaxr(v57);
        while (__stlxr(v58 - 1, v57));
        if (!v58)
        {
          ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
          std::__shared_weak_count::__release_weak(v56);
        }
      }
      v59 = (std::__shared_weak_count *)v79;
      if (v79)
      {
        v60 = (unint64_t *)(v79 + 8);
        do
          v61 = __ldaxr(v60);
        while (__stlxr(v61 - 1, v60));
        if (!v61)
        {
          ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
          std::__shared_weak_count::__release_weak(v59);
        }
      }
      v62 = v81;
      if (v81)
      {
        v63 = (unint64_t *)&v81->__shared_owners_;
        do
          v64 = __ldaxr(v63);
        while (__stlxr(v64 - 1, v63));
        if (!v64)
        {
          ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
          std::__shared_weak_count::__release_weak(v62);
        }
      }
      if (v72)
      {
        v65 = (unint64_t *)&v72->__shared_owners_;
        do
          v66 = __ldaxr(v65);
        while (__stlxr(v66 - 1, v65));
        if (!v66)
        {
          ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
          std::__shared_weak_count::__release_weak(v72);
        }
      }
      if (v73)
      {
        v67 = (unint64_t *)&v73->__shared_owners_;
        do
          v68 = __ldaxr(v67);
        while (__stlxr(v68 - 1, v67));
        if (!v68)
        {
          ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
          std::__shared_weak_count::__release_weak(v73);
        }
      }
      if (v74)
      {
        v69 = (unint64_t *)&v74->__shared_owners_;
        do
          v70 = __ldaxr(v69);
        while (__stlxr(v70 - 1, v69));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
          std::__shared_weak_count::__release_weak(v74);
        }
      }
    }
  }

}

- (id)variableNameForLayer:(id)a3 kind:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[ETModelDef variableForLayer:kind:](self, "variableForLayer:kind:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)configureLayersToTrain:(id)a3 reinitializeVariables:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ETModelDef variables](self, "variables", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    if (v4)
      v10 = 1;
    else
      v10 = 2;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "layerName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if (v14)
          objc_msgSend(v12, "setInitializationMode:", v10);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return 0;
}

- (id)variables
{
  return self->_all_variables;
}

- (id)variableForLayer:(id)a3 kind:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ETModelDef all_variables](self, "all_variables", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "layerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v6))
        {
          v13 = objc_msgSend(v11, "kind") == a4;

          if (v13)
          {
            v14 = v11;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)layerNames
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  v3 = (void *)objc_opt_new();
  v4 = *((_QWORD *)self->_network.__ptr_ + 4);
  if (*((_QWORD *)self->_network.__ptr_ + 5) != v4)
  {
    v5 = 0;
    do
    {
      v6 = *(_OWORD *)(v4 + 16 * v5);
      v7 = *(std::__shared_weak_count **)(v4 + 16 * v5 + 8);
      if (*((_QWORD *)&v6 + 1))
      {
        v8 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      v10 = (_QWORD *)(v6 + 16);
      if (*(char *)(v6 + 39) < 0)
        v10 = (_QWORD *)*v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      ++v5;
      v4 = *((_QWORD *)self->_network.__ptr_ + 4);
    }
    while (v5 < (*((_QWORD *)self->_network.__ptr_ + 5) - v4) >> 4);
  }
  return v3;
}

- (shared_ptr<Espresso::net>)network
{
  void *v2;
  net *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::net> result;

  objc_copyCppObjectAtomic(v2, &self->_network, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__8466);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setNetwork:(shared_ptr<Espresso::net>)a3
{
  objc_copyCppObjectAtomic(&self->_network, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__8465);
}

- (NSMutableArray)all_variables
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAll_variables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (shared_ptr<Espresso::gradient_builder>)gb
{
  void *v2;
  gradient_builder *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::gradient_builder> result;

  objc_copyCppObjectAtomic(v2, &self->_gb, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__80);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setGb:(shared_ptr<Espresso::gradient_builder>)a3
{
  objc_copyCppObjectAtomic(&self->_gb, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__81);
}

- (void).cxx_destruct
{
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_gb);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_network);
  objc_storeStrong((id *)&self->_all_variables, 0);
  std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&self->layer_variable_names, (char *)self->layer_variable_names.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

@end
