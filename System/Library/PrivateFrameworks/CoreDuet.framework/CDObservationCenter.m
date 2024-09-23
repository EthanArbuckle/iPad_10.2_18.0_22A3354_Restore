@implementation CDObservationCenter

void __38___CDObservationCenter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v0;

}

void __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke(uint64_t a1)
{
  __DKOBSERVER_IS_CALLING_ASYNC_INVOCATION__(*(void **)(a1 + 32));
}

void __79___CDObservationCenter__postNotificationName_userInfo_sender_observerObserver___block_invoke_2(void **a1)
{
  __DKOBSERVER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(a1[4], a1[5], a1[6]);
}

uint64_t __78___CDObservationCenter_addObserverChangesObserver_onName_queue_usingSelector___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v5, 3);
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __75___CDObservationCenter_addObserverChangesObserver_onName_queue_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("observerCount"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), objc_msgSend(v4, "unsignedIntegerValue"));

}

@end
