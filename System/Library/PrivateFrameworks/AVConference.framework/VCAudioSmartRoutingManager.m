@implementation VCAudioSmartRoutingManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance__sharedSmartRoutingManager;
}

void __44__VCAudioSmartRoutingManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  NSObject *v1;
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sharedInstance__sharedSmartRoutingManager = objc_alloc_init(VCAudioSmartRoutingManager);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v0 = VRTraceErrorLogLevelToCSTR();
    v1 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v2 = 136315906;
      v3 = v0;
      v4 = 2080;
      v5 = "+[VCAudioSmartRoutingManager sharedInstance]_block_invoke";
      v6 = 1024;
      v7 = 32;
      v8 = 2048;
      v9 = sharedInstance__sharedSmartRoutingManager;
      _os_log_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d creating manager=%p", (uint8_t *)&v2, 0x26u);
    }
  }
}

- (VCAudioSmartRoutingManager)init
{
  VCAudioSmartRoutingManager *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioSmartRoutingManager;
  v2 = -[VCObject init](&v4, sel_init);
  if (v2)
    v2->_optOutOfSmartRouting = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioSmartRoutingManager;
  -[VCObject dealloc](&v3, sel_dealloc);
}

+ (void)addClient:(id)a3
{
  -[VCAudioSmartRoutingManager addClient:](+[VCAudioSmartRoutingManager sharedInstance](VCAudioSmartRoutingManager, "sharedInstance"), "addClient:", a3);
}

+ (void)removeClient:(id)a3
{
  -[VCAudioSmartRoutingManager removeClient:](+[VCAudioSmartRoutingManager sharedInstance](VCAudioSmartRoutingManager, "sharedInstance"), "removeClient:", a3);
}

- (void)addClient:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _BYTE v29[24];
  __int128 v30;
  VCAudioSmartRoutingManager *v31;
  _BYTE v32[40];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VCObject lock](self, "lock");
  if (a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
    if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_optOutOfSmartRouting, "objectForKeyedSubscript:", v5))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_optOutOfSmartRouting, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "optOutOfSmartRouting")), v5);
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v9 = objc_msgSend(a3, "optOutOfSmartRouting");
        v10 = -[NSMutableDictionary count](self->_optOutOfSmartRouting, "count");
        *(_DWORD *)v29 = 136316674;
        *(_QWORD *)&v29[4] = v7;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 63;
        WORD2(v30) = 2048;
        *(_QWORD *)((char *)&v30 + 6) = a3;
        HIWORD(v30) = 2112;
        v31 = (VCAudioSmartRoutingManager *)v5;
        *(_WORD *)v32 = 1024;
        *(_DWORD *)&v32[2] = v9;
        *(_WORD *)&v32[6] = 2048;
        *(_QWORD *)&v32[8] = v10;
        v11 = " [%s] %s:%d client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v8;
        v13 = 64;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v16 = objc_msgSend(a3, "optOutOfSmartRouting");
        v17 = -[NSMutableDictionary count](self->_optOutOfSmartRouting, "count");
        *(_DWORD *)v29 = 136317186;
        *(_QWORD *)&v29[4] = v14;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 63;
        WORD2(v30) = 2112;
        *(_QWORD *)((char *)&v30 + 6) = v6;
        HIWORD(v30) = 2048;
        v31 = self;
        *(_WORD *)v32 = 2048;
        *(_QWORD *)&v32[2] = a3;
        *(_WORD *)&v32[10] = 2112;
        *(_QWORD *)&v32[12] = v5;
        *(_WORD *)&v32[20] = 1024;
        *(_DWORD *)&v32[22] = v16;
        *(_WORD *)&v32[26] = 2048;
        *(_QWORD *)&v32[28] = v17;
        v11 = " [%s] %s:%d %@(%p) client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v15;
        v13 = 84;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v29, v13);
LABEL_14:
      -[VCAudioSmartRoutingManager updateOptOutOfSmartRouting](self, "updateOptOutOfSmartRouting", *(_OWORD *)v29, *(_QWORD *)&v29[16], v30, v31, *(_OWORD *)v32, *(_OWORD *)&v32[16], *(_QWORD *)&v32[32]);
      goto LABEL_15;
    }
    if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 136315650;
          *(_QWORD *)&v29[4] = v20;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager addClient:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 61;
          v22 = " [%s] %s:%d ignoring already added client";
          v23 = v21;
          v24 = 28;
