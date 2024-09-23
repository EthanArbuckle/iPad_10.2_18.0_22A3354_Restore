@implementation BMSQLVirtualTables

uint64_t __BMSQLVirtualTables_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "publisherWithUseCase:", *(_QWORD *)(a1 + 40));
}

@end
