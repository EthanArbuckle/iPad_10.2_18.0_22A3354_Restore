@implementation CAFPairedDeviceActionRequestCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDeviceActionRequestCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFPairedDeviceActionRequest)pairedDeviceActionRequestValue
{
  void *v2;
  void *v3;

  -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFPairedDeviceActionRequest pairedDeviceActionRequestWithArray:](CAFPairedDeviceActionRequest, "pairedDeviceActionRequestWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFPairedDeviceActionRequest *)v3;
}

- (void)setPairedDeviceActionRequestValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "deviceActionRequests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFArrayCharacteristic setArrayValue:](self, "setArrayValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFPairedDeviceActionRequestCharacteristic pairedDeviceActionRequestValue](self, "pairedDeviceActionRequestValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("PairedDeviceActionRequest");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
