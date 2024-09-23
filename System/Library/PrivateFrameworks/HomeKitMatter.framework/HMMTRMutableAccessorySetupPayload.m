@implementation HMMTRMutableAccessorySetupPayload

- (id)copyWithZone:(_NSZone *)a3
{
  HMMTRAccessorySetupPayload *v4;
  void *v5;
  void *v6;
  HMMTRAccessorySetupPayload *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMMTRAccessorySetupPayload allocWithZone:](HMMTRAccessorySetupPayload, "allocWithZone:", a3);
  -[HMMTRAccessorySetupPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRAccessorySetupPayload discriminator](self, "discriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMTRAccessorySetupPayload initWithSetupCode:discriminator:isShortDiscriminator:](v4, "initWithSetupCode:discriminator:isShortDiscriminator:", v5, v6, -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"));

  -[HMMTRAccessorySetupPayload setHasShortDiscriminator:](v7, "setHasShortDiscriminator:", -[HMMTRAccessorySetupPayload hasShortDiscriminator](self, "hasShortDiscriminator"));
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

@end
