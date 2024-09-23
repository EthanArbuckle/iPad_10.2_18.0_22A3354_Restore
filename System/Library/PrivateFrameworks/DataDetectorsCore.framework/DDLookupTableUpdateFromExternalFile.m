@implementation DDLookupTableUpdateFromExternalFile

void __DDLookupTableUpdateFromExternalFile_block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  _QWORD *v4;
  void **v5;
  int *v6;
  _QWORD *v7;

  if (a2)
    v4 = DDLookupTableCreateFromCacheData(a2, a3, 0, 0);
  else
    v4 = 0;
  **(_QWORD **)(a1 + 32) = v4;
  v5 = *(void ***)(a1 + 40);
  if (v5)
  {
    v7 = v5 + 4;
    v6 = (int *)v5[4];
    if (v6)
    {
      munmap(v5[4], v6[1]);
      v7[1] = 0;
      v7[2] = 0;
      *v7 = 0;
      v5 = *(void ***)(a1 + 40);
    }
    CFRelease(v5);
  }
}

@end
