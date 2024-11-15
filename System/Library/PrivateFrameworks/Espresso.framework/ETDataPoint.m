@implementation ETDataPoint

- (void)iterateBuffersByKey:(id)a3
{
  void (**v4)(id, _OWORD *, void *);
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *left;
  __int128 v8;
  void *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;

  v4 = (void (**)(id, _OWORD *, void *))a3;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)self->image_buffers.__tree_.__begin_node_;
  p_pair1 = &self->image_buffers.__tree_.__pair1_;
  if (begin_node != &self->image_buffers.__tree_.__pair1_)
  {
    do
    {
      left = begin_node + 4;
      v8 = *(_OWORD *)&begin_node[9].__value_.__left_;
      v13 = *(_OWORD *)&begin_node[7].__value_.__left_;
      v14 = v8;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)left->__value_.__left_;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", left, v13, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, &v13, v9);

      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)begin_node[1].__value_.__left_;
      if (v10)
      {
        do
        {
          v11 = v10;
          v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)v10->__value_.__left_;
        }
        while (v10);
      }
      else
      {
        do
        {
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)begin_node[2].__value_.__left_;
          v12 = v11->__value_.__left_ == begin_node;
          begin_node = v11;
        }
        while (!v12);
      }
      begin_node = v11;
    }
    while (v11 != p_pair1);
  }

}

- (void)setImage:(vImage_Buffer *)a3 forKey:(id)a4
{
  id v6;
  _OWORD *v7;
  __int128 v8;
  void *__p[2];
  char v10;
  void **v11;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v11 = __p;
  v7 = std::__tree<std::__value_type<std::string,vImage_Buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,vImage_Buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,vImage_Buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->image_buffers, __p, (_OWORD **)&v11);
  v8 = *(_OWORD *)&a3->data;
  *(_OWORD *)((char *)v7 + 72) = *(_OWORD *)&a3->width;
  *(_OWORD *)((char *)v7 + 56) = v8;
  if (v10 < 0)
    operator delete(__p[0]);

}

- (void)setData:(float *)a3 size:(unint64_t)a4 forKey:(id)a5 freeWhenDone:(BOOL)a6
{
  id v10;
  uint64_t **v11;
  void *__p[2];
  char v13;

  v10 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = std::__tree<std::__value_type<std::string,ETDataPoint_buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,ETDataPoint_buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ETDataPoint_buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->buffers, __p, (uint64_t)__p);
  v11[7] = (uint64_t *)a3;
  v11[8] = (uint64_t *)a4;
  *((_BYTE *)v11 + 72) = a6;
  if (v13 < 0)
    operator delete(__p[0]);

}

- (vImage_Buffer)imageWithKey:(SEL)a3
{
  id v6;
  _OWORD *v7;
  __int128 v8;
  vImage_Buffer *result;
  void *__p[2];
  char v11;
  void **v12;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v12 = __p;
  v7 = std::__tree<std::__value_type<std::string,vImage_Buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,vImage_Buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,vImage_Buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->image_buffers, __p, (_OWORD **)&v12);
  v8 = *(_OWORD *)((char *)v7 + 72);
  *(_OWORD *)&retstr->data = *(_OWORD *)((char *)v7 + 56);
  *(_OWORD *)&retstr->width = v8;
  if (v11 < 0)
    operator delete(__p[0]);

  return result;
}

- (float)bufferWithKey:(id)a3
{
  id v4;
  float *v5;
  void *__p[2];
  char v8;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v5 = (float *)std::__tree<std::__value_type<std::string,ETDataPoint_buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,ETDataPoint_buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ETDataPoint_buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->buffers, __p, (uint64_t)__p)[7];
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *p_pair1;
  __int128 v5;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *v7;
  BOOL v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *v12;
  objc_super v13;
  std::string v14;
  __int128 v15;
  __int128 v16;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)self->image_buffers.__tree_.__begin_node_;
  p_pair1 = &self->image_buffers.__tree_.__pair1_;
  if (begin_node != &self->image_buffers.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)begin_node[4].__value_.__left_, (std::string::size_type)begin_node[5].__value_.__left_);
      else
        v14 = *(std::string *)&begin_node[4].__value_.__left_;
      v5 = *(_OWORD *)&begin_node[9].__value_.__left_;
      v15 = *(_OWORD *)&begin_node[7].__value_.__left_;
      v16 = v5;
      if ((_QWORD)v15)
        free((void *)v15);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v7 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, vImage_Buffer>, void *>>> *)begin_node[2].__value_.__left_;
          v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->image_buffers.__tree_.__pair1_.__value_.__left_);
  self->image_buffers.__tree_.__pair1_.__value_.__left_ = 0;
  self->image_buffers.__tree_.__pair3_.__value_ = 0;
  self->image_buffers.__tree_.__begin_node_ = p_pair1;
  v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *)self->buffers.__tree_.__begin_node_;
  v10 = &self->buffers.__tree_.__pair1_;
  if (v9 != &self->buffers.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(v9[6].__value_.__left_) < 0)
        std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)v9[4].__value_.__left_, (std::string::size_type)v9[5].__value_.__left_);
      else
        v14 = *(std::string *)&v9[4].__value_.__left_;
      *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *)&v16 = v9[9];
      v15 = *(_OWORD *)&v9[7].__value_.__left_;
      if ((_BYTE)v16)
        free((void *)v15);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *)v9[1].__value_.__left_;
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *)v11->__value_.__left_;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, ETDataPoint_buffer>, void *>>> *)v9[2].__value_.__left_;
          v8 = v12->__value_.__left_ == v9;
          v9 = v12;
        }
        while (!v8);
      }
      v9 = v12;
    }
    while (v12 != v10);
  }
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->buffers.__tree_.__pair1_.__value_.__left_);
  self->buffers.__tree_.__pair1_.__value_.__left_ = 0;
  self->buffers.__tree_.__pair3_.__value_ = 0;
  self->buffers.__tree_.__begin_node_ = v10;
  v13.receiver = self;
  v13.super_class = (Class)ETDataPoint;
  -[ETDataPoint dealloc](&v13, sel_dealloc);
}

- (unordered_map<std::string,)getSampleData
{
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->buffers.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->image_buffers.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

@end
