@implementation ComponentDisplay

- (BOOL)isPresent
{
  void *v2;
  void *v3;
  BOOL v4;
  __CFDictionary *v5;
  io_service_t MatchingService;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[8];
  int v12;
  int v13;
  _BYTE v14[40];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay serialNumber](self, "serialNumber"));
  v3 = v2;
  if (!v2)
  {
    v5 = IOServiceNameMatching("IODPDevice");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
    }
    else
    {
      v13 = 0;
      if (FindDevicesWithProp("IOService:name", "lcd", (uint64_t)v14, 40, &v13) || !v13)
      {
        v12 = 0;
        if (FindDevicesWithProp("IOService:name", "edp", (uint64_t)v14, 40, &v12))
          v8 = 1;
        else
          v8 = v12 == 0;
        v4 = !v8;
        if (v8)
        {
          v9 = DiagnosticLogHandleForCategory(6);
          v10 = objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v11 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "LCD NOT found.", v11, 2u);
          }

        }
        goto LABEL_8;
      }
    }
    v4 = 1;
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_msgSend(v2, "length") != 0;
LABEL_9:

  return v4;
}

- (BOOL)zoomed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  BOOL v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double *v22;
  int v24;
  uint64_t v25;

  v2 = (void *)MGCopyAnswer(CFSTR("ILaGO+KV5JAOq7Q5GEwbWQ"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("default")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("zoomed")));
  if (objc_msgSend(v3, "count") != (id)4)
    goto LABEL_5;
  if (objc_msgSend(v4, "count") != (id)4)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 3));
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayConfiguration"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceName"));
  v25 = 0;
  IOMobileFramebufferOpenByName(v20, &v25);
  v21 = v25;

  v25 = 0;
  v24 = 0;
  IOMobileFramebufferGetCanvasSizes(v21, &v25, &v24);
  v22 = (double *)(v25 + 16 * (v24 - 1));
  if (*v22 != v7 * v11 || v22[1] != v14 * v17)
LABEL_5:
    v8 = 0;

  return v8;
}

- (void)populateAttributes:(id)a3
{
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
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentDisplay zoomed](self, "zoomed")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v4, CFSTR("isZoomed"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay serialNumber](self, "serialNumber"));
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, CFSTR("serialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay refreshRate](self, "refreshRate"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v7, CFSTR("refreshRate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay retrieveBIMData](self, "retrieveBIMData"));
  if (v8)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v8, CFSTR("BIM"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getTopModuleAuthDict](self, "getTopModuleAuthDict"));
  -[ComponentDisplay setTopModuleAuthDict:](self, "setTopModuleAuthDict:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentDisplay deviceSupportsTopModuleAuth](self, "deviceSupportsTopModuleAuth")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("deviceSupportsTopModuleAuth"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentDisplay topModuleAuthPassed](self, "topModuleAuthPassed")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, CFSTR("authPassed"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay authError](self, "authError"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, CFSTR("authErrorCode"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentDisplay isTrusted](self, "isTrusted")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, CFSTR("isTrusted"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ComponentDisplay isTrustedForUI](self, "isTrustedForUI")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("isTrustedForUI"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleFdrValidationStatus](self, "topModuleFdrValidationStatus"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, CFSTR("fdrValidationStatus"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleAccessoryCertificate](self, "topModuleAccessoryCertificate"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("accessoryCertificate"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleIDSN](self, "topModuleIDSN"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("chipId"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[ComponentDisplay getDeviceCoverGlassCoating](self, "getDeviceCoverGlassCoating")));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("deviceCoverGlassCoating"));

}

- (id)serialNumber
{
  void *v2;
  id v3;

  v2 = (void *)MGCopyAnswer(CFSTR("PxEDp0oOasJ92F/V7YBa8A"), 0);
  if (v2)
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v2, 1);
  else
    v3 = 0;

  return v3;
}

- (int)getDeviceCoverGlassCoating
{
  return MGGetSInt32Answer(CFSTR("DeviceCoverGlassCoating"), 0);
}

