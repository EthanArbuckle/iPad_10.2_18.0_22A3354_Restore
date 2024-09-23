@implementation VCCameraTorchManager

- (VCCameraTorchManager)init
{
  VCCameraTorchManager *v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCCameraTorchManager;
  v2 = -[VCCameraTorchManager init](&v6, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0C8B1D8], "hasFlashlight"))
    {
      v2->_flashlight = (AVFlashlight *)objc_alloc_init(MEMORY[0x1E0C8B1D8]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCCameraTorchManager init]";
        v11 = 1024;
        v12 = 23;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVFlashlight is not available", buf, 0x1Cu);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCameraTorchManager;
  -[VCCameraTorchManager dealloc](&v3, sel_dealloc);
}

- (BOOL)openTorchDevice
{
  AVFlashlight *flashlight;
  char v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  flashlight = self->_flashlight;
  if (!flashlight)
    return 0;
  v7[0] = 0;
  v3 = -[AVFlashlight turnPowerOnWithError:](flashlight, "turnPowerOnWithError:", v7);
  if ((v3 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCameraTorchManager openTorchDevice].cold.1(v4, v7, v5);
  }
  return v3;
}

- (void)closeTorchDevice
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_flashlight)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCCameraTorchManager closeTorchDevice]";
        v9 = 1024;
        v10 = 51;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
      }
    }
    -[AVFlashlight turnPowerOff](self->_flashlight, "turnPowerOff");
  }
}

- (void)turnTorchOn
{
  -[VCCameraTorchManager turnTorch:](self, "turnTorch:", 1);
}

- (void)turnTorchOff
{
  -[VCCameraTorchManager turnTorch:](self, "turnTorch:", 0);
}

- (void)turnTorch:(BOOL)a3
{
  double v3;
  AVFlashlight *flashlight;
  float v5;
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  flashlight = self->_flashlight;
  if (flashlight)
  {
    v13 = 0;
    if (a3)
      v5 = 1.0;
    else
      v5 = 0.0;
    *(float *)&v3 = v5;
    v6 = -[AVFlashlight setFlashlightLevel:withError:](flashlight, "setFlashlightLevel:withError:", &v13, v3);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v10 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v15 = v8;
            v16 = 2080;
            v17 = "-[VCCameraTorchManager turnTorch:]";
            v18 = 1024;
            v19 = 70;
            v20 = 2048;
            v21 = v5;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[VCCameraTorchManager turnTorch:].cold.1(v8, v9, v5);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCCameraTorchManager turnTorch:]";
        v18 = 1024;
        v19 = 72;
        v20 = 2048;
        v21 = v5;
        v22 = 2112;
        v23 = v13;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f failed: %@", buf, 0x30u);
      }
    }
  }
}

- (void)openTorchDevice
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCCameraTorchManager openTorchDevice]";
  v8 = 1024;
  v9 = 41;
  v10 = 2112;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVFlashlight failed to turn on: %@", (uint8_t *)&v4, 0x26u);
}

- (void)turnTorch:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCCameraTorchManager turnTorch:]";
  v7 = 1024;
  v8 = 70;
  v9 = 2048;
  v10 = a3;
  _os_log_debug_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f", (uint8_t *)&v3, 0x26u);
}

@end
