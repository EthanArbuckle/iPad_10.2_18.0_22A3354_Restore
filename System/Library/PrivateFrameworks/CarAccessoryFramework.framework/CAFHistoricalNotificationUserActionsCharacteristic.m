@implementation CAFHistoricalNotificationUserActionsCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotificationUserActionsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFHistoricalNotificationUserActions)historicalNotificationUserActionsValue
{
  void *v2;
  void *v3;

  -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFHistoricalNotificationUserActions historicalNotificationUserActionsWithArray:](CAFHistoricalNotificationUserActions, "historicalNotificationUserActionsWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFHistoricalNotificationUserActions *)v3;
}

- (void)setHistoricalNotificationUserActionsValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "historicalNotificationUserActions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFArrayCharacteristic setArrayValue:](self, "setArrayValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotificationUserActionsCharacteristic historicalNotificationUserActionsValue](self, "historicalNotificationUserActionsValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("HistoricalNotificationUserActions");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000049000005");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
