@implementation SeshatUpgradeSlot

uint64_t __SeshatUpgradeSlot_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "upgradeKey:inputData:outWriteCount:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
