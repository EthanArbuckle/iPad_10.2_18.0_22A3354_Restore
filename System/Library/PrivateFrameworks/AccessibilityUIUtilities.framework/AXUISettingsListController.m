@implementation AXUISettingsListController

- (AXUISettingsListController)init
{
  AXUISettingsListController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  AXUISettingsListController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsListController;
  v2 = -[AXUISettingsSetupCapableListController init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings, (CFStringRef)*MEMORY[0x1E0DDE350], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsListController;
  -[AXUISettingsSetupCapableListController dealloc](&v4, sel_dealloc);
}

- (id)specifierForKey:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXUISettingsListController specifiers](self, "specifiers");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0D808B0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "propertyForKey:", v9, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)setButtonCellStatus:(BOOL)a3 forSpecifier:(id)a4
{
  _BOOL8 v4;
  id v5;

  if (a4)
  {
    v4 = a3;
    objc_msgSend(a4, "propertyForKey:", *MEMORY[0x1E0D80940]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCellEnabled:", v4);

  }
}

@end
