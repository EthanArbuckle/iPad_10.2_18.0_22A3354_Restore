@implementation CAFTestingUseOnly

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestingUseOnly;
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
  v6.super_class = (Class)CAFTestingUseOnly;
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
  v6.super_class = (Class)CAFTestingUseOnly;
  -[CAFAccessory unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFTypeTest)typeTestService
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000001"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000001"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFTypeTest *)v10;
}

- (NSArray)typeTestMultiServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000003"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000003"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

- (CAFTypeTestWithStates)typeTestWithStatesService
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000007"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000007"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFTypeTestWithStates *)v10;
}

- (NSArray)typeTestIndexByPositionServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000004"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000004"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

- (NSArray)typeTestIndexByUnitServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000005"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000005"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

- (NSArray)protocolPerfTestServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000006"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000006"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

- (CAFTestControlSync)testControlSyncService
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000008"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000008"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFTestControlSync *)v10;
}

- (CAFTestControlAsync)testControlAsyncService
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE000009"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE000009"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFTestControlAsync *)v10;
}

- (CAFTestControlEvent)testControlEventService
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x00000000FE00000A"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x00000000FE00000A"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return (CAFTestControlEvent *)v10;
}

- (NSArray)typeTestIndexByPositions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CAFTestingUseOnly typeTestIndexByPositionServices](self, "typeTestIndexByPositionServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("vehicleLayoutKey"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSDictionary)typeTestIndexByPositionsIndexed
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFAccessory servicesForIndexBy:](self, "servicesForIndexBy:", CFSTR("0x00000000FE000004"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSArray)typeTestIndexByUnits
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CAFTestingUseOnly typeTestIndexByUnitServices](self, "typeTestIndexByUnitServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("distanceUnit"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSDictionary)typeTestIndexByUnitsIndexed
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFAccessory servicesForIndexBy:](self, "servicesForIndexBy:", CFSTR("0x00000000FE000005"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (NSArray)protocolPerfTests
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CAFTestingUseOnly protocolPerfTestServices](self, "protocolPerfTestServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("testString"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSDictionary)protocolPerfTestsIndexed
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFAccessory servicesForIndexBy:](self, "servicesForIndexBy:", CFSTR("0x00000000FE000006"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

+ (id)accessoryIdentifier
{
  return CFSTR("0x00000000FD000001");
}

+ (id)observerProtocol
{
  return &unk_25682BB88;
}

@end
