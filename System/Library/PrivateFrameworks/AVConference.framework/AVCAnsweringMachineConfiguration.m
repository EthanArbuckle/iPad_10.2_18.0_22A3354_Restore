@implementation AVCAnsweringMachineConfiguration

- (AVCAnsweringMachineConfiguration)init
{
  AVCAnsweringMachineConfiguration *v2;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)AVCAnsweringMachineConfiguration;
  v2 = -[AVCAnsweringMachineConfiguration init](&v6, sel_init);
  if (v2)
  {
    v2->_announcementAssetMilliSecondDelay = VCDefaults_GetIntValueForKey(CFSTR("answeringMachineAnnouncementAssetDelay"), 200);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCAnsweringMachineConfiguration init].cold.1(v4, v5);
  }
  return v2;
}

- (void)setAnnouncementAsset:(id)a3
{
  VCSandboxedURL *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (VCSandboxedURL *)objc_msgSend(a3, "copy");
  }
  else if (a3)
  {
    v5 = -[VCSandboxedURL initWithURL:accessType:]([VCSandboxedURL alloc], "initWithURL:accessType:", a3, 1);
  }
  else
  {
    v5 = 0;
  }
  self->_announcementAsset = v5;
}

- (NSURL)announcementAsset
{
  return &self->_announcementAsset->super;
}

- (int)clientPid
{
  return self->_clientPid;
}

+ (id)stringFromCallSource:(unsigned __int8)a3
{
  const char *v3;

  if (a3 > 5u)
    v3 = "Unknown";
  else
    v3 = off_1E9E559B0[(char)a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%hhu)"), v3, a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AVCAnsweringMachineConfiguration;
  v4 = -[AVCAnsweringMachineConfiguration description](&v10, sel_description);
  v5 = +[AVCAnsweringMachineConfiguration stringFromCallSource:](AVCAnsweringMachineConfiguration, "stringFromCallSource:", self->_source);
  v6 = "YES";
  if (self->_isMessageRecordingEnabled)
    v7 = "YES";
  else
    v7 = "NO";
  if (self->_isMessageCaptioningEnabled)
    v8 = "YES";
  else
    v8 = "NO";
  if (!self->_isMessagePlaybackEnabled)
    v6 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ source=%@, isMessageRecordingEnabled=%s, isMessageCaptioningEnabled=%s isMessagePlaybackEnabled=%s, announcementAssetMilliSecondDelay=%u, clientPid=%d, announcementAsset=%@ }"), v4, v5, v7, v8, v6, self->_announcementAssetMilliSecondDelay, self->_clientPid, self->_announcementAsset);
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
  AVCAnsweringMachineConfiguration *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((AVCAnsweringMachineConfiguration *)objc_opt_class() == self)
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
        v15 = "-[AVCAnsweringMachineConfiguration dealloc]";
        v16 = 1024;
        v17 = 105;
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
      v3 = (const __CFString *)-[AVCAnsweringMachineConfiguration performSelector:](self, "performSelector:", sel_logPrefix);
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
        v15 = "-[AVCAnsweringMachineConfiguration dealloc]";
        v16 = 1024;
        v17 = 105;
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
  v11.super_class = (Class)AVCAnsweringMachineConfiguration;
  -[AVCAnsweringMachineConfiguration dealloc](&v11, sel_dealloc);
}

