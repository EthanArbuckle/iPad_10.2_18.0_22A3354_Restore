@implementation CAFPairedDevicesAction

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDevicesAction;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevicesAction;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFPairedDevicesAction;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFDeviceActionRequestCharacteristic)pairedDeviceActionRequestCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000022"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000036000022"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFDeviceActionRequestCharacteristic *)v11;
}

- (CAFDeviceActionRequest)pairedDeviceActionRequest
{
  void *v2;
  void *v3;

  -[CAFPairedDevicesAction pairedDeviceActionRequestCharacteristic](self, "pairedDeviceActionRequestCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceActionRequestValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFDeviceActionRequest *)v3;
}

- (void)setPairedDeviceActionRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFPairedDevicesAction pairedDeviceActionRequestCharacteristic](self, "pairedDeviceActionRequestCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceActionRequestValue:", v4);

}

- (BOOL)hasPairedDeviceActionRequest
{
  void *v2;
  BOOL v3;

  -[CAFPairedDevicesAction pairedDeviceActionRequestCharacteristic](self, "pairedDeviceActionRequestCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFConnectDeviceControl)connectDeviceControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000003600001A"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFConnectDeviceControl *)v4;
}

- (void)connectDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CAFPairedDevicesAction connectDeviceControl](self, "connectDeviceControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "connectDeviceWithIdentifier:completion:", v6, v7);
  }
  else if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__CAFPairedDevicesAction_connectDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

void __65__CAFPairedDevicesAction_connectDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasConnectDevice
{
  void *v2;
  BOOL v3;

  -[CAFPairedDevicesAction connectDeviceControl](self, "connectDeviceControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFDisconnectDeviceControl)disconnectDeviceControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000003600001B"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFDisconnectDeviceControl *)v4;
}

- (void)disconnectDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CAFPairedDevicesAction disconnectDeviceControl](self, "disconnectDeviceControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "disconnectDeviceWithIdentifier:completion:", v6, v7);
  }
  else if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__CAFPairedDevicesAction_disconnectDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

void __68__CAFPairedDevicesAction_disconnectDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasDisconnectDevice
{
  void *v2;
  BOOL v3;

  -[CAFPairedDevicesAction disconnectDeviceControl](self, "disconnectDeviceControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFForgetDeviceControl)forgetDeviceControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000003600001C"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFForgetDeviceControl *)v4;
}

- (void)forgetDeviceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CAFPairedDevicesAction forgetDeviceControl](self, "forgetDeviceControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "forgetDeviceWithIdentifier:completion:", v6, v7);
  }
  else if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__CAFPairedDevicesAction_forgetDeviceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

void __64__CAFPairedDevicesAction_forgetDeviceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasForgetDevice
{
  void *v2;
  BOOL v3;

  -[CAFPairedDevicesAction forgetDeviceControl](self, "forgetDeviceControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000016000019");
}

+ (id)observerProtocol
{
  return &unk_25682BC38;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqual:", CFSTR("0x0000000036000022")))
    goto LABEL_4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFPairedDevicesAction pairedDeviceActionRequestCharacteristic](self, "pairedDeviceActionRequestCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (v11)
  {
    -[CAFService observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFPairedDevicesAction pairedDeviceActionRequest](self, "pairedDeviceActionRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pairedDevicesActionService:didUpdatePairedDeviceActionRequest:", self, v12);

LABEL_4:
  }
  v13.receiver = self;
  v13.super_class = (Class)CAFPairedDevicesAction;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v13, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForPairedDeviceActionRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000022"));

  return v10;
}

- (BOOL)registeredForConnectDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000003600001A"));

  return v10;
}

- (BOOL)registeredForDisconnectDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000003600001B"));

  return v10;
}

- (BOOL)registeredForForgetDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000003600001C"));

  return v10;
}

@end
