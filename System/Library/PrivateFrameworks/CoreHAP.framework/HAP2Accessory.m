@implementation HAP2Accessory

- (HAP2Accessory)initWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  id v8;
  id v9;
  HAP2Accessory *v10;
  uint64_t v11;
  HAP2PropertyLock *propertyLock;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSArray *services;
  objc_super v21;

  v8 = a3;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HAP2Accessory;
  v10 = -[HAP2Accessory init](&v21, sel_init);
  if (v10)
  {
    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2Accessory.propertyLock"));
    v11 = objc_claimAutoreleasedReturnValue();
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v11;

    objc_storeWeak((id *)&v10->_accessoryServerPrivate, v8);
    v10->_instanceID = a4;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "deviceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@+%lu"), v15, a4);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v16;

    if (objc_msgSend(v9, "count"))
    {
      -[HAP2Accessory _updateDiscoveredServices:](v10, "_updateDiscoveredServices:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v18 = objc_claimAutoreleasedReturnValue();
      services = v10->_services;
      v10->_services = (NSArray *)v18;

    }
  }

  return v10;
}

- (BOOL)isPrimary
{
  return -[HAP2Accessory instanceID](self, "instanceID") == 1;
}

- (unint64_t)connectionState
{
  void *v2;
  unint64_t v3;

  -[HAP2Accessory accessoryServer](self, "accessoryServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionState");

  return v3;
}

- (unint64_t)category
{
  void *v2;
  unint64_t v3;

  -[HAP2Accessory accessoryServer](self, "accessoryServer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "category");

  return v3;
}

- (NSString)name
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__HAP2Accessory_name__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__HAP2Accessory_setName___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSString)model
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__HAP2Accessory_model__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__HAP2Accessory_setModel___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSString)manufacturer
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__HAP2Accessory_manufacturer__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setManufacturer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2Accessory_setManufacturer___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSString)serialNumber
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__HAP2Accessory_serialNumber__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setSerialNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2Accessory_setSerialNumber___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSString)firmwareVersion
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__HAP2Accessory_firmwareVersion__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setFirmwareVersion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__HAP2Accessory_setFirmwareVersion___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (double)sleepInterval
{
  void *v2;
  double v3;
  double v4;

  -[HAP2Accessory internalSleepIntervalMs](self, "internalSleepIntervalMs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPAccessoryReachabilityProfile timeIntervalFromMillisecondNumberValue:](HAPAccessoryReachabilityProfile, "timeIntervalFromMillisecondNumberValue:", v2);
  v4 = v3;

  return v4;
}

- (id)internalSleepInterval
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__HAP2Accessory_internalSleepInterval__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)setInternalSleepInterval:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HAP2Accessory_setInternalSleepInterval___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSString)productData
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!-[HAP2Accessory isPrimary](self, "isPrimary"))
    return (NSString *)0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__HAP2Accessory_productData__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setProductData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__HAP2Accessory_setProductData___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (NSArray)services
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16245;
  v11 = __Block_byref_object_dispose__16246;
  v12 = 0;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__HAP2Accessory_services__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setServices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2Accessory propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__HAP2Accessory_setServices___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (id)identifyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v16;

  v8 = a3;
  v9 = a5;
  -[HAP2Accessory accessoryServerPrivate](self, "accessoryServerPrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "readValuesForCharacteristics:timeout:completion:", v8, v9, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HAP2Accessory_readValuesForCharacteristics_timeout_completion___block_invoke;
    block[3] = &unk_1E894D498;
    v16 = v9;
    dispatch_async(v13, block);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v16;

  v8 = a3;
  v9 = a5;
  -[HAP2Accessory accessoryServerPrivate](self, "accessoryServerPrivate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "writeValuesForCharacteristics:timeout:completion:", v8, v9, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HAP2Accessory_writeValuesForCharacteristics_timeout_completion___block_invoke;
    block[3] = &unk_1E894D498;
    v16 = v9;
    dispatch_async(v13, block);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAP2Accessory accessoryServerPrivate](self, "accessoryServerPrivate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "enableNotificationsForCharacteristics:completion:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HAP2Accessory_enableNotificationsForCharacteristics_completion___block_invoke;
    block[3] = &unk_1E894D498;
    v14 = v7;
    dispatch_async(v11, block);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAP2Accessory accessoryServerPrivate](self, "accessoryServerPrivate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "disableNotificationsForCharacteristics:completion:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HAP2Accessory_disableNotificationsForCharacteristics_completion___block_invoke;
    block[3] = &unk_1E894D498;
    v14 = v7;
    dispatch_async(v11, block);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)updateConnectionState:(unint64_t)a3
{
  id v4;

  -[HAP2Accessory delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "accessoryDidUpdateConnectionState:", self);

}

- (BOOL)updateDiscoveredServices:(id)a3
{
  id v4;
  int v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "validateDiscoveredServices:isPrimary:", v4, -[HAP2Accessory isPrimary](self, "isPrimary"));
  if (v5)
  {
    -[HAP2Accessory _updateDiscoveredServices:](self, "_updateDiscoveredServices:", v4);
    -[HAP2Accessory delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "accessoryDidUpdateServices:", self);

  }
  return v5;
}

