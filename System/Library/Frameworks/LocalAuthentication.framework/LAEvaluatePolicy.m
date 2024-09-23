@implementation LAEvaluatePolicy

void __LAEvaluatePolicy_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = (const void *)LACopyResultOfPolicyEvaluation(*(void **)(a1 + 40), *(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(uint64_t **)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2 != 0;
  if (v2)
    CFRelease(v2);
}

@end
