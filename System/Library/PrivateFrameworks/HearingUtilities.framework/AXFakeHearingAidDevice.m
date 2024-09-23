@implementation AXFakeHearingAidDevice

- (AXFakeHearingAidDevice)initWithDeviceType:(int)a3
{
  uint64_t v3;
  AXFakeHearingAidDevice *v4;
  AXFakeHearingAidDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v3 = *(_QWORD *)&a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AXFakeHearingAidDevice;
  v4 = -[AXHearingAidDevice initWithPeripheral:](&v16, sel_initWithPeripheral_, 0);
  v5 = v4;
  if (v4)
  {
    -[AXFakeHearingAidDevice setType:](v4, "setType:", v3);
    -[AXFakeHearingAidDevice setName:](v5, "setName:", CFSTR("Nathan's Hearing Aid"));
    -[AXFakeHearingAidDevice manufacturerForType](v5, "manufacturerForType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = &stru_1EA8EC4E0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFakeHearingAidDevice setManufacturer:](v5, "setManufacturer:", v7);

    -[AXFakeHearingAidDevice modelForType](v5, "modelForType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = &stru_1EA8EC4E0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFakeHearingAidDevice setModel:](v5, "setModel:", v9);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppleLeft-%d"), arc4random());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFakeHearingAidDevice setLeftUUID:](v5, "setLeftUUID:", v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppleRight-%d"), arc4random());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFakeHearingAidDevice setRightUUID:](v5, "setRightUUID:", v11);

    if (-[AXFakeHearingAidDevice leftAvailable](v5, "leftAvailable"))
    {
      -[AXFakeHearingAidDevice setLeftBatteryLevel:](v5, "setLeftBatteryLevel:", 1.0);
      -[AXHearingAidDevice setLeftMicrophoneVolume:](v5, "setLeftMicrophoneVolume:", 0.5);
      -[AXHearingAidDevice setLeftStreamVolume:](v5, "setLeftStreamVolume:", 0.5);
      -[AXFakeHearingAidDevice setLeftFirmwareVersion:](v5, "setLeftFirmwareVersion:", CFSTR("1.0"));
      -[AXFakeHearingAidDevice setLeftHardwareVersion:](v5, "setLeftHardwareVersion:", CFSTR("1.0"));
      -[AXFakeHearingAidDevice setLeftMicrophoneVolumeSteps:](v5, "setLeftMicrophoneVolumeSteps:", 3);
      -[AXHearingAidDevice setAvailableEars:](v5, "setAvailableEars:", -[AXHearingAidDevice availableEars](v5, "availableEars") | 2);
    }
    if (-[AXFakeHearingAidDevice rightAvailable](v5, "rightAvailable"))
    {
      -[AXFakeHearingAidDevice setRightBatteryLevel:](v5, "setRightBatteryLevel:", 0.850000024);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -60.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXFakeHearingAidDevice setRightBatteryLowDate:](v5, "setRightBatteryLowDate:", v12);

      -[AXHearingAidDevice setRightMicrophoneVolume:](v5, "setRightMicrophoneVolume:", 0.5);
      -[AXHearingAidDevice setRightStreamVolume:](v5, "setRightStreamVolume:", 0.5);
      -[AXFakeHearingAidDevice setRightFirmwareVersion:](v5, "setRightFirmwareVersion:", CFSTR("1.0"));
      -[AXFakeHearingAidDevice setRightHardwareVersion:](v5, "setRightHardwareVersion:", CFSTR("1.0"));
      -[AXHearingAidDevice setAvailableEars:](v5, "setAvailableEars:", -[AXHearingAidDevice availableEars](v5, "availableEars") | 4);
    }
    -[AXFakeHearingAidDevice createPrograms](v5, "createPrograms");
    -[AXHearingAidDevice programs](v5, "programs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice selectProgram:forEar:](v5, "selectProgram:forEar:", v14, 6);

    -[AXFakeHearingAidDevice connect](v5, "connect");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AXFakeHearingAidDevice setName:](self, "setName:", 0);
  -[AXFakeHearingAidDevice setManufacturer:](self, "setManufacturer:", 0);
  -[AXFakeHearingAidDevice setModel:](self, "setModel:", 0);
  -[AXFakeHearingAidDevice setLeftUUID:](self, "setLeftUUID:", 0);
  -[AXFakeHearingAidDevice setRightUUID:](self, "setRightUUID:", 0);
  -[AXFakeHearingAidDevice setLeftFirmwareVersion:](self, "setLeftFirmwareVersion:", 0);
  -[AXFakeHearingAidDevice setRightFirmwareVersion:](self, "setRightFirmwareVersion:", 0);
  -[AXFakeHearingAidDevice setLeftHardwareVersion:](self, "setLeftHardwareVersion:", 0);
  -[AXFakeHearingAidDevice setRightHardwareVersion:](self, "setRightHardwareVersion:", 0);
  -[AXFakeHearingAidDevice setLeftBatteryLowDate:](self, "setLeftBatteryLowDate:", 0);
  -[AXFakeHearingAidDevice setRightBatteryLowDate:](self, "setRightBatteryLowDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXFakeHearingAidDevice;
  -[AXHearingAidDevice dealloc](&v3, sel_dealloc);
}

- (id)manufacturerForType
{
  if (-[AXFakeHearingAidDevice type](self, "type") == 64)
    return CFSTR("Carbondale");
  else
    return CFSTR("That Fruit Company");
}

- (id)modelForType
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = -[AXFakeHearingAidDevice type](self, "type");
  v3 = CFSTR("DEMO");
  v4 = CFSTR("T0B1AS");
  v5 = CFSTR("P0E");
  v6 = CFSTR("IL5440");
  if (v2 != 64)
    v6 = CFSTR("DEMO");
  if (v2 != 32)
    v5 = v6;
  if (v2 != 16)
    v4 = v5;
  if (v2 == 8)
    v3 = CFSTR("B0TH");
  if (v2 == 4)
    v3 = CFSTR("R1G4T");
  if (v2 == 2)
    v3 = CFSTR("L3FT");
  if (v2 <= 15)
    return (id)v3;
  else
    return (id)v4;
}

