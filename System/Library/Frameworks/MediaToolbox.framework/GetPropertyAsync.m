@implementation GetPropertyAsync

void __fileWriterSink_GetPropertyAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
    _Block_release(*(const void **)(a1 + 32));
  }
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

@end
