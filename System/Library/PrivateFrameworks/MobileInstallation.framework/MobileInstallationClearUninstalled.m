@implementation MobileInstallationClearUninstalled

void __MobileInstallationClearUninstalled_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v4 = v3;
      MOLogWrite();
      v3 = v4;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
  }

}

@end
