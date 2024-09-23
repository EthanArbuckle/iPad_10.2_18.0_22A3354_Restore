@implementation CTTelephonyNetworkInfo

- (CTTelephonyNetworkInfo)init
{
  dispatch_object_s *v3;
  NSObject *fObj;
  CoreTelephonyClient *v5;
  CTTelephonyNetworkInfo *v6;

  v3 = (dispatch_object_s *)dispatch_queue_create("CTTelephonyNetworkInfo", 0);
  fObj = self->_clientQueue.fObj.fObj;
  self->_clientQueue.fObj.fObj = v3;
  if (fObj)
    dispatch_release(fObj);
  v5 = -[CoreTelephonyClient initWithQueue:]([CoreTelephonyClient alloc], "initWithQueue:", self->_clientQueue.fObj.fObj);
  v6 = -[CTTelephonyNetworkInfo initWithClient:](self, "initWithClient:", v5);

  return v6;
}

- (void)dealloc
{
  CoreTelephonyClient *client;
  CTTelephonyNetworkInfoDelegate *delegate;
  CTServiceDescriptorContainer *descriptors;
  objc_super v6;

  if (self->_initialized)
  {
    -[CoreTelephonyClient setDelegate:](self->_client, "setDelegate:", 0);
    client = self->_client;
    self->_client = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    descriptors = self->_descriptors;
    self->_descriptors = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)CTTelephonyNetworkInfo;
  -[CTTelephonyNetworkInfo dealloc](&v6, sel_dealloc);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  return self;
}

- (NSString)currentRadioAccessTechnology
{
  CTServiceDescriptor *v3;
  void *v4;
  CTServiceDescriptor *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [CTServiceDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CTServiceDescriptor initWithDomain:instance:](v3, "initWithDomain:instance:", 1, v4);

  v6 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v6);
  -[CTTelephonyNetworkInfo cachedCurrentRadioAccessTechnology](self, "cachedCurrentRadioAccessTechnology");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTServiceDescriptor identifier](v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return (NSString *)v9;
}

- (CTCarrier)subscriberCellularProvider
{
  CTServiceDescriptor *v3;
  void *v4;
  CTServiceDescriptor *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [CTServiceDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CTServiceDescriptor initWithDomain:instance:](v3, "initWithDomain:instance:", 1, v4);

  v6 = self->_serviceSubscriberCellularProviders;
  objc_sync_enter(v6);
  -[CTTelephonyNetworkInfo serviceSubscriberCellularProviders](self, "serviceSubscriberCellularProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTServiceDescriptor identifier](v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return (CTCarrier *)v9;
}

- (CTTelephonyNetworkInfo)initWithClient:(id)a3
{
  CTTelephonyNetworkInfo *v5;
  CTTelephonyNetworkInfo *v6;
  CTTelephonyNetworkInfo *v7;
  uint64_t v8;
  NSMutableDictionary *serviceSubscriberCellularProviders;
  NSMutableDictionary *cachedCurrentRadioAccessTechnology;
  NSMutableDictionary *cachedSignalStrength;
  uint64_t v12;
  NSMutableDictionary *cachedCellIds;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  CTTelephonyNetworkInfo *v27;
  CTTelephonyNetworkInfo *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CTTelephonyNetworkInfo;
  v5 = -[CTTelephonyNetworkInfo init](&v35, sel_init);
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v5->_initialized = 0;
    v8 = objc_opt_new();
    serviceSubscriberCellularProviders = v7->_serviceSubscriberCellularProviders;
    v7->_serviceSubscriberCellularProviders = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v6->_client, a3);
    cachedCurrentRadioAccessTechnology = v7->_cachedCurrentRadioAccessTechnology;
    v7->_cachedCurrentRadioAccessTechnology = 0;

    cachedSignalStrength = v7->_cachedSignalStrength;
    v7->_cachedSignalStrength = 0;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    cachedCellIds = v7->_cachedCellIds;
    v7->_cachedCellIds = (NSMutableDictionary *)v12;

    if (v7->_subscriberCellularProviderDidUpdateNotifier)
      -[CTTelephonyNetworkInfo setSubscriberCellularProviderDidUpdateNotifier:](v7, "setSubscriberCellularProviderDidUpdateNotifier:");
    -[CTTelephonyNetworkInfo serviceSubscriberCellularProviders](v7, "serviceSubscriberCellularProviders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v27 = v7;
      v7 = 0;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CTTelephonyNetworkInfo setCachedCurrentRadioAccessTechnology:](v7, "setCachedCurrentRadioAccessTechnology:", v16);

      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CTTelephonyNetworkInfo setCachedSignalStrength:](v7, "setCachedSignalStrength:", v17);

      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CTTelephonyNetworkInfo setCachedCellIds:](v7, "setCachedCellIds:", v18);

      -[CTTelephonyNetworkInfo descriptors](v7, "descriptors");
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = (CTTelephonyNetworkInfo *)objc_claimAutoreleasedReturnValue();
      -[CTTelephonyNetworkInfo descriptors](v29, "descriptors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v23, "instance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[CTXPCServiceSubscriptionContext contextWithSlot:](CTXPCServiceSubscriptionContext, "contextWithSlot:", (int)objc_msgSend(v24, "intValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (!-[CTTelephonyNetworkInfo updateNetworkInfoAndShouldNotifyClient:forContext:](v7, "updateNetworkInfoAndShouldNotifyClient:forContext:", 0, v25))
            {
              v26 = CTLogNetworkInfo();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v37 = v23;
                _os_log_debug_impl(&dword_18425C000, v26, OS_LOG_TYPE_DEBUG, "Could not successfully update network info for descriptor %@ during initialization.", buf, 0xCu);
              }
            }

          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v20);
      }

      -[CTTelephonyNetworkInfo queryRat](v7, "queryRat");
      -[CTTelephonyNetworkInfo queryCTSignalStrength](v7, "queryCTSignalStrength");
      -[CoreTelephonyClient setDelegate:](v7->_client, "setDelegate:", v7);
      v7->_initialized = 1;
      v27 = v29;
    }

  }
  return v7;
}

