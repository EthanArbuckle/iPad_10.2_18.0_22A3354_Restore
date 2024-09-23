@implementation AXRemoteHearingAidDevice

- (AXRemoteHearingAidDevice)init
{
  AXRemoteHearingAidDevice *v2;
  AXRemoteHearingAidDevice *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXRemoteHearingAidDevice;
  v2 = -[AXRemoteHearingAidDevice init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C9AA60];
    -[AXRemoteHearingAidDevice setLeftPrograms:](v2, "setLeftPrograms:", MEMORY[0x1E0C9AA60]);
    -[AXRemoteHearingAidDevice setRightPrograms:](v3, "setRightPrograms:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &stru_1EA8EC4E0, &stru_1EA8EC4E0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setManufacturer:](v3, "setManufacturer:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &stru_1EA8EC4E0, &stru_1EA8EC4E0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setModel:](v3, "setModel:", v6);

    -[AXRemoteHearingAidDevice setSupportsCombinedPresets:](v3, "setSupportsCombinedPresets:", 1);
    -[AXRemoteHearingAidDevice setSupportsCombinedVolumes:](v3, "setSupportsCombinedVolumes:", 1);
    -[AXRemoteHearingAidDevice setSupportsBinauralStreaming:](v3, "setSupportsBinauralStreaming:", 1);
    +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setUpdateDelegate:](v3, "setUpdateDelegate:", v7);

    -[AXRemoteHearingAidDevice setRequiredProperties:](v3, "setRequiredProperties:", 0xD07D42105FCLL);
  }
  return v3;
}

- (AXRemoteHearingAidDevice)initWithRemoteRepresentation:(id)a3 andDeviceID:(id)a4
{
  id v6;
  id v7;
  AXRemoteHearingAidDevice *v8;
  AXRemoteHearingAidDevice *v9;
  _QWORD v11[4];
  AXRemoteHearingAidDevice *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[AXRemoteHearingAidDevice init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[AXRemoteHearingAidDevice setDeviceUUID:](v8, "setDeviceUUID:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__AXRemoteHearingAidDevice_initWithRemoteRepresentation_andDeviceID___block_invoke;
    v11[3] = &unk_1EA8E8708;
    v12 = v9;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  return v9;
}

void __69__AXRemoteHearingAidDevice_initWithRemoteRepresentation_andDeviceID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));

}

- (AXRemoteHearingAidDevice)initWithPersistentRepresentation:(id)a3
{
  id v4;
  AXRemoteHearingAidDevice *v5;
  AXRemoteHearingAidDevice *v6;
  AXRemoteHearingAidDevice *v7;
  _QWORD v9[4];
  AXRemoteHearingAidDevice *v10;

  v4 = a3;
  v5 = -[AXRemoteHearingAidDevice init](self, "init");
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__AXRemoteHearingAidDevice_initWithPersistentRepresentation___block_invoke;
    v9[3] = &unk_1EA8E8708;
    v7 = v5;
    v10 = v7;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[AXRemoteHearingAidDevice setIsPaired:](v7, "setIsPaired:", 1);

  }
  return v6;
}

void __61__AXRemoteHearingAidDevice_initWithPersistentRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  v5 = a3;
  if (objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_man_key")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "manufacturer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = v6;
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, v5);
LABEL_18:

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "manufacturer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v7 = v8;
      objc_msgSend(v8, "setArray:", v5);
      goto LABEL_18;
    }
  }
  else
  {
    if (!objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_model_key")))
    {
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_man_model_key")))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
        v9 = *(void **)(a1 + 32);
        objc_msgSend(&unk_1EA8FFCF8, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forProperty:", v11, 0x80000);

        v12 = *(void **)(a1 + 32);
        objc_msgSend(&unk_1EA8FFD10, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forProperty:", v14, 0x100000);
      }
      else
      {
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_name_key")))
        {
          objc_msgSend(*(id *)(a1 + 32), "setName:", v5);
          goto LABEL_19;
        }
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_lr_key")))
        {
          v15 = objc_msgSend(v5, "intValue");
          if (v15 <= 6 && ((1 << v15) & 0x54) != 0)
            objc_msgSend(*(id *)(a1 + 32), "setAvailableEars:", v15);
          goto LABEL_19;
        }
        if ((objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_left_peripheral_key")) & 1) == 0
          && !objc_msgSend(v28, "isEqualToString:", CFSTR("ax_hearing_device_right_peripheral_key")))
        {
          goto LABEL_19;
        }
        objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_isleft_key"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiid_key"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_hiidother_key"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_uuid_key"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_device_lea_version_key"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        if (objc_msgSend(v18, "length") && (objc_msgSend(v13, "length") || objc_msgSend(v14, "length")))
        {
          v21 = objc_msgSend(v18, "hasPrefix:", *MEMORY[0x1E0D2F908]);
          if (v17)
          {
            if ((v21 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 32), "setLeftPeripheralUUID:", v18);
            objc_msgSend(*(id *)(a1 + 32), "setLeftUUID:", v13);
            objc_msgSend(*(id *)(a1 + 32), "setRightUUID:", v14);
            objc_msgSend(*(id *)(a1 + 32), "setLeftLeaVersion:", v20);
          }
          else
          {
            if ((v21 & 1) == 0)
              objc_msgSend(*(id *)(a1 + 32), "setRightPeripheralUUID:", v18);
            objc_msgSend(*(id *)(a1 + 32), "setLeftUUID:", v14);
            objc_msgSend(*(id *)(a1 + 32), "setRightUUID:", v13);
            objc_msgSend(*(id *)(a1 + 32), "setRightLeaVersion:", v20);
          }
          objc_msgSend(*(id *)(a1 + 32), "leftUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "rightUUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {

            if (v24)
            {
              v25 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(a1 + 32), "leftUUID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "rightUUID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "stringWithFormat:", CFSTR("%@_%@"), v26, v27);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "leftUUID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          objc_msgSend(*(id *)(a1 + 32), "setDeviceUUID:", v24);

        }
      }

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
LABEL_19:

}

- (void)dealloc
{
  objc_super v3;

  -[AXRemoteHearingAidDevice setManufacturer:](self, "setManufacturer:", 0);
  -[AXRemoteHearingAidDevice setModel:](self, "setModel:", 0);
  -[AXRemoteHearingAidDevice setLeftFirmwareVersion:](self, "setLeftFirmwareVersion:", 0);
  -[AXRemoteHearingAidDevice setRightFirmwareVersion:](self, "setRightFirmwareVersion:", 0);
  -[AXRemoteHearingAidDevice setLeftHardwareVersion:](self, "setLeftHardwareVersion:", 0);
  -[AXRemoteHearingAidDevice setRightHardwareVersion:](self, "setRightHardwareVersion:", 0);
  -[AXRemoteHearingAidDevice setRightPrograms:](self, "setRightPrograms:", 0);
  -[AXRemoteHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", 0);
  -[AXRemoteHearingAidDevice setLeftPeripheralUUID:](self, "setLeftPeripheralUUID:", 0);
  -[AXRemoteHearingAidDevice setRightPeripheralUUID:](self, "setRightPeripheralUUID:", 0);
  -[AXRemoteHearingAidDevice setLeftSelectedProgram:](self, "setLeftSelectedProgram:", 0);
  -[AXRemoteHearingAidDevice setRightSelectedProgram:](self, "setRightSelectedProgram:", 0);
  -[AXRemoteHearingAidDevice setLeftUUID:](self, "setLeftUUID:", 0);
  -[AXRemoteHearingAidDevice setRightUUID:](self, "setRightUUID:", 0);
  -[AXRemoteHearingAidDevice setLeftSelectedStreamingProgram:](self, "setLeftSelectedStreamingProgram:", 0);
  -[AXRemoteHearingAidDevice setRightSelectedStreamingProgram:](self, "setRightSelectedStreamingProgram:", 0);
  -[AXRemoteHearingAidDevice setLeftBatteryLowDate:](self, "setLeftBatteryLowDate:", 0);
  -[AXRemoteHearingAidDevice setRightBatteryLowDate:](self, "setRightBatteryLowDate:", 0);
  -[AXRemoteHearingAidDevice setDeviceUUID:](self, "setDeviceUUID:", 0);
  -[AXRemoteHearingAidDevice setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXRemoteHearingAidDevice;
  -[AXRemoteHearingAidDevice dealloc](&v3, sel_dealloc);
}

- (void)connect
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting connect: %@"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice connect]", 283, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeValue:forProperty:andDeviceID:", &unk_1EA8FFD28, 0x200000, v9);

}

- (void)disconnectAndUnpair:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting disconnect: %@"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice disconnectAndUnpair:]", 289, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeValue:forProperty:andDeviceID:", &unk_1EA8FFD40, 0x200000, v10);

}

- (BOOL)leftAvailable
{
  return (-[AXRemoteHearingAidDevice availableEars](self, "availableEars") >> 1) & 1;
}

- (BOOL)rightAvailable
{
  return (-[AXRemoteHearingAidDevice availableEars](self, "availableEars") >> 2) & 1;
}

- (BOOL)isConnected
{
  _BOOL4 v3;
  BOOL v5;

  v3 = -[AXRemoteHearingAidDevice leftAvailable](self, "leftAvailable");
  if (v3 != -[AXRemoteHearingAidDevice leftConnected](self, "leftConnected"))
    return 0;
  v5 = -[AXRemoteHearingAidDevice rightAvailable](self, "rightAvailable");
  return v5 ^ -[AXRemoteHearingAidDevice rightConnected](self, "rightConnected") ^ 1;
}

- (BOOL)hasConnection
{
  return -[AXRemoteHearingAidDevice leftConnected](self, "leftConnected")
      || -[AXRemoteHearingAidDevice rightConnected](self, "rightConnected");
}

- (BOOL)isLeftConnected
{
  _BOOL4 v3;
  void *v4;

  if (-[AXRemoteHearingAidDevice leftAvailable](self, "leftAvailable"))
  {
    if (-[AXRemoteHearingAidDevice leftConnected](self, "leftConnected"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hearingAidReachable"))
        v3 = !-[AXRemoteHearingAidDevice rightConnected](self, "rightConnected");
      else
        LOBYTE(v3) = 0;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isRightConnected
{
  _BOOL4 v3;
  void *v4;

  if (-[AXRemoteHearingAidDevice rightAvailable](self, "rightAvailable"))
  {
    if (-[AXRemoteHearingAidDevice rightConnected](self, "rightConnected"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hearingAidReachable"))
        v3 = !-[AXRemoteHearingAidDevice leftConnected](self, "leftConnected");
      else
        LOBYTE(v3) = 0;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)containsPeripheralWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", v4);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)didLoadProperty:(unint64_t)a3
{
  return (a3 & ~-[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties")) == 0;
}

- (BOOL)didLoadBasicProperties
{
  return 1;
}

- (BOOL)didLoadRequiredPeerProperties
{
  return -[AXRemoteHearingAidDevice checkDidLoadProperties:](self, "checkDidLoadProperties:", -[AXRemoteHearingAidDevice requiredProperties](self, "requiredProperties") & 0xFFFFFFFFFBDFFFFFLL);
}

- (BOOL)didLoadRequiredProperties
{
  return -[AXRemoteHearingAidDevice checkDidLoadProperties:](self, "checkDidLoadProperties:", -[AXRemoteHearingAidDevice requiredProperties](self, "requiredProperties"));
}

- (BOOL)checkDidLoadProperties:(unint64_t)a3
{
  BOOL v4;
  void *v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[AXRemoteHearingAidDevice didLoadProperty:](self, "didLoadProperty:", a3);
  if (!v4 && objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AXRemoteHearingAidDevice requiredProperties](self, "requiredProperties");
    for (i = 0; i != 64; ++i)
    {
      if (((1 << i) & v6) != 0 && !-[AXRemoteHearingAidDevice didLoadProperty:](self, "didLoadProperty:", 1 << i))
      {
        hearingPropertyDescription(1 << i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

      }
    }
    HAInitializeLogging();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" and "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Haven't loaded %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice checkDidLoadProperties:]", 375, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  return v4;
}

- (void)loadRequiredProperties
{
  unint64_t v3;
  void *v4;
  id v5;

  -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AXRemoteHearingAidDevice requiredProperties](self, "requiredProperties") | 0xFF800105C4;
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProperty:forDeviceID:", v3, v4);

}

- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4
{
  unint64_t v6;

  switch(a4)
  {
    case 6:
      if ((a3 & ~-[AXRemoteHearingAidDevice leftAvailableProperties](self, "leftAvailableProperties")) == 0)
        return 1;
      goto LABEL_7;
    case 4:
LABEL_7:
      v6 = -[AXRemoteHearingAidDevice rightAvailableProperties](self, "rightAvailableProperties");
      return (a3 & ~v6) == 0;
    case 2:
      v6 = -[AXRemoteHearingAidDevice leftAvailableProperties](self, "leftAvailableProperties");
      return (a3 & ~v6) == 0;
  }
  return 0;
}

- (void)_delayWriteProperties
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  dispatch_time_t v39;
  NSObject *v40;
  _QWORD block[5];

  self->_delayWritePending = 1;
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x40) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftMicrophoneVolume);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightMicrophoneVolume);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "writeValue:forProperty:andDeviceID:", v7, 64, v8);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFFFFFFFFFBFLL);
  }
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x80) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftStreamVolume);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightStreamVolume);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeValue:forProperty:andDeviceID:", v13, 128, v14);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFFFFFFFFF7FLL);
  }
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x80000000) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftSensitivity);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightSensitivity);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithObjects:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "writeValue:forProperty:andDeviceID:", v19, 0x80000000, v20);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFFF7FFFFFFFLL);
  }
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x2000000000) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftTreble);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightTreble);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithObjects:", v23, v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "writeValue:forProperty:andDeviceID:", v25, 0x2000000000, v26);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFDFFFFFFFFFLL);
  }
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x1000000000) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftBass);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightBass);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayWithObjects:", v29, v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "writeValue:forProperty:andDeviceID:", v31, 0x1000000000, v32);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFEFFFFFFFFFLL);
  }
  if ((-[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0x4000000000) != 0)
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_leftMixedVolume);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rightMixedVolume);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayWithObjects:", v35, v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "writeValue:forProperty:andDeviceID:", v37, 0x4000000000, v38);

    -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") & 0xFFFFFFBFFFFFFFFFLL);
  }
  v39 = dispatch_time(0, 100000000);
  dispatch_get_global_queue(17, 0);
  v40 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AXRemoteHearingAidDevice__delayWriteProperties__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_after(v39, v40, block);

}

