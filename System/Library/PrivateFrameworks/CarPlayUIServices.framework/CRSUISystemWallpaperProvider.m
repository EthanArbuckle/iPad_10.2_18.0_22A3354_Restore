@implementation CRSUISystemWallpaperProvider

- (BOOL)isReady
{
  return 1;
}

- (unint64_t)version
{
  return 11;
}

- (id)displayID
{
  return 0;
}

- (id)wallpapers
{
  return +[CRSUISystemWallpaper wallpapers](CRSUISystemWallpaper, "wallpapers");
}

- (id)defaultWallpapers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[CRSUISystemWallpaper defaultWallpaper](CRSUISystemWallpaper, "defaultWallpaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dynamicAppearanceWallpapersForVehicle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void **v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "previousSystemWallpaperData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CRSUISystemWallpaperProvider loadWallpaperFromData:](self, "loadWallpaperFromData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "traits");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "supportsDynamicAppearance");

      if ((v8 & 1) != 0)
      {
        v16[0] = v6;
        v9 = (void *)MEMORY[0x24BDBCE30];
        v10 = (void **)v16;
LABEL_8:
        objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }

  }
  -[CRSUISystemWallpaperProvider wallpapers](self, "wallpapers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bs_firstObjectPassingTest:", &__block_literal_global_193);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15 = v6;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = &v15;
    goto LABEL_8;
  }
  CRSUILogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[CRSUISystemWallpaperProvider dynamicAppearanceWallpapersForVehicle:].cold.1(v13);

  v12 = (void *)MEMORY[0x24BDBD1A8];
LABEL_12:

  return v12;
}

uint64_t __70__CRSUISystemWallpaperProvider_dynamicAppearanceWallpapersForVehicle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "traits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDynamicAppearance");

  return v3;
}

- (id)loadWallpaperFromData:(id)a3
{
  id v3;
  CRSUISystemWallpaper *v4;
  void *v5;
  CRSUISystemWallpaper *v6;
  NSObject *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [CRSUISystemWallpaper alloc];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CRSUISystemWallpaper initWithIdentifier:](v4, "initWithIdentifier:", v5);

  }
  else
  {
    CRSUILogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[CRSUISystemWallpaperProvider loadWallpaperFromData:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (id)resolveWallpaper:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "resolveWallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CRSUILogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CRSUISystemWallpaperProvider loadWallpaperFromData:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate
{
  return (CRSUIWallpaperDataProvidingDelegate *)objc_loadWeakRetained((id *)&self->dataProviderDelegate);
}

- (void)setDataProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->dataProviderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->dataProviderDelegate);
}

- (void)dynamicAppearanceWallpapersForVehicle:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20D6CC000, log, OS_LOG_TYPE_FAULT, "Missing dynamic appearance wallpapers", v1, 2u);
}

- (void)loadWallpaperFromData:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_20D6CC000, v2, v3, "Unsupported wallpaper type: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_2();
}

@end
