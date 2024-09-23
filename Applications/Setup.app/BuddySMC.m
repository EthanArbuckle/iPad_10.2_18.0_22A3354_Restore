@implementation BuddySMC

- (BuddySMC)init
{
  uint64_t v2;
  BuddySMC *v3;
  objc_super v5;
  SEL v6;
  id location;

  v6 = a2;
  location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddySMC;
  location = -[BuddySMC init](&v5, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[BuddySMC _connectToService](BuddySMC, "_connectToService");
    objc_msgSend(location, "setPort:", v2);
  }
  v3 = (BuddySMC *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v4;
  os_log_type_t v5;
  os_log_t v6;
  os_log_type_t v7;
  os_log_t oslog;
  int v9;
  int v10;
  io_connect_t connect;
  SEL v12;
  BuddySMC *v13;
  uint8_t v14[16];
  uint8_t buf[8];

  v13 = self;
  v12 = a2;
  connect = -[BuddySMC port](self, "port");
  if (connect)
  {
    v2 = IOConnectCallScalarMethod(-[BuddySMC port](v13, "port"), 1u, 0, 0, 0, 0);
    v9 = v2;
    if ((_DWORD)v2)
    {
      v6 = (os_log_t)(id)_BYLoggingFacility(v2);
      v5 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        sub_100046FA0(v14, v9);
        _os_log_error_impl((void *)&_mh_execute_header, v6, v5, "Failed to close client service: %d", v14, 8u);
      }
      objc_storeStrong((id *)&v6, 0);
    }
    else
    {
      v3 = IOServiceClose(connect);
      v9 = v3;
      if ((_DWORD)v3)
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v3);
        v7 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          sub_100046FA0(buf, v9);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v7, "Failed to close service: %d", buf, 8u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        -[BuddySMC setPort:](v13, "setPort:", 0);
      }
    }
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  v4.receiver = v13;
  v4.super_class = (Class)BuddySMC;
  -[BuddySMC dealloc](&v4, "dealloc");
}

- (BOOL)hasKey:(id)a3
{
  int v4;
  id location[2];
  BuddySMC *v6;
  BOOL v7;
  _BYTE v8[120];

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = 0;
  v7 = -[BuddySMC _valueForKey:outputData:outputSize:](v6, "_valueForKey:outputData:outputSize:", location[0], v8, &v4) == 0;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)numberForKey:(id)a3
{
  id v3;
  os_log_t v5;
  int v6;
  os_log_type_t v7;
  os_log_t oslog;
  int v9;
  int v10;
  id location[2];
  BuddySMC *v12;
  id v13;
  uint8_t v14[32];
  uint8_t buf[32];
  _DWORD v16[30];

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  v3 = (id)-[BuddySMC _valueForKey:outputData:outputSize:](v12, "_valueForKey:outputData:outputSize:", location[0], v16, &v10);
  v9 = (int)v3;
  if ((_DWORD)v3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v7 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000A33AC((uint64_t)buf, (uint64_t)location[0], v9);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v7, "Failed to read key \"%@\": %d", buf, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v13 = 0;
    v6 = 1;
  }
  else
  {
    switch(v10)
    {
      case 1:
        v13 = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", SLOBYTE(v16[0]));
        v6 = 1;
        break;
      case 2:
        v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LOWORD(v16[0]));
        v6 = 1;
        break;
      case 4:
        v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16[0]);
        v6 = 1;
        break;
      default:
        v5 = (os_log_t)(id)_BYLoggingFacility(v3);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          sub_1000A33AC((uint64_t)v14, (uint64_t)location[0], v10);
          _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unsupported value for key \"%@\"; size is %d",
            v14,
            0x12u);
        }
        objc_storeStrong((id *)&v5, 0);
        v13 = 0;
        v6 = 1;
        break;
    }
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (BOOL)writeNumber:(unsigned __int8)a3 forKey:(id)a4
{
  id v4;
  os_log_t oslog;
  int v7;
  int v8;
  id location;
  unsigned __int8 v10;
  SEL v11;
  BuddySMC *v12;
  char v13;
  uint8_t buf[24];

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = (id)-[BuddySMC _writeData:writeDataSize:forKey:](v12, "_writeData:writeDataSize:forKey:", &v10, 1, location);
  v8 = (int)v4;
  if ((_DWORD)v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10019C688((uint64_t)buf, v10, (uint64_t)location, v8);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to write value %u to key \"%@\": %d", buf, 0x18u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v13 = 0;
    v7 = 1;
  }
  else
  {
    v13 = 1;
    v7 = 1;
  }
  objc_storeStrong(&location, 0);
  return v13 & 1;
}

