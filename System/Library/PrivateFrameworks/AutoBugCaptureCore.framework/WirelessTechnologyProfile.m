@implementation WirelessTechnologyProfile

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  return (id)sharedInstance_sharedProfile;
}

void __43__WirelessTechnologyProfile_sharedInstance__block_invoke()
{
  WirelessTechnologyProfile *v0;
  void *v1;

  v0 = objc_alloc_init(WirelessTechnologyProfile);
  v1 = (void *)sharedInstance_sharedProfile;
  sharedInstance_sharedProfile = (uint64_t)v0;

}

- (WirelessTechnologyProfile)init
{
  WirelessTechnologyProfile *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSString *regulatoryDomainCountry;
  NSString *homeCarrier;
  CTXPCServiceSubscriptionContext *dataContext;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  WirelessTechnologyProfile *v16;
  _QWORD handler[4];
  id v19;
  id location;
  int out_token;
  objc_super v22;
  uint8_t buf[4];
  uint32_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)WirelessTechnologyProfile;
  v2 = -[WirelessTechnologyProfile init](&v22, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.autobugcapture.wirelesstechnologyprofile", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    regulatoryDomainCountry = v2->_regulatoryDomainCountry;
    v2->_regulatoryDomainCountry = (NSString *)CFSTR("Unknown");

    homeCarrier = v2->_homeCarrier;
    v2->_homeCarrier = (NSString *)CFSTR("Unknown");

    dataContext = v2->_dataContext;
    v2->_dataContext = 0;

    out_token = -1;
    objc_initWeak(&location, v2);
    v9 = (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x1E0D842B8]), "UTF8String");
    v10 = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__WirelessTechnologyProfile_init__block_invoke;
    handler[3] = &unk_1EA3B55F8;
    objc_copyWeak(&v19, &location);
    v11 = notify_register_dispatch(v9, &out_token, v10, handler);
    if (v11)
    {
      symptomsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v24 = v11;
        _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Failed to register for regulatory domain update notification: %u", buf, 8u);
      }

    }
    v2->_regulatoryDomainUpdateNotificationToken = out_token;
    +[WirelessTechnologyProfile fetchRegulatoryDomainCountry](WirelessTechnologyProfile, "fetchRegulatoryDomainCountry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WirelessTechnologyProfile setRegulatoryDomainCountry:](v2, "setRegulatoryDomainCountry:", v13);

    +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addDelegate:", v2);

    -[WirelessTechnologyProfile fetchHomeCarrier](v2, "fetchHomeCarrier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WirelessTechnologyProfile setHomeCarrier:](v2, "setHomeCarrier:", v15);

    v16 = v2;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __33__WirelessTechnologyProfile_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint8_t v5[16];

  symptomsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Received notification for regulatory domain country, updating value", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[WirelessTechnologyProfile fetchRegulatoryDomainCountry](WirelessTechnologyProfile, "fetchRegulatoryDomainCountry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setRegulatoryDomainCountry:", v4);

  }
}

- (void)dealloc
{
  int regulatoryDomainUpdateNotificationToken;
  objc_super v4;

  regulatoryDomainUpdateNotificationToken = self->_regulatoryDomainUpdateNotificationToken;
  if (regulatoryDomainUpdateNotificationToken != -1)
    notify_cancel(regulatoryDomainUpdateNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)WirelessTechnologyProfile;
  -[WirelessTechnologyProfile dealloc](&v4, sel_dealloc);
}

+ (id)fetchRegulatoryDomainCountry
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (!fetchRegulatoryDomainCountry_enUSLocale)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
    v3 = (void *)fetchRegulatoryDomainCountry_enUSLocale;
    fetchRegulatoryDomainCountry_enUSLocale = v2;

  }
  objc_msgSend(MEMORY[0x1E0D842B0], "lastKnownEstimates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)fetchRegulatoryDomainCountry_enUSLocale, "localizedStringForCountryCode:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v8 = v7;
        v9 = (__CFString *)v8;
LABEL_16:

        goto LABEL_17;
      }
      symptomsLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no localized string", v12, 2u);
      }

    }
    else
    {
      symptomsLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no ISO code", v13, 2u);
      }
    }
    v9 = CFSTR("Unknown");
    goto LABEL_16;
  }
  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Error while fetching regulatory domain country: no estimates", buf, 2u);
  }
  v9 = CFSTR("Unknown");
LABEL_17:

  return v9;
}

