@implementation BuddyNetworkProvider

- (BuddyNetworkProvider)init
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  nw_path_monitor_t v10;
  void *v11;
  NSObject *v12;
  BuddyNetworkProvider *v13;
  void **update_handler;
  int v16;
  int v17;
  void (*v18)(NSObject *, void *);
  void *v19;
  id v20;
  objc_super v21;
  SEL v22;
  id location;

  v22 = a2;
  location = 0;
  v21.receiver = self;
  v21.super_class = (Class)BuddyNetworkProvider;
  location = -[BuddyNetworkProvider init](&v21, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_alloc_init((Class)NWPathEvaluator);
    v3 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v2;

    v4 = objc_alloc((Class)CoreTelephonyClient);
    v5 = dispatch_get_global_queue(0, 0);
    v6 = objc_msgSend(v4, "initWithQueue:", v5);
    v7 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v6;

    v8 = dispatch_queue_create("Force Network Reachability Queue", 0);
    v9 = (void *)*((_QWORD *)location + 5);
    *((_QWORD *)location + 5) = v8;

    v10 = nw_path_monitor_create();
    v11 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v10;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)location + 4), *((dispatch_queue_t *)location + 5));
    v12 = *((_QWORD *)location + 4);
    update_handler = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_10007E1FC;
    v19 = &unk_100280958;
    v20 = location;
    nw_path_monitor_set_update_handler(v12, &update_handler);
    nw_path_monitor_start(*((nw_path_monitor_t *)location + 4));
    objc_storeStrong(&v20, 0);
  }
  v13 = (BuddyNetworkProvider *)location;
  objc_storeStrong(&location, 0);
  return v13;
}

- (BOOL)networkReachable
{
  NWPathEvaluator *v2;
  id v3;
  char *v4;
  char v7;

  if (!-[BuddyNetworkProvider forceNetworkReachabilityOverWiFi](self, "forceNetworkReachabilityOverWiFi"))
  {
    v2 = -[BuddyNetworkProvider pathEvaluator](self, "pathEvaluator");
    v3 = -[NWPathEvaluator path](v2, "path");
    v4 = (char *)objc_msgSend(v3, "status");

    if (v4)
    {
      if (v4 == (char *)1)
      {
        v7 = 1;
        return v7 & 1;
      }
      if ((unint64_t)(v4 - 2) >= 2)
        return v7 & 1;
    }
    v7 = 0;
    return v7 & 1;
  }
  v7 = 1;
  return v7 & 1;
}

- (BOOL)connectedOverWiFi
{
  NWPathEvaluator *v2;
  id v3;
  id v4;
  id v5;
  char v8;

  if (!-[BuddyNetworkProvider forceNetworkReachabilityOverWiFi](self, "forceNetworkReachabilityOverWiFi"))
  {
    v2 = -[BuddyNetworkProvider pathEvaluator](self, "pathEvaluator");
    v3 = -[NWPathEvaluator path](v2, "path");
    v4 = objc_msgSend(v3, "interface");
    v5 = objc_msgSend(v4, "type");

    if (v5)
    {
      if (v5 == (id)1)
        goto LABEL_9;
      if (v5 == (id)2)
        goto LABEL_8;
      if (v5 == (id)3)
      {
LABEL_9:
        v8 = 1;
        return v8 & 1;
      }
      if (v5 != (id)4)
        return v8 & 1;
    }
LABEL_8:
    v8 = 0;
    return v8 & 1;
  }
  v8 = 1;
  return v8 & 1;
}

- (BOOL)connectedOverCellular
{
  NWPathEvaluator *v2;
  id v3;
  id v4;
  char *v5;
  char v7;

  v2 = -[BuddyNetworkProvider pathEvaluator](self, "pathEvaluator");
  v3 = -[NWPathEvaluator path](v2, "path");
  v4 = objc_msgSend(v3, "interface");
  v5 = (char *)objc_msgSend(v4, "type");

  if ((unint64_t)v5 < 2)
    goto LABEL_4;
  if (v5 == (char *)2)
  {
    v7 = 1;
    return v7 & 1;
  }
  if ((unint64_t)(v5 - 3) <= 1)
LABEL_4:
    v7 = 0;
  return v7 & 1;
}

- (BOOL)connectedOverWiFiAndNetworkReachable
{
  unsigned __int8 v2;
  unsigned __int8 v3;

  v2 = -[BuddyNetworkProvider networkReachable](self, "networkReachable", a2);
  v3 = 0;
  if ((v2 & 1) != 0)
    v3 = -[BuddyNetworkProvider connectedOverWiFi](self, "connectedOverWiFi");
  return v3 & 1;
}

- (BOOL)supportsWiFi
{
  return MGGetBoolAnswer(CFSTR("wi-fi")) & 1;
}

