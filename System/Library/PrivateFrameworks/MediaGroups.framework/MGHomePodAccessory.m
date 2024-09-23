@implementation MGHomePodAccessory

- (NSNumber)HomePodVariant
{
  void *v2;
  void *v3;

  -[MGGroup properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HomePodVariant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)productColor
{
  void *v2;
  void *v3;

  -[MGGroup properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("productColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (id)deviceIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("deviceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.solo-HomePodAccessory");
}

- (id)HomeKitAccesoryIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MGAccessoryIdentifierForGroupIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HomeKitAccessoryWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGAccessoryFromHomeManagerForGroupIdentifier(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)HomePodWithClientService:(void *)a3 HomeKitAccessory:(void *)a4 completion:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = (void *)objc_opt_self();
  v20[0] = CFSTR("deviceIdentifier");
  MGHomeUniqueIdentifierForAccessory(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v20[1] = CFSTR("HomePodVariant");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "homePodVariant"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  v20[2] = CFSTR("productColor");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "productColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MGHomeUniqueIdentifierForAccessory(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MGAccessoryCategoryTypeForAccessory(v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "HomeKitAccessoryOfType:accessoryIdentifier:homeIdentifier:categoryType:name:properties:completion:", v15, v16, v17, v18, v19, v14, v6, v20[0]);
}

+ (void)HomePodAccessoryWithConnectionProvider:(id)a3 HomeKitAccessory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[MGHomePodAccessory HomePodWithClientService:HomeKitAccessory:completion:]((uint64_t)a1, v11, v9, v8);
}

+ (void)HomePodAccessoryWithHomeKitAccessory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MGClientService *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MGClientService);
  +[MGHomePodAccessory HomePodWithClientService:HomeKitAccessory:completion:]((uint64_t)a1, v8, v7, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