- (void)characteristicValueChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HAP2Accessory delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "accessory:didNotifyForUpdatedValuesOnCharacteristic:", self, v5);

}

- (void)_handleUpdatedAccessoryInformationService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(a3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HAP2Accessory__handleUpdatedAccessoryInformationService___block_invoke;
  v8[3] = &unk_1E894D098;
  v8[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  if (-[HAP2Accessory isPrimary](self, "isPrimary"))
  {
    -[HAP2Accessory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[HAP2Accessory accessoryServer](self, "accessoryServer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2Accessory setName:](self, "setName:", v7);

    }
  }
}

- (void)_handleUpdatedAccessoryRuntimeInformationService:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HAP2Accessory__handleUpdatedAccessoryRuntimeInformationService___block_invoke;
  v5[3] = &unk_1E894D098;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)_updateDiscoveredServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16245;
  v19 = __Block_byref_object_dispose__16246;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16245;
  v13 = __Block_byref_object_dispose__16246;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2Accessory services](self, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPService hap2_mergeServices:discoveredServices:mergedServices:](HAPService, "hap2_mergeServices:discoveredServices:mergedServices:", v6, v4, v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HAP2Accessory__updateDiscoveredServices___block_invoke;
  v8[3] = &unk_1E894D1C0;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  -[HAP2Accessory _handleUpdatedAccessoryInformationService:](self, "_handleUpdatedAccessoryInformationService:", v16[5]);
  if (v10[5])
    -[HAP2Accessory _handleUpdatedAccessoryRuntimeInformationService:](self, "_handleUpdatedAccessoryRuntimeInformationService:");
  v7 = (void *)objc_msgSend(v5, "copy");
  -[HAP2Accessory setServices:](self, "setServices:", v7);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

}

- (HAP2AccessoryDelegate)delegate
{
  return (HAP2AccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)instanceID
{
  return self->_instanceID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)internalSleepIntervalMs
{
  return self->_internalSleepIntervalMs;
}

- (void)setInternalSleepIntervalMs:(id)a3
{
  objc_storeStrong((id *)&self->_internalSleepIntervalMs, a3);
}

- (HAP2PairedAccessoryServerPrivate)accessoryServerPrivate
{
  return (HAP2PairedAccessoryServerPrivate *)objc_loadWeakRetained((id *)&self->_accessoryServerPrivate);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_destroyWeak((id *)&self->_accessoryServerPrivate);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_internalSleepIntervalMs, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __43__HAP2Accessory__updateDiscoveredServices___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

  if (v5)
  {
    v6 = a1 + 32;
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40), a2);
    goto LABEL_6;
  }
  objc_msgSend(v9, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000239-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    v6 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:

}

void __66__HAP2Accessory__handleUpdatedAccessoryRuntimeInformationService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("0000023A-0000-1000-8000-0026BB765291"));

  if (v4)
  {
    objc_msgSend(v8, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v8, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

      objc_msgSend(*(id *)(a1 + 32), "setInternalSleepIntervalMs:", v7);
    }
  }

}

