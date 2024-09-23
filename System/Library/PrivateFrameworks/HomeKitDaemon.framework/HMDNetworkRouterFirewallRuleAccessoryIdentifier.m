@implementation HMDNetworkRouterFirewallRuleAccessoryIdentifier

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v11;
  uint64_t v12;
  NSString *productGroup;
  uint64_t v14;
  NSString *productNumber;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterFirewallRuleAccessoryIdentifier;
  v11 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier init](&v18, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "lowercaseString");
    v12 = objc_claimAutoreleasedReturnValue();
    productGroup = v11->_productGroup;
    v11->_productGroup = (NSString *)v12;

    objc_msgSend(v9, "lowercaseString");
    v14 = objc_claimAutoreleasedReturnValue();
    productNumber = v11->_productNumber;
    v11->_productNumber = (NSString *)v14;

    objc_storeStrong((id *)&v11->_firmwareVersion, a5);
    v16 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v4;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v5;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_13;
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productGroup](self, "productGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productGroup](v6, "productGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productNumber](self, "productNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productNumber](v6, "productNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[HMDNetworkRouterFirewallRuleAccessoryIdentifier firmwareVersion](self, "firmwareVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleAccessoryIdentifier firmwareVersion](v6, "firmwareVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if ((v13 & 1) != 0)
        {
          v14 = 1;
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        v14 = 0;
        goto LABEL_14;
      }

    }
    goto LABEL_13;
  }
  v14 = 1;
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productGroup](self, "productGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productNumber](self, "productNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier firmwareVersion](self, "firmwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier firmwareVersion](self, "firmwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 ^= objc_msgSend(v8, "hash");

  }
  return v6;
}

- (id)attributeDescriptions
{
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
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productGroup](self, "productGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ProductGroup"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier productNumber](self, "productNumber", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("ProductNumber"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier firmwareVersion](self, "firmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("FirmwareVersion"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)productGroup
{
  return self->_productGroup;
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (HMFVersion)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
}

+ (id)createWithProductData:(id)a3 firmwareVersion:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  id v12;
  id v13;

  v6 = a4;
  v12 = 0;
  v13 = 0;
  v7 = +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:](HMDAccessory, "splitProductDataIntoProductGroupAndProductNumber:productGroup:productNumber:", a3, &v13, &v12);
  v8 = v13;
  v9 = v12;
  v10 = 0;
  if (v7)
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProductGroup:productNumber:firmwareVersion:", v8, v9, v6);

  return v10;
}

- (id)cloudKitRecordID
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDB91F8]);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitZoneName](self, "cloudKitZoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithZoneName:ownerName:", v4, *MEMORY[0x24BDB8E88]);

  v6 = objc_alloc(MEMORY[0x24BDB91E8]);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordName](self, "cloudKitRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v7, v5);

  return v8;
}

+ (id)identifierFromRecordID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithProductGroup:productNumber:firmwareVersion:", v7, v8, 0);
  return v9;
}

@end
