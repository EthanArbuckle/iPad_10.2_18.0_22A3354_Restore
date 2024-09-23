@implementation HMMTRAccessorySetupPayload

- (HMMTRAccessorySetupPayload)initWithSetupCodeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HMMTRAccessorySetupPayload *v9;
  HMMTRAccessorySetupPayload *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB788]), "initWithDecimalStringRepresentation:", v4);
  v15 = 0;
  objc_msgSend(v6, "populatePayload:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = -[HMMTRAccessorySetupPayload initWithCHIPSetupPayload:setupPayloadString:](self, "initWithCHIPSetupPayload:setupPayloadString:", v7, v5);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse CHIP setup payload from decimal string %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (HMMTRAccessorySetupPayload)initWithSetupPayloadString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  HMMTRAccessorySetupPayload *v9;
  HMMTRAccessorySetupPayload *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB7E8]), "initWithBase38Representation:", v4);
  v15 = 0;
  objc_msgSend(v6, "populatePayload:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = -[HMMTRAccessorySetupPayload initWithCHIPSetupPayload:setupPayloadString:](self, "initWithCHIPSetupPayload:setupPayloadString:", v7, v5);
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse CHIP setup payload from setup payload string %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3
{
  return -[HMMTRAccessorySetupPayload initWithCHIPSetupPayload:setupPayloadString:](self, "initWithCHIPSetupPayload:setupPayloadString:", a3, 0);
}

- (HMMTRAccessorySetupPayload)initWithCHIPSetupPayload:(id)a3 setupPayloadString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMMTRAccessorySetupPayload *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setUpPINCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discriminator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](self, "initWithSetupCode:discriminator:isShortDiscriminator:", v8, v9, objc_msgSend(v6, "hasShortDiscriminator"));

  objc_msgSend(v6, "vendorID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setVendorID:](v10, "setVendorID:", v11);

  objc_msgSend(v6, "productID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setProductID:](v10, "setProductID:", v12);

  objc_msgSend(v6, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setSerialNumber:](v10, "setSerialNumber:", v13);

  if (!v7)
  {
    v17 = 0;
    objc_msgSend(v6, "qrCodeString:", &v17);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HMMTRAccessorySetupPayload setSetupPayloadString:](v10, "setSetupPayloadString:", v7);
  -[HMMTRAccessorySetupPayload setRequiresCustomFlow:](v10, "setRequiresCustomFlow:", objc_msgSend(v6, "commissioningFlow") == 2);
  objc_msgSend(v6, "rendezvousInformation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    -[HMMTRAccessorySetupPayload setSupportsBLE:](v10, "setSupportsBLE:", ((unint64_t)objc_msgSend(v14, "unsignedIntegerValue") >> 1) & 1);
    -[HMMTRAccessorySetupPayload setSupportsSoftAP:](v10, "setSupportsSoftAP:", objc_msgSend(v15, "unsignedIntegerValue") & 1);
    -[HMMTRAccessorySetupPayload setSupportsIP:](v10, "setSupportsIP:", ((unint64_t)objc_msgSend(v15, "unsignedIntegerValue") >> 2) & 1);
  }

  return v10;
}

- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4
{
  return -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](self, "initWithSetupCode:discriminator:isShortDiscriminator:", a3, a4, 0);
}

- (HMMTRAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4 isShortDiscriminator:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  HMMTRAccessorySetupPayload *v12;
  HMMTRAccessorySetupPayload *v13;
  HMMTRAccessorySetupPayload *v15;
  SEL v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v15 = (HMMTRAccessorySetupPayload *)_HMFPreconditionFailure();
    return (HMMTRAccessorySetupPayload *)-[HMMTRAccessorySetupPayload setupID](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMMTRAccessorySetupPayload;
  v12 = -[HMMTRAccessorySetupPayload init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_setupCode, a3);
    objc_storeStrong((id *)&v13->_discriminator, a4);
    v13->_hasShortDiscriminator = a5;
  }

  return v13;
}

