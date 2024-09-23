@implementation ASDTPMActionNumericPropertyAnalyticsEvent

- (ASDTPMActionNumericPropertyAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMActionNumericPropertyAnalyticsEvent *v7;
  void *v8;
  ASDTPMActionNumericPropertyAnalyticsEvent *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDTPMActionNumericPropertyAnalyticsEvent;
  v7 = -[ASDTPMActionAnalyticsEvent initWithConfig:forSequencer:](&v13, sel_initWithConfig_forSequencer_, v6, a4);
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v6, "asdtPropertyAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMActionNumericPropertyAnalyticsEvent setPropertyAddress:](v7, "setPropertyAddress:", v8);

  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](v7, "propertyAddress");
  v9 = (ASDTPMActionNumericPropertyAnalyticsEvent *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "asdtPMActionAnalyticsEventField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMActionNumericPropertyAnalyticsEvent setFieldName:](v7, "setFieldName:", v10);

    -[ASDTPMActionNumericPropertyAnalyticsEvent fieldName](v7, "fieldName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_4:
      v9 = v7;
      goto LABEL_5;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMActionNumericPropertyAnalyticsEvent initWithConfig:forSequencer:].cold.1(v7);
    v9 = 0;
  }
LABEL_5:

  return v9;
}

- (id)deviceName
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selector") >> 29;
  if (v5)
  {
    -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "selector") >> 24 > 0x7E)
    {
      v7 = 0;
      v6 = 32;
    }
    else
    {
      -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v25, "selector") >> 24;
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
    v6 = 32;
  }
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "selector") & 0xE00000;
  if (v9)
  {
    -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "selector") >> 16) > 0x7Eu)
    {
      v36 = 0;
      v35 = 32;
    }
    else
    {
      -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_msgSend(v28, "selector") >> 16);
      v36 = 1;
    }
  }
  else
  {
    v36 = 0;
    v35 = 32;
  }
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "selector") & 0xE000;
  v42 = v4;
  v41 = v5;
  v40 = v8;
  if (v11)
  {
    -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (((unsigned __int16)objc_msgSend(v31, "selector") >> 8) > 0x7Eu)
    {
      v34 = 0;
      v33 = 32;
    }
    else
    {
      -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = ((unsigned __int16)objc_msgSend(v27, "selector") >> 8);
      v34 = 1;
    }
  }
  else
  {
    v34 = 0;
    v33 = 32;
  }
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  v37 = objc_msgSend(v12, "selector") & 0xE0;
  v38 = v11;
  if (v37)
  {
    -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selector");
    v30 = v13;
    v15 = v9;
    v16 = v3;
    v17 = v7;
    if (v14 > 0x7Eu)
    {
      v19 = 0;
      v18 = 32;
    }
    else
    {
      -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v26, "selector");
      v19 = 1;
    }
  }
  else
  {
    v15 = v9;
    v16 = v3;
    v17 = v7;
    v19 = 0;
    v18 = 32;
  }
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "element");
  -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("NumericPropertyAnalyticsEvent: S:%c%c%c%c E:%u S:%x"), v6, v35, v33, v18, v21, objc_msgSend(v22, "scope"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  if (v37)

  if (v34)
  if (v38)

  if (v36)
  if (v15)

  if (v17)
  if (v41)

  return v23;
}

- (ASDTNumericProperty)numericProperty
{
  ASDTNumericProperty **p_numericProperty;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_numericProperty = &self->_numericProperty;
  WeakRetained = objc_loadWeakRetained((id *)&self->_numericProperty);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_numericProperty);
  }
  else
  {
    -[ASDTPMDevice parentSequencer](self, "parentSequencer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMActionNumericPropertyAnalyticsEvent propertyAddress](self, "propertyAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customPropertyForAddress:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "conformsToProtocol:", &unk_25645D750))
    {
      objc_storeWeak((id *)p_numericProperty, v9);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTPMActionNumericPropertyAnalyticsEvent numericProperty].cold.1(self);
    }
    v5 = objc_loadWeakRetained((id *)p_numericProperty);

  }
  return (ASDTNumericProperty *)v5;
}

- (id)eventData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[ASDTPMActionNumericPropertyAnalyticsEvent numericProperty](self, "numericProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASDTPMActionNumericPropertyAnalyticsEvent numericProperty](self, "numericProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numericType");

    v7 = v4;
    v8 = objc_msgSend(v7, "length");
    if (v8 < objc_msgSend(MEMORY[0x24BDD16E0], "asdtDataSizeForNumericType:", v6))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTPMActionNumericPropertyAnalyticsEvent eventData].cold.1(self, v7);
      v9 = 0;
      v4 = v7;
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = objc_retainAutorelease(v7);
    v12 = objc_msgSend(v11, "bytes");
    -[ASDTPMActionNumericPropertyAnalyticsEvent numericProperty](self, "numericProperty");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asdtNumberFromData:withNumericType:", v12, objc_msgSend(v13, "numericType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v4)
  {
    v9 = 0;
    return v9;
  }
  -[ASDTPMActionNumericPropertyAnalyticsEvent fieldName](self, "fieldName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  v16[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (void)setNumericProperty:(id)a3
{
  objc_storeWeak((id *)&self->_numericProperty, a3);
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
  objc_storeStrong((id *)&self->_propertyAddress, a3);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_destroyWeak((id *)&self->_numericProperty);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Field name must be specified in config: %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)numericProperty
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v3, "%@: No property found matching address %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)eventData
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Bad property data with length: %u", (uint8_t *)&v4, 0x12u);

  OUTLINED_FUNCTION_0_1();
}

@end
