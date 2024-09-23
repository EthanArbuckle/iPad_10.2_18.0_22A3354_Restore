@implementation APUIConnectivityManager

- (int64_t)connectivityState
{
  APUIConnectivityManager *v2;
  int64_t connectivityState;

  v2 = self;
  objc_sync_enter(v2);
  connectivityState = v2->_connectivityState;
  objc_sync_exit(v2);

  return connectivityState;
}

- (void)_initWifiInterface
{
  CWFInterface *v3;
  CWFInterface *cwInterface;

  v3 = (CWFInterface *)objc_msgSend(objc_alloc((Class)CWFInterface), "initWithServiceType:", 2);
  cwInterface = self->_cwInterface;
  self->_cwInterface = v3;

  -[CWFInterface activate](self->_cwInterface, "activate");
  -[CWFInterface setInvalidationHandler:](self->_cwInterface, "setInvalidationHandler:", &stru_1000187B0);
}

- (void)_startMonitoringWiFiEvents
{
  CWFInterface *cwInterface;
  id v4;
  void *v5;
  CWFInterface *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (dword_10001ED08 <= 50
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _startMonitoringWiFiEvents]", 33554482, "[%{ptr}] Start monitoring WiFi events notification.", self);
  }
  cwInterface = self->_cwInterface;
  v10 = 0;
  -[CWFInterface startMonitoringEventType:error:](cwInterface, "startMonitoringEventType:error:", 19, &v10);
  v4 = v10;
  if (v4
    && dword_10001ED08 <= 90
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554522)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _startMonitoringWiFiEvents]", 33554522, "Start IPv4 address notification failed with error: %@", v5);

  }
  v6 = self->_cwInterface;
  v9 = 0;
  -[CWFInterface startMonitoringEventType:error:](v6, "startMonitoringEventType:error:", 20, &v9);
  v7 = v9;
  if (v7
    && dword_10001ED08 <= 90
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554522)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _startMonitoringWiFiEvents]", 33554522, "Start monitoring IPv6 address notification failed with error: %@", v8);

  }
}

- (void)_stopMonitoringWiFiEvents
{
  if (dword_10001ED08 <= 50
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _stopMonitoringWiFiEvents]", 33554482, "[%{ptr}] Stop monitoring WiFi events notification.", self);
  }
  -[CWFInterface stopMonitoringEventType:](self->_cwInterface, "stopMonitoringEventType:", 19);
  -[CWFInterface stopMonitoringEventType:](self->_cwInterface, "stopMonitoringEventType:", 20);
}

- (void)_monitorWiFiIPAddressConfigurationWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *monitorQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  monitorQueue = self->_monitorQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007CA0;
  v7[3] = &unk_100018800;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)monitorQueue, v7);

}

- (void)joinWiFiNetworkWithSSID:(id)a3 isNetworkHidden:(BOOL)a4 passPhrase:(id)a5 captivePortalAuthToken:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v10 = a4;
  v17 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v15, "setSSID:", v17);
  objc_msgSend(v15, "setIncludeHiddenNetworks:", v10);
  objc_msgSend(v15, "setMaximumCacheAge:", 0);
  objc_msgSend(v15, "setNumberOfScans:", 1);
  v16 = objc_msgSend(v15, "setMergeScanResults:", 1);
  if (v13)
  {
    if (IsAppleInternalBuild(v16)
      && dword_10001ED08 <= 50
      && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
    {
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager joinWiFiNetworkWithSSID:isNetworkHidden:passPhrase:captivePortalAuthToken:completion:]", 33554482, "[%{ptr}] Starts captive portal authentication with token %@.", self, v13);
    }
    if (objc_msgSend((id)objc_opt_class(self), "isCaptivePortalMitigationSupported"))
      CNSetCaptivePortalAuthenticationCredentials(v17, 0, objc_msgSend(v13, "dataUsingEncoding:", 4), 2, 0);
  }
  -[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:](self, "_startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:", v15, v12, v13, v14);

}

- (void)enableCaptiveWebsheet:(unsigned __int8)a3
{
  int v3;
  int v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = a3;
  v5 = CNEnableWebSheetLaunch(a3, a2);
  if (dword_10001ED08 <= 50)
  {
    v6 = v5;
    if (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482))
    {
      v7 = CFSTR("Enable");
      if (!v3)
        v7 = CFSTR("Disable");
      v8 = CFSTR("success");
      if (!v6)
        v8 = CFSTR("failure");
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager enableCaptiveWebsheet:]", 33554482, "[%{ptr}] %@ captive websheet launch status: %@", self, v7, v8);
    }
  }
}

