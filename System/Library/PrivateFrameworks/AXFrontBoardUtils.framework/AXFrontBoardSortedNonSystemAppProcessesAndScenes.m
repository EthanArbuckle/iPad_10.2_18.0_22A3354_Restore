@implementation AXFrontBoardSortedNonSystemAppProcessesAndScenes

void ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "accessibilitySceneOwnerIsAUIApplication"))
    goto LABEL_23;
  objc_msgSend(v3, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE00540]);

  if ((v6 & 1) != 0)
    goto LABEL_23;
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("searchBar"));

  if ((v8 & 1) != 0 || (objc_msgSend(v3, "accessibilitySceneIsDismissedSearchScreen") & 1) != 0)
    goto LABEL_23;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_8;
  if ((objc_msgSend(v3, "accessibilityIsSceneOnCarScreen") & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 48))
      goto LABEL_23;
LABEL_8:
    if ((objc_msgSend(v3, "accessibilityIsSceneOnMainScreen") & 1) == 0
      && !objc_msgSend(v3, "accessibilityIsSceneOnExternalScreen"))
    {
      goto LABEL_23;
    }
  }
  if ((objc_msgSend(v3, "accessibilitySceneIsDismissedInCallService") & 1) == 0
    && (objc_msgSend(v3, "accessibilitySceneIsCallServiceBanner") & 1) == 0
    && (objc_msgSend(v3, "accessibilitySceneBelongsToTheSystemApp") & 1) == 0
    && (*(_BYTE *)(a1 + 49) || (objc_msgSend(v3, "accessibilitySceneIsDeactivatedBySidebar") & 1) == 0))
  {
    if (!*(_BYTE *)(a1 + 50))
    {
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityRecentlyActivatedApplicationBundleIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "containsObject:", v10))
      {

      }
      else
      {
        v11 = objc_msgSend(v3, "accessibilitySceneIsDeactivatedBySwitcher");

        if ((v11 & 1) != 0)
          goto LABEL_23;
      }
    }
    objc_msgSend(v3, "accessibilitySceneProcess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v3, "accessibilitySceneIsForegroundVisible"))
    {
      v13 = *(void **)(a1 + 40);
      v15[0] = CFSTR("scene");
      v15[1] = CFSTR("process");
      v16[0] = v3;
      v16[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
  }
LABEL_23:

}

uint64_t ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t ___AXFrontBoardSortedNonSystemAppProcessesAndScenes_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  BOOL v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilitySceneFrame");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "accessibilitySceneFrame");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v13 == v9;
  v19 = v13 < v9;
  v20 = v11 == v15;
  v21 = v11 < v15;
  v22 = v18;
  v23 = v9 < v13;
  if (v17 == 4)
  {
    v23 = v15 < v11;
    v22 = v15 == v11;
  }
  if (v17 != 3)
  {
    v21 = v23;
    v20 = v22;
  }
  if (v17 != 2)
  {
    v19 = v21;
    v18 = v20;
  }
  v24 = v9 == v13;
  v25 = v15 == v11;
  v26 = v15 < v11;
  v27 = v24;
  v28 = v13 < v9;
  if (v17 == 4)
  {
    v28 = v11 < v15;
    v27 = v11 == v15;
  }
  if (v17 != 3)
  {
    v26 = v28;
    v25 = v27;
  }
  v29 = v17 == 2;
  if (v17 == 2)
    v30 = v9 < v13;
  else
    v30 = v26;
  if (!v29)
    v24 = v25;
  if (v16 == 1)
    v18 = v24;
  else
    v30 = v19;
  v29 = !v30;
  v31 = -1;
  if (v29)
    v31 = 1;
  if (v18)
    v32 = 0;
  else
    v32 = v31;

  return v32;
}

@end