uint64_t __49__AXRemoteHearingAidDevice__delayWriteProperties__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delayWriteProperties");
}

- (void)writeVolumesForProperty:(unint64_t)a3
{
  uint64_t v5;

  -[AXRemoteHearingAidDevice setPendingPropertyWrites:](self, "setPendingPropertyWrites:", -[AXRemoteHearingAidDevice pendingPropertyWrites](self, "pendingPropertyWrites") | a3);
  if ((uint64_t)a3 > 0xFFFFFFFFFLL)
  {
    if (a3 != 0x1000000000 && a3 != 0x4000000000)
    {
      v5 = 0x2000000000;
LABEL_8:
      if (a3 != v5)
        return;
    }
  }
  else if (a3 != 64 && a3 != 128)
  {
    v5 = 0x80000000;
    goto LABEL_8;
  }
  if (!self->_delayWritePending)
    -[AXRemoteHearingAidDevice _delayWriteProperties](self, "_delayWriteProperties");
}

- (void)setLeftMicrophoneVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_leftMicrophoneVolume != v4)
  {
    self->_leftMicrophoneVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 64);
  }
}

- (void)setRightMicrophoneVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_rightMicrophoneVolume != v4)
  {
    self->_rightMicrophoneVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 64);
  }
}

- (void)setLeftStreamVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_leftStreamVolume != v4)
  {
    self->_leftStreamVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 128);
  }
}

- (void)setRightStreamVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_rightStreamVolume != v4)
  {
    self->_rightStreamVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 128);
  }
}

- (void)setLeftSensitivity:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_leftSensitivity != v4)
  {
    self->_leftSensitivity = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x80000000);
  }
}

- (void)setRightSensitivity:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_rightSensitivity != v4)
  {
    self->_rightSensitivity = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x80000000);
  }
}

- (void)setLeftTreble:(char)a3
{
  char v3;

  if (a3 <= -127)
    v3 = -127;
  else
    v3 = a3;
  if (self->_leftTreble != v3)
  {
    self->_leftTreble = v3;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x2000000000);
  }
}

- (void)setRightTreble:(char)a3
{
  char v3;

  if (a3 <= -127)
    v3 = -127;
  else
    v3 = a3;
  if (self->_rightTreble != v3)
  {
    self->_rightTreble = v3;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x2000000000);
  }
}

- (void)setLeftBass:(char)a3
{
  char v3;

  if (a3 <= -127)
    v3 = -127;
  else
    v3 = a3;
  if (self->_leftBass != v3)
  {
    self->_leftBass = v3;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x1000000000);
  }
}

- (void)setRightBass:(char)a3
{
  char v3;

  if (a3 <= -127)
    v3 = -127;
  else
    v3 = a3;
  if (self->_rightBass != v3)
  {
    self->_rightBass = v3;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x1000000000);
  }
}

- (void)setLeftMixedVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_leftMixedVolume != v4)
  {
    self->_leftMixedVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x4000000000);
  }
}

- (void)setRightMixedVolume:(double)a3
{
  double v3;
  double v4;

  v3 = 0.0;
  if (a3 >= 0.0)
    v3 = a3;
  if (a3 <= 1.0)
    v4 = v3;
  else
    v4 = 1.0;
  if (self->_rightMixedVolume != v4)
  {
    self->_rightMixedVolume = v4;
    -[AXRemoteHearingAidDevice writeVolumesForProperty:](self, "writeVolumesForProperty:", 0x4000000000);
  }
}