- (void)connect
{
  -[AXFakeHearingAidDevice setConnected:](self, "setConnected:", 1);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __33__AXFakeHearingAidDevice_connect__block_invoke(uint64_t a1)
{
  id v2;

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:didUpdateProperty:", *(_QWORD *)(a1 + 32), 0xD07D42105FCLL);

}

- (void)disconnect
{
  -[AXFakeHearingAidDevice setConnected:](self, "setConnected:", 0);
}

- (BOOL)leftAvailable
{
  _BOOL4 v3;

  if ((-[AXFakeHearingAidDevice type](self, "type") & 0x40) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 2) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 8) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 0x10) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (-[AXFakeHearingAidDevice type](self, "type") >> 5) & 1;
  }
  return v3;
}

- (BOOL)rightAvailable
{
  _BOOL4 v3;

  if ((-[AXFakeHearingAidDevice type](self, "type") & 0x40) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 4) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 8) != 0
    || (-[AXFakeHearingAidDevice type](self, "type") & 0x10) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return (-[AXFakeHearingAidDevice type](self, "type") >> 5) & 1;
  }
  return v3;
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)createPrograms
{
  NSMutableArray *v3;
  NSMutableArray *leftFakePrograms;
  AXHearingAidMode *v5;
  AXHearingAidMode *v6;
  AXHearingAidMode *v7;
  AXHearingAidMode *v8;
  AXHearingAidMode *v9;
  AXHearingAidMode *v10;
  AXHearingAidMode *v11;
  AXHearingAidMode *v12;
  AXHearingAidMode *v13;
  NSMutableArray *v14;
  NSMutableArray *rightFakePrograms;
  AXHearingAidMode *v16;
  AXHearingAidMode *v17;
  AXHearingAidMode *v18;
  AXHearingAidMode *v19;
  AXHearingAidMode *v20;
  AXHearingAidMode *v21;
  AXHearingAidMode *v22;
  AXHearingAidMode *v23;
  NSMutableArray *v24;
  uint64_t v25;
  NSMutableArray *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  if (!self->_leftFakePrograms)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    leftFakePrograms = self->_leftFakePrograms;
    self->_leftFakePrograms = v3;

    if (-[AXFakeHearingAidDevice leftAvailable](self, "leftAvailable"))
    {
      v5 = objc_alloc_init(AXHearingAidMode);
      -[AXHearingAidMode setName:](v5, "setName:", CFSTR("Default"));
      -[AXHearingAidMode setCategory:](v5, "setCategory:", 1);
      -[AXHearingAidMode setIndex:](v5, "setIndex:", 1);
      -[AXHearingAidMode setEar:](v5, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v5);
      v6 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v6, "setName:", CFSTR("Theater"));
      -[AXHearingAidMode setCategory:](v6, "setCategory:", 3);
      -[AXHearingAidMode setIndex:](v6, "setIndex:", 4);
      -[AXHearingAidMode setEar:](v6, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v6);
      v7 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v7, "setName:", CFSTR("Car"));
      -[AXHearingAidMode setCategory:](v7, "setCategory:", 4);
      -[AXHearingAidMode setIndex:](v7, "setIndex:", 7);
      -[AXHearingAidMode setEar:](v7, "setEar:", 2);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v7);
      v8 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v8, "setName:", CFSTR("Restaurant"));
      -[AXHearingAidMode setCategory:](v8, "setCategory:", 3);
      -[AXHearingAidMode setIndex:](v8, "setIndex:", 12);
      -[AXHearingAidMode setEar:](v8, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v8);
      v9 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v9, "setName:", CFSTR("Television streamer"));
      -[AXHearingAidMode setCategory:](v9, "setCategory:", 200);
      -[AXHearingAidMode setIndex:](v9, "setIndex:", 14);
      -[AXHearingAidMode setEar:](v9, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v9);
      v10 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v10, "setName:", CFSTR("Mixing streamer"));
      -[AXHearingAidMode setCategory:](v10, "setCategory:", 100);
      -[AXHearingAidMode setIndex:](v10, "setIndex:", 15);
      -[AXHearingAidMode setEar:](v10, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v10);
      v11 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v11, "setName:", CFSTR("Mixing streamer 2"));
      -[AXHearingAidMode setCategory:](v11, "setCategory:", 100);
      -[AXHearingAidMode setIndex:](v11, "setIndex:", 16);
      -[AXHearingAidMode setEar:](v11, "setEar:", 6);
      -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v11);
      if (-[AXFakeHearingAidDevice type](self, "type") != 64)
      {
        v12 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v12, "setName:", CFSTR("Park"));
        -[AXHearingAidMode setCategory:](v12, "setCategory:", 4);
        -[AXHearingAidMode setIndex:](v12, "setIndex:", 8);
        -[AXHearingAidMode setEar:](v12, "setEar:", 2);
        -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v12);
        v13 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v13, "setName:", CFSTR("Bowling"));
        -[AXHearingAidMode setCategory:](v13, "setCategory:", 4);
        -[AXHearingAidMode setIndex:](v13, "setIndex:", 9);
        -[AXHearingAidMode setEar:](v13, "setEar:", 6);
        -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v13);
        v11 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v11, "setName:", CFSTR("Skydiving"));
        -[AXHearingAidMode setCategory:](v11, "setCategory:", 4);
        -[AXHearingAidMode setIndex:](v11, "setIndex:", 10);
        -[AXHearingAidMode setEar:](v11, "setEar:", 6);
        -[NSMutableArray addObject:](self->_leftFakePrograms, "addObject:", v11);
      }

    }
  }
  if (!self->_rightFakePrograms)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rightFakePrograms = self->_rightFakePrograms;
    self->_rightFakePrograms = v14;

    if (-[AXFakeHearingAidDevice rightAvailable](self, "rightAvailable"))
    {
      v16 = objc_alloc_init(AXHearingAidMode);
      -[AXHearingAidMode setName:](v16, "setName:", CFSTR("Default"));
      -[AXHearingAidMode setCategory:](v16, "setCategory:", 1);
      -[AXHearingAidMode setIndex:](v16, "setIndex:", 1);
      -[AXHearingAidMode setEar:](v16, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v16);
      v17 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v17, "setName:", CFSTR("Theater"));
      -[AXHearingAidMode setCategory:](v17, "setCategory:", 3);
      -[AXHearingAidMode setIndex:](v17, "setIndex:", 4);
      -[AXHearingAidMode setEar:](v17, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v17);
      v18 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v18, "setName:", CFSTR("Restaurant"));
      -[AXHearingAidMode setCategory:](v18, "setCategory:", 3);
      -[AXHearingAidMode setIndex:](v18, "setIndex:", 12);
      -[AXHearingAidMode setEar:](v18, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v18);
      v19 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v19, "setName:", CFSTR("Television streamer"));
      -[AXHearingAidMode setCategory:](v19, "setCategory:", 201);
      -[AXHearingAidMode setIndex:](v19, "setIndex:", 14);
      -[AXHearingAidMode setEar:](v19, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v19);
      v20 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v20, "setName:", CFSTR("Mixing streamer"));
      -[AXHearingAidMode setCategory:](v20, "setCategory:", 100);
      -[AXHearingAidMode setIndex:](v20, "setIndex:", 15);
      -[AXHearingAidMode setEar:](v20, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v20);
      v21 = objc_alloc_init(AXHearingAidMode);

      -[AXHearingAidMode setName:](v21, "setName:", CFSTR("Mixing streamer 2"));
      -[AXHearingAidMode setCategory:](v21, "setCategory:", 100);
      -[AXHearingAidMode setIndex:](v21, "setIndex:", 16);
      -[AXHearingAidMode setEar:](v21, "setEar:", 6);
      -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v21);
      if (-[AXFakeHearingAidDevice type](self, "type") != 64)
      {
        v22 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v22, "setName:", CFSTR("Parking lot"));
        -[AXHearingAidMode setCategory:](v22, "setCategory:", 3);
        -[AXHearingAidMode setIndex:](v22, "setIndex:", 25);
        -[AXHearingAidMode setEar:](v22, "setEar:", 6);
        -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v22);
        v23 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v23, "setName:", CFSTR("Baseball game"));
        -[AXHearingAidMode setCategory:](v23, "setCategory:", 3);
        -[AXHearingAidMode setIndex:](v23, "setIndex:", 26);
        -[AXHearingAidMode setEar:](v23, "setEar:", 4);
        -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v23);
        v21 = objc_alloc_init(AXHearingAidMode);

        -[AXHearingAidMode setName:](v21, "setName:", CFSTR("Space Station Ring Toss Jacuzzi"));
        -[AXHearingAidMode setCategory:](v21, "setCategory:", 200);
        -[AXHearingAidMode setIndex:](v21, "setIndex:", 27);
        -[AXHearingAidMode setEar:](v21, "setEar:", 4);
        -[NSMutableArray addObject:](self->_rightFakePrograms, "addObject:", v21);
      }

    }
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v24 = self->_leftFakePrograms;
  v25 = MEMORY[0x1E0C809B0];
  v36 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __40__AXFakeHearingAidDevice_createPrograms__block_invoke;
  v32[3] = &unk_1EA8EB2A8;
  v32[4] = &v33;
  -[NSMutableArray enumerateObjectsUsingBlock:](v24, "enumerateObjectsUsingBlock:", v32);
  -[AXHearingAidDevice setLeftPresetBitmask:](self, "setLeftPresetBitmask:", *((unsigned int *)v34 + 6));
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26 = self->_rightFakePrograms;
  v27[0] = v25;
  v27[1] = 3221225472;
  v27[2] = __40__AXFakeHearingAidDevice_createPrograms__block_invoke_2;
  v27[3] = &unk_1EA8EB2A8;
  v27[4] = &v28;
  -[NSMutableArray enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", v27);
  -[AXHearingAidDevice setRightPresetBitmask:](self, "setRightPresetBitmask:", *((unsigned int *)v29 + 6));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);
}

