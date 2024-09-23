@implementation HIDDisplayPresetInterface

- (HIDDisplayPresetInterface)initWithMatching:(id)a3
{
  HIDDisplayPresetInterface *v3;
  HIDDisplayPresetInterface *v4;
  HIDDisplayPresetInterface *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = -[HIDDisplayInterface initWithMatching:](&v7, sel_initWithMatching_, a3);
  v4 = v3;
  if (v3 && -[HIDDisplayPresetInterface setupPresets](v3, "setupPresets"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (HIDDisplayPresetInterface)initWithContainerID:(id)a3
{
  HIDDisplayPresetInterface *v3;
  HIDDisplayPresetInterface *v4;
  HIDDisplayPresetInterface *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = -[HIDDisplayInterface initWithContainerID:](&v7, sel_initWithContainerID_, a3);
  v4 = v3;
  if (v3 && -[HIDDisplayPresetInterface setupPresets](v3, "setupPresets"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (HIDDisplayPresetInterface)initWithService:(unsigned int)a3
{
  HIDDisplayPresetInterface *v3;
  HIDDisplayPresetInterface *v4;
  HIDDisplayPresetInterface *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayPresetInterface;
  v3 = -[HIDDisplayInterface initWithService:](&v7, sel_initWithService_, *(_QWORD *)&a3);
  v4 = v3;
  if (v3 && -[HIDDisplayPresetInterface setupPresets](v3, "setupPresets"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)setupPresets
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HIDDisplayInterface getDeviceElements:](self, "getDeviceElements:", &unk_24D500348);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    -[HIDDisplayPresetInterface createPresets](self, "createPresets");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getHIDDevices
{
  return -[HIDDisplayInterface getHIDDevicesForMatching:](self, "getHIDDevicesForMatching:", &unk_24D500398);
}

- (id)getHIDElementForUsage:(int64_t)a3
{
  void *usageElementMap;
  void *v4;

  usageElementMap = self->_usageElementMap;
  if (usageElementMap)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(usageElementMap, "objectForKey:", v4);
    usageElementMap = (void *)objc_claimAutoreleasedReturnValue();

  }
  return usageElementMap;
}

- (void)createPresets
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HIDDisplayPresetData *v9;
  id obj;

  obj = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSDictionary objectForKey:](self->_usageElementMap, "objectForKey:", &unk_24D500080);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "logicalMax");
    v6 = v5 - objc_msgSend(v4, "logicalMin");
    if (v6 >= 0)
    {
      v7 = 0;
      v8 = v6 + 1;
      do
      {
        v9 = -[HIDDisplayPresetData initWithDisplayDevice:index:]([HIDDisplayPresetData alloc], "initWithDisplayDevice:index:", self, v7);
        if (v9)
          objc_msgSend(obj, "addObject:", v9);

        ++v7;
      }
      while (v8 != v7);
      objc_storeStrong((id *)&self->_presets, obj);
    }
  }

}

- (int64_t)getFactoryDefaultPresetIndex:(id *)a3
{
  NSDictionary *usageElementMap;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  NSObject *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500068),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetInterface getFactoryDefaultPresetIndex:].cold.1();

    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)v6;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HIDDisplayInterface extract:error:](self, "extract:error:", v8, a3);

  if (!v9)
  {
LABEL_8:
    v10 = -1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "integerValue");
LABEL_9:

  return v10;
}

- (int64_t)getActivePresetIndex:(id *)a3
{
  NSDictionary *usageElementMap;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  NSObject *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500098),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetInterface getActivePresetIndex:].cold.1();

    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)v6;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HIDDisplayInterface extract:error:](self, "extract:error:", v8, a3);

  if (!v9)
  {
LABEL_8:
    v10 = -1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "integerValue");
LABEL_9:

  return v10;
}

