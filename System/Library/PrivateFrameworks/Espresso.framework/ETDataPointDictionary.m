@implementation ETDataPointDictionary

- (BOOL)setImage:(vImage_Buffer *)a3 forKey:(id)a4
{
  id v6;
  _OWORD *v7;
  __int128 v8;
  void *__p[2];
  char v11;
  void **v12;

  v6 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v12 = __p;
  v7 = std::__tree<std::__value_type<std::string,vImage_Buffer>,std::__map_value_compare<std::string,std::__value_type<std::string,vImage_Buffer>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,vImage_Buffer>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->_image_buffers, __p, (_OWORD **)&v12);
  v8 = *(_OWORD *)&a3->data;
  *(_OWORD *)((char *)v7 + 72) = *(_OWORD *)&a3->width;
  *(_OWORD *)((char *)v7 + 56) = v8;
  if (v11 < 0)
    operator delete(__p[0]);

  return 1;
}

- (BOOL)setData:(float *)a3 size:(unint64_t)a4 forKey:(id)a5 freeWhenDone:(BOOL)a6
{
  id v10;
  uint64_t **p_float_buffers;
  void **v12;
  _OWORD *v13;
  uint64_t **v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[2];
  uint64_t v19;
  uint64_t v20;

  v10 = objc_retainAutorelease(a5);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  p_float_buffers = (uint64_t **)&self->_float_buffers;
  v12 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>((uint64_t)p_float_buffers, &v20, __p);
  v13 = *v12;
  if (!*v12)
  {
    v14 = (uint64_t **)v12;
    v13 = operator new(0x50uLL);
    v13[2] = *(_OWORD *)__p;
    v16 = v19;
    v15 = v20;
    __p[1] = 0;
    v19 = 0;
    __p[0] = 0;
    *((_QWORD *)v13 + 6) = v16;
    *((_QWORD *)v13 + 7) = 0;
    *((_QWORD *)v13 + 8) = 0;
    *((_QWORD *)v13 + 9) = 0;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at(p_float_buffers, v15, v14, (uint64_t *)v13);
  }
  *((_QWORD *)v13 + 7) = a3;
  *((_QWORD *)v13 + 8) = a4;
  *((_BYTE *)v13 + 72) = a6;
  if (SHIBYTE(v19) < 0)
    operator delete(__p[0]);

  return 1;
}

- (float)dataForKey:(id)a3 error:(id *)a4
{
  id v5;
  ETDataPointDictionary *v6;
  float *isa;
  void *__p[2];
  char v10;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = (ETDataPointDictionary *)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&self->_float_buffers, __p);
  if (v10 < 0)
    operator delete(__p[0]);
  if (&self->_float_buffers.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float_buffer_t>, void *>>> *)v6)
    isa = 0;
  else
    isa = (float *)v6[1].super.isa;

  return isa;
}

- (id)dataArrayForKey:(id)a3 error:(id *)a4
{
  id v5;
  ETDataPointDictionary *v6;
  void *v7;
  double v8;
  char *v9;
  void *v10;
  void *__p[2];
  char v13;

  v5 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = (ETDataPointDictionary *)std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::find<std::string>((uint64_t)&self->_float_buffers, __p);
  if (v13 < 0)
    operator delete(__p[0]);
  if (&self->_float_buffers.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float_buffer_t>, void *>>> *)v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6[1]._image_buffers.__tree_.__begin_node_);
    if (v6[1]._image_buffers.__tree_.__begin_node_)
    {
      v9 = 0;
      do
      {
        LODWORD(v8) = *((_DWORD *)v6[1].super.isa + (_QWORD)v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v10, v9);

        ++v9;
      }
      while (v6[1]._image_buffers.__tree_.__begin_node_ > v9);
    }
  }

  return v7;
}

- (map<std::string,)image_buffers
{
  map<std::string, vImage_Buffer, std::less<std::string>, std::allocator<std::pair<const std::string, vImage_Buffer>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_image_buffers, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__15424);
  return result;
}

- (void)setImage_buffers:()map<std:()vImage_Buffer :()std:(std:(vImage_Buffer>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string
{
  objc_copyCppObjectAtomic(&self->_image_buffers, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__15423);
}

- (map<std::string,)float_buffers
{
  map<std::string, float_buffer_t, std::less<std::string>, std::allocator<std::pair<const std::string, float_buffer_t>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_float_buffers, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__2);
  return result;
}

- (void)setFloat_buffers:()map<std:()float_buffer_t :()std:(std:(float_buffer_t>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> string
{
  objc_copyCppObjectAtomic(&self->_float_buffers, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__3);
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->_float_buffers.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->_image_buffers.__tree_.__pair1_.__value_.__left_);
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
