@implementation CMContinuityCaptureSMDeferEventsInState

void __CMContinuityCaptureSMDeferEventsInState_block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deferredEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 1, 0);
    objc_msgSend(v4, "notifyCompletion:", v6);

  }
}

@end
