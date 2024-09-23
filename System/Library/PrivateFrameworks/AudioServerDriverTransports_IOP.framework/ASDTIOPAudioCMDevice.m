@implementation ASDTIOPAudioCMDevice

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForIOObject:andIDValue:", v4, v6);

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4;
  id v6;
  ASDT::IOUserClient *v7;
  UserClient *value;
  id v9;
  void *v10;
  void *v11;
  char v12;
  ASDT::IOUserClient **v13;
  ASDT::IOUserClient **v14;
  ASDTIOPAudioCMDevice *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[8];
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (ASDT::IOUserClient *)operator new();
  ASDT::IOUserClient::IOUserClient(v7);
  *(_QWORD *)v7 = &unk_250850AB8;
  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = (UserClient *)v7;
  if ((!value
     || ((*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value),
         (v7 = (ASDT::IOUserClient *)self->_userClient.__ptr_.__value_) != 0))
    && (ASDT::IOUserClient::IsValid(v7) & 1) != 0)
  {
    ASDT::IOPAudio::ClientManager::UserClient::CopyIdentifier((ASDT::IOPAudio::ClientManager::UserClient *)self->_userClient.__ptr_.__value_, (CFTypeRef *)buf);
    v9 = *(id *)buf;
    v10 = v9;
    if (v9)
      CFRelease(v9);
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)ASDTIOPAudioCMDevice;
      v13 = -[ASDTIOService initForIOObject:andIDValue:](&v18, sel_initForIOObject_andIDValue_, v4, v6);
      v14 = v13;
      if (v13)
        ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(v13[3]);
      self = v14;
      v15 = self;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTIOService idValue](self, "idValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioVTDevice initForIOObject:andIDValue:].cold.1(v16, (uint64_t)v10, buf);
      }
      v15 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioCMDevice initForIOObject:andIDValue:].cold.2();
    v15 = 0;
  }

  return v15;
}

- (BOOL)open
{
  UserClient *value;
  void *v4;
  char v5;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice open].cold.1();
  -[ASDTIOService idValue](self, "idValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientType");
  v5 = ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)value);

  if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice open].cold.2(self);
  return v5;
}

- (void)close
{
  __assert_rtn("-[ASDTIOPAudioCMDevice close]", "ASDTIOPAudioCMDevice.mm", 70, "_userClient");
}

- (BOOL)enableInDirection:(unsigned int)a3
{
  UserClient *value;
  BOOL v5;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice enableInDirection:].cold.1();
  v5 = ASDT::IOPAudio::ClientManager::UserClient::Enable((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice enableInDirection:].cold.2(self);
  return v5;
}

- (BOOL)disableInDirection:(unsigned int)a3
{
  UserClient *value;
  BOOL v5;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice disableInDirection:].cold.1();
  v5 = ASDT::IOPAudio::ClientManager::UserClient::Disable((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice disableInDirection:].cold.2(self);
  return v5;
}

- (BOOL)getEnableState:(BOOL *)a3
{
  UserClient *value;
  BOOL EnableState;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice getEnableState:].cold.1();
  if (!a3)
    -[ASDTIOPAudioCMDevice getEnableState:].cold.2();
  EnableState = ASDT::IOPAudio::ClientManager::UserClient::GetEnableState((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!EnableState && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice getEnableState:].cold.3(self);
  return EnableState;
}

- (BOOL)getCurrentPowerState:(unsigned int *)a3
{
  UserClient *value;
  BOOL CurrentPowerState;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice getCurrentPowerState:].cold.1();
  if (!a3)
    -[ASDTIOPAudioCMDevice getCurrentPowerState:].cold.2();
  CurrentPowerState = ASDT::IOPAudio::ClientManager::UserClient::GetCurrentPowerState((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!CurrentPowerState && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice getCurrentPowerState:].cold.3(self);
  return CurrentPowerState;
}

- (BOOL)makePowerRequestForState:(unsigned int)a3 andDirection:(unsigned int)a4
{
  UserClient *value;
  __int16 v7;
  BOOL PowerRequest;
  _DWORD v10[2];

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioCMDevice makePowerRequestForState:andDirection:].cold.1();
  v7 = a3;
  v10[0] = a3;
  v10[1] = a4;
  PowerRequest = ASDT::IOPAudio::ClientManager::UserClient::MakePowerRequest((ASDT::IOUserClient *)value, v10);
  if (!PowerRequest && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioCMDevice makePowerRequestForState:andDirection:].cold.2(self, v7, a4);
  return PowerRequest;
}