- (BOOL)setActivePresetIndex:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  NSDictionary *usageElementMap;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint8_t buf[4];
  HIDDisplayPresetInterface *v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  HIDDisplayLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = self;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_2161BB000, v7, OS_LOG_TYPE_DEFAULT, "%@ setActivePresetIndex on preset index : %ld", buf, 0x16u);
  }

  if ((a3 & 0x8000000000000000) == 0 && -[NSArray count](self->_presets, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_presets, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "valid") & 1) != 0)
    {
      usageElementMap = self->_usageElementMap;
      if (usageElementMap
        && (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500098),
            (v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v10;
        -[NSObject setIntegerValue:](v10, "setIntegerValue:", a3);
        v22 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(a4) = -[HIDDisplayInterface commit:error:](self, "commit:error:", v12, a4);

      }
      else
      {
        HIDDisplayLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[HIDDisplayPresetInterface setActivePresetIndex:error:].cold.1();
        LOBYTE(a4) = 1;
      }
      goto LABEL_16;
    }
    if (a4)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v17 = *MEMORY[0x24BDD1100];
      v23 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Preset is not valid."), &stru_24D4FF448, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, -536870212, v20);

    }
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetInterface setActivePresetIndex:error:].cold.2();
LABEL_15:
    LOBYTE(a4) = 0;
LABEL_16:

    return (char)a4;
  }
  if (a4)
  {
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v14 = *MEMORY[0x24BDD1100];
    v25 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Preset index out of range."), &stru_24D4FF448, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v26 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, -536870206, v15);

    goto LABEL_15;
  }
  return (char)a4;
}

- (BOOL)setCurrentPresetIndex:(int64_t)a3 error:(id *)a4
{
  NSDictionary *usageElementMap;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (usageElementMap
    && (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500080),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = v8;
    -[NSObject setIntegerValue:](v8, "setIntegerValue:", a3);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HIDDisplayInterface commit:error:](self, "commit:error:", v10, a4);

  }
  else
  {
    HIDDisplayLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetInterface setCurrentPresetIndex:error:].cold.1();
    v11 = 1;
  }

  return v11;
}

- (int64_t)getCurrentPresetIndex:(id *)a3
{
  NSDictionary *usageElementMap;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  NSObject *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  usageElementMap = self->_usageElementMap;
  if (!usageElementMap
    || (-[NSDictionary objectForKey:](usageElementMap, "objectForKey:", &unk_24D500080),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    HIDDisplayLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[HIDDisplayPresetInterface getCurrentPresetIndex:].cold.1();

    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)v6;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HIDDisplayInterface extract:error:](self, "extract:error:", v8, a3);

  if (!v9)
  {
LABEL_8:
    v10 = -1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "integerValue");
LABEL_9:

  return v10;
}

- (id)capabilities
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v3[0] = kHIDDisplayPresetFieldWritableKey;
  v3[1] = kHIDDisplayPresetFieldValidKey;
  v3[2] = kHIDDisplayPresetFieldNameKey;
  v3[3] = kHIDDisplayPresetFieldDescriptionKey;
  v3[4] = kHIDDisplayPresetFieldDataBlockOneLengthKey;
  v3[5] = kHIDDisplayPresetFieldDataBlockOneKey;
  v3[6] = kHIDDisplayPresetFieldDataBlockTwoLengthKey;
  v3[7] = kHIDDisplayPresetFieldDataBlockTwoKey;
  v3[8] = kHIDDisplayPresetUniqueIDKey;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)presets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presets, 0);
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

- (void)getFactoryDefaultPresetIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ getFactoryDefaultPresetIndex no associated element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getActivePresetIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ getActivePresetIndex no associated element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setActivePresetIndex:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ setActivePresetIndex no associated element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setActivePresetIndex:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_2161BB000, v1, OS_LOG_TYPE_ERROR, "%@ setActivePresetIndex on invalid  preset index : %ld", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)setCurrentPresetIndex:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ setCurrentPresetIndex no associated element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getCurrentPresetIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2161BB000, v0, v1, "%@ getCurrentPresetIndex no associated element", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
