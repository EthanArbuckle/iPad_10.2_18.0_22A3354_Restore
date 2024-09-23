@implementation HMFScheduler

void __53__HMFScheduler_NAScheduler__afterDelay_performBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  if (WeakRetained)
    v4 = (id)objc_msgSend(WeakRetained, "performBlock:", v3);
  else
    (*(void (**)(uint64_t))(v3 + 16))(v3);

}

uint64_t __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __52__HMFScheduler_NAScheduler__performCancelableBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
