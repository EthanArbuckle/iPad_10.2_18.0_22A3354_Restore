@implementation VCMediaStreamConfigRemoteDeviceInfo

- (VCMediaStreamConfigRemoteDeviceInfo)init
{
  VCMediaStreamConfigRemoteDeviceInfo *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCMediaStreamConfigRemoteDeviceInfo *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaStreamConfigRemoteDeviceInfo;
  v2 = -[VCMediaStreamConfigRemoteDeviceInfo init](&v12, sel_init);
  if (v2)
  {
    if ((VCMediaStreamConfigRemoteDeviceInfo *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v14 = v4;
          v15 = 2080;
          v16 = "-[VCMediaStreamConfigRemoteDeviceInfo init]";
          v17 = 1024;
          v18 = 109;
          v6 = " [%s] %s:%d ";
          v7 = v5;
          v8 = 28;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCMediaStreamConfigRemoteDeviceInfo performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCMediaStreamConfigRemoteDeviceInfo init]";
          v17 = 1024;
          v18 = 109;
          v19 = 2112;
          v20 = v3;
          v21 = 2048;
          v22 = v2;
          v6 = " [%s] %s:%d %@(%p) ";
          v7 = v10;
          v8 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCMediaStreamConfigRemoteDeviceInfo *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCMediaStreamConfigRemoteDeviceInfo *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCMediaStreamConfigRemoteDeviceInfo dealloc]";
        v16 = 1024;
        v17 = 115;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCMediaStreamConfigRemoteDeviceInfo performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCMediaStreamConfigRemoteDeviceInfo dealloc]";
        v16 = 1024;
        v17 = 115;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCMediaStreamConfigRemoteDeviceInfo;
  -[VCMediaStreamConfigRemoteDeviceInfo dealloc](&v11, sel_dealloc);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