- (BOOL)currentNetworkSupportsRestore
{
  NWPathEvaluator *v2;
  id v3;
  char *v4;
  NWPathEvaluator *v5;
  id v6;
  id v7;
  char *v8;
  NWPathEvaluator *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL8 v16;
  NSObject *v17;
  os_log_type_t v18;
  CoreTelephonyClient *v19;
  id v20;
  uint64_t v21;
  NSString *v22;
  CoreTelephonyClient *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t isKindOfClass;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  NSString *v32;
  CoreTelephonyClient *v33;
  id v34;
  uint64_t v35;
  NSString *v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t v41[7];
  os_log_type_t v42;
  os_log_t v43;
  char v44;
  id v45;
  char v46;
  id v47;
  os_log_type_t v48;
  os_log_t v49;
  id v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  os_log_type_t v56;
  os_log_t v57;
  os_log_type_t v58;
  os_log_t v59;
  uint8_t v60[7];
  os_log_type_t v61;
  os_log_t oslog;
  id obj;
  id v64;
  id v65;
  int v66;
  char v67;
  id v68;
  char v69;
  id v70;
  os_log_type_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t v76[7];
  os_log_type_t v77;
  id v78;
  uint8_t buf[15];
  os_log_type_t v80;
  id location[2];
  BuddyNetworkProvider *v82;
  char v83;
  uint8_t v84[16];
  uint8_t v85[16];
  uint8_t v86[16];
  uint8_t v87[24];

  v82 = self;
  location[1] = (id)a2;
  v2 = -[BuddyNetworkProvider pathEvaluator](self, "pathEvaluator");
  v3 = -[NWPathEvaluator path](v2, "path");
  v4 = (char *)objc_msgSend(v3, "status");

  if (!v4)
    goto LABEL_74;
  if (v4 != (char *)1)
  {
    if ((unint64_t)(v4 - 2) >= 2)
      return v83 & 1;
    goto LABEL_74;
  }
  v5 = -[BuddyNetworkProvider pathEvaluator](v82, "pathEvaluator");
  v6 = -[NWPathEvaluator path](v5, "path");
  v7 = objc_msgSend(v6, "interface");
  v8 = (char *)objc_msgSend(v7, "type");

  if ((unint64_t)v8 < 2)
    goto LABEL_73;
  if (v8 != (char *)2)
  {
    if ((unint64_t)(v8 - 3) >= 2)
    {
LABEL_74:
      v83 = 0;
      return v83 & 1;
    }
LABEL_73:
    v83 = 1;
    return v83 & 1;
  }
  v9 = -[BuddyNetworkProvider pathEvaluator](v82, "pathEvaluator");
  v10 = -[NWPathEvaluator path](v9, "path");
  v11 = objc_msgSend(v10, "interface");
  v12 = objc_msgSend(v11, "isExpensive");

  if ((v12 & 1) != 0)
  {
    location[0] = (id)_BYLoggingFacility(v13);
    v80 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = location[0];
      v15 = v80;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Cellular network is expensive; does not support restore",
        buf,
        2u);
    }
    objc_storeStrong(location, 0);
    v83 = 0;
    return v83 & 1;
  }
  v16 = -[BuddyNetworkProvider deviceSupportsCellularRestore](v82, "deviceSupportsCellularRestore");
  if (v16)
  {
    v75 = 0;
    v19 = -[BuddyNetworkProvider telephonyClient](v82, "telephonyClient");
    v73 = 0;
    v20 = -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](v19, "getCurrentDataSubscriptionContextSync:", &v73);
    objc_storeStrong(&v75, v73);
    v74 = v20;

    if (v75)
    {
      v72 = (id)_BYLoggingFacility(v21);
      v71 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
      {
        v69 = 0;
        v67 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v22 = (NSString *)v75;
        }
        else if (v75)
        {
          v70 = objc_msgSend(v75, "domain");
          v69 = 1;
          v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v70, objc_msgSend(v75, "code"));
          v68 = v22;
          v67 = 1;
        }
        else
        {
          v22 = 0;
        }
        sub_100039500((uint64_t)v87, (uint64_t)v22);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v72, v71, "Failed to get data subscription context: %{public}@", v87, 0xCu);
        if ((v67 & 1) != 0)

        if ((v69 & 1) != 0)
      }
      objc_storeStrong(&v72, 0);
      v83 = 0;
      v66 = 1;
      goto LABEL_72;
    }
    v65 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
    v23 = -[BuddyNetworkProvider telephonyClient](v82, "telephonyClient");
    obj = v75;
    v24 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v23, "copyCarrierBundleValue:key:bundleType:error:", v74, CFSTR("EnableRestoreOnCellular"), v65, &obj);
    objc_storeStrong(&v75, obj);
    v64 = v24;

    if (v64)
    {
      v26 = v64;
      v27 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v26, v27);
      if ((isKindOfClass & 1) != 0)
      {
        v29 = objc_msgSend(v64, "BOOLValue");
        if ((v29 & 1) == 0)
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v29);
          v61 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v30 = oslog;
            v31 = v61;
            sub_100038C3C(v60);
            _os_log_impl((void *)&_mh_execute_header, v30, v31, "Cellular network is disallowed for restore", v60, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          v83 = 0;
          v66 = 1;
LABEL_71:
          objc_storeStrong(&v64, 0);
          objc_storeStrong(&v65, 0);
LABEL_72:
          objc_storeStrong(&v74, 0);
          objc_storeStrong(&v75, 0);
          return v83 & 1;
        }
      }
      else
      {
        v59 = (os_log_t)(id)_BYLoggingFacility(isKindOfClass);
        v58 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          sub_100038C28((uint64_t)v86, (uint64_t)v64);
          _os_log_error_impl((void *)&_mh_execute_header, v59, v58, "Unexpected value from carrier bundle for restore: %@", v86, 0xCu);
        }
        objc_storeStrong((id *)&v59, 0);
      }
    }
    else
    {
      v57 = (os_log_t)(id)_BYLoggingFacility(v25);
      v56 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v54 = 0;
        v52 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v32 = (NSString *)v75;
        }
        else if (v75)
        {
          v55 = objc_msgSend(v75, "domain");
          v54 = 1;
          v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v55, objc_msgSend(v75, "code"));
          v53 = v32;
          v52 = 1;
        }
        else
        {
          v32 = 0;
        }
        sub_100039500((uint64_t)v85, (uint64_t)v32);
        _os_log_error_impl((void *)&_mh_execute_header, v57, v56, "Failed to get carrier bundle for restore: %{public}@", v85, 0xCu);
        if ((v52 & 1) != 0)

        if ((v54 & 1) != 0)
      }
      objc_storeStrong((id *)&v57, 0);
    }
    v33 = -[BuddyNetworkProvider telephonyClient](v82, "telephonyClient");
    v50 = v75;
    v34 = -[CoreTelephonyClient getDataStatus:error:](v33, "getDataStatus:error:", v74, &v50);
    objc_storeStrong(&v75, v50);
    v51 = v34;

    if (v75)
    {
      v49 = (os_log_t)(id)_BYLoggingFacility(v35);
      v48 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v46 = 0;
        v44 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v36 = (NSString *)v75;
        }
        else if (v75)
        {
          v47 = objc_msgSend(v75, "domain");
          v46 = 1;
          v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v47, objc_msgSend(v75, "code"));
          v45 = v36;
          v44 = 1;
        }
        else
        {
          v36 = 0;
        }
        sub_100039500((uint64_t)v84, (uint64_t)v36);
        _os_log_error_impl((void *)&_mh_execute_header, v49, v48, "Failed to get data status: %{public}@", v84, 0xCu);
        if ((v44 & 1) != 0)

        if ((v46 & 1) != 0)
      }
      objc_storeStrong((id *)&v49, 0);
      v83 = 0;
      v66 = 1;
    }
    else if ((objc_msgSend(v51, "newRadioCoverage") & 1) != 0)
    {
      v83 = 1;
      v66 = 1;
    }
    else if (objc_msgSend(v51, "radioTechnology") == 7
           || (v37 = objc_msgSend(v51, "radioTechnology"), (_DWORD)v37 == 10))
    {
      v83 = 1;
      v66 = 1;
    }
    else
    {
      v43 = (os_log_t)(id)_BYLoggingFacility(v37);
      v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v43;
        v39 = v42;
        sub_100038C3C(v41);
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Cellular network is not qualified for restore", v41, 2u);
      }
      objc_storeStrong((id *)&v43, 0);
      v83 = 0;
      v66 = 1;
    }
    objc_storeStrong(&v51, 0);
    goto LABEL_71;
  }
  v78 = (id)_BYLoggingFacility(v16);
  v77 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v78;
    v18 = v77;
    sub_100038C3C(v76);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Device does not support cellular restore", v76, 2u);
  }
  objc_storeStrong(&v78, 0);
  v83 = 0;
  return v83 & 1;
}