void __59__HAP2Accessory__handleUpdatedAccessoryInformationService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    objc_msgSend(v28, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "setName:", v6);
  }
  else
  {
    objc_msgSend(v28, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("00000020-0000-1000-8000-0026BB765291"));

    if (v11)
    {
      objc_msgSend(v28, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(*(id *)(a1 + 32), "setManufacturer:", v6);
    }
    else
    {
      objc_msgSend(v28, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("00000021-0000-1000-8000-0026BB765291"));

      if (v14)
      {
        objc_msgSend(v28, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(*(id *)(a1 + 32), "setModel:", v6);
      }
      else
      {
        objc_msgSend(v28, "type");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("00000052-0000-1000-8000-0026BB765291"));

        if (v17)
        {
          objc_msgSend(v28, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(*(id *)(a1 + 32), "setFirmwareVersion:", v6);
        }
        else
        {
          objc_msgSend(v28, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("00000030-0000-1000-8000-0026BB765291"));

          if (v20)
          {
            objc_msgSend(v28, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              objc_msgSend(*(id *)(a1 + 32), "setSerialNumber:", v6);
          }
          else
          {
            objc_msgSend(v28, "type");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("00000220-0000-1000-8000-0026BB765291"));

            if (v23)
            {
              objc_msgSend(v28, "value");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v28, "value");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v28, "value");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v26 = 0;
                }

                +[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "setProductData:", v27);

              }
            }
          }
        }
      }
    }
  }

}

void __67__HAP2Accessory_disableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__HAP2Accessory_enableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __66__HAP2Accessory_writeValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __65__HAP2Accessory_readValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __29__HAP2Accessory_setServices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

}

void __25__HAP2Accessory_services__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

void __32__HAP2Accessory_setProductData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

void __28__HAP2Accessory_productData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__HAP2Accessory_setInternalSleepInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

void __38__HAP2Accessory_internalSleepInterval__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

void __36__HAP2Accessory_setFirmwareVersion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

void __32__HAP2Accessory_firmwareVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__HAP2Accessory_setSerialNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __29__HAP2Accessory_serialNumber__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __33__HAP2Accessory_setManufacturer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __29__HAP2Accessory_manufacturer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __26__HAP2Accessory_setModel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __22__HAP2Accessory_model__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __25__HAP2Accessory_setName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __21__HAP2Accessory_name__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)validateDiscoveredServices:(id)a3 isPrimary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t v42[16];
  uint8_t buf[8];
  uint64_t v44;
  void (*v45)(uint64_t, void *, uint64_t, _BYTE *);
  void *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;

  v4 = a4;
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__16245;
  v40 = __Block_byref_object_dispose__16246;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16245;
  v34 = __Block_byref_object_dispose__16246;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__16245;
  v28 = __Block_byref_object_dispose__16246;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__HAP2Accessory_validateDiscoveredServices_isPrimary___block_invoke;
  v19[3] = &unk_1E894C580;
  v19[4] = &v36;
  v19[5] = &v20;
  v19[6] = &v30;
  v19[7] = &v24;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
  if (*((_BYTE *)v21 + 24))
    goto LABEL_2;
  v10 = v37[5];
  if (!v10)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v16 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)buf = 0;
    v17 = "Service list contains no Accessory Information service";
LABEL_30:
    _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_2;
  }
  if (!v4)
    goto LABEL_13;
  if (!v31[5])
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v16 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)buf = 0;
    v17 = "Service list contains no Protocol Information service";
    goto LABEL_30;
  }
  if (!v25[5])
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "Service list contains no Accessory Runtime Information service", buf, 2u);
    }
    v10 = v37[5];
  }
LABEL_13:
  if (!objc_msgSend(a1, "validateAccessoryInformationService:", v10)
    || v31[5] && !objc_msgSend(a1, "validateProtocolInformationService:"))
  {
    goto LABEL_2;
  }
  v12 = (void *)v25[5];
  if (!v12)
    goto LABEL_33;
  v13 = v12;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  objc_msgSend(v13, "characteristics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v7;
  v44 = 3221225472;
  v45 = __validateAccessoryRuntimeInformationService_block_invoke;
  v46 = &unk_1E894C5D0;
  v47 = &v53;
  v48 = &v49;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", buf);

  if (!*((_BYTE *)v50 + 24))
  {
    if (!*((_BYTE *)v54 + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v15 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_WORD *)v42 = 0;
      v18 = "Accessory Runtime Information service does not contain required characteristics";
      goto LABEL_39;
    }
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);

LABEL_33:
    v8 = 1;
    goto LABEL_3;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v15 = hap2Log_accessory;
  if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    goto LABEL_21;
  *(_WORD *)v42 = 0;
  v18 = "Accessory Runtime Information service is invalid";
LABEL_39:
  _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, v18, v42, 2u);
