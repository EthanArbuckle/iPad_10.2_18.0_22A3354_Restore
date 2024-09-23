@implementation SecTrustSetExceptions

CFTypeRef __SecTrustSetExceptions_block_invoke(uint64_t a1)
{
  const void *v2;
  CFTypeRef result;
  uint64_t v4;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v2)
    CFRelease(v2);
  result = *(CFTypeRef *)(a1 + 40);
  if (result)
  {
    result = CFRetain(result);
    v4 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = v4;
  return result;
}

void __SecTrustSetExceptions_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(v1 + 104);
  if (v2)
  {
    *(_QWORD *)(v1 + 104) = 0;
    CFRelease(v2);
  }
}

@end