- (NSString)setupID
{
  void *v3;
  void *v4;
  void *v5;

  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMTRUtilities setupIDFromSetupCode:discriminator:](HMMTRUtilities, "setupIDFromSetupCode:discriminator:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  int v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setupCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "discriminator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToNumber:", v10))
        goto LABEL_15;
      v11 = -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator");
      if (v11 != objc_msgSend(v6, "hasShortDiscriminator"))
        goto LABEL_15;
      -[HMMTRAccessorySetupPayload vendorID](self, "vendorID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vendorID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if (!v14)
        goto LABEL_15;
      -[HMMTRAccessorySetupPayload productID](self, "productID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HMFEqualObjects();

      if (!v17)
        goto LABEL_15;
      -[HMMTRAccessorySetupPayload serialNumber](self, "serialNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HMFEqualObjects();

      if (!v20)
        goto LABEL_15;
      -[HMMTRAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setupPayloadString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = HMFEqualObjects();

      if (v23)
      {
        v24 = -[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow");
        v25 = v24 ^ objc_msgSend(v6, "requiresCustomFlow") ^ 1;
      }
      else
      {
LABEL_15:
        LOBYTE(v25) = 0;
      }

    }
    else
    {
      LOBYTE(v25) = 0;
    }

  }
  else
  {
    LOBYTE(v25) = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMTRMutableAccessorySetupPayload *v4;
  void *v5;
  void *v6;
  HMMTRMutableAccessorySetupPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMMTRMutableAccessorySetupPayload allocWithZone:](HMMTRMutableAccessorySetupPayload, "allocWithZone:", a3);
  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](v4, "initWithSetupCode:discriminator:isShortDiscriminator:", v5, v6, -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"));

  -[HMMTRAccessorySetupPayload vendorID](self, "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setVendorID:](v7, "setVendorID:", v8);

  -[HMMTRAccessorySetupPayload productID](self, "productID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setProductID:](v7, "setProductID:", v9);

  -[HMMTRAccessorySetupPayload serialNumber](self, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setSerialNumber:](v7, "setSerialNumber:", v10);

  -[HMMTRAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload setSetupPayloadString:](v7, "setSetupPayloadString:", v11);

  -[HMMTRAccessorySetupPayload setRequiresCustomFlow:](v7, "setRequiresCustomFlow:", -[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("CPASP.ck.setupCode"));

  -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("CPASP.ck.discriminator"));

  objc_msgSend(v10, "encodeBool:forKey:", -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"), CFSTR("CPASP.ck.hasShortDiscriminator"));
  -[HMMTRAccessorySetupPayload vendorID](self, "vendorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("CPASP.ck.vendorID"));

  -[HMMTRAccessorySetupPayload productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("CPASP.ck.productID"));

  -[HMMTRAccessorySetupPayload serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("CPASP.ck.serialNumber"));

  -[HMMTRAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("CPASP.ck.setupPayloadString"));

  objc_msgSend(v10, "encodeBool:forKey:", -[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"), CFSTR("CPASP.ck.requiresCustomFlow"));
}

- (HMMTRAccessorySetupPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMMTRAccessorySetupPayload *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRAccessorySetupPayload *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.setupCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.discriminator"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded setupCode: %@ discriminator: %@ ", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v17 = 0;
  }
  else
  {
    v12 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](self, "initWithSetupCode:discriminator:isShortDiscriminator:", v5, v6, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPASP.ck.hasShortDiscriminator")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.vendorID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessorySetupPayload setVendorID:](v12, "setVendorID:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.productID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessorySetupPayload setProductID:](v12, "setProductID:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.serialNumber"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessorySetupPayload setSerialNumber:](v12, "setSerialNumber:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPASP.ck.setupPayloadString"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRAccessorySetupPayload setSetupPayloadString:](v12, "setSetupPayloadString:", v16);

    -[HMMTRAccessorySetupPayload setRequiresCustomFlow:](v12, "setRequiresCustomFlow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CPASP.ck.requiresCustomFlow")));
    v17 = v12;
  }

  return v17;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Discriminator"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Has Short Discriminator"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Setup Code"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRAccessorySetupPayload setupID](self, "setupID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Setup ID"), v14);
  objc_msgSend(v3, "addObject:", v15);

  -[HMMTRAccessorySetupPayload vendorID](self, "vendorID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessorySetupPayload vendorID](self, "vendorID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithName:value:", CFSTR("Vendor ID"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  -[HMMTRAccessorySetupPayload productID](self, "productID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessorySetupPayload productID](self, "productID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Product ID"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMMTRAccessorySetupPayload serialNumber](self, "serialNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessorySetupPayload serialNumber](self, "serialNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Serial Number"), v26);
    objc_msgSend(v3, "addObject:", v27);

  }
  -[HMMTRAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("Raw Setup Payload"), v30);
    objc_msgSend(v3, "addObject:", v31);

  }
  if (-[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"))
  {
    v32 = objc_alloc(MEMORY[0x24BE3F140]);
    -[HMMTRAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow");
    HMFBooleanToString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithName:value:", CFSTR("Requires Custom Flow"), v33);
    objc_msgSend(v3, "addObject:", v34);

  }
  v35 = (void *)objc_msgSend(v3, "copy");

  return v35;
}

- (NSNumber)setupCode
{
  return self->_setupCode;
}

- (BOOL)hasShortDiscriminator
{
  return self->_hasShortDiscriminator;
}

- (void)setHasShortDiscriminator:(BOOL)a3
{
  self->_hasShortDiscriminator = a3;
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)requiresCustomFlow
{
  return self->_requiresCustomFlow;
}

- (void)setRequiresCustomFlow:(BOOL)a3
{
  self->_requiresCustomFlow = a3;
}

- (BOOL)supportsIP
{
  return self->_supportsIP;
}

- (void)setSupportsIP:(BOOL)a3
{
  self->_supportsIP = a3;
}

- (BOOL)supportsSoftAP
{
  return self->_supportsSoftAP;
}

- (void)setSupportsSoftAP:(BOOL)a3
{
  self->_supportsSoftAP = a3;
}

- (BOOL)supportsBLE
{
  return self->_supportsBLE;
}

- (void)setSupportsBLE:(BOOL)a3
{
  self->_supportsBLE = a3;
}

- (NSString)setupPayloadString
{
  return self->_setupPayloadString;
}

- (void)setSetupPayloadString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayloadString, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

+ (BOOL)isValidSetupPayloadURLScheme:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("CH")))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Legacy Matter prefix 'CH' detected, support will be removed in the future.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v4, "isEqualToString:", CFSTR("MT"));
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
