@implementation IKJSDevice

- (id)asPrivateIKJSDevice
{
  IKJSDevice *v3;

  if (-[IKJSDevice conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F69E8))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKJSDevice)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6;
  id v7;
  IKJSDevice *v8;
  IKJSDevice *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id networkPropertiesChangedToken;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IKJSDevice;
  v8 = -[IKJSObject initWithAppContext:](&v18, sel_initWithAppContext_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_deviceConfig, v7);
    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke;
    v15[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", CFSTR("IKNetworkPropertiesChangedNotification"), v11, 0, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    networkPropertiesChangedToken = v9->_networkPropertiesChangedToken;
    v9->_networkPropertiesChangedToken = (id)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke_2;
    v9[3] = &unk_1E9F4CB00;
    objc_copyWeak(&v11, v4);
    v8 = v6;
    v10 = v8;
    objc_msgSend(v7, "evaluate:completionBlock:", v9, 0);

    objc_destroyWeak(&v11);
  }

}

void __46__IKJSDevice_initWithAppContext_deviceConfig___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(WeakRetained, "invokeMethod:withArguments:", CFSTR("onNetworkChange"), v3);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_networkPropertiesChangedToken);

  v4.receiver = self;
  v4.super_class = (Class)IKJSDevice;
  -[IKJSDevice dealloc](&v4, sel_dealloc);
}

- (NSString)vendorIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[IKJSObject appContext](self, "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vendorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifierForVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (NSString)appVersion
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)appIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIdentifier"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSDevice deviceConfig](self, "deviceConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__IKJSDevice_appIdentifier__block_invoke;
    v10[3] = &unk_1E9F4B778;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v7, "evaluateDelegateBlockSync:", v10);

  }
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v8;
}

void __27__IKJSDevice_appIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deviceConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)systemVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)model
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)productType
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "getMobileGestaltString:", CFSTR("ProductType"));
}

- (NSNumber)pixelRatio
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)isNetworkReachable
{
  void *v2;
  char v3;

  +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

- (BOOL)isInAirplaneMode
{
  void *v2;
  char v3;

  +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAirplaneModeEnabled");

  return v3;
}

- (BOOL)runningAnInternalBuild
{
  return +[IKUtilites runningAnInternalBuild](IKUtilites, "runningAnInternalBuild");
}

- (NSString)networkType
{
  void *v2;
  void *v3;

  +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)lastNetworkChangedTime
{
  void *v2;
  double v3;
  double v4;

  +[IKNetworkUtilities sharedInstance](IKNetworkUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastNetworkChangedTime");
  v4 = v3;

  return v4;
}

- (BOOL)isInRetailDemoMode
{
  return objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode");
}

- (BOOL)isSeedBuild
{
  return 0;
}

- (id)capacity:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("totalSystemCapacity")) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DE2CD0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("totalSystemAvailable")) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DE2CC8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("totalDataCapacity")) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DE2CB8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("totalDataAvailable")) & 1) != 0)
  {
    v5 = (_QWORD *)MEMORY[0x1E0DE2CB0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("totalDiskCapacity")))
    {
      v6 = 0;
      goto LABEL_12;
    }
    v5 = (_QWORD *)MEMORY[0x1E0DE2CC0];
  }
  objc_msgSend(v4, "objectForKey:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (NSString)osBuildNumber
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "getMobileGestaltString:", CFSTR("BuildVersion"));
}

+ (id)getMobileGestaltString:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
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
  objc_storeStrong(&self->_networkPropertiesChangedToken, 0);
}

@end
