@implementation CTServerConnectionAddToRunLoop

void ___CTServerConnectionAddToRunLoop_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 48);
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end
