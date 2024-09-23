@implementation _BCPowerSourceController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BCRegisterUserNotificationsLogging();
}

- (_BCPowerSourceController)init
{
  _BCPowerSourceController *v2;
  NSObject *v3;
  objc_super v5;
  uint8_t buf[4];
  _BCPowerSourceController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)_BCPowerSourceController;
  v2 = -[_BCPowerSourceController init](&v5, sel_init);
  if (v2)
  {
    v3 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = v2;
      _os_log_impl(&dword_2115B2000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) initializing new power source controller", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_BCPowerSourceController _endPowerSourceObserving](self, "_endPowerSourceObserving");
  v3.receiver = self;
  v3.super_class = (Class)_BCPowerSourceController;
  -[_BCPowerSourceController dealloc](&v3, sel_dealloc);
}

- (NSArray)connectedDevices
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  _BCPowerSourceController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_2115B2000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Fetch connected devices", buf, 0xCu);
  }
  IOPSCopyPowerSourcesByTypePrecise();
  v4 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR))
    -[_BCPowerSourceController connectedDevices].cold.2((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  v11 = MEMORY[0x24BDBD1A8];

  return (NSArray *)v11;
}

- (void)addBatteryDeviceObserver:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _BCPowerSourceController *v10;
  NSMapTable *observersToQueues;
  uint64_t v12;
  NSMapTable *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _BCPowerSourceController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23 = v7;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCPowerSourceController.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCPowerSourceController.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v10 = self;
  objc_sync_enter(v10);
  observersToQueues = v10->_observersToQueues;
  if (!observersToQueues)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v10->_observersToQueues;
    v10->_observersToQueues = (NSMapTable *)v12;

    observersToQueues = v10->_observersToQueues;
  }
  -[NSMapTable setObject:forKey:](observersToQueues, "setObject:forKey:", v9, v7);
  objc_sync_exit(v10);

  v14 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v17;
    v26 = 2048;
    v27 = v10;
    v28 = 2112;
    v29 = v19;
    v30 = 2048;
    v31 = &v23;
    _os_log_impl(&dword_2115B2000, v15, OS_LOG_TYPE_DEFAULT, "(%{public}@)<%p> Added observer: %@<%p>", buf, 0x2Au);

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59___BCPowerSourceController_addBatteryDeviceObserver_queue___block_invoke;
  v22[3] = &unk_24CC1A250;
  v22[4] = v10;
  -[_BCPowerSourceController _notifyObserver:block:queue:](v10, "_notifyObserver:block:queue:", v23, v22, v9);
  -[_BCPowerSourceController _beginPowerSourceObservingIfNecessary](v10, "_beginPowerSourceObservingIfNecessary");

}

- (void)removeBatteryDeviceObserver:(id)a3
{
  id v4;
  _BCPowerSourceController *v5;
  NSMapTable *observersToQueues;
  BOOL v7;
  NSMapTable *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  _BCPowerSourceController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = v4;
  v5 = self;
  objc_sync_enter(v5);
  observersToQueues = v5->_observersToQueues;
  if (observersToQueues)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    -[NSMapTable removeObjectForKey:](observersToQueues, "removeObjectForKey:", v4);
    if (!-[NSMapTable count](v5->_observersToQueues, "count"))
    {
      v8 = v5->_observersToQueues;
      v5->_observersToQueues = 0;

      -[_BCPowerSourceController _endPowerSourceObserving](v5, "_endPowerSourceObserving");
    }
  }
  objc_sync_exit(v5);

  v9 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v17 = v12;
    v18 = 2048;
    v19 = v5;
    v20 = 2112;
    v21 = v14;
    v22 = 2048;
    v23 = &v15;
    _os_log_impl(&dword_2115B2000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@)<%p> Removed observer: %@<%p>", buf, 0x2Au);

  }
}

