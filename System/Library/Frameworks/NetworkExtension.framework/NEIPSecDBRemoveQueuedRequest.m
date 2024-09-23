@implementation NEIPSecDBRemoveQueuedRequest

void __NEIPSecDBRemoveQueuedRequest_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;

  v2 = *(uint64_t **)(a1 + 32);
  v3 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v3 + 8) = v2[1];
    v2 = *(uint64_t **)(a1 + 32);
    v3 = *v2;
  }
  *(_QWORD *)v2[1] = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(NSObject **)(v4 + 16);
    if (v5)
    {
      dispatch_release(v5);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    }
  }
}

@end
