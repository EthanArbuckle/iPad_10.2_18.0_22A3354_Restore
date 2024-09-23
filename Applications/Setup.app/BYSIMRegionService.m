@implementation BYSIMRegionService

- (BYSIMRegionService)init
{
  id v2;
  BYSIMRegionService *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BYSIMRegionService;
  location = -[BYSIMRegionService init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
    objc_msgSend(location, "setTelephonyClient:", v2);

  }
  v3 = (BYSIMRegionService *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (id)cellularNetworkInformation
{
  CoreTelephonyClient *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  CoreTelephonyClient *v10;
  id v11;
  id v12;
  CoreTelephonyClient *v13;
  id v14;
  id v15;
  CoreTelephonyClient *v16;
  id v17;
  id v18;
  CoreTelephonyClient *v19;
  id v20;
  id v21;
  id v22;
  BYSIMRegionService *v23;
  id v24;
  id v25;
  id v26;
  BYSIMRegionService *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  os_log_t oslog;
  id v34;
  id v35;
  id v36;
  id obj;
  id v38;
  id v39;
  _QWORD __b[8];
  id v41;
  os_log_type_t v42;
  id v43;
  id v44;
  id v45;
  id location;
  id v47[2];
  BYSIMRegionService *v48;
  uint8_t v49[16];
  uint8_t v50[128];
  uint8_t buf[24];

  v48 = self;
  v47[1] = (id)a2;
  v47[0] = objc_alloc_init((Class)NSMutableArray);
  location = 0;
  v2 = -[BYSIMRegionService telephonyClient](v48, "telephonyClient");
  v44 = 0;
  v3 = -[CoreTelephonyClient getActiveContexts:](v2, "getActiveContexts:", &v44);
  objc_storeStrong(&location, v44);
  v45 = v3;

  if (location)
  {
    v43 = (id)_BYLoggingFacility(v4);
    v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v43, v42, "Unable to get active telephony contexts { error: %@ }", buf, 0xCu);
    }
    objc_storeStrong(&v43, 0);
  }
  memset(__b, 0, sizeof(__b));
  v5 = objc_msgSend(v45, "subscriptions");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v5);
        v41 = *(id *)(__b[1] + 8 * i);
        v39 = objc_alloc_init(BYCellularNetworkInformation);
        v9 = objc_alloc((Class)CTXPCServiceSubscriptionContext);
        v38 = objc_msgSend(v9, "initWithSlot:", objc_msgSend(v41, "slotID"));
        if (v38)
        {
          objc_storeStrong(&location, 0);
          v10 = -[BYSIMRegionService telephonyClient](v48, "telephonyClient");
          obj = location;
          v11 = -[CoreTelephonyClient copyMobileSubscriberCountryCode:error:](v10, "copyMobileSubscriberCountryCode:error:", v38, &obj);
          objc_storeStrong(&location, obj);
          v12 = objc_msgSend(v11, "integerValue");
          objc_msgSend(v39, "setHomeMCC:", v12);

          -[BYSIMRegionService logTelephonyError:](v48, "logTelephonyError:", location);
          objc_storeStrong(&location, 0);
          v13 = -[BYSIMRegionService telephonyClient](v48, "telephonyClient");
          v36 = location;
          v14 = -[CoreTelephonyClient copyMobileSubscriberNetworkCode:error:](v13, "copyMobileSubscriberNetworkCode:error:", v38, &v36);
          objc_storeStrong(&location, v36);
          v15 = objc_msgSend(v14, "integerValue");
          objc_msgSend(v39, "setHomeMNC:", v15);

          -[BYSIMRegionService logTelephonyError:](v48, "logTelephonyError:", location);
          objc_storeStrong(&location, 0);
          v16 = -[BYSIMRegionService telephonyClient](v48, "telephonyClient");
          v35 = location;
          v17 = -[CoreTelephonyClient copyMobileCountryCode:error:](v16, "copyMobileCountryCode:error:", v38, &v35);
          objc_storeStrong(&location, v35);
          v18 = objc_msgSend(v17, "integerValue");
          objc_msgSend(v39, "setNetworkMCC:", v18);

          -[BYSIMRegionService logTelephonyError:](v48, "logTelephonyError:", location);
          objc_storeStrong(&location, 0);
          v19 = -[BYSIMRegionService telephonyClient](v48, "telephonyClient");
          v34 = location;
          v20 = -[CoreTelephonyClient copyMobileNetworkCode:error:](v19, "copyMobileNetworkCode:error:", v38, &v34);
          objc_storeStrong(&location, v34);
          v21 = objc_msgSend(v20, "integerValue");
          objc_msgSend(v39, "setNetworkMNC:", v21);

          -[BYSIMRegionService logTelephonyError:](v48, "logTelephonyError:", location);
          v22 = -[BYSIMRegionService isoCodeForMCC:](v48, "isoCodeForMCC:", objc_msgSend(v39, "homeMCC"));
          objc_msgSend(v39, "setHomeCountryISOCode:", v22);

          v23 = v48;
          v24 = objc_msgSend(v39, "homeMCC");
          v25 = -[BYSIMRegionService subregionISOCodesForMCC:MNC:](v23, "subregionISOCodesForMCC:MNC:", v24, objc_msgSend(v39, "homeMNC"));
          objc_msgSend(v39, "setHomeSubregionISOCodes:", v25);

          v26 = -[BYSIMRegionService isoCodeForMCC:](v48, "isoCodeForMCC:", objc_msgSend(v39, "networkMCC"));
          objc_msgSend(v39, "setNetworkCountryISOCode:", v26);

          v27 = v48;
          v28 = objc_msgSend(v39, "networkMCC");
          v29 = -[BYSIMRegionService subregionISOCodesForMCC:MNC:](v27, "subregionISOCodesForMCC:MNC:", v28, objc_msgSend(v39, "networkMNC"));
          objc_msgSend(v39, "setNetworkSubregionISOCodes:", v29);

          objc_msgSend(v47[0], "addObject:", v39);
        }
        else
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(0);
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v30 = oslog;
            sub_1000342B4((uint64_t)v49, (uint64_t)objc_msgSend(v41, "slotID"));
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Unable to find selected context to load telephony network information { slot: %ld }", v49, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v39, 0);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v50, 16);
    }
    while (v6);
  }

  v31 = v47[0];
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v47, 0);
  return v31;
}

