@implementation CBWiFiManager

+ (CBWiFiManager)sharedInstance
{
  if (qword_10008BDC8 != -1)
    dispatch_once(&qword_10008BDC8, &stru_100076058);
  return (CBWiFiManager *)(id)qword_10008BDC0;
}

- (CBWiFiManager)init
{
  CBWiFiManager *v2;
  uint64_t v3;
  NSObject *v4;
  NSMutableSet *v5;
  NSMutableSet *wifiScanRequestors;
  CBWiFiNetworkInfo *lastGoodNetwork;
  CBWiFiNetworkInfo *pendingLastGoodNetwork;
  CWFInterface *v9;
  CWFInterface *cwInterface;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *networkScanSemaphore;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CBWiFiManager;
  v2 = -[CBWiFiManager init](&v15, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting up Wi-Fi manager…", v14, 2u);
    }

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    wifiScanRequestors = v2->_wifiScanRequestors;
    v2->_wifiScanRequestors = v5;

    v2->_reconnecting = 0;
    lastGoodNetwork = v2->_lastGoodNetwork;
    v2->_lastGoodNetwork = 0;

    pendingLastGoodNetwork = v2->_pendingLastGoodNetwork;
    v2->_pendingLastGoodNetwork = 0;

    v2->_networkReconnectEnabled = 1;
    v9 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
    cwInterface = v2->_cwInterface;
    v2->_cwInterface = v9;

    -[CWFInterface activate](v2->_cwInterface, "activate");
    -[CBWiFiManager _registerWiFiNotifications](v2, "_registerWiFiNotifications");
    v11 = dispatch_semaphore_create(1);
    networkScanSemaphore = v2->_networkScanSemaphore;
    v2->_networkScanSemaphore = (OS_dispatch_semaphore *)v11;

  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  -[CBWiFiManager _stopWiFiNetworkScan](self, "_stopWiFiNetworkScan");
  -[CBWiFiManager _deregisterWiFiNotifications](self, "_deregisterWiFiNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
  objc_msgSend(v5, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)CBWiFiManager;
  -[CBWiFiManager dealloc](&v6, "dealloc");
}

- (void)_deregisterWiFiNotifications
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v3)
  {
    v4 = CheckerBoardLogHandleForCategory(8);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deregistering Wi-Fi notifications…", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    objc_msgSend(v6, "stopMonitoringAllEvents");

  }
}

