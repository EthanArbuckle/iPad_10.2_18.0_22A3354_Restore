@implementation IOUSBHostInterface

+ (CFMutableDictionaryRef)createMatchingDictionaryWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID bcdDevice:(NSNumber *)bcdDevice interfaceNumber:(NSNumber *)interfaceNumber configurationValue:(NSNumber *)configurationValue interfaceClass:(NSNumber *)interfaceClass interfaceSubclass:(NSNumber *)interfaceSubclass interfaceProtocol:(NSNumber *)interfaceProtocol speed:(NSNumber *)speed productIDArray:(NSArray *)productIDArray
{
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  NSNumber *v21;
  NSNumber *v22;
  NSNumber *v23;
  NSNumber *v24;
  NSNumber *v25;
  objc_class *v26;
  id v27;
  void *v28;
  NSNumber *v30;
  NSArray *v31;

  v31 = productIDArray;
  v30 = speed;
  v18 = interfaceProtocol;
  v19 = interfaceSubclass;
  v20 = interfaceClass;
  v21 = configurationValue;
  v22 = interfaceNumber;
  v23 = bcdDevice;
  v24 = productID;
  v25 = vendorID;
  v26 = (objc_class *)objc_opt_class();
  NSStringFromClass(v26);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  IOServiceMatching((const char *)objc_msgSend(v27, "UTF8String"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setValue:forKey:", v25, IOUSBHostMatchingPropertyKeyVendorID);
  objc_msgSend(v28, "setValue:forKey:", v24, IOUSBHostMatchingPropertyKeyProductID);

  objc_msgSend(v28, "setValue:forKey:", v23, IOUSBHostMatchingPropertyKeyDeviceReleaseNumber);
  objc_msgSend(v28, "setValue:forKey:", v22, IOUSBHostMatchingPropertyKeyInterfaceNumber);

  objc_msgSend(v28, "setValue:forKey:", v21, IOUSBHostMatchingPropertyKeyConfigurationValue);
  objc_msgSend(v28, "setValue:forKey:", v20, IOUSBHostMatchingPropertyKeyInterfaceClass);

  objc_msgSend(v28, "setValue:forKey:", v19, IOUSBHostMatchingPropertyKeyInterfaceSubClass);
  objc_msgSend(v28, "setValue:forKey:", v18, IOUSBHostMatchingPropertyKeyInterfaceProtocol);

  objc_msgSend(v28, "setValue:forKey:", v30, IOUSBHostMatchingPropertyKeySpeed);
  objc_msgSend(v28, "setValue:forKey:", v31, IOUSBHostMatchingPropertyKeyProductIDArray);

  return (CFMutableDictionaryRef)v28;
}

- (IOUSBHostInterface)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  IOUSBHostInterface *v8;
  IOUSBHostInterface *v9;
  io_registry_entry_t v10;
  const __CFAllocator *v11;
  const __CFNumber *CFProperty;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  const char *v26;
  IOUSBHostInterface *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL8 v43;
  const char *v44;
  objc_super v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *valuePtr;
  void *v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)IOUSBHostInterface;
  v8 = -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:](&v46, sel_initWithIOService_options_queue_error_interestHandler_, *(_QWORD *)&ioService, options, queue, error, interestHandler);
  v9 = v8;
  if (!v8)
  {
    if (error)
    {
      v47 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostInterface."), &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v19;
      v48 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Failed [super init]"), &stru_24DEDD560, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v21;
      v49 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &valuePtr, &v47, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v24);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v25)
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.1(v25, v26);

    }
    goto LABEL_15;
  }
  v10 = -[IOUSBHostObject ioService](v8, "ioService");
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v10, CFSTR("bConfigurationValue"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v13 = CFProperty;
    v14 = CFGetTypeID(CFProperty);
    if (v14 == CFNumberGetTypeID())
    {
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(v13, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostInterface setConfigurationDescriptor:](v9, "setConfigurationDescriptor:", -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:](v9, "configurationDescriptorWithConfigurationValue:error:", valuePtr, error));
    }
    CFRelease(v13);
  }
  if (!-[IOUSBHostInterface configurationDescriptor](v9, "configurationDescriptor"))
  {
    if (error)
    {
      v47 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostInterface."), &stru_24DEDD560, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v29;
      v48 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Unable to obtain configuration descriptor."), &stru_24DEDD560, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v31;
      v49 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &valuePtr, &v47, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870212, v34);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v35)
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.2(v35, v36);
      goto LABEL_22;
    }