- (id)dictionary
{
  void *v3;
  VCSandboxedURL *announcementAsset;
  uint64_t *p_announcementAsset;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  VCSandboxedURL *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  AVCAnsweringMachineConfiguration *v23;
  __int16 v24;
  VCSandboxedURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_source), CFSTR("vcAnsweringMachineCallSource"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMessageRecordingEnabled), CFSTR("vcAnsweringMachineRecordingEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMessageCaptioningEnabled), CFSTR("vcAnsweringMachineCaptioningEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMessagePlaybackEnabled), CFSTR("vcAnsweringMachinePlaybackEnabled"));
  p_announcementAsset = (uint64_t *)&self->_announcementAsset;
  announcementAsset = self->_announcementAsset;
  if (announcementAsset)
  {
    v6 = -[VCSandboxedURL serialize](announcementAsset, "serialize");
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("vcAnsweringMachineAnnouncementAssetURL"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_announcementAssetMilliSecondDelay), CFSTR("vcAnsweringMachineAnnouncementAssetDelay"));
    }
    else
    {
      if ((AVCAnsweringMachineConfiguration *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCAnsweringMachineConfiguration dictionary].cold.1(v8, p_announcementAsset, v9);
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[AVCAnsweringMachineConfiguration performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v13 = self->_announcementAsset;
            v14 = 136316418;
            v15 = v10;
            v16 = 2080;
            v17 = "-[AVCAnsweringMachineConfiguration dictionary]";
            v18 = 1024;
            v19 = 122;
            v20 = 2112;
            v21 = v7;
            v22 = 2048;
            v23 = self;
            v24 = 2112;
            v25 = v13;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to serialize announcementAsset=%@", (uint8_t *)&v14, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return v3;
}

- (AVCAnsweringMachineConfiguration)initWithClientDictionary:(id)a3 clientPid:(int)a4
{
  AVCAnsweringMachineConfiguration *v6;
  const char *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  char *__lasts;
  char *__str;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVCAnsweringMachineConfiguration;
  v6 = -[AVCAnsweringMachineConfiguration init](&v16, sel_init);
  if (v6)
  {
    v6->_source = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineCallSource")), "integerValue");
    v6->_isMessageRecordingEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineRecordingEnabled")), "BOOLValue");
    v6->_isMessageCaptioningEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineCaptioningEnabled")), "BOOLValue");
    v6->_isMessagePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachinePlaybackEnabled")), "BOOLValue");
    v6->_announcementAsset = (VCSandboxedURL *)(id)objc_msgSend(+[VCSandboxedURL deserialize:](VCSandboxedURL, "deserialize:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineAnnouncementAssetURL"))), "consumeToken");
    v6->_announcementAssetMilliSecondDelay = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineAnnouncementAssetDelay")), "unsignedLongValue");
    v6->_clientPid = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v7 = (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](v6, "description"), "UTF8String");
      v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "self=%s succeeded with clientDict=%s clientPid=%d", v7, v8, a4);
      if (__str)
      {
        __lasts = 0;
        v9 = strtok_r(__str, "\n", &__lasts);
        v10 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v18 = v11;
              v19 = 2080;
              v20 = "-[AVCAnsweringMachineConfiguration initWithClientDictionary:clientPid:]";
              v21 = 1024;
              v22 = 143;
              v23 = 2080;
              v24 = "";
              v25 = 2080;
              v26 = v9;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
        free(__str);
      }
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVCAnsweringMachineConfiguration *v5;
  id v6;

  v5 = objc_alloc_init(AVCAnsweringMachineConfiguration);
  -[AVCAnsweringMachineConfiguration setSource:](v5, "setSource:", -[AVCAnsweringMachineConfiguration source](self, "source"));
  -[AVCAnsweringMachineConfiguration setIsMessageRecordingEnabled:](v5, "setIsMessageRecordingEnabled:", -[AVCAnsweringMachineConfiguration isMessageRecordingEnabled](self, "isMessageRecordingEnabled"));
  -[AVCAnsweringMachineConfiguration setIsMessageCaptioningEnabled:](v5, "setIsMessageCaptioningEnabled:", -[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self, "isMessageCaptioningEnabled"));
  -[AVCAnsweringMachineConfiguration setIsMessagePlaybackEnabled:](v5, "setIsMessagePlaybackEnabled:", -[AVCAnsweringMachineConfiguration isMessagePlaybackEnabled](self, "isMessagePlaybackEnabled"));
  v6 = -[VCSandboxedURL copyWithZone:](self->_announcementAsset, "copyWithZone:", a3);
  -[AVCAnsweringMachineConfiguration setAnnouncementAsset:](v5, "setAnnouncementAsset:", v6);

  -[AVCAnsweringMachineConfiguration setAnnouncementAssetMilliSecondDelay:](v5, "setAnnouncementAssetMilliSecondDelay:", -[AVCAnsweringMachineConfiguration announcementAssetMilliSecondDelay](self, "announcementAssetMilliSecondDelay"));
  v5->_clientPid = -[AVCAnsweringMachineConfiguration clientPid](self, "clientPid");
  return v5;
}

- (BOOL)isMessagePlaybackEnabled
{
  return self->_isMessagePlaybackEnabled;
}

- (void)setIsMessagePlaybackEnabled:(BOOL)a3
{
  self->_isMessagePlaybackEnabled = a3;
}

- (BOOL)isMessageCaptioningEnabled
{
  return self->_isMessageCaptioningEnabled;
}

- (void)setIsMessageCaptioningEnabled:(BOOL)a3
{
  self->_isMessageCaptioningEnabled = a3;
}

- (BOOL)isMessageRecordingEnabled
{
  return self->_isMessageRecordingEnabled;
}

- (void)setIsMessageRecordingEnabled:(BOOL)a3
{
  self->_isMessageRecordingEnabled = a3;
}

- (unsigned)announcementAssetMilliSecondDelay
{
  return self->_announcementAssetMilliSecondDelay;
}

- (void)setAnnouncementAssetMilliSecondDelay:(unsigned int)a3
{
  self->_announcementAssetMilliSecondDelay = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned __int8)a3
{
  self->_source = a3;
}

- (void)init
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[AVCAnsweringMachineConfiguration init]";
  v6 = 1024;
  v7 = 40;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to super init", (uint8_t *)&v2, 0x1Cu);
}

- (void)dictionary
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[AVCAnsweringMachineConfiguration dictionary]";
  v8 = 1024;
  v9 = 122;
  v10 = 2112;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to serialize announcementAsset=%@", (uint8_t *)&v4, 0x26u);
}

@end
