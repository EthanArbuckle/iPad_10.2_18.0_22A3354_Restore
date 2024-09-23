@implementation HPSDevice

- (HPSDevice)initWithHeadphoneDevice:(id)a3 btsDevice:(id)a4
{
  id v7;
  id v8;
  HPSDevice *v9;
  HPSDevice *v10;
  void **p_headphoneDevice;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HPSDevice;
  v9 = -[HPSDevice init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_btsDevice, a4);
    p_headphoneDevice = (void **)&v10->_headphoneDevice;
    objc_storeStrong((id *)&v10->_headphoneDevice, a3);
    +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_ffValue = objc_msgSend(v12, "isFeatureEnabled");

    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = v8;
      v26 = 2048;
      v27 = v7;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: %p %p", buf, 0x16u);
    }

    if (v8)
    {
      if (v10->_ffValue)
      {
        objc_msgSend(MEMORY[0x1E0D289E0], "shared");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "connectedHeadphones");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "classicDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "address");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *p_headphoneDevice;
        *p_headphoneDevice = (void *)v19;

        if (!*p_headphoneDevice)
        {
          sharedBluetoothSettingsLogComponent();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[HPSDevice initWithHeadphoneDevice:btsDevice:].cold.1();

        }
      }
    }
  }

  return v10;
}

- (id)address
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "btAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
    v5 = objc_claimAutoreleasedReturnValue();

    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[address]"), v8, v5);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "btAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v5;
    }
    else
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "classicDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "address");
      v11 = objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "address");
    v11 = objc_claimAutoreleasedReturnValue();

    sharedBluetoothSettingsLogComponent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [address] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v20, 0x16u);

    }
  }

  return v11;
}

- (BOOL)batteryStatus:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "batteryStatus:", a3);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n battIsChagingCase: %i \nbattIsChargingLeft: %i \nbattIsChargingRight: %i \nbattIsChargingSingle: %i \nbattLevelCase: %i \nbattLevelLeft: %i \nbattLevelRight: %i \nbattLevelSingle: %i \n"), a3->var7, a3->var5, a3->var3, a3->var1, a3->var6, a3->var4, a3->var2, a3->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "batteryStateCase");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "batteryStateLeft");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "batteryStateRight");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v12, "batteryStateMain");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "batteryLevelCase");
    a3->var6 = (int)(float)(v14 * 100.0);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "batteryLevelLeft");
    a3->var4 = (int)(float)(v16 * 100.0);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "batteryLevelRight");
    a3->var2 = (int)(float)(v18 * 100.0);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "batteryLevelMain");
    a3->var0 = (int)(float)(v20 * 100.0);

    a3->var7 = v7 == 1;
    a3->var5 = (_DWORD)v9 == 1;
    a3->var3 = (_DWORD)v10 == 1;
    a3->var1 = (_DWORD)v11 == 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n battIsChagingCase: %i \nbattIsChargingLeft: %i \nbattIsChargingRight: %i \nbattIsChargingSingle: %i \nbattLevelCase: %i \nbattLevelLeft: %i \nbattLevelRight: %i \nbattLevelSingle: %i \n"), v7 == 1, (_DWORD)v9 == 1, (_DWORD)v10 == 1, (_DWORD)v11 == 1, a3->var6, a3->var4, a3->var2, a3->var0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[batteryStatus:]"), v8, v21);

    LOBYTE(v7) = 1;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "classicDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v25;
      v29 = 2112;
      v30 = v8;
      v31 = 1024;
      v32 = v7;
      _os_log_impl(&dword_1DB30C000, v22, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [batteryStatus:] [BTDevice-Only] btDevice: %@, values:%@, returnValue:%i", buf, 0x1Cu);

    }
  }

  return v7;
}

- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4
{
  void *v7;
  void *v8;
  unsigned int v9;
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
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clickHoldMode:rightAction:", a3, a4);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v16, "clickHoldModeLeft");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = objc_msgSend(v17, "clickHoldModeRight");

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[clickHoldMode:rightAction:]"), v15, v23);
    v9 = 1;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "classicDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "address");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *a3;
      v29 = *a4;
      *(_DWORD *)buf = 138413058;
      v32 = v27;
      v33 = 1024;
      v34 = v28;
      v35 = 1024;
      v36 = v29;
      v37 = 1024;
      v38 = v9;
      _os_log_impl(&dword_1DB30C000, v24, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [clickHoldMode:rightAction:] [BTDevice-Only] btDevice: %@, leftMode:%i, rightMode:%i, returnValue:%i", buf, 0x1Eu);

    }
  }

  return v9;
}

- (int)crownRotationDirection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "crownRotationDirection");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "crownRotationDirection");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[crownRotationDirection]"), v9, v11);

    if ((_DWORD)v7 == 1)
      v12 = 1;
    else
      v12 = 2;
    if ((_DWORD)v7)
      LODWORD(v5) = v12;
    else
      LODWORD(v5) = 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [crownRotationDirection] [BTDevice-Only] btDevice: %@,  returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return v5;
}

- (unsigned)doubleTapAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "doubleTapAction");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "doubleTapActionLeft") - 1;
    if (v7 >= 5)
      v8 = 0xFFFFLL;
    else
      v8 = v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[doubleTapAction]"), v9, v11);

    LODWORD(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapAction] [BTDevice-Only] btDevice: %@,  returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return v5;
}

- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4
{
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "doubleTapActionEx:rightAction:", a3, a4);

  if (self->_ffValue && self->_headphoneDevice)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "doubleTapActionLeft") - 1;
    if (v15 >= 5)
      v15 = 0xFFFF;
    *a3 = v15;

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "doubleTapActionRight") - 1;
    if (v17 >= 5)
      v17 = 0xFFFF;
    *a4 = v17;

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[doubleTapActionEx:rightAction:]"), v13, v21);
    return 1;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "classicDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *a3;
      v27 = *a4;
      *(_DWORD *)buf = 138413058;
      v30 = v25;
      v31 = 1024;
      v32 = v26;
      v33 = 1024;
      v34 = v27;
      v35 = 1024;
      v36 = v9;
      _os_log_impl(&dword_1DB30C000, v22, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapActionEx:rightAction:] [BTDevice-Only] btDevice: %@, inLeftAction:%i, inRightAction:%i,  returnValue:%i", buf, 0x1Eu);

    }
  }
  return v9;
}

- (unsigned)getAdaptiveVolumeMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getAdaptiveVolumeMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "adaptiveVolume"))
      v7 = 1;
    else
      v7 = 2;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getAdaptiveVolumeMode]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAdaptiveVolumeMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return v5;
}

- (BOOL)getAdaptiveVolumeSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getAdaptiveVolumeSupport");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsFeatureWithFeature:", 20);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getAdaptiveVolumeSupport]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAdaptiveVolumeSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)getAutoANCSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getAutoANCSupport");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "autoAncCapability");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getAutoANCSupport]"), v9, v11);

    LOBYTE(v5) = (_DWORD)v8 != 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAutoANCSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)getConversationDetectSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getConversationDetectSupport");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsFeatureWithFeature:", 19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getConversationDetectSupport]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getConversationDetectSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return (char)v5;
}

