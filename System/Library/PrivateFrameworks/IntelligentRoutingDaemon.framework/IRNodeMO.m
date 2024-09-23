@implementation IRNodeMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRNodeMO"));
}

+ (id)nodeMOFromNodeDO:(id)a3 forCandidate:(id)a4 inManagedObjectContext:(id)a5
{
  id v6;
  id v7;
  IRNodeMO *v8;
  void *v9;
  IRAVOutputDeviceMO *v10;
  void *v11;
  IRRapportDeviceMO *v12;

  v6 = a3;
  v7 = a5;
  v8 = -[IRNodeMO initWithContext:]([IRNodeMO alloc], "initWithContext:", v7);
  objc_msgSend(v6, "avOutputDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[IRAVOutputDeviceMO initWithContext:]([IRAVOutputDeviceMO alloc], "initWithContext:", v7);
    -[IRNodeMO setAvOutputDevice:](v8, "setAvOutputDevice:", v10);

  }
  objc_msgSend(v6, "rapportDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[IRRapportDeviceMO initWithContext:]([IRRapportDeviceMO alloc], "initWithContext:", v7);
    -[IRNodeMO setRapportDevice:](v8, "setRapportDevice:", v12);

  }
  +[IRNodeMO setPropertiesOfNodeMO:withNodeDO:](IRNodeMO, "setPropertiesOfNodeMO:withNodeDO:", v8, v6);

  return v8;
}

+ (void)setPropertiesOfNodeMO:(id)a3 withNodeDO:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(v5, "avOutputDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v15, "avOutputDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avOutputDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRAVOutputDeviceMO setPropertiesOfAVOutputDeviceMO:withAVOutputDevice:](IRAVOutputDeviceMO, "setPropertiesOfAVOutputDeviceMO:withAVOutputDevice:", v7, v8);

  }
  objc_msgSend(v5, "rapportDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v15, "rapportDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rapportDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IRRapportDeviceMO setPropertiesOfRapportDeviceMO:withRapportDO:](IRRapportDeviceMO, "setPropertiesOfRapportDeviceMO:withRapportDO:", v10, v11);

  }
  objc_msgSend(v5, "avOutpuDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAvOutpuDeviceIdentifier:", v12);

  objc_msgSend(v5, "rapportIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRapportIdentifier:", v13);

  objc_msgSend(v5, "idsIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdsIdentifier:", v14);

}

- (id)convert
{
  IRNodeDO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IRNodeDO *v11;

  v3 = [IRNodeDO alloc];
  -[IRNodeMO avOutpuDeviceIdentifier](self, "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNodeMO rapportIdentifier](self, "rapportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNodeMO idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNodeMO avOutputDevice](self, "avOutputDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNodeMO rapportDevice](self, "rapportDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IRNodeDO initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:](v3, "initWithAvOutpuDeviceIdentifier:rapportIdentifier:idsIdentifier:avOutputDevice:rapportDevice:", v4, v5, v6, v8, v10);

  return v11;
}

@end