- (void)logTelephonyError:(id)a3
{
  uint64_t v3;
  os_log_t oslog;
  id location[3];
  uint8_t buf[24];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error reading telephony network information { error: %@ }", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)isoCodeForMCC:(int64_t)a3
{
  NSNumber *v3;
  CoreTelephonyClient *v4;
  id v5;
  uint64_t v6;
  id v7;
  os_log_t oslog;
  id obj;
  id v11;
  id v12;
  id location[3];
  BYSIMRegionService *v14;
  uint8_t buf[24];

  v14 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
  v12 = -[NSNumber stringValue](v3, "stringValue");

  v4 = -[BYSIMRegionService telephonyClient](v14, "telephonyClient");
  obj = 0;
  v5 = -[CoreTelephonyClient copyMobileSubscriberIsoCountryCode:error:](v4, "copyMobileSubscriberIsoCountryCode:error:", v12, &obj);
  objc_storeStrong(location, obj);
  v11 = objc_msgSend(v5, "uppercaseString");

  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10003EB04((uint64_t)buf, (uint64_t)v12, (uint64_t)location[0]);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error getting ISO code from MCC: %@, error: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v7 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)subregionISOCodesForMCC:(int64_t)a3 MNC:(int64_t)a4
{
  NSNumber *v4;
  NSNumber *v5;
  CoreTelephonyClient *v6;
  id v7;
  uint64_t v8;
  id v9;
  os_log_t oslog;
  id obj;
  id v13;
  id v14;
  id v15;
  id location;
  int64_t v17;
  int64_t v18;
  SEL v19;
  BYSIMRegionService *v20;
  uint8_t buf[40];

  v20 = self;
  v19 = a2;
  v18 = a3;
  v17 = a4;
  location = 0;
  v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
  v15 = -[NSNumber stringValue](v4, "stringValue");

  v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17);
  v14 = -[NSNumber stringValue](v5, "stringValue");

  v6 = -[BYSIMRegionService telephonyClient](v20, "telephonyClient");
  obj = 0;
  v7 = -[CoreTelephonyClient copyMobileSubscriberIsoSubregionCode:MNC:error:](v6, "copyMobileSubscriberIsoSubregionCode:MNC:error:", v15, v14, &obj);
  objc_storeStrong(&location, obj);
  v13 = v7;

  if (location)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v8);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10006099C((uint64_t)buf, (uint64_t)v15, (uint64_t)v14, (uint64_t)location);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error getting subregion ISO code from MCC: %@, MNC: %@, error: %@", buf, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v9 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
