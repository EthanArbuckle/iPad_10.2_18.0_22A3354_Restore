@implementation OSDGrape

- (__MTDevice)_createMTDevice:(unsigned int)a3
{
  uint64_t v3;
  uint64_t Default;
  __MTDevice *v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  _DWORD v15[2];

  v3 = *(_QWORD *)&a3;
  Default = MTDeviceCreateDefault(self, a2);
  if (!Default)
  {
    v13 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15[0]) = 0;
      v10 = "Could not create default MTDevice.";
      v11 = v9;
      v12 = 2;
      goto LABEL_9;
    }
LABEL_6:

    return 0;
  }
  v5 = (__MTDevice *)Default;
  v6 = MTDeviceStart(Default, v3);
  if (v6)
  {
    v7 = v6;
    v8 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 67109120;
      v15[1] = v7;
      v10 = "Unable to start MTDevice with code: %d";
      v11 = v9;
      v12 = 8;
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)v15, v12);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  return v5;
}

- (OSDGrape)init
{
  OSDGrape *v2;
  OSDGrape *v3;
  __MTDevice *v4;
  OSDGrape *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OSDGrape;
  v2 = -[OSDGrape init](&v7, "init");
  v3 = v2;
  if (v2 && (v4 = -[OSDGrape _createMTDevice:](v2, "_createMTDevice:", 268435457), (v3->_grapeDevice = v4) == 0))
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (void)dealloc
{
  __MTDevice *grapeDevice;
  objc_super v4;

  grapeDevice = self->_grapeDevice;
  if (grapeDevice)
    MTDeviceRelease(grapeDevice, a2);
  v4.receiver = self;
  v4.super_class = (Class)OSDGrape;
  -[OSDGrape dealloc](&v4, "dealloc");
}

- (BOOL)_refreshGrapeProperties
{
  io_registry_entry_t Service;
  kern_return_t v4;
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  NSString *constructedFirmwareVersion;
  NSString *v9;
  NSString *bcdVersion;
  void *v11;
  uint8_t v13[8];
  CFMutableDictionaryRef properties;

  properties = 0;
  Service = MTDeviceGetService(self->_grapeDevice, a2);
  v4 = IORegistryEntryCreateCFProperties(Service, &properties, 0, 0);
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateCFProperties failure for AppleMultitouchSPI.", v13, 2u);
    }
  }
  else
  {
    v6 = properties;
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](properties, "objectForKeyedSubscript:", CFSTR("Constructed Firmware Version")));
    constructedFirmwareVersion = self->_constructedFirmwareVersion;
    self->_constructedFirmwareVersion = v7;

    v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("bcdVersion")));
    bcdVersion = self->_bcdVersion;
    self->_bcdVersion = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ResetCount")));
    self->_resetCount = (int64_t)objc_msgSend(v11, "integerValue");

  }
  return v4 == 0;
}

- (unsigned)multitouchFirmwareVersion
{
  unsigned int v3;

  v3 = 0;
  MTDeviceGetVersion(self->_grapeDevice, &v3);
  return v3;
}

- (id)constructedFirmwareVersion
{
  -[OSDGrape _refreshGrapeProperties](self, "_refreshGrapeProperties");
  return self->_constructedFirmwareVersion;
}

- (id)bcdVersion
{
  -[OSDGrape _refreshGrapeProperties](self, "_refreshGrapeProperties");
  return self->_bcdVersion;
}

- (int64_t)resetCount
{
  -[OSDGrape _refreshGrapeProperties](self, "_refreshGrapeProperties");
  return self->_resetCount;
}

- (id)orbChipID
{
  void *v3;
  int v5;
  uint64_t v6;
  _BYTE v7[128];

  v5 = 128;
  v6 = 176480;
  -[OSDGrape _setMTReport:payloadBuffer:bufferSize:](self, "_setMTReport:payloadBuffer:bufferSize:", 44, &v6, 8);
  if (-[OSDGrape _getMTReport:payloadBuffer:bufferSize:](self, "_getMTReport:payloadBuffer:bufferSize:", 45, v7, &v5))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v7, 2));
  else
    v3 = 0;
  return v3;
}