- (unsigned)getDeviceAdaptiveVolumeMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getDeviceAdaptiveVolumeMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "adaptiveVolumeConfig");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getDeviceAdaptiveVolumeMode]"), v9, v11);

    LOBYTE(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceAdaptiveVolumeMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return v5;
}

- (BOOL)getHexDeviceAddress:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getHexDeviceAddress:", a3);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cbDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "btAddressData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    a3->var0[0] = *(_BYTE *)objc_msgSend(v12, "bytes");
    v13 = objc_retainAutorelease(v12);
    a3->var0[1] = *(_BYTE *)(objc_msgSend(v13, "bytes") + 1);
    v14 = objc_retainAutorelease(v13);
    a3->var0[2] = *(_BYTE *)(objc_msgSend(v14, "bytes") + 2);
    v15 = objc_retainAutorelease(v14);
    a3->var0[3] = *(_BYTE *)(objc_msgSend(v15, "bytes") + 3);
    v16 = objc_retainAutorelease(v15);
    a3->var0[4] = *(_BYTE *)(objc_msgSend(v16, "bytes") + 4);
    v17 = objc_retainAutorelease(v16);
    a3->var0[5] = *(_BYTE *)(objc_msgSend(v17, "bytes") + 5);
    objc_msgSend(v8, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getHexDeviceAddress:]"), v18, v19);

    v20 = 1;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "classicDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = a3->var0[0];
      v26 = a3->var0[1];
      v27 = a3->var0[2];
      v28 = a3->var0[3];
      v29 = a3->var0[4];
      v30 = a3->var0[5];
      v32 = 138414082;
      v33 = v24;
      v34 = 1024;
      v35 = v25;
      v36 = 1024;
      v37 = v26;
      v38 = 1024;
      v39 = v27;
      v40 = 1024;
      v41 = v28;
      v42 = 1024;
      v43 = v29;
      v44 = 1024;
      v45 = v30;
      v46 = 1024;
      v47 = v7;
      _os_log_impl(&dword_1DB30C000, v21, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getHexDeviceAddress:] [BTDevice-Only] btDevice: %@, inAddress:0x%02X%02X%02X%02X%02X%02X, returnValue:%i", (uint8_t *)&v32, 0x36u);

    }
    v20 = v7 == 0;
  }

  return v20;
}

- (BOOL)inEarDetectEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "inEarDetectEnabled");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "placementMode") == 1;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[inEarDetectEnabled]"), v9, v11);

    LOBYTE(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [inEarDetectEnabled] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v8, "inEarStatusPrimary:secondary:", a3, a4);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cbDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "primaryPlacement") - 1;
    if (v16 > 6)
      v17 = 3;
    else
      v17 = dword_1DB3C1564[v16];
    *a3 = v17;

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cbDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "secondaryPlacement") - 1;
    if (v26 > 6)
      v27 = 3;
    else
      v27 = dword_1DB3C1564[v26];
    *a4 = v27;

    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@-%@"), v29, v30);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[inEarStatusPrimary:secondary:]"), v13, v9);
    LOBYTE(v9) = 1;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "classicDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "address");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *a3;
      v23 = *a4;
      *(_DWORD *)buf = 138413058;
      v33 = v21;
      v34 = 1024;
      v35 = v22;
      v36 = 1024;
      v37 = v23;
      v38 = 1024;
      v39 = (int)v9;
      _os_log_impl(&dword_1DB30C000, v18, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [inEarStatusPrimary:secondary:] [BTDevice-Only] btDevice: %@, inPrimary:%i, inSecondary:%i, returnValue:%i", buf, 0x1Eu);

    }
  }

  return (char)v9;
}

- (BOOL)isAppleAudioDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "isAppleAudioDevice");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "productID");
    v9 = ((v8 - 8194) < 0x25) & (0x1C7BB7FF9BuLL >> (v8 - 2));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[isAppleAudioDevice]"), v10, v12);

    LOBYTE(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isAppleAudioDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)isGenuineAirPods
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "isGenuineAirPods");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_msgSend(v7, "gapaFlags") & 2) == 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[isGenuineAirPods]"), v9, v11);

    LOBYTE(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isGenuineAirPods] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return (char)v5;
}

- (unsigned)listeningModeConfigs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "listeningModeConfigs");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "listeningModeConfigs");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[listeningModeConfigs]"), v8, v10);

    LODWORD(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [listeningModeConfigs] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return v5;
}

- (unsigned)micMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "micMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "microphoneMode");
    if (v7 == 3)
      v8 = 1;
    else
      v8 = 2 * (v7 == 2);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[micMode]"), v9, v11);

    LODWORD(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [micMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return v5;
}

- (unsigned)productId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "productId");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "productID");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[productId]"), v9, v11);

    LODWORD(v5) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [productId] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return v5;
}

- (void)setAdaptiveVolumeMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  int v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getAdaptiveVolumeMode");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAdaptiveVolume:", (_DWORD)v3 == 1);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFeatureValuesWithFeature:", 20);

    v10 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __35__HPSDevice_setAdaptiveVolumeMode___block_invoke;
    v18[3] = &unk_1EA29B630;
    v18[4] = self;
    v19 = v3;
    v20 = v7;
    dispatch_after(v10, v11, v18);

  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdaptiveVolumeMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      v23 = 1024;
      v24 = v3;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setAdaptiveVolumeMode:] [BTDevice-Only] btDevice: %@, inputAdaptiveVolumeMode:%i", buf, 0x12u);

    }
  }
}

void __35__HPSDevice_setAdaptiveVolumeMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 44));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getAdaptiveVolumeMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setAdaptiveVolumeMode:]"), v3, v5, v10);

}

- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
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
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  id v34;
  id v35;
  unsigned int v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v36 = 0;
    *(_DWORD *)buf = 0;
    -[HPSDevice clickHoldMode:rightAction:](self, "clickHoldMode:rightAction:", buf, &v36);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)buf);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClickHoldModeLeft:", v5);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClickHoldModeRight:", v4);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateFeatureValuesWithFeature:", 2);

    v22 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HPSDevice_setClickHoldMode_rightMode___block_invoke;
    block[3] = &unk_1EA29B018;
    block[4] = self;
    v34 = v18;
    v35 = v12;
    v24 = v12;
    v25 = v18;
    dispatch_after(v22, v23, block);

    LOBYTE(v25) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "classicDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v27, "setClickHoldMode:rightMode:", v5, v4);

    sharedBluetoothSettingsLogComponent();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "classicDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "address");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = v31;
      v39 = 1024;
      v40 = v5;
      v41 = 1024;
      v42 = v4;
      v43 = 1024;
      v44 = (int)v25;
      _os_log_impl(&dword_1DB30C000, v28, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setClickHoldMode:rightMode:] [BTDevice-Only] btDevice: %@, inputLeftMode:%i, inputRightMode:%i, returnValue:%i", buf, 0x1Eu);

    }
  }
  return (char)v25;
}

