@implementation ASDTIOPAudioVTDevice

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
  ASDT::IOPAudio::VoiceTrigger::UserClient *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  ASDT::IOUserClient **v13;
  ASDT::IOUserClient **v14;
  ASDTIOPAudioVTDevice *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  uint8_t buf[8];
  uint64_t v22;

  v4 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)operator new();
  ASDT::IOPAudio::VoiceTrigger::UserClient::UserClient(v7);
  v8 = *((_QWORD *)self + 3);
  *((_QWORD *)self + 3) = v7;
  if ((!v8
     || ((*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8),
         (v7 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3)) != 0))
    && (ASDT::IOUserClient::IsValid(v7) & 1) != 0)
  {
    ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier(*((ASDT::IOPAudio::VoiceTrigger::UserClient **)self + 3), (CFTypeRef *)buf);
    v9 = *(id *)buf;
    v10 = v9;
    if (v9)
      CFRelease(v9);
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v20.receiver = self;
      v20.super_class = (Class)ASDTIOPAudioVTDevice;
      v13 = -[ASDTIOService initForIOObject:andIDValue:](&v20, sel_initForIOObject_andIDValue_, v4, v6);
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
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioVTDevice initForIOObject:andIDValue:].cold.1(v18, (uint64_t)v10, buf);
      }
      v15 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioVTDevice initForIOObject:andIDValue:].cold.2((uint64_t)v6, v16, v17);
    v15 = 0;
  }

  return v15;
}

- (BOOL)open
{
  std::mutex *v3;
  unsigned int v4;
  BOOL v5;
  ASDT::IOUserClient *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if (!*((_QWORD *)self + 3))
    -[ASDTIOPAudioVTDevice open].cold.1();
  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  v4 = *((_DWORD *)self + 24) + 1;
  *((_DWORD *)self + 24) = v4;
  if (v4 > 1)
    goto LABEL_3;
  v6 = (ASDT::IOUserClient *)*((_QWORD *)self + 3);
  -[ASDTIOService idValue](self, "idValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientType");
  LOBYTE(v6) = ASDT::IOUserClient::OpenConnection(v6);

  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTIOService idValue](self, "idValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioVTDevice open].cold.3(v10, (uint64_t)v13, v11);
    }
    goto LABEL_11;
  }
  if ((ASDT::IOPAudio::VoiceTrigger::UserClient::Open(*((ASDT::IOPAudio::VoiceTrigger::UserClient **)self + 3)) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTIOService idValue](self, "idValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioVTDevice open].cold.2(v8, (uint64_t)v13, v9);
    }
    (*(void (**)(_QWORD))(**((_QWORD **)self + 3) + 32))(*((_QWORD *)self + 3));
LABEL_11:
    v5 = 0;
    *((_DWORD *)self + 24) = 0;
    goto LABEL_12;
  }
LABEL_3:
  v5 = 1;
LABEL_12:
  std::mutex::unlock(v3);
  return v5;
}

- (void)close
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Unbalanced open/close calls.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;
  objc_super v4;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (v3 && *((_DWORD *)self + 24))
    ASDT::IOPAudio::VoiceTrigger::UserClient::Close(v3);
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioVTDevice;
  -[ASDTIOService dealloc](&v4, sel_dealloc);
}

- (BOOL)getIsEnabled:(unsigned int *)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice getIsEnabled:].cold.1();
  if (!a3)
    -[ASDTIOPAudioVTDevice getIsEnabled:].cold.2();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled(v3, a3);
}

- (BOOL)setEnabled:(unsigned int)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice setEnabled:].cold.1();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled(v3, a3);
}

- (BOOL)getChannelMask:(unsigned int *)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice getChannelMask:].cold.1();
  if (!a3)
    -[ASDTIOPAudioVTDevice getChannelMask:].cold.2();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask(v3, a3);
}

- (BOOL)getModelCRC:(unsigned int *)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice getModelCRC:].cold.1();
  if (!a3)
    -[ASDTIOPAudioVTDevice getModelCRC:].cold.2();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC(v3, a3);
}

- (BOOL)getDebugEnabled:(unsigned int *)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice getDebugEnabled:].cold.1();
  if (!a3)
    -[ASDTIOPAudioVTDevice getDebugEnabled:].cold.2();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled(v3, a3);
}

- (BOOL)setDebugEnabled:(unsigned int)a3
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v3;

  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v3)
    -[ASDTIOPAudioVTDevice setDebugEnabled:].cold.1();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled(v3, a3);
}

