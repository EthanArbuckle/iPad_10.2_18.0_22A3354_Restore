@implementation IMChorosMonitor

+ (id)sharedInstance
{
  if (qword_1ECF125A8 != -1)
    dispatch_once(&qword_1ECF125A8, &unk_1E471D7B8);
  return (id)qword_1ECF12608;
}

- (IMChorosMonitor)init
{
  IMChorosMonitor *v2;
  id v3;
  uint64_t v4;
  CTStewieStateMonitor *coreTelephonyStewieMonitor;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMChorosMonitor;
  v2 = -[IMChorosMonitor init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA6E20]);
    v4 = objc_msgSend(v3, "initWithDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    coreTelephonyStewieMonitor = v2->_coreTelephonyStewieMonitor;
    v2->_coreTelephonyStewieMonitor = (CTStewieStateMonitor *)v4;

    if (!v2->_coreTelephonyStewieMonitor)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Failed to load monitor", v8, 2u);
        }

      }
    }
  }
  return v2;
}

- (void)startMonitor
{
  char v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = -[CTStewieStateMonitor start](self->_coreTelephonyStewieMonitor, "start");
  v4 = IMOSLoggingEnabled();
  if ((v3 & 1) != 0)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Loaded monitor", v8, 2u);
      }

    }
    if (-[IMChorosMonitor isSatelliteConnectionActive](self, "isSatelliteConnectionActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("IMChorosMonitorStewieStatusChangedNotification"), 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject __mainThreadPostNotificationName:object:](v7, "__mainThreadPostNotificationName:object:", CFSTR("IMChorosMonitorStartedNotification"), 0);
LABEL_9:

    return;
  }
  if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Failed to start the monitor", buf, 2u);
    }
    goto LABEL_9;
  }
}

- (id)getState
{
  return (id)-[CTStewieStateMonitor getState](self->_coreTelephonyStewieMonitor, "getState");
}

- (CoreTelephonyClient)telephonyClient
{
  CoreTelephonyClient *telephonyClient;
  id v4;
  CoreTelephonyClient *v5;
  CoreTelephonyClient *v6;

  telephonyClient = self->_telephonyClient;
  if (!telephonyClient)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA6E38]);
    v5 = (CoreTelephonyClient *)objc_msgSend(v4, "initWithQueue:", MEMORY[0x1E0C80D38]);
    v6 = self->_telephonyClient;
    self->_telephonyClient = v5;

    telephonyClient = self->_telephonyClient;
  }
  return telephonyClient;
}

- (BOOL)isSatelliteConnectionActive
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (!v4)
    return 0;
  -[IMChorosMonitor getState](self, "getState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStewieActiveOverBB");

  return v6;
}

- (BOOL)isMessagingActiveOverSatellite
{
  void *v3;
  int v4;
  char v5;
  void *v6;
  char v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCarrierPigeonEnabled");

  if (!v4)
    return 0;
  if ((IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) != 0)
    return 1;
  -[IMChorosMonitor getState](self, "getState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActiveService:", 16);
  v8 = objc_msgSend(v6, "isActiveService:", 32);
  if ((v7 & 1) != 0 || v8)
    v5 = objc_msgSend(v6, "isStewieActiveOverBB");
  else
    v5 = 0;

  return v5;
}

- (void)stateChanged:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134218752;
      v7 = objc_msgSend(v3, "activeServices");
      v8 = 2048;
      v9 = objc_msgSend(v3, "allowedServices");
      v10 = 2048;
      v11 = objc_msgSend(v3, "status");
      v12 = 2048;
      v13 = objc_msgSend(v3, "transportType");
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Stewie status changed to: activeServices: %ld - allowedServices: %ld - status: %ld - transport: %ld", (uint8_t *)&v6, 0x2Au);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("IMChorosMonitorStewieStatusChangedNotification"), 0);

}

- (BOOL)isStewieActive
{
  void *v2;
  char v3;

  -[IMChorosMonitor getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if ((objc_msgSend(v2, "isActiveService:", 1) & 1) == 0)
    v3 = objc_msgSend(v2, "isActiveService:", 8);

  return v3;
}

- (BOOL)isStewieEmergencyActive
{
  void *v2;
  char v3;

  -[IMChorosMonitor getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveService:", 1);

  return v3;
}

- (BOOL)shouldShowTextEmergencyServicesButton
{
  void *v2;
  char v3;

  -[IMChorosMonitor getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isActiveService:", 1) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isAllowedService:", 1);

  return v3;
}

- (void)openStewieAppForChatIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CA6E08]);
  if (!IMIsStringStewieEmergency())
  {
    if (IMIsStringStewieRoadside())
    {
      +[IMChorosMonitor roadsideProviderIDFromChatIdentifier:](IMChorosMonitor, "roadsideProviderIDFromChatIdentifier:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        v18 = *MEMORY[0x1E0CA7870];
        v19[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setMetadata:", v11);

        objc_msgSend(v8, "setReason:", 7);
        goto LABEL_6;
      }
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    else
    {
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    sub_1A219708C();
    goto LABEL_11;
  }
  objc_msgSend(v8, "setReason:", 2);
LABEL_6:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Requesting to open application", buf, 2u);
    }

  }
  -[IMChorosMonitor telephonyClient](self, "telephonyClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A20ACBE8;
  v15[3] = &unk_1E4720A68;
  v16 = v7;
  objc_msgSend(v13, "requestStewieWithContext:completion:", v8, v15);

  v14 = v16;
LABEL_11:

}

- (void)placeEmergencyCallToHandle:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
  v8 = objc_alloc(MEMORY[0x1E0DBD2E0]);
  objc_msgSend(v7, "emergencyProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithProvider:", v9);

  objc_msgSend(v10, "setDialType:", 1);
  if (v5)
  {
    objc_msgSend(v10, "setHandle:", v5);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "handle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Requesting a specific handle %@ in the dial request.", buf, 0xCu);

      }
    }
  }
  IMLogHandleForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1A21971E0();

  if ((objc_msgSend(v10, "isValid") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1A20ACF78;
    v18[3] = &unk_1E4720A68;
    v19 = v6;
    objc_msgSend(v15, "launchAppForDialRequest:completion:", v10, v18);

    v16 = v19;
  }
  else
  {
    IMLogHandleForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1A2197180();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IMChorosMonitorPlaceEmergencyCallErrorDomain"), 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      (*((void (**)(id, void *))v6 + 2))(v6, v16);
  }

}

