@implementation MRPerformAsyncOperationsUntilError

void __MRPerformAsyncOperationsUntilError_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    MRPerformAsyncOperationsUntilError(v3, *(_QWORD *)(a1 + 40));

  }
}

@end
