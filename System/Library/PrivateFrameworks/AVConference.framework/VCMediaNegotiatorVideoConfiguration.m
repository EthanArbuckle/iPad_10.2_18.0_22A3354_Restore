@implementation VCMediaNegotiatorVideoConfiguration

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  -[VCMediaNegotiatorVideoConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualFeatureStrings:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v5, "addObjectsFromArray:", -[VCVideoRuleCollections supportedPayloads](self->_videoRuleCollections, "supportedPayloads"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads"));
      v7 = objc_msgSend(v6, "count");
      if (v7 == objc_msgSend(v5, "count"))
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v5);
              v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.5();
                }
                goto LABEL_29;
              }
              v13 = -[NSDictionary objectForKeyedSubscript:](self->_videoFeatureStrings, "objectForKeyedSubscript:", v12);
              if (!v13)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.2();
                }
                goto LABEL_29;
              }
              v14 = v13;
              v15 = objc_msgSend((id)objc_msgSend(a3, "videoFeatureStrings"), "objectForKeyedSubscript:", v12);
              if (!v15)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.3();
                }
                goto LABEL_29;
              }
              if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) == 0)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.4();
                }
                goto LABEL_29;
              }
            }
            v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
            if (v9)
              continue;
            break;
          }
        }
        v16 = 1;
        goto LABEL_30;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.6();
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.1();
      }
      v6 = 0;
    }
LABEL_29:
    v16 = 0;
LABEL_30:

    return v16;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  v5 = -[VCMediaNegotiatorCommonConfiguration isEqual:](&v7, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[VCVideoRuleCollections isEqual:](self->_videoRuleCollections, "isEqual:", objc_msgSend(a3, "videoRuleCollections"));
      if (v5)
        LOBYTE(v5) = -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:](self, "isEqualFeatureStrings:", a3);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCMediaNegotiatorVideoConfiguration *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  v5 = -[VCMediaNegotiatorCommonConfiguration copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[VCVideoRuleCollections copyWithZone:](self->_videoRuleCollections, "copyWithZone:", a3);
    objc_msgSend(v5, "setVideoRuleCollections:", v6);

    v7 = (void *)-[NSDictionary mutableCopyWithZone:](self->_videoFeatureStrings, "mutableCopyWithZone:", a3);
    objc_msgSend(v5, "setVideoFeatureStrings:", v7);

    v8 = (void *)-[NSDictionary mutableCopyWithZone:](self->_videoFeatureStringsFixedPosition, "mutableCopyWithZone:", a3);
    objc_msgSend(v5, "setVideoFeatureStringsFixedPosition:", v8);

  }
  else if ((VCMediaNegotiatorVideoConfiguration *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorVideoConfiguration copyWithZone:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCMediaNegotiatorVideoConfiguration performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCMediaNegotiatorVideoConfiguration copyWithZone:]";
        v18 = 1024;
        v19 = 82;
        v20 = 2112;
        v21 = v10;
        v22 = 2048;
        v23 = self;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to copy self", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDictionary)videoFeatureStrings
{
  return self->_videoFeatureStrings;
}

- (void)setVideoFeatureStrings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSDictionary)videoFeatureStringsFixedPosition
{
  return self->_videoFeatureStringsFixedPosition;
}

- (void)setVideoFeatureStringsFixedPosition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)isEqualFeatureStrings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate payload set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isEqualFeatureStrings:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_2_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Feature string not found for payload: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)isEqualFeatureStrings:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_2_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Compare feature string not found for payload: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)isEqualFeatureStrings:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_2_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Feature strings not identical for payload: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)isEqualFeatureStrings:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_2_4(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Missing payload: %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)isEqualFeatureStrings:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Payload cound is not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)copyWithZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to copy self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
