@implementation CNSamplingObservable

uint64_t __35___CNSamplingObservable_subscribe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendSampleToObserver:", *(_QWORD *)(a1 + 40));
}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveResult:", a2);
}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_3(id *a1)
{
  objc_msgSend(a1[4], "cancel");
  objc_msgSend(a1[5], "sendSampleToObserver:", a1[6]);
  return objc_msgSend(a1[6], "observerDidComplete");
}

void __35___CNSamplingObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancel");
  objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v4);

}

uint64_t __35___CNSamplingObservable_subscribe___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  return objc_msgSend(*(id *)(a1 + 40), "cancel");
}

@end
