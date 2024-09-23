@implementation CNOnEmptyObservable

void __34___CNOnEmptyObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "observableDidSendResult");
  objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v4);

}

void __34___CNOnEmptyObservable_subscribe___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(a1[4], "isObservableEmpty"))
  {
    objc_msgSend(a1[4], "subscribeNextObservable:", a1[5]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "addCancelable:", v3);

  }
  else
  {
    objc_msgSend(a1[5], "observerDidComplete");
  }
}

uint64_t __34___CNOnEmptyObservable_subscribe___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

@end