- (void)queryRatForDescriptor:(id)a3
{
  id v4;
  void *v5;
  CoreTelephonyClient *client;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;

  v4 = a3;
  +[CTXPCServiceSubscriptionContext contextWithServiceDescriptor:](CTXPCServiceSubscriptionContext, "contextWithServiceDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  client = self->_client;
  v12 = 0;
  -[CoreTelephonyClient getDataStatus:error:](client, "getDataStatus:error:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    v9 = CTLogNetworkInfo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo queryRatForDescriptor:].cold.2();
  }
  else if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTTelephonyNetworkInfo updateRat:descriptor:](self, "updateRat:descriptor:", v10, v4);

  }
  else
  {
    v11 = CTLogNetworkInfo();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo queryRatForDescriptor:].cold.1();
  }

}

- (void)updateRat:(id)a3 descriptor:(id)a4
{
  unint64_t v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CTServiceDescriptor *v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = a4;
  v8 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v8);
  -[CTTelephonyNetworkInfo cachedCurrentRadioAccessTechnology](self, "cachedCurrentRadioAccessTechnology");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!(v6 | v11) || v11 && (objc_msgSend((id)v11, "isEqualToString:", v6) & 1) != 0)
  {

    objc_sync_exit(v8);
    goto LABEL_12;
  }
  v12 = CTLogNetworkInfo();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412802;
    v20 = v7;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v6;
    _os_log_debug_impl(&dword_18425C000, v12, OS_LOG_TYPE_DEBUG, "Updating RAT for descriptor: %@, from: %@ to: %@", (uint8_t *)&v19, 0x20u);
    if (v6)
      goto LABEL_7;
  }
  else if (v6)
  {
LABEL_7:
    -[CTTelephonyNetworkInfo cachedCurrentRadioAccessTechnology](self, "cachedCurrentRadioAccessTechnology");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v6, v14);

    goto LABEL_10;
  }
  -[CTTelephonyNetworkInfo cachedCurrentRadioAccessTechnology](self, "cachedCurrentRadioAccessTechnology");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectForKey:", v16);

  -[CTTelephonyNetworkInfo updateSignalStrength:descriptor:](self, "updateSignalStrength:descriptor:", 0, v7);