LABEL_23:
    v27 = 0;
    goto LABEL_24;
  }
  v15 = (const __CFNumber *)IORegistryEntryCreateCFProperty(-[IOUSBHostObject ioService](v9, "ioService"), CFSTR("bInterfaceNumber"), v11, 0);
  if (!v15)
  {
    if (error)
    {
      v47 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostInterface."), &stru_24DEDD560, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      valuePtr = v38;
      v48 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Unable to obtain interface number."), &stru_24DEDD560, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v40;
      v49 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &valuePtr, &v47, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870212, v34);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v43)
        -[IOUSBHostInterface initWithIOService:options:queue:error:interestHandler:].cold.3(v43, v44);
LABEL_22:

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v16 = v15;
  v17 = CFGetTypeID(v15);
  if (v17 == CFNumberGetTypeID())
  {
    LOBYTE(valuePtr) = 0;
    CFNumberGetValue(v16, kCFNumberSInt8Type, &valuePtr);
    -[IOUSBHostInterface setInterfaceNumber:](v9, "setInterfaceNumber:", valuePtr);
  }
  CFRelease(v16);
LABEL_15:
  v27 = v9;
LABEL_24:

  return v27;
}

- (NSTimeInterval)idleTimeout
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0xBu, 0, 0, &output, &outputCnt);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = 0.0;
    if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0)
      NSLog(CFSTR("[Line %d of %s] %sconnect call failed with 0x%x"), 142, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostInterface.m", "-[IOUSBHostInterface idleTimeout]", v4);
  }
  else
  {
    v5 = (double)output;
  }
  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  uint64_t (*__ptr32 *v5)();
  kern_return_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  const char *v15;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v5 = &off_21B5E5000;
  LODWORD(v5) = vcvtad_u64_f64(idleTimeout * 1000.0);
  v6 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", v5), 0xAu, &v17, 1u, 0, 0);
  if (v6 && error)
  {
    v18[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unable to set idle timeout."), &stru_24DEDD560, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v18[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v6, v13);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      -[IOUSBHostInterface setIdleTimeout:error:].cold.1(v14, v15);

  }
  return v6 == 0;
}

- (const)interfaceDescriptor
{
  io_registry_entry_t v3;
  const __CFNumber *CFProperty;
  const __CFNumber *v5;
  CFTypeID v6;
  const IOUSBConfigurationDescriptor *v7;
  const IOUSBConfigurationDescriptor *v8;
  const IOUSBDescriptorHeader *i;
  const IOUSBInterfaceDescriptor *InterfaceDescriptor;
  const IOUSBInterfaceDescriptor *v11;
  uint64_t bInterfaceNumber;
  uint64_t bAlternateSetting;
  unsigned __int8 valuePtr;

  v3 = -[IOUSBHostObject ioService](self, "ioService");
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, CFSTR("bAlternateSetting"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    valuePtr = 0;
    v6 = CFGetTypeID(CFProperty);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberSInt8Type, &valuePtr);
      -[IOUSBHostInterface setLastKnownAlternateSetting:](self, "setLastKnownAlternateSetting:", valuePtr);
    }
    CFRelease(v5);
  }
  v7 = -[IOUSBHostInterface configurationDescriptor](self, "configurationDescriptor");
  v8 = v7;
  for (i = 0; ; i = (const IOUSBDescriptorHeader *)v11)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v7, i);
    v11 = InterfaceDescriptor;
    if (!InterfaceDescriptor)
      break;
    bInterfaceNumber = InterfaceDescriptor->bInterfaceNumber;
    if (-[IOUSBHostInterface interfaceNumber](self, "interfaceNumber") == bInterfaceNumber)
    {
      bAlternateSetting = v11->bAlternateSetting;
      if (-[IOUSBHostInterface lastKnownAlternateSetting](self, "lastKnownAlternateSetting") == bAlternateSetting)
        break;
    }
    v7 = v8;
  }
  return v11;
}

