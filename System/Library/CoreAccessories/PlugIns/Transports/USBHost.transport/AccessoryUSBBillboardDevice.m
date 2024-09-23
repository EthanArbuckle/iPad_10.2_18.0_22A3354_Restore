@implementation AccessoryUSBBillboardDevice

- (AccessoryUSBBillboardDevice)initWithService:(unsigned int)a3
{
  uint64_t v3;
  AccessoryUSBBillboardDevice *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)AccessoryUSBBillboardDevice;
  v4 = -[AccessoryUSBBillboardDevice init](&v11, sel_init);
  if (v4)
  {
    v4->_registryEntryID = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:](AccessoryUSBBillboardDevice, "getRegistryEntryIDFromService:", v3);
    v5 = +[AccessoryUSBBillboardDevice parentServiceVidPid:](AccessoryUSBBillboardDevice, "parentServiceVidPid:", v3);
    HIDWORD(v6) = v5;
    LODWORD(v6) = v5;
    *(_DWORD *)&v4->_vid = v6 >> 16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%x"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    acc_userNotifications_generateIdentifier((uint64_t)CFSTR("billboard-registry"), (uint64_t)v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v8;

  }
  return v4;
}

- (void)presentNotSupportNotification
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int vid;
  int pid;
  unint64_t registryEntryID;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  acc_userNotifications_accessoryNotSupported();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSString copy](self->_identifier, "copy");
  objc_msgSend(v3, "setGroupIdentifier:", v4);

  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    vid = self->_vid;
    pid = self->_pid;
    registryEntryID = self->_registryEntryID;
    objc_msgSend(v3, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316418;
    v14 = "-[AccessoryUSBBillboardDevice presentNotSupportNotification]";
    v15 = 1024;
    v16 = vid;
    v17 = 1024;
    v18 = pid;
    v19 = 2048;
    v20 = registryEntryID;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_2171C1000, v7, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@, pAccErrorNotification %@", (uint8_t *)&v13, 0x36u);

  }
  +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentNotification:completionHandler:", v3, 0);

}

- (void)dismissNotSupportNotification
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int vid;
  int pid;
  unint64_t registryEntryID;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSString copy](self->_identifier, "copy");
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    vid = self->_vid;
    pid = self->_pid;
    registryEntryID = self->_registryEntryID;
    v11 = 136316162;
    v12 = "-[AccessoryUSBBillboardDevice dismissNotSupportNotification]";
    v13 = 1024;
    v14 = vid;
    v15 = 1024;
    v16 = pid;
    v17 = 2048;
    v18 = registryEntryID;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@", (uint8_t *)&v11, 0x2Cu);
  }

  +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissNotificationsWithGroupIdentifier:", v3);

}

+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3
{
  uint64_t entryID;

  entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID))
    return 0;
  else
    return entryID;
}

+ (unsigned)parentServiceVidPid:(unsigned int)a3
{
  kern_return_t ParentEntry;
  __CFString *v5;
  const __CFAllocator *v6;
  void *CFProperty;
  void *v8;
  int v9;
  unsigned int v10;
  NSObject *v11;
  id v12;
  kern_return_t v14;
  NSObject *v15;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  io_registry_entry_t v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a3, "IOService", &parent);
  if (ParentEntry)
  {
    v14 = ParentEntry;
    logObjectForModule();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "+[AccessoryUSBBillboardDevice parentServiceVidPid:]";
      v19 = 1024;
      v20 = a3;
      v21 = 1024;
      v22 = parent;
      v23 = 1024;
      LODWORD(v24) = v14;
      _os_log_impl(&dword_2171C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: service(%d) parent(%d) not available. (%d)", buf, 0x1Eu);
    }

    v10 = 0;
    CFProperty = 0;
    v8 = 0;
    v5 = 0;
  }
  else
  {
    if (parent)
    {
      v5 = (__CFString *)IOObjectCopyClass(parent);
      v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(parent, CFSTR("idVendor"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      v8 = (void *)IORegistryEntryCreateCFProperty(parent, CFSTR("idProduct"), v6, 0);
      IOObjectRelease(parent);
    }
    else
    {
      CFProperty = 0;
      v8 = 0;
      v5 = 0;
    }
    v9 = objc_msgSend(CFProperty, "unsignedShortValue");
    v10 = objc_msgSend(v8, "unsignedShortValue") | (v9 << 16);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    v18 = "+[AccessoryUSBBillboardDevice parentServiceVidPid:]";
    v19 = 1024;
    v20 = a3;
    v21 = 1024;
    v22 = parent;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = CFProperty;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = v10;
    _os_log_impl(&dword_2171C1000, v11, OS_LOG_TYPE_INFO, "%s: service(%d) parent(%d - %@) vid/pid(%@/%@) vidpid 0X%X", buf, 0x3Cu);
  }

  return v10;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (NSDictionary)ioregProperties
{
  return self->_ioregProperties;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ioregProperties, 0);
}

@end