LABEL_10:

  objc_sync_exit(v8);
  objc_msgSend(v7, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTelephonyNetworkInfo postNotificationIfReady:object:](self, "postNotificationIfReady:object:", CFSTR("CTServiceRadioAccessTechnologyDidChangeNotification"), v17);

    -[CTTelephonyNetworkInfo updateLegacyRat:](self, "updateLegacyRat:", v6);
LABEL_12:

}

- (NSMutableDictionary)cachedCurrentRadioAccessTechnology
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)updateNetworkInfoAndShouldNotifyClient:(BOOL *)a3 forContext:(id)a4
{
  id v5;
  CTCarrier *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSMutableDictionary *serviceSubscriberCellularProviders;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  _BOOL4 v33;
  id v34;
  void *v36;
  CTCarrier *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unsigned __int8 v43;

  v5 = a4;
  v43 = 1;
  v36 = v5;
  v6 = objc_alloc_init(CTCarrier);
  v37 = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E1536FB8);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E1536FB8);
  v42 = 0;
  v8 = -[CTTelephonyNetworkInfo getCarrierName:forContext:withError:](self, "getCarrierName:forContext:withError:", v7, v5, &v42);
  v9 = v42;
  if (!v8)
    goto LABEL_22;
  v10 = objc_msgSend(v7, "length");
  if (v10)
    v11 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
  else
    v11 = 0;
  -[CTCarrier setCarrierName:](v6, "setCarrierName:", v11);
  if (v10)

  objc_msgSend(v7, "setString:", &stru_1E1536FB8);
  v41 = v9;
  v12 = -[CTTelephonyNetworkInfo getMobileCountryCode:andIsoCountryCode:forContext:withError:](self, "getMobileCountryCode:andIsoCountryCode:forContext:withError:", v7, v38, v5, &v41);
  v13 = v41;

  if (!v12)
  {
    v16 = 0;
    v9 = v13;
    goto LABEL_23;
  }
  v14 = objc_msgSend(v7, "length");
  if (v14)
    v15 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
  else
    v15 = 0;
  -[CTCarrier setMobileCountryCode:](v6, "setMobileCountryCode:", v15);
  if (v14)

  v17 = objc_msgSend(v38, "length");
  if (v17)
    v18 = (void *)objc_msgSend(v38, "copyWithZone:", 0);
  else
    v18 = 0;
  -[CTCarrier setIsoCountryCode:](v6, "setIsoCountryCode:", v18);
  if (v17)

  objc_msgSend(v7, "setString:", &stru_1E1536FB8);
  objc_msgSend(v38, "setString:", &stru_1E1536FB8);
  v40 = v13;
  v19 = -[CTTelephonyNetworkInfo getMobileNetworkCode:forContext:withError:](self, "getMobileNetworkCode:forContext:withError:", v7, v5, &v40);
  v9 = v40;

  if (v19)
  {
    v20 = objc_msgSend(v7, "length");
    if (v20)
      v21 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
    else
      v21 = 0;
    -[CTCarrier setMobileNetworkCode:](v6, "setMobileNetworkCode:", v21);
    if (v20)

    objc_msgSend(v7, "setString:", &stru_1E1536FB8);
    v39 = v9;
    v33 = -[CTTelephonyNetworkInfo getAllowsVOIP:forContext:withError:](self, "getAllowsVOIP:forContext:withError:", &v43, v5, &v39);
    v34 = v39;

    if (v33)
    {
      -[CTCarrier setAllowsVOIP:](v6, "setAllowsVOIP:", v43);
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    v9 = v34;
  }
  else
  {
LABEL_22:
    v16 = 0;
  }
LABEL_23:
  +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (a3)
      *a3 = 0;
    v23 = self->_serviceSubscriberCellularProviders;
    objc_sync_enter(v23);
    -[CTTelephonyNetworkInfo serviceSubscriberCellularProviders](self, "serviceSubscriberCellularProviders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqual:", v37);

    if ((v27 & 1) == 0)
    {
      serviceSubscriberCellularProviders = self->_serviceSubscriberCellularProviders;
      objc_msgSend(v22, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](serviceSubscriberCellularProviders, "setObject:forKey:", v37, v29);

      if (a3)
        *a3 = 1;
    }
  }
  else
  {
    v23 = self->_serviceSubscriberCellularProviders;
    objc_sync_enter(v23);
    v30 = self->_serviceSubscriberCellularProviders;
    objc_msgSend(v22, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v30, "removeObjectForKey:", v31);

  }
  objc_sync_exit(v23);

  return v16;
}

