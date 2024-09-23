@implementation CNGeminiLogger

void __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
