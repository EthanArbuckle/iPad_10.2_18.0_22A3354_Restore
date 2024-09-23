@implementation NEIPSecDBNotifyClient

void __NEIPSecDBNotifyClient_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 56))
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 32))(v2, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 40), *(_QWORD *)(v2 + 40));
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

@end
