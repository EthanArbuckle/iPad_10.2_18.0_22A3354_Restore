@implementation MKSystemController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MKSystemController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE2DBA0 != -1)
    dispatch_once(&qword_1ECE2DBA0, block);
  return (id)qword_1ECE2DB98;
}

- (int)userInterfaceIdiom
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return dword_18B2A9F58[v3 - 1];
}

- (double)screenScale
{
  void *v2;
  double v3;
  void *v4;
  CFTypeID v5;
  float v6;

  v2 = (void *)MGCopyAnswer();
  v3 = 1.0;
  if (v2)
  {
    v4 = v2;
    v5 = CFGetTypeID(v2);
    if (v5 == CFNumberGetTypeID())
    {
      objc_msgSend(v4, "floatValue");
      v3 = v6;
    }
    CFRelease(v4);
  }
  if (v3 <= 0.0)
    return 1.0;
  else
    return v3;
}

- (BOOL)supportsPitchAPI
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mapsFeatureFreedomEnabled");

  return (v4 & 1) != 0 || -[MKSystemController supports3DMaps](self, "supports3DMaps");
}

- (BOOL)supports3DMaps
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapsFeatureFreedomEnabled");

  if ((v3 & 1) != 0)
    return 1;
  if (qword_1ECE2DBB0 != -1)
    dispatch_once(&qword_1ECE2DBB0, &__block_literal_global_28_1);
  return byte_1ECE2DB69 != 0;
}

- (BOOL)requiresRTT
{
  return !-[MKSystemController supports3DMaps](self, "supports3DMaps");
}

void __36__MKSystemController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECE2DB98;
  qword_1ECE2DB98 = (uint64_t)v1;

}

uint64_t __45__MKSystemController_supportsAlwaysOnCompass__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_153 = result;
  return result;
}

uint64_t __36__MKSystemController_supports3DMaps__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECE2DB69 = result;
  return result;
}

uint64_t __39__MKSystemController_overrideBlurStyle__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECE2DB6C = result ^ 1;
  return result;
}

- (BOOL)supportsAlwaysOnCompass
{
  if (qword_1ECE2DBA8 != -1)
    dispatch_once(&qword_1ECE2DBA8, &__block_literal_global_60);
  return _MergedGlobals_153;
}

- (BOOL)overrideBlurStyle
{
  if (qword_1ECE2DBC8 != -1)
    dispatch_once(&qword_1ECE2DBC8, &__block_literal_global_49);
  return byte_1ECE2DB6C;
}

- (BOOL)isWifiEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiEnabled");

  return v3;
}

- (BOOL)isDevicePluggedIn
{
  uint64_t v3;
  int out_token;

  out_token = 0;
  notify_register_check("com.apple.springboard.pluggedin", &out_token);
  v3 = 0;
  notify_get_state(out_token, &v3);
  notify_cancel(out_token);
  return v3 != 0;
}

- (BOOL)isPhone6PlusOrLarger
{
  double v4;
  double v5;

  if (-[MKSystemController userInterfaceIdiom](self, "userInterfaceIdiom"))
    return 0;
  -[MKSystemController screenSize](self, "screenSize");
  return v5 > 667.0 || v4 > 667.0;
}

- (CGSize)screenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isHiDPI
{
  double v2;

  -[MKSystemController screenScale](self, "screenScale");
  return v2 > 1.0;
}

- (BOOL)isInternalInstall
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  return v3;
}

- (BOOL)supports3DImagery
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapsFeatureFreedomEnabled");

  if ((v3 & 1) != 0)
    return 1;
  if (qword_1ECE2DBB8 != -1)
    dispatch_once(&qword_1ECE2DBB8, &__block_literal_global_31);
  return byte_1ECE2DB6A != 0;
}

uint64_t __39__MKSystemController_supports3DImagery__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECE2DB6A = result;
  return result;
}

- (BOOL)reduceMotionEnabled
{
  return _AXSReduceMotionEnabled() != 0;
}

- (id)_defaultOpenURLOptions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v7 = v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isInSpotlight
{
  if (qword_1ECE2DBC0 != -1)
    dispatch_once(&qword_1ECE2DBC0, &__block_literal_global_37);
  return byte_1ECE2DB6B;
}

