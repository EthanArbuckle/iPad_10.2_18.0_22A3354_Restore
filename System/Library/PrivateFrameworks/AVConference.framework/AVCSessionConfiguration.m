@implementation AVCSessionConfiguration

+ (id)stringFromSessionMode:(int64_t)a3
{
  const char *v3;

  if ((unint64_t)a3 > 3)
    v3 = "Unknown";
  else
    v3 = off_1E9E587D0[a3];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%ld)"), v3, a3);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  const char *v6;
  const char *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AVCSessionConfiguration;
  v4 = -[AVCSessionConfiguration description](&v9, sel_description);
  v5 = +[AVCSessionConfiguration stringFromSessionMode:](AVCSessionConfiguration, "stringFromSessionMode:", self->_sessionMode);
  v6 = "YES";
  if (self->_oneToOneModeEnabled)
    v7 = "YES";
  else
    v7 = "NO";
  if (!self->_outOfProcessCodecsEnabled)
    v6 = "NO";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ sessionMode=%@, oneToOneModeEnabled=%s, serviceName=%@, outOfProcessCodecsEnabled=%s, abTestConfiguration=%@ }"), v4, v5, v7, self->_serviceName, v6, self->_abTestConfiguration);
}

- (AVCSessionConfiguration)init
{
  AVCSessionConfiguration *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCSessionConfiguration;
  v2 = -[AVCSessionConfiguration init](&v4, sel_init);
  if (v2)
    v2->_abTestConfiguration = objc_alloc_init(AVCSessionABTestConfiguration);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[AVCSessionConfiguration cleanupNwActivity](self, "cleanupNwActivity");
  v3.receiver = self;
  v3.super_class = (Class)AVCSessionConfiguration;
  -[AVCSessionConfiguration dealloc](&v3, sel_dealloc);
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
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
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
          v9 = "-[AVCSessionConfiguration setSessionMode:]";
          v10 = 1024;
          v11 = 93;
          v12 = 1024;
          v13 = v3;
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid value for sessionMode=%d", (uint8_t *)&v6, 0x22u);
        }
      }
    }
    else
    {
      self->_sessionMode = 0;
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

- (void)setUpWithDictionary:(id)a3
{
  void *v5;

  -[AVCSessionConfiguration setSessionMode:](self, "setSessionMode:", +[AVCSessionConfiguration clientSessionModeWithSessionMode:](AVCSessionConfiguration, "clientSessionModeWithSessionMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionType")), "integerValue")));
  -[AVCSessionConfiguration setReportingHierarchyToken:](self, "setReportingHierarchyToken:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParentHierarchyToken")));
  self->_oneToOneModeEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionOneOnOneModeEnabled")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionConversationID")))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionConversationID")));
    -[AVCSessionConfiguration setConversationID:](self, "setConversationID:", v5);

  }
  -[AVCSessionConfiguration setConversationTimeBase:](self, "setConversationTimeBase:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionConversationTimeBase")));
  -[AVCSessionConfiguration setConversationTimeBaseTruncated:](self, "setConversationTimeBaseTruncated:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionConversationTimeBaseTruncated")));
  -[AVCSessionConfiguration setServiceName:](self, "setServiceName:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionServiceName")));
  -[AVCSessionConfiguration setOutOfProcessCodecsEnabled:](self, "setOutOfProcessCodecsEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionOutOfProcessCodecsEnabled")), "BOOLValue"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParentNWActivity")))
    -[AVCSessionConfiguration setParentNWActivity:](self, "setParentNWActivity:", -[AVCSessionConfiguration deserializeNwActivity:](self, "deserializeNwActivity:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParentNWActivity"))));
  -[AVCSessionConfiguration setAbTestConfiguration:](self, "setAbTestConfiguration:", +[AVCSessionABTestConfiguration createWithDictionary:](AVCSessionABTestConfiguration, "createWithDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionABTestsConfiguration"))));
}

