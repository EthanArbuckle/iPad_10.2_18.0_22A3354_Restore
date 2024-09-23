@implementation LSRemotePlaceholderEnumerator

BOOL __87___LSRemotePlaceholderEnumerator__applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke(uint64_t a1, uint64_t a2, LSContext *a3, uint64_t a4)
{
  int v7;

  v7 = *(_DWORD *)(a4 + 168);
  return v7 == objc_msgSend(*(id *)(a1 + 32), "bundleClass")
      && evaluateBundleNoIOCommon(a3, a4, *(const LSBundleData **)(*(_QWORD *)(a1 + 32) + 96));
}

@end
