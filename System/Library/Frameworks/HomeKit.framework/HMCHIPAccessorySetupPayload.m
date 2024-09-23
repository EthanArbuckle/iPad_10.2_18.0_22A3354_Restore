@implementation HMCHIPAccessorySetupPayload

- (HMCHIPAccessorySetupPayload)initWithSetupCode:(id)a3 discriminator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMCHIPAccessorySetupPayload *v10;
  HMCHIPAccessorySetupPayload *v11;
  HMCHIPAccessorySetupPayload *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMCHIPAccessorySetupPayload *)_HMFPreconditionFailure();
    return (HMCHIPAccessorySetupPayload *)-[HMCHIPAccessorySetupPayload isEqual:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMCHIPAccessorySetupPayload;
  v10 = -[HMCHIPAccessorySetupPayload init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_setupCode, a3);
    objc_storeStrong((id *)&v11->_discriminator, a4);
  }

  return v11;
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
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL4 v23;
  int v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setupCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToNumber:", v8))
    {
      -[HMCHIPAccessorySetupPayload discriminator](self, "discriminator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "discriminator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToNumber:", v10))
        goto LABEL_14;
      -[HMCHIPAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setupPayloadString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

      if (!v13)
        goto LABEL_14;
      -[HMCHIPAccessorySetupPayload vendorID](self, "vendorID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "vendorID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = HMFEqualObjects();

      if (!v16)
        goto LABEL_14;
      -[HMCHIPAccessorySetupPayload productID](self, "productID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = HMFEqualObjects();

      if (!v19)
        goto LABEL_14;
      -[HMCHIPAccessorySetupPayload serialNumber](self, "serialNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serialNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = HMFEqualObjects();

      if (v22)
      {
        v23 = -[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow");
        v24 = v23 ^ objc_msgSend(v6, "requiresCustomFlow") ^ 1;
      }
      else
      {
LABEL_14:
        LOBYTE(v24) = 0;
      }

    }
    else
    {
      LOBYTE(v24) = 0;
    }

  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCHIPAccessorySetupPayload *v4;
  void *v5;
  void *v6;
  HMMutableCHIPAccessorySetupPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMMutableCHIPAccessorySetupPayload allocWithZone:](HMMutableCHIPAccessorySetupPayload, "allocWithZone:", a3);
  -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload discriminator](self, "discriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPAccessorySetupPayload initWithSetupCode:discriminator:](v4, "initWithSetupCode:discriminator:", v5, v6);

  -[HMCHIPAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload setSetupPayloadString:](v7, "setSetupPayloadString:", v8);

  -[HMCHIPAccessorySetupPayload vendorID](self, "vendorID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload setVendorID:](v7, "setVendorID:", v9);

  -[HMCHIPAccessorySetupPayload productID](self, "productID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload setProductID:](v7, "setProductID:", v10);

  -[HMCHIPAccessorySetupPayload serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload setSerialNumber:](v7, "setSerialNumber:", v11);

  -[HMCHIPAccessorySetupPayload setRequiresCustomFlow:](v7, "setRequiresCustomFlow:", -[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"));
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
  -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("HMCASP.ck.setupCode"));

  objc_msgSend(v10, "encodeBool:forKey:", -[HMCHIPAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"), CFSTR("HMCASP.ck.hasShortDiscriminator"));
  -[HMCHIPAccessorySetupPayload discriminator](self, "discriminator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("HMCASP.ck.discriminator"));

  -[HMCHIPAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("HMCASP.ck.setupPayloadString"));

  -[HMCHIPAccessorySetupPayload vendorID](self, "vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("HMCASP.ck.vendorID"));

  -[HMCHIPAccessorySetupPayload productID](self, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("HMCASP.ck.productID"));

  -[HMCHIPAccessorySetupPayload serialNumber](self, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("HMCASP.ck.serialNumber"));

  objc_msgSend(v10, "encodeBool:forKey:", -[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"), CFSTR("HMCASP.ck.requiresCustomFlow"));
}

- (HMCHIPAccessorySetupPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCHIPAccessorySetupPayload *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMCHIPAccessorySetupPayload *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.setupCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.discriminator"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded setupCode: %@ discriminator: %@ ", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v17 = 0;
  }
  else
  {
    v12 = -[HMCHIPAccessorySetupPayload initWithSetupCode:discriminator:](self, "initWithSetupCode:discriminator:", v5, v6);
    -[HMCHIPAccessorySetupPayload setHasShortDiscriminator:](v12, "setHasShortDiscriminator:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCASP.ck.hasShortDiscriminator")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.setupPayloadString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCHIPAccessorySetupPayload setSetupPayloadString:](v12, "setSetupPayloadString:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.vendorID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCHIPAccessorySetupPayload setVendorID:](v12, "setVendorID:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.productID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCHIPAccessorySetupPayload setProductID:](v12, "setProductID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCASP.ck.serialNumber"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCHIPAccessorySetupPayload setSerialNumber:](v12, "setSerialNumber:", v16);

    -[HMCHIPAccessorySetupPayload setRequiresCustomFlow:](v12, "setRequiresCustomFlow:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCASP.ck.requiresCustomFlow")));
    v17 = v12;
  }

  return v17;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMCHIPAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"))
  {
    v4 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator");
    HMFBooleanToString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Has Short Discriminator"), v5);
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessorySetupPayload discriminator](self, "discriminator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Discriminator"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Setup Code"), v11);
  objc_msgSend(v3, "addObject:", v12);

  -[HMCHIPAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload setupPayloadString](self, "setupPayloadString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Setup Payload String"), v15);
    objc_msgSend(v3, "addObject:", v16);

  }
  -[HMCHIPAccessorySetupPayload vendorID](self, "vendorID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload vendorID](self, "vendorID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Vendor ID"), v19);
    objc_msgSend(v3, "addObject:", v20);

  }
  -[HMCHIPAccessorySetupPayload productID](self, "productID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload productID](self, "productID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Product ID"), v23);
    objc_msgSend(v3, "addObject:", v24);

  }
  -[HMCHIPAccessorySetupPayload serialNumber](self, "serialNumber");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload serialNumber](self, "serialNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("Serial Number"), v27);
    objc_msgSend(v3, "addObject:", v28);

  }
  if (-[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow"))
  {
    v29 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMCHIPAccessorySetupPayload requiresCustomFlow](self, "requiresCustomFlow");
    HMFBooleanToString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithName:value:", CFSTR("Requires Custom Flow"), v30);
    objc_msgSend(v3, "addObject:", v31);

  }
  v32 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v32;
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

- (NSString)setupPayloadString
{
  return self->_setupPayloadString;
}

- (void)setSetupPayloadString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)requiresCustomFlow
{
  return self->_requiresCustomFlow;
}

- (void)setRequiresCustomFlow:(BOOL)a3
{
  self->_requiresCustomFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_setupPayloadString, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
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
