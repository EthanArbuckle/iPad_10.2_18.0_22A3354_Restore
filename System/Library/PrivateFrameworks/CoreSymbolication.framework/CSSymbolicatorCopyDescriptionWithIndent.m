@implementation CSSymbolicatorCopyDescriptionWithIndent

void __CSSymbolicatorCopyDescriptionWithIndent_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v4;

  v4 = (const void *)CSCopyDescriptionWithIndent(a2, a3, (*(_DWORD *)(a1 + 40) + 1));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("%@\n"), v4);
  CFRelease(v4);
}

@end
