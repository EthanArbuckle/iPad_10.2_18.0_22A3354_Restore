@implementation DMFConnection

void __52__DMFConnection_MDMUtilities__performRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