- (BOOL)_isDevicePartOfPair:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "matchIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = objc_msgSend(v3, "accessoryCategory") != 2 || objc_msgSend(v3, "parts") != 4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_shouldConsiderDeviceWithPowerSourceDescription:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("Max Capacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  if ((BSFloatIsZero() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Power Source State"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("Off Line"));

    v5 = v7 ^ 1;
  }

  return v5;
}

- (id)_identifierFromPowerSourceDescription:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("Group Identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("Part Identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v6;
    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("Power Source ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCPowerSourceController.m"), 195, CFSTR("Missing kIOPSPowerSourceIDKey in %@"), v5);
LABEL_7:

  }
  return v8;
}

- (int64_t)_transportTypeFromPowerSourceTransportTypeString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Internal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Serial")) & 1) != 0
         || (objc_msgSend(v3, "isEqual:", CFSTR("USB")) & 1) != 0
         || (objc_msgSend(v3, "isEqual:", CFSTR("AID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Bluetooth")) & 1) != 0
         || (objc_msgSend(v3, "isEqual:", CFSTR("Bluetooth LE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("Inductive In-Band")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_vendorFromPowerSourceDescriptionVendorIdentifier:(id)a3 transportType:(int64_t)a4
{
  id v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  _BOOL8 v10;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 < 2)
  {
    v7 = 1;
    goto LABEL_18;
  }
  if (!v5)
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  v8 = objc_msgSend(v5, "integerValue");
  if (a4 == 3)
  {
    v7 = 1;
    if (v8 > 1451)
    {
      if (v8 == 1452)
        goto LABEL_18;
      if (v8 != 10507)
        goto LABEL_17;
    }
    else
    {
      if (v8 == 76)
        goto LABEL_18;
      if (v8 != 204)
        goto LABEL_17;
    }
    v7 = 2;
    goto LABEL_18;
  }
  v10 = a4 == 4 && v8 == 1452;
  if (a4 == 2)
    v7 = v8 == 1452;
  else
    v7 = v10;
LABEL_18:

  return v7;
}

- (unint64_t)_partFromPowerSourcePartIdentifier:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Left")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Right")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("Case")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_accessoryCategoryFromPowerSourceAccessoryCategory:(id)a3 partType:(unint64_t)a4 transportType:(int64_t)a5 vendor:(int64_t)a6 productIdentifier:(int64_t)a7
{
  id v7;
  unint64_t v8;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Speaker")) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Headphone")) & 1) != 0
         || (objc_msgSend(v7, "isEqual:", CFSTR("Audio Battery Case")) & 1) != 0)
  {
    v8 = 2;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Watch")) & 1) != 0)
  {
    v8 = 3;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Battery Case")) & 1) != 0)
  {
    v8 = 4;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Keyboard")) & 1) != 0)
  {
    v8 = 5;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Trackpad")) & 1) != 0)
  {
    v8 = 6;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Pencil")) & 1) != 0)
  {
    v8 = 7;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Game Controller")) & 1) != 0)
  {
    v8 = 8;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("Mouse")) & 1) != 0)
  {
    v8 = 9;
  }
  else if ((objc_msgSend(v7, "isEqual:", CFSTR("HearingAid")) & 1) != 0)
  {
    v8 = 10;
  }
  else
  {
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("Speaker"));
  }

  return v8;
}

- (int64_t)_powerSourceStateFromPowerSourceStateString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Off Line")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("AC Power")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("Battery Power")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_nameForCurrentDevice
{
  return (id)MGCopyAnswer();
}

- (id)_nameForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 name:(id)a5 partName:(id)a6 isInternal:(BOOL)a7
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;

  v7 = a7;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (v7)
  {
    -[_BCPowerSourceController _nameForCurrentDevice](self, "_nameForCurrentDevice");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v11, "length"))
  {
    v13 = v12;
  }
  else
  {
    v13 = (__CFString *)v10;
  }
  v14 = v13;
  if (-[__CFString length](v13, "length"))
    v15 = v14;
  else
    v15 = &stru_24CC1A8A0;
  v16 = v15;

  return v16;
}

