@implementation IRNearbyDeviceMO

+ (id)nearbyDeviceMOWithNearbyDeviceDO:(id)a3 nearbyDeviceContainer:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRNearbyDeviceMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRNearbyDeviceMO initWithContext:]([IRNearbyDeviceMO alloc], "initWithContext:", v7);

  -[IRNearbyDeviceMO setNearbyDeviceContainer:](v10, "setNearbyDeviceContainer:", v8);
  +[IRNearbyDeviceMO setPropertiesOfnearbyDeviceMO:withNearbyDeviceDO:](IRNearbyDeviceMO, "setPropertiesOfnearbyDeviceMO:withNearbyDeviceDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfnearbyDeviceMO:(id)a3 withNearbyDeviceDO:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "range");
  objc_msgSend(v6, "setRange:");
  objc_msgSend(v5, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdsIdentifier:", v7);

  objc_msgSend(v5, "measurementDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMeasurementDate:", v8);

  objc_msgSend(v5, "mediaRemoteIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaRemoteIdentifier:", v9);

  objc_msgSend(v5, "proximityType");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProximityType:", v10);
}

- (id)convert
{
  IRNearbyDeviceDO *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IRNearbyDeviceDO *v10;

  v3 = [IRNearbyDeviceDO alloc];
  -[IRNearbyDeviceMO range](self, "range");
  v5 = v4;
  -[IRNearbyDeviceMO idsIdentifier](self, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyDeviceMO mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyDeviceMO proximityType](self, "proximityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRNearbyDeviceMO measurementDate](self, "measurementDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IRNearbyDeviceDO initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:](v3, "initWithRange:idsIdentifier:mediaRemoteIdentifier:proximityType:measurementDate:", v6, v7, v8, v9, v5);

  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRNearbyDeviceMO"));
}

@end