- (NSDictionary)serviceSubscriberCellularProviders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)getMobileCountryCode:(id)a3 andIsoCountryCode:(id)a4 forContext:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CoreTelephonyClient *client;
  id v14;
  id v15;
  id v16;
  CoreTelephonyClient *v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10 && v11)
  {
    client = self->_client;
    v23 = 0;
    v14 = -[CoreTelephonyClient copyMobileSubscriberCountryCode:error:](client, "copyMobileSubscriberCountryCode:error:", v12, &v23);
    v15 = v23;
    v16 = v15;
    if (v15 || !v14)
    {
      if (a6)
      {
        v16 = objc_retainAutorelease(v15);
        v20 = 0;
        *a6 = v16;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v17 = self->_client;
      v22 = 0;
      v18 = -[CoreTelephonyClient copyMobileSubscriberIsoCountryCode:error:](v17, "copyMobileSubscriberIsoCountryCode:error:", v14, &v22);
      v19 = v22;
      v16 = v19;
      if (a6)
        *a6 = objc_retainAutorelease(v19);
      v20 = v16 == 0;
      if (!v16)
      {
        objc_msgSend(v10, "setString:", v14);
        if (v18)
          objc_msgSend(v11, "setString:", v18);
      }

    }
  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)getMobileNetworkCode:(id)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  CoreTelephonyClient *client;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  id v16;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    client = self->_client;
    v16 = 0;
    v11 = -[CoreTelephonyClient copyMobileSubscriberNetworkCode:error:](client, "copyMobileSubscriberNetworkCode:error:", v9, &v16);
    v12 = v16;
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    v14 = v13 == 0;
    if (!v13 && v11)
      objc_msgSend(v8, "setString:", v11);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)getAllowsVOIP:(BOOL *)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8;
  CTBundle *v9;
  CoreTelephonyClient *client;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  id v16;

  v8 = a4;
  if (a3)
  {
    v9 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1);
    client = self->_client;
    v16 = 0;
    v11 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](client, "copyCarrierBundleValue:key:bundleType:error:", v8, CFSTR("AllowsVoIP"), v9, &v16);
    v12 = v16;
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
    v14 = v13 == 0;
    if (!v13 && v11)
      *a3 = objc_msgSend(v11, "BOOLValue");

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)getCarrierName:(id)a3 forContext:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  CTBundle *v10;
  CoreTelephonyClient *client;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v17;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = -[CTBundle initWithBundleType:]([CTBundle alloc], "initWithBundleType:", 1);
    client = self->_client;
    v17 = 0;
    v12 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](client, "copyCarrierBundleValue:key:bundleType:error:", v9, CFSTR("CarrierName"), v10, &v17);
    v13 = v17;
    v14 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v15 = v14 == 0;
    if (!v14 && v12)
      objc_msgSend(v8, "setString:", v12);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setCachedSignalStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setCachedCurrentRadioAccessTechnology:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setCachedCellIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)queryRat
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Querying RAT for descriptors: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)queryCTSignalStrength
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Querying signal strength for descriptors: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)querySignalStrengthForDescriptor:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v4 = a3;
  client = self->_client;
  v10 = 0;
  -[CoreTelephonyClient getPublicSignalStrength:error:](client, "getPublicSignalStrength:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    v8 = CTLogNetworkInfo();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo querySignalStrengthForDescriptor:].cold.2();
  }
  else if (v6)
  {
    -[CTTelephonyNetworkInfo updateSignalStrength:descriptor:](self, "updateSignalStrength:descriptor:", v6, v4);
  }
  else
  {
    v9 = CTLogNetworkInfo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo querySignalStrengthForDescriptor:].cold.1();
  }

}

