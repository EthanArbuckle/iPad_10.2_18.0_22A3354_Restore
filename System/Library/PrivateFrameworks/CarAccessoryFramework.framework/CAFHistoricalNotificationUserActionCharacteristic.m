@implementation CAFHistoricalNotificationUserActionCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotificationUserActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFHistoricalNotificationUserAction)historicalNotificationUserActionValue
{
  CAFHistoricalNotificationUserAction *v3;
  void *v4;
  CAFHistoricalNotificationUserAction *v5;

  v3 = [CAFHistoricalNotificationUserAction alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFHistoricalNotificationUserAction initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setHistoricalNotificationUserActionValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFDictionaryCharacteristic setDictionaryValue:](self, "setDictionaryValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFHistoricalNotificationUserActionCharacteristic historicalNotificationUserActionValue](self, "historicalNotificationUserActionValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("HistoricalNotificationUserAction");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
