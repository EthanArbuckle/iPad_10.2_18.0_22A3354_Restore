@implementation MobileInstallationWatchKitInstallerSnapshotWKApp

void __MobileInstallationWatchKitInstallerSnapshotWKApp_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 32);
    goto LABEL_8;
  }
  if (v8)
  {
    v6 = v8;
    v7 = *(_QWORD *)(a1 + 40);
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24) = v6;
  }

}

@end
