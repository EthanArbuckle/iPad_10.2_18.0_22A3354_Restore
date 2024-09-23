@implementation LSCoreTypesRecordProxy

uint64_t __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke(uint64_t result, int a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 168) == 11)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
    *a5 = 1;
  }
  return result;
}

void __42___LSCoreTypesRecordProxy__loadRealRecord__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
