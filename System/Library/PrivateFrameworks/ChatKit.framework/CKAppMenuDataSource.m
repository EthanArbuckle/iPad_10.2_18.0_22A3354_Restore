@implementation CKAppMenuDataSource

+ (id)imageForIdentifier:(id)a3 traitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  int v27;

  v5 = a3;
  v6 = a4;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginForExtensionIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    IMBalloonExtensionIDWithSuffix();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v10))
    {

LABEL_5:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuAnimojiStickersIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v14;

      goto LABEL_7;
    }
    IMBalloonExtensionIDWithSuffix();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqualToString:", v11);

    if (v12)
      goto LABEL_5;
    IMBalloonExtensionIDWithSuffix();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v5, "isEqualToString:", v16);

    if (v17)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuHashtagImagesIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("kAppMenuEffectsItemIdentifier")))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuEffectsIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    IMBalloonExtensionIDWithSuffix();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", v18) & 1) != 0)
    {

LABEL_15:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuPhotosIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v19 = objc_msgSend(v5, "isEqualToString:", CFSTR("kAppMenuPhotosItemIdentifier"));

    if ((v19 & 1) != 0)
      goto LABEL_15;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("kAppMenuEmoji")))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuEmojiIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    IMBalloonExtensionIDWithSuffix();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "isEqualToString:", v20);

    if (v21)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuApplePayIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    IMBalloonExtensionIDWithSuffix();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v5, "isEqualToString:", v22);

    if (v23)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuTapToRadarIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("kAppMenuAudio")))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appMenuAudioMessagesIconForTraitCollection:", v6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37608]))
    {
      v24 = (void *)MEMORY[0x1E0CEA638];
      v25 = CFSTR("Mac-SendLaterIcon");
    }
    else
    {
      IMBalloonExtensionIDWithSuffix();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v5, "isEqualToString:", v26);

      if (!v27)
      {
        v9 = 0;
        goto LABEL_7;
      }
      v24 = (void *)MEMORY[0x1E0CEA638];
      v25 = CFSTR("Mac-GenerativePlaygroundIcon");
    }
    objc_msgSend(v24, "ckImageNamed:compatibleWithTraitCollection:", v25, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v9;
}

+ (id)orderedItemsForTraitCollection:(id)a3 conversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  CKCustomAppMenuItem *v16;
  void *v17;
  void *v18;
  CKCustomAppMenuItem *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  CKCustomAppMenuItem *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  CKCustomAppMenuItem *v32;
  CKCustomAppMenuItem *v33;
  void *v34;
  void *v35;
  CKCustomAppMenuItem *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCarrierPigeonEnabled");

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v5, "sendingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageLiteService");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v10)
  {

  }
  else
  {
    v11 = (void *)v10;
    objc_msgSend(v5, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldDisplayOffGridModeStatus");

    if (!v13)
      goto LABEL_8;
  }
  objc_msgSend(v5, "chat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsCapabilities:", 0x20000);

  if (v15)
  {
    v16 = [CKCustomAppMenuItem alloc];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("EFFECT_MENU_ITEM_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CKCustomAppMenuItem initWithIdentifier:displayName:](v16, "initWithIdentifier:displayName:", CFSTR("kAppMenuEffectsItemIdentifier"), v18);
    objc_msgSend(v6, "addObject:", v19);

    v20 = v6;
    goto LABEL_20;
  }
LABEL_8:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "visibleSwitcherPlugins");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(a1, "_shouldDisplayPluginInMenu:", v27))
          objc_msgSend(v6, "addObject:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v5, "supportsSendLater"))
  {
    v28 = [CKCustomAppMenuItem alloc];
    v29 = *MEMORY[0x1E0D37608];
    CKFrameworkBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SEND_MENU_ITEM_TITLE_SEND_LATER"), &stru_1E276D870, CFSTR("ChatKit"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[CKCustomAppMenuItem initWithIdentifier:displayName:](v28, "initWithIdentifier:displayName:", v29, v31);
    objc_msgSend(v6, "addObject:", v32);

  }
  v33 = [CKCustomAppMenuItem alloc];
  CKFrameworkBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("EFFECT_MENU_ITEM_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[CKCustomAppMenuItem initWithIdentifier:displayName:](v33, "initWithIdentifier:displayName:", CFSTR("kAppMenuEffectsItemIdentifier"), v35);
  objc_msgSend(v6, "addObject:", v36);

  objc_msgSend(a1, "_sortedMenuItemsFromItems:", v6);
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v37 = v20;

  return v37;
}

+ (id)_sortedMenuItemsFromItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(a1, "_defaultAppOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke;
  v25[3] = &unk_1E274B840;
  v9 = v4;
  v26 = v9;
  v10 = v6;
  v27 = v10;
  v11 = v5;
  v28 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25);

  v18 = v8;
  v19 = 3221225472;
  v20 = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_3;
  v21 = &unk_1E2750978;
  v22 = v11;
  v23 = v10;
  v24 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v18);
  objc_msgSend(v13, "reversedOrderedSet", v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_2;
  v10[3] = &unk_1E2750950;
  v9 = v3;
  v11 = v9;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v10);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(*(id *)(a1 + 48), "addIndex:", v6);
  }

}

uint64_t __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "__ck_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __49__CKAppMenuDataSource__sortedMenuItemsFromItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:") & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

+ (id)_defaultAppOrder
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)_shouldDisplayPluginInMenu:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isClingEnabled"))
    v5 = CKIsStickersStripEnabled();
  else
    v5 = 0;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showAllInstalledMessageApps");

  if ((v7 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) != 0)
  {
    v5 ^= 1u;
    goto LABEL_16;
  }
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
LABEL_5:
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "showTapToRadarMessagesApp");
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
      {
        v5 = 0;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isGenPlaygroundEnabled");
    }
    v5 = v21;

  }
LABEL_16:

  return v5;
}

+ (id)appMenuWithTarget:(id)a3 traitCollection:(id)a4 conversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  id val;
  _QWORD v24[5];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  val = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v9;
  objc_msgSend(a1, "orderedItemsForTraitCollection:conversation:", v8, v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "__ck_imageForTraitCollection:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        location = 0;
        objc_initWeak(&location, val);
        v16 = (void *)MEMORY[0x1E0CEA2A8];
        objc_msgSend(v14, "__ck_displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __70__CKAppMenuDataSource_appMenuWithTarget_traitCollection_conversation___block_invoke;
        v24[3] = &unk_1E274B010;
        objc_copyWeak(&v25, &location);
        v24[4] = v14;
        objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v15, 0, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 16, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __70__CKAppMenuDataSource_appMenuWithTarget_traitCollection_conversation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "appSelectionInterfaceSelectedItem:", *(_QWORD *)(a1 + 32));

}

@end
