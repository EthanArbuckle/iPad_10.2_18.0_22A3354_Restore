@implementation ASDTIOPAudioVTConfigurationProperty

+ (id)configDictForService:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A5B8];
  v8[0] = *MEMORY[0x24BE0A5D8];
  v8[1] = v3;
  v9[0] = CFSTR("ASDTIOPAudioVTConfigurationProperty");
  v9[1] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASDTIOPAudioVTConfigurationProperty)initWithConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ASDTIOPAudioVTConfigurationProperty *v8;
  ASDTIOPAudioVTConfigurationProperty *v9;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE0A590];
  v12[0] = *MEMORY[0x24BE0A5A8];
  v12[1] = v5;
  v6 = *MEMORY[0x24BE0A5E8];
  v13[0] = &unk_250852EE0;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asdtAddMissingEntriesFromDictionary:", v7);

  v11.receiver = self;
  v11.super_class = (Class)ASDTIOPAudioVTConfigurationProperty;
  v8 = -[ASDTIOPAudioVTProperty initWithConfig:propertyDataType:qualifierDataType:](&v11, sel_initWithConfig_propertyDataType_qualifierDataType_, v4, 1886155636, 0);
  v9 = v8;
  if (v8)
    -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:](v8, "storePropertyValue:", MEMORY[0x24BDBD1B8]);

  return v9;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioVTConfigurationProperty;
  if (!-[ASDTCustomProperty checkPropertyValue:](&v8, sel_checkPropertyValue_, v4))
  {
LABEL_9:
    isKindOfClass = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioVTConfigurationProperty checkPropertyValue:].cold.2(self);
    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("CorealisRTModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioVTConfigurationProperty checkPropertyValue:].cold.1(self);

LABEL_10:
  return isKindOfClass & 1;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  BOOL v18;
  unsigned int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0;
  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getIsEnabled:", &v20);

  if ((v6 & 1) != 0)
  {
    if (!v20
      || (-[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "setEnabled:", 0),
          v7,
          (v8 & 1) != 0))
    {
      v9 = v4;
      objc_msgSend(v9, "objectForKey:", CFSTR("CorealisRTModelVersion"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDTCustomProperty name](self, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = CFSTR("<unknown>");
        if (v10)
          v13 = v10;
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Updating VT configuration to '%@'\n", buf, 0x16u);

      }
      -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "setConfigurationInfo:", v9);

      if ((v15 & 1) != 0)
      {
        if (!v20
          || (-[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "setEnabled:", v20),
              v16,
              (v17 & 1) != 0))
        {
          v18 = 1;
LABEL_22:

          goto LABEL_23;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:].cold.1(self);
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:].cold.2(self);
      }
      v18 = 0;
      goto LABEL_22;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:].cold.3(self);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTIOPAudioVTConfigurationProperty storePropertyValue:].cold.4(self);
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (id)retrievePropertyValue
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConfigured");

  if ((v4 & 1) != 0)
  {
    -[ASDTIOPAudioVTProperty vtDevice](self, "vtDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getConfigurationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = CFSTR("CorealisRTModelVersion");
    v9[0] = CFSTR("<na>");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: VT configuration data invalid.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)checkPropertyValue:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: VT configuration is not a dictionary.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)storePropertyValue:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Could not enable the VT device.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)storePropertyValue:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to set the VT configuration.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)storePropertyValue:(void *)a1 .cold.3(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Could not disable the VT device.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)storePropertyValue:(void *)a1 .cold.4(void *a1)
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
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Could not determine if the VT device was enabled.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

@end
