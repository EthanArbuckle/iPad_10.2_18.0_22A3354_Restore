@implementation CFPrefsIfClientIsInSecurityApplicationGroup

uint64_t ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke(uint64_t a1, CFTypeRef cf1, _BYTE *a3)
{
  uint64_t result;

  result = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + 40);
    *a3 = 1;
  }
  return result;
}

@end