- (void)_registerWiFiNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[8];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v3)
  {
    objc_initWeak(&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100027F18;
    v35[3] = &unk_100076080;
    objc_copyWeak(&v36, &location);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    objc_msgSend(v4, "setEventHandler:", v35);

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100027F60;
    v33[3] = &unk_100075510;
    objc_copyWeak(&v34, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    objc_msgSend(v5, "setInvalidationHandler:", v33);

    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Registering for Wi-Fi notifications…", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v31 = 0;
    objc_msgSend(v8, "startMonitoringEventType:error:", 10, &v31);
    v9 = v31;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v30 = v9;
    objc_msgSend(v10, "startMonitoringEventType:error:", 11, &v30);
    v11 = v30;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v29 = v11;
    objc_msgSend(v12, "startMonitoringEventType:error:", 18, &v29);
    v13 = v29;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v28 = v13;
    objc_msgSend(v14, "startMonitoringEventType:error:", 24, &v28);
    v15 = v28;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v27 = v15;
    objc_msgSend(v16, "startMonitoringEventType:error:", 1, &v27);
    v17 = v27;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v26 = v17;
    objc_msgSend(v18, "startMonitoringEventType:error:", 6, &v26);
    v19 = v26;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v25 = v19;
    objc_msgSend(v20, "startMonitoringEventType:error:", 7, &v25);
    v21 = v25;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v24 = v21;
    objc_msgSend(v22, "startMonitoringEventType:error:", 2, &v24);
    v23 = v24;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

- (void)_handleCWInterfaceEvent:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  float v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  double v36;
  int v37;
  _QWORD v38[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  switch((unint64_t)v5)
  {
    case 1uLL:
      v6 = CheckerBoardLogHandleForCategory(8);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device power callback triggered", (uint8_t *)&v37, 2u);
      }

      -[CBWiFiManager _powerStateDidChange](self, "_powerStateDidChange");
      goto LABEL_38;
    case 2uLL:
      v13 = CheckerBoardLogHandleForCategory(8);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "networkName"));
        v37 = 138412290;
        v38[0] = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WiFi SSID has changed: %@", (uint8_t *)&v37, 0xCu);

      }
      goto LABEL_33;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_9;
    case 6uLL:
      v17 = CheckerBoardLogHandleForCategory(8);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Extended link changed", (uint8_t *)&v37, 2u);
      }

      v19 = CheckerBoardLogHandleForCategory(8);
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cachedLinkDownStatus"));
        v37 = 138412290;
        v38[0] = v21;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiFi link status set to %@", (uint8_t *)&v37, 0xCu);

      }
      goto LABEL_18;
    case 7uLL:
      v22 = CheckerBoardLogHandleForCategory(8);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Link quality changed", (uint8_t *)&v37, 2u);
      }

      v24 = 0.0;
      if (-[CBWiFiManager isAssociatedToNetwork](self, "isAssociatedToNetwork"))
      {
        v25 = (id)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

        if (v25)
        {
          v26 = CheckerBoardLogHandleForCategory(8);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v37) = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating signal strength…", (uint8_t *)&v37, 2u);
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentScanResult"));
          v25 = objc_msgSend(v29, "RSSI");

          v24 = WFScaleRSSI((int)v25);
        }
      }
      else
      {
        v25 = 0;
      }
      v34 = CheckerBoardLogHandleForCategory(8);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 67109376;
        LODWORD(v38[0]) = (_DWORD)v25;
        WORD2(v38[0]) = 2048;
        *(double *)((char *)v38 + 6) = v24;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Raw RSSI %d, Scaled RSSI %f", (uint8_t *)&v37, 0x12u);
      }

      *(float *)&v36 = v24;
      -[CBWiFiManager _updateSignalStrengthFromRawRSSI:andScaledRSSI:](self, "_updateSignalStrengthFromRawRSSI:andScaledRSSI:", v25, v36);
      goto LABEL_38;
    case 0xAuLL:
      v30 = CheckerBoardLogHandleForCategory(8);
      v14 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      LOWORD(v37) = 0;
      v31 = "WiFi available callback triggered";
      goto LABEL_32;
    case 0xBuLL:
      v32 = CheckerBoardLogHandleForCategory(8);
      v14 = objc_claimAutoreleasedReturnValue(v32);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      LOWORD(v37) = 0;
      v31 = "Device attachment callback triggered";
      goto LABEL_32;
    default:
      if (v5 == (id)18)
      {
        v33 = CheckerBoardLogHandleForCategory(8);
        v14 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v37) = 0;
          v31 = "Wifi network service changed";
LABEL_32:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v37, 2u);
        }
LABEL_33:

        -[CBWiFiManager updateWiFiState](self, "updateWiFiState");
      }
      else if (v5 == (id)24)
      {
        v8 = CheckerBoardLogHandleForCategory(8);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
          v37 = 67109120;
          LODWORD(v38[0]) = objc_msgSend(v10, "reachabilityFlags");
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiFi Reachability has changes %u", (uint8_t *)&v37, 8u);

        }
LABEL_18:

      }
      else
      {
LABEL_9:
        v11 = CheckerBoardLogHandleForCategory(8);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 134217984;
          v38[0] = objc_msgSend(v4, "type");
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unhandled CWFEvent %ld", (uint8_t *)&v37, 0xCu);
        }

      }
LABEL_38:

      return;
  }
}

- (NSString)currentNetworkSSID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentScanResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "networkName"));

  return (NSString *)v4;
}

- (void)updateWiFiState
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating Wi-Fi state…", v5, 2u);
  }

  -[CBWiFiManager _updateForAssociationChange](self, "_updateForAssociationChange");
  -[CBWiFiManager _updateSignalStrength](self, "_updateSignalStrength");
}

