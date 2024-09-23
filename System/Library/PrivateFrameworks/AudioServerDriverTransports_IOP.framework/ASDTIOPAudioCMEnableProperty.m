@implementation ASDTIOPAudioCMEnableProperty

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

- (ASDTIOPAudioCMEnableProperty)initWithConfig:(id)a3
{
  id v4;
  ASDTIOPAudioCMEnableProperty *v5;
  ASDTIOPAudioCMEnableProperty *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  ASDTIOPAudioCMEnableProperty *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDTIOPAudioCMEnableProperty;
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
  -[ASDTIOPAudioCMEnableProperty setClientManager:](v6, "setClientManager:", v8);

  -[ASDTIOPAudioCMEnableProperty clientManager](v6, "clientManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioCMPowerStateProperty initWithConfig:].cold.2(v6);
    goto LABEL_10;
  }
  -[ASDTIOPAudioCMEnableProperty clientManager](v6, "clientManager");
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
  -[ASDTIOPAudioCMEnableProperty setEnableDirection:](v6, "setEnableDirection:", objc_msgSend(v4, "asdtIOPAudioCMEnablePropertyDirection"));

LABEL_5:
  v13 = v6;
LABEL_11:

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ASDTIOPAudioCMEnableProperty clientManager](self, "clientManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioCMEnableProperty;
  -[ASDTIOPAudioCMEnableProperty dealloc](&v4, sel_dealloc);
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
  v9.super_class = (Class)ASDTIOPAudioCMEnableProperty;
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
  void *v2;
  int v4;
  unsigned __int8 v5;

  v5 = 0;
  -[ASDTIOPAudioCMEnableProperty clientManager](self, "clientManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getEnableState:", &v5);

  v4 = v5;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  objc_super v12;
  int v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(v4, "getBytes:length:", &v13, 4);
  v5 = v13;
  -[ASDTIOPAudioCMEnableProperty clientManager](self, "clientManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASDTIOPAudioCMEnableProperty enableDirection](self, "enableDirection");
  if (!v5)
  {
    v10 = objc_msgSend(v6, "disableInDirection:", v7);

    if (v10)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = objc_msgSend(v6, "enableInDirection:", v7);

  if ((v8 & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)ASDTIOPAudioCMEnableProperty;
  v9 = -[ASDTCustomProperty storePropertyValue:](&v12, sel_storePropertyValue_, v4);
LABEL_6:

  return v9;
}

- (ASDTIOPAudioCMDevice)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
  objc_storeStrong((id *)&self->_clientManager, a3);
}

- (unsigned)enableDirection
{
  return self->_enableDirection;
}

- (void)setEnableDirection:(unsigned int)a3
{
  self->_enableDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
}

@end
