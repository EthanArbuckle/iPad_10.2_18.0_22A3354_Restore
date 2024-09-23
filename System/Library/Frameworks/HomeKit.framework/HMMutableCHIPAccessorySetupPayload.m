@implementation HMMutableCHIPAccessorySetupPayload

- (id)copyWithZone:(_NSZone *)a3
{
  HMCHIPAccessorySetupPayload *v4;
  void *v5;
  void *v6;
  HMCHIPAccessorySetupPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMCHIPAccessorySetupPayload allocWithZone:](HMCHIPAccessorySetupPayload, "allocWithZone:", a3);
  -[HMCHIPAccessorySetupPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCHIPAccessorySetupPayload discriminator](self, "discriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCHIPAccessorySetupPayload initWithSetupCode:discriminator:](v4, "initWithSetupCode:discriminator:", v5, v6);

  -[HMCHIPAccessorySetupPayload setHasShortDiscriminator:](v7, "setHasShortDiscriminator:", -[HMCHIPAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"));
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

@end