- (void)_updateForAssociationChange
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;

  if (-[CBWiFiManager isAssociatedToNetwork](self, "isAssociatedToNetwork"))
  {
    if (-[CBWiFiManager reconnecting](self, "reconnecting"))
    {
      -[CBWiFiManager _resolveReconnectingStatus](self, "_resolveReconnectingStatus");
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
      if (v11)
      {
        v12 = (void *)v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scanResult"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "networkName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager currentNetworkSSID](self, "currentNetworkSSID"));
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          v18 = CheckerBoardLogHandleForCategory(8);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager currentNetworkSSID](self, "currentNetworkSSID"));
            *(_DWORD *)buf = 138412290;
            v24 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating last known good network to %@", buf, 0xCu);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
          -[CBWiFiManager setLastGoodNetwork:](self, "setLastGoodNetwork:", v21);

          -[CBWiFiManager setPendingLastGoodNetwork:](self, "setPendingLastGoodNetwork:", 0);
        }
      }
    }
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[CBWiFiManager reconnecting](self, "reconnecting");

      if ((v5 & 1) == 0)
      {
        v6 = CheckerBoardLogHandleForCategory(8);
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scanResult"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "networkName"));
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning attempt to reconnect to network %@", buf, 0xCu);

        }
        -[CBWiFiManager setReconnecting:](self, "setReconnecting:", 1);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000288D4;
        block[3] = &unk_1000753E8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (void)_resolveReconnectingStatus
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (-[CBWiFiManager isAssociatedToNetwork](self, "isAssociatedToNetwork")
    && -[CBWiFiManager reconnecting](self, "reconnecting"))
  {
    v3 = CheckerBoardLogHandleForCategory(8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending attempt to reconnect to network", v7, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager reconnectTimer](self, "reconnectTimer"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager reconnectTimer](self, "reconnectTimer"));
      objc_msgSend(v6, "invalidate");

      -[CBWiFiManager setReconnectTimer:](self, "setReconnectTimer:", 0);
    }
    -[CBWiFiManager stopWiFiNetworkScanRequestFrom:](self, "stopWiFiNetworkScanRequestFrom:", self);
    -[CBWiFiManager setReconnecting:](self, "setReconnecting:", 0);
  }
}

- (BOOL)isAssociatedToNetwork
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentScanResult"));
  v4 = v3 != 0;

  return v4;
}

- (void)_sortWiFiScanResultsAlphabetically:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sorting Wi-Fi scan results…", v6, 2u);
  }

  objc_msgSend(v3, "sortWithOptions:usingComparator:", 16, &stru_1000760C0);
}

- (void)_forceWiFiOnIfNecessary
{
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[CBWiFiManager isWiFiPoweredOn](self, "isWiFiPoweredOn");
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi is on post Wi-Fi being ready for us", v7, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi is off post Wi-Fi being ready for us. Forcing it on now…", buf, 2u);
    }

    -[CBWiFiManager setPowered:](self, "setPowered:", 1);
  }
}

- (void)setPowered:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting Wi-Fi power state to %d", buf, 8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v12 = 0;
    objc_msgSend(v8, "setPower:error:", v3, &v12);
    v9 = v12;

    if (v9)
    {
      v10 = CheckerBoardLogHandleForCategory(8);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Wifi power-on caused an error: %@", buf, 0xCu);
      }

    }
    else
    {
      -[CBWiFiManager _powerStateDidChange](self, "_powerStateDidChange");
    }

  }
}

- (void)_powerStateDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    -[CBWiFiManager setWifiPoweredOn:](self, "setWifiPoweredOn:", objc_msgSend(v4, "powerOn"));

    v5 = CheckerBoardLogHandleForCategory(8);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = -[CBWiFiManager isWiFiPoweredOn](self, "isWiFiPoweredOn");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Wi-Fi power state changed to %d", (uint8_t *)v8, 8u);
    }

    -[CBWiFiManager updateWiFiState](self, "updateWiFiState");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CBWiFiPowerStateDidChangeNotification"), 0);

  }
}

