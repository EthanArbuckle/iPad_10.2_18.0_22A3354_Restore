@implementation _MKFFloatCharacteristic

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFFloatCharacteristic"));
}

- (HMDCharacteristicMetadata)pr_hapMetadata
{
  HMDCharacteristicMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCharacteristicMetadata *v10;

  v3 = [HMDCharacteristicMetadata alloc];
  -[_MKFFloatCharacteristic minimumValue](self, "minimumValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic maximumValue](self, "maximumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic stepValue](self, "stepValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic units](self, "units");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic manufacturerDescription](self, "manufacturerDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCharacteristicMetadata initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:](v3, "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", v4, v5, v6, 0, 0, v7, v8, v9);

  return v10;
}

- (void)pr_updateWithHAPMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKFFloatCharacteristic;
  v4 = a3;
  -[_MKFCharacteristic pr_updateWithHAPMetadata:](&v8, sel_pr_updateWithHAPMetadata_, v4);
  objc_msgSend(v4, "minimumValue", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic setMinimumValue:](self, "setMinimumValue:", v5);

  objc_msgSend(v4, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFFloatCharacteristic setMaximumValue:](self, "setMaximumValue:", v6);

  objc_msgSend(v4, "stepValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFFloatCharacteristic setStepValue:](self, "setStepValue:", v7);
}

- (MKFFloatCharacteristicDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFFloatCharacteristicDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFFloatCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25589BD50;
}

@end
