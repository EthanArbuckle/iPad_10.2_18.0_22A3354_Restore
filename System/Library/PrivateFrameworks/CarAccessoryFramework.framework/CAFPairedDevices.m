@implementation CAFPairedDevices

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDevices;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824858))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevices;
  -[CAFAccessory registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256824858))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevices;
  -[CAFAccessory unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFPairedDevicesInformation)pairedDevicesInformationService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[CAFAccessory car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x0000000016000018"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x0000000016000018"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFPairedDevicesInformation *)v10;
}

- (CAFPairedDevicesAction)pairedDevicesActionService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[CAFAccessory car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x0000000016000019"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x0000000016000019"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFPairedDevicesAction *)v10;
}

+ (id)accessoryIdentifier
{
  return CFSTR("0x000000000B000001");
}

+ (id)observerProtocol
{
  return &unk_25682B828;
}

- (void)setAction:(unsigned __int8)a3 forDeviceIdentifier:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CAFDeviceActionRequest *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CAFGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v15 = v4;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_237717000, v7, OS_LOG_TYPE_DEFAULT, "Set action: %hhu for device identifier: %@", buf, 0x12u);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v4);
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("deviceAction");
  v13[0] = v6;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAFDeviceActionRequest initWithDictionary:]([CAFDeviceActionRequest alloc], "initWithDictionary:", v9);
  -[CAFPairedDevices pairedDevicesAction](self, "pairedDevicesAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPairedDeviceActionRequest:", v10);

}

@end