- (id)programAtIndex:(unsigned __int8)a3 forEar:(int)a4
{
  void *v5;
  id v6;
  _QWORD v8[5];
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  if (a4 == 2)
    -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
  else
    -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__AXRemoteHearingAidDevice_programAtIndex_forEar___block_invoke;
  v8[3] = &unk_1EA8EA7C8;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __50__AXRemoteHearingAidDevice_programAtIndex_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "index") == *(unsigned __int8 *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

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

  v5 = -[AXRemoteHearingAidDevice leftAvailable](self, "leftAvailable");
  if (v5 != -[AXRemoteHearingAidDevice rightAvailable](self, "rightAvailable"))
    return 1;
  result = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      v15 = -[AXRemoteHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps");
      if (v15 == -[AXRemoteHearingAidDevice rightSensitivitySteps](self, "rightSensitivitySteps"))
      {
        -[AXRemoteHearingAidDevice leftSensitivity](self, "leftSensitivity");
        v9 = v16;
        -[AXRemoteHearingAidDevice rightSensitivity](self, "rightSensitivity");
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
    else
    {
      if (a3 != 0x4000000000)
        return result;
      v11 = -[AXRemoteHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps");
      if (v11 == -[AXRemoteHearingAidDevice rightMixedVolumeSteps](self, "rightMixedVolumeSteps"))
      {
        -[AXRemoteHearingAidDevice leftMixedVolume](self, "leftMixedVolume");
        v9 = v12;
        -[AXRemoteHearingAidDevice rightMixedVolume](self, "rightMixedVolume");
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
  }
  else if (a3 == 64)
  {
    v13 = -[AXRemoteHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps");
    if (v13 == -[AXRemoteHearingAidDevice rightMicrophoneVolumeSteps](self, "rightMicrophoneVolumeSteps"))
    {
      -[AXRemoteHearingAidDevice leftMicrophoneVolume](self, "leftMicrophoneVolume");
      v9 = v14;
      -[AXRemoteHearingAidDevice rightMicrophoneVolume](self, "rightMicrophoneVolume");
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  else
  {
    if (a3 != 128)
      return result;
    v7 = -[AXRemoteHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps");
    if (v7 == -[AXRemoteHearingAidDevice rightStreamVolumeSteps](self, "rightStreamVolumeSteps"))
    {
      -[AXRemoteHearingAidDevice leftStreamVolume](self, "leftStreamVolume");
      v9 = v8;
      -[AXRemoteHearingAidDevice rightStreamVolume](self, "rightStreamVolume");
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  return 0;
}

- (BOOL)shouldDisplayCombinedVolume
{
  void *v3;
  BOOL v4;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (!objc_msgSend(v3, "independentHearingAidSettings")
     || -[AXRemoteHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes"))
    && -[AXRemoteHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes")
    && -[AXRemoteHearingAidDevice isLeftConnected](self, "isLeftConnected")
    && -[AXRemoteHearingAidDevice isRightConnected](self, "isRightConnected");

  return v4;
}

- (BOOL)shouldOnlyShowIndividualVolumesForProperty:(unint64_t)a3
{
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!objc_msgSend(v5, "independentHearingAidSettings")
     || -[AXRemoteHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes")
     || !-[AXRemoteHearingAidDevice isLeftConnected](self, "isLeftConnected")
     || !-[AXRemoteHearingAidDevice isRightConnected](self, "isRightConnected"))
    && -[AXRemoteHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes")
    && (v6 = -[AXRemoteHearingAidDevice isLeftConnected](self, "isLeftConnected"),
        v6 == -[AXRemoteHearingAidDevice isRightConnected](self, "isRightConnected")))
  {
    v7 = !-[AXRemoteHearingAidDevice supportsCombinedVolumesForProperty:](self, "supportsCombinedVolumesForProperty:", a3);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
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
  -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 == objc_msgSend(v5, "count");

  v18 = v4;
  if (!*((_BYTE *)v16 + 24))
    goto LABEL_5;
  -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__AXRemoteHearingAidDevice_programsListsAreEqual__block_invoke;
  v14[3] = &unk_1EA8EA730;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);

  if (*((_BYTE *)v16 + 24))
  {
    -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
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

void __49__AXRemoteHearingAidDevice_programsListsAreEqual__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (BOOL)showCombinedPrograms
{
  void *v3;
  BOOL v4;

  if (!-[AXRemoteHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"))
    return 0;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (!objc_msgSend(v3, "independentHearingAidSettings")
     || -[AXRemoteHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"))
    && -[AXRemoteHearingAidDevice programsListsAreEqual](self, "programsListsAreEqual");

  return v4;
}

- (id)programs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __36__AXRemoteHearingAidDevice_programs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "index");
  v7 = objc_msgSend(v5, "index");
  v8 = v6 == v7;
  if (v6 < v7)
    v9 = -1;
  else
    v9 = 1;
  if (v8)
  {
    objc_msgSend(v4, "setEar:", 6);
    objc_msgSend(v5, "setEar:", 6);
    v9 = 0;
  }

  return v9;
}

- (id)combinedPrograms
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[AXRemoteHearingAidDevice programs](self, "programs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = MEMORY[0x1E0C809B0];
    v8 = __44__AXRemoteHearingAidDevice_combinedPrograms__block_invoke;
    v9 = &unk_1EA8EA810;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v19[0] = v7;
        v19[1] = 3221225472;
        v19[2] = v8;
        v19[3] = v9;
        v19[4] = v11;
        if (objc_msgSend(v3, "indexOfObjectPassingTest:", v19) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "name");
          v12 = v9;
          v13 = v8;
          v14 = v7;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          v7 = v14;
          v8 = v13;
          v9 = v12;
          if (v16)
            objc_msgSend(v3, "addObject:", v11);
        }
        ++v10;
      }
      while (v5 != v10);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  return v3;
}

BOOL __44__AXRemoteHearingAidDevice_combinedPrograms__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  int v7;

  v6 = objc_msgSend(a2, "index");
  v7 = objc_msgSend(*(id *)(a1 + 32), "index");
  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

- (void)_updateSelectedProgramsProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXRemoteHearingAidDevice programs](self, "programs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice _updateSelectedProgramsProperties]", 732, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v24 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXRemoteHearingAidDevice setLeftSelectedStreamingProgram:](self, "setLeftSelectedStreamingProgram:", 0);
  -[AXRemoteHearingAidDevice setRightSelectedStreamingProgram:](self, "setRightSelectedStreamingProgram:", 0);
  -[AXRemoteHearingAidDevice setRightSelectedProgram:](self, "setRightSelectedProgram:", 0);
  -[AXRemoteHearingAidDevice setLeftSelectedProgram:](self, "setLeftSelectedProgram:", 0);
  -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke;
  v22[3] = &unk_1EA8E8DE8;
  v22[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);

  -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke_2;
  v21[3] = &unk_1EA8E8DE8;
  v21[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

  -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setLeftSelectedProgram:](self, "setLeftSelectedProgram:", v14);

  }
  -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setLeftSelectedStreamingProgram:](self, "setLeftSelectedStreamingProgram:", v16);

  }
  -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setRightSelectedProgram:](self, "setRightSelectedProgram:", v18);

  }
  -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setRightSelectedStreamingProgram:](self, "setRightSelectedStreamingProgram:", v20);

  }
}

void __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isSelected"))
  {
    v3 = objc_msgSend(v5, "isStreamOrMixingStream");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "setLeftSelectedStreamingProgram:", v5);
    else
      objc_msgSend(v4, "setLeftSelectedProgram:", v5);
  }

}

void __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isSelected"))
  {
    v3 = objc_msgSend(v5, "isStreamOrMixingStream");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "setRightSelectedStreamingProgram:", v5);
    else
      objc_msgSend(v4, "setRightSelectedProgram:", v5);
  }

}

- (void)_writeAllProgramSelectionsToPeripheral
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x1E0C99000uLL;
  v8 = 0x1E0CB3000uLL;
  if (-[AXRemoteHearingAidDevice propertyIsAvailable:forEar:](self, "propertyIsAvailable:forEar:", 0x800000000, 2)
    || -[AXRemoteHearingAidDevice propertyIsAvailable:forEar:](self, "propertyIsAvailable:forEar:", 0x800000000, 4))
  {
    -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "index"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "index"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
    v14 = v4;
    v15 = v5;
    v16 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeValue:forProperty:andDeviceID:", v13, 0x800000000, v17);

    v3 = v16;
    v5 = v15;
    v4 = v14;
    v8 = 0x1E0CB3000;

    v7 = 0x1E0C99000;
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AXHearingPropertyStreamingProgramActive not available"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice _writeAllProgramSelectionsToPeripheral]", 787, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v18);
      v21 = v19;
      v22 = v20;
      v7 = 0x1E0C99000uLL;
      *(_DWORD *)buf = 136446210;
      v30 = objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

  -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(void **)(v7 + 3360);
  objc_msgSend(*(id *)(v8 + 2024), "numberWithInt:", objc_msgSend(v4, "index"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v8 + 2024), "numberWithInt:", objc_msgSend(v6, "index"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "writeValue:forProperty:andDeviceID:", v27, 1024, v28);

}

- (void)selectProgram:(id)a3 forEar:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[AXRemoteHearingAidDevice showCombinedPrograms](self, "showCombinedPrograms"))
  {
    -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProgram:withOtherSidePrograms:selected:", v11, 0, objc_msgSend(v11, "isSelected"));

    -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProgram:withOtherSidePrograms:selected:", v11, 0, objc_msgSend(v11, "isSelected"));
LABEL_7:

    goto LABEL_8;
  }
  if ((a4 & objc_msgSend(v11, "ear") & 2) != 0)
  {
    -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProgram:withOtherSidePrograms:selected:", v11, v9, objc_msgSend(v11, "isSelected"));

  }
  if ((a4 & objc_msgSend(v11, "ear") & 4) != 0)
  {
    -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProgram:withOtherSidePrograms:selected:", v11, v10, objc_msgSend(v11, "isSelected"));

    goto LABEL_7;
  }
LABEL_8:
  -[AXRemoteHearingAidDevice _updateSelectedProgramsProperties](self, "_updateSelectedProgramsProperties");
  -[AXRemoteHearingAidDevice _writeAllProgramSelectionsToPeripheral](self, "_writeAllProgramSelectionsToPeripheral");

}

