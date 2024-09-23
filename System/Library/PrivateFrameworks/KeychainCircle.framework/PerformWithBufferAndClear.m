@implementation PerformWithBufferAndClear

void __PerformWithBufferAndClear_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  bzero(a3, a2);
}

@end
