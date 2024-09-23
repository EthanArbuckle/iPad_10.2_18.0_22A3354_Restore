@implementation HMMutableSetupAccessoryPayload

- (id)copyWithZone:(_NSZone *)a3
{
  HMSetupAccessoryPayload *v4;
  void *v5;
  HMSetupAccessoryPayload *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = +[HMSetupAccessoryPayload allocWithZone:](HMSetupAccessoryPayload, "allocWithZone:", a3);
  -[HMSetupAccessoryPayload setupCode](self, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSetupAccessoryPayload initWithSetupCode:communicationProtocol:](v4, "initWithSetupCode:communicationProtocol:", v5, -[HMSetupAccessoryPayload communicationProtocol](self, "communicationProtocol"));

  -[HMSetupAccessoryPayload setupPayloadURL](self, "setupPayloadURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setSetupPayloadURL:](v6, "setSetupPayloadURL:", v7);

  -[HMSetupAccessoryPayload setupID](self, "setupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setSetupID:](v6, "setSetupID:", v8);

  -[HMSetupAccessoryPayload categoryNumber](self, "categoryNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setCategoryNumber:](v6, "setCategoryNumber:", v9);

  -[HMSetupAccessoryPayload productNumber](self, "productNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setProductNumber:](v6, "setProductNumber:", v10);

  -[HMSetupAccessoryPayload setSupportsIP:](v6, "setSupportsIP:", -[HMSetupAccessoryPayload supportsIP](self, "supportsIP"));
  -[HMSetupAccessoryPayload setSupportsWAC:](v6, "setSupportsWAC:", -[HMSetupAccessoryPayload supportsWAC](self, "supportsWAC"));
  -[HMSetupAccessoryPayload setSupportsBTLE:](v6, "setSupportsBTLE:", -[HMSetupAccessoryPayload supportsBTLE](self, "supportsBTLE"));
  -[HMSetupAccessoryPayload setPaired:](v6, "setPaired:", -[HMSetupAccessoryPayload isPaired](self, "isPaired"));
  -[HMSetupAccessoryPayload threadIdentifier](self, "threadIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setThreadIdentifier:](v6, "setThreadIdentifier:", v11);

  -[HMSetupAccessoryPayload chipAccessorySetupPayload](self, "chipAccessorySetupPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSetupAccessoryPayload setChipAccessorySetupPayload:](v6, "setChipAccessorySetupPayload:", v12);

  return v6;
}

@end
