@implementation VCSessionConfiguration

- (VCSessionConfiguration)init
{
  VCSessionConfiguration *v2;
  VCSessionConfiguration *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionConfiguration;
  v2 = -[VCSessionConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sessionMode = 0;
    -[VCSessionConfiguration applyDefaultsConfigurationOverrides](v2, "applyDefaultsConfigurationOverrides");
  }
  return v3;
}

- (VCSessionConfiguration)initWithClientDictionary:(id)a3
{
  VCSessionConfiguration *v4;
  VCSessionConfiguration *v5;

  v4 = -[VCSessionConfiguration init](self, "init");
  v5 = v4;
  if (a3 && v4)
    -[VCSessionConfiguration applyConfigurationUsingClientDict:](v4, "applyConfigurationUsingClientDict:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[VCSessionConfiguration cleanupNwActivity](self, "cleanupNwActivity");
  v3.receiver = self;
  v3.super_class = (Class)VCSessionConfiguration;
  -[VCSessionConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setSessionMode:(int64_t)a3
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315906;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCSessionConfiguration setSessionMode:]";
        v10 = 1024;
        v11 = 79;
        v12 = 1024;
        v13 = v3;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid value for sessionMode=%d", (uint8_t *)&v6, 0x22u);
      }
    }
  }
  else
  {
    self->_sessionMode = a3;
  }
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (void)setParentNWActivity:(id)a3
{
  OS_nw_activity *parentNWActivity;

  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
  self->_parentNWActivity = (OS_nw_activity *)a3;
  if (a3)
    nw_retain(a3);
}

- (BOOL)updateWithClientDictionary:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCSessionConfiguration *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    return -[VCSessionConfiguration applyConfigurationUsingClientDict:](self, "applyConfigurationUsingClientDict:");
  if ((VCSessionConfiguration *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionConfiguration updateWithClientDictionary:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionConfiguration performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316162;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCSessionConfiguration updateWithClientDictionary:]";
        v12 = 1024;
        v13 = 102;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid client dictionary!", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  return 0;
}

- (BOOL)applyConfigurationUsingClientDict:(id)a3
{
  AVCSessionConfiguration *v5;
  AVCSessionABTestConfiguration *v6;
  BOOL v7;

  if (a3)
  {
    v5 = objc_alloc_init(AVCSessionConfiguration);
    -[AVCSessionConfiguration setUpWithDictionary:](v5, "setUpWithDictionary:", a3);
    -[VCSessionConfiguration setSessionMode:](self, "setSessionMode:", -[AVCSessionConfiguration sessionMode](v5, "sessionMode"));
    -[VCSessionConfiguration setReportingHierarchyToken:](self, "setReportingHierarchyToken:", -[AVCSessionConfiguration reportingHierarchyToken](v5, "reportingHierarchyToken"));
    -[VCSessionConfiguration setConversationID:](self, "setConversationID:", -[AVCSessionConfiguration conversationID](v5, "conversationID"));
    -[VCSessionConfiguration setConversationTimeBase:](self, "setConversationTimeBase:", -[AVCSessionConfiguration conversationTimeBase](v5, "conversationTimeBase"));
    -[VCSessionConfiguration setConversationTimeBaseTruncated:](self, "setConversationTimeBaseTruncated:", -[AVCSessionConfiguration conversationTimeBaseTruncated](v5, "conversationTimeBaseTruncated"));
    -[VCSessionConfiguration setParentNWActivity:](self, "setParentNWActivity:", -[AVCSessionConfiguration parentNWActivity](v5, "parentNWActivity"));
    -[VCSessionConfiguration setServiceName:](self, "setServiceName:", -[AVCSessionConfiguration serviceName](v5, "serviceName"));
    -[VCSessionConfiguration setOutOfProcessCodecsEnabled:](self, "setOutOfProcessCodecsEnabled:", -[AVCSessionConfiguration outOfProcessCodecsEnabled](v5, "outOfProcessCodecsEnabled"));
    v6 = -[AVCSessionConfiguration abTestConfiguration](v5, "abTestConfiguration");
    -[VCSessionConfiguration setOneToOneAuthenticationTagEnabled:](self, "setOneToOneAuthenticationTagEnabled:", -[AVCSessionABTestConfiguration isOneToOneAuthenticationTagEnabled](v6, "isOneToOneAuthenticationTagEnabled"));
    -[VCSessionConfiguration setGftTLEEnabled:](self, "setGftTLEEnabled:", -[AVCSessionABTestConfiguration isGftTLEEnabled](v6, "isGftTLEEnabled"));
    if (-[VCDefaults supportsOneToOneMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "supportsOneToOneMode"))
    {
      if (-[VCDefaults forceOneToOneMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceOneToOneMode"))
      {
        self->_oneToOneModeEnabled = 1;
      }
      else
      {
        self->_oneToOneModeEnabled = -[AVCSessionConfiguration isOneToOneModeEnabled](v5, "isOneToOneModeEnabled");
      }
    }
    else if (-[AVCSessionConfiguration isOneToOneModeEnabled](v5, "isOneToOneModeEnabled"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionConfiguration applyConfigurationUsingClientDict:].cold.1();
      }
      v7 = 0;
      goto LABEL_13;
    }
    -[VCSessionConfiguration applyDefaultsConfigurationOverrides](self, "applyDefaultsConfigurationOverrides");
    v7 = 1;
LABEL_13:

    return v7;
  }
  return 0;
}

- (void)cleanupNwActivity
{
  OS_nw_activity *parentNWActivity;

  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
}

- (void)applyDefaultsConfigurationOverrides
{
  self->_oneToOneAuthenticationTagEnabled = VCDefaults_GetBoolValueForKey(CFSTR("forceEnableOneToOneAuthenticationTag"), self->_oneToOneAuthenticationTagEnabled);
  self->_gftTLEEnabled = VCDefaults_GetBoolValueForKey(CFSTR("forceEnabledGFTTLE"), self->_gftTLEEnabled);
}

- (NSCopying)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

- (BOOL)isRemoteScreenControlEnabled
{
  return self->_remoteScreenControlEnabled;
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  self->_remoteScreenControlEnabled = a3;
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)conversationTimeBase
{
  return self->_conversationTimeBase;
}

- (void)setConversationTimeBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)conversationTimeBaseTruncated
{
  return self->_conversationTimeBaseTruncated;
}

- (void)setConversationTimeBaseTruncated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_nw_activity)parentNWActivity
{
  return self->_parentNWActivity;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (void)updateWithClientDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid client dictionary!", v2, v3, v4, v5, 2u);
}

- (void)applyConfigurationUsingClientDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Does not support oneToOne mode, but session configuration supports oneToOne Mode", v2, v3, v4, v5, 2u);
}

@end