- (BOOL)setNodeProperty:(unsigned int)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  UserClient *value;
  unsigned int v9;
  id v10;
  BOOL v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  value = self->_userClient.__ptr_.__value_;
  if (!value)
    __assert_rtn("-[ASDTIOPAudioCMDevice setNodeProperty:withValue:]", "ASDTIOPAudioCMDevice.mm", 145, "_userClient");
  v9 = objc_msgSend(v6, "length");
  v10 = objc_retainAutorelease(v7);
  v11 = ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty((ASDT::IOPAudio::ClientManager::UserClient *)value, a3, v9, (const void *)objc_msgSend(v10, "bytes"));
  if (!v11 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTIOService idValue](self, "idValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOPAudioCMDevice setNodeProperty:withValue:].cold.1(v12, (uint64_t)v14, a3);
  }

  return v11;
}

- (BOOL)getNodeProperty:(unsigned int)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  UserClient *value;
  id v9;
  BOOL NodeProperty;
  uint64_t v11;
  void *v12;
  unsigned int v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (!self->_userClient.__ptr_.__value_)
    __assert_rtn("-[ASDTIOPAudioCMDevice getNodeProperty:withValue:]", "ASDTIOPAudioCMDevice.mm", 158, "_userClient");
  v14 = objc_msgSend(v6, "length");
  value = self->_userClient.__ptr_.__value_;
  v9 = objc_retainAutorelease(v7);
  NodeProperty = ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty((ASDT::IOPAudio::ClientManager::UserClient *)value, a3, &v14, (void *)objc_msgSend(v9, "mutableBytes"));
  if (NodeProperty)
  {
    v11 = v14;
    if (objc_msgSend(v9, "length") != v11)
      objc_msgSend(v9, "setLength:", v14);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTIOService idValue](self, "idValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOPAudioCMDevice getNodeProperty:withValue:].cold.1(v12, (uint64_t)v15, a3);
  }

  return NodeProperty;
}

- (void).cxx_destruct
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)initForIOObject:andIDValue:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v0, "%@: Failed to create ClientManager user client", v1, v2, v3, v4, v5);
}

- (void)open
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to open connection to ClientManager user client", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)enableInDirection:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice enableInDirection:]", "ASDTIOPAudioCMDevice.mm", 77, "_userClient");
}

- (void)enableInDirection:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to enable.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)disableInDirection:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice disableInDirection:]", "ASDTIOPAudioCMDevice.mm", 89, "_userClient");
}

- (void)disableInDirection:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to disable.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)getEnableState:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice getEnableState:]", "ASDTIOPAudioCMDevice.mm", 101, "_userClient");
}

- (void)getEnableState:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice getEnableState:]", "ASDTIOPAudioCMDevice.mm", 102, "outEnabled");
}

- (void)getEnableState:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to retrieve the enable state", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)getCurrentPowerState:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice getCurrentPowerState:]", "ASDTIOPAudioCMDevice.mm", 114, "_userClient");
}

- (void)getCurrentPowerState:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice getCurrentPowerState:]", "ASDTIOPAudioCMDevice.mm", 115, "outState");
}

- (void)getCurrentPowerState:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to retrieve the power state", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)makePowerRequestForState:andDirection:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioCMDevice makePowerRequestForState:andDirection:]", "ASDTIOPAudioCMDevice.mm", 127, "_userClient");
}

- (void)makePowerRequestForState:(int)a3 andDirection:.cold.2(void *a1, __int16 a2, int a3)
{
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint8_t v11[12];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "idValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v9 = HIBYTE(a2);
  if (HIBYTE(a2) - 32 >= 0x5F)
    v9 = v7;
  v12 = 1024;
  v13 = v6;
  v10 = a2;
  v14 = 1024;
  v15 = v8;
  v16 = 1024;
  v17 = v9;
  v18 = 1024;
  if (a2 - 32 >= 0x5F)
    v10 = v7;
  v19 = v10;
  v20 = 1024;
  v21 = a3;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to make power request to state '%c%c%c%c' with direction %x", v11, 0x2Au);

}

- (void)setNodeProperty:(int)a3 withValue:.cold.1(void *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_236D88000, MEMORY[0x24BDACB70], v4, "%@: Set node property '%x'", v5);

  OUTLINED_FUNCTION_1();
}

- (void)getNodeProperty:(int)a3 withValue:.cold.1(void *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5(&dword_236D88000, MEMORY[0x24BDACB70], v4, "%@: Get node property '%x'", v5);

  OUTLINED_FUNCTION_1();
}

@end