- (NSDictionary)eventInfo
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v2;
  CFTypeRef v3;
  void *v4;
  void *v6;

  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v2)
    -[ASDTIOPAudioVTDevice eventInfo].cold.1();
  ASDT::IOPAudio::VoiceTrigger::UserClient::CopyEventInfo(v2, (CFTypeRef *)&v6);
  v3 = v6;
  v4 = (void *)v3;
  if (v3)
    CFRelease(v3);
  return (NSDictionary *)v4;
}

- (BOOL)isConfigured
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v2;

  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v2)
    -[ASDTIOPAudioVTDevice isConfigured].cold.1();
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured(v2);
}

- (id)getConfigurationInfo
{
  ASDT::IOPAudio::VoiceTrigger::UserClient *v2;
  void *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v2)
    -[ASDTIOPAudioVTDevice getConfigurationInfo].cold.1();
  ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo(v2, &cf);
  v3 = (void *)cf;
  if (cf)
  {
    v4 = (id)cf;
    if (cf)
      CFRelease(cf);
  }
  return v3;
}

- (BOOL)setConfigurationInfo:(id)a3
{
  id v4;
  void *v5;
  ASDT::IOPAudio::VoiceTrigger::UserClient *v6;
  id v7;
  char v8;
  CFTypeRef cf;

  v4 = a3;
  v5 = v4;
  v6 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((_QWORD *)self + 3);
  if (!v6)
    __assert_rtn("-[ASDTIOPAudioVTDevice setConfigurationInfo:]", "ASDTIOPAudioVTDevice.mm", 175, "_userClient");
  if (v4)
  {
    v7 = v4;
    CFRetain(v7);
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

    v8 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetConfigurationInfo(v6, (const applesauce::CF::DictionaryRef *)&cf);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setPhraseDetectEventBlock:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  v5 = *((_QWORD *)self + 3);
  if (!v5)
    __assert_rtn("-[ASDTIOPAudioVTDevice setPhraseDetectEventBlock:]", "ASDTIOPAudioVTDevice.mm", 184, "_userClient");
  v6 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetPhraseDetectEventBlock(v5, v4);

  return v6;
}

- (void).cxx_destruct
{
  uint64_t v3;

  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  v3 = *((_QWORD *)self + 3);
  *((_QWORD *)self + 3) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 850045863;
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

- (void)initForIOObject:(uint8_t *)buf andIDValue:.cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Mismatch identifier: %@", buf, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)initForIOObject:(uint64_t)a3 andIDValue:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Failed to create IOPAudioVT user client", (uint8_t *)&v3);
}

- (void)open
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], a3, "%@: Failed to open connection to IOPAudioVT user client", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)getIsEnabled:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getIsEnabled:]", "ASDTIOPAudioVTDevice.mm", 112, "_userClient");
}

- (void)getIsEnabled:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getIsEnabled:]", "ASDTIOPAudioVTDevice.mm", 113, "outEnabled");
}

- (void)setEnabled:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice setEnabled:]", "ASDTIOPAudioVTDevice.mm", 119, "_userClient");
}

- (void)getChannelMask:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getChannelMask:]", "ASDTIOPAudioVTDevice.mm", 125, "_userClient");
}

- (void)getChannelMask:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getChannelMask:]", "ASDTIOPAudioVTDevice.mm", 126, "outChannelMask");
}

- (void)getModelCRC:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getModelCRC:]", "ASDTIOPAudioVTDevice.mm", 132, "_userClient");
}

- (void)getModelCRC:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getModelCRC:]", "ASDTIOPAudioVTDevice.mm", 133, "outModelCRC");
}

- (void)getDebugEnabled:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getDebugEnabled:]", "ASDTIOPAudioVTDevice.mm", 139, "_userClient");
}

- (void)getDebugEnabled:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getDebugEnabled:]", "ASDTIOPAudioVTDevice.mm", 140, "outEnabled");
}

- (void)setDebugEnabled:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioVTDevice setDebugEnabled:]", "ASDTIOPAudioVTDevice.mm", 146, "_userClient");
}

- (void)eventInfo
{
  __assert_rtn("-[ASDTIOPAudioVTDevice eventInfo]", "ASDTIOPAudioVTDevice.mm", 152, "_userClient");
}

- (void)isConfigured
{
  __assert_rtn("-[ASDTIOPAudioVTDevice isConfigured]", "ASDTIOPAudioVTDevice.mm", 158, "_userClient");
}

- (void)getConfigurationInfo
{
  __assert_rtn("-[ASDTIOPAudioVTDevice getConfigurationInfo]", "ASDTIOPAudioVTDevice.mm", 164, "_userClient");
}

@end