void __36__MKSystemController__isInSpotlight__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECE2DB6B = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

}

- (BOOL)_shouldUseLaunchServices
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3
      || (_UIApplicationIsExtension() & 1) != 0
      || -[MKSystemController _isInSpotlight](self, "_isInSpotlight")
      || -[MKSystemController _isRunningInLockScreen](self, "_isRunningInLockScreen");
}

- (BOOL)_isRunningInLockScreen
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = *MEMORY[0x1E0CEC398];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "session");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v7))
        {
          if (!objc_msgSend(v9, "activationState"))
          {

LABEL_15:
            v13 = 1;
            goto LABEL_16;
          }
          v12 = objc_msgSend(v9, "activationState");

          if (v12 == 1)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)openURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "openURL:completionHandler:", v4, 0);
  }
  else if (-[MKSystemController _shouldUseLaunchServices](self, "_shouldUseLaunchServices")
         || (objc_msgSend((id)*MEMORY[0x1E0CEB258], "openURL:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKSystemController _defaultOpenURLOptions](self, "_defaultOpenURLOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "openURL:withOptions:error:", v4, v9, 0);

    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)openURL:(id)a3 fromScene:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (objc_class *)MEMORY[0x1E0CA5938];
    v11 = a3;
    v12 = objc_alloc_init(v10);
    objc_msgSend(v8, "_currentOpenApplicationEndpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTargetConnectionEndpoint:", v13);

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__MKSystemController_openURL_fromScene_completionHandler___block_invoke;
    v15[3] = &unk_1E20DB6F0;
    v16 = v9;
    objc_msgSend(v14, "openURL:configuration:completionHandler:", v11, v12, v15);

  }
  else
  {
    v12 = a3;
    -[MKSystemController openURL:completionHandler:](self, "openURL:completionHandler:", v12, v9);
  }

}

uint64_t __58__MKSystemController_openURL_fromScene_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "openURL:completionHandler:", v6, v7);
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__MKSystemController_openURL_completionHandler___block_invoke;
    v18[3] = &unk_1E20DB718;
    v18[4] = self;
    v11 = v7;
    v19 = v11;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v18);
    if (-[MKSystemController _shouldUseLaunchServices](self, "_shouldUseLaunchServices"))
    {
      ((void (**)(_QWORD, id))v12)[2](v12, v6);
    }
    else
    {
      v13 = (void *)*MEMORY[0x1E0CEB258];
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_4;
      v14[3] = &unk_1E20DB740;
      v16 = v11;
      v17 = v12;
      v15 = v6;
      objc_msgSend(v13, "openURL:withCompletionHandler:", v15, v14);

    }
  }

}

void __48__MKSystemController_openURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_2;
  v9[3] = &unk_1E20D9040;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  v6 = v3;
  v7 = (void *)MEMORY[0x18D778DB8](v9);
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v7);

}

void __48__MKSystemController_openURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_defaultOpenURLOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "openURL:withOptions:", v3, v4);

  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__MKSystemController_openURL_completionHandler___block_invoke_3;
    v7[3] = &unk_1E20DAAF8;
    v8 = v6;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __48__MKSystemController_openURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __48__MKSystemController_openURL_completionHandler___block_invoke_4(_QWORD *a1, int a2)
{
  uint64_t result;

  if (!a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4]);
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)placeDialRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isValid"))
  {
    v15 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v7 = off_1ECE2DB90;
    v19 = off_1ECE2DB90;
    if (off_1ECE2DB90)
      goto LABEL_8;
    v20 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v7 = (void *)qword_1ECE2DB88;
    v24 = qword_1ECE2DB88;
    if (!qword_1ECE2DB88)
    {
      v25 = xmmword_1E20DB6A8;
      v26 = *(_OWORD *)&off_1E20DB6B8;
      v8 = _sl_dlopen();
      v9 = v22;
      v22[3] = v8;
      qword_1ECE2DB88 = v8;
      v7 = (void *)v9[3];
    }
    _Block_object_dispose(&v21, 8);
    v10 = v20;
    if (!v7)
    {
      v10 = (void *)abort_report_np();
      goto LABEL_16;
    }
    if (v20)
      goto LABEL_17;
    while (1)
    {
      v7 = dlsym(v7, "SBSGetScreenLockStatus");
      v17[3] = (uint64_t)v7;
      off_1ECE2DB90 = v7;
LABEL_8:
      _Block_object_dispose(&v16, 8);
      if (v7)
        break;
      dlerror();
      v10 = (void *)abort_report_np();
LABEL_16:
      __break(1u);
LABEL_17:
      free(v10);
    }
    if (((unsigned int (*)(char *))v7)(&v15) && v15)
      objc_msgSend(v5, "setShowUIPrompt:", 0);
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke;
    block[3] = &unk_1E20D8238;
    v13 = v5;
    v14 = v6;
    dispatch_async(v11, block);

  }
}