+ (id)fetchFormattedHomeCarrierNameForContext:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1EA3D0128);
    v5 = (void *)fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames;
    fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames = v4;

  }
  +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 1);
  v24 = 0;
  v8 = (void *)objc_msgSend(v6, "copyCarrierBundleValue:key:bundleType:error:", v3, CFSTR("CarrierName"), v7, &v24);
  v9 = v24;

  if (!v9)
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v10, "getEnglishCarrierNameFor:error:", v8, &v23);
        v11 = objc_claimAutoreleasedReturnValue();
        v9 = v23;

        if (v9 || !v11)
        {
          symptomsLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_ERROR, "Error fetching english carrier name: %@", buf, 0xCu);
          }
        }
        else if (objc_msgSend((id)fetchFormattedHomeCarrierNameForContext__sInvalidCarrierNames, "containsObject:", v11))
        {
          symptomsLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v11;
            _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_INFO, "Carrier name invalid: %@", buf, 0xCu);
          }
          v9 = 0;
        }
        else
        {
          +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6D00]), "initWithBundleType:", 5);
          v22 = 0;
          v12 = objc_msgSend(v14, "copyCarrierBundleValue:key:bundleType:error:", v3, CFSTR("ISOAlpha2CountryCode"), v15, &v22);
          v9 = v22;

          if (!v9)
          {
            if (v12)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v12 = v12;
                if (-[NSObject count](v12, "count"))
                {
                  -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0);
                  v16 = objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v17 = v16;
                    if (-[NSObject length](v17, "length") == 2)
                    {
                      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
                      -[NSObject uppercaseString](v17, "uppercaseString");
                      v19 = objc_claimAutoreleasedReturnValue();
                      v13 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@ %@"), v11, v19);
                    }
                    else
                    {
                      symptomsLogHandle();
                      v19 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_ERROR, "Country code has unexpected length", buf, 2u);
                      }
                      v13 = 0;
                    }

                  }
                  else
                  {
                    symptomsLogHandle();
                    v17 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1DBAE1000, v17, OS_LOG_TYPE_ERROR, "Country code is not a string", buf, 2u);
                    }
                    v13 = 0;
                  }

                }
                else
                {
                  symptomsLogHandle();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DBAE1000, v16, OS_LOG_TYPE_ERROR, "Country codes from bundle are empty", buf, 2u);
                  }
                  v13 = 0;
                }

                goto LABEL_28;
              }
            }
          }
          symptomsLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "Error fetching country code from bundle: %@", buf, 0xCu);
          }

        }
        v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
  }
  symptomsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Error fetching carrier name from bundle: %@", buf, 0xCu);
  }
  v13 = 0;
LABEL_29:

  return v13;
}

+ (id)fetchMCCMNCHomeCarrierNameForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = (void *)objc_msgSend(v4, "copyMobileCountryCode:error:", v3, &v14);
  v6 = v14;

  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    symptomsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch MCC: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "copyMobileNetworkCode:error:", v3, &v13);
  v6 = v13;

  if (v6 || !v9)
  {
    symptomsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch MNC: %@", buf, 0xCu);
    }

LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown (mcc=%@, mnc=%@)"), v5, v9);
LABEL_15:

  return v10;
}

- (id)fetchHomeCarrier
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[WirelessTechnologyProfile dataContext](self, "dataContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_5:
    +[WirelessTechnologyProfile fetchFormattedHomeCarrierNameForContext:](WirelessTechnologyProfile, "fetchFormattedHomeCarrierNameForContext:", v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    if (v6)
    {
      v5 = v6;
      v7 = v5;
    }
    else
    {
      +[WirelessTechnologyProfile fetchMCCMNCHomeCarrierNameForContext:](WirelessTechnologyProfile, "fetchMCCMNCHomeCarrierNameForContext:", v3);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (__CFString *)v8;
      v7 = v10;

    }
    goto LABEL_13;
  }
  +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "getCurrentDataSubscriptionContextSync:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)v13;

  if (!v5 && v3)
  {
    -[WirelessTechnologyProfile setDataContext:](self, "setDataContext:", v3);
    goto LABEL_5;
  }
  symptomsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "Error while fetching data context: %@", buf, 0xCu);
  }

  v7 = CFSTR("Unknown");
LABEL_13:

  return v7;
}

- (void)updateHomeCarrier
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  symptomsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_INFO, "Received notification for home carrier, updating value", v5, 2u);
  }

  -[WirelessTechnologyProfile fetchHomeCarrier](self, "fetchHomeCarrier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WirelessTechnologyProfile setHomeCarrier:](self, "setHomeCarrier:", v4);

}

- (void)subscriptionInfoDidChange
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[CoreTelephonyShim sharedInstance](CoreTelephonyShim, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "getCurrentDataSubscriptionContextSync:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;

  symptomsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "Error while fetching data context: %@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[WirelessTechnologyProfile dataContext](self, "dataContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "subscriptionInfoDidChange: %@ -> %@", buf, 0x16u);

    }
    if (v4)
    {
      objc_msgSend(v4, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WirelessTechnologyProfile dataContext](self, "dataContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);

      if ((v14 & 1) == 0)
      {
        -[WirelessTechnologyProfile setDataContext:](self, "setDataContext:", v4);
        -[WirelessTechnologyProfile updateHomeCarrier](self, "updateHomeCarrier");
      }
    }
    else
    {
      -[WirelessTechnologyProfile setDataContext:](self, "setDataContext:", 0);
      -[WirelessTechnologyProfile setHomeCarrier:](self, "setHomeCarrier:", CFSTR("Unknown"));
    }
  }

}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  symptomsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[WirelessTechnologyProfile dataContext](self, "dataContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "currentDataSimChanged: %@ -> %@", (uint8_t *)&v13, 0x16u);

  }
  if (v4)
  {
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WirelessTechnologyProfile dataContext](self, "dataContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[WirelessTechnologyProfile setDataContext:](self, "setDataContext:", v4);
      -[WirelessTechnologyProfile updateHomeCarrier](self, "updateHomeCarrier");
    }
  }

}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  symptomsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "carrierBundleChange: %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WirelessTechnologyProfile dataContext](self, "dataContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
    -[WirelessTechnologyProfile updateHomeCarrier](self, "updateHomeCarrier");

}

- (NSString)regulatoryDomainCountry
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegulatoryDomainCountry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)homeCarrier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHomeCarrier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CTXPCServiceSubscriptionContext)dataContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataContext, 0);
  objc_storeStrong((id *)&self->_homeCarrier, 0);
  objc_storeStrong((id *)&self->_regulatoryDomainCountry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
