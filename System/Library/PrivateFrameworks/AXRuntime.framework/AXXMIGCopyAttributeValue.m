@implementation AXXMIGCopyAttributeValue

uint64_t ___AXXMIGCopyAttributeValue_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = gCallbacks(*(_QWORD *)(a1 + 52), *(_QWORD *)(a1 + 60), *(int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, gUserData);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
