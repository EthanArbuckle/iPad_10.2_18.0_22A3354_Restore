@implementation _CDNetworkContext

+ (int64_t)wiredQuality:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForWiredConnectionStatus](_CDNetworkContext, "keyPathForWiredConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext connectionQualityKey](_CDNetworkContext, "connectionQualityKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

+ (int64_t)cellInterfaceClass:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_CDNetworkContext interfaceClassForPath:inContext:](_CDNetworkContext, "interfaceClassForPath:inContext:", v4, v3);

  return v5;
}

+ (int64_t)interfaceClassForPath:(id)a3 inContext:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDNetworkContext interfaceClassKey](_CDNetworkContext, "interfaceClassKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (int64_t)cellQuality:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext connectionQualityKey](_CDNetworkContext, "connectionQualityKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

+ (int64_t)wifiQuality:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForWiFiConnectionStatus](_CDNetworkContext, "keyPathForWiFiConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext connectionQualityKey](_CDNetworkContext, "connectionQualityKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

+ (id)connectionQualityKey
{
  return CFSTR("quality");
}

+ (id)keyPathForWiFiConnectionStatus
{
  if (keyPathForWiFiConnectionStatus_onceToken != -1)
    dispatch_once(&keyPathForWiFiConnectionStatus_onceToken, &__block_literal_global_6);
  return (id)keyPathForWiFiConnectionStatus_wifiConnectionStatus;
}

+ (id)keyPathForCellConnectionStatus
{
  if (keyPathForCellConnectionStatus_onceToken != -1)
    dispatch_once(&keyPathForCellConnectionStatus_onceToken, &__block_literal_global_7);
  return (id)keyPathForCellConnectionStatus_cellConnectionStatus;
}

+ (id)interfaceClassKey
{
  return CFSTR("interfaceClass");
}

+ (id)keyPathForWiredConnectionStatus
{
  if (keyPathForWiredConnectionStatus_onceToken != -1)
    dispatch_once(&keyPathForWiredConnectionStatus_onceToken, &__block_literal_global_18);
  return (id)keyPathForWiredConnectionStatus_wiredConnection;
}

+ (id)interfaceUpKey
{
  return CFSTR("hot");
}

+ (id)downloadPowerCostKey
{
  return CFSTR("dlPowerCost");
}

+ (id)uploadPowerCostKey
{
  return CFSTR("ulPowerCost");
}

+ (id)loiKey
{
  return CFSTR("loi");
}

+ (id)predictionKey
{
  return CFSTR("prediction");
}

+ (int64_t)qualityForPath:(id)a3 inContext:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDNetworkContext connectionQualityKey](_CDNetworkContext, "connectionQualityKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (int64_t)wiredInterfaceClass:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[_CDNetworkContext keyPathForWiredConnectionStatus](_CDNetworkContext, "keyPathForWiredConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_CDNetworkContext interfaceClassForPath:inContext:](_CDNetworkContext, "interfaceClassForPath:inContext:", v4, v3);

  return v5;
}

+ (int64_t)wifiInterfaceClass:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  +[_CDNetworkContext keyPathForWiFiConnectionStatus](_CDNetworkContext, "keyPathForWiFiConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_CDNetworkContext interfaceClassForPath:inContext:](_CDNetworkContext, "interfaceClassForPath:inContext:", v4, v3);

  return v5;
}

+ (BOOL)inexpensiveNetworkingAvailable:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[_CDNetworkContext wifiQuality:](_CDNetworkContext, "wifiQuality:", v3) > 0
    || +[_CDNetworkContext wiredQuality:](_CDNetworkContext, "wiredQuality:", v3) > 0;

  return v4;
}

+ (BOOL)networkingAvailable:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[_CDNetworkContext inexpensiveNetworkingAvailable:](_CDNetworkContext, "inexpensiveNetworkingAvailable:", v3)|| +[_CDNetworkContext cellQuality:](_CDNetworkContext, "cellQuality:", v3) > 0;

  return v4;
}

+ (BOOL)cellInterfaceUp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext interfaceUpKey](_CDNetworkContext, "interfaceUpKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (int64_t)cellDownloadCost:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext downloadPowerCostKey](_CDNetworkContext, "downloadPowerCostKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

+ (int64_t)cellUploadCost:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  +[_CDNetworkContext keyPathForCellConnectionStatus](_CDNetworkContext, "keyPathForCellConnectionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_CDNetworkContext uploadPowerCostKey](_CDNetworkContext, "uploadPowerCostKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

@end
