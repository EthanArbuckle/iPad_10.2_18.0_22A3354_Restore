@implementation NALazyFuture

uint64_t __39___NALazyFuture_willAddCompletionBlock__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFinished");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "started");
    if ((result & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      return objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
    }
  }
  return result;
}

void __39___NALazyFuture_willAddCompletionBlock__block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  NAPromise *v3;

  v3 = -[NAPromise initWithFuture:]([NAPromise alloc], "initWithFuture:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "block");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NAPromise *))v2)[2](v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "setBlock:", 0);
}

@end