- (BOOL)selectAlternateSetting:(NSUInteger)alternateSetting error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  const char *v16;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v7 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", alternateSetting), 0xCu, &v18, 1u, 0, 0);
  if (v7)
  {
    if (error)
    {
      v19[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unable to select alternate setting."), &stru_24DEDD560, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v9;
      v19[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v11;
      v19[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v7, v14);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        -[IOUSBHostInterface selectAlternateSetting:error:].cold.1(v15, v16);

    }
  }
  else
  {
    -[IOUSBHostInterface setLastKnownAlternateSetting:](self, "setLastKnownAlternateSetting:", alternateSetting);
  }
  return v7 == 0;
}

- (IOUSBHostPipe)copyPipeWithAddress:(NSUInteger)address error:(NSError *)error
{
  io_registry_entry_t v7;
  const __CFAllocator *v8;
  const __CFNumber *CFProperty;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  const IOUSBConfigurationDescriptor *v15;
  const IOUSBConfigurationDescriptor *v16;
  const IOUSBDescriptorHeader *i;
  const IOUSBInterfaceDescriptor *InterfaceDescriptor;
  const IOUSBInterfaceDescriptor *v19;
  const IOUSBDescriptorHeader *v20;
  const IOUSBEndpointDescriptor *EndpointDescriptor;
  IOUSBHostPipe *result;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  const char *v39;
  __int16 valuePtr;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v7 = -[IOUSBHostObject ioService](self, "ioService");
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, CFSTR("bAlternateSetting"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v10 = CFProperty;
    v11 = CFGetTypeID(CFProperty);
    if (v11 == CFNumberGetTypeID())
      CFNumberGetValue(v10, kCFNumberSInt8Type, &valuePtr);
    CFRelease(v10);
  }
  v12 = (const __CFNumber *)IORegistryEntryCreateCFProperty(-[IOUSBHostObject ioService](self, "ioService"), CFSTR("bInterfaceNumber"), v8, 0);
  if (v12)
  {
    v13 = v12;
    v14 = CFGetTypeID(v12);
    if (v14 == CFNumberGetTypeID())
      CFNumberGetValue(v13, kCFNumberSInt8Type, (char *)&valuePtr + 1);
    CFRelease(v13);
  }
  v15 = -[IOUSBHostInterface configurationDescriptor](self, "configurationDescriptor");
  v16 = v15;
  for (i = 0; ; i = (const IOUSBDescriptorHeader *)v19)
  {
    InterfaceDescriptor = IOUSBGetNextInterfaceDescriptor(v15, i);
    v19 = InterfaceDescriptor;
    if (!InterfaceDescriptor
      || __PAIR64__(InterfaceDescriptor->bAlternateSetting, InterfaceDescriptor->bInterfaceNumber) == __PAIR64__(valuePtr, HIBYTE(valuePtr)))
    {
      break;
    }
    v15 = v16;
  }
  v20 = 0;
  do
  {
    EndpointDescriptor = IOUSBGetNextEndpointDescriptor(v16, v19, v20);
    if (!EndpointDescriptor)
    {
      if (!error)
        return 0;
      v41 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Unable to copy pipe."), &stru_24DEDD560, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v33;
      v42 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Endpoint address not found."), &stru_24DEDD560, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v35;
      v43 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Select a valid endpoint address"), &stru_24DEDD560, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v41, 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870160, v29);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v38)
        -[IOUSBHostInterface copyPipeWithAddress:error:].cold.1(v38, v39);
      goto LABEL_23;
    }
    v20 = (const IOUSBDescriptorHeader *)EndpointDescriptor;
  }
  while (IOUSBGetEndpointAddress(EndpointDescriptor) != address);
  result = -[IOUSBHostPipe initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:]([IOUSBHostPipe alloc], "initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:", self, address, -[IOUSBHostObject ioConnection](self, "ioConnection"), -[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"), -[IOUSBHostObject deviceAddress](self, "deviceAddress"));
  if (result)
    return result;
  if (error)
  {
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Unable to copy pipe."), &stru_24DEDD560, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    v42 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("IOUSBHostPipe init failed."), &stru_24DEDD560, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v26;
    v43 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v41, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v29);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
      -[IOUSBHostInterface copyPipeWithAddress:error:].cold.2(v30, v31);
LABEL_23:

  }
  return 0;
}

- (const)configurationDescriptor
{
  return self->_configurationDescriptor;
}

- (void)setConfigurationDescriptor:(const IOUSBConfigurationDescriptor *)a3
{
  self->_configurationDescriptor = a3;
}

- (unint64_t)interfaceNumber
{
  return self->_interfaceNumber;
}

- (void)setInterfaceNumber:(unint64_t)a3
{
  self->_interfaceNumber = a3;
}

- (unint64_t)lastKnownAlternateSetting
{
  return self->_lastKnownAlternateSetting;
}

- (void)setLastKnownAlternateSetting:(unint64_t)a3
{
  self->_lastKnownAlternateSetting = a3;
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed [super init]"), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to obtain configuration descriptor."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.3(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to obtain interface number."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)setIdleTimeout:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to set idle timeout."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)selectAlternateSetting:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to select alternate setting."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyPipeWithAddress:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy pipe."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Endpoint address not found."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)copyPipeWithAddress:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to copy pipe."), a2);
  OUTLINED_FUNCTION_2(CFSTR("IOUSBHostPipe init failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end
