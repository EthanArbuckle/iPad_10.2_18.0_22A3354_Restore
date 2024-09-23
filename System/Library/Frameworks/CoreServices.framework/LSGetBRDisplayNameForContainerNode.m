@implementation LSGetBRDisplayNameForContainerNode

void ___LSGetBRDisplayNameForContainerNode_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;

  v6 = a2;
  v10 = (__CFString *)v6;
  if (softLinkBRCopyDisplayNameForContainerAtURL)
    v7 = softLinkBRCopyDisplayNameForContainerAtURL(*(const __CFURL **)(a1 + 40), v6);
  else
    v7 = 0;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a4 = 1;

}

@end
