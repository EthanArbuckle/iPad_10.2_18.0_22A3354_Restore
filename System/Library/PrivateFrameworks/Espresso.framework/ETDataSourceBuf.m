@implementation ETDataSourceBuf

- (int)numberOfDataPoints
{
  return self->number_of_data_points;
}

- (id)dataPointAtIndex:(int)a3
{
  void *v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *p_pair1;
  int *left;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  std::string *v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *v25;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *v26;
  BOOL v27;
  int *v29;
  std::__shared_weak_count *v30;
  std::string v31;
  int *v32;
  std::__shared_weak_count *v33;

  v5 = (void *)objc_opt_new();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)self->blobs.__tree_.__begin_node_;
  p_pair1 = &self->blobs.__tree_.__pair1_;
  if (begin_node != &self->blobs.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        std::string::__init_copy_ctor_external(&v31, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
      else
        v31 = *(std::string *)&begin_node[4].__value_.__left_;
      left = (int *)begin_node[7].__value_.__left_;
      v9 = (std::__shared_weak_count *)begin_node[8].__value_.__left_;
      v32 = left;
      v33 = v9;
      if (v9)
      {
        p_shared_owners = (unint64_t *)&v9->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
        left = v32;
        v12 = v33;
        v29 = v32;
        v30 = v33;
        if (v33)
        {
          v13 = (unint64_t *)&v33->__shared_owners_;
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 + 1, v13));
          v15 = 0;
          goto LABEL_14;
        }
      }
      else
      {
        v12 = 0;
        v29 = left;
        v30 = 0;
      }
      v15 = 1;
LABEL_14:
      v16 = left[3];
      if (left[2] == 1)
        a3 = 0;
      v17 = *((_QWORD *)left + 2);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = &v31;
      else
        v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18, v29, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setData:size:forKey:freeWhenDone:", v17 + 4 * a3 * (int)v16, v16, v19, 0);

      if ((v15 & 1) == 0)
      {
        v20 = (unint64_t *)&v12->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      v22 = v33;
      if (v33)
      {
        v23 = (unint64_t *)&v33->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v31.__r_.__value_.__l.__data_);
      v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)v25->__value_.__left_;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 2>>>, void *>>> *)begin_node[2].__value_.__left_;
          v27 = v26->__value_.__left_ == begin_node;
          begin_node = v26;
        }
        while (!v27);
      }
      begin_node = v26;
    }
    while (v26 != p_pair1);
  }
  return v5;
}

- (void)setBlobs:(const void *)a3 numberOfDataPoints:(int)a4 nonBatches:(const void *)a5
{
  char *v5;
  char *v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t **v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  int v18;
  int number_of_data_points;
  Espresso *v20;
  void *v21;
  uint64_t **v22;
  unint64_t *v23;
  char *v24;
  char *v25;
  BOOL v26;
  uint64_t **p_blobs;
  __int128 v29;

  self->number_of_data_points = a4;
  v5 = (char *)a3 + 8;
  v6 = *(char **)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_blobs = (uint64_t **)&self->blobs;
    do
    {
      v8 = *((_QWORD *)a5 + 1);
      if (std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(*(_QWORD *)a5, v8, (unsigned __int8 **)v6 + 4) == v8)
      {
        v17 = (char *)operator new(0x58uLL);
        *((_QWORD *)v17 + 1) = 0;
        *((_QWORD *)v17 + 2) = 0;
        *(_QWORD *)v17 = &off_1E2DBEC38;
        *((_QWORD *)v17 + 3) = &off_1E2DA11B0;
        v18 = *((_DWORD *)v6 + 14);
        *(_OWORD *)(v17 + 56) = 0u;
        number_of_data_points = self->number_of_data_points;
        *(_OWORD *)(v17 + 72) = 0u;
        *((_DWORD *)v17 + 8) = number_of_data_points;
        *((_DWORD *)v17 + 9) = v18;
        v20 = (Espresso *)(4 * number_of_data_points * (uint64_t)v18);
        v21 = Espresso::kern_alloc_uninitialized(v20);
        bzero(v21, (size_t)v20);
        *((_QWORD *)v17 + 5) = v21;
        v17[48] = 1;
        *(_QWORD *)&v29 = v17 + 24;
        *((_QWORD *)&v29 + 1) = v17;
        v22 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_blobs, (_QWORD *)v6 + 4, (uint64_t)(v6 + 32));
        std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v22 + 7), &v29);
        v14 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
        if (*((_QWORD *)&v29 + 1))
        {
          v23 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
          do
            v16 = __ldaxr(v23);
          while (__stlxr(v16 - 1, v23));
LABEL_11:
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
      }
      else
      {
        v9 = (char *)operator new(0x58uLL);
        *((_QWORD *)v9 + 1) = 0;
        *((_QWORD *)v9 + 2) = 0;
        *(_QWORD *)v9 = &off_1E2DBEC38;
        *((_QWORD *)v9 + 3) = &off_1E2DA11B0;
        v10 = *((int *)v6 + 14);
        *(_OWORD *)(v9 + 56) = 0u;
        *(_OWORD *)(v9 + 72) = 0u;
        *((_DWORD *)v9 + 8) = 1;
        *((_DWORD *)v9 + 9) = v10;
        v11 = 4 * v10;
        v12 = Espresso::kern_alloc_uninitialized((Espresso *)(4 * v10));
        bzero(v12, v11);
        *((_QWORD *)v9 + 5) = v12;
        v9[48] = 1;
        *(_QWORD *)&v29 = v9 + 24;
        *((_QWORD *)&v29 + 1) = v9;
        v13 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_blobs, (_QWORD *)v6 + 4, (uint64_t)(v6 + 32));
        std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)(v13 + 7), &v29);
        v14 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
        if (*((_QWORD *)&v29 + 1))
        {
          v15 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          goto LABEL_11;
        }
      }
      v24 = (char *)*((_QWORD *)v6 + 1);
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = *(char **)v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (char *)*((_QWORD *)v6 + 2);
          v26 = *(_QWORD *)v25 == (_QWORD)v6;
          v6 = v25;
        }
        while (!v26);
      }
      v6 = v25;
    }
    while (v25 != v5);
  }
}

- (float)dataAtIndex:(unint64_t)a3 key:(const void *)a4
{
  uint64_t **v6;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  float *v12;
  unint64_t *v13;
  unint64_t v14;
  const char *v16;
  const char *v17;

  v6 = std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->blobs, a4, (uint64_t)a4);
  v7 = v6[7];
  v8 = (std::__shared_weak_count *)v6[8];
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = *((int *)v7 + 2);
  if ((_DWORD)v11 == 1)
  {
    if (a3)
    {
      if (*((char *)a4 + 23) >= 0)
        v16 = (const char *)a4;
      else
        v16 = *(const char **)a4;
      Espresso::throw_exception_selector<Espresso::generic_error,char const*,unsigned long &>(v16, a3);
    }
    v12 = (float *)v7[2];
    if (!v8)
      return v12;
LABEL_10:
    v13 = (unint64_t *)&v8->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    return v12;
  }
  if (v11 <= a3)
  {
    if (*((char *)a4 + 23) >= 0)
      v17 = (const char *)a4;
    else
      v17 = *(const char **)a4;
    Espresso::throw_exception_selector<Espresso::generic_error,char const*,unsigned long &>(v17, a3);
  }
  v12 = (float *)(v7[2] + 4 * *((int *)v7 + 3) * a3);
  if (v8)
    goto LABEL_10;
  return v12;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::quantized_weights_helper>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::quantized_weights_helper>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::quantized_weights_helper>>>>::destroy((_QWORD *)self->blobs.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end
