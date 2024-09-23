@implementation TabMenuProvider

+ (id)actionProviderForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mainMenuForTab:dataSource:options:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

  if ((a5 & 0x44) == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_bookmarkMenu");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  objc_msgSend(a1, "_bottomMenuForTab:dataSource:options:", v8, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v13);

  if (objc_msgSend(v10, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__TabMenuProvider_actionProviderForTab_dataSource_options___block_invoke;
    aBlock[3] = &unk_1E9CF8A98;
    v17 = v10;
    v14 = _Block_copy(aBlock);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __59__TabMenuProvider_actionProviderForTab_dataSource_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", *(_QWORD *)(a1 + 32));
}

+ (id)actionProviderForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5 options:(unint64_t)a6
{
  __int16 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[4];
  id v24;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(a1, "_copyMenuForTabGroupTab:", v10);
  objc_msgSend(v13, "safari_addObjectUnlessNil:", v14);

  if ((v6 & 0x1000) != 0)
  {
    objc_msgSend(a1, "_pinTabActionForTabGroupTab:inTabGroup:dataSource:", v10, v11, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v20);

    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(a1, "sortMenuForTabGroup:dataSource:", v11, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_addObjectUnlessNil:", v22);

      if ((v6 & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "_moveMenuForTabGroupTab:inTabGroup:dataSource:", v10, v11, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_addObjectUnlessNil:", v21);

  if ((v6 & 0x20) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v6 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(a1, "_closeActionForTab:inBackgroundTabGroup:dataSource:", v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v15);

    objc_msgSend(a1, "_closeOtherTabsActionForTab:inBackgroundTabGroup:dataSource:", v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_addObjectUnlessNil:", v16);

  }
LABEL_6:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__TabMenuProvider_actionProviderForTabGroupTab_inTabGroup_dataSource_options___block_invoke;
  aBlock[3] = &unk_1E9CF8A98;
  v24 = v13;
  v17 = v13;
  v18 = _Block_copy(aBlock);

  return v18;
}

uint64_t __78__TabMenuProvider_actionProviderForTabGroupTab_inTabGroup_dataSource_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", *(_QWORD *)(a1 + 32));
}

+ (id)bookmarkActionForTabGroup:(id)a3 dataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a4;
  objc_msgSend(a3, "unpinnedTabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    if (v8 == 1)
    {
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("book"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke_2;
    v17[3] = &unk_1E9CF6E08;
    v18 = v5;
    v19 = v7;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v10, v15, 0, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBlank") ^ 1;
}

uint64_t __56__TabMenuProvider_bookmarkActionForTabGroup_dataSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBookmarkFolderForTabs:", *(_QWORD *)(a1 + 40));
}

+ (id)copyLinksActionForTabGroup:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "tabCountForPasteboard");
  if (v4)
  {
    v5 = v4;
    if (v4 == 1)
    {
      _WBSLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__TabMenuProvider_copyLinksActionForTabGroup___block_invoke;
    v13[3] = &unk_1E9CF3058;
    v14 = v3;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v6, v11, 0, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __46__TabMenuProvider_copyLinksActionForTabGroup___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_copyLinksForTabGroup:", *(_QWORD *)(a1 + 32));

}

+ (id)moveMenuForTabGroup:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "hasMultipleProfiles") && objc_msgSend(v5, "isNamed"))
  {
    v20[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __50__TabMenuProvider_moveMenuForTabGroup_dataSource___block_invoke;
    v17 = &unk_1E9CF8AE0;
    v18 = v6;
    v19 = v5;
    objc_msgSend(v18, "profilesMenuElementsWithOptions:movingSelectedTabGroups:actionHandler:", 3, v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"), v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuWithTitle:image:identifier:options:children:", v10, v11, 0, 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __50__TabMenuProvider_moveMenuForTabGroup_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveTabGroup:toProfile:", *(_QWORD *)(a1 + 40), a2);
}

+ (id)_copyMenuForTabGroupTab:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3AC0];
  v4 = a3;
  objc_msgSend(v3, "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __43__TabMenuProvider__copyMenuForTabGroupTab___block_invoke;
    v18 = &unk_1E9CF6E08;
    v19 = v5;
    v20 = v6;
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("CopyButton"), v15, v16, v17, v18);
    v11 = (void *)MEMORY[0x1E0DC39D0];
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __43__TabMenuProvider__copyMenuForTabGroupTab___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setURL:", *(_QWORD *)(a1 + 40));
}

+ (id)_moveMenuForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7 || (objc_msgSend(v7, "isPrivateBrowsing") & 1) != 0 || (objc_msgSend(v7, "isPinned") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_userVisibleHostWithoutWWWSubdomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "length") || (objc_msgSend(v12, "safari_isHTTPFamilyURL") & 1) == 0)
    {
      objc_msgSend(v7, "title");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    v24[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __65__TabMenuProvider__moveMenuForTabGroupTab_inTabGroup_dataSource___block_invoke;
    v20[3] = &unk_1E9CF8B08;
    v21 = v9;
    v22 = v7;
    v23 = v8;
    objc_msgSend(v21, "tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:", 23, 0, v13, 0, v15, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "menuWithTitle:image:identifier:options:children:", v18, v19, 0, 0, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __65__TabMenuProvider__moveMenuForTabGroupTab_inTabGroup_dataSource___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a2)
  {
    v2 = (void *)a1[4];
    v3 = a1[5];
    v4 = (void *)a1[6];
    v5 = a2;
    objc_msgSend(v4, "uuid");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "moveTab:fromTabGroupWithUUID:toTabGroupWithUUID:afterTab:", v3, v7, v6, 0);
  }
}

+ (id)sortMenuForTabGroup:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "unpinnedTabs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke;
    v30[3] = &unk_1E9CF6E08;
    v13 = v6;
    v31 = v13;
    v14 = v5;
    v32 = v14;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

    v16 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("globe"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke_2;
    v27 = &unk_1E9CF6E08;
    v28 = v13;
    v29 = v14;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19, v24, v25, v26, v27);

    v20 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", v21, v22, 0, 0, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortTabsInTabGroupWithUUIDString:withSortMode:", v2, 0);

}

void __50__TabMenuProvider_sortMenuForTabGroup_dataSource___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortTabsInTabGroupWithUUIDString:withSortMode:", v2, 1);

}

+ (id)_closeActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__TabMenuProvider__closeActionForTab_inBackgroundTabGroup_dataSource___block_invoke;
  v18[3] = &unk_1E9CF8B30;
  v19 = v9;
  v20 = v7;
  v21 = v8;
  v13 = v8;
  v14 = v7;
  v15 = v9;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setAttributes:", 2);
  return v16;
}