void __40__HPSDevice_setClickHoldMode_rightMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "clickHoldMode:rightAction:", (char *)&v8 + 4, &v8);
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setClickHoldMode:rightMode:]"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
}

- (void)setConversationDetectMode:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[7];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v5 = a3;
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "getConversationDetectMode");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConversationDetect:", (_DWORD)v3 == 1);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFeatureValuesWithFeature:", 19);

    v11 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__HPSDevice_setConversationDetectMode___block_invoke;
    block[3] = &unk_1EA29B040;
    block[4] = self;
    block[5] = v5;
    block[6] = v8;
    dispatch_after(v11, v12, block);
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConversationDetectMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v17;
      v21 = 1024;
      v22 = v3;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setConversationDetectMode:] [BTDevice-Only] btDevice: %@, inputConversationDetectMode:%i", buf, 0x12u);

    }
  }

}

void __39__HPSDevice_setConversationDetectMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getConversationDetectMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setConversationDetectMode:]"), v3, v5, v10);

}

- (BOOL)setCrownRotationDirection:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[7];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v5 = a3;
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "crownRotationDirection");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCrownRotationDirection:", v3);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFeatureValuesWithFeature:", 4);

    v11 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__HPSDevice_setCrownRotationDirection___block_invoke;
    block[3] = &unk_1EA29B040;
    block[4] = self;
    block[5] = v5;
    block[6] = v8;
    dispatch_after(v11, v12, block);

    LOBYTE(v12) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v14, "setCrownRotationDirection:", v3);

    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 1024;
      v24 = v3;
      v25 = 1024;
      v26 = (int)v12;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setCrownRotationDirection:] [BTDevice-Only] btDevice: %@, inputCrownDirection:%i, resultValue:%i", buf, 0x18u);

    }
  }
  return (char)v12;
}

void __39__HPSDevice_setCrownRotationDirection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "crownRotationDirection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setCrownRotationDirection:]"), v3, v5, v10);

}

- (void)setDeviceSoundProfileAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HPSDevice *v20;
  BOOL v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getDeviceSoundProfileAllowed");

    v8 = objc_alloc_init(MEMORY[0x1E0C97748]);
    v9 = v8;
    if (v3)
      v10 = 1;
    else
      v10 = 2;
    -[NSObject setSpatialSoundProfileAllowed:](v8, "setSpatialSoundProfileAllowed:", v10);
    v11 = objc_alloc_init(MEMORY[0x1E0C97740]);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__HPSDevice_setDeviceSoundProfileAllowed___block_invoke;
    v18[3] = &unk_1EA29B658;
    v19 = v11;
    v20 = self;
    v21 = v3;
    v22 = v7;
    v12 = v11;
    objc_msgSend(v12, "modifyControllerSettings:completionHandler:", v9, v18);

  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDeviceSoundProfileAllowed:", v3);

    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 1024;
      v26 = v3;
      _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDeviceSoundProfileAllowed:] [BTDevice-Only] btDevice: %@, inputEnabled:%i,", buf, 0x12u);

    }
  }

}

void __42__HPSDevice_setDeviceSoundProfileAllowed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "getDeviceSoundProfileAllowed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setDeviceSoundProfileAllowed:]"), v3, v5, v10);

}

- (BOOL)setDoubleTapAction:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[6];
  int v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "doubleTapActionRight") - 1;
    if (v6 >= 5)
      v7 = 0xFFFFLL;
    else
      v7 = v6;

    v8 = cbTapActionForBT(v3);
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(v9, "setDoubleTapActionLeft:", v10);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDoubleTapActionRight:", v10);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFeatureValuesWithFeature:", 3);

    v14 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__HPSDevice_setDoubleTapAction___block_invoke;
    block[3] = &unk_1EA29B680;
    v23 = v3;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v14, v13, block);

    LOBYTE(v14) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "classicDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "setDoubleTapAction:", v3);

    sharedBluetoothSettingsLogComponent();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "classicDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "address");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v20;
      v26 = 1024;
      v27 = v3;
      v28 = 1024;
      v29 = v14;
      _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDoubleTapAction:] [BTDevice-Only] btDevice: %@, inputAction:%i, resultValue:%i", buf, 0x18u);

    }
  }
  return v14;
}

void __32__HPSDevice_setDoubleTapAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "doubleTapAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setDoubleTapAction:]"), v3, v5, v10);

}

- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
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
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];
  id v34;
  id v35;
  unsigned int v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    *(_DWORD *)buf = 0;
    -[HPSDevice btsDevice](self, "btsDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleTapActionEx:rightAction:", buf, &v36);

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = cbTapActionForBT(v5);
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDoubleTapActionLeft:", v17);

    v19 = cbTapActionForBT(v4);
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDoubleTapActionRight:", v19);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateFeatureValuesWithFeature:", 3);

    v22 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HPSDevice_setDoubleTapActionEx_rightAction___block_invoke;
    block[3] = &unk_1EA29B018;
    block[4] = self;
    v34 = v10;
    v35 = v16;
    v24 = v16;
    v25 = v10;
    dispatch_after(v22, v23, block);

    LOBYTE(v25) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "classicDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v27, "setDoubleTapActionEx:rightAction:", v5, v4);

    sharedBluetoothSettingsLogComponent();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "classicDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "address");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = v31;
      v39 = 1024;
      v40 = v5;
      v41 = 1024;
      v42 = v4;
      v43 = 1024;
      v44 = (int)v25;
      _os_log_impl(&dword_1DB30C000, v28, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDoubleTapActionEx:rightAction:] [BTDevice-Only] btDevice: %@, inputLeftAction:%i, inputRightAction:%i, returnValue:%i", buf, 0x1Eu);

    }
  }
  return (char)v25;
}

void __46__HPSDevice_setDoubleTapActionEx_rightAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleTapActionEx:rightAction:", (char *)&v8 + 4, &v8);

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setDoubleTapActionEx:rightAction:]"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
}

- (BOOL)setListeningModeConfigs:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  int v20;
  int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "listeningModeConfigs");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setListeningModeConfigs:", v3);

    v8 = objc_opt_new();
    -[NSObject setListeningModeConfigs:](v8, "setListeningModeConfigs:", v3);
    v9 = (void *)objc_opt_new();
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cbDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __37__HPSDevice_setListeningModeConfigs___block_invoke;
    v19[3] = &unk_1EA29B6A8;
    v19[4] = self;
    v20 = v3;
    v21 = v12;
    objc_msgSend(v9, "modifyDevice:settings:completion:", v11, v8, v19);

    LOBYTE(v12) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "setListeningModeConfigs:", v3);

    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v17;
      v24 = 1024;
      v25 = v3;
      v26 = 1024;
      v27 = v12;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningModeConfigs:] [BTDevice-Only] btDevice: %@, inputModeConfigs:%i, returnValue:%i", buf, 0x18u);

    }
  }

  return v12;
}