- (void)tagAirPlayNetwork
{
  void *v3;
  CWFInterface *cwInterface;
  void *v5;
  id v6;
  id v7;

  if (objc_msgSend((id)objc_opt_class(self), "shouldUpdateNetworkProfile"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface currentKnownNetworkProfile](self->_cwInterface, "currentKnownNetworkProfile"));
    if ((objc_opt_respondsToSelector(v3, "setPublicAirPlayNetwork:") & 1) != 0)
    {
      objc_msgSend(v3, "performSelector:withObject:", "setPublicAirPlayNetwork:", &__kCFBooleanTrue);
      cwInterface = self->_cwInterface;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_100019588));
      v7 = 0;
      -[CWFInterface updateKnownNetworkProfile:properties:error:](cwInterface, "updateKnownNetworkProfile:properties:error:", v3, v5, &v7);
      v6 = v7;

      if (v6)
      {
        if (dword_10001ED08 <= 90
          && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554522)))
        {
          LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager tagAirPlayNetwork]", 33554522, "[%{ptr}] Update network profile with error: %@.", self, v6);
        }
      }
      else if (dword_10001ED08 <= 50
             && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
      {
        LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager tagAirPlayNetwork]", 33554482, "[%{ptr}] Updated network profile", self);
      }

    }
  }
}

- (void)_startWiFiNetworkScanWithScanParameters:(id)a3 passPhrase:(id)a4 captivePortalAuthToken:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CWFInterface *cwInterface;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (dword_10001ED08 <= 50
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _startWiFiNetworkScanWithScanParameters:passPhrase:captivePortalAuthToken:completion:]", 33554482, "[%{ptr}] Starts WiFi scan.", self);
  }
  cwInterface = self->_cwInterface;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000088A8;
  v18[3] = &unk_100018828;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  -[CWFInterface performScanWithParameters:reply:](cwInterface, "performScanWithParameters:reply:", v10, v18);

}

- (void)_associateWithNetworkWithPassPhrase:(id)a3 captivePortalAuthToken:(id)a4 scanResults:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CWFInterface *cwInterface;
  id v14;
  _QWORD v15[5];
  id v16;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)CWFAssocParameters);
  objc_msgSend(v12, "setScanResult:", v10);

  objc_msgSend(v12, "setPassword:", v11);
  objc_msgSend(v12, "setRememberUponSuccessfulAssociation:", 1);
  if (dword_10001ED08 <= 50
    && (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482)))
  {
    LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager _associateWithNetworkWithPassPhrase:captivePortalAuthToken:scanResults:completion:]", 33554482, "[%{ptr}] Starts WiFi association.", self);
  }
  cwInterface = self->_cwInterface;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008C18;
  v15[3] = &unk_100018850;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  -[CWFInterface associateWithParameters:reply:](cwInterface, "associateWithParameters:reply:", v12, v15);

}

- (void)handleUSBInterfaceChangedWithEventInfo:(id)a3
{
  APUIConnectivityManager *v4;
  void *v5;
  int64_t connectivityState;
  NSMutableSet *v7;
  NSMutableSet *activeUSBInterfaces;
  void *v9;
  unsigned int v10;
  NSMutableSet *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = v17;
  connectivityState = v4->_connectivityState;
  if (!v4->_activeUSBInterfaces)
  {
    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeUSBInterfaces = v4->_activeUSBInterfaces;
    v4->_activeUSBInterfaces = v7;

    v5 = v17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kAPConnectivityHelperEventInfoKey_IsAddEvent));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = v4->_activeUSBInterfaces;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", kAPConnectivityHelperEventInfoKey_NetworkInterfaceName));
    -[NSMutableSet addObject:](v11, "addObject:", v12);

    v13 = v4->_connectivityState | 2;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", kAPConnectivityHelperEventInfoKey_NetworkInterfaceName));
    -[NSMutableSet removeObject:](v11, "removeObject:", v14);

    v15 = -[NSMutableSet count](v4->_activeUSBInterfaces, "count");
    v13 = v4->_connectivityState;
    if (v15)
      goto LABEL_8;
    v13 &= ~2uLL;
  }
  v4->_connectivityState = v13;