- (id)scanParametersWithSSID:(id)a3 isHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v6, "setIncludeHiddenNetworks:", v4);
  objc_msgSend(v6, "setMinimumRSSI:", -80);
  if (v5)
    objc_msgSend(v6, "setSSID:", v5);
  objc_msgSend(v6, "setMergeScanResults:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_100078F58));
  objc_msgSend(v6, "setIncludeProperties:", v7);

  return v6;
}

- (void)startWiFiNetworkScanRequestFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  int v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors"));
    v6 = objc_msgSend(v5, "count");

    v7 = CheckerBoardLogHandleForCategory(8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WiFi scan requested by %@, but it is not the first.", (uint8_t *)&v15, 0xCu);
      }

    }
    else
    {
      if (v9)
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "First WiFi scan request from %@. Beginning WiFi scan", (uint8_t *)&v15, 0xCu);
      }

      -[CBWiFiManager _startWiFiNetworkScan](self, "_startWiFiNetworkScan");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors"));
    v13 = objc_msgSend(v12, "containsObject:", v4);

    if ((v13 & 1) != 0)
    {
      v14 = CheckerBoardLogHandleForCategory(8);
      v11 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is already known to be a WiFi scan requestor", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors"));
      -[NSObject addObject:](v11, "addObject:", v4);
    }
  }
  else
  {
    v10 = CheckerBoardLogHandleForCategory(8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100045A68();
  }

}

- (void)_startWiFiNetworkScan
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029230;
  block[3] = &unk_100075628;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)stopWiFiNetworkScanRequestFrom:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors")),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        v6))
  {
    v7 = CheckerBoardLogHandleForCategory(8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WiFi scan requestor %@ no longer needs WiFi scan.", (uint8_t *)&v16, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors"));
    objc_msgSend(v9, "removeObject:", v4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager wifiScanRequestors](self, "wifiScanRequestors"));
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      v12 = CheckerBoardLogHandleForCategory(8);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Count of requestors for WiFi scan is now zero. Stopping WiFi scan.", (uint8_t *)&v16, 2u);
      }

      -[CBWiFiManager _stopWiFiNetworkScan](self, "_stopWiFiNetworkScan");
    }
  }
  else
  {
    v14 = CheckerBoardLogHandleForCategory(8);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100045AF4();

  }
}

- (void)_stopWiFiNetworkScan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[8];
  uint64_t v13;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestParameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    v13 = 0;
    objc_msgSend(v4, "cancelRequestsWithUUID:error:", v7, &v13);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager scanTimer](self, "scanTimer"));

  if (v8)
  {
    v9 = CheckerBoardLogHandleForCategory(8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalidating scan timer…", v12, 2u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager scanTimer](self, "scanTimer"));
    objc_msgSend(v11, "invalidate");

    -[CBWiFiManager setScanTimer:](self, "setScanTimer:", 0);
  }
}

- (void)_restartWiFiNetworkScan
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting network scan…", v5, 2u);
  }

  -[CBWiFiManager _stopWiFiNetworkScan](self, "_stopWiFiNetworkScan");
  -[CBWiFiManager updateWiFiState](self, "updateWiFiState");
  -[CBWiFiManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startWiFiNetworkScan", 0, 0.3);
}

- (void)_wifiScanCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CBWiFiManager updateWiFiState](self, "updateWiFiState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  -[CBWiFiManager setFilteredWiFiScanResults:](self, "setFilteredWiFiScanResults:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager filteredWiFiScanResults](self, "filteredWiFiScanResults"));
  -[CBWiFiManager _sortWiFiScanResultsAlphabetically:](self, "_sortWiFiScanResultsAlphabetically:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CBWiFiNetworkScanCompletedNotification"), 0);

  -[CBWiFiManager setScanning:](self, "setScanning:", 0);
  -[CBWiFiManager _setTimeForNextScan:](self, "_setTimeForNextScan:", 8.0);
}

