@implementation C3DNodeGetNodeWithName

uint64_t __C3DNodeGetNodeWithName_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = C3DNodeGetName(a2);
  if (result)
  {
    if (CFEqual((CFTypeRef)result, *(CFTypeRef *)(a1 + 40)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
      return 2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
