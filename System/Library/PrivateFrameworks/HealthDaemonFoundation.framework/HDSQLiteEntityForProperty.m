@implementation HDSQLiteEntityForProperty

uint64_t __HDSQLiteEntityForProperty_block_invoke(_QWORD *a1, id *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*a2, "isEqualToString:", a1[4]);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[6];
    *a3 = 1;
  }
  return result;
}

@end
