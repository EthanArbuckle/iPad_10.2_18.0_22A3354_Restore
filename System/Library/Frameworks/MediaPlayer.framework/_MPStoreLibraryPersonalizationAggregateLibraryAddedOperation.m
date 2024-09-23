@implementation _MPStoreLibraryPersonalizationAggregateLibraryAddedOperation

- (void)execute
{
  mlcore *v3;
  _OWORD *v4;
  char v5;
  uint64_t v6;
  char v7;
  __int128 v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t i;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  MPMediaLibraryView *libraryView;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t *p_shared_owners;
  unint64_t v31;
  void **v32;
  char v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  uint64_t v37[3];
  _OWORD *v38;
  _OWORD *v39;
  _OWORD *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  _OWORD v43[3];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  mlcore::ItemPropertyPersistentID((mlcore *)self);
  v3 = (mlcore *)std::allocate_shared[abi:ne180100]<mlcore::InPredicate<long long>,std::allocator<mlcore::InPredicate<long long>>,mlcore::ModelProperty<long long> *&,std::vector<long long> const&,void>(v37);
  v43[0] = *(_OWORD *)v37;
  *(_OWORD *)v37 = 0uLL;
  mlcore::ItemPropertyInMyLibrary(v3);
  std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<int>,std::allocator<mlcore::UnaryPredicate<int>>,mlcore::ModelProperty<int> *&,mlcore::UnaryOperator,void>((uint64_t *)&v36);
  v43[1] = v36;
  v36 = 0uLL;
  v39 = 0;
  v40 = 0;
  v38 = 0;
  v32 = (void **)&v38;
  v33 = 0;
  v4 = operator new(0x20uLL);
  v5 = 0;
  v6 = 0;
  v38 = v4;
  v39 = v4;
  v40 = v4 + 2;
  do
  {
    v7 = v5;
    v8 = v43[v6];
    *v4 = v8;
    if (*((_QWORD *)&v8 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    ++v4;
    v5 = 1;
    v6 = 1;
  }
  while ((v7 & 1) == 0);
  v39 = v4;
  mlcore::CreateAndPredicate();
  v32 = (void **)&v38;
  std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v32);
  for (i = 1; i != -1; --i)
    v12 = std::shared_ptr<mlcore::DeviceLibraryView>::~shared_ptr[abi:ne180100]((uint64_t)&v43[i]);
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
  if (*((_QWORD *)&v36 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = (std::__shared_weak_count *)v37[1];
  if (v37[1])
  {
    v17 = (unint64_t *)(v37[1] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = MEMORY[0x194039EC8](v12);
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate> &,void>(v43, v19, 0, v41, v42);
  libraryView = self->_libraryView;
  v35 = v43[0];
  if (*((_QWORD *)&v43[0] + 1))
  {
    v21 = (unint64_t *)(*((_QWORD *)&v43[0] + 1) + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __71___MPStoreLibraryPersonalizationAggregateLibraryAddedOperation_execute__block_invoke;
  v34[3] = &unk_1E315CB10;
  v34[4] = self;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](libraryView, "performCoreQuery:withCompletion:", &v35, v34);
  v23 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
  if (*((_QWORD *)&v35 + 1))
  {
    v24 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = (std::__shared_weak_count *)*((_QWORD *)&v43[0] + 1);
  if (*((_QWORD *)&v43[0] + 1))
  {
    v27 = (unint64_t *)(*((_QWORD *)&v43[0] + 1) + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v42;
  if (v42)
  {
    p_shared_owners = &v42->__shared_owners_;
    do
      v31 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v31 - 1, (unint64_t *)p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
}

- (MPMediaLibraryView)libraryView
{
  return self->_libraryView;
}

- (void)setLibraryView:(id)a3
{
  self->_libraryView = (MPMediaLibraryView *)a3;
}

- (vector<long)persistentIDs
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<long long, std::allocator<long long>> *)std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(retstr, self->_persistentIDs.__begin_, (uint64_t)self->_persistentIDs.__end_, self->_persistentIDs.__end_ - self->_persistentIDs.__begin_);
}

- (void)setPersistentIDs:(vector<long)long
{
  vector<long long, std::allocator<long long>> *p_persistentIDs;
  int64_t *begin;
  int64_t *end;
  int64_t v6;
  unint64_t v7;
  uint64_t value;
  int64_t *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t **p_end;
  int64_t *v13;
  int64_t *v14;
  unint64_t v15;
  int64_t *v16;
  int64_t *v17;
  int64_t *v18;

  p_persistentIDs = &self->_persistentIDs;
  if (&self->_persistentIDs != a3)
  {
    begin = a3->__begin_;
    end = a3->__end_;
    v6 = (char *)end - (char *)a3->__begin_;
    v7 = v6 >> 3;
    value = (uint64_t)self->_persistentIDs.__end_cap_.__value_;
    v9 = p_persistentIDs->__begin_;
    if (v6 >> 3 <= (unint64_t)((int64_t)(value - (unint64_t)p_persistentIDs->__begin_) >> 3))
    {
      p_end = &self->_persistentIDs.__end_;
      v14 = self->_persistentIDs.__end_;
      v15 = v14 - v9;
      if (v15 < v7)
      {
        v16 = &begin[v15];
        if (v14 != v9)
        {
          memmove(v9, begin, (char *)v14 - (char *)v9);
          v9 = *p_end;
        }
        v6 = (char *)end - (char *)v16;
        if (end == v16)
          goto LABEL_20;
        v17 = v9;
        v18 = v16;
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        self->_persistentIDs.__end_ = v9;
        operator delete(v9);
        value = 0;
        p_persistentIDs->__begin_ = 0;
        p_persistentIDs->__end_ = 0;
        p_persistentIDs->__end_cap_.__value_ = 0;
      }
      if (v6 < 0)
        std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
      v10 = value >> 2;
      if (value >> 2 <= v7)
        v10 = v6 >> 3;
      if ((unint64_t)value >= 0x7FFFFFFFFFFFFFF8)
        v11 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v11 = v10;
      std::vector<mlcore::ModelPropertyBase *>::__vallocate[abi:ne180100](p_persistentIDs, v11);
      v13 = p_persistentIDs->__end_;
      p_end = &p_persistentIDs->__end_;
      v9 = v13;
    }
    if (end == begin)
    {
LABEL_20:
      *p_end = (int64_t *)((char *)v9 + v6);
      return;
    }
    v17 = v9;
    v18 = begin;
LABEL_19:
    memmove(v17, v18, v6);
    goto LABEL_20;
  }
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  vector<long long, std::allocator<long long>> *p_persistentIDs;
  int64_t *begin;

  p_persistentIDs = &self->_persistentIDs;
  begin = self->_persistentIDs.__begin_;
  if (begin)
  {
    p_persistentIDs->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong(&self->_responseHandler, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 37) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 36) = 0;
  return self;
}

@end