- (int)_displayChargePercentForCurrentCapacity:(id)a3 andMaxCapacity:(id)a4 updateZeroValue:(BOOL)a5
{
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int v13;

  v7 = a4;
  objc_msgSend(a3, "floatValue");
  v9 = v8;
  objc_msgSend(v7, "floatValue");
  v11 = v10;

  v12 = fmax(fmin((float)(v9 / v11), 1.0), 0.0);
  v13 = (int)fminf(roundf(v12 * 100.0), 100.0);
  if (v13 < 1 && a5)
    return 1;
  else
    return v13;
}

- (int64_t)_lowBatteryLevelForCurrentDevice
{
  return (int)MGGetSInt32Answer();
}

- (int64_t)_lowBatteryLevelForVendor:(int64_t)a3 accessoryCategory:(unint64_t)a4 transportType:(int64_t)a5
{
  if (a5 == 1)
    return -[_BCPowerSourceController _lowBatteryLevelForCurrentDevice](self, "_lowBatteryLevelForCurrentDevice", a3, a4);
  if (a3 == 1 && a4 - 5 <= 4)
    return qword_2115B7EC8[a4 - 5];
  return 20;
}

- (BOOL)_shouldCoalesceDevices:(id)a3 minimumPercentCharge:(int64_t *)a4
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72___BCPowerSourceController__shouldCoalesceDevices_minimumPercentCharge___block_invoke;
  v10[3] = &unk_24CC1A278;
  v6 = v5;
  v11 = v6;
  v12 = &v18;
  v13 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = *((unsigned __int8 *)v15 + 24);
  if (a4 && *((_BYTE *)v15 + 24))
    *a4 = v19[3];
  v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)_deviceByCoalescingDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "parts");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v21 = v4;
    v12 = 0;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

        v12 |= v8 != objc_msgSend(v15, "parts");
        v8 |= objc_msgSend(v15, "parts");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("-"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v17);

    objc_msgSend(v5, "setParts:", v8);
    v4 = v21;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v21, "groupName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setName:", v18);

    }
  }
  else
  {

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("-"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v19);

    objc_msgSend(v5, "setParts:", v8);
  }

  return v5;
}

