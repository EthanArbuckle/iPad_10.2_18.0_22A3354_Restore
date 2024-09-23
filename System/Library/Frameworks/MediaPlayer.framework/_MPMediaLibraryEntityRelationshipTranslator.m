@implementation _MPMediaLibraryEntityRelationshipTranslator

- (MPMediaLibraryEntityTranslator)entityTranslator
{
  return (MPMediaLibraryEntityTranslator *)+[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", -[_MPMediaLibraryEntityRelationshipTranslator relationshipModelClass](self, "relationshipModelClass"));
}

- (Class)relationshipModelClass
{
  return self->_relationshipModelClass;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (BOOL)transient
{
  return self->_transient;
}

- (shared_ptr<std::unordered_map<std::string,)relationshipValidationProperties
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::unordered_map<std::string, mlcore::ModelPropertyBase *>> result;

  cntrl = self->_relationshipValidationProperties.__cntrl_;
  *v2 = self->_relationshipValidationProperties.__ptr_;
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

- (void)foreignPropertyBase
{
  return self->_foreignPropertyBase;
}

- (id)validRelationshipHandler
{
  return self->_validRelationshipHandler;
}

- (void)setValidRelationshipHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void)setRelationshipValidationProperties:()shared_ptr<std:(mlcore::ModelPropertyBase *>>)a3 :unordered_map<std::string
{
  std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&self->_relationshipValidationProperties.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void)setRelationshipModelClass:(Class)a3
{
  self->_relationshipModelClass = a3;
}

- (void)setForeignPropertyBase:(void *)a3
{
  self->_foreignPropertyBase = a3;
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_relationshipValidationProperties);
  objc_storeStrong(&self->_validRelationshipHandler, 0);
}

@end
