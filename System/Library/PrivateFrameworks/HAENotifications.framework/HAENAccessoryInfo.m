@implementation HAENAccessoryInfo

+ (id)getAccessoryInfoFromIOAccesoryManager:(id *)a3
{
  NSObject *v4;
  HAENAccessoryInfo *v5;
  NSString *manufacturer;
  NSString *v7;
  id name;
  io_service_t ServiceWithPrimaryPort;
  kern_return_t v10;
  NSObject *v11;
  id v12;
  HAENAccessoryInfo *v13;
  unsigned int v15;
  char *v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  char *v28;
  NSObject *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSString *serialNumber;
  void *v35;
  void *v36;
  NSObject *v37;
  const __CFString *v38;
  uint64_t v39;
  io_connect_t connect;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  HAENAccessoryInfo *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!+[HAENDefaults isRunningCITests](HAENDefaults, "isRunningCITests"))
  {
    connect = 0;
    ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
    if (ServiceWithPrimaryPort)
    {
      v10 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x24BDAEC58], 0, &connect);
      if (!v10)
      {
        v13 = objc_alloc_init(HAENAccessoryInfo);
        v15 = IOAccessoryManagerCopyDeviceInfo();
        if (v15)
        {
          errorForIOKitFailure(v15);
          v16 = (char *)objc_claimAutoreleasedReturnValue();
          HAENotificationsLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v16;
            _os_log_impl(&dword_2144B3000, v17, OS_LOG_TYPE_DEFAULT, "failed to get serial number %@", buf, 0xCu);
          }

          v18 = IOAccessoryManagerCopyDeviceInfo();
          if (v18)
          {
            errorForIOKitFailure(v18);
            v19 = objc_claimAutoreleasedReturnValue();

            HAENotificationsLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (const char *)v19;
              _os_log_impl(&dword_2144B3000, v20, OS_LOG_TYPE_DEFAULT, "failed to get manufacturer %@", buf, 0xCu);
            }
            v16 = (char *)v19;

            v21 = IOAccessoryManagerCopyDeviceInfo();
            if (v21)
            {
              errorForIOKitFailure(v21);
              v22 = objc_claimAutoreleasedReturnValue();

              HAENotificationsLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v44 = (const char *)v22;
                _os_log_impl(&dword_2144B3000, v23, OS_LOG_TYPE_DEFAULT, "failed to get model number %@", buf, 0xCu);
              }
              v16 = (char *)v22;

              v24 = IOAccessoryManagerCopyDeviceInfo();
              if (v24)
              {
                errorForIOKitFailure(v24);
                v25 = objc_claimAutoreleasedReturnValue();

                HAENotificationsLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = (const char *)v25;
                  _os_log_impl(&dword_2144B3000, v26, OS_LOG_TYPE_DEFAULT, "failed to get name %@", buf, 0xCu);
                }
                v16 = (char *)v25;

                v27 = IOAccessoryManagerCopyDeviceInfo();
                if (v27)
                {
                  errorForIOKitFailure(v27);
                  v28 = (char *)objc_claimAutoreleasedReturnValue();

                  HAENotificationsLog();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v44 = v28;
                    _os_log_impl(&dword_2144B3000, v29, OS_LOG_TYPE_DEFAULT, "failed to get interface serial number %@", buf, 0xCu);
                  }
                  v16 = v28;

                  v30 = IOAccessoryManagerCopyDeviceInfo();
                  if (v30)
                  {
                    errorForIOKitFailure(v30);
                    v31 = objc_claimAutoreleasedReturnValue();

                    HAENotificationsLog();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                      +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.3();
                    name = (id)v31;

                    HAENotificationsLog();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v44 = "+[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:]";
                      v45 = 2112;
                      v46 = v13;
                      _os_log_impl(&dword_2144B3000, v33, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
                    }

                    IOServiceClose(connect);
                    serialNumber = v13->_serialNumber;
                    if (!v13->_manufacturer || !serialNumber)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOAccessoryManager: required fields are missing, manufacturer %@, serialNumber %@"), v13->_manufacturer, serialNumber, 0);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = *MEMORY[0x24BDD0FC8];
                      v42 = v35;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      makeError(v36, 4u);
                      *a3 = (id)objc_claimAutoreleasedReturnValue();

                      HAENotificationsLog();
                      v37 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.2();

                      v13 = 0;
                    }
                    v13 = v13;
                    v5 = v13;
                    goto LABEL_17;
                  }
                  v38 = CFSTR("kIOAccDigitalIDDeviceInfoTypeInterfaceModuleSerialNumber");
                }
                else
                {
                  v38 = CFSTR("kIOAccDigitalIDDeviceInfoTypeInterfaceDeviceSerialNumber");
                }
              }
              else
              {
                v38 = CFSTR("kIOAccDigitalIDDeviceInfoTypeAccessoryName");
              }
            }
            else
            {
              v38 = CFSTR("kIOAccDigitalIDDeviceInfoTypeAccessoryModelNumber");
            }
          }
          else
          {
            v38 = CFSTR("kIOAccDigitalIDDeviceInfoTypeAccessoryManufacturer");
          }
          errorForBadDeviceInfo((uint64_t)v38);
          v39 = objc_claimAutoreleasedReturnValue();

          name = (id)v39;
        }
        else
        {
          errorForBadDeviceInfo((uint64_t)CFSTR("kIOAccDigitalIDDeviceInfoTypeAccessorySerialNumber"));
          name = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_12:
        if (connect)
          IOServiceClose(connect);
        v5 = 0;
        if (a3 && name)
        {
          name = objc_retainAutorelease(name);
          v5 = 0;
          *a3 = name;
        }
LABEL_17:

        goto LABEL_18;
      }
      errorForIOKitFailure(v10);
      name = (id)objc_claimAutoreleasedReturnValue();
      HAENotificationsLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.4();
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BDD1540]);
      name = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", HAENAccessoryInfoErrorDomain, 2, MEMORY[0x24BDBD1B8]);
      HAENotificationsLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.1();
    }

    v13 = 0;
    goto LABEL_12;
  }
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "running citest mode with fake accessory info", buf, 2u);
  }

  v5 = objc_alloc_init(HAENAccessoryInfo);
  manufacturer = v5->_manufacturer;
  v5->_manufacturer = (NSString *)CFSTR("CITEST.INC");

  v7 = v5->_serialNumber;
  v5->_serialNumber = (NSString *)CFSTR("0123456789");

  name = v5->_name;
  v5->_name = (NSString *)CFSTR("FAKE");