LABEL_36:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, v29, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 136316162;
          *(_QWORD *)&v29[4] = v27;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager addClient:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 61;
          WORD2(v30) = 2112;
          *(_QWORD *)((char *)&v30 + 6) = v19;
          HIWORD(v30) = 2048;
          v31 = self;
          v22 = " [%s] %s:%d %@(%p) ignoring already added client";
          v23 = v28;
          v24 = 48;
          goto LABEL_36;
        }
      }
    }
  }
  else if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSmartRoutingManager addClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v29 = 136316162;
        *(_QWORD *)&v29[4] = v25;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager addClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 59;
        WORD2(v30) = 2112;
        *(_QWORD *)((char *)&v30 + 6) = v18;
        HIWORD(v30) = 2048;
        v31 = self;
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", v29, 0x30u);
      }
    }
  }
LABEL_15:
  -[VCObject unlock](self, "unlock", *(_QWORD *)v29, *(_OWORD *)&v29[8], v30, v31);
}

- (void)removeClient:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _BYTE v29[24];
  __int128 v30;
  VCAudioSmartRoutingManager *v31;
  _BYTE v32[40];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VCObject lock](self, "lock");
  if (a3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_optOutOfSmartRouting, "objectForKeyedSubscript:", v5))
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_optOutOfSmartRouting, "setObject:forKeyedSubscript:", 0, v5);
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v9 = objc_msgSend(a3, "optOutOfSmartRouting");
        v10 = -[NSMutableDictionary count](self->_optOutOfSmartRouting, "count");
        *(_DWORD *)v29 = 136316674;
        *(_QWORD *)&v29[4] = v7;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 75;
        WORD2(v30) = 2048;
        *(_QWORD *)((char *)&v30 + 6) = a3;
        HIWORD(v30) = 2112;
        v31 = (VCAudioSmartRoutingManager *)v5;
        *(_WORD *)v32 = 1024;
        *(_DWORD *)&v32[2] = v9;
        *(_WORD *)&v32[6] = 2048;
        *(_QWORD *)&v32[8] = v10;
        v11 = " [%s] %s:%d client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v8;
        v13 = 64;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_14;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v16 = objc_msgSend(a3, "optOutOfSmartRouting");
        v17 = -[NSMutableDictionary count](self->_optOutOfSmartRouting, "count");
        *(_DWORD *)v29 = 136317186;
        *(_QWORD *)&v29[4] = v14;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 75;
        WORD2(v30) = 2112;
        *(_QWORD *)((char *)&v30 + 6) = v6;
        HIWORD(v30) = 2048;
        v31 = self;
        *(_WORD *)v32 = 2048;
        *(_QWORD *)&v32[2] = a3;
        *(_WORD *)&v32[10] = 2112;
        *(_QWORD *)&v32[12] = v5;
        *(_WORD *)&v32[20] = 1024;
        *(_DWORD *)&v32[22] = v16;
        *(_WORD *)&v32[26] = 2048;
        *(_QWORD *)&v32[28] = v17;
        v11 = " [%s] %s:%d %@(%p) client=%p clientHash=%@ optOutOfSmartRouting=%d clients=%ld";
        v12 = v15;
        v13 = 84;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v29, v13);
LABEL_14:
      -[VCAudioSmartRoutingManager updateOptOutOfSmartRouting](self, "updateOptOutOfSmartRouting", *(_OWORD *)v29, *(_QWORD *)&v29[16], v30, v31, *(_OWORD *)v32, *(_OWORD *)&v32[16], *(_QWORD *)&v32[32]);
      goto LABEL_15;
    }
    if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 136315650;
          *(_QWORD *)&v29[4] = v20;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager removeClient:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 73;
          v22 = " [%s] %s:%d ignoring client not added";
          v23 = v21;
          v24 = 28;
