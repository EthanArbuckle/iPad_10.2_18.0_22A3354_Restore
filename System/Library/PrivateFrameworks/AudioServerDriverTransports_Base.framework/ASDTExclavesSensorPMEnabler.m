@implementation ASDTExclavesSensorPMEnabler

- (ASDTExclavesSensorPMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  id v7;
  ASDTExclavesSensorPMEnabler *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  ASDT::Exclaves::Sensor *v12;
  Sensor *value;
  ASDT::Exclaves::Sensor *v14;
  Sensor *v15;
  void *v16;
  uint64_t v17;
  ASDTExclavesSensorPMEnabler *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  objc_super v24;
  ASDT::Exclaves::Sensor *v25[4];

  v25[3] = *(ASDT::Exclaves::Sensor **)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ASDTExclavesSensorPMEnabler;
  v8 = -[ASDTPMEnabler initWithConfig:forSequencer:](&v24, sel_initWithConfig_forSequencer_, v6, v7);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTPMDevice name](v8, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTExclavesSensorPMEnabler initWithConfig:forSequencer:].cold.1(v19, (uint64_t)v25, v20);
      }
    }
    else
    {
      -[ASDTPMDevice name](v8, "name");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      ASDT::Exclaves::Sensor::Create((ASDT::Exclaves::Sensor *)objc_msgSend(v11, "UTF8String"), v25);
      v12 = v25[0];
      v25[0] = 0;
      value = v8->_sensor.__ptr_.__value_;
      v8->_sensor.__ptr_.__value_ = (Sensor *)v12;
      if (value)
      {
        (*(void (**)(Sensor *))(*(_QWORD *)value + 8))(value);
        v14 = v25[0];
        v25[0] = 0;
        if (v14)
          (*(void (**)(ASDT::Exclaves::Sensor *))(*(_QWORD *)v14 + 8))(v14);
      }

      v15 = v8->_sensor.__ptr_.__value_;
      if (v15)
      {
        if (!*((_DWORD *)v15 + 2)
          && asdt_exclaves_available()
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDTPMDevice name](v8, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTExclavesSensorPMEnabler initWithConfig:forSequencer:].cold.3(v16, (uint64_t)v25, v17);
        }
        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTPMDevice name](v8, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTExclavesSensorPMEnabler initWithConfig:forSequencer:].cold.2(v21, (uint64_t)v25, v22);
      }
    }
    v18 = 0;
    goto LABEL_17;
  }
LABEL_11:
  v18 = v8;
LABEL_17:

  return v18;
}

+ (id)configForMic
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Subclass");
  v3[1] = CFSTR("Name");
  v4[0] = CFSTR("ASDTExclavesSensorPMEnabler");
  v4[1] = CFSTR("com.apple.sensors.mic");
  v3[2] = CFSTR("EnableTransition");
  v3[3] = CFSTR("DisableTransition");
  v4[2] = &unk_25084A888;
  v4[3] = &unk_25084A8A0;
  v3[4] = CFSTR("PMOrder");
  v4[4] = &unk_25084A8B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)configForAutoSensorProperty
{
  void *v2;
  void *v3;
  int v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v5 = 1;
  v6[0] = CFSTR("Subclass");
  v6[1] = CFSTR("Selector");
  v7[0] = CFSTR("ASDTRawProperty");
  v7[1] = &unk_25084A8D0;
  v7[2] = 0x25084A828;
  v6[2] = CFSTR("Scope");
  v6[3] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  objc_super v4;

  if (!*((_DWORD *)self->_sensor.__ptr_.__value_ + 2))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)ASDTExclavesSensorPMEnabler;
  return -[ASDTPMEnabler asdtHandlesPowerTransition:](&v4, sel_asdtHandlesPowerTransition_, *(_QWORD *)&a3);
}

- (int)enable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char v7;
  Sensor *value;
  int v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  const char *v14;
  void *v16;
  int v17;
  const char *v18;
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  _BYTE v24[14];
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)self->_sensor.__ptr_.__value_ + 2))
    return 0;
  v3 = a3;
  v20 = 0;
  v19 = 4;
  -[ASDTPMDevice parentSequencer](self, "parentSequencer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:", "SxEatpni", 0, 0, &v19, &v20, 0);

  if ((v7 & 1) != 0)
  {
    if (!(_DWORD)v20)
    {
      if (ASDT::Exclaves::Sensor::GetStatus((uint64_t)self->_sensor.__ptr_.__value_, (int *)&v20 + 1))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ASDTExclavesSensorPMEnabler enable:].cold.1(self);
      }
      else
      {
        v10 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          return v10;
        -[ASDTPMDevice name](self, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = HIDWORD(v20);
        v18 = ASDT::Exclaves::Sensor::StatusString(SHIDWORD(v20));
        *(_DWORD *)buf = 138412802;
        v22 = v16;
        v23 = 1024;
        *(_DWORD *)v24 = v17;
        *(_WORD *)&v24[4] = 2080;
        *(_QWORD *)&v24[6] = v18;
        _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: current status: [%u] %s", buf, 0x1Cu);

      }
      return 0;
    }
  }
  else
  {
    LODWORD(v20) = 1;
  }
  value = self->_sensor.__ptr_.__value_;
  if (v3)
    v9 = ASDT::Exclaves::Sensor::Start((uint64_t)value, (int *)&v20 + 1);
  else
    v9 = ASDT::Exclaves::Sensor::Stop((uint64_t)value, (int *)&v20 + 1);
  v10 = v9;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return v10;
    -[ASDTPMDevice name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HIDWORD(v20);
    v13 = ASDT::Exclaves::Sensor::StatusString(SHIDWORD(v20));
    v14 = "stop";
    *(_DWORD *)buf = 138413058;
    v22 = v11;
    v23 = 2080;
    if (v3)
      v14 = "start";
    *(_QWORD *)v24 = v14;
    *(_WORD *)&v24[8] = 1024;
    *(_DWORD *)&v24[10] = v12;
    v25 = 2080;
    v26 = v13;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: %s : resulting status: [%u] %s", buf, 0x26u);

    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTExclavesSensorPMEnabler enable:].cold.2(self, v3);
  return v10;
}

- (NSDictionary)status
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v9 = 0;
  if (ASDT::Exclaves::Sensor::GetStatus((uint64_t)self->_sensor.__ptr_.__value_, (int *)&v9))
    return (NSDictionary *)0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%u] %s"), v9, ASDT::Exclaves::Sensor::StatusString(v9));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return (NSDictionary *)0;
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  -[ASDTPMDevice name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (void).cxx_destruct
{
  Sensor *value;

  value = self->_sensor.__ptr_.__value_;
  self->_sensor.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Sensor *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (void)initWithConfig:(uint64_t)a3 forSequencer:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: The name of this object must be specified.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithConfig:(uint64_t)a3 forSequencer:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Failed to create sensor.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)initWithConfig:(uint64_t)a3 forSequencer:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "%@: Exclaves sensor creation fails unexpectedly.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_5();
}

- (void)enable:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v1;
  OUTLINED_FUNCTION_0_3(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Failed to get sensor status", (uint8_t *)&v3);

  OUTLINED_FUNCTION_0_1();
}

- (void)enable:(void *)a1 .cold.2(void *a1, char a2)
{
  uint64_t v3;
  void *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = "stop";
  if ((a2 & 1) != 0)
    v5 = "start";
  v6 = 138412546;
  v7 = v3;
  v8 = 2080;
  v9 = v5;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to %s sensor", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

@end