- (void)_setTimeForNextScan:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[6];
  uint8_t buf[4];
  double v15;

  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Performing next scan in %f seconds", buf, 0xCu);
  }

  if (-[CBWiFiManager scanning](self, "scanning"))
  {
    v7 = CheckerBoardLogHandleForCategory(8);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device is already scanning for networks", buf, 2u);
    }

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager scanTimer](self, "scanTimer"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager scanTimer](self, "scanTimer"));
      objc_msgSend(v10, "invalidate");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager filteredWiFiScanResults](self, "filteredWiFiScanResults"));
    v12 = objc_msgSend(v11, "copy");
    -[CBWiFiManager setPreviousScanFilteredWiFiScanResults:](self, "setPreviousScanFilteredWiFiScanResults:", v12);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100029A94;
    v13[3] = &unk_100076110;
    v13[4] = self;
    *(double *)&v13[5] = a3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v13);
  }
}

- (BOOL)attemptingToAssociateToCurrentNetworkByIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager filteredWiFiScanResults](self, "filteredWiFiScanResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "networkName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager currentNetworkSSID](self, "currentNetworkSSID"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  return v9;
}

- (void)associateToNetworkByIndex:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager filteredWiFiScanResults](self, "filteredWiFiScanResults"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  -[CBWiFiManager _associateToNetworkWithScanResult:](self, "_associateToNetworkWithScanResult:", v6);
}

- (id)_associationParametersFromScanResult:(id)a3 withPassword:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)CWFAssocParameters);
  objc_msgSend(v7, "setScanResult:", v6);

  objc_msgSend(v7, "setRememberUponSuccessfulAssociation:", 1);
  if (v5)
    objc_msgSend(v7, "setPassword:", v5);

  return v7;
}

- (void)associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4
{
  -[CBWiFiManager _associateToEncryptedNetworkWithScanResult:password:isHidden:](self, "_associateToEncryptedNetworkWithScanResult:password:isHidden:", a3, a4, 0);
}

- (void)associateToEncryptedNetworkWithName:(id)a3 password:(id)a4
{
  -[CBWiFiManager _performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:](self, "_performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:", 0, a3, a4);
}

- (void)associateToHiddenEncryptedNetworkWithName:(id)a3 password:(id)a4
{
  -[CBWiFiManager _performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:](self, "_performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:", 1, a3, a4);
}

- (void)associateToHiddenUnencryptedNetworkWithName:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to associate to network with a directed scan", v7, 2u);
  }

  -[CBWiFiManager _performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:](self, "_performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:", 1, v4, 0);
}

- (void)_performDirectedScanIncludingHidden:(BOOL)a3 AndAssociateToNetworkWithName:(id)a4 password:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  dispatch_queue_global_t global_queue;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id buf;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = CheckerBoardLogHandleForCategory(8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to associate to network with hidden scan (%d)…", (uint8_t *)&buf, 8u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v13 = v12;
  if (v9)
    v14 = CFSTR("CBWiFiManagerWillAssociateToEncryptedNetworkNotification");
  else
    v14 = CFSTR("CBWiFiManagerWillAssociateToOpenNetworkNotification");
  objc_msgSend(v12, "postNotificationName:object:userInfo:", v14, 0, &__NSDictionary0__struct);

  objc_initWeak(&buf, self);
  global_queue = dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029ED0;
  block[3] = &unk_100076160;
  objc_copyWeak(&v22, &buf);
  block[4] = self;
  v20 = v8;
  v23 = v6;
  v21 = v9;
  v17 = v9;
  v18 = v8;
  dispatch_async(v16, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&buf);
}