- (id)retrieveBIMData
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  unsigned int *p_driverConnect;
  kern_return_t v6;
  kern_return_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  io_object_t eepromService;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;

  v3 = IOServiceMatching("AppleEmbeddedTouchEEPROMDriver");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  self->_eepromService = MatchingService;
  if (MatchingService)
  {
    p_driverConnect = &self->_driverConnect;
    v6 = IOServiceOpen(MatchingService, mach_task_self_, 0, &self->_driverConnect);
    if (v6)
    {
      v7 = v6;
      v8 = DiagnosticLogHandleForCategory(6);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to create the driver connect with error %X", buf, 8u);
      }

      IOObjectRelease(self->_eepromService);
      self->_eepromService = 0;
      return 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay readFactoryDataForRegion:](self, "readFactoryDataForRegion:", 0));
      if (v13)
        v14 = objc_claimAutoreleasedReturnValue(-[ComponentDisplay parseBIMData:](self, "parseBIMData:", v13));
      else
        v14 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay readFactoryDataForRegion:](self, "readFactoryDataForRegion:", 1));
      if (v15)
        v16 = objc_claimAutoreleasedReturnValue(-[ComponentDisplay parseBIMData:](self, "parseBIMData:", v15));
      else
        v16 = 0;
      if (*p_driverConnect)
      {
        IOServiceClose(*p_driverConnect);
        *p_driverConnect = 0;
      }
      eepromService = self->_eepromService;
      if (eepromService)
      {
        IOObjectRelease(eepromService);
        self->_eepromService = 0;
      }
      if (v14 | v16)
      {
        v23[0] = CFSTR("BIM1");
        v18 = dictionaryOrNull((void *)v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v23[1] = CFSTR("BIM2");
        v24[0] = v19;
        v20 = dictionaryOrNull((void *)v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v24[1] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));

      }
      else
      {
        v22 = 0;
      }

      return v22;
    }
  }
  else
  {
    v11 = DiagnosticLogHandleForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "AppleEmbeddedTouchEEPROMDriver";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create the %s service", buf, 0xCu);
    }

    return 0;
  }
}

- (id)readFactoryDataForRegion:(int)a3
{
  void *v5;
  void *v6;
  id v7;
  void *outputStruct;
  void *v9;
  kern_return_t v10;
  kern_return_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t input;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay factoryDataSizeForRegion:](self, "factoryDataSizeForRegion:"));
  v6 = v5;
  if (v5)
  {
    input = a3;
    v7 = objc_msgSend(v5, "unsignedLongValue");
    v22 = v7;
    outputStruct = malloc_type_malloc((size_t)v7, 0xA4E9776FuLL);
    if (outputStruct)
    {
      v9 = outputStruct;
      v10 = IOConnectCallMethod(self->_driverConnect, 1u, &input, 1u, 0, 0, 0, 0, outputStruct, (size_t *)&v22);
      if (v10)
      {
        v11 = v10;
        v12 = DiagnosticLogHandleForCategory(6);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = v11;
        v19 = "IOConnectCallMethod() to read data failed with 0x%08x";
        v20 = v13;
        v21 = 8;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v9, v22));
        if (v14)
          goto LABEL_11;
        v18 = DiagnosticLogHandleForCategory(6);
        v13 = objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_5:

          v14 = 0;
LABEL_11:
          free(v9);
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v19 = "Unable to create NSData from EEPROM read outBuffer";
        v20 = v13;
        v21 = 2;
      }
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      goto LABEL_5;
    }
    v15 = DiagnosticLogHandleForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to malloc %zu bytes", buf, 0xCu);
    }

  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)factoryDataSizeForRegion:(int)a3
{
  kern_return_t v3;
  kern_return_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint32_t outputCnt;
  uint8_t buf[4];
  kern_return_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t output;
  uint64_t input;

  output = 0;
  input = a3;
  outputCnt = 1;
  v3 = IOConnectCallMethod(self->_driverConnect, 2u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      return 0;
    }
    *(_DWORD *)buf = 67109376;
    v14 = v4;
    v15 = 2048;
    v16 = output;
    v9 = "IOConnectCallMethod() failed for get size with 0x%08x. size returned is %llu \n";
    v10 = v6;
    v11 = 18;
LABEL_10:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_3;
  }
  if (!output)
  {
    v8 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_WORD *)buf = 0;
    v9 = "The returned regions size was 0. This device likely has TouchEEPROM FACTORY_DATA misconfigured.";
    v10 = v6;
    v11 = 2;
    goto LABEL_10;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
}

