@implementation ASDTIOPAudioIsolatedIOBufferDevice

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
  ASDTIOPAudioIsolatedIOBufferDevice *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v25;
  uint8_t buf[8];
  uint64_t v27;

  v4 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (ASDT::IOUserClient *)operator new();
  ASDT::IOUserClient::IOUserClient(v7);
  *(_QWORD *)v7 = &unk_250850A50;
  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = (UserClient *)v7;
  if ((!value
     || ((*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value),
         (v7 = (ASDT::IOUserClient *)self->_userClient.__ptr_.__value_) != 0))
    && (ASDT::IOUserClient::IsValid(v7) & 1) != 0)
  {
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)self->_userClient.__ptr_.__value_, (CFTypeRef *)buf);
    v9 = *(id *)buf;
    v10 = v9;
    if (v9)
      CFRelease(v9);
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v25.receiver = self;
      v25.super_class = (Class)ASDTIOPAudioIsolatedIOBufferDevice;
      v13 = -[ASDTIOService initForIOObject:andIDValue:](&v25, sel_initForIOObject_andIDValue_, v4, v6);
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
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioIOBufferDevice initForIOObject:andIDValue:].cold.1(v23, (uint64_t)v10, buf);
      }
      v15 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioIsolatedIOBufferDevice initForIOObject:andIDValue:].cold.2((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);
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
    -[ASDTIOPAudioIsolatedIOBufferDevice open].cold.1();
  -[ASDTIOService idValue](self, "idValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientType");
  v5 = ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)value);

  if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioIsolatedIOBufferDevice open].cold.2(self);
  return v5;
}

- (void)close
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice close]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 70, "_userClient");
}

- (void)userClient
{
  return self->_userClient.__ptr_.__value_;
}

- (BOOL)setStreamDescription:(const AudioStreamBasicDescription *)a3 withBufferFrameSize:(unsigned int)a4
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:].cold.1();
  if (!a3)
    -[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:].cold.2();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3, a4);
}

- (BOOL)getStreamDescription:(AudioStreamBasicDescription *)a3
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:].cold.1();
  if (!a3)
    -[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:].cold.2();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3);
}

- (BOOL)setupIO
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice setupIO].cold.1();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value);
}

- (BOOL)teardownIO
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice teardownIO].cold.1();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value);
}

- (BOOL)setupClientIO:(unint64_t)a3 withBufferFrameSize:(unsigned int)a4
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice setupClientIO:withBufferFrameSize:].cold.1();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3, a4);
}

- (BOOL)teardownClientIO:(unint64_t)a3
{
  UserClient *value;

  value = self->_userClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioIsolatedIOBufferDevice teardownClientIO:].cold.1();
  return ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO((ASDT::IOPAudio::IsolatedIOBuffer::UserClient *)value, a3);
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

- (void)initForIOObject:(uint64_t)a3 andIDValue:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Failed to create IsolatedIOBuffer user client", a5, a6, a7, a8, 2u);
}

- (void)open
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to open connection to IsolatedIOBuffer user client", v3, v4, v5, v6, 2u);

}

- (void)setStreamDescription:withBufferFrameSize:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 83, "_userClient");
}

- (void)setStreamDescription:withBufferFrameSize:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice setStreamDescription:withBufferFrameSize:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 84, "inStreamDescription");
}

- (void)getStreamDescription:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 90, "_userClient");
}

- (void)getStreamDescription:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice getStreamDescription:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 91, "outStreamDescription");
}

- (void)setupIO
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice setupIO]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 97, "_userClient");
}

- (void)teardownIO
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice teardownIO]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 103, "_userClient");
}

- (void)setupClientIO:withBufferFrameSize:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice setupClientIO:withBufferFrameSize:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 109, "_userClient");
}

- (void)teardownClientIO:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioIsolatedIOBufferDevice teardownClientIO:]", "ASDTIOPAudioIsolatedIOBufferDevice.mm", 115, "_userClient");
}

@end
