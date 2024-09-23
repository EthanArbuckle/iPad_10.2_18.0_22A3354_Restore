@implementation CopyProperty

CFArrayRef __screenstream_CopyProperty_block_invoke(uint64_t a1)
{
  CFArrayRef result;

  result = CFArrayCreateCopy(*(CFAllocatorRef *)(a1 + 40), *(CFArrayRef *)(*(_QWORD *)(a1 + 48) + 1144));
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
