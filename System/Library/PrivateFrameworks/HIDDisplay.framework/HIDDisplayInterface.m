@implementation HIDDisplayInterface

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[regID:0x%llx][containerID:%@][instance:%p]"), self->_registryID, self->_containerID, self);
}

- (HIDDisplayInterface)initWithContainerID:(id)a3
{
  id v5;
  HIDDisplayInterface *v6;
  HIDDisplayInterface *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  HIDDisplayInterface *v14;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  HIDDisplayInterface *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HIDDisplayInterface;
  v6 = -[HIDDisplayInterface init](&v20, sel_init);
  v7 = v6;
  if (!v6)
  {
    v14 = 0;
    goto LABEL_15;
  }
  -[HIDDisplayInterface getHIDDevices](v6, "getHIDDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v9, "count"))
    {
      v10 = 0;
      while (1)
      {
        objc_msgSend(v9, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[HIDDisplayInterface hasMatchingContainerID:containerID:](v7, "hasMatchingContainerID:containerID:", v11, v5);

        if (v12)
          break;
        if (++v10 >= (unint64_t)objc_msgSend(v9, "count"))
          goto LABEL_12;
      }
      objc_msgSend(v9, "objectAtIndex:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDDisplayInterface setDevice:](v7, "setDevice:", v16);

      -[HIDDisplayInterface device](v7, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "open");

      objc_storeStrong((id *)&v7->_containerID, a3);
      -[HIDDisplayInterface device](v7, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      IORegistryEntryGetRegistryEntryID(objc_msgSend(v18, "service"), &v7->_registryID);

      HIDDisplayLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_2161BB000, v19, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      v14 = v7;
      goto LABEL_13;
    }
  }
  else
  {
    HIDDisplayLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HIDDisplayInterface initWithContainerID:].cold.1((uint64_t)v5, v13);

  }
LABEL_12:
  v14 = 0;
LABEL_13:

LABEL_15:
  return v14;
}

- (HIDDisplayInterface)initWithService:(unsigned int)a3
{
  uint64_t v3;
  HIDDisplayInterface *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *containerID;
  NSObject *v9;
  HIDDisplayInterface *v10;
  objc_super v12;
  uint8_t buf[4];
  HIDDisplayInterface *v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)HIDDisplayInterface;
  v4 = -[HIDDisplayInterface init](&v12, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD8A38]), "initWithService:", v3);
    if (v5)
    {
      -[HIDDisplayInterface setDevice:](v4, "setDevice:", v5);
      -[HIDDisplayInterface device](v4, "device");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "open");

      IORegistryEntryGetRegistryEntryID(v3, &v4->_registryID);
      -[HIDDisplayInterface extractContainerIDFromService:](v4, "extractContainerIDFromService:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      containerID = v4->_containerID;
      v4->_containerID = (NSString *)v7;

      HIDDisplayLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_impl(&dword_2161BB000, v9, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      v10 = v4;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HIDDisplayInterface)initWithMatching:(id)a3
{
  id v4;
  NSObject *v5;
  HIDDisplayInterface *v6;
  HIDDisplayInterface *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *containerID;
  NSObject *v16;
  HIDDisplayInterface *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HIDDisplayLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[HIDDisplayInterface initWithMatching:]";
    _os_log_impl(&dword_2161BB000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v19.receiver = self;
  v19.super_class = (Class)HIDDisplayInterface;
  v6 = -[HIDDisplayInterface init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HIDDisplayInterface getHIDDevicesForMatching:](v6, "getHIDDevicesForMatching:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDDisplayInterface setDevice:](v7, "setDevice:", v10);

      -[HIDDisplayInterface device](v7, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "open");

      -[HIDDisplayInterface device](v7, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      IORegistryEntryGetRegistryEntryID(objc_msgSend(v12, "service"), &v7->_registryID);

      -[HIDDisplayInterface device](v7, "device");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HIDDisplayInterface extractContainerIDFromService:](v7, "extractContainerIDFromService:", objc_msgSend(v13, "service"));
      v14 = objc_claimAutoreleasedReturnValue();
      containerID = v7->_containerID;
      v7->_containerID = (NSString *)v14;

      HIDDisplayLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = (const char *)v7;
        _os_log_impl(&dword_2161BB000, v16, OS_LOG_TYPE_DEFAULT, "%@ Init", buf, 0xCu);
      }

      v17 = v7;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HIDDisplayInterface *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HIDDisplayLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_2161BB000, v3, OS_LOG_TYPE_DEFAULT, "%@ Dealloc", buf, 0xCu);
  }

  -[HIDDisplayInterface device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HIDDisplayInterface device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "close");

  }
  v6.receiver = self;
  v6.super_class = (Class)HIDDisplayInterface;
  -[HIDDisplayInterface dealloc](&v6, sel_dealloc);
}

