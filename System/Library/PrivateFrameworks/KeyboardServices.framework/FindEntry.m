@implementation FindEntry

uint64_t __FindEntry_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasSuffix:", *(_QWORD *)(a1 + 32));
}

@end
