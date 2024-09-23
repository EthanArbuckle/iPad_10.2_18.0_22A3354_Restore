@implementation APReceiverSystemInfoEnsurePIN

void __APReceiverSystemInfoEnsurePIN_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 481))
    sysInfo_updatePairPINIfNeeded(v1);
}

@end