- (id)extractContainerIDFromService:(unsigned int)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v3 = (void *)IORegistryEntrySearchCFProperty(a3, "IOService", CFSTR("kUSBContainerID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = v3;
      v3 = v4;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return v4;
}

- (BOOL)hasMatchingContainerID:(id)a3 containerID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  const char *v13;
  uint64_t entryID;
  uint8_t buf[4];
  HIDDisplayInterface *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "service");
  entryID = 0;
  IORegistryEntryGetRegistryEntryID(v7, &entryID);
  -[HIDDisplayInterface extractContainerIDFromService:](self, "extractContainerIDFromService:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_msgSend(v9, "containsString:", v10) & 1) != 0 || objc_msgSend(v10, "containsString:", v9);
    HIDDisplayLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = "Failure";
      *(_DWORD *)buf = 138412802;
      v17 = self;
      if (v11)
        v13 = "Success";
      v18 = 2112;
      v19 = v8;
      v20 = 2080;
      v21 = v13;
      _os_log_impl(&dword_2161BB000, v12, OS_LOG_TYPE_DEFAULT, "%@ Container ID Match for %@ returned %s", buf, 0x20u);
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)getDeviceElements:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  HIDDisplayInterface *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  HIDDisplayInterface *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = self;
  -[HIDDisplayInterface device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementsMatching:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v8)
    {
      v9 = v8;
      v20 = v7;
      v21 = v4;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "usage", v20, v21);
          v14 = objc_msgSend(v12, "usagePage");
          HIDDisplayLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v29 = v22;
            v30 = 2048;
            v31 = v14;
            v32 = 2048;
            v33 = v13;
            _os_log_impl(&dword_2161BB000, v15, OS_LOG_TYPE_INFO, "%@ Display Device Element UP: 0x%lx , U: 0x%lx ", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v16);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v9);
      v17 = v5;
      v7 = v20;
      v4 = v21;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  return v18;
}

- (id)getHIDDevicesForMatching:(id)a3
{
  id v4;
  HIDManager *manager;
  HIDManager *v6;
  HIDManager *v7;
  void *v8;

  v4 = a3;
  manager = self->_manager;
  if (manager
    || (v6 = (HIDManager *)objc_alloc_init(MEMORY[0x24BE3E808]),
        v7 = self->_manager,
        self->_manager = v6,
        v7,
        (manager = self->_manager) != 0))
  {
    -[HIDManager setDeviceMatching:](manager, "setDeviceMatching:", v4);
    -[HIDManager devices](self->_manager, "devices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getHIDDevices
{
  return 0;
}

- (id)device
{
  return self->_deviceRef;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRef, a3);
}

- (BOOL)commit:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v6 = a3;
  -[HIDDisplayInterface device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "commitElements:direction:error:", v6, 1, a4);

  if ((v8 & 1) == 0)
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayInterface commit:error:].cold.1();

  }
  return v8;
}

- (BOOL)extract:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v6 = a3;
  -[HIDDisplayInterface device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "commitElements:direction:error:", v6, 0, a4);

  if ((v8 & 1) == 0)
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayInterface extract:error:].cold.1();

  }
  return v8;
}

- (NSArray)capabilities
{
  return 0;
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_deviceRef, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)initWithContainerID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2161BB000, a2, OS_LOG_TYPE_ERROR, "Failed to get valid hid device for %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)commit:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2161BB000, v0, v1, "%@ Failed Set HID Elements values with error %@");
  OUTLINED_FUNCTION_2();
}

- (void)extract:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2161BB000, v0, v1, "%@ Failed Get HID Elements values with error %@");
  OUTLINED_FUNCTION_2();
}

@end
