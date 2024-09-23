@implementation DisplayRelease

void ____DisplayRelease_block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 12504))
    CFXRelease(*(void ***)(*(_QWORD *)(a1 + 32) + 12504));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 12480))
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 12480));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 12480) = 0;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 12576))
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 12576));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 12576) = 0;
  }
}

@end