- (id)_orderedDevicesFromPowerSourcesBlob:(void *)a3 powerSourcesList:(__CFArray *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CFIndex Count;
  NSObject *v12;
  CFIndex i;
  const void *ValueAtIndex;
  void *v15;
  uint64_t v16;
  _BCPowerSourceController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _BCPowerSourceController *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v86;
  uint64_t (**v87)(_QWORD, _QWORD);
  uint64_t v88;
  uint64_t v89;
  id obj;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  id v106;
  _BCPowerSourceController *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[5];
  id v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint8_t v134[128];
  uint8_t buf[4];
  _BCPowerSourceController *v136;
  __int16 v137;
  CFIndex v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = MEMORY[0x24BDAC760];
  v129[1] = 3221225472;
  v129[2] = __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke;
  v129[3] = &unk_24CC1A2A0;
  v107 = self;
  v129[4] = self;
  v86 = v9;
  v130 = v86;
  v87 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x212BDD484](v129);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount(a4);
  v12 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v136 = v107;
    v137 = 2048;
    v138 = Count;
    _os_log_impl(&dword_2115B2000, v12, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found %lu power sources", buf, 0x16u);
  }
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
      IOPSGetPowerSourceDescription(a3, ValueAtIndex);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v15);

    }
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v10;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
  v17 = v107;
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v126;
    v88 = *(_QWORD *)v126;
    do
    {
      v20 = 0;
      v89 = v18;
      do
      {
        if (*(_QWORD *)v126 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v20);
        v22 = (void *)objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v21, "objectForKey:", CFSTR("Debug Information"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v110, "count"))
          objc_msgSend(v22, "removeObjectForKey:", CFSTR("Debug Information"));
        v108 = v22;
        v23 = BCLogPowerSourceController;
        if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v136 = v17;
          v137 = 2114;
          v138 = (CFIndex)v108;
          _os_log_impl(&dword_2115B2000, v23, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found power source: %{public}@", buf, 0x16u);
        }
        if (objc_msgSend(v110, "count"))
        {
          v24 = BCLogPowerSourceController;
          if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v136 = v17;
            v137 = 2114;
            v138 = (CFIndex)v110;
            _os_log_debug_impl(&dword_2115B2000, v24, OS_LOG_TYPE_DEBUG, "(%{public}@) Power source debug info: %{public}@", buf, 0x16u);
          }
        }
        if (-[_BCPowerSourceController _shouldConsiderDeviceWithPowerSourceDescription:](v17, "_shouldConsiderDeviceWithPowerSourceDescription:", v21))
        {
          -[_BCPowerSourceController _identifierFromPowerSourceDescription:](v17, "_identifierFromPowerSourceDescription:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("Product ID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v26, "integerValue");

          objc_msgSend(v21, "objectForKey:", CFSTR("Model Number"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("Transport Type"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[_BCPowerSourceController _transportTypeFromPowerSourceTransportTypeString:](v17, "_transportTypeFromPowerSourceTransportTypeString:", v27);

          objc_msgSend(v21, "objectForKey:", CFSTR("Vendor ID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[_BCPowerSourceController _vendorFromPowerSourceDescriptionVendorIdentifier:transportType:](v17, "_vendorFromPowerSourceDescriptionVendorIdentifier:transportType:", v29, v28);

          objc_msgSend(v21, "objectForKey:", CFSTR("Group Identifier"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("Part Identifier"));
          v31 = v17;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[_BCPowerSourceController _partFromPowerSourcePartIdentifier:](v31, "_partFromPowerSourcePartIdentifier:", v32);

          objc_msgSend(v7, "objectForKey:", v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", CFSTR("Accessory Category"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v28;
          v105 = (id)v30;
          v104 = -[_BCPowerSourceController _accessoryCategoryFromPowerSourceAccessoryCategory:partType:transportType:vendor:productIdentifier:](v31, "_accessoryCategoryFromPowerSourceAccessoryCategory:partType:transportType:vendor:productIdentifier:");
          if (v34)
          {
            if ((((uint64_t (**)(_QWORD, void *))v87)[2](v87, v34) & 1) == 0)
              goto LABEL_21;
LABEL_22:
            v96 = v25;
            objc_msgSend(v21, "objectForKey:", CFSTR("Power Source State"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = -[_BCPowerSourceController _powerSourceStateFromPowerSourceStateString:](v107, "_powerSourceStateFromPowerSourceStateString:", v35);

            objc_msgSend(v21, "objectForKey:", CFSTR("Type"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("InternalBattery"));
            v95 = v36;
            LODWORD(v36) = objc_msgSend(v36, "isEqualToString:", CFSTR("Accessory Source"));
            objc_msgSend(v21, "objectForKey:", CFSTR("Name"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", CFSTR("Part Name"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[_BCPowerSourceController _nameForVendor:accessoryCategory:name:partName:isInternal:](v107, "_nameForVendor:accessoryCategory:name:partName:isInternal:", v105, v104, v38, v39, v37);
            v40 = objc_claimAutoreleasedReturnValue();

            v93 = v37;
            objc_msgSend(v34, "setInternal:", v37);
            objc_msgSend(v34, "setPowerSource:", v36 ^ 1);
            objc_msgSend(v34, "setPowerSourceState:", v99);
            objc_msgSend(v34, "setTransportType:", v97);
            objc_msgSend(v34, "setName:", v40);
            objc_msgSend(v21, "objectForKey:", CFSTR("Name"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setGroupName:", v41);

            objc_msgSend(v21, "objectForKey:", CFSTR("Accessory Identifier"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_opt_class();
            v44 = v42;
            v94 = (void *)v40;
            if (v43)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v45 = v44;
              else
                v45 = 0;
            }
            else
            {
              v45 = 0;
            }
            v46 = v45;

            objc_msgSend(v34, "setAccessoryIdentifier:", v46);
            v100 = 1;
            objc_msgSend(v34, "setConnected:", 1);
            objc_msgSend(v21, "objectForKey:", CFSTR("AdapterDetails"));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "objectForKey:", CFSTR("IsWireless"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "BOOLValue");

            objc_msgSend(v34, "setWirelesslyCharging:", v48);
            objc_msgSend(v21, "objectForKey:", CFSTR("Current Capacity"));
            v49 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", CFSTR("Max Capacity"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)v49;
            v51 = -[_BCPowerSourceController _displayChargePercentForCurrentCapacity:andMaxCapacity:updateZeroValue:](v107, "_displayChargePercentForCurrentCapacity:andMaxCapacity:updateZeroValue:", v49, v50, objc_msgSend(v34, "isInternal"));
            v52 = -[_BCPowerSourceController _lowBatteryLevelForVendor:accessoryCategory:transportType:](v107, "_lowBatteryLevelForVendor:accessoryCategory:transportType:", v105, v104, v97);
            objc_msgSend(v21, "objectForKey:", CFSTR("Is Charging"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v53, "BOOLValue") & 1) == 0)
            {
              objc_msgSend(v21, "objectForKey:", CFSTR("Show Charging UI"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v54, "BOOLValue");

            }
            if (objc_msgSend(v34, "isInternal"))
              v55 = MGGetBoolAnswer() ^ 1;
            else
              v55 = 0;
            objc_msgSend(v34, "setPercentCharge:", v51);
            objc_msgSend(v34, "setLowBattery:", v52 >= v51);
            if (v93)
            {
              objc_msgSend(v34, "setLowPowerModeActive:", -[_BCPowerSourceController _isLowPowerModeActive](v107, "_isLowPowerModeActive"));
            }
            else
            {
              objc_msgSend(v21, "objectForKey:", CFSTR("LPM Active"));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setLowPowerModeActive:", objc_msgSend(v56, "BOOLValue"));

            }
            objc_msgSend(v34, "setCharging:", v100);
            objc_msgSend(v34, "setApproximatesPercentCharge:", v55);
            v57 = BCLogPowerSourceController;
            if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v136 = v107;
              v137 = 2114;
              v138 = (CFIndex)v34;
              _os_log_impl(&dword_2115B2000, v57, OS_LOG_TYPE_DEFAULT, "(%{public}@) Found device: %{public}@", buf, 0x16u);
            }

            v25 = v96;
          }
          else if (objc_msgSend(v25, "length"))
          {
            +[BCBatteryDevice batteryDeviceWithIdentifier:vendor:productIdentifier:parts:matchIdentifier:](BCBatteryDevice, "batteryDeviceWithIdentifier:vendor:productIdentifier:parts:matchIdentifier:", v25, v30, v98, v33, v102);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setModelNumber:", v103);
            objc_msgSend(v34, "setAccessoryCategory:", v104);
            if ((((uint64_t (**)(_QWORD, void *))v87)[2](v87, v34) & 1) != 0)
            {
              if (v34)
                goto LABEL_22;
            }
            else
            {
              objc_msgSend(v7, "setObject:forKey:", v34, v25);
              if (v34)
              {
LABEL_21:
                objc_msgSend(v8, "addObject:", v25);
                goto LABEL_22;
              }
            }
          }

          v17 = v107;
          v19 = v88;
          v18 = v89;
        }

        ++v20;
      }
      while (v18 != v20);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v134, 16);
      v18 = v58;
    }
    while (v58);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend(v86, "allValues");
  v106 = (id)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
  if (v111)
  {
    v109 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v111; ++j)
      {
        if (*(_QWORD *)v122 != v109)
          objc_enumerationMutation(v106);
        v60 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v60, "count") < 2)
        {
          objc_msgSend(v60, "lastObject");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "addObject:", v74);

        }
        else
        {
          v120 = 0;
          if (-[_BCPowerSourceController _shouldCoalesceDevices:minimumPercentCharge:](v17, "_shouldCoalesceDevices:minimumPercentCharge:", v60, &v120))
          {
            objc_msgSend(v60, "lastObject");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "matchIdentifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKey:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v64)
            {
              -[_BCPowerSourceController _deviceByCoalescingDevice:](v17, "_deviceByCoalescingDevice:", v60);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "identifier");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v64, v65);

            }
            objc_msgSend(v61, "addObject:", v64);
            objc_msgSend(v64, "setPercentCharge:", v120);
            v66 = -[_BCPowerSourceController _lowBatteryLevelForVendor:accessoryCategory:transportType:](v17, "_lowBatteryLevelForVendor:accessoryCategory:transportType:", objc_msgSend(v64, "vendor"), objc_msgSend(v64, "accessoryCategory"), objc_msgSend(v64, "transportType"));
            objc_msgSend(v64, "setLowBattery:", v120 <= v66);
            v67 = BCLogPowerSourceController;
            if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v136 = v17;
              v137 = 2114;
              v138 = (CFIndex)v64;
              _os_log_impl(&dword_2115B2000, v67, OS_LOG_TYPE_DEFAULT, "(%{public}@) Coalesced device: %{public}@", buf, 0x16u);
            }
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v68 = v60;
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
            if (v69)
            {
              v70 = v69;
              v71 = *(_QWORD *)v117;
              do
              {
                for (k = 0; k != v70; ++k)
                {
                  if (*(_QWORD *)v117 != v71)
                    objc_enumerationMutation(v68);
                  objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * k), "identifier");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "removeObjectForKey:", v73);

                }
                v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
              }
              while (v70);
              v17 = v107;
            }
          }
          else
          {
            objc_msgSend(v61, "addObjectsFromArray:", v60);
            objc_msgSend(v60, "lastObject");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "identifier");
            v68 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "removeObjectForKey:", v68);
          }

        }
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v75 = v61;
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
        if (v76)
        {
          v77 = v76;
          v78 = *(_QWORD *)v113;
          do
          {
            for (m = 0; m != v77; ++m)
            {
              if (*(_QWORD *)v113 != v78)
                objc_enumerationMutation(v75);
              v80 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
              objc_msgSend(v80, "identifier");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v80, v81);

              objc_msgSend(v80, "identifier");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v82);

            }
            v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
          }
          while (v77);
        }

      }
      v111 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v121, v133, 16);
    }
    while (v111);
  }

  objc_msgSend(v7, "allValues");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "sortedArrayUsingComparator:", &__block_literal_global);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  return v84;
}