- (id)parseBIMData:(id)a3
{
  uint64_t v4;
  NSObject *v6;
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
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[7];
  _QWORD v30[7];

  if (!a3)
    return 0;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a3, "getBytes:length:", &v24, 32);
  if (v24 == 255 || *(_QWORD *)((char *)&v24 + 2) == -1)
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Invalid BIM data retrieved. This unit likely has not run long enough to have dumped BIM data to the EEPROM.", buf, 2u);
    }
    v15 = 0;
  }
  else
  {
    v29[0] = CFSTR("version");
    v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:"));
    v30[0] = v6;
    v29[1] = CFSTR("header");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", BYTE1(v24)));
    v30[1] = v22;
    v29[2] = CFSTR("timestamp");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)((char *)&v24 + 2)));
    v30[2] = v21;
    v29[3] = CFSTR("scoreMin");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD5(v24)));
    v28[0] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD6(v24)));
    v28[1] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", HIWORD(v24)));
    v28[2] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));
    v30[3] = v17;
    v29[4] = CFSTR("scoreMed");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v25));
    v27[0] = v16;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD1(v25)));
    v27[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD2(v25)));
    v27[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
    v30[4] = v9;
    v29[5] = CFSTR("scoreMax");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD3(v25)));
    v26[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD4(v25)));
    v26[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD5(v25)));
    v26[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
    v30[5] = v13;
    v29[6] = CFSTR("crc");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v25)));
    v30[6] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 7));

  }
  return v15;
}

- (id)getAppleTopModuleAuthClass
{
  if (+[DAComponentUtil IORegistryNameExists:optionalKey:passingValidator:](DAComponentUtil, "IORegistryNameExists:optionalKey:passingValidator:", CFSTR("AppleAuthCPAID"), 0, &stru_100080D20))
  {
    return CFSTR("AppleAuthCPAID");
  }
  else
  {
    return CFSTR("AppleAuthCPRelay");
  }
}

- (id)getTopModuleAuthDict
{
  int v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  NSObject *v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;

  v20 = 0;
  v2 = sub_100002304((__CFArray **)&v20);
  if (v2)
  {
    v3 = v2;
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", buf, 8u);
    }
    v6 = 0;
  }
  else
  {
    v5 = v20;
    v6 = -[NSObject copy](v20, "copy");
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ComponentName"), (_QWORD)v16));
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("TouchController")))
        {
          v14 = v12;

          goto LABEL_16;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (BOOL)deviceSupportsTopModuleAuth
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleAuthDict](self, "topModuleAuthDict"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)topModuleAuthPassed
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleAuthDict](self, "topModuleAuthDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("AuthPassed")));

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToNumber:", &__kCFBooleanTrue);
  else
    v4 = 0;

  return v4;
}

- (id)authError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getAppleTopModuleAuthClass](self, "getAppleTopModuleAuthClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", v2, CFSTR("authError"), 0, &stru_100080D20));

  if (v3)
    v4 = *(unsigned int *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));

  return v5;
}

- (id)topModuleFdrValidationStatus
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getAppleTopModuleAuthClass](self, "getAppleTopModuleAuthClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", v2, CFSTR("FdrValidationStatus"), 0, &stru_100080D20));

  if (v3)
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)isTrusted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleAuthDict](self, "topModuleAuthDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("isTrusted")));

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToNumber:", &__kCFBooleanTrue);
  else
    v4 = 0;

  return v4;
}

- (BOOL)isTrustedForUI
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay topModuleAuthDict](self, "topModuleAuthDict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("isTrustedForUI")));

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToNumber:", &__kCFBooleanTrue);
  else
    v4 = 0;

  return v4;
}

- (id)topModuleAccessoryCertificate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getAppleTopModuleAuthClass](self, "getAppleTopModuleAuthClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryName:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryName:property:optionalKey:classValidator:", v2, CFSTR("AccessoryCertificate"), 0, &stru_100080D20));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)topModuleIDSN
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentDisplay getAppleTopModuleAuthClass](self, "getAppleTopModuleAuthClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", v2, CFSTR("IDSN"), 0, &stru_100080D20));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedStringWithOptions:", 0));
  else
    v4 = 0;
  v5 = stringOrNull(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)refreshRate
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
  objc_msgSend(v2, "refreshRate");
  v4 = v3;

  if (v4 == 0.0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / v4));
  v6 = numberOrNull(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSDictionary)topModuleAuthDict
{
  return self->_topModuleAuthDict;
}

- (void)setTopModuleAuthDict:(id)a3
{
  objc_storeStrong((id *)&self->_topModuleAuthDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topModuleAuthDict, 0);
}

@end
