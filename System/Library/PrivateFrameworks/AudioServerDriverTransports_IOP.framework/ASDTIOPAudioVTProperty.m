@implementation ASDTIOPAudioVTProperty

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
  +[ASDTIOServiceManager dependencyForID:andConfiguration:](ASDTIOPAudioVTServiceManager, "dependencyForID:andConfiguration:", v4, v3);
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

- (ASDTIOPAudioVTProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  ASDTIOPAudioVTProperty *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  char v15;
  ASDTIOPAudioVTProperty *v16;
  objc_super v18;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASDTIOPAudioVTProperty;
  v9 = -[ASDTCustomProperty initWithConfig:propertyDataType:qualifierDataType:](&v18, sel_initWithConfig_propertyDataType_qualifierDataType_, v8, v6, v5);
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v8, "asdtServiceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceManager matchedIOServiceForID:](ASDTIOPAudioVTServiceManager, "matchedIOServiceForID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOPAudioVTProperty setVtDevice:](v9, "setVtDevice:", v11);

  -[ASDTIOPAudioVTProperty vtDevice](v9, "vtDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:].cold.2(v9);
    goto LABEL_10;
  }
  -[ASDTIOPAudioVTProperty vtDevice](v9, "vtDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "open");

  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:].cold.1(v9);
LABEL_10:

    v16 = 0;
    goto LABEL_11;
  }

LABEL_5:
  v16 = v9;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioVTProperty;
  -[ASDTIOPAudioVTProperty dealloc](&v4, sel_dealloc);
}

- (ASDTIOPAudioVTDevice)vtDevice
{
  return (ASDTIOPAudioVTDevice *)objc_loadWeakRetained((id *)&self->_vtDevice);
}

- (void)setVtDevice:(id)a3
{
  objc_storeWeak((id *)&self->_vtDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vtDevice);
}

- (void)initWithConfig:(void *)a1 propertyDataType:qualifierDataType:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_0_1(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to open legacy voice trigger device '%@'", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfig:(void *)a1 propertyDataType:qualifierDataType:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_0_1(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to retrieve legacy voice trigger device for identifier: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

@end