- (int)_registerForNotification:(const char *)a3 token:(int *)a4 queue:(id)a5 handler:(id)a6
{
  NSObject *v10;
  id v11;
  void *v12;
  uint32_t v13;
  NSObject *v14;
  _QWORD handler[5];
  id v17;
  const char *v18;
  uint8_t buf[4];
  _BCPowerSourceController *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (*a4)
  {
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR))
      -[_BCPowerSourceController _registerForNotification:token:queue:handler:].cold.2();
LABEL_4:
    v13 = 0;
    goto LABEL_14;
  }
  if (v10 && v11)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __73___BCPowerSourceController__registerForNotification_token_queue_handler___block_invoke;
    handler[3] = &unk_24CC1A2E8;
    handler[4] = self;
    v18 = a3;
    v17 = v11;
    v13 = notify_register_dispatch(a3, a4, v10, handler);

  }
  else
  {
    v13 = notify_register_check(a3, a4);
  }
  v14 = BCLogPowerSourceController;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2082;
    v22 = a3;
    _os_log_impl(&dword_2115B2000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Successfully registered for %{public}s notifications", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_ERROR))
    -[_BCPowerSourceController _registerForNotification:token:queue:handler:].cold.1();
LABEL_14:

  return v13;
}

- (int)_registerForPowerSourceChangeNotification:(const char *)a3 token:(int *)a4 queue:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82___BCPowerSourceController__registerForPowerSourceChangeNotification_token_queue___block_invoke;
  v6[3] = &unk_24CC1A310;
  v6[4] = self;
  return -[_BCPowerSourceController _registerForNotification:token:queue:handler:](self, "_registerForNotification:token:queue:handler:", a3, a4, a5, v6);
}

