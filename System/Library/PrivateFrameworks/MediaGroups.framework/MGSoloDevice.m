@implementation MGSoloDevice

+ (id)type
{
  return CFSTR("com.apple.media-group.solo");
}

+ (id)predicateForType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(a1, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("SELF.type BEGINSWITH %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "predicateForType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MGSoloDevice;
  v10[0] = v4;
  objc_msgSendSuper2(&v9, sel_predicateForCurrentDevice);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
