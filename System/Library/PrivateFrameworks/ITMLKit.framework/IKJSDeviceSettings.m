@implementation IKJSDeviceSettings

- (id)asPrivateIKJSDeviceSettings
{
  IKJSDeviceSettings *v3;

  if (-[IKJSDeviceSettings conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F3718))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSDeviceSettings)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6;
  id v7;
  IKJSDeviceSettings *v8;
  IKJSDeviceSettings *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id restrictionDidChangeToken;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IKJSDeviceSettings;
  v8 = -[IKJSObject initWithAppContext:](&v18, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_deviceConfig, v7);
    +[IKJSRestrictions restrictionsDidChangeNotificationName](IKJSRestrictions, "restrictionsDidChangeNotificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_initWeak(&location, v9);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke;
      v15[3] = &unk_1E9F4CAD8;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v15);
      v12 = objc_claimAutoreleasedReturnValue();
      restrictionDidChangeToken = v9->_restrictionDidChangeToken;
      v9->_restrictionDidChangeToken = (id)v12;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }

  }
  return v9;
}

void __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke_2;
    v8[3] = &unk_1E9F4CB00;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

    objc_destroyWeak(&v10);
  }

}

void __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_restrictionsDidChangeNotification:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_restrictionDidChangeToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_restrictionDidChangeToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)IKJSDeviceSettings;
  -[IKJSDeviceSettings dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)language
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__IKJSDeviceSettings_language__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __30__IKJSDeviceSettings_language__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLanguage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)storefrontCountryCode
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  v12 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__IKJSDeviceSettings_storefrontCountryCode__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __43__IKJSDeviceSettings_storefrontCountryCode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeFrontCountryCode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)preferredVideoFormat
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__IKJSDeviceSettings_preferredVideoFormat__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  -[IKJSDeviceSettings _formatStringForVideoFormat:](self, "_formatStringForVideoFormat:", v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

void __42__IKJSDeviceSettings_preferredVideoFormat__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "preferredVideoFormat");

}

- (NSString)preferredVideoPreviewFormat
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__IKJSDeviceSettings_preferredVideoPreviewFormat__block_invoke;
  v6[3] = &unk_1E9F4B778;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  -[IKJSDeviceSettings _formatStringForVideoFormat:](self, "_formatStringForVideoFormat:", v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

void __49__IKJSDeviceSettings_preferredVideoPreviewFormat__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "preferredVideoPreviewFormat");

}

- (CGSize)screen
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1D96B5DDD;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__IKJSDeviceSettings_screen__block_invoke;
  v8[3] = &unk_1E9F4B778;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v8);

  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

void __28__IKJSDeviceSettings_screen__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screenSize");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

- (IKJSRestrictions)restrictions
{
  IKJSRestrictions *v3;
  void *v4;
  IKJSRestrictions *v5;

  v3 = [IKJSRestrictions alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSObject initWithAppContext:](v3, "initWithAppContext:", v4);

  return v5;
}

- (id)_formatStringForVideoFormat:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SD");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("HD");
}

- (void)_restrictionsDidChangeNotification:(id)a3
{
  id v3;

  v3 = -[IKJSObject invokeMethod:withArguments:](self, "invokeMethod:withArguments:", CFSTR("onRestrictionsChange"), 0);
}

- (IKAppDeviceConfig)deviceConfig
{
  return (IKAppDeviceConfig *)objc_loadWeakRetained((id *)&self->_deviceConfig);
}

- (void)setDeviceConfig:(id)a3
{
  objc_storeWeak((id *)&self->_deviceConfig, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceConfig);
  objc_storeStrong(&self->_restrictionDidChangeToken, 0);
}

@end
