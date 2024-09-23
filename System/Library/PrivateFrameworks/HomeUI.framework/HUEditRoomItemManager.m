@implementation HUEditRoomItemManager

- (HUEditRoomItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithRoomBuilder_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUEditRoomItemManager.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUEditRoomItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUEditRoomItemManager)initWithRoomBuilder:(id)a3 delegate:(id)a4
{
  id v7;
  HUEditRoomItemManager *v8;
  HUEditRoomItemManager *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  HFZoneModule *zoneModule;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUEditRoomItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v20, sel_initWithDelegate_sourceItem_, a4, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_roomBuilder, a3);
    objc_msgSend(v7, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "roomForEntireHome");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    objc_msgSend(v7, "room");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v13 & 1) == 0)
    {
      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0D31A18]);
        objc_msgSend(v7, "room");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "initWithItemUpdater:room:", v9, v16);
        zoneModule = v9->_zoneModule;
        v9->_zoneModule = (HFZoneModule *)v17;

      }
    }
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id location;
  _QWORD v53[5];
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v60 = *MEMORY[0x1E0D30CE8];
  v61[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithResults:", v5);
  -[HUEditRoomItemManager setNameItem:](self, "setNameItem:", v6);

  v7 = (void *)MEMORY[0x1E0C99E08];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomTakePhotoTitle"), CFSTR("HUEditRoomTakePhotoTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0D30D18]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0CEA648], "isSourceTypeAvailable:", 1) ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D30D70];
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D70]);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResults:", v49);
  -[HUEditRoomItemManager setCameraItem:](self, "setCameraItem:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D31840]);
  v58[0] = v9;
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomChooseWallpaperTitle"), CFSTR("HUEditRoomChooseWallpaperTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v14;
  v58[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithResults:", v16);
  -[HUEditRoomItemManager setChooseWallpaperItem:](self, "setChooseWallpaperItem:", v17);

  v18 = objc_alloc(MEMORY[0x1E0D31840]);
  v56 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithResults:", v20);
  -[HUEditRoomItemManager setWallpaperThumbnailItem:](self, "setWallpaperThumbnailItem:", v21);

  v22 = objc_alloc(MEMORY[0x1E0D31840]);
  v54 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell") ^ 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithResults:", v24);
  -[HUEditRoomItemManager setWallpaperPickerItem:](self, "setWallpaperPickerItem:", v25);

  v26 = (void *)MEMORY[0x1E0C99DE8];
  -[HUEditRoomItemManager nameItem](self, "nameItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v27;
  -[HUEditRoomItemManager cameraItem](self, "cameraItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v28;
  -[HUEditRoomItemManager chooseWallpaperItem](self, "chooseWallpaperItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v29;
  -[HUEditRoomItemManager wallpaperThumbnailItem](self, "wallpaperThumbnailItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v30;
  -[HUEditRoomItemManager wallpaperPickerItem](self, "wallpaperPickerItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v34 = objc_alloc(MEMORY[0x1E0D31840]);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __52__HUEditRoomItemManager__buildItemProvidersForHome___block_invoke;
  v50[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v51, &location);
  v35 = (void *)objc_msgSend(v34, "initWithResultsBlock:", v50);
  -[HUEditRoomItemManager setRemoveItem:](self, "setRemoveItem:", v35);

  -[HUEditRoomItemManager removeItem](self, "removeItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v36);

  v37 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v37, "initWithItems:", v38);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomItemManager zoneModule](self, "zoneModule");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "itemProviders");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count") == 0;

  if (!v43)
  {
    -[HUEditRoomItemManager zoneModule](self, "zoneModule");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "itemProviders");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allObjects");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObjectsFromArray:", v46);

  }
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);

  return v40;
}

id __52__HUEditRoomItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomRemoveDeviceName"), CFSTR("HUEditRoomRemoveDeviceName"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "_canDeleteRoom") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditRoomNameSectionIdentifier"));
  v7 = (void *)MEMORY[0x1E0C99D20];
  -[HUEditRoomItemManager nameItem](self, "nameItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v9);

  _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomNameTitle"), CFSTR("HUEditRoomNameTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v10);

  objc_msgSend(v5, "addObject:", v6);
  -[HUEditRoomItemManager zoneModule](self, "zoneModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildSectionsWithDisplayedItems:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditRoomWallpaperSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomWallpaperSectionTitle"), CFSTR("HUEditRoomWallpaperSectionTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHeaderTitle:", v14);

  -[HUEditRoomItemManager cameraItem](self, "cameraItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  -[HUEditRoomItemManager chooseWallpaperItem](self, "chooseWallpaperItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  -[HUEditRoomItemManager wallpaperThumbnailItem](self, "wallpaperThumbnailItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  -[HUEditRoomItemManager wallpaperPickerItem](self, "wallpaperPickerItem");
  v18 = objc_claimAutoreleasedReturnValue();
  v29[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItems:", v19);

  objc_msgSend(v5, "addObject:", v13);
  -[HUEditRoomItemManager removeItem](self, "removeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "latestResults");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v22, "BOOLValue");

  if ((v18 & 1) == 0)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUEditRoomRemoveSectionIdentifier"));
    -[HUEditRoomItemManager removeItem](self, "removeItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setItems:", v25);

    objc_msgSend(v5, "addObject:", v23);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)_canDeleteRoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  -[HUEditRoomItemManager roomBuilder](self, "roomBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUEditRoomItemManager roomBuilder](self, "roomBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "roomForEntireHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v10) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[HFItemManager home](self, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "hf_currentUserIsAdministrator");

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HFStaticItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameItem, a3);
}

- (HFStaticItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItem, a3);
}

- (HFStaticItem)chooseWallpaperItem
{
  return self->_chooseWallpaperItem;
}

- (void)setChooseWallpaperItem:(id)a3
{
  objc_storeStrong((id *)&self->_chooseWallpaperItem, a3);
}

- (HFStaticItem)wallpaperThumbnailItem
{
  return self->_wallpaperThumbnailItem;
}

- (void)setWallpaperThumbnailItem:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailItem, a3);
}

- (HFStaticItem)wallpaperPickerItem
{
  return self->_wallpaperPickerItem;
}

- (void)setWallpaperPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperPickerItem, a3);
}

- (HFStaticItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (HFZoneModule)zoneModule
{
  return self->_zoneModule;
}

- (void)setZoneModule:(id)a3
{
  objc_storeStrong((id *)&self->_zoneModule, a3);
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void)setRoomBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_roomBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
  objc_storeStrong((id *)&self->_zoneModule, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_wallpaperPickerItem, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailItem, 0);
  objc_storeStrong((id *)&self->_chooseWallpaperItem, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
}

@end
