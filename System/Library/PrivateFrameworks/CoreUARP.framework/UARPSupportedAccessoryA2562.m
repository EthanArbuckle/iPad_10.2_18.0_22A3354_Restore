@implementation UARPSupportedAccessoryA2562

- (UARPSupportedAccessoryA2562)init
{
  UARPSupportedAccessoryA2562 *v2;
  void *v3;
  UARPAccessoryHardwareHDS *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UARPAccessoryHardwareHDS *hwID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UARPSupportedAccessoryA2562;
  v2 = -[UARPSupportedAccessory init](&v11, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2562 appleModelNumber](UARPSupportedAccessoryA2562, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Sidekick"));
    v4 = [UARPAccessoryHardwareHDS alloc];
    v5 = objc_alloc(MEMORY[0x24BDD1880]);
    +[UARPSupportedAccessoryA2562 modelUUID](UARPSupportedAccessoryA2562, "modelUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);
    v8 = -[UARPAccessoryHardwareHDS initWithUUID:](v4, "initWithUUID:", v7);
    hwID = v2->hwID;
    v2->hwID = (UARPAccessoryHardwareHDS *)v8;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2562");
}

+ (id)modelUUID
{
  return CFSTR("693FBEFE-C1E0-4125-96AC-10F8915DA1F3");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
