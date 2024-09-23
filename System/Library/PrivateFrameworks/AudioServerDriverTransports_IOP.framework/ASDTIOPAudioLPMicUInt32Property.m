@implementation ASDTIOPAudioLPMicUInt32Property

- (ASDTIOPAudioLPMicUInt32Property)initWithConfig:(id)a3
{
  ASDTIOPAudioLPMicUInt32Property *v3;
  ASDTIOPAudioLPMicUInt32Property *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
  v3 = -[ASDTCustomProperty initWithConfig:propertyDataType:qualifierDataType:](&v6, sel_initWithConfig_propertyDataType_qualifierDataType_, a3, 1918990199, 0);
  v4 = v3;
  if (v3)
  {
    -[ASDTCustomProperty setCacheMode:](v3, "setCacheMode:", 0);
    -[ASDTCustomProperty setPropertyValueSize:](v4, "setPropertyValueSize:", 4);
  }
  return v4;
}

- (ASDTIOPAudioLPMicDevice)lpMicDevice
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[ASDCustomProperty owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ASDCustomProperty owner](self, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (ASDTIOPAudioLPMicDevice *)v5;
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
  v9.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
  if (-[ASDTCustomProperty checkPropertyValue:](&v9, sel_checkPropertyValue_, v4))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "length");
    v7 = v6 == -[ASDTCustomProperty propertyValueSize](self, "propertyValueSize");
    if (!v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioLPMicUInt32Property checkPropertyValue:].cold.1(self, v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)storePropertyValue:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  int v7;
  objc_super v9;
  unsigned int v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(v4, "getBytes:length:", &v10, 4);
  v5 = 0;
  if (-[ASDCustomProperty selector](self, "selector") == 1634690413)
  {
    -[ASDTIOPAudioLPMicUInt32Property lpMicDevice](self, "lpMicDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "setEnabledChannelMask:", v10);

    if (v7)
    {
      v9.receiver = self;
      v9.super_class = (Class)ASDTIOPAudioLPMicUInt32Property;
      v5 = -[ASDTCustomProperty storePropertyValue:](&v9, sel_storePropertyValue_, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)retrievePropertyValue
{
  void *v3;
  unsigned int v4;
  int v5;
  void *v6;
  int v8;

  v8 = 0;
  -[ASDTIOPAudioLPMicUInt32Property lpMicDevice](self, "lpMicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[ASDCustomProperty selector](self, "selector");
    switch(v4)
    {
      case 0x616F656Du:
        if (objc_msgSend(v3, "getEnabledChannelMask:", &v8))
        {
LABEL_10:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v8, 4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        break;
      case 0x646D7064u:
        v5 = objc_msgSend(v3, "maximumPastDataFrames");
        goto LABEL_9;
      case 0x64617064u:
        v5 = objc_msgSend(v3, "availablePastDataFrames");
LABEL_9:
        v8 = v5;
        goto LABEL_10;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (void)checkPropertyValue:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2048;
  v7 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: set: Bad property data length: %lu", (uint8_t *)&v4, 0x16u);

}

@end
