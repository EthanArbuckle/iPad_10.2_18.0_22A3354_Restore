@implementation CreatePixelBufferExtendedFromCFData

BOOL __CreatePixelBufferExtendedFromCFData_block_invoke(uint64_t a1, void *__dst, int a3, int a4, int a5, int a6, size_t __n)
{
  uint64_t v10;
  char *v11;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(char **)(v10 + 24);
  if ((unint64_t)&v11[__n] <= *(_QWORD *)(a1 + 40))
  {
    memcpy(__dst, v11, __n);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(char **)(v10 + 24);
  }
  *(_QWORD *)(v10 + 24) = &v11[__n];
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= *(_QWORD *)(a1 + 40);
}

@end
