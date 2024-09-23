@implementation MobileInstallationUpdateiTunesMetadataForInstallCoordination

void __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
