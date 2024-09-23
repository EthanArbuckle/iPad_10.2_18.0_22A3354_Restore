@implementation MPModelLibrarySearchEntityResultContainer

- (MPModelLibrarySearchEntityResultContainer)initWithEntityQueryResult:(shared_ptr<mlcore:(id)a4 :(id)a5 EntityQueryResult>)a3 forScope:entityTranslationContext:
{
  __shared_weak_count *cntrl;
  EntityQueryResult *ptr;
  __shared_weak_count *v9;
  id v10;
  MPModelLibrarySearchEntityResultContainer *v11;
  MPModelLibrarySearchEntityResultContainer *v12;
  objc_super v14;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v9 = a3.__cntrl_;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPModelLibrarySearchEntityResultContainer;
  v11 = -[MPModelLibrarySearchEntityResultContainer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    std::shared_ptr<mlcore::QueryResult>::operator=[abi:ne180100](&v11->_entityQueryResult.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    objc_storeStrong((id *)&v12->_scope, cntrl);
    objc_storeStrong((id *)&v12->_entityTranslationContext, a4);
  }

  return v12;
}

- (shared_ptr<mlcore::EntityQueryResult>)entityQueryResult
{
  EntityQueryResult **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<mlcore::EntityQueryResult> result;

  cntrl = self->_entityQueryResult.__cntrl_;
  *v2 = self->_entityQueryResult.__ptr_;
  v2[1] = (EntityQueryResult *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntityQueryResult *)self;
  return result;
}

- (MPModelLibrarySearchScope)scope
{
  return self->_scope;
}

- (MPMediaLibraryEntityTranslationContext)entityTranslationContext
{
  return self->_entityTranslationContext;
}

- (void).cxx_destruct
{
  std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&self->_entityQueryResult);
  objc_storeStrong((id *)&self->_entityTranslationContext, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