- (BOOL)_grapeCriticalErrorDetected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint8_t buf[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDGrape criticalErrorSet:](self, "criticalErrorSet:", &v15));
  v6 = v5;
  if (v5)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D984;
    v11[3] = &unk_100080998;
    v12 = v5;
    v13 = &v16;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);

    v7 = *((_BYTE *)v17 + 24) != 0;
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to read critical errors. Please check grape is powered on", buf, 2u);
    }

    v7 = 1;
    *((_BYTE *)v17 + 24) = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)orbErrorDetected
{
  uint64_t v3;

  v3 = 0;
  return (id)objc_claimAutoreleasedReturnValue(-[OSDGrape criticalErrorSet:](self, "criticalErrorSet:", &v3));
}

- (BOOL)proxErrorDetected
{
  id v3;
  void *v4;
  id v5;
  const __CFString *v7;

  v3 = objc_alloc((Class)NSSet);
  v7 = CFSTR("Prox critical error.");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v3, "initWithArray:", v4);

  LOBYTE(self) = -[OSDGrape _grapeCriticalErrorDetected:](self, "_grapeCriticalErrorDetected:", v5);
  return (char)self;
}

- (BOOL)_getMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int *)a5
{
  int Report;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;

  if (!a5)
    return 0;
  Report = MTDeviceGetReport(self->_grapeDevice, a3, a4, *a5);
  if (Report)
  {
    v6 = Report;
    v7 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v6;
      v11 = 1024;
      v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get MT report with code: %d (0x%x)", (uint8_t *)v10, 0xEu);
    }

    return 0;
  }
  return 1;
}

- (BOOL)_setMTReport:(unsigned __int8)a3 payloadBuffer:(char *)a4 bufferSize:(unsigned int)a5
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;

  v5 = MTDeviceSetReport(self->_grapeDevice, a3, a4, *(_QWORD *)&a5);
  if (v5)
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109376;
      v9[1] = v5;
      v10 = 1024;
      v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to set MT report with code: %d (0x%x)", (uint8_t *)v9, 0xEu);
    }

  }
  return v5 == 0;
}

- (id)criticalErrorSet:(unint64_t *)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  _QWORD v20[14];
  _QWORD v21[14];
  uint8_t buf[4];
  unsigned int v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v18 = 4;
  v19 = 0;
  if (!-[OSDGrape _getMTReport:payloadBuffer:bufferSize:](self, "_getMTReport:payloadBuffer:bufferSize:", 127, &v19, &v18))
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v10 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v12 = "getMTReport failed";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_11;
  }
  if (v18 != 4)
  {
    v13 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = "Unexpected number of bytes returned from MTReport";
    goto LABEL_14;
  }
  if (a3)
    *a3 = v19;
  v6 = DiagnosticLogHandleForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Processing \"0x%x\" for grape critical errors.", buf, 8u);
  }

  v20[0] = CFSTR("EEPROM baseline invalid.");
  v20[1] = CFSTR("EEPROM calibration checksum error.");
  v21[0] = &off_1000B27B8;
  v21[1] = &off_1000B27D0;
  v20[2] = CFSTR("EEPROM calibration invalid.");
  v20[3] = CFSTR("EEPROM header invalid.");
  v21[2] = &off_1000B27E8;
  v21[3] = &off_1000B2800;
  v20[4] = CFSTR("Host refclk not detected.");
  v20[5] = CFSTR("Unknown Error");
  v21[4] = &off_1000B2818;
  v21[5] = &off_1000B2830;
  v20[6] = CFSTR("EEPROM version unsupported.");
  v20[7] = CFSTR("ZEPHYR revert defaults.");
  v21[6] = &off_1000B2848;
  v21[7] = &off_1000B2860;
  v20[8] = CFSTR("Orb offset calibration missing.");
  v20[9] = CFSTR("Orb offset calibration checksum error.");
  v21[8] = &off_1000B2878;
  v21[9] = &off_1000B2890;
  v20[10] = CFSTR("Orb force calibration missing.");
  v20[11] = CFSTR("Orb force calibration checksum error.");
  v21[10] = &off_1000B28A8;
  v21[11] = &off_1000B28C0;
  v20[12] = CFSTR("Orb critical error.");
  v20[13] = CFSTR("Prox critical error.");
  v21[12] = &off_1000B28D8;
  v21[13] = &off_1000B28F0;
  v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 14));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001DF7C;
  v15[3] = &unk_1000809C0;
  v17 = v19;
  v9 = v5;
  v16 = v9;
  -[NSObject enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  v10 = v9;

LABEL_12:
  return v10;
}

- (BOOL)scheduleSystemWake:(unsigned int)a3
{
  char v4;
  __int16 v5;

  v4 = 64;
  v5 = 1000 * a3;
  return -[OSDGrape _setMTReport:payloadBuffer:bufferSize:](self, "_setMTReport:payloadBuffer:bufferSize:", 244, &v4, 3);
}

