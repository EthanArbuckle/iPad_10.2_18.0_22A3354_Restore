@implementation CLBeaconRegion(HMFObject)

- (id)description
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_2558D9538;
  objc_msgSendSuper2(&v2, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attributeDescriptions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F250], "defaultFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(a1, "proximityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("ProximityUUID"), v4, 0, v2);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(a1, "major", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:options:formatter:", CFSTR("Major"), v7, 0, v2);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(a1, "minor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:options:formatter:", CFSTR("Minor"), v10, 0, v2);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