- (BOOL)currentNetworkRequiresDataUsageWarningForRestore
{
  NWPathEvaluator *v2;
  id v3;
  id v4;
  BOOL v5;

  v2 = -[BuddyNetworkProvider pathEvaluator](self, "pathEvaluator", a2, self);
  v3 = -[NWPathEvaluator path](v2, "path");
  v4 = objc_msgSend(v3, "interface");
  v5 = objc_msgSend(v4, "type") == (id)2;

  return v5;
}

- (BOOL)isCellularDataPossible
{
  CoreTelephonyClient *v2;
  id v3;
  uint64_t v4;
  NSString *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  char v9;
  NSString *v10;
  char v11;
  id v12;
  os_log_t oslog;
  id obj;
  id v15;
  id location[3];
  char v17;
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = -[BuddyNetworkProvider telephonyClient](self, "telephonyClient");
  obj = 0;
  v3 = -[CoreTelephonyClient getInternetDataStatusBasicSync:](v2, "getInternetDataStatusBasicSync:", &obj);
  objc_storeStrong(location, obj);
  v15 = v3;

  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v9 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v12 = objc_msgSend(location[0], "domain");
        v11 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v12, objc_msgSend(location[0], "code"));
        v10 = v5;
        v9 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to get data subscription context: %{public}@", buf, 0xCu);
      if ((v9 & 1) != 0)

      if ((v11 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v17 = 0;
  }
  else
  {
    v6 = objc_msgSend(v15, "roamAllowed");
    v7 = 0;
    if ((v6 & 1) != 0)
      v7 = objc_msgSend(v15, "cellularDataPossible");
    v17 = v7 & 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (BOOL)deviceSupportsCellularRestore
{
  CoreTelephonyClient *v2;
  id v3;
  uint64_t v4;
  NSString *v5;
  CoreTelephonyClient *v6;
  id v7;
  uint64_t v8;
  NSString *v9;
  char v11;
  NSString *v12;
  char v13;
  id v14;
  os_log_t v15;
  id v16;
  id v17;
  int v18;
  char v19;
  id v20;
  char v21;
  id v22;
  os_log_type_t v23;
  os_log_t oslog;
  id obj;
  id v26;
  id location[2];
  BuddyNetworkProvider *v28;
  char v29;
  uint8_t v30[16];
  uint8_t buf[24];

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = -[BuddyNetworkProvider telephonyClient](self, "telephonyClient");
  obj = 0;
  v3 = -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](v2, "getCurrentDataSubscriptionContextSync:", &obj);
  objc_storeStrong(location, obj);
  v26 = v3;

  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v21 = 0;
      v19 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v22 = objc_msgSend(location[0], "domain");
        v21 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v22, objc_msgSend(location[0], "code"));
        v20 = v5;
        v19 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v23, "Failed to get data subscription context: %{public}@", buf, 0xCu);
      if ((v19 & 1) != 0)

      if ((v21 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
    v29 = 0;
    v18 = 1;
  }
  else
  {
    v6 = -[BuddyNetworkProvider telephonyClient](v28, "telephonyClient");
    v16 = location[0];
    v7 = -[CoreTelephonyClient getSupports5G:error:](v6, "getSupports5G:error:", v26, &v16);
    objc_storeStrong(location, v16);
    v17 = v7;

    if (location[0])
    {
      v15 = (os_log_t)(id)_BYLoggingFacility(v8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v13 = 0;
        v11 = 0;
        if ((_BYIsInternalInstall() & 1) != 0)
        {
          v9 = (NSString *)location[0];
        }
        else if (location[0])
        {
          v14 = objc_msgSend(location[0], "domain");
          v13 = 1;
          v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v14, objc_msgSend(location[0], "code"));
          v12 = v9;
          v11 = 1;
        }
        else
        {
          v9 = 0;
        }
        sub_100039500((uint64_t)v30, (uint64_t)v9);
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to determine 5G support: %{public}@", v30, 0xCu);
        if ((v11 & 1) != 0)

        if ((v13 & 1) != 0)
      }
      objc_storeStrong((id *)&v15, 0);
      v29 = 0;
      v18 = 1;
    }
    else
    {
      v29 = objc_msgSend(v17, "BOOLValue") & 1;
      v18 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v29 & 1;
}

- (BOOL)inAppleStore
{
  id v2;
  unsigned __int8 v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)CWFInterface);
  objc_msgSend(location[0], "activate");
  v2 = objc_msgSend(location[0], "networkName");
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Apple Store"));

  objc_msgSend(location[0], "invalidate");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)assumeNetworkReachabilityOverWiFi
{
  OS_dispatch_queue *v2;
  void **block;
  int v4;
  int v5;
  id (*v6);
  void *v7;
  id v8[2];
  BuddyNetworkProvider *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[BuddyNetworkProvider forceNetworkReachabilityQueue](self, "forceNetworkReachabilityQueue");
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10007F7CC;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pathMonitor, a3);
}

- (BOOL)forceNetworkReachabilityOverWiFi
{
  return self->_forceNetworkReachabilityOverWiFi;
}

- (void)setForceNetworkReachabilityOverWiFi:(BOOL)a3
{
  self->_forceNetworkReachabilityOverWiFi = a3;
}

- (OS_dispatch_queue)forceNetworkReachabilityQueue
{
  return self->_forceNetworkReachabilityQueue;
}

- (void)setForceNetworkReachabilityQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceNetworkReachabilityQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end
