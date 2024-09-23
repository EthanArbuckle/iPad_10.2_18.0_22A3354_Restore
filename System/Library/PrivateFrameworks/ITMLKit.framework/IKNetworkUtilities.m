@implementation IKNetworkUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_33);
  return (id)sharedInstance_sharedInstance;
}

void __36__IKNetworkUtilities_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (IKNetworkUtilities)init
{
  IKNetworkUtilities *v2;
  id v3;
  uint64_t v4;
  RadiosPreferences *radioPrefs;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id isNetworkTypeChangedToken;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id networkReachabilityChangedToken;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)IKNetworkUtilities;
  v2 = -[IKNetworkUtilities init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CFA9B8]);
    v4 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v4;

    -[RadiosPreferences setDelegate:](v2->_radioPrefs, "setDelegate:", v2);
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DDC138];
    v9 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __26__IKNetworkUtilities_init__block_invoke;
    v20[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v8, v7, 0, v20);
    v10 = objc_claimAutoreleasedReturnValue();
    isNetworkTypeChangedToken = v2->_isNetworkTypeChangedToken;
    v2->_isNetworkTypeChangedToken = (id)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DDC130];
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __26__IKNetworkUtilities_init__block_invoke_2;
    v18[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", v14, v13, 0, v18);
    v15 = objc_claimAutoreleasedReturnValue();
    networkReachabilityChangedToken = v2->_networkReachabilityChangedToken;
    v2->_networkReachabilityChangedToken = (id)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__IKNetworkUtilities_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyObservers");
    WeakRetained = v2;
  }

}

void __26__IKNetworkUtilities_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_notifyObservers");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RadiosPreferences setDelegate:](self->_radioPrefs, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_isNetworkTypeChangedToken);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_networkReachabilityChangedToken);

  v5.receiver = self;
  v5.super_class = (Class)IKNetworkUtilities;
  -[IKNetworkUtilities dealloc](&v5, sel_dealloc);
}

- (BOOL)isNetworkReachable
{
  void *v2;
  unsigned int v3;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "networkReachabilityFlags") >> 1) & 1;

  return v3;
}

- (BOOL)isAirplaneModeEnabled
{
  return -[RadiosPreferences airplaneMode](self->_radioPrefs, "airplaneMode");
}

- (NSString)networkType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");
  if (NetworkTypeString_onceToken != -1)
    dispatch_once(&NetworkTypeString_onceToken, &__block_literal_global_44);
  v4 = (void *)NetworkTypeString_networkTypeDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return (NSString *)v9;
}

- (double)lastNetworkChangedTime
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastNetworkTypeChangeTime");
  v4 = v3;

  return v4;
}

- (void)_notifyObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IKNetworkUtilities isNetworkReachable](self, "isNetworkReachable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v3, CFSTR("isNetworkReachable"));

  if (+[IKUtilites isAppTrusted](IKUtilites, "isAppTrusted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IKNetworkUtilities isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("isInAirplaneMode"));

    -[IKNetworkUtilities networkType](self, "networkType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, CFSTR("NetworkType"));

    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[IKNetworkUtilities lastNetworkChangedTime](self, "lastNetworkChangedTime");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("LastNetworkChangedTime"));

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("IKNetworkPropertiesChangedNotification"), self, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPrefs, 0);
  objc_storeStrong(&self->_networkReachabilityChangedToken, 0);
  objc_storeStrong(&self->_isNetworkTypeChangedToken, 0);
}

@end
