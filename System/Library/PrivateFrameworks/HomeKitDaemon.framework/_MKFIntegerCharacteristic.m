@implementation _MKFIntegerCharacteristic

- (HMDCharacteristicMetadata)pr_hapMetadata
{
  HMDCharacteristicMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCharacteristicMetadata *v11;

  v3 = [HMDCharacteristicMetadata alloc];
  -[_MKFIntegerCharacteristic minimumValue](self, "minimumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic stepValue](self, "stepValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic validValues](self, "validValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic format](self, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic units](self, "units");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic manufacturerDescription](self, "manufacturerDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCharacteristicMetadata initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:](v3, "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", v4, v5, v6, 0, v7, v8, v9, v10);

  return v11;
}

- (void)pr_updateWithHAPMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKFIntegerCharacteristic;
  v4 = a3;
  -[_MKFCharacteristic pr_updateWithHAPMetadata:](&v9, sel_pr_updateWithHAPMetadata_, v4);
  objc_msgSend(v4, "minimumValue", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic setMinimumValue:](self, "setMinimumValue:", v5);

  objc_msgSend(v4, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic setMaximumValue:](self, "setMaximumValue:", v6);

  objc_msgSend(v4, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFIntegerCharacteristic setStepValue:](self, "setStepValue:", v7);

  objc_msgSend(v4, "validValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFIntegerCharacteristic setValidValues:](self, "setValidValues:", v8);
}

- (MKFIntegerCharacteristicDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFIntegerCharacteristicDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFIntegerCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557DD448;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFIntegerCharacteristic"));
}

@end