- (id)selectedPrograms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D20];
  -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexesOfObjectsPassingTest:", &__block_literal_global_59_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__AXRemoteHearingAidDevice_selectedPrograms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (id)selectedProgramIndexes
{
  void *v2;
  void *v3;

  -[AXRemoteHearingAidDevice programs](self, "programs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_61);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __50__AXRemoteHearingAidDevice_selectedProgramIndexes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSelected");
}

- (void)setKeepInSync:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_keepInSync != a3)
  {
    self->_keepInSync = a3;
    if (a3)
    {
      if (-[AXRemoteHearingAidDevice didLoadRequiredProperties](self, "didLoadRequiredProperties"))
      {
        -[AXRemoteHearingAidDevice updateDelegate](self, "updateDelegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateProperty:forDeviceID:", 0xFF800105C4, v4);

      }
      else
      {
        HAInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not completely loaded, trying again"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice setKeepInSync:]", 848, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)*MEMORY[0x1E0D2F928];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_retainAutorelease(v6);
          v9 = v7;
          *(_DWORD *)buf = 136446210;
          v12 = objc_msgSend(v8, "UTF8String");
          _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        -[AXRemoteHearingAidDevice loadRequiredProperties](self, "loadRequiredProperties");
      }
    }
  }
}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  AXRemoteHearingAidDevice *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  AXRemoteHearingAidDevice *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  os_log_t v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  double v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  os_log_t v102;
  id v103;
  NSObject *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  os_log_t v115;
  id v116;
  NSObject *v117;
  uint64_t v118;
  _QWORD v119[5];
  _QWORD v120[5];
  int v121;
  _QWORD v122[5];
  int v123;
  _QWORD v124[5];
  int v125;
  _QWORD v126[5];
  int v127;
  _QWORD v128[5];
  _QWORD v129[4];
  id v130;
  _QWORD v131[5];
  _QWORD v132[4];
  id v133;
  uint8_t buf[4];
  uint64_t v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  hearingPropertyDescription(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%p = property:%@ - value:%@"), self, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice setValue:forProperty:]", 861, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0D2F928];
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = self;
    v14 = objc_retainAutorelease(v10);
    v15 = v12;
    v16 = v14;
    self = v13;
    v17 = objc_msgSend(v16, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v135 = v17;
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if ((uint64_t)a4 <= 0x3FFFFFF)
  {
    if ((uint64_t)a4 <= 1023)
    {
      if ((uint64_t)a4 > 63)
      {
        if ((uint64_t)a4 <= 255)
        {
          if (a4 == 64)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "doubleValue");
            self->_leftMicrophoneVolume = v86;

            objc_msgSend(v6, "lastObject");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "doubleValue");
            self->_rightMicrophoneVolume = v88;

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x40;
          }
          else
          {
            if (a4 != 128)
              goto LABEL_163;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            self->_leftStreamVolume = v35;

            objc_msgSend(v6, "lastObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "doubleValue");
            self->_rightStreamVolume = v37;

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x80;
          }
          goto LABEL_176;
        }
        if (a4 != 256)
        {
          if (a4 != 512)
            goto LABEL_163;
          objc_msgSend(v6, "objectForKey:", &unk_1EA8FFCF8);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXRemoteHearingAidDevice setValue:forProperty:](self, "setValue:forProperty:", v57, 0x80000);

          objc_msgSend(v6, "objectForKey:", &unk_1EA8FFD10);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXRemoteHearingAidDevice setValue:forProperty:](self, "setValue:forProperty:", v58, 0x100000);

          v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x200;
          goto LABEL_176;
        }
        HAInitializeLogging();
        v98 = (void *)MEMORY[0x1E0CB3940];
        -[AXRemoteHearingAidDevice programs](self, "programs");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringWithFormat:", CFSTR("AXHearingPropertyProgramsAvailable %@"), v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice setValue:forProperty:]", 916, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          v103 = objc_retainAutorelease(v101);
          v104 = v102;
          v105 = objc_msgSend(v103, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v135 = v105;
          _os_log_impl(&dword_1DE311000, v104, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastObject");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = MEMORY[0x1E0C809B0];
          v132[0] = MEMORY[0x1E0C809B0];
          v132[1] = 3221225472;
          v132[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke;
          v132[3] = &unk_1EA8EA898;
          v133 = v107;
          v109 = v107;
          objc_msgSend(v33, "enumerateObjectsUsingBlock:", v132);
          -[AXRemoteHearingAidDevice setLeftPrograms:](self, "setLeftPrograms:", v109);
          v131[0] = v108;
          v131[1] = 3221225472;
          v131[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_2;
          v131[3] = &unk_1EA8E8DE8;
          v131[4] = self;
          objc_msgSend(v109, "enumerateObjectsUsingBlock:", v131);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = MEMORY[0x1E0C809B0];
          v129[0] = MEMORY[0x1E0C809B0];
          v129[1] = 3221225472;
          v129[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_3;
          v129[3] = &unk_1EA8EA898;
          v130 = v110;
          v112 = v110;
          objc_msgSend(v106, "enumerateObjectsUsingBlock:", v129);
          -[AXRemoteHearingAidDevice setRightPrograms:](self, "setRightPrograms:", v112);
          v128[0] = v111;
          v128[1] = 3221225472;
          v128[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_4;
          v128[3] = &unk_1EA8E8DE8;
          v128[4] = self;
          objc_msgSend(v112, "enumerateObjectsUsingBlock:", v128);

        }
        -[AXRemoteHearingAidDevice _updateSelectedProgramsProperties](self, "_updateSelectedProgramsProperties");
        -[AXRemoteHearingAidDevice setLoadedProperties:](self, "setLoadedProperties:", -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x100);

      }
      else
      {
        if ((uint64_t)a4 <= 15)
        {
          if (a4 == 4)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "doubleValue");
            -[AXRemoteHearingAidDevice setLeftBatteryLevel:](self, "setLeftBatteryLevel:");

            objc_msgSend(v6, "lastObject");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "doubleValue");
            -[AXRemoteHearingAidDevice setRightBatteryLevel:](self, "setRightBatteryLevel:");

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 4;
          }
          else
          {
            if (a4 != 8)
              goto LABEL_163;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v29 = -[AXRemoteHearingAidDevice availableEars](self, "availableEars");
              if (v29 != objc_msgSend(v6, "intValue") && (int)objc_msgSend(v6, "intValue") >= 1)
                -[AXRemoteHearingAidDevice setAvailableEars:](self, "setAvailableEars:", objc_msgSend(v6, "intValue"));
            }
            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 8;
          }
          goto LABEL_176;
        }
        if (a4 != 16 && a4 != 32)
          goto LABEL_163;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setLeftUUID:](self, "setLeftUUID:", v42);

        objc_msgSend(v6, "lastObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setRightUUID:](self, "setRightUUID:", v43);

        -[AXRemoteHearingAidDevice setLoadedProperties:](self, "setLoadedProperties:", -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | a4);
        -[AXRemoteHearingAidDevice leftUUID](self, "leftUUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "length");

        -[AXRemoteHearingAidDevice rightUUID](self, "rightUUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v46;
        if (v45)
        {
          v47 = objc_msgSend(v46, "length");

          if (v47)
          {
            v48 = (void *)MEMORY[0x1E0CB3940];
            -[AXRemoteHearingAidDevice leftUUID](self, "leftUUID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice rightUUID](self, "rightUUID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("%@_%@"), v49, v50);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            -[AXRemoteHearingAidDevice leftUUID](self, "leftUUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        -[AXRemoteHearingAidDevice setDeviceUUID:](self, "setDeviceUUID:", v33);
      }
      goto LABEL_181;
    }
    if ((uint64_t)a4 >= 0x100000)
    {
      if ((uint64_t)a4 >= 0x400000)
      {
        switch(a4)
        {
          case 0x400000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setLeftFirmwareVersion:](self, "setLeftFirmwareVersion:", v63);

            objc_msgSend(v6, "lastObject");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRightFirmwareVersion:](self, "setRightFirmwareVersion:", v64);

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x400000;
            break;
          case 0x800000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setLeftHardwareVersion:](self, "setLeftHardwareVersion:", v65);

            objc_msgSend(v6, "lastObject");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRightHardwareVersion:](self, "setRightHardwareVersion:", v66);

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x800000;
            break;
          case 0x1000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_178;
            -[AXRemoteHearingAidDevice setDeviceUUID:](self, "setDeviceUUID:", v6);
            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x1000000;
            break;
          default:
            goto LABEL_163;
        }
        goto LABEL_176;
      }
      if (a4 != 0x100000)
      {
        if (a4 != 0x200000)
          goto LABEL_163;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setLeftConnected:](self, "setLeftConnected:", objc_msgSend(v40, "intValue") == 2);

        objc_msgSend(v6, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setRightConnected:](self, "setRightConnected:", objc_msgSend(v41, "intValue") == 2);

        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x200000;
        goto LABEL_176;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
      {
        -[AXRemoteHearingAidDevice model](self, "model");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setArray:", v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_175:
          v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x100000;
          goto LABEL_176;
        }
        -[AXRemoteHearingAidDevice model](self, "model");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "replaceObjectAtIndex:withObject:", 0, v6);
      }

      goto LABEL_175;
    }
    if ((uint64_t)a4 < 0x40000)
    {
      if (a4 == 1024)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "intValue");

        if (v79 != -1)
        {
          -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_5;
          v126[3] = &unk_1EA8E8E50;
          v127 = v79;
          v126[4] = self;
          objc_msgSend(v80, "enumerateObjectsUsingBlock:", v126);

        }
        objc_msgSend(v6, "lastObject");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "intValue");

        if (v82 != -1)
        {
          -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v124[0] = MEMORY[0x1E0C809B0];
          v124[1] = 3221225472;
          v124[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_6;
          v124[3] = &unk_1EA8E8E50;
          v125 = v82;
          v124[4] = self;
          objc_msgSend(v83, "enumerateObjectsUsingBlock:", v124);

        }
        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x400;
      }
      else
      {
        if (a4 != 0x10000)
          goto LABEL_163;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setLeftAvailableProperties:](self, "setLeftAvailableProperties:", objc_msgSend(v30, "unsignedLongLongValue"));

        objc_msgSend(v6, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setRightAvailableProperties:](self, "setRightAvailableProperties:", objc_msgSend(v31, "unsignedLongLongValue"));

        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x10000;
      }
      goto LABEL_176;
    }
    if (a4 == 0x40000)
    {
      -[AXRemoteHearingAidDevice setName:](self, "setName:", v6);
      v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x40000;
      goto LABEL_176;
    }
    if (a4 != 0x80000)
      goto LABEL_163;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
    {
      -[AXRemoteHearingAidDevice manufacturer](self, "manufacturer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setArray:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_171:
        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x80000;
        goto LABEL_176;
      }
      -[AXRemoteHearingAidDevice manufacturer](self, "manufacturer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "replaceObjectAtIndex:withObject:", 0, v6);
    }

    goto LABEL_171;
  }
  if ((uint64_t)a4 > 0xFFFFFFFFFLL)
  {
    if ((uint64_t)a4 > 0xFFFFFFFFFFLL)
    {
      if ((uint64_t)a4 <= 0x3FFFFFFFFFFLL)
      {
        if (a4 != 0x10000000000)
        {
          if (a4 == 0x20000000000)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[AXRemoteHearingAidDevice setDeviceType:](self, "setDeviceType:", objc_msgSend(v6, "unsignedIntegerValue"));
            goto LABEL_178;
          }
LABEL_163:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v119[0] = MEMORY[0x1E0C809B0];
            v119[1] = 3221225472;
            v119[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_73;
            v119[3] = &unk_1EA8E8708;
            v119[4] = self;
            objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v119);
          }
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown property: %lld"), a4);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice setValue:forProperty:]", 1334, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            v116 = objc_retainAutorelease(v114);
            v117 = v115;
            v118 = objc_msgSend(v116, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v135 = v118;
            _os_log_impl(&dword_1DE311000, v117, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
          goto LABEL_178;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_178;
        -[AXRemoteHearingAidDevice setAvailableInputEars:](self, "setAvailableInputEars:", objc_msgSend(v6, "intValue"));
        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x10000000000;
      }
      else
      {
        switch(a4)
        {
          case 0x40000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_178;
            -[AXRemoteHearingAidDevice setEarsSupportingWatch:](self, "setEarsSupportingWatch:", objc_msgSend(v6, "intValue"));
            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x40000000000;
            break;
          case 0x80000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 4)
              goto LABEL_178;
            objc_msgSend(v6, "objectAtIndex:", 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRequiresCombinedPresets:](self, "setRequiresCombinedPresets:", objc_msgSend(v67, "BOOLValue"));

            objc_msgSend(v6, "objectAtIndex:", 2);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRequiresCombinedVolumes:](self, "setRequiresCombinedVolumes:", objc_msgSend(v68, "BOOLValue"));

            objc_msgSend(v6, "objectAtIndex:", 3);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRequiresBinauralStreaming:](self, "setRequiresBinauralStreaming:", objc_msgSend(v69, "BOOLValue"));

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x80000000000;
            break;
          case 0x100000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
              goto LABEL_178;
            objc_msgSend(v6, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setLeftPeripheralUUID:](self, "setLeftPeripheralUUID:", v27);

            objc_msgSend(v6, "lastObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice setRightPeripheralUUID:](self, "setRightPeripheralUUID:", v28);

            v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x100000000000;
            break;
          default:
            goto LABEL_163;
        }
      }
LABEL_176:
      v26 = self;
LABEL_177:
      -[AXRemoteHearingAidDevice setLoadedProperties:](v26, "setLoadedProperties:", v25);
      goto LABEL_178;
    }
    if ((uint64_t)a4 > 0x3FFFFFFFFFLL)
    {
      if (a4 == 0x4000000000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "doubleValue");
        self->_leftMixedVolume = v95;

        objc_msgSend(v6, "lastObject");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "doubleValue");
        self->_rightMixedVolume = v97;

        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x4000000000;
      }
      else
      {
        if (a4 != 0x8000000000)
          goto LABEL_163;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
          goto LABEL_178;
        objc_msgSend(v6, "firstObject");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", objc_msgSend(v55, "shortValue"));

        objc_msgSend(v6, "lastObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", objc_msgSend(v56, "shortValue"));

        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x8000000000;
      }
      goto LABEL_176;
    }
    if (a4 == 0x1000000000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
        goto LABEL_178;
      objc_msgSend(v6, "firstObject");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setLeftBass:](self, "setLeftBass:", objc_msgSend(v84, "charValue"));

      objc_msgSend(v6, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setRightBass:](self, "setRightBass:", objc_msgSend(v33, "charValue"));
    }
    else
    {
      if (a4 != 0x2000000000)
        goto LABEL_163;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
        goto LABEL_178;
      objc_msgSend(v6, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setLeftTreble:](self, "setLeftTreble:", objc_msgSend(v32, "charValue"));

      objc_msgSend(v6, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setRightTreble:](self, "setRightTreble:", objc_msgSend(v33, "charValue"));
    }
