@implementation FigRemoteOperationSenderResetWithApplier

uint64_t __FigRemoteOperationSenderResetWithApplier_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v7;
  const void *Region;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v5 + 16))(v5, a2, a3, a4))
    return 1;
  v7 = *a4;
  if (v7 && *(_DWORD *)v7 == 1919774576)
  {
    Region = (const void *)FigSharedMemBlockGetRegion(*(_QWORD *)(v7 + 40));
    if (Region)
      CFRetain(Region);
    FigRemoteOperationCleanupMessageData((_DWORD *)v7);
  }
  return 0;
}

@end
