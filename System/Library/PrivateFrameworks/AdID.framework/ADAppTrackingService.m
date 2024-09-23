@implementation ADAppTrackingService

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ADAppTrackingService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_2 != -1)
    dispatch_once(&sharedInstance__onceToken_2, block);
  return (id)sharedInstance__instance_2;
}

void __38__ADAppTrackingService_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance_2;
  sharedInstance__instance_2 = (uint64_t)v0;

}

- (ADAppTrackingService)init
{
  ADAppTrackingService *v2;
  uint64_t v3;
  NSXPCListener *listener;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ADAppTrackingService;
  v2 = -[ADAppTrackingService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.ap.adprivacyd.opt-out"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.iad.opt-in-control"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EEB358);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_5);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_34);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Accepted connection from ADTrackingTransparency client."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    objc_msgSend(v5, "resume");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Rejected ADTrackingTransparency connection client with PID %d lacking the appropriate entitlement (%@)."), objc_msgSend(v5, "processIdentifier"), CFSTR("com.apple.private.iad.opt-in-control"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  return v7;
}

void __59__ADAppTrackingService_listener_shouldAcceptNewConnection___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC connection invalidated. Lost connection from ADTrackingTransparency client."));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

void __59__ADAppTrackingService_listener_shouldAcceptNewConnection___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("XPC connection interrupted. Lost connection from ADTrackingTransparency client."));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _ADLog();

}

- (void)sendPersonalizedAdsAndReconcileDataForRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__ADAppTrackingService_sendPersonalizedAdsAndReconcileDataForRecord___block_invoke;
  v6[3] = &unk_24D710CB8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "sendPersonalizedAdsStatusToAdPlatforms:", v6);

}

uint64_t __69__ADAppTrackingService_sendPersonalizedAdsAndReconcileDataForRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There was an sending Personalized Ads to Ad Platforms. Error: %@. Please file a radar."), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
  return objc_msgSend(*(id *)(a1 + 32), "reconcileDataForRecord:", *(_QWORD *)(a1 + 40));
}

- (void)reconcileDataForRecord:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteRecords:", &__block_literal_global_43);

}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "iTunesAccountDSID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDSID:completionHandler:", v1, &__block_literal_global_45);

}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reconcile:", &__block_literal_global_47);

}

void __47__ADAppTrackingService_reconcileDataForRecord___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There was an error reconciling. Error: %@. Please file a radar."), a2);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();

  }
}

- (void)setPersonalizedAds:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, uint64_t);

  v4 = a3;
  v13 = (void (**)(id, uint64_t))a4;
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPersonalizedAdsEnabled");
    objc_msgSend(v6, "setIsPersonalizedAdsEnabled:", v4);
    objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeDSIDRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "personalizedAdsTimestamp"))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPersonalizedAdsTimestamp:", objc_msgSend(v10, "AD_toServerTime"));

    }
    if (v7 != v4)
    {
      objc_msgSend(v8, "incrementMonthlyResetCount");
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Personalized Ads has been toggled. Device is going from OPTED IN to OPTED OUT."));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        -[ADAppTrackingService sendPersonalizedAdsAndReconcileDataForRecord:](self, "sendPersonalizedAdsAndReconcileDataForRecord:", v9);
        objc_msgSend(MEMORY[0x24BE7A778], "removeAll");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Personalized Ads has been toggled. Device is going from OPTED OUT to OPTED IN."));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog();

        -[ADAppTrackingService reconcileDataForRecord:](self, "reconcileDataForRecord:", v9);
      }
    }
    v13[2](v13, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] ERROR: completion block not passed in"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }

}

- (void)getAccountLevelSwitchDisabledReasonWithHandler:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDSIDRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "accountIsU13") & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "accountIsU18") & 1) != 0)
  {
    v5 = 2;
  }
  else if (objc_msgSend(v4, "accountAgeUnknown"))
  {
    v5 = 5;
  }
  else
  {
    v5 = 0;
  }
  v6[2](v6, v5);

}

- (void)shouldDisplayPersonalizedAdsUI:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  if (MGGetBoolAnswer()
    && (objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ForceNonAdLocale")),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Ad Enabled Locality is forced OFF by internal default."), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v8[2](v8, 0);
  }
  else
  {
    +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isNewsOrStocksEnabledLocality") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "isSearchAdsEnabled");
    v8[2](v8, v7);

  }
}

- (void)shouldAppStoreDisplayAdvertisingScreen:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  if (MGGetBoolAnswer()
    && (objc_msgSend(MEMORY[0x24BE021B0], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ForceNonAdLocale")),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]: Ad Enabled Locality is forced OFF by internal default."), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog();

    v7[2](v7, 0);
  }
  else
  {
    +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, objc_msgSend(v6, "isSearchAdsEnabled"));

  }
}

- (void)latestPersonalizedAdsConsentVersion:(id)a3
{
  void (**v3)(id, uint64_t);
  id v4;

  v3 = (void (**)(id, uint64_t))a3;
  +[ADAdTrackingSchedulingManager sharedInstance](ADAdTrackingSchedulingManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, objc_msgSend(v4, "latestPersonalizedConsentVersion"));

}

- (void)iTunesAccountStorefront:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  void (**v8)(id, __CFString *);

  v8 = (void (**)(id, __CFString *))a3;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDSIDRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaceholderAccount");

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("NONE");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iTunesStorefront");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
    v8[2](v8, v6);

}

- (void)localAdServicesEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  int v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE021D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDSIDRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPlaceholderAccount"))
  {
    v10[2](v10, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE021B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "accountIsU13");
    v7 = objc_msgSend(v5, "isManagedAppleID");
    v8 = objc_msgSend(v5, "educationModeEnabled");
    if ((v6 & 1) != 0 || (v7 & 1) != 0 || v8)
    {
      v10[2](v10, 0);
    }
    else
    {
      objc_msgSend(v5, "iTunesStorefront");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, objc_msgSend(v9, "containsString:", CFSTR("143441")));

    }
  }

}

- (void)deviceRegionEnabledPerStorefront:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(&unk_24D718EE8, "containsObject:", v4);
  if (v6)
    v6[2](v6, v5);

}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)requestInFlight
{
  return self->_requestInFlight;
}

- (void)setRequestInFlight:(BOOL)a3
{
  self->_requestInFlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