LABEL_181:

    goto LABEL_178;
  }
  if ((uint64_t)a4 <= 0x7FFFFFFF)
  {
    if ((uint64_t)a4 > 0x1FFFFFFF)
    {
      if (a4 == 0x20000000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_178;
        -[AXRemoteHearingAidDevice setIsBluetoothPaired:](self, "setIsBluetoothPaired:", objc_msgSend(v6, "BOOLValue"));
        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x20000000;
      }
      else
      {
        if (a4 != 0x40000000)
          goto LABEL_163;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 4)
          goto LABEL_178;
        objc_msgSend(v6, "objectAtIndex:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setSupportsCombinedPresets:](self, "setSupportsCombinedPresets:", objc_msgSend(v51, "BOOLValue"));

        objc_msgSend(v6, "objectAtIndex:", 2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setSupportsCombinedVolumes:](self, "setSupportsCombinedVolumes:", objc_msgSend(v52, "BOOLValue"));

        objc_msgSend(v6, "objectAtIndex:", 3);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXRemoteHearingAidDevice setSupportsBinauralStreaming:](self, "setSupportsBinauralStreaming:", objc_msgSend(v53, "BOOLValue"));

        v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x40000000;
      }
    }
    else if (a4 == 0x4000000)
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RemoteDevice Paired %@"), v6);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice setValue:forProperty:]", 1173, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v75 = objc_retainAutorelease(v73);
        v76 = v74;
        v77 = objc_msgSend(v75, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v135 = v77;
        _os_log_impl(&dword_1DE311000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[AXRemoteHearingAidDevice setIsPaired:](self, "setIsPaired:", objc_msgSend(v6, "BOOLValue"));
      v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x4000000;
    }
    else
    {
      if (a4 != 0x10000000)
        goto LABEL_163;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_178;
      v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x10000000;
    }
    goto LABEL_176;
  }
  if ((uint64_t)a4 <= 0x1FFFFFFFFLL)
  {
    if (a4 == 0x80000000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
        goto LABEL_178;
      objc_msgSend(v6, "firstObject");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "doubleValue");
      self->_leftSensitivity = v90;

      objc_msgSend(v6, "lastObject");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValue");
      self->_rightSensitivity = v92;

      v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x80000000;
    }
    else
    {
      if (a4 != 0x100000000)
        goto LABEL_163;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
        goto LABEL_178;
      objc_msgSend(v6, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", objc_msgSend(v38, "shortValue"));

      objc_msgSend(v6, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", objc_msgSend(v39, "shortValue"));

      v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x100000000;
    }
    goto LABEL_176;
  }
  if (a4 == 0x200000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
      goto LABEL_178;
    objc_msgSend(v6, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", objc_msgSend(v59, "shortValue"));

    objc_msgSend(v6, "lastObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", objc_msgSend(v60, "shortValue"));

    v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x200000000;
    goto LABEL_176;
  }
  if (a4 == 0x400000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "count") != 2)
      goto LABEL_178;
    objc_msgSend(v6, "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", objc_msgSend(v61, "shortValue"));

    objc_msgSend(v6, "lastObject");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXRemoteHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", objc_msgSend(v62, "shortValue"));

    v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x400000000;
    goto LABEL_176;
  }
  if (a4 != 0x800000000)
    goto LABEL_163;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") == 2)
  {
    objc_msgSend(v6, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    objc_msgSend(v6, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    v22 = MEMORY[0x1E0C809B0];
    if (v19 != -1)
    {
      -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v22;
      v122[1] = 3221225472;
      v122[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_7;
      v122[3] = &unk_1EA8E8E50;
      v123 = v19;
      v122[4] = self;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v122);

    }
    if (v21 != -1)
    {
      -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v22;
      v120[1] = 3221225472;
      v120[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_8;
      v120[3] = &unk_1EA8E8E50;
      v121 = v21;
      v120[4] = self;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v120);

    }
    v25 = -[AXRemoteHearingAidDevice loadedProperties](self, "loadedProperties") | 0x800000000;
    v26 = self;
    goto LABEL_177;
  }
LABEL_178:

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  AXHearingAidMode *v4;
  AXHearingAidMode *v5;

  v3 = a2;
  v5 = -[AXHearingAidMode initWithRepresentation:]([AXHearingAidMode alloc], "initWithRepresentation:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isSelected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProgram:withOtherSidePrograms:selected:", v5, v4, objc_msgSend(v5, "isSelected"));

  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  AXHearingAidMode *v4;
  AXHearingAidMode *v5;

  v3 = a2;
  v5 = -[AXHearingAidMode initWithRepresentation:]([AXHearingAidMode alloc], "initWithRepresentation:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isSelected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProgram:withOtherSidePrograms:selected:", v5, v4, objc_msgSend(v5, "isSelected"));

  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = *(_DWORD *)(a1 + 40);
  v7 = objc_msgSend(v11, "index");
  v8 = v11;
  if (v6 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedProgram:", v11);
    if ((objc_msgSend(v11, "isSelected") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProgram:withOtherSidePrograms:selected:", v11, v10, 1);

    }
    if (objc_msgSend(v11, "isStreamOrMixingStream"))
      objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedStreamingProgram:", v11);
    *a4 = 1;
    v8 = v11;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = *(_DWORD *)(a1 + 40);
  v7 = objc_msgSend(v11, "index");
  v8 = v11;
  if (v6 == v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRightSelectedProgram:", v11);
    if ((objc_msgSend(v11, "isSelected") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setProgram:withOtherSidePrograms:selected:", v11, v10, 1);

    }
    if (objc_msgSend(v11, "isStreamOrMixingStream"))
      objc_msgSend(*(id *)(a1 + 32), "setRightSelectedStreamingProgram:", v11);
    *a4 = 1;
    v8 = v11;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = *(_DWORD *)(a1 + 40);
  v11 = v6;
  if (v7 == objc_msgSend(v6, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "leftSelectedStreamingProgram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsSelected:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setLeftSelectedStreamingProgram:", v11);
    objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProgram:withOtherSidePrograms:selected:", v11, v10, 1);

    *a4 = 1;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = *(_DWORD *)(a1 + 40);
  v11 = v6;
  if (v7 == objc_msgSend(v6, "index"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rightSelectedStreamingProgram");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsSelected:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setRightSelectedStreamingProgram:", v11);
    objc_msgSend(*(id *)(a1 + 32), "rightPrograms");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "leftPrograms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProgram:withOtherSidePrograms:selected:", v11, v10, 1);

    *a4 = 1;
  }

}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));

}

- (id)_valueForProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _BOOL8 v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  _QWORD v75[4];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];
  _QWORD v80[2];
  _QWORD v81[3];

  v81[2] = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 <= 0x3FFFFFF)
  {
    if ((uint64_t)a3 <= 4095)
    {
      if ((uint64_t)a3 > 63)
      {
        if ((uint64_t)a3 > 255)
        {
          if (a3 == 256)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice leftPrograms](self, "leftPrograms");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = MEMORY[0x1E0C809B0];
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke;
            v71[3] = &unk_1EA8E8DE8;
            v72 = v41;
            v7 = v41;
            objc_msgSend(v42, "enumerateObjectsUsingBlock:", v71);

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXRemoteHearingAidDevice rightPrograms](self, "rightPrograms");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v69[0] = v43;
            v69[1] = 3221225472;
            v69[2] = __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke_2;
            v69[3] = &unk_1EA8E8DE8;
            v70 = v44;
            v46 = v44;
            objc_msgSend(v45, "enumerateObjectsUsingBlock:", v69);

            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v7, v46, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_133;
          }
          if (a3 != 512)
          {
            if (a3 == 1024)
            {
              v5 = (void *)MEMORY[0x1E0C99D20];
              v6 = (void *)MEMORY[0x1E0CB37E8];
              -[AXRemoteHearingAidDevice leftSelectedProgram](self, "leftSelectedProgram");
              v7 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "index"));
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = (void *)MEMORY[0x1E0CB37E8];
              -[AXRemoteHearingAidDevice rightSelectedProgram](self, "rightSelectedProgram");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
              v12 = v10;
              objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "index"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "arrayWithObjects:", v8, v13, 0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_133:
              return v14;
            }
            goto LABEL_114;
          }
          v80[0] = &unk_1EA8FFCF8;
          -[AXRemoteHearingAidDevice manufacturer](self, "manufacturer");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          v80[1] = &unk_1EA8FFD10;
          v81[0] = v7;
          -[AXRemoteHearingAidDevice model](self, "model");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v81[1] = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
          v47 = objc_claimAutoreleasedReturnValue();
          goto LABEL_99;
        }
        if (a3 == 64)
        {
          v25 = (void *)MEMORY[0x1E0C99D20];
          v57 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice leftMicrophoneVolume](self, "leftMicrophoneVolume");
          objc_msgSend(v57, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice rightMicrophoneVolume](self, "rightMicrophoneVolume");
          goto LABEL_112;
        }
        if (a3 == 128)
        {
          v25 = (void *)MEMORY[0x1E0C99D20];
          v26 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice leftStreamVolume](self, "leftStreamVolume");
          objc_msgSend(v26, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice rightStreamVolume](self, "rightStreamVolume");
