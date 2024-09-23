@implementation MIRunTransactionalTask

uint64_t __MIRunTransactionalTask_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
