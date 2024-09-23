@implementation ComponentWiFi

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentWiFi wifiDeviceCount](self, "wifiDeviceCount"));
  v3 = (int)objc_msgSend(v2, "intValue") > 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentWiFi wifiAddress](self, "wifiAddress"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("wifiAddress"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ComponentWiFi serialNumber](self, "serialNumber"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));

}

- (id)wifiDeviceCount
{
  id v2;
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = objc_alloc_init((Class)CWFInterface);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "activate");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interfaceNames"));
    v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));

  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "WiFiManagerClientCreate failed", v9, 2u);
    }

    v5 = &off_1000B2A70;
  }

  return v5;
}

- (id)wifiAddress
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MGCopyAnswer(CFSTR("WifiAddress"), 0);
  v3 = stringOrNull(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)serialNumber
{
  return (id)MGCopyAnswer(CFSTR("WirelessBoardSnum"), 0);
}

@end
