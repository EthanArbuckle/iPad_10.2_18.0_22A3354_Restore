@implementation BonjourBrowser

void ___BonjourBrowser_NANEnsureStarted_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 64))
    _BonjourBrowser_NANEndpointFound(v2, a2);
}

void ___BonjourBrowser_NANEnsureStarted_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 64))
    _BonjourBrowser_NANEndpointLost(v2, a2);
}

void ___BonjourBrowser_NANEnsureStarted_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 64))
    _BonjourBrowser_NANEndpointFound(v2, a2);
}

void ___BonjourBrowser_NANEnsureStarted_block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    if (v3 == *(void **)(*(_QWORD *)(a1 + 40) + 64))
    {
      objc_msgSend(v3, "invalidate");

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = 0;
    }
  }
}

void ___BonjourBrowser_PostEventEx_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end
