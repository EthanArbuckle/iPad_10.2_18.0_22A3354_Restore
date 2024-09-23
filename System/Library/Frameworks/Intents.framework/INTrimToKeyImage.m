@implementation INTrimToKeyImage

void __INTrimToKeyImage_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, _QWORD);
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }
  ((void (**)(id, id))v5)[2](v5, v6);

}

void __INTrimToKeyImage_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
