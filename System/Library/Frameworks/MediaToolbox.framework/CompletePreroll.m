@implementation CompletePreroll

void __customVideoCompositor_CompletePreroll_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD);
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 200);
  if (v3)
    v3(*(_QWORD *)(v2 + 208), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

@end
