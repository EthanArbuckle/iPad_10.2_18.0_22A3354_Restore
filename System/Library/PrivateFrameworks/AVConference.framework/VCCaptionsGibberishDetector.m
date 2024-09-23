@implementation VCCaptionsGibberishDetector

- (VCCaptionsGibberishDetector)initWithGibberishThreshold:(double)a3 windowLength:(unint64_t)a4
{
  VCCaptionsGibberishDetector *v6;
  VCCaptionsGibberishDetector *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCCaptionsGibberishDetector *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)VCCaptionsGibberishDetector;
  v6 = -[VCCaptionsGibberishDetector init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_gibberishThreshold = a3;
    v6->_windowLength = a4;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7->_gibberishStates = v8;
    if (v8)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7->_history = v9;
      if (v9)
        return v7;
      if ((VCCaptionsGibberishDetector *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:].cold.2();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCCaptionsGibberishDetector performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v16 = VRTraceErrorLogLevelToCSTR(),
            v14 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_24:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      v19 = v16;
      v20 = 2080;
      v21 = "-[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:]";
      v22 = 1024;
      v23 = 32;
      v24 = 2112;
      v25 = v12;
      v26 = 2048;
      v27 = v7;
      v15 = " [%s] %s:%d %@(%p) Failed to create history dictionary";
    }
    else
    {
      if ((VCCaptionsGibberishDetector *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:].cold.1();
        }
        goto LABEL_24;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCCaptionsGibberishDetector performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_24;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136316162;
      v19 = v13;
      v20 = 2080;
      v21 = "-[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:]";
      v22 = 1024;
      v23 = 30;
      v24 = 2112;
      v25 = v11;
      v26 = 2048;
      v27 = v7;
      v15 = " [%s] %s:%d %@(%p) Failed to create gibberish states dictionary";
    }
    _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x30u);
    goto LABEL_24;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsGibberishDetector;
  -[VCCaptionsGibberishDetector dealloc](&v3, sel_dealloc);
}

- (BOOL)gibberishStateForCaptionsToken:(int64_t)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_gibberishStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "BOOLValue");
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_gibberishStates, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_history, "removeAllObjects");
}

- (BOOL)processTranscript:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t j;
  double v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  _BOOL4 v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = -[VCCaptionsGibberishDetector gibberishStateForCaptionsToken:](self, "gibberishStateForCaptionsToken:", objc_msgSend(a3, "streamToken"));
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "streamToken"));
  v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", v5);
  if (!v27)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_history, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v5);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_history, "objectForKeyedSubscript:", v5, v27);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = (void *)objc_msgSend(a3, "segments");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v12, "confidence"))
          objc_msgSend(v6, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "confidence")), 0);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    }
    while (v9);
  }
  while (objc_msgSend(v6, "count") > self->_windowLength)
    objc_msgSend(v6, "removeLastObject");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    v16 = 0.0;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "doubleValue");
        v16 = v16 + v18;
      }
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v14);
  }
  else
  {
    v16 = 0.0;
  }
  v19 = objc_msgSend(v6, "count");
  if (v19 <= 1)
    v20 = 1;
  else
    v20 = v19;
  v21 = v16 / (double)v20 * 0.01;
  v22 = objc_msgSend(v6, "count");
  v24 = v21 < self->_gibberishThreshold && v22 >= self->_windowLength;
  if (v28)
    v25 = v29 ^ v24;
  else
    v25 = 1;
  if (v25 == 1)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_gibberishStates, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), v5);
  return v25;
}

- (void)initWithGibberishThreshold:windowLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create gibberish states dictionary", v2, v3, v4, v5, 2u);
}

- (void)initWithGibberishThreshold:windowLength:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create history dictionary", v2, v3, v4, v5, 2u);
}

@end
