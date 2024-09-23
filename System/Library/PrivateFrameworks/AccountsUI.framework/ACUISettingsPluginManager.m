@implementation ACUISettingsPluginManager

- (ACUISettingsPluginManager)initWithParentViewController:(id)a3
{
  ACUISettingsPluginManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *pluginCache;
  ACUISettingsPluginManager *v7;
  ACUISettingsPluginManager *v8;
  objc_super v9;
  id location[2];
  ACUISettingsPluginManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ACUISettingsPluginManager;
  v8 = -[ACUISettingsPluginManager init](&v9, sel_init);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    objc_storeWeak((id *)&v11->_parentViewController, location[0]);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pluginCache = v11->_pluginCache;
    v11->_pluginCache = v4;

  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)parentViewControllerWillDisappear
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;
  uint64_t v8;
  id location;
  _QWORD __b[8];
  uint64_t v11;
  id v12[3];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)-[NSMutableDictionary copy](self->_pluginCache, "copy");
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v12[0], "allKeys");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(__b[1] + 8 * v5);
      location = (id)objc_msgSend(v12[0], "objectForKeyedSubscript:", v11, v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(location, "parentControllerWillDisappear");
      objc_storeStrong(&location, 0);
      ++v5;
      v6 = v2;
      if (v3 + 1 >= v2)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v13, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(v12, 0);
}

- (id)mailSettingsPlugin
{
  return -[ACUISettingsPluginManager _settingsPluginFromBundleWithName:](self, "_settingsPluginFromBundleWithName:", CFSTR("MailAccountSettings.bundle"), a2, self);
}

- (id)calendarSettingsPlugin
{
  return -[ACUISettingsPluginManager _settingsPluginFromBundleWithName:](self, "_settingsPluginFromBundleWithName:", CFSTR("MobileCalSettings.bundle"), a2, self);
}

- (id)contactsSettingsPlugin
{
  return -[ACUISettingsPluginManager _settingsPluginFromBundleWithName:](self, "_settingsPluginFromBundleWithName:", CFSTR("ContactsSettings.bundle"), a2, self);
}

- (id)_settingsPluginFromBundleWithName:(id)a3
{
  id v4;
  id v5;
  id location[2];
  ACUISettingsPluginManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](v7->_pluginCache, "objectForKey:", location[0]);
  if (!v5)
  {
    v5 = -[ACUISettingsPluginManager _loadSettingsPluginFromBundleWithName:](v7, "_loadSettingsPluginFromBundleWithName:", location[0]);

    if (v5)
      -[NSMutableDictionary setObject:forKey:](v7->_pluginCache, "setObject:forKey:", v5, location[0]);
  }
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_loadSettingsPluginFromBundleWithName:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  Class v13;
  id v14;
  int v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id location[2];
  ACUISettingsPluginManager *v20;
  id v21;
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = +[ACUIPluginLoader pluginBundleWithName:](ACUIPluginLoader, "pluginBundleWithName:", location[0]);
  if (v18)
  {
    v14 = 0;
    v13 = (Class)objc_msgSend(v18, "principalClass");
    if ((-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &unk_1EFF6F338) & 1) == 1)
    {
      v10 = [v13 alloc];
      WeakRetained = objc_loadWeakRetained((id *)&v20->_parentViewController);
      v3 = (void *)objc_msgSend(v10, "initWithParentController:");
      v4 = v14;
      v14 = v3;

    }
    else if ((-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &unk_1EFF6F398) & 1) == 1)
    {
      v12 = objc_alloc_init(v13);
      v8 = v12;
      v9 = objc_loadWeakRetained((id *)&v20->_parentViewController);
      v5 = (id)objc_msgSend(v8, "settingsPluginWithParent:");
      v6 = v14;
      v14 = v5;

      objc_storeStrong(&v12, 0);
    }
    v21 = v14;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v17 = _ACUILogSystem();
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v22, (uint64_t)"-[ACUISettingsPluginManager _loadSettingsPluginFromBundleWithName:]", 70, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v17, v16, "%s (%d) \"ACUISettingsPluginManager failed to load the requested plugin with name %@\", v22, 0x1Cu);
    }
    objc_storeStrong(&v17, 0);
    v21 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginCache, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end