- (BOOL)isGrapePowered
{
  BOOL v3;

  v3 = 0;
  MTDevicePowerGetEnabled(self->_grapeDevice, &v3);
  return v3;
}

- (void)resetGrape
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;

  v3 = MTDevicePowerSetEnabled(self->_grapeDevice, 0);
  if (v3)
  {
    v4 = v3;
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109120;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Power off : %u", (uint8_t *)&v11, 8u);
    }

  }
  v7 = MTDevicePowerSetEnabled(self->_grapeDevice, 1);
  if (v7)
  {
    v8 = v7;
    v9 = DiagnosticLogHandleForCategory(6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109120;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Power on : %u", (uint8_t *)&v11, 8u);
    }

  }
}

- (void)startStreaming:(void *)a3
{
  __MTDevice *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = -[OSDGrape _createMTDevice:](self, "_createMTDevice:", 0);
  self->_grapeDevice = v5;
  if (v5)
  {
    if (!-[OSDGrape _enableProx:](self, "_enableProx:", 1))
    {
      v6 = DiagnosticLogHandleForCategory(6);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Enabling prox failed", buf, 2u);
      }

    }
    if (!-[OSDGrape _registerForProx:](self, "_registerForProx:", a3))
    {
      v8 = DiagnosticLogHandleForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Registering for prox failed", v10, 2u);
      }

    }
    MTDeviceSetInputDetectionMode(self->_grapeDevice, 1);
    sleep(1u);
    MTDeviceSetZephyrParameter(self->_grapeDevice, 172, 1);
  }
}

- (void)cleanupStreaming:(void *)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;

  MTDeviceSetZephyrParameter(self->_grapeDevice, 172, 0);
  -[OSDGrape _unregisterForProx:](self, "_unregisterForProx:", a3);
  -[OSDGrape _enableProx:](self, "_enableProx:", 0);
  v5 = DiagnosticLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = MTDevicePowerSetEnabled(self->_grapeDevice, 0);
    v11 = 67109120;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Power off status: %u", (uint8_t *)&v11, 8u);
  }

  v8 = DiagnosticLogHandleForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = MTDevicePowerSetEnabled(self->_grapeDevice, 1);
    v11 = 67109120;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Power on status: %u", (uint8_t *)&v11, 8u);
  }

}

- (BOOL)_isProxEnabled
{
  uint64_t v2;
  NSObject *v3;
  unsigned __int8 v5;
  int v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;

  v6 = 0;
  MTDeviceGetReport(self->_grapeDevice, 169, &v5, 1);
  v2 = DiagnosticLogHandleForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v8 = v6;
    v9 = 1024;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reading Prox enabled status %u bytes value is %d", buf, 0xEu);
  }

  return v5 != 0;
}

- (BOOL)_enableProx:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v9;
  uint8_t buf[4];
  _BOOL4 v11;

  v3 = a3;
  v9 = a3;
  if (a3 && -[OSDGrape _isProxEnabled](self, "_isProxEnabled"))
    return 1;
  v6 = DiagnosticLogHandleForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling prox: %d", buf, 8u);
  }

  if (MTDeviceSetReport(self->_grapeDevice, 169, &v9, 1))
    return 0;
  v5 = 1;
  sleep(1u);
  return v5;
}

- (BOOL)_registerForProx:(void *)a3
{
  return MTRegisterImageCallback(self->_grapeDevice, a3, 2147483646, 2);
}

- (BOOL)_unregisterForProx:(void *)a3
{
  return MTUnregisterImageCallback(self->_grapeDevice, a3);
}

- (BOOL)isDoppler
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  unsigned __int8 v5;
  unsigned int v7;
  uint8_t buf[4];
  void *v9;

  v7 = 0;
  MTDeviceGetVersion(self->_grapeDevice, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%x"), v7));
  v3 = DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, " FW version %@", buf, 0xCu);
  }

  v5 = objc_msgSend(v2, "containsString:", CFSTR("d"));
  return v5;
}

- (BOOL)didDopplerErrorOccur
{
  int Report;
  BOOL v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint8_t buf[4];
  int v12;
  _BYTE v13[128];

  Report = MTDeviceGetReport(self->_grapeDevice, 127, v13, 128);
  v3 = Report == 0;
  if (Report)
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v12 = 127;
      v6 = "Unable to get MTReport 0x%x";
      v7 = v5;
      v8 = 8;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ((v13[2] & 8) != 0)
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "Doppler error detected";
      v7 = v5;
      v8 = 2;
      goto LABEL_8;
    }
