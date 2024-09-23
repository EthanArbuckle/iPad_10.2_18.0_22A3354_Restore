@implementation MobileInstallationCheckCapabilitiesMatch

void __MobileInstallationCheckCapabilitiesMatch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else if (v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  }

}

@end