LABEL_112:
          objc_msgSend(v28, "numberWithDouble:");
          v35 = objc_claimAutoreleasedReturnValue();
          goto LABEL_113;
        }
        goto LABEL_114;
      }
      if ((uint64_t)a3 <= 15)
      {
        if (a3 == 4)
        {
          v25 = (void *)MEMORY[0x1E0C99D20];
          v54 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice leftBatteryLevel](self, "leftBatteryLevel");
          objc_msgSend(v54, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice rightBatteryLevel](self, "rightBatteryLevel");
          goto LABEL_112;
        }
        if (a3 != 8)
        {
LABEL_114:
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown property: %ld"), a3);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXRemoteHearingAidDevice _valueForProperty:]", 1566, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v64 = objc_retainAutorelease(v62);
            v65 = v63;
            *(_DWORD *)buf = 136446210;
            v74 = objc_msgSend(v64, "UTF8String");
            _os_log_impl(&dword_1DE311000, v65, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
          return 0;
        }
        if (-[AXRemoteHearingAidDevice leftAvailable](self, "leftAvailable"))
          v18 = 2;
        else
          v18 = 0;
        if (-[AXRemoteHearingAidDevice rightAvailable](self, "rightAvailable"))
          v19 = v18 | 4;
        else
          v19 = v18;
        v20 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_106;
      }
      if (a3 != 16 && a3 != 32)
        goto LABEL_114;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[AXRemoteHearingAidDevice leftUUID](self, "leftUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        -[AXRemoteHearingAidDevice leftUUID](self, "leftUUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v37);

      }
      else
      {
        objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
      }

      -[AXRemoteHearingAidDevice rightUUID](self, "rightUUID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
      {
        -[AXRemoteHearingAidDevice rightUUID](self, "rightUUID");
        v67 = objc_claimAutoreleasedReturnValue();
LABEL_130:
        v68 = (void *)v67;
        objc_msgSend(v7, "addObject:", v67);

LABEL_132:
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_133;
      }
      goto LABEL_131;
    }
    if ((uint64_t)a3 >= 0x100000)
    {
      if ((uint64_t)a3 < 0x400000)
      {
        if (a3 != 0x100000)
        {
          if (a3 == 0x200000)
          {
            v25 = (void *)MEMORY[0x1E0C99D20];
            v31 = (void *)MEMORY[0x1E0CB37E8];
            if (-[AXRemoteHearingAidDevice leftConnected](self, "leftConnected"))
              v32 = 2;
            else
              v32 = 0;
            objc_msgSend(v31, "numberWithInt:", v32);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0CB37E8];
            if (-[AXRemoteHearingAidDevice rightConnected](self, "rightConnected"))
              v34 = 2;
            else
              v34 = 0;
            objc_msgSend(v33, "numberWithInt:", v34);
            v35 = objc_claimAutoreleasedReturnValue();
            goto LABEL_113;
          }
          goto LABEL_114;
        }
        -[AXRemoteHearingAidDevice model](self, "model");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 == 0x400000)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          -[AXRemoteHearingAidDevice leftFirmwareVersion](self, "leftFirmwareVersion");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            -[AXRemoteHearingAidDevice leftFirmwareVersion](self, "leftFirmwareVersion");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v49);

          }
          else
          {
            objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
          }

          -[AXRemoteHearingAidDevice rightFirmwareVersion](self, "rightFirmwareVersion");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            -[AXRemoteHearingAidDevice rightFirmwareVersion](self, "rightFirmwareVersion");
            v67 = objc_claimAutoreleasedReturnValue();
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        if (a3 == 0x800000)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          -[AXRemoteHearingAidDevice leftHardwareVersion](self, "leftHardwareVersion");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            -[AXRemoteHearingAidDevice leftHardwareVersion](self, "leftHardwareVersion");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v51);

          }
          else
          {
            objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
          }

          -[AXRemoteHearingAidDevice rightHardwareVersion](self, "rightHardwareVersion");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            -[AXRemoteHearingAidDevice rightHardwareVersion](self, "rightHardwareVersion");
            v67 = objc_claimAutoreleasedReturnValue();
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        if (a3 != 0x1000000)
          goto LABEL_114;
        -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v15;
    }
    if ((uint64_t)a3 >= 0x40000)
    {
      if (a3 == 0x40000)
      {
        -[AXRemoteHearingAidDevice name](self, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 0x80000)
          goto LABEL_114;
        -[AXRemoteHearingAidDevice manufacturer](self, "manufacturer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v15;
    }
    if (a3 == 4096)
      return 0;
    if (a3 != 0x10000)
      goto LABEL_114;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_leftAvailableProperties);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v76[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_rightAvailableProperties);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v22;
    v23 = (void *)MEMORY[0x1E0C99D20];
    v24 = v76;
LABEL_98:
    objc_msgSend(v23, "arrayWithObjects:count:", v24, 2);
    v47 = objc_claimAutoreleasedReturnValue();
LABEL_99:
    v14 = (void *)v47;
    goto LABEL_100;
  }
  if ((uint64_t)a3 <= 0xFFFFFFFFFLL)
  {
    if ((uint64_t)a3 > 0x7FFFFFFF)
    {
      if ((uint64_t)a3 <= 0x1FFFFFFFFLL)
      {
        if (a3 == 0x80000000)
        {
          v25 = (void *)MEMORY[0x1E0C99D20];
          v58 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice leftSensitivity](self, "leftSensitivity");
          objc_msgSend(v58, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB37E8];
          -[AXRemoteHearingAidDevice rightSensitivity](self, "rightSensitivity");
          goto LABEL_112;
        }
        if (a3 != 0x100000000)
          goto LABEL_114;
        v25 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXRemoteHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB37E8];
        v30 = -[AXRemoteHearingAidDevice rightMicrophoneVolumeSteps](self, "rightMicrophoneVolumeSteps");
      }
      else
      {
        switch(a3)
        {
          case 0x200000000uLL:
            v25 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXRemoteHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x1E0CB37E8];
            v30 = -[AXRemoteHearingAidDevice rightStreamVolumeSteps](self, "rightStreamVolumeSteps");
            break;
          case 0x400000000uLL:
            v25 = (void *)MEMORY[0x1E0C99D20];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXRemoteHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x1E0CB37E8];
            v30 = -[AXRemoteHearingAidDevice rightSensitivitySteps](self, "rightSensitivitySteps");
            break;
          case 0x800000000uLL:
            v5 = (void *)MEMORY[0x1E0C99D20];
            v11 = (void *)MEMORY[0x1E0CB37E8];
            -[AXRemoteHearingAidDevice leftSelectedStreamingProgram](self, "leftSelectedStreamingProgram");
            v7 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "numberWithInt:", objc_msgSend(v7, "index"));
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)MEMORY[0x1E0CB37E8];
            -[AXRemoteHearingAidDevice rightSelectedStreamingProgram](self, "rightSelectedStreamingProgram");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          default:
            goto LABEL_114;
        }
      }
      goto LABEL_87;
    }
    if ((uint64_t)a3 <= 0x1FFFFFFF)
    {
      if (a3 != 0x4000000)
      {
        if (a3 == 0x10000000)
          return MEMORY[0x1E0C9AAB0];
        goto LABEL_114;
      }
      v55 = (void *)MEMORY[0x1E0CB37E8];
      v56 = -[AXRemoteHearingAidDevice isPaired](self, "isPaired");
      goto LABEL_108;
    }
    if (a3 == 0x20000000)
    {
      v55 = (void *)MEMORY[0x1E0CB37E8];
      v56 = -[AXRemoteHearingAidDevice isBluetoothPaired](self, "isBluetoothPaired");
LABEL_108:
      objc_msgSend(v55, "numberWithBool:", v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      return v15;
    }
    if (a3 != 0x40000000)
      goto LABEL_114;
    v79[0] = &unk_1EA8FFD40;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v79[1] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice supportsBinauralStreaming](self, "supportsBinauralStreaming"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v38;
    v39 = (void *)MEMORY[0x1E0C99D20];
    v40 = v79;
LABEL_94:
    objc_msgSend(v39, "arrayWithObjects:count:", v40, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_100:
    goto LABEL_133;
  }
  if ((uint64_t)a3 > 0xFFFFFFFFFFLL)
  {
    if ((uint64_t)a3 <= 0x3FFFFFFFFFFLL)
    {
      if (a3 != 0x10000000000)
      {
        if (a3 != 0x20000000000)
          goto LABEL_114;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AXRemoteHearingAidDevice deviceType](self, "deviceType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        return v15;
      }
      v52 = (void *)MEMORY[0x1E0CB37E8];
      v53 = -[AXRemoteHearingAidDevice availableInputEars](self, "availableInputEars");
    }
    else
    {
      if (a3 != 0x40000000000)
      {
        if (a3 != 0x80000000000)
        {
          if (a3 != 0x100000000000)
            goto LABEL_114;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (id)objc_claimAutoreleasedReturnValue();
          -[AXRemoteHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[AXRemoteHearingAidDevice leftPeripheralUUID](self, "leftPeripheralUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v17);

          }
          else
          {
            objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
          }

          -[AXRemoteHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            -[AXRemoteHearingAidDevice rightPeripheralUUID](self, "rightPeripheralUUID");
            v67 = objc_claimAutoreleasedReturnValue();
            goto LABEL_130;
          }
LABEL_131:
          objc_msgSend(v7, "addObject:", &stru_1EA8EC4E0);
          goto LABEL_132;
        }
        v75[0] = &unk_1EA8FFD40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v75[1] = v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v75[2] = v22;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXRemoteHearingAidDevice requiresBinauralStreaming](self, "requiresBinauralStreaming"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v75[3] = v38;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = v75;
        goto LABEL_94;
      }
      v52 = (void *)MEMORY[0x1E0CB37E8];
      v53 = -[AXRemoteHearingAidDevice earsSupportingWatch](self, "earsSupportingWatch");
    }
    v19 = v53;
    v20 = v52;
LABEL_106:
    objc_msgSend(v20, "numberWithUnsignedInt:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    return v15;
  }
  if ((uint64_t)a3 <= 0x3FFFFFFFFFLL)
  {
    if (a3 == 0x1000000000)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftBass);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v77[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightBass);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v77;
    }
    else
    {
      if (a3 != 0x2000000000)
        goto LABEL_114;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_leftTreble);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v78[0] = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", self->_rightTreble);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v78[1] = v22;
      v23 = (void *)MEMORY[0x1E0C99D20];
      v24 = v78;
    }
    goto LABEL_98;
  }
  if (a3 == 0x4000000000)
  {
    v25 = (void *)MEMORY[0x1E0C99D20];
    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[AXRemoteHearingAidDevice leftMixedVolume](self, "leftMixedVolume");
    objc_msgSend(v59, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[AXRemoteHearingAidDevice rightMixedVolume](self, "rightMixedVolume");
    goto LABEL_112;
  }
  if (a3 != 0x8000000000)
    goto LABEL_114;
  v25 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[AXRemoteHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CB37E8];
  v30 = -[AXRemoteHearingAidDevice rightMixedVolumeSteps](self, "rightMixedVolumeSteps");
LABEL_87:
  objc_msgSend(v29, "numberWithShort:", v30);
  v35 = objc_claimAutoreleasedReturnValue();
LABEL_113:
  v60 = (void *)v35;
  objc_msgSend(v25, "arrayWithObjects:", v27, v35, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transportRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "transportRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)valueForProperty:(unint64_t)a3
{
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 64; ++i)
  {
    if (((1 << i) & a3) != 0)
    {
      -[AXRemoteHearingAidDevice _valueForProperty:](self, "_valueForProperty:", 1 << i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1 << i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v7, v8);

      }
    }
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (double)combinedVolumeForProperty:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v24;

  if (propertyContainsProperty(0x40800000C0, a3))
  {
    -[AXRemoteHearingAidDevice _valueForProperty:](self, "_valueForProperty:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count") == 2)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(v5, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      v13 = -[AXRemoteHearingAidDevice leftAvailable](self, "leftAvailable");
      if (v13)
        v14 = 1.0;
      else
        v14 = 0.0;
      if (v13)
        v15 = v9 + 0.0;
      else
        v15 = 0.0;
      v16 = -[AXRemoteHearingAidDevice rightAvailable](self, "rightAvailable");
      v17 = v14 + 1.0;
      if (!v16)
        v17 = v14;
      v18 = -0.0;
      if (v16)
        v18 = v12;
      v6 = (v15 + v18) / v17;
    }
LABEL_26:

    return v6;
  }
  if (a3 == 0x2000000000 || (v6 = 0.0, a3 == 0x1000000000))
  {
    -[AXRemoteHearingAidDevice _valueForProperty:](self, "_valueForProperty:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count") == 2)
    {
      objc_msgSend(v5, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "charValue");

      objc_msgSend(v5, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (double)(int)objc_msgSend(v21, "charValue");

      if ((double)v20 != v22 && v20 == 0)
        v24 = v22;
      else
        v24 = (double)v20;
      v6 = v24 / 255.0 + 0.5;
    }
    goto LABEL_26;
  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXRemoteHearingAidDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteHearingAidDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXRemoteHearingAidDevice availableEars](self, "availableEars");
  -[AXRemoteHearingAidDevice deviceUUID](self, "deviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXRemoteHearingAidDevice:%p:[%@] [%@, %@] [%d] {%@}"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)keepInSync
{
  return self->_keepInSync;
}

- (double)rightMicrophoneVolume
{
  return self->_rightMicrophoneVolume;
}

- (double)leftMicrophoneVolume
{
  return self->_leftMicrophoneVolume;
}

- (double)rightStreamVolume
{
  return self->_rightStreamVolume;
}

- (double)leftStreamVolume
{
  return self->_leftStreamVolume;
}

- (double)leftSensitivity
{
  return self->_leftSensitivity;
}

- (double)rightSensitivity
{
  return self->_rightSensitivity;
}

- (int)availableEars
{
  return self->availableEars;
}

- (void)setAvailableEars:(int)a3
{
  self->availableEars = a3;
}

- (char)leftTreble
{
  return self->_leftTreble;
}

- (char)rightTreble
{
  return self->_rightTreble;
}

- (char)leftBass
{
  return self->_leftBass;
}

- (char)rightBass
{
  return self->_rightBass;
}

- (double)leftMixedVolume
{
  return self->_leftMixedVolume;
}

- (double)rightMixedVolume
{
  return self->_rightMixedVolume;
}

- (unint64_t)rightLeaVersion
{
  return self->rightLeaVersion;
}

- (void)setRightLeaVersion:(unint64_t)a3
{
  self->rightLeaVersion = a3;
}

- (unint64_t)leftLeaVersion
{
  return self->leftLeaVersion;
}

- (void)setLeftLeaVersion:(unint64_t)a3
{
  self->leftLeaVersion = a3;
}

- (AXHARemoteUpdateProtocol)updateDelegate
{
  return (AXHARemoteUpdateProtocol *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (BOOL)isBluetoothPaired
{
  return self->_isBluetoothPaired;
}

- (void)setIsBluetoothPaired:(BOOL)a3
{
  self->_isBluetoothPaired = a3;
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->_isPaired = a3;
}

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->_isConnecting = a3;
}

- (BOOL)leftConnected
{
  return self->_leftConnected;
}

- (void)setLeftConnected:(BOOL)a3
{
  self->_leftConnected = a3;
}

- (BOOL)rightConnected
{
  return self->_rightConnected;
}

- (void)setRightConnected:(BOOL)a3
{
  self->_rightConnected = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableArray)manufacturer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSMutableArray)model
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)leftFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLeftFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)rightFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRightFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)leftHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLeftHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)rightHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRightHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)rightUUID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRightUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)leftUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLeftUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)leftPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLeftPeripheralUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)rightPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRightPeripheralUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
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

