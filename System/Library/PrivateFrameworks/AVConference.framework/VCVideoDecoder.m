@implementation VCVideoDecoder

- (VCVideoDecoder)initWithConfig:(tagVideoDecoderConfig *)a3
{
  VCVideoDecoder *v4;
  VCVideoDecoder *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t streamToken;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoDecoder;
  v4 = -[VCVideoDecoder init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_streamToken = a3->var0;
    v4->_clientCount = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        streamToken = v5->_streamToken;
        *(_DWORD *)buf = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCVideoDecoder initWithConfig:]";
        v17 = 1024;
        v18 = 36;
        v19 = 1024;
        v20 = streamToken;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%u", buf, 0x22u);
      }
    }
    if (a3->var5)
    {
      VideoDecoder_Create((uint64_t *)&v5->_videoPlayerHandle, (uint64_t)a3);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoDecoder initWithConfig:].cold.1(v9, v10);
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VideoDecoder_Destroy();
  v3.receiver = self;
  v3.super_class = (Class)VCVideoDecoder;
  -[VCVideoDecoder dealloc](&v3, sel_dealloc);
}

- (tagHANDLE)videoPlayerHandle
{
  return self->_videoPlayerHandle;
}

+ (id)streamTokenDecoderMap
{
  if (streamTokenDecoderMap_token != -1)
    dispatch_once(&streamTokenDecoderMap_token, &__block_literal_global_63);
  return (id)_streamTokenDecoderMap;
}

id __39__VCVideoDecoder_streamTokenDecoderMap__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _streamTokenDecoderMap = (uint64_t)result;
  return result;
}

+ (id)decoderForStreamToken:(int64_t)a3 withConfig:(tagVideoDecoderConfig *)a4
{
  id v6;
  uint64_t v7;
  VCVideoDecoder *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  VCVideoDecoder *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&_lock);
  v6 = +[VCVideoDecoder streamTokenDecoderMap](VCVideoDecoder, "streamTokenDecoderMap");
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (v7)
  {
    v8 = (VCVideoDecoder *)v7;
    ++*(_DWORD *)(v7 + 24);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "+[VCVideoDecoder decoderForStreamToken:withConfig:]";
        v18 = 1024;
        v19 = 71;
        v20 = 2048;
        v21 = v8;
        v22 = 1024;
        v23 = a3;
        v11 = " [%s] %s:%d VCVideoDecoder %p exists for streamToken=%u";
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else
  {
    v8 = -[VCVideoDecoder initWithConfig:]([VCVideoDecoder alloc], "initWithConfig:", a4);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v12;
        v16 = 2080;
        v17 = "+[VCVideoDecoder decoderForStreamToken:withConfig:]";
        v18 = 1024;
        v19 = 77;
        v20 = 2048;
        v21 = v8;
        v22 = 1024;
        v23 = a3;
        v11 = " [%s] %s:%d VCVideoDecoder %p created for streamToken=%u";
        goto LABEL_8;
      }
    }
  }
  pthread_mutex_unlock(&_lock);
  return v8;
}

+ (void)releaseVideoDecoderForStreamToken:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int ErrorLogLevelForModule;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&_lock);
  v4 = +[VCVideoDecoder streamTokenDecoderMap](VCVideoDecoder, "streamTokenDecoderMap");
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (v5)
  {
    v6 = v5;
    v7 = *(_DWORD *)(v5 + 24);
    v8 = __OFSUB__(v7--, 1);
    *(_DWORD *)(v5 + 24) = v7;
    if ((v7 < 0) ^ v8 | (v7 == 0))
    {
      objc_msgSend(v4, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136316162;
          v21 = v9;
          v22 = 2080;
          v23 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
          v24 = 1024;
          v25 = 91;
          v26 = 2048;
          v27 = v6;
          v28 = 1024;
          v29 = a3;
          v11 = " [%s] %s:%d VCVideoDecoder %p released for streamToken=%u";
          v12 = v10;
          v13 = 44;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, v13);
        }
      }
    }
    else
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_DWORD *)(v6 + 24);
          v20 = 136316418;
          v21 = v17;
          v22 = 2080;
          v23 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
          v24 = 1024;
          v25 = 93;
          v26 = 2048;
          v27 = v6;
          v28 = 1024;
          v29 = a3;
          v30 = 1024;
          v31 = v19;
          v11 = " [%s] %s:%d VCVideoDecoder %p streamToken=%u clientCount=%d";
          v12 = v18;
          v13 = 50;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCVideoDecoder releaseVideoDecoderForStreamToken:].cold.1(v14, a3, v15);
  }
  pthread_mutex_unlock(&_lock);
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCVideoDecoder initWithConfig:]";
  v6 = 1024;
  v7 = 38;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to init VCVideoDecoder with NULL frame callback", (uint8_t *)&v2, 0x1Cu);
}

+ (void)releaseVideoDecoderForStreamToken:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "+[VCVideoDecoder releaseVideoDecoderForStreamToken:]";
  v7 = 1024;
  v8 = 96;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCVideoDecoder cannot be found via streamToken=%u", (uint8_t *)&v3, 0x22u);
}

@end
