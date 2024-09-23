@implementation CNABPredicateObservable

id *__98___CNABPredicateObservable_observableWithPredicates_sortOrdering_options_addressBook_environment___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id *v5;

  v3 = *(objc_class **)(a1 + 40);
  v4 = a2;
  v5 = -[_CNABPredicateObservable initWithPredicate:sortOrdering:options:addressBook:environment:]((id *)[v3 alloc], v4, *(_DWORD *)(a1 + 64), *(void **)(a1 + 48), *(const void **)(a1 + 56), *(void **)(a1 + 32));

  return v5;
}

void __38___CNABPredicateObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v3 = objc_msgSend(v14, "isCanceled");
  v4 = v14;
  if ((v3 & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = v5 ? *(_QWORD *)(v5 + 32) : 0;
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(unsigned int *)(v7 + 24);
      v9 = *(_BYTE *)(v7 + 40) & 1;
      v10 = *(_QWORD *)(v7 + 16);
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "searchPeopleWithPredicate:sortOrder:ranked:inAddressBook:withDelegate:", v6, v8, v9, v10);
    v11 = objc_msgSend(v14, "isCanceled");
    v4 = v14;
    if ((v11 & 1) == 0)
    {
      v12 = *(_QWORD **)(a1 + 40);
      if (v12)
        v13 = v12[4];
      else
        v13 = 0;
      objc_msgSend(v12, "predicateShouldContinue:afterFindingRecord:moreComing:", v13, 0, 0);
      v4 = v14;
    }
  }

}

void __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D139B0], "atomicCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)schedulerForIdentifier_provider__cn_once_object_0;
  schedulerForIdentifier_provider__cn_once_object_0 = v0;

}

id __60___CNABPredicateObservable_schedulerForIdentifier_provider___block_invoke_2(uint64_t a1)
{
  return +[_CNABPredicateObservable makeSerialFetchSchedulerUsingSchedulerProvider:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

@end
