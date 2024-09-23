@implementation _MKFCharacteristic

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_111389 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_111389, &__block_literal_global_111390);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_111391;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557DD298;
}

- (HMDCharacteristicMetadata)pr_hapMetadata
{
  HMDCharacteristicMetadata *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCharacteristicMetadata *v7;

  v3 = [HMDCharacteristicMetadata alloc];
  -[_MKFCharacteristic format](self, "format");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic units](self, "units");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic manufacturerDescription](self, "manufacturerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCharacteristicMetadata initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:](v3, "initWithMinimumValue:maximumValue:stepValue:maxLength:validValues:format:units:manufacturerDescription:", 0, 0, 0, 0, 0, v4, v5, v6);

  return v7;
}

- (NSDictionary)pr_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_MKFCharacteristic pr_hapMetadata](self, "pr_hapMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic instanceID](self, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("characteristicInstanceID"));

  -[_MKFCharacteristic type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("characteristicType"));

  -[_MKFCharacteristic properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("characteristicProperties"));

  -[_MKFCharacteristic authorizationData](self, "authorizationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("kCharacteristicAuthorizationDataCodingKey"));

  objc_msgSend(v3, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("characteristicMetadata"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v11;
}

- (void)pr_updateWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _MKFCharacteristic *v12;
  SEL v13;
  id v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("characteristicInstanceID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("characteristicType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("characteristicProperties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_10:
    v12 = (_MKFCharacteristic *)_HMFPreconditionFailure();
    -[_MKFCharacteristic pr_updateWithHAPMetadata:](v12, v13, v14);
    return;
  }
  objc_msgSend(v15, "hmf_UUIDForKey:", CFSTR("characteristicType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic setType:](self, "setType:", v7);

  objc_msgSend(v15, "hmf_numberForKey:", CFSTR("characteristicProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic setProperties:](self, "setProperties:", v8);

  objc_msgSend(v15, "hmf_dataForKey:", CFSTR("kCharacteristicAuthorizationDataCodingKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic setAuthorizationData:](self, "setAuthorizationData:", v9);

  objc_msgSend(v15, "hmf_dictionaryForKey:", CFSTR("characteristicMetadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCharacteristicMetadata characteristicMetadataWithDictionary:](HMDCharacteristicMetadata, "characteristicMetadataWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[_MKFCharacteristic pr_updateWithHAPMetadata:](self, "pr_updateWithHAPMetadata:", v11);
  else
    -[_MKFCharacteristic setFormat:](self, "setFormat:", CFSTR("unknown"));

}

- (void)pr_updateWithHAPMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic setFormat:](self, "setFormat:", v5);

  objc_msgSend(v4, "units");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFCharacteristic setUnits:](self, "setUnits:", v6);

  objc_msgSend(v4, "manufacturerDescription");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_MKFCharacteristic setManufacturerDescription:](self, "setManufacturerDescription:", v7);
}

- (MKFCharacteristicDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFCharacteristicDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (NSArray)bulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFCharacteristic valueForKey:](self, "valueForKey:", CFSTR("bulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)notificationRegistrations
{
  void *v2;
  void *v3;

  -[_MKFCharacteristic valueForKey:](self, "valueForKey:", CFSTR("notificationRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCharacteristic"));
}

@end