uint64_t __40__AXFakeHearingAidDevice_createPrograms__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "index");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 1 << result;
  return result;
}

uint64_t __40__AXFakeHearingAidDevice_createPrograms__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "index");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += 1 << result;
  return result;
}

- (id)leftPrograms
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_leftFakePrograms);
}

- (id)rightPrograms
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_rightFakePrograms);
}

- (unint64_t)availablePropertiesForPeripheral:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 2;
  +[AXHearingAidDevice characteristicsUUIDs](AXHearingAidDevice, "characteristicsUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__AXFakeHearingAidDevice_availablePropertiesForPeripheral___block_invoke;
  v9[3] = &unk_1EA8EB2D0;
  v9[4] = &v10;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = -[AXFakeHearingAidDevice excludedProperties](self, "excludedProperties");
  v7 = v11[3] & ~v6;
  v11[3] = v7;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __59__AXFakeHearingAidDevice_availablePropertiesForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedLongLongValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)deviceSupportsProperty:(unint64_t)a3
{
  return (a3 & ~-[AXFakeHearingAidDevice availablePropertiesForPeripheral:](self, "availablePropertiesForPeripheral:", 0)) == 0;
}

- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4
{
  return (a3 & ~-[AXFakeHearingAidDevice availablePropertiesForPeripheral:](self, "availablePropertiesForPeripheral:", 0, *(_QWORD *)&a4)) == 0;
}

