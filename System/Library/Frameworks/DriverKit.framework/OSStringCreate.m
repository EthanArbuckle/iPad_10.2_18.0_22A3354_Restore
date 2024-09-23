@implementation OSStringCreate

BOOL __OSStringCreate_block_invoke(uint64_t a1, uint64_t a2)
{
  size_t StringLength;
  int *v5;
  _DWORD *v6;
  int v7;
  int v8;
  const char *v9;

  StringLength = OSSerializationGetStringLength(*(const unsigned int **)(a2 + 40));
  if (StringLength != *(_QWORD *)(a1 + 32))
    return 0;
  v5 = *(int **)(a2 + 40);
  v7 = *v5;
  v6 = v5 + 1;
  v8 = v7 & 0x7E000000 | 0x1000000;
  if ((v7 & 0x7FFFFFFF) == 0x8000000)
    v6 = 0;
  v9 = v8 == 150994944 ? (const char *)v6 : 0;
  return !strncmp(*(const char **)(a1 + 40), v9, StringLength) && OSObjectTryRetain((OSObject *)a2);
}

@end