- (void)_beginPowerSourceObservingIfNecessary
{
  _BCPowerSourceController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _BCPowerSourceController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_queue)
  {
    v3 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v2;
      _os_log_impl(&dword_2115B2000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Registering for power source change notifications", buf, 0xCu);
    }
    v4 = dispatch_queue_create("com.apple.BCBatteryDeviceController", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    -[_BCPowerSourceController _registerForPowerSourceChangeNotification:token:queue:](v2, "_registerForPowerSourceChangeNotification:token:queue:", "com.apple.system.powersources.percent", &v2->_powerSourceBatteryChangeNotifyToken, v2->_queue);
    -[_BCPowerSourceController _registerForPowerSourceChangeNotification:token:queue:](v2, "_registerForPowerSourceChangeNotification:token:queue:", "com.apple.system.powersources.timeremaining", &v2->_powerSourceTimeRemainingNotifyToken, v2->_queue);
    -[_BCPowerSourceController _registerForPowerSourceChangeNotification:token:queue:](v2, "_registerForPowerSourceChangeNotification:token:queue:", "com.apple.system.accpowersources.source", &v2->_accPowerSourceNotifyToken, v2->_queue);
    -[_BCPowerSourceController _registerForPowerSourceChangeNotification:token:queue:](v2, "_registerForPowerSourceChangeNotification:token:queue:", "com.apple.system.accpowersources.timeremaining", &v2->_accPowerSourceTimeRemainingNotifyToken, v2->_queue);
    -[_BCPowerSourceController _registerForPowerSourceChangeNotification:token:queue:](v2, "_registerForPowerSourceChangeNotification:token:queue:", "com.apple.system.accpowersources.attach", &v2->_accAttachNotifyToken, v2->_queue);
    if (notify_is_valid_token(v2->_lowPowerModeNotifyToken))
      notify_cancel(v2->_lowPowerModeNotifyToken);
    v6 = v2->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65___BCPowerSourceController__beginPowerSourceObservingIfNecessary__block_invoke;
    v7[3] = &unk_24CC1A310;
    v7[4] = v2;
    if (!-[_BCPowerSourceController _registerForNotification:token:queue:handler:](v2, "_registerForNotification:token:queue:handler:", "com.apple.system.lowpowermode", &v2->_lowPowerModeNotifyToken, v6, v7))-[_BCPowerSourceController _handleLowPowerModeChanged:](v2, "_handleLowPowerModeChanged:", v2->_lowPowerModeNotifyToken);
  }
  objc_sync_exit(v2);

}

