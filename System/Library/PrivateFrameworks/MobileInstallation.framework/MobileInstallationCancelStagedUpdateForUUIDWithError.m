@implementation MobileInstallationCancelStagedUpdateForUUIDWithError

void __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v6 = v7;
  }

}

@end
