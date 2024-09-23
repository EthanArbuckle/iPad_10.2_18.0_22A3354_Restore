@implementation CMPhotoCopyIPTCFromJFIFByteStream

uint64_t __CMPhotoCopyIPTCFromJFIFByteStream_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v8 + 24) = a7;
  *(_QWORD *)(v8 + 32) = a8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return 4294950191;
}

@end