+ (unsigned)_connectToService
{
  const __CFDictionary *v2;
  uint64_t MatchingService;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t v9;
  os_log_type_t v10;
  os_log_t v11;
  kern_return_t v12;
  uint8_t buf[7];
  char v14;
  os_log_t oslog;
  io_connect_t connect;
  io_service_t service;
  SEL v18;
  id v19;
  uint8_t v21[16];
  uint8_t v22[8];

  v19 = a1;
  v18 = a2;
  v2 = IOServiceMatching("AppleSMC");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  service = MatchingService;
  connect = 0;
  if ((_DWORD)MatchingService)
  {
    v12 = IOServiceOpen(service, mach_task_self_, 0, &connect);
    v6 = IOObjectRelease(service);
    if (!v12 && connect)
    {
      v7 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
      v12 = v7;
      if ((_DWORD)v7)
      {
        v9 = (os_log_t)(id)_BYLoggingFacility(v7);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          sub_100046FA0(v21, v12);
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to open client service: %d", v21, 8u);
        }
        objc_storeStrong((id *)&v9, 0);
        return 0;
      }
      else
      {
        return connect;
      }
    }
    else
    {
      v11 = (os_log_t)(id)_BYLoggingFacility(v6);
      v10 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        sub_100046FA0(v22, v12);
        _os_log_error_impl((void *)&_mh_execute_header, v11, v10, "Failed to open service: %d", v22, 8u);
      }
      objc_storeStrong((id *)&v11, 0);
      return 0;
    }
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(MatchingService);
    v14 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v4 = oslog;
      v5 = v14;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "Failed to get matching service", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
}