- (CTServiceDescriptorContainer)descriptors
{
  CTServiceDescriptorContainer *descriptors;
  CTServiceDescriptorContainer *v3;
  CoreTelephonyClient *client;
  CTServiceDescriptorContainer *v6;
  id v7;
  NSObject *v8;
  NSObject *v10;
  CTServiceDescriptorContainer *v11;
  id v12;

  descriptors = self->_descriptors;
  if (descriptors)
  {
LABEL_2:
    v3 = descriptors;
    return v3;
  }
  client = self->_client;
  v12 = 0;
  -[CoreTelephonyClient getDescriptorsForDomain:error:](client, "getDescriptorsForDomain:error:", 1, &v12);
  v6 = (CTServiceDescriptorContainer *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v7)
  {
    v10 = CTLogNetworkInfo();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo descriptors].cold.1();
    v11 = self->_descriptors;
    self->_descriptors = v6;

    descriptors = self->_descriptors;
    goto LABEL_2;
  }
  v8 = CTLogNetworkInfo();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CTTelephonyNetworkInfo descriptors].cold.2();

  v3 = 0;
  return v3;
}

- (NSDictionary)serviceCurrentRadioAccessTechnology
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_cachedCurrentRadioAccessTechnology;
  objc_sync_enter(v3);
  -[CTTelephonyNetworkInfo cachedCurrentRadioAccessTechnology](self, "cachedCurrentRadioAccessTechnology");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSDictionary *)v4;
}

- (void)setSubscriberCellularProviderDidUpdateNotifier:(void *)subscriberCellularProviderDidUpdateNotifier
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = subscriberCellularProviderDidUpdateNotifier;
  if (self->_subscriberCellularProviderDidUpdateNotifier != v4)
  {
    v7 = v4;
    v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
    v6 = self->_subscriberCellularProviderDidUpdateNotifier;
    self->_subscriberCellularProviderDidUpdateNotifier = v5;

    v4 = v7;
  }

}

- (void).cxx_destruct
{
  NSObject *fObj;

  fObj = self->_clientQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
  objc_storeStrong((id *)&self->_cachedCellIds, 0);
  objc_storeStrong((id *)&self->_cachedSignalStrength, 0);
  objc_storeStrong((id *)&self->_cachedCurrentRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_serviceSubscriberCellularProviders, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong(&self->_subscriberCellularProviderDidUpdateNotifier, 0);
  objc_storeStrong(&self->_serviceSubscriberCellularProvidersDidUpdateNotifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setDelegate:(id)delegate
{
  objc_storeStrong((id *)&self->_delegate, delegate);
}

- (id)delegate
{
  return self->_delegate;
}

- (id)serviceSubscribersCellularProviderDidUpdateNotifier
{
  return _Block_copy(self->_serviceSubscriberCellularProvidersDidUpdateNotifier);
}

- (void)subscriberCellularProviderDidUpdateNotifier
{
  return _Block_copy(self->_subscriberCellularProviderDidUpdateNotifier);
}

- (void)setServiceSubscriberCellularProviderDidUpdateNotifier:(id)a3
{
  id v4;
  void *v5;
  id serviceSubscriberCellularProvidersDidUpdateNotifier;
  id v7;

  v4 = a3;
  if (self->_serviceSubscriberCellularProvidersDidUpdateNotifier != v4)
  {
    v7 = v4;
    v5 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
    serviceSubscriberCellularProvidersDidUpdateNotifier = self->_serviceSubscriberCellularProvidersDidUpdateNotifier;
    self->_serviceSubscriberCellularProvidersDidUpdateNotifier = v5;

    v4 = v7;
  }

}

- (NSString)dataServiceIdentifier
{
  CoreTelephonyClient *client;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v9;

  client = self->_client;
  v9 = 0;
  -[CoreTelephonyClient getCurrentDataServiceDescriptorSync:](client, "getCurrentDataServiceDescriptorSync:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    v5 = CTLogNetworkInfo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo dataServiceIdentifier].cold.2();
    v6 = 0;
  }
  else
  {
    v7 = CTLogNetworkInfo();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo dataServiceIdentifier].cold.1();
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (void)regDataModeChanged:(id)a3 dataMode:(int)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTelephonyNetworkInfo updateRat:descriptor:](self, "updateRat:descriptor:", v6, v7);

}

- (void)currentDataServiceDescriptorChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *global_queue;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  -[CTTelephonyNetworkInfo delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(21, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__CTTelephonyNetworkInfo_currentDataServiceDescriptorChanged___block_invoke;
    v7[3] = &unk_1E152FE98;
    v8 = v5;
    v9 = v4;
    dispatch_async(global_queue, v7);

  }
}

void __62__CTTelephonyNetworkInfo_currentDataServiceDescriptorChanged___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataServiceIdentifierDidChange:");

}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  void *v6;
  objc_object *v7;
  _anonymous_namespace_ *v8;
  void *v9;
  id v10;

  v10 = a4;
  +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("kCTRegistrationGsmCellId"));
  v8 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("kCTRegistrationC2KBaseId"));
    v8 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTelephonyNetworkInfo updateCellId:forDescriptor:](self, "updateCellId:forDescriptor:", v9, v6);

}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  CTServiceDescriptor *v5;
  void *v6;
  NSObject *global_queue;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[5];
  id v18;
  char v19;

  v4 = a3;
  v19 = 0;
  if (-[CTTelephonyNetworkInfo updateNetworkInfoAndShouldNotifyClient:forContext:](self, "updateNetworkInfoAndShouldNotifyClient:forContext:", &v19, v4))
  {
    if (v19)
    {
      +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_serviceSubscriberCellularProvidersDidUpdateNotifier)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke;
        block[3] = &unk_1E152FE98;
        block[4] = self;
        v18 = v6;
        dispatch_async(global_queue, block);

      }
      if (self->_subscriberCellularProviderDidUpdateNotifier
      {
        v8 = self->_serviceSubscriberCellularProviders;
        objc_sync_enter(v8);
        -[CTTelephonyNetworkInfo serviceSubscriberCellularProviders](self, "serviceSubscriberCellularProviders");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = dispatch_get_global_queue(0, 0);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke_2;
        v15[3] = &unk_1E152FE98;
        v15[4] = self;
        v16 = v11;
        v13 = v11;
        dispatch_async(v12, v15);

        objc_sync_exit(v8);
      }

    }
  }
  else
  {
    v14 = CTLogNetworkInfo();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo carrierBundleChange:].cold.1();
  }

}

