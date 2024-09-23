@implementation CAFHistoricalNotification

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotification;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFHistoricalNotification;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFHistoricalNotification;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[CAFService typeName](self, "typeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFHistoricalNotification userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000001"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000001"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleLabel
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000005"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000005"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleDescription
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification userVisibleDescriptionCharacteristic](self, "userVisibleDescriptionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleFullDescriptionCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000004"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000049000004"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleFullDescription
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification userVisibleFullDescriptionCharacteristic](self, "userVisibleFullDescriptionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleFullDescription
{
  void *v2;
  BOOL v3;

  -[CAFHistoricalNotification userVisibleFullDescriptionCharacteristic](self, "userVisibleFullDescriptionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)timestampCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000003"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000049000003"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)timestamp
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification timestampCharacteristic](self, "timestampCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)timestampRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFHistoricalNotification timestampCharacteristic](self, "timestampCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt64Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt64Range *)v4;
}

- (CAFStringCharacteristic)symbolNameCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000005E"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000005E"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)symbolName
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification symbolNameCharacteristic](self, "symbolNameCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSymbolName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFHistoricalNotification symbolNameCharacteristic](self, "symbolNameCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

- (CAFNotificationSeverityCharacteristic)notificationSeverityCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000002"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000049000002"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFNotificationSeverityCharacteristic *)v11;
}

- (unsigned)notificationSeverity
{
  void *v2;
  unsigned __int8 v3;

  -[CAFHistoricalNotification notificationSeverityCharacteristic](self, "notificationSeverityCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationSeverityValue");

  return v3;
}

- (void)setNotificationSeverity:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFHistoricalNotification notificationSeverityCharacteristic](self, "notificationSeverityCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationSeverityValue:", v3);

}

- (CAFHistoricalNotificationUserActionsCharacteristic)historicalNotificationUserActionsCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000005"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000049000005"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFHistoricalNotificationUserActionsCharacteristic *)v11;
}

- (CAFHistoricalNotificationUserActions)historicalNotificationUserActions
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification historicalNotificationUserActionsCharacteristic](self, "historicalNotificationUserActionsCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historicalNotificationUserActionsValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFHistoricalNotificationUserActions *)v3;
}

