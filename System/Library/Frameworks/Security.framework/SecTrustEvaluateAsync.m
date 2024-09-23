@implementation SecTrustEvaluateAsync

void __SecTrustEvaluateAsync_block_invoke(uint64_t a1)
{
  const void *v2;
  int v3;

  v3 = -1431655766;
  if (SecTrustEvaluateInternal(*(__SecTrust **)(a1 + 40), &v3))
    v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end
