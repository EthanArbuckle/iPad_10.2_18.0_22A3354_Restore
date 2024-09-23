@implementation CopyCGImageAtTime

CFTypeRef __surrogateAIG_CopyCGImageAtTime_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = surrogateAIG_EnsureSubGeneratorCreated(*(const void **)(a1 + 48));
  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 24);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