- (void)_associateToNetworkWithScanResult:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "requiresPassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  if (v5)
  {
    v11 = CFSTR("CBNetworkInfoKey");
    v12 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerWillAssociateToEncryptedNetworkNotification"), 0, v7);
  }
  else
  {
    v9 = CFSTR("CBNetworkInfoKey");
    v10 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("CBWiFiManagerWillAssociateToOpenNetworkNotification"), 0, v8);

    -[CBWiFiManager _associateToUnencryptedNetwork:](self, "_associateToUnencryptedNetwork:", v4);
    v6 = v4;
  }

}

- (void)_savePendingInfoWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CBWiFiNetworkInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  if (!-[CBWiFiManager reconnecting](self, "reconnecting"))
  {
    v9 = objc_alloc_init(CBWiFiNetworkInfo);
    -[CBWiFiManager setPendingLastGoodNetwork:](self, "setPendingLastGoodNetwork:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
    objc_msgSend(v10, "setScanResult:", v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
    objc_msgSend(v11, "setPassword:", v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager pendingLastGoodNetwork](self, "pendingLastGoodNetwork"));
    objc_msgSend(v12, "setIsHidden:", v5);

    -[CBWiFiManager setLastGoodNetwork:](self, "setLastGoodNetwork:", 0);
  }

}

- (void)_associateToEncryptedNetworkWithScanResult:(id)a3 password:(id)a4 isHidden:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id buf[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v10)
  {
    v11 = CheckerBoardLogHandleForCategory(8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        LOWORD(buf[0]) = 0;
        v14 = "Attempting to associate to network with password…";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)buf, 2u);
      }
    }
    else if (v13)
    {
      LOWORD(buf[0]) = 0;
      v14 = "Attempting to associate to network with no password…";
      goto LABEL_7;
    }

    -[CBWiFiManager _savePendingInfoWithScanResult:password:isHidden:](self, "_savePendingInfoWithScanResult:password:isHidden:", v8, v9, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager _associationParametersFromScanResult:withPassword:](self, "_associationParametersFromScanResult:withPassword:", v8, v9));
    objc_initWeak(buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A7F0;
    v17[3] = &unk_100076188;
    objc_copyWeak(&v18, buf);
    objc_msgSend(v16, "associateWithParameters:reply:", v15, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);

  }
}

- (void)_associateToUnencryptedNetwork:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Begin unencrypted network association…", (uint8_t *)buf, 2u);
    }

    -[CBWiFiManager _savePendingInfoWithScanResult:password:isHidden:](self, "_savePendingInfoWithScanResult:password:isHidden:", v4, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager _associationParametersFromScanResult:withPassword:](self, "_associationParametersFromScanResult:withPassword:", v4, 0));
    objc_initWeak(buf, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002A9D8;
    v10[3] = &unk_100076188;
    objc_copyWeak(&v11, buf);
    objc_msgSend(v9, "associateWithParameters:reply:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);

  }
}

- (void)_associateToHiddenUnencryptedNetwork:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(8);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Begin hidden unencrypted network association…", (uint8_t *)buf, 2u);
    }

    -[CBWiFiManager _savePendingInfoWithScanResult:password:isHidden:](self, "_savePendingInfoWithScanResult:password:isHidden:", v4, 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager _associationParametersFromScanResult:withPassword:](self, "_associationParametersFromScanResult:withPassword:", v4, 0));
    objc_initWeak(buf, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002ABC0;
    v10[3] = &unk_100076188;
    objc_copyWeak(&v11, buf);
    objc_msgSend(v9, "associateWithParameters:reply:", v8, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);

  }
}

- (void)setAttemptsNetworkReconnect:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = CheckerBoardLogHandleForCategory(8);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network reconnect enabled: %d", (uint8_t *)v7, 8u);
  }

  -[CBWiFiManager setNetworkReconnectEnabled:](self, "setNetworkReconnectEnabled:", v3);
}

