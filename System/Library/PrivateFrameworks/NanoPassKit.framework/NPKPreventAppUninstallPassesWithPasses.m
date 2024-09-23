@implementation NPKPreventAppUninstallPassesWithPasses

uint64_t __NPKPreventAppUninstallPassesWithPasses_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preventsWalletDeletion");
}

@end
