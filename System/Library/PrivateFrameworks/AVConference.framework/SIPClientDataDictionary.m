@implementation SIPClientDataDictionary

- (SIPClientDataDictionary)init
{
  SIPClientDataDictionary *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)SIPClientDataDictionary;
  v2 = -[SIPClientDataDictionary init](&v4, sel_init);
  if (v2)
    v2->allCalls = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[SIPClientDataDictionary dealloc]";
      v10 = 1024;
      v11 = 25;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIPClientDataDictionary dealloc", buf, 0x1Cu);
    }
  }
  -[NSMutableDictionary removeAllObjects](self->allCalls, "removeAllObjects");

  v5.receiver = self;
  v5.super_class = (Class)SIPClientDataDictionary;
  -[SIPClientDataDictionary dealloc](&v5, sel_dealloc);
}

- (id)copyObjectForKey:(id)a3 p2pID:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  objc_sync_enter(self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v4);
  v8 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->allCalls, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", a3);

  v9 = v8;
  objc_sync_exit(self);
  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4 forP2PID:(unsigned int)a5
{
  uint64_t v5;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  objc_sync_enter(self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v5);
  v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->allCalls, "objectForKeyedSubscript:", v9);
  if (!v10)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->allCalls, "setObject:forKeyedSubscript:", v10, v9);

  }
  if (a3)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, a4);
  else
    objc_msgSend(v10, "removeObjectForKey:", a4);

  objc_sync_exit(self);
}

@end