- (id)dictionary
{
  id v3;
  void *v4;
  NSCopying *reportingHierarchyToken;
  NSUUID *conversationID;
  NSDate *conversationTimeBase;
  NSDate *conversationTimeBaseTruncated;
  NSString *serviceName;
  AVCSessionABTestConfiguration *abTestConfiguration;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  reportingHierarchyToken = self->_reportingHierarchyToken;
  if (reportingHierarchyToken)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", reportingHierarchyToken, CFSTR("vcSessionParentHierarchyToken"));
  conversationID = self->_conversationID;
  if (conversationID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSUUID UUIDString](conversationID, "UUIDString"), CFSTR("vcSessionConversationID"));
  conversationTimeBase = self->_conversationTimeBase;
  if (conversationTimeBase)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", conversationTimeBase, CFSTR("vcSessionConversationTimeBase"));
  conversationTimeBaseTruncated = self->_conversationTimeBaseTruncated;
  if (conversationTimeBaseTruncated)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", conversationTimeBaseTruncated, CFSTR("vcSessionConversationTimeBaseTruncated"));
  if (self->_parentNWActivity && nw_activity_is_activated())
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[AVCSessionConfiguration serializeNwActivity:](self, "serializeNwActivity:", self->_parentNWActivity), CFSTR("vcSessionParentNWActivity"));
  serviceName = self->_serviceName;
  if (serviceName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", serviceName, CFSTR("vcSessionServiceName"));
  abTestConfiguration = self->_abTestConfiguration;
  if (abTestConfiguration)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[AVCSessionABTestConfiguration dictionary](abTestConfiguration, "dictionary"), CFSTR("vcSessionABTestsConfiguration"));
  v12[0] = CFSTR("vcSessionType");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCSessionConfiguration sessionModeWithClientSessionMode:](AVCSessionConfiguration, "sessionModeWithClientSessionMode:", self->_sessionMode));
  v12[1] = CFSTR("vcSessionOneOnOneModeEnabled");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_oneToOneModeEnabled);
  v12[2] = CFSTR("vcSessionParameterParticipantScreenControlEnabled");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_remoteScreenControlEnabled);
  v12[3] = CFSTR("vcSessionOutOfProcessCodecsEnabled");
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_outOfProcessCodecsEnabled);
  objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4));
  return v4;
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

+ (int64_t)clientSessionModeWithSessionMode:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (int64_t)sessionModeWithClientSessionMode:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (id)serializeNwActivity:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const unsigned __int8 *bytes;
  _BYTE v8[37];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = nw_activity_copy_xpc_token();
  if (v3)
  {
    v4 = (void *)v3;
    if (MEMORY[0x1DF089754]() == MEMORY[0x1E0C813A0] && (bytes = xpc_uuid_get_bytes(v4)) != 0)
    {
      memset(v8, 0, sizeof(v8));
      uuid_unparse(bytes, v8);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v8, 4);
    }
    else
    {
      v5 = 0;
    }
    xpc_release(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)deserializeNwActivity:(id)a3
{
  void *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a3);
    v4 = v3;
    if (v3)
    {
      *(_QWORD *)uuid = 0;
      v9 = 0;
      objc_msgSend(v3, "getUUIDBytes:", uuid);
      v5 = xpc_uuid_create(uuid);
      v6 = (void *)nw_activity_create_from_xpc_token();
      xpc_release(v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)cleanupNwActivity
{
  OS_nw_activity *parentNWActivity;

  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSessionMode:", -[AVCSessionConfiguration sessionMode](self, "sessionMode"));
  objc_msgSend(v5, "setOneToOneModeEnabled:", -[AVCSessionConfiguration isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  objc_msgSend(v5, "setAbTestConfiguration:", -[AVCSessionConfiguration abTestConfiguration](self, "abTestConfiguration"));
  objc_msgSend(v5, "setRemoteScreenControlEnabled:", -[AVCSessionConfiguration isRemoteScreenControlEnabled](self, "isRemoteScreenControlEnabled"));
  objc_msgSend(v5, "setParentNWActivity:", -[AVCSessionConfiguration parentNWActivity](self, "parentNWActivity"));
  objc_msgSend(v5, "setOutOfProcessCodecsEnabled:", -[AVCSessionConfiguration outOfProcessCodecsEnabled](self, "outOfProcessCodecsEnabled"));
  v6 = (void *)-[NSCopying copyWithZone:](-[AVCSessionConfiguration reportingHierarchyToken](self, "reportingHierarchyToken"), "copyWithZone:", a3);
  objc_msgSend(v5, "setReportingHierarchyToken:", v6);

  v7 = (void *)-[NSUUID copyWithZone:](-[AVCSessionConfiguration conversationID](self, "conversationID"), "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationID:", v7);

  v8 = (void *)-[NSDate copyWithZone:](-[AVCSessionConfiguration conversationTimeBase](self, "conversationTimeBase"), "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationTimeBase:", v8);

  v9 = (void *)-[NSDate copyWithZone:](-[AVCSessionConfiguration conversationTimeBaseTruncated](self, "conversationTimeBaseTruncated"), "copyWithZone:", a3);
  objc_msgSend(v5, "setConversationTimeBaseTruncated:", v9);

  v10 = (void *)-[NSString copyWithZone:](-[AVCSessionConfiguration serviceName](self, "serviceName"), "copyWithZone:", a3);
  objc_msgSend(v5, "setServiceName:", v10);

  return v5;
}

- (NSCopying)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
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

- (BOOL)isRemoteScreenControlEnabled
{
  return self->_remoteScreenControlEnabled;
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  self->_remoteScreenControlEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (AVCSessionABTestConfiguration)abTestConfiguration
{
  return self->_abTestConfiguration;
}

- (void)setAbTestConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
