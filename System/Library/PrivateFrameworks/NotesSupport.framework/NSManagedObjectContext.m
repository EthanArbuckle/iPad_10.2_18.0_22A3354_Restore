@implementation NSManagedObjectContext

void __74__NSManagedObjectContext_IC__ic_performBlock_andPerformBlockOnMainThread___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

uint64_t __88__NSManagedObjectContext_IC__ic_performBlockAndWait_andPerformBlockAndWaitOnMainThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
