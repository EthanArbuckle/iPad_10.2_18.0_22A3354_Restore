@implementation AXAuditDeviceSettingsManager

- (AXAuditDeviceSettingsManager)init
{
  AXAuditDeviceSettingsManager *v2;
  AXAuditDeviceSettingsManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXAuditDeviceSettingsManager;
  v2 = -[AXAuditDeviceSettingsManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXAuditDeviceSettingsManager updateCurrentValueForAllSettingsAndPostNotificationIfChanged:](v2, "updateCurrentValueForAllSettingsAndPostNotificationIfChanged:", 1);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AXAuditDeviceSettingsManager stopObservingChanges](self, "stopObservingChanges");
  v3.receiver = self;
  v3.super_class = (Class)AXAuditDeviceSettingsManager;
  -[AXAuditDeviceSettingsManager dealloc](&v3, sel_dealloc);
}

- (void)startObservingChanges
{
  -[AXAuditDeviceSettingsManager updateCurrentValueForAllSettingsAndPostNotificationIfChanged:](self, "updateCurrentValueForAllSettingsAndPostNotificationIfChanged:", 1);
}

- (void)cacheDeviceSettingsValues
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[AXAuditDeviceSettingsManager settingsToCache](self, "settingsToCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "copy", (_QWORD)v12);
        -[AXAuditDeviceSettingsManager updateCurrentValueForSetting:postNotificationIfChanged:](self, "updateCurrentValueForSetting:postNotificationIfChanged:", v10, 0);
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[AXAuditDeviceSettingsManager set_cachedSettings:](self, "set_cachedSettings:", v4);
}

- (void)restoreDeviceSettingsValues
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[AXAuditDeviceSettingsManager deviceSettingsCanBeRestored](self, "deviceSettingsCanBeRestored"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[AXAuditDeviceSettingsManager _cachedSettings](self, "_cachedSettings", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v8, "currentValueNumber");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXAuditDeviceSettingsManager updateSetting:withNumberValue:](self, "updateSetting:withNumberValue:", v8, v9);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)updateCurrentValueForAllSettingsAndPostNotificationIfChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXAuditDeviceSettingsManager settings](self, "settings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AXAuditDeviceSettingsManager updateCurrentValueForSetting:postNotificationIfChanged:](self, "updateCurrentValueForSetting:postNotificationIfChanged:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)settingForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXAuditDeviceSettingsManager settings](self, "settings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)resetToDefaultAccessibilitySettings
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXAuditDeviceSettingsManager defaultSettings](self, "defaultSettings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "currentValueNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAuditDeviceSettingsManager updateSetting:withNumberValue:](self, "updateSetting:withNumberValue:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[AXAuditDeviceSettingsManager cacheDeviceSettingsValues](self, "cacheDeviceSettingsValues");
  -[AXAuditDeviceSettingsManager updateCurrentValueForAllSettingsAndPostNotificationIfChanged:](self, "updateCurrentValueForAllSettingsAndPostNotificationIfChanged:", 1);
}

- (void)updateSetting:(id)a3 withNumberValue:(id)a4
{
  if (!-[AXAuditDeviceSettingsManager deviceSettingsCanBeRestored](self, "deviceSettingsCanBeRestored", a3, a4))
    -[AXAuditDeviceSettingsManager cacheDeviceSettingsValues](self, "cacheDeviceSettingsValues");
  -[AXAuditDeviceSettingsManager setDeviceSettingsCanBeRestored:](self, "setDeviceSettingsCanBeRestored:", 1);
}

- (AXAuditDeviceSettingsManagerDelegate)delegate
{
  return (AXAuditDeviceSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (BOOL)deviceSettingsCanBeRestored
{
  return self->_deviceSettingsCanBeRestored;
}

- (void)setDeviceSettingsCanBeRestored:(BOOL)a3
{
  self->_deviceSettingsCanBeRestored = a3;
}

- (int64_t)hostAPIVersion
{
  return self->_hostAPIVersion;
}

- (void)setHostAPIVersion:(int64_t)a3
{
  self->_hostAPIVersion = a3;
}

- (NSArray)_cachedSettings
{
  return self->__cachedSettings;
}

- (void)set_cachedSettings:(id)a3
{
  objc_storeStrong((id *)&self->__cachedSettings, a3);
}

- (NSArray)defaultSettings
{
  return self->_defaultSettings;
}

- (void)setDefaultSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSettings, 0);
  objc_storeStrong((id *)&self->__cachedSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