void __37__HPSDevice_setListeningModeConfigs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringValue](v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "listeningModeConfigs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setListeningModeConfigs:]"), v5, v8, v13);

    goto LABEL_5;
  }
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: setListeningModeConfigs: unable to modify modeCofig %@", (uint8_t *)&v14, 0xCu);
LABEL_5:

  }
}

- (BOOL)setMicMode:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  int v21;
  unsigned int v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    v5 = -[HPSDevice micMode](self, "micMode");
    LOBYTE(v6) = 1;
    if ((_DWORD)v3 == 2)
      v7 = 2;
    else
      v7 = 1;
    if ((_DWORD)v3 == 1)
      v8 = 3;
    else
      v8 = v7;
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMicrophoneMode:", v8);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateFeatureValuesWithFeature:", 7);

    v11 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __24__HPSDevice_setMicMode___block_invoke;
    v20[3] = &unk_1EA29A798;
    v20[4] = self;
    v21 = v3;
    v22 = v5;
    dispatch_after(v11, v12, v20);

  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v14, "setMicMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v18;
      v25 = 1024;
      v26 = v3;
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setMicMode:] [BTDevice-Only] btDevice: %@, inputMode:%i, returnValue:%i", buf, 0x18u);

    }
  }
  return v6;
}

void __24__HPSDevice_setMicMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v8, "micMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setMicMode:]"), v3, v5, v10);

}

- (BOOL)setSmartRouteMode:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[6];
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "smartRouteMode");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSmartRoutingMode:", (char)v3);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFeatureValuesWithFeature:", 6);

    v11 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__HPSDevice_setSmartRouteMode___block_invoke;
    block[3] = &unk_1EA29B6D0;
    v20 = v3;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v11, v10, block);

    LOBYTE(v11) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "setSmartRouteMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v17;
      v23 = 1024;
      v24 = v3;
      v25 = 1024;
      v26 = v11;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSmartRouteMode:] [BTDevice-Only] btDevice: %@, inputSRMode:%i, returnValue:%i", buf, 0x18u);

    }
  }
  return v11;
}

void __31__HPSDevice_setSmartRouteMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "smartRouteMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setSmartRouteMode:]"), v3, v5, v10);

}

- (unsigned)smartRouteMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "smartRouteMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "smartRoutingMode");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[smartRouteMode]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [smartRouteMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return v5;
}

- (BOOL)smartRouteSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "smartRouteSupport");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsFeatureWithFeature:", 6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[smartRouteSupport]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [smartRouteSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return (char)v5;
}

- (unsigned)vendorId
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "vendorId");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "vendorID");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[vendorId]"), v10, v12);

  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v8) = v5;
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [vendorId] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
    else
    {
      LODWORD(v8) = v5;
    }

  }
  return v8;
}

- (BOOL)connected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "connected");

  if (self->_ffValue && self->_headphoneDevice)
  {
    objc_msgSend(MEMORY[0x1E0D289E0], "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedHeadphones");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice address](self, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[connected]"), v12, v14);

    LOBYTE(v5) = v11;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 1024;
      v23 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [connected] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v20, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)featureCapability:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "featureCapability:", v3);

  if (self->_ffValue && self->_headphoneDevice)
  {
    switch((_DWORD)v3)
    {
      case 0x1C:
        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cbDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "autoAncCapability") == 1)
        {
          v13 = 1;
        }
        else
        {
          -[HPSDevice headphoneDevice](self, "headphoneDevice");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v20, "supportsFeatureWithFeature:", 1);

        }
        v14 = CFSTR("FEATURE_LISTENING_MODE_CYCLABLE");
        break;
      case 0x20:
        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "supportsFeatureWithFeature:", 6);
        v14 = CFSTR("FEATURE_TIPI");
        break;
      case 0x1E:
        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "productInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "flags");

        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "supportsFeatureWithFeature:", 2);
        if ((v10 & 8) != 0)
          v13 = 0;
        else
          v13 = v12;
        v14 = CFSTR("FEATURE_CLICK_HOLD");
        break;
      default:
        -[HPSDevice featureCapability:].cold.1();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:", CFSTR("[featureCapability:]"), v14, v21, v23);

    LOBYTE(v7) = v13;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v18;
      v27 = 1024;
      v28 = v3;
      v29 = 1024;
      v30 = (int)v7;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [featureCapability:] [BTDevice-Only] btDevice: %@, inputFeaturet:%i, returnValue:%i", (uint8_t *)&v25, 0x18u);

    }
  }
  return (char)v7;
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "btAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[identifier]"), v4, v7);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "classicDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [identifier] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v13, 0x16u);

    }
    v7 = v4;
  }

  return v7;
}

- (unsigned)listeningMode
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "listeningMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "listeningMode");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringValue](v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[listeningMode]"), v9, v11);

  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = v5;
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = v5;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [listeningMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
    else
    {
      LODWORD(v7) = v5;
    }
  }

  return v7;
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[name]"), v4, v6);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "classicDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [name] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v12, 0x16u);

    }
    v6 = v4;
  }

  return v6;
}

- (BOOL)setListeningMode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  NSObject *v34;
  _BYTE *v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _BYTE buf[24];
  char v44;
  uint64_t v45;

  v3 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "listeningMode");

    v8 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v44 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 1;
    dispatch_group_enter(v8);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setListeningMode:", v3);
    v10 = (void *)objc_opt_new();
    dispatch_get_global_queue(0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDispatchQueue:", v11);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIsUpdatingDeviceConfig:", 1);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setListeningMode:", v3);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cbDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __30__HPSDevice_setListeningMode___block_invoke;
    v33[3] = &unk_1EA29B6F8;
    v33[4] = self;
    v35 = buf;
    v38 = v3;
    v36 = &v39;
    v37 = v7;
    v16 = v8;
    v34 = v16;
    objc_msgSend(v10, "modifyDevice:settings:completion:", v15, v9, v33);

    v17 = dispatch_time(0, 100000000);
    dispatch_group_wait(v16, v17);
    if (*((_BYTE *)v40 + 24))
    {
      sharedBluetoothSettingsLogComponent();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[HPSDevice setListeningMode:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    }
    LOBYTE(v26) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "classicDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v28, "setListeningMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "classicDevice");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "address");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v3;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v26;
      _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningMode:] [BTDevice-Only] btDevice: %@, inputMode:%i, returnValue:%i", buf, 0x18u);

    }
  }

  return v26;
}

void __30__HPSDevice_setListeningMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD block[6];
  int v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = *(unsigned int *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setListeningMode:", v4);

    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningMode]: unable to modify mode %@", buf, 0xCu);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__HPSDevice_setListeningMode___block_invoke_107;
    block[3] = &unk_1EA29B680;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = *(_DWORD *)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 64);
    block[4] = v9;
    block[5] = v10;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  objc_msgSend(*(id *)(a1 + 32), "headphoneDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsUpdatingDeviceConfig:", 0);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __30__HPSDevice_setListeningMode___block_invoke_107(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "headphoneDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cbDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "listeningMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("setListeningMode:"), v3, v5, v10);

}

