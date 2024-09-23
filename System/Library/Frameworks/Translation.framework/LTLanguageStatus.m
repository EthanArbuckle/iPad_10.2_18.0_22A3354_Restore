@implementation LTLanguageStatus

void __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  id v6;
  _QWORD v7[4];
  os_unfair_lock_s *v8;
  id v9;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2;
    v7[3] = &unk_250693A68;
    v8 = WeakRetained;
    v6 = v3;
    v9 = v6;
    os_unfair_lock_lock(v5 + 2);
    __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2((uint64_t)v7);
    os_unfair_lock_unlock(v5 + 2);
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);

  }
}

void __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __27___LTLanguageStatus_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = &__block_literal_global_3;

}

@end
