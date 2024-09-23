@implementation SeshatAuthorizeUpdate

uint64_t __SeshatAuthorizeUpdate_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authorizeUpdate:slotIndex:userToken:outWriteCount:", *(_DWORD *)(a1 + 48) != 0, *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
