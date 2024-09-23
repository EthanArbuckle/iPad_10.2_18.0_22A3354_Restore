@implementation IRNearbyDeviceContainerMO

+ (IRNearbyDeviceContainerMO)nearbyDeviceContainerMOWithNearbyDeviceContainerDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  IRNearbyDeviceContainerMO *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[IRNearbyDeviceContainerMO initWithContext:]([IRNearbyDeviceContainerMO alloc], "initWithContext:", v7);
  -[IRNearbyDeviceContainerMO setReplayEvent:](v10, "setReplayEvent:", v8);

  +[IRNearbyDeviceContainerMO setPropertiesOfNearbyDeviceContainerMO:withNearbyDeviceContainerDO:inManagedObjectContext:](IRNearbyDeviceContainerMO, "setPropertiesOfNearbyDeviceContainerMO:withNearbyDeviceContainerDO:inManagedObjectContext:", v10, v9, v7);
  return v10;
}

+ (void)setPropertiesOfNearbyDeviceContainerMO:(id)a3 withNearbyDeviceContainerDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "nearbyDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __127__IRNearbyDeviceContainerMO_Access__setPropertiesOfNearbyDeviceContainerMO_withNearbyDeviceContainerDO_inManagedObjectContext___block_invoke;
  v14[3] = &unk_2510458E0;
  v15 = v7;
  v16 = v8;
  v11 = v8;
  v13 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend(v9, "freezeDateNIHomeDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setFreezeDateNIHomeDevice:", v12);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRNearbyDeviceContainerMO"));
}

void __127__IRNearbyDeviceContainerMO_Access__setPropertiesOfNearbyDeviceContainerMO_withNearbyDeviceContainerDO_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IRNearbyDeviceMO nearbyDeviceMOWithNearbyDeviceDO:nearbyDeviceContainer:inManagedObjectContext:](IRNearbyDeviceMO, "nearbyDeviceMOWithNearbyDeviceDO:nearbyDeviceContainer:inManagedObjectContext:", a2, v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNearbyDevicesObject:", v3);

}

- (id)convert
{
  void *v3;
  void *v4;
  id v5;
  IRNearbyDeviceContainerDO *v6;
  void *v7;
  IRNearbyDeviceContainerDO *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  -[IRNearbyDeviceContainerMO nearbyDevices](self, "nearbyDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__IRNearbyDeviceContainerMO_Access__convert__block_invoke;
  v10[3] = &unk_251045908;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  v6 = [IRNearbyDeviceContainerDO alloc];
  -[IRNearbyDeviceContainerMO freezeDateNIHomeDevice](self, "freezeDateNIHomeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IRNearbyDeviceContainerDO initWithFreezeDateNIHomeDevice:nearbyDevices:](v6, "initWithFreezeDateNIHomeDevice:nearbyDevices:", v7, v5);

  return v8;
}

void __44__IRNearbyDeviceContainerMO_Access__convert__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "convert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
