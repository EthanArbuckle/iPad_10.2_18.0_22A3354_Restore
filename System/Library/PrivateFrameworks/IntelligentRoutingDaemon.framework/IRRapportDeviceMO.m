@implementation IRRapportDeviceMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRRapportDeviceMO"));
}

+ (id)aVOutputDeviceMOFromRapportDeviceDO:(id)a3 inNode:(id)a4 withManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRRapportDeviceMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRRapportDeviceMO initWithContext:]([IRRapportDeviceMO alloc], "initWithContext:", v7);

  -[IRRapportDeviceMO setNode:](v10, "setNode:", v8);
  +[IRRapportDeviceMO setPropertiesOfRapportDeviceMO:withRapportDO:](IRRapportDeviceMO, "setPropertiesOfRapportDeviceMO:withRapportDO:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfRapportDeviceMO:(id)a3 withRapportDO:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "rapportEffectiveID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRapportEffectiveID:", v7);

  objc_msgSend(v5, "idsID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdsID:", v8);

  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v9);

  objc_msgSend(v5, "deviceModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceModel:", v10);

  objc_msgSend(v5, "mediaRemoteIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaRemoteIdentifier:", v11);

  objc_msgSend(v5, "iCloudId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setICloudId:", v12);

  objc_msgSend(v5, "mediaRouteIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMediaRouteIdentifier:", v13);
}

- (id)convert
{
  IRRapportDeviceDO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IRRapportDeviceDO *v11;

  v3 = [IRRapportDeviceDO alloc];
  -[IRRapportDeviceMO rapportEffectiveID](self, "rapportEffectiveID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO idsID](self, "idsID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO deviceModel](self, "deviceModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO mediaRemoteIdentifier](self, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO iCloudId](self, "iCloudId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRRapportDeviceMO mediaRouteIdentifier](self, "mediaRouteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[IRRapportDeviceDO initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:](v3, "initWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", v4, v5, v6, v7, v8, v9, v10);

  return v11;
}

@end