void __70__TabMenuProvider__closeActionForTab_inBackgroundTabGroup_dataSource___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:", 2, 1, 1, 1);

  v3 = (void *)a1[4];
  v5[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeTabs:inInactiveTabGroup:", v4, a1[6]);

}

+ (id)_closeOtherTabsActionForTab:(id)a3 inBackgroundTabGroup:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isPinned") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "unpinnedTabs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v12 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke;
      v19 = &unk_1E9CF8B58;
      v20 = v11;
      v21 = v7;
      v22 = v9;
      v23 = v8;
      objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, 0, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setAttributes:", 2, v16, v17, v18, v19);
      objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("CloseOtherTabsButton"));

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

void __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke_2;
  v4[3] = &unk_1E9CF7BE0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "closeTabs:inInactiveTabGroup:", v3, *(_QWORD *)(a1 + 56));

}

uint64_t __79__TabMenuProvider__closeOtherTabsActionForTab_inBackgroundTabGroup_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

+ (id)_mainMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "_copyActionsForTab:options:", v7, a5);
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((a5 & 1) != 0)
  {
    objc_msgSend(v10, "safari_pasteAndNavigateCommand");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_addObjectUnlessNil:", v12);

  }
  if ((~(_DWORD)a5 & 0x44) == 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(MEMORY[0x1E0DC39D0], "sf_bookmarkMenu", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "children");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

  }
  if ((a5 & 0x800) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_toggleVoiceSearchActionForTabDocument:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safari_addObjectUnlessNil:", v19);

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_copyActionsForTab:(id)a3 options:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "urlForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__TabMenuProvider__copyActionsForTab_options___block_invoke;
    v14[3] = &unk_1E9CF8B30;
    v15 = v4;
    v16 = v5;
    v17 = v6;
    v10 = v6;
    objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v7, v9, 0, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("CopyButton"));
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

void __46__TabMenuProvider__copyActionsForTab_options___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(*(id *)(a1 + 32), "linkMetadataForSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "safari_registerLinkMetadata:", v3);
  objc_msgSend(v2, "registerObject:visibility:", *(_QWORD *)(a1 + 40), 0);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setItemProviders:", v4);

}