- (void)disconnect
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "classicDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "connected");

    v6 = objc_opt_new();
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cbDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPeerDevice:](v6, "setPeerDevice:", v8);

    -[NSObject setServiceFlags:](v6, "setServiceFlags:", 0xFFFFFFFFLL);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __23__HPSDevice_disconnect__block_invoke;
    v11[3] = &unk_1EA29B6A8;
    v11[4] = self;
    v11[5] = v5;
    -[NSObject disconnectWithCompletion:](v6, "disconnectWithCompletion:", v11);
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "disconnect");

    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [disconnect] [BTDevice-Only] btDevice: %@", buf, 0xCu);

    }
  }

}

void __23__HPSDevice_disconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __23__HPSDevice_disconnect__block_invoke_cold_1(v3);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(&unk_1EA2B5018, "stringValue");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "connected"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setListeningMode:]"), v4, v7, v12);

  }
}

- (BOOL)paired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "paired");

  if (self->_ffValue && self->_headphoneDevice)
  {
    objc_msgSend(MEMORY[0x1E0D289E0], "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectedHeadphones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice address](self, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[paired]"), v11, v13);

    LOBYTE(v4) = v10;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v17;
      v21 = 1024;
      v22 = (int)v4;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [paired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v19, 0x12u);

    }
  }
  return (char)v4;
}

- (id)productName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cbDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "productName");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[productName]"), v4, v7);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "classicDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [productName] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v13, 0x16u);

    }
    v7 = v4;
  }

  return v7;
}

- (void)unpair
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "classicDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "paired");

    v6 = objc_opt_new();
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cbDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __19__HPSDevice_unpair__block_invoke;
    v11[3] = &unk_1EA29B6A8;
    v11[4] = self;
    v11[5] = v5;
    -[NSObject deleteDevice:completion:](v6, "deleteDevice:completion:", v8, v11);

  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unpair");

    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [unpair] [BTDevice-Only] btDevice: %@", buf, 0xCu);

    }
  }

}

void __19__HPSDevice_unpair__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (v3)
  {
    sharedBluetoothSettingsLogComponent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __19__HPSDevice_unpair__block_invoke_cold_1(v3);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(&unk_1EA2B5018, "stringValue");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithBool:", objc_msgSend(v10, "paired"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[unpair]"), v4, v7, v12);

  }
}

- (unsigned)doubleTapCapability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "doubleTapCapability");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "doubleTapCapability");
    if (v8 == 3)
      v9 = 2;
    else
      v9 = v8 == 2;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[doubleTapCapability]"), v10, v12);

    LODWORD(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [doubleTapCapability] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return v5;
}

- (unsigned)getConversationDetectMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getConversationDetectMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conversationDetect"))
      v7 = 1;
    else
      v7 = 2;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getConversationDetectMode]"), v8, v10);

    LOBYTE(v5) = v7;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "classicDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "address");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 1024;
      v19 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v11, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getConversationDetectMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v16, 0x12u);

    }
  }
  return v5;
}

- (void)setDeviceAdaptiveVolumeMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  int v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getDeviceAdaptiveVolumeMode");

    -[HPSDevice setAdaptiveVolumeMode:](self, "setAdaptiveVolumeMode:", v3);
    v8 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__HPSDevice_setDeviceAdaptiveVolumeMode___block_invoke;
    v16[3] = &unk_1EA29B630;
    v16[4] = self;
    v17 = v3;
    v18 = v7;
    dispatch_after(v8, v9, v16);

  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeviceAdaptiveVolumeMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      v21 = 1024;
      v22 = v3;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setDeviceAdaptiveVolumeMode:] [BTDevice-Only] btDevice: %@, volMode:%i", buf, 0x12u);

    }
  }
}

void __41__HPSDevice_setDeviceAdaptiveVolumeMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a1 + 44));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedChar:", objc_msgSend(v8, "getDeviceAdaptiveVolumeMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setDeviceAdaptiveVolumeMode:]"), v3, v5, v10);

}

- (BOOL)setUserName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_ffValue && self->_headphoneDevice)
  {
    v6 = v4;
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v6);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFeatureValuesWithFeature:", 0);

    v10 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__HPSDevice_setUserName___block_invoke;
    block[3] = &unk_1EA29B018;
    block[4] = self;
    v22 = v6;
    v23 = v14;
    v12 = v14;
    v13 = v6;
    dispatch_after(v10, v11, block);

    LOBYTE(v14) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "classicDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "setUserName:", v5);

    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "classicDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "address");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v19;
      v26 = 2112;
      v27 = v5;
      v28 = 1024;
      v29 = (int)v14;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setUserName:] [BTDevice-Only] btDevice: %@, inputName:%@ didSet:%i", buf, 0x1Cu);

    }
  }

  return (char)v14;
}

void __25__HPSDevice_setUserName___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  objc_msgSend(v1, "btsDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setUserName:]"), v2, v3, v4);

}

- (BOOL)setInEarDetectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  BOOL v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "inEarDetectEnabled");

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInEarDetection:", v3);

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFeatureValuesWithFeature:", 5);

    v10 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __35__HPSDevice_setInEarDetectEnabled___block_invoke;
    v20[3] = &unk_1EA29B720;
    v20[4] = self;
    v21 = v3;
    v22 = v7;
    dispatch_after(v10, v11, v20);

    LOBYTE(v12) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "setInEarDetectEnabled:", v3);

    sharedBluetoothSettingsLogComponent();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v18;
      v25 = 1024;
      v26 = v3;
      v27 = 1024;
      v28 = v12;
      _os_log_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setInEarDetectEnabled:] [BTDevice-Only] btDevice: %@, inputEnabled:%i, returnValue:%i", buf, 0x18u);

    }
  }
  return v12;
}

void __35__HPSDevice_setInEarDetectEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithBool:", objc_msgSend(v8, "inEarDetectEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setInEarDetectEnabled:]"), v3, v5, v10);

}

- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig
{
  HPSDevice *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v2 = self;
  v24 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getCallManagementConfig");

  v6 = BYTE6(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v5, BYTE2(v5), BYTE4(v5), BYTE6(v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_ffValue && v2->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](v2, "headphoneDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cbDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v11, "muteControlCapability");

    -[HPSDevice headphoneDevice](v2, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "endCallGesture");
    LODWORD(v11) = v10;
    if ((_DWORD)v5)
    {
      -[HPSDevice headphoneDevice](v2, "headphoneDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "muteControlGesture");

      LODWORD(v12) = 0;
    }
    else
    {
      v6 = 0;
      LODWORD(v12) = v10;
      LODWORD(v11) = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v5, v12, v11, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](v2, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getCallManagementConfig]"), v7, v17);

    v18 = 0;
    LOBYTE(v17) = 0;
    LOBYTE(v2) = 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](v2, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getCallManagementConfig] [BTDevice-Only] btDevice: %@, returnValue:%@", buf, 0x16u);

    }
    v2 = (HPSDevice *)(v5 >> 8);
    v12 = (void *)(v5 >> 16);
    v17 = (void *)(v5 >> 24);
    v11 = (void *)(HIDWORD(v5) & 0xFFFFFF);
    v18 = BYTE5(v5);
  }

  return ($70344DAF05348A783186C1CF166707C1)(((unint64_t)v18 << 40) | (v6 << 48) | ((unint64_t)v11 << 32) | ((unint64_t)v17 << 24) | ((unint64_t)v12 << 16) | ((unint64_t)v2 << 8) | v5);
}