- (void)_endPowerSourceObserving
{
  _BCPowerSourceController *v2;
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  int v11;
  _BCPowerSourceController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_queue)
  {
    v3 = BCLogPowerSourceController;
    v4 = os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      v11 = 138543362;
      v12 = v2;
      _os_log_impl(&dword_2115B2000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Unregistering for power source change notifications", (uint8_t *)&v11, 0xCu);
    }
    v5 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v4, &v2->_powerSourceBatteryChangeNotifyToken);
    v6 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v5, &v2->_powerSourceTimeRemainingNotifyToken);
    v7 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v6, &v2->_accPowerSourceNotifyToken);
    v8 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v7, &v2->_accPowerSourceTimeRemainingNotifyToken);
    v9 = __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v8, &v2->_accAttachNotifyToken);
    __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(v9, &v2->_lowPowerModeNotifyToken);
    queue = v2->_queue;
    v2->_queue = 0;

  }
  objc_sync_exit(v2);

}

- (void)_queryConnectedDevices
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  _BCPowerSourceController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_2115B2000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) Query for connected devices", buf, 0xCu);
  }
  -[_BCPowerSourceController connectedDevices](self, "connectedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50___BCPowerSourceController__queryConnectedDevices__block_invoke;
  v6[3] = &unk_24CC1A250;
  v7 = v4;
  v5 = v4;
  -[_BCPowerSourceController _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);

}

