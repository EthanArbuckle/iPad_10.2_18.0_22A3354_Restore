@implementation NTKCompanion1stPartyApp

+ (id)allAppsForDevice:(id)a3
{
  void *v4;

  if ((objc_msgSend(a3, "isRunningGraceOrLater") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "_allApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)complication
{
  return +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", -[NTKCompanion1stPartyApp complicationType](self, "complicationType"));
}

+ (id)appForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "_allApps", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "watchApplicationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v4))
        {

LABEL_13:
          v14 = v10;
          goto LABEL_14;
        }
        objc_msgSend(v10, "containerApplicationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

+ (id)_allApps
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];

  os_unfair_lock_lock((os_unfair_lock_t)&_allApps___lock);
  WeakRetained = objc_loadWeakRetained(&_allApps___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_allApps___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_allApps___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&_allApps___cachedDevice);
    _allApps___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __35__NTKCompanion1stPartyApp__allApps__block_invoke;
    v14[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v14[4] = a1;
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __35__NTKCompanion1stPartyApp__allApps__block_invoke((uint64_t)v14);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = _allApps___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_allApps___lock);
  return (id)_allApps_apps;
}

void __35__NTKCompanion1stPartyApp__allApps__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;
  __int128 v6;
  void *v7;
  _OWORD v8[2];

  v2 = objc_opt_new();
  v3 = (void *)_allApps_apps;
  _allApps_apps = v2;

  for (i = 0; i != 80; i += 4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_OWORD *)&AppInfos[i + 2];
    v8[0] = *(_OWORD *)&AppInfos[i];
    v8[1] = v6;
    objc_msgSend(v5, "companionAppWithAppInfo:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend((id)_allApps_apps, "addObject:", v7);

  }
}

+ (id)companionAppWithAppInfo:(_NTKCompanion1stPartyInfo *)a3
{
  id v4;
  void *v5;
  NTKCompanion1stPartyStocksApp *v6;
  NTKCompanion1stPartyStocksApp *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  NTKCompanion1stPartyApp *v12;
  __int128 v13;
  void *v14;
  void *v15;
  _OWORD v17[2];

  v4 = a3->var0;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
    if (!v5)
    {
      v6 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
  }
  if (a3->var2 == 9)
  {
    v7 = [NTKCompanion1stPartyStocksApp alloc];
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKCompanion1stPartyStocksApp initWithDevice:](v7, "initWithDevice:", v8);

    objc_msgSend(v5, "applicationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInstalled");

    if (v10)
      objc_msgSend(v5, "localizedName");
    else
      NTKCCustomizationLocalizedString(CFSTR("STOCKS_APP_NAME"), (uint64_t)CFSTR("Stocks"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionApp setName:](v6, "setName:", v14);

    NTKImageNamed(a3->var3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanionApp setIcon:](v6, "setIcon:", v15);

  }
  else
  {
    v12 = [NTKCompanion1stPartyApp alloc];
    v13 = *(_OWORD *)&a3->var2;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v13;
    v6 = -[NTKCompanion1stPartyApp initWithAppInfo:](v12, "initWithAppInfo:", v17);
  }

LABEL_12:
  return v6;
}

- (NTKCompanion1stPartyApp)initWithAppInfo:(_NTKCompanion1stPartyInfo *)a3
{
  NTKCompanion1stPartyApp *v4;
  NTKCompanion1stPartyApp *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCompanion1stPartyApp;
  v4 = -[NTKCompanion1stPartyApp init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[NTKCompanionApp setContainerApplicationIdentifier:](v4, "setContainerApplicationIdentifier:", a3->var0);
    -[NTKCompanionApp setWatchApplicationIdentifier:](v5, "setWatchApplicationIdentifier:", a3->var1);
    -[NTKCompanion1stPartyApp setComplicationType:](v5, "setComplicationType:", a3->var2);
    if (-[NTKCompanion1stPartyApp complicationType](v5, "complicationType") == 8)
    {
      NTKCCustomizationLocalizedString(CFSTR("CALENDAR_APP_NAME"), (uint64_t)CFSTR("Calendar"), v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[NTKCompanion1stPartyApp complicationType](v5, "complicationType") == 9)
      {
LABEL_7:
        -[NTKCompanion1stPartyApp setIconName:](v5, "setIconName:", a3->var3);
        return v5;
      }
      NTKComplicationTypeLocalizedLabelText(-[NTKCompanion1stPartyApp complicationType](v5, "complicationType"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    -[NTKCompanionApp setName:](v5, "setName:", v7);

    goto LABEL_7;
  }
  return v5;
}

- (id)icon
{
  UIImage *icon;
  void *v4;

  icon = self->_icon;
  if (!icon)
  {
    NTKImageNamed(self->_iconName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCompanion1stPartyApp setIcon:](self, "setIcon:", v4);

    icon = self->_icon;
  }
  return icon;
}

+ (BOOL)complicationType:(unint64_t)a3 mapsToRemovedSystemAppOnDevice:(id)a4
{
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;

  if ((objc_msgSend(a4, "isRunningGraceOrLater") & 1) != 0)
    return 0;
  v5 = 0;
  while (AppInfos[v5 + 2] != (__CFString *)a3)
  {
    v5 += 4;
    if (v5 == 80)
      return 0;
  }
  v6 = AppInfos[v5];
  if (!v6)
    return 0;
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
  objc_msgSend(v8, "applicationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInstalled");
  v11 = v10 ^ 1;

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openApplicationWithBundleID:", v7);

  }
  return v11;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