LABEL_18:

  return v5;
}

+ (id)getAccessoryInfoFromIOKitDirectly:(id *)a3
{
  HAENAccessoryInfo *v4;
  const __CFDictionary *v5;
  BOOL v6;
  __CFDictionary *v7;
  char *v8;
  io_object_t v9;
  io_registry_entry_t v10;
  kern_return_t v11;
  CFMutableDictionaryRef v12;
  NSObject *v13;
  NSObject *v14;
  NSString *serialNumber;
  BOOL v16;
  void *v17;
  void *v18;
  NSObject *v19;
  HAENAccessoryInfo *v20;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  CFMutableDictionaryRef v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(HAENAccessoryInfo);
  v5 = IOServiceMatching("IOMikeyBusDevice");
  if (!v5
    || ((existing = 0, !IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v5, &existing))
      ? (v6 = existing == 0)
      : (v6 = 1),
        v6))
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v9 = IOIteratorNext(existing);
    if (v9)
    {
      v10 = v9;
      v8 = 0;
      v7 = 0;
      while (1)
      {
        if (v8 && v7)
          goto LABEL_28;
        properties = 0;
        v11 = IORegistryEntryCreateCFProperties(v10, &properties, 0, 0);
        v12 = properties;
        if (!v11)
        {
          if (properties)
            break;
        }
LABEL_21:
        if (v12)
          CFRelease(v12);
        IOObjectRelease(v10);
        v10 = IOIteratorNext(existing);
        if (!v10)
          goto LABEL_28;
      }
      HAENotificationsLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[HAENAccessoryInfo getAccessoryInfoFromIOKitDirectly:]";
        v28 = 2112;
        v29 = properties;
        _os_log_impl(&dword_2144B3000, v13, OS_LOG_TYPE_DEFAULT, "%s IOMikeyBusDevice properties: %@\n", buf, 0x16u);
      }

      if (v8)
      {
        if (v7)
        {
LABEL_18:
          HAENotificationsLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v8;
            v28 = 2112;
            v29 = v7;
            _os_log_impl(&dword_2144B3000, v14, OS_LOG_TYPE_DEFAULT, "IOMikeyBus sn: %@ mft: %@", buf, 0x16u);
          }

          v12 = properties;
          goto LABEL_21;
        }
      }
      else
      {
        -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("SerialNumber"));
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        if (v7)
          goto LABEL_18;
      }
      -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("VendorName"));
      v7 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v7 = 0;
    v8 = 0;
LABEL_28:
    IOObjectRelease(existing);
  }
  objc_storeStrong((id *)&v4->_manufacturer, v7);
  objc_storeStrong((id *)&v4->_serialNumber, v8);
  serialNumber = v4->_serialNumber;
  if (v4->_manufacturer)
    v16 = serialNumber == 0;
  else
    v16 = 1;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOMikeyBus: required fields are missing, manufacturer %@, serialNumber %@"), v4->_manufacturer, serialNumber);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BDD0FC8];
    v25 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    makeError(v18, 4u);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    HAENotificationsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:].cold.2();

    v4 = 0;
  }
  v20 = v4;

  return v20;
}

+ (id)getAccessoryInfo:(id *)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  +[HAENAccessoryInfo getAccessoryInfoFromIOAccesoryManager:](HAENAccessoryInfo, "getAccessoryInfoFromIOAccesoryManager:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && !*a3)
  {
    v13 = (void *)v4;
  }
  else
  {
    HAENotificationsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[HAENAccessoryInfo getAccessoryInfo:].cold.2((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);

    *a3 = 0;
    +[HAENAccessoryInfo getAccessoryInfoFromIOKitDirectly:](HAENAccessoryInfo, "getAccessoryInfoFromIOKitDirectly:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a3)
    {
      HAENotificationsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[HAENAccessoryInfo getAccessoryInfo:].cold.1((uint64_t)a3, v14, v15, v16, v17, v18, v19, v20);

    }
  }
  v21 = v13;

  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]: serial# '%@', manufacturer '%@', name '%@', model# '%@', InterfaceDeviceSerial# '%@', interfaceModuleSerial# '%@'"), v5, self->_serialNumber, self->_manufacturer, self->_name, self->_modelNumber, self->_interfaceDeviceSerialNumber, self->_interfaceModuleSerialNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)interfaceDeviceSerialNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)interfaceModuleSerialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceModuleSerialNumber, 0);
  objc_storeStrong((id *)&self->_interfaceDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "failed to get service port %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "failed to get device module serial number %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getAccessoryInfoFromIOAccesoryManager:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2144B3000, v0, v1, "failed IOServiceOpen %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)getAccessoryInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2144B3000, a2, a3, "failed to get accessory info from mickey bus: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getAccessoryInfo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2144B3000, a2, a3, "failed to get accessory info from IOAccessoryManager: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
