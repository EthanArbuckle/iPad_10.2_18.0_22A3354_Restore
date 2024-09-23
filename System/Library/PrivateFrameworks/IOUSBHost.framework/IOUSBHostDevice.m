@implementation IOUSBHostDevice

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice deviceClass:(NSNumber *)deviceClass deviceSubclass:(NSNumber *)deviceSubclass deviceProtocol:(NSNumber *)deviceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  NSArray *v16;
  NSNumber *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  NSNumber *v21;
  NSNumber *v22;
  NSNumber *v23;
  objc_class *v24;
  id v25;
  void *v26;

  v16 = productIDArray;
  v17 = speed;
  v18 = deviceProtocol;
  v19 = deviceSubclass;
  v20 = deviceClass;
  v21 = bcdDevice;
  v22 = productID;
  v23 = vendorID;
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  IOServiceMatching((const char *)objc_msgSend(v25, "UTF8String"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setValue:forKey:", v23, IOUSBHostMatchingPropertyKeyVendorID);
  objc_msgSend(v26, "setValue:forKey:", v22, IOUSBHostMatchingPropertyKeyProductID);

  objc_msgSend(v26, "setValue:forKey:", v21, IOUSBHostMatchingPropertyKeyDeviceReleaseNumber);
  objc_msgSend(v26, "setValue:forKey:", v20, IOUSBHostMatchingPropertyKeyDeviceClass);

  objc_msgSend(v26, "setValue:forKey:", v19, IOUSBHostMatchingPropertyKeyDeviceSubClass);
  objc_msgSend(v26, "setValue:forKey:", v18, IOUSBHostMatchingPropertyKeyDeviceProtocol);

  objc_msgSend(v26, "setValue:forKey:", v17, IOUSBHostMatchingPropertyKeySpeed);
  objc_msgSend(v26, "setValue:forKey:", v16, IOUSBHostMatchingPropertyKeyProductIDArray);

  return (CFMutableDictionaryRef)v26;
}

- (BOOL)configureWithValue:(NSUInteger)value error:(NSError *)error
{
  return -[IOUSBHostDevice configureWithValue:matchInterfaces:error:](self, "configureWithValue:matchInterfaces:error:", value, 1, error);
}

- (BOOL)configureWithValue:(NSUInteger)value matchInterfaces:(BOOL)matchInterfaces error:(NSError *)error
{
  kern_return_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  const char *v17;
  uint64_t input[2];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  input[0] = value;
  input[1] = matchInterfaces;
  v8 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xAu, input, 2u, 0, 0);
  if (v8)
  {
    if (error)
    {
      v20[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Unable to set configuration."), &stru_24DEDD560, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v10;
      v20[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      v20[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v8, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        -[IOUSBHostDevice configureWithValue:matchInterfaces:error:].cold.1(v16, v17);

    }
  }
  else
  {
    -[IOUSBHostDevice setLastKnownConfiguration:](self, "setLastKnownConfiguration:", value);
  }
  return v8 == 0;
}

- (const)configurationDescriptor
{
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;
  CFTypeID v6;
  const IOUSBConfigurationDescriptor *result;
  unsigned __int8 valuePtr;

  v3 = -[IOUSBHostObject ioService](self, "ioService");
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, (CFStringRef)IOUSBHostDevicePropertyKeyCurrentConfiguration, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostDevice setLastKnownConfiguration:](self, "setLastKnownConfiguration:", valuePtr);
    }
    CFRelease(v5);
  }
  result = -[IOUSBHostDevice lastKnownConfiguration](self, "lastKnownConfiguration");
  if (result)
    return -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:](self, "configurationDescriptorWithConfigurationValue:error:", -[IOUSBHostDevice lastKnownConfiguration](self, "lastKnownConfiguration"), 0);
  return result;
}

- (BOOL)resetWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  const char *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xCu, 0, 0, 0, 0);
  if (v4 && error)
  {
    v15[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Unable to reset device"), &stru_24DEDD560, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    v15[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    v15[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v4, v11);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      -[IOUSBHostDevice resetWithError:].cold.1(v12, v13);

  }
  return v4 == 0;
}

- (BOOL)allocateDownstreamBusCurrentWithWakeUnits:(unint64_t *)a3 sleepUnits:(unint64_t *)a4 error:(id *)a5
{
  BOOL v5;
  unint64_t v9;
  kern_return_t v10;
  unint64_t v11;
  kern_return_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  const char *v21;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v5 = 0;
  v27[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a4)
    {
      outputCnt = 2;
      v9 = *a4;
      output = *a3;
      v25 = v9;
      v10 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xBu, 0, 0, &output, &outputCnt);
      v11 = v25;
      *a3 = output;
      *a4 = v11;
      v5 = v10 == 0;
      if (v10)
      {
        if (a5)
        {
          v12 = v10;
          v26[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Unable to allocate bus current"), &stru_24DEDD560, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = v14;
          v26[1] = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v16;
          v26[2] = *MEMORY[0x24BDD0FF0];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v27[2] = v18;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v12, v19);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v20)
            -[IOUSBHostDevice allocateDownstreamBusCurrentWithWakeUnits:sleepUnits:error:].cold.1(v20, v21);

        }
      }
    }
  }
  return v5;
}

- (unint64_t)lastKnownConfiguration
{
  return self->_lastKnownConfiguration;
}

- (void)setLastKnownConfiguration:(unint64_t)a3
{
  self->_lastKnownConfiguration = a3;
}

- (void)configureWithValue:(uint64_t)a1 matchInterfaces:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to set configuration."), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)resetWithError:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to reset device"), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)allocateDownstreamBusCurrentWithWakeUnits:(uint64_t)a1 sleepUnits:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate bus current"), a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v2, "Error:%s with reason: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

@end
