@implementation CTServerConnectionSetTargetQueue

void ___CTServerConnectionSetTargetQueue_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  v4 = *(NSObject **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;
  if (v4)
    dispatch_release(v4);
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

@end