void __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

uint64_t __46__CTTelephonyNetworkInfo_carrierBundleChange___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (void)postNotificationIfReady:(id)a3 object:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", v8, v6);

  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  +[CTServiceDescriptor descriptorWithSubscriptionContext:](CTServiceDescriptor, "descriptorWithSubscriptionContext:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTelephonyNetworkInfo updateSignalStrength:descriptor:](self, "updateSignalStrength:descriptor:", v7, v6);

}

- (void)updateSignalStrength:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  CTServiceDescriptor *v16;
  void *v17;
  NSObject *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v22[0] = CFSTR("CTSignalStrengthBarsKey");
      objc_msgSend(v6, "bars");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v22[1] = CFSTR("CTSignalStrengthDisplayBarsKey");
      objc_msgSend(v6, "displayBars");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v9;
      v22[2] = CFSTR("CTSignalStrengthMaxDisplayBarsKey");
      objc_msgSend(v6, "maxDisplayBars");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = self->_cachedSignalStrength;
      objc_sync_enter(v12);
      -[CTTelephonyNetworkInfo cachedSignalStrength](self, "cachedSignalStrength");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v11, v14);

      objc_sync_exit(v12);
      if (v11)
      {
        objc_msgSend(v7, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTTelephonyNetworkInfo postNotificationIfReady:object:](self, "postNotificationIfReady:object:", CFSTR("CTServiceSignalStrengthDidChangeNotification"), v15);

        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "postNotificationName:object:", CFSTR("CTSignalStrengthDidChangeNotification"), v11);

        }
      }
    }
    else
    {
      v19 = self->_cachedSignalStrength;
      objc_sync_enter(v19);
      -[CTTelephonyNetworkInfo cachedSignalStrength](self, "cachedSignalStrength");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v21);

      objc_sync_exit(v19);
      v11 = 0;
    }

  }
  else
  {
    v18 = CTLogNetworkInfo();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CTTelephonyNetworkInfo updateSignalStrength:descriptor:].cold.1(v18);
  }

}

- (void)updateLegacyRat:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CTRadioAccessTechnologyDidChangeNotification"), v4);

}

