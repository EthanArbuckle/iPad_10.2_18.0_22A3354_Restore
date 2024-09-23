@implementation VCVideoSourceTokenManager

uint64_t __48__VCVideoSourceTokenManager_deviceNameForToken___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned int *)(a1 + 48)));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)deviceNameForToken:(_VCVideoSourceToken)a3
{
  NSObject *tokenManagerQueue;
  void *v4;
  _QWORD v6[6];
  $948446A44E2BC96870B572155DF52E0B var0;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  tokenManagerQueue = self->_tokenManagerQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VCVideoSourceTokenManager_deviceNameForToken___block_invoke;
  v6[3] = &unk_1E9E54AC8;
  var0 = a3.var0.var0;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(tokenManagerQueue, v6);
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_29);
  return (id)sharedManager__tokenManager;
}

void __42__VCVideoSourceTokenManager_sharedManager__block_invoke()
{
  if (!sharedManager__tokenManager)
    sharedManager__tokenManager = objc_alloc_init(VCVideoSourceTokenManager);
}

- (VCVideoSourceTokenManager)init
{
  VCVideoSourceTokenManager *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoSourceTokenManager;
  v2 = -[VCVideoSourceTokenManager init](&v7, sel_init);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v9 = v3;
        v10 = 2080;
        v11 = "-[VCVideoSourceTokenManager init]";
        v12 = 1024;
        v13 = 48;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
      }
    }
    v2->_sourceNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_videoSourceTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    memset_pattern16(&v2->_identifierSeeds[1], &xmmword_1D910C080, 0x20uLL);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_tokenManagerQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoSourceTokenManager.tokenManagerQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_tokenManagerQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoSourceTokenManager;
  -[VCVideoSourceTokenManager dealloc](&v3, sel_dealloc);
}

- (_VCVideoSourceToken)createtokenForDeviceName:(id)a3 sourceType:(int)a4
{
  _VCVideoSourceToken v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _DWORD v32[7];

  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  if (!a3 || (a4 - 5) <= 0xFFFFFFFB)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = v10;
        v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        v27 = 1024;
        v28 = 75;
        v29 = 1024;
        v30 = a4;
        v31 = 2112;
        *(_QWORD *)v32 = a3;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d kVCVideoSourceTokenInvalid. type=%d, deviceName=%@", (uint8_t *)&v23, 0x2Cu);
      }
    }
    return (_VCVideoSourceToken)0;
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_videoSourceTokens, "objectForKeyedSubscript:", a3))
  {
    v7.var0.var0 = ($948446A44E2BC96870B572155DF52E0B)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoSourceTokens, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316162;
        v24 = v8;
        v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        v27 = 1024;
        v28 = 81;
        v29 = 1024;
        v30 = a4;
        v31 = 2112;
        *(_QWORD *)v32 = a3;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken was created before. type=%d, deviceName=%@", (uint8_t *)&v23, 0x2Cu);
      }
    }
    return v7;
  }
  v12 = self->_identifierSeeds[a4];
  v13 = v12 & 0xFFFFFF | (a4 << 24);
  if (v12 > 0xFFFFFE)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
    {
      v14 = 1;
    }
    else
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v14 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316418;
        v24 = v15;
        v25 = 2080;
        v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
        v27 = 1024;
        v28 = 92;
        v29 = 1024;
        v30 = 0xFFFFFF;
        v31 = 1024;
        v32[0] = a4;
        LOWORD(v32[1]) = 1024;
        *(_DWORD *)((char *)&v32[1] + 2) = 1;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reached VCVIDEOSOURCETOKEN_MAX_IDENTIFIER=0x%x, reset _identifierSeeds %d to %d", (uint8_t *)&v23, 0x2Eu);
      }
    }
  }
  else
  {
    v14 = v12 + 1;
  }
  self->_identifierSeeds[a4] = v14;
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sourceNames, "objectForKeyedSubscript:", v17)
    || -[NSMutableDictionary objectForKeyedSubscript:](self->_videoSourceTokens, "objectForKeyedSubscript:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v7.var0.var0 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v7;
      v23 = 136316162;
      v24 = v18;
      v25 = 2080;
      v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
      v27 = 1024;
      v28 = 99;
      v29 = 1024;
      v30 = v13;
      v31 = 2112;
      *(_QWORD *)v32 = a3;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sourceToken(0x%x) deviceName (%@) was in look up table _sourceNames. Either token is colliding ,or VCVideoSourceType is not correct", (uint8_t *)&v23, 0x2Cu);
    }
    return (_VCVideoSourceToken)0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceNames, "setObject:forKeyedSubscript:", a3, v17);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_videoSourceTokens, "setObject:forKeyedSubscript:", v17, a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136316418;
      v24 = v21;
      v25 = 2080;
      v26 = "-[VCVideoSourceTokenManager createtokenForDeviceName:sourceType:]";
      v27 = 1024;
      v28 = 106;
      v29 = 1024;
      v30 = v13;
      v31 = 1024;
      v32[0] = a4;
      LOWORD(v32[1]) = 2112;
      *(_QWORD *)((char *)&v32[1] + 2) = a3;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created sourceToken=0x%x, type=%d, deviceName=%@", (uint8_t *)&v23, 0x32u);
    }
  }
  return (_VCVideoSourceToken)v13;
}

- (_VCVideoSourceToken)tokenForDeviceName:(id)a3 sourceType:(int)a4
{
  NSObject *tokenManagerQueue;
  _VCVideoSourceToken v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2410000000;
  v12 = "";
  v13 = 0;
  tokenManagerQueue = self->_tokenManagerQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VCVideoSourceTokenManager_tokenForDeviceName_sourceType___block_invoke;
  v7[3] = &unk_1E9E54AA0;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v9;
  v8 = a4;
  dispatch_sync(tokenManagerQueue, v7);
  v5.var0.var0 = ($948446A44E2BC96870B572155DF52E0B)*((_DWORD *)v10 + 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __59__VCVideoSourceTokenManager_tokenForDeviceName_sourceType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 32);
  if (v2)
    result = objc_msgSend((id)objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "unsignedIntegerValue");
  else
    result = objc_msgSend(v3, "createtokenForDeviceName:sourceType:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = result;
  return result;
}

@end
