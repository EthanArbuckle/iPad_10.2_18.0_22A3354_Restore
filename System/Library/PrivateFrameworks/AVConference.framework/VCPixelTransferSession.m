@implementation VCPixelTransferSession

- (VCPixelTransferSession)init
{
  VCPixelTransferSession *v2;
  VCPixelTransferSession *v3;
  OpaqueVTPixelTransferSession **p_pixelTransferSession;
  OSStatus v5;
  uint64_t v6;
  NSObject *v7;
  OpaqueVTPixelTransferSession *v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  OSStatus v18;
  __int16 v19;
  OpaqueVTPixelTransferSession *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCPixelTransferSession;
  v2 = -[VCPixelTransferSession init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    p_pixelTransferSession = &v2->_pixelTransferSession;
    v5 = VTPixelTransferSessionCreate(0, &v2->_pixelTransferSession);
    if (v5 || !*p_pixelTransferSession)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *p_pixelTransferSession;
          *(_DWORD *)buf = 136316162;
          v12 = v6;
          v13 = 2080;
          v14 = "-[VCPixelTransferSession init]";
          v15 = 1024;
          v16 = 26;
          v17 = 1024;
          v18 = v5;
          v19 = 2048;
          v20 = v9;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTPixelTransferSessionCreate failed %d (%p)", buf, 0x2Cu);
        }
      }

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
  CFRelease(self->_pixelTransferSession);
  v3.receiver = self;
  v3.super_class = (Class)VCPixelTransferSession;
  -[VCPixelTransferSession dealloc](&v3, sel_dealloc);
}

@end
