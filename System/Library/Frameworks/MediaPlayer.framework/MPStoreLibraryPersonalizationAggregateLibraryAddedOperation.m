@implementation MPStoreLibraryPersonalizationAggregateLibraryAddedOperation

void __71___MPStoreLibraryPersonalizationAggregateLibraryAddedOperation_execute__block_invoke(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  id v13;

  v13 = a3;
  v5 = *a2;
  if (*a2)
  {
    v6 = (std::__shared_weak_count *)a2[1];
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v5 = mlcore::AggregateFunctionQueryResult::value((mlcore::AggregateFunctionQueryResult *)v5);
  }
  else
  {
    v6 = 0;
  }
  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[35];
  if (v10)
  {
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v5 == (uint64_t)(v9[37] - v9[36]) >> 3);
    v9 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v9, "finish");
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

@end
