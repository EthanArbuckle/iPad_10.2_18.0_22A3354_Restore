@implementation CAFNotificationUserActionCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNotificationUserActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFNotificationUserAction)notificationUserActionValue
{
  CAFNotificationUserAction *v3;
  void *v4;
  CAFNotificationUserAction *v5;

  v3 = [CAFNotificationUserAction alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFNotificationUserAction initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setNotificationUserActionValue:(id)a3
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

  -[CAFNotificationUserActionCharacteristic notificationUserActionValue](self, "notificationUserActionValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("NotificationUserAction");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