+ (id)_bottomMenuForTab:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  __int16 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 0x1000) != 0)
  {
    objc_msgSend(a1, "pinTabActionForTab:dataSource:", v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v17);

    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
LABEL_18:
      objc_msgSend(a1, "_sortMenuForTab:dataSource:", v8, v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v19);

      if ((v5 & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "moveMenuForTab:dataSource:", v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v18);

  if ((v5 & 0x20) != 0)
    goto LABEL_18;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(a1, "_closeActionForTab:dataSource:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

    objc_msgSend(a1, "_closeOtherTabsActionForTab:dataSource:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_addObjectUnlessNil:", v12);

  }
LABEL_6:
  if ((v5 & 0x80) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_stopReloadActionForTabDocument:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v13);

    }
  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(a1, "_shareCommand");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  if ((v5 & 0x100) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_readerActionForTabDocument:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v15);

    }
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_toggleVoiceSearchActionForTabDocument:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "availability");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("mic"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__TabMenuProvider__toggleVoiceSearchActionForTabDocument___block_invoke;
    v11[3] = &unk_1E9CF3058;
    v12 = v3;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __58__TabMenuProvider__toggleVoiceSearchActionForTabDocument___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "browserController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleVoiceSearch");

}

+ (id)_stopReloadActionForTabDocument:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  char v13;

  v3 = a3;
  if ((objc_msgSend(v3, "isBlank") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "canStopLoading");
    if ((v5 & 1) != 0)
      v6 = CFSTR("xmark");
    else
      v6 = CFSTR("arrow.clockwise");
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3428];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__TabMenuProvider__stopReloadActionForTabDocument___block_invoke;
    v11[3] = &unk_1E9CF7F58;
    v13 = v5;
    v12 = v3;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __51__TabMenuProvider__stopReloadActionForTabDocument___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "stopLoading");
  else
    return objc_msgSend(v2, "reload");
}

+ (id)_shareCommand
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3678];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandWithTitle:image:action:propertyList:", v3, v4, sel_share_, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_readerActionForTabDocument:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "isReaderAvailable"))
  {
    objc_msgSend(v3, "isShowingReader");
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3870];
    if (objc_msgSend(v3, "isShowingReader"))
      v8 = CFSTR("doc.plaintext.fill");
    else
      v8 = CFSTR("doc.plaintext");
    objc_msgSend(v6, "systemImageNamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3428];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__TabMenuProvider__readerActionForTabDocument___block_invoke;
    v12[3] = &unk_1E9CF3058;
    v13 = v3;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v5, v9, 0, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __47__TabMenuProvider__readerActionForTabDocument___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "browserController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowingReader:animated:forTabDocument:", objc_msgSend(*(id *)(a1 + 32), "isShowingReader") ^ 1, 1, *(_QWORD *)(a1 + 32));

}

+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4
{
  return (id)objc_msgSend(a1, "moveMenuForTab:dataSource:showTitle:dismissHandler:", a3, a4, 1, &__block_literal_global_82);
}

+ (id)moveMenuForTab:(id)a3 dataSource:(id)a4 showTitle:(BOOL)a5 dismissHandler:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[2];

  v7 = a5;
  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if ((objc_msgSend(v9, "isPrivateBrowsingEnabled") & 1) != 0 || (objc_msgSend(v9, "isPinned") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v9, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safari_userVisibleHostWithoutWWWSubdomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length") || (objc_msgSend(v13, "safari_isHTTPFamilyURL") & 1) == 0)
    {
      objc_msgSend(v9, "title");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    objc_msgSend(v9, "wbTab");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v28[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__TabMenuProvider_moveMenuForTab_dataSource_showTitle_dismissHandler___block_invoke;
    v25[3] = &unk_1E9CF5128;
    v26 = v10;
    v27 = v9;
    objc_msgSend(v26, "tabGroupsMenuElementsWithOptions:newTabGroupName:hostTitle:descendantCount:movingSelectedTabs:actionHandler:dismissHandler:", 23, 0, v14, 0, v18, v25, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    if (v7)
    {
      _WBSLocalizedString();
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = &stru_1E9CFDBB0;
    }
    v21 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuWithTitle:image:identifier:options:children:", v20, v22, 0, 0, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

void __70__TabMenuProvider_moveMenuForTab_dataSource_showTitle_dismissHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "uuid");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "moveTab:toTabGroupWithUUID:", v3, v4);

  }
}

+ (id)pinTabActionForTab:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "canSetPinned")
    && ((v7 = objc_msgSend(v5, "isPinned"),
         objc_msgSend(v5, "wbTab"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v6, "isTabPinnable:", v8),
         v8,
         (v9 & 1) != 0)
     || v7))
  {
    if ((v7 & 1) != 0)
      v11 = CFSTR("pin.slash");
    else
      v11 = CFSTR("pin");
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3428];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __49__TabMenuProvider_pinTabActionForTab_dataSource___block_invoke;
    v21 = &unk_1E9CF6E08;
    v22 = v6;
    v15 = v5;
    v23 = v15;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v12, v13, 0, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isPinnedTab", v18, v19, v20, v21))
      v16 = CFSTR("UnpinTabButton");
    else
      v16 = CFSTR("PinTabButton");
    objc_msgSend(v10, "setAccessibilityIdentifier:", v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __49__TabMenuProvider_pinTabActionForTab_dataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTab:isPinned:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "isPinned") ^ 1);
}