LABEL_9:

    return v3;
  }
  return 0;
}

- (id)getDopplerError
{
  void *v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[8];
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;

  v12 = 0x94000001C1582CLL;
  v13 = 0;
  v10 = 0x80020001C1582CLL;
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSDGrape getDopplerSiliconVersion](self, "getDopplerSiliconVersion"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("A0")) & 1) != 0)
  {
    v4 = &v12;
LABEL_5:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OSDGrape _getMTReportErrorFromCommandBuffer:length:](self, "_getMTReportErrorFromCommandBuffer:length:", v4, 8));
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TC")) & 1) != 0)
  {
    v4 = &v10;
    goto LABEL_5;
  }
  v6 = DiagnosticLogHandleForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid doppler silicon rev", v9, 2u);
  }

  v5 = 0;
LABEL_9:

  return v5;
}

- (id)getDopplerDataRegister
{
  _BYTE v3[128];

  if (MTDeviceGetReport(self->_grapeDevice, 196, v3, 128))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v3, 0));
}

- (id)_getMTReportErrorFromCommandBuffer:(char *)a3 length:(int)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint8_t buf[4];
  int v17;
  _DWORD v18[34];

  if (MTDeviceSetReport(self->_grapeDevice, *a3, a3 + 1, *(_QWORD *)&a4))
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *a3;
      v18[0] = 67109120;
      v18[1] = v8;
      v9 = "Unable to set MTReport 0x%x";
      v10 = (uint8_t *)v18;
LABEL_12:
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, v10, 8u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if (MTDeviceGetReport(self->_grapeDevice, 45, v18, 128))
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = *a3;
      *(_DWORD *)buf = 67109120;
      v17 = v15;
      v9 = "Unable to get MTReport 0x%x";
      v10 = buf;
      goto LABEL_12;
    }
LABEL_6:

    return 0;
  }
  v13 = DiagnosticLogHandleForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MTReportGet read 0 bytes", buf, 2u);
  }

  return 0;
}

- (id)getDopplerSiliconVersion
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;
  char v15;
  _DWORD v16[34];

  v14 = 0x1000001C1582CLL;
  v15 = 0;
  if (MTDeviceSetReport(self->_grapeDevice, 44, (char *)&v14 + 1, 8))
  {
    v3 = DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 67109120;
      v16[1] = v14;
      v5 = "Unable to set MTReport 0x%x";
      v6 = (uint8_t *)v16;
LABEL_7:
      v8 = v4;
      v9 = 8;
LABEL_8:
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v5, v6, v9);
    }
  }
  else
  {
    if (!MTDeviceGetReport(self->_grapeDevice, 45, v16, 128))
    {
      v10 = DiagnosticLogHandleForCategory(6);
      v4 = objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v5 = "MTReportGet read 0 bytes";
      v6 = buf;
      v8 = v4;
      v9 = 2;
      goto LABEL_8;
    }
    v7 = DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v13 = 45;
      v5 = "Unable to get MTReport 0x%x";
      v6 = buf;
      goto LABEL_7;
    }
  }
LABEL_11:

  return 0;
}

- (unsigned)getDopplerReferenceSignalEvents
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  uint8_t v7[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OSDGrape getDopplerDataRegister](self, "getDopplerDataRegister"));
  if ((unint64_t)objc_msgSend(v2, "length") > 0x20)
  {
    v5 = *((_DWORD *)objc_msgSend(objc_retainAutorelease(v2), "bytes") + 7);
  }
  else
  {
    v3 = DiagnosticLogHandleForCategory(6);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Doppler Data Dump Register invalid length", v7, 2u);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)_setOrbImageFrameType:(int)a3
{
  char v4;

  v4 = a3;
  return MTDeviceSetReport(self->_grapeDevice, 59, &v4, 1) == 0;
}

- (BOOL)setOrbImageGapMode
{
  return -[OSDGrape _setOrbImageFrameType:](self, "_setOrbImageFrameType:", 165);
}

- (BOOL)setOrbImageCapacitanceMode
{
  return -[OSDGrape _setOrbImageFrameType:](self, "_setOrbImageFrameType:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcdVersion, 0);
  objc_storeStrong((id *)&self->_constructedFirmwareVersion, 0);
}

@end