- (void)updateCellId:(id)a3 forDescriptor:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  CTServiceDescriptor *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14)
  {
    if (v6)
    {
      v7 = self->_cachedCellIds;
      objc_sync_enter(v7);
      -[CTTelephonyNetworkInfo cachedCellIds](self, "cachedCellIds");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v14, v9);

      objc_sync_exit(v7);
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTTelephonyNetworkInfo postNotificationIfReady:object:](self, "postNotificationIfReady:object:", CFSTR("CTServiceCellIdDidChangeNotification"), v10);

      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTTelephonyNetworkInfo getFirstCellId](self, "getFirstCellId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "postNotificationName:object:", CFSTR("CTCellIdDidChangeNotification"), v13);

      }
    }
  }

}

- (void)queryCellIds
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Querying Cell IDs for descriptors: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (id)serviceSignalStrength
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_cachedSignalStrength;
  objc_sync_enter(v3);
  -[CTTelephonyNetworkInfo cachedSignalStrength](self, "cachedSignalStrength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)signalStrength
{
  CTServiceDescriptor *v3;
  void *v4;
  CTServiceDescriptor *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = [CTServiceDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CTServiceDescriptor initWithDomain:instance:](v3, "initWithDomain:instance:", 1, v4);

  v6 = self->_cachedSignalStrength;
  objc_sync_enter(v6);
  -[CTTelephonyNetworkInfo cachedSignalStrength](self, "cachedSignalStrength");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTServiceDescriptor identifier](v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (id)serviceCellId
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = self->_cachedCellIds;
  objc_sync_enter(v3);
  -[CTTelephonyNetworkInfo cachedCellIds](self, "cachedCellIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    -[CTTelephonyNetworkInfo queryCellIds](self, "queryCellIds");
  -[CTTelephonyNetworkInfo cachedCellIds](self, "cachedCellIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v6;
}

- (id)cellId
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CTTelephonyNetworkInfo getFirstCellId](self, "getFirstCellId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CTTelephonyNetworkInfo queryCellIds](self, "queryCellIds");
    -[CTTelephonyNetworkInfo getFirstCellId](self, "getFirstCellId");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)getFirstCellId
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = self->_cachedCellIds;
  objc_sync_enter(v3);
  -[CTTelephonyNetworkInfo cachedCellIds](self, "cachedCellIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CTTelephonyNetworkInfo cachedCellIds](self, "cachedCellIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v3);

  return v8;
}

- (id)radioAccessTechnology
{
  return -[CTRadioAccessTechnology initWithCTTelephonyNetworkInfo:]([CTRadioAccessTechnology alloc], "initWithCTTelephonyNetworkInfo:", self);
}

- (void)setServiceSubscriberCellularProviders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)serviceSubscriberCellularProvidersDidUpdateNotifier
{
  return self->_serviceSubscriberCellularProvidersDidUpdateNotifier;
}

- (void)setServiceSubscriberCellularProvidersDidUpdateNotifier:(void *)serviceSubscriberCellularProvidersDidUpdateNotifier
{
  objc_setProperty_nonatomic_copy(self, a2, serviceSubscriberCellularProvidersDidUpdateNotifier, 24);
}

- (NSMutableDictionary)cachedSignalStrength
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableDictionary)cachedCellIds
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (queue)clientQueue
{
  void *v2;
  queue v3;

  objc_copyCppObjectAtomic(v2, &self->_clientQueue, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return v3;
}

- (void)setClientQueue:(queue)a3
{
  objc_copyCppObjectAtomic(&self->_clientQueue, a3.fObj.fObj, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void)descriptors
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Descriptors query returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)dataServiceIdentifier
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Data service descriptor query returned error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)carrierBundleChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "Update network info failed for context %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)updateSignalStrength:(os_log_t)log descriptor:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18425C000, log, OS_LOG_TYPE_DEBUG, "Cannot update signal strength.  Invalid descriptor", v1, 2u);
}

- (void)querySignalStrengthForDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "No signal strength in query result for descriptor: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)querySignalStrengthForDescriptor:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_0(&dword_18425C000, v0, v1, "Signal strength query returned error: %@, descriptor: %@");
  OUTLINED_FUNCTION_1_1();
}

- (void)queryRatForDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18425C000, v0, v1, "No DataStatus in query result for context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)queryRatForDescriptor:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_0(&dword_18425C000, v0, v1, "DataStatus query returned error: %@, context: %@");
  OUTLINED_FUNCTION_1_1();
}

@end
