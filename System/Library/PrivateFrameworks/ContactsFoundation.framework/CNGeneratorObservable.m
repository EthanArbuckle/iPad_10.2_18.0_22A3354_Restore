@implementation CNGeneratorObservable

uint64_t __48___CNGeneratorObservable_sendResultsToObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    do
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) != 0)
        break;
      objc_msgSend(*(id *)(a1 + 32), "sendCurrentStateToObserver:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "updateState");
    }
    while (!objc_msgSend(*(id *)(a1 + 32), "isCanceled"));
  }
  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "observerDidComplete");
  return result;
}

uint64_t __56___CNGeneratorObservable_scheduleNextResultForObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "sendCurrentStateToObserver:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "updateState");
      return objc_msgSend(*(id *)(a1 + 32), "scheduleNextResultForObserver:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

@end
