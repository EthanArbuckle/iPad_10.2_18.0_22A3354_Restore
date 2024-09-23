@implementation CFHTTPServerSetProperty

void ___CFHTTPServerSetProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const void *v4;

  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 72))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

@end