LABEL_21:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

LABEL_2:
  v8 = 0;
LABEL_3:
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v8;
}

+ (BOOL)validateAccessoryInformationService:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v7;
  const char *v8;
  uint8_t v9[8];
  _QWORD v10[12];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[3];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v3 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(v3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HAP2Accessory_validateAccessoryInformationService___block_invoke;
  v10[3] = &unk_1E894C5A8;
  v10[4] = &v37;
  v10[5] = &v11;
  v10[6] = &v33;
  v10[7] = &v29;
  v10[8] = &v25;
  v10[9] = &v21;
  v10[10] = &v17;
  v10[11] = v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v12 + 24))
    goto LABEL_2;
  if (!*((_BYTE *)v38 + 24))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain an Identify characteristic";
    goto LABEL_35;
  }
  if (!*((_BYTE *)v34 + 24))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain a Name characteristic";
    goto LABEL_35;
  }
  if (!*((_BYTE *)v30 + 24))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain a Manufacturer characteristic";
    goto LABEL_35;
  }
  if (!*((_BYTE *)v26 + 24))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain a Model characteristic";
    goto LABEL_35;
  }
  if (!*((_BYTE *)v22 + 24))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_2;
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain a Firmware Revision characteristic";
    goto LABEL_35;
  }
  if (*((_BYTE *)v18 + 24))
  {
    v5 = 1;
    goto LABEL_3;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    v8 = "Accessory Information service does not contain a Serial Number characteristic";
LABEL_35:
    _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
  }
LABEL_2:
  v5 = 0;
LABEL_3:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v5;
}

+ (BOOL)validateProtocolInformationService:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v7;
  uint8_t v8[16];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v3, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HAP2Accessory_validateProtocolInformationService___block_invoke;
  v9[3] = &unk_1E894C5D0;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  if (!*((_BYTE *)v11 + 24))
  {
    if (*((_BYTE *)v15 + 24))
    {
      v5 = 1;
      goto LABEL_5;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "Protocol Information service does not contain a Version characteristic", v8, 2u);
    }
  }
  v5 = 0;
LABEL_5:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

+ (HAP2Accessory)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  HAP2Accessory *v12;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA37D98))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  if (v11 && objc_msgSend(a1, "validateDiscoveredServices:isPrimary:", v9, a4 == 1))
    v12 = -[HAP2Accessory initWithAccessoryServer:instanceID:discoveredServices:]([HAP2Accessory alloc], "initWithAccessoryServer:instanceID:discoveredServices:", v11, a4, v9);
  else
    v12 = 0;

  return v12;
}

void __52__HAP2Accessory_validateProtocolInformationService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;

  v3 = a2;
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("00000037-0000-1000-8000-0026BB765291"));

  if (v5)
  {
    v6 = a1 + 32;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v7 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v14 = 0;
      v8 = "Protocol Information service contains more than one Version characteristic";
      v9 = (uint8_t *)&v14;
    }
    else
    {
      objc_msgSend(v3, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "format");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HAPCharacteristicFormatFromString(v11);

      if (v12 == 11)
      {
LABEL_14:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24) = 1;
        goto LABEL_15;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v7 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        v6 = a1 + 40;
        goto LABEL_14;
      }
      v13 = 0;
      v8 = "Protocol Information service contains an invalid Version characteristic";
      v9 = (uint8_t *)&v13;
    }
    _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    goto LABEL_13;
  }
LABEL_15:

}

void __53__HAP2Accessory_validateAccessoryInformationService___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint8_t v47[16];

  v6 = a2;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000014-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains more than one Identify characteristic";
LABEL_78:
      _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, v10, v47, 2u);
LABEL_79:
      v18 = a1[5];
      goto LABEL_80;
    }
    objc_msgSend(v6, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "format");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HAPCharacteristicFormatFromString(v16);

    if (v17 != 9)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Identify characteristic";
      goto LABEL_78;
    }
    v18 = a1[4];
