@implementation BonjourAdvertiserUpdateLinkStatusNAN

uint64_t __BonjourAdvertiserUpdateLinkStatusNAN_block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 64))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 64), "updateLinkStatus:", *(unsigned int *)(result + 40));
  return result;
}

@end
