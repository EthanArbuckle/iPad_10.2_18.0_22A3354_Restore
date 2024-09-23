@implementation ETDataSourceBlobF4

- (void)addBlob:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void **v9;
  FILE *v10;
  id v11;
  void **v12;
  _OWORD *v13;
  uint64_t **v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  uint64_t v20;
  void *v21[2];
  char v22;
  __int128 v23;
  _QWORD v24[2];
  char v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(v21, (char *)objc_msgSend(v8, "UTF8String"));
  if (v22 >= 0)
    v9 = v21;
  else
    v9 = (void **)v21[0];
  v10 = fopen((const char *)v9, "rb");
  Espresso::debug::read_blob_f4((Espresso::debug *)&v23, v10);
  fclose(v10);
  v11 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
  v12 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>((uint64_t)&self->blobs, &v26, __p);
  v13 = *v12;
  if (!*v12)
  {
    v14 = (uint64_t **)v12;
    v13 = operator new(0x48uLL);
    v24[1] = &self->blobs.__tree_.__pair1_;
    v13[2] = *(_OWORD *)__p;
    v15 = v20;
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
    *((_QWORD *)v13 + 7) = 0;
    *((_QWORD *)v13 + 8) = 0;
    *((_QWORD *)v13 + 6) = v15;
    v25 = 1;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at((uint64_t **)&self->blobs, v26, v14, (uint64_t *)v13);
    v24[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,void *>>>>::reset[abi:ne180100]((uint64_t)v24);
  }
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)v13 + 56, &v23);
  if (SHIBYTE(v20) < 0)
    operator delete(__p[0]);
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (v22 < 0)
    operator delete(v21[0]);

}

- (id)dataPointAtIndex:(int)a3
{
  void *v5;
  __int128 *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *p_pair1;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  std::string *p_p;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *v24;
  BOOL v25;
  std::string __p;
  uint64_t v28;
  std::__shared_weak_count *v29;

  v5 = (void *)objc_opt_new();
  begin_node = (__int128 *)self->blobs.__tree_.__begin_node_;
  p_pair1 = &self->blobs.__tree_.__pair1_;
  if (begin_node != (__int128 *)&self->blobs.__tree_.__pair1_)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<Espresso::blob<float,4>>>::pair[abi:ne180100](&__p, begin_node + 2);
      v8 = v28;
      v9 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v11 = __ldxr(p_shared_owners);
        while (__stxr(v11 + 1, p_shared_owners));
      }
      v13 = *(_DWORD *)(v8 + 8);
      v12 = *(_DWORD *)(v8 + 12);
      v14 = *(_DWORD *)(v8 + 16);
      v15 = *(_QWORD *)(v8 + 24);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setData:size:forKey:freeWhenDone:", v15 + 4 * v12 * v13 * v14 * a3);

      if (v9)
      {
        v18 = (unint64_t *)&v9->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
      }
      v20 = v29;
      if (v29)
      {
        v21 = (unint64_t *)&v29->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)*((_QWORD *)begin_node + 1);
      if (left)
      {
        do
        {
          v24 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::shared_ptr<Espresso::blob<float, 4>>>, void *>>> *)*((_QWORD *)begin_node + 2);
          v25 = v24->__value_.__left_ == begin_node;
          begin_node = (__int128 *)v24;
        }
        while (!v25);
      }
      begin_node = (__int128 *)v24;
    }
    while (v24 != p_pair1);
  }
  return v5;
}

- (int)numberOfDataPoints
{
  return *(_DWORD *)(*((_QWORD *)self->blobs.__tree_.__begin_node_ + 7) + 20);
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