LABEL_36:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, v29, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v29 = 136316162;
          *(_QWORD *)&v29[4] = v27;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager removeClient:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 73;
          WORD2(v30) = 2112;
          *(_QWORD *)((char *)&v30 + 6) = v19;
          HIWORD(v30) = 2048;
          v31 = self;
          v22 = " [%s] %s:%d %@(%p) ignoring client not added";
          v23 = v28;
          v24 = 48;
          goto LABEL_36;
        }
      }
    }
  }
  else if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioSmartRoutingManager removeClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v29 = 136316162;
        *(_QWORD *)&v29[4] = v25;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCAudioSmartRoutingManager removeClient:]";
        *(_WORD *)&v29[22] = 1024;
        LODWORD(v30) = 71;
        WORD2(v30) = 2112;
        *(_QWORD *)((char *)&v30 + 6) = v18;
        HIWORD(v30) = 2048;
        v31 = self;
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", v29, 0x30u);
      }
    }
  }
LABEL_15:
  -[VCObject unlock](self, "unlock", *(_QWORD *)v29, *(_OWORD *)&v29[8], v30, v31);
}

- (void)updateOptOutOfSmartRouting
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char **v7;
  uint64_t v8;
  char *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  NSMutableDictionary *obj;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCAudioSmartRoutingManager *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v23 = 0;
  obj = self->_optOutOfSmartRouting;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (!v3)
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v5 = v3;
  v6 = *(_QWORD *)v40;
  v7 = &selRef_load;
  *(_QWORD *)&v4 = 136316162;
  v21 = v4;
  do
  {
    v8 = 0;
    v9 = v7[73];
    do
    {
      if (*(_QWORD *)v40 != v6)
        objc_enumerationMutation(obj);
      v10 = *(const __CFString **)(*((_QWORD *)&v39 + 1) + 8 * v8);
      v11 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_optOutOfSmartRouting, "objectForKeyedSubscript:", v10, v21), "BOOLValue");
      if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v25 = v18;
            v26 = 2080;
            v27 = "-[VCAudioSmartRoutingManager updateOptOutOfSmartRouting]";
            v28 = 1024;
            v29 = 88;
            v30 = 2112;
            v31 = v10;
            v32 = 1024;
            LODWORD(v33) = v11;
            v15 = v19;
            v16 = " [%s] %s:%d clientHash=%@ clientOptOut=%d";
            v17 = 44;
            goto LABEL_15;
          }
        }
      }
      else
      {
        v12 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v12 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", v9);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            v25 = v13;
            v26 = 2080;
            v27 = "-[VCAudioSmartRoutingManager updateOptOutOfSmartRouting]";
            v28 = 1024;
            v29 = 88;
            v30 = 2112;
            v31 = v12;
            v32 = 2048;
            v33 = self;
            v34 = 2112;
            v35 = v10;
            v36 = 1024;
            v37 = v11;
            v15 = v14;
            v16 = " [%s] %s:%d %@(%p) clientHash=%@ clientOptOut=%d";
            v17 = 64;
LABEL_15:
            _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
          }
        }
      }
      if (!v11)
        goto LABEL_20;
      ++v8;
    }
    while (v5 != v8);
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    v7 = &selRef_load;
  }
  while (v5);
  v20 = 1;
LABEL_21:
  -[VCAudioSmartRoutingManager applyAudioScoreForOptOutOfSmartRouting:error:](self, "applyAudioScoreForOptOutOfSmartRouting:error:", v20, &v23);
}

- (void)applyAudioScoreForOptOutOfSmartRouting:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioSmartRoutingManager *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if ((VCAudioSmartRoutingManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCAudioSmartRoutingManager applyAudioScoreForOptOutOfSmartRouting:error:]";
        v18 = 1024;
        v19 = 100;
        v20 = 1024;
        LODWORD(v21) = v4;
        v9 = " [%s] %s:%d optOutOfSmartRouting=%d";
        v10 = v8;
        v11 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioSmartRoutingManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316418;
        v15 = v12;
        v16 = 2080;
        v17 = "-[VCAudioSmartRoutingManager applyAudioScoreForOptOutOfSmartRouting:error:]";
        v18 = 1024;
        v19 = 100;
        v20 = 2112;
        v21 = v6;
        v22 = 2048;
        v23 = self;
        v24 = 1024;
        v25 = v4;
        v9 = " [%s] %s:%d %@(%p) optOutOfSmartRouting=%d";
        v10 = v13;
        v11 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (void)addClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, 2u);
}

- (void)removeClient:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, 2u);
}

@end