LABEL_80:
    *(_BYTE *)(*(_QWORD *)(v18 + 8) + 24) = 1;
    goto LABEL_81;
  }
  objc_msgSend(v6, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));

  if (v12)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains more than one Name characteristic";
      goto LABEL_78;
    }
    objc_msgSend(v6, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "format");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = HAPCharacteristicFormatFromString(v22);

    if (v23 != 11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Name characteristic";
      goto LABEL_78;
    }
    v18 = a1[6];
    goto LABEL_80;
  }
  objc_msgSend(v6, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("00000020-0000-1000-8000-0026BB765291"));

  if (v14)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains more than one Manufacturer characteristic";
      goto LABEL_78;
    }
    objc_msgSend(v6, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "format");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = HAPCharacteristicFormatFromString(v27);

    if (v28 != 11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Manufacturer characteristic";
      goto LABEL_78;
    }
    v18 = a1[7];
    goto LABEL_80;
  }
  objc_msgSend(v6, "type");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("00000021-0000-1000-8000-0026BB765291"));

  if (v20)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains more than one Model characteristic";
      goto LABEL_78;
    }
    objc_msgSend(v6, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "format");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = HAPCharacteristicFormatFromString(v34);

    if (v35 != 11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Model characteristic";
      goto LABEL_78;
    }
    v18 = a1[8];
    goto LABEL_80;
  }
  objc_msgSend(v6, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("00000052-0000-1000-8000-0026BB765291"));

  if (v25)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains more than one Firmware Revision characteristic";
      goto LABEL_78;
    }
    objc_msgSend(v6, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "format");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HAPCharacteristicFormatFromString(v39);

    if (v40 != 11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Firmware Revision characteristic";
      goto LABEL_78;
    }
    v18 = a1[9];
    goto LABEL_80;
  }
  objc_msgSend(v6, "type");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("00000030-0000-1000-8000-0026BB765291"));

  if (v30)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v31 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      *(_WORD *)v47 = 0;
      v32 = "Accessory Information service contains more than one Serial Number characteristic";
LABEL_89:
      _os_log_error_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, v32, v47, 2u);
LABEL_62:
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_81;
    }
    objc_msgSend(v6, "metadata");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "format");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = HAPCharacteristicFormatFromString(v42);

    if (v43 != 11)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Serial Number characteristic";
      goto LABEL_78;
    }
    goto LABEL_83;
  }
  objc_msgSend(v6, "type");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("00000220-0000-1000-8000-0026BB765291"));

  if (v37)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v31 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      *(_WORD *)v47 = 0;
      v32 = "Accessory Information service contains more than one Product Data characteristic";
      goto LABEL_89;
    }
    objc_msgSend(v6, "metadata");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "format");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = HAPCharacteristicFormatFromString(v45);

    if (v46 != 12)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_79;
      *(_WORD *)v47 = 0;
      v10 = "Accessory Information service contains an invalid Product Data characteristic";
      goto LABEL_78;
    }
LABEL_83:
    v18 = a1[10];
    goto LABEL_80;
  }
LABEL_81:

}

void __54__HAP2Accessory_validateDiscoveredServices_isPrimary___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;

  v4 = a2;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

  if (v6)
  {
    v7 = *(_QWORD *)(a1[4] + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v23 = 0;
      v11 = "Service list contains more than one Accessory Information service";
      v12 = (uint8_t *)&v23;
LABEL_19:
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
LABEL_20:
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));

  if (v14)
  {
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(_QWORD *)(v15 + 40);
    v8 = (id *)(v15 + 40);
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v22 = 0;
      v11 = "Service list contains more than one Protocol Information service";
      v12 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  objc_msgSend(v4, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("00000239-0000-1000-8000-0026BB765291"));

  if (v18)
  {
    v19 = *(_QWORD *)(a1[7] + 8);
    v20 = *(_QWORD *)(v19 + 40);
    v8 = (id *)(v19 + 40);
    if (v20)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v21 = 0;
      v11 = "Service list contains more than one Accessory Runtime Information service";
      v12 = (uint8_t *)&v21;
      goto LABEL_19;
    }
LABEL_21:
    objc_storeStrong(v8, a2);
  }
LABEL_22:

}

@end
