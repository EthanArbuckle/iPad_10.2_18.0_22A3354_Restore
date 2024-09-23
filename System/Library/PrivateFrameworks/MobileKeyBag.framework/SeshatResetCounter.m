@implementation SeshatResetCounter

uint64_t __SeshatResetCounter_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetCounter:userToken:outWriteCount:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
