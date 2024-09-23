@implementation IRMiLoNearbyDeviceMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRMiLoNearbyDeviceMO"));
}

+ (id)miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRMiLoNearbyDeviceMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRMiLoNearbyDeviceMO initWithContext:]([IRMiLoNearbyDeviceMO alloc], "initWithContext:", v7);

  -[IRMiLoNearbyDeviceMO setPrediction:](v10, "setPrediction:", v8);
  +[IRMiLoNearbyDeviceMO setPropertiesOfMiLoNearbyDeviceMO:withIRMiLoNearbyDeviceDO:](IRMiLoNearbyDeviceMO, "setPropertiesOfMiLoNearbyDeviceMO:withIRMiLoNearbyDeviceDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfMiLoNearbyDeviceMO:(id)a3 withIRMiLoNearbyDeviceDO:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setHasBleRssi:", objc_msgSend(v5, "hasBleRssi"));
  objc_msgSend(v5, "deviceIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDeviceIdentifier:", v7);
}

- (id)convert
{
  IRMiLoNearbyDeviceDO *v3;
  uint64_t v4;
  void *v5;
  IRMiLoNearbyDeviceDO *v6;

  v3 = [IRMiLoNearbyDeviceDO alloc];
  v4 = -[IRMiLoNearbyDeviceMO hasBleRssi](self, "hasBleRssi");
  -[IRMiLoNearbyDeviceMO deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IRMiLoNearbyDeviceDO initWithHasBleRssi:deviceIdentifier:](v3, "initWithHasBleRssi:deviceIdentifier:", v4, v5);

  return v6;
}

@end