LABEL_8:
  objc_sync_exit(v4);

  if (v13 != connectivityState)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("kAPUIConnectivityManagerNotification_ConnectivityStateChanged"), v4);

  }
}

- (void)handleWiFiInterfaceChangedWithEventInfo:(id)a3
{
  APUIConnectivityManager *v4;
  int64_t connectivityState;
  uint64_t v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  NSString *currentNetworkSSID;
  unint64_t v11;
  int64_t v12;
  APUIConnectivityManager *v13;
  id v14;

  v14 = a3;
  v4 = self;
  objc_sync_enter(v4);
  connectivityState = v4->_connectivityState;
  v6 = kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kAPConnectivityHelperEventInfoKey_WiFiNetworkSSID));

  v8 = v4->_connectivityState;
  if (v7)
  {
    v4->_connectivityState = v8 | 1;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_currentNetworkSSID = (NSString *)v9;
  }
  else
  {
    v11 = v8 & 0xFFFFFFFFFFFFFFFELL;
    currentNetworkSSID = v4->_currentNetworkSSID;
    v4->_connectivityState = v11;
    v4->_currentNetworkSSID = 0;
  }

  v12 = v4->_connectivityState;
  if (v12 != connectivityState)
  {
    if (dword_10001ED08 <= 50)
    {
      if (dword_10001ED08 == -1)
      {
        if (!_LogCategory_Initialize(&dword_10001ED08, 33554482))
          goto LABEL_10;
        v12 = v4->_connectivityState;
      }
      LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager handleWiFiInterfaceChangedWithEventInfo:]", 33554482, "[%{ptr}] previous state: %d, currentState: %d.", v4, connectivityState, v12);
    }
LABEL_10:
    objc_sync_exit(v4);

    v13 = (APUIConnectivityManager *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[APUIConnectivityManager postNotificationName:object:](v13, "postNotificationName:object:", CFSTR("kAPUIConnectivityManagerNotification_ConnectivityStateChanged"), v4);
    v4 = v13;
    goto LABEL_11;
  }
  objc_sync_exit(v4);
LABEL_11:

}

- (void)startMonitoringWiFiInterfaceChange
{
  APUIConnectivityManager *v2;
  uint64_t v3;
  APUIConnectivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isListeningForWiFiInterfaceChange)
  {
    v3 = APConnectivityHelperRegisterForEvent(obj->_connectivityHelper, obj, 3);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager startMonitoringWiFiInterfaceChange]", 396, 0);
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 1;
    }
  }
  objc_sync_exit(v2);

}

- (void)stopMonitoringWiFiInterfaceChange
{
  APUIConnectivityManager *v2;
  uint64_t v3;
  APUIConnectivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListeningForWiFiInterfaceChange)
  {
    v3 = APConnectivityHelperDeregisterForEvent(obj->_connectivityHelper, obj, 3);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager stopMonitoringWiFiInterfaceChange]", 413, 0);
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForWiFiInterfaceChange = 0;
    }
  }
  objc_sync_exit(v2);

}

- (void)startMonitoringUSBInterfaceChange
{
  APUIConnectivityManager *v2;
  uint64_t v3;
  APUIConnectivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isListeningForUSBInterfaceChange)
  {
    v3 = APConnectivityHelperRegisterForEvent(obj->_connectivityHelper, obj, 4);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager startMonitoringUSBInterfaceChange]", 430, 0);
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForUSBInterfaceChange = 1;
    }
  }
  objc_sync_exit(v2);

}

- (void)stopMonitoringUSBInterfaceChange
{
  APUIConnectivityManager *v2;
  uint64_t v3;
  APUIConnectivityManager *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListeningForUSBInterfaceChange)
  {
    v3 = APConnectivityHelperDeregisterForEvent(obj->_connectivityHelper, obj, 4);
    if ((_DWORD)v3)
    {
      APSLogErrorAt(v3, "-[APUIConnectivityManager stopMonitoringUSBInterfaceChange]", 447, 0);
      v2 = obj;
    }
    else
    {
      v2 = obj;
      obj->_isListeningForUSBInterfaceChange = 0;
    }
  }
  objc_sync_exit(v2);

}

