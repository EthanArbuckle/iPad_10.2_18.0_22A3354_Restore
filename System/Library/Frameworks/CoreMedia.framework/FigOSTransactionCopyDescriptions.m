@implementation FigOSTransactionCopyDescriptions

void __FigOSTransactionCopyDescriptions_block_invoke(uint64_t a1)
{
  char *v2;
  CFStringRef v3;

  v2 = (char *)os_transaction_copy_description();
  v3 = CFStringCreateWithCString(*(CFAllocatorRef *)(a1 + 32), v2, 0x8000100u);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v3);
  if (v3)
    CFRelease(v3);
  free(v2);
}

@end
