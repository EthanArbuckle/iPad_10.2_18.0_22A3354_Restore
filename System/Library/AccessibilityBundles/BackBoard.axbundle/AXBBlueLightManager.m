@implementation AXBBlueLightManager

- (AXBBlueLightManager)init
{
  AXBBlueLightManager *v2;
  CBClient *v3;
  CBClient *brightnessClient;
  void *v5;
  AXBBlueLightManager *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  AXBBlueLightManager *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXBBlueLightManager;
  v2 = -[AXBBlueLightManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (CBClient *)objc_alloc_init(MEMORY[0x24BE1A2E0]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v3;

    -[CBClient blueLightClient](v2->_brightnessClient, "blueLightClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __27__AXBBlueLightManager_init__block_invoke;
    v10[3] = &unk_250187A68;
    v6 = v2;
    v11 = v6;
    objc_msgSend(v5, "setStatusNotificationBlock:", v10);

    v7 = -[AXBBlueLightManager supportsBlueLightReduction](v6, "supportsBlueLightReduction");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupportsAdvancedDisplayFilters:", v7);

  }
  return v2;
}

void __27__AXBBlueLightManager_init__block_invoke(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  _QWORD v3[4];
  id v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v2 = a2[1];
  v5 = *a2;
  v6 = v2;
  v7 = *((_QWORD *)a2 + 4);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__AXBBlueLightManager_init__block_invoke_2;
  v3[3] = &unk_250187A40;
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __27__AXBBlueLightManager_init__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 41);
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatusNotificationBlock:", 0);

  v4.receiver = self;
  v4.super_class = (Class)AXBBlueLightManager;
  -[AXBBlueLightManager dealloc](&v4, sel_dealloc);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_1);
  return (id)sharedManager_manager;
}

void __36__AXBBlueLightManager_sharedManager__block_invoke()
{
  AXBBlueLightManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXBBlueLightManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (BOOL)supportsBlueLightReduction
{
  void *v2;
  char v3;

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supported");

  return v3;
}

- (void)disableBrightnessFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;

  if (-[AXBBlueLightManager blueLightStatusEnabled](self, "blueLightStatusEnabled"))
  {
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0, 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getBlueLightStatus:", &v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", DWORD1(v9));
    _AXSSetCacheForBrightnessFilter();
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMode:", 0);

    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 0);

  }
  if (-[AXBBlueLightManager adaptationEnabled](self, "adaptationEnabled"))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "getEnabled"));

    _AXSSetCacheForBrightnessFilter();
    -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", 0);

  }
}

- (BOOL)brightnessFiltersEnabled
{
  return -[AXBBlueLightManager blueLightStatusEnabled](self, "blueLightStatusEnabled")
      || -[AXBBlueLightManager adaptationEnabled](self, "adaptationEnabled");
}

- (BOOL)blueLightStatusEnabled
{
  void *v3;
  int v4;
  void *v5;
  BOOL result;
  _BYTE v7[4];
  int v8;

  -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supported");

  result = 0;
  if (v4)
  {
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient", 0, 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getBlueLightStatus:", v7);

    if (self->_blueLightStatusEnabled | v7[1] || v8)
      return 1;
  }
  return result;
}

- (void)restoreCachedBrightnessFilters
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (!_AXSScreenFilterApplied())
  {
    -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supported");

    if (v4)
    {
      if (!-[AXBBlueLightManager blueLightStatusEnabled](self, "blueLightStatusEnabled"))
      {
        v5 = (void *)_AXSCachedValueForBrightnessFilter();
        if (v5)
        {
          v6 = objc_msgSend(v5, "intValue");
          -[CBClient blueLightClient](self->_brightnessClient, "blueLightClient");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setMode:", v6);

        }
      }
      _AXSSetCacheForBrightnessFilter();
    }
    -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supported");

    if (v9)
    {
      if (!-[AXBBlueLightManager adaptationEnabled](self, "adaptationEnabled"))
      {
        v10 = (void *)_AXSCachedValueForBrightnessFilter();
        if (v10)
        {
          v11 = objc_msgSend(v10, "BOOLValue");
          -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setEnabled:", v11);

        }
      }
      _AXSSetCacheForBrightnessFilter();
    }
  }
}

- (BOOL)adaptationEnabled
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supported");

  if (!v4)
    return 0;
  -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getEnabled");

  return v6;
}

- (BOOL)supportsAdaptation
{
  void *v2;
  char v3;

  -[CBClient adaptationClient](self->_brightnessClient, "adaptationClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supported");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end