- (void)_attemptReconnect
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  unsigned int v38;

  v3 = CheckerBoardLogHandleForCategory(8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 67109120;
    LODWORD(v34) = -[CBWiFiManager reconnecting](self, "reconnecting");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempt to reconnect called, reconnecting: %d", (uint8_t *)&v33, 8u);
  }

  if (-[CBWiFiManager reconnecting](self, "reconnecting"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));

    if (v5)
    {
      v6 = -[CBWiFiManager attemptsNetworkReconnect](self, "attemptsNetworkReconnect");
      v7 = CheckerBoardLogHandleForCategory(8);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scanResult"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "networkName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scanResult"));
          v17 = objc_msgSend(v16, "requiresPassword");
          v33 = 138412802;
          v34 = v12;
          v35 = 1024;
          v36 = v14 != 0;
          v37 = 1024;
          v38 = v17;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect to network with SSID: (%@) Password: (%d) Security: (%d)", (uint8_t *)&v33, 0x18u);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "password"));

        v20 = objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
        v8 = v20;
        if (v19)
        {
          v21 = -[NSObject isHidden](v20, "isHidden");

          v8 = objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject scanResult](v8, "scanResult"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "networkName"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "password"));
          if (v21)
            -[CBWiFiManager associateToHiddenEncryptedNetworkWithName:password:](self, "associateToHiddenEncryptedNetworkWithName:password:", v23, v25);
          else
            -[CBWiFiManager associateToEncryptedNetworkWithName:password:](self, "associateToEncryptedNetworkWithName:password:", v23, v25);

        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject scanResult](v20, "scanResult"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "networkName"));
          -[CBWiFiManager associateToHiddenUnencryptedNetworkWithName:](self, "associateToHiddenUnencryptedNetworkWithName:", v23);
        }

      }
      else if (v9)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager lastGoodNetwork](self, "lastGoodNetwork"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "scanResult"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "networkName"));
        v33 = 138412290;
        v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Network reconnect is disabled. Not attempting to reconnect to network with SSID: (%@)", (uint8_t *)&v33, 0xCu);

      }
      return;
    }
    v26 = CheckerBoardLogHandleForCategory(8);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100045C40();

    -[CBWiFiManager setReconnecting:](self, "setReconnecting:", 0);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager reconnectTimer](self, "reconnectTimer"));

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager reconnectTimer](self, "reconnectTimer"));
    objc_msgSend(v29, "invalidate");

    -[CBWiFiManager setReconnectTimer:](self, "setReconnectTimer:", 0);
  }
}

- (void)_updateSignalStrength
{
  float v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  double v11;
  _DWORD v12[2];
  __int16 v13;
  double v14;

  v3 = 0.0;
  if (-[CBWiFiManager isAssociatedToNetwork](self, "isAssociatedToNetwork"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));

    if (v4)
    {
      v5 = CheckerBoardLogHandleForCategory(8);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating signal strength…", (uint8_t *)v12, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBWiFiManager cwInterface](self, "cwInterface"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentScanResult"));
      v4 = objc_msgSend(v8, "RSSI");

      v3 = WFScaleRSSI((int)v4);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = CheckerBoardLogHandleForCategory(8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = (_DWORD)v4;
    v13 = 2048;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating signal strength with raw RSSI %d and scaled RSSI %f", (uint8_t *)v12, 0x12u);
  }

  *(float *)&v11 = v3;
  -[CBWiFiManager _updateSignalStrengthFromRawRSSI:andScaledRSSI:](self, "_updateSignalStrengthFromRawRSSI:andScaledRSSI:", v4, v11);
}

- (void)_updateSignalStrengthFromRawRSSI:(int)a3 andScaledRSSI:(float)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  v5 = *(_QWORD *)&a3;
  v7 = CheckerBoardLogHandleForCategory(8);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating signal strength from raw RSSI and scaled RSSI…", (uint8_t *)v14, 2u);
  }

  v9 = -[CBWiFiManager isAssociatedToNetwork](self, "isAssociatedToNetwork");
  if (v9)
  {
    v10 = WFSignalBarsFromScaledRSSI(v9, a4);
  }
  else
  {
    v10 = 0;
    v5 = 0;
  }
  v11 = -[CBWiFiManager signalStrengthBars](self, "signalStrengthBars") != (_DWORD)v10
     || -[CBWiFiManager signalStrengthRSSI](self, "signalStrengthRSSI") != v5;
  -[CBWiFiManager setSignalStrengthBars:](self, "setSignalStrengthBars:", v10);
  -[CBWiFiManager setSignalStrengthRSSI:](self, "setSignalStrengthRSSI:", v5);
  v12 = CheckerBoardLogHandleForCategory(8);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109632;
    v14[1] = v11;
    v15 = 1024;
    v16 = v10;
    v17 = 1024;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Signal changed (%d) to bars (%d) and RSSI (%d)…", (uint8_t *)v14, 0x14u);
  }

  if (v11)
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1000761A8);
}