- (NSDate)leftBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 256, 1);
}

- (void)setLeftBatteryLowDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSDate)rightBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRightBatteryLowDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
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

- (signed)leftStreamVolumeSteps
{
  return self->_leftStreamVolumeSteps;
}

- (void)setLeftStreamVolumeSteps:(signed __int16)a3
{
  self->_leftStreamVolumeSteps = a3;
}

- (signed)rightStreamVolumeSteps
{
  return self->_rightStreamVolumeSteps;
}

- (void)setRightStreamVolumeSteps:(signed __int16)a3
{
  self->_rightStreamVolumeSteps = a3;
}

- (signed)leftSensitivitySteps
{
  return self->_leftSensitivitySteps;
}

- (void)setLeftSensitivitySteps:(signed __int16)a3
{
  self->_leftSensitivitySteps = a3;
}

- (signed)rightSensitivitySteps
{
  return self->_rightSensitivitySteps;
}

- (void)setRightSensitivitySteps:(signed __int16)a3
{
  self->_rightSensitivitySteps = a3;
}

- (signed)leftMixedVolumeSteps
{
  return self->_leftMixedVolumeSteps;
}

- (void)setLeftMixedVolumeSteps:(signed __int16)a3
{
  self->_leftMixedVolumeSteps = a3;
}

