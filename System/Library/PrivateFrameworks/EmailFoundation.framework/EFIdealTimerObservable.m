@implementation EFIdealTimerObservable

void __37___EFIdealTimerObservable_subscribe___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "observerDidReceiveResult:");

}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(double *)(a1 + 64);
  if (v3 - *(double *)(v4 + 24) >= v5)
  {
    v6 = fmod(v3 - *(double *)(a1 + 72), *(long double *)(a1 + 64));
    if (v6 >= 2.22044605e-16)
    {
      *(double *)(v4 + 24) = v3 + v5 - v6;
      v7 = (id)objc_msgSend(*(id *)(a1 + 40), "afterDelay:performBlock:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      *(double *)(v4 + 24) = v3;
      objc_msgSend(*(id *)(a1 + 40), "performBlock:", *(_QWORD *)(a1 + 48));
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:", a2);
}

uint64_t __37___EFIdealTimerObservable_subscribe___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