- (void)_notifyObserver:(id)a3 block:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9 && a5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56___BCPowerSourceController__notifyObserver_block_queue___block_invoke;
    block[3] = &unk_24CC1A338;
    block[4] = self;
    v12 = v8;
    v13 = v10;
    dispatch_async((dispatch_queue_t)a5, block);

  }
}

- (void)_notifyObserversWithBlock:(id)a3
{
  id v4;
  _BCPowerSourceController *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)-[NSMapTable copy](v5->_observersToQueues, "copy");
    objc_sync_exit(v5);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v11, (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BCPowerSourceController _notifyObserver:block:queue:](v5, "_notifyObserver:block:queue:", v11, v4, v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_updateLowPowerModeState
{
  _BOOL4 v3;
  _BCPowerSourceController *v4;
  uint64_t state64;

  state64 = 0;
  if (!notify_get_state(self->_lowPowerModeNotifyToken, &state64))
  {
    v3 = state64 != 0;
    v4 = self;
    objc_sync_enter(v4);
    if (v4->_lowPowerModeActive != v3)
      v4->_lowPowerModeActive = v3;
    objc_sync_exit(v4);

  }
}

- (BOOL)_isLowPowerModeActive
{
  _BOOL4 lowPowerModeActive;

  lowPowerModeActive = self->_lowPowerModeActive;
  if (!self->_queue
    && !-[_BCPowerSourceController _registerForNotification:token:queue:handler:](self, "_registerForNotification:token:queue:handler:", "com.apple.system.lowpowermode", &self->_lowPowerModeNotifyToken, 0, 0))
  {
    -[_BCPowerSourceController _updateLowPowerModeState](self, "_updateLowPowerModeState");
    return self->_lowPowerModeActive;
  }
  return lowPowerModeActive;
}

- (void)_handleLowPowerModeChanged:(int)a3
{
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  _BCPowerSourceController *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[_BCPowerSourceController _isLowPowerModeActive](self, "_isLowPowerModeActive", *(_QWORD *)&a3);
  -[_BCPowerSourceController _updateLowPowerModeState](self, "_updateLowPowerModeState");
  v5 = -[_BCPowerSourceController _isLowPowerModeActive](self, "_isLowPowerModeActive");
  if (v4 != v5)
  {
    v6 = v5;
    v7 = BCLogPowerSourceController;
    if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = self;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_2115B2000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Low Power Mode changed: %d", (uint8_t *)&v8, 0x12u);
    }
    -[_BCPowerSourceController _queryConnectedDevices](self, "_queryConnectedDevices");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersToQueues, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)connectedDevices
{
  OUTLINED_FUNCTION_2(&dword_2115B2000, a2, a3, "(%{public}@) Failed to obtain power sources info", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_registerForNotification:token:queue:handler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2115B2000, v0, v1, "(%{public}@) Failed to register for %{public}s notifications");
  OUTLINED_FUNCTION_3();
}

- (void)_registerForNotification:token:queue:handler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2115B2000, v0, v1, "(%{public}@) Argument token not nil when registering for %{public}s notifications");
  OUTLINED_FUNCTION_3();
}

@end
