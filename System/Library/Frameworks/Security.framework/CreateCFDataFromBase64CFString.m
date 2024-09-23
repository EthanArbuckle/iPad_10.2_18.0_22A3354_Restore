@implementation CreateCFDataFromBase64CFString

void __CreateCFDataFromBase64CFString_block_invoke(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  UInt8 *v3;
  unint64_t v5;
  unint64_t v8;
  _BYTE *v9;
  int v10;
  unsigned __int8 *v11;

  v3 = 0;
  if (a2 && a3)
  {
    v5 = a3 >> 2;
    if ((a3 & 3) != 0)
      ++v5;
    if (!v5)
    {
      free(0);
      return;
    }
    v8 = 3 * v5;
    v3 = (UInt8 *)malloc_type_malloc(3 * v5, 0x110C4DAuLL);
    if (v3)
    {
      v9 = SecBase64Decode_(a2, a3, v3, v8, 0, &v11, &v10);
      if ((unint64_t)(v9 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, (CFIndex)v9);
    }
  }
  free(v3);
}

@end