- (int)_valueForKey:(id)a3 outputData:(void *)a4 outputSize:(unsigned int *)a5
{
  uint64_t v7;
  uint64_t v8;
  os_log_t v10;
  os_log_type_t v11;
  os_log_t v12;
  os_log_type_t v13;
  os_log_t v14;
  int v15;
  os_log_type_t v16;
  os_log_t oslog;
  int v18;
  unint64_t v19;
  size_t outputStructCnt;
  unsigned int v21;
  unsigned int v22;
  unsigned int *v23;
  void *v24;
  id location[2];
  BuddySMC *v26;
  int v27;
  uint8_t v28[32];
  uint8_t v29[32];
  uint8_t v30[32];
  uint8_t buf[24];
  int outputStruct[42];
  _DWORD __b[42];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v23 = a5;
  v22 = -[BuddySMC _stringToKey:](v26, "_stringToKey:", objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String"));
  v21 = 0;
  outputStructCnt = 168;
  v19 = 120;
  memset(__b, 0, sizeof(__b));
  memset(outputStruct, 0, sizeof(outputStruct));
  __b[0] = v22;
  BYTE2(__b[10]) = 9;
  v7 = IOConnectCallStructMethod(-[BuddySMC port](v26, "port"), 2u, __b, 0xA8uLL, outputStruct, &outputStructCnt);
  v18 = v7;
  if ((_DWORD)v7 || LOBYTE(outputStruct[10]))
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v7);
    v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_1000A33AC((uint64_t)buf, (uint64_t)location[0], v18);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v16, "Failed to fetch info for key \"%@\": %d", buf, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v27 = -536870212;
    v15 = 1;
  }
  else
  {
    v21 = outputStruct[7];
    if (v19 >= outputStruct[7])
    {
      if (v23)
        *v23 = v21;
      memset(__b, 0, sizeof(__b));
      memset(outputStruct, 0, sizeof(outputStruct));
      __b[0] = v22;
      __b[7] = v21;
      BYTE2(__b[10]) = 5;
      v8 = IOConnectCallStructMethod(-[BuddySMC port](v26, "port"), 2u, __b, 0xA8uLL, outputStruct, &outputStructCnt);
      v18 = v8;
      if ((_DWORD)v8 || LOBYTE(outputStruct[10]))
      {
        v12 = (os_log_t)(id)_BYLoggingFacility(v8);
        v11 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          sub_1000A33AC((uint64_t)v29, (uint64_t)location[0], v18);
          _os_log_error_impl((void *)&_mh_execute_header, v12, v11, "Failed to read info for key \"%@\": %d", v29, 0x12u);
        }
        objc_storeStrong((id *)&v12, 0);
        if (v18)
          v27 = v18;
        else
          v27 = -536870212;
        v15 = 1;
      }
      else if (v19 >= outputStruct[7])
      {
        __memcpy_chk(v24, &outputStruct[12], v21, -1);
        v27 = v18;
        v15 = 1;
      }
      else
      {
        v10 = (os_log_t)(id)_BYLoggingFacility(v8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          sub_10019CDB8((uint64_t)v28, (uint64_t)location[0], outputStruct[7], v19);
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unexpected size found for key \"%@\" when reading; %u vs %lu",
            v28,
            0x1Cu);
        }
        objc_storeStrong((id *)&v10, 0);
        v27 = -536870206;
        v15 = 1;
      }
    }
    else
    {
      v14 = (os_log_t)(id)_BYLoggingFacility(v7);
      v13 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_10019CDB8((uint64_t)v30, (uint64_t)location[0], outputStruct[7], v19);
        _os_log_error_impl((void *)&_mh_execute_header, v14, v13, "Unexpected size found for key \"%@\" when fetching information; %u vs %lu",
          v30,
          0x1Cu);
      }
      objc_storeStrong((id *)&v14, 0);
      v27 = -536870206;
      v15 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (int)_writeData:(void *)a3 writeDataSize:(unint64_t)a4 forKey:(id)a5
{
  BOOL v5;
  unsigned int v7;
  int i;
  size_t outputStructCnt;
  unsigned int v10;
  id location;
  unint64_t v12;
  _BYTE *v13;
  SEL v14;
  BuddySMC *v15;
  int v16;
  _BYTE outputStruct[80];
  _DWORD __b[20];

  v15 = self;
  v14 = a2;
  v13 = a3;
  v12 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v10 = -[BuddySMC _stringToKey:](v15, "_stringToKey:", objc_msgSend(objc_retainAutorelease(location), "UTF8String"));
  outputStructCnt = 80;
  memset(__b, 0, sizeof(__b));
  memset(outputStruct, 0, sizeof(outputStruct));
  __b[0] = v10;
  BYTE2(__b[10]) = 6;
  __b[7] = v12;
  for (i = 0; ; ++i)
  {
    v5 = 0;
    if (i < 32)
      v5 = i < v12;
    if (!v5)
      break;
    *((_BYTE *)&__b[12] + i) = v13[i];
  }
  v7 = IOConnectCallStructMethod(-[BuddySMC port](v15, "port"), 2u, __b, 0x50uLL, outputStruct, &outputStructCnt);
  if (v7 || outputStruct[40])
  {
    NSLog(CFSTR("Write failed for key '%@' (0x%X, 0x%X)\n"), location, v7, outputStruct[40]);
    v16 = -536870212;
  }
  else
  {
    NSLog(CFSTR("Write succeed for key '%@', value returned = 0x%X"), location, 0);
    v16 = 0;
  }
  objc_storeStrong(&location, 0);
  return v16;
}

- (unsigned)_stringToKey:(const char *)a3
{
  int i;
  unsigned int v5;

  v5 = 0;
  for (i = 0; i < 4; ++i)
    v5 = (v5 << 8) | a3[i];
  return v5;
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned int)a3
{
  self->_port = a3;
}

@end
