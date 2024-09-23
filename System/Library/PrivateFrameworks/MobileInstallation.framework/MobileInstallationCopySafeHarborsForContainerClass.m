@implementation MobileInstallationCopySafeHarborsForContainerClass

void __MobileInstallationCopySafeHarborsForContainerClass_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v6 + 40))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    v7 = (void **)(v6 + 40);
    v8 = v5;
    goto LABEL_8;
  }
  if (v11)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
LABEL_8:
    v9 = v8;
    v10 = *v7;
    *v7 = v9;

  }
}

@end
