@implementation EFGeneratorObservable

void __57___EFGeneratorObservable__scheduleNextResultForObserver___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isCanceled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "_isFinished") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "observerDidReceiveResult:");
    objc_msgSend(*(id *)(a1 + 32), "_updateState");
    objc_msgSend(*(id *)(a1 + 32), "_scheduleNextResultForObserver:", *(_QWORD *)(a1 + 40));

  }
}

@end
