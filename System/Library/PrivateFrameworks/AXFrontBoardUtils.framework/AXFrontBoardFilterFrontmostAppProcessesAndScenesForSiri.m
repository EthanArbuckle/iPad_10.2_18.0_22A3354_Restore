@implementation AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri

void ___AXFrontBoardFilterFrontmostAppProcessesAndScenesForSiri_block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v5 = a2;
  objc_msgSend(v5, "valueForKey:", CFSTR("process"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilitySceneLevel");
  v8 = v7;

  objc_msgSend(v12, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE00540]);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
  }
  if (v8 > *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    objc_msgSend(v12, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE00528]);

    if ((v11 & 1) == 0)
      *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
  }

}

@end
