@implementation LookupThemeProvider

void *___LookupThemeProvider_block_invoke(uint64_t a1, NSMapTable *table)
{
  void *result;

  result = NSMapGet(table, *(const void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
