@implementation HIDDisplayDeviceManagementInterface

- (HIDDisplayDeviceManagementInterface)initWithContainerID:(id)a3
{
  id v4;
  HIDDisplayDeviceManagementInterface *v5;
  HIDDisplayDeviceManagementInterface *v6;
  HIDDisplayDeviceManagementInterface *v7;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HIDDisplayDeviceManagementInterface;
  v5 = -[HIDDisplayInterface initWithContainerID:](&v22, sel_initWithContainerID_, v4);
  v6 = v5;
  if (!v5)
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayDeviceManagementInterface initWithContainerID:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_9;
  }
  if (!-[HIDDisplayDeviceManagementInterface setupInterface](v5, "setupInterface"))
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayDeviceManagementInterface initWithContainerID:].cold.2((uint64_t)v4, v9, v16, v17, v18, v19, v20, v21);
LABEL_9:

    v7 = 0;
    goto LABEL_4;
  }
  v7 = v6;
LABEL_4:

  return v7;
}

- (HIDDisplayDeviceManagementInterface)initWithService:(unsigned int)a3
{
  uint64_t v3;
  HIDDisplayDeviceManagementInterface *v4;
  HIDDisplayDeviceManagementInterface *v5;
  HIDDisplayDeviceManagementInterface *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v3 = *(_QWORD *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)HIDDisplayDeviceManagementInterface;
  v4 = -[HIDDisplayInterface initWithService:](&v21, sel_initWithService_);
  v5 = v4;
  if (!v4)
  {
    HIDDisplayLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDDisplayDeviceManagementInterface initWithService:].cold.1(v3, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_9;
  }
  if (!-[HIDDisplayDeviceManagementInterface setupInterface](v4, "setupInterface"))
  {
    HIDDisplayLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[HIDDisplayDeviceManagementInterface initWithService:].cold.2(v3, v8, v15, v16, v17, v18, v19, v20);
LABEL_9:

    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
LABEL_4:

  return v6;
}

- (id)getHIDDevices
{
  return -[HIDDisplayInterface getHIDDevicesForMatching:](self, "getHIDDevicesForMatching:", &unk_24D5002F8);
}

- (BOOL)factoryReset:(unsigned __int8)a3 securityToken:(unint64_t)a4 error:(id *)a5
{
  unsigned int v7;
  NSObject *v9;
  NSDictionary *usageElementMap;
  void *v11;
  NSDictionary *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  int v18;
  HIDDisplayDeviceManagementInterface *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[3];

  v7 = a3;
  v24[2] = *MEMORY[0x24BDAC8D0];
  HIDDisplayLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = self;
    v20 = 1024;
    LODWORD(v21) = v7;
    _os_log_impl(&dword_2161BB000, v9, OS_LOG_TYPE_DEFAULT, "%@ factoryReset type %d", (uint8_t *)&v18, 0x12u);
  }

  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    -[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D4FFFF0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = self->_usageElementMap;
  if (v12)
  {
    -[NSDictionary objectForKey:](v12, "objectForKey:", &unk_24D500008);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v11 && v13)
    {
      objc_msgSend(v11, "setIntegerValue:", v7);
      objc_msgSend(v14, "setIntegerValue:", a4);
      v24[0] = v11;
      v24[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = -[HIDDisplayInterface commit:error:](self, "commit:error:", v15, a5);
      goto LABEL_14;
    }
  }
  else
  {
    v14 = 0;
  }
  HIDDisplayLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v14;
    _os_log_error_impl(&dword_2161BB000, v15, OS_LOG_TYPE_ERROR, "%@ factoryResetElement no associated element factoryReset : %@ securityToken : %@", (uint8_t *)&v18, 0x20u);
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)setupInterface
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HIDDisplayInterface getDeviceElements:](self, "getDeviceElements:", &unk_24D500320);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getSecurityToken:(unint64_t *)a3 error:(id *)a4
{
  NSDictionary *usageElementMap;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap)
  {
    if (a3 || !a4)
      goto LABEL_11;
    v9 = 0;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Invalid Argument"), -536870206, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500008);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!a3 && a4)
    goto LABEL_10;
  if (!v8)
  {
LABEL_11:
    HIDDisplayLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[HIDDisplayDeviceManagementInterface getSecurityToken:error:].cold.1((uint64_t)self, v13, v14, v15, v16, v17, v18, v19);

    v9 = 0;
    goto LABEL_14;
  }
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HIDDisplayInterface extract:error:](self, "extract:error:", v10, a4);

  if (!v11)
  {
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  *a3 = objc_msgSend(v9, "integerValue");
  v12 = 1;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

- (void)initWithContainerID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, a2, a3, "Failed to create HIDDisplayDeviceManagementInterface for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithContainerID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, a2, a3, "Failed to setup HIDDisplayDeviceManagementInterface for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2161BB000, a2, a3, "Failed to create HIDDisplayDeviceManagementInterface for %d", a5, a6, a7, a8, 0);
}

- (void)initWithService:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2161BB000, a2, a3, "Failed to setup HIDDisplayDeviceManagementInterface for %d", a5, a6, a7, a8, 0);
}

- (void)getSecurityToken:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, a2, a3, "%@ getSecurityToken no associated element", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