- (BOOL)hasHistoricalNotificationUserActions
{
  void *v2;
  BOOL v3;

  -[CAFHistoricalNotification historicalNotificationUserActionsCharacteristic](self, "historicalNotificationUserActionsCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)userDismissibleCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000063"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000036000063"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)userDismissible
{
  void *v2;
  char v3;

  -[CAFHistoricalNotification userDismissibleCharacteristic](self, "userDismissibleCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUserDismissible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAFHistoricalNotification userDismissibleCharacteristic](self, "userDismissibleCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:", v3);

}

- (BOOL)hasUserDismissible
{
  void *v2;
  BOOL v3;

  -[CAFHistoricalNotification userDismissibleCharacteristic](self, "userDismissibleCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFBoolCharacteristic)hiddenCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000023"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000036000023"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)hidden
{
  void *v2;
  char v3;

  -[CAFHistoricalNotification hiddenCharacteristic](self, "hiddenCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAFHistoricalNotification hiddenCharacteristic](self, "hiddenCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:", v3);

}

- (CAFUInt8Characteristic)userActionCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000037000003"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000037000003"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)userAction
{
  void *v2;
  unsigned __int8 v3;

  -[CAFHistoricalNotification userActionCharacteristic](self, "userActionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint8Value");

  return v3;
}

- (void)setUserAction:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFHistoricalNotification userActionCharacteristic](self, "userActionCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint8Value:", v3);

}

- (CAFUInt8Range)userActionRange
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotification userActionCharacteristic](self, "userActionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasUserAction
{
  void *v2;
  BOOL v3;

  -[CAFHistoricalNotification userActionCharacteristic](self, "userActionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000021000001");
}

+ (id)observerProtocol
{
  return &unk_25682C058;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  objc_super v60;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000030000001")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification userVisibleLabel](self, "userVisibleLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "historicalNotificationService:didUpdateUserVisibleLabel:", self, v13);

      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification name](self, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateName:", self, v15);
LABEL_28:

      goto LABEL_29;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqual:", CFSTR("0x0000000030000005")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification userVisibleDescriptionCharacteristic](self, "userVisibleDescriptionCharacteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if (v20)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification userVisibleDescription](self, "userVisibleDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateUserVisibleDescription:", self, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqual:", CFSTR("0x0000000049000004")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification userVisibleFullDescriptionCharacteristic](self, "userVisibleFullDescriptionCharacteristic");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "isEqual:", v24);

    if (v25)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification userVisibleFullDescription](self, "userVisibleFullDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateUserVisibleFullDescription:", self, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqual:", CFSTR("0x0000000049000003")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification timestampCharacteristic](self, "timestampCharacteristic");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqual:", v29);

    if (v30)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification timestamp](self, "timestamp");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateTimestamp:", self, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isEqual:", CFSTR("0x000000003000005E")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification symbolNameCharacteristic](self, "symbolNameCharacteristic");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uniqueIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "isEqual:", v34);

    if (v35)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification symbolName](self, "symbolName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateSymbolName:", self, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isEqual:", CFSTR("0x0000000049000002")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification notificationSeverityCharacteristic](self, "notificationSeverityCharacteristic");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v37, "isEqual:", v39);

    if (v40)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateNotificationSeverity:", self, -[CAFHistoricalNotification notificationSeverity](self, "notificationSeverity"));
      goto LABEL_29;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "isEqual:", CFSTR("0x0000000049000005")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification historicalNotificationUserActionsCharacteristic](self, "historicalNotificationUserActionsCharacteristic");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "uniqueIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v42, "isEqual:", v44);

    if (v45)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFHistoricalNotification historicalNotificationUserActions](self, "historicalNotificationUserActions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateHistoricalNotificationUserActions:", self, v15);
      goto LABEL_28;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v46, "isEqual:", CFSTR("0x0000000036000063")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification userDismissibleCharacteristic](self, "userDismissibleCharacteristic");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v47, "isEqual:", v49);

    if (v50)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateUserDismissible:", self, -[CAFHistoricalNotification userDismissible](self, "userDismissible"));
      goto LABEL_29;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v51, "isEqual:", CFSTR("0x0000000036000023")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification hiddenCharacteristic](self, "hiddenCharacteristic");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "uniqueIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v52, "isEqual:", v54);

    if (v55)
    {
      -[CAFService observers](self, "observers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalNotificationService:didUpdateHidden:", self, -[CAFHistoricalNotification hidden](self, "hidden"));
      goto LABEL_29;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqual:", CFSTR("0x0000000037000003")))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFHistoricalNotification userActionCharacteristic](self, "userActionCharacteristic");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "uniqueIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v56, "isEqual:", v58);

    if (!v59)
      goto LABEL_30;
    -[CAFService observers](self, "observers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "historicalNotificationService:didUpdateUserAction:", self, -[CAFHistoricalNotification userAction](self, "userAction"));
  }
LABEL_29:

LABEL_30:
  v60.receiver = self;
  v60.super_class = (Class)CAFHistoricalNotification;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v60, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForUserVisibleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000001"));

  return v10;
}

- (BOOL)registeredForUserVisibleDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000005"));

  return v10;
}

- (BOOL)registeredForUserVisibleFullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000004"));

  return v10;
}

- (BOOL)registeredForTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000003"));

  return v10;
}

- (BOOL)registeredForSymbolName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000005E"));

  return v10;
}

- (BOOL)registeredForNotificationSeverity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000002"));

  return v10;
}

- (BOOL)registeredForHistoricalNotificationUserActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000049000005"));

  return v10;
}

- (BOOL)registeredForUserDismissible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000063"));

  return v10;
}

- (BOOL)registeredForHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000023"));

  return v10;
}

- (BOOL)registeredForUserAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000037000003"));

  return v10;
}

@end