- (BOOL)supportsCombinedVolumesForProperty:(unint64_t)a3
{
  _BOOL4 v5;
  BOOL result;
  int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;

  v5 = -[AXFakeHearingAidDevice leftAvailable](self, "leftAvailable");
  if (v5 != -[AXFakeHearingAidDevice rightAvailable](self, "rightAvailable"))
    return 1;
  result = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      v15 = -[AXHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps");
      if (v15 == -[AXHearingAidDevice rightSensitivitySteps](self, "rightSensitivitySteps"))
      {
        -[AXHearingAidDevice leftSensitivity](self, "leftSensitivity");
        v9 = v16;
        -[AXHearingAidDevice rightSensitivity](self, "rightSensitivity");
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
    else
    {
      if (a3 != 0x4000000000)
        return result;
      v11 = -[AXHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps");
      if (v11 == -[AXHearingAidDevice rightMixedVolumeSteps](self, "rightMixedVolumeSteps"))
      {
        -[AXHearingAidDevice leftMixedVolume](self, "leftMixedVolume");
        v9 = v12;
        -[AXHearingAidDevice rightMixedVolume](self, "rightMixedVolume");
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
  }
  else if (a3 == 64)
  {
    v13 = -[AXFakeHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps");
    if (v13 == -[AXFakeHearingAidDevice rightMicrophoneVolumeSteps](self, "rightMicrophoneVolumeSteps"))
    {
      -[AXHearingAidDevice leftMicrophoneVolume](self, "leftMicrophoneVolume");
      v9 = v14;
      -[AXHearingAidDevice rightMicrophoneVolume](self, "rightMicrophoneVolume");
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  else
  {
    if (a3 != 128)
      return result;
    v7 = -[AXHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps");
    if (v7 == -[AXHearingAidDevice rightStreamVolumeSteps](self, "rightStreamVolumeSteps"))
    {
      -[AXHearingAidDevice leftStreamVolume](self, "leftStreamVolume");
      v9 = v8;
      -[AXHearingAidDevice rightStreamVolume](self, "rightStreamVolume");
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  return 0;
}

- (BOOL)showCombinedPrograms
{
  void *v3;
  BOOL v4;

  if (!-[AXHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"))
    return 0;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (!objc_msgSend(v3, "independentHearingAidSettings")
     || -[AXHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"))
    && -[AXFakeHearingAidDevice programsListsAreEqual](self, "programsListsAreEqual");

  return v4;
}

- (BOOL)programsListsAreEqual
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[AXFakeHearingAidDevice leftPrograms](self, "leftPrograms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[AXFakeHearingAidDevice rightPrograms](self, "rightPrograms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 == objc_msgSend(v5, "count");

  v18 = v4;
  if (!*((_BYTE *)v16 + 24))
    goto LABEL_5;
  -[AXFakeHearingAidDevice leftPrograms](self, "leftPrograms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__AXFakeHearingAidDevice_programsListsAreEqual__block_invoke;
  v14[3] = &unk_1EA8EA730;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);

  if (*((_BYTE *)v16 + 24))
  {
    -[AXHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[AXHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);
      *((_BYTE *)v16 + 24) = v11;

    }
    else
    {
      *((_BYTE *)v16 + 24) = 0;
    }

    v12 = *((_BYTE *)v16 + 24) != 0;
  }
  else
  {
LABEL_5:
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __47__AXFakeHearingAidDevice_programsListsAreEqual__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  void *v8;
  void *v9;
  int v10;

  v7 = objc_msgSend(a2, "index");
  objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "index");

  if (v7 != v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void (**writeBlock)(id, unint64_t, void *, _QWORD);
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v9 = (void *)MEMORY[0x1E0CB3940];
  hearingPropertyDescription(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("WRITING %d for %@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXFakeHearingAidDevice writeInt:toEar:forProperty:]", 525, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    v19 = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  writeBlock = (void (**)(id, unint64_t, void *, _QWORD))self->_writeBlock;
  if (writeBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    writeBlock[2](writeBlock, a5, v17, v6);

  }
}

- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  void (**writeBlock)(id, unint64_t, id, _QWORD);
  uint64_t v7;
  id v8;

  writeBlock = (void (**)(id, unint64_t, id, _QWORD))self->_writeBlock;
  if (writeBlock)
  {
    v7 = *(_QWORD *)&a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    writeBlock[2](writeBlock, a5, v8, v7);

  }
}

- (id)persistentRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v8.receiver = self;
  v8.super_class = (Class)AXFakeHearingAidDevice;
  -[AXHearingAidDevice persistentRepresentation](&v8, sel_persistentRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AXFakeHearingAidDevice type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ax_hearing_device_fake_type_key"));

  return v5;
}

- (id)valueForProperty:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AXFakeHearingAidDevice;
  -[AXHearingAidDevice valueForProperty:](&v12, sel_valueForProperty_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 512)
  {
    v13[0] = &unk_1EA8FFED8;
    v13[1] = &unk_1EA8FFEF0;
    v14[0] = &unk_1EA9006B8;
    v14[1] = &unk_1EA9006D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:

    v5 = (void *)v10;
    return v5;
  }
  if (a3 == 0x200000)
  {
    if (-[AXFakeHearingAidDevice isConnected](self, "isConnected"))
      v6 = 2;
    else
      v6 = 0;
    v7 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
    goto LABEL_8;
  }
  return v5;
}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXFakeHearingAidDevice;
  -[AXHearingAidDevice setValue:forProperty:](&v7, sel_setValue_forProperty_, a3);
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device:didUpdateProperty:", self, a4);

}

- (BOOL)didLoadBasicProperties
{
  return 1;
}

- (BOOL)didLoadRequiredProperties
{
  return 1;
}

- (void)persist
{
  void *v3;
  id v4;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXFakeHearingAidDevice persistentRepresentation](self, "persistentRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPairedHearingAids:", v3);

}

- (void)registerWriteBlock:(id)a3
{
  void *v4;
  id writeBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  writeBlock = self->_writeBlock;
  self->_writeBlock = v4;

}

- (BOOL)isFakeDevice
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_manufacturer, a3);
}

- (NSArray)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSString)leftUUID
{
  return self->_leftUUID;
}

- (void)setLeftUUID:(id)a3
{
  objc_storeStrong((id *)&self->_leftUUID, a3);
}

- (NSString)rightUUID
{
  return self->_rightUUID;
}

- (void)setRightUUID:(id)a3
{
  objc_storeStrong((id *)&self->_rightUUID, a3);
}

- (double)rightBatteryLevel
{
  return self->_rightBatteryLevel;
}

- (void)setRightBatteryLevel:(double)a3
{
  self->_rightBatteryLevel = a3;
}

- (double)leftBatteryLevel
{
  return self->_leftBatteryLevel;
}

- (void)setLeftBatteryLevel:(double)a3
{
  self->_leftBatteryLevel = a3;
}

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->_isConnecting = a3;
}

- (NSString)leftFirmwareVersion
{
  return self->_leftFirmwareVersion;
}

- (void)setLeftFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_leftFirmwareVersion, a3);
}

- (NSString)rightFirmwareVersion
{
  return self->_rightFirmwareVersion;
}

- (void)setRightFirmwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_rightFirmwareVersion, a3);
}

- (NSString)leftHardwareVersion
{
  return self->_leftHardwareVersion;
}

- (void)setLeftHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_leftHardwareVersion, a3);
}

- (NSString)rightHardwareVersion
{
  return self->_rightHardwareVersion;
}

- (void)setRightHardwareVersion:(id)a3
{
  objc_storeStrong((id *)&self->_rightHardwareVersion, a3);
}

- (NSDate)leftBatteryLowDate
{
  return self->_leftBatteryLowDate;
}

- (void)setLeftBatteryLowDate:(id)a3
{
  objc_storeStrong((id *)&self->_leftBatteryLowDate, a3);
}

- (NSDate)rightBatteryLowDate
{
  return self->_rightBatteryLowDate;
}

- (void)setRightBatteryLowDate:(id)a3
{
  objc_storeStrong((id *)&self->_rightBatteryLowDate, a3);
}

- (signed)leftMicrophoneVolumeSteps
{
  return self->_leftMicrophoneVolumeSteps;
}

- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_leftMicrophoneVolumeSteps = a3;
}

- (signed)rightMicrophoneVolumeSteps
{
  return self->_rightMicrophoneVolumeSteps;
}

- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_rightMicrophoneVolumeSteps = a3;
}

- (CBPeripheral)leftPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 648, 1);
}

- (void)setLeftPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (CBPeripheral)rightPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 656, 1);
}

- (void)setRightPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unint64_t)excludedProperties
{
  return self->_excludedProperties;
}

- (void)setExcludedProperties:(unint64_t)a3
{
  self->_excludedProperties = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rightPeripheral, 0);
  objc_storeStrong((id *)&self->leftPeripheral, 0);
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->_leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->_rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_rightUUID, 0);
  objc_storeStrong((id *)&self->_leftUUID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_writeBlock, 0);
  objc_storeStrong((id *)&self->_rightFakePrograms, 0);
  objc_storeStrong((id *)&self->_leftFakePrograms, 0);
}

@end
