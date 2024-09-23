@implementation CNSpotlightIndexingLogger

void __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v1;

  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19400675C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
