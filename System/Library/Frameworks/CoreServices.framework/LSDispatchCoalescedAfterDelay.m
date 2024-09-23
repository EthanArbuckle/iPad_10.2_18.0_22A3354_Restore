@implementation LSDispatchCoalescedAfterDelay

void ___LSDispatchCoalescedAfterDelay_block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(unsigned __int8 **)(a1 + 40);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 & 0x7F, v2));
  JUMPOUT(0x186DAF214);
}

@end