- (BOOL)setCallConfig:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  _QWORD block[5];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3.var0;
  v33 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getCallManagementConfig");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v7, BYTE2(v7), BYTE4(v7), BYTE6(v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v3, BYTE2(v3), BYTE4(v3), BYTE6(v3));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((_BYTE)v3)
    {
      objc_msgSend(v10, "setEndCallGesture:", BYTE4(v3));

      -[HPSDevice headphoneDevice](self, "headphoneDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMuteControlGesture:", BYTE6(v3));
    }
    else
    {
      objc_msgSend(v10, "setEndCallGesture:", BYTE2(v3));
    }

    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateFeatureValuesWithFeature:", 17);

    v20 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__HPSDevice_setCallConfig___block_invoke;
    block[3] = &unk_1EA29B018;
    block[4] = self;
    v25 = v9;
    v26 = v8;
    v22 = v8;
    v14 = v9;
    dispatch_after(v20, v21, block);

    LOBYTE(v9) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v13, "setCallConfig:", v3 & 0xFFFFFFFFFFFFFFLL);

    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "address");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v3, BYTE2(v3), BYTE4(v3), (v3 & 0xFFFFFFFFFFFFFFuLL) >> 48);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      v31 = 1024;
      v32 = (int)v9;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setCallConfig:] [BTDevice-Only] btDevice: %@, inputConfig:%@, returnValue:%i", buf, 0x1Cu);

    }
  }

  return (char)v9;
}

void __27__HPSDevice_setCallConfig___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  objc_msgSend(v1, "btsDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getCallManagementConfig");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n version: %i  \nstatus: NA \nendCall: %i \nendCallStatus: NA \nendCallConfig: %i \nmuteControlStatus: NA \nmuteControlConfig: %i \n"), v5, BYTE2(v5), BYTE4(v5), BYTE6(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("[setCallConfig:]"), v2, v3, v6);

}

- (BOOL)isTemporaryPaired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "isTemporaryPaired");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceFlags");

    v9 = (v8 >> 25) & 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[isTemporaryPaired]"), v10, v12);

    LOBYTE(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isTemporaryPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)magicPaired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "magicPaired");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceFlags");

    v9 = (v8 >> 1) & 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[magicPaired]"), v10, v12);

    LOBYTE(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [magicPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)getDeviceSoundProfileAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getDeviceSoundProfileAllowed");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceFlags");

    v9 = (v8 >> 28) & 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getDeviceSoundProfileAllowed]"), v10, v12);

    LOBYTE(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceSoundProfileAllowed] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return (char)v5;
}

- (BOOL)cloudPaired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "cloudPaired");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cbDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceFlags");

    v8 = (v7 >> 15) & 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[cloudPaired]"), v9, v11);

    LOBYTE(v4) = v8;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classicDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v15;
      v19 = 1024;
      v20 = (int)v4;
      _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [cloudPaired] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v17, 0x12u);

    }
  }
  return (char)v4;
}

- (int)autoAnswerMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "autoAnswerMode");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceFlags");

    if (v8 < 0)
      v9 = 1;
    else
      v9 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[autoAnswerMode]"), v10, v12);

    LODWORD(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [autoAnswerMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return (int)v5;
}

- (BOOL)setAutoAnswerMode:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  int v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "autoAnswerMode") != 0;

    v8 = objc_opt_new();
    -[NSObject setDeviceFlagsMask:](v8, "setDeviceFlagsMask:", 0x80000000);
    -[NSObject setDeviceFlagsValue:](v8, "setDeviceFlagsValue:", (unint64_t)((_DWORD)v3 == 1) << 31);
    v11 = (void *)objc_opt_new();
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cbDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __31__HPSDevice_setAutoAnswerMode___block_invoke;
    v18[3] = &unk_1EA29B748;
    v18[4] = self;
    v19 = v3;
    v20 = v7;
    objc_msgSend(v11, "modifyDevice:settings:completion:", v10, v8, v18);

    LOBYTE(v11) = 1;
  }
  else
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "classicDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "setAutoAnswerMode:", v3);

    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v16;
      v23 = 1024;
      v24 = v3;
      v25 = 1024;
      v26 = (int)v11;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setAutoAnswerMode:] [BTDevice-Only] btDevice: %@, inputMode:%i didSet:%i", buf, 0x18u);

    }
  }

  return (char)v11;
}

void __31__HPSDevice_setAutoAnswerMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringValue](v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "autoAnswerMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_logSetterExpectationFormatStringForUsecase:inputValue:existingValue:readBackValue:", CFSTR("setAutoAnswerMode:"), v5, v8, v13);

    goto LABEL_5;
  }
  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setListeningModeConfigs]: unable to modify modeCofig %@", (uint8_t *)&v14, 0xCu);
LABEL_5:

  }
}

- (unsigned)getSpatialAudioPlatformSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "getSpatialAudioPlatformSupport");

  if (self->_ffValue && self->_headphoneDevice)
  {
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cbDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "deviceFlags");

    if ((v8 & 0x10000000) != 0)
      v9 = 1;
    else
      v9 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSDevice _logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:btsDeviceValue:headphoneDeviceValue:", CFSTR("[getSpatialAudioPlatformSupport]"), v10, v12);

    LOBYTE(v5) = v9;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HPSDevice btsDevice](self, "btsDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v16;
      v20 = 1024;
      v21 = (int)v5;
      _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getSpatialAudioPlatformSupport] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v18, 0x12u);

    }
  }
  return v5;
}

- (int)accessorySettingFeatureBitMask
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "allowReplayAccessory") & 1) != 0)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[HPSDevice headphoneDevice](self, "headphoneDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "accessorySettingFeatureBitMask");

      return v6;
    }
  }
  else
  {

  }
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "accessorySettingFeatureBitMask");

  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 1024;
    v17 = v6;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [accessorySettingFeatureBitMask] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v14, 0x12u);

  }
  return v6;
}

- (BOOL)setClickHoldModes:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = *(_QWORD *)&a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  v21 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "classicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "setClickHoldModes:", v4, v3);

  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n rightMode: %i \nleftMode: %i \nprevRightMode: %i \nprevLeftMode: %i \n"), v4, HIDWORD(v4), v3, HIDWORD(v3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setClickHoldModes:] [BTDevice-Only] btDevice: %@, clockHoldModes:%@, result:%i", buf, 0x1Cu);

  }
  return v8;
}

