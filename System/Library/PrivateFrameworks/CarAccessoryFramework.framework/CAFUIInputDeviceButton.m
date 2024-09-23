@implementation CAFUIInputDeviceButton

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUIInputDeviceButton;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2568262F0))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFUIInputDeviceButton;
  -[CAFUIInputDevice registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2568262F0))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFUIInputDeviceButton;
  -[CAFUIInputDevice unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[CAFService typeName](self, "typeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIInputDevice uiInputDevicePurposeCharacteristic](self, "uiInputDevicePurposeCharacteristic");
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

- (CAFUIInputDeviceButtonEventCharacteristic)uiInputDeviceButtonEventCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000047000003"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000047000003"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUIInputDeviceButtonEventCharacteristic *)v11;
}

- (unsigned)uiInputDeviceButtonEvent
{
  void *v2;
  unsigned __int8 v3;

  -[CAFUIInputDeviceButton uiInputDeviceButtonEventCharacteristic](self, "uiInputDeviceButtonEventCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uIInputDeviceButtonEventValue");

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000011100002");
}

+ (id)observerProtocol
{
  return &unk_25682DB28;
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
  objc_super v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", CFSTR("0x0000000047000003")))
    goto LABEL_4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFUIInputDeviceButton uiInputDeviceButtonEventCharacteristic](self, "uiInputDeviceButtonEventCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    -[CAFService observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiInputDeviceButtonService:didUpdateUiInputDeviceButtonEvent:", self, -[CAFUIInputDeviceButton uiInputDeviceButtonEvent](self, "uiInputDeviceButtonEvent"));
LABEL_4:

  }
  v12.receiver = self;
  v12.super_class = (Class)CAFUIInputDeviceButton;
  -[CAFUIInputDevice _characteristicDidUpdate:fromGroupUpdate:](&v12, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForUIInputDeviceButtonEvent
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000047000003"));

  return v10;
}

@end
