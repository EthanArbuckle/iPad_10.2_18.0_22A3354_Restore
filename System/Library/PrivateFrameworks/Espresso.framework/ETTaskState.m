@implementation ETTaskState

- (ETTaskState)initWithBlobMap:(void *)a3
{
  ETTaskState *v4;
  unordered_map<std::string, std::shared_ptr<Espresso::blob<float, 4>>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::shared_ptr<Espresso::blob<float, 4>>>>> *p_blobs;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETTaskState;
  v4 = -[ETTaskState init](&v8, sel_init);
  p_blobs = &v4->_blobs;
  if (v4)
    v6 = p_blobs == a3;
  else
    v6 = 1;
  if (!v6)
  {
    v4->_blobs.__table_.__p3_.__value_ = *((float *)a3 + 8);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<Espresso::blob<float,4>>>,void *> *>>(p_blobs, *((uint64_t **)a3 + 2));
  }
  return v4;
}

- (ETTaskState)initWithNetwork:(shared_ptr<Espresso::net>)a3
{
  net *ptr;
  ETTaskState *v4;
  ETTaskState *v5;
  objc_super v7;

  ptr = a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)ETTaskState;
  v4 = -[ETTaskState init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v4->_networkPointer.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
  return v5;
}

- (unordered_map<std::string,)blobs
{
  unordered_map<std::string, std::shared_ptr<Espresso::blob<float, 4>>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::shared_ptr<Espresso::blob<float, 4>>>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_blobs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3498);
  return result;
}

- (void)setBlobs:()unordered_map<std:()std:()4>> :()std:()std:(std:()std:(4>>>>> *)a3 :shared_ptr<Espresso::blob<float :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> shared_ptr<Espresso::blob<float :string
{
  objc_copyCppObjectAtomic(&self->_blobs, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__3497);
}

- (shared_ptr<Espresso::net>)networkPointer
{
  void *v2;
  net *v3;
  __shared_weak_count *v4;
  shared_ptr<Espresso::net> result;

  objc_copyCppObjectAtomic(v2, &self->_networkPointer, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__1);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setNetworkPointer:(shared_ptr<Espresso::net>)a3
{
  objc_copyCppObjectAtomic(&self->_networkPointer, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__2);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::~__hash_table((uint64_t)&self->_blobs);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_networkPointer);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  return self;
}

@end
