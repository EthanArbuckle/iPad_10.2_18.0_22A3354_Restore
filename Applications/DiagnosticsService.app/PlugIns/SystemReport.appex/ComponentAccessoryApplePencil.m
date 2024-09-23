@implementation ComponentAccessoryApplePencil

- (ComponentAccessoryApplePencil)init
{
  ComponentAccessoryApplePencil *v2;
  uint64_t v3;
  DSIOHIDDevice *device;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ComponentAccessoryApplePencil;
  v2 = -[ComponentAccessoryApplePencil init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_1000B2608));
    device = v2->_device;
    v2->_device = (DSIOHIDDevice *)v3;

  }
  return v2;
}

- (BOOL)isPresent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryApplePencil device](self, "device"));
  v3 = v2 != 0;

  return v3;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryApplePencil device](self, "device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));

  if (v5)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DSEADevice deviceWithSerialNumber:](DSEADevice, "deviceWithSerialNumber:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "information"));
      objc_msgSend(v10, "addEntriesFromDictionary:", v8);

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("serialNumber"));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryApplePencil getBatteryInfo](self, "getBatteryInfo"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("batteryInfo"));

}

- (id)getBatteryInfo
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ComponentAccessoryApplePencil *v25;
  uint64_t v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v25 = self;
  if (qword_1000BA0B0 != -1)
    dispatch_once(&qword_1000BA0B0, &stru_100080BF8);
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000BA0A8, "connectedDevices"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "accessoryCategory", v25) == (id)7)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "percentCharge")));
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("percentCharge"));

          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "approximatesPercentCharge")));
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("approximatesPercentCharge"));

          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isLowBattery")));
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("lowBattery"));

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isCharging")));
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("isCharging"));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }

  memset(v27, 0, 37);
  v26 = 37;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAccessoryApplePencil device](v25, "device"));
  v14 = objc_msgSend(v13, "reportWithID:reportType:object:length:", 34, 2, v27, &v26);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)v27 + 1)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("eepromWriteCount"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)v27 + 5)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("chargeCycleCount"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)v27 + 9)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("timeOnCharger"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)v27 + 13)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("timeOffCharger"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)&v27[1] + 1)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("timeInTopOff"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)((char *)&v27[1] + 5)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("maxTemp"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)((char *)&v27[1] + 9)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("minTemp"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)((char *)&v27[1] + 13)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("averageChargingTemp"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)((char *)&v27[2] + 1)));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("averageDischargingTemp"));

  }
  return v2;
}

- (DSIOHIDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