void __57__MKSystemController_placeDialRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getTUCallCenterClass_softClass;
  v14 = getTUCallCenterClass_softClass;
  if (!getTUCallCenterClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getTUCallCenterClass_block_invoke;
    v10[3] = &unk_1E20D8078;
    v10[4] = &v11;
    __getTUCallCenterClass_block_invoke((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v3 = v2;
  _Block_object_dispose(&v11, 8);
  v4 = (void *)objc_msgSend(objc_alloc((Class)v3), "initWithQueue:", 0);
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7 = v4;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_2;
    v8[3] = &unk_1E20D9AF8;
    v9 = v5;
    objc_msgSend(v7, "launchAppForDialRequest:completion:", v6, v8);

  }
  else
  {
    objc_msgSend(v4, "launchAppForDialRequest:completion:", v6, 0);

  }
}

void __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E20D7F70;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __57__MKSystemController_placeDialRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)openURL:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_openURLDelegate);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "openURL:bundleIdentifier:completionHandler:", v8, v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationToOpenResource:usingApplication:userInfo:", v8, v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = MEMORY[0x1E0C809B0];
      if (v10)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke;
        v19[3] = &unk_1E20D7EF8;
        v20 = v10;
        objc_msgSend(v14, "setCompletionBlock:", v19);

      }
      dispatch_get_global_queue(25, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_3;
      v17[3] = &unk_1E20D7D98;
      v18 = v14;
      dispatch_async(v16, v17);

    }
    else if (v10)
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }

  }
}

void __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_1E20D7EF8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__MKSystemController_openURL_bundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)openUserActivity:(id)a3 withApplicationRecord:(id)a4 requireOptionKeyPromptUnlockDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v19[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrontBoardOptions:", v13);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__MKSystemController_openUserActivity_withApplicationRecord_requireOptionKeyPromptUnlockDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E20DB768;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v10, v9, v11, v16);

}

uint64_t __114__MKSystemController_openUserActivity_withApplicationRecord_requireOptionKeyPromptUnlockDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)shouldCaptureMapViewGestureAnalytics
{
  if (qword_1ECE2DBD0 != -1)
    dispatch_once(&qword_1ECE2DBD0, &__block_literal_global_52);
  return byte_1ECE2DB6D;
}

void __58__MKSystemController_shouldCaptureMapViewGestureAnalytics__block_invoke()
{
  unint64_t v0;
  NSObject *v1;
  int *v2;
  char *v3;
  size_t v4;
  unint64_t v5;
  uint8_t buf[4];
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 8;
  v5 = 0;
  if (sysctlbyname("hw.memsize", &v5, &v4, 0, 0) < 0)
  {
    GEOFindOrCreateLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v2 = __error();
      v3 = strerror(*v2);
      *(_DWORD *)buf = 136315138;
      v7 = v3;
      _os_log_impl(&dword_18B0B0000, v1, OS_LOG_TYPE_ERROR, "sysctlbyname failed with err : %s", buf, 0xCu);
    }

  }
  else
  {
    v5 >>= 20;
    v0 = v5;
    byte_1ECE2DB6D = v0 > GEOConfigGetInteger();
  }
}

- (MKSystemControllerOpenURLDelegate)openURLDelegate
{
  return (MKSystemControllerOpenURLDelegate *)objc_loadWeakRetained((id *)&self->_openURLDelegate);
}

- (void)setOpenURLDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_openURLDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_openURLDelegate);
}

@end