- (NSDictionary)emergencyHandles
{
  NSDictionary *emergencyHandles;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  emergencyHandles = self->_emergencyHandles;
  if (!emergencyHandles)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
    objc_msgSend(v5, "emergencyProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "emergencyLabeledHandles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v22 = v5;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v7, "emergencyLabeledHandles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v14, "label");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "handle");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(v14, "label");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);
              }
              else
              {
                objc_msgSend(v14, "handle");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "value");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v18);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v11);
        }

        v5 = v22;
      }
    }
    v19 = (NSDictionary *)objc_msgSend(v4, "copy");
    v20 = self->_emergencyHandles;
    self->_emergencyHandles = v19;

    emergencyHandles = self->_emergencyHandles;
  }
  return emergencyHandles;
}

- (BOOL)_activeServicesHasEmergency:(id)a3
{
  return objc_msgSend(a3, "activeServices") & 1;
}

- (int64_t)mostRecentlyUsedConversationForEmergency
{
  return IMGetDomainIntForKey();
}

+ (int64_t)serviceFromChatIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((IMIsStringStewieEmergency() & 1) != 0)
  {
    v4 = 1;
  }
  else if (IMIsStringStewieRoadside())
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isStewieRoadsideActive
{
  void *v2;
  char v3;

  -[IMChorosMonitor getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveService:", 8);

  return v3;
}

- (BOOL)shouldShowTextRoadsideProviderButton
{
  void *v2;
  char v3;

  -[IMChorosMonitor getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isActiveService:", 8) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isAllowedService:", 8);

  return v3;
}

+ (id)chatIdentifierForRoadside:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%lld"), *MEMORY[0x1E0D39298], a3);
}

- (id)mostRecentlyUsedRoadsideChatIdentifier
{
  IMGetDomainIntForKey();
  return (id)MEMORY[0x1E0DE7D20](IMChorosMonitor, sel_chatIdentifierForRoadside_);
}

- (int64_t)mostRecentlyUsedConversationForRoadside
{
  return IMGetDomainIntForKey();
}

+ (id)roadsideProviderIDFromChatIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[IMChorosMonitor serviceFromChatIdentifier:](IMChorosMonitor, "serviceFromChatIdentifier:", v3) == 8)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 3)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)roadsideProviderForProviderId:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;

  -[IMChorosMonitor telephonyClient](self, "telephonyClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v12 = 0;
  objc_msgSend(v4, "fetchRoadsideProvidersWithContext:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1A21972E0();
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v6, "providers");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1A21972A0(v8);
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)roadsideProviderNameForProviderId:(int64_t)a3
{
  void *v3;
  void *v4;

  -[IMChorosMonitor roadsideProviderForProviderId:](self, "roadsideProviderForProviderId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)roadsideBusinessIDForProviderId:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[IMChorosMonitor roadsideProviderForProviderId:](self, "roadsideProviderForProviderId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bizId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_appearsToBeBusinessID"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)roadsideProviderNameForChatIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingChatWithChatIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v9 = v8;
  }
  else
  {
    +[IMChorosMonitor roadsideProviderIDFromChatIdentifier:](IMChorosMonitor, "roadsideProviderIDFromChatIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10
      && (-[IMChorosMonitor roadsideProviderNameForProviderId:](self, "roadsideProviderNameForProviderId:", objc_msgSend(v10, "integerValue")), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = v12;
      v9 = v8;
    }
    else
    {
      sub_1A20F1964();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("STEWIE_ROADSIDE_FALLBACK_HANDLE_NAME"), &stru_1E4725068, CFSTR("IMCoreLocalizable-Avocet"));
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }

  }
  return v8;
}

- (id)roadsideBusinessIDForChatIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingChatWithChatIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "associatedBusinessID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    +[IMChorosMonitor roadsideProviderIDFromChatIdentifier:](IMChorosMonitor, "roadsideProviderIDFromChatIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[IMChorosMonitor roadsideBusinessIDForProviderId:](self, "roadsideBusinessIDForProviderId:", objc_msgSend(v9, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;

  }
  return v8;
}

- (void)setEmergencyHandles:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyHandles, a3);
}

- (CTStewieStateMonitor)coreTelephonyStewieMonitor
{
  return self->_coreTelephonyStewieMonitor;
}

- (void)setCoreTelephonyStewieMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyStewieMonitor, a3);
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyStewieMonitor, 0);
  objc_storeStrong((id *)&self->_emergencyHandles, 0);
}

@end
