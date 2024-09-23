@implementation ASDTIOPAudioCMPowerStateProperty

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "asdtServiceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceManager dependencyForID:andConfiguration:](ASDTIOPAudioCMServiceManager, "dependencyForID:andConfiguration:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ASDTIOPAudioCMPowerStateProperty)initWithConfig:(id)a3
{
  id v4;
  ASDTIOPAudioCMPowerStateProperty *v5;
  ASDTIOPAudioCMPowerStateProperty *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  ASDTIOPAudioCMPowerStateProperty *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  v5 = -[ASDTCustomProperty initWithConfig:propertyDataType:qualifierDataType:](&v15, sel_initWithConfig_propertyDataType_qualifierDataType_, v4, 1918990199, 0);
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  -[ASDTCustomProperty setPropertyValueSize:](v5, "setPropertyValueSize:", 4);
  -[ASDTCustomProperty setCacheMode:](v6, "setCacheMode:", 0);
  objc_msgSend(v4, "asdtServiceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceManager matchedIOServiceForID:](ASDTIOPAudioCMServiceManager, "matchedIOServiceForID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOPAudioCMPowerStateProperty setClientManager:](v6, "setClientManager:", v8);

  -[ASDTIOPAudioCMPowerStateProperty clientManager](v6, "clientManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioCMPowerStateProperty initWithConfig:].cold.2(v6);
    goto LABEL_10;
  }
  -[ASDTIOPAudioCMPowerStateProperty clientManager](v6, "clientManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "open");

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioCMPowerStateProperty initWithConfig:].cold.1(v6);
LABEL_10:

    v13 = 0;
    goto LABEL_11;
  }
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateEnabled:](v6, "setPowerStateEnabled:", objc_msgSend(v4, "asdtIOPAudioCMPowerStatePropertyEnabled"));
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateDisabled:](v6, "setPowerStateDisabled:", objc_msgSend(v4, "asdtIOPAudioCMPowerStatePropertyDisabled"));
  -[ASDTIOPAudioCMPowerStateProperty setPowerStateDirection:](v6, "setPowerStateDirection:", objc_msgSend(v4, "asdtIOPAudioCMPowerStatePropertyDirection"));

LABEL_5:
  v13 = v6;
LABEL_11:

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ASDTIOPAudioCMPowerStateProperty clientManager](self, "clientManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  -[ASDTIOPAudioCMPowerStateProperty dealloc](&v4, sel_dealloc);
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
  if (-[ASDTCustomProperty checkPropertyValue:](&v9, sel_checkPropertyValue_, v4))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "length");
    v7 = v6 == -[ASDTCustomProperty propertyValueSize](self, "propertyValueSize");
    if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioCMPowerStateProperty checkPropertyValue:].cold.1(self, v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)retrievePropertyValue
{
  void *v3;
  char v4;
  int v5;
  _BOOL4 v7;

  v7 = 0;
  -[ASDTIOPAudioCMPowerStateProperty clientManager](self, "clientManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getCurrentPowerState:", &v7);

  v7 = (v4 & 1) != 0
    && (v5 = v7, v5 == -[ASDTIOPAudioCMPowerStateProperty powerStateEnabled](self, "powerStateEnabled"));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;
  int v11;

  v4 = a3;
  v11 = 0;
  objc_msgSend(v4, "getBytes:length:", &v11, 4);
  if (v11)
    v5 = -[ASDTIOPAudioCMPowerStateProperty powerStateEnabled](self, "powerStateEnabled");
  else
    v5 = -[ASDTIOPAudioCMPowerStateProperty powerStateDisabled](self, "powerStateDisabled");
  v6 = v5;
  -[ASDTIOPAudioCMPowerStateProperty clientManager](self, "clientManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "makePowerRequestForState:andDirection:", v6, -[ASDTIOPAudioCMPowerStateProperty powerStateDirection](self, "powerStateDirection"));

  if ((_DWORD)v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)ASDTIOPAudioCMPowerStateProperty;
    v8 = -[ASDTCustomProperty storePropertyValue:](&v10, sel_storePropertyValue_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ASDTIOPAudioCMDevice)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
  objc_storeStrong((id *)&self->_clientManager, a3);
}

- (unsigned)powerStateEnabled
{
  return self->_powerStateEnabled;
}

- (void)setPowerStateEnabled:(unsigned int)a3
{
  self->_powerStateEnabled = a3;
}

- (unsigned)powerStateDisabled
{
  return self->_powerStateDisabled;
}

- (void)setPowerStateDisabled:(unsigned int)a3
{
  self->_powerStateDisabled = a3;
}

- (unsigned)powerStateDirection
{
  return self->_powerStateDirection;
}

- (void)setPowerStateDirection:(unsigned int)a3
{
  self->_powerStateDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
}

- (void)initWithConfig:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to open client manager service with identifier: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfig:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to retrieve client manager service with identifier: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_0_1(&dword_236D88000, MEMORY[0x24BDACB70], v4, "%@: set: Bad property data length: %lu", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