+ (id)_pinTabActionForTabGroupTab:(id)a3 inTabGroup:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "canSetPinned"))
    goto LABEL_7;
  if ((objc_msgSend(v7, "isPinned") & 1) == 0)
  {
    if (objc_msgSend(v8, "isTabPinnable:", v7))
    {
      v10 = CFSTR("pin");
      v11 = CFSTR("PinTabButton");
      goto LABEL_6;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = CFSTR("pin.slash");
  v11 = CFSTR("UnpinTabButton");
LABEL_6:
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3428];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__TabMenuProvider__pinTabActionForTabGroupTab_inTabGroup_dataSource___block_invoke;
  v17[3] = &unk_1E9CF8B30;
  v18 = v9;
  v19 = v7;
  v20 = v8;
  objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", v11);

LABEL_8:
  return v15;
}

uint64_t __69__TabMenuProvider__pinTabActionForTabGroupTab_inTabGroup_dataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "togglePinningTab:inInactiveTabGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)_sortMenuForTab:(id)a3 dataSource:(id)a4
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a4;
  objc_msgSend(v4, "currentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke;
    v28[3] = &unk_1E9CF3058;
    v13 = v4;
    v29 = v13;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("globe"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    v24 = 3221225472;
    v25 = __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke_2;
    v26 = &unk_1E9CF3058;
    v27 = v13;
    objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, v17, 0, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v18, v23, v24, v25, v26);

    v19 = (void *)MEMORY[0x1E0DC39D0];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.arrow.down"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "menuWithTitle:image:identifier:options:children:", v20, v21, 0, 0, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sortTabsWithMode:", 0);
}

uint64_t __46__TabMenuProvider__sortMenuForTab_dataSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sortTabsWithMode:", 1);
}

+ (id)_closeActionForTab:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isPinned") & 1) != 0
    || (objc_msgSend(v6, "unpinnedTabs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 >= 2))
  {
    v10 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __49__TabMenuProvider__closeActionForTab_dataSource___block_invoke;
    v17 = &unk_1E9CF6E08;
    v18 = v6;
    v19 = v5;
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAttributes:", 2, v14, v15, v16, v17);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __49__TabMenuProvider__closeActionForTab_dataSource___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:", 2, 1, 1, 1);

  return objc_msgSend(*(id *)(a1 + 32), "closeTab:animated:", *(_QWORD *)(a1 + 40), 1);
}

+ (id)_closeOtherTabsActionForTab:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isPinned") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "unpinnedTabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v9 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke;
      v13[3] = &unk_1E9CF8B30;
      v14 = v8;
      v15 = v5;
      v16 = v6;
      objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setAttributes:", 2);
      objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CloseOtherTabsButton"));

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

void __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_2;
  v12[3] = &unk_1E9CF2C90;
  v3 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCloseTabWithTrigger:tabClosingAction:numberOfTabsClosed:tabCollectionViewType:", 2, 2, objc_msgSend(v4, "count"), 1);

  v6 = *(void **)(a1 + 48);
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_3;
  v9[3] = &unk_1E9CF1830;
  v10 = *(id *)(a1 + 48);
  v11 = v4;
  v8 = v4;
  objc_msgSend(v6, "registerUndoWithName:actions:", v7, v9);

}

uint64_t __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

uint64_t __58__TabMenuProvider__closeOtherTabsActionForTab_dataSource___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeTabs:", *(_QWORD *)(a1 + 40));
}

@end
