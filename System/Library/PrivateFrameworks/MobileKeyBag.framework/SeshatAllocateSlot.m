@implementation SeshatAllocateSlot

uint64_t __SeshatAllocateSlot_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, *(_QWORD *)(a1 + 48));
}

@end
