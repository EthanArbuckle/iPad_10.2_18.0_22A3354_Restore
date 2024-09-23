@implementation CAFClosure

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFClosure;
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
  v6.super_class = (Class)CAFClosure;
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
  v6.super_class = (Class)CAFClosure;
  -[CAFAccessory unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (NSArray)closureStateServices
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:", v7, CFSTR("0x000000001D000001"));

  objc_opt_class();
  -[CAFAccessory servicesForType:](self, "servicesForType:", CFSTR("0x000000001D000001"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return (NSArray *)v9;
}

- (NSArray)closureStates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[CAFClosure closureStateServices](self, "closureStateServices");
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

- (NSDictionary)closureStatesIndexed
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFAccessory servicesForIndexBy:](self, "servicesForIndexBy:", CFSTR("0x000000001D000001"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

+ (id)accessoryIdentifier
{
  return CFSTR("0x000000000D000001");
}

+ (id)observerProtocol
{
  return &unk_25682C4A8;
}

@end
