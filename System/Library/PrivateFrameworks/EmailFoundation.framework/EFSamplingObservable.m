@implementation EFSamplingObservable

void __35___EFSamplingObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void __35___EFSamplingObservable_subscribe___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "unlock");
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:", v4);

}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __35___EFSamplingObservable_subscribe___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_msgSend(*(id *)(a1 + 40), "observerDidFailWithError:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __35___EFSamplingObservable_subscribe___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_msgSend(*(id *)(a1 + 40), "cancel");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
