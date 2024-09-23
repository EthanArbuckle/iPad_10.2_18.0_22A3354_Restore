@implementation VNExecuteBlockWithPixelBuffer

uint64_t __VNExecuteBlockWithPixelBuffer_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

@end
