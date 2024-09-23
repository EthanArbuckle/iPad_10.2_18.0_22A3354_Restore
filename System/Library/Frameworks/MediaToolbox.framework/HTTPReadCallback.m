@implementation HTTPReadCallback

const void *__fpic_HTTPReadCallback_block_invoke(uint64_t a1)
{
  const void *result;

  result = (const void *)fpic_FindURLReq(*(_QWORD *)(a1 + 40), CFSTR("FPICURLR_HTTPRequest"), *(const void **)(a1 + 48));
  if (result != (const void *)-1)
  {
    result = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 56) + 624), (CFIndex)result);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __fpic_HTTPReadCallback_block_invoke_70(uint64_t a1)
{
  fpic_ClearAssetListResponseAfterAssetListReadFailure(*(const void **)(a1 + 32), *(const void **)(a1 + 40), *(_DWORD *)(a1 + 48));
  fpic_UpdateEventLastPlaybackFailed(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  fpic_RemoveEvent(*(const void **)(a1 + 32), *(const void **)(a1 + 40), 0, 0, 0);
}

@end
