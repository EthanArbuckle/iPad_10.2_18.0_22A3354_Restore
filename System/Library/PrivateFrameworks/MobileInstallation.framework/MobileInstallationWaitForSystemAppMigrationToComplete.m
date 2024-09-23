@implementation MobileInstallationWaitForSystemAppMigrationToComplete

void __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v4 = v5;
  }

}

@end
