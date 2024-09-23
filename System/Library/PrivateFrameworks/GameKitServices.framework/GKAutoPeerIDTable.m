@implementation GKAutoPeerIDTable

- (id)objectForKey:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  v3 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)GKAutoPeerIDTable;
  v5 = -[GKTable objectForKey:](&v11, sel_objectForKey_);
  if (v5)
  {
    v6 = v5;
    return v6;
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), v3);
  if (v7)
  {
    v8 = (void *)v7;
    v10.receiver = self;
    v10.super_class = (Class)GKAutoPeerIDTable;
    -[GKTable setObject:forKey:](&v10, sel_setObject_forKey_, v7, v3);
    v6 = v8;
    return v6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKAutoPeerIDTable objectForKey:].cold.1();
  }
  return CFSTR("0");
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[GKAutoPeerIDTable setObject:forKey:]";
      v12 = 1024;
      v13 = 631;
      v14 = 2112;
      v15 = a3;
      v16 = 1024;
      v17 = a4;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKAutoPeerIDTable setObject:[%@] forKey:[%d] ignored", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)objectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d GKAutoPeerIDTable: CANNOT CREATE NSSTRING?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
