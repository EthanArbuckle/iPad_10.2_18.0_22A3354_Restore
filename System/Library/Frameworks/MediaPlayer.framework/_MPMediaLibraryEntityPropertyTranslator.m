@implementation _MPMediaLibraryEntityPropertyTranslator

- (id)valueTransformer
{
  return self->_valueTransformer;
}

- (shared_ptr<std::unordered_map<std::string,)propertiesToFetchMap
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::unordered_map<std::string, mlcore::ModelPropertyBase *>> result;

  cntrl = self->_propertiesToFetchMap.__cntrl_;
  *v2 = self->_propertiesToFetchMap.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (shared_ptr<std::unordered_map<std::string,)propertiesToSortMap
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::unordered_map<std::string, mlcore::ModelPropertyBase *>> result;

  cntrl = self->_propertiesToSortMap.__cntrl_;
  *v2 = self->_propertiesToSortMap.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

- (void)setValueTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSortTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setPropertiesToSortMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&self->_propertiesToSortMap.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void)setPropertiesToFetchMap:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&self->_propertiesToFetchMap.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void)setFilterTransformer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)sortTransformer
{
  return self->_sortTransformer;
}

- (id)filterTransformer
{
  return self->_filterTransformer;
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_propertiesToSortMap);
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_propertiesToFetchMap);
  objc_storeStrong(&self->_valueTransformer, 0);
  objc_storeStrong(&self->_filterTransformer, 0);
  objc_storeStrong(&self->_sortTransformer, 0);
}

@end
