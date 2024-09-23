@implementation VCVideoHardwareDumpWriter

+ (id)sharedInstance
{
  if (sharedInstance_token != -1)
    dispatch_once(&sharedInstance_token, &__block_literal_global_3);
  return (id)sharedInstance__vcVideoHardwareDumpWriterSingleton;
}

void __43__VCVideoHardwareDumpWriter_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcVideoHardwareDumpWriterSingleton)
    sharedInstance__vcVideoHardwareDumpWriterSingleton = objc_alloc_init(VCVideoHardwareDumpWriter);
}

- (VCVideoHardwareDumpWriter)init
{
  VCVideoHardwareDumpWriter *v2;
  CFMutableSetRef Mutable;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoHardwareDumpWriter;
  v2 = -[VCVideoHardwareDumpWriter init](&v5, sel_init);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpWriter init].cold.1();
    }
    goto LABEL_12;
  }
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  v2->_sources = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoHardwareDumpWriter init].cold.2();
    }
    goto LABEL_12;
  }
  if (!VCVideoHardwareDumpWriter_OpenDumpFile((uint64_t)v2))
  {
LABEL_12:

    return 0;
  }
  v2->_registrationLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFSet *sources;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sources = self->_sources;
  if (sources)
    CFRelease(sources);
  VCVideoHardwareDumpWriter_CloseDumpFile((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v10.receiver = self;
  v10.super_class = (Class)VCVideoHardwareDumpWriter;
  -[VCVideoHardwareDumpWriter dealloc](&v10, sel_dealloc);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate writer set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
