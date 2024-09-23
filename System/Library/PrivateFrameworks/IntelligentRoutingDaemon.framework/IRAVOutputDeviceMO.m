@implementation IRAVOutputDeviceMO

+ (id)aVOutputDeviceMOFromAVOutputDeviceDO:(id)a3 inNode:(id)a4 withManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRAVOutputDeviceMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRAVOutputDeviceMO initWithContext:]([IRAVOutputDeviceMO alloc], "initWithContext:", v7);

  -[IRAVOutputDeviceMO setNode:](v10, "setNode:", v8);
  +[IRAVOutputDeviceMO setPropertiesOfAVOutputDeviceMO:withAVOutputDevice:](IRAVOutputDeviceMO, "setPropertiesOfAVOutputDeviceMO:withAVOutputDevice:", v10, v9);

  return v10;
}

+ (void)setPropertiesOfAVOutputDeviceMO:(id)a3 withAVOutputDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v10 = a3;
  objc_msgSend(v5, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDeviceID:", v6);

  objc_msgSend(v5, "deviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDeviceName:", v7);

  objc_msgSend(v5, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setModelID:", v8);

  objc_msgSend(v10, "setDeviceType:", objc_msgSend(v5, "deviceType"));
  objc_msgSend(v10, "setDeviceSubType:", objc_msgSend(v5, "deviceSubType"));
  objc_msgSend(v10, "setHasAirplayProperties:", objc_msgSend(v5, "hasAirplayProperties"));
  objc_msgSend(v10, "setDiscoveredOverInfra:", objc_msgSend(v5, "discoveredOverInfra"));
  v9 = objc_msgSend(v5, "discoveredWithBroker");

  objc_msgSend(v10, "setDiscoveredWithBroker:", v9);
}

- (id)convert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IRAVOutputDeviceMO deviceID](self, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRAVOutputDeviceMO modelID](self, "modelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRAVOutputDeviceMO deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRAVOutputDeviceDO aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:](IRAVOutputDeviceDO, "aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v3, v4, v5, -[IRAVOutputDeviceMO hasAirplayProperties](self, "hasAirplayProperties"), -[IRAVOutputDeviceMO discoveredOverInfra](self, "discoveredOverInfra"), -[IRAVOutputDeviceMO discoveredWithBroker](self, "discoveredWithBroker"), -[IRAVOutputDeviceMO deviceType](self, "deviceType"), -[IRAVOutputDeviceMO deviceSubType](self, "deviceSubType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRAVOutputDeviceMO"));
}

@end