- (APUIConnectivityManager)init
{
  APUIConnectivityManager *v2;
  APUIConnectivityManager *v3;
  OpaqueAPConnectivityHelper *SharedHelper;
  OpaqueAPConnectivityHelper *connectivityHelper;
  uint64_t v6;
  dispatch_queue_attr_t v7;
  NSObject *p_super;
  dispatch_queue_t v9;
  OS_dispatch_queue *monitorQueue;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)APUIConnectivityManager;
  v2 = -[APUIConnectivityManager init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    if (dword_10001ED08 <= 50)
    {
      if (dword_10001ED08 != -1
        || (v2 = (APUIConnectivityManager *)_LogCategory_Initialize(&dword_10001ED08, 33554482), (_DWORD)v2))
      {
        v2 = (APUIConnectivityManager *)LogPrintF(&dword_10001ED08, "-[APUIConnectivityManager init]", 33554482, "[%{ptr}] created.", v3);
      }
    }
    SharedHelper = (OpaqueAPConnectivityHelper *)APConnectivityHelperGetSharedHelper(v2);
    v3->_connectivityHelper = SharedHelper;
    if (SharedHelper && (CFRetain(SharedHelper), (connectivityHelper = v3->_connectivityHelper) != 0))
    {
      v6 = APConnectivityHelperRegisterEventHandler(connectivityHelper, v3, sub_1000095A8);
      if (!(_DWORD)v6)
      {
        -[APUIConnectivityManager _initWifiInterface](v3, "_initWifiInterface");
        v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
        p_super = objc_claimAutoreleasedReturnValue(v7);
        v9 = dispatch_queue_create("AirPlaySenderUIApp.networkObserverQueue", p_super);
        monitorQueue = v3->_monitorQueue;
        v3->_monitorQueue = (OS_dispatch_queue *)v9;

LABEL_12:
        return v3;
      }
      v11 = 470;
    }
    else
    {
      v6 = 0;
      v11 = 467;
    }
    APSLogErrorAt(v6, "-[APUIConnectivityManager init]", v11, 0);
    p_super = &v3->super;
    v3 = 0;
    goto LABEL_12;
  }
  return v3;
}

- (void)dealloc
{
  OpaqueAPConnectivityHelper *connectivityHelper;
  objc_super v4;

  connectivityHelper = self->_connectivityHelper;
  if (connectivityHelper)
  {
    CFRelease(connectivityHelper);
    self->_connectivityHelper = 0;
  }
  -[APUIConnectivityManager _stopMonitoringWiFiEvents](self, "_stopMonitoringWiFiEvents");
  -[CWFInterface invalidate](self->_cwInterface, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)APUIConnectivityManager;
  -[APUIConnectivityManager dealloc](&v4, "dealloc");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000096D8;
  block[3] = &unk_100018720;
  block[4] = a1;
  if (qword_10001F058 != -1)
    dispatch_once(&qword_10001F058, block);
  return (id)qword_10001F060;
}

+ (BOOL)nwPathHasWiFiConnectivity:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3 && nw_path_uses_interface_type(v3, nw_interface_type_wifi) && ((nw_path_get_status(v4) - 1) & 0xFFFFFFFD) == 0;

  return v5;
}

+ (BOOL)isCaptivePortalMitigationSupported
{
  return APSSettingsIsFeatureEnabled(CFSTR("SetupAssistantCaptivePortalMitigation")) != 0;
}

+ (BOOL)shouldUpdateNetworkProfile
{
  int BooleanIfPresent;
  int v3;
  int v4;
  const char *v5;
  const char *v6;
  unsigned __int8 v8;

  v8 = 0;
  BooleanIfPresent = APSSettingsGetBooleanIfPresent(CFSTR("disableBlueAtlasNetworkTagging"), &v8);
  v3 = v8;
  if (dword_10001ED08 <= 50)
  {
    v4 = BooleanIfPresent;
    if (dword_10001ED08 != -1 || _LogCategory_Initialize(&dword_10001ED08, 33554482))
    {
      v5 = "no";
      if (v3)
        v6 = "no";
      else
        v6 = "yes";
      if (v4)
        v5 = "yes";
      LogPrintF(&dword_10001ED08, "+[APUIConnectivityManager shouldUpdateNetworkProfile]", 33554482, "Update network profile: %s from prefs: %s", v6, v5);
    }
  }
  return v3 == 0;
}

- (NSString)currentNetworkSSID
{
  return self->_currentNetworkSSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetworkSSID, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_cwInterface, 0);
  objc_storeStrong((id *)&self->_activeUSBInterfaces, 0);
}

@end
