@implementation HUHomePodAlarmItemModuleController

- (HUHomePodAlarmItemModuleController)initWithModule:(id)a3
{
  HUHomePodAlarmItemModuleController *v3;
  uint64_t v4;
  NSMapTable *cellToItemMap;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUHomePodAlarmItemModuleController;
  v3 = -[HUItemModuleController initWithModule:](&v8, sel_initWithModule_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    cellToItemMap = v3->_cellToItemMap;
    v3->_cellToItemMap = (NSMapTable *)v4;

    v3->_allowsCellSelection = -[HUHomePodAlarmItemModuleController _shouldAllowCellSelection](v3, "_shouldAllowCellSelection");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__significantTimeChange_, *MEMORY[0x1E0CEB2F8], 0);

  }
  return v3;
}

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUHomePodAlarmItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v10, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9 && !-[HUHomePodAlarmItemModuleController allowsCellSelection](self, "allowsCellSelection"))
  {
    objc_msgSend(v9, "setAccessoryType:", 0);
    objc_msgSend(v9, "setDisabled:", 1);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v11 = a3;
  -[HUHomePodAlarmItemModuleController cellToItemMap](self, "cellToItemMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, v11);

  objc_msgSend(v8, "alarm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "refreshUI:roomName:animated:", v10, 0, v5);
  objc_msgSend(v11, "setDelegate:", self);

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUHomePodAlarmItemModuleController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUHomePodAlarmItemModuleController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alarmItemModuleController:didSelectAlarmItem:", self, v4);

  }
  return 0;
}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v6 = a4;
  -[HUHomePodAlarmItemModuleController cellToItemMap](self, "cellToItemMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "alarm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setEnabled:", v4);
  -[HUItemModuleController module](self, "module");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mobileTimerAdapterForAlarmItem:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "updateAlarm:", v9);

}

- (BOOL)_shouldAllowCellSelection
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hostProcess") == 100)
  {

    return objc_msgSend(MEMORY[0x1E0D319D0], "isDeviceUnlocked");
  }
  objc_msgSend(MEMORY[0x1E0D313C8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostProcess");

  if (v4 == 3)
    return objc_msgSend(MEMORY[0x1E0D319D0], "isDeviceUnlocked");
  return 1;
}

- (void)_significantTimeChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HUHomePodAlarmItemModuleController cellToItemMap](self, "cellToItemMap", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[HUHomePodAlarmItemModuleController cellToItemMap](self, "cellToItemMap", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "alarm");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "refreshUI:roomName:animated:", v14, 0, 0);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (HUHomePodAlarmItemModuleControllerDelegate)delegate
{
  return (HUHomePodAlarmItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsCellSelection
{
  return self->_allowsCellSelection;
}

- (NSMapTable)cellToItemMap
{
  return self->_cellToItemMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellToItemMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
