@implementation HMCHIPAccessorySetupPayload(HMD)

- (uint64_t)initWithCHIPSetupPayload:()HMD
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "setupCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discriminator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1, "initWithSetupCode:discriminator:", v5, v6);
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setHasShortDiscriminator:", objc_msgSend(v4, "hasShortDiscriminator"));
  objc_msgSend(v4, "setupPayloadString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSetupPayloadString:", v9);

  objc_msgSend(v4, "vendorID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVendorID:", v10);

  objc_msgSend(v4, "productID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProductID:", v11);

  objc_msgSend(v4, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSerialNumber:", v12);

  v13 = objc_msgSend(v4, "requiresCustomFlow");
  objc_msgSend(v8, "setRequiresCustomFlow:", v13);
  v14 = objc_msgSend(v8, "copy");

  return v14;
}

- (id)chipSetupPayload
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x24BE4EF78]);
  objc_msgSend(a1, "setupCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "discriminator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithSetupCode:discriminator:", v3, v4);

  objc_msgSend(v5, "setHasShortDiscriminator:", objc_msgSend(a1, "hasShortDiscriminator"));
  objc_msgSend(a1, "setupPayloadString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSetupPayloadString:", v6);

  objc_msgSend(a1, "vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVendorID:", v7);

  objc_msgSend(a1, "productID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProductID:", v8);

  objc_msgSend(a1, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSerialNumber:", v9);

  objc_msgSend(v5, "setRequiresCustomFlow:", objc_msgSend(a1, "requiresCustomFlow"));
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

@end
