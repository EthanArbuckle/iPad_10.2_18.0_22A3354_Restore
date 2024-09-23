@implementation VCImageAttributeRules

- (VCImageAttributeRules)init
{
  VCImageAttributeRules *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCImageAttributeRules;
  v2 = -[VCImageAttributeRules init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v3, CFSTR("send"), v4, CFSTR("recv"), 0);
    v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("send"), v6, CFSTR("recv"), 0);
    v2->_imageAttributeRules = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v7, CFSTR("wifiRules"), v8, CFSTR("cellRules"), 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCImageAttributeRules;
  -[VCImageAttributeRules dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)-[NSMutableDictionary description](-[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules"), "description");
}

- (void)addRuleForVideoPayload:(int)a3 withDirection:(int)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 priority:(int)a8 interface:(int)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  if (a5 && (v9 = *(_QWORD *)&a6, a6) && (v10 = *(_QWORD *)&a7, a7) && a9)
  {
    v11 = *(_QWORD *)&a8;
    v12 = *(_QWORD *)&a4;
    v13 = *(_QWORD *)&a3;
    v21[0] = CFSTR("width");
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a5);
    v21[1] = CFSTR("height");
    v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v21[2] = CFSTR("frameRate");
    v22[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v21[3] = CFSTR("priority");
    v22[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v19 = 0xAAAAAAAAAAAAAAAALL;
    v20 = 0xAAAAAAAAAAAAAAAALL;
    -[VCImageAttributeRules interfaceKey:forInterface:directionKey:forDirection:](self, "interfaceKey:forInterface:directionKey:forDirection:", &v20, a9, &v19, v12);
    v16 = -[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules");
    v17 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v20);
    v18 = (void *)objc_msgSend(v17, "objectForKey:", v19);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:].cold.1();
  }
}

- (id)extractDimensionsForInterface:(int)a3 direction:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v19 = 0xAAAAAAAAAAAAAAAALL;
    v20 = 0xAAAAAAAAAAAAAAAALL;
    -[VCImageAttributeRules interfaceKey:forInterface:directionKey:forDirection:](self, "interfaceKey:forInterface:directionKey:forDirection:", &v20, *(_QWORD *)&a3, &v19, *(_QWORD *)&a4);
    v7 = -[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules");
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v20);
    v9 = (void *)objc_msgSend(v8, "objectForKey:", v19);
    v10 = objc_msgSend(v9, "count");
    if (a3 == 1 && !v10)
    {
      LODWORD(v18) = 1;
      -[VCImageAttributeRules addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:](self, "addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:", 123, v4, 320, 240, 15, 0, v18);
      v11 = -[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules");
      v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v20);
      v9 = (void *)objc_msgSend(v12, "objectForKey:", v19);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v9)
          v15 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
        else
          v15 = "<nil>";
        if (-[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules"))
          v16 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](-[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules"), "description"), "UTF8String");
        else
          v16 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v22 = v13;
        v23 = 2080;
        v24 = "-[VCImageAttributeRules extractDimensionsForInterface:direction:]";
        v25 = 1024;
        v26 = 107;
        v27 = 1024;
        v28 = a3;
        v29 = 1024;
        v30 = v4;
        v31 = 2080;
        v32 = v15;
        v33 = 2080;
        v34 = v16;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCImageAttributeRules: extract dimensions for interface %d direction %d: %s, from %s", buf, 0x3Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCImageAttributeRules extractDimensionsForInterface:direction:].cold.1();
    }
    return 0;
  }
  return v9;
}

- (void)swapSendAndReceiveRules
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  -[VCImageAttributeRules interfaceKey:forInterface:directionKey:forDirection:](self, "interfaceKey:forInterface:directionKey:forDirection:", v12, 2, 0, 0);
  -[VCImageAttributeRules interfaceKey:forInterface:directionKey:forDirection:](self, "interfaceKey:forInterface:directionKey:forDirection:", &v11, 1, 0, 0);
  v3 = -[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules");
  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v12[0]);
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("send"));
  v6 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recv"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("recv"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("send"));

  v7 = -[VCImageAttributeRules imageAttributeRules](self, "imageAttributeRules");
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v11);
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("send"));
  v10 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recv"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("recv"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("send"));

}

- (void)interfaceKey:(id *)a3 forInterface:(int)a4 directionKey:(id *)a5 forDirection:(int)a6
{
  __CFString *v6;
  __CFString *v7;

  if (a3)
  {
    v6 = CFSTR("wifiRules");
    if (a4 != 2)
      v6 = 0;
    if (a4 == 1)
      v6 = CFSTR("cellRules");
    *a3 = v6;
  }
  if (a5)
  {
    v7 = CFSTR("recv");
    if (a6 != 1)
      v7 = 0;
    if (!a6)
      v7 = CFSTR("send");
    *a5 = v7;
  }
}

- (NSMutableDictionary)imageAttributeRules
{
  return self->_imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)addRuleForVideoPayload:withDirection:width:height:frameRate:priority:interface:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCImageAttrbuteRules: %s received invalid arguments ", v2, v3, v4, v5, v6);
}

- (void)extractDimensionsForInterface:direction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCImageAttrbuteRules: %s received unknown wireless interface", v2, v3, v4, v5, v6);
}

@end
