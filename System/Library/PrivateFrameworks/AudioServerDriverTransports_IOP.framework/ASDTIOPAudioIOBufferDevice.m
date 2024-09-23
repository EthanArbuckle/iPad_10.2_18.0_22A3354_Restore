@implementation ASDTIOPAudioIOBufferDevice

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
  ASDTIOPAudioIOBufferDevice *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[8];
  uint64_t v20;

  v4 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (ASDT::IOUserClient *)operator new();
  ASDT::IOUserClient::IOUserClient(v7);
  *(_QWORD *)v7 = &unk_250850980;
  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = (UserClient *)v7;
  if ((!value
     || ((*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value),
         (v7 = (ASDT::IOUserClient *)self->_userClient.__ptr_.__value_) != 0))
    && (ASDT::IOUserClient::IsValid(v7) & 1) != 0)
  {
    ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier((ASDT::IOPAudio::IOBuffer::UserClient *)self->_userClient.__ptr_.__value_, (CFTypeRef *)buf);
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
      v18.super_class = (Class)ASDTIOPAudioIOBufferDevice;
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
        -[ASDTIOPAudioIOBufferDevice initForIOObject:andIDValue:].cold.1(v16, (uint64_t)v10, buf);
      }
      v15 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioIOBufferDevice initForIOObject:andIDValue:].cold.2();
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
    -[ASDTIOPAudioIOBufferDevice open].cold.1();
  -[ASDTIOService idValue](self, "idValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientType");
  v5 = ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)value);

  if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTIOPAudioIOBufferDevice open].cold.2(self);
  return v5;
}

- (void)close
{
  __assert_rtn("-[ASDTIOPAudioIOBufferDevice close]", "ASDTIOPAudioIOBufferDevice.mm", 78, "_userClient");
}

- (char)mapIOBuffer
{
  UserClient *value;
  BufferDescriptor *p_descriptor;

  if (!self->_userClient.__ptr_.__value_)
    -[ASDTIOPAudioIOBufferDevice mapIOBuffer].cold.1();
  -[ASDTIOPAudioIOBufferDevice releaseIOBuffer](self, "releaseIOBuffer");
  value = self->_userClient.__ptr_.__value_;
  p_descriptor = &self->_descriptor;
  if (ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer((ASDT::IOPAudio::IOBuffer::UserClient *)value, p_descriptor))
    return p_descriptor->mBuffer;
  else
    return 0;
}

- (unsigned)ioBufferSize
{
  return self->_descriptor.mSizeBytes;
}

- (char)ioBuffer
{
  return self->_descriptor.mBuffer;
}

- (void)releaseIOBuffer
{
  __assert_rtn("-[ASDTIOPAudioIOBufferDevice releaseIOBuffer]", "ASDTIOPAudioIOBufferDevice.mm", 107, "_userClient");
}

- (void)setIoBufferSize:(unsigned int)a3
{
  self->_ioBufferSize = a3;
}

- (void)setIoBuffer:(char *)a3
{
  self->_ioBuffer = a3;
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
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

- (void)initForIOObject:(uint8_t *)buf andIDValue:.cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Mismatch identifier: %@", buf, 0x16u);

}

- (void)initForIOObject:andIDValue:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTIOPAudioIOBufferDevice: Failed to create IOBuffer user client", v0, 2u);
}

- (void)open
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "idValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to open connection to IOBuffer user client", (uint8_t *)&v2, 0xCu);

}

- (void)mapIOBuffer
{
  __assert_rtn("-[ASDTIOPAudioIOBufferDevice mapIOBuffer]", "ASDTIOPAudioIOBufferDevice.mm", 85, "_userClient");
}

@end
