@implementation HMDHAPAccessoryNotificationEvent

- (HMDHAPAccessoryNotificationEvent)initWithAccessory:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  HMDHAPAccessoryNotificationEvent *v8;
  HMDHAPAccessoryNotificationEvent *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDHAPAccessoryNotificationEvent;
  v8 = -[HMMLogEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeWeak((id *)&v9->_characteristic, v7);
  }

  return v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.accessoryNotification");
}

- (BOOL)isThreadAccessory:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "transportInformationInstances");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "hapAccessory", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "server");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        if (v12)
        {

LABEL_16:
          v14 = 1;
          goto LABEL_17;
        }
        objc_msgSend(v3, "findServiceWithServiceType:", CFSTR("00000701-0000-1000-8000-0026BB765291"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          goto LABEL_16;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_17:

  return v14;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDHAPAccessoryNotificationEvent accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryNotificationEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDHAPAccessoryNotificationEvent isThreadAccessory:](self, "isThreadAccessory:", v4);
  if ((objc_msgSend(v4, "hasIPLink") & 1) != 0)
  {
    v7 = CFSTR("IP");
  }
  else if (objc_msgSend(v4, "hasBTLELink"))
  {
    v7 = CFSTR("BLE");
  }
  else
  {
    v7 = CFSTR("unknown link type");
  }
  objc_msgSend(v5, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("characteristicType"));

  objc_msgSend(v5, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("serviceType"));

  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("linkType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isThread"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (NSString)accessoryIdentifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryNotificationEvent accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDCharacteristic)characteristic
{
  return (HMDCharacteristic *)objc_loadWeakRetained((id *)&self->_characteristic);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_characteristic);
  objc_destroyWeak((id *)&self->_accessory);
}

@end
