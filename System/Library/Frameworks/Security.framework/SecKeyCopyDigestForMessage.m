@implementation SecKeyCopyDigestForMessage

__CFData *__SecKeyCopyDigestForMessage_block_invoke(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  __CFData *result;

  CFDataGetLength(*(CFDataRef *)(a1 + 48));
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  ccdigest();
  result = SecKeyRunAlgorithmAndCopyResult(*(uint64_t **)(a1 + 56), a3, *(const __CFData **)(a1 + 64), *(__CFString ***)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
