@implementation HandleSuccessfulQueryResult

void *__figMobileAsset_HandleSuccessfulQueryResult_block_invoke(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(a2, "attributes"), "objectForKey:", CFSTR("_CompatibilityVersion"));
  if (result)
    return (void *)((int)objc_msgSend(result, "intValue") <= *(_DWORD *)(a1 + 32));
  return result;
}

BOOL __figMobileAsset_HandleSuccessfulQueryResult_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 2 || objc_msgSend(a2, "state") == 5;
}

void __figMobileAsset_HandleSuccessfulQueryResult_block_invoke_26(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  if (!a2)
    figMobileAsset_ExtractPlistFromAssetForCallback(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48), *(const __CFArray **)(a1 + 56));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 56);
  if (v6)
    CFRelease(v6);
}

@end
