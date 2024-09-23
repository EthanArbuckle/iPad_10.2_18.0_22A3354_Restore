@implementation MPModelPlaylistEntriesShareEligibilityRequestOperation

- (void)execute
{
  MPModelLibraryRequest *v3;
  void *v4;
  void *v5;
  MPMediaLibraryView *v6;
  void *v7;
  MPMediaLibraryView *v8;
  mlcore *v9;
  mlcore *v10;
  ModelPropertyBase *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  __int128 v24;
  std::__shared_weak_count *v25;
  uint64_t v26[3];
  _QWORD v27[5];
  __int128 v28;

  v3 = objc_alloc_init(MPModelLibraryRequest);
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:](MPMediaLibrary, "deviceMediaLibraryWithUserIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPModelLibraryRequest setMediaLibrary:](v3, "setMediaLibrary:", v5);

  v6 = [MPMediaLibraryView alloc];
  -[MPModelLibraryRequest mediaLibrary](v3, "mediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPMediaLibraryView initWithLibrary:filteringOptions:](v6, "initWithLibrary:filteringOptions:", v7, -[MPModelLibraryRequest filteringOptions](v3, "filteringOptions"));

  v10 = (mlcore *)mlcore::PlaylistItemPropertyItemPersistentID(v9);
  v11 = (ModelPropertyBase *)mlcore::ItemPropertySubscriptionStoreItemID(v10);
  MPMediaLibraryGetProperty((ModelPropertyBase *)v10, v11);
  v12 = std::allocate_shared[abi:ne180100]<mlcore::UnaryPredicate<long long>,std::allocator<mlcore::UnaryPredicate<long long>>,mlcore::ModelProperty<long long> *&,mlcore::UnaryOperator,void>(v26);
  v24 = *(_OWORD *)v26;
  v25 = (std::__shared_weak_count *)v26[1];
  v13 = MEMORY[0x194038ED8](v12);
  std::allocate_shared[abi:ne180100]<mlcore::AggregateFunctionQuery,std::allocator<mlcore::AggregateFunctionQuery>,mlcore::EntityClass *,mlcore::AggregateFunctionQuery::AggregateFunction,decltype(nullptr),std::shared_ptr<mlcore::Predicate> &,void>(v26, v13, 0, v24, *((std::__shared_weak_count **)&v24 + 1));
  v28 = *(_OWORD *)v26;
  if (v26[1])
  {
    v14 = (unint64_t *)(v26[1] + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__MPModelPlaylistEntriesShareEligibilityRequestOperation_execute__block_invoke;
  v27[3] = &unk_1E315CB10;
  v27[4] = self;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](v8, "performCoreQuery:withCompletion:", &v28, v27);
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
  if (*((_QWORD *)&v28 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = (std::__shared_weak_count *)v26[1];
  if (v26[1])
  {
    v20 = (unint64_t *)(v26[1] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

}

- (MPModelPlaylistEntriesShareEligibilityRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
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
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __65__MPModelPlaylistEntriesShareEligibilityRequestOperation_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  mlcore::AggregateFunctionQueryResult *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  id v14;

  v14 = a3;
  if (v14 || (v8 = *(mlcore::AggregateFunctionQueryResult **)a2) == 0)
  {
    v5 = 0;
  }
  else
  {
    v9 = *(std::__shared_weak_count **)(a2 + 8);
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    v5 = mlcore::AggregateFunctionQueryResult::value(v8) != 0;
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
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
  v7 = v14;
  if (v6)
  {
    (*(void (**)(uint64_t, _BOOL8, id))(v6 + 16))(v6, v5, v14);
    v7 = v14;
  }

}

@end
