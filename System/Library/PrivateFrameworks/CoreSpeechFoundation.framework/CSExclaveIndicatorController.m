@implementation CSExclaveIndicatorController

- (CSExclaveIndicatorController)init
{
  CSExclaveIndicatorController *v2;
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  CSExclaveIndicatorController *v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CSExclaveIndicatorController;
  v2 = -[CSExclaveIndicatorController init](&v11, sel_init);
  if (!v2)
    goto LABEL_14;
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSExclaveIndicatorController init]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating EIC Sensor?", buf, 0xCu);
  }
  v4 = exclaves_sensor_create();
  if (v4)
  {
    v5 = v4;
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSExclaveIndicatorController init]";
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Failed EIC sensor creation : %d", buf, 0x12u);
    }
    v7 = 0;
    goto LABEL_15;
  }
  exclaves_sensor_status();
  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSExclaveIndicatorController init]";
    v14 = 1024;
    v15 = 0;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s After Sensor Creation Sensor Status : %d", buf, 0x12u);
  }
  v2->_mem = malloc_type_calloc(1uLL, 0x10000uLL, 0xDB7DF4F0uLL);
  if (!exclaves_audio_buffer_create())
  {
LABEL_14:
    v7 = v2;
    goto LABEL_15;
  }
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSExclaveIndicatorController init]";
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed EIC audio buffer creation", buf, 0xCu);
  }
  free(v2->_mem);
  v7 = 0;
  v2->_mem = 0;
LABEL_15:

  return v7;
}

- (void)copyBufferWithSize:(unsigned int)a3
{
  int v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = exclaves_audio_buffer_copyout();
  if (!v4)
    return self->_mem;
  v5 = v4;
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSExclaveIndicatorController copyBufferWithSize:]";
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Failed EIC buffer copy : %d", (uint8_t *)&v8, 0x12u);
  }
  return 0;
}

- (void)sensorStart
{
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  exclaves_sensor_start();
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v4 = "-[CSExclaveIndicatorController sensorStart]";
    v5 = 1024;
    v6 = 0;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s After Sensor Start Sensor Status : %d", buf, 0x12u);
  }
}

- (void)sensorStop
{
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  exclaves_sensor_stop();
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v4 = "-[CSExclaveIndicatorController sensorStop]";
    v5 = 1024;
    v6 = 0;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s After Sensor Stop Sensor Status : %d", buf, 0x12u);
  }
}

- (void)dealloc
{
  void *mem;
  objc_super v4;

  -[CSExclaveIndicatorController sensorStop](self, "sensorStop");
  mem = self->_mem;
  if (mem)
  {
    free(mem);
    self->_mem = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSExclaveIndicatorController;
  -[CSExclaveIndicatorController dealloc](&v4, sel_dealloc);
}

@end