- (unsigned)clickHoldModes:(id *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clickHoldModes:", a3);

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n rightMode: %i \nleftMode: %i \nprevRightMode: %i \nprevLeftMode: %i \n"), *(_QWORD *)&a3->var0, HIDWORD(*(_QWORD *)&a3->var0), *(_QWORD *)&a3->var2, HIDWORD(*(_QWORD *)&a3->var2));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 1024;
    v19 = v7;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [clickHoldModes:] [BTDevice-Only] btDevice: %@, inputModes:%@ returnValue:%i", buf, 0x1Cu);

  }
  return v7;
}

- (int)getDeviceColor:(unsigned int *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  int v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "allowReplayAccessory"))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
    -[HPSDevice headphoneDevice](self, "headphoneDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend(v5, "deviceColor");
  }

LABEL_5:
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "getDeviceColor:", a3);

  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a3;
    v16 = 138412802;
    v17 = v13;
    v18 = 1024;
    v19 = v14;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getDeviceColor:] [BTDevice-Only] btDevice: %@, inColor:%i, returnValue:%i", (uint8_t *)&v16, 0x18u);

  }
  return v9;
}

- (BOOL)getAACPCapabilityBit:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getAACPCapabilityBit:", v3);

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 1024;
    v16 = v3;
    v17 = 1024;
    v18 = v7;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getAACPCapabilityBit:] [BTDevice-Only] btDevice: %@, inputBit:%i, returnValue:%i", (uint8_t *)&v13, 0x18u);

  }
  return v7;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  +[HPSHeadphoneManager sharedInstance](HPSHeadphoneManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowReplayAccessory") & 1) != 0)
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[HPSDevice headphoneDevice](self, "headphoneDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isServiceSupported:", v3);

      return v8;
    }
  }
  else
  {

  }
  -[HPSDevice btsDevice](self, "btsDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "classicDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isServiceSupported:", v3);

  sharedBluetoothSettingsLogComponent();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "classicDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v16;
    v19 = 1024;
    v20 = v3;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_1DB30C000, v13, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isServiceSupported:] ff == off btDevice: %@, inputService:%i didSet:%i", (uint8_t *)&v17, 0x18u);

  }
  return v12;
}

- (id)healthDeviceType
{
  void *v2;
  void *v3;

  -[HPSDevice btsDevice](self, "btsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "healthDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)userSelectedHealthDataSyncConfig
{
  void *v2;
  unsigned __int8 v3;

  -[HPSDevice btsDevice](self, "btsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userSelectedHealthDataSyncConfig");

  return v3;
}

- (void)setUserSelectedHealthDataSyncConfig:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[HPSDevice btsDevice](self, "btsDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserSelectedHealthDataSyncConfig:", v3);

}

- (unsigned)SendSetupCommand:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "SendSetupCommand:", v3);

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v7 != 0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 1024;
    v17 = v9;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [SendSetupCommand:] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v14, 0x12u);

  }
  return v9;
}

- (int)getUserSelectedDeviceType
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getUserSelectedDeviceType");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getUserSelectedDeviceType] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);

  }
  return v5;
}

- (id)accessoryInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [accessoryInfo] [BTDevice-Only] btDevice: %@, returnValue:%@", (uint8_t *)&v11, 0x16u);

  }
  return v5;
}

- (id)getServiceSetting:(unsigned int)a3 key:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getServiceSetting:key:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v13;
    v17 = 1024;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getServiceSetting:key:] [BTDevice-Only] btDevice: %@, serviceID:%i, key:%@, returnVal:%@", (uint8_t *)&v15, 0x26u);

  }
  return v9;
}

- (int)getLowSecurityStatus
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getLowSecurityStatus");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [getLowSecurityStatus] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);

  }
  return v5;
}

- (BOOL)ancsAuthorized
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ancsAuthorized");

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [ancsAuthorized] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);

  }
  return v4;
}

- (BOOL)isFirmwareUpdateRequiredDevice
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirmwareUpdateRequiredDevice");

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isFirmwareUpdateRequiredDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);

  }
  return v4;
}

- (BOOL)isLimitedConnectivityDevice
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLimitedConnectivityDevice");

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isLimitedConnectivityDevice] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);

  }
  return v4;
}

- (void)setANCSAuthorization:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setANCSAuthorization:", v3);

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setANCSAuthorization:] [BTDevice-Only] btDevice: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (BOOL)supportsANCS
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsANCS");

  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "classicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1DB30C000, v5, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [supportsANCS] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v10, 0x12u);

  }
  return v4;
}

- (BOOL)isGuestPairingMode
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isGuestPairingMode");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [isGuestPairingMode] [BTDevice-Only] btDevice: %@, returnValue:%i", (uint8_t *)&v11, 0x12u);

  }
  return v5;
}

- (void)setGuestPairingMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGuestPairingMode:", v3);

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "classicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setGuestPairingMode:] [BTDevice-Only] btDevice: %@, mode:%i", (uint8_t *)&v11, 0x12u);

  }
}

- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[HPSDevice btsDevice](self, "btsDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "classicDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceSetting:key:value:", v6, v8, v9);

  sharedBluetoothSettingsLogComponent();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "classicDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "address");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v15;
    v18 = 1024;
    v19 = v6;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1DB30C000, v12, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setServiceSetting:key:value:] [BTDevice-Only] btDevice: %@, serviceID:%i, key:%@, value:%@", (uint8_t *)&v16, 0x26u);

  }
}

- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSyncGroup:enabled:", v5, v4);

  sharedBluetoothSettingsLogComponent();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classicDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v12;
    v15 = 1024;
    v16 = v5;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_1DB30C000, v9, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSyncGroup:enabled:] [BTDevice-Only] btDevice: %@, inputSyncGroup:%i, inputEnabled:%i", (uint8_t *)&v13, 0x18u);

  }
}

- (void)setSyncSettings:(id)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3.var0;
  v16 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSyncSettings:", v3 & 0xFFFFFFFFFFLL);

  sharedBluetoothSettingsLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "classicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n supported: %i \nenabled: %i \nfavorites: %i \nrecents: %i \nuserPermissionGranted: %i \n"), v3 & 1, (v3 >> 8) & 1, WORD1(v3) & 1, BYTE3(v3) & 1, HIDWORD(v3) & 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1DB30C000, v7, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setSyncSettings:] [BTDevice-Only] btDevice: %@, inputSettings:%@", buf, 0x16u);

  }
}

- (BOOL)setUserSelectedDeviceType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "setUserSelectedDeviceType:", v3);

  sharedBluetoothSettingsLogComponent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "classicDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 1024;
    v16 = v3;
    v17 = 1024;
    v18 = v7;
    _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [setUserSelectedDeviceType:] [BTDevice-Only] btDevice: %@, inputType:%i didSet:%i", (uint8_t *)&v13, 0x18u);

  }
  return v7;
}

