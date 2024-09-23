@implementation SeshatDeleteSlot

uint64_t __SeshatDeleteSlot_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSlot:outWriteCount:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
