@implementation _MKFStringCharacteristic

- (HMDCharacteristicMetadata)pr_hapMetadata
{
  HMDCharacteristicMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCharacteristicMetadata *v8;

  v3 = [HMDCharacteristicMetadata alloc];
  -[_MKFStringCharacteristic maximumLength](self, "maximumLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFStringCharacteristic format](self, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFStringCharacteristic units](self, "units");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFStringCharacteristic manufacturerDescription](self, "manufacturerDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDCharacteristicMetadata initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:](v3, "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", 0, 0, 0, v4, 0, v5, v6, v7);

  return v8;
}

- (void)pr_updateWithHAPMetadata:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MKFStringCharacteristic;
  v4 = a3;
  -[_MKFCharacteristic pr_updateWithHAPMetadata:](&v6, sel_pr_updateWithHAPMetadata_, v4);
  objc_msgSend(v4, "maxLength", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFStringCharacteristic setMaximumLength:](self, "setMaximumLength:", v5);
}

- (MKFStringCharacteristicDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFStringCharacteristicDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFStringCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25584D1D0;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFStringCharacteristic"));
}

@end