- (id)syncGroups
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [syncGroups] [BTDevice-Only] btDevice: %@, value:%@", (uint8_t *)&v11, 0x16u);

  }
  return v5;
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HPSDevice btsDevice](self, "btsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "syncSettings");

  sharedBluetoothSettingsLogComponent();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HPSDevice btsDevice](self, "btsDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "classicDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n supported: %i \nenabled: %i \nfavorites: %i \nrecents: %i \nuserPermissionGranted: %i \n"), v5 & 1, (v5 >> 8) & 1, WORD1(v5) & 1, BYTE3(v5) & 1, HIDWORD(v5) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: [syncSettings] [BTDevice-Only] btDevice: %@, value:%@", buf, 0x16u);

  }
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)v5;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HPSDevice btsDevice](self, "btsDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDevice headphoneDevice](self, "headphoneDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDevice address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSDevice name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> btsDevice:%@ headphoneDevice:%@  address:%@  name:%@"), v4, self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BTSDevice)btsDevice
{
  BTSDevice *btsDevice;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!self->_ffValue)
  {
    if (self->_headphoneDevice)
    {
      btsDevice = self->_btsDevice;
      if (!btsDevice
        || (-[BTSDevice classicDevice](btsDevice, "classicDevice"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v5,
            !v5))
      {
        sharedBluetoothSettingsLogComponent();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[HPSDevice btsDevice].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

      }
    }
  }
  return self->_btsDevice;
}

- (HPMHeadphoneDevice)headphoneDevice
{
  return self->_headphoneDevice;
}

- (void)_logExpectationFormatStringForUsecase:(id)a3 btsDeviceValue:(id)a4 headphoneDeviceValue:(id)a5
{
  -[HPSDevice _logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:](self, "_logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:", a3, CFSTR("NA"), a4, a5);
}

- (void)_logExpectationFormatStringForUsecase:(id)a3 queryValue:(id)a4 btsDeviceValue:(id)a5 headphoneDeviceValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_ffValue || !self->_headphoneDevice)
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[HPSDevice _logExpectationFormatStringForUsecase:queryValue:btsDeviceValue:headphoneDeviceValue:].cold.1(self, v14);

    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
    {
      sharedBluetoothSettingsLogComponent();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[HPSDevice btsDevice](self, "btsDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "classicDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "address");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138413570;
        v21 = v10;
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v18;
        v30 = 2112;
        v31 = v19;
        _os_log_error_impl(&dword_1DB30C000, v15, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: %@, [Query]=%@, btsDevice.value: %@, headphoneDevice.value:%@, btsDevice:%@, headphoneDevice:%@", (uint8_t *)&v20, 0x3Eu);

      }
    }
  }

}

- (void)_logSetterExpectationFormatStringForUsecase:(id)a3 inputValue:(id)a4 existingValue:(id)a5 readBackValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (self->_ffValue || !self->_headphoneDevice)
  {
    sharedBluetoothSettingsLogComponent();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D289E0], "shared");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "connectedHeadphones");
      v25 = v12;
      v16 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSDevice headphoneDevice](self, "headphoneDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSDevice headphoneDevice](self, "headphoneDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cbDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = v17;
      v28 = 2048;
      v29 = v18;
      v30 = 2048;
      v31 = v20;
      _os_log_impl(&dword_1DB30C000, v14, OS_LOG_TYPE_DEFAULT, "HeadphoneInfrastructureReDesign: State log connected: %@ , headphoneDevice: %p, cbDevice: %p", buf, 0x20u);

      v10 = v16;
      v12 = v25;

    }
    if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) == 0)
    {
      sharedBluetoothSettingsLogComponent();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[HPSDevice btsDevice](self, "btsDevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HPSDevice headphoneDevice](self, "headphoneDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v27 = v10;
        v28 = 2112;
        v29 = v11;
        v30 = 2112;
        v31 = v12;
        v32 = 2112;
        v33 = v13;
        v34 = 2112;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        _os_log_error_impl(&dword_1DB30C000, v21, OS_LOG_TYPE_ERROR, "HeadphoneInfrastructureReDesign: %@, input.value: %@, existing.value: %@, readback.value: %@, btsDevice:%@, headphoneDevice:%@", buf, 0x3Eu);

      }
    }
  }

}

+ (id)deviceKey
{
  return CFSTR("hps-device-key");
}

- (BOOL)isManagedByWallet
{
  return self->managedByWallet;
}

- (void)setManagedByWallet:(BOOL)a3
{
  self->managedByWallet = a3;
}

- (BOOL)isManagedByAliroWallet
{
  return self->managedByAliroWallet;
}

- (void)setManagedByAliroWallet:(BOOL)a3
{
  self->managedByAliroWallet = a3;
}

- (BOOL)doesSupportBackgroundNI
{
  return self->supportsBackgroundNI;
}

- (void)setSupportsBackgroundNI:(BOOL)a3
{
  self->supportsBackgroundNI = a3;
}

- (BOOL)isCTKDDevice
{
  return self->ctkdDevice;
}

- (void)setCtkdDevice:(BOOL)a3
{
  self->ctkdDevice = a3;
}

- (void)setHeadphoneDevice:(id)a3
{
  objc_storeStrong((id *)&self->_headphoneDevice, a3);
}

- (void)setBtsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_btsDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btsDevice, 0);
  objc_storeStrong((id *)&self->_headphoneDevice, 0);
}

- (void)initWithHeadphoneDevice:btsDevice:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0D289E0], "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "connectedHeadphones");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DB30C000, v2, v3, "HeadphoneInfrastructureReDesign: unable to get headphoneDevice falling back to [BTDevice-Only]! %@", v4, v5, v6, v7, 2u);

}

- (void)featureCapability:.cold.1()
{
  __assert_rtn("-[HPSDevice featureCapability:]", "HPSDevice.m", 760, "0");
}

- (void)setListeningMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "HeadphoneInfrastructureReDesign: [setListeningMode:] timed out!", a5, a6, a7, a8, 0);
}

void __23__HPSDevice_disconnect__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DB30C000, v2, v3, "HeadphoneInfrastructureReDesign: [disconnect] Failed! %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

void __19__HPSDevice_unpair__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1DB30C000, v2, v3, "HeadphoneInfrastructureReDesign: [unpair] Failed! %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)btsDevice
{
  OUTLINED_FUNCTION_0(&dword_1DB30C000, a1, a3, "HeadphoneInfrastructureReDesign: btsDevice not found for ff off case!", a5, a6, a7, a8, 0);
}

- (void)_logExpectationFormatStringForUsecase:(void *)a1 queryValue:(NSObject *)a2 btsDeviceValue:headphoneDeviceValue:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D289E0], "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedHeadphones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "headphoneDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "headphoneDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cbDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1DB30C000, a2, OS_LOG_TYPE_DEBUG, "HeadphoneInfrastructureReDesign: State log connected: %@ , headphoneDevice: %p, cbDevice: %p", (uint8_t *)&v9, 0x20u);

}

@end