- (signed)rightMixedVolumeSteps
{
  return self->_rightMixedVolumeSteps;
}

- (void)setRightMixedVolumeSteps:(signed __int16)a3
{
  self->_rightMixedVolumeSteps = a3;
}

- (BOOL)supportsBinauralStreaming
{
  return self->_supportsBinauralStreaming;
}

- (void)setSupportsBinauralStreaming:(BOOL)a3
{
  self->_supportsBinauralStreaming = a3;
}

- (BOOL)supportsCombinedPresets
{
  return self->_supportsCombinedPresets;
}

- (void)setSupportsCombinedPresets:(BOOL)a3
{
  self->_supportsCombinedPresets = a3;
}

- (BOOL)supportsCombinedVolumes
{
  return self->_supportsCombinedVolumes;
}

- (void)setSupportsCombinedVolumes:(BOOL)a3
{
  self->_supportsCombinedVolumes = a3;
}

- (BOOL)requiresBinauralStreaming
{
  return self->_requiresBinauralStreaming;
}

- (void)setRequiresBinauralStreaming:(BOOL)a3
{
  self->_requiresBinauralStreaming = a3;
}

- (BOOL)requiresCombinedPresets
{
  return self->_requiresCombinedPresets;
}

- (void)setRequiresCombinedPresets:(BOOL)a3
{
  self->_requiresCombinedPresets = a3;
}

- (BOOL)requiresCombinedVolumes
{
  return self->_requiresCombinedVolumes;
}

- (void)setRequiresCombinedVolumes:(BOOL)a3
{
  self->_requiresCombinedVolumes = a3;
}

- (NSArray)rightPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setRightPrograms:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (NSArray)leftPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setLeftPrograms:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (AXHearingAidMode)leftSelectedProgram
{
  return self->_leftSelectedProgram;
}

- (void)setLeftSelectedProgram:(id)a3
{
  objc_storeStrong((id *)&self->_leftSelectedProgram, a3);
}

- (AXHearingAidMode)rightSelectedProgram
{
  return self->_rightSelectedProgram;
}

- (void)setRightSelectedProgram:(id)a3
{
  objc_storeStrong((id *)&self->_rightSelectedProgram, a3);
}

- (AXHearingAidMode)leftSelectedStreamingProgram
{
  return self->_leftSelectedStreamingProgram;
}

- (void)setLeftSelectedStreamingProgram:(id)a3
{
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, a3);
}

- (AXHearingAidMode)rightSelectedStreamingProgram
{
  return self->_rightSelectedStreamingProgram;
}

- (void)setRightSelectedStreamingProgram:(id)a3
{
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, a3);
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (unint64_t)requiredProperties
{
  return self->_requiredProperties;
}

- (void)setRequiredProperties:(unint64_t)a3
{
  self->_requiredProperties = a3;
}

- (unint64_t)loadedProperties
{
  return self->_loadedProperties;
}

- (void)setLoadedProperties:(unint64_t)a3
{
  self->_loadedProperties = a3;
}

- (unint64_t)pendingPropertyWrites
{
  return self->_pendingPropertyWrites;
}

- (void)setPendingPropertyWrites:(unint64_t)a3
{
  self->_pendingPropertyWrites = a3;
}

- (unint64_t)leftAvailableProperties
{
  return self->_leftAvailableProperties;
}

- (void)setLeftAvailableProperties:(unint64_t)a3
{
  self->_leftAvailableProperties = a3;
}

- (unint64_t)rightAvailableProperties
{
  return self->_rightAvailableProperties;
}

- (void)setRightAvailableProperties:(unint64_t)a3
{
  self->_rightAvailableProperties = a3;
}

- (int)availableInputEars
{
  return self->_availableInputEars;
}

- (void)setAvailableInputEars:(int)a3
{
  self->_availableInputEars = a3;
}

- (int)earsSupportingWatch
{
  return self->_earsSupportingWatch;
}

- (void)setEarsSupportingWatch:(int)a3
{
  self->_earsSupportingWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_rightSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftPrograms, 0);
  objc_storeStrong((id *)&self->_rightPrograms, 0);
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_rightPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_leftPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_leftUUID, 0);
  objc_storeStrong((id *)&self->_rightUUID, 0);
  objc_storeStrong((id *)&self->_rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->_leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->_rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end
