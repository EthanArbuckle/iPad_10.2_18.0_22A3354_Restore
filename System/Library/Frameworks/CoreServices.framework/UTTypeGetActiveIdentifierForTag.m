@implementation UTTypeGetActiveIdentifierForTag

uint64_t ___UTTypeGetActiveIdentifierForTag_block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  unsigned int v9;
  int *v10;

  v8 = result;
  v9 = *(_DWORD *)(result + 56);
  if (!v9 || (result = _UTTypeConformsTo(*(void **)(result + 32), a3, v9), (_DWORD)result))
  {
    if ((*(_BYTE *)(a4 + 8) & 1) != 0)
    {
      v10 = *(int **)(v8 + 48);
      if (v10)
        *v10 = a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24) = a4;
      *a5 = 1;
    }
  }
  return result;
}

@end