- (void)_postDidAssociateToEncryptedNetworkNotificationWithError:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting DidAssociateToEncryptedNetwork notification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B4CC;
  block[3] = &unk_1000753E8;
  v8 = v3;
  v6 = v3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_postDidAssociateToOpenNetworkNotificationWithError:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  v4 = CheckerBoardLogHandleForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posting DidAssociateToOpenNetwork notification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B610;
  block[3] = &unk_1000753E8;
  v8 = v3;
  v6 = v3;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

}

- (NSMutableArray)filteredWiFiScanResults
{
  return self->_filteredWiFiScanResults;
}

- (void)setFilteredWiFiScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_filteredWiFiScanResults, a3);
}

- (NSMutableArray)previousScanFilteredWiFiScanResults
{
  return self->_previousScanFilteredWiFiScanResults;
}

- (void)setPreviousScanFilteredWiFiScanResults:(id)a3
{
  objc_storeStrong((id *)&self->_previousScanFilteredWiFiScanResults, a3);
}

- (int)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(int)a3
{
  self->_signalStrengthBars = a3;
}

- (int)signalStrengthRSSI
{
  return self->_signalStrengthRSSI;
}

- (void)setSignalStrengthRSSI:(int)a3
{
  self->_signalStrengthRSSI = a3;
}

- (BOOL)isWiFiPoweredOn
{
  return self->_wifiPoweredOn;
}

- (void)setWifiPoweredOn:(BOOL)a3
{
  self->_wifiPoweredOn = a3;
}

- (BOOL)attemptsNetworkReconnect
{
  return self->_networkReconnectEnabled;
}

- (void)setNetworkReconnectEnabled:(BOOL)a3
{
  self->_networkReconnectEnabled = a3;
}

- (NSMutableSet)wifiScanRequestors
{
  return self->_wifiScanRequestors;
}

- (void)setWifiScanRequestors:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanRequestors, a3);
}

- (CBWiFiNetworkInfo)lastGoodNetwork
{
  return self->_lastGoodNetwork;
}

- (void)setLastGoodNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_lastGoodNetwork, a3);
}

- (CBWiFiNetworkInfo)pendingLastGoodNetwork
{
  return self->_pendingLastGoodNetwork;
}

- (void)setPendingLastGoodNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLastGoodNetwork, a3);
}

- (NSTimer)reconnectTimer
{
  return self->_reconnectTimer;
}

- (void)setReconnectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reconnectTimer, a3);
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (void)setReconnecting:(BOOL)a3
{
  self->_reconnecting = a3;
}

- (CWFInterface)cwInterface
{
  return self->_cwInterface;
}

- (void)setCwInterface:(id)a3
{
  objc_storeStrong((id *)&self->_cwInterface, a3);
}

- (NSTimer)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimer, a3);
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_semaphore)networkScanSemaphore
{
  return self->_networkScanSemaphore;
}

- (void)setNetworkScanSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_networkScanSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkScanSemaphore, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_cwInterface, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_pendingLastGoodNetwork, 0);
  objc_storeStrong((id *)&self->_lastGoodNetwork, 0);
  objc_storeStrong((id *)&self->_wifiScanRequestors, 0);
  objc_storeStrong((id *)&self->_previousScanFilteredWiFiScanResults, 0);
  objc_storeStrong((id *)&self->_filteredWiFiScanResults, 0);
}

@end
